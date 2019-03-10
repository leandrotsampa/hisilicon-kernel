#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vfmw_ctrl.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetPrintLevel, %function
VfmwProc_SetPrintLevel:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC0
	ldr	w1, [x19]
	str	w1, [x0]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetPrintLevel, .-VfmwProc_SetPrintLevel
	.align	3
.LC0:
	.xword	g_PrintEnable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetScdPrint, %function
VfmwProc_SetScdPrint:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	VfmwProc_SetScdPrint, .-VfmwProc_SetScdPrint
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_OpenScdLowdly, %function
VfmwProc_OpenScdLowdly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	mov	w1, 1
	ldr	x2, .LC1
	lsl	x0, x0, 4
	ldr	x0, [x2, x0]
	str	w1, [x0, 48]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_OpenScdLowdly, .-VfmwProc_OpenScdLowdly
	.align	3
.LC1:
	.xword	s_SmIIS
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_CloseScdLowdly, %function
VfmwProc_CloseScdLowdly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x1, .LC2
	lsl	x0, x0, 4
	ldr	x0, [x1, x0]
	str	wzr, [x0, 48]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_CloseScdLowdly, .-VfmwProc_CloseScdLowdly
	.align	3
.LC2:
	.xword	s_SmIIS
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_EventReport
	.type	VCTRL_EventReport, %function
VCTRL_EventReport:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	mov	w22, w3
	bl	_mcount
	cmp	w19, 31
	bhi	.L17
	ldr	x4, .LC7
	ldr	x0, [x4, w19, sxtw 3]
	cbz	x0, .L18
	ldr	w3, [x0, 32]
	cbz	w3, .L10
	cmp	w3, 1
	bne	.L19
	ldr	x3, [x4, 576]
	cbz	x3, .L20
.L13:
	mov	x2, x21
	mov	w1, w20
	mov	w0, w19
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L19:
	ldr	x2, .LC14
	mov	w4, w22
	ldr	x1, .LC16
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
.L7:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L10:
	ldr	x3, [x4, 568]
	cbnz	x3, .L13
	ldr	x1, .LC11
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L7
	.p2align 3
.L17:
	ldr	x3, .LC4
	mov	w2, 981
	ldr	x1, .LC6
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L7
.L18:
	ldr	x3, .LC9
	mov	w2, 982
	ldr	x1, .LC6
	bl	dprint_vfmw
	mov	w0, -1
	b	.L7
.L20:
	ldr	x1, .LC13
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L7
	.size	VCTRL_EventReport, .-VCTRL_EventReport
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC6:
	.xword	.LC5
	.align	3
.LC7:
	.xword	.LANCHOR0
	.align	3
.LC9:
	.xword	.LC8
	.align	3
.LC11:
	.xword	.LC10
	.align	3
.LC13:
	.xword	.LC12
	.align	3
.LC14:
	.xword	.LANCHOR1
	.align	3
.LC16:
	.xword	.LC15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetTunnelLineNumber, %function
VfmwProc_SetTunnelLineNumber:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC17
	ldr	x1, .LC19
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTunnelLineNumber, .-VfmwProc_SetTunnelLineNumber
	.align	3
.LC17:
	.xword	g_TunnelLineNumber
	.align	3
.LC19:
	.xword	.LC18
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetTraceImgPeriod, %function
VfmwProc_SetTraceImgPeriod:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC20
	ldr	x1, .LC22
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceImgPeriod, .-VfmwProc_SetTraceImgPeriod
	.align	3
.LC20:
	.xword	g_TraceImgPeriod
	.align	3
.LC22:
	.xword	.LC21
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetTraceFramePeriod, %function
VfmwProc_SetTraceFramePeriod:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC23
	ldr	x1, .LC25
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceFramePeriod, .-VfmwProc_SetTraceFramePeriod
	.align	3
.LC23:
	.xword	g_TraceFramePeriod
	.align	3
.LC25:
	.xword	.LC24
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetTraceBSPeriod, %function
VfmwProc_SetTraceBSPeriod:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC26
	ldr	x1, .LC28
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceBSPeriod, .-VfmwProc_SetTraceBSPeriod
	.align	3
.LC26:
	.xword	g_TraceBsPeriod
	.align	3
.LC28:
	.xword	.LC27
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetTraceCtrl, %function
VfmwProc_SetTraceCtrl:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC29
	ldr	x1, .LC31
	mov	w2, w3
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetTraceCtrl, .-VfmwProc_SetTraceCtrl
	.align	3
.LC29:
	.xword	g_TraceCtrl
	.align	3
.LC31:
	.xword	.LC30
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestStopDec, %function
VfmwProc_TestStopDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC32
	ldr	x1, .LC34
	mov	w2, w3
	str	w3, [x4, 600]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStopDec, .-VfmwProc_TestStopDec
	.align	3
.LC32:
	.xword	.LANCHOR0
	.align	3
.LC34:
	.xword	.LC33
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestTimeSequence, %function
VfmwProc_TestTimeSequence:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x4, .LC35
	ldr	x1, .LC37
	mov	w2, w3
	str	w3, [x4, 604]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestTimeSequence, .-VfmwProc_TestTimeSequence
	.align	3
.LC35:
	.xword	.LANCHOR0
	.align	3
.LC37:
	.xword	.LC36
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveEL, %function
VfmwProc_SaveEL:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 31
	bhi	.L28
	ldr	x21, .LC38
	add	x20, x21, 608
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L33
	ldr	x1, .LC48
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, .LC39
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L28:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L33:
	ldr	x22, .LC39
	mov	x1, 50
	ldr	w0, [x21, 864]
	ldr	x3, .LC40
	mov	w4, w0
	ldr	x2, .LC42
	add	w0, w0, 1
	ldr	x5, [x22, 136]
	str	w0, [x21, 864]
	add	x0, x29, 56
	blr	x5
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 56
	blr	x3
	str	w19, [x21, 868]
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L31
	ldr	x1, .LC44
	mov	w3, w19
	add	x2, x29, 56
	mov	w0, 32
	bl	dprint_vfmw
	b	.L28
	.p2align 3
.L31:
	ldr	x1, .LC46
	add	x2, x29, 56
	mov	w0, 32
	bl	dprint_vfmw
	b	.L28
	.size	VfmwProc_SaveEL, .-VfmwProc_SaveEL
	.align	3
.LC38:
	.xword	.LANCHOR0
	.align	3
.LC39:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC40:
	.xword	.LANCHOR2
	.align	3
.LC42:
	.xword	.LC41
	.align	3
.LC44:
	.xword	.LC43
	.align	3
.LC46:
	.xword	.LC45
	.align	3
.LC48:
	.xword	.LC47
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetCurProcChan, %function
VfmwProc_SetCurProcChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	cmp	w3, 32
	bhi	.L37
	ldr	x4, .LC52
	mov	w2, w3
	ldr	x1, .LC54
	mov	w0, 32
	str	w3, [x4, 872]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L37:
	ldr	x1, .LC51
	mov	w2, w3
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetCurProcChan, .-VfmwProc_SetCurProcChan
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC52:
	.xword	.LANCHOR0
	.align	3
.LC54:
	.xword	.LC53
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSaveFileAfterReset, %function
VfmwProc_SetSaveFileAfterReset:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	cmp	w3, 1
	bls	.L41
	ldr	x1, .LC59
	mov	w2, w3
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L41:
	ldr	x4, .LC55
	mov	w2, w3
	ldr	x1, .LC57
	mov	w0, 32
	str	w3, [x4, 876]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSaveFileAfterReset, .-VfmwProc_SetSaveFileAfterReset
	.align	3
.LC55:
	.xword	.LANCHOR0
	.align	3
.LC57:
	.xword	.LC56
	.align	3
.LC59:
	.xword	.LC58
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetUSE_FF_APT_EN, %function
VfmwProc_SetUSE_FF_APT_EN:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	cmp	w3, 1
	bls	.L45
	ldr	x1, .LC64
	mov	w2, w3
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L45:
	ldr	x4, .LC60
	mov	w2, w3
	ldr	x1, .LC62
	mov	w0, 32
	str	w3, [x4]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetUSE_FF_APT_EN, .-VfmwProc_SetUSE_FF_APT_EN
	.align	3
.LC60:
	.xword	USE_FF_APT_EN
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC64:
	.xword	.LC63
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Isr_0
	.type	VCTRL_Isr_0, %function
VCTRL_Isr_0:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VDMDRV_IsrProcess
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Isr_0, .-VCTRL_Isr_0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Scd_Isr
	.type	VCTRL_Scd_Isr, %function
VCTRL_Scd_Isr:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	SM_SCDIntServeProc
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Scd_Isr, .-VCTRL_Scd_Isr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_MMU_ISR
	.type	VCTRL_MMU_ISR, %function
VCTRL_MMU_ISR:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VDMDRV_MMUIntServeProc
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_MMU_ISR, .-VCTRL_MMU_ISR
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveReorderMetadata, %function
VfmwProc_SaveReorderMetadata:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 31
	bhi	.L49
	ldr	x21, .LC65
	add	x20, x21, 880
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L54
	ldr	x1, .LC73
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, .LC66
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L49:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L54:
	ldr	x22, .LC66
	mov	w0, 24
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w5, [x21, 1136]
	mov	x2, x0
	ldr	x3, .LC67
	mov	x1, 50
	mov	w4, w5
	add	x0, x29, 72
	add	w5, w5, 1
	str	w5, [x21, 1136]
	blr	x23
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 72
	blr	x3
	str	w19, [x21, 1140]
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L52
	ldr	x1, .LC69
	mov	w3, w19
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L49
	.p2align 3
.L52:
	ldr	x1, .LC71
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L49
	.size	VfmwProc_SaveReorderMetadata, .-VfmwProc_SaveReorderMetadata
	.align	3
.LC65:
	.xword	.LANCHOR0
	.align	3
.LC66:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC67:
	.xword	.LANCHOR2
	.align	3
.LC69:
	.xword	.LC68
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC73:
	.xword	.LC72
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveMetadata, %function
VfmwProc_SaveMetadata:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 31
	bhi	.L55
	ldr	x21, .LC75
	add	x20, x21, 1144
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L60
	ldr	x1, .LC82
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, .LC76
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L55:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L60:
	ldr	x22, .LC76
	mov	w0, 23
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w5, [x21, 1400]
	mov	x2, x0
	ldr	x3, .LC77
	mov	x1, 50
	mov	w4, w5
	add	x0, x29, 72
	add	w5, w5, 1
	str	w5, [x21, 1400]
	blr	x23
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 72
	blr	x3
	str	w19, [x21, 1404]
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L58
	ldr	x1, .LC79
	mov	w3, w19
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L55
	.p2align 3
.L58:
	ldr	x1, .LC81
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L55
	.size	VfmwProc_SaveMetadata, .-VfmwProc_SaveMetadata
	.align	3
.LC75:
	.xword	.LANCHOR0
	.align	3
.LC76:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC77:
	.xword	.LANCHOR2
	.align	3
.LC79:
	.xword	.LC78
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC82:
	.xword	.LC72
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_Save1DYUV, %function
VfmwProc_Save1DYUV:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC84
	ldp	w21, w23, [x20]
	ldr	w24, [x20, 8]
	ldr	x1, [x19, 392]
	mov	w0, w21
	blr	x1
	mov	x20, x0
	cbz	x0, .L67
	mov	w0, 22
	ldr	x22, [x19, 136]
	bl	VFMW_GetString
	mov	x2, x0
	ldr	x3, .LC87
	mov	w4, w21
	mov	x1, 50
	add	x0, x29, 72
	blr	x22
	ldr	x3, [x19, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 72
	blr	x3
	mov	x21, x0
	cbz	x0, .L64
	ldr	x1, .LC88
	ldr	x5, [x1, 304]
	cbz	x5, .L65
	mov	w4, 1
	mov	w3, w24
	mov	w2, w23
	mov	x1, x20
	blr	x5
.L66:
	ldr	x1, [x19, 72]
	mov	x0, x21
	blr	x1
	ldr	x1, .LC92
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
.L63:
	ldr	x1, [x19, 312]
	mov	x0, x20
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L65:
	ldr	x1, .LC90
	mov	w2, 7597
	mov	w0, 0
	bl	dprint_vfmw
	b	.L66
	.p2align 3
.L67:
	ldr	x1, .LC86
	mov	w2, w21
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, [x19, 312]
	mov	x0, x20
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L64:
	ldr	x1, .LC94
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L63
	.size	VfmwProc_Save1DYUV, .-VfmwProc_Save1DYUV
	.align	3
.LC84:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC86:
	.xword	.LC85
	.align	3
.LC87:
	.xword	.LANCHOR2
	.align	3
.LC88:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC90:
	.xword	.LC89
	.align	3
.LC92:
	.xword	.LC91
	.align	3
.LC94:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveOneYUV, %function
VfmwProc_SaveOneYUV:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC95
	ldr	w21, [x20]
	ldr	x1, [x19, 392]
	mov	w0, w21
	blr	x1
	mov	x20, x0
	cbz	x0, .L72
	mov	w0, 21
	ldr	x22, [x19, 136]
	bl	VFMW_GetString
	mov	x2, x0
	ldr	x3, .LC97
	mov	w4, w21
	mov	x1, 50
	add	x0, x29, 56
	blr	x22
	ldr	x3, [x19, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 56
	blr	x3
	mov	x21, x0
	cbz	x0, .L71
	ldr	x3, [x19, 88]
	mov	x2, x0
	mov	w1, 3145728
	mov	x0, x20
	blr	x3
	ldr	x1, [x19, 72]
	mov	x0, x21
	blr	x1
	ldr	x1, .LC99
	add	x2, x29, 56
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, [x19, 312]
	mov	x0, x20
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L71:
	ldr	x1, .LC100
	add	x2, x29, 56
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, [x19, 312]
	mov	x0, x20
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L72:
	ldr	x1, .LC96
	mov	w2, w21
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, [x19, 312]
	mov	x0, x20
	blr	x1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 112
	ret
	.size	VfmwProc_SaveOneYUV, .-VfmwProc_SaveOneYUV
	.align	3
.LC95:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC96:
	.xword	.LC85
	.align	3
.LC97:
	.xword	.LANCHOR2
	.align	3
.LC99:
	.xword	.LC98
	.align	3
.LC100:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveSeg, %function
VfmwProc_SaveSeg:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 31
	bhi	.L73
	ldr	x21, .LC101
	add	x20, x21, 1408
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L78
	ldr	x1, .LC109
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, .LC102
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L73:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L78:
	ldr	x22, .LC102
	mov	w0, 19
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w5, [x21, 1664]
	mov	x2, x0
	ldr	x3, .LC103
	mov	x1, 50
	mov	w4, w5
	add	x0, x29, 72
	add	w5, w5, 1
	str	w5, [x21, 1664]
	blr	x23
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 72
	blr	x3
	str	w19, [x21, 1668]
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L76
	ldr	x1, .LC105
	mov	w3, w19
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L73
	.p2align 3
.L76:
	ldr	x1, .LC107
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L73
	.size	VfmwProc_SaveSeg, .-VfmwProc_SaveSeg
	.align	3
.LC101:
	.xword	.LANCHOR0
	.align	3
.LC102:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC103:
	.xword	.LANCHOR2
	.align	3
.LC105:
	.xword	.LC104
	.align	3
.LC107:
	.xword	.LC106
	.align	3
.LC109:
	.xword	.LC108
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_Savestream, %function
VfmwProc_Savestream:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	cmp	w19, 31
	bhi	.L79
	ldr	x21, .LC111
	add	x20, x21, 1672
	ldr	x0, [x20, w19, uxtw 3]
	cbz	x0, .L84
	ldr	x1, .LC119
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x1, .LC112
	ldr	x0, [x20, w19, uxtw 3]
	ldr	x1, [x1, 72]
	blr	x1
	str	xzr, [x20, w19, uxtw 3]
.L79:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L84:
	ldr	x22, .LC112
	mov	w0, 18
	ldr	x23, [x22, 136]
	bl	VFMW_GetString
	ldr	w5, [x21, 1928]
	mov	x2, x0
	ldr	x3, .LC113
	mov	x1, 50
	mov	w4, w5
	add	x0, x29, 72
	add	w5, w5, 1
	str	w5, [x21, 1928]
	blr	x23
	ldr	x3, [x22, 64]
	mov	w2, 0
	mov	w1, 66
	add	x0, x29, 72
	blr	x3
	str	w19, [x21, 1932]
	str	x0, [x20, w19, uxtw 3]
	cbz	x0, .L82
	ldr	x1, .LC115
	mov	w3, w19
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L79
	.p2align 3
.L82:
	ldr	x1, .LC117
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L79
	.size	VfmwProc_Savestream, .-VfmwProc_Savestream
	.align	3
.LC111:
	.xword	.LANCHOR0
	.align	3
.LC112:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC113:
	.xword	.LANCHOR2
	.align	3
.LC115:
	.xword	.LC114
	.align	3
.LC117:
	.xword	.LC116
	.align	3
.LC119:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SaveYUV, %function
VfmwProc_SaveYUV:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w20, [x19]
	cmp	w20, 31
	bhi	.L85
	ldr	x19, .LC121
	add	x21, x19, 1936
	ldr	x0, [x21, w20, uxtw 3]
	cbz	x0, .L96
	ldr	x1, .LC131
	mov	w0, 32
	add	x22, x19, 2200
	bl	dprint_vfmw
	ldr	x23, .LC122
	ldr	x0, [x21, w20, uxtw 3]
	ldr	x1, [x23, 72]
	blr	x1
	str	xzr, [x21, w20, uxtw 3]
	ldr	x1, .LC123
	mov	w2, -1
	ldr	w0, [x19, 2216]
	str	w2, [x1, 64]
	add	x1, x19, 2048
	stp	xzr, xzr, [x1, 184]
	stp	xzr, xzr, [x1, 200]
	str	xzr, [x19, 2264]
	str	xzr, [x19, 2272]
	str	wzr, [x19, 2280]
	cbnz	w0, .L97
.L85:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L97:
	ldr	x1, [x19, 2208]
	bl	MEM_ReleaseMemBlock
	ldr	w2, [x19, 2224]
	ldr	x1, [x19, 2208]
	ldr	w0, [x19, 2216]
	bl	MEM_DelMemRecord
	ldr	x3, [x23, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L96:
	ldr	x23, .LC122
	mov	w0, 20
	ldr	x22, [x23, 136]
	bl	VFMW_GetString
	ldr	w1, [x19, 2192]
	mov	x2, x0
	ldr	x24, .LC123
	add	x0, x29, 72
	mov	w4, w1
	add	w1, w1, 1
	mov	x3, x24
	str	w1, [x19, 2192]
	mov	x1, 100
	blr	x22
	ldr	x3, [x23, 64]
	mov	w2, 0
	mov	w1, 578
	add	x0, x29, 72
	blr	x3
	str	x0, [x21, w20, uxtw 3]
	cbz	x0, .L89
	add	x22, x19, 2200
	ldr	x3, [x23, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x22
	blr	x3
	mov	w1, 3
	mov	w0, 27
	str	w1, [x22, 28]
	bl	VFMW_GetString
	mov	w4, 0
	mov	x3, x22
	mov	w2, 28311552
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbz	w0, .L90
	ldr	x1, .LC125
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, [x21, w20, uxtw 3]
	ldr	x1, [x23, 72]
	blr	x1
	str	xzr, [x21, w20, uxtw 3]
	add	x2, x19, 2048
	mov	w0, -1
	stp	xzr, xzr, [x2, 184]
	stp	xzr, xzr, [x2, 200]
	str	xzr, [x19, 2264]
	str	xzr, [x19, 2272]
	str	wzr, [x19, 2280]
	str	w0, [x24, 64]
	b	.L85
	.p2align 3
.L90:
	ldr	w2, [x22, 24]
	ldr	x1, [x22, 8]
	ldr	w0, [x22, 16]
	bl	MEM_AddMemRecord
	ldr	x5, [x22, 8]
	mov	x6, 23592960
	lsr	w7, w20, 24
	ldr	x1, .LC127
	add	x6, x5, x6
	and	w20, w20, 3
	mov	w3, w7
	str	x6, [x19, 2264]
	str	w7, [x24, 64]
	mov	x6, 25952256
	add	x7, x5, 9437184
	add	x6, x5, x6
	str	x5, [x19, 2248]
	mov	w4, w20
	str	x7, [x19, 2240]
	add	x2, x29, 72
	add	x7, x5, 11796480
	mov	w0, 32
	add	x5, x5, 14155776
	str	w20, [x19, 2280]
	str	x6, [x19, 2256]
	str	x7, [x19, 2232]
	str	x5, [x19, 2272]
	bl	dprint_vfmw
	b	.L85
	.p2align 3
.L89:
	ldr	x1, .LC129
	add	x2, x29, 72
	mov	w0, 32
	bl	dprint_vfmw
	b	.L85
	.size	VfmwProc_SaveYUV, .-VfmwProc_SaveYUV
	.align	3
.LC121:
	.xword	.LANCHOR0
	.align	3
.LC122:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC123:
	.xword	.LANCHOR2
	.align	3
.LC125:
	.xword	.LC124
	.align	3
.LC127:
	.xword	.LC126
	.align	3
.LC129:
	.xword	.LC128
	.align	3
.LC131:
	.xword	.LC130
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_PrintTracer, %function
VfmwProc_PrintTracer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC135
	mov	w0, 32
	ldr	w19, [x19]
	bl	dprint_vfmw
	mov	w0, w19
	bl	DBG_PrintTracer
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_PrintTracer, .-VfmwProc_PrintTracer
	.align	3
.LC135:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSmmuIrqEnable, %function
VfmwProc_SetSmmuIrqEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	cbnz	w0, .L99
	ldr	x19, .LC136
	ldr	w0, [x19, 68]
	cmp	w0, 1
	beq	.L102
	ldr	x1, .LC140
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 1
	str	w0, [x19, 68]
.L99:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L102:
	ldr	x1, .LC138
	mov	w0, 32
	bl	dprint_vfmw
	str	wzr, [x19, 68]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSmmuIrqEnable, .-VfmwProc_SetSmmuIrqEnable
	.align	3
.LC136:
	.xword	.LANCHOR2
	.align	3
.LC138:
	.xword	.LC137
	.align	3
.LC140:
	.xword	.LC139
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetSedOnlyEnable, %function
VfmwProc_SetSedOnlyEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x2, .LC141
	cbz	w0, .L106
	ldr	x1, .LC145
	mov	w3, 1
	mov	w0, 32
	str	w3, [x2, 72]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L106:
	ldr	x1, .LC143
	mov	w0, 32
	str	wzr, [x2, 72]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_SetSedOnlyEnable, .-VfmwProc_SetSedOnlyEnable
	.align	3
.LC141:
	.xword	.LANCHOR2
	.align	3
.LC143:
	.xword	.LC142
	.align	3
.LC145:
	.xword	.LC144
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_CloseModuleLowly, %function
VfmwProc_CloseModuleLowly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	cmp	w3, 31
	bhi	.L110
	ldr	x4, .LC148
	mov	w2, w3
	ldr	x1, .LC149
	mov	w0, 32
	ldr	x3, [x4, w3, uxtw 3]
	str	wzr, [x3, 1272]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L110:
	ldr	x1, .LC147
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_CloseModuleLowly, .-VfmwProc_CloseModuleLowly
	.align	3
.LC147:
	.xword	.LC146
	.align	3
.LC148:
	.xword	.LANCHOR0
	.align	3
.LC149:
	.xword	.LC18
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_StopTask.part.9, %function
VCTRL_StopTask.part.9:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC150
	ldr	w0, [x20, 260]
	cmp	w0, 1
	beq	.L114
	ldr	x21, .LC151
	mov	w0, 10
	mov	w19, 49
	ldr	x1, [x21, 240]
	blr	x1
	b	.L115
	.p2align 3
.L122:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L121
.L115:
	ldr	w1, [x20, 260]
	mov	w0, 10
	cmp	w1, 1
	bne	.L122
.L114:
	str	wzr, [x20, 264]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L121:
	str	wzr, [x20, 264]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_StopTask.part.9, .-VCTRL_StopTask.part.9
	.align	3
.LC150:
	.xword	.LANCHOR0
	.align	3
.LC151:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_StartTask.part.10, %function
VCTRL_StartTask.part.10:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC152
	ldr	w0, [x20, 260]
	cmp	w0, 2
	beq	.L126
	ldr	x21, .LC153
	mov	w0, 10
	mov	w19, 49
	ldr	x1, [x21, 240]
	blr	x1
	b	.L127
	.p2align 3
.L134:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L133
.L127:
	ldr	w1, [x20, 260]
	mov	w0, 10
	cmp	w1, 2
	bne	.L134
.L126:
	str	wzr, [x20, 264]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L133:
	str	wzr, [x20, 264]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_StartTask.part.10, .-VCTRL_StartTask.part.10
	.align	3
.LC152:
	.xword	.LANCHOR0
	.align	3
.LC153:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_SetSendStreamAgainFlag.part.11, %function
VCTRL_SetSendStreamAgainFlag.part.11:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC154
	mov	w2, 1290
	ldr	x1, .LC155
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_SetSendStreamAgainFlag.part.11, .-VCTRL_SetSendStreamAgainFlag.part.11
	.align	3
.LC154:
	.xword	.LC8
	.align	3
.LC155:
	.xword	.LC5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VCTRL_CanBeDecodedByHardWare.part.18, %function
VCTRL_CanBeDecodedByHardWare.part.18:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sub	w0, w19, #19
	cmp	w0, 1
	ccmp	w19, 14, 4, hi
	ldr	x19, [sp, 16]
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_CanBeDecodedByHardWare.part.18, .-VCTRL_CanBeDecodedByHardWare.part.18
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_OpenModuleLowly, %function
VfmwProc_OpenModuleLowly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	cmp	w3, 31
	bhi	.L140
	ldr	x5, .LC157
	mov	w2, w3
	ldr	x1, .LC158
	mov	w4, 1
	mov	w0, 32
	ldr	x3, [x5, w3, uxtw 3]
	str	w4, [x3, 1272]
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L140:
	ldr	x1, .LC156
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_OpenModuleLowly, .-VfmwProc_OpenModuleLowly
	.align	3
.LC156:
	.xword	.LC146
	.align	3
.LC157:
	.xword	.LANCHOR0
	.align	3
.LC158:
	.xword	.LC18
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Suspend
	.type	VCTRL_Suspend, %function
VCTRL_Suspend:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC159
	ldr	x0, [x21]
	blr	x0
	ldr	x24, .LC160
	mov	w25, w0
	ldr	x1, [x24]
	cbz	x1, .L142
	mov	w0, 0
	blr	x1
.L143:
	mov	w0, 0
	mov	w20, 32
	mov	w22, 0
	mov	w19, 0
	bl	SCDDRV_PrepareSleep
	mov	w0, 0
	bl	VDMDRV_PrepareSleep
	ldr	x0, [x21]
	blr	x0
	mov	w26, w0
	b	.L154
	.p2align 3
.L144:
	bl	VDMDRV_GetSleepStage
	cmp	w0, 2
	mov	w19, 1
	mov	w23, w19
	beq	.L147
.L178:
	tst	w23, w22
	mov	w0, 10
	bne	.L147
	subs	w20, w20, #1
	beq	.L179
	ldr	x1, [x21, 240]
	blr	x1
	cmp	w19, 1
	ccmp	w22, 1, 0, eq
	beq	.L147
.L154:
	mov	w0, 0
	bl	SCDDRV_GetSleepStage
	cmp	w0, 2
	mov	w0, 0
	beq	.L144
	bl	VDMDRV_GetSleepStage
	cmp	w0, 2
	mov	w23, w19
	bne	.L178
	mov	w22, 1
	b	.L178
	.p2align 3
.L179:
	ldr	x0, [x21]
	blr	x0
	cmp	w26, w0
	sub	w2, w0, w26
	bls	.L150
	mvn	w26, w26
	add	w2, w26, w0
.L150:
	ldr	x1, .LC163
	mov	w4, w22
	mov	w3, w19
	mov	w0, 0
	bl	dprint_vfmw
	cbnz	w19, .L166
	ldr	x1, .LC169
	mov	w2, 0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	bl	SCDDRV_ForceSleep
.L166:
	cbnz	w22, .L147
	ldr	x1, .LC171
	mov	w2, 0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	bl	VDMDRV_ForceSleep
.L147:
	ldr	x0, .LC164
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L180
.L156:
	ldr	x0, .LC165
	add	x1, x0, 256
	ldr	w0, [x0, 256]
	cmp	w0, 1
	beq	.L181
.L163:
	ldr	x0, [x21]
	blr	x0
	cmp	w25, w0
	sub	w2, w0, w25
	bls	.L165
	mvn	w25, w25
	add	w2, w25, w0
.L165:
	ldr	x1, .LC167
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L180:
	ldr	x1, [x24, 64]
	cbz	x1, .L157
	mov	w0, 0
	blr	x1
.L157:
	ldr	x1, [x24, 48]
	cbz	x1, .L158
	mov	w0, 0
	blr	x1
	ldr	x1, [x24, 16]
	cbz	x1, .L160
.L182:
	mov	w0, 0
	blr	x1
.L161:
	ldr	x1, [x24, 80]
	cbz	x1, .L156
	mov	w0, 0
	blr	x1
	ldr	x0, .LC165
	add	x1, x0, 256
	ldr	w0, [x0, 256]
	cmp	w0, 1
	bne	.L163
	.p2align 2
.L181:
	mov	w0, 2
	str	w0, [x1, 8]
	bl	VCTRL_StopTask.part.9
	b	.L163
.L158:
	ldr	x1, .LC161
	mov	w2, 386
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, [x24, 16]
	cbnz	x1, .L182
	.p2align 2
.L160:
	ldr	x1, .LC161
	mov	w2, 391
	mov	w0, 0
	bl	dprint_vfmw
	b	.L161
	.p2align 3
.L142:
	ldr	x1, .LC161
	mov	w2, 288
	mov	w0, 0
	bl	dprint_vfmw
	b	.L143
	.size	VCTRL_Suspend, .-VCTRL_Suspend
	.align	3
.LC159:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC160:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC161:
	.xword	.LC89
	.align	3
.LC163:
	.xword	.LC162
	.align	3
.LC164:
	.xword	g_HalDisable
	.align	3
.LC165:
	.xword	.LANCHOR0
	.align	3
.LC167:
	.xword	.LC166
	.align	3
.LC169:
	.xword	.LC168
	.align	3
.LC171:
	.xword	.LC170
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestSuspend, %function
VfmwProc_TestSuspend:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC174
	mov	x2, x19
	mov	w0, 22
	bl	dprint_vfmw
	bl	VCTRL_Suspend
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestSuspend, .-VfmwProc_TestSuspend
	.align	3
.LC174:
	.xword	.LC173
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Resume
	.type	VCTRL_Resume, %function
VCTRL_Resume:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC175
	ldr	x0, [x20]
	blr	x0
	mov	w19, w0
	ldr	x0, .LC176
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L204
.L185:
	mov	w0, 0
	bl	SCDDRV_ExitSleep
	mov	w0, 0
	bl	VDMDRV_ExitSleep
	ldr	x0, .LC179
	add	x1, x0, 256
	ldr	w0, [x0, 256]
	cmp	w0, 1
	beq	.L205
.L195:
	ldr	x0, [x20]
	blr	x0
	cmp	w19, w0
	sub	w2, w0, w19
	bls	.L197
	mvn	w2, w19
	add	w2, w2, w0
.L197:
	ldr	x1, .LC181
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L204:
	ldr	x21, .LC177
	ldr	x1, [x21, 8]
	cbz	x1, .L206
	mov	w0, 0
	blr	x1
.L187:
	ldr	x1, [x21, 40]
	cbz	x1, .L207
	mov	w0, 0
	blr	x1
.L189:
	ldr	x1, [x21, 56]
	cbz	x1, .L190
	mov	w0, 0
	blr	x1
.L190:
	ldr	x1, [x21, 72]
	cbz	x1, .L191
	mov	w0, 0
	blr	x1
.L191:
	ldr	x1, [x21, 144]
	cbz	x1, .L192
	mov	w0, 0
	blr	x1
.L193:
	ldr	x0, [x21, 152]
	cbz	x0, .L194
	blr	x0
	b	.L185
	.p2align 3
.L205:
	str	w0, [x1, 8]
	bl	VCTRL_StartTask.part.10
	b	.L195
	.p2align 3
.L207:
	ldr	x1, .LC178
	mov	w2, 434
	mov	w0, 0
	bl	dprint_vfmw
	b	.L189
	.p2align 3
.L192:
	ldr	x1, .LC178
	mov	w2, 441
	mov	w0, 0
	bl	dprint_vfmw
	b	.L193
	.p2align 3
.L194:
	ldr	x1, .LC178
	mov	w2, 442
	mov	w0, 0
	bl	dprint_vfmw
	b	.L185
	.p2align 3
.L206:
	ldr	x1, .LC178
	mov	w2, 429
	mov	w0, 0
	bl	dprint_vfmw
	b	.L187
	.size	VCTRL_Resume, .-VCTRL_Resume
	.align	3
.LC175:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC176:
	.xword	g_HalDisable
	.align	3
.LC177:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC178:
	.xword	.LC89
	.align	3
.LC179:
	.xword	.LANCHOR0
	.align	3
.LC181:
	.xword	.LC180
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestResume, %function
VfmwProc_TestResume:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC183
	mov	x2, x19
	mov	w0, 22
	bl	dprint_vfmw
	bl	VCTRL_Resume
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestResume, .-VfmwProc_TestResume
	.align	3
.LC183:
	.xword	.LC173
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ChanCtx_Init
	.type	ChanCtx_Init, %function
ChanCtx_Init:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC187
	ldr	x0, .LC186
	mov	x2, 384
	mov	w1, 0
	ldr	x3, [x0, 96]
	mov	x0, x19
	blr	x3
	add	x0, x19, 128
	add	x1, x19, 256
	mov	w2, -1
	.p2align 2
.L210:
	str	w2, [x0], 4
	cmp	x0, x1
	bne	.L210
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ChanCtx_Init, .-ChanCtx_Init
	.align	3
.LC186:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC187:
	.xword	g_ChanCtx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RecordPosTime
	.type	VCTRL_RecordPosTime, %function
VCTRL_RecordPosTime:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, 11
	bhi	.L218
	ldr	x22, .LC193
	uxtw	x20, w21
	ldrb	w0, [x22, x20]
	cmp	w0, 14
	mov	w19, w0
	bhi	.L219
	cmp	w21, 10
	beq	.L220
.L217:
	ldr	x0, .LC195
	ldr	x0, [x0, 8]
	blr	x0
	lsl	x1, x20, 4
	ldr	x2, .LC196
	sub	x1, x1, x20
	add	x19, x1, x19, sxtw
	ldrb	w1, [x22, x20]
	add	w1, w1, 1
	strb	w1, [x22, x20]
	str	w0, [x2, x19, lsl 2]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L219:
	strb	wzr, [x22, x20]
	cmp	w21, 10
	mov	w19, 0
	bne	.L217
.L220:
	ldr	x0, .LC194
	mov	w1, 1
	strb	w1, [x0, 2284]
	b	.L217
	.p2align 3
.L218:
	ldr	x2, .LC190
	mov	w4, w21
	ldr	x1, .LC192
	mov	w3, 698
	add	x2, x2, 24
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_RecordPosTime, .-VCTRL_RecordPosTime
	.align	3
.LC190:
	.xword	.LANCHOR1
	.align	3
.LC192:
	.xword	.LC191
	.align	3
.LC193:
	.xword	g_TimeRecId
	.align	3
.LC194:
	.xword	.LANCHOR0
	.align	3
.LC195:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC196:
	.xword	g_TimeRecTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RecordData
	.type	VCTRL_RecordData, %function
VCTRL_RecordData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	uxtw	x19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 1
	bhi	.L226
	ldr	x3, .LC200
	ldrb	w0, [x3, x19]
	cmp	w0, 14
	bhi	.L225
	add	w4, w0, 1
	uxtb	w4, w4
.L224:
	lsl	x2, x19, 4
	ldr	x1, .LC201
	sub	x2, x2, x19
	strb	w4, [x3, x19]
	add	x0, x2, x0, sxtw
	str	w20, [x1, x0, lsl 2]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L225:
	mov	w4, 1
	mov	w0, 0
	b	.L224
	.p2align 3
.L226:
	ldr	x2, .LC197
	mov	w4, w19
	ldr	x1, .LC199
	mov	w3, 722
	add	x2, x2, 48
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_RecordData, .-VCTRL_RecordData
	.align	3
.LC197:
	.xword	.LANCHOR1
	.align	3
.LC199:
	.xword	.LC198
	.align	3
.LC200:
	.xword	g_DataRecId
	.align	3
.LC201:
	.xword	g_DataTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Isr_1
	.type	VCTRL_Isr_1, %function
VCTRL_Isr_1:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	bl	VDMDRV_IsrProcess
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Isr_1, .-VCTRL_Isr_1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Isr_2
	.type	VCTRL_Isr_2, %function
VCTRL_Isr_2:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 2
	bl	VDMDRV_IsrProcess
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Isr_2, .-VCTRL_Isr_2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Scd_Isr_1
	.type	VCTRL_Scd_Isr_1, %function
VCTRL_Scd_Isr_1:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	bl	SM_SCDIntServeProc
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Scd_Isr_1, .-VCTRL_Scd_Isr_1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_Scd_Isr_2
	.type	VCTRL_Scd_Isr_2, %function
VCTRL_Scd_Isr_2:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 2
	bl	SM_SCDIntServeProc
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_Scd_Isr_2, .-VCTRL_Scd_Isr_2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InformVdmFree
	.type	VCTRL_InformVdmFree, %function
VCTRL_InformVdmFree:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC202
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_InformVdmFree, .-VCTRL_InformVdmFree
	.align	3
.LC202:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ExtraWakeUpThread
	.type	VCTRL_ExtraWakeUpThread, %function
VCTRL_ExtraWakeUpThread:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC203
	mov	w0, 0
	ldr	x1, [x1, 256]
	blr	x1
	ldp	x29, x30, [sp], 16
	ret
	.size	VCTRL_ExtraWakeUpThread, .-VCTRL_ExtraWakeUpThread
	.align	3
.LC203:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetMoreGapEnable
	.type	VCTRL_SetMoreGapEnable, %function
VCTRL_SetMoreGapEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	bhi	.L239
	ldr	x0, .LC207
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L240
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L241
	cmp	w20, 1
	bhi	.L238
	str	w20, [x0, 1256]
	mov	w0, 0
.L235:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L238:
	str	wzr, [x0, 1256]
	mov	w0, -1
	b	.L235
	.p2align 3
.L241:
	ldr	x3, .LC210
	mov	w2, 906
	ldr	x1, .LC206
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L235
	.p2align 3
.L239:
	ldr	x3, .LC205
	mov	w2, 904
	ldr	x1, .LC206
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L235
.L240:
	ldr	x3, .LC208
	mov	w2, 905
	ldr	x1, .LC206
	bl	dprint_vfmw
	mov	w0, -1
	b	.L235
	.size	VCTRL_SetMoreGapEnable, .-VCTRL_SetMoreGapEnable
	.align	3
.LC205:
	.xword	.LC204
	.align	3
.LC206:
	.xword	.LC5
	.align	3
.LC207:
	.xword	.LANCHOR0
	.align	3
.LC208:
	.xword	.LC8
	.align	3
.LC210:
	.xword	.LC209
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetCallBack
	.type	VCTRL_SetCallBack, %function
VCTRL_SetCallBack:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L250
	cbz	w19, .L246
	cmp	w19, 1
	beq	.L247
	ldr	x2, .LC215
	mov	w3, w19
	ldr	x1, .LC217
	mov	w0, 0
	add	x2, x2, 72
	bl	dprint_vfmw
	mov	w0, -1
.L244:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L247:
	ldr	x1, .LC214
	mov	w0, 0
	str	x20, [x1, 576]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L246:
	ldr	x1, .LC214
	mov	w0, 0
	str	x20, [x1, 568]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L250:
	ldr	x3, .LC212
	mov	w2, 1023
	ldr	x1, .LC213
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L244
	.size	VCTRL_SetCallBack, .-VCTRL_SetCallBack
	.align	3
.LC212:
	.xword	.LC211
	.align	3
.LC213:
	.xword	.LC5
	.align	3
.LC214:
	.xword	.LANCHOR0
	.align	3
.LC215:
	.xword	.LANCHOR1
	.align	3
.LC217:
	.xword	.LC216
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StopTask
	.type	VCTRL_StopTask, %function
VCTRL_StopTask:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC218
	add	x1, x0, 256
	ldr	w0, [x0, 256]
	cmp	w0, 1
	bne	.L253
	mov	w0, 2
	str	w0, [x1, 8]
	bl	VCTRL_StopTask.part.9
.L252:
	ldp	x29, x30, [sp], 16
	ret
	.p2align 3
.L253:
	mov	w0, -1
	b	.L252
	.size	VCTRL_StopTask, .-VCTRL_StopTask
	.align	3
.LC218:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StartTask
	.type	VCTRL_StartTask, %function
VCTRL_StartTask:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC220
	add	x1, x0, 256
	ldr	w0, [x0, 256]
	cmp	w0, 1
	bne	.L256
	str	w0, [x1, 8]
	bl	VCTRL_StartTask.part.10
.L255:
	ldp	x29, x30, [sp], 16
	ret
	.p2align 3
.L256:
	mov	w0, -1
	b	.L255
	.size	VCTRL_StartTask, .-VCTRL_StartTask
	.align	3
.LC220:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetStreamInterface
	.type	VCTRL_SetStreamInterface, %function
VCTRL_SetStreamInterface:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L261
	ldr	x19, .LC225
	sxtw	x22, w21
	ldr	x0, [x19, w21, sxtw 3]
	cbz	x0, .L262
	ldr	x21, .LC227
	mov	x2, 24
	mov	x1, x20
	add	x0, x0, 192
	add	x19, x19, 2288
	ldr	x3, [x21, 104]
	blr	x3
	lsl	x0, x22, 2
	ldr	x3, [x21, 104]
	sub	x0, x0, x22
	mov	x2, 24
	mov	x1, x20
	add	x0, x19, x0, lsl 3
	blr	x3
	mov	w0, 0
.L259:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L262:
	ldr	x3, .LC226
	mov	w2, 1279
	ldr	x1, .LC224
	bl	dprint_vfmw
	mov	w0, -1
	b	.L259
.L261:
	ldr	x3, .LC223
	mov	w2, 1278
	ldr	x1, .LC224
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L259
	.size	VCTRL_SetStreamInterface, .-VCTRL_SetStreamInterface
	.align	3
.LC223:
	.xword	.LC222
	.align	3
.LC224:
	.xword	.LC5
	.align	3
.LC225:
	.xword	.LANCHOR0
	.align	3
.LC226:
	.xword	.LC8
	.align	3
.LC227:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetSendStreamAgainFlag
	.type	VCTRL_SetSendStreamAgainFlag, %function
VCTRL_SetSendStreamAgainFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x0, .LC229
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L266
	add	x2, x0, 323584
	mov	w0, 0
	str	w20, [x2, 3972]
.L265:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L266:
	bl	VCTRL_SetSendStreamAgainFlag.part.11
	b	.L265
	.size	VCTRL_SetSendStreamAgainFlag, .-VCTRL_SetSendStreamAgainFlag
	.align	3
.LC229:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetSendStreamAgainFlag
	.type	VCTRL_GetSendStreamAgainFlag, %function
VCTRL_GetSendStreamAgainFlag:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC230
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L270
	add	x0, x0, 323584
	ldr	w0, [x0, 3972]
.L269:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L270:
	ldr	x3, .LC231
	mov	w2, 1297
	ldr	x1, .LC232
	bl	dprint_vfmw
	mov	w0, -1
	b	.L269
	.size	VCTRL_GetSendStreamAgainFlag, .-VCTRL_GetSendStreamAgainFlag
	.align	3
.LC230:
	.xword	.LANCHOR0
	.align	3
.LC231:
	.xword	.LC8
	.align	3
.LC232:
	.xword	.LC5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetStreamInterface
	.type	VCTRL_GetStreamInterface, %function
VCTRL_GetStreamInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC233
	sxtw	x2, w19
	ldr	x1, [x20, w19, sxtw 3]
	cbz	x1, .L274
	ldr	x3, .LC234
	lsl	x0, x2, 2
	sub	x0, x0, x2
	add	x4, x20, 2288
	mov	x2, 24
	add	x1, x1, 192
	ldr	x3, [x3, 120]
	add	x0, x4, x0, lsl 3
	blr	x3
	cbnz	w0, .L275
	ldr	x0, [x20, w19, sxtw 3]
	add	x0, x0, 192
.L272:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L274:
	mov	x0, 0
	b	.L272
	.p2align 3
.L275:
	ldr	x1, .LC236
	mov	w3, w19
	mov	w2, 1313
	mov	w0, 0
	bl	dprint_vfmw
	mov	x0, 0
	b	.L272
	.size	VCTRL_GetStreamInterface, .-VCTRL_GetStreamInterface
	.align	3
.LC233:
	.xword	.LANCHOR0
	.align	3
.LC234:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC236:
	.xword	.LC235
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetFrameInterface
	.type	VCTRL_SetFrameInterface, %function
VCTRL_SetFrameInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L280
	ldr	x0, .LC241
	ldr	x0, [x0, w20, sxtw 3]
	cbz	x0, .L281
	ldr	x3, .LC243
	mov	x2, 24
	mov	x1, x19
	add	x0, x0, 240
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L278:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L281:
	ldr	x3, .LC242
	mov	w2, 1326
	ldr	x1, .LC240
	bl	dprint_vfmw
	mov	w0, -1
	b	.L278
.L280:
	ldr	x3, .LC239
	mov	w2, 1325
	ldr	x1, .LC240
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L278
	.size	VCTRL_SetFrameInterface, .-VCTRL_SetFrameInterface
	.align	3
.LC239:
	.xword	.LC238
	.align	3
.LC240:
	.xword	.LC5
	.align	3
.LC241:
	.xword	.LANCHOR0
	.align	3
.LC242:
	.xword	.LC8
	.align	3
.LC243:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetFrameInterface
	.type	VCTRL_GetFrameInterface, %function
VCTRL_GetFrameInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC244
	ldr	x1, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x1, 240
	cmp	x1, xzr
	csel	x0, x0, xzr, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetFrameInterface, .-VCTRL_GetFrameInterface
	.align	3
.LC244:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetStreamSize
	.type	VCTRL_GetStreamSize, %function
VCTRL_GetStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L290
	ldr	x0, .LC247
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L291
	ldr	w2, [x0, 4]
	cmp	w2, 1
	bne	.L292
	mov	x2, 34440
	mov	x1, x20
	movk	x2, 0x1, lsl 16
	add	x0, x0, x2
	bl	GetSegStreamSize
.L287:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L292:
	ldr	x3, .LC251
	mov	w2, 1366
	ldr	x1, .LC246
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L287
	.p2align 3
.L290:
	ldr	x3, .LC245
	mov	w2, 1364
	ldr	x1, .LC246
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L287
.L291:
	ldr	x3, .LC249
	mov	w2, 1365
	ldr	x1, .LC246
	bl	dprint_vfmw
	mov	w0, -1
	b	.L287
	.size	VCTRL_GetStreamSize, .-VCTRL_GetStreamSize
	.align	3
.LC245:
	.xword	.LC204
	.align	3
.LC246:
	.xword	.LC5
	.align	3
.LC247:
	.xword	.LANCHOR0
	.align	3
.LC249:
	.xword	.LC248
	.align	3
.LC251:
	.xword	.LC250
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CheckFreshRaw
	.type	VCTRL_CheckFreshRaw, %function
VCTRL_CheckFreshRaw:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	stp	wzr, wzr, [x29, 40]
	bhi	.L300
	ldr	x0, .LC254
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L301
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L302
	add	x19, x0, 1648
	add	x1, x29, 40
	mov	x0, x19
	bl	GetRawStreamNum
	cbnz	w0, .L299
	add	x1, x29, 44
	mov	x0, x19
	bl	GetRawStreamSize
	cbnz	w0, .L299
	ldr	x1, .LC258
	mov	w0, 22
	ldp	w2, w3, [x29, 40]
	bl	dprint_vfmw
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	ble	.L299
	ldr	w0, [x29, 44]
	cmp	w0, 3
	csetm	w0, le
.L295:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L299:
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L302:
	ldr	x3, .LC256
	mov	w2, 1383
	ldr	x1, .LC253
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L295
	.p2align 3
.L300:
	ldr	x3, .LC252
	mov	w2, 1381
	ldr	x1, .LC253
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L295
.L301:
	ldr	x3, .LC255
	mov	w2, 1382
	ldr	x1, .LC253
	bl	dprint_vfmw
	mov	w0, -1
	b	.L295
	.size	VCTRL_CheckFreshRaw, .-VCTRL_CheckFreshRaw
	.align	3
.LC252:
	.xword	.LC204
	.align	3
.LC253:
	.xword	.LC5
	.align	3
.LC254:
	.xword	.LANCHOR0
	.align	3
.LC255:
	.xword	.LC248
	.align	3
.LC256:
	.xword	.LC250
	.align	3
.LC258:
	.xword	.LC257
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CheckFreshSeg
	.type	VCTRL_CheckFreshSeg, %function
VCTRL_CheckFreshSeg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	stp	wzr, wzr, [x29, 40]
	bhi	.L308
	ldr	x0, .LC261
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L309
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L310
	mov	x3, 34440
	add	x2, x29, 44
	movk	x3, 0x1, lsl 16
	add	x1, x29, 40
	add	x0, x0, x3
	bl	GetFreshSegStream
	ldr	x1, .LC265
	mov	w0, 22
	ldp	w2, w3, [x29, 40]
	bl	dprint_vfmw
	ldr	w0, [x29, 40]
	cmp	w0, wzr
	csetm	w0, le
.L305:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L310:
	ldr	x3, .LC263
	mov	w2, 1409
	ldr	x1, .LC260
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L305
	.p2align 3
.L308:
	ldr	x3, .LC259
	mov	w2, 1407
	ldr	x1, .LC260
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L305
.L309:
	ldr	x3, .LC262
	mov	w2, 1408
	ldr	x1, .LC260
	bl	dprint_vfmw
	mov	w0, -1
	b	.L305
	.size	VCTRL_CheckFreshSeg, .-VCTRL_CheckFreshSeg
	.align	3
.LC259:
	.xword	.LC204
	.align	3
.LC260:
	.xword	.LC5
	.align	3
.LC261:
	.xword	.LANCHOR0
	.align	3
.LC262:
	.xword	.LC248
	.align	3
.LC263:
	.xword	.LC250
	.align	3
.LC265:
	.xword	.LC264
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetDiscardPicParam
	.type	VCTRL_SetDiscardPicParam, %function
VCTRL_SetDiscardPicParam:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L317
	cbz	x20, .L318
	ldr	x21, .LC270
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L319
	ldr	x3, .LC272
	mov	x1, x20
	mov	x2, 8
	add	x0, x0, 1520
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x1, [x21, w19, sxtw 3]
	ldr	w0, [x1, 1520]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L316
	mov	w0, 0
	str	wzr, [x1, 1520]
.L313:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L316:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L317:
	ldr	x3, .LC266
	mov	w2, 1428
	ldr	x1, .LC267
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L313
.L319:
	ldr	x3, .LC271
	mov	w2, 1430
	ldr	x1, .LC267
	bl	dprint_vfmw
	mov	w0, -1
	b	.L313
.L318:
	ldr	x3, .LC269
	mov	w2, 1429
	ldr	x1, .LC267
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L313
	.size	VCTRL_SetDiscardPicParam, .-VCTRL_SetDiscardPicParam
	.align	3
.LC266:
	.xword	.LC204
	.align	3
.LC267:
	.xword	.LC5
	.align	3
.LC269:
	.xword	.LC268
	.align	3
.LC270:
	.xword	.LANCHOR0
	.align	3
.LC271:
	.xword	.LC8
	.align	3
.LC272:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetSyntaxCtx
	.type	VCTRL_GetSyntaxCtx, %function
VCTRL_GetSyntaxCtx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC273
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L322
	add	x0, x0, 331776
	add	x0, x0, 72
.L321:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L322:
	mov	x0, 0
	b	.L321
	.size	VCTRL_GetSyntaxCtx, .-VCTRL_GetSyntaxCtx
	.align	3
.LC273:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetImageInterface
	.type	VCTRL_GetImageInterface, %function
VCTRL_GetImageInterface:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC274
	ldr	x1, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x1, 216
	cmp	x1, xzr
	csel	x0, x0, xzr, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetImageInterface, .-VCTRL_GetImageInterface
	.align	3
.LC274:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_PartitionMemForStdUser
	.type	VCTRL_PartitionMemForStdUser, %function
VCTRL_PartitionMemForStdUser:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	mov	w22, w1
	mov	w21, w2
	mov	w25, w3
	mov	w26, w4
	bl	_mcount
	ldr	x19, .LC275
	cmp	w22, 31
	ccmp	w21, 31, 4, gt
	ldr	x23, [x19, w20, sxtw 3]
	ble	.L338
	cmp	w25, wzr
	ccmp	w26, wzr, 4, ne
	beq	.L339
	ldr	x24, .LC280
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 96
	ldr	x3, [x24, 96]
	blr	x3
	strb	wzr, [x29, 97]
	mov	w2, 1
	add	x1, x29, 96
	mov	w0, w20
	strb	wzr, [x29, 99]
	stp	w22, w21, [x29, 104]
	stp	w22, w21, [x29, 120]
	strb	wzr, [x29, 101]
	strb	wzr, [x29, 102]
	strb	w2, [x29, 98]
	bl	FSP_ConfigInstance
	mov	w21, w0
	cbnz	w0, .L330
	add	x3, x29, 92
	mov	w2, w26
	mov	w1, w25
	mov	w0, w20
	bl	FSP_ConfigFrameBuf
	cbnz	w0, .L340
	add	x22, x19, 3056
	mov	w0, w20
	mov	x1, x22
	bl	FSP_GetInstInfo
	ldrsb	w0, [x22, 1]
	mov	w1, 16
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x23, 528]
	cmp	w0, 2
	ble	.L341
	ldr	w0, [x19, 6264]
	add	x20, x23, 460
	ldr	x3, [x24, 96]
	mov	x2, 64
	str	w0, [x23, 524]
	mov	w1, 0
	mov	x0, x20
	blr	x3
	ldr	w0, [x23, 528]
	cmp	w0, wzr
	ble	.L328
	sub	w2, w0, #1
	mov	w4, 100
	mov	x3, 124
	add	x1, x19, 3080
	mov	x0, x20
	umaddl	x3, w2, w4, x3
	add	x3, x22, x3
	.p2align 2
.L335:
	ldr	w2, [x1], 100
	str	w2, [x0], 4
	cmp	x1, x3
	bne	.L335
.L328:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
.L339:
	ldr	x1, .LC279
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L328
.L330:
	ldr	x1, .LC287
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L328
.L340:
	ldr	x1, .LC282
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L328
.L341:
	ldr	x2, .LC283
	mov	w3, 1583
	ldr	x1, .LC285
	mov	w0, 0
	add	x2, x2, 96
	mov	w21, -1
	bl	dprint_vfmw
	b	.L328
.L338:
	ldr	x1, .LC277
	mov	w3, w21
	mov	w2, w22
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L328
	.size	VCTRL_PartitionMemForStdUser, .-VCTRL_PartitionMemForStdUser
	.align	3
.LC275:
	.xword	.LANCHOR0
	.align	3
.LC277:
	.xword	.LC276
	.align	3
.LC279:
	.xword	.LC278
	.align	3
.LC280:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC282:
	.xword	.LC281
	.align	3
.LC283:
	.xword	.LANCHOR1
	.align	3
.LC285:
	.xword	.LC284
	.align	3
.LC287:
	.xword	.LC286
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_UnInstallChan
	.type	VCTRL_UnInstallChan, %function
VCTRL_UnInstallChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	FSP_DisableInstance
	mov	w0, w19
	bl	CloseUsdPool_WithMem
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_UnInstallChan, .-VCTRL_UnInstallChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DelAllFrameMemRecord
	.type	DelAllFrameMemRecord, %function
DelAllFrameMemRecord:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	add	x20, x1, 2304
	bl	_mcount
	cbz	x19, .L361
	.p2align 2
.L356:
	ldr	w0, [x19]
	cmp	w0, 255
	beq	.L346
	ldr	w2, [x19, 12]
	ldr	w0, [x19, 32]
	ldr	x1, [x19, 24]
	bl	MEM_DelMemRecord
.L346:
	ldr	w0, [x19, 4]
	cmp	w0, 255
	beq	.L347
	ldr	w2, [x19, 16]
	ldr	w0, [x19, 48]
	ldr	x1, [x19, 40]
	bl	MEM_DelMemRecord
.L347:
	ldr	w0, [x19, 8]
	cmp	w0, 255
	beq	.L348
	ldr	w2, [x19, 20]
	ldr	w0, [x19, 64]
	ldr	x1, [x19, 56]
	bl	MEM_DelMemRecord
.L348:
	add	x19, x19, 72
	cmp	x19, x20
	bne	.L356
	mov	w0, 0
.L345:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L361:
	ldr	x3, .LC292
	mov	w2, 1622
	ldr	x1, .LC293
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L345
	.size	DelAllFrameMemRecord, .-DelAllFrameMemRecord
	.align	3
.LC292:
	.xword	.LC291
	.align	3
.LC293:
	.xword	.LC5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_FreeChanResource
	.type	VCTRL_FreeChanResource, %function
VCTRL_FreeChanResource:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L386
	ldr	x20, [x19]
	cbz	x20, .L387
	ldr	w0, [x19, 32]
	cmp	w0, 1
	beq	.L367
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
.L368:
	ldr	w0, [x19, 36]
	cmp	w0, 1
	beq	.L388
.L366:
	ldr	x20, [x19, 8]
	cbz	x20, .L389
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 40]
	cmp	w0, 1
	beq	.L390
.L371:
	ldr	x20, [x19, 16]
	cbz	x20, .L391
.L372:
	ldr	w0, [x20, 16]
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	bl	MEM_DelMemRecord
	ldr	w0, [x19, 44]
	cmp	w0, 1
	bne	.L373
	ldr	w0, [x20, 16]
	cbnz	w0, .L392
.L373:
	ldr	x1, .LC307
	ldr	x0, [x20, 8]
	ldr	x1, [x1, 328]
	blr	x1
	mov	w0, 0
.L364:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L367:
	ldr	x1, [x19, 24]
	cbz	x1, .L393
	mov	w0, w21
	bl	DelAllFrameMemRecord
	cbz	w0, .L368
	ldr	x1, .LC302
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 36]
	cmp	w0, 1
	bne	.L366
	.p2align 2
.L388:
	ldr	w0, [x20, 16]
	cbz	w0, .L366
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	b	.L366
	.p2align 3
.L390:
	ldr	w0, [x20, 16]
	cbz	w0, .L371
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	b	.L371
	.p2align 3
.L389:
	ldr	x2, .LC294
	mov	w0, 0
	ldr	x1, .LC304
	add	x2, x2, 128
	bl	dprint_vfmw
	ldr	x20, [x19, 16]
	cbnz	x20, .L372
.L391:
	ldr	x2, .LC294
	mov	w0, 0
	ldr	x1, .LC306
	add	x2, x2, 128
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L392:
	ldr	x1, [x20, 8]
	bl	MEM_ReleaseMemBlock
	mov	w0, 0
	b	.L364
	.p2align 3
.L393:
	ldr	x2, .LC294
	mov	w0, 0
	ldr	x1, .LC300
	add	x2, x2, 128
	bl	dprint_vfmw
	b	.L368
	.p2align 3
.L387:
	ldr	x2, .LC294
	mov	w0, 0
	ldr	x1, .LC298
	add	x2, x2, 128
	bl	dprint_vfmw
	b	.L366
.L386:
	ldr	x2, .LC294
	mov	w0, 0
	ldr	x1, .LC296
	add	x2, x2, 128
	bl	dprint_vfmw
	mov	w0, -1
	b	.L364
	.size	VCTRL_FreeChanResource, .-VCTRL_FreeChanResource
	.align	3
.LC294:
	.xword	.LANCHOR1
	.align	3
.LC296:
	.xword	.LC295
	.align	3
.LC298:
	.xword	.LC297
	.align	3
.LC300:
	.xword	.LC299
	.align	3
.LC302:
	.xword	.LC301
	.align	3
.LC304:
	.xword	.LC303
	.align	3
.LC306:
	.xword	.LC305
	.align	3
.LC307:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCtxSize
	.type	VCTRL_GetChanCtxSize, %function
VCTRL_GetChanCtxSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 26
	beq	.L397
	mov	w0, 50608
	movk	w0, 0xc, lsl 16
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L397:
	mov	w0, 38048
	movk	w0, 0xb2, lsl 16
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanCtxSize, .-VCTRL_GetChanCtxSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCfg
	.type	VCTRL_GetChanCfg, %function
VCTRL_GetChanCfg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L403
	cbz	x20, .L404
	ldr	x0, .LC312
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L405
	ldr	x3, .LC314
	mov	x2, 144
	add	x1, x1, 44
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L400:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L403:
	ldr	x3, .LC308
	mov	w2, 2638
	ldr	x1, .LC309
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L400
.L405:
	ldr	x3, .LC313
	mov	w2, 2640
	ldr	x1, .LC309
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L400
.L404:
	ldr	x3, .LC311
	mov	w2, 2639
	ldr	x1, .LC309
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L400
	.size	VCTRL_GetChanCfg, .-VCTRL_GetChanCfg
	.align	3
.LC308:
	.xword	.LC204
	.align	3
.LC309:
	.xword	.LC5
	.align	3
.LC311:
	.xword	.LC310
	.align	3
.LC312:
	.xword	.LANCHOR0
	.align	3
.LC313:
	.xword	.LC8
	.align	3
.LC314:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CmpConfigParameter
	.type	VCTRL_CmpConfigParameter, %function
VCTRL_CmpConfigParameter:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x0, .LC315
	ldr	x2, [x0, w20, sxtw 3]
	ldr	w0, [x2, 608]
	cmp	w0, 21
	beq	.L422
	ldr	w0, [x2, 52]
	ldr	w1, [x19, 8]
	cmp	w0, w1
	bne	.L422
	ldr	w3, [x2, 72]
	ldr	w1, [x19, 28]
	cmp	w3, w1
	bne	.L422
	ldr	w3, [x2, 68]
	ldr	w1, [x19, 24]
	cmp	w3, w1
	bne	.L422
	ldr	w3, [x2, 76]
	ldr	w1, [x19, 32]
	cmp	w3, w1
	bne	.L422
	ldr	w3, [x2, 80]
	ldr	w1, [x19, 36]
	cmp	w3, w1
	bne	.L422
	ldr	w3, [x2, 84]
	ldr	w1, [x19, 40]
	cmp	w3, w1
	bne	.L422
	ldr	w3, [x2, 92]
	ldr	w1, [x19, 48]
	cmp	w3, w1
	bne	.L422
	ldr	w3, [x2, 116]
	ldr	w1, [x19, 72]
	cmp	w3, w1
	bne	.L422
	ldr	w3, [x2, 132]
	ldr	w1, [x19, 88]
	cmp	w3, w1
	bne	.L422
	ldr	w3, [x2, 128]
	ldr	w1, [x19, 84]
	cmp	w3, w1
	bne	.L422
	ldr	w3, [x2, 120]
	ldr	w1, [x19, 76]
	cmp	w3, w1
	bne	.L422
	ldr	w3, [x2, 136]
	ldr	w1, [x19, 92]
	cmp	w3, w1
	bne	.L422
	cmp	w0, 1
	beq	.L424
	sub	w1, w0, #10
	mov	w0, 0
	cmp	w1, 2
	bhi	.L407
	ldr	w0, [x19, 12]
	ldr	w1, [x2, 56]
	ldp	x19, x20, [sp, 16]
	cmp	w1, w0
	csetm	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L422:
	mov	w0, -1
.L407:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L424:
	ldr	w1, [x2, 56]
	ldr	w0, [x19, 12]
	cmp	w1, w0
	bne	.L422
	ldr	w0, [x19, 16]
	ldr	w1, [x2, 60]
	cmp	w1, w0
	csetm	w0, ne
	b	.L407
	.size	VCTRL_CmpConfigParameter, .-VCTRL_CmpConfigParameter
	.align	3
.LC315:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CheckChanWH
	.type	VCTRL_CheckChanWH, %function
VCTRL_CheckChanWH:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, .LC316
	ldr	x2, .LC317
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w2, [x2]
	ldr	w3, [x0, 1324]
	cmp	w3, w2
	bgt	.L426
	ldr	x1, .LC318
	ldr	w3, [x0, 1328]
	mov	w0, 0
	ldr	w1, [x1]
	cmp	w3, w1
	ble	.L427
.L426:
	ldr	w1, [x20, 8]
	mov	w0, 0
	cmp	w1, wzr
	and	w3, w1, -3
	ccmp	w1, 20, 4, ne
	ccmp	w3, 13, 4, ne
	cset	w1, ne
	cbnz	w1, .L431
.L427:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L431:
	ldr	x3, .LC318
	ldr	x1, .LC320
	ldr	w3, [x3]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L427
	.size	VCTRL_CheckChanWH, .-VCTRL_CheckChanWH
	.align	3
.LC316:
	.xword	.LANCHOR0
	.align	3
.LC317:
	.xword	g_ChipMaxWidth
	.align	3
.LC318:
	.xword	g_ChipMaxHeight
	.align	3
.LC320:
	.xword	.LC319
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SeekPts
	.type	VCTRL_SeekPts, %function
VCTRL_SeekPts:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, .LC321
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L438
	ldr	w0, [x0, 608]
	sub	w2, w0, #10
	cmp	w2, 2
	bls	.L439
.L435:
	cmp	w0, 14
	ccmp	w0, 4, 4, ne
	beq	.L437
	mov	x1, x20
	mov	w0, w19
	bl	SM_SeekPts
	cmp	w0, wzr
	csetm	w0, ne
.L434:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L439:
	ldr	x1, .LC324
	ldr	w1, [x1, 1916]
	tbnz	x1, 0, .L435
.L437:
	mov	w0, -1
	b	.L434
.L438:
	ldr	x3, .LC322
	mov	w2, 3180
	ldr	x1, .LC323
	bl	dprint_vfmw
	mov	w0, -1
	b	.L434
	.size	VCTRL_SeekPts, .-VCTRL_SeekPts
	.align	3
.LC321:
	.xword	.LANCHOR0
	.align	3
.LC322:
	.xword	.LC8
	.align	3
.LC323:
	.xword	.LC5
	.align	3
.LC324:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReleaseStream
	.type	VCTRL_ReleaseStream, %function
VCTRL_ReleaseStream:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC325
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L443
	mov	w0, w19
	bl	SM_Reset
	cmp	w0, wzr
	csetm	w0, ne
.L442:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L443:
	ldr	x3, .LC326
	mov	w2, 3588
	ldr	x1, .LC327
	bl	dprint_vfmw
	mov	w0, -1
	b	.L442
	.size	VCTRL_ReleaseStream, .-VCTRL_ReleaseStream
	.align	3
.LC325:
	.xword	.LANCHOR0
	.align	3
.LC326:
	.xword	.LC8
	.align	3
.LC327:
	.xword	.LC5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ImageOutputEnable
	.type	VCTRL_ImageOutputEnable, %function
VCTRL_ImageOutputEnable:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L447
	ldr	x20, .LC330
	mov	w0, 4
	ldr	x1, [x20, 24]
	blr	x1
	ldr	x1, .LC331
	mov	w0, 4
	ldr	w2, [x21]
	ldr	x1, [x1, w19, sxtw 3]
	str	w2, [x1, 12]
	ldr	x1, [x20, 32]
	blr	x1
	mov	w0, 0
.L446:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L447:
	ldr	x3, .LC328
	mov	w2, 3698
	ldr	x1, .LC329
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L446
	.size	VCTRL_ImageOutputEnable, .-VCTRL_ImageOutputEnable
	.align	3
.LC328:
	.xword	.LC204
	.align	3
.LC329:
	.xword	.LC5
	.align	3
.LC330:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC331:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_TryToRelSpecialFrm
	.type	VCTRL_TryToRelSpecialFrm, %function
VCTRL_TryToRelSpecialFrm:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w24, w0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cmp	w24, 31
	bhi	.L482
	ldr	x19, .LC334
	ldr	x3, [x19, w24, sxtw 3]
	cbz	x3, .L483
	add	x0, x3, 331776
	ldr	w1, [x0, 16]
	cbz	w1, .L452
	add	x0, x3, 327680
	mov	w2, 0
	ldr	w0, [x0, 3604]
	cmp	w21, w0
	bne	.L455
	b	.L484
	.p2align 3
.L456:
	add	x0, x3, x0, lsl 4
	ldr	w0, [x0, 3604]
	cmp	w21, w0
	beq	.L453
.L455:
	add	w2, w2, 1
	cmp	w1, w2
	mov	w20, w2
	sxtw	x0, w2
	add	x0, x0, 20480
	bne	.L456
.L452:
	mov	w0, -1
.L475:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L484:
	mov	w20, 0
	.p2align 2
.L453:
	add	x0, x3, 319488
	mov	w23, 1
	add	x0, x0, 896
	ldr	w2, [x0, -100]
	cmp	w2, w21
	bne	.L460
	b	.L485
	.p2align 3
.L457:
	add	w23, w23, 1
	cmp	w23, 32
	beq	.L486
.L460:
	ldr	w2, [x0]
	add	x0, x0, 100
	cmp	w21, w2
	bne	.L457
.L463:
	ldr	x25, .LC335
	sub	w22, w1, #1
	mov	w0, 3
	sxtw	x23, w23
	ldr	x1, [x25, 24]
	blr	x1
	lsl	x0, x23, 2
	ldr	x1, [x19, w24, sxtw 3]
	sub	x0, x0, x23
	ldr	x3, [x25, 32]
	lsl	x2, x0, 5
	add	x2, x0, x2
	mov	w0, 3
	add	x23, x2, x23
	add	x1, x1, x23
	add	x1, x1, 319488
	strb	wzr, [x1, 782]
	strb	wzr, [x1, 3982]
	blr	x3
	cmp	w22, w20
	bls	.L467
	sxtw	x21, w24
	uxtw	x23, w20
	.p2align 2
.L459:
	add	w20, w20, 1
	add	x23, x23, 20480
	add	x0, x23, 225
	ldr	x3, [x19, x21, lsl 3]
	uxtw	x23, w20
	ldr	x4, [x25, 104]
	add	x1, x23, 20480
	mov	x2, 16
	add	x1, x1, 225
	add	x0, x3, x0, lsl 4
	add	x1, x3, x1, lsl 4
	blr	x4
	cmp	w20, w22
	bcc	.L459
.L458:
	uxtw	x0, w22
	ldr	x4, [x19, w24, sxtw 3]
	add	x0, x0, 20480
	ldr	x3, [x25, 96]
	add	x0, x0, 225
	mov	x2, 16
	mov	w1, 0
	add	x0, x4, x0, lsl 4
	blr	x3
	ldr	x1, [x19, w24, sxtw 3]
	mov	w0, 0
	add	x1, x1, 331776
	ldr	w2, [x1, 16]
	sub	w2, w2, #1
	str	w2, [x1, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L486:
	add	x2, x3, 294912
	ldr	x20, .LC336
	ldr	x1, .LC340
	mov	w3, 3855
	add	x20, x20, 152
	mov	w0, 1
	ldrsb	w4, [x2, 2170]
	mov	x2, x20
	bl	dprint_vfmw
	ldr	x7, [x19, w24, sxtw 3]
	add	x0, x7, 294912
	ldrsb	w0, [x0, 2170]
	cmp	w0, wzr
	ble	.L452
	ldr	x22, .LC338
	mov	w23, 0
	sxtw	x21, w24
	.p2align 2
.L462:
	sxtw	x4, w23
	mov	w0, 1
	lsl	x5, x4, 2
	mov	w3, 3858
	sub	x5, x5, x4
	mov	x2, x20
	lsl	x6, x5, 5
	mov	x1, x22
	add	x5, x5, x6
	add	w23, w23, w0
	add	x4, x5, x4
	add	x4, x7, x4
	add	x4, x4, 319488
	ldr	w4, [x4, 796]
	bl	dprint_vfmw
	ldr	x7, [x19, x21, lsl 3]
	add	x0, x7, 294912
	ldrsb	w0, [x0, 2170]
	cmp	w0, w23
	bgt	.L462
	b	.L452
.L485:
	mov	w23, 0
	b	.L463
.L482:
	ldr	x3, .LC332
	mov	w2, 3819
	ldr	x1, .LC333
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L475
.L467:
	mov	w22, w20
	b	.L458
.L483:
	ldr	x3, .LC332
	mov	w2, 3820
	ldr	x1, .LC333
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L475
	.size	VCTRL_TryToRelSpecialFrm, .-VCTRL_TryToRelSpecialFrm
	.align	3
.LC332:
	.xword	.LC204
	.align	3
.LC333:
	.xword	.LC5
	.align	3
.LC334:
	.xword	.LANCHOR0
	.align	3
.LC335:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC336:
	.xword	.LANCHOR1
	.align	3
.LC338:
	.xword	.LC337
	.align	3
.LC340:
	.xword	.LC339
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanImage
	.type	VCTRL_GetChanImage, %function
VCTRL_GetChanImage:
	sub	sp, sp, #672
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, .LC343
	mov	w2, w19
	mov	w0, 2
	bl	dprint_vfmw
	cmp	w19, 31
	bhi	.L515
	ldr	x21, .LC346
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L516
	ldr	w0, [x0, 4]
	cmp	w0, 1
	bne	.L517
	ldr	x23, .LC350
	mov	w0, 4
	ldr	x1, [x23, 24]
	blr	x1
	ldr	x0, [x21, w19, sxtw 3]
	ldr	w1, [x0, 12]
	cmp	w1, 1
	bne	.L518
	add	x0, x0, 331776
	mov	x1, x20
	add	x0, x0, 72
	mov	w22, -1
	bl	SYNTAX_ReceiveImage
	cmp	w0, 1
	mov	w24, w0
	beq	.L519
.L493:
	mov	w0, 12
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L504
.L502:
	cbz	w22, .L505
	ldr	x1, [x21, w19, sxtw 3]
	mov	w0, 4
	ldr	x2, [x23, 32]
	add	x1, x1, 344064
	ldrb	w1, [x1, 3616]
	strb	w1, [x20, 508]
	blr	x2
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 672
	ret
	.p2align 3
.L519:
	ldr	w0, [x20, 224]
	str	w22, [x20, 220]
	cmp	w0, 1
	beq	.L520
.L494:
	mov	w0, 12
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L521
.L505:
	ldr	x1, [x21, w19, sxtw 3]
	mov	w0, 4
	ldr	w4, [x20, 124]
	mov	w22, 0
	add	x3, x1, 344064
	ldr	x2, [x23, 32]
	str	w4, [x1, 432]
	ldr	w4, [x20, 392]
	str	w4, [x1, 436]
	ldrb	w1, [x3, 3616]
	strb	w1, [x20, 508]
	blr	x2
	mov	x1, x20
	mov	w0, w19
	bl	YUV_WriteYuv
.L513:
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	mov	w0, w22
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 672
	ret
	.p2align 3
.L521:
	mov	w22, 0
.L504:
	ldr	x0, [x23]
	blr	x0
	mov	w3, w0
	ldr	x1, .LC360
	ldr	x0, .LC361
	add	x1, x1, 1920
	ldr	w2, [x0]
	ldr	w0, [x1, w19, sxtw 2]
	sub	w0, w3, w0
	cmp	w0, w2
	bls	.L502
	lsl	w2, w19, 24
	ldr	x0, .LC351
	cmp	w24, 1
	add	w2, w2, 786432
	str	w3, [x1, w19, sxtw 2]
	csinc	w2, w2, w2, ne
	add	x0, x0, 208
	mov	w1, 4127
	bl	DBG_AddTrace
	b	.L502
	.p2align 3
.L520:
	ldr	w0, [x20, 212]
	cbz	w0, .L522
	ldp	w1, w2, [x20, 28]
	mov	w0, 3
	str	w24, [x20, 212]
	str	w22, [x20, 220]
	stp	w1, w2, [x20, 228]
	str	w0, [x20, 392]
	b	.L494
	.p2align 3
.L517:
	ldr	x3, .LC349
	mov	w2, 3991
	ldr	x1, .LC345
	mov	w0, 0
	mov	w22, -1
	bl	dprint_vfmw
	b	.L513
	.p2align 3
.L518:
	ldr	x1, [x23, 32]
	mov	w0, 4
	mov	w22, -1
	blr	x1
	ldr	x2, .LC351
	mov	w0, 0
	ldr	x1, .LC353
	add	x2, x2, 184
	bl	dprint_vfmw
	b	.L513
	.p2align 3
.L522:
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x29, 72
	add	x0, x0, 331776
	add	x0, x0, 72
	bl	SYNTAX_ReceiveImage
	cmp	w0, 1
	bne	.L523
	ldr	w0, [x20, 216]
	ldr	w1, [x29, 288]
	cmp	w0, w1
	bge	.L497
	ldp	w0, w4, [x29, 100]
	ldp	w3, w2, [x29, 108]
	ldr	w1, [x29, 252]
	ldr	w22, [x29, 284]
	stp	w0, w4, [x20, 228]
	str	w1, [x20, 220]
	mov	w0, 3
	stp	w3, w2, [x20, 236]
	str	w0, [x20, 392]
	cbz	w22, .L493
	mov	w24, 1
	mov	w22, 0
	str	w24, [x20, 212]
	b	.L493
	.p2align 3
.L515:
	ldr	x3, .LC344
	mov	w2, 3987
	ldr	x1, .LC345
	mov	w0, 0
	mov	w22, -1
	bl	dprint_vfmw
	b	.L513
	.p2align 3
.L523:
	ldr	x1, [x21, w19, sxtw 3]
	mov	w22, w0
	add	x0, x1, 331776
	add	x0, x0, 72
	bl	SYNTAX_ReturnImage
	ldr	x1, [x23, 32]
	mov	w0, 4
	blr	x1
	b	.L513
.L497:
	bgt	.L524
	cbnz	w0, .L500
	ldr	x0, [x21, w19, sxtw 3]
	mov	w22, -1
	mov	w24, -2
	add	x0, x0, 331776
	add	x0, x0, 72
	bl	SYNTAX_ReturnImage
	ldr	x0, [x21, w19, sxtw 3]
	mov	x1, x20
	add	x0, x0, 331776
	add	x0, x0, 72
	bl	SYNTAX_ReleaseImage
	ldr	x2, .LC351
	mov	w0, 1
	ldr	x1, .LC357
	ldr	w3, [x20, 216]
	add	x2, x2, 184
	bl	dprint_vfmw
	b	.L493
.L500:
	ldr	x0, [x21, w19, sxtw 3]
	mov	x1, x20
	add	x0, x0, 331776
	add	x0, x0, 72
	bl	SYNTAX_ReleaseImage
	ldr	w0, [x29, 284]
	cbz	w0, .L525
	ldr	x2, .LC351
	mov	w0, 1
	ldr	x1, .LC359
	ldr	w3, [x20, 216]
	add	x2, x2, 184
	bl	dprint_vfmw
	ldr	x3, [x23, 104]
	mov	x2, 664
	add	x1, x29, 72
	mov	x0, x20
	blr	x3
	ldp	w3, w4, [x29, 100]
	mov	w2, -1
	mov	w1, 3
	mov	w0, 1
	str	w2, [x20, 220]
	str	w0, [x20, 212]
	stp	w3, w4, [x20, 228]
	str	w1, [x20, 392]
	b	.L494
.L516:
	ldr	x3, .LC347
	mov	w2, 3988
	ldr	x1, .LC345
	mov	w22, -1
	bl	dprint_vfmw
	b	.L513
.L524:
	ldr	x0, [x21, w19, sxtw 3]
	mov	w22, -1
	mov	w24, -2
	add	x0, x0, 331776
	add	x0, x0, 72
	bl	SYNTAX_ReturnImage
	ldr	x0, [x21, w19, sxtw 3]
	mov	x1, x20
	add	x0, x0, 331776
	add	x0, x0, 72
	bl	SYNTAX_ReleaseImage
	ldr	x2, .LC351
	mov	w0, 1
	ldr	x1, .LC355
	ldr	w3, [x20, 216]
	add	x2, x2, 184
	ldr	w4, [x29, 288]
	bl	dprint_vfmw
	b	.L493
.L525:
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x29, 72
	mov	w22, -1
	mov	w24, -2
	add	x0, x0, 331776
	add	x0, x0, 72
	bl	SYNTAX_ReleaseImage
	ldr	x2, .LC351
	mov	w0, 1
	ldr	x1, .LC359
	ldr	w3, [x20, 216]
	add	x2, x2, 184
	bl	dprint_vfmw
	b	.L493
	.size	VCTRL_GetChanImage, .-VCTRL_GetChanImage
	.align	3
.LC343:
	.xword	.LC342
	.align	3
.LC344:
	.xword	.LC204
	.align	3
.LC345:
	.xword	.LC5
	.align	3
.LC346:
	.xword	.LANCHOR0
	.align	3
.LC347:
	.xword	.LC8
	.align	3
.LC349:
	.xword	.LC348
	.align	3
.LC350:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC351:
	.xword	.LANCHOR1
	.align	3
.LC353:
	.xword	.LC352
	.align	3
.LC355:
	.xword	.LC354
	.align	3
.LC357:
	.xword	.LC356
	.align	3
.LC359:
	.xword	.LC358
	.align	3
.LC360:
	.xword	.LANCHOR3
	.align	3
.LC361:
	.xword	g_TraceImgPeriod
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReleaseChanImage
	.type	VCTRL_ReleaseChanImage, %function
VCTRL_ReleaseChanImage:
	sub	sp, sp, #672
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L547
	ldr	x21, .LC365
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L548
	ldr	w0, [x0, 4]
	cmp	w0, 1
	bne	.L549
	cbz	x20, .L550
	ldr	x1, .LC371
	mov	w2, w19
	ldr	w3, [x20, 180]
	mov	w0, 2
	bl	dprint_vfmw
	ldr	x22, .LC372
	mov	w0, 4
	ldr	x1, [x22, 24]
	blr	x1
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L551
	ldr	w0, [x0, 4]
	cmp	w0, 1
	bne	.L552
	ldr	w1, [x20, 28]
	mov	w0, w19
	bl	VCTRL_TryToRelSpecialFrm
	cbz	w0, .L553
	ldr	x0, [x21, w19, sxtw 3]
	mov	x1, x20
	add	x0, x0, 331776
	add	x0, x0, 72
	bl	SYNTAX_ReleaseImage
	mov	w23, w0
	ldr	w2, [x20, 220]
	cmn	w2, #1
	beq	.L535
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x29, 72
	str	w2, [x29, 252]
	add	x0, x0, 331776
	add	x0, x0, 72
	bl	SYNTAX_ReleaseImage
	mov	w23, w0
.L535:
	mov	w0, 13
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L554
.L537:
	cmp	w23, 1
	csetm	w19, ne
	cbnz	w19, .L555
.L539:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
.L528:
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 672
	ret
	.p2align 3
.L553:
	ldr	x1, [x22, 32]
	mov	w0, 4
	mov	w19, 0
	blr	x1
	ldr	x1, .LC378
	mov	w2, 4214
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x21, x22, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 672
	ret
	.p2align 3
.L555:
	ldr	x2, .LC381
	mov	w0, 0
	ldr	x1, .LC383
	add	x2, x2, 256
	bl	dprint_vfmw
	b	.L539
	.p2align 3
.L554:
	ldr	x0, [x22]
	blr	x0
	mov	w4, w0
	ldr	x3, .LC379
	ldr	x0, .LC380
	add	x3, x3, 2048
	ldr	w1, [x0]
	ldr	w0, [x3, w19, sxtw 2]
	sub	w0, w4, w0
	cmp	w0, w1
	bls	.L537
	lsl	w2, w19, 24
	ldr	x0, .LC381
	cmp	w23, 1
	add	w2, w2, 851968
	csinc	w2, w2, w2, ne
	mov	w1, 4248
	add	x0, x0, 232
	str	w4, [x3, w19, sxtw 2]
	bl	DBG_AddTrace
	b	.L537
	.p2align 3
.L552:
	ldr	x1, .LC376
	mov	w2, 4202
	mov	w0, 0
.L546:
	bl	dprint_vfmw
	mov	w19, -1
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	b	.L528
	.p2align 3
.L549:
	ldr	x3, .LC367
	mov	w2, 4185
	ldr	x1, .LC364
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L528
	.p2align 3
.L547:
	ldr	x3, .LC363
	mov	w2, 4183
	ldr	x1, .LC364
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L528
.L550:
	ldr	x3, .LC369
	mov	w2, 4186
	ldr	x1, .LC364
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L528
.L548:
	ldr	x3, .LC366
	mov	w2, 4184
	ldr	x1, .LC364
	mov	w19, -1
	bl	dprint_vfmw
	b	.L528
.L551:
	ldr	x1, .LC374
	mov	w2, 4193
	b	.L546
	.size	VCTRL_ReleaseChanImage, .-VCTRL_ReleaseChanImage
	.align	3
.LC363:
	.xword	.LC204
	.align	3
.LC364:
	.xword	.LC5
	.align	3
.LC365:
	.xword	.LANCHOR0
	.align	3
.LC366:
	.xword	.LC8
	.align	3
.LC367:
	.xword	.LC348
	.align	3
.LC369:
	.xword	.LC368
	.align	3
.LC371:
	.xword	.LC370
	.align	3
.LC372:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC374:
	.xword	.LC373
	.align	3
.LC376:
	.xword	.LC375
	.align	3
.LC378:
	.xword	.LC377
	.align	3
.LC379:
	.xword	.LANCHOR3
	.align	3
.LC380:
	.xword	g_TraceImgPeriod
	.align	3
.LC381:
	.xword	.LANCHOR1
	.align	3
.LC383:
	.xword	.LC382
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetVidStd
	.type	VCTRL_GetVidStd, %function
VCTRL_GetVidStd:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L557
	ldr	x0, .LC385
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L557
	ldr	w1, [x0, 4]
	cmp	w1, 1
	beq	.L560
	ldr	x1, .LC389
	mov	w3, w19
	mov	w2, 4281
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 21
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L557:
	ldr	x1, .LC387
	mov	w2, 4274
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 21
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L560:
	ldr	w0, [x0, 608]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetVidStd, .-VCTRL_GetVidStd
	.align	3
.LC385:
	.xword	.LANCHOR0
	.align	3
.LC387:
	.xword	.LC386
	.align	3
.LC389:
	.xword	.LC388
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetHDRConfigInfo
	.type	VCTRL_GetHDRConfigInfo, %function
VCTRL_GetHDRConfigInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x0, .LC390
	ldr	x1, [x0, w20, sxtw 3]
	ldrb	w1, [x1, 44]
	strb	w1, [x19, 65]
	ldr	x1, [x0, w20, sxtw 3]
	ldrb	w1, [x1, 46]
	strb	w1, [x19, 66]
	ldr	x1, [x0, w20, sxtw 3]
	ldr	w1, [x1, 172]
	str	w1, [x19, 76]
	ldr	x1, [x0, w20, sxtw 3]
	ldr	w1, [x1, 176]
	str	w1, [x19, 68]
	ldr	x0, [x0, w20, sxtw 3]
	ldr	w0, [x0, 180]
	str	w0, [x19, 72]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetHDRConfigInfo, .-VCTRL_GetHDRConfigInfo
	.align	3
.LC390:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetDecParam
	.type	VCTRL_GetDecParam, %function
VCTRL_GetDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L584
	ldr	x0, .LC391
	ldr	x20, [x0, w19, sxtw 3]
	cbz	x20, .L584
	ldr	w0, [x20, 4]
	mov	x1, 0
	cmp	w0, 1
	bne	.L563
	ldr	w0, [x20, 8]
	cmp	w0, 1
	bne	.L563
	ldr	w3, [x20, 608]
	cmp	w3, 17
	bls	.L585
.L564:
	ldr	x2, .LC393
	mov	w0, 0
	ldr	x1, .LC395
	add	x2, x2, 280
	bl	dprint_vfmw
	mov	x1, 0
	b	.L563
	.p2align 3
.L584:
	mov	x1, 0
.L563:
	mov	x0, x1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L585:
	ldr	x0, .LC392
	ldrb	w0, [x0,w3,uxtw]
	adr	x1, .Lrtx566
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx566:
	.section	.rodata
	.align	0
	.align	2
.L566:
	.byte	(.L565 - .Lrtx566) / 4
	.byte	(.L574 - .Lrtx566) / 4
	.byte	(.L568 - .Lrtx566) / 4
	.byte	(.L574 - .Lrtx566) / 4
	.byte	(.L564 - .Lrtx566) / 4
	.byte	(.L574 - .Lrtx566) / 4
	.byte	(.L571 - .Lrtx566) / 4
	.byte	(.L564 - .Lrtx566) / 4
	.byte	(.L574 - .Lrtx566) / 4
	.byte	(.L574 - .Lrtx566) / 4
	.byte	(.L574 - .Lrtx566) / 4
	.byte	(.L574 - .Lrtx566) / 4
	.byte	(.L574 - .Lrtx566) / 4
	.byte	(.L574 - .Lrtx566) / 4
	.byte	(.L564 - .Lrtx566) / 4
	.byte	(.L576 - .Lrtx566) / 4
	.byte	(.L577 - .Lrtx566) / 4
	.byte	(.L574 - .Lrtx566) / 4
	.text
	.p2align 3
.L574:
	add	x0, x20, 331776
	ldr	x19, [x0, 88]
.L579:
	cbz	x19, .L584
	ldr	x0, .LC396
	ldr	x0, [x0]
	blr	x0
	str	w0, [x20, 40]
	mov	x1, x19
	mov	x0, x1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L576:
	add	x0, x20, 331776
	ldr	x19, [x0, 312]
	b	.L579
	.p2align 3
.L568:
	add	x0, x20, 331776
	ldr	x19, [x0, 1120]
	b	.L579
	.p2align 3
.L577:
	add	x0, x20, 331776
	ldr	x19, [x0, 2464]
	b	.L579
	.p2align 3
.L565:
	add	x0, x20, 331776
	ldr	x19, [x0, 696]
	b	.L579
	.p2align 3
.L571:
	add	x0, x20, 331776
	ldr	x19, [x0, 104]
	b	.L579
	.size	VCTRL_GetDecParam, .-VCTRL_GetDecParam
	.align	3
.LC391:
	.xword	.LANCHOR0
	.align	3
.LC392:
	.xword	.L566
	.align	3
.LC393:
	.xword	.LANCHOR1
	.align	3
.LC395:
	.xword	.LC394
	.align	3
.LC396:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsSedOnlyMode
	.type	VCTRL_IsSedOnlyMode, %function
VCTRL_IsSedOnlyMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L594
	cbz	w20, .L589
	cmp	w20, 16
	beq	.L590
	mov	w0, 0
.L588:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L590:
	ldr	w0, [x19, 5332]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	uxtb	w0, w0
	ret
	.p2align 3
.L589:
	ldrb	w0, [x19, 1332]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L594:
	ldr	x1, .LC398
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L588
	.size	VCTRL_IsSedOnlyMode, .-VCTRL_IsSedOnlyMode
	.align	3
.LC398:
	.xword	.LC397
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ChanDecparamInValidFlag
	.type	VCTRL_ChanDecparamInValidFlag, %function
VCTRL_ChanDecparamInValidFlag:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L596
	ldr	x21, .LC399
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L596
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L599
	ldr	w22, [x0, 8]
	cmp	w22, 1
	beq	.L600
.L599:
	ldr	x1, .LC403
	mov	w2, w19
	mov	w0, 22
	mov	w20, 0
	bl	dprint_vfmw
.L598:
	mov	w0, w20
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L596:
	ldr	x1, .LC401
	mov	w3, w19
	mov	w2, 4468
	mov	w0, 22
	mov	w20, 0
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L600:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L605
	ldr	x0, [x21, w19, sxtw 3]
	mov	w20, 0
	str	wzr, [x0, 452]
	str	wzr, [x0, 456]
	b	.L598
	.p2align 3
.L605:
	ldr	x23, [x21, w19, sxtw 3]
	ldr	x0, .LC404
	ldr	w20, [x23, 452]
	cbz	w20, .L606
	ldr	x0, [x0]
	blr	x0
	ldr	x1, [x21, w19, sxtw 3]
	ldr	w2, [x1, 456]
	cmp	w0, w2
	bls	.L603
	sub	w0, w0, w2
	mov	w20, 0
	cmp	w0, 40
	bls	.L598
.L603:
	mov	w20, w22
	str	wzr, [x1, 452]
	str	wzr, [x1, 456]
	b	.L598
.L606:
	ldr	x0, [x0]
	str	w22, [x23, 452]
	blr	x0
	str	w0, [x23, 456]
	b	.L598
	.size	VCTRL_ChanDecparamInValidFlag, .-VCTRL_ChanDecparamInValidFlag
	.align	3
.LC399:
	.xword	.LANCHOR0
	.align	3
.LC401:
	.xword	.LC400
	.align	3
.LC403:
	.xword	.LC402
	.align	3
.LC404:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ClearDecparam
	.type	VCTRL_ClearDecparam, %function
VCTRL_ClearDecparam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC405
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w1, [x0, 608]
	cmp	w1, 17
	bhi	.L607
	ldr	x2, .LC406
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx610
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx610:
	.section	.rodata
	.align	0
	.align	2
.L610:
	.byte	(.L609 - .Lrtx610) / 4
	.byte	(.L619 - .Lrtx610) / 4
	.byte	(.L612 - .Lrtx610) / 4
	.byte	(.L619 - .Lrtx610) / 4
	.byte	(.L607 - .Lrtx610) / 4
	.byte	(.L619 - .Lrtx610) / 4
	.byte	(.L615 - .Lrtx610) / 4
	.byte	(.L607 - .Lrtx610) / 4
	.byte	(.L619 - .Lrtx610) / 4
	.byte	(.L619 - .Lrtx610) / 4
	.byte	(.L619 - .Lrtx610) / 4
	.byte	(.L619 - .Lrtx610) / 4
	.byte	(.L619 - .Lrtx610) / 4
	.byte	(.L619 - .Lrtx610) / 4
	.byte	(.L607 - .Lrtx610) / 4
	.byte	(.L620 - .Lrtx610) / 4
	.byte	(.L621 - .Lrtx610) / 4
	.byte	(.L619 - .Lrtx610) / 4
	.text
	.p2align 3
.L619:
	add	x0, x0, 331776
	str	xzr, [x0, 88]
.L607:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L615:
	add	x0, x0, 331776
	str	xzr, [x0, 104]
	b	.L607
	.p2align 3
.L609:
	add	x0, x0, 331776
	str	xzr, [x0, 696]
	b	.L607
	.p2align 3
.L621:
	add	x0, x0, 331776
	str	xzr, [x0, 2464]
	b	.L607
	.p2align 3
.L612:
	add	x0, x0, 331776
	str	xzr, [x0, 1120]
	b	.L607
	.p2align 3
.L620:
	add	x0, x0, 331776
	str	xzr, [x0, 312]
	b	.L607
	.size	VCTRL_ClearDecparam, .-VCTRL_ClearDecparam
	.align	3
.LC405:
	.xword	.LANCHOR0
	.align	3
.LC406:
	.xword	.L610
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_VdmProcSedOnly
	.type	VCTRL_VdmProcSedOnly, %function
VCTRL_VdmProcSedOnly:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	cmp	w19, 31
	bhi	.L633
	ldr	x20, .LC410
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L634
	ldr	w0, [x0, 8]
	cmp	w0, 1
	beq	.L627
	ldr	x3, .LC413
	mov	w2, 4887
	ldr	x1, .LC409
	mov	w0, 0
	bl	dprint_vfmw
.L623:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L627:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L623
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w1, [x0, 608]
	cbz	w1, .L628
	cmp	w1, 16
	bne	.L623
	add	x0, x0, 331776
	mov	w1, w21
	add	x0, x0, 80
	bl	HEVCDEC_VDMProcSedOnly
	b	.L623
	.p2align 3
.L633:
	ldr	x3, .LC408
	mov	w2, 4885
	ldr	x1, .LC409
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L628:
	add	x0, x0, 331776
	mov	w1, w21
	add	x0, x0, 80
	bl	H264DEC_VDMProcSedOnly
	b	.L623
	.p2align 3
.L634:
	ldr	x3, .LC411
	mov	w2, 4886
	ldr	x1, .LC409
	bl	dprint_vfmw
	b	.L623
	.size	VCTRL_VdmProcSedOnly, .-VCTRL_VdmProcSedOnly
	.align	3
.LC408:
	.xword	.LC407
	.align	3
.LC409:
	.xword	.LC5
	.align	3
.LC410:
	.xword	.LANCHOR0
	.align	3
.LC411:
	.xword	.LC348
	.align	3
.LC413:
	.xword	.LC412
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_FlushDecoder
	.type	VCTRL_FlushDecoder, %function
VCTRL_FlushDecoder:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC414
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L662
	add	x0, x0, 331776
	ldr	w1, [x0, 72]
	cmp	w1, 17
	bls	.L663
.L655:
	mov	w0, 0
.L637:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L663:
	ldr	x2, .LC417
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx639
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx639:
	.section	.rodata
	.align	0
	.align	2
.L639:
	.byte	(.L638 - .Lrtx639) / 4
	.byte	(.L640 - .Lrtx639) / 4
	.byte	(.L641 - .Lrtx639) / 4
	.byte	(.L642 - .Lrtx639) / 4
	.byte	(.L655 - .Lrtx639) / 4
	.byte	(.L643 - .Lrtx639) / 4
	.byte	(.L644 - .Lrtx639) / 4
	.byte	(.L655 - .Lrtx639) / 4
	.byte	(.L645 - .Lrtx639) / 4
	.byte	(.L646 - .Lrtx639) / 4
	.byte	(.L647 - .Lrtx639) / 4
	.byte	(.L647 - .Lrtx639) / 4
	.byte	(.L647 - .Lrtx639) / 4
	.byte	(.L648 - .Lrtx639) / 4
	.byte	(.L655 - .Lrtx639) / 4
	.byte	(.L649 - .Lrtx639) / 4
	.byte	(.L650 - .Lrtx639) / 4
	.byte	(.L651 - .Lrtx639) / 4
	.text
	.p2align 3
.L651:
	add	x0, x0, 80
	bl	VP9DEC_GetRemainImg
	mov	w0, 0
	b	.L637
	.p2align 3
.L650:
	add	x0, x0, 80
	bl	HEVC_FlushOutputFrmFromDPB
	cbnz	w0, .L664
.L653:
	ldr	x1, .LC421
	mov	w0, 32
	bl	dprint_vfmw
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	mov	w0, 0
	b	.L637
	.p2align 3
.L649:
	add	x0, x0, 80
	bl	MVC_FlushDecoder
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	ldr	x0, [x19, w20, sxtw 3]
	mov	w1, -1
	add	x0, x0, 331776
	add	x0, x0, 80
	bl	MVC_FlushDPB
	cbz	w0, .L655
	ldr	x2, .LC422
	mov	w3, 4976
	ldr	x1, .LC424
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 0
	b	.L637
	.p2align 3
.L648:
	add	x0, x0, 80
	bl	VP8DEC_GetRemainImg
	mov	w0, 0
	b	.L637
	.p2align 3
.L647:
	add	x0, x0, 80
	bl	VP6DEC_GetRemainImg
	mov	w0, 0
	b	.L637
	.p2align 3
.L646:
	add	x0, x0, 80
	bl	REAL9DEC_GetRemainImg
	mov	w0, 0
	b	.L637
	.p2align 3
.L645:
	add	x0, x0, 80
	bl	REAL8DEC_GetRemainImg
	mov	w0, 0
	b	.L637
	.p2align 3
.L644:
	add	x0, x0, 80
	bl	AVSDEC_GetRemainImg
	mov	w0, 0
	b	.L637
	.p2align 3
.L643:
	add	x0, x0, 80
	bl	DIVX3DEC_GetRemainImg
	mov	w0, 0
	b	.L637
	.p2align 3
.L642:
	add	x0, x0, 80
	bl	MPEG2DEC_GetRemainImg
	mov	w0, 0
	b	.L637
	.p2align 3
.L641:
	add	x0, x0, 80
	bl	MPEG4DEC_GetRemainImg
	mov	w0, 0
	b	.L637
	.p2align 3
.L640:
	add	x0, x0, 80
	bl	VC1DEC_GetRemainImg
	mov	w0, 0
	b	.L637
	.p2align 3
.L638:
	add	x0, x0, 80
	bl	H264_FlushDecoder
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	ldr	x0, [x19, w20, sxtw 3]
	add	x0, x0, 331776
	add	x0, x0, 80
	bl	FlushDPB
	cbz	w0, .L655
	ldr	x1, .LC419
	mov	w2, 4943
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 0
	b	.L637
	.p2align 3
.L664:
	ldr	x1, .LC419
	mov	w2, 4953
	mov	w0, 0
	bl	dprint_vfmw
	b	.L653
.L662:
	ldr	x3, .LC415
	mov	w2, 4917
	ldr	x1, .LC416
	bl	dprint_vfmw
	mov	w0, -1
	b	.L637
	.size	VCTRL_FlushDecoder, .-VCTRL_FlushDecoder
	.align	3
.LC414:
	.xword	.LANCHOR0
	.align	3
.LC415:
	.xword	.LC8
	.align	3
.LC416:
	.xword	.LC5
	.align	3
.LC417:
	.xword	.L639
	.align	3
.LC419:
	.xword	.LC418
	.align	3
.LC421:
	.xword	.LC420
	.align	3
.LC422:
	.xword	.LANCHOR4
	.align	3
.LC424:
	.xword	.LC423
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetImageBuffer
	.type	VCTRL_GetImageBuffer, %function
VCTRL_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L688
	ldr	x0, .LC427
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L689
	ldr	w0, [x1, 8]
	cmp	w0, 1
	bne	.L690
	ldr	w2, [x1, 608]
	cmp	w2, 17
	bls	.L691
.L684:
	mov	w0, 0
	b	.L667
	.p2align 3
.L691:
	ldr	x3, .LC430
	ldrb	w2, [x3,w2,uxtw]
	adr	x3, .Lrtx671
	add	x2, x3, w2, sxtb #2
	br	x2
.Lrtx671:
	.section	.rodata
	.align	0
	.align	2
.L671:
	.byte	(.L670 - .Lrtx671) / 4
	.byte	(.L672 - .Lrtx671) / 4
	.byte	(.L673 - .Lrtx671) / 4
	.byte	(.L674 - .Lrtx671) / 4
	.byte	(.L684 - .Lrtx671) / 4
	.byte	(.L675 - .Lrtx671) / 4
	.byte	(.L676 - .Lrtx671) / 4
	.byte	(.L684 - .Lrtx671) / 4
	.byte	(.L677 - .Lrtx671) / 4
	.byte	(.L678 - .Lrtx671) / 4
	.byte	(.L679 - .Lrtx671) / 4
	.byte	(.L679 - .Lrtx671) / 4
	.byte	(.L679 - .Lrtx671) / 4
	.byte	(.L680 - .Lrtx671) / 4
	.byte	(.L684 - .Lrtx671) / 4
	.byte	(.L681 - .Lrtx671) / 4
	.byte	(.L682 - .Lrtx671) / 4
	.byte	(.L683 - .Lrtx671) / 4
	.text
	.p2align 3
.L683:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	VP9DEC_GetImageBuffer
.L667:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L682:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	HEVCDEC_GetImageBuffer
	b	.L667
	.p2align 3
.L681:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	MVC_DEC_GetImageBuffer
	b	.L667
	.p2align 3
.L680:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	VP8DEC_GetImageBuffer
	b	.L667
	.p2align 3
.L679:
	ldr	x2, .LC431
	ldr	w2, [x2, 1916]
	tbz	x2, 0, .L667
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	VP6DEC_GetImageBuffer
	b	.L667
	.p2align 3
.L678:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	REAL9DEC_GetImageBuffer
	b	.L667
	.p2align 3
.L677:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	REAL8DEC_GetImageBuffer
	b	.L667
	.p2align 3
.L676:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	AVSDEC_GetImageBuffer
	b	.L667
	.p2align 3
.L675:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	DIVX3DEC_GetImageBuffer
	b	.L667
	.p2align 3
.L674:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	MPEG2DEC_GetImageBuffer
	b	.L667
	.p2align 3
.L673:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	MPEG4DEC_GetImageBuffer
	b	.L667
	.p2align 3
.L672:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	VC1DEC_GetImageBuffer
	b	.L667
	.p2align 3
.L670:
	add	x0, x1, 331776
	add	x0, x0, 80
	bl	H264DEC_GetImageBuffer
	b	.L667
	.p2align 3
.L690:
	ldr	x3, .LC429
	mov	w2, 5046
	ldr	x1, .LC426
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L667
	.p2align 3
.L688:
	ldr	x3, .LC425
	mov	w2, 5044
	ldr	x1, .LC426
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L667
.L689:
	ldr	x3, .LC428
	mov	w2, 5045
	ldr	x1, .LC426
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L667
	.size	VCTRL_GetImageBuffer, .-VCTRL_GetImageBuffer
	.align	3
.LC425:
	.xword	.LC407
	.align	3
.LC426:
	.xword	.LC5
	.align	3
.LC427:
	.xword	.LANCHOR0
	.align	3
.LC428:
	.xword	.LC348
	.align	3
.LC429:
	.xword	.LC412
	.align	3
.LC430:
	.xword	.L671
	.align	3
.LC431:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigFFFBSpeed
	.type	VCTRL_ConfigFFFBSpeed, %function
VCTRL_ConfigFFFBSpeed:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L698
	ldr	x0, .LC434
	ldr	x2, [x0, w19, sxtw 3]
	cbz	x2, .L699
	ldr	w0, [x2, 4]
	cmp	w0, 1
	bne	.L700
	cbz	x20, .L701
	ldr	w1, [x20]
	mov	w0, 0
	str	w1, [x2, 1260]
.L694:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L700:
	ldr	x3, .LC438
	mov	w2, 5169
	ldr	x1, .LC433
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L694
	.p2align 3
.L698:
	ldr	x3, .LC432
	mov	w2, 5167
	ldr	x1, .LC433
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L694
.L699:
	ldr	x3, .LC436
	mov	w2, 5168
	ldr	x1, .LC433
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L694
.L701:
	ldr	x3, .LC440
	mov	w2, 5170
	ldr	x1, .LC433
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L694
	.size	VCTRL_ConfigFFFBSpeed, .-VCTRL_ConfigFFFBSpeed
	.align	3
.LC432:
	.xword	.LC204
	.align	3
.LC433:
	.xword	.LC5
	.align	3
.LC434:
	.xword	.LANCHOR0
	.align	3
.LC436:
	.xword	.LC435
	.align	3
.LC438:
	.xword	.LC437
	.align	3
.LC440:
	.xword	.LC439
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigPVRInfo
	.type	VCTRL_ConfigPVRInfo, %function
VCTRL_ConfigPVRInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L708
	ldr	x0, .LC443
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L709
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L710
	cbz	x20, .L711
	ldr	x3, .LC447
	mov	x2, 20
	mov	x1, x20
	add	x0, x0, 1292
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L704:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L710:
	ldr	x3, .LC445
	mov	w2, 5182
	ldr	x1, .LC442
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L704
	.p2align 3
.L708:
	ldr	x3, .LC441
	mov	w2, 5180
	ldr	x1, .LC442
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L704
.L711:
	ldr	x3, .LC446
	mov	w2, 5183
	ldr	x1, .LC442
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L704
.L709:
	ldr	x3, .LC444
	mov	w2, 5181
	ldr	x1, .LC442
	bl	dprint_vfmw
	mov	w0, -1
	b	.L704
	.size	VCTRL_ConfigPVRInfo, .-VCTRL_ConfigPVRInfo
	.align	3
.LC441:
	.xword	.LC204
	.align	3
.LC442:
	.xword	.LC5
	.align	3
.LC443:
	.xword	.LANCHOR0
	.align	3
.LC444:
	.xword	.LC435
	.align	3
.LC445:
	.xword	.LC437
	.align	3
.LC446:
	.xword	.LC439
	.align	3
.LC447:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsChanDecable
	.type	VCTRL_IsChanDecable, %function
VCTRL_IsChanDecable:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC448
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L715
	add	x1, x29, 40
	mov	w0, w19
	bl	SM_GetInfo
	cbnz	w0, .L715
	ldr	w0, [x29, 48]
	cmp	w0, 16
	bgt	.L716
	ldr	w0, [x29, 56]
	cmp	w0, 524288
	ble	.L715
.L716:
	mov	w0, w19
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	csetm	w0, ne
	cbnz	w0, .L714
	ldr	x0, .LC449
	ldr	x0, [x0]
	blr	x0
	ldr	x1, [x20, w19, sxtw 3]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x1, 40]
	ldp	x29, x30, [sp], 64
	sub	w0, w0, w1
	cmp	w0, 50
	csetm	w0, hi
	ret
	.p2align 3
.L715:
	mov	w0, -1
.L714:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.size	VCTRL_IsChanDecable, .-VCTRL_IsChanDecable
	.align	3
.LC448:
	.xword	.LANCHOR0
	.align	3
.LC449:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsChanSegEnough
	.type	VCTRL_IsChanSegEnough, %function
VCTRL_IsChanSegEnough:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC450
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 440]
	cmp	w0, 1
	cset	w0, ne
	ret
	.size	VCTRL_IsChanSegEnough, .-VCTRL_IsChanSegEnough
	.align	3
.LC450:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsChanActive
	.type	VCTRL_IsChanActive, %function
VCTRL_IsChanActive:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L725
	ldr	x0, .LC451
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L725
	ldr	w1, [x0, 4]
	cbz	w1, .L725
	ldr	w1, [x0, 8]
	cbz	w1, .L725
	ldr	w1, [x0, 20]
	cbz	w1, .L725
	ldr	w0, [x0, 608]
	ldr	x19, [sp, 16]
	cmp	w0, 21
	csetm	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L725:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IsChanActive, .-VCTRL_IsChanActive
	.align	3
.LC451:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	USERDEC_Init
	.type	USERDEC_Init, %function
USERDEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x3, .LC452
	mov	x2, 624
	mov	w1, 0
	mov	x0, x19
	ldr	w21, [x19, 608]
	ldr	x3, [x3, 96]
	blr	x3
	str	w21, [x19, 608]
	add	x0, x19, 8
	bl	ResetVoQueue
	str	x20, [x19]
	ldr	x3, .LC453
	mov	x0, 0
	b	.L729
	.p2align 3
.L727:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L741
.L729:
	ldr	x2, [x3, x0, lsl 3]
	add	x1, x2, 331776
	add	x1, x1, 80
	cbz	x2, .L727
	cmp	x19, x1
	bne	.L727
	cmn	w0, #1
	str	w0, [x19, 616]
	mov	w0, 1
	beq	.L732
.L736:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L741:
	mov	w0, -1
	str	w0, [x19, 616]
.L732:
	ldr	x1, .LC455
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L736
	.size	USERDEC_Init, .-USERDEC_Init
	.align	3
.LC452:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC453:
	.xword	.LANCHOR0
	.align	3
.LC455:
	.xword	.LC454
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	USERDEC_RecycleImage
	.type	USERDEC_RecycleImage, %function
USERDEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L744
	ldr	w0, [x19, 616]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x19, 616]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L745
	ldr	w0, [x19, 616]
	ldr	x1, [x20, 600]
	bl	FreeUsdByDec
	str	xzr, [x20, 600]
	ldr	x1, [x20, 608]
	ldr	w0, [x19, 616]
	bl	FreeUsdByDec
	str	xzr, [x20, 608]
	mov	w0, 1
.L743:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L745:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L744:
	mov	w0, -2
	b	.L743
	.size	USERDEC_RecycleImage, .-USERDEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetUsrdecFrame
	.type	VCTRL_GetUsrdecFrame, %function
VCTRL_GetUsrdecFrame:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w20, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x23, .LC456
	ldr	x0, [x23, w20, sxtw 3]
	cbz	x0, .L763
	ldr	w1, [x0, 608]
	cmp	w1, 20
	bne	.L764
	ldr	w0, [x0, 528]
	cmp	w0, 2
	ble	.L765
	mov	w1, 1
	mov	w0, w20
	bl	FSP_NewLogicFs
	mov	w22, w0
	tbnz	w0, #31, .L766
	mov	w1, w0
	mov	w0, w20
	bl	FSP_GetLogicFs
	mov	x19, x0
	ldr	x1, .LC466
	mov	w2, w22
	mov	w0, 18
	bl	dprint_vfmw
	cbz	x19, .L767
	ldr	x0, [x19, 680]
	cbz	x0, .L753
	ldr	x1, [x19, 688]
	cbz	x1, .L753
	ldr	x2, [x19, 696]
	cbz	x2, .L753
	ldr	w3, [x1, 16]
	ldr	w4, [x2, 16]
	ldr	x1, .LC470
	ldr	w2, [x0, 16]
	mov	w0, 18
	bl	dprint_vfmw
	ldr	x0, [x19, 680]
	ldr	w0, [x0, 16]
	str	w0, [x21, 40]
	ldr	x0, [x23, w20, sxtw 3]
	ldr	w0, [x0, 524]
	str	w0, [x21, 20]
	ldr	x0, [x19, 680]
	ldr	w0, [x0, 28]
	str	w0, [x21, 24]
	ldr	x0, [x19, 680]
	ldr	w0, [x0, 28]
	bl	MEM_Phy2Vir
	str	x0, [x21, 32]
	mov	w1, 0
.L748:
	mov	w0, w1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L764:
	ldr	x1, .LC460
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L748
	.p2align 3
.L765:
	ldr	x1, .LC462
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L748
	.p2align 3
.L753:
	ldr	x1, .LC472
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L748
	.p2align 3
.L766:
	ldr	x1, .LC464
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	b	.L748
.L763:
	ldr	x1, .LC458
	mov	w2, 5452
	ldr	x3, .LC457
	bl	dprint_vfmw
	mov	w1, -1
	b	.L748
.L767:
	ldr	x1, .LC468
	mov	w2, 5482
	mov	w0, 22
	bl	dprint_vfmw
	mov	w1, -1
	b	.L748
	.size	VCTRL_GetUsrdecFrame, .-VCTRL_GetUsrdecFrame
	.align	3
.LC456:
	.xword	.LANCHOR0
	.align	3
.LC457:
	.xword	.LC8
	.align	3
.LC458:
	.xword	.LC5
	.align	3
.LC460:
	.xword	.LC459
	.align	3
.LC462:
	.xword	.LC461
	.align	3
.LC464:
	.xword	.LC463
	.align	3
.LC466:
	.xword	.LC465
	.align	3
.LC468:
	.xword	.LC467
	.align	3
.LC470:
	.xword	.LC469
	.align	3
.LC472:
	.xword	.LC471
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitSyntaxCtx
	.type	InitSyntaxCtx, %function
InitSyntaxCtx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC473
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L786
	ldr	w0, [x1, 608]
	cmp	w0, 20
	bls	.L787
.L768:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L787:
	ldr	x2, .LC476
	ldrb	w0, [x2,w0,uxtw]
	adr	x2, .Lrtx772
	add	x0, x2, w0, sxtb #2
	br	x0
.Lrtx772:
	.section	.rodata
	.align	0
	.align	2
.L772:
	.byte	(.L771 - .Lrtx772) / 4
	.byte	(.L773 - .Lrtx772) / 4
	.byte	(.L774 - .Lrtx772) / 4
	.byte	(.L775 - .Lrtx772) / 4
	.byte	(.L768 - .Lrtx772) / 4
	.byte	(.L776 - .Lrtx772) / 4
	.byte	(.L777 - .Lrtx772) / 4
	.byte	(.L768 - .Lrtx772) / 4
	.byte	(.L778 - .Lrtx772) / 4
	.byte	(.L779 - .Lrtx772) / 4
	.byte	(.L780 - .Lrtx772) / 4
	.byte	(.L780 - .Lrtx772) / 4
	.byte	(.L780 - .Lrtx772) / 4
	.byte	(.L781 - .Lrtx772) / 4
	.byte	(.L768 - .Lrtx772) / 4
	.byte	(.L782 - .Lrtx772) / 4
	.byte	(.L783 - .Lrtx772) / 4
	.byte	(.L784 - .Lrtx772) / 4
	.byte	(.L768 - .Lrtx772) / 4
	.byte	(.L768 - .Lrtx772) / 4
	.byte	(.L785 - .Lrtx772) / 4
	.text
	.p2align 3
.L785:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	USERDEC_Init
	b	.L768
	.p2align 3
.L784:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	VP9DEC_Init
	b	.L768
	.p2align 3
.L783:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	HEVCDEC_Init
	b	.L768
	.p2align 3
.L782:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	MVC_DEC_Init
	b	.L768
	.p2align 3
.L781:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	VP8DEC_Init
	b	.L768
	.p2align 3
.L780:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	VP6DEC_Init
	b	.L768
	.p2align 3
.L779:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	REAL9DEC_Init
	b	.L768
	.p2align 3
.L778:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	REAL8DEC_Init
	b	.L768
	.p2align 3
.L777:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	AVSDEC_Init
	b	.L768
	.p2align 3
.L776:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	DIVX3DEC_Init
	b	.L768
	.p2align 3
.L775:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	MPEG2DEC_Init
	b	.L768
	.p2align 3
.L774:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	MPEG4DEC_Init
	b	.L768
	.p2align 3
.L773:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	VC1DEC_Init
	b	.L768
	.p2align 3
.L771:
	add	x0, x1, 331776
	add	x1, x1, 616
	add	x0, x0, 80
	bl	H264DEC_Init
	b	.L768
	.p2align 3
.L786:
	ldr	x3, .LC474
	mov	w2, 5537
	ldr	x1, .LC475
	mov	w0, 0
	bl	dprint_vfmw
	b	.L768
	.size	InitSyntaxCtx, .-InitSyntaxCtx
	.align	3
.LC473:
	.xword	.LANCHOR0
	.align	3
.LC474:
	.xword	.LC8
	.align	3
.LC475:
	.xword	.LC5
	.align	3
.LC476:
	.xword	.L772
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_VarifyOption
	.type	VCTRL_VarifyOption, %function
VCTRL_VarifyOption:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 36]
	tbnz	w0, #31, .L789
	ldr	w0, [x19, 12]
	cmp	w0, 31
	ble	.L789
	ldr	w0, [x19, 16]
	cmp	w0, 31
	ble	.L789
	ldr	w1, [x19, 56]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L789
	ldr	w0, [x19, 44]
	cmp	w0, 1
	beq	.L795
	cmp	w0, 2
	mov	w0, 0
	bne	.L791
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L789
	ldr	w0, [x19, 24]
	cmp	w0, wzr
	ble	.L789
.L794:
	ldr	w0, [x19, 28]
	cmp	w0, wzr
	ble	.L789
	ldr	w0, [x19, 32]
	cmp	w0, wzr
	bgt	.L796
.L789:
	ldr	x1, .LC478
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, -1
.L791:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L796:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L795:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	bgt	.L794
	b	.L789
	.size	VCTRL_VarifyOption, .-VCTRL_VarifyOption
	.align	3
.LC478:
	.xword	.LC477
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetMemSize_onDecode
	.type	VCTRL_GetMemSize_onDecode, %function
VCTRL_GetMemSize_onDecode:
	sub	sp, sp, #80
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	str	x23, [sp, 64]
	mov	x19, x1
	mov	w21, w0
	mov	x0, x30
	mov	x20, x2
	bl	_mcount
	ldp	w5, w0, [x19, 36]
	mov	w4, 1
	cbz	w0, .L799
	mov	w4, 17
	add	w0, w5, 1
	cmp	w0, w4
	csel	w4, w0, w4, le
.L799:
	ldr	x0, .LC479
	sub	w22, w21, #27
	mov	w7, -2
	cmp	w22, 5
	csinv	w7, w7, wzr, ls
	ldr	x8, [x0, 128]
	cbz	x8, .L803
	ldr	w0, [x19, 60]
	mov	w6, 0
	ldr	x23, .LC482
	mov	w1, 2147483647
	add	w5, w5, w0
	ldp	w2, w3, [x19, 12]
	add	x0, x23, 2176
	add	w5, w5, 2
	str	x0, [sp]
	mov	w0, 1
	blr	x8
	cbnz	w0, .L803
	cmp	w21, 26
	beq	.L815
	mov	w2, 50608
	movk	w2, 0xc, lsl 16
	mov	w3, w2
.L804:
	ldr	w1, [x23, 2180]
	add	w0, w1, 16
	str	w0, [x20]
	ldr	w0, [x19, 176]
	cmp	w0, 1
	beq	.L805
	add	w1, w1, 307200
	add	w1, w1, 2576
	str	w1, [x20]
	ldr	w0, [x19, 56]
	add	w0, w0, 32768
	str	w0, [x20, 4]
.L806:
	str	w3, [x20, 8]
	mov	w0, 0
	ldr	w1, [x19, 44]
	cbz	w1, .L807
	ldrsw	x3, [x19, 20]
	mov	w0, 4000
	ldp	w5, w4, [x19, 28]
	lsl	x1, x3, 7
	cmp	w21, 26
	sub	x3, x1, x3
	mov	w1, 2208
	lsl	x3, x3, 5
	smaddl	x0, w5, w0, x3
	smaddl	x0, w4, w1, x0
	beq	.L816
.L807:
	cmp	w22, 5
	bls	.L817
.L810:
	add	sp, x29, 0
	add	w2, w0, w2
	str	w2, [x20, 8]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L817:
	mov	w1, 44808
	movk	w1, 0x13, lsl 16
	cmp	w0, w1
	csel	w0, w0, w1, cs
	b	.L810
	.p2align 3
.L803:
	ldr	x1, .LC481
	mov	w2, 5700
	mov	w0, 0
	bl	dprint_vfmw
	add	sp, x29, 0
	mov	w0, -1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L805:
	ldr	w0, [x19, 56]
	add	w0, w0, 339968
	add	w0, w0, 2576
	str	w0, [x20, 4]
	b	.L806
	.p2align 3
.L815:
	mov	w2, 38048
	movk	w2, 0xb2, lsl 16
	mov	w3, w2
	b	.L804
	.p2align 3
.L816:
	mov	w7, 3992
	mov	w6, 2240
	and	x1, x0, 4294967295
	smaddl	x3, w5, w7, x3
	smaddl	x0, w4, w6, x3
	cmp	x0, x1
	csel	x0, x0, x1, cs
	cmp	w22, 5
	bhi	.L810
	b	.L817
	.size	VCTRL_GetMemSize_onDecode, .-VCTRL_GetMemSize_onDecode
	.align	3
.LC479:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC481:
	.xword	.LC480
	.align	3
.LC482:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanMemSize
	.type	VCTRL_GetChanMemSize, %function
VCTRL_GetChanMemSize:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w3
	mov	x19, x1
	mov	x22, x2
	bl	_mcount
	cmp	w20, 2
	beq	.L819
	ldr	x0, .LC484
	mov	w6, 16
	ldr	w2, [x19, 36]
	ldr	w4, [x19, 60]
	ldr	w3, [x0, 3544]
	ldr	w5, [x0, 3548]
	add	w0, w2, w3
	cmp	w0, w6
	add	w1, w4, w5
	csel	w0, w0, w6, le
	cmp	w0, wzr
	ccmp	w1, wzr, 1, ge
	blt	.L826
	str	w0, [x19, 36]
	str	w1, [x19, 60]
.L819:
	mov	x0, x19
	bl	VCTRL_VarifyOption
	cbnz	w0, .L822
	mov	x2, x22
	mov	x1, x19
	mov	w0, w21
	bl	VCTRL_GetMemSize_onDecode
.L821:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L822:
	mov	w0, -1
	b	.L821
	.p2align 3
.L826:
	ldr	x1, .LC486
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, -1
	b	.L821
	.size	VCTRL_GetChanMemSize, .-VCTRL_GetChanMemSize
	.align	3
.LC484:
	.xword	.LANCHOR3
	.align	3
.LC486:
	.xword	.LC485
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CloseDrivers
	.type	CloseDrivers, %function
CloseDrivers:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 96]
	cbz	w0, .L852
	ldr	w0, [x19, 112]
	cmp	w0, wzr
	cset	w21, ne
.L828:
	ldr	w20, [x19, 24]
	ldr	w22, [x19, 16]
	ldr	x23, [x19, 8]
	cbz	w20, .L829
	ldr	x0, .LC487
	ldr	x1, [x0, 120]
	cbz	x1, .L881
	mov	w0, 0
	blr	x1
	cbz	w21, .L832
.L833:
	ldr	x3, .LC488
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
.L829:
	mov	w2, w20
	mov	x1, x23
	mov	w0, w22
	bl	MEM_DelMemRecord
	ldr	w20, [x19, 88]
	ldr	w22, [x19, 80]
	ldr	x23, [x19, 72]
	cbz	w20, .L835
	ldr	x0, .LC487
	ldr	x1, [x0, 120]
	cbz	x1, .L882
	mov	w0, 0
	blr	x1
	cbz	w21, .L838
.L839:
	ldr	x3, .LC488
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 64
	ldr	x3, [x3, 96]
	blr	x3
.L835:
	mov	w2, w20
	mov	x1, x23
	mov	w0, w22
	bl	MEM_DelMemRecord
	ldr	w20, [x19, 56]
	ldr	w22, [x19, 48]
	ldr	x23, [x19, 40]
	cbnz	w20, .L883
.L841:
	mov	x1, x23
	mov	w2, w20
	mov	w0, w22
	bl	MEM_DelMemRecord
	bl	SM_InstInit
	ldr	w21, [x19, 144]
	ldr	w22, [x19, 136]
	ldr	x23, [x19, 128]
	cbnz	w21, .L884
.L844:
	mov	w2, w21
	mov	x1, x23
	mov	w0, w22
	add	x20, x19, 216
	bl	MEM_DelMemRecord
	ldr	w21, [x19, 240]
	ldr	w22, [x19, 232]
	ldr	x23, [x19, 224]
	cbnz	w21, .L885
.L845:
	mov	w2, w21
	mov	x1, x23
	mov	w0, w22
	bl	MEM_DelMemRecord
	ldr	w21, [x19, 208]
	ldr	w22, [x19, 200]
	ldr	x23, [x19, 192]
	cbnz	w21, .L886
.L846:
	mov	w2, w21
	mov	x1, x23
	mov	w0, w22
	add	x20, x19, 152
	bl	MEM_DelMemRecord
	ldr	w21, [x19, 176]
	ldr	w22, [x19, 168]
	ldr	x23, [x19, 160]
	cbnz	w21, .L887
.L847:
	mov	w2, w21
	mov	w0, w22
	mov	x1, x23
	add	x19, x19, 248
	bl	MEM_DelMemRecord
	ldr	w20, [x19, 24]
	ldr	w21, [x19, 16]
	ldr	x22, [x19, 8]
	cbnz	w20, .L888
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	MEM_DelMemRecord
	ldr	x19, .LC490
	ldr	w0, [x19, 584]
	cmp	w0, 1
	beq	.L889
.L849:
	ldr	w0, [x19, 588]
	cmp	w0, 1
	beq	.L890
.L850:
	ldr	w0, [x19, 592]
	add	x19, x19, 256
	cmp	w0, 1
	beq	.L891
.L851:
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L883:
	mov	w0, 0
	bl	SM_CloseSCDDrv
	cbz	w21, .L842
.L843:
	ldr	x3, .LC488
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, x2
	ldr	x3, [x3, 96]
	blr	x3
	b	.L841
	.p2align 3
.L884:
	mov	x1, x23
	mov	w0, w22
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC488
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 120
	ldr	x3, [x3, 96]
	blr	x3
	b	.L844
	.p2align 3
.L888:
	mov	x1, x22
	mov	w0, w21
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC488
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	mov	w2, w20
	mov	x1, x22
	mov	w0, w21
	bl	MEM_DelMemRecord
	ldr	x19, .LC490
	ldr	w0, [x19, 584]
	cmp	w0, 1
	bne	.L849
.L889:
	ldr	x1, .LC488
	mov	w0, 0
	ldr	x21, [x1, 384]
	bl	VFMW_GetString
	ldr	x2, .LC491
	mov	x1, x0
	mov	w0, 127
	add	x2, x2, 3552
	blr	x21
	str	wzr, [x19, 584]
	ldr	w0, [x19, 588]
	cmp	w0, 1
	bne	.L850
	.p2align 2
.L890:
	ldr	x1, .LC488
	mov	w0, 4
	add	x19, x19, 256
	ldr	x21, [x1, 384]
	bl	VFMW_GetString
	ldr	x2, .LC491
	mov	x1, x0
	mov	w0, 136
	add	x2, x2, 3552
	blr	x21
	str	wzr, [x19, 332]
	ldr	w0, [x19, 336]
	cmp	w0, 1
	bne	.L851
.L891:
	ldr	x1, .LC488
	mov	w0, 13
	ldr	x20, [x1, 384]
	bl	VFMW_GetString
	ldr	x2, .LC491
	mov	x1, x0
	mov	w0, 181
	add	x2, x2, 3552
	blr	x20
	str	wzr, [x19, 336]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L887:
	mov	x1, x23
	mov	w0, w22
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC488
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	b	.L847
	.p2align 3
.L886:
	mov	x1, x23
	mov	w0, w22
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC488
	mov	x2, 32
	mov	w1, 0
	add	x0, x19, 184
	ldr	x3, [x3, 96]
	blr	x3
	b	.L846
	.p2align 3
.L885:
	mov	x1, x23
	mov	w0, w22
	bl	MEM_UnmapRegisterAddr
	ldr	x3, .LC488
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	b	.L845
	.p2align 3
.L881:
	ldr	x1, .LC489
	mov	w2, 6090
	mov	w0, 0
	bl	dprint_vfmw
	cbnz	w21, .L833
	.p2align 2
.L832:
	ldr	w0, [x19, 16]
	ldr	x1, [x19, 8]
	bl	MEM_ReleaseMemBlock
	b	.L833
	.p2align 3
.L882:
	ldr	x1, .LC489
	mov	w2, 6111
	mov	w0, 0
	bl	dprint_vfmw
	cbnz	w21, .L839
	.p2align 2
.L838:
	ldr	w0, [x19, 80]
	ldr	x1, [x19, 72]
	bl	MEM_ReleaseMemBlock
	b	.L839
	.p2align 3
.L852:
	mov	w21, 0
	b	.L828
	.p2align 3
.L842:
	ldr	w0, [x19, 48]
	ldr	x1, [x19, 40]
	bl	MEM_ReleaseMemBlock
	b	.L843
	.size	CloseDrivers, .-CloseDrivers
	.align	3
.LC487:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC488:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC489:
	.xword	.LC89
	.align	3
.LC490:
	.xword	.LANCHOR0
	.align	3
.LC491:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	OpenDrivers
	.type	OpenDrivers, %function
OpenDrivers:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 120
	bl	_mcount
	mov	x2, x20
	mov	w1, 65536
	mov	w0, -121438208
	bl	MEM_MapRegisterAddr
	cbnz	w0, .L893
	ldr	w2, [x19, 144]
	add	x20, x19, 216
	ldr	x1, [x19, 128]
	ldr	w0, [x19, 136]
	bl	MEM_AddMemRecord
	mov	w0, 53248
	mov	x2, x20
	mov	w1, 4096
	movk	w0, 0xf8c3, lsl 16
	bl	MEM_MapRegisterAddr
	cbz	w0, .L923
	ldr	x1, .LC494
	mov	w2, 53248
.L917:
	movk	w2, 0xf8c3, lsl 16
.L916:
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x3, .LC495
	mov	x2, 32
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	mov	x0, x19
	bl	CloseDrivers
	mov	w0, -1
.L896:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L923:
	ldr	w2, [x20, 24]
	ldr	x1, [x20, 8]
	ldr	w0, [x20, 16]
	add	x20, x19, 184
	bl	MEM_AddMemRecord
	mov	w0, 49152
	mov	x2, x20
	mov	w1, 4096
	movk	w0, 0xf8c3, lsl 16
	bl	MEM_MapRegisterAddr
	cbnz	w0, .L897
	ldr	w2, [x19, 208]
	ldr	x1, [x19, 192]
	ldr	w0, [x19, 200]
	bl	MEM_AddMemRecord
	ldr	x20, .LC495
	mov	w0, 15
	ldr	x21, [x20, 136]
	bl	VFMW_GetString
	mov	w3, 0
	mov	x2, x0
	mov	x1, 20
	add	x0, x29, 80
	blr	x21
	ldr	x22, .LC496
	mov	w2, -1
	ldr	x0, [x22, 96]
	cbz	x0, .L899
	blr	x0
	mov	w2, w0
.L899:
	mov	w21, 3
	mov	w4, 0
	mov	x3, x19
	mov	w1, 0
	add	x0, x29, 80
	str	w21, [x19, 28]
	bl	MEM_AllocMemBlock
	cbnz	w0, .L900
	ldr	w2, [x19, 24]
	ldr	x1, [x19, 8]
	ldr	w0, [x19, 16]
	bl	MEM_AddMemRecord
	ldr	x3, [x20, 96]
	mov	x2, 20
	mov	w1, 0
	add	x0, x29, 104
	blr	x3
	str	wzr, [x29, 112]
	ldr	w2, [x19, 16]
	ldr	w0, [x19, 24]
	ldr	x1, [x22, 112]
	stp	w2, w0, [x29, 104]
	cbz	x1, .L901
	add	x0, x29, 104
	blr	x1
	cbnz	w0, .L901
	str	w21, [x19, 92]
	mov	w0, 16
	add	x22, x19, 64
	ldr	x23, [x20, 136]
	bl	VFMW_GetString
	mov	w3, 0
	mov	x2, x0
	mov	x1, 20
	add	x0, x29, 80
	blr	x23
	mov	w4, 1
	mov	x3, x22
	mov	w2, 16384
	mov	w1, 0
	add	x0, x29, 80
	bl	MEM_AllocMemBlock
	cbnz	w0, .L902
	ldr	w2, [x19, 88]
	add	x23, x19, 32
	ldr	x1, [x19, 72]
	ldr	w0, [x19, 80]
	bl	MEM_AddMemRecord
	ldr	x2, .LC497
	mov	w0, 0
	ldr	w1, [x19, 80]
	str	w1, [x2, 1212]
	ldr	w1, [x19, 80]
	add	w1, w1, 4096
	add	w1, w1, 1024
	str	w1, [x2, 1216]
	bl	VDMDRV_Init
	ldr	x22, [x20, 136]
	mov	w0, 17
	bl	VFMW_GetString
	mov	x2, x0
	mov	w3, 0
	mov	x1, 20
	add	x0, x29, 80
	blr	x22
	str	w21, [x19, 60]
	mov	w2, 61440
	mov	w4, 0
	mov	x3, x23
	movk	w2, 0xa, lsl 16
	mov	w1, 0
	add	x0, x29, 80
	bl	MEM_AllocMemBlock
	cbnz	w0, .L924
	ldr	w2, [x19, 56]
	ldr	x1, [x19, 40]
	ldr	w0, [x19, 48]
	bl	MEM_AddMemRecord
	ldr	w0, [x19, 48]
	mov	w2, 0
	ldr	w1, [x19, 56]
	bl	SM_OpenSCDDrv
	cbnz	w0, .L905
	bl	SM_InstInit
	ldr	x22, [x20, 376]
	mov	w0, 0
	bl	VFMW_GetString
	ldr	x21, .LC504
	ldr	x1, .LC505
	mov	x3, x0
	add	x21, x21, 3552
	mov	x2, 128
	mov	x4, x21
	mov	w0, 127
	blr	x22
	cbnz	w0, .L925
	ldr	x22, .LC512
	mov	w0, 4
	mov	w24, 1
	ldr	x25, [x20, 376]
	add	x22, x22, 256
	str	w24, [x22, 328]
	bl	VFMW_GetString
	ldr	x1, .LC513
	mov	x3, x0
	mov	x4, x21
	mov	x2, 128
	mov	w0, 136
	blr	x25
	cbnz	w0, .L926
	mov	w0, 13
	ldr	x25, [x20, 376]
	str	w24, [x22, 332]
	bl	VFMW_GetString
	mov	x3, x0
	ldr	x1, .LC514
	mov	x4, x21
	mov	w0, 181
	mov	x2, 128
	blr	x25
	cbnz	w0, .L927
	str	w24, [x22, 336]
	b	.L896
	.p2align 3
.L893:
	ldr	x1, .LC494
	mov	w2, -121438208
	b	.L916
.L897:
	ldr	x1, .LC494
	mov	w2, 49152
	b	.L917
.L901:
	ldr	x1, .LC501
.L919:
	mov	w2, 0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x3, [x20, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x19
	blr	x3
	mov	x0, x19
	bl	CloseDrivers
	mov	w0, -1
	b	.L896
.L925:
	ldr	x1, .LC511
	mov	w2, 127
.L918:
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x3, [x20, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x23
	blr	x3
	mov	x0, x19
	bl	CloseDrivers
	mov	w0, -1
	b	.L896
.L926:
	ldr	x1, .LC511
	mov	w2, 136
	b	.L918
.L905:
	ldr	x1, .LC509
	mov	w2, 0
	b	.L918
.L924:
	ldr	x1, .LC507
	mov	w2, 0
	b	.L918
.L902:
	ldr	x1, .LC503
	mov	w2, 0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x3, [x20, 96]
	mov	x2, 32
	mov	w1, 0
	mov	x0, x22
	blr	x3
	mov	x0, x19
	bl	CloseDrivers
	mov	w0, -1
	b	.L896
.L900:
	ldr	x1, .LC499
	b	.L919
.L927:
	ldr	x1, .LC511
	mov	w2, 181
	b	.L918
	.size	OpenDrivers, .-OpenDrivers
	.align	3
.LC494:
	.xword	.LC493
	.align	3
.LC495:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC496:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC497:
	.xword	g_HwMem
	.align	3
.LC499:
	.xword	.LC498
	.align	3
.LC501:
	.xword	.LC500
	.align	3
.LC503:
	.xword	.LC502
	.align	3
.LC504:
	.xword	.LANCHOR3
	.align	3
.LC505:
	.xword	VCTRL_Isr_0
	.align	3
.LC507:
	.xword	.LC506
	.align	3
.LC509:
	.xword	.LC508
	.align	3
.LC511:
	.xword	.LC510
	.align	3
.LC512:
	.xword	.LANCHOR0
	.align	3
.LC513:
	.xword	VCTRL_Scd_Isr
	.align	3
.LC514:
	.xword	VCTRL_MMU_ISR
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OpenVfmw
	.type	VCTRL_OpenVfmw, %function
VCTRL_OpenVfmw:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC517
	mov	x2, 8
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x22, .LC518
	ldr	w19, [x22, 256]
	cbnz	w19, .L959
	ldr	x21, .LC519
	mov	w1, 1024
	ldr	x2, [x20, 160]
	add	x24, x21, 3560
	str	xzr, [x29, 72]
	mov	x0, x24
	blr	x2
	ldr	x1, .LC521
	mov	x0, x24
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L931
	ldr	x1, .LC523
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L951
	ldr	x1, .LC525
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L960
	ldr	x3, [x20, 168]
	mov	w2, 0
	mov	x1, 0
	blr	x3
	mov	w2, w0
	str	w0, [x21, 3544]
	add	w0, w2, 4096
	mov	w1, 10000
	add	w0, w0, 904
	cmp	w0, w1
	bhi	.L936
.L966:
	mov	w0, 5000
	mov	w1, -5000
	cmp	w2, w0
	csel	w0, w2, w0, le
	cmp	w0, w1
	csel	w0, w0, w1, ge
.L932:
	str	w0, [x21, 3544]
.L934:
	add	x24, x21, 3560
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x24
	str	xzr, [x29, 72]
	blr	x2
	ldr	x1, .LC532
	mov	x0, x24
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L937
	ldr	x1, .LC523
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L938
	ldr	x1, .LC525
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L961
	ldr	x3, [x20, 168]
	mov	w2, 0
	mov	x1, 0
	blr	x3
	mov	w2, w0
	str	w0, [x21, 3548]
	add	w0, w2, 4096
	mov	w1, 10000
	add	w0, w0, 904
	cmp	w0, w1
	bhi	.L942
.L965:
	mov	w19, 5000
	mov	w0, -5000
	cmp	w2, w19
	csel	w19, w2, w19, le
	cmp	w19, w0
	csel	w19, w19, w0, ge
.L938:
	str	w19, [x21, 3548]
.L940:
	ldr	x24, .LC535
	str	xzr, [x29, 72]
	ldr	w0, [x24, 232]
	cbz	w0, .L943
	ldr	x2, .LC536
	and	w4, w0, 1
	ubfx	x3, x0, 1, 1
	ubfx	x1, x0, 2, 1
	strb	w4, [x24, 236]
	ubfx	x0, x0, 3, 1
	strb	w3, [x2, 76]
	strb	w1, [x24, 237]
	strb	w0, [x24, 238]
.L944:
	ldr	x3, [x20, 96]
	mov	x2, 344
	mov	w1, 0
	add	x0, x22, 256
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 256
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldr	x1, .LC539
	mov	w2, 134217728
	add	x0, x29, 64
	str	x1, [x24, 240]
	mov	w1, 75497472
	stp	w2, w1, [x29, 64]
	bl	MEM_InitMemManager
	bl	FSP_Init
	ldr	x19, .LC540
	ldr	x3, [x20, 96]
	mov	x2, 384
	mov	w1, 0
	mov	x0, x19
	blr	x3
	add	x0, x19, 128
	add	x1, x19, 256
	mov	w2, -1
	.p2align 2
.L948:
	str	w2, [x0], 4
	cmp	x1, x0
	bne	.L948
	ldr	x3, [x20, 96]
	mov	x2, 128
	mov	w1, 0
	add	x0, x24, 248
	add	x19, x22, 288
	blr	x3
	ldr	x3, [x20, 104]
	mov	x2, 24
	add	x1, x23, 8
	add	x0, x22, 384
	blr	x3
	mov	x0, x19
	bl	OpenDrivers
	cbnz	w0, .L959
	ldr	x2, [x20, 248]
	mov	w1, 1
	blr	x2
	ldr	x2, .LC543
	add	x0, x22, 272
	ldr	x1, .LC545
	ldr	x3, [x20, 368]
	blr	x3
	cbnz	w0, .L962
	mov	w1, 1
	str	w1, [x22, 256]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L943:
	add	x21, x21, 3560
	ldr	x2, [x20, 160]
	mov	w1, 1024
	mov	x0, x21
	blr	x2
	ldr	x1, .LC538
	mov	x0, x21
	ldr	x2, [x20, 192]
	blr	x2
	str	x0, [x29, 72]
	cbz	x0, .L944
	ldr	x1, .LC523
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L963
	ldr	x1, .LC525
	add	x0, x29, 72
	ldr	x2, [x20, 184]
	blr	x2
	cbz	x0, .L964
	ldr	x3, [x20, 168]
	mov	x1, 0
	mov	w2, 0
	blr	x3
	mov	w1, w0
	str	w0, [x24, 232]
.L946:
	ldr	x2, .LC536
	and	w4, w1, 1
	ubfx	x3, x1, 1, 1
	ubfx	x0, x1, 2, 1
	strb	w4, [x24, 236]
	ubfx	x1, x1, 3, 1
	strb	w3, [x2, 76]
	strb	w0, [x24, 237]
	strb	w1, [x24, 238]
	b	.L944
.L937:
	ldr	w2, [x21, 3548]
	mov	w1, 10000
	add	w0, w2, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L965
.L942:
	ldr	x1, .LC534
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w19, [x21, 3548]
	mov	w1, 5000
	mov	w0, -5000
	cmp	w19, w1
	csel	w19, w19, w1, le
	cmp	w19, w0
	csel	w19, w19, w0, ge
	b	.L938
.L931:
	ldr	w2, [x21, 3544]
	mov	w1, 10000
	add	w0, w2, 4096
	add	w0, w0, 904
	cmp	w0, w1
	bls	.L966
.L936:
	ldr	x1, .LC530
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w0, [x21, 3544]
	mov	w2, 5000
	mov	w1, -5000
	cmp	w0, w2
	csel	w0, w0, w2, le
	cmp	w0, w1
	csel	w0, w0, w1, ge
	b	.L932
.L951:
	mov	w0, 0
	b	.L932
.L963:
	ldr	w1, [x24, 232]
	b	.L946
.L962:
	mov	x0, x19
	bl	CloseDrivers
.L959:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
.L961:
	ldr	x2, .LC526
	mov	w3, 7094
	ldr	x1, .LC528
	mov	w0, 22
	add	x2, x2, 48
	bl	dprint_vfmw
	b	.L940
.L960:
	ldr	x2, .LC526
	mov	w3, 7047
	ldr	x1, .LC528
	mov	w0, 22
	add	x2, x2, 24
	bl	dprint_vfmw
	b	.L934
.L964:
	ldr	x2, .LC526
	mov	w3, 7151
	ldr	x1, .LC528
	mov	w0, 22
	add	x2, x2, 72
	bl	dprint_vfmw
	b	.L944
	.size	VCTRL_OpenVfmw, .-VCTRL_OpenVfmw
	.align	3
.LC517:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC518:
	.xword	.LANCHOR0
	.align	3
.LC519:
	.xword	.LANCHOR3
	.align	3
.LC521:
	.xword	.LC520
	.align	3
.LC523:
	.xword	.LC522
	.align	3
.LC525:
	.xword	.LC524
	.align	3
.LC526:
	.xword	.LANCHOR4
	.align	3
.LC528:
	.xword	.LC527
	.align	3
.LC530:
	.xword	.LC529
	.align	3
.LC532:
	.xword	.LC531
	.align	3
.LC534:
	.xword	.LC533
	.align	3
.LC535:
	.xword	.LANCHOR5
	.align	3
.LC536:
	.xword	.LANCHOR2
	.align	3
.LC538:
	.xword	.LC537
	.align	3
.LC539:
	.xword	VCTRL_EventReport
	.align	3
.LC540:
	.xword	g_ChanCtx
	.align	3
.LC543:
	.xword	VFMW_CTRL_thread_proc
	.align	3
.LC545:
	.xword	.LC544
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetNextDecodeMode
	.type	GetNextDecodeMode, %function
GetNextDecodeMode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, w2
	mov	w22, w1
	bl	_mcount
	add	w20, w19, 7
	mov	w0, 21846
	lsl	w3, w19, 1
	movk	w0, 0x5555, lsl 16
	cmp	w19, wzr
	csel	w20, w20, w19, lt
	ldr	x1, .LC549
	smull	x0, w3, w0
	asr	w20, w20, 3
	mov	w5, w22
	lsr	x0, x0, 32
	mov	w4, w19
	sub	w3, w0, w3, asr 31
	mov	w2, w20
	mov	w0, 30
	bl	dprint_vfmw
	cmp	w21, 3
	beq	.L972
	cmp	w19, w22
	mov	w19, w21
	blt	.L973
.L969:
	ldr	x1, .LC555
	mov	w3, w19
	mov	w2, w21
	mov	w0, 30
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L973:
	ldr	x1, .LC553
	mov	w0, 30
	mov	w19, 3
	bl	dprint_vfmw
	b	.L969
	.p2align 3
.L972:
	cmp	w20, w22
	mov	w19, w21
	ble	.L969
	ldr	x1, .LC551
	mov	w0, 30
	mov	w19, 0
	bl	dprint_vfmw
	b	.L969
	.size	GetNextDecodeMode, .-GetNextDecodeMode
	.align	3
.LC549:
	.xword	.LC548
	.align	3
.LC551:
	.xword	.LC550
	.align	3
.LC553:
	.xword	.LC552
	.align	3
.LC555:
	.xword	.LC554
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanIDByCtx
	.type	VCTRL_GetChanIDByCtx, %function
VCTRL_GetChanIDByCtx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC556
	mov	x0, 0
	b	.L977
	.p2align 3
.L975:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L983
.L977:
	ldr	x2, [x3, x0, lsl 3]
	add	x1, x2, 331776
	add	x1, x1, 80
	cbz	x2, .L975
	cmp	x19, x1
	bne	.L975
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L983:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanIDByCtx, .-VCTRL_GetChanIDByCtx
	.align	3
.LC556:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanIDByMemAddr
	.type	VCTRL_GetChanIDByMemAddr, %function
VCTRL_GetChanIDByMemAddr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x5, .LC557
	mov	x0, 0
	.p2align 2
.L988:
	ldr	x1, [x5, x0, lsl 3]
	mov	w4, w0
	cbz	x1, .L985
	ldr	w2, [x1, 288]
	cmp	w2, w19
	bhi	.L986
	ldr	w3, [x1, 296]
	add	w2, w2, w3
	cmp	w19, w2
	bcc	.L987
.L986:
	ldr	w2, [x1, 320]
	cmp	w19, w2
	bcc	.L985
	ldr	w1, [x1, 328]
	add	w2, w2, w1
	cmp	w19, w2
	bcc	.L990
.L985:
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L988
	mov	w0, -1
.L987:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L990:
	mov	w0, w4
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanIDByMemAddr, .-VCTRL_GetChanIDByMemAddr
	.align	3
.LC557:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecChanProcessPts
	.type	DecChanProcessPts, %function
DecChanProcessPts:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC558
	ldr	x4, [x21, w20, sxtw 3]
	ldr	w1, [x4, 52]
	cmp	w1, 1
	beq	.L1020
	sub	w0, w1, #2
	cmp	w0, 1
	ccmp	w1, 6, 4, hi
	bne	.L997
.L1008:
	add	x2, x19, 8
	add	x0, x4, 1208
	bl	IsNewpicSeg
	cbnz	w0, .L998
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w1, [x0, 52]
	cmp	w1, 3
	ldr	x1, [x0, 680]
	beq	.L1018
	cmn	x1, #1
	beq	.L1000
.L1018:
	str	x1, [x0, 672]
.L1000:
	ldr	x3, [x0, 696]
	mov	x2, -1
	ldr	x1, [x0, 712]
	str	x2, [x0, 680]
	str	x3, [x0, 688]
	str	x1, [x0, 704]
	cbnz	x1, .L1001
	ldr	x1, [x19, 64]
	str	x1, [x0, 704]
.L1001:
	ldr	w6, [x0, 732]
	ldr	w5, [x0, 736]
	ldr	w4, [x0, 740]
	ldr	w3, [x0, 748]
	ldr	x1, .LC560
	ldr	x2, [x0, 672]
	str	w6, [x0, 720]
	str	w5, [x0, 724]
	str	w4, [x0, 728]
	str	w3, [x0, 744]
	mov	w0, 29
	bl	dprint_vfmw
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w1, [x0, 52]
	cmp	w1, 3
	bne	.L1002
	ldr	x1, [x19, 40]
	.p2align 2
.L1019:
	str	x1, [x0, 680]
.L1004:
	ldr	x1, [x19, 56]
	str	x1, [x0, 696]
	ldr	x1, [x19, 64]
	str	x1, [x0, 712]
	ldr	w1, [x19, 72]
	str	w1, [x0, 732]
	ldr	w1, [x19, 76]
	str	w1, [x0, 736]
	ldr	w1, [x19, 80]
	str	w1, [x0, 740]
	ldr	w1, [x19, 84]
	str	w1, [x0, 748]
.L1003:
	ldr	x2, [x0, 688]
	mov	w0, 29
	ldr	x1, .LC562
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1020:
	add	x0, x4, 331776
	ldr	x0, [x0, 80]
	ldrsb	w1, [x0, 596]
	cmp	w1, 1
	beq	.L1008
	.p2align 2
.L997:
	ldr	x2, [x19, 40]
	cmn	x2, #1
	beq	.L1021
	str	x2, [x4, 672]
.L1007:
	ldr	x3, [x19, 56]
	mov	w0, 29
	str	x3, [x4, 688]
	ldr	x1, .LC564
	ldr	x5, [x19, 64]
	str	x5, [x4, 704]
	ldr	w5, [x19, 72]
	str	w5, [x4, 720]
	ldr	w5, [x19, 76]
	str	w5, [x4, 724]
	ldr	w5, [x19, 80]
	str	w5, [x4, 728]
	ldr	w5, [x19, 84]
	str	w5, [x4, 744]
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1021:
	ldr	x2, [x4, 672]
	b	.L1007
	.p2align 3
.L998:
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w1, [x0, 52]
	cmp	w1, 3
	beq	.L1003
.L1002:
	ldr	x1, [x19, 40]
	cmn	x1, #1
	bne	.L1019
	b	.L1004
	.size	DecChanProcessPts, .-DecChanProcessPts
	.align	3
.LC558:
	.xword	.LANCHOR0
	.align	3
.LC560:
	.xword	.LC559
	.align	3
.LC562:
	.xword	.LC561
	.align	3
.LC564:
	.xword	.LC563
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecChanCheckDecParam
	.type	DecChanCheckDecParam, %function
DecChanCheckDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC565
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 608]
	and	w1, w0, -17
	cmp	w1, 4
	ccmp	w0, 14, 4, ne
	beq	.L1023
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbnz	x0, .L1025
.L1023:
	mov	w0, 0
.L1024:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1025:
	mov	w0, -2
	b	.L1024
	.size	DecChanCheckDecParam, .-DecChanCheckDecParam
	.align	3
.LC565:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecChanSyntax
	.type	DecChanSyntax, %function
DecChanSyntax:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1073
	ldr	x21, .LC568
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1074
	ldr	w1, [x0, 8]
	cmp	w1, 1
	bne	.L1075
	ldr	w1, [x0, 24]
	cbnz	w1, .L1076
	ldr	x23, .LC573
	str	wzr, [x0, 440]
	ldr	x0, [x23]
	blr	x0
	ldr	x22, .LC574
	mov	w2, w0
	ldr	x0, .LC575
	add	x1, x22, 376
	ldr	w3, [x0]
	ldr	w0, [x1, w19, sxtw 2]
	sub	w0, w2, w0
	cmp	w0, w3
	mov	w0, w19
	bls	.L1035
	str	w2, [x1, w19, sxtw 2]
	bl	DecChanCheckDecParam
	cmn	w0, #2
	mov	w20, w0
	beq	.L1077
	mov	w0, w19
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	bne	.L1049
	mov	w20, w0
.L1050:
	ldr	x1, [x21, w19, sxtw 3]
	ldr	w2, [x1, 1488]
	cbnz	w2, .L1078
.L1037:
	add	x24, x1, 752
	ldrb	w0, [x24, 1]
	cbnz	w0, .L1040
	ldr	w0, [x1, 1528]
	cbnz	w0, .L1040
	add	x1, x1, 760
	mov	w0, w19
	bl	SM_ReadSegStream
	cbz	w0, .L1040
	cmp	w20, 1
	beq	.L1079
.L1041:
	ldr	x0, [x21, w19, sxtw 3]
	mov	w1, 1
	mov	w20, -4
	str	w1, [x0, 440]
	b	.L1058
	.p2align 3
.L1035:
	bl	DecChanCheckDecParam
	cmn	w0, #2
	mov	w20, w0
	bne	.L1080
.L1058:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1078:
	cmp	w2, 1
	beq	.L1081
	add	x1, x1, 323584
	ldr	w3, [x1, 3928]
.L1047:
	ldr	x1, .LC589
	mov	w0, 31
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1058
	.p2align 3
.L1040:
	mov	x1, x24
	mov	w0, w19
	bl	DecChanProcessPts
	mov	w0, 3
	bl	CHECK_REC_POS_ENABLE
	cmp	w20, 1
	ccmp	w0, wzr, 4, eq
	bne	.L1082
.L1042:
	ldr	x1, [x21, w19, sxtw 3]
	mov	x0, x24
	add	x2, x1, 331776
	ldr	w1, [x1, 608]
	add	x2, x2, 80
	bl	DecodeStream
	ldr	x0, [x21, w19, sxtw 3]
	ldr	w1, [x0, 608]
	cmp	w1, 16
	beq	.L1083
.L1043:
	mov	w0, 4
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L1045
.L1046:
	mov	w20, 0
	b	.L1058
	.p2align 3
.L1080:
	mov	w0, w19
	mov	w20, -3
	bl	VCTRL_GetImageBuffer
	cmp	w0, 1
	bne	.L1058
	mov	w20, 0
	b	.L1050
	.p2align 3
.L1077:
	ldr	x1, .LC577
	mov	w2, w19
	mov	w0, 23
	bl	dprint_vfmw
	b	.L1058
	.p2align 3
.L1045:
	ldr	x0, [x23]
	add	x22, x22, 504
	blr	x0
	mov	w1, w0
	ldr	x2, .LC585
	ldr	w0, [x22, w19, sxtw 2]
	ldr	w2, [x2]
	sub	w0, w1, w0
	cmp	w0, w2
	bls	.L1046
	mov	w0, w19
	str	w1, [x22, w19, sxtw 2]
	bl	VCTRL_GetDecParam
	cbz	x0, .L1046
	ldr	x0, .LC582
	lsl	w2, w19, 24
	add	w2, w2, 262144
	mov	w1, 6781
	add	x0, x0, 88
	mov	w20, 0
	bl	DBG_AddTrace
	b	.L1058
	.p2align 3
.L1083:
	ldr	w1, [x0, 1552]
	cmp	w1, 1
	beq	.L1043
	add	x0, x0, 331776
	add	x0, x0, 80
	bl	IsMain10Profile
	cbnz	w0, .L1084
	ldr	x0, [x21, w19, sxtw 3]
	str	wzr, [x0, 1552]
	b	.L1043
	.p2align 3
.L1081:
	add	x0, x1, 323584
	ldr	w3, [x0, 3928]
	tst	w3, -3
	beq	.L1037
	cmp	w3, 1
	bne	.L1047
	ldr	x1, .LC587
	mov	w0, 31
	mov	w20, -3
	bl	dprint_vfmw
	b	.L1058
	.p2align 3
.L1049:
	ldr	x1, .LC579
	mov	w2, w19
	mov	w0, 23
	mov	w20, -3
	bl	dprint_vfmw
	b	.L1058
	.p2align 3
.L1075:
	ldr	x3, .LC570
	mov	w2, 6670
	ldr	x1, .LC567
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1058
	.p2align 3
.L1076:
	ldr	x3, .LC572
	mov	w2, 6671
	ldr	x1, .LC567
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1058
	.p2align 3
.L1073:
	ldr	x3, .LC566
	mov	w2, 6668
	ldr	x1, .LC567
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1058
.L1082:
	ldr	x0, .LC582
	lsl	w2, w19, 24
	add	w2, w2, 196608
	mov	w1, 6746
	add	x0, x0, 88
	bl	DBG_AddTrace
	b	.L1042
.L1074:
	ldr	x3, .LC569
	mov	w2, 6669
	ldr	x1, .LC567
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1058
.L1084:
	ldr	x2, .LC582
	mov	w3, w19
	ldr	x1, .LC584
	mov	w0, 0
	add	x2, x2, 88
	bl	dprint_vfmw
	ldr	x0, [x21, w19, sxtw 3]
	mov	w1, 1
	str	w1, [x0, 1552]
	bl	VDMDRV_AddMatchMode
	b	.L1043
.L1079:
	ldr	x1, .LC581
	mov	w2, w19
	mov	w0, 23
	bl	dprint_vfmw
	b	.L1041
	.size	DecChanSyntax, .-DecChanSyntax
	.align	3
.LC566:
	.xword	.LC204
	.align	3
.LC567:
	.xword	.LC5
	.align	3
.LC568:
	.xword	.LANCHOR0
	.align	3
.LC569:
	.xword	.LC348
	.align	3
.LC570:
	.xword	.LC412
	.align	3
.LC572:
	.xword	.LC571
	.align	3
.LC573:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC574:
	.xword	.LANCHOR5
	.align	3
.LC575:
	.xword	g_TraceBsPeriod
	.align	3
.LC577:
	.xword	.LC576
	.align	3
.LC579:
	.xword	.LC578
	.align	3
.LC581:
	.xword	.LC580
	.align	3
.LC582:
	.xword	.LANCHOR4
	.align	3
.LC584:
	.xword	.LC583
	.align	3
.LC585:
	.xword	g_TraceFramePeriod
	.align	3
.LC587:
	.xword	.LC586
	.align	3
.LC589:
	.xword	.LC588
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecSyntax
	.type	DecSyntax, %function
DecSyntax:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x0, x30
	bl	_mcount
	ldr	x22, .LC592
	ldr	x23, .LC593
	mov	x0, 0
	b	.L1088
	.p2align 3
.L1112:
	ldr	w1, [x1, 20]
	str	w1, [x2, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1111
.L1088:
	ldr	x1, [x22, x0, lsl 3]
	add	x2, x23, 632
	cbnz	x1, .L1112
	add	x1, x23, 632
	str	wzr, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L1088
.L1111:
	ldr	x24, .LC594
	mov	w20, -1
	.p2align 2
.L1089:
	ldr	w3, [x23, 632]
	add	x1, x23, 636
	mov	w0, 0
	mov	w19, 0
	.p2align 2
.L1090:
	add	w0, w0, 1
	cmp	w0, 32
	beq	.L1113
.L1092:
	ldr	w2, [x1]
	add	x1, x1, 4
	cmp	w3, w2
	bge	.L1090
	mov	w19, w0
	add	w0, w0, 1
	cmp	w0, 32
	mov	w3, w2
	bne	.L1092
.L1113:
	add	x2, x23, 632
	add	x0, x22, 256
	add	w1, w19, 1
	cmp	w3, wzr
	sxtw	x21, w19
	str	wzr, [x2, w19, sxtw 2]
	str	w1, [x0, 28]
	ble	.L1093
	ldr	x0, [x22, w19, sxtw 3]
	cbz	x0, .L1089
	ldr	w1, [x0, 8]
	cmp	w1, 1
	bne	.L1089
	ldr	w1, [x0, 76]
	cmp	w1, wzr
	ble	.L1095
	ldr	w0, [x0, 80]
	cbz	w0, .L1114
.L1095:
	mov	w21, 200
	b	.L1100
	.p2align 3
.L1098:
	subs	w21, w21, #1
	cbnz	w0, .L1089
	beq	.L1089
.L1100:
	mov	w0, w19
	bl	DecChanSyntax
	cmn	w0, #1
	mov	w20, w0
	bne	.L1098
	ldr	x4, [x23, 240]
	cbz	x4, .L1099
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	mov	w0, w19
	blr	x4
.L1099:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
.L1114:
	add	x1, x29, 72
	mov	w0, w19
	bl	SM_GetInfo
	cbnz	w0, .L1115
.L1096:
	ldr	x20, [x22, x21, lsl 3]
	ldr	w1, [x29, 84]
	ldr	w2, [x20, 76]
	ldr	w0, [x20, 624]
	bl	GetNextDecodeMode
	str	w0, [x20, 624]
	ldr	x1, [x22, x21, lsl 3]
	ldr	w0, [x1, 624]
	cbz	w0, .L1097
	str	wzr, [x1, 616]
	str	wzr, [x1, 620]
	b	.L1095
.L1093:
	str	wzr, [x0, 28]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
.L1097:
	ldr	w0, [x1, 72]
	str	w0, [x1, 616]
	str	w0, [x1, 620]
	b	.L1095
.L1115:
	ldr	x3, [x24, 96]
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 72
	blr	x3
	b	.L1096
	.size	DecSyntax, .-DecSyntax
	.align	3
.LC592:
	.xword	.LANCHOR0
	.align	3
.LC593:
	.xword	.LANCHOR5
	.align	3
.LC594:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_RunProcess
	.type	VCTRL_RunProcess, %function
VCTRL_RunProcess:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VCTRL_RecordPosTime
	ldr	x20, .LC597
	ldrb	w0, [x20, 2284]
	cmp	w0, 1
	beq	.L1125
.L1117:
	ldr	w0, [x20, 604]
	mov	w1, 100
	str	w1, [x20, 280]
	cmp	w0, wzr
	ldr	x21, .LC598
	ble	.L1118
	ldr	x1, [x21, 240]
	blr	x1
.L1118:
	ldr	x1, [x21, 24]
	mov	w0, 0
	mov	w22, 0
	blr	x1
	bl	SM_Wakeup
	ldr	w0, [x20, 600]
	mov	w1, 101
	str	w1, [x20, 280]
	cbz	w0, .L1126
.L1119:
	mov	w0, 102
	mov	w19, 0
	str	w0, [x20, 280]
	bl	VDMDRV_WakeUpVdm
	.p2align 2
.L1120:
	mov	w0, w19
	mov	w1, 0
	add	w19, w19, 1
	bl	DeleteRawPacketInBuffer
	cmp	w19, 32
	bne	.L1120
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	mov	w1, 105
	mov	w0, 1
	str	w1, [x20, 280]
	bl	VCTRL_RecordPosTime
	ldr	x3, [x21, 264]
	mov	w2, 10
	mov	w1, 0
	mov	w0, 0
	blr	x3
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1126:
	bl	DecSyntax
	mov	w22, w0
	b	.L1119
.L1125:
	mov	w0, 11
	bl	VCTRL_RecordPosTime
	strb	wzr, [x20, 2284]
	b	.L1117
	.size	VCTRL_RunProcess, .-VCTRL_RunProcess
	.align	3
.LC597:
	.xword	.LANCHOR0
	.align	3
.LC598:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VFMW_CTRL_thread_proc
	.type	VFMW_CTRL_thread_proc, %function
VFMW_CTRL_thread_proc:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x0, x30
	mov	w21, 2
	bl	_mcount
	ldr	x20, .LC599
	ldr	x25, .LC601
	ldr	x22, .LC605
	ldr	x26, .LC603
	ldr	x23, .LC607
	ldr	x24, .LC608
.L1128:
.L1135:
	mov	x1, x25
	mov	w0, 2
	str	wzr, [x20, 280]
	bl	dprint_vfmw
	str	w21, [x20, 260]
	ldr	w0, [x20, 264]
	cmp	w0, 2
	bne	.L1150
	b	.L1133
	.p2align 3
.L1152:
	str	w21, [x20, 280]
	bl	VCTRL_RunProcess
	mov	x1, x22
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x20, 264]
	cmp	w0, 2
	beq	.L1133
.L1150:
	cmp	w0, 3
	bne	.L1152
.L1131:
	ldr	x1, .LC610
	mov	w2, 6
	mov	w0, 2
	str	w2, [x20, 280]
	bl	dprint_vfmw
	str	wzr, [x20, 260]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1133:
	mov	w2, 4
	mov	x1, x26
	mov	w0, 2
	str	w2, [x20, 280]
	mov	w27, 5
	bl	dprint_vfmw
	mov	w0, 1
	str	w0, [x20, 260]
	b	.L1130
	.p2align 3
.L1153:
	ldr	x1, [x24, 240]
	blr	x1
.L1130:
	mov	x1, x23
	mov	w0, 22
	str	w27, [x20, 280]
	bl	dprint_vfmw
	ldr	w1, [x20, 264]
	mov	w0, 10
	cmp	w1, 1
	beq	.L1135
	cmp	w1, 3
	bne	.L1153
	b	.L1131
	.size	VFMW_CTRL_thread_proc, .-VFMW_CTRL_thread_proc
	.align	3
.LC599:
	.xword	.LANCHOR0
	.align	3
.LC601:
	.xword	.LC600
	.align	3
.LC603:
	.xword	.LC602
	.align	3
.LC605:
	.xword	.LC604
	.align	3
.LC607:
	.xword	.LC606
	.align	3
.LC608:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC610:
	.xword	.LC609
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanVoQue
	.type	VCTRL_GetChanVoQue, %function
VCTRL_GetChanVoQue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC612
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1172
	ldr	w1, [x0, 608]
	cmp	w1, 20
	bls	.L1173
.L1172:
	mov	x0, 0
.L1155:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1173:
	ldr	x2, .LC613
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx1157
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx1157:
	.section	.rodata
	.align	0
	.align	2
.L1157:
	.byte	(.L1170 - .Lrtx1157) / 4
	.byte	(.L1158 - .Lrtx1157) / 4
	.byte	(.L1159 - .Lrtx1157) / 4
	.byte	(.L1160 - .Lrtx1157) / 4
	.byte	(.L1172 - .Lrtx1157) / 4
	.byte	(.L1161 - .Lrtx1157) / 4
	.byte	(.L1162 - .Lrtx1157) / 4
	.byte	(.L1172 - .Lrtx1157) / 4
	.byte	(.L1163 - .Lrtx1157) / 4
	.byte	(.L1164 - .Lrtx1157) / 4
	.byte	(.L1165 - .Lrtx1157) / 4
	.byte	(.L1165 - .Lrtx1157) / 4
	.byte	(.L1165 - .Lrtx1157) / 4
	.byte	(.L1166 - .Lrtx1157) / 4
	.byte	(.L1172 - .Lrtx1157) / 4
	.byte	(.L1167 - .Lrtx1157) / 4
	.byte	(.L1168 - .Lrtx1157) / 4
	.byte	(.L1169 - .Lrtx1157) / 4
	.byte	(.L1172 - .Lrtx1157) / 4
	.byte	(.L1172 - .Lrtx1157) / 4
	.byte	(.L1170 - .Lrtx1157) / 4
	.text
	.p2align 3
.L1170:
	add	x0, x0, 331776
	ldr	x19, [sp, 16]
	add	x0, x0, 88
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1168:
	add	x0, x0, 393216
	add	x0, x0, 2104
	b	.L1155
	.p2align 3
.L1167:
	add	x0, x0, 331776
	add	x0, x0, 992
	b	.L1155
	.p2align 3
.L1166:
	add	x0, x0, 339968
	add	x0, x0, 96
	b	.L1155
	.p2align 3
.L1165:
	add	x0, x0, 344064
	add	x0, x0, 544
	b	.L1155
	.p2align 3
.L1169:
	add	x0, x0, 606208
	add	x0, x0, 1472
	b	.L1155
	.p2align 3
.L1158:
	add	x0, x0, 385024
	add	x0, x0, 512
	b	.L1155
	.p2align 3
.L1160:
	add	x0, x0, 421888
	add	x0, x0, 328
	b	.L1155
	.p2align 3
.L1159:
	add	x0, x0, 352256
	add	x0, x0, 2328
	b	.L1155
	.p2align 3
.L1164:
	add	x0, x0, 385024
	add	x0, x0, 3304
	b	.L1155
	.p2align 3
.L1163:
	add	x0, x0, 385024
	add	x0, x0, 3336
	b	.L1155
	.p2align 3
.L1162:
	add	x0, x0, 344064
	add	x0, x0, 3992
	b	.L1155
	.p2align 3
.L1161:
	add	x0, x0, 372736
	add	x0, x0, 3280
	b	.L1155
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	3
.LC612:
	.xword	.LANCHOR0
	.align	3
.LC613:
	.xword	.L1157
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_FindOccupiedFrame
	.type	VCTRL_FindOccupiedFrame, %function
VCTRL_FindOccupiedFrame:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w23, w0
	mov	x0, x30
	bl	_mcount
	cmp	w23, 31
	bhi	.L1186
	mov	w0, w23
	bl	VCTRL_GetChanVoQue
	mov	x20, x0
	cbz	x0, .L1182
	add	x2, x29, 96
	add	x1, x29, 88
	str	wzr, [x29, 88]
	str	wzr, [x2, -4]!
	bl	GetQueueImgNum
	ldr	w2, [x29, 88]
	mov	w0, -1
	cbz	w2, .L1176
	cmp	w2, 32
	bhi	.L1178
.L1180:
	ldr	x21, .LC619
	mov	w19, 0
	ldr	x24, .LC618
	sxtw	x25, w23
	ldr	x22, .LC621
	add	x21, x21, 104
	.p2align 2
.L1179:
	ldrh	w5, [x20, 4]
	mov	w4, w19
	ldr	x8, [x24, x25, lsl 3]
	mov	x1, x22
	add	w5, w5, w19
	mov	w7, 0
	and	x5, x5, 63
	add	x8, x8, x19, sxtw 4
	add	x5, x5, 2
	add	x8, x8, 327680
	mov	x6, 0
	mov	w3, 3642
	mov	x2, x21
	mov	w0, 1
	ldr	x5, [x20, x5, lsl 3]
	add	w19, w19, 1
	sxth	w19, w19
	ldr	w5, [x5, 28]
	str	w5, [x8, 3604]
	str	wzr, [x8, 3600]
	str	xzr, [x8, 3608]
	bl	dprint_vfmw
	ldr	w1, [x29, 88]
	cmp	w19, w1
	bcc	.L1179
.L1181:
	ldr	x2, [x24, w23, sxtw 3]
	mov	w0, 0
	add	x2, x2, 331776
	str	w1, [x2, 16]
.L1176:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1178:
	ldr	x1, .LC617
	mov	w3, 32
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x29, 88]
	cbnz	w1, .L1180
	ldr	x24, .LC618
	b	.L1181
.L1182:
	mov	w0, -1
	b	.L1176
.L1186:
	ldr	x3, .LC614
	mov	w2, 3608
	ldr	x1, .LC615
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1176
	.size	VCTRL_FindOccupiedFrame, .-VCTRL_FindOccupiedFrame
	.align	3
.LC614:
	.xword	.LC204
	.align	3
.LC615:
	.xword	.LC5
	.align	3
.LC617:
	.xword	.LC616
	.align	3
.LC618:
	.xword	.LANCHOR0
	.align	3
.LC619:
	.xword	.LANCHOR4
	.align	3
.LC621:
	.xword	.LC620
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReportOccupiedFrame
	.type	VCTRL_ReportOccupiedFrame, %function
VCTRL_ReportOccupiedFrame:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x22, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w22, 31
	bhi	.L1204
	cbz	x19, .L1205
	mov	w0, w22
	bl	VCTRL_GetChanVoQue
	mov	x20, x0
	cbz	x0, .L1197
	ldr	x21, .LC627
	add	x23, x29, 80
	mov	w0, 4
	str	wzr, [x29, 72]
	ldr	x1, [x21, 24]
	str	wzr, [x23, -4]!
	blr	x1
	mov	x2, x23
	add	x1, x29, 72
	mov	x0, x20
	bl	GetQueueImgNum
	ldr	w2, [x29, 72]
	cbnz	w2, .L1206
	ldr	x6, .LC629
	ldr	x4, [x6, w22, sxtw 3]
	add	x0, x4, 331776
	ldr	w0, [x0, 16]
	cbz	w0, .L1195
	mov	w1, 0
	.p2align 2
.L1196:
	sxtw	x2, w1
	add	w1, w1, 1
	add	x3, x2, 20480
	lsl	x2, x2, 4
	add	x5, x19, x2
	sxth	w1, w1
	add	x3, x4, x3, lsl 4
	ldr	w0, [x3, 3604]
	str	w0, [x5, 4]
	str	xzr, [x5, 8]
	str	wzr, [x19, x2]
	ldr	x4, [x6, x22, lsl 3]
	add	x0, x4, 331776
	ldr	w0, [x0, 16]
	cmp	w1, w0
	bcc	.L1196
	str	w0, [x19, 512]
	b	.L1195
	.p2align 3
.L1206:
	cmp	w2, 32
	bhi	.L1207
.L1192:
	mov	w0, 0
	.p2align 2
.L1194:
	ldrh	w1, [x20, 4]
	sbfiz	x3, x0, 4, 32
	add	w5, w0, 1
	add	x4, x19, x3
	add	w0, w1, w0
	and	x1, x0, 63
	sxth	w0, w5
	add	x1, x1, 2
	cmp	w2, w0
	ldr	x1, [x20, x1, lsl 3]
	ldr	w1, [x1, 28]
	str	w1, [x4, 4]
	str	xzr, [x4, 8]
	str	wzr, [x19, x3]
	bhi	.L1194
	uxth	w1, w2
.L1193:
	ldrh	w0, [x20, 4]
	add	w0, w1, w0
	and	w0, w0, 63
	strh	w0, [x20, 4]
	str	w2, [x19, 512]
.L1195:
	ldr	x1, [x21, 32]
	mov	w0, 4
	blr	x1
	mov	w0, 0
.L1189:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1207:
	ldr	x1, .LC628
	mov	w3, 32
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w2, [x29, 72]
	cbnz	w2, .L1192
	mov	w2, 0
	mov	w1, 0
	b	.L1193
.L1197:
	mov	w0, -1
	b	.L1189
.L1204:
	ldr	x3, .LC623
	mov	w2, 3720
	ldr	x1, .LC624
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1189
.L1205:
	ldr	x3, .LC626
	mov	w2, 3721
	ldr	x1, .LC624
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1189
	.size	VCTRL_ReportOccupiedFrame, .-VCTRL_ReportOccupiedFrame
	.align	3
.LC623:
	.xword	.LC204
	.align	3
.LC624:
	.xword	.LC5
	.align	3
.LC626:
	.xword	.LC625
	.align	3
.LC627:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC628:
	.xword	.LC616
	.align	3
.LC629:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanImgNum
	.type	VCTRL_GetChanImgNum, %function
VCTRL_GetChanImgNum:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	x22, x1
	mov	x21, x2
	mov	x23, x3
	bl	_mcount
	ldr	x20, .LC630
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1217
	mov	w0, w19
	bl	VCTRL_GetChanVoQue
	cbz	x0, .L1211
	mov	x2, x23
	mov	x1, x21
	bl	GetQueueImgNum
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w3, [x0, 608]
	cbz	w3, .L1218
	cmp	w3, 16
	beq	.L1219
	cmp	w3, 17
	beq	.L1220
	cmp	w3, 15
	beq	.L1221
	cmp	w3, 18
	beq	.L1222
	mov	w0, 2
	str	w0, [x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1218:
	add	x0, x0, 356352
	ldr	w0, [x0, 3792]
	str	w0, [x22]
.L1208:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1211:
	str	wzr, [x23]
	str	wzr, [x21]
	str	wzr, [x22]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1219:
	add	x0, x0, 331776
	ldr	w0, [x0, 2792]
	str	w0, [x22]
	b	.L1208
	.p2align 3
.L1220:
	mov	w0, 9
	str	w0, [x22]
	b	.L1208
	.p2align 3
.L1221:
	add	x0, x0, 11456512
	ldr	w0, [x0, 1000]
	str	w0, [x22]
	b	.L1208
	.p2align 3
.L1222:
	ldr	x2, .LC633
	mov	w0, 32
	ldr	x1, .LC635
	add	x2, x2, 128
	bl	dprint_vfmw
	b	.L1208
	.p2align 3
.L1217:
	ldr	x3, .LC631
	mov	w2, 6907
	ldr	x1, .LC632
	bl	dprint_vfmw
	b	.L1208
	.size	VCTRL_GetChanImgNum, .-VCTRL_GetChanImgNum
	.align	3
.LC630:
	.xword	.LANCHOR0
	.align	3
.LC631:
	.xword	.LC8
	.align	3
.LC632:
	.xword	.LC5
	.align	3
.LC633:
	.xword	.LANCHOR4
	.align	3
.LC635:
	.xword	.LC634
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanState
	.type	VCTRL_GetChanState, %function
VCTRL_GetChanState:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, 31
	bhi	.L1233
	cbz	x19, .L1234
	ldr	x21, .LC643
	ldr	x0, [x21, w20, sxtw 3]
	cbz	x0, .L1235
	ldr	x0, .LC646
	mov	x2, 100
	mov	w1, 0
	str	wzr, [x29, 68]
	stp	wzr, wzr, [x29, 60]
	ldr	x3, [x0, 96]
	mov	x0, x19
	blr	x3
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w0, [x0, 1224]
	str	w0, [x19, 32]
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w0, [x0, 1228]
	str	w0, [x19, 36]
	ldr	x0, [x21, w20, sxtw 3]
	ldr	w0, [x0, 1232]
	str	w0, [x19, 44]
	ldr	x5, [x21, w20, sxtw 3]
	add	x0, x5, 294912
	ldrsb	w0, [x0, 2170]
	cmp	w0, wzr
	ble	.L1231
	mov	x2, 58226
	sub	w4, w0, #1
	mov	w3, 100
	movk	x2, 0x4, lsl 16
	add	x0, x5, 319488
	mov	w1, 0
	umaddl	x2, w4, w3, x2
	add	x0, x0, 782
	add	x3, x5, x2
	.p2align 2
.L1230:
	ldrsb	w2, [x0], 100
	cmp	w2, 3
	csinc	w1, w1, w1, ne
	cmp	x0, x3
	bne	.L1230
.L1228:
	str	w1, [x19, 84]
	add	x3, x29, 68
	add	x2, x29, 64
	mov	w0, w20
	ldr	x4, [x21, w20, sxtw 3]
	add	x1, x29, 60
	sxtw	x22, w20
	add	x4, x4, 294912
	ldrsb	w4, [x4, 2170]
	str	w4, [x19, 92]
	bl	VCTRL_GetChanImgNum
	ldr	x2, .LC647
	lsl	x0, x22, 4
	add	x22, x0, x22, lsl 2
	add	x1, x29, 72
	add	x2, x2, 760
	mov	w0, w20
	ldp	w4, w3, [x29, 64]
	add	x2, x2, x22, lsl 4
	sub	x2, x2, x22
	add	w3, w4, w3
	str	w3, [x19, 48]
	ldr	w3, [x2, 20]
	str	w3, [x19, 96]
	ldr	w2, [x2, 8]
	str	w2, [x19, 20]
	bl	SM_GetInfo
	ldp	w1, w2, [x29, 88]
	ldr	w0, [x29, 80]
	cmp	w2, 10
	stp	w1, w0, [x19, 52]
	cset	w0, gt
	str	w0, [x19, 80]
	mov	x0, 16464
	ldr	x1, [x21, w20, sxtw 3]
	movk	x0, 0x5, lsl 16
	add	x0, x1, x0
	ldrb	w0, [x0, 3632]
	and	w0, w0, 1
	str	w0, [x19, 88]
.L1223:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1233:
	ldr	x3, .LC639
	mov	w2, 1467
	ldr	x1, .LC640
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1235:
	ldr	x3, .LC645
	mov	w2, 1470
	ldr	x1, .LC640
	bl	dprint_vfmw
	b	.L1223
.L1231:
	mov	w1, 0
	b	.L1228
.L1234:
	ldr	x3, .LC642
	mov	w2, 1469
	ldr	x1, .LC640
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1223
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	3
.LC639:
	.xword	.LC638
	.align	3
.LC640:
	.xword	.LC5
	.align	3
.LC642:
	.xword	.LC641
	.align	3
.LC643:
	.xword	.LANCHOR0
	.align	3
.LC645:
	.xword	.LC644
	.align	3
.LC646:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC647:
	.xword	.LANCHOR5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanWidth
	.type	VCTRL_GetChanWidth, %function
VCTRL_GetChanWidth:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1240
	ldr	x0, .LC651
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1241
	ldr	w0, [x0, 1324]
.L1238:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1240:
	ldr	x3, .LC649
	mov	w2, 6972
	ldr	x1, .LC650
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1238
.L1241:
	ldr	x3, .LC652
	mov	w2, 6973
	ldr	x1, .LC650
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1238
	.size	VCTRL_GetChanWidth, .-VCTRL_GetChanWidth
	.align	3
.LC649:
	.xword	.LC204
	.align	3
.LC650:
	.xword	.LC5
	.align	3
.LC651:
	.xword	.LANCHOR0
	.align	3
.LC652:
	.xword	.LC8
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanHeight
	.type	VCTRL_GetChanHeight, %function
VCTRL_GetChanHeight:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1246
	ldr	x0, .LC655
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1247
	ldr	w0, [x0, 1328]
.L1244:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1246:
	ldr	x3, .LC653
	mov	w2, 6980
	ldr	x1, .LC654
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1244
.L1247:
	ldr	x3, .LC656
	mov	w2, 6981
	ldr	x1, .LC654
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1244
	.size	VCTRL_GetChanHeight, .-VCTRL_GetChanHeight
	.align	3
.LC653:
	.xword	.LC204
	.align	3
.LC654:
	.xword	.LC5
	.align	3
.LC655:
	.xword	.LANCHOR0
	.align	3
.LC656:
	.xword	.LC8
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetChanCapLevel
	.type	VCTRL_GetChanCapLevel, %function
VCTRL_GetChanCapLevel:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1252
	ldr	x0, .LC659
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1251
	ldr	w0, [x0, 36]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1252:
	ldr	x3, .LC657
	mov	w2, 6988
	ldr	x1, .LC658
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1251:
	mov	w0, 33
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetChanCapLevel, .-VCTRL_GetChanCapLevel
	.align	3
.LC657:
	.xword	.LC204
	.align	3
.LC658:
	.xword	.LC5
	.align	3
.LC659:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetVdecExtra
	.type	VCTRL_SetVdecExtra, %function
VCTRL_SetVdecExtra:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x20, .LC660
	add	w0, w21, 4096
	mov	w1, 10000
	add	w0, w0, 904
	mov	w2, w21
	cmp	w0, w1
	str	w21, [x20, 3544]
	bhi	.L1258
.L1254:
	mov	w3, 5000
	mov	w1, -5000
	cmp	w2, w3
	add	w0, w19, 4096
	csel	w2, w2, w3, le
	add	w0, w0, 904
	cmp	w2, w1
	mov	w3, 10000
	csel	w2, w2, w1, ge
	str	w19, [x20, 3548]
	cmp	w0, w3
	str	w2, [x20, 3544]
	bhi	.L1259
.L1255:
	mov	w2, 5000
	mov	w0, -5000
	cmp	w19, w2
	csel	w19, w19, w2, le
	cmp	w19, w0
	csel	w19, w19, w0, ge
	str	w19, [x20, 3548]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1258:
	ldr	x1, .LC662
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w2, [x20, 3544]
	b	.L1254
	.p2align 3
.L1259:
	ldr	x1, .LC664
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	w19, [x20, 3548]
	b	.L1255
	.size	VCTRL_SetVdecExtra, .-VCTRL_SetVdecExtra
	.align	3
.LC660:
	.xword	.LANCHOR3
	.align	3
.LC662:
	.xword	.LC661
	.align	3
.LC664:
	.xword	.LC663
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VfmwProcGetHandler
	.type	VfmwProcGetHandler, %function
VfmwProcGetHandler:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cbz	w19, .L1264
	ldr	x3, .LC667
	mov	w1, 1
	ldr	x0, .LC665
	add	x3, x3, 152
	b	.L1262
	.p2align 3
.L1263:
	ldr	w4, [x3, x4]
	add	w1, w1, 1
	ubfiz	x2, x1, 4, 32
	cmp	w4, w19
	add	x2, x3, x2
	beq	.L1261
	ldr	x0, [x2, 8]
.L1262:
	ubfiz	x4, x1, 4, 32
	cbnz	x0, .L1263
.L1261:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1264:
	ldr	x0, .LC666
	b	.L1261
	.size	VfmwProcGetHandler, .-VfmwProcGetHandler
	.align	3
.LC665:
	.xword	VfmwProc_SetErrorThread
	.align	3
.LC666:
	.xword	VfmwProc_SetPrintLevel
	.align	3
.LC667:
	.xword	.LANCHOR4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetDbgOption
	.type	VCTRL_SetDbgOption, %function
VCTRL_SetDbgOption:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1275
	cbz	w19, .L1272
	ldr	x4, .LC671
	mov	w0, 1
	ldr	x5, .LC669
	add	x4, x4, 152
	b	.L1268
	.p2align 3
.L1273:
	ldr	w6, [x4, x6]
	add	w0, w0, 1
	ubfiz	x3, x0, 4, 32
	cmp	w19, w6
	add	x3, x4, x3
	beq	.L1267
	ldr	x5, [x3, 8]
.L1268:
	ubfiz	x6, x0, 4, 32
	cbnz	x5, .L1273
	ldr	x1, .LC673
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
.L1275:
	mov	w0, -2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1272:
	ldr	x5, .LC670
.L1267:
	mov	x0, x20
	blr	x5
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetDbgOption, .-VCTRL_SetDbgOption
	.align	3
.LC669:
	.xword	VfmwProc_SetErrorThread
	.align	3
.LC670:
	.xword	VfmwProc_SetPrintLevel
	.align	3
.LC671:
	.xword	.LANCHOR4
	.align	3
.LC673:
	.xword	.LC672
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetLastFrameIdPlus2
	.type	VCTRL_GetLastFrameIdPlus2, %function
VCTRL_GetLastFrameIdPlus2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1280
	ldr	x0, .LC677
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1279
	ldr	w0, [x0, 444]
.L1278:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1280:
	ldr	x3, .LC675
	mov	w2, 8109
	ldr	x1, .LC676
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1278
.L1279:
	mov	w0, -1
	b	.L1278
	.size	VCTRL_GetLastFrameIdPlus2, .-VCTRL_GetLastFrameIdPlus2
	.align	3
.LC675:
	.xword	.LC204
	.align	3
.LC676:
	.xword	.LC5
	.align	3
.LC677:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetLastFrameIdPlus2
	.type	VCTRL_SetLastFrameIdPlus2, %function
VCTRL_SetLastFrameIdPlus2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	bhi	.L1287
	ldr	x0, .LC680
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1281
	str	w20, [x0, 444]
.L1281:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1287:
	ldr	x3, .LC678
	mov	w2, 8121
	ldr	x1, .LC679
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetLastFrameIdPlus2, .-VCTRL_SetLastFrameIdPlus2
	.align	3
.LC678:
	.xword	.LC204
	.align	3
.LC679:
	.xword	.LC5
	.align	3
.LC680:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetLastFrameState
	.type	VCTRL_SetLastFrameState, %function
VCTRL_SetLastFrameState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w19, 31
	bhi	.L1294
	ldr	x0, .LC683
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1288
	str	w20, [x0, 448]
.L1288:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1294:
	ldr	x3, .LC681
	mov	w2, 8133
	ldr	x1, .LC682
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetLastFrameState, .-VCTRL_SetLastFrameState
	.align	3
.LC681:
	.xword	.LC204
	.align	3
.LC682:
	.xword	.LC5
	.align	3
.LC683:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ReportLastFrame
	.type	VCTRL_ReportLastFrame, %function
VCTRL_ReportLastFrame:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	w20, w1
	mov	x0, x30
	bl	_mcount
	cbz	w20, .L1302
	cmp	w20, 1
	mov	w0, 3
	mov	w1, 4
	csel	w0, w0, w1, eq
	cmp	w19, 31
	bhi	.L1309
.L1299:
	ldr	x21, .LC686
	ldr	x1, [x21, w19, sxtw 3]
	cbz	x1, .L1300
	str	w0, [x1, 448]
.L1300:
	ldr	x0, .LC687
	ldr	x4, [x0, 240]
	cbz	x4, .L1301
	add	x2, x29, 64
	mov	w3, 4
	mov	w1, 115
	mov	w0, w19
	str	w20, [x2, -8]!
	blr	x4
.L1301:
	ldr	x4, [x21, w19, sxtw 3]
	mov	w3, w20
	ldr	x1, .LC689
	mov	w2, w19
	mov	w0, 1
	ldr	w4, [x4, 448]
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1302:
	cmp	w19, 31
	mov	w0, 2
	bls	.L1299
.L1309:
	ldr	x3, .LC684
	mov	w2, 8133
	ldr	x1, .LC685
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, .LC686
	b	.L1300
	.size	VCTRL_ReportLastFrame, .-VCTRL_ReportLastFrame
	.align	3
.LC684:
	.xword	.LC204
	.align	3
.LC685:
	.xword	.LC5
	.align	3
.LC686:
	.xword	.LANCHOR0
	.align	3
.LC687:
	.xword	.LANCHOR5
	.align	3
.LC689:
	.xword	.LC688
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OutputLastFrame
	.type	VCTRL_OutputLastFrame, %function
VCTRL_OutputLastFrame:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC690
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 331776
	ldr	w1, [x0, 72]
	cmp	w1, 17
	bls	.L1335
.L1330:
	mov	w19, -1
.L1327:
	mov	w0, w20
	mov	w1, 1
	bl	VCTRL_ReportLastFrame
	ldr	x1, .LC693
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1335:
	ldr	x2, .LC691
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx1313
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx1313:
	.section	.rodata
	.align	0
	.align	2
.L1313:
	.byte	(.L1312 - .Lrtx1313) / 4
	.byte	(.L1314 - .Lrtx1313) / 4
	.byte	(.L1315 - .Lrtx1313) / 4
	.byte	(.L1316 - .Lrtx1313) / 4
	.byte	(.L1330 - .Lrtx1313) / 4
	.byte	(.L1317 - .Lrtx1313) / 4
	.byte	(.L1318 - .Lrtx1313) / 4
	.byte	(.L1330 - .Lrtx1313) / 4
	.byte	(.L1319 - .Lrtx1313) / 4
	.byte	(.L1320 - .Lrtx1313) / 4
	.byte	(.L1321 - .Lrtx1313) / 4
	.byte	(.L1321 - .Lrtx1313) / 4
	.byte	(.L1321 - .Lrtx1313) / 4
	.byte	(.L1322 - .Lrtx1313) / 4
	.byte	(.L1330 - .Lrtx1313) / 4
	.byte	(.L1323 - .Lrtx1313) / 4
	.byte	(.L1324 - .Lrtx1313) / 4
	.byte	(.L1325 - .Lrtx1313) / 4
	.text
	.p2align 3
.L1312:
	add	x0, x0, 80
	bl	H264DEC_GetRemainImg
	mov	w19, w0
	.p2align 2
.L1311:
	cmn	w19, #1
	beq	.L1327
	cbnz	w19, .L1336
	mov	w0, w20
	mov	w1, 0
	bl	VCTRL_ReportLastFrame
	ldr	x1, .LC695
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1314:
	add	x0, x0, 80
	bl	VC1DEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1315:
	add	x0, x0, 80
	bl	MPEG4DEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1316:
	add	x0, x0, 80
	bl	MPEG2DEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1317:
	add	x0, x0, 80
	bl	DIVX3DEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1318:
	add	x0, x0, 80
	bl	AVSDEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1319:
	add	x0, x0, 80
	bl	REAL8DEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1320:
	add	x0, x0, 80
	bl	REAL9DEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1321:
	add	x0, x0, 80
	bl	VP6DEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1322:
	add	x0, x0, 80
	bl	VP8DEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1323:
	add	x0, x0, 80
	bl	MVC_DEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1324:
	add	x0, x0, 80
	bl	HEVCDEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1325:
	add	x0, x0, 80
	bl	VP9DEC_GetRemainImg
	mov	w19, w0
	b	.L1311
	.p2align 3
.L1336:
	mov	w1, w19
	mov	w0, w20
	bl	VCTRL_ReportLastFrame
	ldr	x1, .LC697
	sub	w2, w19, #2
	mov	w0, 2
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_OutputLastFrame, .-VCTRL_OutputLastFrame
	.align	3
.LC690:
	.xword	.LANCHOR0
	.align	3
.LC691:
	.xword	.L1313
	.align	3
.LC693:
	.xword	.LC692
	.align	3
.LC695:
	.xword	.LC694
	.align	3
.LC697:
	.xword	.LC696
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_PostProc
	.type	VCTRL_PostProc, %function
VCTRL_PostProc:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x23, x2
	mov	w22, w3
	bl	_mcount
	ldr	x21, .LC698
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1371
	ldr	w1, [x0, 608]
	ldr	w24, [x0, 1272]
	cmp	w1, 17
	bls	.L1372
.L1337:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1372:
	ldr	x2, .LC701
	ldrh	w1, [x2,w1,uxtw #1]
	adr	x2, .Lrtx1341
	add	x1, x2, w1, sxth #2
	br	x1
.Lrtx1341:
	.section	.rodata
	.align	0
	.align	2
.L1341:
	.2byte	(.L1340 - .Lrtx1341) / 4
	.2byte	(.L1342 - .Lrtx1341) / 4
	.2byte	(.L1343 - .Lrtx1341) / 4
	.2byte	(.L1344 - .Lrtx1341) / 4
	.2byte	(.L1337 - .Lrtx1341) / 4
	.2byte	(.L1345 - .Lrtx1341) / 4
	.2byte	(.L1346 - .Lrtx1341) / 4
	.2byte	(.L1337 - .Lrtx1341) / 4
	.2byte	(.L1347 - .Lrtx1341) / 4
	.2byte	(.L1348 - .Lrtx1341) / 4
	.2byte	(.L1349 - .Lrtx1341) / 4
	.2byte	(.L1349 - .Lrtx1341) / 4
	.2byte	(.L1349 - .Lrtx1341) / 4
	.2byte	(.L1350 - .Lrtx1341) / 4
	.2byte	(.L1337 - .Lrtx1341) / 4
	.2byte	(.L1351 - .Lrtx1341) / 4
	.2byte	(.L1352 - .Lrtx1341) / 4
	.2byte	(.L1353 - .Lrtx1341) / 4
	.text
	.p2align 3
.L1353:
	add	x0, x0, 331776
	mov	w3, w22
	mov	w2, w24
	mov	w1, w20
	add	x0, x0, 80
	bl	VP9DEC_VDMPostProc
	cmp	w24, 1
	beq	.L1337
.L1369:
	ldr	x0, [x21, w19, sxtw 3]
.L1370:
	add	x0, x0, 331776
	str	xzr, [x0, 88]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1352:
	add	x0, x0, 331776
	mov	w5, w22
	mov	w4, w24
	mov	x3, x23
	mov	w2, 1
	mov	w1, w20
	add	x0, x0, 80
	bl	HEVCDEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	ldrb	w0, [x0, 87]
	cmp	w0, 1
	beq	.L1373
.L1356:
	cmp	w24, 1
	beq	.L1337
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	str	xzr, [x0, 2464]
	b	.L1337
	.p2align 3
.L1351:
	add	x0, x0, 331776
	mov	w1, w20
	mov	w2, 1
	add	x0, x0, 80
	bl	MVC_DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	ldrb	w1, [x0, 81]
	cmp	w1, 1
	beq	.L1374
	str	xzr, [x0, 312]
	b	.L1337
	.p2align 3
.L1350:
	add	x0, x0, 331776
	mov	w1, w20
	add	x0, x0, 80
	bl	VP8DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	str	xzr, [x0, 88]
	b	.L1337
	.p2align 3
.L1349:
	add	x0, x0, 331776
	mov	w1, w20
	add	x0, x0, 80
	bl	VP6DEC_VDMPostProc
	b	.L1369
	.p2align 3
.L1348:
	mov	w0, w22
	bl	VDMDRV_GetMb0QpInCurrPic
	mov	w2, w0
	ldr	x3, [x21, w19, sxtw 3]
	mov	w1, w20
	add	x0, x3, 331776
	add	x0, x0, 80
	bl	REAL9DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	str	xzr, [x0, 88]
	b	.L1337
	.p2align 3
.L1347:
	mov	w0, w22
	bl	VDMDRV_GetMb0QpInCurrPic
	mov	w2, w0
	ldr	x3, [x21, w19, sxtw 3]
	mov	w1, w20
	add	x0, x3, 331776
	add	x0, x0, 80
	bl	REAL8DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	str	xzr, [x0, 88]
	b	.L1337
	.p2align 3
.L1346:
	add	x0, x0, 331776
	mov	w1, w20
	add	x0, x0, 80
	bl	AVSDEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	ldrb	w1, [x0, 80]
	cmp	w1, 1
	beq	.L1375
	str	xzr, [x0, 104]
	b	.L1337
	.p2align 3
.L1345:
	mov	w0, w22
	bl	VDMDRV_GetSwitchRounding
	mov	w2, w0
	ldr	x3, [x21, w19, sxtw 3]
	mov	w1, w20
	add	x0, x3, 331776
	add	x0, x0, 80
	bl	DIVX3DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	str	xzr, [x0, 88]
	b	.L1337
	.p2align 3
.L1344:
	add	x0, x0, 331776
	mov	w1, w20
	add	x0, x0, 80
	bl	MPEG2DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 421888
	ldrb	w1, [x1, 954]
	cmp	w1, 1
	bne	.L1370
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 421888
	strb	wzr, [x1, 954]
	b	.L1370
	.p2align 3
.L1343:
	add	x0, x0, 331776
	mov	w1, w20
	mov	x2, x23
	add	x0, x0, 80
	bl	MPEG4DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 352256
	ldrb	w1, [x1, 2972]
	cmp	w1, 1
	beq	.L1376
.L1359:
	add	x0, x0, 331776
	str	xzr, [x0, 1120]
	b	.L1337
	.p2align 3
.L1342:
	add	x0, x0, 331776
	mov	w1, w20
	add	x0, x0, 80
	bl	VC1DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 344064
	ldrb	w1, [x1, 2607]
	cmp	w1, 1
	bne	.L1370
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 344064
	strb	wzr, [x1, 2607]
	b	.L1370
	.p2align 3
.L1340:
	add	x0, x0, 331776
	mov	w5, w22
	mov	w4, w24
	mov	x3, x23
	mov	w2, 1
	mov	w1, w20
	add	x0, x0, 80
	bl	H264DEC_VDMPostProc
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 344064
	ldrb	w0, [x0, 2720]
	cmp	w0, 1
	beq	.L1377
.L1354:
	cmp	w24, 1
	beq	.L1337
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	str	xzr, [x0, 696]
	b	.L1337
	.p2align 3
.L1375:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	strb	wzr, [x0, 80]
	str	xzr, [x0, 104]
	b	.L1337
	.p2align 3
.L1374:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	strb	wzr, [x0, 81]
	str	xzr, [x0, 312]
	b	.L1337
	.p2align 3
.L1371:
	ldr	x3, .LC699
	mov	w2, 4676
	ldr	x1, .LC700
	bl	dprint_vfmw
	b	.L1337
	.p2align 3
.L1376:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 352256
	strb	wzr, [x1, 2972]
	b	.L1359
.L1377:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 344064
	strb	wzr, [x0, 2720]
	b	.L1354
.L1373:
	mov	w0, w19
	bl	VCTRL_OutputLastFrame
	ldr	x0, [x21, w19, sxtw 3]
	add	x0, x0, 331776
	strb	wzr, [x0, 87]
	b	.L1356
	.size	VCTRL_PostProc, .-VCTRL_PostProc
	.align	3
.LC698:
	.xword	.LANCHOR0
	.align	3
.LC699:
	.xword	.LC8
	.align	3
.LC700:
	.xword	.LC5
	.align	3
.LC701:
	.xword	.L1341
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_VdmPostProc
	.type	VCTRL_VdmPostProc, %function
VCTRL_VdmPostProc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	mov	w22, w3
	bl	_mcount
	cmp	w19, 31
	bhi	.L1386
	ldr	x0, .LC704
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L1387
	ldr	w0, [x0, 8]
	cmp	w0, 1
	beq	.L1382
	ldr	x3, .LC706
	mov	w2, 4871
	ldr	x1, .LC703
	mov	w0, 0
	bl	dprint_vfmw
.L1378:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1382:
	mov	w0, w19
	bl	VCTRL_GetDecParam
	cbz	x0, .L1378
	mov	w3, w22
	mov	x2, x21
	mov	w1, w20
	mov	w0, w19
	bl	VCTRL_PostProc
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1386:
	ldr	x3, .LC702
	mov	w2, 4869
	ldr	x1, .LC703
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1387:
	ldr	x3, .LC705
	mov	w2, 4870
	ldr	x1, .LC703
	bl	dprint_vfmw
	b	.L1378
	.size	VCTRL_VdmPostProc, .-VCTRL_VdmPostProc
	.align	3
.LC702:
	.xword	.LC407
	.align	3
.LC703:
	.xword	.LC5
	.align	3
.LC704:
	.xword	.LANCHOR0
	.align	3
.LC705:
	.xword	.LC348
	.align	3
.LC706:
	.xword	.LC412
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SvdecLastFrame
	.type	VCTRL_SvdecLastFrame, %function
VCTRL_SvdecLastFrame:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	add	w1, w20, 2
	mov	w0, w19
	bl	VCTRL_ReportLastFrame
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SvdecLastFrame, .-VCTRL_SvdecLastFrame
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Get_YuvFormat
	.type	Get_YuvFormat, %function
Get_YuvFormat:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w19, 6
	bls	.L1407
	ldr	x1, .LC709
	mov	w3, w19
	mov	w2, 8854
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 13
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1407:
	ldr	x0, .LC707
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1392
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1392:
	.section	.rodata
	.align	0
	.align	2
.L1392:
	.byte	(.L1391 - .Lrtx1392) / 4
	.byte	(.L1393 - .Lrtx1392) / 4
	.byte	(.L1394 - .Lrtx1392) / 4
	.byte	(.L1395 - .Lrtx1392) / 4
	.byte	(.L1396 - .Lrtx1392) / 4
	.byte	(.L1397 - .Lrtx1392) / 4
	.byte	(.L1398 - .Lrtx1392) / 4
	.text
	.p2align 3
.L1397:
	cmp	w20, 1
	mov	w1, 12
	mov	w0, 13
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1398:
	cmp	w20, 1
	mov	w0, 7
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1391:
	cmp	w20, 1
	mov	w0, 6
	csel	w0, wzr, w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1393:
	cmp	w20, 1
	mov	w1, 8
	mov	w0, 2
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1394:
	cmp	w20, 1
	mov	w1, 10
	mov	w0, 4
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1395:
	cmp	w20, 1
	mov	w1, 9
	mov	w0, 3
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1396:
	cmp	w20, 1
	mov	w1, 11
	mov	w0, 5
	csel	w0, w0, w1, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	Get_YuvFormat, .-Get_YuvFormat
	.align	3
.LC707:
	.xword	.L1392
	.align	3
.LC709:
	.xword	.LC708
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDH_PutUsrdecFrame
	.type	VDH_PutUsrdecFrame, %function
VDH_PutUsrdecFrame:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w21, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x20, 40]
	mov	w0, w21
	bl	FSP_GetLogicIdByPhyAddr
	cmn	w0, #1
	mov	w22, w0
	beq	.L1417
	ldr	w0, [x20, 4]
	cmp	w0, 1
	beq	.L1411
	mov	w0, w21
	mov	w2, 0
	mov	w1, w22
	bl	FSP_ClearLogicFs
	mov	w0, 0
.L1410:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1411:
	ldr	w0, [x20, 48]
	bl	MEM_Phy2Vir
	cbz	x0, .L1418
.L1412:
	mov	w1, w22
	mov	w0, w21
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L1419
	str	w22, [x0, 180]
	mov	w23, 1
	ldr	x0, [x20, 64]
	str	x0, [x19, 632]
	ldr	x0, [x20, 64]
	str	x0, [x19, 640]
	ldr	x0, [x20, 64]
	str	x0, [x19, 648]
	ldr	x0, [x20, 64]
	str	x0, [x19, 656]
	stp	w23, wzr, [x19, 8]
	stp	wzr, wzr, [x19, 16]
	ldr	w0, [x20, 40]
	str	w0, [x19, 28]
	str	w0, [x19, 44]
	str	w0, [x19, 60]
	ldr	w1, [x20, 48]
	str	w1, [x19, 32]
	str	w1, [x19, 48]
	str	w1, [x19, 64]
	bl	MEM_Phy2Vir
	mov	x1, x0
	ldr	w0, [x19, 32]
	str	x1, [x19, 544]
	str	x1, [x19, 560]
	bl	MEM_Phy2Vir
	str	x0, [x19, 552]
	str	x0, [x19, 568]
	mov	x2, 4
	ldr	w0, [x19, 28]
	ldr	w1, [x20, 44]
	ldr	w4, [x19, 32]
	add	w1, w0, w1
	str	w1, [x19, 36]
	ldr	x3, .LC716
	ldr	w0, [x20, 44]
	str	wzr, [x19, 112]
	add	w0, w4, w0
	str	w0, [x19, 40]
	ldr	w0, [x20, 12]
	str	w0, [x19, 128]
	ldr	x3, [x3, 96]
	ldr	w0, [x20, 16]
	str	w0, [x19, 132]
	ldr	w0, [x20, 12]
	str	w0, [x19, 136]
	lsr	w1, w0, 1
	ldr	w0, [x20, 16]
	stp	w0, w1, [x19, 140]
	lsr	w0, w0, 1
	str	w0, [x19, 148]
	mov	w1, 0
	add	x0, x19, 124
	ldr	w4, [x20, 44]
	stp	wzr, w4, [x19, 160]
	str	wzr, [x19, 184]
	str	w23, [x19, 196]
	blr	x3
	ldrb	w0, [x19, 125]
	ldrb	w1, [x19, 124]
	and	w0, w0, -4
	and	w1, w1, 224
	orr	w0, w0, 12
	bfi	w1, w23, 5, 3
	bfi	w0, w23, 4, 2
	strb	w1, [x19, 124]
	strb	w0, [x19, 125]
	ldr	w0, [x20, 24]
	str	w0, [x19, 244]
	bl	MEM_Phy2Vir
	str	x0, [x19, 576]
	ldr	w1, [x20]
	ldr	w0, [x20, 8]
	bl	Get_YuvFormat
	cmp	w0, 13
	beq	.L1420
	str	w0, [x19, 504]
	mov	w24, 20
	mov	w2, w23
	mov	w1, w22
	ldr	w3, [x20, 56]
	mov	w0, w21
	str	w3, [x19, 480]
	ldr	w3, [x20, 60]
	str	w3, [x19, 476]
	ldr	w3, [x20, 52]
	str	w3, [x19, 484]
	str	w24, [x19, 412]
	bl	FSP_SetDisplay
	ldr	x2, .LC719
	mov	x4, x19
	mov	w1, w24
	mov	w0, w21
	ldr	x2, [x2, w21, sxtw 3]
	add	x2, x2, 331776
	add	x3, x2, 88
	add	x2, x2, 80
	bl	InsertImgToVoQueue
	cmp	w0, 1
	mov	w0, 0
	beq	.L1410
	ldr	x1, [x19, 600]
	mov	w0, w21
	bl	FreeUsdByDec
	str	xzr, [x19, 600]
	ldr	x1, [x19, 608]
	mov	w0, w21
	bl	FreeUsdByDec
	str	xzr, [x19, 608]
	mov	w0, w21
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, -1
	b	.L1410
	.p2align 3
.L1418:
	ldr	w0, [x20, 4]
	cmp	w0, 1
	bne	.L1412
	ldr	x1, .LC713
	mov	w0, 0
	ldr	w2, [x20, 48]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1410
.L1417:
	ldr	x1, .LC711
	mov	w0, 0
	ldr	w2, [x20, 40]
	bl	dprint_vfmw
	mov	w0, w22
	b	.L1410
.L1420:
	ldr	x1, .LC718
	mov	w2, w0
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1410
.L1419:
	ldr	x1, .LC715
	mov	w2, 5363
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1410
	.size	VDH_PutUsrdecFrame, .-VDH_PutUsrdecFrame
	.align	3
.LC711:
	.xword	.LC710
	.align	3
.LC713:
	.xword	.LC712
	.align	3
.LC715:
	.xword	.LC714
	.align	3
.LC716:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC718:
	.xword	.LC717
	.align	3
.LC719:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_PutUsrdecFrame
	.type	VCTRL_PutUsrdecFrame, %function
VCTRL_PutUsrdecFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x20, .LC720
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1429
	cbz	x21, .L1430
	ldr	w2, [x0, 608]
	cmp	w2, 20
	bne	.L1431
	ldr	x3, .LC727
	mov	x1, x21
	mov	x2, 72
	add	x0, x0, 536
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	add	x1, x1, 536
	bl	VDH_PutUsrdecFrame
	cbnz	w0, .L1432
.L1423:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1431:
	ldr	x1, .LC726
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1423
	.p2align 3
.L1432:
	ldr	x1, .LC729
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1423
.L1430:
	ldr	x3, .LC724
	mov	w2, 5511
	ldr	x1, .LC722
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1423
.L1429:
	ldr	x3, .LC721
	mov	w2, 5510
	ldr	x1, .LC722
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1423
	.size	VCTRL_PutUsrdecFrame, .-VCTRL_PutUsrdecFrame
	.align	3
.LC720:
	.xword	.LANCHOR0
	.align	3
.LC721:
	.xword	.LC8
	.align	3
.LC722:
	.xword	.LC5
	.align	3
.LC724:
	.xword	.LC723
	.align	3
.LC726:
	.xword	.LC725
	.align	3
.LC727:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC729:
	.xword	.LC728
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetHardware
	.type	VCTRL_ResetHardware, %function
VCTRL_ResetHardware:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, w19
	bl	SCDDRV_ResetSCD
	mov	w0, w19
	bl	VDMDRV_ResetVDH
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_ResetHardware, .-VCTRL_ResetHardware
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CanBeDecodedByHardWare
	.type	VCTRL_CanBeDecodedByHardWare, %function
VCTRL_CanBeDecodedByHardWare:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 4
	mov	w0, 0
	ccmp	w19, 7, 4, ne
	beq	.L1435
	mov	w0, w19
	bl	VCTRL_CanBeDecodedByHardWare.part.18
.L1435:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_CanBeDecodedByHardWare, .-VCTRL_CanBeDecodedByHardWare
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IsChanOpenAndRun
	.type	VCTRL_IsChanOpenAndRun, %function
VCTRL_IsChanOpenAndRun:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 4]
	cmp	w0, 1
	beq	.L1440
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1440:
	ldr	w0, [x19, 8]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IsChanOpenAndRun, .-VCTRL_IsChanOpenAndRun
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_OpenHardware
	.type	VCTRL_OpenHardware, %function
VCTRL_OpenHardware:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, 31
	bhi	.L1492
	ldr	x20, .LC732
	ldr	x0, [x20, w21, sxtw 3]
	cbz	x0, .L1493
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L1445
	ldr	w0, [x0, 608]
	cmp	w0, 21
	beq	.L1445
	cmp	w0, 7
	ccmp	w0, 4, 4, ne
	beq	.L1441
	bl	VCTRL_CanBeDecodedByHardWare.part.18
	cbz	w0, .L1441
	mov	x19, 0
	mov	w22, 0
	.p2align 2
.L1450:
	cmp	w19, 31
	bhi	.L1449
	ldr	x0, [x20, x19, lsl 3]
	cbz	x0, .L1449
	ldr	w1, [x0, 4]
	cbz	w1, .L1449
	ldr	w1, [x0, 8]
	cbz	w1, .L1449
	ldr	w1, [x0, 20]
	cbz	w1, .L1449
	ldr	w1, [x0, 608]
	cmp	w1, 21
	mov	w0, w1
	beq	.L1449
	cmp	w1, 4
	ccmp	w1, 7, 4, ne
	beq	.L1449
	bl	VCTRL_CanBeDecodedByHardWare.part.18
	cmp	w0, wzr
	csinc	w22, w22, w22, eq
	.p2align 2
.L1449:
	add	x19, x19, 1
	cmp	x19, 32
	bne	.L1450
	cmp	w22, 1
	beq	.L1494
.L1451:
	mov	x0, x20
	add	x3, x20, 256
	mov	w2, 0
	.p2align 2
.L1458:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbz	x1, .L1457
	ldr	w1, [x1, 608]
	cmp	w1, 6
	csinc	w2, w2, wzr, ne
.L1457:
	cmp	x3, x0
	bne	.L1458
	cmp	w2, 1
	beq	.L1495
.L1459:
	ldr	x0, [x20, w21, sxtw 3]
	ldr	w0, [x0, 608]
	cmp	w0, 1
	bne	.L1441
	ldr	x0, .LC737
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L1496
	ldr	x0, .LC738
	ldr	x1, [x0, 56]
	cbz	x1, .L1441
	mov	w0, 0
	blr	x1
	b	.L1441
	.p2align 3
.L1445:
	ldr	x1, .LC736
	mov	w2, 8923
	mov	w0, 0
	bl	dprint_vfmw
.L1441:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1492:
	ldr	x1, .LC731
	mov	w2, 8911
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1494:
	ldr	x19, .LC737
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1497
	mov	w1, 0
	mov	w0, w22
	bl	VDH_Need_Module
.L1454:
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L1455
	ldr	x0, .LC738
	ldr	x1, [x0, 40]
	cbz	x1, .L1498
	mov	w0, 0
	blr	x1
	b	.L1451
.L1495:
	ldr	x0, .LC737
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1499
	mov	w1, 0
	mov	w0, 3
	bl	VDH_Need_Module
	b	.L1459
.L1499:
	ldr	x0, .LC738
	ldr	x1, [x0, 24]
	cbz	x1, .L1500
	mov	w0, 0
	blr	x1
	b	.L1459
.L1497:
	ldr	x0, .LC738
	ldr	x1, [x0, 8]
	cbz	x1, .L1501
	mov	w0, 0
	blr	x1
	b	.L1454
.L1493:
	ldr	x1, .LC734
	mov	w2, 8917
	bl	dprint_vfmw
	b	.L1441
.L1496:
	mov	w1, 0
	mov	w0, 2
	bl	VDH_Need_Module
	b	.L1441
.L1455:
	mov	w1, 0
	mov	w0, 0
	bl	VDH_Need_Module
	b	.L1451
.L1498:
	ldr	x1, .LC739
	mov	w2, 8971
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1451
.L1500:
	ldr	x1, .LC739
	mov	w2, 9002
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1459
.L1501:
	ldr	x1, .LC739
	mov	w2, 8957
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1454
	.size	VCTRL_OpenHardware, .-VCTRL_OpenHardware
	.align	3
.LC731:
	.xword	.LC730
	.align	3
.LC732:
	.xword	.LANCHOR0
	.align	3
.LC734:
	.xword	.LC733
	.align	3
.LC736:
	.xword	.LC735
	.align	3
.LC737:
	.xword	g_HalDisable
	.align	3
.LC738:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC739:
	.xword	.LC89
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StartChan
	.type	VCTRL_StartChan, %function
VCTRL_StartChan:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	cmp	w20, 31
	bhi	.L1513
	ldr	x19, .LC743
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L1514
	ldr	w21, [x0, 4]
	cmp	w21, 1
	bne	.L1515
	ldr	w0, [x0, 608]
	cmp	w0, 21
	beq	.L1516
	mov	w0, w20
	bl	SM_Start
	ldr	x0, [x19, w20, sxtw 3]
	str	w21, [x0, 8]
	ldr	x0, [x19, w20, sxtw 3]
	str	w21, [x0, 12]
	ldr	x0, [x19, w20, sxtw 3]
	str	wzr, [x0, 24]
	ldr	x0, [x19, w20, sxtw 3]
	str	w21, [x0, 16]
	ldr	x1, [x19, w20, sxtw 3]
	ldr	w0, [x1, 20]
	cbnz	w0, .L1508
	str	w21, [x1, 20]
	mov	x1, 0
	ldr	x0, .LC748
	ldr	x5, .LC749
	b	.L1511
	.p2align 3
.L1518:
	ldr	w4, [x2, 20]
	str	w4, [x3, x1, lsl 2]
	ldr	w2, [x2, 20]
	str	w2, [x5, x1, lsl 2]
	add	x1, x1, 1
	cmp	x1, 32
	beq	.L1517
.L1511:
	ldr	x2, [x19, x1, lsl 3]
	add	x3, x0, 1656
	cbnz	x2, .L1518
	add	x2, x0, 1656
	str	wzr, [x5, x1, lsl 2]
	str	wzr, [x2, x1, lsl 2]
	add	x1, x1, 1
	cmp	x1, 32
	bne	.L1511
	.p2align 2
.L1517:
	add	x0, x0, 1656
	bl	VDMDRV_SetPriority
	mov	w0, w20
	bl	VDMDRV_ClearChanIsDec
.L1508:
	mov	w0, w20
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w20
	bl	VCTRL_OpenHardware
	ldr	x19, .LC750
	ldr	x0, .LC751
	mov	x2, 12
	mov	w1, 0
	ldr	x3, [x19, 96]
	blr	x3
	ldr	x3, [x19, 96]
	mov	x2, 720
	ldr	x0, .LC752
	mov	w1, 0
	blr	x3
	ldr	x3, [x19, 96]
	mov	x2, 2
	ldr	x0, .LC753
	mov	w1, 0
	blr	x3
	ldr	x0, .LC754
	mov	x2, 120
	ldr	x3, [x19, 96]
	mov	w1, 0
	blr	x3
	mov	w0, 0
.L1504:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1515:
	ldr	x3, .LC745
	mov	w2, 2506
	ldr	x1, .LC742
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1504
.L1513:
	ldr	x3, .LC741
	mov	w2, 2504
	ldr	x1, .LC742
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1504
.L1516:
	ldr	x3, .LC747
	mov	w2, 2507
	ldr	x1, .LC742
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1504
.L1514:
	ldr	x3, .LC744
	mov	w2, 2505
	ldr	x1, .LC742
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1504
	.size	VCTRL_StartChan, .-VCTRL_StartChan
	.align	3
.LC741:
	.xword	.LC204
	.align	3
.LC742:
	.xword	.LC5
	.align	3
.LC743:
	.xword	.LANCHOR0
	.align	3
.LC744:
	.xword	.LC248
	.align	3
.LC745:
	.xword	.LC437
	.align	3
.LC747:
	.xword	.LC746
	.align	3
.LC748:
	.xword	.LANCHOR6
	.align	3
.LC749:
	.xword	g_ChanCtx
	.align	3
.LC750:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC751:
	.xword	g_TimeRecId
	.align	3
.LC752:
	.xword	g_TimeRecTable
	.align	3
.LC753:
	.xword	g_DataRecId
	.align	3
.LC754:
	.xword	g_DataTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestStartChan, %function
VfmwProc_TestStartChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	mov	w0, w19
	bl	VCTRL_StartChan
	mov	w3, w0
	ldr	x1, .LC757
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStartChan, .-VfmwProc_TestStartChan
	.align	3
.LC757:
	.xword	.LC756
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CloseHardware
	.type	VCTRL_CloseHardware, %function
VCTRL_CloseHardware:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w25, w0
	mov	x0, x30
	mov	w24, 0
	mov	w22, 0
	bl	_mcount
	ldr	x19, .LC758
	mov	w0, 0
	add	x23, x19, 256
	b	.L1529
	.p2align 3
.L1571:
	ldr	w1, [x20, 4]
	cmp	w1, 1
	beq	.L1568
.L1521:
	add	x19, x19, 8
	cmp	x19, x23
	beq	.L1569
.L1529:
	ldr	x20, [x19]
	cbz	x20, .L1521
	ldr	w21, [x20, 608]
	cbnz	w0, .L1522
	ldr	w1, [x20, 4]
	cmp	w1, 1
	beq	.L1570
.L1522:
	cmp	w22, wzr
	ccmp	w21, 1, 0, eq
	beq	.L1571
.L1525:
	cmp	w24, wzr
	ccmp	w21, 6, 0, eq
	bne	.L1521
	ldr	w1, [x20, 4]
	cmp	w1, 1
	bne	.L1521
	ldr	w26, [x20, 8]
.L1549:
	cmp	w26, 1
	add	x19, x19, 8
	csinc	w24, w24, wzr, ne
	cmp	x19, x23
	bne	.L1529
	.p2align 2
.L1569:
	cbnz	w0, .L1530
	ldr	x19, .LC759
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1535
	mov	w0, w25
	bl	SCDDRV_ResetSCD
	mov	w0, w25
	bl	VDMDRV_ResetVDH
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1535
	mov	w1, 0
	mov	w0, 1
	bl	VDH_UnNeed_Module
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L1538
.L1577:
	ldr	x0, .LC760
	ldr	x1, [x0, 48]
	cbz	x1, .L1572
	mov	w0, 0
	blr	x1
.L1541:
	mov	w0, 0
	bl	SCDDRV_SetStateIdle
.L1530:
	cbnz	w24, .L1542
	ldr	x0, .LC759
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1573
	mov	w1, 0
	mov	w0, 3
	bl	VDH_UnNeed_Module
.L1542:
	cbnz	w22, .L1520
	ldr	x0, .LC759
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L1574
	ldr	x0, .LC760
	ldr	x1, [x0, 64]
	cbz	x1, .L1520
	mov	w0, 0
	blr	x1
.L1520:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1570:
	ldr	w26, [x20, 8]
	cmp	w26, 1
	beq	.L1575
.L1524:
	cmp	w21, 1
	ccmp	w22, wzr, 0, eq
	bne	.L1525
.L1548:
	cmp	w26, 1
	csinc	w22, w22, wzr, ne
	cmp	w21, 6
	ccmp	w24, wzr, 0, eq
	beq	.L1549
	b	.L1521
	.p2align 3
.L1575:
	cmp	w21, 4
	ccmp	w21, 7, 4, ne
	beq	.L1524
	mov	w0, w21
	bl	VCTRL_CanBeDecodedByHardWare.part.18
	cmp	w0, wzr
	cset	w0, ne
	b	.L1524
.L1535:
	ldr	x0, .LC760
	ldr	x1, [x0, 16]
	cbz	x1, .L1576
	mov	w0, 0
	blr	x1
.L1537:
	mov	w0, 0
	bl	VDMDRV_SetStateIdle
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L1577
.L1538:
	mov	w1, 0
	mov	w0, 0
	bl	VDH_UnNeed_Module
	b	.L1530
.L1574:
	mov	w1, 0
	mov	w0, 2
	bl	VDH_UnNeed_Module
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L1573:
	ldr	x0, .LC760
	ldr	x1, [x0, 32]
	cbz	x1, .L1578
	mov	w0, 0
	blr	x1
	b	.L1542
.L1572:
	ldr	x1, .LC761
	mov	w2, 9100
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1541
.L1576:
	ldr	x1, .LC761
	mov	w2, 9085
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1537
.L1578:
	ldr	x1, .LC761
	mov	w2, 9118
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1542
.L1568:
	ldr	w26, [x20, 8]
	b	.L1548
	.size	VCTRL_CloseHardware, .-VCTRL_CloseHardware
	.align	3
.LC758:
	.xword	.LANCHOR0
	.align	3
.LC759:
	.xword	g_HalDisable
	.align	3
.LC760:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC761:
	.xword	.LC89
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StopChan
	.type	VCTRL_StopChan, %function
VCTRL_StopChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bhi	.L1585
	ldr	x20, .LC765
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1586
	ldr	w1, [x0, 4]
	cmp	w1, 1
	bne	.L1584
	str	w1, [x0, 24]
	mov	w0, w19
	ldr	x1, [x20, w19, sxtw 3]
	str	wzr, [x1, 12]
	ldr	x1, [x20, w19, sxtw 3]
	str	wzr, [x1, 8]
	bl	SM_Stop
	cbnz	w0, .L1584
	mov	w1, 0
	mov	w0, w19
	bl	DeleteRawPacketInBuffer
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	str	wzr, [x1, 24]
	bl	VCTRL_CloseHardware
	mov	w0, 0
.L1581:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1584:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1585:
	ldr	x3, .LC763
	mov	w2, 2598
	ldr	x1, .LC764
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1581
.L1586:
	ldr	x3, .LC767
	mov	w2, 2599
	ldr	x1, .LC764
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1581
	.size	VCTRL_StopChan, .-VCTRL_StopChan
	.align	3
.LC763:
	.xword	.LC204
	.align	3
.LC764:
	.xword	.LC5
	.align	3
.LC765:
	.xword	.LANCHOR0
	.align	3
.LC767:
	.xword	.LC766
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_StopChanWithCheck
	.type	VCTRL_StopChanWithCheck, %function
VCTRL_StopChanWithCheck:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	mov	w20, 0
	bl	_mcount
	ldr	x19, .LC768
	b	.L1589
	.p2align 3
.L1593:
	ldr	x1, [x19, 240]
	mov	w0, 10
	add	w20, w20, 1
	blr	x1
	cmp	w20, 50
	beq	.L1591
.L1589:
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	mov	w0, w22
	bl	VCTRL_StopChan
	mov	w21, w0
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	cbnz	w21, .L1593
	cmp	w20, 49
	bgt	.L1591
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1591:
	ldr	x1, .LC770
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VCTRL_StopChanWithCheck, .-VCTRL_StopChanWithCheck
	.align	3
.LC768:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC770:
	.xword	.LC769
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetChanWithOption
	.type	VCTRL_ResetChanWithOption, %function
VCTRL_ResetChanWithOption:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	sxtw	x21, w0
	mov	x0, x30
	mov	x23, x1
	mov	x19, x21
	bl	_mcount
	ldr	x20, .LC771
	ldr	x1, [x20, w21, sxtw 3]
	cbz	x1, .L1621
	ldr	w0, [x23]
	cmp	w0, 1
	bhi	.L1622
	mov	w0, w21
	ldr	w22, [x1, 8]
	bl	VCTRL_StopChan
	ldr	x24, .LC776
	ldr	x0, .LC777
	lsl	x2, x21, 4
	ldr	x1, [x20, w21, sxtw 3]
	add	x21, x2, x21, lsl 2
	add	x0, x0, 760
	ldr	x3, [x24, 96]
	add	x0, x0, x21, lsl 4
	mov	x2, 300
	str	wzr, [x1, 452]
	sub	x0, x0, x21
	str	wzr, [x1, 456]
	mov	w1, 0
	blr	x3
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1623
	add	x0, x0, 323584
	str	wzr, [x0, 3972]
.L1599:
	ldr	x1, [x24, 24]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	VCTRL_FindOccupiedFrame
	ldr	x1, [x24, 32]
	mov	w0, 4
	blr	x1
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	ldr	w2, [x23, 4]
	str	w2, [x1, 1264]
	bl	InitSyntaxCtx
	ldr	x0, [x20, w19, sxtw 3]
	add	x1, x0, 331776
	ldr	w0, [x0, 608]
	add	x1, x1, 80
	bl	ReleaseCurPic
	ldr	x0, [x20, w19, sxtw 3]
	mov	x2, 456
	ldr	x3, [x24, 96]
	mov	w1, 0
	add	x0, x0, 752
	blr	x3
	ldr	x0, [x20, w19, sxtw 3]
	mov	x1, -1
	ldr	w2, [x0, 1488]
	str	x1, [x0, 672]
	cmp	w2, 1
	str	x1, [x0, 680]
	str	wzr, [x0, 1208]
	beq	.L1624
.L1600:
	ldr	w0, [x0, 608]
	cmp	w0, 20
	beq	.L1601
	ldr	w0, [x23, 8]
	cbz	w0, .L1625
.L1601:
	mov	w0, w19
	bl	FSP_EmptyInstance
.L1602:
	mov	w0, w19
	bl	InitUsdPool
	ldr	w0, [x23]
	cbz	w0, .L1626
.L1603:
	ldr	w0, [x20, 876]
	cbz	w0, .L1604
	add	x20, x20, 1672
	str	w19, [x29, 76]
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1606
	mov	w0, 512
	add	x1, x29, 76
	bl	VCTRL_SetDbgOption
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1606
	add	x1, x29, 76
	mov	w0, 512
	bl	VCTRL_SetDbgOption
.L1606:
	ldr	x1, .LC779
	mov	w0, 32
	bl	dprint_vfmw
.L1604:
	cbnz	w22, .L1627
.L1608:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1596:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1626:
	mov	w0, w19
	bl	SM_Reset
	b	.L1603
	.p2align 3
.L1627:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L1608
	.p2align 3
.L1624:
	str	wzr, [x0, 1528]
	b	.L1600
	.p2align 3
.L1625:
	mov	w0, w19
	bl	FSP_ResetInstance
	b	.L1602
	.p2align 3
.L1622:
	ldr	x1, .LC775
	mov	w2, 3490
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1623:
	bl	VCTRL_SetSendStreamAgainFlag.part.11
	b	.L1599
.L1621:
	ldr	x3, .LC772
	mov	w2, 3486
	ldr	x1, .LC773
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1596
	.size	VCTRL_ResetChanWithOption, .-VCTRL_ResetChanWithOption
	.align	3
.LC771:
	.xword	.LANCHOR0
	.align	3
.LC772:
	.xword	.LC8
	.align	3
.LC773:
	.xword	.LC5
	.align	3
.LC775:
	.xword	.LC774
	.align	3
.LC776:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC777:
	.xword	.LANCHOR5
	.align	3
.LC779:
	.xword	.LC778
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ResetChan
	.type	VCTRL_ResetChan, %function
VCTRL_ResetChan:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC782
	ldr	x1, [x20, w19, sxtw 3]
	cbz	x1, .L1651
	mov	w0, w19
	ldr	w21, [x1, 8]
	bl	VCTRL_StopChan
	ldr	x22, .LC785
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, 4
	ldr	x2, [x22, 24]
	str	wzr, [x1, 452]
	str	wzr, [x1, 456]
	blr	x2
	ldr	x0, [x20, w19, sxtw 3]
	ldr	w1, [x0, 1488]
	cmp	w1, 1
	beq	.L1652
.L1631:
	sxtw	x3, w19
	ldr	x0, .LC786
	lsl	x1, x3, 4
	ldr	x4, [x22, 96]
	add	x3, x1, x3, lsl 2
	add	x0, x0, 760
	mov	x2, 300
	mov	w1, 0
	add	x0, x0, x3, lsl 4
	sub	x0, x0, x3
	blr	x4
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1653
	add	x0, x0, 323584
	str	wzr, [x0, 3972]
.L1633:
	ldr	x1, [x20, w19, sxtw 3]
	mov	w0, w19
	str	wzr, [x1, 1264]
	bl	InitSyntaxCtx
	ldr	x0, [x20, w19, sxtw 3]
	mov	x2, 456
	ldr	x3, [x22, 96]
	mov	w1, 0
	add	x0, x0, 752
	blr	x3
	ldr	x0, [x20, w19, sxtw 3]
	mov	x2, -1
	add	x1, x0, 331776
	str	x2, [x0, 672]
	str	x2, [x0, 680]
	str	wzr, [x0, 1208]
	stp	wzr, wzr, [x1, 40]
	str	wzr, [x1, 48]
	ldr	w2, [x0, 1488]
	cmp	w2, 1
	beq	.L1654
.L1634:
	ldr	w0, [x0, 608]
	cmp	w0, 20
	mov	w0, w19
	beq	.L1635
	bl	FSP_ResetInstance
.L1636:
	ldr	x1, [x22, 32]
	mov	w0, 4
	blr	x1
	mov	w0, w19
	bl	InitUsdPool
	mov	w0, w19
	bl	SM_Reset
	ldr	w0, [x20, 876]
	cbz	w0, .L1637
	add	x20, x20, 1672
	str	w19, [x29, 60]
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1639
	mov	w0, 512
	add	x1, x29, 60
	bl	VCTRL_SetDbgOption
	ldr	x0, [x20, w19, sxtw 3]
	cbz	x0, .L1639
	add	x1, x29, 60
	mov	w0, 512
	bl	VCTRL_SetDbgOption
.L1639:
	ldr	x1, .LC787
	mov	w0, 32
	bl	dprint_vfmw
.L1637:
	cbnz	w21, .L1655
.L1641:
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, 0
.L1630:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1655:
	mov	w0, w19
	bl	VCTRL_StartChan
	b	.L1641
	.p2align 3
.L1635:
	bl	FSP_EmptyInstance
	b	.L1636
	.p2align 3
.L1654:
	str	wzr, [x0, 1528]
	str	wzr, [x1, 20]
	b	.L1634
	.p2align 3
.L1652:
	add	x1, x0, 331776
	ldr	w2, [x0, 608]
	ldr	w1, [x1, 72]
	cmp	w1, w2
	bne	.L1631
	str	wzr, [x0, 12]
	mov	w0, w19
	bl	VCTRL_FindOccupiedFrame
	b	.L1631
	.p2align 3
.L1653:
	bl	VCTRL_SetSendStreamAgainFlag.part.11
	b	.L1633
.L1651:
	ldr	x3, .LC783
	mov	w2, 3873
	ldr	x1, .LC784
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1630
	.size	VCTRL_ResetChan, .-VCTRL_ResetChan
	.align	3
.LC782:
	.xword	.LANCHOR0
	.align	3
.LC783:
	.xword	.LC8
	.align	3
.LC784:
	.xword	.LC5
	.align	3
.LC785:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC786:
	.xword	.LANCHOR5
	.align	3
.LC787:
	.xword	.LC778
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CreateChan
	.type	VCTRL_CreateChan, %function
VCTRL_CreateChan:
	stp	x29, x30, [sp, -352]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w19, w0
	mov	x0, x30
	mov	x25, x1
	mov	w20, w2
	bl	_mcount
	ldr	x22, .LC790
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 144
	ldr	x3, [x22, 96]
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 56
	mov	w1, 0
	add	x0, x29, 200
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 96
	mov	w1, 0
	add	x0, x29, 256
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x29, 112
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x29, 128
	blr	x3
	ldr	x24, .LC791
	str	x25, [x24, 1784]
	cbz	x25, .L1730
	ldr	w0, [x25, 36]
	tbnz	w0, #31, .L1659
	ldr	w0, [x25, 12]
	cmp	w0, 31
	ble	.L1659
	ldr	w0, [x25, 16]
	cmp	w0, 31
	ble	.L1659
	ldr	w1, [x25, 56]
	mov	w0, 262143
	cmp	w1, w0
	ble	.L1659
	ldr	w0, [x25, 44]
	cmp	w0, 1
	beq	.L1731
	cmp	w0, 2
	bne	.L1661
	ldr	w0, [x25, 20]
	cmp	w0, wzr
	ble	.L1659
	ldr	w0, [x25, 24]
	cmp	w0, wzr
	ble	.L1659
.L1726:
	ldr	w0, [x25, 28]
	cmp	w0, wzr
	ble	.L1659
	ldr	w0, [x25, 32]
	cmp	w0, wzr
	bgt	.L1661
.L1659:
	ldr	x1, .LC794
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
.L1740:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 352
	ret
	.p2align 3
.L1661:
	ldr	w0, [x25, 176]
	cmp	w0, 1
	bls	.L1663
	str	wzr, [x25, 176]
.L1663:
	mov	w4, 38048
	mov	w23, 1
	cmp	w19, 26
	mov	w3, w20
	movk	w4, 0xb2, lsl 16
	mov	w20, 50608
	add	x2, x29, 128
	mov	x1, x25
	mov	w0, w19
	movk	w20, 0xc, lsl 16
	stp	w23, w23, [x25, 200]
	csel	w20, w20, w4, ne
	bl	VCTRL_GetChanMemSize
	cbnz	w0, .L1732
	ldr	x3, [x22, 96]
	add	x21, x25, 80
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 168
	blr	x3
	ldr	x0, [x21, 56]
	cbz	x0, .L1667
	ldr	w0, [x21, 64]
	cbnz	w0, .L1668
.L1667:
	mov	w0, 3
	str	w0, [x29, 196]
	mov	w0, 7
	bl	VFMW_GetString
	ldr	w2, [x29, 136]
	mov	w4, 1
	add	x3, x29, 168
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1733
	ldr	w0, [x29, 184]
	ldr	w2, [x29, 192]
	ldr	x1, [x29, 176]
	bl	MEM_AddMemRecord
	ldr	w0, [x29, 184]
	str	w0, [x29, 304]
	ldr	x0, [x29, 176]
	str	x0, [x29, 312]
	ldr	w0, [x29, 192]
	str	w0, [x29, 320]
	mov	w0, 1
	str	w0, [x29, 120]
.L1671:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 168
	blr	x3
	ldr	x0, [x21, 8]
	cbnz	x0, .L1734
.L1700:
	ldr	w0, [x25, 176]
	cmp	w0, 1
	beq	.L1674
	mov	w0, 3
	str	w0, [x29, 196]
	mov	w0, 8
	bl	VFMW_GetString
	ldr	w2, [x29, 128]
	mov	w4, 0
	add	x3, x29, 168
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1735
	ldr	w0, [x29, 184]
	ldr	w2, [x29, 192]
	ldr	x1, [x29, 176]
	bl	MEM_AddMemRecord
	ldr	w0, [x29, 184]
	str	w0, [x29, 256]
	ldr	x0, [x29, 176]
	str	x0, [x29, 264]
	ldr	w0, [x29, 192]
	str	w0, [x29, 272]
	mov	w0, 1
	str	w0, [x29, 112]
.L1678:
	ldr	x3, [x22, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 168
	blr	x3
	ldr	x0, [x21, 32]
	cbz	x0, .L1702
	ldr	w0, [x21, 40]
	cbnz	w0, .L1682
.L1702:
	mov	w1, 3
	mov	w0, 9
	str	w1, [x29, 196]
	bl	VFMW_GetString
	ldr	w2, [x29, 132]
	mov	w4, 0
	add	x3, x29, 168
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L1736
	ldr	w2, [x29, 192]
	ldr	x1, [x29, 176]
	ldr	w0, [x29, 184]
	bl	MEM_AddMemRecord
	ldr	w3, [x29, 184]
	mov	w0, 1
	ldr	w1, [x29, 192]
	ldr	x2, [x29, 176]
	str	w0, [x29, 116]
	str	w3, [x29, 280]
	str	x2, [x29, 288]
	str	w1, [x29, 296]
.L1722:
	ldr	x1, [x22, 24]
	mov	w0, 0
	blr	x1
	ldr	x27, .LC809
	ldr	x0, [x27]
	cbz	x0, .L1705
	add	x0, x27, 8
	mov	w21, 1
	b	.L1693
	.p2align 3
.L1692:
	add	w21, w21, 1
	cmp	w21, 32
	beq	.L1737
.L1693:
	ldr	x1, [x0]
	add	x0, x0, 8
	cbnz	x1, .L1692
	sxtb	w0, w21
	str	w0, [x29, 108]
.L1691:
	sxtw	x23, w20
	ldr	x3, [x22, 96]
	ldr	x0, [x29, 312]
	sub	x2, x23, #204800
	sub	x2, x2, #1544
	mov	w1, 0
	str	x0, [x27, w21, sxtw 3]
	sxtw	x28, w21
	mov	w26, 255
	blr	x3
	ldr	x0, [x27, w21, sxtw 3]
	mov	x2, 208
	ldr	x3, [x22, 104]
	mov	x1, x25
	add	x0, x0, 1312
	blr	x3
	ldr	x0, [x27, w21, sxtw 3]
	ldr	x3, .LC814
	ldr	x4, .LC815
	str	w19, [x0, 36]
	str	w20, [x0, 1236]
	mov	w20, 0
	ldr	x0, [x27, w21, sxtw 3]
	str	w21, [x0]
	str	w19, [x0, 644]
	str	wzr, [x0, 1256]
	ldr	x0, [x27, w21, sxtw 3]
	ldr	w1, [x25]
	str	w1, [x0, 32]
	mov	w1, 21
	ldr	x0, [x27, w21, sxtw 3]
	add	x2, x0, 331776
	str	w1, [x0, 608]
	str	w1, [x2, 72]
	mov	w1, 30
	str	wzr, [x0, 28]
	ldr	x0, [x27, w21, sxtw 3]
	add	x2, x0, 1568
	str	w1, [x0, 1560]
	add	x0, x0, 294912
	add	x1, x0, 2160
	lsl	x0, x28, 4
	str	x2, [x3, x0]
	mov	w0, w21
	ldr	w3, [x25, 200]
	str	w3, [x2, 72]
	ldr	w3, [x25, 204]
	str	w3, [x2, 76]
	str	x1, [x4, w21, sxtw 3]
	bl	VCTRL_ResetChan
	ldr	x0, [x27, w21, sxtw 3]
	ldp	w1, w2, [x29, 112]
	str	w1, [x0, 368]
	add	x1, x0, 323584
	str	w2, [x0, 372]
	ldr	w2, [x29, 120]
	str	w2, [x0, 376]
	add	x2, x1, 3840
	add	x0, x0, 331776
	stp	wzr, wzr, [x2, 108]
	stp	wzr, wzr, [x2, 116]
	str	wzr, [x1, 3964]
	str	wzr, [x1, 3968]
	ldr	w1, [x25, 176]
	str	w1, [x0, 28]
	str	wzr, [x0, 20]
	.p2align 2
.L1695:
	uxtw	x1, w20
	ldr	x4, [x27, x28, lsl 3]
	lsl	x19, x1, 6
	ldr	x3, [x22, 96]
	add	x19, x19, x1, lsl 3
	mov	x2, 72
	add	x0, x19, 323584
	mov	w1, 0
	add	x0, x4, x0
	add	w20, w20, 1
	add	x0, x0, 3976
	blr	x3
	ldr	x0, [x27, x28, lsl 3]
	cmp	w20, 32
	add	x1, x0, x19
	add	x1, x1, 323584
	str	w26, [x1, 3976]
	str	w26, [x1, 3980]
	str	w26, [x1, 3984]
	bne	.L1695
	ldr	x3, [x22, 96]
	add	x0, x0, 327680
	mov	x2, 1384
	mov	w1, 0
	add	x0, x0, 2184
	add	x24, x24, 1792
	blr	x3
	ldr	x0, [x27, x28, lsl 3]
	mov	x2, 24
	ldr	x3, [x22, 96]
	mov	w1, 0
	add	x0, x0, 327680
	add	x0, x0, 3568
	blr	x3
	str	wzr, [x24, x28, lsl 2]
	ldr	x0, [x27, x28, lsl 3]
	ldr	w6, [x29, 304]
	ldr	x3, [x29, 264]
	add	x5, x0, 323584
	str	x3, [x0, 280]
	str	w6, [x0, 352]
	ldr	x3, [x29, 288]
	ldr	x6, [x29, 312]
	ldr	w1, [x29, 256]
	ldr	w2, [x29, 272]
	str	x3, [x0, 312]
	str	x6, [x0, 344]
	ldr	w4, [x29, 280]
	ldr	w3, [x29, 296]
	ldr	w6, [x29, 320]
	str	w1, [x0, 288]
	str	w2, [x0, 296]
	str	w4, [x0, 320]
	str	w1, [x0, 396]
	str	w2, [x0, 400]
	str	w3, [x0, 328]
	str	w6, [x0, 360]
	str	wzr, [x5, 3928]
	ldr	w5, [x0, 1488]
	cmp	w5, 1
	beq	.L1696
	sub	w2, w2, #307200
	str	w1, [x0, 384]
	sub	w2, w2, #2576
	str	w2, [x0, 388]
	add	w1, w2, w1
	str	w3, [x0, 404]
	add	w2, w1, 15
	mov	w3, 14848
	and	w2, w2, -16
	str	w2, [x0, 408]
	add	w2, w1, 12288
	add	w1, w1, 45056
	add	w2, w2, 2575
	add	w1, w1, 2575
	and	w2, w2, -16
	str	w3, [x0, 412]
	and	w1, w1, -16
	mov	w3, 32768
	str	w2, [x0, 416]
	mov	w2, 262144
	str	w4, [x0, 392]
	str	w3, [x0, 420]
	str	w1, [x0, 424]
	str	w2, [x0, 428]
.L1697:
	ldr	x1, [x27, w21, sxtw 3]
	mov	w0, w21
	str	w21, [x1]
	ldr	x1, [x27, w21, sxtw 3]
	add	x3, x1, 294912
	add	x2, x1, 278528
	str	w21, [x1, 264]
	str	w21, [x1, 268]
	ldrb	w1, [x29, 108]
	strb	w1, [x3, 2160]
	str	w21, [x2, 1800]
	bl	FSP_EnableInstance
	cbnz	w0, .L1738
	mov	w0, w21
	bl	SM_ClearInst
	ldr	x2, [x27, w21, sxtw 3]
	sub	x1, x23, #200704
	sub	x1, x1, #3592
	mov	w0, w21
	ldr	x2, [x2, 344]
	add	x1, x2, x1
	bl	OpenUsdPool_WithMem
	ldr	x1, [x27, w21, sxtw 3]
	mov	w2, 1
	mov	w0, w21
	str	w2, [x1, 4]
	bl	VDMDRV_ClearChanIsDec
	bl	VDMDRV_ParamInit
	ldr	x19, [x27, w21, sxtw 3]
	ldr	x0, [x22]
	add	x19, x19, 331776
	blr	x0
	ldr	x1, [x22, 32]
	str	w0, [x19, 36]
	mov	w0, 0
	blr	x1
	mov	w0, w21
.L1721:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 352
	ret
	.p2align 3
.L1734:
	ldr	w0, [x21, 16]
	cbz	w0, .L1700
	ldr	x3, [x22, 104]
	mov	x2, 24
	mov	x1, x21
	add	x0, x29, 256
	blr	x3
	ldr	w0, [x25, 176]
	ldr	w2, [x29, 272]
	cmp	w0, 1
	beq	.L1680
	ldr	w4, [x29, 128]
	cmp	w2, w4
	blt	.L1739
.L1680:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_AddMemRecord
	b	.L1678
	.p2align 3
.L1674:
	str	wzr, [x29, 112]
	str	wzr, [x29, 256]
	str	xzr, [x29, 264]
	str	wzr, [x29, 272]
	b	.L1678
	.p2align 3
.L1737:
	ldr	x1, .LC813
	mov	w2, w21
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x22, 32]
	mov	w0, 0
	blr	x1
	mov	w0, -1
	b	.L1740
.L1696:
	sub	w1, w3, #307200
	str	w4, [x0, 392]
	sub	w1, w1, #2576
	str	w1, [x0, 404]
	add	w2, w1, w4
	str	wzr, [x0, 384]
	add	w3, w2, 45056
	add	w4, w2, 12288
	add	w1, w2, 15
	add	w4, w4, 2575
	add	w2, w3, 2575
	mov	w3, 14848
	and	w1, w1, -16
	str	w3, [x0, 412]
	and	w3, w4, -16
	and	w2, w2, -16
	str	w1, [x0, 408]
	mov	w1, 262144
	str	w3, [x0, 416]
	mov	w3, 32768
	str	wzr, [x0, 388]
	str	w2, [x0, 424]
	str	w1, [x0, 428]
	str	w3, [x0, 420]
	b	.L1697
.L1731:
	ldr	w0, [x25, 20]
	cmp	w0, wzr
	bgt	.L1726
	b	.L1659
	.p2align 3
.L1668:
	ldr	x3, [x22, 104]
	mov	x2, 24
	add	x1, x25, 128
	add	x0, x29, 304
	blr	x3
	ldr	w0, [x29, 136]
	ldr	w2, [x29, 320]
	cmp	w2, w0
	blt	.L1741
	ldr	w0, [x29, 304]
	ldr	x1, [x29, 312]
	bl	MEM_AddMemRecord
	b	.L1671
.L1682:
	mov	x2, 24
	add	x0, x29, 256
	ldr	x3, [x22, 104]
	add	x1, x25, 104
	add	x0, x0, x2
	blr	x3
	ldr	x1, [x29, 288]
	cbz	x1, .L1687
	ldr	w0, [x29, 132]
	ldr	w2, [x29, 296]
	cmp	w2, w0
	blt	.L1687
	ldr	w0, [x29, 280]
	bl	MEM_AddMemRecord
	b	.L1722
.L1736:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1742
.L1684:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1743
.L1685:
	ldr	x1, .LC806
	mov	w2, 1925
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1740
.L1735:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1744
.L1676:
	ldr	x1, .LC802
	mov	w2, 1991
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1740
.L1732:
	ldr	x1, .LC796
	mov	w2, 2143
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1721
.L1705:
	mov	w21, 0
	str	wzr, [x29, 108]
	b	.L1691
.L1738:
	ldr	x1, .LC811
	mov	w2, w21
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w21
	bl	FSP_DisableInstance
	mov	w0, w21
	bl	CloseUsdPool_WithMem
	ldr	x1, [x27, w21, sxtw 3]
	mov	w0, w21
	str	xzr, [x27, w21, sxtw 3]
	add	x5, x1, 331776
	add	x2, x1, 323584
	ldr	w6, [x1, 372]
	add	x2, x2, 3976
	ldr	w3, [x1, 368]
	ldr	w4, [x1, 376]
	ldr	w5, [x5, 28]
	stp	w5, w3, [x29, 232]
	stp	w6, w4, [x29, 240]
	add	x3, x1, 304
	add	x4, x1, 272
	add	x1, x1, 336
	str	x2, [x29, 224]
	stp	x4, x3, [x29, 200]
	str	x1, [x29, 216]
	bl	VDMDRV_ClearChanIsDec
	ldr	x1, [x22, 32]
	mov	w0, 0
	blr	x1
	add	x1, x29, 200
	mov	w0, w21
	bl	VCTRL_FreeChanResource
	mov	w0, -1
	b	.L1721
.L1733:
	ldr	x1, .LC798
	mov	w2, 2049
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1740
.L1687:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1745
.L1689:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L1746
.L1690:
	ldr	x1, .LC808
	mov	w2, 1954
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1740
.L1743:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L1685
.L1742:
	ldr	w0, [x29, 304]
	ldr	x1, [x29, 312]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 304]
	ldr	w2, [x29, 320]
	ldr	x1, [x29, 312]
	bl	MEM_DelMemRecord
	b	.L1684
.L1744:
	ldr	w0, [x29, 304]
	ldr	x1, [x29, 312]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 304]
	ldr	w2, [x29, 320]
	ldr	x1, [x29, 312]
	bl	MEM_DelMemRecord
	b	.L1676
.L1741:
	ldr	x1, .LC800
	mov	w2, 2065
	mov	w0, w23
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1740
.L1739:
	ldr	w0, [x29, 120]
	cmp	w0, 1
	beq	.L1747
.L1681:
	ldr	x1, .LC804
	mov	w3, w2
	mov	w0, 1
	mov	w2, 2023
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1740
.L1746:
	ldr	w0, [x29, 256]
	ldr	x1, [x29, 264]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 256]
	ldr	w2, [x29, 272]
	ldr	x1, [x29, 264]
	bl	MEM_DelMemRecord
	b	.L1690
.L1730:
	ldr	x1, .LC793
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1740
.L1745:
	ldr	w0, [x29, 304]
	ldr	x1, [x29, 312]
	bl	MEM_ReleaseMemBlock
	ldr	w0, [x29, 304]
	ldr	w2, [x29, 320]
	ldr	x1, [x29, 312]
	bl	MEM_DelMemRecord
	b	.L1689
.L1747:
	ldr	w0, [x29, 304]
	ldr	x1, [x29, 312]
	bl	MEM_ReleaseMemBlock
	ldr	w2, [x29, 320]
	ldr	w0, [x29, 304]
	ldr	x1, [x29, 312]
	bl	MEM_DelMemRecord
	ldr	w4, [x29, 128]
	ldr	w2, [x29, 272]
	b	.L1681
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	3
.LC790:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC791:
	.xword	.LANCHOR6
	.align	3
.LC793:
	.xword	.LC792
	.align	3
.LC794:
	.xword	.LC477
	.align	3
.LC796:
	.xword	.LC795
	.align	3
.LC798:
	.xword	.LC797
	.align	3
.LC800:
	.xword	.LC799
	.align	3
.LC802:
	.xword	.LC801
	.align	3
.LC804:
	.xword	.LC803
	.align	3
.LC806:
	.xword	.LC805
	.align	3
.LC808:
	.xword	.LC807
	.align	3
.LC809:
	.xword	.LANCHOR0
	.align	3
.LC811:
	.xword	.LC810
	.align	3
.LC813:
	.xword	.LC812
	.align	3
.LC814:
	.xword	s_SmIIS
	.align	3
.LC815:
	.xword	s_pFspInst
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_ConfigChan
	.type	VCTRL_ConfigChan, %function
VCTRL_ConfigChan:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w19, w0
	mov	x0, x30
	mov	x23, x1
	bl	_mcount
	cmp	w19, 31
	bhi	.L1789
	ldr	x21, .LC819
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1790
	ldr	w0, [x0, 4]
	cmp	w0, 1
	bne	.L1791
	mov	x1, x23
	mov	w0, w19
	bl	VCTRL_CheckChanWH
	mov	w20, w0
	cbnz	w0, .L1792
	ldr	x22, .LC824
	add	x24, x22, 1920
	mov	x0, x24
	bl	PDT_GetVdecCapability
	ldr	w0, [x22, 1940]
	ldr	w2, [x23, 8]
	cmp	w0, 20
	bhi	.L1755
	cmp	w0, w2
	beq	.L1756
	add	x0, x22, 1944
	add	x3, x22, 2068
	.p2align 2
.L1759:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 20
	bhi	.L1755
	cmp	w1, w2
	beq	.L1756
	cmp	x3, x0
	bne	.L1759
.L1756:
	cmp	w2, 8
	str	wzr, [x29, 88]
	beq	.L1793
.L1760:
	cmp	w2, 9
	beq	.L1794
.L1780:
	mov	x1, x23
	mov	w0, w19
	bl	VCTRL_CmpConfigParameter
	cbz	w0, .L1795
	ldr	x24, .LC829
	mov	x2, 144
	ldr	x0, [x21, w19, sxtw 3]
	mov	x1, x23
	ldr	x3, [x24, 104]
	add	x0, x0, 44
	blr	x3
	ldr	x0, [x21, w19, sxtw 3]
	mov	x2, 72
	ldr	w1, [x23, 24]
	str	w1, [x0, 20]
	ldr	x0, [x21, w19, sxtw 3]
	ldr	w1, [x23, 8]
	ldr	x3, [x24, 96]
	str	w1, [x0, 608]
	ldr	w1, [x23, 116]
	str	w1, [x0, 1496]
	mov	w1, 0
	add	x0, x29, 88
	blr	x3
	ldr	x0, [x21, w19, sxtw 3]
	ldr	w0, [x0, 392]
	str	w0, [x29, 104]
	bl	MEM_Phy2Vir
	str	x0, [x29, 88]
	ldr	x1, [x21, w19, sxtw 3]
	ldr	w0, [x23, 104]
	ldr	w3, [x23, 24]
	ldr	w2, [x1, 404]
	cmp	w0, 1
	str	w2, [x29, 108]
	add	x1, x1, 331776
	ldr	w2, [x23, 8]
	str	w2, [x29, 100]
	mov	w2, 49152
	movk	w2, 0xf8c3, lsl 16
	strb	w3, [x29, 96]
	str	w2, [x29, 112]
	beq	.L1796
	str	wzr, [x1, 64]
.L1765:
	ldr	w0, [x23, 8]
	cbz	w0, .L1797
	ldr	w1, [x23, 100]
	cmp	w0, 16
	str	wzr, [x29, 128]
	str	w1, [x29, 136]
	bne	.L1798
	ldr	w0, [x23, 68]
.L1767:
	str	w0, [x29, 132]
	add	x3, x21, 256
	mov	w1, 0
	mov	x0, x21
	.p2align 2
.L1769:
	ldr	x2, [x0], 8
	cmp	x2, xzr
	csinc	w1, w1, w1, eq
	cmp	x3, x0
	bne	.L1769
	cmp	w1, 1
	ble	.L1799
.L1770:
	str	wzr, [x29, 132]
.L1771:
	ldr	x0, [x21, w19, sxtw 3]
	ldrsb	w0, [x0, 44]
	cmp	w0, 1
	beq	.L1800
.L1772:
	ldr	x3, [x24, 104]
	add	x26, x23, 12
	mov	x2, 12
	mov	x1, x26
	add	x0, x29, 116
	blr	x3
	add	x1, x29, 88
	mov	w0, w19
	bl	SM_Config
	ldr	x3, [x24, 96]
	mov	x2, 1
	mov	w1, 0
	add	x0, x29, 80
	blr	x3
	ldr	w2, [x23, 104]
	cmp	w2, 1
	beq	.L1801
.L1773:
	ldr	x0, [x21, w19, sxtw 3]
	mov	w25, 1
	mov	x1, x26
	ldr	w2, [x0, 352]
	str	w2, [x0, 1240]
	ldr	w2, [x0, 360]
	str	w2, [x0, 1244]
	ldr	w2, [x0, 384]
	str	w2, [x0, 636]
	ldr	w2, [x0, 388]
	str	w2, [x0, 640]
	ldr	w2, [x0, 408]
	str	w2, [x0, 648]
	ldr	w2, [x0, 412]
	str	w2, [x0, 652]
	ldr	w2, [x0, 416]
	str	w2, [x0, 656]
	ldr	w2, [x0, 420]
	str	w2, [x0, 660]
	ldr	w2, [x0, 424]
	str	w2, [x0, 664]
	ldr	w2, [x0, 428]
	str	w2, [x0, 668]
	ldr	w2, [x23, 28]
	str	w2, [x0, 620]
	ldr	w2, [x23, 28]
	str	w2, [x0, 616]
	ldr	w2, [x23, 36]
	str	w2, [x0, 624]
	ldr	w2, [x23, 40]
	str	w2, [x0, 628]
	ldr	w2, [x23, 48]
	str	w2, [x0, 632]
	ldr	w2, [x23, 72]
	str	w2, [x0, 1248]
	ldr	w2, [x23, 80]
	str	w2, [x0, 1252]
	str	w25, [x0, 1284]
	str	w25, [x0, 1288]
	ldr	x3, [x24, 104]
	ldr	w2, [x23, 92]
	cmp	w2, w25
	cset	w2, eq
	str	w2, [x0, 1268]
	ldr	w2, [x23, 96]
	str	w2, [x0, 1272]
	ldr	w2, [x23, 64]
	str	w2, [x0, 1276]
	ldr	w2, [x29, 132]
	str	w2, [x0, 1280]
	add	x2, x0, 331776
	str	wzr, [x0, 1528]
	add	x0, x0, 1212
	str	wzr, [x0, 336]
	ldrsb	w4, [x23, 1]
	strb	w4, [x2, 24]
	mov	x2, 12
	blr	x3
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 331776
	ldr	w2, [x0, 608]
	ldr	w0, [x1, 72]
	cmp	w0, w2
	beq	.L1774
	mov	w0, w19
	bl	VCTRL_ResetChan
	ldr	w1, [x23, 8]
	ldr	x0, [x21, w19, sxtw 3]
	cmp	w1, 20
	beq	.L1775
	ldr	w2, [x0, 608]
	add	x1, x0, 331776
.L1774:
	ldr	x4, .LC833
	mov	x0, 0
	str	w2, [x1, 72]
	b	.L1779
	.p2align 3
.L1803:
	ldr	w3, [x1, 20]
	str	w3, [x2, x0, lsl 2]
	ldr	w1, [x1, 20]
	str	w1, [x4, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L1802
.L1779:
	ldr	x1, [x21, x0, lsl 3]
	add	x2, x22, 2072
	cbnz	x1, .L1803
	add	x1, x22, 2072
	str	wzr, [x4, x0, lsl 2]
	str	wzr, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L1779
.L1802:
	add	x0, x22, 2072
	bl	VDMDRV_SetPriority
	mov	w0, w19
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L1795:
	ldr	x1, .LC828
	mov	w20, 0
	bl	dprint_vfmw
.L1788:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L1755:
	ldr	x1, .LC826
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L1797:
	ldr	w0, [x23, 100]
	ldr	w1, [x23, 64]
	str	w0, [x29, 136]
	str	w1, [x29, 128]
	ldr	w0, [x23, 68]
	b	.L1767
	.p2align 3
.L1794:
	add	x0, x29, 88
	bl	REAL9DEC_Support
	ldr	w0, [x29, 88]
	cbnz	w0, .L1780
.L1761:
	mov	w20, -1
	b	.L1788
	.p2align 3
.L1799:
	ldr	x0, .LC830
	ldr	w0, [x0, 72]
	cbnz	w0, .L1771
	b	.L1770
.L1793:
	add	x0, x29, 88
	bl	REAL8DEC_Support
	ldr	w0, [x29, 88]
	cbz	w0, .L1761
	ldr	w2, [x23, 8]
	b	.L1760
.L1800:
	str	wzr, [x29, 132]
	b	.L1772
.L1796:
	ldr	w2, [x23, 108]
	stp	w0, w2, [x29, 140]
	ldr	w2, [x23, 112]
	ldr	w0, [x23, 140]
	str	w2, [x29, 148]
	str	w0, [x1, 64]
	b	.L1765
.L1791:
	ldr	x3, .LC821
	mov	w2, 2948
	ldr	x1, .LC818
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1788
.L1798:
	mov	w0, 0
	b	.L1767
.L1801:
	add	x1, x29, 80
	mov	w0, w19
	strb	w2, [x29, 80]
	bl	FSP_ConfigAttribute
	b	.L1773
.L1792:
	ldr	x1, .LC823
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1788
.L1775:
	ldr	w3, [x0, 396]
	ldr	w4, [x0, 400]
	ldr	w1, [x0, 1324]
	ldr	w2, [x0, 1328]
	mov	w0, w19
	bl	VCTRL_PartitionMemForStdUser
	cbnz	w0, .L1776
	ldr	x0, [x21, w19, sxtw 3]
	add	x1, x0, 331776
	ldr	w2, [x0, 608]
	b	.L1774
.L1789:
	ldr	x3, .LC817
	mov	w2, 2946
	ldr	x1, .LC818
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1788
.L1790:
	ldr	x3, .LC820
	mov	w2, 2947
	ldr	x1, .LC818
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1788
.L1776:
	ldr	x1, .LC832
	mov	w0, w25
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1788
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
	.align	3
.LC817:
	.xword	.LC204
	.align	3
.LC818:
	.xword	.LC5
	.align	3
.LC819:
	.xword	.LANCHOR0
	.align	3
.LC820:
	.xword	.LC8
	.align	3
.LC821:
	.xword	.LC209
	.align	3
.LC823:
	.xword	.LC822
	.align	3
.LC824:
	.xword	.LANCHOR6
	.align	3
.LC826:
	.xword	.LC825
	.align	3
.LC828:
	.xword	.LC827
	.align	3
.LC829:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC830:
	.xword	.LANCHOR2
	.align	3
.LC832:
	.xword	.LC831
	.align	3
.LC833:
	.xword	g_ChanCtx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetDropStreamThread, %function
VfmwProc_SetDropStreamThread:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x1, .LC839
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC840
	mov	w1, 0
	mov	x2, 144
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1804
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 64]
	bl	VCTRL_ConfigChan
.L1804:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 176
	ret
	.size	VfmwProc_SetDropStreamThread, .-VfmwProc_SetDropStreamThread
	.align	3
.LC839:
	.xword	.LC838
	.align	3
.LC840:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetDecMode, %function
VfmwProc_SetDecMode:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x1, .LC842
	lsr	w20, w3, 24
	and	w19, w3, 7
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC843
	mov	w1, 0
	mov	x2, 144
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbz	w0, .L1809
	ldr	x1, .LC845
	mov	w2, w20
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 176
	ret
	.p2align 3
.L1809:
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 68]
	bl	VCTRL_ConfigChan
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 176
	ret
	.size	VfmwProc_SetDecMode, .-VfmwProc_SetDecMode
	.align	3
.LC842:
	.xword	.LC841
	.align	3
.LC843:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC845:
	.xword	.LC844
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetDecOrderOutput, %function
VfmwProc_SetDecOrderOutput:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x1, .LC847
	lsr	w20, w3, 24
	and	w19, w3, 3
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC848
	mov	w1, 0
	mov	x2, 144
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1810
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 72]
	bl	VCTRL_ConfigChan
.L1810:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 176
	ret
	.size	VfmwProc_SetDecOrderOutput, .-VfmwProc_SetDecOrderOutput
	.align	3
.LC847:
	.xword	.LC846
	.align	3
.LC848:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_SetErrorThread, %function
VfmwProc_SetErrorThread:
	stp	x29, x30, [sp, -176]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19]
	mov	w0, 32
	ldr	x1, .LC850
	lsr	w20, w3, 24
	and	w19, w3, 16777215
	mov	w3, w19
	mov	w2, w20
	bl	dprint_vfmw
	ldr	x3, .LC851
	mov	w1, 0
	mov	x2, 144
	add	x0, x29, 32
	ldr	x3, [x3, 96]
	blr	x3
	add	x1, x29, 32
	mov	w0, w20
	bl	VCTRL_GetChanCfg
	cbnz	w0, .L1812
	add	x1, x29, 32
	mov	w0, w20
	str	w19, [x29, 60]
	bl	VCTRL_ConfigChan
.L1812:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 176
	ret
	.size	VfmwProc_SetErrorThread, .-VfmwProc_SetErrorThread
	.align	3
.LC850:
	.xword	.LC849
	.align	3
.LC851:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestResetChan, %function
VfmwProc_TestResetChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	mov	w0, w19
	bl	VCTRL_ResetChan
	mov	w3, w0
	ldr	x1, .LC853
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestResetChan, .-VfmwProc_TestResetChan
	.align	3
.LC853:
	.xword	.LC852
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DestroyChan
	.type	VCTRL_DestroyChan, %function
VCTRL_DestroyChan:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC854
	mov	w0, 0
	ldr	x1, [x20, 24]
	blr	x1
	cmp	w19, 31
	bhi	.L1826
	ldr	x21, .LC859
	ldr	x0, [x21, w19, sxtw 3]
	cbz	x0, .L1827
	ldr	w22, [x0, 4]
	cmp	w22, 1
	bne	.L1828
	str	wzr, [x0, 8]
	mov	w0, 0
	ldr	x1, [x20, 32]
	blr	x1
	mov	w0, w19
	bl	SCDDRV_IsChanDec
	cbnz	w0, .L1829
.L1820:
	ldr	x1, [x20, 24]
	mov	w0, 0
	sxtw	x22, w19
	blr	x1
	ldr	x2, .LC864
	mov	w0, 4
	ldr	x1, [x20, 24]
	str	wzr, [x2, w19, sxtw 2]
	blr	x1
	mov	w0, w19
	bl	VCTRL_StopChan
	ldr	x1, [x20, 32]
	cbnz	w0, .L1830
	mov	w0, 4
	lsl	x22, x22, 4
	blr	x1
	mov	w0, w19
	bl	VCTRL_ResetChan
	bl	VDMDRV_ParamInit
	ldr	x1, .LC865
	mov	w0, 4
	ldr	x2, [x20, 24]
	add	x1, x1, 248
	str	wzr, [x1, w19, sxtw 2]
	blr	x2
	mov	w0, w19
	bl	FSP_DisableInstance
	mov	w0, w19
	bl	CloseUsdPool_WithMem
	ldr	x1, [x21, w19, sxtw 3]
	mov	w0, w19
	ldr	x4, .LC866
	add	x2, x1, 331776
	ldr	x3, .LC867
	ldr	w5, [x1, 376]
	str	w5, [x29, 116]
	ldr	w2, [x2, 28]
	ldr	w5, [x1, 368]
	str	w2, [x29, 104]
	add	x2, x1, 272
	str	w5, [x29, 108]
	str	x2, [x29, 72]
	add	x2, x1, 323584
	ldr	w5, [x1, 372]
	add	x2, x2, 3976
	str	xzr, [x4, x22]
	str	w5, [x29, 112]
	add	x5, x1, 304
	add	x1, x1, 336
	str	xzr, [x3, w19, sxtw 3]
	stp	x5, x1, [x29, 80]
	str	x2, [x29, 96]
	str	xzr, [x21, w19, sxtw 3]
	bl	VDMDRV_ClearChanIsDec
	mov	w0, w19
	bl	SCDDRV_ResetSCD
	mov	w0, w19
	bl	VDMDRV_ResetVDH
	ldr	x1, [x20, 32]
	mov	w0, 4
	blr	x1
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldr	x2, [x20, 48]
	mov	w1, w19
	mov	w0, 1
	blr	x2
	add	x1, x29, 72
	mov	w0, w19
	bl	VCTRL_FreeChanResource
	ldr	x2, [x20, 56]
	mov	w0, 1
	mov	w1, w19
	blr	x2
	mov	w0, 0
.L1817:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1829:
	mov	w0, w19
	ldr	x23, [x20, 264]
	bl	SCDDRV_IsChanDec
	cmp	w0, wzr
	mov	w2, 500
	cset	w1, eq
	mov	w0, w22
	blr	x23
	b	.L1820
	.p2align 3
.L1828:
	ldr	x2, .LC856
	mov	w3, 2408
	ldr	x4, .LC863
	mov	w0, 0
	ldr	x1, .LC858
	add	x2, x2, 760
.L1825:
	bl	dprint_vfmw
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L1830:
	mov	w0, 4
	blr	x1
	ldr	x1, [x20, 32]
	mov	w0, 0
	blr	x1
	mov	w0, -1
	b	.L1817
	.p2align 3
.L1826:
	ldr	x2, .LC856
	mov	w3, 2387
	ldr	x4, .LC855
	mov	w0, 0
	ldr	x1, .LC858
	add	x2, x2, 760
	b	.L1825
.L1827:
	ldr	x2, .LC856
	mov	w3, 2396
	ldr	x4, .LC861
	ldr	x1, .LC858
	add	x2, x2, 760
	b	.L1825
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	3
.LC854:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC855:
	.xword	.LC204
	.align	3
.LC856:
	.xword	.LANCHOR4
	.align	3
.LC858:
	.xword	.LC857
	.align	3
.LC859:
	.xword	.LANCHOR0
	.align	3
.LC861:
	.xword	.LC860
	.align	3
.LC863:
	.xword	.LC862
	.align	3
.LC864:
	.xword	g_LowDelaySeqIndex
	.align	3
.LC865:
	.xword	.LANCHOR5
	.align	3
.LC866:
	.xword	s_SmIIS
	.align	3
.LC867:
	.xword	s_pFspInst
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_CloseVfmw
	.type	VCTRL_CloseVfmw, %function
VCTRL_CloseVfmw:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC869
	ldr	w0, [x20, 256]
	cmp	w0, 1
	bne	.L1838
	mov	x19, 0
	.p2align 2
.L1834:
	ldr	x1, [x20, x19, lsl 3]
	mov	w0, w19
	add	x19, x19, 1
	cbz	x1, .L1833
	bl	VCTRL_DestroyChan
.L1833:
	cmp	x19, 32
	bne	.L1834
	bl	FSP_Exit
	ldr	x21, .LC870
	ldr	w1, [x20, 260]
	mov	w2, 3
	str	w2, [x20, 264]
	cbz	w1, .L1836
	ldr	x1, [x21, 240]
	mov	w0, 10
	mov	w19, 49
	blr	x1
	b	.L1837
	.p2align 3
.L1848:
	ldr	x1, [x21, 240]
	blr	x1
	subs	w19, w19, #1
	beq	.L1836
.L1837:
	ldr	w1, [x20, 260]
	mov	w0, 10
	cbnz	w1, .L1848
.L1836:
	ldr	x0, .LC871
	mov	x2, 128
	ldr	x3, [x21, 96]
	mov	w1, 0
	add	x0, x0, 248
	blr	x3
	add	x0, x20, 288
	bl	CloseDrivers
	str	wzr, [x20, 256]
	mov	w0, 0
.L1847:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1838:
	mov	w0, -1
	b	.L1847
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
	.align	3
.LC869:
	.xword	.LANCHOR0
	.align	3
.LC870:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC871:
	.xword	.LANCHOR5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestRestartChan, %function
VfmwProc_TestRestartChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	mov	w0, w19
	bl	VCTRL_StopChan
	mov	w3, w0
	ldr	x1, .LC874
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, w19
	bl	VCTRL_ResetChan
	mov	w3, w0
	ldr	x1, .LC875
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, w19
	bl	VCTRL_StartChan
	mov	w3, w0
	ldr	x1, .LC876
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestRestartChan, .-VfmwProc_TestRestartChan
	.align	3
.LC874:
	.xword	.LC873
	.align	3
.LC875:
	.xword	.LC852
	.align	3
.LC876:
	.xword	.LC756
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VfmwProc_TestStopChan, %function
VfmwProc_TestStopChan:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w19, [x19]
	mov	w0, w19
	bl	VCTRL_StopChan
	mov	w3, w0
	ldr	x1, .LC877
	mov	w2, w19
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VfmwProc_TestStopChan, .-VfmwProc_TestStopChan
	.align	3
.LC877:
	.xword	.LC873
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_InitDspCode
	.type	VCTRL_InitDspCode, %function
VCTRL_InitDspCode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 6
	beq	.L1861
	mov	w19, 2
	cmp	w20, wzr
	csel	w19, w19, wzr, eq
.L1852:
	ldr	x0, .LC878
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L1863
	mov	w1, w19
	mov	w0, 0
	bl	VDH_Require_DspCode
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1863:
	ldr	x20, .LC879
	ldr	x1, [x20, 8]
	cbz	x1, .L1864
	mov	w0, 0
	blr	x1
.L1855:
	ldr	x1, [x20, 40]
	cbz	x1, .L1865
	mov	w0, 0
	blr	x1
.L1857:
	ldr	x1, [x20, 24]
	cbz	x1, .L1866
	mov	w0, 0
	blr	x1
.L1859:
	mov	w1, w19
	mov	w0, 0
	bl	SCDDRV_LoadDspCode
	mov	w0, w21
	bl	VCTRL_CloseHardware
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1861:
	mov	w19, 1
	b	.L1852
	.p2align 3
.L1864:
	ldr	x1, .LC880
	mov	w2, 3239
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1855
	.p2align 3
.L1865:
	ldr	x1, .LC880
	mov	w2, 3240
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1857
	.p2align 3
.L1866:
	ldr	x1, .LC880
	mov	w2, 3241
	mov	w0, 0
	bl	dprint_vfmw
	b	.L1859
	.size	VCTRL_InitDspCode, .-VCTRL_InitDspCode
	.align	3
.LC878:
	.xword	g_HalDisable
	.align	3
.LC879:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC880:
	.xword	.LC89
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_LoadDspCode
	.type	VCTRL_LoadDspCode, %function
VCTRL_LoadDspCode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC881
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w1, [x0, 608]
	cbnz	w1, .L1879
	ldr	w21, [x0, 1276]
	mov	w0, 0
	cmp	w21, wzr
	cset	w3, eq
	cmp	w1, 6
	cset	w2, ne
	tst	w3, w2
	beq	.L1898
.L1885:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1879:
	cmp	w1, 6
	mov	w3, 1
	cset	w2, ne
	mov	w21, 0
	tst	w3, w2
	mov	w0, 0
	bne	.L1885
.L1898:
	ldr	x20, .LC882
	add	x0, x20, 252
	add	x3, x20, 376
	ldr	w2, [x20, 248]
	cbz	w2, .L1870
	b	.L1869
	.p2align 3
.L1900:
	beq	.L1899
.L1870:
	ldr	w2, [x0]
	add	x0, x0, 4
	cmp	x3, x0
	cbz	w2, .L1900
.L1869:
	cmp	w2, 1
	beq	.L1901
	cmp	w1, 6
	mov	w0, 0
	beq	.L1885
	ldr	x1, .LC886
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1885
	.p2align 3
.L1899:
	mov	w0, w19
	bl	VCTRL_InitDspCode
	cmp	w21, 1
	beq	.L1902
	add	x20, x20, 248
	mov	w1, 2
	mov	w0, 0
	str	w1, [x20, w19, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1902:
	add	x20, x20, 248
	mov	w0, 0
	str	w21, [x20, w19, sxtw 2]
	b	.L1885
	.p2align 3
.L1901:
	cmp	w21, 1
	mov	w0, 0
	beq	.L1885
	ldr	x1, .LC884
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1885
	.size	VCTRL_LoadDspCode, .-VCTRL_LoadDspCode
	.align	3
.LC881:
	.xword	.LANCHOR0
	.align	3
.LC882:
	.xword	.LANCHOR5
	.align	3
.LC884:
	.xword	.LC883
	.align	3
.LC886:
	.xword	.LC885
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetChanFsPartitionState
	.type	VCTRL_SetChanFsPartitionState, %function
VCTRL_SetChanFsPartitionState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x0, .LC889
	ldr	x0, [x0, w20, sxtw 3]
	add	x0, x0, 323584
	str	w19, [x0, 3928]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_SetChanFsPartitionState, .-VCTRL_SetChanFsPartitionState
	.align	3
.LC889:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetCurChanFsSize
	.type	VCTRL_GetCurChanFsSize, %function
VCTRL_GetCurChanFsSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC890
	ldr	x0, [x0, w19, sxtw 3]
	ldr	x19, [sp, 16]
	add	x0, x0, 323584
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 3948]
	ret
	.size	VCTRL_GetCurChanFsSize, .-VCTRL_GetCurChanFsSize
	.align	3
.LC890:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRT_SetChanCtrlState
	.type	VCTRT_SetChanCtrlState, %function
VCTRT_SetChanCtrlState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cmp	w19, 1
	beq	.L1907
	cbz	w19, .L1908
	cmp	w19, 2
	bne	.L1916
	ldr	x0, .LC891
	add	x0, x0, 1792
	ldr	w1, [x0, w20, sxtw 2]
	cmp	w1, 1
	beq	.L1912
.L1914:
	str	w19, [x0, w20, sxtw 2]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1916:
	mov	w0, 0
.L1906:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1908:
	ldr	x1, .LC891
	mov	w0, 0
	add	x1, x1, 1792
	str	wzr, [x1, w20, sxtw 2]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1907:
	ldr	x0, .LC891
	add	x0, x0, 1792
	ldr	w1, [x0, w20, sxtw 2]
	cbz	w1, .L1914
.L1912:
	mov	w0, -1
	b	.L1906
	.size	VCTRT_SetChanCtrlState, .-VCTRT_SetChanCtrlState
	.align	3
.LC891:
	.xword	.LANCHOR6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_AddFrameBufMemoryRecord
	.type	VCTRL_AddFrameBufMemoryRecord, %function
VCTRL_AddFrameBufMemoryRecord:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1917
	ldr	w0, [x19]
	cmp	w0, 255
	beq	.L1920
	ldr	w2, [x19, 12]
	ldr	w0, [x19, 32]
	ldr	x1, [x19, 24]
	bl	MEM_AddMemRecord
.L1920:
	ldr	w0, [x19, 4]
	cmp	w0, 255
	beq	.L1921
	ldr	w2, [x19, 16]
	ldr	w0, [x19, 48]
	ldr	x1, [x19, 40]
	bl	MEM_AddMemRecord
.L1921:
	ldr	w0, [x19, 8]
	cmp	w0, 255
	beq	.L1917
	ldr	w2, [x19, 20]
	ldr	w0, [x19, 64]
	ldr	x1, [x19, 56]
	bl	MEM_AddMemRecord
.L1917:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_AddFrameBufMemoryRecord, .-VCTRL_AddFrameBufMemoryRecord
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_SetSingleFrameBufToChan
	.type	VCTRL_SetSingleFrameBufToChan, %function
VCTRL_SetSingleFrameBufToChan:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	mov	x23, x1
	bl	_mcount
	ldr	x26, .LC894
	ldr	x0, .LC893
	mov	w2, 32
	ldr	x25, [x26, w20, sxtw 3]
	ldr	x22, [x0, w20, sxtw 3]
	add	x1, x25, 323584
	add	x21, x25, 327680
	ldr	w0, [x1, 3956]
	ldr	w5, [x21, 3560]
	cmp	w0, w2
	ldr	w19, [x21, 3552]
	csel	w0, w0, w2, le
	str	w0, [x21, 3264]
	ldr	w4, [x23, 12]
	cmp	w4, w5
	beq	.L1933
	ldr	w0, [x1, 3944]
	cbz	w0, .L1998
.L1933:
	ldr	w0, [x21, 3528]
	cbz	w0, .L1935
	ldr	w0, [x21, 3592]
	cbz	w0, .L1999
.L1935:
	ldr	x24, .LC900
	mov	w0, 8
	ldr	x1, [x24, 24]
	blr	x1
	ldr	x0, [x26, w20, sxtw 3]
	add	x2, x0, 323584
	ldr	w1, [x2, 3976]
	cmp	w1, 255
	beq	.L1963
	add	x2, x2, 4048
	mov	x1, 1
	b	.L1938
	.p2align 3
.L2000:
	add	w1, w1, 1
	cmp	w1, 32
	beq	.L1954
.L1938:
	ldr	w3, [x2]
	add	x2, x2, 72
	cmp	w3, 255
	bne	.L2000
	cmp	w1, 32
	beq	.L1954
.L1936:
	lsl	x2, x1, 6
	ldr	x3, [x24, 104]
	add	x1, x2, x1, lsl 3
	mov	x2, 72
	add	x1, x1, 323584
	add	x0, x0, x1
	mov	x1, x23
	add	x0, x0, 3976
	blr	x3
	ldr	x0, [x26, w20, sxtw 3]
	add	x0, x0, 327680
	ldr	w1, [x0, 3592]
	add	w1, w1, 1
	str	w1, [x0, 3592]
	mov	x0, x23
	bl	VCTRL_AddFrameBufMemoryRecord
	ldr	x0, [x26, w20, sxtw 3]
	add	x1, x0, 327680
	ldr	w1, [x1, 3596]
	cbz	w1, .L1958
	ldrsb	w1, [x22, 1]
	cbnz	w1, .L2001
.L1941:
	ldr	w0, [x21, 3264]
	strb	w0, [x22, 10]
	add	x0, x21, 2184
	strb	wzr, [x22, 11]
	ldr	w1, [x0, 1344]
	strb	w1, [x22, 13]
	ldr	w1, [x23]
	cmp	w1, 255
	beq	.L2002
.L1960:
	ldrb	w0, [x0, 16]
	cbz	w0, .L2003
	add	x0, x21, 2212
	mov	x1, 1
	b	.L1944
	.p2align 3
.L2004:
	add	w1, w1, 1
	cmp	w1, 32
	beq	.L1954
.L1944:
	ldrb	w2, [x0]
	add	x0, x0, 12
	cbnz	w2, .L2004
	cmp	w1, 32
	beq	.L1954
.L1946:
	uxtw	x0, w1
	ldr	w5, [x23, 32]
	lsl	x2, x0, 2
	mov	w6, 1
	sub	x0, x2, x0
	add	w3, w5, 1023
	lsl	x0, x0, 2
	and	w3, w3, -1024
	add	x4, x25, x0
	add	x2, x25, x2
	add	x4, x4, 327680
	add	x2, x2, 327680
	sub	w19, w19, w5
	add	w19, w19, w3
	str	w3, [x4, 2192]
	add	w7, w5, w19
	add	x3, x21, 2184
	ldr	w8, [x23, 12]
	str	w8, [x4, 2196]
	strb	w6, [x4, 2200]
	ldr	w4, [x21, 3532]
	add	w4, w4, 1
	str	w4, [x21, 3532]
	str	w7, [x2, 3088]
	ldr	w4, [x21, 3220]
	add	w5, w5, w4
	add	w19, w5, w19
	str	w19, [x2, 2576]
	ldr	w2, [x23, 4]
	cmp	w2, 255
	beq	.L1947
	add	x0, x3, x0
	ldr	w2, [x23, 48]
	str	w2, [x0, 520]
	strb	w6, [x0, 528]
	ldr	w0, [x21, 3540]
	add	w0, w0, 1
	str	w0, [x21, 3540]
.L1947:
	ldr	w0, [x23, 8]
	cmp	w0, 255
	beq	.L1948
.L1962:
	ldrb	w0, [x21, 3272]
	cbz	w0, .L1965
	add	x2, x21, 3280
	mov	w0, 1
	b	.L1950
	.p2align 3
.L2005:
	add	w0, w0, 1
	cmp	w0, 32
	beq	.L1948
.L1950:
	ldrb	w3, [x2]
	add	x2, x2, 8
	cbnz	w3, .L2005
.L1949:
	add	x0, x25, x0, uxtw 3
	ldr	w4, [x23, 64]
	add	x0, x0, 327680
	mov	w3, 1
	str	w4, [x0, 3268]
	strb	w3, [x0, 3272]
	ldr	w0, [x21, 3536]
	add	w0, w0, 1
	str	w0, [x21, 3536]
.L1948:
	add	x4, x22, 20480
	ldr	w0, [x4, 2812]
	cbz	w0, .L1966
	add	x2, x4, 2912
	mov	x0, 1
	b	.L1953
	.p2align 3
.L2006:
	add	w0, w0, 1
	cmp	w0, 32
	beq	.L1954
.L1953:
	ldr	w3, [x2]
	add	x2, x2, 100
	cbnz	w3, .L2006
	cmp	w0, 32
	beq	.L1954
	mov	w6, w0
.L1951:
	lsl	x3, x1, 2
	lsl	x5, x0, 2
	sub	x1, x3, x1
	sub	x5, x5, x0
	add	x3, x25, x3
	add	x2, x22, 28672
	add	x25, x25, x1, lsl 2
	lsl	x1, x5, 5
	add	x5, x5, x1
	add	x25, x25, 327680
	add	x0, x5, x0
	ldr	w1, [x2, 1772]
	add	x0, x22, x0
	add	x3, x3, 327680
	add	x0, x0, 20480
	add	w1, w1, 1
	str	w1, [x2, 1772]
	add	x5, x22, 20
	mov	w7, 1
	str	w6, [x0, 2724]
	ldr	w6, [x25, 2192]
	str	w6, [x0, 2732]
	ldr	w6, [x25, 2196]
	str	w6, [x0, 2736]
	ldr	w6, [x3, 2576]
	str	w6, [x0, 2744]
	ldr	w6, [x21, 2184]
	str	w6, [x0, 2748]
	ldr	w6, [x21, 3236]
	str	w6, [x0, 2764]
	ldr	w6, [x21, 3244]
	str	w6, [x0, 2768]
	ldr	w6, [x21, 3248]
	str	w6, [x0, 2772]
	ldr	w6, [x21, 3228]
	str	w6, [x0, 2776]
	ldr	w6, [x21, 3232]
	str	w6, [x0, 2780]
	ldr	w3, [x3, 3088]
	str	w3, [x0, 2752]
	ldr	w3, [x21, 3216]
	str	w3, [x0, 2756]
	ldr	w3, [x21, 3220]
	str	w3, [x0, 2760]
	ldr	w6, [x5, 8]
	str	w6, [x0, 2784]
	ldr	w5, [x5, 12]
	str	w5, [x0, 2788]
	ldr	w3, [x21, 3252]
	str	w3, [x0, 2792]
	ldr	w3, [x21, 3256]
	str	w3, [x0, 2796]
	ldr	w3, [x21, 3260]
	str	w3, [x0, 2800]
	strb	wzr, [x0, 2716]
	strb	wzr, [x0, 2717]
	strb	wzr, [x0, 2718]
	str	w7, [x0, 2812]
	ldr	w0, [x2, 1020]
	cbnz	w0, .L1955
	strb	w7, [x22, 12]
	str	wzr, [x2, 932]
	str	wzr, [x2, 940]
	ldr	w0, [x21, 2184]
	str	w0, [x2, 956]
	str	w6, [x2, 992]
	str	w5, [x2, 996]
	ldr	w0, [x21, 3252]
	str	w0, [x2, 1000]
	ldr	w0, [x21, 3256]
	str	w0, [x2, 1004]
	ldr	w0, [x21, 3260]
	str	w0, [x2, 1008]
	strb	wzr, [x2, 924]
	strb	wzr, [x2, 925]
	strb	wzr, [x2, 926]
	str	w7, [x2, 1020]
.L1955:
	ldrsb	w1, [x22, 13]
	ldr	w0, [x2, 1776]
	cmp	w0, w1
	bcs	.L1956
	ldr	w1, [x23, 8]
	cmp	w1, 255
	beq	.L1956
	uxtw	x1, w0
	mov	w3, 1
	add	w0, w0, 1
	add	x7, x21, x1, lsl 3
	add	x1, x22, x1, lsl 3
	add	x1, x1, 28672
	ldr	w7, [x7, 3268]
	str	w7, [x1, 1512]
	strb	w3, [x1, 1516]
	strb	wzr, [x1, 1517]
	str	w0, [x2, 1776]
.L1956:
	ldr	w0, [x2, 1780]
	add	x7, x21, 2184
	ldr	w1, [x21, 3264]
	cmp	w0, w1
	bcs	.L1957
	ldr	w1, [x23, 4]
	cmp	w1, 255
	beq	.L1957
	ldr	w8, [x21, 3540]
	uxtw	x1, w0
	add	w3, w0, 1
	lsl	x0, x1, 2
	sub	w9, w8, #1
	sub	x0, x0, x1
	lsl	x8, x9, 2
	sub	x8, x8, x9
	add	x7, x7, x8, lsl 2
	ldr	w8, [x7, 520]
	lsl	x7, x0, 5
	add	x7, x0, x7
	add	x0, x22, x0, lsl 2
	add	x1, x7, x1
	add	x0, x0, 28672
	add	x1, x22, x1
	add	x1, x1, 20480
	str	w8, [x1, 2740]
	mov	w1, 1
	str	wzr, [x0, 1132]
	str	w1, [x0, 1128]
	str	w3, [x2, 1780]
.L1957:
	ldr	w1, [x21, 3524]
	str	w1, [x2, 1508]
	ldr	w1, [x4, 2712]
	cbnz	w1, .L1958
	ldr	w1, [x4, 2732]
	str	w1, [x4, 2632]
	mov	w1, 1
	str	wzr, [x4, 2624]
	ldr	w2, [x21, 2184]
	str	w2, [x4, 2648]
	str	w6, [x4, 2684]
	str	w5, [x4, 2688]
	ldr	w2, [x21, 3252]
	str	w2, [x4, 2692]
	ldr	w2, [x21, 3256]
	str	w2, [x4, 2696]
	ldr	w0, [x21, 3260]
	str	w0, [x4, 2700]
	strb	wzr, [x4, 2616]
	strb	wzr, [x4, 2617]
	strb	wzr, [x4, 2618]
	str	w1, [x4, 2712]
.L1958:
	ldr	x1, [x24, 32]
	mov	w0, 8
	blr	x1
	mov	w0, 0
.L1993:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2001:
	add	x0, x0, 331776
	ldr	w0, [x0, 28]
	cbnz	w0, .L1941
	ldrsb	w1, [x22, 23]
	ldr	w2, [x21, 3264]
	add	w0, w1, 4
	strb	wzr, [x22, 11]
	cmp	w0, w2
	csel	w0, w0, w2, le
	strb	w0, [x22, 10]
	add	x0, x21, 2184
	ldr	w1, [x0, 1344]
	strb	w1, [x22, 13]
	ldr	w1, [x23]
	cmp	w1, 255
	bne	.L1960
.L2002:
	ldr	w0, [x23, 8]
	mov	x1, 0
	cmp	w0, 255
	bne	.L1962
	b	.L1948
	.p2align 3
.L1999:
	ldr	w5, [x23, 8]
	cmp	w5, 255
	bne	.L1935
	ldr	x2, .LC895
	mov	w4, 0
	ldr	x1, .LC899
	mov	w3, 9251
	add	x2, x2, 784
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1993
	.p2align 3
.L1963:
	mov	x1, 0
	b	.L1936
.L1966:
	mov	w6, 0
	mov	x0, 0
	b	.L1951
	.p2align 3
.L1954:
	ldr	x1, [x24, 32]
	mov	w0, 8
	blr	x1
	mov	w0, -1
	b	.L1993
.L2003:
	mov	x1, 0
	b	.L1946
.L1965:
	mov	w0, 0
	b	.L1949
.L1998:
	ldr	x2, .LC895
	mov	w3, 9241
	ldr	x1, .LC897
	mov	w0, 1
	add	x2, x2, 784
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1993
	.size	VCTRL_SetSingleFrameBufToChan, .-VCTRL_SetSingleFrameBufToChan
	.align	3
.LC893:
	.xword	s_pFspInst
	.align	3
.LC894:
	.xword	.LANCHOR0
	.align	3
.LC895:
	.xword	.LANCHOR4
	.align	3
.LC897:
	.xword	.LC896
	.align	3
.LC899:
	.xword	.LC898
	.align	3
.LC900:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_AllocMemToDecoder
	.type	VCTRL_AllocMemToDecoder, %function
VCTRL_AllocMemToDecoder:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x21, .LC901
	add	x3, x21, 1792
	ldr	w0, [x3, w19, sxtw 2]
	cbz	w0, .L2016
	ldr	x2, .LC908
	mov	w3, w19
	ldr	x1, .LC910
	mov	w0, 0
	add	x2, x2, 816
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2016:
	ldr	x4, .LC902
	mov	x1, x20
	mov	w5, 1
	mov	x2, 72
	add	x0, x29, 56
	str	w5, [x3, w19, sxtw 2]
	ldr	x4, [x4, 104]
	blr	x4
	add	x1, x29, 56
	mov	w0, w19
	bl	VCTRL_SetSingleFrameBufToChan
	mov	w20, w0
	cbnz	w0, .L2009
	ldr	x0, .LC903
	ldr	x2, [x0, w19, sxtw 3]
	add	x2, x2, 323584
.L2010:
	ldr	x1, .LC907
	add	x21, x21, 1792
	mov	w3, 2
	mov	w0, 31
	str	w3, [x2, 3928]
	bl	dprint_vfmw
	str	wzr, [x21, w19, sxtw 2]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2009:
	ldr	x22, .LC903
	ldr	x2, [x22, w19, sxtw 3]
	add	x2, x2, 323584
	ldr	w0, [x2, 3948]
	cbz	w0, .L2010
	ldr	x1, .LC905
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x2, [x22, w19, sxtw 3]
	mov	w0, 3
	add	x2, x2, 323584
	str	w0, [x2, 3928]
	b	.L2010
	.size	VCTRL_AllocMemToDecoder, .-VCTRL_AllocMemToDecoder
	.align	3
.LC901:
	.xword	.LANCHOR6
	.align	3
.LC902:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC903:
	.xword	.LANCHOR0
	.align	3
.LC905:
	.xword	.LC904
	.align	3
.LC907:
	.xword	.LC906
	.align	3
.LC908:
	.xword	.LANCHOR4
	.align	3
.LC910:
	.xword	.LC909
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetImageWidth
	.type	VCTRL_GetImageWidth, %function
VCTRL_GetImageWidth:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC912
	ldr	x0, [x0, w19, sxtw 3]
	add	x0, x0, 331776
	ldr	w1, [x0, 72]
	cmp	w1, 2
	beq	.L2019
	cmp	w1, 16
	beq	.L2020
	cbz	w1, .L2025
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2025:
	add	x0, x0, 80
	bl	H264DEC_GetImageWidth
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2020:
	add	x0, x0, 80
	bl	HEVCDEC_GetImageWidth
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2019:
	add	x0, x0, 80
	bl	MPEG4DEC_GetImageWidth
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetImageWidth, .-VCTRL_GetImageWidth
	.align	3
.LC912:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetImageHeight
	.type	VCTRL_GetImageHeight, %function
VCTRL_GetImageHeight:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC913
	ldr	x0, [x0, w19, sxtw 3]
	add	x0, x0, 331776
	ldr	w1, [x0, 72]
	cmp	w1, 2
	beq	.L2028
	cmp	w1, 16
	beq	.L2029
	cbz	w1, .L2034
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2034:
	add	x0, x0, 80
	bl	H264DEC_GetImageHeight
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2029:
	add	x0, x0, 80
	bl	HEVCDEC_GetImageHeight
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2028:
	add	x0, x0, 80
	bl	MPEG4DEC_GetImageHeight
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_GetImageHeight, .-VCTRL_GetImageHeight
	.align	3
.LC913:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_GetFsSize
	.type	VCTRL_GetFsSize, %function
VCTRL_GetFsSize:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	bl	_mcount
	ldr	x3, .LC914
	mov	x2, 24
	mov	w1, 0
	add	x0, x29, 56
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, .LC915
	ldr	x6, [x0, 104]
	cbz	x6, .L2036
	ldr	x4, .LC916
	add	x5, x29, 56
	mov	w3, 0
	mov	w2, w21
	mov	w1, w20
	mov	w0, w19
	ldr	x4, [x4, w19, sxtw 3]
	add	x4, x4, 331776
	ldr	w4, [x4, 72]
	blr	x6
.L2036:
	ldr	w0, [x29, 60]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.size	VCTRL_GetFsSize, .-VCTRL_GetFsSize
	.align	3
.LC914:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC915:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC916:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_EnableEsBuf
	.type	VCTRL_EnableEsBuf, %function
VCTRL_EnableEsBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC917
	mov	w1, 1
	add	x0, x0, 2200
	str	w1, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_EnableEsBuf, .-VCTRL_EnableEsBuf
	.align	3
.LC917:
	.xword	.LANCHOR6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_DisableEsBuf
	.type	VCTRL_DisableEsBuf, %function
VCTRL_DisableEsBuf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC919
	add	x0, x0, 2200
	str	wzr, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_DisableEsBuf, .-VCTRL_DisableEsBuf
	.align	3
.LC919:
	.xword	.LANCHOR6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VCTRL_IfEsBufEnable
	.type	VCTRL_IfEsBufEnable, %function
VCTRL_IfEsBufEnable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC921
	add	x0, x0, 2200
	ldr	w0, [x0, w19, sxtw 2]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VCTRL_IfEsBufEnable, .-VCTRL_IfEsBufEnable
	.align	3
.LC921:
	.xword	.LANCHOR6
	.global	g_EsBufValidFlag
	.global	g_StopDec
	.global	g_SleepTime
	.global	s_VfmwSavePath
	.global	MemRecord_YUV
	.global	pVl_2bit
	.global	pUl_2bit
	.global	pY_2bit
	.global	pVl
	.global	pUl
	.global	pY
	.global	g_u32DFSMaxAllocTime
	.global	pOption
	.global	g_eVdmVersion
	.global	g_VdmCharacter
	.global	g_StandardObedience
	.global	g_CurProcChan
	.global	g_ResetCreateNewSave
	.global	save_yuv_with_crop
	.global	save_el_chan_num
	.global	vfmw_save_el_file
	.global	save_metadata_reorder_chan_num
	.global	vfmw_save_metadata_reorder_file
	.global	save_metadata_chan_num
	.global	vfmw_save_metadata_file
	.global	save_yuv_chan_num
	.global	vfmw_save_yuv_file
	.global	save_seg_chan_num
	.global	vfmw_save_seg_file
	.global	save_str_chan_num
	.global	vfmw_save_str_file
	.global	g_apple_airplay_mirrorinig_flag
	.global	g_not_allow_H264FullPictureRepair_flag
	.global	g_not_direct_8x8_inference_flag
	.global	g_allow_B_before_P
	.global	extra_cmd
	.global	extra_disp
	.global	extra_ref
	.global	g_VfmwGlobalStat
	.global	g_VfmwChanStat
	.global	s_pstVfmwChan
	.global	AcceleratorCharacter
	.global	g_event_report
	.global	g_IsrFlag
	.global	g_SCDID
	.global	g_DSPState
	.global	mask_mmu_err_int
	.global	g_SedOnlyEnable
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.50211, %object
	.size	__func__.50211, 18
__func__.50211:
	.string	"VCTRL_EventReport"
	.zero	6
	.type	__func__.50147, %object
	.size	__func__.50147, 20
__func__.50147:
	.string	"VCTRL_RecordPosTime"
	.zero	4
	.type	__func__.50152, %object
	.size	__func__.50152, 17
__func__.50152:
	.string	"VCTRL_RecordData"
	.zero	7
	.type	__func__.50223, %object
	.size	__func__.50223, 18
__func__.50223:
	.string	"VCTRL_SetCallBack"
	.zero	6
	.type	__FUNCTION__.50329, %object
	.size	__FUNCTION__.50329, 29
__FUNCTION__.50329:
	.string	"VCTRL_PartitionMemForStdUser"
	.zero	3
	.type	__func__.50353, %object
	.size	__func__.50353, 23
__func__.50353:
	.string	"VCTRL_FreeChanResource"
	.zero	1
	.type	__func__.50601, %object
	.size	__func__.50601, 25
__func__.50601:
	.string	"VCTRL_TryToRelSpecialFrm"
	.zero	7
	.type	__func__.50618, %object
	.size	__func__.50618, 19
__func__.50618:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__FUNCTION__.50626, %object
	.size	__FUNCTION__.50626, 19
__FUNCTION__.50626:
	.string	"VCTRL_GetChanImage"
	.zero	5
	.type	__FUNCTION__.50636, %object
	.size	__FUNCTION__.50636, 23
__FUNCTION__.50636:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__func__.50637, %object
	.size	__func__.50637, 23
__func__.50637:
	.string	"VCTRL_ReleaseChanImage"
	.zero	1
	.type	__func__.50670, %object
	.size	__func__.50670, 18
__func__.50670:
	.string	"VCTRL_GetDecParam"
	.align	3
.LANCHOR4 = . + 0
	.type	__FUNCTION__.50793, %object
	.size	__FUNCTION__.50793, 19
__FUNCTION__.50793:
	.string	"VCTRL_FlushDecoder"
	.zero	5
	.type	__FUNCTION__.51080, %object
	.size	__FUNCTION__.51080, 18
__FUNCTION__.51080:
	.string	"GetExtraRefFrmNum"
	.zero	6
	.type	__FUNCTION__.51086, %object
	.size	__FUNCTION__.51086, 19
__FUNCTION__.51086:
	.string	"GetExtraDispFrmNum"
	.zero	5
	.type	__FUNCTION__.51092, %object
	.size	__FUNCTION__.51092, 16
__FUNCTION__.51092:
	.string	"GetExtraCtrlCmd"
	.type	__FUNCTION__.51030, %object
	.size	__FUNCTION__.51030, 14
__FUNCTION__.51030:
	.string	"DecChanSyntax"
	.zero	2
	.type	__func__.50551, %object
	.size	__func__.50551, 24
__func__.50551:
	.string	"VCTRL_FindOccupiedFrame"
	.type	__func__.51060, %object
	.size	__func__.51060, 20
__func__.51060:
	.string	"VCTRL_GetChanImgNum"
	.zero	4
	.type	g_ProcCommandTable, %object
	.size	g_ProcCommandTable, 608
g_ProcCommandTable:
	.word	0
	.zero	4
	.xword	VfmwProc_SetPrintLevel
	.word	2
	.zero	4
	.xword	VfmwProc_SetErrorThread
	.word	4
	.zero	4
	.xword	VfmwProc_SetDecOrderOutput
	.word	5
	.zero	4
	.xword	VfmwProc_SetDecMode
	.word	7
	.zero	4
	.xword	VfmwProc_SetDropStreamThread
	.word	11
	.zero	4
	.xword	VfmwProc_SetUSE_FF_APT_EN
	.word	12
	.zero	4
	.xword	VfmwProc_SetSaveFileAfterReset
	.word	13
	.zero	4
	.xword	VfmwProc_SetCurProcChan
	.word	256
	.zero	4
	.xword	VfmwProc_PrintTracer
	.word	257
	.zero	4
	.xword	VfmwProc_SetScdPrint
	.word	512
	.zero	4
	.xword	VfmwProc_Savestream
	.word	513
	.zero	4
	.xword	VfmwProc_SaveSeg
	.word	514
	.zero	4
	.xword	VfmwProc_SaveYUV
	.word	515
	.zero	4
	.xword	VfmwProc_SaveOneYUV
	.word	516
	.zero	4
	.xword	VfmwProc_Save1DYUV
	.word	528
	.zero	4
	.xword	VfmwProc_SaveMetadata
	.word	544
	.zero	4
	.xword	VfmwProc_SaveReorderMetadata
	.word	560
	.zero	4
	.xword	VfmwProc_SaveEL
	.word	768
	.zero	4
	.xword	VfmwProc_TestSuspend
	.word	769
	.zero	4
	.xword	VfmwProc_TestResume
	.word	896
	.zero	4
	.xword	VfmwProc_TestStopChan
	.word	897
	.zero	4
	.xword	VfmwProc_TestResetChan
	.word	898
	.zero	4
	.xword	VfmwProc_TestStartChan
	.word	899
	.zero	4
	.xword	VfmwProc_TestRestartChan
	.word	1024
	.zero	4
	.xword	VfmwProc_TestTimeSequence
	.word	1026
	.zero	4
	.xword	VfmwProc_TestStopDec
	.word	1280
	.zero	4
	.xword	VfmwProc_SetTraceCtrl
	.word	1281
	.zero	4
	.xword	VfmwProc_SetTraceBSPeriod
	.word	1282
	.zero	4
	.xword	VfmwProc_SetTraceFramePeriod
	.word	1283
	.zero	4
	.xword	VfmwProc_SetTraceImgPeriod
	.word	1536
	.zero	4
	.xword	VfmwProc_OpenModuleLowly
	.word	1537
	.zero	4
	.xword	VfmwProc_CloseModuleLowly
	.word	1538
	.zero	4
	.xword	VfmwProc_SetTunnelLineNumber
	.word	1539
	.zero	4
	.xword	VfmwProc_OpenScdLowdly
	.word	1540
	.zero	4
	.xword	VfmwProc_CloseScdLowdly
	.word	1541
	.zero	4
	.xword	VfmwProc_SetSedOnlyEnable
	.word	1792
	.zero	4
	.xword	VfmwProc_SetSmmuIrqEnable
	.word	65535
	.zero	4
	.xword	0
	.type	__func__.50438, %object
	.size	__func__.50438, 18
__func__.50438:
	.string	"VCTRL_DestroyChan"
	.zero	6
	.type	__func__.51440, %object
	.size	__func__.51440, 30
__func__.51440:
	.string	"VCTRL_SetSingleFrameBufToChan"
	.zero	2
	.type	__func__.51460, %object
	.size	__func__.51460, 24
__func__.51460:
	.string	"VCTRL_AllocMemToDecoder"
	.data
	.align	3
.LANCHOR2 = . + 0
	.type	s_VfmwSavePath, %object
	.size	s_VfmwSavePath, 64
s_VfmwSavePath:
	.byte	47
	.byte	109
	.byte	110
	.byte	116
	.byte	0
	.zero	59
	.type	save_yuv_chan_num, %object
	.size	save_yuv_chan_num, 4
save_yuv_chan_num:
	.word	-1
	.type	mask_mmu_err_int, %object
	.size	mask_mmu_err_int, 4
mask_mmu_err_int:
	.word	1
	.type	g_SedOnlyEnable, %object
	.size	g_SedOnlyEnable, 4
g_SedOnlyEnable:
	.word	1
	.type	g_not_direct_8x8_inference_flag, %object
	.size	g_not_direct_8x8_inference_flag, 1
g_not_direct_8x8_inference_flag:
	.byte	1
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"InstID out of range" )
	.zero	4
.LC5:
	ASCII(.string	"vfmw_ctrl.c,L%d: %s\n" )
	.zero	3
.LC8:
	ASCII(.string	"Chan inactive" )
	.zero	2
.LC10:
	ASCII(.string	"s_VfmwCTrl.event_report_vdec = NULL\n" )
	.zero	3
.LC12:
	ASCII(.string	"s_VfmwCTrl.event_report_omxvdec = NULL\n" )
.LC15:
	ASCII(.string	"%s Unkown Adapter Type: %d, Len: %d\n" )
	.zero	3
.LC18:
	ASCII(.string	"------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleLowlyEnable = 1 ------\n" )
	.zero	6
.LC21:
	ASCII(.string	"------ g_TraceImgPeriod = %x ------\n" )
	.zero	3
.LC24:
	ASCII(.string	"------ g_TraceFramePeriod = %x ------\n" )
	.zero	1
.LC27:
	ASCII(.string	"------ g_TraceBsPeriod = %x ------\n" )
	.zero	4
.LC30:
	ASCII(.string	"------ g_TraceCtrl = %x ------\n" )
.LC33:
	ASCII(.string	"------ dec stop = %d ------\n" )
	.zero	3
.LC36:
	ASCII(.string	"------ dec task delay %d ms ------\n" )
	.zero	4
.LC41:
	ASCII(.string	"%s/vfmw_el_save_%d.dat" )
	.zero	1
.LC43:
	ASCII(.string	"OK create file '%s' for channel %d el stream save\n" )
	.zero	5
.LC45:
	ASCII(.string	"failed create file '%s' for el stream save!\n" )
	.zero	3
.LC47:
	ASCII(.string	">>>> close el stream saving >>>>\n" )
	.zero	6
.LC50:
	ASCII(.string	"NO SUCH CHANNEL : %d\n" )
	.zero	2
.LC53:
	ASCII(.string	"Pay attention to  CHANNEL : %d\n" )
.LC56:
	ASCII(.string	"ResetCreateNewSave = %d\n" )
	.zero	7
.LC58:
	ASCII(.string	"ResetCreateNewSave can NOT be set to %d, must be 0 or 1\n" )
	.zero	7
.LC61:
	ASCII(.string	"USE_FF_APT_EN = %d\n" )
	.zero	4
.LC63:
	ASCII(.string	"USE_FF_APT_EN can NOT be set to %d, must be 0 or 1\n" )
	.zero	4
.LC68:
	ASCII(.string	"OK create file '%s' for channel %d metadata_reorder stream save\n" )
	.zero	7
.LC70:
	ASCII(.string	"failed create file '%s' for metadata_reorder stream save!\n" )
	.zero	5
.LC72:
	ASCII(.string	">>>> close metadata stream saving >>>>\n" )
.LC78:
	ASCII(.string	"OK create file '%s' for channel %d metadata stream save\n" )
	.zero	7
.LC80:
	ASCII(.string	"failed create file '%s' for metadata stream save!\n" )
	.zero	5
.LC85:
	ASCII(.string	"address '0x%x' is not valid!\n" )
	.zero	2
.LC89:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC91:
	ASCII(.string	"1d image has been saved to '%s'\n" )
	.zero	7
.LC93:
	ASCII(.string	"open file '%s' fail!\n" )
	.zero	2
.LC98:
	ASCII(.string	"2d image has been saved to '%s'\n" )
	.zero	7
.LC104:
	ASCII(.string	"OK create file '%s' for channel %d seg stream save\n" )
	.zero	4
.LC106:
	ASCII(.string	"failed create file '%s' for seg stream save!\n" )
	.zero	2
.LC108:
	ASCII(.string	">>>> close seg stream saving >>>>\n" )
	.zero	5
.LC114:
	ASCII(.string	"OK create file '%s' for channel %d raw stream save\n" )
	.zero	4
.LC116:
	ASCII(.string	"failed create file '%s' for raw stream save!\n" )
	.zero	2
.LC118:
	ASCII(.string	">>>> close raw stream saving >>>>\n" )
	.zero	5
.LC124:
	ASCII(.string	"Failed Alloc VFMW_BigTile1d_YUV for yuv save!\n" )
	.zero	1
.LC126:
	ASCII(.string	"OK create file '%s' for chan %d yuv save.(crop %d)\n" )
	.zero	4
.LC128:
	ASCII(.string	"failed create file '%s' for yuv save!\n" )
	.zero	1
.LC130:
	ASCII(.string	"OK close yuv save.\n" )
	.zero	4
.LC134:
	ASCII(.string	"print memory tracer...\n" )
.LC137:
	ASCII(.string	"unmask vfmw mmu err int!\n" )
	.zero	6
.LC139:
	ASCII(.string	"mask vfmw mmu err int!\n" )
.LC142:
	ASCII(.string	"Disable SedOnly Func\n" )
	.zero	2
.LC144:
	ASCII(.string	"Enable SedOnly Func\n" )
	.zero	3
.LC146:
	ASCII(.string	"The channel number is to Large.\n" )
	.zero	7
.LC162:
	ASCII(.string	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSleep=%d)!\n" )
	.zero	5
.LC166:
	ASCII(.string	"Vfmw suspend totally take %d ms\n" )
	.zero	7
.LC168:
	ASCII(.string	"Force scd %d sleep.\n" )
	.zero	3
.LC170:
	ASCII(.string	"Force vdm %d sleep.\n" )
	.zero	3
.LC173:
	ASCII(.string	"proc cmd need no param:%p\n" )
	.zero	5
.LC180:
	ASCII(.string	"Vfmw resume totally take %d ms\n" )
.LC191:
	ASCII(.string	"%s,%d,pos(%d) error!\n" )
	.zero	2
.LC198:
	ASCII(.string	"%s, %d, pos(%d) error!\n" )
.LC204:
	ASCII(.string	"ChanID out of range" )
	.zero	4
.LC209:
	ASCII(.string	"can NOT config a not-opened Chan" )
	.zero	7
.LC211:
	ASCII(.string	"event_report null!" )
	.zero	5
.LC216:
	ASCII(.string	"%s Unkown Adapter Type: %d\n" )
	.zero	4
.LC222:
	ASCII(.string	"pstStreamParam is NULL" )
	.zero	1
.LC235:
	ASCII(.string	"L: %d, Stream Interface Error!!, ChanID: %d\n" )
	.zero	3
.LC238:
	ASCII(.string	"pstStreamIntf is NULL" )
	.zero	2
.LC248:
	ASCII(.string	"This Chan has not been created!!!" )
	.zero	6
.LC250:
	ASCII(.string	"can NOT get a not-opened Chan's information of bitstream" )
	.zero	7
.LC257:
	ASCII(.string	"Raw FreshNum=%d, FreshSize=%d\n" )
	.zero	1
.LC264:
	ASCII(.string	"Seg FreshNum=%d, FreshSize=%d\n" )
	.zero	1
.LC268:
	ASCII(.string	"pArgs is null" )
	.zero	2
.LC276:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC278:
	ASCII(.string	"no mem to arrange for soft dec\n" )
.LC281:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC284:
	ASCII(.string	"%s: L%d : vdm chan memory is too small to support user decoder\n" )
.LC286:
	ASCII(.string	"FSP_ConfigInstance fail!\n" )
	.zero	6
.LC291:
	ASCII(.string	"parameter err, null pointer!!!" )
	.zero	1
.LC295:
	ASCII(.string	"%s FATAL: pstChan = NULL!\n" )
	.zero	5
.LC297:
	ASCII(.string	"%s FATAL: pChanMem_vdh = NULL!\n" )
.LC299:
	ASCII(.string	"%s FATAL: pChanMem_frm = NULL!\n" )
.LC301:
	ASCII(.string	"DelAllFrameMemRecord err in VCTRL_FreeChanResource !\n" )
	.zero	2
.LC303:
	ASCII(.string	"%s FATAL: pChanMem_scd = NULL!\n" )
.LC305:
	ASCII(.string	"%s FATAL: pChanMem_ctx = NULL!\n" )
.LC310:
	ASCII(.string	"pstCfg is null" )
	.zero	1
.LC319:
	ASCII(.string	"Chip not support beyond %dx%d when Std != H264/VP8/MVC/USER.\n" )
	.zero	2
.LC337:
	ASCII(.string	"%s,%d,s_pstVfmwChan[chanID]->FspInst.stDecFsRec[i].phyFS.PhyAddr = 0x%x\n" )
	.zero	7
.LC339:
	ASCII(.string	"%s,%d,can't find special frame match DecFs Num = %d\n" )
	.zero	3
.LC342:
	ASCII(.string	"call VCTRL_GetChanImage, ChanID = %d,\n" )
	.zero	1
.LC348:
	ASCII(.string	"This channel is not opened" )
	.zero	5
.LC352:
	ASCII(.string	"%s cannot output!\n" )
	.zero	5
.LC354:
	ASCII(.string	"%s: view_0 id(%d) > view_1 id(%d), error!\n" )
	.zero	5
.LC356:
	ASCII(.string	"%s: continuous view0 id(%d)!\n" )
	.zero	2
.LC358:
	ASCII(.string	"%s: continuous view1 id(%d)!\n" )
	.zero	2
.LC368:
	ASCII(.string	"pImage is NULL" )
	.zero	1
.LC370:
	ASCII(.string	"call VCTRL_ReleaseChanImage, ChanID, ImgID = %d,%d\n" )
	.zero	4
.LC373:
	ASCII(.string	"vdm_ctrl.c,L%d: Chan inactive\n" )
	.zero	1
.LC375:
	ASCII(.string	"vdm_ctrl.c,L%d: This channel is not opened\n" )
	.zero	4
.LC377:
	ASCII(.string	"vdm_ctrl.c,L%d: VCTRL_TryToRelSpecialFrm success!\n" )
	.zero	5
.LC382:
	ASCII(.string	"%s call SYNTAX_ReleaseImage failed\n" )
	.zero	4
.LC386:
	ASCII(.string	"vfmw_ctrl.c, line %d: ChanID out of range\n" )
	.zero	5
.LC388:
	ASCII(.string	"vfmw_ctrl.c, line %d: Chan %d is not open or not running\n" )
	.zero	6
.LC394:
	ASCII(.string	"%s VidStd=%d Error!\n" )
	.zero	3
.LC397:
	ASCII(.string	"Get DecParam Type Failure!\n" )
	.zero	4
.LC400:
	ASCII(.string	"vfmw_ctrl.c, line %d: ChanID out of range is %d\n" )
	.zero	7
.LC402:
	ASCII(.string	"Chan %d is not open or not running\n" )
	.zero	4
.LC407:
	ASCII(.string	"ChanId out of range" )
	.zero	4
.LC412:
	ASCII(.string	"This channel is not running" )
	.zero	4
.LC418:
	ASCII(.string	"line: %d Flush DPB failed!\n" )
	.zero	4
.LC420:
	ASCII(.string	"VCTRL_FlushDecoder\n" )
	.zero	4
.LC423:
	ASCII(.string	"fuction return value is null,%s %d MVC_OK != MVC_FlushDPB!!\n" )
	.zero	3
.LC435:
	ASCII(.string	"chan not create" )
.LC437:
	ASCII(.string	"can NOT start a not-opened Chan" )
.LC439:
	ASCII(.string	"NULL == pArgs" )
	.zero	2
.LC454:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC459:
	ASCII(.string	"VCTRL_GetUsrdecFrame but VFMW_USER != s_pstVfmwChan[ChanID]->eVidStd!\n" )
	.zero	1
.LC461:
	ASCII(.string	"VCTRL_GetUsrdecFrame but s_pstVfmwChan[ChanID]->s32UsrdecFrameNum < MIN_USERDEC_FRAME_NUM!\n" )
	.zero	4
.LC463:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC465:
	ASCII(.string	"get image buffer ok: LogicFsID = %d\n" )
	.zero	3
.LC467:
	ASCII(.string	"line: %d, pLf is NULL!\n" )
.LC469:
	ASCII(.string	"decode %p, disp %p, tf %p\n" )
	.zero	5
.LC471:
	ASCII(.string	"VCTRL_GetUsrdecFrame get LogicFs fail!\n" )
.LC477:
	ASCII(.string	"CAP_LEVEL_USER_DEFINE_WITH_OPTION option is illegal.\n" )
	.zero	2
.LC480:
	ASCII(.string	"VCTRL_GetChanMemSizeByOption L%d: arrange return failure\n" )
	.zero	6
.LC485:
	ASCII(.string	"ERROR: s32MaxRefFrameNum(%d), extra_ref(%d), s32DisplayFrameNum(%d), extra_disp(%d)\n" )
	.zero	3
.LC493:
	ASCII(.string	"MEM_MapRegisterAddr reg 0x%x failed!\n" )
	.zero	2
.LC498:
	ASCII(.string	"MEM_AllocMemBlock Vdh %d failed!\n" )
	.zero	6
.LC500:
	ASCII(.string	"VDMHAL_OpenHAL Vdh %d failed!\n" )
	.zero	1
.LC502:
	ASCII(.string	"MEM_AllocMemBlock VFMW_VP9Prob %d failed!\n" )
	.zero	5
.LC506:
	ASCII(.string	"MEM_AllocMemBlock Scd %d failed!\n" )
	.zero	6
.LC508:
	ASCII(.string	"SM_OpenSCDDrv Scd %d failed!\n" )
	.zero	2
.LC510:
	ASCII(.string	"Register irq %d failed!\n" )
	.zero	7
.LC520:
	ASCII(.string	"extra_ref=" )
	.zero	5
.LC522:
	ASCII(.string	"=" )
	.zero	6
.LC524:
	ASCII(.string	" " )
	.zero	6
.LC527:
	ASCII(.string	"fuction return value is null,%s %d unknow error!!\n" )
	.zero	5
.LC529:
	ASCII(.string	"ERROR: extra_ref = %d is out of [ -5000, 5000 ]!\n" )
	.zero	6
.LC531:
	ASCII(.string	"extra_disp=" )
	.zero	4
.LC533:
	ASCII(.string	"ERROR: extra_disp = %d is out of [ -5000, 5000 ]!\n" )
	.zero	5
.LC537:
	ASCII(.string	"extra_cmd=" )
	.zero	5
.LC544:
	ASCII(.string	"HI_VFMW_VideoDecode" )
	.zero	4
.LC548:
	ASCII(.string	"(safe,warn,danger) :amount = %d,%d,%d,%d\n" )
	.zero	6
.LC550:
	ASCII(.string	"strm_ctrl: I->IPB\n" )
	.zero	5
.LC552:
	ASCII(.string	"strm_ctrl: IPB->I\n" )
	.zero	5
.LC554:
	ASCII(.string	"(CurrMode,NextMode) = %d,%d\n" )
	.zero	3
.LC559:
	ASCII(.string	"pic_pts: %lld\n" )
	.zero	1
.LC561:
	ASCII(.string	"pic_usertag: %lld\n" )
	.zero	5
.LC563:
	ASCII(.string	"pic_pts: %lld pic_usertag = %lld\n" )
	.zero	6
.LC571:
	ASCII(.string	"Syntax is stopped from This channel" )
	.zero	4
.LC576:
	ASCII(.string	"[%d] vdm busy\n" )
	.zero	1
.LC578:
	ASCII(.string	"[%d] no frame\n" )
	.zero	1
.LC580:
	ASCII(.string	"[%d] no stream\n" )
.LC583:
	ASCII(.string	"%s:ChanId %d this hevc file is 10bit!!!\n" )
	.zero	7
.LC586:
	ASCII(.string	"DFS, Wait Partition\n" )
	.zero	3
.LC588:
	ASCII(.string	"DFS, Partition fail, u32DynamicFrameStoreAllocEn: %d, eFspPartitionState: %d\n" )
	.zero	2
.LC600:
	ASCII(.string	"Thread running...\n" )
	.zero	5
.LC602:
	ASCII(.string	"Thread stopped!\n" )
	.zero	7
.LC604:
	ASCII(.string	"thread running...\n" )
	.zero	5
.LC606:
	ASCII(.string	"thread stopped...\n" )
	.zero	5
.LC609:
	ASCII(.string	"Thread killed!\n" )
.LC616:
	ASCII(.string	"ERROR:ReadNum = %d larger than VFMW_MAX_RESERVE_NUM(%d)\n" )
	.zero	7
.LC620:
	ASCII(.string	"%s,%d,specialFrmRec[%d]->PhyAddr = 0x%x,VirAddr = 0x%x,Length = %d\n" )
	.zero	4
.LC625:
	ASCII(.string	"pSpecialFrmInfo = null!!!" )
	.zero	6
.LC634:
	ASCII(.string	"%s not support std %d\n" )
	.zero	1
.LC638:
	ASCII(.string	"ChanID out of range!" )
	.zero	3
.LC641:
	ASCII(.string	"pstChanState = NULL" )
	.zero	4
.LC644:
	ASCII(.string	"s_pstVfmwChan = NULL" )
	.zero	3
.LC661:
	ASCII(.string	"SetVdecExtra ERROR: extra_ref = %d is out of [ -5000, 5000 ]!\n" )
	.zero	1
.LC663:
	ASCII(.string	"SetVdecExtra ERROR: extra_disp = %d is out of [ -5000, 5000 ]!\n" )
.LC672:
	ASCII(.string	"Command \"%d\" not registerd!\n" )
	.zero	3
.LC688:
	ASCII(.string	"Chan %d Report Last Frame, Value=%d, LastFrameState=%d\n" )
.LC692:
	ASCII(.string	"Last frame output failed!\n" )
	.zero	5
.LC694:
	ASCII(.string	"Last frame output successed!\n" )
	.zero	2
.LC696:
	ASCII(.string	"Last frame already output, image id: %d!\n" )
	.zero	6
.LC708:
	ASCII(.string	"line %d can not know YuvFormat = %d\n" )
	.zero	3
.LC710:
	ASCII(.string	"userdec frame(phy=%#x) address error!\n" )
	.zero	1
.LC712:
	ASCII(.string	"can not map vir addr for usrdat frame(cbphy=%#x)\n" )
	.zero	6
.LC714:
	ASCII(.string	"line: %d, pLogic is Null!\n" )
	.zero	5
.LC717:
	ASCII(.string	"eYuvFormat %d is not support!!\n" )
.LC723:
	ASCII(.string	"pUsrdecFrame == NULL" )
	.zero	3
.LC725:
	ASCII(.string	"VCTRL_PutUsrdecFrame: VidStd is %d\n" )
	.zero	4
.LC728:
	ASCII(.string	"VCTRL_PutUsrdecFrame return err\n" )
	.zero	7
.LC730:
	ASCII(.string	"L:%d ChanID out of range\n" )
	.zero	6
.LC733:
	ASCII(.string	"L:%d This Chan has not been created!!!\n" )
.LC735:
	ASCII(.string	"L:%d WARNING: vidio std not setted!\n" )
	.zero	3
.LC746:
	ASCII(.string	"WARNING: vidio std not setted!" )
	.zero	1
.LC756:
	ASCII(.string	"start chan %d: VCTRL_StartChan return %d\n" )
	.zero	6
.LC766:
	ASCII(.string	"This Chan has not been created or has been destroyed !" )
	.zero	1
.LC769:
	ASCII(.string	"VCTRL_StopChanWithCheck fail!\n" )
	.zero	1
.LC774:
	ASCII(.string	"vdm_ctrl.c,L%d: pOption->s32KeepBS error\n" )
	.zero	6
.LC778:
	ASCII(.string	"-------------------------------------------------------------------------\n" )
	.zero	5
.LC792:
	ASCII(.string	"Param Invalid of PChanOption is NULL\n" )
	.zero	2
.LC795:
	ASCII(.string	"line %d VCTRL_GetChanMemSize failed!\n" )
	.zero	2
.LC797:
	ASCII(.string	"L: %d : part we can NOT alloc buffer for channel context\n" )
	.zero	6
.LC799:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel context\n" )
	.zero	6
.LC801:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh\n" )
	.zero	2
.LC803:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel vdh, %#x < %#x\n" )
	.zero	7
.LC805:
	ASCII(.string	"L: %d : can NOT alloc buffer for channel scd\n" )
	.zero	2
.LC807:
	ASCII(.string	"L: %d : can NOT alloc buffer for SCD\n" )
	.zero	2
.LC810:
	ASCII(.string	"Chan:%d can NOT enable FSP instance\n" )
	.zero	3
.LC812:
	ASCII(.string	"vfmw have max(%d) channels opened, can NOT create more channels\n" )
	.zero	7
.LC822:
	ASCII(.string	"VCTRL_CheckChanWH return err.\n" )
	.zero	1
.LC825:
	ASCII(.string	"VFMW didn't support std %d.\n" )
	.zero	3
.LC827:
	ASCII(.string	"VCTRL_ConfigChan with same config paramater.\n" )
	.zero	2
.LC831:
	ASCII(.string	"can NOT VCTRL_PartitionMemForStdUser\n" )
	.zero	2
.LC838:
	ASCII(.string	"chan %d: new StrmOFThr = %d\n" )
	.zero	3
.LC841:
	ASCII(.string	"chan %d: new DecMode = %d\n" )
	.zero	5
.LC844:
	ASCII(.string	"chan %d: GetChanCfg failed!\n" )
	.zero	3
.LC846:
	ASCII(.string	"chan %d: new DecOrderOutput = %d\n" )
	.zero	6
.LC849:
	ASCII(.string	"chan %d: new ChanErrThr = %d\n" )
	.zero	2
.LC852:
	ASCII(.string	"reset chan %d: VCTRL_ResetChan return %d\n" )
	.zero	6
.LC857:
	ASCII(.string	"%s:L%d: %s\n" )
	.zero	4
.LC860:
	ASCII(.string	"This Chan has not been created or has been destroyed !!!" )
	.zero	7
.LC862:
	ASCII(.string	"can NOT stop a not-opened Chan" )
	.zero	1
.LC873:
	ASCII(.string	"stop chan %d: VCTRL_StopChan return %d\n" )
.LC883:
	ASCII(.string	"WARNNING: dsp in lowdelay state, we can not supported  avs in the same time!!!\n" )
.LC885:
	ASCII(.string	"WARNNING: dsp in avs state, we can not supported  lowdelay in the same time!!!\n" )
.LC896:
	ASCII(.string	"%s, %d, actul size = 0x%x, except size= 0x%x\n" )
	.zero	2
.LC898:
	ASCII(.string	"%s, %d, configuredFrameNum = %x, PmvNodeStatus= 0x%x\n" )
	.zero	2
.LC904:
	ASCII(.string	"DFS, request frame store fail!, chanid: %d\n" )
	.zero	4
.LC906:
	ASCII(.string	"DFS, set decoding thread state to success!\n " )
	.zero	3
.LC909:
	ASCII(.string	"%s set chan %d ctrl state CHAN_FRAME_STORE_ALLOC failed!\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
.LANCHOR3 = . + 4352
.LANCHOR5 = . + 8704
.LANCHOR6 = . + 17408
	.type	s_pstVfmwChan, %object
	.size	s_pstVfmwChan, 256
s_pstVfmwChan:
	.zero	256
	.type	s_VfmwCTrl, %object
	.size	s_VfmwCTrl, 344
s_VfmwCTrl:
	.zero	344
	.type	g_StopDec, %object
	.size	g_StopDec, 4
g_StopDec:
	.zero	4
	.type	g_SleepTime, %object
	.size	g_SleepTime, 4
g_SleepTime:
	.zero	4
	.type	vfmw_save_el_file, %object
	.size	vfmw_save_el_file, 256
vfmw_save_el_file:
	.zero	256
	.type	save_file_cnt.51197, %object
	.size	save_file_cnt.51197, 4
save_file_cnt.51197:
	.zero	4
	.type	save_el_chan_num, %object
	.size	save_el_chan_num, 4
save_el_chan_num:
	.zero	4
	.type	g_CurProcChan, %object
	.size	g_CurProcChan, 4
g_CurProcChan:
	.zero	4
	.type	g_ResetCreateNewSave, %object
	.size	g_ResetCreateNewSave, 4
g_ResetCreateNewSave:
	.zero	4
	.type	vfmw_save_metadata_reorder_file, %object
	.size	vfmw_save_metadata_reorder_file, 256
vfmw_save_metadata_reorder_file:
	.zero	256
	.type	save_file_cnt.51191, %object
	.size	save_file_cnt.51191, 4
save_file_cnt.51191:
	.zero	4
	.type	save_metadata_reorder_chan_num, %object
	.size	save_metadata_reorder_chan_num, 4
save_metadata_reorder_chan_num:
	.zero	4
	.type	vfmw_save_metadata_file, %object
	.size	vfmw_save_metadata_file, 256
vfmw_save_metadata_file:
	.zero	256
	.type	save_file_cnt.51185, %object
	.size	save_file_cnt.51185, 4
save_file_cnt.51185:
	.zero	4
	.type	save_metadata_chan_num, %object
	.size	save_metadata_chan_num, 4
save_metadata_chan_num:
	.zero	4
	.type	vfmw_save_seg_file, %object
	.size	vfmw_save_seg_file, 256
vfmw_save_seg_file:
	.zero	256
	.type	save_file_cnt.51155, %object
	.size	save_file_cnt.51155, 4
save_file_cnt.51155:
	.zero	4
	.type	save_seg_chan_num, %object
	.size	save_seg_chan_num, 4
save_seg_chan_num:
	.zero	4
	.type	vfmw_save_str_file, %object
	.size	vfmw_save_str_file, 256
vfmw_save_str_file:
	.zero	256
	.type	save_file_cnt.51149, %object
	.size	save_file_cnt.51149, 4
save_file_cnt.51149:
	.zero	4
	.type	save_str_chan_num, %object
	.size	save_str_chan_num, 4
save_str_chan_num:
	.zero	4
	.type	vfmw_save_yuv_file, %object
	.size	vfmw_save_yuv_file, 256
vfmw_save_yuv_file:
	.zero	256
	.type	save_file_cnt.51163, %object
	.size	save_file_cnt.51163, 4
save_file_cnt.51163:
	.zero	4
	.zero	4
	.type	MemRecord_YUV, %object
	.size	MemRecord_YUV, 32
MemRecord_YUV:
	.zero	32
	.type	pVl, %object
	.size	pVl, 8
pVl:
	.zero	8
	.type	pUl, %object
	.size	pUl, 8
pUl:
	.zero	8
	.type	pY, %object
	.size	pY, 8
pY:
	.zero	8
	.type	pVl_2bit, %object
	.size	pVl_2bit, 8
pVl_2bit:
	.zero	8
	.type	pUl_2bit, %object
	.size	pUl_2bit, 8
pUl_2bit:
	.zero	8
	.type	pY_2bit, %object
	.size	pY_2bit, 8
pY_2bit:
	.zero	8
	.type	save_yuv_with_crop, %object
	.size	save_yuv_with_crop, 4
save_yuv_with_crop:
	.zero	4
	.type	g_IsrFlag, %object
	.size	g_IsrFlag, 1
g_IsrFlag:
	.zero	1
	.zero	3
	.type	s_StreamIntf, %object
	.size	s_StreamIntf, 768
s_StreamIntf:
	.zero	768
	.type	FspInstInfo.50325, %object
	.size	FspInstInfo.50325, 3212
FspInstInfo.50325:
	.zero	3212
	.type	g_VdmCharacter, %object
	.size	g_VdmCharacter, 4
g_VdmCharacter:
	.zero	4
	.type	last_rec_pos_time.50623, %object
	.size	last_rec_pos_time.50623, 128
last_rec_pos_time.50623:
	.zero	128
	.type	last_rec_pos_time.50633, %object
	.size	last_rec_pos_time.50633, 128
last_rec_pos_time.50633:
	.zero	128
	.type	MemArrange.50910, %object
	.size	MemArrange.50910, 1368
MemArrange.50910:
	.zero	1368
	.type	extra_ref, %object
	.size	extra_ref, 4
extra_ref:
	.zero	4
	.type	extra_disp, %object
	.size	extra_disp, 4
extra_disp:
	.zero	4
	.type	g_VfmwIrqHandle, %object
	.size	g_VfmwIrqHandle, 4
g_VfmwIrqHandle:
	.zero	4
	.zero	4
	.type	cmdline, %object
	.size	cmdline, 1024
cmdline:
	.zero	1024
	.type	extra_cmd, %object
	.size	extra_cmd, 4
extra_cmd:
	.zero	4
	.type	g_allow_B_before_P, %object
	.size	g_allow_B_before_P, 1
g_allow_B_before_P:
	.zero	1
	.type	g_not_allow_H264FullPictureRepair_flag, %object
	.size	g_not_allow_H264FullPictureRepair_flag, 1
g_not_allow_H264FullPictureRepair_flag:
	.zero	1
	.type	g_apple_airplay_mirrorinig_flag, %object
	.size	g_apple_airplay_mirrorinig_flag, 1
g_apple_airplay_mirrorinig_flag:
	.zero	1
	.zero	1
	.type	g_event_report, %object
	.size	g_event_report, 8
g_event_report:
	.zero	8
	.type	g_DSPState, %object
	.size	g_DSPState, 128
g_DSPState:
	.zero	128
	.type	last_rec_pos_time.51025, %object
	.size	last_rec_pos_time.51025, 128
last_rec_pos_time.51025:
	.zero	128
	.type	last_rec_pos_decparam_time.51026, %object
	.size	last_rec_pos_decparam_time.51026, 128
last_rec_pos_decparam_time.51026:
	.zero	128
	.type	ChanPriTab.50978, %object
	.size	ChanPriTab.50978, 128
ChanPriTab.50978:
	.zero	128
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 9600
g_VfmwChanStat:
	.zero	9600
	.type	PrioArray.50443, %object
	.size	PrioArray.50443, 128
PrioArray.50443:
	.zero	128
	.type	pOption, %object
	.size	pOption, 8
pOption:
	.zero	8
	.type	s_ChanControlState, %object
	.size	s_ChanControlState, 128
s_ChanControlState:
	.zero	128
	.type	Capability.50491, %object
	.size	Capability.50491, 148
Capability.50491:
	.zero	148
	.zero	4
	.type	PrioArray.50490, %object
	.size	PrioArray.50490, 128
PrioArray.50490:
	.zero	128
	.type	g_EsBufValidFlag, %object
	.size	g_EsBufValidFlag, 128
g_EsBufValidFlag:
	.zero	128
	.type	g_u32DFSMaxAllocTime, %object
	.size	g_u32DFSMaxAllocTime, 4
g_u32DFSMaxAllocTime:
	.zero	4
	.type	g_eVdmVersion, %object
	.size	g_eVdmVersion, 4
g_eVdmVersion:
	.zero	4
	.type	g_StandardObedience, %object
	.size	g_StandardObedience, 4
g_StandardObedience:
	.zero	4
	.zero	4
	.type	g_VfmwGlobalStat, %object
	.size	g_VfmwGlobalStat, 64
g_VfmwGlobalStat:
	.zero	64
	.type	AcceleratorCharacter, %object
	.size	AcceleratorCharacter, 8
AcceleratorCharacter:
	.zero	8
	.type	g_SCDID, %object
	.size	g_SCDID, 4
g_SCDID:
	.zero	4
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
