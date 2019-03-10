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
	.file	"vfmw_ctrl.c"
	.text
	.align	2
	.type	VfmwProc_SetPrintLevel, %function
VfmwProc_SetPrintLevel:
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
	ldr	r3, .L2
	ldr	r2, [r0]
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L3:
	.align	2
.L2:
	.word	g_PrintEnable
	UNWIND(.fnend)
	.size	VfmwProc_SetPrintLevel, .-VfmwProc_SetPrintLevel
	.align	2
	.type	VfmwProc_SetScdPrint, %function
VfmwProc_SetScdPrint:
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
	.size	VfmwProc_SetScdPrint, .-VfmwProc_SetScdPrint
	.align	2
	.type	VfmwProc_OpenScdLowdly, %function
VfmwProc_OpenScdLowdly:
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
	ldr	r3, .L6
	mov	r2, #1
	ldr	r1, [r0]
	ldr	r3, [r3, r1, asl #3]
	str	r2, [r3, #40]
	ldmfd	sp, {fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	s_SmIIS
	UNWIND(.fnend)
	.size	VfmwProc_OpenScdLowdly, .-VfmwProc_OpenScdLowdly
	.align	2
	.type	VfmwProc_CloseScdLowdly, %function
VfmwProc_CloseScdLowdly:
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
	ldr	r3, .L9
	mov	r2, #0
	ldr	r1, [r0]
	ldr	r3, [r3, r1, asl #3]
	str	r2, [r3, #40]
	ldmfd	sp, {fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	s_SmIIS
	UNWIND(.fnend)
	.size	VfmwProc_CloseScdLowdly, .-VfmwProc_CloseScdLowdly
	.align	2
	.global	VCTRL_EventReport
	.type	VCTRL_EventReport, %function
VCTRL_EventReport:
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
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #31
	bhi	.L23
	ldr	lr, .L27
	ldr	ip, [lr, r0, asl #2]
	cmp	ip, #0
	beq	.L24
	ldr	ip, [ip, #32]
	cmp	ip, #0
	beq	.L16
	cmp	ip, #1
	bne	.L25
	ldr	r3, [lr, #372]
	cmp	r3, #0
	beq	.L26
.L19:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L25:
	str	r3, [sp]
	mov	r0, #0
	mov	r3, ip
	ldr	r2, .L27+4
	ldr	r1, .L27+8
	bl	dprint_vfmw
.L13:
	mvn	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L16:
	ldr	r3, [lr, #368]
	cmp	r3, #0
	bne	.L19
	mov	r0, r3
	ldr	r1, .L27+12
	bl	dprint_vfmw
	b	.L13
.L26:
	mov	r0, r3
	ldr	r1, .L27+16
	bl	dprint_vfmw
	b	.L13
.L23:
	ldr	r3, .L27+20
	movw	r2, #981
	ldr	r1, .L27+24
	mov	r0, #0
	bl	dprint_vfmw
	b	.L13
.L24:
	mov	r0, ip
	ldr	r3, .L27+28
	movw	r2, #982
	ldr	r1, .L27+24
	bl	dprint_vfmw
	b	.L13
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC5
	.word	.LC3
	.word	.LC4
	.word	.LC0
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_EventReport, .-VCTRL_EventReport
	.align	2
	.type	VfmwProc_SetTunnelLineNumber, %function
VfmwProc_SetTunnelLineNumber:
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
	ldr	ip, .L30
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L30+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L31:
	.align	2
.L30:
	.word	g_TunnelLineNumber
	.word	.LC6
	UNWIND(.fnend)
	.size	VfmwProc_SetTunnelLineNumber, .-VfmwProc_SetTunnelLineNumber
	.align	2
	.type	VfmwProc_SetTraceImgPeriod, %function
VfmwProc_SetTraceImgPeriod:
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
	ldr	ip, .L33
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L33+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L34:
	.align	2
.L33:
	.word	g_TraceImgPeriod
	.word	.LC7
	UNWIND(.fnend)
	.size	VfmwProc_SetTraceImgPeriod, .-VfmwProc_SetTraceImgPeriod
	.align	2
	.type	VfmwProc_SetTraceFramePeriod, %function
VfmwProc_SetTraceFramePeriod:
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
	ldr	ip, .L36
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L36+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L37:
	.align	2
.L36:
	.word	g_TraceFramePeriod
	.word	.LC8
	UNWIND(.fnend)
	.size	VfmwProc_SetTraceFramePeriod, .-VfmwProc_SetTraceFramePeriod
	.align	2
	.type	VfmwProc_SetTraceBSPeriod, %function
VfmwProc_SetTraceBSPeriod:
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
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L39+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L40:
	.align	2
.L39:
	.word	g_TraceBsPeriod
	.word	.LC9
	UNWIND(.fnend)
	.size	VfmwProc_SetTraceBSPeriod, .-VfmwProc_SetTraceBSPeriod
	.align	2
	.type	VfmwProc_SetTraceCtrl, %function
VfmwProc_SetTraceCtrl:
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
	ldr	ip, .L42
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L42+4
	mov	r2, r3
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L43:
	.align	2
.L42:
	.word	g_TraceCtrl
	.word	.LC10
	UNWIND(.fnend)
	.size	VfmwProc_SetTraceCtrl, .-VfmwProc_SetTraceCtrl
	.align	2
	.type	VfmwProc_TestStopDec, %function
VfmwProc_TestStopDec:
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
	ldr	ip, .L45
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L45+4
	mov	r2, r3
	str	r3, [ip, #392]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.word	.LC11
	UNWIND(.fnend)
	.size	VfmwProc_TestStopDec, .-VfmwProc_TestStopDec
	.align	2
	.type	VfmwProc_TestTimeSequence, %function
VfmwProc_TestTimeSequence:
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
	ldr	ip, .L48
	ldr	r3, [r0]
	mov	r0, #32
	ldr	r1, .L48+4
	mov	r2, r3
	str	r3, [ip, #396]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L49:
	.align	2
.L48:
	.word	.LANCHOR0
	.word	.LC12
	UNWIND(.fnend)
	.size	VfmwProc_TestTimeSequence, .-VfmwProc_TestTimeSequence
	.align	2
	.type	VfmwProc_SaveEL, %function
VfmwProc_SaveEL:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, [r0]
	cmp	r4, #31
	bhi	.L50
	ldr	r6, .L56
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #400]
	cmp	r7, #0
	beq	.L55
	ldr	r1, .L56+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L56+8
	ldr	r0, [r5, #400]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #400]
.L50:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L55:
	ldr	r2, [r6, #528]
	mov	r1, #50
	ldr	r8, .L56+8
	sub	r0, fp, #88
	add	ip, r2, #1
	ldr	r3, .L56+12
	str	r2, [sp]
	ldr	r9, [r8, #68]
	ldr	r2, .L56+16
	str	ip, [r6, #528]
	blx	r9
	ldr	r3, [r8, #32]
	mov	r2, r7
	sub	r0, fp, #88
	mov	r1, #66
	blx	r3
	str	r4, [r6, #532]
	cmp	r0, #0
	str	r0, [r5, #400]
	beq	.L53
	mov	r3, r4
	sub	r2, fp, #88
	ldr	r1, .L56+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L50
.L53:
	sub	r2, fp, #88
	ldr	r1, .L56+24
	mov	r0, #32
	bl	dprint_vfmw
	b	.L50
.L57:
	.align	2
.L56:
	.word	.LANCHOR0
	.word	.LC16
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2
	.word	.LC13
	.word	.LC14
	.word	.LC15
	UNWIND(.fnend)
	.size	VfmwProc_SaveEL, .-VfmwProc_SaveEL
	.align	2
	.type	VfmwProc_SetCurProcChan, %function
VfmwProc_SetCurProcChan:
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
	ldr	r3, [r0]
	cmp	r3, #32
	bhi	.L60
	ldr	ip, .L61
	mov	r2, r3
	ldr	r1, .L61+4
	mov	r0, #32
	str	r3, [ip, #536]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L60:
	mov	r2, r3
	ldr	r1, .L61+8
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.word	.LC18
	.word	.LC17
	UNWIND(.fnend)
	.size	VfmwProc_SetCurProcChan, .-VfmwProc_SetCurProcChan
	.align	2
	.type	VfmwProc_SetSaveFileAfterReset, %function
VfmwProc_SetSaveFileAfterReset:
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
	ldr	r3, [r0]
	cmp	r3, #1
	bls	.L65
	mov	r2, r3
	ldr	r1, .L66
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L65:
	ldr	ip, .L66+4
	mov	r2, r3
	ldr	r1, .L66+8
	mov	r0, #32
	str	r3, [ip, #540]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L67:
	.align	2
.L66:
	.word	.LC20
	.word	.LANCHOR0
	.word	.LC19
	UNWIND(.fnend)
	.size	VfmwProc_SetSaveFileAfterReset, .-VfmwProc_SetSaveFileAfterReset
	.align	2
	.type	VfmwProc_SetUSE_FF_APT_EN, %function
VfmwProc_SetUSE_FF_APT_EN:
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
	ldr	r3, [r0]
	cmp	r3, #1
	bls	.L70
	mov	r2, r3
	ldr	r1, .L71
	mov	r0, #32
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L70:
	ldr	ip, .L71+4
	mov	r2, r3
	ldr	r1, .L71+8
	mov	r0, #32
	str	r3, [ip]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L72:
	.align	2
.L71:
	.word	.LC22
	.word	USE_FF_APT_EN
	.word	.LC21
	UNWIND(.fnend)
	.size	VfmwProc_SetUSE_FF_APT_EN, .-VfmwProc_SetUSE_FF_APT_EN
	.align	2
	.global	VCTRL_Isr_0
	.type	VCTRL_Isr_0, %function
VCTRL_Isr_0:
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
	bl	VDMDRV_IsrProcess
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Isr_0, .-VCTRL_Isr_0
	.align	2
	.global	VCTRL_Scd_Isr
	.type	VCTRL_Scd_Isr, %function
VCTRL_Scd_Isr:
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
	bl	SM_SCDIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Scd_Isr, .-VCTRL_Scd_Isr
	.align	2
	.global	VCTRL_MMU_ISR
	.type	VCTRL_MMU_ISR, %function
VCTRL_MMU_ISR:
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
	bl	VDMDRV_MMUIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_MMU_ISR, .-VCTRL_MMU_ISR
	.align	2
	.type	VfmwProc_SaveReorderMetadata, %function
VfmwProc_SaveReorderMetadata:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, [r0]
	cmp	r4, #31
	bhi	.L76
	ldr	r6, .L82
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #544]
	cmp	r7, #0
	beq	.L81
	ldr	r1, .L82+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L82+8
	ldr	r0, [r5, #544]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #544]
.L76:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L81:
	ldr	r8, .L82+8
	mov	r0, #24
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r6, #672]
	mov	r1, #50
	ldr	r3, .L82+12
	add	ip, r2, #1
	str	ip, [r6, #672]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	mov	r2, r7
	sub	r0, fp, #88
	mov	r1, #66
	blx	r3
	str	r4, [r6, #676]
	cmp	r0, #0
	str	r0, [r5, #544]
	beq	.L79
	mov	r3, r4
	sub	r2, fp, #88
	ldr	r1, .L82+16
	mov	r0, #32
	bl	dprint_vfmw
	b	.L76
.L79:
	sub	r2, fp, #88
	ldr	r1, .L82+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L76
.L83:
	.align	2
.L82:
	.word	.LANCHOR0
	.word	.LC25
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2
	.word	.LC23
	.word	.LC24
	UNWIND(.fnend)
	.size	VfmwProc_SaveReorderMetadata, .-VfmwProc_SaveReorderMetadata
	.align	2
	.type	VfmwProc_SaveMetadata, %function
VfmwProc_SaveMetadata:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, [r0]
	cmp	r4, #31
	bhi	.L84
	ldr	r6, .L90
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #680]
	cmp	r7, #0
	beq	.L89
	ldr	r1, .L90+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L90+8
	ldr	r0, [r5, #680]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #680]
.L84:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L89:
	ldr	r8, .L90+8
	mov	r0, #23
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r6, #808]
	mov	r1, #50
	ldr	r3, .L90+12
	add	ip, r2, #1
	str	ip, [r6, #808]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	mov	r2, r7
	sub	r0, fp, #88
	mov	r1, #66
	blx	r3
	str	r4, [r6, #812]
	cmp	r0, #0
	str	r0, [r5, #680]
	beq	.L87
	mov	r3, r4
	sub	r2, fp, #88
	ldr	r1, .L90+16
	mov	r0, #32
	bl	dprint_vfmw
	b	.L84
.L87:
	sub	r2, fp, #88
	ldr	r1, .L90+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L84
.L91:
	.align	2
.L90:
	.word	.LANCHOR0
	.word	.LC25
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2
	.word	.LC26
	.word	.LC27
	UNWIND(.fnend)
	.size	VfmwProc_SaveMetadata, .-VfmwProc_SaveMetadata
	.align	2
	.type	VfmwProc_Save1DYUV, %function
VfmwProc_Save1DYUV:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, .L99
	ldmia	r0, {r5, r7}
	mov	r3, r0
	ldr	r8, [r3, #8]
	ldr	r1, [r4, #196]
	mov	r0, r5
	blx	r1
	subs	r6, r0, #0
	beq	.L98
	mov	r0, #22
	ldr	r9, [r4, #68]
	bl	VFMW_GetString
	str	r5, [sp]
	mov	r1, #50
	ldr	r3, .L99+4
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	sub	r0, fp, #88
	ldr	r3, [r4, #32]
	mov	r2, #0
	mov	r1, #66
	blx	r3
	subs	r5, r0, #0
	beq	.L95
	ldr	r3, .L99+8
	ldr	ip, [r3, #152]
	cmp	ip, #0
	beq	.L96
	mov	lr, #1
	mov	r3, r8
	mov	r2, r7
	mov	r1, r6
	str	lr, [sp]
	blx	ip
.L97:
	mov	r0, r5
	ldr	r3, [r4, #36]
	blx	r3
	sub	r2, fp, #88
	ldr	r1, .L99+12
	mov	r0, #32
	bl	dprint_vfmw
.L94:
	ldr	r3, [r4, #156]
	mov	r0, r6
	blx	r3
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L96:
	mov	r0, ip
	movw	r2, #7597
	ldr	r1, .L99+16
	bl	dprint_vfmw
	b	.L97
.L98:
	mov	r2, r5
	ldr	r1, .L99+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L94
.L95:
	sub	r2, fp, #88
	ldr	r1, .L99+24
	mov	r0, #32
	bl	dprint_vfmw
	b	.L94
.L100:
	.align	2
.L99:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2
	.word	g_vdm_hal_fun_ptr
	.word	.LC30
	.word	.LC29
	.word	.LC28
	.word	.LC31
	UNWIND(.fnend)
	.size	VfmwProc_Save1DYUV, .-VfmwProc_Save1DYUV
	.align	2
	.type	VfmwProc_SaveOneYUV, %function
VfmwProc_SaveOneYUV:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, .L106
	ldr	r5, [r0]
	ldr	r3, [r4, #196]
	mov	r0, r5
	blx	r3
	subs	r6, r0, #0
	beq	.L105
	mov	r0, #21
	ldr	r7, [r4, #68]
	bl	VFMW_GetString
	str	r5, [sp]
	mov	r1, #50
	ldr	r3, .L106+4
	mov	r2, r0
	sub	r0, fp, #80
	blx	r7
	sub	r0, fp, #80
	ldr	r3, [r4, #32]
	mov	r2, #0
	mov	r1, #66
	blx	r3
	subs	r5, r0, #0
	beq	.L104
	mov	r2, r5
	mov	r1, #3145728
	ldr	r3, [r4, #44]
	mov	r0, r6
	blx	r3
	mov	r0, r5
	ldr	r3, [r4, #36]
	blx	r3
	sub	r2, fp, #80
	ldr	r1, .L106+8
	mov	r0, #32
	bl	dprint_vfmw
.L103:
	ldr	r3, [r4, #156]
	mov	r0, r6
	blx	r3
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L104:
	sub	r2, fp, #80
	ldr	r1, .L106+12
	mov	r0, #32
	bl	dprint_vfmw
	b	.L103
.L105:
	mov	r2, r5
	ldr	r1, .L106+16
	mov	r0, #32
	bl	dprint_vfmw
	b	.L103
.L107:
	.align	2
.L106:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2
	.word	.LC32
	.word	.LC31
	.word	.LC28
	UNWIND(.fnend)
	.size	VfmwProc_SaveOneYUV, .-VfmwProc_SaveOneYUV
	.align	2
	.type	VfmwProc_SaveSeg, %function
VfmwProc_SaveSeg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, [r0]
	cmp	r4, #31
	bhi	.L108
	ldr	r6, .L114
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #816]
	cmp	r7, #0
	beq	.L113
	ldr	r1, .L114+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L114+8
	ldr	r0, [r5, #816]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #816]
.L108:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L113:
	ldr	r8, .L114+8
	mov	r0, #19
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r6, #944]
	mov	r1, #50
	ldr	r3, .L114+12
	add	ip, r2, #1
	str	ip, [r6, #944]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	mov	r2, r7
	sub	r0, fp, #88
	mov	r1, #66
	blx	r3
	str	r4, [r6, #948]
	cmp	r0, #0
	str	r0, [r5, #816]
	beq	.L111
	mov	r3, r4
	sub	r2, fp, #88
	ldr	r1, .L114+16
	mov	r0, #32
	bl	dprint_vfmw
	b	.L108
.L111:
	sub	r2, fp, #88
	ldr	r1, .L114+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L108
.L115:
	.align	2
.L114:
	.word	.LANCHOR0
	.word	.LC35
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2
	.word	.LC33
	.word	.LC34
	UNWIND(.fnend)
	.size	VfmwProc_SaveSeg, .-VfmwProc_SaveSeg
	.align	2
	.type	VfmwProc_Savestream, %function
VfmwProc_Savestream:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #64)
	sub	sp, sp, #64
	ldr	r4, [r0]
	cmp	r4, #31
	bhi	.L116
	ldr	r6, .L122
	add	r5, r6, r4, lsl #2
	ldr	r7, [r5, #952]
	cmp	r7, #0
	beq	.L121
	ldr	r1, .L122+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r3, .L122+8
	ldr	r0, [r5, #952]
	ldr	r3, [r3, #36]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #952]
.L116:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L121:
	ldr	r8, .L122+8
	mov	r0, #18
	ldr	r9, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r6, #1080]
	mov	r1, #50
	ldr	r3, .L122+12
	add	ip, r2, #1
	str	ip, [r6, #1080]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #88
	blx	r9
	ldr	r3, [r8, #32]
	mov	r2, r7
	sub	r0, fp, #88
	mov	r1, #66
	blx	r3
	str	r4, [r6, #1084]
	cmp	r0, #0
	str	r0, [r5, #952]
	beq	.L119
	mov	r3, r4
	sub	r2, fp, #88
	ldr	r1, .L122+16
	mov	r0, #32
	bl	dprint_vfmw
	b	.L116
.L119:
	sub	r2, fp, #88
	ldr	r1, .L122+20
	mov	r0, #32
	bl	dprint_vfmw
	b	.L116
.L123:
	.align	2
.L122:
	.word	.LANCHOR0
	.word	.LC38
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR2
	.word	.LC36
	.word	.LC37
	UNWIND(.fnend)
	.size	VfmwProc_Savestream, .-VfmwProc_Savestream
	.align	2
	.type	VfmwProc_SaveYUV, %function
VfmwProc_SaveYUV:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 104
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
	ldr	r5, [r0]
	cmp	r5, #31
	bhi	.L124
	ldr	r4, .L137
	add	r6, r4, r5, lsl #2
	ldr	r7, [r6, #1088]
	cmp	r7, #0
	beq	.L135
	ldr	r7, .L137+4
	mov	r0, #32
	ldr	r1, .L137+8
	mov	r5, #0
	bl	dprint_vfmw
	ldr	r0, [r6, #1088]
	ldr	r3, [r7, #36]
	blx	r3
	ldr	r0, [r4, #1228]
	ldr	r3, .L137+12
	mvn	r2, #0
	cmp	r0, r5
	str	r5, [r6, #1088]
	str	r5, [r4, #1244]
	str	r2, [r3, #64]
	str	r5, [r4, #1248]
	str	r5, [r4, #1252]
	str	r5, [r4, #1256]
	str	r5, [r4, #1260]
	str	r5, [r4, #1264]
	str	r5, [r4, #1268]
	bne	.L136
.L124:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L136:
	ldr	r1, [r4, #1224]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [r4, #1236]
	ldr	r1, [r4, #1224]
	ldr	r0, [r4, #1228]
	bl	MEM_DelMemRecord
	ldr	r3, [r7, #48]
	mov	r1, r5
	mov	r2, #24
	ldr	r0, .L137+16
	blx	r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L135:
	ldr	r8, .L137+4
	mov	r0, #20
	ldr	r9, .L137+12
	ldr	r10, [r8, #68]
	bl	VFMW_GetString
	ldr	r2, [r4, #1216]
	mov	r3, r9
	mov	r1, #100
	add	ip, r2, #1
	str	ip, [r4, #1216]
	str	r2, [sp]
	mov	r2, r0
	sub	r0, fp, #144
	blx	r10
	ldr	r3, [r8, #32]
	sub	r0, fp, #144
	mov	r2, r7
	movw	r1, #578
	blx	r3
	cmp	r0, #0
	str	r0, [r6, #1088]
	beq	.L128
	mov	r2, #24
	mov	r1, r7
	ldr	r3, [r8, #48]
	ldr	r0, .L137+16
	blx	r3
	mov	r0, #27
	mov	r3, #3
	str	r3, [r4, #1240]
	bl	VFMW_GetString
	str	r7, [sp]
	ldr	r3, .L137+16
	mov	r2, #28311552
	mov	r1, r7
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	beq	.L129
	ldr	r1, .L137+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r8, #36]
	ldr	r0, [r6, #1088]
	blx	r3
	mvn	r3, #0
	str	r7, [r6, #1088]
	str	r7, [r4, #1244]
	str	r7, [r4, #1248]
	str	r7, [r4, #1252]
	str	r7, [r4, #1256]
	str	r7, [r4, #1260]
	str	r7, [r4, #1264]
	str	r7, [r4, #1268]
	str	r3, [r9, #64]
	b	.L124
.L129:
	ldr	r2, [r4, #1236]
	ldr	r1, [r4, #1224]
	ldr	r0, [r4, #1228]
	bl	MEM_AddMemRecord
	ldr	ip, [r4, #1224]
	mov	lr, r5, lsr #24
	sub	r2, fp, #144
	and	r5, r5, #3
	ldr	r1, .L137+24
	mov	r3, lr
	str	r5, [sp]
	mov	r0, #32
	add	r7, ip, #9437184
	add	r6, ip, #11796480
	str	ip, [r4, #1252]
	str	r7, [r4, #1248]
	add	r7, ip, #14155776
	str	r6, [r4, #1244]
	add	r6, ip, #23592960
	str	r7, [r4, #1264]
	add	ip, ip, #25952256
	str	r6, [r4, #1260]
	str	ip, [r4, #1256]
	str	lr, [r9, #64]
	str	r5, [r4, #1268]
	bl	dprint_vfmw
	b	.L124
.L128:
	sub	r2, fp, #144
	ldr	r1, .L137+28
	mov	r0, #32
	bl	dprint_vfmw
	b	.L124
.L138:
	.align	2
.L137:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC42
	.word	.LANCHOR2
	.word	.LANCHOR0+1220
	.word	.LC39
	.word	.LC40
	.word	.LC41
	UNWIND(.fnend)
	.size	VfmwProc_SaveYUV, .-VfmwProc_SaveYUV
	.align	2
	.type	VfmwProc_PrintTracer, %function
VfmwProc_PrintTracer:
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
	ldr	r1, .L140
	ldr	r4, [r0]
	mov	r0, #32
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	DBG_PrintTracer
.L141:
	.align	2
.L140:
	.word	.LC43
	UNWIND(.fnend)
	.size	VfmwProc_PrintTracer, .-VfmwProc_PrintTracer
	.align	2
	.type	VfmwProc_SetSmmuIrqEnable, %function
VfmwProc_SetSmmuIrqEnable:
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
	ldr	r4, [r0]
	cmp	r4, #0
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r5, .L146
	ldr	r3, [r5, #68]
	cmp	r3, #1
	beq	.L145
	ldr	r1, .L146+4
	mov	r0, #32
	bl	dprint_vfmw
	mov	r3, #1
	str	r3, [r5, #68]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L145:
	ldr	r1, .L146+8
	mov	r0, #32
	bl	dprint_vfmw
	str	r4, [r5, #68]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L147:
	.align	2
.L146:
	.word	.LANCHOR2
	.word	.LC45
	.word	.LC44
	UNWIND(.fnend)
	.size	VfmwProc_SetSmmuIrqEnable, .-VfmwProc_SetSmmuIrqEnable
	.align	2
	.type	VfmwProc_SetSedOnlyEnable, %function
VfmwProc_SetSedOnlyEnable:
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
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L150
	ldr	r3, .L151
	mov	r2, #1
	ldr	r1, .L151+4
	mov	r0, #32
	str	r2, [r3, #72]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L150:
	ldr	r2, .L151
	mov	r0, #32
	ldr	r1, .L151+8
	str	r3, [r2, #72]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L152:
	.align	2
.L151:
	.word	.LANCHOR2
	.word	.LC47
	.word	.LC46
	UNWIND(.fnend)
	.size	VfmwProc_SetSedOnlyEnable, .-VfmwProc_SetSedOnlyEnable
	.align	2
	.type	VfmwProc_CloseModuleLowly, %function
VfmwProc_CloseModuleLowly:
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
	ldr	r3, [r0]
	cmp	r3, #31
	bhi	.L155
	ldr	lr, .L156
	mov	r2, r3
	mov	ip, #0
	ldr	r1, .L156+4
	mov	r0, #32
	ldr	r3, [lr, r3, asl #2]
	str	ip, [r3, #1168]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L155:
	ldr	r1, .L156+8
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L157:
	.align	2
.L156:
	.word	.LANCHOR0
	.word	.LC6
	.word	.LC48
	UNWIND(.fnend)
	.size	VfmwProc_CloseModuleLowly, .-VfmwProc_CloseModuleLowly
	.align	2
	.type	VfmwProc_OpenModuleLowly, %function
VfmwProc_OpenModuleLowly:
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
	ldr	r3, [r0]
	cmp	r3, #31
	bhi	.L160
	ldr	lr, .L161
	mov	r2, r3
	mov	ip, #1
	ldr	r1, .L161+4
	mov	r0, #32
	ldr	r3, [lr, r3, asl #2]
	str	ip, [r3, #1168]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L160:
	ldr	r1, .L161+8
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L162:
	.align	2
.L161:
	.word	.LANCHOR0
	.word	.LC6
	.word	.LC48
	UNWIND(.fnend)
	.size	VfmwProc_OpenModuleLowly, .-VfmwProc_OpenModuleLowly
	.align	2
	.type	VCTRL_StopTask.part.9, %function
VCTRL_StopTask.part.9:
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
	ldr	r5, .L175
	ldr	r3, [r5, #132]
	cmp	r3, #1
	beq	.L166
	ldr	r6, .L175+4
	mov	r0, #10
	mov	r4, #49
	ldr	r3, [r6, #120]
	blx	r3
	b	.L167
.L174:
	ldr	r3, [r6, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L173
.L167:
	ldr	r3, [r5, #132]
	mov	r0, #10
	cmp	r3, #1
	bne	.L174
.L166:
	mov	r0, #0
.L165:
	mov	r3, #0
	str	r3, [r5, #136]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L173:
	mvn	r0, #0
	b	.L165
.L176:
	.align	2
.L175:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_StopTask.part.9, .-VCTRL_StopTask.part.9
	.align	2
	.type	VCTRL_StartTask.part.10, %function
VCTRL_StartTask.part.10:
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
	ldr	r5, .L189
	ldr	r3, [r5, #132]
	cmp	r3, #2
	beq	.L180
	ldr	r6, .L189+4
	mov	r0, #10
	mov	r4, #49
	ldr	r3, [r6, #120]
	blx	r3
	b	.L181
.L188:
	ldr	r3, [r6, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L187
.L181:
	ldr	r3, [r5, #132]
	mov	r0, #10
	cmp	r3, #2
	bne	.L188
.L180:
	mov	r0, #0
.L179:
	mov	r3, #0
	str	r3, [r5, #136]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L187:
	mvn	r0, #0
	b	.L179
.L190:
	.align	2
.L189:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_StartTask.part.10, .-VCTRL_StartTask.part.10
	.align	2
	.type	VCTRL_SetSendStreamAgainFlag.part.11, %function
VCTRL_SetSendStreamAgainFlag.part.11:
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
	ldr	r3, .L192
	movw	r2, #1290
	ldr	r1, .L192+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L193:
	.align	2
.L192:
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_SetSendStreamAgainFlag.part.11, .-VCTRL_SetSendStreamAgainFlag.part.11
	.align	2
	.type	VCTRL_CanBeDecodedByHardWare.part.18, %function
VCTRL_CanBeDecodedByHardWare.part.18:
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
	sub	r3, r0, #19
	cmp	r0, #14
	cmpne	r3, #1
	movls	r0, #1
	movhi	r0, #0
	eor	r0, r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_CanBeDecodedByHardWare.part.18, .-VCTRL_CanBeDecodedByHardWare.part.18
	.align	2
	.global	VCTRL_Suspend
	.type	VCTRL_Suspend, %function
VCTRL_Suspend:
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
	ldr	r6, .L249
	ldr	r8, .L249+4
	ldr	r3, [r6]
	blx	r3
	ldr	r3, [r8]
	cmp	r3, #0
	mov	r9, r0
	beq	.L196
	mov	r0, #0
	blx	r3
.L197:
	mov	r0, #0
	mov	r4, #32
	mov	r5, r0
	bl	SCDDRV_PrepareSleep
	mov	r0, r5
	mov	r7, r5
	bl	VDMDRV_PrepareSleep
	ldr	r3, [r6]
	blx	r3
	mov	r10, r0
.L206:
	mov	r0, #0
	bl	SCDDRV_GetSleepStage
	cmp	r0, #2
	bne	.L241
	mov	r0, #0
	bl	VDMDRV_GetSleepStage
	cmp	r0, #2
	bne	.L242
.L201:
	ldr	r3, .L249+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L243
.L208:
	ldr	r3, .L249+12
	ldr	r2, [r3, #128]
	cmp	r2, #1
	beq	.L244
.L214:
	ldr	r3, [r6]
	blx	r3
	ldr	r1, .L249+16
	cmp	r9, r0
	rsbls	r2, r9, r0
	mvnhi	r9, r9
	addhi	r2, r9, r0
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L241:
	mov	r0, #0
	str	r7, [fp, #-48]
	bl	VDMDRV_GetSleepStage
	ldr	r3, [fp, #-48]
	cmp	r0, #2
	bne	.L217
	mov	r5, #1
	mov	r2, r5
.L218:
	tst	r2, r3
	bne	.L201
	subs	r4, r4, #1
	beq	.L245
	ldr	r3, [r6, #120]
	mov	r0, #10
	blx	r3
	eor	r3, r5, #1
	eor	r2, r7, #1
	orrs	r3, r3, r2
	bne	.L206
	ldr	r3, .L249+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L208
.L243:
	ldr	r3, [r8, #32]
	cmp	r3, #0
	beq	.L209
	mov	r0, #0
	blx	r3
.L209:
	ldr	r3, [r8, #24]
	cmp	r3, #0
	beq	.L246
	mov	r0, #0
	blx	r3
	ldr	r3, [r8, #8]
	cmp	r3, #0
	beq	.L211
.L248:
	mov	r0, #0
	blx	r3
.L212:
	ldr	r3, [r8, #40]
	cmp	r3, #0
	beq	.L208
	mov	r0, #0
	blx	r3
	ldr	r3, .L249+12
	ldr	r2, [r3, #128]
	cmp	r2, #1
	bne	.L214
.L244:
	mov	r2, #2
	str	r2, [r3, #136]
	bl	VCTRL_StopTask.part.9
	b	.L214
.L242:
	mov	r7, #1
	mov	r3, r7
.L217:
	mov	r2, r5
	b	.L218
.L245:
	ldr	r3, [r6]
	blx	r3
	str	r5, [sp]
	mov	r3, r7
	ldr	r1, .L249+20
	cmp	r10, r0
	rsbls	r2, r10, r0
	mvnhi	r10, r10
	addhi	r2, r10, r0
	mov	r0, #0
	bl	dprint_vfmw
	cmp	r7, #1
	beq	.L247
	mov	r2, #0
	ldr	r1, .L249+24
	mov	r0, r2
	bl	dprint_vfmw
	mov	r0, #0
	bl	SCDDRV_ForceSleep
	cmp	r5, #1
	beq	.L201
.L223:
	mov	r2, #0
	ldr	r1, .L249+28
	mov	r0, r2
	bl	dprint_vfmw
	mov	r0, #0
	bl	VDMDRV_ForceSleep
	b	.L201
.L247:
	cmp	r5, #1
	bne	.L223
	b	.L201
.L246:
	mov	r0, r3
	movw	r2, #386
	ldr	r1, .L249+32
	bl	dprint_vfmw
	ldr	r3, [r8, #8]
	cmp	r3, #0
	bne	.L248
.L211:
	mov	r0, r3
	movw	r2, #391
	ldr	r1, .L249+32
	bl	dprint_vfmw
	b	.L212
.L196:
	mov	r0, r3
	mov	r2, #288
	ldr	r1, .L249+32
	bl	dprint_vfmw
	b	.L197
.L250:
	.align	2
.L249:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	g_HalDisable
	.word	.LANCHOR0
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC49
	.word	.LC29
	UNWIND(.fnend)
	.size	VCTRL_Suspend, .-VCTRL_Suspend
	.align	2
	.type	VfmwProc_TestSuspend, %function
VfmwProc_TestSuspend:
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
	ldr	r1, .L252
	mov	r2, r0
	mov	r0, #22
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_Suspend
.L253:
	.align	2
.L252:
	.word	.LC53
	UNWIND(.fnend)
	.size	VfmwProc_TestSuspend, .-VfmwProc_TestSuspend
	.align	2
	.global	VCTRL_Resume
	.type	VCTRL_Resume, %function
VCTRL_Resume:
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
	ldr	r5, .L278
	ldr	r3, [r5]
	blx	r3
	ldr	r3, .L278+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	mov	r4, r0
	beq	.L274
.L255:
	mov	r0, #0
	bl	SCDDRV_ExitSleep
	mov	r0, #0
	bl	VDMDRV_ExitSleep
	ldr	r3, .L278+8
	ldr	r2, [r3, #128]
	cmp	r2, #1
	beq	.L275
.L265:
	ldr	r3, [r5]
	blx	r3
	ldr	r1, .L278+12
	cmp	r4, r0
	rsbls	r2, r4, r0
	mvnhi	r2, r4
	addhi	r2, r2, r0
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L274:
	ldr	r6, .L278+16
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L276
	mov	r0, #0
	blx	r3
.L257:
	ldr	r3, [r6, #20]
	cmp	r3, #0
	beq	.L277
	mov	r0, #0
	blx	r3
.L259:
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L260
	mov	r0, #0
	blx	r3
.L260:
	ldr	r3, [r6, #36]
	cmp	r3, #0
	beq	.L261
	mov	r0, #0
	blx	r3
.L261:
	ldr	r3, [r6, #72]
	cmp	r3, #0
	beq	.L262
	mov	r0, #0
	blx	r3
.L263:
	ldr	r0, [r6, #76]
	cmp	r0, #0
	beq	.L264
	blx	r0
	b	.L255
.L275:
	str	r2, [r3, #136]
	bl	VCTRL_StartTask.part.10
	b	.L265
.L277:
	mov	r0, r3
	movw	r2, #434
	ldr	r1, .L278+20
	bl	dprint_vfmw
	b	.L259
.L262:
	mov	r0, r3
	movw	r2, #441
	ldr	r1, .L278+20
	bl	dprint_vfmw
	b	.L263
.L264:
	movw	r2, #442
	ldr	r1, .L278+20
	bl	dprint_vfmw
	b	.L255
.L276:
	mov	r0, r3
	movw	r2, #429
	ldr	r1, .L278+20
	bl	dprint_vfmw
	b	.L257
.L279:
	.align	2
.L278:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HalDisable
	.word	.LANCHOR0
	.word	.LC54
	.word	g_vdm_hal_fun_ptr
	.word	.LC29
	UNWIND(.fnend)
	.size	VCTRL_Resume, .-VCTRL_Resume
	.align	2
	.type	VfmwProc_TestResume, %function
VfmwProc_TestResume:
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
	ldr	r1, .L281
	mov	r2, r0
	mov	r0, #22
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_Resume
.L282:
	.align	2
.L281:
	.word	.LC53
	UNWIND(.fnend)
	.size	VfmwProc_TestResume, .-VfmwProc_TestResume
	.align	2
	.global	ChanCtx_Init
	.type	ChanCtx_Init, %function
ChanCtx_Init:
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
	mov	r2, #384
	mov	r1, #0
	ldr	r0, .L286+4
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, .L286+8
	mvn	r1, #0
	add	r2, r3, #128
.L284:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L284
	ldmfd	sp, {fp, sp, pc}
.L287:
	.align	2
.L286:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_ChanCtx
	.word	g_ChanCtx+124
	UNWIND(.fnend)
	.size	ChanCtx_Init, .-ChanCtx_Init
	.align	2
	.global	VCTRL_RecordPosTime
	.type	VCTRL_RecordPosTime, %function
VCTRL_RecordPosTime:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #11
	mov	r4, r0
	bhi	.L295
	ldr	r6, .L296
	ldrb	r3, [r6, r0]	@ zero_extendqisi2
	cmp	r3, #14
	movhi	r3, #0
	strhib	r3, [r6, r0]
	cmp	r0, #10
	mov	r5, r3
	ldreq	r3, .L296+4
	moveq	r2, #1
	streqb	r2, [r3, #1272]
	ldr	r3, .L296+8
	ldr	r3, [r3, #4]
	blx	r3
	rsb	r3, r4, r4, lsl #4
	ldr	r1, .L296+12
	add	r3, r3, r5
	ldrb	r2, [r6, r4]	@ zero_extendqisi2
	add	r2, r2, #1
	strb	r2, [r6, r4]
	str	r0, [r1, r3, asl #2]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L295:
	str	r0, [sp]
	movw	r3, #698
	ldr	r2, .L296+16
	mov	r0, #32
	ldr	r1, .L296+20
	bl	dprint_vfmw
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L297:
	.align	2
.L296:
	.word	g_TimeRecId
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TimeRecTable
	.word	.LANCHOR1+20
	.word	.LC55
	UNWIND(.fnend)
	.size	VCTRL_RecordPosTime, .-VCTRL_RecordPosTime
	.align	2
	.global	VCTRL_RecordData
	.type	VCTRL_RecordData, %function
VCTRL_RecordData:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r0, #1
	bhi	.L303
	ldr	ip, .L304
	rsb	r2, r0, r0, lsl #4
	ldr	r4, .L304+4
	ldrb	r3, [ip, r0]	@ zero_extendqisi2
	cmp	r3, #14
	addls	lr, r3, #1
	movhi	r3, #0
	add	r3, r2, r3
	uxtbls	lr, lr
	movhi	lr, #1
	str	r1, [r4, r3, asl #2]
	strb	lr, [ip, r0]
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L303:
	str	r0, [sp]
	movw	r3, #722
	ldr	r2, .L304+8
	mov	r0, #32
	ldr	r1, .L304+12
	bl	dprint_vfmw
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L305:
	.align	2
.L304:
	.word	g_DataRecId
	.word	g_DataTable
	.word	.LANCHOR1+40
	.word	.LC56
	UNWIND(.fnend)
	.size	VCTRL_RecordData, .-VCTRL_RecordData
	.align	2
	.global	VCTRL_Isr_1
	.type	VCTRL_Isr_1, %function
VCTRL_Isr_1:
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
	bl	VDMDRV_IsrProcess
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Isr_1, .-VCTRL_Isr_1
	.align	2
	.global	VCTRL_Isr_2
	.type	VCTRL_Isr_2, %function
VCTRL_Isr_2:
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
	mov	r0, #2
	bl	VDMDRV_IsrProcess
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Isr_2, .-VCTRL_Isr_2
	.align	2
	.global	VCTRL_Scd_Isr_1
	.type	VCTRL_Scd_Isr_1, %function
VCTRL_Scd_Isr_1:
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
	bl	SM_SCDIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Scd_Isr_1, .-VCTRL_Scd_Isr_1
	.align	2
	.global	VCTRL_Scd_Isr_2
	.type	VCTRL_Scd_Isr_2, %function
VCTRL_Scd_Isr_2:
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
	mov	r0, #2
	bl	SM_SCDIntServeProc
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_Scd_Isr_2, .-VCTRL_Scd_Isr_2
	.align	2
	.global	VCTRL_InformVdmFree
	.type	VCTRL_InformVdmFree, %function
VCTRL_InformVdmFree:
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
	ldr	r3, .L311
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L312:
	.align	2
.L311:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_InformVdmFree, .-VCTRL_InformVdmFree
	.align	2
	.global	VCTRL_ExtraWakeUpThread
	.type	VCTRL_ExtraWakeUpThread, %function
VCTRL_ExtraWakeUpThread:
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
	ldr	r3, .L314
	mov	r0, #0
	ldr	r3, [r3, #128]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	r3
.L315:
	.align	2
.L314:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_ExtraWakeUpThread, .-VCTRL_ExtraWakeUpThread
	.align	2
	.global	VCTRL_SetMoreGapEnable
	.type	VCTRL_SetMoreGapEnable, %function
VCTRL_SetMoreGapEnable:
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
	bhi	.L322
	ldr	r3, .L325
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L323
	ldr	r2, [r3, #4]
	cmp	r2, #1
	bne	.L324
	cmp	r1, #1
	strls	r1, [r3, #1152]
	movls	r0, #0
	movhi	r2, #0
	strhi	r2, [r3, #1152]
	mvnhi	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L324:
	ldr	r3, .L325+4
	movw	r2, #906
	ldr	r1, .L325+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L322:
	ldr	r3, .L325+12
	mov	r2, #904
	ldr	r1, .L325+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L323:
	mov	r0, r3
	movw	r2, #905
	ldr	r3, .L325+16
	ldr	r1, .L325+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L326:
	.align	2
.L325:
	.word	.LANCHOR0
	.word	.LC58
	.word	.LC1
	.word	.LC57
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_SetMoreGapEnable, .-VCTRL_SetMoreGapEnable
	.align	2
	.global	VCTRL_SetCallBack
	.type	VCTRL_SetCallBack, %function
VCTRL_SetCallBack:
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
	beq	.L335
	cmp	r0, #0
	beq	.L331
	cmp	r0, #1
	bne	.L336
	ldr	r3, .L337
	mov	r0, #0
	str	r1, [r3, #372]
	ldmfd	sp, {fp, sp, pc}
.L336:
	mov	r3, r0
	ldr	r2, .L337+4
	ldr	r1, .L337+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L331:
	ldr	r3, .L337
	str	r1, [r3, #368]
	ldmfd	sp, {fp, sp, pc}
.L335:
	mov	r0, r1
	ldr	r3, .L337+12
	movw	r2, #1023
	ldr	r1, .L337+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L338:
	.align	2
.L337:
	.word	.LANCHOR0
	.word	.LANCHOR1+60
	.word	.LC60
	.word	.LC59
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_SetCallBack, .-VCTRL_SetCallBack
	.align	2
	.global	VCTRL_StopTask
	.type	VCTRL_StopTask, %function
VCTRL_StopTask:
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
	ldr	r3, .L341
	ldr	r2, [r3, #128]
	cmp	r2, #1
	bne	.L340
	mov	r2, #2
	str	r2, [r3, #136]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_StopTask.part.9
.L340:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L342:
	.align	2
.L341:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_StopTask, .-VCTRL_StopTask
	.align	2
	.global	VCTRL_StartTask
	.type	VCTRL_StartTask, %function
VCTRL_StartTask:
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
	ldr	r3, .L345
	ldr	r2, [r3, #128]
	cmp	r2, #1
	bne	.L344
	str	r2, [r3, #136]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_StartTask.part.10
.L344:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L346:
	.align	2
.L345:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_StartTask, .-VCTRL_StartTask
	.align	2
	.global	VCTRL_SetStreamInterface
	.type	VCTRL_SetStreamInterface, %function
VCTRL_SetStreamInterface:
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
	mov	r4, r0
	beq	.L351
	ldr	r3, .L353
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L352
	ldr	r5, .L353+4
	mov	r2, #12
	add	r0, r0, #188
	ldr	r3, [r5, #52]
	blx	r3
	mov	r3, r4, asl #4
	ldr	r0, .L353+8
	sub	r4, r3, r4, asl #2
	mov	r1, r6
	ldr	r3, [r5, #52]
	add	r0, r0, r4
	mov	r2, #12
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L352:
	ldr	r3, .L353+12
	movw	r2, #1279
	ldr	r1, .L353+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L351:
	mov	r0, r6
	ldr	r3, .L353+20
	movw	r2, #1278
	ldr	r1, .L353+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L354:
	.align	2
.L353:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1276
	.word	.LC2
	.word	.LC1
	.word	.LC61
	UNWIND(.fnend)
	.size	VCTRL_SetStreamInterface, .-VCTRL_SetStreamInterface
	.align	2
	.global	VCTRL_SetSendStreamAgainFlag
	.type	VCTRL_SetSendStreamAgainFlag, %function
VCTRL_SetSendStreamAgainFlag:
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
	ldr	r3, .L358
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L357
	add	r3, r3, #290816
	mov	r0, #0
	str	r1, [r3, #3188]
	ldmfd	sp, {fp, sp, pc}
.L357:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_SetSendStreamAgainFlag.part.11
.L359:
	.align	2
.L358:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_SetSendStreamAgainFlag, .-VCTRL_SetSendStreamAgainFlag
	.align	2
	.global	VCTRL_GetSendStreamAgainFlag
	.type	VCTRL_GetSendStreamAgainFlag, %function
VCTRL_GetSendStreamAgainFlag:
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
	ldr	r3, .L364
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L363
	add	r0, r0, #290816
	ldr	r0, [r0, #3188]
	ldmfd	sp, {fp, sp, pc}
.L363:
	ldr	r3, .L364+4
	movw	r2, #1297
	ldr	r1, .L364+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L365:
	.align	2
.L364:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_GetSendStreamAgainFlag, .-VCTRL_GetSendStreamAgainFlag
	.align	2
	.global	VCTRL_GetStreamInterface
	.type	VCTRL_GetStreamInterface, %function
VCTRL_GetStreamInterface:
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
	ldr	r5, .L372
	mov	r4, r0
	ldr	r1, [r5, r0, asl #2]
	cmp	r1, #0
	beq	.L370
	ldr	r3, .L372+4
	mov	ip, r0, asl #4
	ldr	r0, .L372+8
	sub	ip, ip, r4, asl #2
	add	r1, r1, #188
	mov	r2, #12
	add	r0, r0, ip
	ldr	r3, [r3, #60]
	blx	r3
	cmp	r0, #0
	bne	.L371
	ldr	r1, [r5, r4, asl #2]
	add	r0, r1, #188
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L371:
	mov	r3, r4
	movw	r2, #1313
	ldr	r1, .L372+12
	mov	r0, #0
	bl	dprint_vfmw
.L370:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L373:
	.align	2
.L372:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1276
	.word	.LC62
	UNWIND(.fnend)
	.size	VCTRL_GetStreamInterface, .-VCTRL_GetStreamInterface
	.align	2
	.global	VCTRL_SetFrameInterface
	.type	VCTRL_SetFrameInterface, %function
VCTRL_SetFrameInterface:
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
	subs	r3, r1, #0
	beq	.L378
	ldr	r3, .L380
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L379
	ldr	r3, .L380+4
	mov	r2, #12
	add	r0, r0, #212
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L379:
	ldr	r3, .L380+8
	movw	r2, #1326
	ldr	r1, .L380+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L378:
	mov	r0, r3
	movw	r2, #1325
	ldr	r3, .L380+16
	ldr	r1, .L380+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L381:
	.align	2
.L380:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	.word	.LC1
	.word	.LC63
	UNWIND(.fnend)
	.size	VCTRL_SetFrameInterface, .-VCTRL_SetFrameInterface
	.align	2
	.global	VCTRL_GetFrameInterface
	.type	VCTRL_GetFrameInterface, %function
VCTRL_GetFrameInterface:
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
	ldr	r3, .L385
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r0, r0, #212
	ldmfd	sp, {fp, sp, pc}
.L386:
	.align	2
.L385:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetFrameInterface, .-VCTRL_GetFrameInterface
	.align	2
	.global	VCTRL_GetStreamSize
	.type	VCTRL_GetStreamSize, %function
VCTRL_GetStreamSize:
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
	bhi	.L392
	ldr	r3, .L395
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L393
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L394
	add	r0, r0, #99328
	add	r0, r0, #536
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	GetSegStreamSize
.L394:
	ldr	r3, .L395+4
	movw	r2, #1366
	ldr	r1, .L395+8
	mov	r0, #0
	bl	dprint_vfmw
.L389:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L392:
	ldr	r3, .L395+12
	movw	r2, #1364
	ldr	r1, .L395+8
	mov	r0, #0
	bl	dprint_vfmw
	b	.L389
.L393:
	ldr	r3, .L395+16
	movw	r2, #1365
	ldr	r1, .L395+8
	bl	dprint_vfmw
	b	.L389
.L396:
	.align	2
.L395:
	.word	.LANCHOR0
	.word	.LC65
	.word	.LC1
	.word	.LC57
	.word	.LC64
	UNWIND(.fnend)
	.size	VCTRL_GetStreamSize, .-VCTRL_GetStreamSize
	.align	2
	.global	VCTRL_CheckFreshRaw
	.type	VCTRL_CheckFreshRaw, %function
VCTRL_CheckFreshRaw:
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
	mov	r2, #0
	str	r2, [fp, #-28]
	str	r2, [fp, #-24]
	bhi	.L404
	ldr	r3, .L407
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L405
	ldr	r1, [r0, #4]
	cmp	r1, #1
	bne	.L406
	add	r4, r0, #1536
	sub	r1, fp, #28
	mov	r0, r4
	bl	GetRawStreamNum
	cmp	r0, #0
	bne	.L403
	mov	r0, r4
	sub	r1, fp, #24
	bl	GetRawStreamSize
	cmp	r0, #0
	bne	.L403
	ldr	r3, [fp, #-24]
	mov	r0, #22
	ldr	r2, [fp, #-28]
	ldr	r1, .L407+4
	bl	dprint_vfmw
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	ble	.L403
	ldr	r0, [fp, #-24]
	cmp	r0, #3
	movgt	r0, #0
	mvnle	r0, #0
.L399:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L403:
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L406:
	mov	r0, r2
	ldr	r3, .L407+8
	movw	r2, #1383
	ldr	r1, .L407+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L399
.L404:
	mov	r0, r2
	ldr	r3, .L407+16
	movw	r2, #1381
	ldr	r1, .L407+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L399
.L405:
	ldr	r3, .L407+20
	movw	r2, #1382
	ldr	r1, .L407+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L399
.L408:
	.align	2
.L407:
	.word	.LANCHOR0
	.word	.LC66
	.word	.LC65
	.word	.LC1
	.word	.LC57
	.word	.LC64
	UNWIND(.fnend)
	.size	VCTRL_CheckFreshRaw, .-VCTRL_CheckFreshRaw
	.align	2
	.global	VCTRL_CheckFreshSeg
	.type	VCTRL_CheckFreshSeg, %function
VCTRL_CheckFreshSeg:
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
	cmp	r0, #31
	mov	r2, #0
	str	r2, [fp, #-20]
	str	r2, [fp, #-16]
	bhi	.L414
	ldr	r3, .L417
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L415
	ldr	r1, [r0, #4]
	cmp	r1, #1
	bne	.L416
	add	r0, r0, #99328
	sub	r2, fp, #16
	add	r0, r0, #536
	sub	r1, fp, #20
	bl	GetFreshSegStream
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r0, #22
	ldr	r1, .L417+4
	bl	dprint_vfmw
	ldr	r0, [fp, #-20]
	cmp	r0, #0
	movgt	r0, #0
	mvnle	r0, #0
.L411:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L416:
	mov	r0, r2
	ldr	r3, .L417+8
	movw	r2, #1409
	ldr	r1, .L417+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L411
.L414:
	mov	r0, r2
	ldr	r3, .L417+16
	movw	r2, #1407
	ldr	r1, .L417+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L411
.L415:
	ldr	r3, .L417+20
	mov	r2, #1408
	ldr	r1, .L417+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L411
.L418:
	.align	2
.L417:
	.word	.LANCHOR0
	.word	.LC67
	.word	.LC65
	.word	.LC1
	.word	.LC57
	.word	.LC64
	UNWIND(.fnend)
	.size	VCTRL_CheckFreshSeg, .-VCTRL_CheckFreshSeg
	.align	2
	.global	VCTRL_SetDiscardPicParam
	.type	VCTRL_SetDiscardPicParam, %function
VCTRL_SetDiscardPicParam:
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
	mov	r4, r0
	mov	r0, r1
	bhi	.L425
	cmp	r1, #0
	beq	.L426
	ldr	r5, .L428
	ldr	r0, [r5, r4, asl #2]
	cmp	r0, #0
	beq	.L427
	ldr	r3, .L428+4
	add	r0, r0, #1408
	mov	r2, #8
	add	r0, r0, #8
	ldr	r3, [r3, #52]
	blx	r3
	ldr	r2, [r5, r4, asl #2]
	mov	r0, #0
	ldr	r3, [r2, #1416]
	sub	r3, r3, #1
	cmp	r3, #1
	strhi	r0, [r2, #1416]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L425:
	ldr	r3, .L428+8
	movw	r2, #1428
	ldr	r1, .L428+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L427:
	ldr	r3, .L428+16
	movw	r2, #1430
	ldr	r1, .L428+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L426:
	ldr	r3, .L428+20
	movw	r2, #1429
	ldr	r1, .L428+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L429:
	.align	2
.L428:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC57
	.word	.LC1
	.word	.LC2
	.word	.LC68
	UNWIND(.fnend)
	.size	VCTRL_SetDiscardPicParam, .-VCTRL_SetDiscardPicParam
	.align	2
	.global	VCTRL_GetSyntaxCtx
	.type	VCTRL_GetSyntaxCtx, %function
VCTRL_GetSyntaxCtx:
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
	ldr	r3, .L433
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	movwne	r0, #36152
	movtne	r0, 4
	addne	r0, r3, r0
	moveq	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L434:
	.align	2
.L433:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetSyntaxCtx, .-VCTRL_GetSyntaxCtx
	.align	2
	.global	VCTRL_GetImageInterface
	.type	VCTRL_GetImageInterface, %function
VCTRL_GetImageInterface:
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
	ldr	r3, .L438
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	addne	r0, r0, #200
	ldmfd	sp, {fp, sp, pc}
.L439:
	.align	2
.L438:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetImageInterface, .-VCTRL_GetImageInterface
	.align	2
	.global	VCTRL_PartitionMemForStdUser
	.type	VCTRL_PartitionMemForStdUser, %function
VCTRL_PartitionMemForStdUser:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 48
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
	ldr	r6, .L457
	cmp	r2, #31
	cmpgt	r1, #31
	mov	r7, r2
	mov	r8, r1
	mov	r9, r0
	movle	r2, #1
	movgt	r2, #0
	ldr	r4, [r6, r0, asl #2]
	ble	.L453
	ldr	r1, [fp, #4]
	cmp	r1, #0
	cmpne	r3, #0
	moveq	r5, #1
	movne	r5, #0
	beq	.L454
	ldr	r10, .L457+4
	mov	r2, #32
	mov	r1, r5
	sub	r0, fp, #76
	str	r3, [fp, #-88]
	ldr	ip, [r10, #48]
	blx	ip
	sub	r1, fp, #76
	mov	r0, r9
	mov	r2, #1
	str	r7, [fp, #-64]
	str	r7, [fp, #-48]
	strb	r5, [fp, #-75]
	str	r8, [fp, #-68]
	str	r8, [fp, #-52]
	strb	r5, [fp, #-73]
	strb	r5, [fp, #-71]
	strb	r5, [fp, #-70]
	strb	r2, [fp, #-74]
	bl	FSP_ConfigInstance
	subs	r7, r0, #0
	bne	.L444
	ldr	r3, [fp, #-88]
	mov	r0, r9
	ldr	r2, [fp, #4]
	mov	r1, r3
	sub	r3, fp, #80
	bl	FSP_ConfigFrameBuf
	subs	r5, r0, #0
	bne	.L455
	mov	r0, r9
	ldr	r1, .L457+8
	bl	FSP_GetInstInfo
	movw	r3, #1661
	ldrsb	r3, [r6, r3]
	cmp	r3, #16
	movge	r3, #16
	cmp	r3, #2
	str	r3, [r4, #464]
	ble	.L456
	add	r6, r6, #4096
	ldr	r3, [r10, #48]
	mov	r2, #64
	mov	r1, r7
	ldr	ip, [r6, #772]
	add	r0, r4, #396
	str	ip, [r4, #460]
	blx	r3
	ldr	r0, [r4, #464]
	cmp	r0, #0
	ble	.L442
	ldr	r2, .L457+8
	add	r4, r4, #392
	mov	r3, r7
.L449:
	ldr	r1, [r2, #24]
	add	r3, r3, #1
	cmp	r3, r0
	add	r2, r2, #100
	str	r1, [r4, #4]!
	bne	.L449
.L442:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L454:
	mov	r0, r2
	ldr	r1, .L457+12
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L442
.L444:
	mov	r0, r5
	ldr	r1, .L457+16
	bl	dprint_vfmw
.L452:
	mvn	r7, #0
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L455:
	mov	r0, r7
	ldr	r1, .L457+20
	bl	dprint_vfmw
	b	.L452
.L456:
	mov	r0, r5
	movw	r3, #1583
	ldr	r2, .L457+24
	ldr	r1, .L457+28
	bl	dprint_vfmw
	b	.L452
.L453:
	mov	r3, r7
	mov	r2, r1
	mov	r0, #0
	ldr	r1, .L457+32
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L442
.L458:
	.align	2
.L457:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+1660
	.word	.LC70
	.word	.LC73
	.word	.LC71
	.word	.LANCHOR1+80
	.word	.LC72
	.word	.LC69
	UNWIND(.fnend)
	.size	VCTRL_PartitionMemForStdUser, .-VCTRL_PartitionMemForStdUser
	.align	2
	.global	VCTRL_UnInstallChan
	.type	VCTRL_UnInstallChan, %function
VCTRL_UnInstallChan:
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
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_UnInstallChan, .-VCTRL_UnInstallChan
	.align	2
	.global	DelAllFrameMemRecord
	.type	DelAllFrameMemRecord, %function
DelAllFrameMemRecord:
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
	cmp	r1, #0
	movne	r4, r1
	addne	r5, r4, #2304
	beq	.L477
.L466:
	ldr	r3, [r4]
	cmp	r3, #255
	beq	.L463
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #24]
	ldr	r0, [r4, #32]
	bl	MEM_DelMemRecord
.L463:
	ldr	r3, [r4, #4]
	cmp	r3, #255
	beq	.L464
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #40]
	ldr	r0, [r4, #48]
	bl	MEM_DelMemRecord
.L464:
	ldr	r3, [r4, #8]
	cmp	r3, #255
	beq	.L465
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #56]
	ldr	r0, [r4, #64]
	bl	MEM_DelMemRecord
.L465:
	add	r4, r4, #72
	cmp	r4, r5
	bne	.L466
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L477:
	mov	r0, r1
	ldr	r3, .L478
	movw	r2, #1622
	ldr	r1, .L478+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L479:
	.align	2
.L478:
	.word	.LC74
	.word	.LC1
	UNWIND(.fnend)
	.size	DelAllFrameMemRecord, .-DelAllFrameMemRecord
	.align	2
	.global	VCTRL_FreeChanResource
	.type	VCTRL_FreeChanResource, %function
VCTRL_FreeChanResource:
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
	subs	r5, r1, #0
	beq	.L504
	ldr	r4, [r5]
	cmp	r4, #0
	beq	.L505
	ldr	r3, [r5, #16]
	cmp	r3, #1
	beq	.L485
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
.L486:
	ldr	r3, [r5, #20]
	cmp	r3, #1
	beq	.L506
.L484:
	ldr	r4, [r5, #4]
	cmp	r4, #0
	beq	.L507
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5, #24]
	cmp	r3, #1
	beq	.L508
.L489:
	ldr	r4, [r5, #8]
	cmp	r4, #0
	beq	.L509
.L490:
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_DelMemRecord
	ldr	r3, [r5, #28]
	cmp	r3, #1
	bne	.L491
	ldr	r0, [r4, #8]
	cmp	r0, #0
	bne	.L510
.L491:
	ldr	r3, .L512
	ldr	r0, [r4, #4]
	ldr	r3, [r3, #164]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L485:
	ldr	r1, [r5, #12]
	cmp	r1, #0
	beq	.L511
	bl	DelAllFrameMemRecord
	cmp	r0, #0
	beq	.L486
	ldr	r1, .L512+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r5, #20]
	cmp	r3, #1
	bne	.L484
.L506:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L484
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	b	.L484
.L508:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	beq	.L489
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	b	.L489
.L507:
	mov	r0, r4
	ldr	r2, .L512+8
	ldr	r1, .L512+12
	bl	dprint_vfmw
	ldr	r4, [r5, #8]
	cmp	r4, #0
	bne	.L490
.L509:
	ldr	r2, .L512+8
	mov	r0, r4
	ldr	r1, .L512+16
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L510:
	ldr	r1, [r4, #4]
	bl	MEM_ReleaseMemBlock
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L511:
	mov	r0, r1
	ldr	r2, .L512+8
	ldr	r1, .L512+20
	bl	dprint_vfmw
	b	.L486
.L505:
	mov	r0, r4
	ldr	r2, .L512+8
	ldr	r1, .L512+24
	bl	dprint_vfmw
	b	.L484
.L504:
	mov	r0, r5
	ldr	r2, .L512+8
	ldr	r1, .L512+28
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L513:
	.align	2
.L512:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC78
	.word	.LANCHOR1+112
	.word	.LC79
	.word	.LC80
	.word	.LC77
	.word	.LC76
	.word	.LC75
	UNWIND(.fnend)
	.size	VCTRL_FreeChanResource, .-VCTRL_FreeChanResource
	.align	2
	.global	VCTRL_GetChanCtxSize
	.type	VCTRL_GetChanCtxSize, %function
VCTRL_GetChanCtxSize:
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
	cmp	r0, #26
	moveq	r3, #640
	movne	r3, #16640
	movteq	r3, 178
	movtne	r3, 12
	str	r3, [r1]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_GetChanCtxSize, .-VCTRL_GetChanCtxSize
	.align	2
	.global	VCTRL_GetChanCfg
	.type	VCTRL_GetChanCfg, %function
VCTRL_GetChanCfg:
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
	mov	r3, r1
	bhi	.L522
	cmp	r1, #0
	beq	.L523
	ldr	r2, .L525
	ldr	r1, [r2, r0, asl #2]
	cmp	r1, #0
	beq	.L524
	ldr	ip, .L525+4
	add	r1, r1, #44
	mov	r0, r3
	mov	r2, #144
	ldr	r3, [ip, #52]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L522:
	ldr	r3, .L525+8
	movw	r2, #2638
	ldr	r1, .L525+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L524:
	mov	r0, r1
	ldr	r3, .L525+16
	mov	r2, #2640
	ldr	r1, .L525+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L523:
	mov	r0, r1
	ldr	r3, .L525+20
	movw	r2, #2639
	ldr	r1, .L525+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L526:
	.align	2
.L525:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC57
	.word	.LC1
	.word	.LC2
	.word	.LC81
	UNWIND(.fnend)
	.size	VCTRL_GetChanCfg, .-VCTRL_GetChanCfg
	.align	2
	.global	VCTRL_CmpConfigParameter
	.type	VCTRL_CmpConfigParameter, %function
VCTRL_CmpConfigParameter:
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
	ldr	r3, .L546
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #544]
	cmp	r2, #21
	beq	.L543
	ldr	r2, [r3, #52]
	ldr	r0, [r1, #8]
	cmp	r2, r0
	bne	.L543
	ldr	ip, [r3, #72]
	ldr	r0, [r1, #28]
	cmp	ip, r0
	bne	.L543
	ldr	ip, [r3, #68]
	ldr	r0, [r1, #24]
	cmp	ip, r0
	bne	.L543
	ldr	ip, [r3, #76]
	ldr	r0, [r1, #32]
	cmp	ip, r0
	bne	.L543
	ldr	ip, [r3, #80]
	ldr	r0, [r1, #36]
	cmp	ip, r0
	bne	.L543
	ldr	ip, [r3, #84]
	ldr	r0, [r1, #40]
	cmp	ip, r0
	bne	.L543
	ldr	ip, [r3, #92]
	ldr	r0, [r1, #48]
	cmp	ip, r0
	bne	.L543
	ldr	ip, [r3, #116]
	ldr	r0, [r1, #72]
	cmp	ip, r0
	bne	.L543
	ldr	ip, [r3, #132]
	ldr	r0, [r1, #88]
	cmp	ip, r0
	bne	.L543
	ldr	ip, [r3, #128]
	ldr	r0, [r1, #84]
	cmp	ip, r0
	bne	.L543
	ldr	ip, [r3, #120]
	ldr	r0, [r1, #76]
	cmp	ip, r0
	bne	.L543
	ldr	ip, [r3, #136]
	ldr	r0, [r1, #92]
	cmp	ip, r0
	bne	.L543
	cmp	r2, #1
	beq	.L545
	sub	r2, r2, #10
	cmp	r2, #2
	bhi	.L544
	ldr	r3, [r3, #56]
	ldr	r0, [r1, #12]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L543:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L544:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L545:
	ldr	r0, [r3, #56]
	ldr	r2, [r1, #12]
	cmp	r0, r2
	bne	.L543
	ldr	r3, [r3, #60]
	ldr	r0, [r1, #16]
	subs	r0, r3, r0
	mvnne	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L547:
	.align	2
.L546:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_CmpConfigParameter, .-VCTRL_CmpConfigParameter
	.align	2
	.global	VCTRL_CheckChanWH
	.type	VCTRL_CheckChanWH, %function
VCTRL_CheckChanWH:
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
	ldr	r3, .L553
	ldr	r2, .L553+4
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r2]
	ldr	r0, [r3, #1220]
	ldr	r3, [r3, #1224]
	cmp	r0, r2
	bgt	.L549
	ldr	r0, .L553+8
	ldr	r0, [r0]
	cmp	r3, r0
	ble	.L551
.L549:
	ldr	r0, [r1, #8]
	cmp	r0, #20
	cmpne	r0, #0
	bic	r0, r0, #2
	movne	r3, #1
	moveq	r3, #0
	cmp	r0, #13
	moveq	r0, #0
	andne	r0, r3, #1
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r3, .L553+8
	mov	r0, #0
	ldr	r1, .L553+12
	ldr	r3, [r3]
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L551:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L554:
	.align	2
.L553:
	.word	.LANCHOR0
	.word	g_ChipMaxWidth
	.word	g_ChipMaxHeight
	.word	.LC82
	UNWIND(.fnend)
	.size	VCTRL_CheckChanWH, .-VCTRL_CheckChanWH
	.align	2
	.global	VCTRL_SeekPts
	.type	VCTRL_SeekPts, %function
VCTRL_SeekPts:
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
	ldr	r3, .L563
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L561
	ldr	r3, [r3, #544]
	sub	r2, r3, #10
	cmp	r2, #2
	bls	.L562
.L558:
	cmp	r3, #14
	cmpne	r3, #4
	beq	.L560
	bl	SM_SeekPts
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {fp, sp, pc}
.L562:
	ldr	r2, .L563+4
	ldr	r2, [r2, #-3312]
	tst	r2, #1
	bne	.L558
.L560:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L561:
	mov	r0, r3
	movw	r2, #3180
	ldr	r3, .L563+8
	ldr	r1, .L563+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L564:
	.align	2
.L563:
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_SeekPts, .-VCTRL_SeekPts
	.align	2
	.global	VCTRL_ReleaseStream
	.type	VCTRL_ReleaseStream, %function
VCTRL_ReleaseStream:
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
	ldr	r3, .L569
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L568
	bl	SM_Reset
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {fp, sp, pc}
.L568:
	mov	r0, r3
	movw	r2, #3588
	ldr	r3, .L569+4
	ldr	r1, .L569+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L570:
	.align	2
.L569:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_ReleaseStream, .-VCTRL_ReleaseStream
	.align	2
	.global	VCTRL_ImageOutputEnable
	.type	VCTRL_ImageOutputEnable, %function
VCTRL_ImageOutputEnable:
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
	mov	r4, r0
	mov	r6, r1
	bhi	.L574
	ldr	r5, .L575
	mov	r0, #4
	ldr	r3, [r5, #12]
	blx	r3
	ldr	r3, .L575+4
	ldr	r2, [r6]
	mov	r0, #4
	ldr	r3, [r3, r4, asl #2]
	str	r2, [r3, #12]
	ldr	r3, [r5, #16]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L574:
	ldr	r3, .L575+8
	movw	r2, #3698
	ldr	r1, .L575+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L576:
	.align	2
.L575:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC57
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_ImageOutputEnable, .-VCTRL_ImageOutputEnable
	.align	2
	.global	VCTRL_TryToRelSpecialFrm
	.type	VCTRL_TryToRelSpecialFrm, %function
VCTRL_TryToRelSpecialFrm:
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
	bhi	.L612
	ldr	r5, .L617
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L613
	add	r3, r0, #294912
	ldr	lr, [r3, #3328]
	cmp	lr, #0
	beq	.L581
	ldr	r3, [r3, #2820]
	cmp	r1, r3
	movne	r3, #0
	bne	.L584
	b	.L614
.L587:
	ldr	r2, [r0, r2]
	cmp	r1, r2
	beq	.L582
.L584:
	add	r3, r3, #1
	movw	r2, #35588
	cmp	r3, lr
	movt	r2, 4
	mov	ip, r3, asl #4
	mov	r6, r3
	add	r2, ip, r2
	bne	.L587
.L581:
	mvn	r0, #0
.L605:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L614:
	mov	r6, #0
.L582:
	add	r3, r0, #286720
	ldr	r2, [r3, #12]
	cmp	r2, r1
	addne	r3, r3, #112
	movne	r7, #1
	bne	.L591
	b	.L615
.L588:
	add	r7, r7, #1
	cmp	r7, #32
	beq	.L616
.L591:
	ldr	r2, [r3]
	add	r3, r3, #100
	cmp	r2, r1
	bne	.L588
.L585:
	ldr	r9, .L617+4
	mov	r0, #3
	sub	r8, lr, #1
	ldr	r3, [r9, #12]
	blx	r3
	ldr	r1, [r5, r4, asl #2]
	mov	r0, #100
	movw	r2, #24568
	movw	r3, #27768
	movt	r2, 4
	mla	r7, r0, r7, r1
	movt	r3, 4
	mov	r1, #0
	ldr	ip, [r9, #16]
	mov	r0, #3
	add	r2, r7, r2
	add	r3, r7, r3
	strb	r1, [r2, #6]
	strb	r1, [r3, #6]
	blx	ip
	cmp	r8, r6
	bls	.L597
	add	r7, r6, #18432
	add	r7, r7, #176
.L590:
	ldr	r1, [r5, r4, asl #2]
	add	r6, r6, #1
	ldr	r3, [r9, #52]
	mov	r2, #16
	add	r0, r1, r7, lsl #4
	add	r7, r6, #18432
	add	r7, r7, #176
	add	r1, r1, r7, lsl #4
	blx	r3
	cmp	r8, r6
	bhi	.L590
.L589:
	add	lr, r8, #18432
	ldr	r0, [r5, r4, asl #2]
	add	lr, lr, #176
	ldr	r3, [r9, #48]
	mov	r2, #16
	mov	r1, #0
	add	r0, r0, lr, lsl #4
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	mov	r0, #0
	add	r3, r3, #294912
	ldr	r2, [r3, #3328]
	sub	r2, r2, #1
	str	r2, [r3, #3328]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L616:
	add	r0, r0, #262144
	movw	r6, #1898
	movw	r3, #3855
	ldr	r2, .L617+8
	ldrsb	ip, [r0, r6]
	mov	r0, #1
	ldr	r1, .L617+12
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r5, r4, asl #2]
	add	r3, ip, #262144
	ldrsb	r3, [r3, r6]
	cmp	r3, #0
	movgt	r6, #0
	ble	.L581
.L593:
	mov	r2, #100
	movw	r3, #3858
	mla	ip, r2, r6, ip
	mov	r0, #1
	ldr	r2, .L617+8
	add	r6, r6, r0
	ldr	r1, .L617+16
	add	ip, ip, #286720
	add	ip, ip, #8
	ldr	ip, [ip, #4]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r5, r4, asl #2]
	movw	r3, #1898
	movt	r3, 4
	add	r3, ip, r3
	ldrsb	r3, [r3]
	cmp	r3, r6
	bgt	.L593
	b	.L581
.L615:
	mov	r7, #0
	b	.L585
.L612:
	ldr	r3, .L617+20
	movw	r2, #3819
	ldr	r1, .L617+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L605
.L597:
	mov	r8, r6
	b	.L589
.L613:
	ldr	r3, .L617+20
	movw	r2, #3820
	ldr	r1, .L617+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L605
.L618:
	.align	2
.L617:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+136
	.word	.LC84
	.word	.LC83
	.word	.LC57
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_TryToRelSpecialFrm, .-VCTRL_TryToRelSpecialFrm
	.align	2
	.global	VCTRL_GetChanImage
	.type	VCTRL_GetChanImage, %function
VCTRL_GetChanImage:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 664
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #672)
	sub	sp, sp, #672
	mov	r4, r0
	mov	r2, r0
	mov	r5, r1
	mov	r0, #2
	ldr	r1, .L660
	bl	dprint_vfmw
	cmp	r4, #31
	bhi	.L648
	ldr	r6, .L660+4
	ldr	r0, [r6, r4, asl #2]
	cmp	r0, #0
	beq	.L649
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L650
	ldr	r8, .L660+8
	mov	r0, #4
	ldr	r3, [r8, #12]
	blx	r3
	ldr	r3, [r6, r4, asl #2]
	ldr	r2, [r3, #12]
	cmp	r2, #1
	bne	.L651
	movw	r0, #36152
	mov	r1, r5
	movt	r0, 4
	add	r0, r3, r0
	bl	SYNTAX_ReceiveImage
	cmp	r0, #1
	mov	r9, r0
	beq	.L652
	mov	r0, #12
	mvn	r7, #0
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L635
.L636:
	ldr	r3, [r6, r4, asl #2]
	mov	r0, #4
	ldr	r2, [r8, #16]
	add	r3, r3, #311296
	ldrb	r3, [r3, #2764]	@ zero_extendqisi2
	strb	r3, [r5, #508]
	blx	r2
.L645:
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L652:
	ldr	r2, [r5, #224]
	mvn	r3, #0
	str	r3, [r5, #220]
	cmp	r2, #1
	beq	.L653
.L626:
	mov	r0, #12
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L654
.L638:
	ldr	r3, [r6, r4, asl #2]
	mov	r0, #4
	ldr	ip, [r5, #124]
	mov	r7, #0
	add	r1, r3, #311296
	ldr	r2, [r8, #16]
	str	ip, [r3, #368]
	ldr	ip, [r5, #392]
	str	ip, [r3, #372]
	ldrb	r3, [r1, #2764]	@ zero_extendqisi2
	strb	r3, [r5, #508]
	blx	r2
	mov	r1, r5
	mov	r0, r4
	bl	YUV_WriteYuv
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L654:
	mov	r7, #0
.L635:
	ldr	r3, [r8]
	blx	r3
	ldr	r3, .L660+12
	ldr	r1, .L660+16
	add	r3, r3, r4, lsl #2
	ldr	r2, [r3, #-3308]
	ldr	r1, [r1]
	rsb	r2, r2, r0
	mov	ip, r0
	cmp	r2, r1
	bhi	.L655
.L637:
	cmp	r7, #0
	bne	.L636
	b	.L638
.L655:
	mov	r2, r4, asl #24
	movw	r1, #4127
	add	r2, r2, #786432
	ldr	r0, .L660+20
	cmp	r9, #1
	addeq	r2, r2, #1
	str	ip, [r3, #-3308]
	bl	DBG_AddTrace
	b	.L637
.L653:
	ldr	r2, [r5, #212]
	cmp	r2, #0
	beq	.L656
	ldr	r0, [r5, #32]
	mov	r2, #3
	ldr	r1, [r5, #28]
	str	r3, [r5, #220]
	str	r9, [r5, #212]
	str	r0, [r5, #232]
	str	r1, [r5, #228]
	str	r2, [r5, #392]
	b	.L626
.L650:
	ldr	r3, .L660+24
	movw	r2, #3991
	ldr	r1, .L660+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L645
.L651:
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	ldr	r2, .L660+32
	ldr	r1, .L660+36
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L645
.L656:
	ldr	r3, [r6, r4, asl #2]
	movw	r0, #36152
	movt	r0, 4
	sub	r1, fp, #700
	add	r0, r3, r0
	bl	SYNTAX_ReceiveImage
	cmp	r0, #1
	mov	r7, r0
	bne	.L657
	ldr	r3, [r5, #216]
	ldr	r2, [fp, #-484]
	cmp	r3, r2
	bge	.L629
	ldr	r7, [fp, #-488]
	mov	r3, #3
	ldr	lr, [fp, #-668]
	mov	r9, #1
	cmp	r7, #0
	ldr	ip, [fp, #-672]
	ldr	r0, [fp, #-664]
	ldr	r1, [fp, #-660]
	movne	r7, #0
	ldr	r2, [fp, #-520]
	str	lr, [r5, #232]
	str	ip, [r5, #228]
	str	r0, [r5, #236]
	str	r1, [r5, #240]
	str	r2, [r5, #220]
	str	r3, [r5, #392]
	strne	r9, [r5, #212]
.L634:
	mov	r0, #12
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L635
	cmp	r7, #0
	bne	.L636
	b	.L638
.L648:
	ldr	r3, .L660+40
	movw	r2, #3987
	ldr	r1, .L660+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L645
.L657:
	ldr	r3, [r6, r4, asl #2]
	movw	r0, #36152
	movt	r0, 4
	add	r0, r3, r0
	bl	SYNTAX_ReturnImage
	ldr	r3, [r8, #16]
	mov	r0, #4
	blx	r3
	b	.L645
.L629:
	bgt	.L658
	cmp	r3, #0
	movw	r0, #36152
	ldr	r3, [r6, r4, asl #2]
	movt	r0, 4
	bne	.L632
	add	r0, r3, r0
	mvn	r7, #0
	bl	SYNTAX_ReturnImage
	ldr	r3, [r6, r4, asl #2]
	movw	r0, #36152
	mov	r1, r5
	movt	r0, 4
	add	r0, r3, r0
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r5, #216]
	ldr	r2, .L660+32
	mov	r0, #1
	ldr	r1, .L660+44
	mvn	r9, #1
	bl	dprint_vfmw
	b	.L634
.L632:
	add	r0, r3, r0
	mov	r1, r5
	bl	SYNTAX_ReleaseImage
	ldr	r3, [fp, #-488]
	ldr	r7, .L660+4
	cmp	r3, #0
	beq	.L659
	ldr	r3, [r5, #216]
	mov	r0, #1
	ldr	r2, .L660+32
	ldr	r1, .L660+48
	bl	dprint_vfmw
	sub	r1, fp, #700
	ldr	r3, [r8, #52]
	mov	r2, #664
	mov	r0, r5
	blx	r3
	ldr	r3, [fp, #-668]
	ldr	r1, [fp, #-672]
	mvn	r0, #0
	mov	r2, #3
	str	r0, [r5, #220]
	str	r3, [r5, #232]
	mov	r3, #1
	str	r1, [r5, #228]
	str	r2, [r5, #392]
	str	r3, [r5, #212]
	b	.L626
.L649:
	ldr	r3, .L660+52
	movw	r2, #3988
	ldr	r1, .L660+28
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L645
.L658:
	ldr	r3, [r6, r4, asl #2]
	movw	r0, #36152
	movt	r0, 4
	mvn	r7, #0
	add	r0, r3, r0
	mvn	r9, #1
	bl	SYNTAX_ReturnImage
	ldr	r3, [r6, r4, asl #2]
	movw	r0, #36152
	mov	r1, r5
	movt	r0, 4
	add	r0, r3, r0
	bl	SYNTAX_ReleaseImage
	ldr	ip, [fp, #-484]
	ldr	r3, [r5, #216]
	mov	r0, #1
	ldr	r2, .L660+32
	ldr	r1, .L660+56
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L634
.L659:
	ldr	r3, [r7, r4, asl #2]
	movw	r0, #36152
	sub	r1, fp, #700
	movt	r0, 4
	add	r0, r3, r0
	mvn	r7, #0
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r5, #216]
	ldr	r2, .L660+32
	mov	r0, #1
	ldr	r1, .L660+48
	mvn	r9, #1
	bl	dprint_vfmw
	b	.L634
.L661:
	.align	2
.L660:
	.word	.LC85
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	g_TraceImgPeriod
	.word	.LANCHOR1+184
	.word	.LC86
	.word	.LC1
	.word	.LANCHOR1+164
	.word	.LC87
	.word	.LC57
	.word	.LC89
	.word	.LC90
	.word	.LC2
	.word	.LC88
	UNWIND(.fnend)
	.size	VCTRL_GetChanImage, .-VCTRL_GetChanImage
	.align	2
	.global	VCTRL_ReleaseChanImage
	.type	VCTRL_ReleaseChanImage, %function
VCTRL_ReleaseChanImage:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 664
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #668)
	sub	sp, sp, #668
	cmp	r0, #31
	mov	r4, r0
	mov	r7, r1
	bhi	.L683
	ldr	r8, .L691
	ldr	r0, [r8, r0, asl #2]
	cmp	r0, #0
	beq	.L684
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L685
	cmp	r1, #0
	beq	.L686
	ldr	r6, .L691+4
	mov	r2, r4
	ldr	r3, [r1, #180]
	mov	r0, #2
	ldr	r1, .L691+8
	bl	dprint_vfmw
	ldr	r3, [r6, #12]
	mov	r0, #4
	blx	r3
	ldr	r0, [r8, r4, asl #2]
	cmp	r0, #0
	movweq	r2, #4193
	ldreq	r1, .L691+12
	beq	.L682
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L687
	ldr	r1, [r7, #28]
	mov	r0, r4
	bl	VCTRL_TryToRelSpecialFrm
	subs	r5, r0, #0
	beq	.L688
	ldr	r3, [r8, r4, asl #2]
	movw	r0, #36152
	movt	r0, 4
	mov	r1, r7
	add	r0, r3, r0
	bl	SYNTAX_ReleaseImage
	ldr	r3, [r7, #220]
	cmn	r3, #1
	mov	r5, r0
	beq	.L671
	ldr	r2, [r8, r4, asl #2]
	movw	r0, #36152
	movt	r0, 4
	sub	r1, fp, #700
	add	r0, r2, r0
	str	r3, [fp, #-520]
	bl	SYNTAX_ReleaseImage
	mov	r5, r0
.L671:
	mov	r0, #13
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L689
.L673:
	subs	r4, r5, #1
	mvnne	r4, #0
	cmp	r4, #0
	bne	.L690
.L675:
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
.L664:
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L688:
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
	movw	r2, #4214
	ldr	r1, .L691+16
	mov	r0, r5
	bl	dprint_vfmw
	mov	r4, r5
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L690:
	ldr	r2, .L691+20
	mov	r0, #0
	ldr	r1, .L691+24
	bl	dprint_vfmw
	b	.L675
.L689:
	ldr	r3, [r6]
	blx	r3
	ldr	r3, .L691+28
	ldr	r1, .L691+32
	add	r3, r3, r4, lsl #2
	ldr	r2, [r3, #-3180]
	ldr	r1, [r1]
	rsb	r2, r2, r0
	mov	ip, r0
	cmp	r2, r1
	bls	.L673
	mov	r2, r4, asl #24
	movw	r1, #4248
	add	r2, r2, #851968
	ldr	r0, .L691+36
	cmp	r5, #1
	addeq	r2, r2, #1
	str	ip, [r3, #-3180]
	bl	DBG_AddTrace
	b	.L673
.L687:
	ldr	r1, .L691+40
	movw	r2, #4202
	mov	r0, #0
.L682:
	bl	dprint_vfmw
	ldr	r3, [r6, #16]
	mov	r0, #4
	mvn	r4, #0
	blx	r3
	b	.L664
.L685:
	ldr	r3, .L691+44
	movw	r2, #4185
	ldr	r1, .L691+48
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r4, #0
	b	.L664
.L683:
	ldr	r3, .L691+52
	movw	r2, #4183
	ldr	r1, .L691+48
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r4, #0
	b	.L664
.L686:
	mov	r0, r1
	ldr	r3, .L691+56
	movw	r2, #4186
	ldr	r1, .L691+48
	bl	dprint_vfmw
	mvn	r4, #0
	b	.L664
.L684:
	ldr	r3, .L691+60
	movw	r2, #4184
	ldr	r1, .L691+48
	mvn	r4, #0
	bl	dprint_vfmw
	b	.L664
.L692:
	.align	2
.L691:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC92
	.word	.LC93
	.word	.LC95
	.word	.LANCHOR1+228
	.word	.LC96
	.word	.LANCHOR3
	.word	g_TraceImgPeriod
	.word	.LANCHOR1+204
	.word	.LC94
	.word	.LC86
	.word	.LC1
	.word	.LC57
	.word	.LC91
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_ReleaseChanImage, .-VCTRL_ReleaseChanImage
	.align	2
	.global	VCTRL_GetVidStd
	.type	VCTRL_GetVidStd, %function
VCTRL_GetVidStd:
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
	bhi	.L694
	ldr	r3, .L698
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L694
	ldr	r2, [r3, #4]
	cmp	r2, #1
	beq	.L697
	mov	r3, r0
	movw	r2, #4281
	ldr	r1, .L698+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #21
	ldmfd	sp, {fp, sp, pc}
.L694:
	movw	r2, #4274
	ldr	r1, .L698+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #21
	ldmfd	sp, {fp, sp, pc}
.L697:
	ldr	r0, [r3, #544]
	ldmfd	sp, {fp, sp, pc}
.L699:
	.align	2
.L698:
	.word	.LANCHOR0
	.word	.LC98
	.word	.LC97
	UNWIND(.fnend)
	.size	VCTRL_GetVidStd, .-VCTRL_GetVidStd
	.align	2
	.global	VCTRL_GetHDRConfigInfo
	.type	VCTRL_GetHDRConfigInfo, %function
VCTRL_GetHDRConfigInfo:
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
	ldr	r3, .L701
	ldr	r2, [r3, r0, asl #2]
	ldrb	r2, [r2, #44]	@ zero_extendqisi2
	strb	r2, [r1, #65]
	ldr	r2, [r3, r0, asl #2]
	ldrb	r2, [r2, #46]	@ zero_extendqisi2
	strb	r2, [r1, #66]
	ldr	r2, [r3, r0, asl #2]
	ldr	r2, [r2, #172]
	str	r2, [r1, #76]
	ldr	r2, [r3, r0, asl #2]
	ldr	r2, [r2, #176]
	str	r2, [r1, #68]
	ldr	r3, [r3, r0, asl #2]
	ldr	r3, [r3, #180]
	str	r3, [r1, #72]
	ldmfd	sp, {fp, sp, pc}
.L702:
	.align	2
.L701:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetHDRConfigInfo, .-VCTRL_GetHDRConfigInfo
	.align	2
	.global	VCTRL_GetDecParam
	.type	VCTRL_GetDecParam, %function
VCTRL_GetDecParam:
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
	bhi	.L724
	ldr	r3, .L727
	ldr	r5, [r3, r0, asl #2]
	cmp	r5, #0
	moveq	r3, r5
	beq	.L704
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L726
.L724:
	mov	r3, #0
.L704:
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L726:
	ldr	r3, [r5, #8]
	cmp	r3, #1
	bne	.L724
	ldr	r3, [r5, #544]
	cmp	r3, #17
	ldrls	pc, [pc, r3, asl #2]
	b	.L705
.L707:
	.word	.L706
	.word	.L715
	.word	.L709
	.word	.L715
	.word	.L705
	.word	.L715
	.word	.L712
	.word	.L705
	.word	.L715
	.word	.L715
	.word	.L715
	.word	.L715
	.word	.L715
	.word	.L715
	.word	.L705
	.word	.L717
	.word	.L718
	.word	.L715
.L715:
	add	r3, r5, #294912
	ldr	r4, [r3, #3396]
.L720:
	cmp	r4, #0
	moveq	r3, r4
	beq	.L704
	ldr	r3, .L727+4
	ldr	r3, [r3]
	blx	r3
	mov	r3, r4
	str	r0, [r5, #40]
	mov	r0, r3
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L717:
	add	r3, r5, #294912
	ldr	r4, [r3, #3620]
	b	.L720
.L709:
	add	r3, r5, #299008
	ldr	r4, [r3, #332]
	b	.L720
.L718:
	add	r3, r5, #299008
	ldr	r4, [r3, #1624]
	b	.L720
.L706:
	add	r3, r5, #294912
	ldr	r4, [r3, #3752]
	b	.L720
.L712:
	add	r3, r5, #294912
	ldr	r4, [r3, #3408]
	b	.L720
.L705:
	ldr	r2, .L727+8
	mov	r0, #0
	ldr	r1, .L727+12
	bl	dprint_vfmw
	mov	r3, #0
	b	.L704
.L728:
	.align	2
.L727:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+252
	.word	.LC99
	UNWIND(.fnend)
	.size	VCTRL_GetDecParam, .-VCTRL_GetDecParam
	.align	2
	.global	VCTRL_IsSedOnlyMode
	.type	VCTRL_IsSedOnlyMode, %function
VCTRL_IsSedOnlyMode:
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
	subs	r0, r1, #0
	beq	.L731
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L731:
	ldr	r1, .L732
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L733:
	.align	2
.L732:
	.word	.LC100
	UNWIND(.fnend)
	.size	VCTRL_IsSedOnlyMode, .-VCTRL_IsSedOnlyMode
	.align	2
	.global	VCTRL_ChanDecparamInValidFlag
	.type	VCTRL_ChanDecparamInValidFlag, %function
VCTRL_ChanDecparamInValidFlag:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	cmp	r0, #31
	mov	r2, r0
	bhi	.L735
	ldr	r5, .L746
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L735
	ldr	r1, [r3, #4]
	cmp	r1, #1
	bne	.L738
	ldr	r6, [r3, #8]
	cmp	r6, #1
	beq	.L739
.L738:
	ldr	r1, .L746+4
	mov	r0, #22
	mov	r4, #0
	bl	dprint_vfmw
.L737:
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L735:
	mov	r3, r2
	ldr	r1, .L746+8
	movw	r2, #4468
	mov	r0, #22
	bl	dprint_vfmw
	mov	r4, #0
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L739:
	str	r0, [fp, #-40]
	bl	VCTRL_GetDecParam
	ldr	r2, [fp, #-40]
	subs	r7, r0, #0
	beq	.L744
	ldr	r2, [r5, r2, asl #2]
	mov	r3, #0
	mov	r4, r3
	str	r3, [r2, #388]
	str	r3, [r2, #392]
	b	.L737
.L744:
	ldr	r8, [r5, r2, asl #2]
	ldr	r4, [r8, #388]
	cmp	r4, #0
	beq	.L745
	ldr	r3, .L746+12
	str	r2, [fp, #-40]
	ldr	r3, [r3]
	blx	r3
	ldr	r2, [fp, #-40]
	ldr	r3, [r5, r2, asl #2]
	ldr	r2, [r3, #392]
	cmp	r0, r2
	bls	.L742
	rsb	r0, r2, r0
	cmp	r0, #40
	movls	r4, r7
	bls	.L737
.L742:
	str	r7, [r3, #388]
	mov	r4, r6
	str	r7, [r3, #392]
	b	.L737
.L745:
	ldr	r3, .L746+12
	str	r6, [r8, #388]
	ldr	r3, [r3]
	blx	r3
	str	r0, [r8, #392]
	b	.L737
.L747:
	.align	2
.L746:
	.word	.LANCHOR0
	.word	.LC102
	.word	.LC101
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_ChanDecparamInValidFlag, .-VCTRL_ChanDecparamInValidFlag
	.align	2
	.global	VCTRL_ClearDecparam
	.type	VCTRL_ClearDecparam, %function
VCTRL_ClearDecparam:
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
	ldr	r3, .L764
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #544]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L748
.L751:
	.word	.L750
	.word	.L760
	.word	.L753
	.word	.L760
	.word	.L748
	.word	.L760
	.word	.L756
	.word	.L748
	.word	.L760
	.word	.L760
	.word	.L760
	.word	.L760
	.word	.L760
	.word	.L760
	.word	.L748
	.word	.L761
	.word	.L762
	.word	.L760
.L760:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #3396]
	ldmfd	sp, {fp, sp, pc}
.L761:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #3620]
.L748:
	ldmfd	sp, {fp, sp, pc}
.L756:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #3408]
	ldmfd	sp, {fp, sp, pc}
.L750:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #3752]
	ldmfd	sp, {fp, sp, pc}
.L762:
	add	r3, r3, #299008
	mov	r2, #0
	str	r2, [r3, #1624]
	ldmfd	sp, {fp, sp, pc}
.L753:
	add	r3, r3, #299008
	mov	r2, #0
	str	r2, [r3, #332]
	ldmfd	sp, {fp, sp, pc}
.L765:
	.align	2
.L764:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_ClearDecparam, .-VCTRL_ClearDecparam
	.align	2
	.global	VCTRL_VdmProcSedOnly
	.type	VCTRL_VdmProcSedOnly, %function
VCTRL_VdmProcSedOnly:
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
	mov	r3, r0
	movwhi	r2, #4885
	ldrhi	r3, .L772
	bhi	.L770
	ldr	r2, .L772+4
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	beq	.L771
	ldr	r3, [r3, #8]
	cmp	r3, #1
	beq	.L769
	ldr	r3, .L772+8
	movw	r2, #4887
.L770:
	ldr	r1, .L772+12
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L769:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_GetDecParam
.L771:
	mov	r0, r3
	movw	r2, #4886
	ldr	r3, .L772+16
	ldr	r1, .L772+12
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L773:
	.align	2
.L772:
	.word	.LC103
	.word	.LANCHOR0
	.word	.LC104
	.word	.LC1
	.word	.LC86
	UNWIND(.fnend)
	.size	VCTRL_VdmProcSedOnly, .-VCTRL_VdmProcSedOnly
	.align	2
	.global	VCTRL_FlushDecoder
	.type	VCTRL_FlushDecoder, %function
VCTRL_FlushDecoder:
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
	ldr	r4, .L804
	mov	r5, r0
	ldr	r0, [r4, r0, asl #2]
	cmp	r0, #0
	beq	.L801
	add	r0, r0, #294912
	ldr	r2, [r0, #3384]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L794
.L778:
	.word	.L777
	.word	.L779
	.word	.L780
	.word	.L781
	.word	.L794
	.word	.L782
	.word	.L783
	.word	.L794
	.word	.L784
	.word	.L785
	.word	.L786
	.word	.L786
	.word	.L786
	.word	.L787
	.word	.L794
	.word	.L788
	.word	.L789
	.word	.L790
.L790:
	add	r0, r0, #3392
	bl	VP9DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L777:
	add	r0, r0, #3392
	bl	H264_FlushDecoder
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	ldr	r0, [r4, r5, asl #2]
	add	r0, r0, #294912
	add	r0, r0, #3392
	bl	FlushDPB
	cmp	r0, #0
	bne	.L802
.L794:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L780:
	add	r0, r0, #3392
	bl	MPEG4DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L781:
	add	r0, r0, #3392
	bl	MPEG2DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L779:
	add	r0, r0, #3392
	bl	VC1DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L782:
	add	r0, r0, #3392
	bl	DIVX3DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L783:
	add	r0, r0, #3392
	bl	AVSDEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L784:
	add	r0, r0, #3392
	bl	REAL8DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L785:
	add	r0, r0, #3392
	bl	REAL9DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L786:
	add	r0, r0, #3392
	bl	VP6DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L787:
	add	r0, r0, #3392
	bl	VP8DEC_GetRemainImg
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L788:
	add	r0, r0, #3392
	bl	MVC_FlushDecoder
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	ldr	r0, [r4, r5, asl #2]
	mvn	r1, #0
	add	r0, r0, #294912
	add	r0, r0, #3392
	bl	MVC_FlushDPB
	cmp	r0, #0
	beq	.L794
	movw	r3, #4976
	ldr	r2, .L804+4
	ldr	r1, .L804+8
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L789:
	add	r0, r0, #3392
	bl	HEVC_FlushOutputFrmFromDPB
	cmp	r0, #0
	bne	.L803
.L792:
	ldr	r1, .L804+12
	mov	r0, #32
	bl	dprint_vfmw
	bl	VDMDRV_WakeUpVdm
	bl	VDMDRV_WakeUpVdm
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L803:
	movw	r2, #4953
	ldr	r1, .L804+16
	mov	r0, #0
	bl	dprint_vfmw
	b	.L792
.L802:
	movw	r2, #4943
	ldr	r1, .L804+16
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L801:
	ldr	r3, .L804+20
	movw	r2, #4917
	ldr	r1, .L804+24
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L805:
	.align	2
.L804:
	.word	.LANCHOR0
	.word	.LANCHOR1+272
	.word	.LC107
	.word	.LC106
	.word	.LC105
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_FlushDecoder, .-VCTRL_FlushDecoder
	.align	2
	.global	VCTRL_GetImageBuffer
	.type	VCTRL_GetImageBuffer, %function
VCTRL_GetImageBuffer:
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
	bhi	.L829
	ldr	r3, .L832
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L830
	ldr	r0, [r3, #8]
	cmp	r0, #1
	bne	.L831
	ldr	r2, [r3, #544]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L825
.L812:
	.word	.L811
	.word	.L813
	.word	.L814
	.word	.L815
	.word	.L825
	.word	.L816
	.word	.L817
	.word	.L825
	.word	.L818
	.word	.L819
	.word	.L820
	.word	.L820
	.word	.L820
	.word	.L821
	.word	.L825
	.word	.L822
	.word	.L823
	.word	.L824
.L824:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP9DEC_GetImageBuffer
.L811:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageBuffer
.L813:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_GetImageBuffer
.L814:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageBuffer
.L815:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_GetImageBuffer
.L816:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_GetImageBuffer
.L817:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_GetImageBuffer
.L818:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_GetImageBuffer
.L819:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_GetImageBuffer
.L820:
	ldr	r2, .L832+4
	ldr	r2, [r2, #-3312]
	tst	r2, #1
	ldmeqfd	sp, {fp, sp, pc}
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_GetImageBuffer
.L821:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_GetImageBuffer
.L822:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_GetImageBuffer
.L823:
	add	r0, r3, #294912
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageBuffer
.L825:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L831:
	ldr	r3, .L832+8
	movw	r2, #5046
	ldr	r1, .L832+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L829:
	ldr	r3, .L832+16
	movw	r2, #5044
	ldr	r1, .L832+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L830:
	mov	r0, r3
	movw	r2, #5045
	ldr	r3, .L832+20
	ldr	r1, .L832+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L833:
	.align	2
.L832:
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	.LC104
	.word	.LC1
	.word	.LC103
	.word	.LC86
	UNWIND(.fnend)
	.size	VCTRL_GetImageBuffer, .-VCTRL_GetImageBuffer
	.align	2
	.global	VCTRL_ConfigFFFBSpeed
	.type	VCTRL_ConfigFFFBSpeed, %function
VCTRL_ConfigFFFBSpeed:
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
	bhi	.L840
	ldr	r3, .L844
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L841
	ldr	r2, [r3, #4]
	cmp	r2, #1
	bne	.L842
	cmp	r1, #0
	beq	.L843
	ldr	r2, [r1]
	mov	r0, #0
	str	r2, [r3, #1156]
	ldmfd	sp, {fp, sp, pc}
.L842:
	ldr	r3, .L844+4
	movw	r2, #5169
	ldr	r1, .L844+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L840:
	ldr	r3, .L844+12
	movw	r2, #5167
	ldr	r1, .L844+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L841:
	mov	r0, r3
	movw	r2, #5168
	ldr	r3, .L844+16
	ldr	r1, .L844+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L843:
	mov	r0, r1
	ldr	r3, .L844+20
	movw	r2, #5170
	ldr	r1, .L844+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L845:
	.align	2
.L844:
	.word	.LANCHOR0
	.word	.LC109
	.word	.LC1
	.word	.LC57
	.word	.LC108
	.word	.LC110
	UNWIND(.fnend)
	.size	VCTRL_ConfigFFFBSpeed, .-VCTRL_ConfigFFFBSpeed
	.align	2
	.global	VCTRL_ConfigPVRInfo
	.type	VCTRL_ConfigPVRInfo, %function
VCTRL_ConfigPVRInfo:
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
	bhi	.L852
	ldr	r3, .L856
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L853
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L854
	cmp	r1, #0
	beq	.L855
	ldr	r3, .L856+4
	add	r0, r0, #1184
	mov	r2, #20
	add	r0, r0, #4
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L854:
	ldr	r3, .L856+8
	movw	r2, #5182
	ldr	r1, .L856+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L852:
	ldr	r3, .L856+16
	movw	r2, #5180
	ldr	r1, .L856+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L855:
	mov	r0, r1
	ldr	r3, .L856+20
	movw	r2, #5183
	ldr	r1, .L856+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L853:
	ldr	r3, .L856+24
	movw	r2, #5181
	ldr	r1, .L856+12
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L857:
	.align	2
.L856:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC109
	.word	.LC1
	.word	.LC57
	.word	.LC110
	.word	.LC108
	UNWIND(.fnend)
	.size	VCTRL_ConfigPVRInfo, .-VCTRL_ConfigPVRInfo
	.align	2
	.global	VCTRL_IsChanDecable
	.type	VCTRL_IsChanDecable, %function
VCTRL_IsChanDecable:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r5, .L864
	mov	r4, r0
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L861
	sub	r1, fp, #44
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L861
	ldr	r3, [fp, #-36]
	cmp	r3, #16
	bgt	.L862
	ldr	r3, [fp, #-28]
	cmp	r3, #524288
	ble	.L861
.L862:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	subs	r0, r0, #1
	mvnne	r0, #0
	cmp	r0, #0
	bne	.L860
	ldr	r3, .L864+4
	ldr	r3, [r3]
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	ldr	r3, [r3, #40]
	rsb	r0, r3, r0
	cmp	r0, #50
	movls	r0, #0
	mvnhi	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L861:
	mvn	r0, #0
.L860:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L865:
	.align	2
.L864:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_IsChanDecable, .-VCTRL_IsChanDecable
	.align	2
	.global	VCTRL_IsChanSegEnough
	.type	VCTRL_IsChanSegEnough, %function
VCTRL_IsChanSegEnough:
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
	ldr	r3, .L867
	ldr	r3, [r3, r0, asl #2]
	ldr	r0, [r3, #376]
	subs	r0, r0, #1
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L868:
	.align	2
.L867:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_IsChanSegEnough, .-VCTRL_IsChanSegEnough
	.align	2
	.global	VCTRL_IsChanActive
	.type	VCTRL_IsChanActive, %function
VCTRL_IsChanActive:
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
	bhi	.L875
	ldr	r3, .L876
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L875
	ldr	r2, [r3, #4]
	cmp	r2, #0
	beq	.L875
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L875
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L875
	ldr	r0, [r3, #544]
	cmp	r0, #21
	movne	r0, #0
	mvneq	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L875:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L877:
	.align	2
.L876:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_IsChanActive, .-VCTRL_IsChanActive
	.align	2
	.global	USERDEC_Init
	.type	USERDEC_Init, %function
USERDEC_Init:
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
	ldr	r3, .L895
	mov	r4, r0
	ldr	r6, [r0, #352]
	mov	r2, #368
	mov	r5, r1
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	str	r6, [r4, #352]
	add	r0, r4, #8
	bl	ResetVoQueue
	ldr	ip, .L895+4
	mov	r2, #0
	str	r5, [r4]
	b	.L882
.L879:
	add	r2, r2, #1
	cmp	r2, #32
	beq	.L894
.L882:
	ldr	r1, [ip], #4
	cmp	r1, #0
	add	r3, r1, #294912
	add	r3, r3, #3392
	beq	.L879
	cmp	r4, r3
	bne	.L879
	cmn	r2, #1
	str	r2, [r4, #360]
	beq	.L880
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L894:
	mvn	r3, #0
	str	r3, [r4, #360]
.L880:
	ldr	r1, .L895+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L896:
	.align	2
.L895:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC111
	UNWIND(.fnend)
	.size	USERDEC_Init, .-USERDEC_Init
	.align	2
	.global	USERDEC_RecycleImage
	.type	USERDEC_RecycleImage, %function
USERDEC_RecycleImage:
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
	subs	r4, r0, #0
	mov	r5, r1
	beq	.L899
	mov	r2, #0
	ldr	r0, [r4, #360]
	bl	FSP_SetDisplay
	mov	r1, r5
	ldr	r0, [r4, #360]
	bl	FSP_GetFsImagePtr
	subs	r6, r0, #0
	beq	.L900
	add	r5, r6, #608
	ldr	r0, [r4, #360]
	ldr	r1, [r6, #600]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	strd	r8, [r5, #-8]
	ldr	r0, [r4, #360]
	ldr	r1, [r6, #608]
	bl	FreeUsdByDec
	strd	r8, [r5]
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L900:
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L899:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	USERDEC_RecycleImage, .-USERDEC_RecycleImage
	.align	2
	.global	VCTRL_GetUsrdecFrame
	.type	VCTRL_GetUsrdecFrame, %function
VCTRL_GetUsrdecFrame:
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
	ldr	r7, .L923
	mov	r6, r0
	mov	r5, r1
	ldr	r3, [r7, r0, asl #2]
	cmp	r3, #0
	beq	.L918
	ldr	r2, [r3, #544]
	cmp	r2, #20
	bne	.L919
	ldr	r3, [r3, #464]
	cmp	r3, #2
	ble	.L920
	mov	r1, #1
	bl	FSP_NewLogicFs
	subs	r8, r0, #0
	blt	.L921
	mov	r1, r8
	mov	r0, r6
	bl	FSP_GetLogicFs
	mov	r2, r8
	ldr	r1, .L923+4
	mov	r4, r0
	mov	r0, #18
	bl	dprint_vfmw
	cmp	r4, #0
	beq	.L922
	ldr	r2, [r4, #680]
	cmp	r2, #0
	beq	.L908
	ldr	r3, [r4, #684]
	cmp	r3, #0
	beq	.L908
	ldr	r1, [r4, #688]
	cmp	r1, #0
	beq	.L908
	ldr	ip, [r1, #16]
	mov	r0, #18
	ldr	r2, [r2, #16]
	ldr	r3, [r3, #16]
	ldr	r1, .L923+8
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #680]
	ldr	r3, [r3, #16]
	str	r3, [r5, #40]
	ldr	r3, [r7, r6, asl #2]
	ldr	r3, [r3, #460]
	str	r3, [r5, #20]
	ldr	r3, [r4, #680]
	ldr	r3, [r3, #28]
	str	r3, [r5, #24]
	ldr	r3, [r4, #680]
	ldr	r0, [r3, #28]
	bl	MEM_Phy2Vir
	mov	r3, #0
	mov	r2, r3
	str	r3, [r5, #36]
	str	r0, [r5, #32]
.L903:
	mov	r0, r2
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L919:
	ldr	r1, .L923+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L903
.L920:
	ldr	r1, .L923+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L903
.L908:
	ldr	r1, .L923+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L903
.L921:
	ldr	r1, .L923+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L903
.L918:
	mov	r0, r3
	movw	r2, #5452
	ldr	r3, .L923+28
	ldr	r1, .L923+32
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L903
.L922:
	movw	r2, #5482
	ldr	r1, .L923+36
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r2, #0
	b	.L903
.L924:
	.align	2
.L923:
	.word	.LANCHOR0
	.word	.LC115
	.word	.LC117
	.word	.LC112
	.word	.LC113
	.word	.LC118
	.word	.LC114
	.word	.LC2
	.word	.LC1
	.word	.LC116
	UNWIND(.fnend)
	.size	VCTRL_GetUsrdecFrame, .-VCTRL_GetUsrdecFrame
	.align	2
	.global	InitSyntaxCtx
	.type	InitSyntaxCtx, %function
InitSyntaxCtx:
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
	ldr	r3, .L944
	ldr	r1, [r3, r0, asl #2]
	cmp	r1, #0
	beq	.L943
	ldr	r3, [r1, #544]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L925
.L929:
	.word	.L928
	.word	.L930
	.word	.L931
	.word	.L932
	.word	.L925
	.word	.L933
	.word	.L934
	.word	.L925
	.word	.L935
	.word	.L936
	.word	.L937
	.word	.L937
	.word	.L937
	.word	.L938
	.word	.L925
	.word	.L939
	.word	.L940
	.word	.L941
	.word	.L925
	.word	.L925
	.word	.L942
.L942:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	USERDEC_Init
.L928:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_Init
.L930:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_Init
.L931:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_Init
.L932:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_Init
.L933:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_Init
.L934:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_Init
.L935:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_Init
.L936:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_Init
.L937:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_Init
.L938:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_Init
.L939:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_Init
.L940:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_Init
.L941:
	add	r0, r1, #294912
	add	r1, r1, #552
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP9DEC_Init
.L925:
	ldmfd	sp, {fp, sp, pc}
.L943:
	mov	r0, r1
	ldr	r3, .L944+4
	movw	r2, #5537
	ldr	r1, .L944+8
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L945:
	.align	2
.L944:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	InitSyntaxCtx, .-InitSyntaxCtx
	.align	2
	.global	VCTRL_VarifyOption
	.type	VCTRL_VarifyOption, %function
VCTRL_VarifyOption:
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
	ldr	r3, [r0, #36]
	cmp	r3, #0
	blt	.L947
	ldr	r3, [r0, #12]
	cmp	r3, #31
	ble	.L947
	ldr	r3, [r0, #16]
	cmp	r3, #31
	ble	.L947
	ldr	r3, [r0, #56]
	cmp	r3, #262144
	blt	.L947
	ldr	r3, [r0, #44]
	cmp	r3, #1
	beq	.L953
	cmp	r3, #2
	bne	.L951
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ble	.L947
	ldr	r3, [r0, #24]
	cmp	r3, #0
	ble	.L947
.L952:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	ble	.L947
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bgt	.L951
.L947:
	ldr	r1, .L954
	mov	r0, #32
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L951:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L953:
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bgt	.L952
	b	.L947
.L955:
	.align	2
.L954:
	.word	.LC119
	UNWIND(.fnend)
	.size	VCTRL_VarifyOption, .-VCTRL_VarifyOption
	.align	2
	.global	VCTRL_GetMemSize_onDecode
	.type	VCTRL_GetMemSize_onDecode, %function
VCTRL_GetMemSize_onDecode:
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
	UNWIND(.pad #24)
	sub	sp, sp, #24
	ldr	r3, [r1, #40]
	mov	r4, r1
	mov	r6, r0
	cmp	r3, #0
	mov	r5, r2
	ldr	r1, [r1, #36]
	moveq	r0, #1
	beq	.L958
	add	r0, r1, #1
	cmp	r0, #17
	movge	r0, #17
.L958:
	ldr	r3, .L973
	sub	r7, r6, #27
	cmp	r7, #6
	ldr	r2, [r4, #60]
	ldr	ip, [r3, #64]
	mvncc	lr, #1
	mvncs	lr, #0
	cmp	ip, #0
	beq	.L962
	ldr	r9, .L973+4
	add	r1, r2, r1
	ldr	r3, [r4, #16]
	add	r1, r1, #2
	ldr	r2, [r4, #12]
	mov	r8, #0
	str	r1, [sp, #4]
	mvn	r1, #-2147483648
	str	r0, [sp]
	mov	r0, #1
	str	lr, [sp, #12]
	str	r9, [sp, #16]
	str	r8, [sp, #8]
	blx	ip
	cmp	r0, r8
	bne	.L962
	ldr	r2, .L973+8
	cmp	r6, #26
	movne	r1, #16640
	moveq	r1, #640
	ldr	r2, [r2, #-3048]
	movtne	r1, 12
	movteq	r1, 178
	add	r0, r2, #16
	str	r0, [r5]
	ldr	r0, [r4, #176]
	cmp	r0, #1
	addne	r2, r2, #307200
	addne	r2, r2, #2576
	ldreq	r2, [r4, #56]
	strne	r2, [r5]
	ldrne	r2, [r4, #56]
	addeq	r2, r2, #339968
	addeq	r2, r2, #2576
	str	r1, [r5, #8]
	addne	r2, r2, #32768
	str	r2, [r5, #4]
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L966
	ldr	r2, [r4, #20]
	movw	r0, #4060
	ldr	r8, [r4, #28]
	mov	r3, #4000
	ldr	lr, [r4, #32]
	mov	ip, #2208
	mul	r2, r0, r2
	mla	r3, r3, r8, r2
	mla	r3, ip, lr, r3
	cmp	r3, #0
	movcc	r3, #0
	cmp	r6, #26
	beq	.L971
.L966:
	cmp	r7, #5
	bls	.L972
.L967:
	mov	r0, #0
	add	r3, r3, r1
	str	r3, [r5, #8]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L972:
	movw	r2, #38076
	movt	r2, 19
	cmp	r3, r2
	movcc	r3, r2
	b	.L967
.L962:
	movw	r2, #5700
	ldr	r1, .L973+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L971:
	movw	r0, #3992
	mov	ip, #2240
	mla	r0, r0, r8, r2
	mla	r2, ip, lr, r0
	cmp	r3, r2
	movcc	r3, r2
	cmp	r7, #5
	bhi	.L967
	b	.L972
.L974:
	.align	2
.L973:
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR3-3052
	.word	.LANCHOR3
	.word	.LC120
	UNWIND(.fnend)
	.size	VCTRL_GetMemSize_onDecode, .-VCTRL_GetMemSize_onDecode
	.align	2
	.global	VCTRL_GetChanMemSize
	.type	VCTRL_GetChanMemSize, %function
VCTRL_GetChanMemSize:
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
	cmp	r3, #2
	mov	r5, r0
	mov	r4, r1
	mov	r6, r2
	beq	.L976
	ldr	r1, .L984
	ldr	r2, [r4, #36]
	ldr	r0, [r4, #60]
	ldr	r3, [r1, #-1684]
	ldr	lr, [r1, #-1680]
	add	r1, r2, r3
	cmp	r1, #16
	add	ip, r0, lr
	movge	r1, #16
	orrs	r7, r1, ip
	strpl	r1, [r4, #36]
	strpl	ip, [r4, #60]
	bmi	.L983
.L976:
	mov	r0, r4
	bl	VCTRL_VarifyOption
	cmp	r0, #0
	bne	.L978
	mov	r2, r6
	mov	r1, r4
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_GetMemSize_onDecode
.L983:
	stmia	sp, {r0, lr}
	mov	r0, #32
	ldr	r1, .L984+4
	bl	dprint_vfmw
.L978:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L985:
	.align	2
.L984:
	.word	.LANCHOR3
	.word	.LC121
	UNWIND(.fnend)
	.size	VCTRL_GetChanMemSize, .-VCTRL_GetChanMemSize
	.align	2
	.global	CloseDrivers
	.type	CloseDrivers, %function
CloseDrivers:
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
	ldr	r5, [r0, #72]
	mov	r4, r0
	cmp	r5, #0
	beq	.L987
	ldr	r5, [r0, #88]
	adds	r5, r5, #0
	movne	r5, #1
.L987:
	ldr	r6, [r4, #16]
	ldr	r7, [r4, #8]
	cmp	r6, #0
	ldr	r8, [r4, #4]
	beq	.L988
	ldr	r3, .L1043
	ldr	r3, [r3, #60]
	cmp	r3, #0
	beq	.L989
	mov	r0, #0
	blx	r3
.L990:
	cmp	r5, #0
	beq	.L1032
.L991:
	ldr	r3, .L1043+4
	mov	r2, #24
	mov	r1, #0
	mov	r0, r4
	ldr	r3, [r3, #48]
	blx	r3
.L988:
	mov	r2, r6
	mov	r1, r8
	mov	r0, r7
	bl	MEM_DelMemRecord
	ldr	r6, [r4, #64]
	ldr	r7, [r4, #56]
	cmp	r6, #0
	ldr	r8, [r4, #52]
	beq	.L992
	ldr	r3, .L1043
	ldr	r3, [r3, #60]
	cmp	r3, #0
	beq	.L993
	mov	r0, #0
	blx	r3
.L994:
	cmp	r5, #0
	beq	.L1033
.L995:
	ldr	r3, .L1043+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #48
	ldr	r3, [r3, #48]
	blx	r3
.L992:
	mov	r2, r6
	mov	r1, r8
	mov	r0, r7
	bl	MEM_DelMemRecord
	ldr	r6, [r4, #40]
	ldr	r7, [r4, #32]
	cmp	r6, #0
	ldr	r8, [r4, #28]
	bne	.L1034
.L996:
	mov	r2, r6
	mov	r1, r8
	mov	r0, r7
	bl	MEM_DelMemRecord
	bl	SM_InstInit
	ldr	r5, [r4, #112]
	ldr	r6, [r4, #104]
	cmp	r5, #0
	ldr	r7, [r4, #100]
	bne	.L1035
.L999:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #184]
	ldr	r6, [r4, #176]
	cmp	r5, #0
	ldr	r7, [r4, #172]
	bne	.L1036
.L1000:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #160]
	ldr	r6, [r4, #152]
	cmp	r5, #0
	ldr	r7, [r4, #148]
	bne	.L1037
.L1001:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #136]
	ldr	r6, [r4, #128]
	cmp	r5, #0
	ldr	r7, [r4, #124]
	bne	.L1038
.L1002:
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r5, [r4, #208]
	ldr	r6, [r4, #200]
	cmp	r5, #0
	ldr	r7, [r4, #196]
	bne	.L1039
.L1003:
	ldr	r4, .L1043+8
	mov	r2, r5
	mov	r1, r7
	mov	r0, r6
	bl	MEM_DelMemRecord
	ldr	r3, [r4, #376]
	cmp	r3, #1
	beq	.L1040
	ldr	r3, [r4, #380]
	ldr	r5, .L1043+8
	cmp	r3, #1
	beq	.L1041
.L1005:
	ldr	r3, [r4, #384]
	ldr	r4, .L1043+8
	cmp	r3, #1
	beq	.L1042
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1034:
	mov	r0, #0
	bl	SM_CloseSCDDrv
	cmp	r5, #0
	beq	.L997
.L998:
	ldr	r3, .L1043+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, r2
	ldr	r3, [r3, #48]
	blx	r3
	b	.L996
.L1035:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1043+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #96
	ldr	r3, [r3, #48]
	blx	r3
	b	.L999
.L1039:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1043+4
	add	r0, r4, #192
	mov	r2, #24
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1003
.L1038:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1043+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #120
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1002
.L1037:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1043+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #144
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1001
.L1036:
	mov	r1, r7
	mov	r0, r6
	bl	MEM_UnmapRegisterAddr
	ldr	r3, .L1043+4
	mov	r2, #24
	mov	r1, #0
	add	r0, r4, #168
	ldr	r3, [r3, #48]
	blx	r3
	b	.L1000
.L989:
	mov	r0, r3
	movw	r2, #6090
	ldr	r1, .L1043+12
	bl	dprint_vfmw
	b	.L990
.L993:
	mov	r0, r3
	movw	r2, #6111
	ldr	r1, .L1043+12
	bl	dprint_vfmw
	b	.L994
.L1042:
	ldr	r3, .L1043+4
	mov	r0, #13
	ldr	r5, [r3, #192]
	bl	VFMW_GetString
	ldr	r2, .L1043+16
	mov	r1, r0
	mov	r0, #181
	blx	r5
	mov	r3, #0
	mov	r0, #0
	str	r3, [r4, #384]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1033:
	ldr	r1, [r4, #52]
	ldr	r0, [r4, #56]
	bl	MEM_ReleaseMemBlock
	b	.L995
.L1032:
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_ReleaseMemBlock
	b	.L991
.L1040:
	ldr	r3, .L1043+4
	mov	r0, #0
	ldr	r5, [r3, #192]
	bl	VFMW_GetString
	ldr	r2, .L1043+16
	mov	r1, r0
	mov	r0, #127
	blx	r5
	mov	r3, #0
	str	r3, [r4, #376]
	ldr	r3, [r4, #380]
	ldr	r5, .L1043+8
	cmp	r3, #1
	bne	.L1005
.L1041:
	ldr	r3, .L1043+4
	mov	r0, #4
	ldr	r6, [r3, #192]
	bl	VFMW_GetString
	ldr	r2, .L1043+16
	mov	r1, r0
	mov	r0, #136
	blx	r6
	mov	r3, #0
	str	r3, [r5, #380]
	b	.L1005
.L997:
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #32]
	bl	MEM_ReleaseMemBlock
	b	.L998
.L1044:
	.align	2
.L1043:
	.word	g_vdm_hal_fun_ptr
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC29
	.word	.LANCHOR3-1676
	UNWIND(.fnend)
	.size	CloseDrivers, .-CloseDrivers
	.align	2
	.global	OpenDrivers
	.type	OpenDrivers, %function
OpenDrivers:
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
	UNWIND(.pad #60)
	sub	sp, sp, #60
	add	r5, r0, #96
	mov	r4, r0
	mov	r0, #0
	mov	r1, #65536
	mov	r2, r5
	movt	r0, 63683
	bl	MEM_MapRegisterAddr
	subs	r6, r0, #0
	bne	.L1046
	ldr	r2, [r4, #112]
	add	r5, r4, #168
	ldr	r1, [r4, #100]
	ldr	r0, [r4, #104]
	bl	MEM_AddMemRecord
	mov	r0, #53248
	mov	r2, r5
	movt	r0, 63683
	mov	r1, #4096
	bl	MEM_MapRegisterAddr
	subs	r7, r0, #0
	beq	.L1074
	mov	r2, #53248
	ldr	r1, .L1079
	movt	r2, 63683
	mov	r0, r6
	bl	dprint_vfmw
	ldr	r3, .L1079+4
	mov	r1, r6
.L1066:
	mov	r0, r5
	mov	r2, #24
.L1065:
	ldr	r3, [r3, #48]
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
.L1049:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1074:
	ldr	r2, [r4, #184]
	add	r5, r4, #144
	ldr	r1, [r4, #172]
	ldr	r0, [r4, #176]
	bl	MEM_AddMemRecord
	mov	r0, #49152
	mov	r2, r5
	movt	r0, 63683
	mov	r1, #4096
	bl	MEM_MapRegisterAddr
	subs	r8, r0, #0
	bne	.L1050
	ldr	r6, .L1079+4
	ldr	r2, [r4, #160]
	ldr	r1, [r4, #148]
	ldr	r0, [r4, #152]
	bl	MEM_AddMemRecord
	mov	r0, #15
	ldr	r5, [r6, #68]
	bl	VFMW_GetString
	ldr	r7, .L1079+8
	mov	r3, r8
	mov	r1, #20
	mov	r2, r0
	sub	r0, fp, #84
	blx	r5
	ldr	r3, [r7, #48]
	cmp	r3, #0
	mvneq	r2, #0
	beq	.L1052
	blx	r3
	mov	r2, r0
.L1052:
	mov	r5, #0
	mov	r9, #3
	str	r5, [sp]
	mov	r1, r5
	mov	r3, r4
	str	r9, [r4, #20]
	sub	r0, fp, #84
	bl	MEM_AllocMemBlock
	subs	r8, r0, #0
	bne	.L1075
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	bl	MEM_AddMemRecord
	ldr	r3, [r6, #48]
	mov	r2, #20
	mov	r1, r8
	sub	r0, fp, #64
	ldr	r5, .L1079+4
	blx	r3
	ldr	r3, [r7, #56]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #16]
	cmp	r3, #0
	str	r8, [fp, #-56]
	str	r1, [fp, #-64]
	str	r2, [fp, #-60]
	beq	.L1055
	sub	r0, fp, #64
	blx	r3
	subs	r8, r0, #0
	bne	.L1055
	str	r9, [r4, #68]
	mov	r0, #16
	ldr	r7, [r5, #68]
	bl	VFMW_GetString
	add	r10, r4, #48
	mov	r3, r8
	mov	r1, #20
	mov	r6, #1
	mov	r2, r0
	sub	r0, fp, #84
	blx	r7
	mov	r3, r10
	str	r6, [sp]
	mov	r2, #16384
	mov	r1, r8
	sub	r0, fp, #84
	bl	MEM_AllocMemBlock
	subs	r7, r0, #0
	bne	.L1076
	add	r3, r4, #24
	ldr	r1, [r4, #52]
	ldr	r2, [r4, #64]
	ldr	r0, [r4, #56]
	mov	r8, r3
	str	r3, [fp, #-88]
	bl	MEM_AddMemRecord
	ldr	r2, .L1079+12
	mov	r0, r7
	ldr	r3, [r4, #56]
	str	r3, [r2, #1196]
	ldr	r3, [r4, #56]
	add	r3, r3, #5120
	str	r3, [r2, #1200]
	bl	VDMDRV_Init
	mov	r0, #17
	ldr	r10, [r5, #68]
	bl	VFMW_GetString
	mov	r3, r7
	mov	r1, #20
	mov	r2, r0
	sub	r0, fp, #84
	blx	r10
	str	r9, [r4, #44]
	sub	r0, fp, #84
	str	r7, [sp]
	mov	r3, r8
	mov	r2, #716800
	mov	r1, r7
	bl	MEM_AllocMemBlock
	subs	r9, r0, #0
	bne	.L1057
	ldr	r2, [r4, #40]
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #32]
	bl	MEM_AddMemRecord
	mov	r2, r9
	ldr	r1, [r4, #40]
	ldr	r0, [r4, #32]
	bl	SM_OpenSCDDrv
	subs	r10, r0, #0
	bne	.L1058
	bl	SM_InstInit
	mov	r0, r10
	ldr	r9, [r5, #188]
	bl	VFMW_GetString
	ldr	r7, .L1079+16
	mov	r2, #128
	ldr	r1, .L1079+20
	str	r7, [sp]
	mov	r3, r0
	mov	r0, #127
	blx	r9
	subs	r9, r0, #0
	bne	.L1077
	ldr	r8, .L1079+24
	mov	r0, #4
	ldr	r10, [r5, #188]
	str	r6, [r8, #376]
	bl	VFMW_GetString
	str	r7, [sp]
	mov	r2, #128
	ldr	r1, .L1079+28
	mov	r3, r0
	mov	r0, #136
	blx	r10
	subs	r10, r0, #0
	bne	.L1078
	mov	r0, #13
	ldr	r9, [r5, #188]
	str	r6, [r8, #380]
	bl	VFMW_GetString
	str	r7, [sp]
	mov	r2, #128
	ldr	r1, .L1079+32
	mov	r3, r0
	mov	r0, #181
	blx	r9
	cmp	r0, #0
	streq	r6, [r8, #384]
	beq	.L1049
	mov	r2, #181
.L1068:
	ldr	r1, .L1079+36
	mov	r0, r10
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r10
.L1067:
	ldr	r0, [fp, #-88]
.L1069:
	mov	r2, #24
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
	b	.L1049
.L1046:
	mov	r2, #0
	ldr	r1, .L1079
	movt	r2, 63683
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, .L1079+4
	mov	r0, r5
	mov	r2, #24
	mov	r1, #0
	b	.L1065
.L1050:
	mov	r2, #49152
	ldr	r1, .L1079
	movt	r2, 63683
	mov	r0, r7
	bl	dprint_vfmw
	ldr	r3, .L1079+4
	mov	r1, r7
	b	.L1066
.L1055:
	mov	r2, #0
	ldr	r1, .L1079+40
	mov	r0, r2
	bl	dprint_vfmw
	ldr	r3, [r6, #48]
	mov	r2, #24
	mov	r1, #0
.L1070:
	mov	r0, r4
	blx	r3
	mov	r0, r4
	bl	CloseDrivers
	mvn	r0, #0
	b	.L1049
.L1077:
	mov	r2, #127
	b	.L1068
.L1078:
	ldr	r1, .L1079+36
	mov	r2, #136
	mov	r0, r9
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r9
	b	.L1067
.L1058:
	ldr	r1, .L1079+44
	mov	r2, r9
	mov	r0, r9
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r9
	b	.L1067
.L1057:
	ldr	r1, .L1079+48
	mov	r2, r7
	mov	r0, r7
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r7
	b	.L1067
.L1075:
	mov	r2, r5
	ldr	r1, .L1079+52
	mov	r0, r5
	bl	dprint_vfmw
	ldr	r3, [r6, #48]
	mov	r1, r5
	mov	r2, #24
	b	.L1070
.L1076:
	ldr	r1, .L1079+56
	mov	r2, r8
	mov	r0, r8
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	mov	r1, r8
	mov	r0, r10
	b	.L1069
.L1080:
	.align	2
.L1079:
	.word	.LC122
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	g_HwMem
	.word	.LANCHOR3-1676
	.word	VCTRL_Isr_0
	.word	.LANCHOR0
	.word	VCTRL_Scd_Isr
	.word	VCTRL_MMU_ISR
	.word	.LC128
	.word	.LC124
	.word	.LC127
	.word	.LC126
	.word	.LC123
	.word	.LC125
	UNWIND(.fnend)
	.size	OpenDrivers, .-OpenDrivers
	.align	2
	.global	VCTRL_OpenVfmw
	.type	VCTRL_OpenVfmw, %function
VCTRL_OpenVfmw:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	ldr	r4, .L1116
	mov	r7, r0
	mov	r2, #8
	sub	r0, fp, #52
	mov	r1, #0
	ldr	r3, [r4, #48]
	blx	r3
	ldr	r3, .L1116+4
	ldr	r5, [r3, #128]
	cmp	r5, #0
	bne	.L1111
	mov	r1, #1024
	ldr	r3, [r4, #80]
	str	r5, [fp, #-56]
	ldr	r0, .L1116+8
	blx	r3
	ldr	r3, [r4, #96]
	ldr	r1, .L1116+12
	ldr	r0, .L1116+8
	blx	r3
	ldr	r6, .L1116+16
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1084
	ldr	r3, [r4, #92]
	sub	r0, fp, #56
	ldr	r1, .L1116+20
	blx	r3
	cmp	r0, #0
	beq	.L1103
	sub	r0, fp, #56
	ldr	r3, [r4, #92]
	ldr	r1, .L1116+24
	blx	r3
	cmp	r0, #0
	beq	.L1112
	mov	r2, r5
	ldr	r3, [r4, #84]
	mov	r1, r5
	blx	r3
	mov	r2, r0
	str	r0, [r6, #-1684]
.L1088:
	add	r3, r2, #4992
	movw	r1, #10000
	add	r3, r3, #8
	movw	r8, #5000
	cmp	r3, r1
	bhi	.L1089
	cmp	r2, r8
	movw	r3, #60536
.L1110:
	movt	r3, 65535
	movge	r2, r8
	cmp	r2, r3
	movlt	r2, r3
.L1085:
	str	r2, [r6, #-1684]
.L1087:
	mov	r8, #0
	ldr	r3, [r4, #80]
	mov	r1, #1024
	str	r8, [fp, #-56]
	ldr	r0, .L1116+8
	blx	r3
	ldr	r3, [r4, #96]
	ldr	r1, .L1116+28
	ldr	r0, .L1116+8
	blx	r3
	ldr	r10, .L1116
	ldr	r9, .L1116+16
	cmp	r0, r8
	str	r0, [fp, #-56]
	beq	.L1090
	ldr	r3, [r10, #92]
	sub	r0, fp, #56
	ldr	r1, .L1116+20
	blx	r3
	cmp	r0, r8
	beq	.L1091
	sub	r0, fp, #56
	ldr	r3, [r10, #92]
	ldr	r1, .L1116+24
	blx	r3
	cmp	r0, r8
	beq	.L1113
	mov	r2, r8
	ldr	r3, [r10, #84]
	mov	r1, r8
	blx	r3
	mov	r2, r0
	str	r0, [r9, #-1680]
.L1094:
	add	r3, r2, #4992
	movw	r1, #10000
	add	r3, r3, #8
	movw	r8, #5000
	cmp	r3, r1
	bhi	.L1095
	cmp	r2, r8
	movw	r3, #60536
	movt	r3, 65535
	movlt	r5, r2
	movge	r5, r8
	cmp	r5, r3
	movlt	r5, r3
.L1091:
	str	r5, [r6, #-1680]
.L1093:
	ldr	r5, [r6, #-648]
	mov	r3, #0
	ldr	r8, .L1116+16
	cmp	r5, r3
	str	r3, [fp, #-56]
	beq	.L1096
	ldr	r2, .L1116+32
	ubfx	r1, r5, #1, #1
	and	r0, r5, #1
	ubfx	r3, r5, #2, #1
	strb	r0, [r8, #-644]
	ubfx	r5, r5, #3, #1
	strb	r1, [r2, #76]
	strb	r3, [r8, #-643]
	strb	r5, [r8, #-642]
.L1097:
	ldr	r5, .L1116+4
	mov	r2, #264
	ldr	r3, [r4, #48]
	mov	r1, #0
	add	r0, r5, #128
	ldr	r8, .L1116
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #128
	mov	r1, #0
	mov	r0, r5
	blx	r3
	ldr	r2, .L1116+36
	sub	r0, fp, #52
	mov	r1, #134217728
	mov	r3, #75497472
	str	r1, [fp, #-52]
	str	r2, [r6, #-640]
	str	r3, [fp, #-48]
	bl	MEM_InitMemManager
	bl	FSP_Init
	bl	ChanCtx_Init
	ldr	r3, [r4, #48]
	mov	r2, #128
	mov	r1, #0
	ldr	r0, .L1116+40
	blx	r3
	ldr	r3, [r4, #52]
	add	r1, r7, #8
	mov	r2, #24
	add	r0, r5, #224
	blx	r3
	add	r0, r5, #152
	bl	OpenDrivers
	cmp	r0, #0
	bne	.L1111
	ldr	r3, [r8, #124]
	mov	r1, #1
	blx	r3
	ldr	r3, [r8, #184]
	ldr	r2, .L1116+44
	add	r0, r5, #140
	ldr	r1, .L1116+48
	blx	r3
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r5, #128]
	bne	.L1114
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1096:
	ldr	r3, [r4, #80]
	mov	r1, #1024
	ldr	r0, .L1116+8
	blx	r3
	ldr	r3, [r4, #96]
	ldr	r1, .L1116+52
	ldr	r0, .L1116+8
	blx	r3
	ldr	r9, .L1116
	cmp	r0, #0
	str	r0, [fp, #-56]
	beq	.L1097
	ldr	r3, [r9, #92]
	sub	r0, fp, #56
	ldr	r1, .L1116+20
	blx	r3
	cmp	r0, #0
	ldreq	r0, [r8, #-648]
	beq	.L1099
	sub	r0, fp, #56
	ldr	r3, [r9, #92]
	ldr	r1, .L1116+24
	blx	r3
	cmp	r0, #0
	beq	.L1115
	ldr	r3, [r9, #84]
	mov	r2, r5
	mov	r1, r5
	blx	r3
	str	r0, [r8, #-648]
.L1099:
	ldr	r2, .L1116+32
	ubfx	r1, r0, #1, #1
	and	ip, r0, #1
	ubfx	r3, r0, #2, #1
	strb	ip, [r6, #-644]
	ubfx	r0, r0, #3, #1
	strb	r1, [r2, #76]
	strb	r3, [r6, #-643]
	strb	r0, [r6, #-642]
	b	.L1097
.L1090:
	ldr	r2, [r9, #-1680]
	b	.L1094
.L1084:
	ldr	r2, [r6, #-1684]
	b	.L1088
.L1095:
	ldr	r1, .L1116+56
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r5, [r6, #-1680]
	movw	r3, #60536
	cmp	r5, r8
	movt	r3, 65535
	movge	r5, r8
	cmp	r5, r3
	movlt	r5, r3
	b	.L1091
.L1089:
	ldr	r1, .L1116+60
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r2, [r6, #-1684]
	movw	r3, #60536
	cmp	r2, r8
	b	.L1110
.L1103:
	mov	r2, r5
	b	.L1085
.L1114:
	add	r0, r5, #152
	bl	CloseDrivers
.L1111:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1112:
	movw	r3, #7047
	ldr	r2, .L1116+64
	ldr	r1, .L1116+68
	mov	r0, #22
	bl	dprint_vfmw
	b	.L1087
.L1113:
	movw	r3, #7094
	ldr	r2, .L1116+72
	ldr	r1, .L1116+68
	mov	r0, #22
	bl	dprint_vfmw
	b	.L1093
.L1115:
	movw	r3, #7151
	ldr	r2, .L1116+76
	ldr	r1, .L1116+68
	mov	r0, #22
	bl	dprint_vfmw
	b	.L1097
.L1117:
	.align	2
.L1116:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LANCHOR3-1672
	.word	.LC129
	.word	.LANCHOR3
	.word	.LC130
	.word	.LC131
	.word	.LC134
	.word	.LANCHOR2
	.word	VCTRL_EventReport
	.word	.LANCHOR3-636
	.word	VFMW_CTRL_thread_proc
	.word	.LC137
	.word	.LC136
	.word	.LC135
	.word	.LC133
	.word	.LANCHOR1+292
	.word	.LC132
	.word	.LANCHOR1+312
	.word	.LANCHOR1+332
	UNWIND(.fnend)
	.size	VCTRL_OpenVfmw, .-VCTRL_OpenVfmw
	.align	2
	.global	GetNextDecodeMode
	.type	GetNextDecodeMode, %function
GetNextDecodeMode:
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
	movw	r6, #21846
	mov	r3, r2, asl #1
	cmp	r2, #0
	movt	r6, 21845
	add	r5, r2, #7
	smull	r6, r7, r3, r6
	movge	r5, r2
	mov	r5, r5, asr #3
	str	r2, [sp]
	mov	r6, r0
	str	r1, [sp, #4]
	mov	r4, r2
	mov	r8, r1
	sub	r3, r7, r3, asr #31
	ldr	r1, .L1126
	mov	r2, r5
	mov	r0, #30
	bl	dprint_vfmw
	cmp	r6, #3
	beq	.L1124
	cmp	r4, r8
	movge	r4, r6
	blt	.L1125
.L1120:
	mov	r2, r6
	mov	r3, r4
	ldr	r1, .L1126+4
	mov	r0, #30
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1125:
	ldr	r1, .L1126+8
	mov	r0, #30
	bl	dprint_vfmw
.L1123:
	mov	r4, #3
	b	.L1120
.L1124:
	cmp	r5, r8
	ble	.L1123
	ldr	r1, .L1126+12
	mov	r0, #30
	bl	dprint_vfmw
	mov	r4, #0
	b	.L1120
.L1127:
	.align	2
.L1126:
	.word	.LC138
	.word	.LC141
	.word	.LC140
	.word	.LC139
	UNWIND(.fnend)
	.size	GetNextDecodeMode, .-GetNextDecodeMode
	.align	2
	.global	VCTRL_GetChanIDByCtx
	.type	VCTRL_GetChanIDByCtx, %function
VCTRL_GetChanIDByCtx:
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
	ldr	ip, .L1138
	mov	r2, #0
	b	.L1131
.L1129:
	add	r2, r2, #1
	cmp	r2, #32
	beq	.L1137
.L1131:
	ldr	r1, [ip], #4
	cmp	r1, #0
	add	r3, r1, #294912
	add	r3, r3, #3392
	beq	.L1129
	cmp	r0, r3
	bne	.L1129
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L1137:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1139:
	.align	2
.L1138:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetChanIDByCtx, .-VCTRL_GetChanIDByCtx
	.align	2
	.global	VCTRL_GetChanIDByMemAddr
	.type	VCTRL_GetChanIDByMemAddr, %function
VCTRL_GetChanIDByMemAddr:
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
	ldr	ip, .L1151
	mov	r2, #0
.L1144:
	ldr	r3, [ip], #4
	cmp	r3, #0
	beq	.L1141
	ldr	r1, [r3, #240]
	cmp	r1, r0
	bhi	.L1142
	ldr	lr, [r3, #248]
	add	r1, r1, lr
	cmp	r0, r1
	bcc	.L1146
.L1142:
	ldr	r1, [r3, #264]
	cmp	r0, r1
	bcc	.L1141
	ldr	r3, [r3, #272]
	add	r1, r1, r3
	cmp	r0, r1
	bcc	.L1146
.L1141:
	add	r2, r2, #1
	cmp	r2, #32
	bne	.L1144
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1146:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L1152:
	.align	2
.L1151:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetChanIDByMemAddr, .-VCTRL_GetChanIDByMemAddr
	.align	2
	.global	DecChanProcessPts
	.type	DecChanProcessPts, %function
DecChanProcessPts:
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
	ldr	r6, .L1177
	mov	r4, r1
	mov	r5, r0
	ldr	ip, [r6, r0, asl #2]
	ldr	r1, [ip, #52]
	cmp	r1, #1
	beq	.L1172
	sub	r3, r1, #2
	cmp	r1, #6
	cmpne	r3, #1
	bls	.L1166
.L1155:
	ldrd	r2, [r4, #32]
	mvn	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L1173
	add	r1, ip, #608
	strd	r2, [r1]
.L1165:
	ldrd	r8, [r4, #48]
	add	r5, ip, #624
	add	lr, ip, #640
	ldr	r1, .L1177+4
	mov	r0, #29
	strd	r8, [r5]
	ldrd	r6, [r4, #56]
	strd	r6, [lr]
	ldr	lr, [r4, #64]
	str	lr, [ip, #656]
	ldr	lr, [r4, #68]
	str	lr, [ip, #660]
	ldr	lr, [r4, #72]
	str	lr, [ip, #664]
	ldr	lr, [r4, #76]
	str	lr, [ip, #680]
	strd	r8, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1172:
	add	r3, ip, #294912
	ldr	r3, [r3, #3392]
	ldr	r1, [r3, #556]
	sxtb	r1, r1
	cmp	r1, #1
	bne	.L1155
.L1166:
	add	r0, ip, #1104
	add	r2, r4, #8
	bl	IsNewpicSeg
	cmp	r0, #0
	bne	.L1156
	ldr	ip, [r6, r5, asl #2]
	add	lr, ip, #624
	ldr	r3, [ip, #52]
	cmp	r3, #3
	beq	.L1174
	ldrd	r2, [lr, #-8]
	mvn	r1, #0
	mvn	r0, #0
	cmp	r3, r1
	cmpeq	r2, r0
	beq	.L1175
	add	r1, ip, #608
	strd	r2, [r1]
.L1158:
	add	r7, ip, #640
	mvn	r0, #0
	mvn	r1, #0
	strd	r0, [lr, #-8]
	ldrd	r0, [r7, #-8]
	add	r8, ip, #656
	strd	r0, [lr]
	ldrd	r0, [r8, #-8]
	orrs	lr, r0, r1
	strd	r0, [r7]
	ldreqd	r0, [r4, #56]
	streqd	r0, [r7]
.L1160:
	ldr	r1, [ip, #684]
	mov	r0, #29
	ldr	r8, [ip, #668]
	ldr	r7, [ip, #672]
	ldr	lr, [ip, #676]
	str	r1, [ip, #680]
	str	r8, [ip, #656]
	ldr	r1, .L1177+8
	str	r7, [ip, #660]
	str	lr, [ip, #664]
	bl	dprint_vfmw
	ldr	r1, [r6, r5, asl #2]
	ldr	r3, [r1, #52]
	cmp	r3, #3
	beq	.L1176
.L1161:
	ldrd	r2, [r4, #32]
	mvn	r7, #0
	mvn	r6, #0
	add	r0, r1, #624
	cmp	r3, r7
	cmpeq	r2, r6
	strned	r2, [r0, #-8]
.L1163:
	ldrd	r2, [r4, #48]
	add	lr, r1, #640
	add	ip, r1, #656
	strd	r2, [lr, #-8]
	ldrd	r2, [r4, #56]
	strd	r2, [ip, #-8]
	ldr	r3, [r4, #64]
	str	r3, [r1, #668]
	ldr	r3, [r4, #68]
	str	r3, [r1, #672]
	ldr	r3, [r4, #72]
	str	r3, [r1, #676]
	ldr	r3, [r4, #76]
	str	r3, [r1, #684]
.L1162:
	ldrd	r2, [r0]
	mov	r0, #29
	ldr	r1, .L1177+12
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L1176:
	ldrd	r2, [r4, #32]
	add	lr, r1, #624
	add	ip, r1, #640
	add	r0, r1, #656
	strd	r2, [lr, #-8]
	ldrd	r2, [r4, #48]
	strd	r2, [ip, #-8]
	ldrd	r2, [r4, #56]
	strd	r2, [r0, #-8]
	ldr	r3, [r4, #64]
	str	r3, [r1, #668]
	ldr	r3, [r4, #68]
	str	r3, [r1, #672]
	ldr	r3, [r4, #72]
	str	r3, [r1, #676]
	ldr	r3, [r4, #76]
	str	r3, [r1, #684]
.L1156:
	ldr	r1, [r6, r5, asl #2]
	ldr	r3, [r1, #52]
	cmp	r3, #3
	addeq	r0, r1, #624
	bne	.L1161
	b	.L1162
.L1173:
	add	r3, ip, #608
	ldrd	r2, [r3]
	b	.L1165
.L1174:
	ldrd	r2, [lr, #-8]
	add	r1, ip, #608
	strd	r2, [r1]
	b	.L1158
.L1175:
	add	r3, ip, #608
	ldrd	r2, [r3]
	b	.L1158
.L1178:
	.align	2
.L1177:
	.word	.LANCHOR0
	.word	.LC144
	.word	.LC142
	.word	.LC143
	UNWIND(.fnend)
	.size	DecChanProcessPts, .-DecChanProcessPts
	.align	2
	.global	DecChanCheckDecParam
	.type	DecChanCheckDecParam, %function
DecChanCheckDecParam:
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
	ldr	r3, .L1183
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #544]
	bic	r3, r2, #16
	cmp	r3, #4
	cmpne	r2, #14
	movne	r3, #1
	moveq	r3, #0
	beq	.L1181
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	mvnne	r0, #1
	moveq	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1181:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1184:
	.align	2
.L1183:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	DecChanCheckDecParam, .-DecChanCheckDecParam
	.align	2
	.global	DecChanSyntax
	.type	DecChanSyntax, %function
DecChanSyntax:
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
	mov	r4, r0
	bhi	.L1230
	ldr	r6, .L1239
	ldr	r0, [r6, r0, asl #2]
	cmp	r0, #0
	beq	.L1231
	ldr	r2, [r0, #8]
	cmp	r2, #1
	bne	.L1232
	ldr	r5, [r0, #24]
	cmp	r5, #0
	bne	.L1233
	ldr	r8, .L1239+4
	mov	r7, r4, asl #2
	str	r5, [r0, #376]
	ldr	r9, .L1239+8
	ldr	r3, [r8]
	blx	r3
	add	r2, r9, r7
	ldr	r3, [r2, #-508]
	mov	r1, r0
	ldr	r0, .L1239+12
	rsb	r3, r3, r1
	ldr	r0, [r0]
	cmp	r3, r0
	mov	r0, r4
	bls	.L1191
	str	r1, [r2, #-508]
	bl	DecChanCheckDecParam
	cmn	r0, #2
	mov	r10, r0
	bne	.L1192
	mov	r2, r4
	ldr	r1, .L1239+16
	mov	r0, #23
	bl	dprint_vfmw
.L1214:
	mov	r0, r10
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1191:
	bl	DecChanCheckDecParam
	cmn	r0, #2
	mov	r10, r0
	beq	.L1214
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	mvnne	r10, #2
	bne	.L1214
.L1206:
	ldr	r10, [r6, r4, asl #2]
	ldr	r2, [r10, #1384]
	cmp	r2, #0
	beq	.L1193
	cmp	r2, #1
	addne	r10, r10, #290816
	ldrne	r3, [r10, #3144]
	beq	.L1234
.L1203:
	ldr	r1, .L1239+20
	mov	r0, #31
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1214
.L1192:
	mov	r0, r4
	bl	VCTRL_GetImageBuffer
	cmp	r0, #1
	moveq	r5, r0
	beq	.L1206
	mov	r2, r4
	ldr	r1, .L1239+24
	mov	r0, #23
	mvn	r10, #2
	bl	dprint_vfmw
	b	.L1214
.L1193:
	ldrb	r3, [r10, #689]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1196
	ldr	r3, [r10, #1424]
	cmp	r3, #0
	bne	.L1196
	add	r1, r10, #696
	mov	r0, r4
	bl	SM_ReadSegStream
	cmp	r0, #0
	beq	.L1196
	cmp	r5, #1
	beq	.L1235
.L1197:
	ldr	r3, [r6, r4, asl #2]
	mov	r2, #1
	mvn	r10, #3
	str	r2, [r3, #376]
	b	.L1214
.L1196:
	add	r10, r10, #688
	mov	r0, r4
	mov	r1, r10
	bl	DecChanProcessPts
	mov	r0, #3
	bl	CHECK_REC_POS_ENABLE
	adds	r0, r0, #0
	movne	r0, #1
	cmp	r5, #1
	movne	r0, #0
	cmp	r0, #0
	bne	.L1236
.L1198:
	ldr	r3, [r6, r4, asl #2]
	mov	r0, r10
	ldr	r5, .L1239
	add	r2, r3, #294912
	ldr	r1, [r3, #544]
	add	r2, r2, #3392
	bl	DecodeStream
	ldr	r0, [r6, r4, asl #2]
	ldr	r3, [r0, #544]
	cmp	r3, #16
	beq	.L1237
.L1199:
	mov	r0, #4
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L1238
.L1228:
	mov	r10, #0
	b	.L1214
.L1238:
	ldr	r3, [r8]
	add	r7, r9, r7
	blx	r3
	ldr	r1, .L1239+28
	ldr	r3, [r7, #-380]
	ldr	r1, [r1]
	rsb	r3, r3, r0
	mov	r2, r0
	cmp	r3, r1
	bls	.L1228
	mov	r0, r4
	str	r2, [r7, #-380]
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	beq	.L1228
	mov	r2, r4, asl #24
	movw	r1, #6781
	add	r2, r2, #262144
	ldr	r0, .L1239+32
	bl	DBG_AddTrace
	b	.L1228
.L1237:
	ldr	r3, [r0, #1448]
	cmp	r3, #1
	beq	.L1199
	add	r0, r0, #294912
	add	r0, r0, #3392
	bl	IsMain10Profile
	cmp	r0, #0
	ldreq	r3, [r5, r4, asl #2]
	streq	r0, [r3, #1448]
	beq	.L1199
	mov	r3, r4
	ldr	r2, .L1239+32
	ldr	r1, .L1239+36
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #1
	str	r2, [r3, #1448]
	bl	VDMDRV_AddMatchMode
	b	.L1199
.L1234:
	add	r3, r10, #290816
	ldr	r3, [r3, #3144]
	bics	r1, r3, #2
	beq	.L1193
	cmp	r3, #1
	bne	.L1203
	ldr	r1, .L1239+40
	mov	r0, #31
	bl	dprint_vfmw
	mvn	r10, #2
	b	.L1214
.L1232:
	ldr	r3, .L1239+44
	movw	r2, #6670
	ldr	r1, .L1239+48
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1214
.L1233:
	ldr	r3, .L1239+52
	movw	r2, #6671
	ldr	r1, .L1239+48
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1214
.L1230:
	ldr	r3, .L1239+56
	movw	r2, #6668
	ldr	r1, .L1239+48
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1214
.L1236:
	mov	r2, r4, asl #24
	movw	r1, #6746
	add	r2, r2, #196608
	ldr	r0, .L1239+32
	bl	DBG_AddTrace
	b	.L1198
.L1231:
	ldr	r3, .L1239+60
	movw	r2, #6669
	ldr	r1, .L1239+48
	mvn	r10, #0
	bl	dprint_vfmw
	b	.L1214
.L1235:
	mov	r2, r4
	ldr	r1, .L1239+64
	mov	r0, #23
	bl	dprint_vfmw
	b	.L1197
.L1240:
	.align	2
.L1239:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	g_TraceBsPeriod
	.word	.LC146
	.word	.LC151
	.word	.LC147
	.word	g_TraceFramePeriod
	.word	.LANCHOR1+348
	.word	.LC149
	.word	.LC150
	.word	.LC104
	.word	.LC1
	.word	.LC145
	.word	.LC57
	.word	.LC86
	.word	.LC148
	UNWIND(.fnend)
	.size	DecChanSyntax, .-DecChanSyntax
	.align	2
	.global	DecSyntax
	.type	DecSyntax, %function
DecSyntax:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
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
	ldr	r0, .L1270
	ldr	r1, .L1270+4
	sub	r3, r0, #128
.L1244:
	ldr	r2, [r1, #4]!
	add	r3, r3, #4
	cmp	r2, #0
	ldrne	r2, [r2, #20]
	str	r2, [r3, #-4]
	cmp	r3, r0
	bne	.L1244
	ldr	r7, .L1270+8
	mvn	ip, #0
	ldr	r6, .L1270+12
	mov	r8, #0
	ldr	r10, .L1270+16
	mov	r9, r7
.L1245:
	mov	r3, #0
	ldr	r0, [r6, #-252]
	mov	r4, r3
	ldr	r1, .L1270+20
	b	.L1246
.L1248:
	ldr	r2, [r1, #4]!
	cmp	r0, r2
	movlt	r0, r2
	movlt	r4, r3
.L1246:
	add	r3, r3, #1
	cmp	r3, #32
	bne	.L1248
	add	r3, r6, r4, lsl #2
	cmp	r0, #0
	add	r2, r4, #1
	mov	r1, #0
	str	r8, [r3, #-252]
	str	r2, [r7, #148]
	ldr	r3, .L1270+8
	ble	.L1249
	ldr	r3, [r9, r4, asl #2]
	cmp	r3, r1
	beq	.L1245
	ldr	r2, [r3, #8]
	cmp	r2, #1
	bne	.L1245
	ldr	r2, [r3, #76]
	cmp	r2, r1
	ble	.L1251
	ldr	r5, [r3, #80]
	cmp	r5, r1
	beq	.L1268
.L1251:
	mov	r5, #200
	b	.L1256
.L1254:
	cmp	r0, #0
	bne	.L1245
	subs	r5, r5, #1
	beq	.L1245
.L1256:
	mov	r0, r4
	bl	DecChanSyntax
	cmn	r0, #1
	mov	ip, r0
	bne	.L1254
	ldr	r5, [r6, #-640]
	cmp	r5, #0
	beq	.L1262
	mov	r3, #0
	str	r0, [fp, #-72]
	mov	r2, r3
	mov	r0, r4
	mov	r1, #102
	blx	r5
	ldr	ip, [fp, #-72]
.L1262:
	mov	r0, ip
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1268:
	mov	r0, r4
	sub	r1, fp, #68
	bl	SM_GetInfo
	cmp	r0, #0
	bne	.L1269
.L1252:
	ldr	r5, [r7, r4, asl #2]
	ldr	r1, [fp, #-56]
	ldr	r2, [r5, #76]
	ldr	r0, [r5, #560]
	bl	GetNextDecodeMode
	ldr	r3, [r7, r4, asl #2]
	str	r0, [r5, #560]
	ldr	r2, [r3, #560]
	cmp	r2, #0
	strne	r8, [r3, #556]
	strne	r8, [r3, #552]
	ldreq	r2, [r3, #72]
	streq	r2, [r3, #556]
	streq	r2, [r3, #552]
	b	.L1251
.L1249:
	mov	r0, ip
	str	r1, [r3, #148]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1269:
	mov	r1, r5
	sub	r0, fp, #68
	ldr	r3, [r10, #48]
	mov	r2, #24
	blx	r3
	b	.L1252
.L1271:
	.align	2
.L1270:
	.word	.LANCHOR3-124
	.word	.LANCHOR0-4
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3-252
	UNWIND(.fnend)
	.size	DecSyntax, .-DecSyntax
	.align	2
	.global	VCTRL_RunProcess
	.type	VCTRL_RunProcess, %function
VCTRL_RunProcess:
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
	ldr	r5, .L1283
	mov	r0, #0
	bl	VCTRL_RecordPosTime
	ldrb	r3, [r5, #1272]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1281
.L1273:
	ldr	r0, [r5, #396]
	mov	r3, #100
	ldr	r6, .L1283+4
	cmp	r0, #0
	str	r3, [r5, #144]
	ble	.L1274
	ldr	r3, [r6, #120]
	blx	r3
.L1274:
	ldr	r3, [r6, #12]
	mov	r0, #0
	blx	r3
	bl	SM_Wakeup
	ldr	r3, [r5, #392]
	mov	r2, #101
	str	r2, [r5, #144]
	cmp	r3, #0
	movne	r7, #0
	beq	.L1282
.L1275:
	mov	r3, #102
	str	r3, [r5, #144]
	bl	VDMDRV_WakeUpVdm
	mov	r4, #0
.L1276:
	mov	r0, r4
	mov	r1, #0
	add	r4, r4, #1
	bl	DeleteRawPacketInBuffer
	cmp	r4, #32
	bne	.L1276
	ldr	r3, [r6, #16]
	mov	r0, #0
	blx	r3
	mov	r0, #1
	mov	r3, #105
	str	r3, [r5, #144]
	bl	VCTRL_RecordPosTime
	mov	r1, #0
	ldr	r3, [r6, #132]
	mov	r0, r1
	mov	r2, #10
	blx	r3
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1282:
	bl	DecSyntax
	mov	r7, r0
	b	.L1275
.L1281:
	mov	r0, #11
	bl	VCTRL_RecordPosTime
	mov	r3, #0
	strb	r3, [r5, #1272]
	b	.L1273
.L1284:
	.align	2
.L1283:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VCTRL_RunProcess, .-VCTRL_RunProcess
	.align	2
	.global	VFMW_CTRL_thread_proc
	.type	VFMW_CTRL_thread_proc, %function
VFMW_CTRL_thread_proc:
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
	ldr	r4, .L1312
	ldr	r6, .L1312+4
.L1286:
.L1293:
	ldr	r1, .L1312+8
	mov	r0, #2
	mov	r3, #0
	str	r3, [r4, #144]
	bl	dprint_vfmw
	ldr	r3, [r4, #136]
	mov	r5, #2
	str	r5, [r4, #132]
	cmp	r3, r5
	bne	.L1308
	b	.L1291
.L1310:
	str	r5, [r4, #144]
	bl	VCTRL_RunProcess
	ldr	r1, .L1312+12
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r4, #136]
	cmp	r3, #2
	beq	.L1291
.L1308:
	cmp	r3, #3
	bne	.L1310
.L1289:
	ldr	r1, .L1312+16
	mov	r0, #2
	mov	r3, #6
	str	r3, [r4, #144]
	bl	dprint_vfmw
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #132]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1291:
	ldr	r1, .L1312+20
	mov	r0, #2
	mov	r3, #4
	str	r3, [r4, #144]
	bl	dprint_vfmw
	mov	r3, #1
	str	r3, [r4, #132]
	b	.L1288
.L1311:
	ldr	r3, [r6, #120]
	blx	r3
.L1288:
	ldr	r1, .L1312+24
	mov	r0, #22
	mov	r3, #5
	str	r3, [r4, #144]
	bl	dprint_vfmw
	ldr	r3, [r4, #136]
	mov	r0, #10
	cmp	r3, #1
	beq	.L1293
	cmp	r3, #3
	bne	.L1311
	b	.L1289
.L1313:
	.align	2
.L1312:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC152
	.word	.LC154
	.word	.LC156
	.word	.LC153
	.word	.LC155
	UNWIND(.fnend)
	.size	VFMW_CTRL_thread_proc, .-VFMW_CTRL_thread_proc
	.align	2
	.global	VCTRL_GetChanVoQue
	.type	VCTRL_GetChanVoQue, %function
VCTRL_GetChanVoQue:
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
	ldr	r3, .L1333
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	beq	.L1331
	ldr	r2, [r3, #544]
	cmp	r2, #20
	ldrls	pc, [pc, r2, asl #2]
	b	.L1332
.L1317:
	.word	.L1330
	.word	.L1318
	.word	.L1319
	.word	.L1320
	.word	.L1332
	.word	.L1321
	.word	.L1322
	.word	.L1332
	.word	.L1323
	.word	.L1324
	.word	.L1325
	.word	.L1325
	.word	.L1325
	.word	.L1326
	.word	.L1332
	.word	.L1327
	.word	.L1328
	.word	.L1329
	.word	.L1332
	.word	.L1332
	.word	.L1330
.L1330:
	movw	r0, #36168
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1318:
	add	r0, r3, #344064
	add	r0, r0, #3696
	ldmfd	sp, {fp, sp, pc}
.L1319:
	movw	r0, #58792
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1320:
	add	r0, r3, #385024
	add	r0, r0, #3552
	ldmfd	sp, {fp, sp, pc}
.L1321:
	add	r0, r3, #339968
	add	r0, r0, #2400
	ldmfd	sp, {fp, sp, pc}
.L1322:
	add	r0, r3, #311296
	add	r0, r0, #3136
	ldmfd	sp, {fp, sp, pc}
.L1323:
	movw	r0, #27016
	movt	r0, 5
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1324:
	movw	r0, #27000
	movt	r0, 5
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1325:
	add	r0, r3, #307200
	add	r0, r0, #3776
	ldmfd	sp, {fp, sp, pc}
.L1326:
	movw	r0, #44344
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1327:
	movw	r0, #36744
	movt	r0, 4
	add	r0, r3, r0
	ldmfd	sp, {fp, sp, pc}
.L1328:
	add	r0, r3, #360448
	add	r0, r0, #536
	ldmfd	sp, {fp, sp, pc}
.L1329:
	add	r0, r3, #573440
	add	r0, r0, #672
	ldmfd	sp, {fp, sp, pc}
.L1332:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1331:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L1334:
	.align	2
.L1333:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetChanVoQue, .-VCTRL_GetChanVoQue
	.align	2
	.global	VCTRL_FindOccupiedFrame
	.type	VCTRL_FindOccupiedFrame, %function
VCTRL_FindOccupiedFrame:
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
	cmp	r0, #31
	mov	r8, r0
	bhi	.L1346
	bl	VCTRL_GetChanVoQue
	subs	r6, r0, #0
	beq	.L1343
	sub	r2, fp, #44
	mov	r3, #0
	sub	r1, fp, #52
	str	r3, [fp, #-52]
	str	r3, [r2, #-4]!
	bl	GetQueueImgNum
	ldr	r2, [fp, #-52]
	cmp	r2, #0
	beq	.L1343
	cmp	r2, #32
	bhi	.L1339
.L1341:
	ldr	r9, .L1347
	mov	r4, #0
	mov	lr, r4
	mov	r7, r4
	str	r8, [fp, #-56]
	str	r9, [fp, #-60]
.L1340:
	ldrh	r0, [r6, #4]
	movw	r5, #35592
	ldr	r3, [fp, #-60]
	movt	r5, 4
	add	r0, r0, lr
	ldr	r2, [fp, #-56]
	and	r0, r0, #63
	mov	r8, #0
	mov	r9, #0
	add	r4, r4, #1
	add	r0, r6, r0, lsl #2
	ldr	r2, [r3, r2, asl #2]
	ldr	r1, .L1347+4
	movw	r3, #3642
	ldr	r10, [r0, #12]
	add	r2, r2, lr, lsl #4
	add	ip, r2, #294912
	add	r5, r2, r5
	mov	r0, #1
	ldr	r2, .L1347+8
	ldr	r10, [r10, #28]
	uxth	r4, r4
	str	r10, [ip, #2820]
	strd	r8, [r5]
	str	r7, [ip, #2816]
	str	r7, [sp, #16]
	ldrd	r8, [r5]
	strd	r8, [sp, #8]
	ldr	ip, [ip, #2820]
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	dprint_vfmw
	ldr	r3, [fp, #-52]
	sxth	lr, r4
	cmp	lr, r3
	bcc	.L1340
	ldr	r8, [fp, #-56]
	ldr	r9, [fp, #-60]
.L1342:
	ldr	r2, [r9, r8, asl #2]
	mov	r0, #0
	add	r2, r2, #294912
	str	r3, [r2, #3328]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1343:
	mvn	r0, #0
.L1337:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1339:
	mov	r3, #32
	ldr	r1, .L1347+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	ldreq	r9, .L1347
	bne	.L1341
	b	.L1342
.L1346:
	ldr	r3, .L1347+16
	movw	r2, #3608
	ldr	r1, .L1347+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1337
.L1348:
	.align	2
.L1347:
	.word	.LANCHOR0
	.word	.LC158
	.word	.LANCHOR1+364
	.word	.LC157
	.word	.LC57
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_FindOccupiedFrame, .-VCTRL_FindOccupiedFrame
	.align	2
	.global	VCTRL_ReportOccupiedFrame
	.type	VCTRL_ReportOccupiedFrame, %function
VCTRL_ReportOccupiedFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	mov	r7, r0
	mov	r4, r1
	bhi	.L1366
	cmp	r1, #0
	beq	.L1367
	bl	VCTRL_GetChanVoQue
	subs	r5, r0, #0
	mvneq	r0, #0
	beq	.L1351
	ldr	r6, .L1369
	sub	r8, fp, #36
	mov	r3, #0
	mov	r0, #4
	str	r3, [r8, #-4]!
	ldr	r2, [r6, #12]
	str	r3, [fp, #-44]
	blx	r2
	mov	r2, r8
	sub	r1, fp, #44
	mov	r0, r5
	bl	GetQueueImgNum
	ldr	r2, [fp, #-44]
	cmp	r2, #0
	beq	.L1353
	cmp	r2, #32
	bhi	.L1368
.L1354:
	mov	ip, #0
	mov	r0, #0
	mov	r1, #0
	mov	lr, ip
	mov	r8, ip
.L1356:
	ldrh	r3, [r5, #4]
	add	ip, ip, #1
	add	r7, r4, lr, lsl #4
	add	r3, r3, lr
	uxth	ip, ip
	and	r3, r3, #63
	add	r3, r5, r3, lsl #2
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #28]
	strd	r0, [r7, #8]
	str	r3, [r7, #4]
	str	r8, [r4, lr, asl #4]
	sxth	lr, ip
	cmp	lr, r2
	bcc	.L1356
	uxth	r3, r2
.L1355:
	ldrh	r1, [r5, #4]
	add	r3, r3, r1
	and	r3, r3, #63
	strh	r3, [r5, #4]	@ movhi
	str	r2, [r4, #512]
.L1357:
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
	mov	r0, #0
.L1351:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1353:
	ldr	r8, .L1369+4
	ldr	lr, [r8, r7, asl #2]
	add	r3, lr, #294912
	ldr	r3, [r3, #3328]
	cmp	r3, #0
	beq	.L1357
	mov	r0, #0
	mov	r1, #0
	mov	ip, r2
	mov	r9, r2
.L1358:
	add	r3, ip, #18432
	add	r5, r4, ip, lsl #4
	add	r3, r3, #176
	add	r2, r2, #1
	add	r3, lr, r3, lsl #4
	uxth	r2, r2
	ldr	r3, [r3, #4]
	strd	r0, [r5, #8]
	str	r3, [r5, #4]
	str	r9, [r4, ip, asl #4]
	sxth	ip, r2
	ldr	lr, [r8, r7, asl #2]
	add	r3, lr, #294912
	ldr	r3, [r3, #3328]
	cmp	ip, r3
	bcc	.L1358
	str	r3, [r4, #512]
	b	.L1357
.L1368:
	mov	r3, #32
	ldr	r1, .L1369+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [fp, #-44]
	cmp	r2, #0
	moveq	r3, r2
	bne	.L1354
	b	.L1355
.L1366:
	ldr	r3, .L1369+12
	movw	r2, #3720
	ldr	r1, .L1369+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1351
.L1367:
	mov	r0, r1
	ldr	r3, .L1369+20
	movw	r2, #3721
	ldr	r1, .L1369+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1351
.L1370:
	.align	2
.L1369:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC157
	.word	.LC57
	.word	.LC1
	.word	.LC159
	UNWIND(.fnend)
	.size	VCTRL_ReportOccupiedFrame, .-VCTRL_ReportOccupiedFrame
	.align	2
	.global	VCTRL_GetChanImgNum
	.type	VCTRL_GetChanImgNum, %function
VCTRL_GetChanImgNum:
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
	ldr	r4, .L1384
	mov	r5, r0
	mov	r6, r1
	mov	r7, r2
	mov	r8, r3
	ldr	ip, [r4, r0, asl #2]
	cmp	ip, #0
	beq	.L1380
	bl	VCTRL_GetChanVoQue
	subs	r3, r0, #0
	beq	.L1373
	mov	r2, r8
	mov	r1, r7
	bl	GetQueueImgNum
	ldr	r2, [r4, r5, asl #2]
	ldr	r3, [r2, #544]
	cmp	r3, #0
	beq	.L1381
	cmp	r3, #16
	beq	.L1382
	cmp	r3, #17
	moveq	r3, #9
	streq	r3, [r6]
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r3, #15
	beq	.L1383
	cmp	r3, #18
	movne	r3, #2
	strne	r3, [r6]
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r2, .L1384+4
	mov	r0, #32
	ldr	r1, .L1384+8
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L1381:
	add	r2, r2, #323584
	ldr	r3, [r2, #1440]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1373:
	str	r3, [r8]
	str	r3, [r7]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1382:
	add	r2, r2, #299008
	ldr	r3, [r2, #1800]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1383:
	add	r2, r2, #11403264
	add	r2, r2, #16384
	ldr	r3, [r2, #2312]
	str	r3, [r6]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1380:
	mov	r0, ip
	ldr	r3, .L1384+12
	movw	r2, #6907
	ldr	r1, .L1384+16
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L1385:
	.align	2
.L1384:
	.word	.LANCHOR0
	.word	.LANCHOR1+388
	.word	.LC160
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_GetChanImgNum, .-VCTRL_GetChanImgNum
	.align	2
	.global	VCTRL_GetChanState
	.type	VCTRL_GetChanState, %function
VCTRL_GetChanState:
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
	cmp	r0, #31
	mov	r6, r0
	mov	r4, r1
	bhi	.L1396
	cmp	r1, #0
	beq	.L1397
	ldr	r7, .L1399
	ldr	r0, [r7, r0, asl #2]
	cmp	r0, #0
	beq	.L1398
	ldr	r3, .L1399+4
	mov	r5, #0
	mov	r1, r5
	mov	r2, #100
	str	r5, [fp, #-56]
	mov	r0, r4
	ldr	r3, [r3, #48]
	str	r5, [fp, #-60]
	str	r5, [fp, #-64]
	blx	r3
	ldr	r2, [r7, r6, asl #2]
	movw	r3, #1898
	ldr	r2, [r2, #1120]
	str	r2, [r4, #32]
	ldr	r2, [r7, r6, asl #2]
	ldr	r2, [r2, #1124]
	str	r2, [r4, #36]
	ldr	r2, [r7, r6, asl #2]
	ldr	r2, [r2, #1128]
	str	r2, [r4, #44]
	ldr	r1, [r7, r6, asl #2]
	add	r2, r1, #262144
	ldrsb	r0, [r2, r3]
	cmp	r0, r5
	ble	.L1394
	movw	r3, #24574
	mov	r2, r5
	movt	r3, 4
	add	r3, r1, r3
	mov	r1, r5
.L1393:
	ldrsb	ip, [r3]
	add	r2, r2, #1
	add	r3, r3, #100
	cmp	ip, #3
	addeq	r1, r1, #1
	cmp	r2, r0
	bne	.L1393
.L1391:
	str	r1, [r4, #84]
	movw	lr, #1898
	ldr	ip, [r7, r6, asl #2]
	sub	r3, fp, #56
	sub	r2, fp, #60
	sub	r1, fp, #64
	add	ip, ip, #262144
	mov	r0, r6
	ldrsb	ip, [ip, lr]
	str	ip, [r4, #92]
	bl	VCTRL_GetChanImgNum
	ldr	ip, .L1399+8
	mov	r3, #300
	ldr	r0, [fp, #-56]
	ldr	r2, [fp, #-60]
	sub	r1, fp, #52
	mla	r3, r3, r6, ip
	add	r2, r2, r0
	str	r2, [r4, #48]
	mov	r0, r6
	ldr	r2, [r3, #-104]
	str	r2, [r4, #96]
	ldr	r3, [r3, #-116]
	str	r3, [r4, #20]
	bl	SM_GetInfo
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-44]
	cmp	r3, #10
	str	r1, [r4, #52]
	movle	r3, #0
	movgt	r3, #1
	str	r2, [r4, #56]
	str	r3, [r4, #80]
	ldr	r3, [r7, r6, asl #2]
	add	r3, r3, #311296
	ldrb	r3, [r3, #2896]	@ zero_extendqisi2
	and	r3, r3, #1
	str	r3, [r4, #88]
.L1386:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1396:
	ldr	r3, .L1399+12
	movw	r2, #1467
	ldr	r1, .L1399+16
	mov	r0, #0
	bl	dprint_vfmw
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1398:
	ldr	r3, .L1399+20
	movw	r2, #1470
	ldr	r1, .L1399+16
	bl	dprint_vfmw
	b	.L1386
.L1394:
	mov	r1, r5
	b	.L1391
.L1397:
	mov	r0, r1
	ldr	r3, .L1399+24
	movw	r2, #1469
	ldr	r1, .L1399+16
	bl	dprint_vfmw
	b	.L1386
.L1400:
	.align	2
.L1399:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3
	.word	.LC161
	.word	.LC1
	.word	.LC163
	.word	.LC162
	UNWIND(.fnend)
	.size	VCTRL_GetChanState, .-VCTRL_GetChanState
	.align	2
	.global	VCTRL_GetChanWidth
	.type	VCTRL_GetChanWidth, %function
VCTRL_GetChanWidth:
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
	bhi	.L1405
	ldr	r3, .L1407
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1406
	ldr	r0, [r0, #1220]
	ldmfd	sp, {fp, sp, pc}
.L1405:
	ldr	r3, .L1407+4
	movw	r2, #6972
	ldr	r1, .L1407+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1406:
	ldr	r3, .L1407+12
	movw	r2, #6973
	ldr	r1, .L1407+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1408:
	.align	2
.L1407:
	.word	.LANCHOR0
	.word	.LC57
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetChanWidth, .-VCTRL_GetChanWidth
	.align	2
	.global	VCTRL_GetChanHeight
	.type	VCTRL_GetChanHeight, %function
VCTRL_GetChanHeight:
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
	bhi	.L1413
	ldr	r3, .L1415
	ldr	r0, [r3, r0, asl #2]
	cmp	r0, #0
	beq	.L1414
	ldr	r0, [r0, #1224]
	ldmfd	sp, {fp, sp, pc}
.L1413:
	ldr	r3, .L1415+4
	movw	r2, #6980
	ldr	r1, .L1415+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1414:
	ldr	r3, .L1415+12
	movw	r2, #6981
	ldr	r1, .L1415+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1416:
	.align	2
.L1415:
	.word	.LANCHOR0
	.word	.LC57
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_GetChanHeight, .-VCTRL_GetChanHeight
	.align	2
	.global	VCTRL_GetChanCapLevel
	.type	VCTRL_GetChanCapLevel, %function
VCTRL_GetChanCapLevel:
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
	bhi	.L1421
	ldr	r3, .L1422
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	ldrne	r0, [r3, #36]
	moveq	r0, #33
	ldmfd	sp, {fp, sp, pc}
.L1421:
	ldr	r3, .L1422+4
	movw	r2, #6988
	ldr	r1, .L1422+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1423:
	.align	2
.L1422:
	.word	.LANCHOR0
	.word	.LC57
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_GetChanCapLevel, .-VCTRL_GetChanCapLevel
	.align	2
	.global	VCTRL_SetVdecExtra
	.type	VCTRL_SetVdecExtra, %function
VCTRL_SetVdecExtra:
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
	add	r3, r0, #4992
	ldr	r5, .L1431
	add	r3, r3, #8
	movw	r2, #10000
	cmp	r3, r2
	mov	r4, r1
	str	r0, [r5, #-1684]
	bhi	.L1429
.L1425:
	movw	r1, #5000
	cmp	r0, r1
	movw	r2, #60536
	add	r3, r4, #4992
	movge	r0, r1
	movt	r2, 65535
	cmp	r0, r2
	add	r3, r3, #8
	movw	r1, #10000
	str	r4, [r5, #-1680]
	movlt	r0, r2
	cmp	r3, r1
	str	r0, [r5, #-1684]
	ldr	r6, .L1431
	bhi	.L1430
.L1426:
	movw	r2, #5000
	cmp	r4, r2
	movw	r3, #60536
	movge	r4, r2
	movt	r3, 65535
	cmp	r4, r3
	movlt	r4, r3
	str	r4, [r5, #-1680]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1429:
	mov	r2, r0
	ldr	r1, .L1431+4
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r0, [r5, #-1684]
	b	.L1425
.L1430:
	mov	r2, r4
	ldr	r1, .L1431+8
	mov	r0, #32
	bl	dprint_vfmw
	ldr	r4, [r6, #-1680]
	b	.L1426
.L1432:
	.align	2
.L1431:
	.word	.LANCHOR3
	.word	.LC164
	.word	.LC165
	UNWIND(.fnend)
	.size	VCTRL_SetVdecExtra, .-VCTRL_SetVdecExtra
	.align	2
	.global	VfmwProcGetHandler
	.type	VfmwProcGetHandler, %function
VfmwProcGetHandler:
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
	subs	r1, r0, #0
	ldrne	r3, .L1445
	bne	.L1437
	b	.L1443
.L1438:
	ldr	r2, [r3, #8]!
	cmp	r2, r1
	beq	.L1444
.L1437:
	ldr	r0, [r3, #12]
	cmp	r0, #0
	bne	.L1438
	ldmfd	sp, {fp, sp, pc}
.L1444:
	ldmfd	sp, {fp, sp, pc}
.L1443:
	ldr	r0, .L1445+4
	ldmfd	sp, {fp, sp, pc}
.L1446:
	.align	2
.L1445:
	.word	.LANCHOR1+408
	.word	VfmwProc_SetPrintLevel
	UNWIND(.fnend)
	.size	VfmwProcGetHandler, .-VfmwProcGetHandler
	.align	2
	.global	VCTRL_SetDbgOption
	.type	VCTRL_SetDbgOption, %function
VCTRL_SetDbgOption:
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
	beq	.L1454
	cmp	r0, #0
	ldrne	r3, .L1460
	bne	.L1452
	b	.L1459
.L1453:
	ldr	lr, [r3, #8]!
	cmp	r0, lr
	beq	.L1450
.L1452:
	ldr	ip, [r3, #12]
	cmp	ip, #0
	bne	.L1453
	mov	r2, r0
	ldr	r1, .L1460+4
	mov	r0, #32
	bl	dprint_vfmw
	mvn	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1459:
	ldr	ip, .L1460+8
.L1450:
	mov	r0, r1
	blx	ip
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1454:
	mvn	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1461:
	.align	2
.L1460:
	.word	.LANCHOR1+408
	.word	.LC166
	.word	VfmwProc_SetPrintLevel
	UNWIND(.fnend)
	.size	VCTRL_SetDbgOption, .-VCTRL_SetDbgOption
	.align	2
	.global	VCTRL_GetLastFrameIdPlus2
	.type	VCTRL_GetLastFrameIdPlus2, %function
VCTRL_GetLastFrameIdPlus2:
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
	bhi	.L1466
	ldr	r3, .L1467
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	ldrne	r0, [r3, #380]
	mvneq	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1466:
	ldr	r3, .L1467+4
	movw	r2, #8109
	ldr	r1, .L1467+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L1468:
	.align	2
.L1467:
	.word	.LANCHOR0
	.word	.LC57
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_GetLastFrameIdPlus2, .-VCTRL_GetLastFrameIdPlus2
	.align	2
	.global	VCTRL_SetLastFrameIdPlus2
	.type	VCTRL_SetLastFrameIdPlus2, %function
VCTRL_SetLastFrameIdPlus2:
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
	bhi	.L1475
	ldr	r3, .L1476
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	strne	r1, [r3, #380]
	ldmfd	sp, {fp, sp, pc}
.L1475:
	ldr	r3, .L1476+4
	movw	r2, #8121
	ldr	r1, .L1476+8
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L1477:
	.align	2
.L1476:
	.word	.LANCHOR0
	.word	.LC57
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameIdPlus2, .-VCTRL_SetLastFrameIdPlus2
	.align	2
	.global	VCTRL_SetLastFrameState
	.type	VCTRL_SetLastFrameState, %function
VCTRL_SetLastFrameState:
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
	bhi	.L1484
	ldr	r3, .L1485
	ldr	r3, [r3, r0, asl #2]
	cmp	r3, #0
	strne	r1, [r3, #384]
	ldmfd	sp, {fp, sp, pc}
.L1484:
	ldr	r3, .L1485+4
	movw	r2, #8133
	ldr	r1, .L1485+8
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L1486:
	.align	2
.L1485:
	.word	.LANCHOR0
	.word	.LC57
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_SetLastFrameState, .-VCTRL_SetLastFrameState
	.align	2
	.global	VCTRL_ReportLastFrame
	.type	VCTRL_ReportLastFrame, %function
VCTRL_ReportLastFrame:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	subs	r5, r1, #0
	mov	r4, r0
	moveq	r2, #2
	beq	.L1489
	cmp	r5, #1
	moveq	r2, #3
	movne	r2, #4
.L1489:
	cmp	r4, #31
	bhi	.L1501
	ldr	r6, .L1502
	ldr	r3, [r6, r4, asl #2]
	cmp	r3, #0
	strne	r2, [r3, #384]
.L1492:
	ldr	r3, .L1502+4
	ldr	ip, [r3, #-640]
	cmp	ip, #0
	beq	.L1493
	sub	r2, fp, #28
	mov	r3, #4
	mov	r1, #115
	mov	r0, r4
	str	r5, [r2, #-4]!
	blx	ip
.L1493:
	ldr	ip, [r6, r4, asl #2]
	mov	r3, r5
	mov	r2, r4
	ldr	r1, .L1502+8
	mov	r0, #1
	ldr	ip, [ip, #384]
	str	ip, [sp]
	bl	dprint_vfmw
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1501:
	ldr	r3, .L1502+12
	movw	r2, #8133
	ldr	r1, .L1502+16
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r6, .L1502
	b	.L1492
.L1503:
	.align	2
.L1502:
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	.LC167
	.word	.LC57
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_ReportLastFrame, .-VCTRL_ReportLastFrame
	.align	2
	.global	VCTRL_OutputLastFrame
	.type	VCTRL_OutputLastFrame, %function
VCTRL_OutputLastFrame:
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
	ldr	r3, .L1530
	mov	r5, r0
	ldr	r3, [r3, r0, asl #2]
	add	r0, r3, #294912
	ldr	r2, [r0, #3384]
	cmp	r2, #17
	ldrls	pc, [pc, r2, asl #2]
	b	.L1524
.L1507:
	.word	.L1506
	.word	.L1508
	.word	.L1509
	.word	.L1510
	.word	.L1524
	.word	.L1511
	.word	.L1512
	.word	.L1524
	.word	.L1513
	.word	.L1514
	.word	.L1515
	.word	.L1515
	.word	.L1515
	.word	.L1516
	.word	.L1524
	.word	.L1517
	.word	.L1518
	.word	.L1519
.L1519:
	add	r0, r0, #3392
	bl	VP9DEC_GetRemainImg
	mov	r4, r0
.L1505:
	cmn	r4, #1
	beq	.L1521
	cmp	r4, #0
	bne	.L1529
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	ldr	r1, .L1530+4
	mov	r0, #2
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1506:
	add	r0, r0, #3392
	bl	H264DEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1508:
	add	r0, r0, #3392
	bl	VC1DEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1509:
	add	r0, r0, #3392
	bl	MPEG4DEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1510:
	add	r0, r0, #3392
	bl	MPEG2DEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1511:
	add	r0, r0, #3392
	bl	DIVX3DEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1512:
	add	r0, r0, #3392
	bl	AVSDEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1513:
	add	r0, r0, #3392
	bl	REAL8DEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1514:
	add	r0, r0, #3392
	bl	REAL9DEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1515:
	add	r0, r0, #3392
	bl	VP6DEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1516:
	add	r0, r0, #3392
	bl	VP8DEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1517:
	add	r0, r0, #3392
	bl	MVC_DEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1518:
	add	r0, r0, #3392
	bl	HEVCDEC_GetRemainImg
	mov	r4, r0
	b	.L1505
.L1529:
	mov	r0, r5
	mov	r1, r4
	bl	VCTRL_ReportLastFrame
	sub	r2, r4, #2
	ldr	r1, .L1530+8
	mov	r0, #2
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1524:
	mvn	r4, #0
.L1521:
	mov	r0, r5
	mov	r1, #1
	bl	VCTRL_ReportLastFrame
	ldr	r1, .L1530+12
	mov	r0, #2
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1531:
	.align	2
.L1530:
	.word	.LANCHOR0
	.word	.LC169
	.word	.LC170
	.word	.LC168
	UNWIND(.fnend)
	.size	VCTRL_OutputLastFrame, .-VCTRL_OutputLastFrame
	.align	2
	.global	VCTRL_PostProc
	.type	VCTRL_PostProc, %function
VCTRL_PostProc:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	r5, .L1572
	mov	r4, r0
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L1565
	ldr	lr, [r0, #544]
	ldr	r6, [r0, #1168]
	cmp	lr, #17
	ldrls	pc, [pc, lr, asl #2]
	b	.L1532
.L1536:
	.word	.L1535
	.word	.L1537
	.word	.L1538
	.word	.L1539
	.word	.L1532
	.word	.L1540
	.word	.L1541
	.word	.L1532
	.word	.L1542
	.word	.L1543
	.word	.L1544
	.word	.L1544
	.word	.L1544
	.word	.L1545
	.word	.L1532
	.word	.L1546
	.word	.L1547
	.word	.L1548
.L1547:
	add	r0, r0, #294912
	str	r3, [sp, #4]
	add	r0, r0, #3392
	mov	r3, r2
	str	r6, [sp]
	mov	r2, #1
	bl	HEVCDEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r7, .L1572
	add	r3, r3, #294912
	ldrb	r3, [r3, #3399]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1566
.L1551:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #299008
	strne	r2, [r3, #1624]
.L1532:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1548:
	add	r0, r0, #294912
	mov	r2, r6
	add	r0, r0, #3392
	bl	VP9DEC_VDMPostProc
	cmp	r6, #1
	bne	.L1564
	b	.L1532
.L1535:
	add	r0, r0, #294912
	str	r3, [sp, #4]
	add	r0, r0, #3392
	mov	r3, r2
	str	r6, [sp]
	mov	r2, #1
	bl	H264DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r7, .L1572
	add	r3, r3, #311296
	ldrb	r3, [r3, #568]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1567
.L1549:
	cmp	r6, #1
	ldrne	r3, [r5, r4, asl #2]
	movne	r2, #0
	addne	r3, r3, #294912
	strne	r2, [r3, #3752]
	b	.L1532
.L1538:
	add	r0, r0, #294912
	add	r0, r0, #3392
	bl	MPEG4DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1572
	add	r2, r3, #319488
	ldrb	r2, [r2, #1836]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1568
.L1554:
	add	r3, r3, #299008
	mov	r2, #0
	str	r2, [r3, #332]
	b	.L1532
.L1539:
	add	r0, r0, #294912
	ldr	r6, .L1572
	add	r0, r0, #3392
	bl	MPEG2DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r2, r3, #385024
	ldrb	r2, [r2, #3922]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1569
.L1556:
	add	r3, r3, #294912
	mov	r2, #0
	str	r2, [r3, #3396]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1537:
	add	r0, r0, #294912
	ldr	r6, .L1572
	add	r0, r0, #3392
	bl	VC1DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r2, r3, #307200
	ldrb	r2, [r2, #3839]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L1556
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #307200
	strb	r1, [r2, #3839]
	b	.L1556
.L1540:
	mov	r0, r3
	str	r1, [fp, #-32]
	bl	VDMDRV_GetSwitchRounding
	ldr	r3, [r5, r4, asl #2]
	ldr	r1, [fp, #-32]
	mov	r2, r0
	add	r0, r3, #294912
	add	r0, r0, #3392
	bl	DIVX3DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #3396]
	b	.L1532
.L1541:
	add	r0, r0, #294912
	ldr	r6, .L1572
	add	r0, r0, #3392
	bl	AVSDEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	add	r3, r3, #294912
	ldrb	r2, [r3, #3392]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1570
.L1555:
	mov	r2, #0
	str	r2, [r3, #3408]
	b	.L1532
.L1542:
	mov	r0, r3
	str	r1, [fp, #-32]
	bl	VDMDRV_GetMb0QpInCurrPic
	ldr	r3, [r5, r4, asl #2]
	ldr	r1, [fp, #-32]
	mov	r2, r0
	add	r0, r3, #294912
	add	r0, r0, #3392
	bl	REAL8DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #3396]
	b	.L1532
.L1543:
	mov	r0, r3
	str	r1, [fp, #-32]
	bl	VDMDRV_GetMb0QpInCurrPic
	ldr	r3, [r5, r4, asl #2]
	ldr	r1, [fp, #-32]
	mov	r2, r0
	add	r0, r3, #294912
	add	r0, r0, #3392
	bl	REAL9DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #3396]
	b	.L1532
.L1544:
	add	r0, r0, #294912
	add	r0, r0, #3392
	bl	VP6DEC_VDMPostProc
.L1564:
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #3396]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1546:
	add	r0, r0, #294912
	mov	r2, #1
	add	r0, r0, #3392
	bl	MVC_DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	ldr	r5, .L1572
	add	r3, r3, #294912
	ldrb	r2, [r3, #3393]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1571
.L1557:
	mov	r2, #0
	str	r2, [r3, #3620]
	b	.L1532
.L1545:
	add	r0, r0, #294912
	add	r0, r0, #3392
	bl	VP8DEC_VDMPostProc
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	str	r2, [r3, #3396]
	b	.L1532
.L1565:
	ldr	r3, .L1572+4
	movw	r2, #4676
	ldr	r1, .L1572+8
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1568:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #319488
	strb	r1, [r2, #1836]
	b	.L1554
.L1569:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r3, #385024
	strb	r1, [r2, #3922]
	b	.L1556
.L1571:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r5, r4, asl #2]
	mov	r1, #0
	add	r2, r2, #294912
	mov	r3, r2
	strb	r1, [r2, #3393]
	b	.L1557
.L1570:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r2, [r6, r4, asl #2]
	mov	r1, #0
	add	r2, r2, #294912
	mov	r3, r2
	strb	r1, [r2, #3392]
	b	.L1555
.L1567:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #311296
	strb	r2, [r3, #568]
	b	.L1549
.L1566:
	mov	r0, r4
	bl	VCTRL_OutputLastFrame
	ldr	r3, [r7, r4, asl #2]
	mov	r2, #0
	add	r3, r3, #294912
	strb	r2, [r3, #3399]
	b	.L1551
.L1573:
	.align	2
.L1572:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_PostProc, .-VCTRL_PostProc
	.align	2
	.global	VCTRL_VdmPostProc
	.type	VCTRL_VdmPostProc, %function
VCTRL_VdmPostProc:
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
	mov	r6, r2
	mov	r7, r3
	mov	r4, r0
	mov	r5, r1
	ldrhi	r3, .L1581
	movwhi	r2, #4869
	bhi	.L1579
	ldr	ip, .L1581+4
	ldr	ip, [ip, r0, asl #2]
	cmp	ip, #0
	beq	.L1580
	ldr	ip, [ip, #8]
	cmp	ip, #1
	beq	.L1577
	ldr	r3, .L1581+8
	movw	r2, #4871
.L1579:
	ldr	r1, .L1581+12
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1577:
	bl	VCTRL_GetDecParam
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_PostProc
.L1580:
	mov	r0, ip
	ldr	r3, .L1581+16
	movw	r2, #4870
	ldr	r1, .L1581+12
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1582:
	.align	2
.L1581:
	.word	.LC103
	.word	.LANCHOR0
	.word	.LC104
	.word	.LC1
	.word	.LC86
	UNWIND(.fnend)
	.size	VCTRL_VdmPostProc, .-VCTRL_VdmPostProc
	.align	2
	.global	VCTRL_SvdecLastFrame
	.type	VCTRL_SvdecLastFrame, %function
VCTRL_SvdecLastFrame:
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
	add	r1, r1, #2
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_ReportLastFrame
	UNWIND(.fnend)
	.size	VCTRL_SvdecLastFrame, .-VCTRL_SvdecLastFrame
	.align	2
	.global	Get_YuvFormat
	.type	Get_YuvFormat, %function
Get_YuvFormat:
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
	cmp	r1, #6
	ldrls	pc, [pc, r1, asl #2]
	b	.L1585
.L1587:
	.word	.L1586
	.word	.L1588
	.word	.L1589
	.word	.L1590
	.word	.L1591
	.word	.L1592
	.word	.L1593
.L1593:
	cmp	r0, #1
	moveq	r0, #1
	movne	r0, #7
	ldmfd	sp, {fp, sp, pc}
.L1586:
	cmp	r0, #1
	moveq	r0, #0
	movne	r0, #6
	ldmfd	sp, {fp, sp, pc}
.L1588:
	cmp	r0, #1
	moveq	r0, #2
	movne	r0, #8
	ldmfd	sp, {fp, sp, pc}
.L1589:
	cmp	r0, #1
	moveq	r0, #4
	movne	r0, #10
	ldmfd	sp, {fp, sp, pc}
.L1590:
	cmp	r0, #1
	moveq	r0, #3
	movne	r0, #9
	ldmfd	sp, {fp, sp, pc}
.L1591:
	cmp	r0, #1
	moveq	r0, #5
	movne	r0, #11
	ldmfd	sp, {fp, sp, pc}
.L1592:
	cmp	r0, #1
	moveq	r0, #13
	movne	r0, #12
	ldmfd	sp, {fp, sp, pc}
.L1585:
	mov	r3, r1
	movw	r2, #8854
	ldr	r1, .L1602
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #13
	ldmfd	sp, {fp, sp, pc}
.L1603:
	.align	2
.L1602:
	.word	.LC171
	UNWIND(.fnend)
	.size	Get_YuvFormat, .-Get_YuvFormat
	.align	2
	.global	VDH_PutUsrdecFrame
	.type	VDH_PutUsrdecFrame, %function
VDH_PutUsrdecFrame:
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
	mov	r5, r1
	ldr	r1, [r1, #40]
	mov	r10, r0
	bl	FSP_GetLogicIdByPhyAddr
	cmn	r0, #1
	mov	r7, r0
	beq	.L1612
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L1607
	mov	r1, r0
	mov	r2, #0
	mov	r0, r10
	bl	FSP_ClearLogicFs
	mov	r0, #0
.L1606:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1607:
	ldr	r0, [r5, #48]
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L1613
.L1608:
	mov	r1, r7
	mov	r0, r10
	bl	FSP_GetFsImagePtr
	subs	r4, r0, #0
	beq	.L1614
	str	r7, [r4, #180]
	add	ip, r4, #640
	ldrd	r2, [r5, #64]
	add	r0, r4, #656
	mov	r6, #0
	mov	r8, #1
	add	r1, r4, #560
	str	r1, [fp, #-48]
	strd	r2, [ip, #-8]
	ldrd	r2, [r5, #64]
	strd	r2, [ip]
	ldrd	r2, [r5, #64]
	strd	r2, [r0, #-8]
	ldrd	r2, [r5, #64]
	strd	r2, [r0]
	str	r8, [r4, #8]
	str	r6, [r4, #12]
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	ldr	r3, [r5, #40]
	str	r3, [r4, #28]
	mov	r0, r3
	str	r3, [r4, #60]
	str	r3, [r4, #44]
	ldr	r3, [r5, #48]
	str	r3, [r4, #32]
	str	r3, [r4, #64]
	str	r3, [r4, #48]
	bl	MEM_Phy2Vir
	ldr	r1, [fp, #-48]
	str	r0, [r4, #560]
	str	r6, [r1, #4]
	str	r0, [r4, #544]
	str	r6, [r4, #548]
	ldr	r0, [r4, #32]
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-48]
	str	r6, [r4, #572]
	mov	r1, r6
	mov	r2, #4
	str	r0, [r4, #568]
	str	r0, [r3, #-8]
	add	r0, r4, #124
	str	r6, [r3, #-4]
	ldr	r3, [r5, #44]
	ldr	ip, [r4, #28]
	ldr	lr, [r4, #32]
	add	ip, r3, ip
	str	ip, [r4, #36]
	ldr	r3, [r5, #44]
	str	r6, [r4, #112]
	add	r3, r3, lr
	str	r3, [r4, #40]
	ldr	r3, [r5, #12]
	ldr	ip, .L1616
	str	r3, [r4, #128]
	ldr	r3, [r5, #16]
	ldr	ip, [ip, #48]
	str	r3, [r4, #132]
	ldr	r3, [r5, #12]
	mov	lr, r3, lsr r8
	str	r3, [r4, #136]
	ldr	r3, [r5, #16]
	str	lr, [r4, #144]
	str	r3, [r4, #140]
	mov	r3, r3, lsr r8
	str	r3, [r4, #148]
	ldr	r3, [r5, #44]
	str	r6, [r4, #160]
	str	r6, [r4, #184]
	str	r3, [r4, #164]
	str	r8, [r4, #196]
	blx	ip
	ldrb	r3, [r4, #125]	@ zero_extendqisi2
	ldrb	r2, [r4, #124]	@ zero_extendqisi2
	and	r3, r3, #252
	orr	r3, r3, #12
	and	r2, r2, #224
	bfi	r3, r8, #4, #2
	bfi	r2, r8, #5, #3
	strb	r3, [r4, #125]
	strb	r2, [r4, #124]
	ldr	r0, [r5, #24]
	str	r0, [r4, #244]
	bl	MEM_Phy2Vir
	str	r6, [r4, #580]
	str	r0, [r4, #576]
	ldr	r1, [r5]
	ldr	r0, [r5, #8]
	bl	Get_YuvFormat
	cmp	r0, #13
	beq	.L1615
	str	r0, [r4, #504]
	mov	r2, r8
	ldr	r3, [r5, #56]
	mov	r8, #20
	mov	r1, r7
	mov	r0, r10
	str	r3, [r4, #480]
	ldr	r3, [r5, #60]
	str	r3, [r4, #476]
	ldr	r3, [r5, #52]
	str	r8, [r4, #412]
	str	r3, [r4, #484]
	bl	FSP_SetDisplay
	ldr	r2, .L1616+4
	str	r4, [sp]
	movw	r3, #36168
	mov	r1, r8
	movt	r3, 4
	ldr	ip, [r2, r10, asl #2]
	mov	r0, r10
	add	r2, ip, #294912
	add	r3, ip, r3
	add	r2, r2, #3392
	bl	InsertImgToVoQueue
	cmp	r0, #1
	moveq	r0, r6
	beq	.L1606
	add	r5, r4, #608
	mov	r0, r10
	ldr	r1, [r4, #600]
	mov	r8, #0
	bl	FreeUsdByDec
	mov	r9, #0
	mov	r0, r10
	strd	r8, [r5, #-8]
	ldr	r1, [r4, #608]
	bl	FreeUsdByDec
	mov	r0, r10
	strd	r8, [r5]
	mov	r2, r6
	mov	r1, r7
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L1606
.L1613:
	ldr	r3, [r5, #4]
	cmp	r3, #1
	bne	.L1608
	ldr	r2, [r5, #48]
	ldr	r1, .L1616+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1606
.L1612:
	ldr	r2, [r5, #40]
	mov	r0, #0
	ldr	r1, .L1616+12
	bl	dprint_vfmw
	mov	r0, r7
	b	.L1606
.L1615:
	mov	r2, r0
	ldr	r1, .L1616+16
	mov	r0, r8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1606
.L1614:
	movw	r2, #5363
	ldr	r1, .L1616+20
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1606
.L1617:
	.align	2
.L1616:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC173
	.word	.LC172
	.word	.LC175
	.word	.LC174
	UNWIND(.fnend)
	.size	VDH_PutUsrdecFrame, .-VDH_PutUsrdecFrame
	.align	2
	.global	VCTRL_PutUsrdecFrame
	.type	VCTRL_PutUsrdecFrame, %function
VCTRL_PutUsrdecFrame:
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
	ldr	r5, .L1629
	mov	r4, r0
	mov	r0, r1
	ldr	r3, [r5, r4, asl #2]
	cmp	r3, #0
	beq	.L1626
	cmp	r1, #0
	beq	.L1627
	ldr	r2, [r3, #544]
	cmp	r2, #20
	bne	.L1628
	ldr	ip, .L1629+4
	add	r0, r3, #472
	mov	r2, #72
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r1, [r5, r4, asl #2]
	mov	r0, r4
	add	r1, r1, #472
	bl	VDH_PutUsrdecFrame
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, .L1629+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1628:
	ldr	r1, .L1629+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1627:
	ldr	r3, .L1629+16
	movw	r2, #5511
	ldr	r1, .L1629+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1626:
	mov	r0, r3
	movw	r2, #5510
	ldr	r3, .L1629+24
	ldr	r1, .L1629+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1630:
	.align	2
.L1629:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC178
	.word	.LC177
	.word	.LC176
	.word	.LC1
	.word	.LC2
	UNWIND(.fnend)
	.size	VCTRL_PutUsrdecFrame, .-VCTRL_PutUsrdecFrame
	.align	2
	.global	VCTRL_ResetHardware
	.type	VCTRL_ResetHardware, %function
VCTRL_ResetHardware:
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
	bl	SCDDRV_ResetSCD
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	VDMDRV_ResetVDH
	UNWIND(.fnend)
	.size	VCTRL_ResetHardware, .-VCTRL_ResetHardware
	.align	2
	.global	VCTRL_CanBeDecodedByHardWare
	.type	VCTRL_CanBeDecodedByHardWare, %function
VCTRL_CanBeDecodedByHardWare:
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
	cmp	r0, #4
	cmpne	r0, #7
	beq	.L1633
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VCTRL_CanBeDecodedByHardWare.part.18
.L1633:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_CanBeDecodedByHardWare, .-VCTRL_CanBeDecodedByHardWare
	.align	2
	.global	VCTRL_IsChanOpenAndRun
	.type	VCTRL_IsChanOpenAndRun, %function
VCTRL_IsChanOpenAndRun:
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
	ldr	r3, [r0, #4]
	cmp	r3, #1
	ldreq	r0, [r0, #8]
	subeq	r0, r0, #1
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VCTRL_IsChanOpenAndRun, .-VCTRL_IsChanOpenAndRun
	.align	2
	.global	VCTRL_OpenHardware
	.type	VCTRL_OpenHardware, %function
VCTRL_OpenHardware:
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
	movwhi	r2, #8911
	ldrhi	r1, .L1683
	bhi	.L1673
	ldr	r5, .L1683+4
	ldr	r0, [r5, r0, asl #2]
	cmp	r0, #0
	beq	.L1674
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L1640
	ldr	r0, [r0, #544]
	cmp	r0, #21
	beq	.L1640
	cmp	r0, #4
	cmpne	r0, #7
	moveq	r7, #1
	movne	r7, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	bl	VCTRL_CanBeDecodedByHardWare.part.18
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r4, r7
.L1646:
	mov	r0, r4
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L1645
	ldr	r3, [r5, r4, asl #2]
	ldr	r0, [r3, #544]
	cmp	r0, #4
	cmpne	r0, #7
	beq	.L1645
	bl	VCTRL_CanBeDecodedByHardWare.part.18
	cmp	r0, #0
	addne	r7, r7, #1
.L1645:
	add	r4, r4, #1
	cmp	r4, #32
	bne	.L1646
	cmp	r7, #1
	beq	.L1675
.L1647:
	ldr	r3, .L1683+8
	mov	r1, #0
	add	r0, r3, #128
.L1654:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L1653
	ldr	r2, [r2, #544]
	cmp	r2, #6
	moveq	r1, #1
.L1653:
	cmp	r3, r0
	bne	.L1654
	cmp	r1, #1
	beq	.L1676
.L1655:
	ldr	r3, [r5, r6, asl #2]
	ldr	r3, [r3, #544]
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, .L1683+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1677
	ldr	r3, .L1683+16
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	bx	r3	@ indirect register sibling call
.L1640:
	ldr	r1, .L1683+20
	movw	r2, #8923
.L1673:
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1675:
	ldr	r4, .L1683+12
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1678
	mov	r0, r7
	mov	r1, #0
	bl	VDH_Need_Module
.L1650:
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1651
	ldr	r3, .L1683+16
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L1679
	mov	r0, #0
	blx	r3
	b	.L1647
.L1676:
	ldr	r3, .L1683+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1680
	mov	r1, #0
	mov	r0, #3
	bl	VDH_Need_Module
	b	.L1655
.L1680:
	ldr	r3, .L1683+16
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1681
	mov	r0, #0
	blx	r3
	b	.L1655
.L1678:
	ldr	r3, .L1683+16
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1682
	mov	r0, #0
	blx	r3
	b	.L1650
.L1674:
	movw	r2, #8917
	ldr	r1, .L1683+24
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L1677:
	mov	r1, #0
	mov	r0, #2
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VDH_Need_Module
.L1651:
	mov	r1, #0
	mov	r0, r1
	bl	VDH_Need_Module
	b	.L1647
.L1679:
	mov	r0, r3
	movw	r2, #8971
	ldr	r1, .L1683+28
	bl	dprint_vfmw
	b	.L1647
.L1681:
	mov	r0, r3
	movw	r2, #9002
	ldr	r1, .L1683+28
	bl	dprint_vfmw
	b	.L1655
.L1682:
	mov	r0, r3
	movw	r2, #8957
	ldr	r1, .L1683+28
	bl	dprint_vfmw
	b	.L1650
.L1684:
	.align	2
.L1683:
	.word	.LC179
	.word	.LANCHOR0
	.word	.LANCHOR0-4
	.word	g_HalDisable
	.word	g_vdm_hal_fun_ptr
	.word	.LC181
	.word	.LC180
	.word	.LC29
	UNWIND(.fnend)
	.size	VCTRL_OpenHardware, .-VCTRL_OpenHardware
	.align	2
	.global	VCTRL_StartChan
	.type	VCTRL_StartChan, %function
VCTRL_StartChan:
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
	bhi	.L1696
	ldr	r4, .L1700
	ldr	r3, [r4, r0, asl #2]
	cmp	r3, #0
	beq	.L1697
	ldr	r6, [r3, #4]
	cmp	r6, #1
	bne	.L1698
	ldr	r3, [r3, #544]
	cmp	r3, #21
	beq	.L1699
	bl	SM_Start
	ldr	r3, [r4, r5, asl #2]
	mov	r2, #0
	str	r6, [r3, #8]
	ldr	r3, [r4, r5, asl #2]
	str	r6, [r3, #12]
	ldr	r3, [r4, r5, asl #2]
	str	r2, [r3, #24]
	ldr	r3, [r4, r5, asl #2]
	str	r6, [r3, #16]
	ldr	r2, [r4, r5, asl #2]
	ldr	r3, [r2, #20]
	cmp	r3, #0
	bne	.L1691
	ldr	r3, .L1700+4
	sub	ip, r4, #4
	ldr	r1, .L1700+8
	add	r4, r3, #128
	str	r6, [r2, #20]
.L1694:
	ldr	r2, [ip, #4]!
	add	r3, r3, #4
	add	r1, r1, #4
	cmp	r2, #0
	streq	r2, [r3, #-4]
	ldrne	lr, [r2, #20]
	strne	lr, [r3, #-4]
	ldrne	r2, [r2, #20]
	cmp	r3, r4
	str	r2, [r1, #-4]
	bne	.L1694
	ldr	r0, .L1700+4
	bl	VDMDRV_SetPriority
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
.L1691:
	ldr	r4, .L1700+12
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r5
	bl	VCTRL_OpenHardware
	mov	r2, #12
	ldr	r3, [r4, #48]
	mov	r1, #0
	ldr	r0, .L1700+16
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #720
	mov	r1, #0
	ldr	r0, .L1700+20
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #2
	mov	r1, #0
	ldr	r0, .L1700+24
	blx	r3
	ldr	r3, [r4, #48]
	mov	r2, #120
	mov	r1, #0
	ldr	r0, .L1700+28
	blx	r3
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1698:
	ldr	r3, .L1700+32
	movw	r2, #2506
	ldr	r1, .L1700+36
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1696:
	ldr	r3, .L1700+40
	movw	r2, #2504
	ldr	r1, .L1700+36
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1699:
	ldr	r3, .L1700+44
	movw	r2, #2507
	ldr	r1, .L1700+36
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1697:
	mov	r0, r3
	movw	r2, #2505
	ldr	r3, .L1700+48
	ldr	r1, .L1700+36
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1701:
	.align	2
.L1700:
	.word	.LANCHOR0
	.word	.LANCHOR4+1292
	.word	g_ChanCtx
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_TimeRecId
	.word	g_TimeRecTable
	.word	g_DataRecId
	.word	g_DataTable
	.word	.LC109
	.word	.LC1
	.word	.LC57
	.word	.LC182
	.word	.LC64
	UNWIND(.fnend)
	.size	VCTRL_StartChan, .-VCTRL_StartChan
	.align	2
	.type	VfmwProc_TestStartChan, %function
VfmwProc_TestStartChan:
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
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_StartChan
	mov	r2, r4
	ldr	r1, .L1703
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L1704:
	.align	2
.L1703:
	.word	.LC183
	UNWIND(.fnend)
	.size	VfmwProc_TestStartChan, .-VfmwProc_TestStartChan
	.align	2
	.global	VCTRL_CloseHardware
	.type	VCTRL_CloseHardware, %function
VCTRL_CloseHardware:
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
	ldr	r5, .L1766
	mov	r8, #0
	mov	r10, r0
	mov	r7, r8
	add	r9, r5, #128
	mov	r1, r8
	b	.L1715
.L1756:
	ldr	r3, [r4, #4]
	cmp	r3, #1
	beq	.L1754
.L1711:
	cmp	r8, #0
	cmpeq	r6, #6
	bne	.L1706
	ldr	r3, [r4, #4]
	cmp	r3, #1
	beq	.L1735
.L1706:
	cmp	r5, r9
	beq	.L1755
.L1715:
	ldr	r4, [r5, #4]!
	cmp	r4, #0
	beq	.L1706
	cmp	r1, #0
	ldr	r6, [r4, #544]
	beq	.L1756
	cmp	r7, #0
	cmpeq	r6, #1
	bne	.L1711
	ldr	r3, [r4, #4]
	cmp	r3, #1
	bne	.L1706
.L1734:
	ldr	r3, [r4, #8]
	cmp	r3, #1
	moveq	r7, #1
	cmp	r8, #0
	cmpeq	r6, #6
	bne	.L1706
.L1735:
	ldr	r3, [r4, #8]
	cmp	r3, #1
	moveq	r8, #1
	cmp	r5, r9
	bne	.L1715
.L1755:
	cmp	r1, #0
	beq	.L1757
.L1716:
	cmp	r8, #0
	bne	.L1728
	ldr	r3, .L1766+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1758
	mov	r1, r8
	mov	r0, #3
	bl	VDH_UnNeed_Module
.L1728:
	cmp	r7, #0
	bne	.L1705
.L1763:
	ldr	r3, .L1766+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1759
	ldr	r3, .L1766+8
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1705
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	bx	r3	@ indirect register sibling call
.L1754:
	ldr	r3, [r4, #8]
	cmp	r3, #1
	beq	.L1760
.L1710:
	cmp	r7, #0
	cmpeq	r6, #1
	beq	.L1734
	b	.L1711
.L1760:
	cmp	r6, #7
	cmpne	r6, #4
	beq	.L1710
	mov	r0, r6
	bl	VCTRL_CanBeDecodedByHardWare.part.18
	adds	r1, r0, #0
	movne	r1, #1
	b	.L1710
.L1757:
	ldr	r4, .L1766+4
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1721
	mov	r0, r10
	str	r1, [fp, #-48]
	bl	SCDDRV_ResetSCD
	mov	r0, r10
	bl	VDMDRV_ResetVDH
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r1, [fp, #-48]
	cmp	r3, #1
	beq	.L1721
	mov	r0, #1
	bl	VDH_UnNeed_Module
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1724
.L1765:
	ldr	r3, .L1766+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L1761
	mov	r0, #0
	blx	r3
.L1727:
	mov	r0, #0
	bl	SCDDRV_SetStateIdle
	b	.L1716
.L1758:
	ldr	r3, .L1766+8
	mov	r0, r8
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L1762
	blx	r3
	cmp	r7, #0
	beq	.L1763
.L1705:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1759:
	mov	r1, r7
	mov	r0, #2
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDH_UnNeed_Module
.L1721:
	ldr	r3, .L1766+8
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L1764
	mov	r0, #0
	blx	r3
.L1723:
	mov	r0, #0
	bl	VDMDRV_SetStateIdle
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1765
.L1724:
	mov	r1, #0
	mov	r0, r1
	bl	VDH_UnNeed_Module
	b	.L1716
.L1761:
	mov	r0, r3
	movw	r2, #9100
	ldr	r1, .L1766+12
	bl	dprint_vfmw
	b	.L1727
.L1762:
	movw	r2, #9118
	ldr	r1, .L1766+12
	bl	dprint_vfmw
	b	.L1728
.L1764:
	mov	r0, r3
	movw	r2, #9085
	ldr	r1, .L1766+12
	bl	dprint_vfmw
	b	.L1723
.L1767:
	.align	2
.L1766:
	.word	.LANCHOR0-4
	.word	g_HalDisable
	.word	g_vdm_hal_fun_ptr
	.word	.LC29
	UNWIND(.fnend)
	.size	VCTRL_CloseHardware, .-VCTRL_CloseHardware
	.align	2
	.global	VCTRL_StopChan
	.type	VCTRL_StopChan, %function
VCTRL_StopChan:
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
	mov	r4, r0
	bhi	.L1774
	ldr	r6, .L1776
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1775
	ldr	r2, [r3, #4]
	cmp	r2, #1
	bne	.L1773
	str	r2, [r3, #24]
	mov	r3, #0
	ldr	r2, [r6, r0, asl #2]
	str	r3, [r2, #12]
	ldr	r2, [r6, r0, asl #2]
	str	r3, [r2, #8]
	bl	SM_Stop
	subs	r5, r0, #0
	bne	.L1773
	mov	r1, r5
	mov	r0, r4
	bl	DeleteRawPacketInBuffer
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	ldr	r3, [r6, r4, asl #2]
	mov	r0, r4
	str	r5, [r3, #24]
	bl	VCTRL_CloseHardware
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1773:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1774:
	ldr	r3, .L1776+4
	movw	r2, #2598
	ldr	r1, .L1776+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1775:
	mov	r0, r3
	movw	r2, #2599
	ldr	r3, .L1776+12
	ldr	r1, .L1776+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1777:
	.align	2
.L1776:
	.word	.LANCHOR0
	.word	.LC57
	.word	.LC1
	.word	.LC184
	UNWIND(.fnend)
	.size	VCTRL_StopChan, .-VCTRL_StopChan
	.align	2
	.global	VCTRL_StopChanWithCheck
	.type	VCTRL_StopChanWithCheck, %function
VCTRL_StopChanWithCheck:
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
	ldr	r5, .L1785
	mov	r7, r0
	mov	r4, #0
	mov	r8, r5
	b	.L1780
.L1784:
	add	r4, r4, #1
	ldr	r3, [r8, #120]
	blx	r3
	cmp	r4, #50
	beq	.L1782
.L1780:
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	mov	r0, r7
	bl	VCTRL_StopChan
	ldr	r3, [r5, #16]
	mov	r6, r0
	mov	r0, #0
	blx	r3
	cmp	r6, #0
	mov	r0, #10
	bne	.L1784
	cmp	r4, #49
	bgt	.L1782
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1782:
	ldr	r1, .L1785+4
	mvn	r6, #0
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1786:
	.align	2
.L1785:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC185
	UNWIND(.fnend)
	.size	VCTRL_StopChanWithCheck, .-VCTRL_StopChanWithCheck
	.align	2
	.global	VCTRL_ResetChanWithOption
	.type	VCTRL_ResetChanWithOption, %function
VCTRL_ResetChanWithOption:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	r5, .L1820
	mov	r4, r0
	mov	r6, r1
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L1814
	ldr	r2, [r1]
	cmp	r2, #1
	bhi	.L1815
	ldr	r9, [r3, #8]
	bl	VCTRL_StopChan
	ldr	r7, .L1820+4
	mov	r8, #0
	ldr	r3, [r5, r4, asl #2]
	mov	r2, #300
	ldr	r0, .L1820+8
	mov	r1, r8
	ldr	ip, [r7, #48]
	str	r8, [r3, #388]
	str	r8, [r3, #392]
	mla	r0, r2, r4, r0
	blx	ip
	ldr	r3, [r5, r4, asl #2]
	cmp	r3, r8
	addne	r3, r3, #290816
	strne	r8, [r3, #3188]
	beq	.L1816
.L1792:
	ldr	r3, [r7, #12]
	mov	r0, #4
	blx	r3
	mov	r0, r4
	bl	VCTRL_FindOccupiedFrame
	ldr	r3, [r7, #16]
	mov	r0, #4
	blx	r3
	ldr	r2, [r6, #4]
	ldr	r3, [r5, r4, asl #2]
	mov	r0, r4
	str	r2, [r3, #1160]
	bl	InitSyntaxCtx
	ldr	r3, [r5, r4, asl #2]
	add	r1, r3, #294912
	ldr	r0, [r3, #544]
	add	r1, r1, #3392
	bl	ReleaseCurPic
	ldr	r0, [r5, r4, asl #2]
	ldr	r3, [r7, #48]
	mov	r2, #416
	mov	r1, #0
	add	r0, r0, #688
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	mvn	r0, #0
	mvn	r1, #0
	add	lr, r3, #608
	add	ip, r3, #624
	mov	r2, #0
	strd	r0, [lr]
	strd	r0, [ip, #-8]
	mov	r0, r4
	ldr	r1, [r3, #1384]
	str	r2, [r3, #1104]
	cmp	r1, #1
	streq	r2, [r3, #1424]
	ldr	r3, [r3, #544]
	cmp	r3, #20
	beq	.L1794
	ldr	r3, [r6, #8]
	cmp	r3, #0
	beq	.L1817
.L1794:
	bl	FSP_EmptyInstance
.L1795:
	mov	r0, r4
	bl	InitUsdPool
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L1818
.L1796:
	ldr	r2, [r5, #540]
	ldr	r3, .L1820
	cmp	r2, #0
	beq	.L1797
	add	r5, r3, r4, lsl #2
	str	r4, [fp, #-40]
	ldr	r3, [r5, #952]
	cmp	r3, #0
	beq	.L1799
	mov	r0, #512
	sub	r1, fp, #40
	bl	VCTRL_SetDbgOption
	ldr	r3, [r5, #952]
	cmp	r3, #0
	beq	.L1799
	sub	r1, fp, #40
	mov	r0, #512
	bl	VCTRL_SetDbgOption
.L1799:
	ldr	r1, .L1820+12
	mov	r0, #32
	bl	dprint_vfmw
.L1797:
	cmp	r9, #0
	bne	.L1819
.L1801:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1789:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1818:
	mov	r0, r4
	bl	SM_Reset
	b	.L1796
.L1819:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1801
.L1817:
	bl	FSP_ResetInstance
	b	.L1795
.L1815:
	movw	r2, #3490
	ldr	r1, .L1820+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1816:
	bl	VCTRL_SetSendStreamAgainFlag.part.11
	b	.L1792
.L1814:
	mov	r0, r3
	movw	r2, #3486
	ldr	r3, .L1820+20
	ldr	r1, .L1820+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1789
.L1821:
	.align	2
.L1820:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3-124
	.word	.LC187
	.word	.LC186
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_ResetChanWithOption, .-VCTRL_ResetChanWithOption
	.align	2
	.global	VCTRL_ResetChan
	.type	VCTRL_ResetChan, %function
VCTRL_ResetChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	r5, .L1849
	mov	r4, r0
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L1845
	ldr	r8, [r3, #8]
	bl	VCTRL_StopChan
	ldr	r7, .L1849+4
	mov	r6, #0
	ldr	r3, [r5, r4, asl #2]
	mov	r0, #4
	ldr	r2, [r7, #12]
	str	r6, [r3, #388]
	str	r6, [r3, #392]
	blx	r2
	ldr	r3, [r5, r4, asl #2]
	ldr	r2, [r3, #1384]
	cmp	r2, #1
	beq	.L1846
.L1825:
	ldr	r0, .L1849+8
	mov	r2, #300
	ldr	r3, [r7, #48]
	mov	r1, #0
	mla	r0, r2, r4, r0
	blx	r3
	ldr	r3, [r5, r4, asl #2]
	cmp	r3, #0
	addne	r3, r3, #290816
	movne	r2, #0
	strne	r2, [r3, #3188]
	beq	.L1847
.L1827:
	ldr	r3, [r5, r4, asl #2]
	mov	r6, #0
	mov	r0, r4
	str	r6, [r3, #1160]
	bl	InitSyntaxCtx
	ldr	r0, [r5, r4, asl #2]
	mov	r1, r6
	ldr	r3, [r7, #48]
	mov	r2, #416
	add	r0, r0, #688
	blx	r3
	ldr	r1, [r5, r4, asl #2]
	mvn	r3, #0
	mvn	r2, #0
	add	r0, r1, #294912
	add	lr, r1, #608
	add	ip, r1, #624
	strd	r2, [lr]
	strd	r2, [ip, #-8]
	str	r6, [r1, #1104]
	str	r6, [r0, #3360]
	str	r6, [r0, #3352]
	str	r6, [r0, #3356]
	ldr	r3, [r1, #1384]
	cmp	r3, #1
	streq	r6, [r1, #1424]
	streq	r6, [r0, #3332]
	mov	r0, r4
	ldr	r3, [r1, #544]
	cmp	r3, #20
	beq	.L1829
	bl	FSP_ResetInstance
.L1830:
	ldr	r3, [r7, #16]
	mov	r0, #4
	blx	r3
	mov	r0, r4
	bl	InitUsdPool
	mov	r0, r4
	bl	SM_Reset
	ldr	r2, [r5, #540]
	ldr	r3, .L1849
	cmp	r2, #0
	beq	.L1831
	add	r5, r3, r4, lsl #2
	str	r4, [fp, #-40]
	ldr	r3, [r5, #952]
	cmp	r3, #0
	beq	.L1833
	mov	r0, #512
	sub	r1, fp, #40
	bl	VCTRL_SetDbgOption
	ldr	r3, [r5, #952]
	cmp	r3, #0
	beq	.L1833
	sub	r1, fp, #40
	mov	r0, #512
	bl	VCTRL_SetDbgOption
.L1833:
	ldr	r1, .L1849+12
	mov	r0, #32
	bl	dprint_vfmw
.L1831:
	cmp	r8, #0
	bne	.L1848
.L1835:
	mov	r0, r4
	bl	VDMDRV_ClearChanIsDec
	mov	r0, #0
.L1824:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1848:
	mov	r0, r4
	bl	VCTRL_StartChan
	b	.L1835
.L1829:
	bl	FSP_EmptyInstance
	b	.L1830
.L1846:
	add	r2, r3, #294912
	ldr	r1, [r3, #544]
	ldr	r2, [r2, #3384]
	cmp	r2, r1
	bne	.L1825
	str	r6, [r3, #12]
	mov	r0, r4
	bl	VCTRL_FindOccupiedFrame
	b	.L1825
.L1847:
	bl	VCTRL_SetSendStreamAgainFlag.part.11
	b	.L1827
.L1845:
	mov	r0, r3
	movw	r2, #3873
	ldr	r3, .L1849+16
	ldr	r1, .L1849+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1824
.L1850:
	.align	2
.L1849:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3-124
	.word	.LC187
	.word	.LC2
	.word	.LC1
	UNWIND(.fnend)
	.size	VCTRL_ResetChan, .-VCTRL_ResetChan
	.align	2
	.global	VCTRL_CreateChan
	.type	VCTRL_CreateChan, %function
VCTRL_CreateChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 224
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #236)
	sub	sp, sp, #236
	ldr	r7, .L1941
	mov	r8, r1
	mov	r4, r0
	mov	r1, #0
	mov	r5, r2
	ldr	r3, [r7, #48]
	mov	r2, #24
	sub	r0, fp, #228
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #36
	mov	r1, #0
	sub	r0, fp, #176
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #96
	mov	r1, #0
	sub	r0, fp, #140
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #16
	mov	r1, #0
	sub	r0, fp, #260
	blx	r3
	ldr	r3, [r7, #48]
	sub	r0, fp, #244
	mov	r2, #16
	mov	r1, #0
	blx	r3
	ldr	r3, .L1941+4
	cmp	r8, #0
	str	r8, [r3, #1420]
	beq	.L1924
	ldr	r3, [r8, #36]
	cmp	r3, #0
	blt	.L1854
	ldr	r3, [r8, #12]
	cmp	r3, #31
	ble	.L1854
	ldr	r3, [r8, #16]
	cmp	r3, #31
	ble	.L1854
	ldr	r3, [r8, #56]
	cmp	r3, #262144
	blt	.L1854
	ldr	r1, [r8, #44]
	cmp	r1, #1
	beq	.L1925
	cmp	r1, #2
	bne	.L1856
	ldr	r3, [r8, #20]
	cmp	r3, #0
	ble	.L1854
	ldr	r3, [r8, #24]
	cmp	r3, #0
	ble	.L1854
.L1921:
	ldr	r3, [r8, #28]
	cmp	r3, #0
	ble	.L1854
	ldr	r3, [r8, #32]
	cmp	r3, #0
	bgt	.L1856
.L1854:
	ldr	r1, .L1941+8
	mov	r0, #0
	bl	dprint_vfmw
.L1894:
	mvn	r6, #0
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1856:
	ldr	r3, [r8, #176]
	mov	ip, #16640
	movt	ip, 12
	sub	r2, fp, #244
	cmp	r3, #1
	mov	r9, #640
	mov	r1, r8
	mov	r0, r4
	movhi	r3, #0
	strhi	r3, [r8, #176]
	cmp	r4, #26
	mov	r3, r5
	mov	r5, #1
	str	r5, [r8, #200]
	str	r5, [r8, #204]
	movt	r9, 178
	movne	r9, ip
	bl	VCTRL_GetChanMemSize
	subs	r6, r0, #0
	bne	.L1926
	mov	r1, r6
	ldr	r3, [r7, #48]
	mov	r2, #24
	sub	r0, fp, #200
	blx	r3
	ldrd	r2, [r8, #136]
	ldr	r6, .L1941
	orrs	r3, r2, r3
	beq	.L1862
	ldr	r3, [r8, #144]
	cmp	r3, #0
	bne	.L1863
.L1862:
	mov	r0, #7
	mov	r3, #3
	mov	r5, #1
	str	r3, [fp, #-180]
	bl	VFMW_GetString
	ldr	r2, [fp, #-236]
	sub	r3, fp, #200
	str	r5, [sp]
	mov	r1, #0
	bl	MEM_AllocMemBlock
	subs	r6, r0, #0
	bne	.L1927
	ldr	r2, [fp, #-184]
	ldr	r1, [fp, #-196]
	ldr	r0, [fp, #-192]
	bl	MEM_AddMemRecord
	ldr	r1, [fp, #-192]
	ldr	r2, [fp, #-196]
	ldr	r3, [fp, #-184]
	str	r6, [fp, #-80]
	str	r5, [fp, #-252]
	str	r1, [fp, #-92]
	str	r2, [fp, #-84]
	str	r3, [fp, #-76]
.L1866:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	sub	r0, fp, #200
	blx	r3
	ldrd	r2, [r8, #88]
	ldr	r1, .L1941
	orrs	r3, r2, r3
	bne	.L1928
.L1895:
	ldr	r3, [r8, #176]
	cmp	r3, #1
	beq	.L1869
	mov	r0, #8
	mov	r3, #3
	str	r3, [fp, #-180]
	bl	VFMW_GetString
	mov	r3, #0
	ldr	r2, [fp, #-244]
	mov	r1, r3
	str	r3, [sp]
	sub	r3, fp, #200
	bl	MEM_AllocMemBlock
	subs	r5, r0, #0
	bne	.L1929
	ldr	r2, [fp, #-184]
	ldr	r1, [fp, #-196]
	ldr	r0, [fp, #-192]
	bl	MEM_AddMemRecord
	ldr	r0, [fp, #-192]
	ldr	r1, [fp, #-196]
	mov	r3, #1
	ldr	r2, [fp, #-184]
	str	r5, [fp, #-128]
	str	r0, [fp, #-140]
	str	r1, [fp, #-132]
	str	r2, [fp, #-124]
	str	r3, [fp, #-260]
.L1873:
	ldr	r3, [r7, #48]
	mov	r2, #24
	mov	r1, #0
	sub	r0, fp, #200
	blx	r3
	ldrd	r2, [r8, #112]
	ldr	r1, .L1941
	orrs	r3, r2, r3
	beq	.L1897
	ldr	r3, [r8, #120]
	cmp	r3, #0
	bne	.L1877
.L1897:
	mov	r0, #9
	mov	r3, #3
	str	r3, [fp, #-180]
	bl	VFMW_GetString
	mov	r1, #0
	ldr	r2, [fp, #-240]
	sub	r3, fp, #200
	str	r1, [sp]
	bl	MEM_AllocMemBlock
	subs	r6, r0, #0
	bne	.L1930
	ldr	r2, [fp, #-184]
	ldr	r1, [fp, #-196]
	ldr	r0, [fp, #-192]
	bl	MEM_AddMemRecord
	ldr	r0, [fp, #-192]
	ldr	r1, [fp, #-196]
	mov	r3, #1
	ldr	r2, [fp, #-184]
	str	r6, [fp, #-104]
	str	r0, [fp, #-116]
	str	r1, [fp, #-108]
	str	r2, [fp, #-100]
	str	r3, [fp, #-256]
.L1917:
	ldr	r6, .L1941+12
	mov	r0, #0
	ldr	r3, [r7, #12]
	blx	r3
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L1900
	mov	r3, r6
	mov	r5, #1
	b	.L1888
.L1887:
	add	r5, r5, #1
	cmp	r5, #32
	beq	.L1931
.L1888:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	bne	.L1887
	uxtb	r3, r5
	str	r3, [fp, #-264]
.L1886:
	ldr	r0, [fp, #-84]
	sub	r2, r9, #205824
	mov	r1, #0
	sub	r2, r2, #520
	ldr	ip, [r7, #48]
	str	r0, [r6, r5, asl #2]
	str	r1, [fp, #-268]
	blx	ip
	ldr	r0, [r6, r5, asl #2]
	mov	r2, #208
	ldr	ip, [r7, #52]
	mov	r1, r8
	add	r0, r0, #1200
	add	r0, r0, #8
	blx	ip
	ldr	r0, [r6, r5, asl #2]
	ldr	r3, [fp, #-268]
	mov	r1, #21
	mov	ip, #30
	str	r4, [r0, #36]
	ldr	r2, [r6, r5, asl #2]
	str	r9, [r0, #1132]
	mov	r0, r5
	str	r5, [r2]
	str	r4, [r2, #580]
	mov	r4, r3
	str	r3, [r2, #1152]
	ldr	r2, [r6, r5, asl #2]
	ldr	lr, [r8]
	str	lr, [r2, #32]
	ldr	r2, [r6, r5, asl #2]
	add	lr, r2, #294912
	str	r1, [r2, #544]
	str	r1, [lr, #3384]
	str	r3, [r2, #28]
	ldr	r2, [r6, r5, asl #2]
	ldr	r3, .L1941+16
	ldr	r1, .L1941+20
	str	ip, [r2, #1456]
	add	ip, r2, #1456
	add	ip, ip, #8
	str	ip, [r3, r5, asl #3]
	ldr	lr, [r8, #200]
	add	ip, r2, #262144
	add	ip, ip, #1888
	str	ip, [r1, r5, asl #2]
	str	lr, [r2, #1528]
	ldr	r1, [r8, #204]
	str	r1, [r2, #1532]
	bl	VCTRL_ResetChan
	ldr	r1, [r6, r5, asl #2]
	ldr	r3, [fp, #-268]
	ldr	r0, [fp, #-256]
	add	r2, r1, #290816
	ldr	ip, [fp, #-260]
	ldr	lr, [fp, #-252]
	str	r0, [r1, #308]
	add	r0, r1, #294912
	str	ip, [r1, #304]
	str	lr, [r1, #312]
	str	r3, [r2, #3164]
	str	r3, [r2, #3168]
	str	r3, [r2, #3176]
	str	r3, [r2, #3180]
	str	r3, [r2, #3172]
	str	r3, [r2, #3184]
	ldr	r2, [r8, #176]
	str	r3, [r0, #3332]
	str	r2, [r0, #3340]
.L1890:
	mov	r8, r4, asl #6
	ldr	r0, [r6, r5, asl #2]
	add	r8, r8, r4, lsl #3
	movw	r3, #31864
	movt	r3, 4
	add	r3, r8, r3
	add	r0, r0, r3
	mov	r2, #72
	ldr	r3, [r7, #48]
	mov	r1, #0
	blx	r3
	ldr	r1, [r6, r5, asl #2]
	add	r4, r4, #1
	movw	r3, #31864
	add	r8, r1, r8
	movt	r3, 4
	add	r0, r8, #290816
	add	r3, r8, r3
	cmp	r4, #32
	mov	r2, #255
	ldr	r8, .L1941
	str	r2, [r3]
	str	r2, [r3, #4]
	ldr	r10, .L1941+12
	str	r2, [r0, #3200]
	bne	.L1890
	movw	r0, #34168
	ldr	ip, [r8, #48]
	movw	r2, #1384
	movt	r0, 4
	add	r0, r1, r0
	mov	r1, #0
	blx	ip
	ldr	r0, [r10, r5, asl #2]
	ldr	r4, .L1941+4
	mov	r2, #24
	add	r0, r0, #294912
	ldr	ip, [r8, #48]
	mov	r1, #0
	add	r0, r0, #2784
	blx	ip
	ldr	r3, [r10, r5, asl #2]
	ldr	lr, [fp, #-132]
	add	r10, r4, r5, lsl #2
	ldr	ip, [fp, #-108]
	add	r1, r3, #290816
	ldr	r0, [fp, #-92]
	mov	r2, #0
	ldr	r4, [fp, #-84]
	str	lr, [r3, #236]
	str	ip, [r3, #260]
	ldr	lr, [fp, #-140]
	ldr	ip, [fp, #-124]
	str	r0, [r3, #288]
	str	r4, [r3, #284]
	ldr	r8, [fp, #-76]
	ldr	r0, [fp, #-116]
	ldr	r4, [fp, #-100]
	str	r8, [r3, #296]
	str	lr, [r3, #240]
	str	lr, [r3, #332]
	str	ip, [r3, #248]
	str	ip, [r3, #336]
	str	r0, [r3, #264]
	str	r4, [r3, #272]
	str	r2, [r1, #3144]
	ldr	r1, [r3, #1384]
	str	r2, [r10, #1424]
	cmp	r1, #1
	beq	.L1891
	sub	ip, ip, #307200
	str	lr, [r3, #320]
	sub	ip, ip, #2576
	str	r0, [r3, #328]
	add	lr, ip, lr
	str	ip, [r3, #324]
	add	r1, lr, #14848
	add	r2, lr, #47616
	add	r1, r1, #15
	add	r2, r2, #15
	add	lr, lr, #15
	bic	r1, r1, #15
	bic	r2, r2, #15
	str	r1, [r3, #352]
	bic	lr, lr, #15
	str	r2, [r3, #360]
	mov	r1, #32768
	mov	r2, #14848
	str	r4, [r3, #340]
	str	r2, [r3, #348]
	mov	r2, #262144
	str	lr, [r3, #344]
	str	r1, [r3, #356]
	str	r2, [r3, #364]
.L1892:
	ldr	r3, [r6, r5, asl #2]
	mov	r0, r5
	ldr	r4, .L1941+12
	str	r5, [r3]
	ldr	r3, [r6, r5, asl #2]
	add	r2, r3, #262144
	str	r5, [r3, #224]
	str	r5, [r3, #228]
	ldrb	r3, [fp, #-264]	@ zero_extendqisi2
	str	r5, [r2, #1668]
	strb	r3, [r2, #1888]
	bl	FSP_EnableInstance
	subs	r8, r0, #0
	bne	.L1932
	mov	r0, r5
	sub	r9, r9, #203776
	bl	SM_ClearInst
	ldr	r3, [r4, r5, asl #2]
	sub	r9, r9, #520
	mov	r0, r5
	mov	r6, r5
	ldr	r1, [r3, #284]
	add	r1, r1, r9
	bl	OpenUsdPool_WithMem
	ldr	r3, [r4, r5, asl #2]
	mov	r2, #1
	mov	r0, r5
	str	r2, [r3, #4]
	bl	VDMDRV_ClearChanIsDec
	bl	VDMDRV_ParamInit
	ldr	r3, [r7]
	ldr	r4, [r4, r5, asl #2]
	blx	r3
	ldr	r3, [r7, #16]
	add	r4, r4, #294912
	str	r0, [r4, #3348]
	mov	r0, r8
	blx	r3
.L1916:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1928:
	ldr	r3, [r8, #96]
	cmp	r3, #0
	beq	.L1895
	ldr	r3, [r1, #52]
	mov	r2, #24
	sub	r0, fp, #140
	add	r1, r8, #80
	blx	r3
	ldr	r3, [r8, #176]
	ldr	r2, [fp, #-124]
	cmp	r3, #1
	beq	.L1875
	ldr	r3, [fp, #-244]
	cmp	r2, r3
	blt	.L1933
.L1875:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_AddMemRecord
	b	.L1873
.L1869:
	mov	r3, #0
	mov	r0, #0
	mov	r1, #0
	str	r3, [fp, #-140]
	str	r3, [fp, #-124]
	str	r3, [fp, #-260]
	strd	r0, [fp, #-132]
	b	.L1873
.L1931:
	mov	r2, r5
	ldr	r1, .L1941+24
	mov	r0, #1
	mvn	r6, #0
	bl	dprint_vfmw
	ldr	r3, [r7, #16]
	mov	r0, #0
	blx	r3
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1891:
	sub	r4, r4, #307200
	str	r2, [r3, #320]
	sub	r4, r4, #2576
	str	r2, [r3, #324]
	add	r2, r4, r0
	str	r0, [r3, #328]
	add	ip, r2, #14848
	add	r1, r2, #47616
	add	ip, ip, #15
	add	r1, r1, #15
	add	r2, r2, #15
	bic	r1, r1, #15
	bic	r2, r2, #15
	bic	ip, ip, #15
	str	r1, [r3, #360]
	mov	r0, #14848
	str	r2, [r3, #344]
	mov	r1, #32768
	mov	r2, #262144
	str	r4, [r3, #340]
	str	ip, [r3, #352]
	str	r0, [r3, #348]
	str	r1, [r3, #356]
	str	r2, [r3, #364]
	b	.L1892
.L1925:
	ldr	r3, [r8, #20]
	cmp	r3, #0
	bgt	.L1921
	b	.L1854
.L1863:
	ldr	r3, [r6, #52]
	mov	r2, #24
	add	r1, r8, #128
	sub	r0, fp, #92
	blx	r3
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-236]
	cmp	r2, r3
	blt	.L1934
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_AddMemRecord
	b	.L1866
.L1877:
	ldr	r3, [r1, #52]
	mov	r2, #24
	add	r1, r8, #104
	sub	r0, fp, #116
	blx	r3
	ldrd	r0, [fp, #-108]
	orrs	r3, r0, r1
	beq	.L1882
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-240]
	cmp	r2, r3
	blt	.L1882
	mov	r1, r0
	ldr	r0, [fp, #-116]
	bl	MEM_AddMemRecord
	b	.L1917
.L1930:
	ldr	r3, [fp, #-252]
	cmp	r3, #1
	beq	.L1935
.L1879:
	ldr	r3, [fp, #-260]
	cmp	r3, #1
	beq	.L1936
.L1880:
	movw	r2, #1925
	ldr	r1, .L1941+28
	mov	r0, #1
	mvn	r6, #0
	bl	dprint_vfmw
	b	.L1916
.L1929:
	ldr	r3, [fp, #-252]
	cmp	r3, #1
	beq	.L1937
.L1871:
	movw	r2, #1991
	ldr	r1, .L1941+32
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1894
.L1926:
	movw	r2, #2143
	ldr	r1, .L1941+36
	mov	r0, #0
	mvn	r6, #0
	bl	dprint_vfmw
	b	.L1916
.L1900:
	str	r3, [fp, #-264]
	mov	r5, r3
	b	.L1886
.L1932:
	mov	r2, r5
	ldr	r1, .L1941+40
	mov	r0, #1
	mov	r8, #0
	bl	dprint_vfmw
	mov	r0, r5
	bl	FSP_DisableInstance
	mov	r0, r5
	bl	CloseUsdPool_WithMem
	ldr	r3, [r4, r5, asl #2]
	mov	r0, r5
	movw	r2, #31864
	add	r1, r3, #294912
	add	ip, r3, #232
	ldr	lr, [r3, #308]
	movt	r2, 4
	ldr	r10, [r3, #312]
	add	r2, r3, r2
	ldr	r9, [r3, #304]
	ldr	r6, [r1, #3340]
	add	r1, r3, #256
	str	r2, [fp, #-164]
	add	r3, r3, #280
	str	r1, [fp, #-172]
	str	r6, [fp, #-160]
	mvn	r6, #0
	str	lr, [fp, #-152]
	str	ip, [fp, #-176]
	str	r3, [fp, #-168]
	str	r10, [fp, #-148]
	str	r9, [fp, #-156]
	str	r8, [r4, r5, asl #2]
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r8
	ldr	r3, [r7, #16]
	blx	r3
	sub	r1, fp, #176
	mov	r0, r5
	bl	VCTRL_FreeChanResource
	b	.L1916
.L1927:
	mov	r0, r5
	movw	r2, #2049
	ldr	r1, .L1941+44
	bl	dprint_vfmw
	b	.L1894
.L1882:
	ldr	r3, [fp, #-252]
	cmp	r3, #1
	beq	.L1938
.L1884:
	ldr	r3, [fp, #-260]
	cmp	r3, #1
	beq	.L1939
.L1885:
	movw	r2, #1954
	ldr	r1, .L1941+48
	mov	r0, #1
	mvn	r6, #0
	bl	dprint_vfmw
	b	.L1916
.L1936:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1880
.L1935:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1879
.L1937:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1871
.L1934:
	mov	r0, r5
	movw	r2, #2065
	ldr	r1, .L1941+52
	bl	dprint_vfmw
	b	.L1894
.L1933:
	ldr	r1, [fp, #-252]
	cmp	r1, #1
	beq	.L1940
.L1876:
	str	r3, [sp]
	mov	r0, #1
	mov	r3, r2
	ldr	r1, .L1941+56
	movw	r2, #2023
	bl	dprint_vfmw
	b	.L1894
.L1939:
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-124]
	ldr	r1, [fp, #-132]
	ldr	r0, [fp, #-140]
	bl	MEM_DelMemRecord
	b	.L1885
.L1924:
	mov	r0, r8
	ldr	r1, .L1941+60
	bl	dprint_vfmw
	b	.L1894
.L1938:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	b	.L1884
.L1940:
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_ReleaseMemBlock
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-84]
	ldr	r0, [fp, #-92]
	bl	MEM_DelMemRecord
	ldr	r2, [fp, #-124]
	ldr	r3, [fp, #-244]
	b	.L1876
.L1942:
	.align	2
.L1941:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR4
	.word	.LC119
	.word	.LANCHOR0
	.word	s_SmIIS
	.word	s_pFspInst
	.word	.LC197
	.word	.LC194
	.word	.LC192
	.word	.LC189
	.word	.LC196
	.word	.LC190
	.word	.LC195
	.word	.LC191
	.word	.LC193
	.word	.LC188
	UNWIND(.fnend)
	.size	VCTRL_CreateChan, .-VCTRL_CreateChan
	.align	2
	.global	VCTRL_ConfigChan
	.type	VCTRL_ConfigChan, %function
VCTRL_ConfigChan:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 72
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
	cmp	r0, #31
	mov	r5, r0
	mov	r4, r1
	bhi	.L1976
	ldr	r6, .L1984
	ldr	r3, [r6, r0, asl #2]
	cmp	r3, #0
	beq	.L1977
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bne	.L1978
	bl	VCTRL_CheckChanWH
	subs	r7, r0, #0
	bne	.L1979
	ldr	r8, .L1984+4
	add	r0, r8, #1552
	bl	PDT_GetVdecCapability
	ldr	r3, [r8, #1572]
	ldr	r2, [r4, #8]
	cmp	r3, #20
	bhi	.L1950
	cmp	r3, r2
	beq	.L1951
	ldr	r3, .L1984+8
	add	r0, r8, #1696
.L1954:
	ldr	r1, [r3, #4]!
	cmp	r1, #20
	bhi	.L1950
	cmp	r1, r2
	beq	.L1951
	cmp	r3, r0
	bne	.L1954
.L1951:
	cmp	r2, #8
	mov	r3, #0
	str	r3, [fp, #-112]
	beq	.L1980
.L1955:
	cmp	r2, #9
	beq	.L1981
.L1969:
	mov	r1, r4
	mov	r0, r5
	bl	VCTRL_CmpConfigParameter
	subs	r3, r0, #0
	beq	.L1982
	ldr	r10, .L1984+12
	mov	r2, #144
	ldr	r0, [r6, r5, asl #2]
	mov	r1, r4
	add	r9, r4, #12
	mov	r8, #0
	ldr	r3, [r10, #52]
	add	r0, r0, #44
	blx	r3
	ldr	ip, [r4, #24]
	ldr	r3, [r6, r5, asl #2]
	mov	r2, #68
	mov	r1, #0
	sub	r0, fp, #112
	str	ip, [r3, #20]
	ldr	r3, [r6, r5, asl #2]
	ldr	lr, [r4, #8]
	ldr	ip, [r10, #48]
	str	lr, [r3, #544]
	ldr	lr, [r4, #116]
	str	lr, [r3, #1392]
	blx	ip
	ldr	r3, [r6, r5, asl #2]
	ldr	r3, [r3, #328]
	mov	r0, r3
	str	r3, [fp, #-100]
	bl	MEM_Phy2Vir
	ldr	r3, [r6, r5, asl #2]
	ldr	r1, [r4, #104]
	mov	r2, #49152
	ldr	ip, [r4, #8]
	movt	r2, 63683
	cmp	r1, #1
	ldr	lr, [r4, #24]
	str	r0, [fp, #-112]
	ldr	r0, [r3, #340]
	addeq	r3, r3, #294912
	str	r2, [fp, #-92]
	addne	r3, r3, #294912
	ldreq	r2, [r4, #140]
	movne	r2, #0
	str	ip, [fp, #-104]
	str	r0, [fp, #-96]
	ldreq	ip, [r4, #108]
	ldreq	r0, [r4, #112]
	strb	lr, [fp, #-108]
	streq	ip, [fp, #-60]
	streq	r1, [fp, #-64]
	mov	r1, r9
	streq	r0, [fp, #-56]
	sub	r0, fp, #88
	str	r2, [r3, #3376]
	ldr	r3, [r4, #8]
	str	r8, [fp, #-72]
	cmp	r3, #0
	ldr	r3, [r4, #100]
	ldreq	r2, [r4, #64]
	movne	r2, #0
	str	r3, [fp, #-68]
	ldr	r3, [r10, #52]
	str	r2, [fp, #-76]
	mov	r2, #12
	blx	r3
	sub	r1, fp, #112
	mov	r0, r5
	bl	SM_Config
	ldr	r3, [r10, #48]
	mov	r1, r8
	sub	r0, fp, #116
	mov	r2, #1
	blx	r3
	ldr	r3, [r4, #104]
	cmp	r3, #1
	beq	.L1983
.L1962:
	ldr	r3, [r6, r5, asl #2]
	mov	r8, #1
	mov	r1, r9
	mov	r2, #12
	add	r9, r3, #294912
	add	r0, r3, #1104
	ldr	ip, [r3, #296]
	add	r0, r0, #4
	ldr	lr, [r3, #288]
	str	ip, [r3, #1140]
	ldr	ip, [r3, #320]
	str	lr, [r3, #1136]
	ldr	lr, [r3, #324]
	str	ip, [r3, #572]
	ldr	ip, [r3, #344]
	str	lr, [r3, #576]
	ldr	lr, [r3, #352]
	str	ip, [r3, #584]
	ldr	ip, [r3, #348]
	str	lr, [r3, #592]
	ldr	lr, [r3, #364]
	str	ip, [r3, #588]
	ldr	ip, [r3, #356]
	str	lr, [r3, #604]
	str	ip, [r3, #596]
	ldr	ip, [r3, #360]
	str	ip, [r3, #600]
	mov	ip, #0
	ldr	lr, [r4, #28]
	str	lr, [r3, #556]
	ldr	lr, [r4, #28]
	str	lr, [r3, #552]
	ldr	lr, [r4, #36]
	str	lr, [r3, #560]
	ldr	lr, [r4, #40]
	str	lr, [r3, #564]
	ldr	lr, [r4, #48]
	str	lr, [r3, #568]
	ldr	lr, [r4, #72]
	str	lr, [r3, #1144]
	ldr	lr, [r4, #80]
	str	r8, [r3, #1180]
	str	r8, [r3, #1184]
	str	lr, [r3, #1148]
	ldr	lr, [r4, #92]
	ldr	r10, [r10, #52]
	rsb	lr, r8, lr
	clz	lr, lr
	mov	lr, lr, lsr #5
	str	lr, [r3, #1164]
	ldr	lr, [r4, #96]
	str	lr, [r3, #1168]
	ldr	lr, [r4, #64]
	str	lr, [r3, #1172]
	ldr	lr, [fp, #-72]
	str	ip, [r3, #1424]
	str	ip, [r3, #1444]
	str	lr, [r3, #1176]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	strb	r3, [r9, #3336]
	blx	r10
	ldr	ip, [r6, r5, asl #2]
	add	r3, ip, #294912
	ldr	r6, [ip, #544]
	ldr	r2, [r3, #3384]
	cmp	r2, r6
	beq	.L1963
	mov	r0, r5
	bl	VCTRL_ResetChan
	ldr	r3, [r4, #8]
	ldr	r2, .L1984
	cmp	r3, #20
	ldr	ip, [r2, r5, asl #2]
	beq	.L1964
	ldr	r6, [ip, #544]
	add	r3, ip, #294912
.L1963:
	ldr	r2, .L1984+16
	ldr	r0, .L1984+20
	ldr	r1, .L1984+24
	add	lr, r2, #128
	str	r6, [r3, #3384]
.L1968:
	ldr	r3, [r2, #4]!
	add	r0, r0, #4
	add	r1, r1, #4
	cmp	r3, #0
	streq	r3, [r0, #-4]
	ldrne	ip, [r3, #20]
	strne	ip, [r0, #-4]
	ldrne	r3, [r3, #20]
	cmp	r2, lr
	str	r3, [r1, #-4]
	bne	.L1968
	ldr	r0, .L1984+20
	bl	VDMDRV_SetPriority
	mov	r0, r5
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1982:
	ldr	r1, .L1984+28
	mov	r7, r3
	bl	dprint_vfmw
.L1974:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1950:
	ldr	r1, .L1984+32
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r7, #0
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1981:
	sub	r0, fp, #112
	bl	REAL9DEC_Support
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	bne	.L1969
.L1956:
	mvn	r7, #0
	b	.L1974
.L1980:
	sub	r0, fp, #112
	bl	REAL8DEC_Support
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L1956
	ldr	r2, [r4, #8]
	b	.L1955
.L1978:
	ldr	r3, .L1984+36
	movw	r2, #2948
	ldr	r1, .L1984+40
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L1974
.L1983:
	sub	r1, fp, #116
	mov	r0, r5
	strb	r3, [fp, #-116]
	bl	FSP_ConfigAttribute
	b	.L1962
.L1979:
	ldr	r1, .L1984+44
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L1974
.L1964:
	ldr	r3, [ip, #332]
	mov	r0, r5
	ldr	r2, [ip, #1224]
	ldr	r1, [ip, #1220]
	ldr	ip, [ip, #336]
	str	ip, [sp]
	bl	VCTRL_PartitionMemForStdUser
	cmp	r0, #0
	bne	.L1965
	ldr	r3, .L1984
	ldr	ip, [r3, r5, asl #2]
	add	r3, ip, #294912
	ldr	r6, [ip, #544]
	b	.L1963
.L1976:
	ldr	r3, .L1984+48
	movw	r2, #2946
	ldr	r1, .L1984+40
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L1974
.L1977:
	mov	r0, r3
	movw	r2, #2947
	ldr	r3, .L1984+52
	mvn	r7, #0
	ldr	r1, .L1984+40
	bl	dprint_vfmw
	b	.L1974
.L1965:
	mov	r0, r8
	ldr	r1, .L1984+56
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L1974
.L1985:
	.align	2
.L1984:
	.word	.LANCHOR0
	.word	.LANCHOR4
	.word	.LANCHOR4+1572
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0-4
	.word	.LANCHOR4+1700
	.word	g_ChanCtx
	.word	.LC200
	.word	.LC199
	.word	.LC58
	.word	.LC1
	.word	.LC198
	.word	.LC57
	.word	.LC2
	.word	.LC201
	UNWIND(.fnend)
	.size	VCTRL_ConfigChan, .-VCTRL_ConfigChan
	.align	2
	.type	VfmwProc_SetDropStreamThread, %function
VfmwProc_SetDropStreamThread:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #144)
	sub	sp, sp, #144
	ldr	r4, [r0]
	ldr	r1, .L1988
	mov	r0, #32
	bic	r5, r4, #-16777216
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L1988+4
	mov	r2, #144
	mov	r1, #0
	sub	r0, fp, #164
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #164
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1986
	sub	r1, fp, #164
	mov	r0, r4
	str	r5, [fp, #-132]
	bl	VCTRL_ConfigChan
.L1986:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1989:
	.align	2
.L1988:
	.word	.LC202
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VfmwProc_SetDropStreamThread, .-VfmwProc_SetDropStreamThread
	.align	2
	.type	VfmwProc_SetDecMode, %function
VfmwProc_SetDecMode:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #144)
	sub	sp, sp, #144
	ldr	r4, [r0]
	ldr	r1, .L1994
	mov	r0, #32
	and	r5, r4, #7
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L1994+4
	mov	r2, #144
	mov	r1, #0
	sub	r0, fp, #164
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #164
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	beq	.L1993
	mov	r2, r4
	ldr	r1, .L1994+8
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1993:
	sub	r1, fp, #164
	mov	r0, r4
	str	r5, [fp, #-128]
	bl	VCTRL_ConfigChan
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1995:
	.align	2
.L1994:
	.word	.LC203
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC204
	UNWIND(.fnend)
	.size	VfmwProc_SetDecMode, .-VfmwProc_SetDecMode
	.align	2
	.type	VfmwProc_SetDecOrderOutput, %function
VfmwProc_SetDecOrderOutput:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #144)
	sub	sp, sp, #144
	ldr	r4, [r0]
	ldr	r1, .L1998
	mov	r0, #32
	and	r5, r4, #3
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L1998+4
	mov	r2, #144
	mov	r1, #0
	sub	r0, fp, #164
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #164
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L1996
	sub	r1, fp, #164
	mov	r0, r4
	str	r5, [fp, #-124]
	bl	VCTRL_ConfigChan
.L1996:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1999:
	.align	2
.L1998:
	.word	.LC205
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VfmwProc_SetDecOrderOutput, .-VfmwProc_SetDecOrderOutput
	.align	2
	.type	VfmwProc_SetErrorThread, %function
VfmwProc_SetErrorThread:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #144)
	sub	sp, sp, #144
	ldr	r4, [r0]
	ldr	r1, .L2002
	mov	r0, #32
	bic	r5, r4, #-16777216
	mov	r4, r4, lsr #24
	mov	r3, r5
	mov	r2, r4
	bl	dprint_vfmw
	ldr	r3, .L2002+4
	mov	r2, #144
	mov	r1, #0
	sub	r0, fp, #164
	ldr	r3, [r3, #48]
	blx	r3
	sub	r1, fp, #164
	mov	r0, r4
	bl	VCTRL_GetChanCfg
	cmp	r0, #0
	bne	.L2000
	sub	r1, fp, #164
	mov	r0, r4
	str	r5, [fp, #-136]
	bl	VCTRL_ConfigChan
.L2000:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2003:
	.align	2
.L2002:
	.word	.LC206
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	VfmwProc_SetErrorThread, .-VfmwProc_SetErrorThread
	.align	2
	.type	VfmwProc_TestResetChan, %function
VfmwProc_TestResetChan:
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
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_ResetChan
	mov	r2, r4
	ldr	r1, .L2005
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L2006:
	.align	2
.L2005:
	.word	.LC207
	UNWIND(.fnend)
	.size	VfmwProc_TestResetChan, .-VfmwProc_TestResetChan
	.align	2
	.global	VCTRL_DestroyChan
	.type	VCTRL_DestroyChan, %function
VCTRL_DestroyChan:
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
	ldr	r5, .L2022
	mov	r4, r0
	mov	r0, #0
	ldr	r3, [r5, #12]
	blx	r3
	cmp	r4, #31
	ldrhi	ip, .L2022+4
	movwhi	r3, #2387
	bhi	.L2017
	ldr	r7, .L2022+8
	ldr	r6, [r7, r4, asl #2]
	cmp	r6, #0
	beq	.L2018
	ldr	r8, [r6, #4]
	cmp	r8, #1
	bne	.L2019
	mov	r0, #0
	str	r0, [r6, #8]
	ldr	r3, [r5, #16]
	blx	r3
	mov	r0, r4
	bl	SCDDRV_IsChanDec
	cmp	r0, #0
	bne	.L2020
.L2012:
	ldr	r3, [r5, #12]
	mov	r0, #0
	blx	r3
	ldr	r2, .L2022+12
	ldr	r3, [r5, #12]
	mov	r8, #0
	mov	r0, #4
	ldr	r6, .L2022
	str	r8, [r2, r4, asl #2]
	blx	r3
	mov	r0, r4
	bl	VCTRL_StopChan
	ldr	r3, [r6, #16]
	subs	r5, r0, #0
	mov	r0, #4
	bne	.L2021
	blx	r3
	mov	r0, r4
	bl	VCTRL_ResetChan
	bl	VDMDRV_ParamInit
	ldr	r3, .L2022+16
	ldr	r2, [r6, #12]
	mov	r0, #4
	add	r3, r3, r4, lsl #2
	str	r5, [r3, #-636]
	blx	r2
	mov	r0, r4
	bl	FSP_DisableInstance
	mov	r0, r4
	bl	CloseUsdPool_WithMem
	ldr	r3, [r7, r4, asl #2]
	ldr	ip, .L2022+20
	mov	r0, r4
	add	lr, r3, #294912
	ldr	r1, .L2022+24
	ldr	r9, [r3, #312]
	movw	r2, #31864
	ldr	r8, [r3, #304]
	movt	r2, 4
	ldr	r10, [lr, #3340]
	add	r2, r3, r2
	ldr	lr, [r3, #308]
	str	r5, [ip, r4, asl #3]
	str	r2, [fp, #-68]
	str	r5, [r1, r4, asl #2]
	str	lr, [fp, #-56]
	add	lr, r3, #232
	str	r5, [r7, r4, asl #2]
	add	r7, r3, #256
	str	lr, [fp, #-80]
	add	r3, r3, #280
	str	r10, [fp, #-64]
	str	r3, [fp, #-72]
	str	r9, [fp, #-52]
	str	r8, [fp, #-60]
	str	r7, [fp, #-76]
	bl	VDMDRV_ClearChanIsDec
	mov	r0, r4
	bl	SCDDRV_ResetSCD
	mov	r0, r4
	bl	VDMDRV_ResetVDH
	ldr	r3, [r6, #16]
	mov	r0, #4
	blx	r3
	ldr	r3, [r6, #16]
	mov	r0, r5
	blx	r3
	ldr	r3, [r6, #24]
	mov	r1, r4
	mov	r0, #1
	blx	r3
	sub	r1, fp, #80
	mov	r0, r4
	bl	VCTRL_FreeChanResource
	mov	r0, #1
	ldr	r3, [r6, #28]
	mov	r1, r4
	blx	r3
	mov	r0, r5
.L2009:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2020:
	mov	r0, r4
	ldr	r6, [r5, #132]
	bl	SCDDRV_IsChanDec
	mov	r2, #500
	clz	r1, r0
	mov	r0, r8
	mov	r1, r1, lsr #5
	blx	r6
	b	.L2012
.L2019:
	ldr	ip, .L2022+28
	movw	r3, #2408
.L2017:
	ldr	r2, .L2022+32
	mov	r0, #0
	ldr	r1, .L2022+36
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r5, #16]
	mov	r0, #0
	blx	r3
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2021:
	blx	r3
	ldr	r3, [r6, #16]
	mov	r0, r8
	blx	r3
	mvn	r0, #0
	b	.L2009
.L2018:
	ldr	ip, .L2022+40
	movw	r3, #2396
	ldr	r2, .L2022+32
	mov	r0, r6
	ldr	r1, .L2022+36
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r5, #16]
	mov	r0, r6
	blx	r3
	mvn	r0, #0
	b	.L2009
.L2023:
	.align	2
.L2022:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC57
	.word	.LANCHOR0
	.word	g_LowDelaySeqIndex
	.word	.LANCHOR3
	.word	s_SmIIS
	.word	s_pFspInst
	.word	.LC210
	.word	.LANCHOR1+712
	.word	.LC208
	.word	.LC209
	UNWIND(.fnend)
	.size	VCTRL_DestroyChan, .-VCTRL_DestroyChan
	.align	2
	.global	VCTRL_CloseVfmw
	.type	VCTRL_CloseVfmw, %function
VCTRL_CloseVfmw:
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
	ldr	r6, .L2042
	ldr	r3, [r6, #128]
	cmp	r3, #1
	bne	.L2031
	sub	r5, r6, #4
	mov	r4, #0
.L2027:
	ldr	r3, [r5, #4]!
	mov	r0, r4
	add	r4, r4, #1
	cmp	r3, #0
	beq	.L2026
	bl	VCTRL_DestroyChan
.L2026:
	cmp	r4, #32
	bne	.L2027
	bl	FSP_Exit
	ldr	r3, [r6, #132]
	mov	r2, #3
	ldr	r5, .L2042+4
	cmp	r3, #0
	str	r2, [r6, #136]
	beq	.L2029
	mov	r0, #10
	ldr	r3, [r5, #120]
	mov	r4, #49
	blx	r3
	b	.L2030
.L2041:
	ldr	r3, [r5, #120]
	blx	r3
	subs	r4, r4, #1
	beq	.L2029
.L2030:
	ldr	r3, [r6, #132]
	mov	r0, #10
	cmp	r3, #0
	bne	.L2041
.L2029:
	ldr	r3, [r5, #48]
	mov	r2, #128
	mov	r1, #0
	ldr	r0, .L2042+8
	blx	r3
	ldr	r0, .L2042+12
	bl	CloseDrivers
	mov	r3, #0
	mov	r0, r3
	str	r3, [r6, #128]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2031:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2043:
	.align	2
.L2042:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR3-636
	.word	.LANCHOR0+152
	UNWIND(.fnend)
	.size	VCTRL_CloseVfmw, .-VCTRL_CloseVfmw
	.align	2
	.type	VfmwProc_TestRestartChan, %function
VfmwProc_TestRestartChan:
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
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_StopChan
	mov	r2, r4
	ldr	r1, .L2045
	mov	r3, r0
	mov	r0, #32
	bl	dprint_vfmw
	mov	r0, r4
	bl	VCTRL_ResetChan
	mov	r2, r4
	ldr	r1, .L2045+4
	mov	r3, r0
	mov	r0, #32
	bl	dprint_vfmw
	mov	r0, r4
	bl	VCTRL_StartChan
	mov	r2, r4
	ldr	r1, .L2045+8
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L2046:
	.align	2
.L2045:
	.word	.LC211
	.word	.LC207
	.word	.LC183
	UNWIND(.fnend)
	.size	VfmwProc_TestRestartChan, .-VfmwProc_TestRestartChan
	.align	2
	.type	VfmwProc_TestStopChan, %function
VfmwProc_TestStopChan:
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
	ldr	r4, [r0]
	mov	r0, r4
	bl	VCTRL_StopChan
	mov	r2, r4
	ldr	r1, .L2048
	mov	r3, r0
	mov	r0, #32
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L2049:
	.align	2
.L2048:
	.word	.LC211
	UNWIND(.fnend)
	.size	VfmwProc_TestStopChan, .-VfmwProc_TestStopChan
	.align	2
	.global	VCTRL_InitDspCode
	.type	VCTRL_InitDspCode, %function
VCTRL_InitDspCode:
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
	cmp	r1, #6
	mov	r5, r0
	moveq	r4, #1
	beq	.L2051
	cmp	r1, #0
	moveq	r4, #2
	movne	r4, #0
.L2051:
	ldr	r3, .L2065
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2061
	mov	r1, r4
	mov	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VDH_Require_DspCode
.L2061:
	ldr	r6, .L2065+4
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L2062
	mov	r0, #0
	blx	r3
.L2054:
	ldr	r3, [r6, #20]
	cmp	r3, #0
	beq	.L2063
	mov	r0, #0
	blx	r3
.L2056:
	ldr	r3, [r6, #12]
	cmp	r3, #0
	beq	.L2064
	mov	r0, #0
	blx	r3
.L2058:
	mov	r1, r4
	mov	r0, #0
	bl	SCDDRV_LoadDspCode
	mov	r0, r5
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_CloseHardware
.L2062:
	mov	r0, r3
	movw	r2, #3239
	ldr	r1, .L2065+8
	bl	dprint_vfmw
	b	.L2054
.L2063:
	mov	r0, r3
	movw	r2, #3240
	ldr	r1, .L2065+8
	bl	dprint_vfmw
	b	.L2056
.L2064:
	mov	r0, r3
	movw	r2, #3241
	ldr	r1, .L2065+8
	bl	dprint_vfmw
	b	.L2058
.L2066:
	.align	2
.L2065:
	.word	g_HalDisable
	.word	g_vdm_hal_fun_ptr
	.word	.LC29
	UNWIND(.fnend)
	.size	VCTRL_InitDspCode, .-VCTRL_InitDspCode
	.align	2
	.global	VCTRL_LoadDspCode
	.type	VCTRL_LoadDspCode, %function
VCTRL_LoadDspCode:
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
	ldr	r3, .L2093
	mov	r5, r0
	ldr	r3, [r3, r0, asl #2]
	ldr	r1, [r3, #544]
	cmp	r1, #0
	movne	r3, #1
	movne	r6, #0
	ldreq	r6, [r3, #1172]
	clzeq	r3, r6
	moveq	r3, r3, lsr #5
.L2068:
	cmp	r1, #6
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	beq	.L2089
.L2080:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2089:
	ldr	r7, .L2093+4
	ldr	r4, [r7, #-636]
	cmp	r4, #0
	bne	.L2069
	sub	r3, r7, #636
	sub	r2, r7, #512
	b	.L2070
.L2091:
	cmp	r3, r2
	beq	.L2090
.L2070:
	ldr	r4, [r3, #4]!
	cmp	r4, #0
	beq	.L2091
.L2069:
	cmp	r4, #1
	beq	.L2092
	cmp	r1, #6
	beq	.L2080
	ldr	r1, .L2093+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2090:
	mov	r0, r5
	add	r5, r7, r5, lsl #2
	bl	VCTRL_InitDspCode
	cmp	r6, #1
	mov	r0, r4
	streq	r6, [r5, #-636]
	movne	r3, #2
	strne	r3, [r5, #-636]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2092:
	cmp	r6, #1
	beq	.L2080
	ldr	r1, .L2093+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2094:
	.align	2
.L2093:
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	.LC213
	.word	.LC212
	UNWIND(.fnend)
	.size	VCTRL_LoadDspCode, .-VCTRL_LoadDspCode
	.align	2
	.global	VCTRL_SetChanFsPartitionState
	.type	VCTRL_SetChanFsPartitionState, %function
VCTRL_SetChanFsPartitionState:
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
	ldr	r3, .L2096
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #290816
	str	r1, [r3, #3144]
	ldmfd	sp, {fp, sp, pc}
.L2097:
	.align	2
.L2096:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_SetChanFsPartitionState, .-VCTRL_SetChanFsPartitionState
	.align	2
	.global	VCTRL_GetCurChanFsSize
	.type	VCTRL_GetCurChanFsSize, %function
VCTRL_GetCurChanFsSize:
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
	ldr	r3, .L2099
	ldr	r3, [r3, r0, asl #2]
	add	r3, r3, #290816
	ldr	r0, [r3, #3164]
	ldmfd	sp, {fp, sp, pc}
.L2100:
	.align	2
.L2099:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetCurChanFsSize, .-VCTRL_GetCurChanFsSize
	.align	2
	.global	VCTRT_SetChanCtrlState
	.type	VCTRT_SetChanCtrlState, %function
VCTRT_SetChanCtrlState:
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
	cmp	r1, #1
	beq	.L2103
	bcc	.L2104
	cmp	r1, #2
	bne	.L2111
	ldr	r3, .L2112
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #1424]
	cmp	r3, #1
	beq	.L2108
	mov	r3, #0
	str	r1, [r0, #1424]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2111:
	mov	r3, #0
.L2102:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2104:
	ldr	r2, .L2112
	mov	r1, #0
	mov	r3, r1
	add	r0, r2, r0, lsl #2
	str	r1, [r0, #1424]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2103:
	ldr	r3, .L2112
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #1424]
	cmp	r3, #0
	bne	.L2108
	str	r1, [r0, #1424]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L2108:
	mvn	r3, #0
	b	.L2102
.L2113:
	.align	2
.L2112:
	.word	.LANCHOR4
	UNWIND(.fnend)
	.size	VCTRT_SetChanCtrlState, .-VCTRT_SetChanCtrlState
	.align	2
	.global	VCTRL_AddFrameBufMemoryRecord
	.type	VCTRL_AddFrameBufMemoryRecord, %function
VCTRL_AddFrameBufMemoryRecord:
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
	ldr	r3, [r4]
	cmp	r3, #255
	beq	.L2117
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #24]
	ldr	r0, [r4, #32]
	bl	MEM_AddMemRecord
.L2117:
	ldr	r3, [r4, #4]
	cmp	r3, #255
	beq	.L2118
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #40]
	ldr	r0, [r4, #48]
	bl	MEM_AddMemRecord
.L2118:
	ldr	r3, [r4, #8]
	cmp	r3, #255
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #56]
	ldr	r0, [r4, #64]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	MEM_AddMemRecord
	UNWIND(.fnend)
	.size	VCTRL_AddFrameBufMemoryRecord, .-VCTRL_AddFrameBufMemoryRecord
	.align	2
	.global	VCTRL_SetSingleFrameBufToChan
	.type	VCTRL_SetSingleFrameBufToChan, %function
VCTRL_SetSingleFrameBufToChan:
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
	ldr	r8, .L2200
	ldr	r2, .L2200+4
	mov	r6, r1
	mov	r10, r0
	ldr	r9, [r8, r0, asl #2]
	ldr	r5, [r2, r0, asl #2]
	add	r1, r9, #290816
	add	r4, r9, #294912
	ldr	r2, [r1, #3172]
	ldr	r0, [r4, #2776]
	cmp	r2, #32
	ldr	r3, [r4, #2768]
	movge	r2, #32
	str	r2, [r4, #2480]
	ldr	r2, [r6, #12]
	mov	r7, r3
	cmp	r2, r0
	beq	.L2130
	ldr	r1, [r1, #3160]
	cmp	r1, #0
	beq	.L2192
.L2130:
	ldr	r2, [r4, #2744]
	cmp	r2, #0
	beq	.L2132
	ldr	r2, [r4, #2808]
	cmp	r2, #0
	beq	.L2193
.L2132:
	ldr	r3, .L2200+8
	mov	r0, #8
	ldr	r2, [r3, #12]
	blx	r2
	ldr	r0, [r8, r10, asl #2]
	add	r2, r0, #290816
	ldr	r1, [r2, #3192]
	cmp	r1, #255
	beq	.L2159
	add	r2, r2, #3264
	mov	r1, #1
	b	.L2135
.L2194:
	add	r1, r1, #1
	cmp	r1, #32
	beq	.L2151
.L2135:
	ldr	r3, [r2]
	add	r2, r2, #72
	cmp	r3, #255
	bne	.L2194
	cmp	r1, #32
	beq	.L2151
.L2133:
	mov	lr, r1, asl #6
	ldr	r3, .L2200+8
	add	r1, lr, r1, lsl #3
	movw	r2, #31864
	movt	r2, 4
	add	r2, r1, r2
	ldr	r3, [r3, #52]
	add	r0, r0, r2
	mov	r1, r6
	mov	r2, #72
	blx	r3
	ldr	r2, [r8, r10, asl #2]
	mov	r0, r6
	add	r2, r2, #294912
	ldr	r1, [r2, #2808]
	add	r1, r1, #1
	str	r1, [r2, #2808]
	bl	VCTRL_AddFrameBufMemoryRecord
	ldr	r3, [r8, r10, asl #2]
	add	r3, r3, #294912
	ldr	r2, [r3, #2812]
	cmp	r2, #0
	beq	.L2195
	ldrsb	r2, [r5, #1]
	cmp	r2, #0
	bne	.L2196
.L2138:
	ldr	r3, [r4, #2480]
	strb	r3, [r5, #10]
.L2139:
	mov	r8, #0
	strb	r8, [r5, #11]
	ldr	r3, [r4, #2744]
	strb	r3, [r5, #13]
	ldr	r3, [r6]
	cmp	r3, #255
	beq	.L2190
	ldrb	r8, [r4, #1416]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L2143
	movw	r3, #34196
	mov	r8, #1
	movt	r3, 4
	add	r3, r9, r3
	b	.L2141
.L2197:
	add	r8, r8, #1
	cmp	r8, #32
	beq	.L2151
.L2141:
	ldrb	r2, [r3]	@ zero_extendqisi2
	add	r3, r3, #12
	cmp	r2, #0
	bne	.L2197
	cmp	r8, #32
	beq	.L2151
.L2143:
	ldr	r3, [r6, #32]
	mov	r1, r8, asl #2
	rsb	r0, r1, r8, lsl #4
	add	r1, r9, r1
	add	r2, r3, #1020
	add	r0, r4, r0
	add	r2, r2, #3
	rsb	r10, r3, r7
	bic	r2, r2, #1020
	add	r1, r1, #294912
	bic	r2, r2, #3
	str	r2, [r0, #1408]
	ldr	lr, [r6, #12]
	mov	ip, #1
	strb	ip, [r0, #1416]
	add	r2, r10, r2
	add	r10, r2, r3
	str	lr, [r0, #1412]
	ldr	lr, [r4, #2748]
	add	lr, lr, ip
	str	lr, [r4, #2748]
	str	r10, [r1, #2304]
	ldr	lr, [r4, #2436]
	add	r3, r3, lr
	add	r3, r3, r2
	str	r3, [r1, #1792]
	ldr	r3, [r6, #4]
	cmp	r3, #255
	beq	.L2190
	ldr	r3, [r6, #48]
	strb	ip, [r0, #1928]
	str	r3, [r0, #1920]
	ldr	r3, [r4, #2756]
	add	r3, r3, ip
	str	r3, [r4, #2756]
.L2190:
	ldr	r3, [r6, #8]
	cmp	r3, #255
	beq	.L2145
	ldrb	r1, [r4, #2488]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L2146
	mov	r2, #1
	b	.L2147
.L2198:
	cmp	r2, #32
	beq	.L2145
.L2147:
	mov	r1, r2, asl #3
	movw	r3, #35256
	movt	r3, 4
	add	r3, r1, r3
	add	r2, r2, #1
	ldrb	r3, [r9, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2198
.L2146:
	ldr	r2, [r6, #64]
	add	r1, r9, r1
	add	r1, r1, #294912
	mov	r3, #1
	str	r2, [r1, #2484]
	strb	r3, [r1, #2488]
	ldr	r3, [r4, #2752]
	add	r3, r3, #1
	str	r3, [r4, #2752]
.L2145:
	add	r1, r5, #20480
	ldr	lr, [r1, #2300]
	cmp	lr, #0
	beq	.L2162
	add	r2, r5, #22784
	mov	r3, #1
	add	r2, r2, #96
	b	.L2150
.L2199:
	add	r3, r3, #1
	cmp	r3, #32
	beq	.L2151
.L2150:
	ldr	r0, [r2]
	add	r2, r2, #100
	cmp	r0, #0
	bne	.L2199
	cmp	r3, #32
	beq	.L2151
	mov	lr, r3
.L2148:
	mov	r0, #100
	add	r2, r5, #28672
	mla	r3, r0, r3, r5
	mov	r0, r8, asl #2
	rsb	r8, r0, r8, lsl #4
	ldr	ip, [r2, #1260]
	add	r8, r4, r8
	add	r0, r9, r0
	add	r9, r3, #22528
	add	r7, r0, #294912
	add	ip, ip, #1
	str	ip, [r2, #1260]
	str	lr, [r9, #164]
	mov	ip, r9
	ldr	r0, [r8, #1408]
	mov	r10, r9
	mov	lr, r9
	str	r0, [ip, #172]
	ldr	r0, [r8, #1412]
	mov	r8, r9
	str	r0, [ip, #176]
	add	ip, r9, #216
	ldr	r0, [r7, #1792]
	str	ip, [fp, #-48]
	mov	ip, r9
	str	r0, [r10, #184]
	add	r0, r9, #224
	ldr	r10, [r4, #1400]
	str	r0, [fp, #-52]
	str	r10, [lr, #188]
	add	r10, r9, #232
	ldr	r0, [r4, #2452]
	str	r10, [fp, #-56]
	ldr	r10, [fp, #-48]
	str	r0, [r9, #204]
	ldr	r0, [r4, #2460]
	str	r0, [r9, #208]
	ldr	r0, [r4, #2464]
	str	r0, [r8, #212]
	ldr	r0, [r4, #2444]
	str	r0, [r8, #216]
	mov	r8, #0
	ldr	r0, [r4, #2448]
	str	r0, [r10, #4]
	ldr	r0, [r7, #2304]
	str	r0, [lr, #192]
	mov	r0, #1
	ldr	lr, [r4, #2432]
	str	lr, [ip, #196]
	ldr	lr, [r4, #2436]
	str	lr, [ip, #200]
	ldr	ip, [r5, #28]
	str	ip, [r10, #8]
	ldr	lr, [r5, #32]
	ldr	r10, [fp, #-52]
	str	lr, [r10, #4]
	ldr	r7, [r4, #2468]
	str	r7, [r10, #8]
	ldr	r10, [fp, #-56]
	ldr	r7, [r4, #2472]
	str	r7, [r10, #4]
	ldr	r7, [r4, #2476]
	str	r7, [r10, #8]
	strb	r8, [r9, #156]
	strb	r8, [r9, #157]
	strb	r8, [r9, #158]
	str	r0, [r9, #252]
	ldr	r3, [r2, #508]
	cmp	r3, r8
	bne	.L2152
	strb	r0, [r5, #12]
	str	r3, [r2, #420]
	str	r3, [r2, #428]
	ldr	r8, [r4, #1400]
	str	ip, [r2, #480]
	str	lr, [r2, #484]
	str	r8, [r2, #444]
	ldr	r8, [r4, #2468]
	str	r8, [r2, #488]
	ldr	r8, [r4, #2472]
	str	r8, [r2, #492]
	ldr	r8, [r4, #2476]
	strb	r3, [r2, #412]
	strb	r3, [r2, #413]
	str	r8, [r2, #496]
	strb	r3, [r2, #414]
	str	r0, [r2, #508]
.L2152:
	ldr	r3, [r2, #1264]
	ldrsb	r0, [r5, #13]
	cmp	r3, r0
	bcs	.L2153
	ldr	r0, [r6, #8]
	cmp	r0, #255
	beq	.L2153
	add	r8, r4, r3, lsl #3
	add	r0, r5, r3, lsl #3
	add	r0, r0, #28672
	add	r3, r3, #1
	ldr	r8, [r8, #2484]
	mov	r10, #0
	mov	r9, #1
	strb	r10, [r0, #1005]
	strb	r9, [r0, #1004]
	str	r8, [r0, #1000]
	str	r3, [r2, #1264]
.L2153:
	ldr	r3, [r2, #1268]
	ldr	r0, [r4, #2480]
	cmp	r3, r0
	bcs	.L2154
	ldr	r0, [r6, #4]
	cmp	r0, #255
	beq	.L2154
	ldr	r9, [r4, #2756]
	mov	r0, #100
	mla	r0, r0, r3, r5
	sub	r9, r9, #1
	mov	r10, r3, asl #4
	add	r6, r3, #1
	mov	r8, r9, asl #4
	sub	r3, r10, r3, asl #2
	sub	r8, r8, r9, asl #2
	add	r5, r5, r3
	add	r8, r4, r8
	add	r3, r5, #29184
	add	r0, r0, #22528
	mov	r9, #0
	ldr	r10, [r8, #1920]
	mov	r8, #1
	str	r10, [r0, #180]
	str	r9, [r3, #108]
	str	r8, [r3, #104]
	str	r6, [r2, #1268]
.L2154:
	ldr	r3, [r4, #2740]
	str	r3, [r2, #996]
	ldr	r3, [r1, #2200]
	cmp	r3, #0
	bne	.L2155
	ldr	r0, [r1, #2220]
	mov	r2, #1
	str	r3, [r1, #2112]
	str	r0, [r1, #2120]
	ldr	r0, [r4, #1400]
	str	ip, [r1, #2172]
	str	lr, [r1, #2176]
	str	r0, [r1, #2136]
	ldr	r0, [r4, #2468]
	str	r0, [r1, #2180]
	ldr	r0, [r4, #2472]
	str	r0, [r1, #2184]
	ldr	r0, [r4, #2476]
	strb	r3, [r1, #2104]
	strb	r3, [r1, #2105]
	str	r0, [r1, #2188]
	strb	r3, [r1, #2106]
	str	r2, [r1, #2200]
.L2155:
	ldr	r3, .L2200+8
	mov	r0, #8
	ldr	r3, [r3, #16]
	blx	r3
	mov	r0, #0
.L2189:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2196:
	ldr	r3, [r3, #3340]
	cmp	r3, #0
	bne	.L2138
	ldrsb	r3, [r5, #23]
	ldr	r2, [r4, #2480]
	add	r3, r3, #4
	cmp	r3, r2
	movge	r3, r2
	strb	r3, [r5, #10]
	b	.L2139
.L2193:
	ldr	r1, [r6, #8]
	cmp	r1, #255
	bne	.L2132
	str	r1, [sp, #4]
	movw	r3, #9251
	str	r2, [sp]
	mov	r0, #1
	ldr	r2, .L2200+12
	ldr	r1, .L2200+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2189
.L2195:
	ldr	r3, .L2200+8
	mov	r0, #8
	str	r2, [fp, #-48]
	ldr	r3, [r3, #16]
	blx	r3
	ldr	r2, [fp, #-48]
	mov	r0, r2
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2159:
	mov	r1, #0
	b	.L2133
.L2162:
	mov	r3, lr
	b	.L2148
.L2151:
	ldr	r3, .L2200+8
	mov	r0, #8
	ldr	r3, [r3, #16]
	blx	r3
	mvn	r0, #0
	b	.L2189
.L2192:
	str	r0, [sp, #4]
	movw	r3, #9241
	str	r2, [sp]
	mov	r0, #1
	ldr	r2, .L2200+12
	ldr	r1, .L2200+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2189
.L2201:
	.align	2
.L2200:
	.word	.LANCHOR0
	.word	s_pFspInst
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+732
	.word	.LC215
	.word	.LC214
	UNWIND(.fnend)
	.size	VCTRL_SetSingleFrameBufToChan, .-VCTRL_SetSingleFrameBufToChan
	.align	2
	.global	VCTRL_AllocMemToDecoder
	.type	VCTRL_AllocMemToDecoder, %function
VCTRL_AllocMemToDecoder:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #72)
	sub	sp, sp, #72
	ldr	r4, .L2211
	mov	r7, r0, asl #2
	mov	r5, r0
	add	r3, r4, r7
	ldr	r8, [r3, #1424]
	cmp	r8, #0
	bne	.L2203
	ldr	ip, .L2211+4
	mov	lr, #1
	mov	r2, #72
	str	lr, [r3, #1424]
	sub	r0, fp, #108
	ldr	r3, [ip, #52]
	blx	r3
	sub	r1, fp, #108
	mov	r0, r5
	bl	VCTRL_SetSingleFrameBufToChan
	subs	r6, r0, #0
	bne	.L2204
	ldr	r3, .L2211+8
	ldr	ip, [r3, r5, asl #2]
	add	ip, ip, #290816
.L2205:
	mov	r3, #2
	ldr	r1, .L2211+12
	str	r3, [ip, #3144]
	mov	r0, #31
	add	r4, r4, r7
	bl	dprint_vfmw
	mov	r0, r6
	mov	r3, #0
	str	r3, [r4, #1424]
.L2210:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2204:
	ldr	r9, .L2211+8
	ldr	ip, [r9, r5, asl #2]
	add	ip, ip, #290816
	ldr	r3, [ip, #3164]
	cmp	r3, #0
	beq	.L2205
	mov	r2, r5
	mov	r0, r8
	ldr	r1, .L2211+16
	bl	dprint_vfmw
	ldr	r3, [r9, r5, asl #2]
	mov	r2, #3
	add	r3, r3, #290816
	mov	ip, r3
	str	r2, [r3, #3144]
	b	.L2205
.L2203:
	mov	r3, r0
	ldr	r2, .L2211+20
	ldr	r1, .L2211+24
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2210
.L2212:
	.align	2
.L2211:
	.word	.LANCHOR4
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	.LC217
	.word	.LC216
	.word	.LANCHOR1+764
	.word	.LC218
	UNWIND(.fnend)
	.size	VCTRL_AllocMemToDecoder, .-VCTRL_AllocMemToDecoder
	.align	2
	.global	VCTRL_GetImageWidth
	.type	VCTRL_GetImageWidth, %function
VCTRL_GetImageWidth:
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
	ldr	r3, .L2221
	ldr	r0, [r3, r0, asl #2]
	add	r0, r0, #294912
	ldr	r3, [r0, #3384]
	cmp	r3, #2
	beq	.L2215
	cmp	r3, #16
	beq	.L2216
	cmp	r3, #0
	beq	.L2220
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2220:
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageWidth
.L2216:
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageWidth
.L2215:
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageWidth
.L2222:
	.align	2
.L2221:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetImageWidth, .-VCTRL_GetImageWidth
	.align	2
	.global	VCTRL_GetImageHeight
	.type	VCTRL_GetImageHeight, %function
VCTRL_GetImageHeight:
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
	ldr	r3, .L2231
	ldr	r0, [r3, r0, asl #2]
	add	r0, r0, #294912
	ldr	r3, [r0, #3384]
	cmp	r3, #2
	beq	.L2225
	cmp	r3, #16
	beq	.L2226
	cmp	r3, #0
	beq	.L2230
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2230:
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_GetImageHeight
.L2226:
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVCDEC_GetImageHeight
.L2225:
	add	r0, r0, #3392
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_GetImageHeight
.L2232:
	.align	2
.L2231:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetImageHeight, .-VCTRL_GetImageHeight
	.align	2
	.global	VCTRL_GetFsSize
	.type	VCTRL_GetFsSize, %function
VCTRL_GetFsSize:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
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
	ldr	r3, .L2238
	mov	r5, r0
	mov	r6, r1
	mov	r7, r2
	sub	r0, fp, #52
	ldr	r3, [r3, #48]
	mov	r2, #24
	mov	r1, #0
	blx	r3
	ldr	r3, .L2238+4
	ldr	r4, [r3, #52]
	cmp	r4, #0
	beq	.L2234
	ldr	ip, .L2238+8
	sub	r3, fp, #52
	str	r3, [sp, #4]
	mov	r2, r7
	mov	r1, r6
	mov	r0, r5
	ldr	ip, [ip, r5, asl #2]
	mov	r3, #0
	add	ip, ip, #294912
	ldr	ip, [ip, #3384]
	str	ip, [sp]
	blx	r4
.L2234:
	ldr	r0, [fp, #-48]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2239:
	.align	2
.L2238:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_vdm_hal_fun_ptr
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	VCTRL_GetFsSize, .-VCTRL_GetFsSize
	.align	2
	.global	VCTRL_EnableEsBuf
	.type	VCTRL_EnableEsBuf, %function
VCTRL_EnableEsBuf:
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
	ldr	r3, .L2241
	mov	r2, #1
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #1828]
	ldmfd	sp, {fp, sp, pc}
.L2242:
	.align	2
.L2241:
	.word	.LANCHOR4
	UNWIND(.fnend)
	.size	VCTRL_EnableEsBuf, .-VCTRL_EnableEsBuf
	.align	2
	.global	VCTRL_DisableEsBuf
	.type	VCTRL_DisableEsBuf, %function
VCTRL_DisableEsBuf:
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
	ldr	r3, .L2244
	mov	r2, #0
	add	r0, r3, r0, lsl #2
	str	r2, [r0, #1828]
	ldmfd	sp, {fp, sp, pc}
.L2245:
	.align	2
.L2244:
	.word	.LANCHOR4
	UNWIND(.fnend)
	.size	VCTRL_DisableEsBuf, .-VCTRL_DisableEsBuf
	.align	2
	.global	VCTRL_IfEsBufEnable
	.type	VCTRL_IfEsBufEnable, %function
VCTRL_IfEsBufEnable:
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
	ldr	r3, .L2247
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #1828]
	ldmfd	sp, {fp, sp, pc}
.L2248:
	.align	2
.L2247:
	.word	.LANCHOR4
	UNWIND(.fnend)
	.size	VCTRL_IfEsBufEnable, .-VCTRL_IfEsBufEnable
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
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.54984, %object
	.size	__func__.54984, 18
__func__.54984:
	.ascii	"VCTRL_EventReport\000"
	.space	2
	.type	__func__.54920, %object
	.size	__func__.54920, 20
__func__.54920:
	.ascii	"VCTRL_RecordPosTime\000"
	.type	__func__.54925, %object
	.size	__func__.54925, 17
__func__.54925:
	.ascii	"VCTRL_RecordData\000"
	.space	3
	.type	__func__.54996, %object
	.size	__func__.54996, 18
__func__.54996:
	.ascii	"VCTRL_SetCallBack\000"
	.space	2
	.type	__FUNCTION__.55102, %object
	.size	__FUNCTION__.55102, 29
__FUNCTION__.55102:
	.ascii	"VCTRL_PartitionMemForStdUser\000"
	.space	3
	.type	__func__.55126, %object
	.size	__func__.55126, 23
__func__.55126:
	.ascii	"VCTRL_FreeChanResource\000"
	.space	1
	.type	__func__.55374, %object
	.size	__func__.55374, 25
__func__.55374:
	.ascii	"VCTRL_TryToRelSpecialFrm\000"
	.space	3
	.type	__func__.55391, %object
	.size	__func__.55391, 19
__func__.55391:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__FUNCTION__.55399, %object
	.size	__FUNCTION__.55399, 19
__FUNCTION__.55399:
	.ascii	"VCTRL_GetChanImage\000"
	.space	1
	.type	__FUNCTION__.55409, %object
	.size	__FUNCTION__.55409, 23
__FUNCTION__.55409:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__func__.55410, %object
	.size	__func__.55410, 23
__func__.55410:
	.ascii	"VCTRL_ReleaseChanImage\000"
	.space	1
	.type	__func__.55443, %object
	.size	__func__.55443, 18
__func__.55443:
	.ascii	"VCTRL_GetDecParam\000"
	.space	2
	.type	__FUNCTION__.55562, %object
	.size	__FUNCTION__.55562, 19
__FUNCTION__.55562:
	.ascii	"VCTRL_FlushDecoder\000"
	.space	1
	.type	__FUNCTION__.55849, %object
	.size	__FUNCTION__.55849, 18
__FUNCTION__.55849:
	.ascii	"GetExtraRefFrmNum\000"
	.space	2
	.type	__FUNCTION__.55855, %object
	.size	__FUNCTION__.55855, 19
__FUNCTION__.55855:
	.ascii	"GetExtraDispFrmNum\000"
	.space	1
	.type	__FUNCTION__.55861, %object
	.size	__FUNCTION__.55861, 16
__FUNCTION__.55861:
	.ascii	"GetExtraCtrlCmd\000"
	.type	__FUNCTION__.55799, %object
	.size	__FUNCTION__.55799, 14
__FUNCTION__.55799:
	.ascii	"DecChanSyntax\000"
	.space	2
	.type	__func__.55324, %object
	.size	__func__.55324, 24
__func__.55324:
	.ascii	"VCTRL_FindOccupiedFrame\000"
	.type	__func__.55829, %object
	.size	__func__.55829, 20
__func__.55829:
	.ascii	"VCTRL_GetChanImgNum\000"
	.type	g_ProcCommandTable, %object
	.size	g_ProcCommandTable, 304
g_ProcCommandTable:
	.word	0
	.word	VfmwProc_SetPrintLevel
	.word	2
	.word	VfmwProc_SetErrorThread
	.word	4
	.word	VfmwProc_SetDecOrderOutput
	.word	5
	.word	VfmwProc_SetDecMode
	.word	7
	.word	VfmwProc_SetDropStreamThread
	.word	11
	.word	VfmwProc_SetUSE_FF_APT_EN
	.word	12
	.word	VfmwProc_SetSaveFileAfterReset
	.word	13
	.word	VfmwProc_SetCurProcChan
	.word	256
	.word	VfmwProc_PrintTracer
	.word	257
	.word	VfmwProc_SetScdPrint
	.word	512
	.word	VfmwProc_Savestream
	.word	513
	.word	VfmwProc_SaveSeg
	.word	514
	.word	VfmwProc_SaveYUV
	.word	515
	.word	VfmwProc_SaveOneYUV
	.word	516
	.word	VfmwProc_Save1DYUV
	.word	528
	.word	VfmwProc_SaveMetadata
	.word	544
	.word	VfmwProc_SaveReorderMetadata
	.word	560
	.word	VfmwProc_SaveEL
	.word	768
	.word	VfmwProc_TestSuspend
	.word	769
	.word	VfmwProc_TestResume
	.word	896
	.word	VfmwProc_TestStopChan
	.word	897
	.word	VfmwProc_TestResetChan
	.word	898
	.word	VfmwProc_TestStartChan
	.word	899
	.word	VfmwProc_TestRestartChan
	.word	1024
	.word	VfmwProc_TestTimeSequence
	.word	1026
	.word	VfmwProc_TestStopDec
	.word	1280
	.word	VfmwProc_SetTraceCtrl
	.word	1281
	.word	VfmwProc_SetTraceBSPeriod
	.word	1282
	.word	VfmwProc_SetTraceFramePeriod
	.word	1283
	.word	VfmwProc_SetTraceImgPeriod
	.word	1536
	.word	VfmwProc_OpenModuleLowly
	.word	1537
	.word	VfmwProc_CloseModuleLowly
	.word	1538
	.word	VfmwProc_SetTunnelLineNumber
	.word	1539
	.word	VfmwProc_OpenScdLowdly
	.word	1540
	.word	VfmwProc_CloseScdLowdly
	.word	1541
	.word	VfmwProc_SetSedOnlyEnable
	.word	1792
	.word	VfmwProc_SetSmmuIrqEnable
	.word	65535
	.word	0
	.type	__func__.55211, %object
	.size	__func__.55211, 18
__func__.55211:
	.ascii	"VCTRL_DestroyChan\000"
	.space	2
	.type	__func__.56209, %object
	.size	__func__.56209, 30
__func__.56209:
	.ascii	"VCTRL_SetSingleFrameBufToChan\000"
	.space	2
	.type	__func__.56229, %object
	.size	__func__.56229, 24
__func__.56229:
	.ascii	"VCTRL_AllocMemToDecoder\000"
	.data
	.align	2
.LANCHOR2 = . + 0
	.type	s_VfmwSavePath, %object
	.size	s_VfmwSavePath, 64
s_VfmwSavePath:
	.byte	47
	.byte	109
	.byte	110
	.byte	116
	.byte	0
	.space	59
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"InstID out of range\000" )
.LC1:
	ASCII(.ascii	"vfmw_ctrl.c,L%d: %s\012\000" )
	.space	3
.LC2:
	ASCII(.ascii	"Chan inactive\000" )
	.space	2
.LC3:
	ASCII(.ascii	"s_VfmwCTrl.event_report_vdec = NULL\012\000" )
	.space	3
.LC4:
	ASCII(.ascii	"s_VfmwCTrl.event_report_omxvdec = NULL\012\000" )
.LC5:
	ASCII(.ascii	"%s Unkown Adapter Type: %d, Len: %d\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"------ s_pstVfmwChan[%d]->stSynExtraData.s32ModuleL" )
	ASCII(.ascii	"owlyEnable = 1 ------\012\000" )
	.space	2
.LC7:
	ASCII(.ascii	"------ g_TraceImgPeriod = %x ------\012\000" )
	.space	3
.LC8:
	ASCII(.ascii	"------ g_TraceFramePeriod = %x ------\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"------ g_TraceBsPeriod = %x ------\012\000" )
.LC10:
	ASCII(.ascii	"------ g_TraceCtrl = %x ------\012\000" )
.LC11:
	ASCII(.ascii	"------ dec stop = %d ------\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"------ dec task delay %d ms ------\012\000" )
.LC13:
	ASCII(.ascii	"%s/vfmw_el_save_%d.dat\000" )
	.space	1
.LC14:
	ASCII(.ascii	"OK create file '%s' for channel %d el stream save\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC15:
	ASCII(.ascii	"failed create file '%s' for el stream save!\012\000" )
	.space	3
.LC16:
	ASCII(.ascii	">>>> close el stream saving >>>>\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"NO SUCH CHANNEL : %d\012\000" )
	.space	2
.LC18:
	ASCII(.ascii	"Pay attention to  CHANNEL : %d\012\000" )
.LC19:
	ASCII(.ascii	"ResetCreateNewSave = %d\012\000" )
	.space	3
.LC20:
	ASCII(.ascii	"ResetCreateNewSave can NOT be set to %d, must be 0 " )
	ASCII(.ascii	"or 1\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	"USE_FF_APT_EN = %d\012\000" )
.LC22:
	ASCII(.ascii	"USE_FF_APT_EN can NOT be set to %d, must be 0 or 1\012" )
	ASCII(.ascii	"\000" )
.LC23:
	ASCII(.ascii	"OK create file '%s' for channel %d metadata_reorder" )
	ASCII(.ascii	" stream save\012\000" )
	.space	3
.LC24:
	ASCII(.ascii	"failed create file '%s' for metadata_reorder stream" )
	ASCII(.ascii	" save!\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	">>>> close metadata stream saving >>>>\012\000" )
.LC26:
	ASCII(.ascii	"OK create file '%s' for channel %d metadata stream " )
	ASCII(.ascii	"save\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"failed create file '%s' for metadata stream save!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC28:
	ASCII(.ascii	"address '0x%x' is not valid!\012\000" )
	.space	2
.LC29:
	ASCII(.ascii	"VDMHAL_NULL_FUN_PRINT,L%d\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"1d image has been saved to '%s'\012\000" )
	.space	3
.LC31:
	ASCII(.ascii	"open file '%s' fail!\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"2d image has been saved to '%s'\012\000" )
	.space	3
.LC33:
	ASCII(.ascii	"OK create file '%s' for channel %d seg stream save\012" )
	ASCII(.ascii	"\000" )
.LC34:
	ASCII(.ascii	"failed create file '%s' for seg stream save!\012\000" )
	.space	2
.LC35:
	ASCII(.ascii	">>>> close seg stream saving >>>>\012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"OK create file '%s' for channel %d raw stream save\012" )
	ASCII(.ascii	"\000" )
.LC37:
	ASCII(.ascii	"failed create file '%s' for raw stream save!\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	">>>> close raw stream saving >>>>\012\000" )
	.space	1
.LC39:
	ASCII(.ascii	"Failed Alloc VFMW_BigTile1d_YUV for yuv save!\012\000" )
	.space	1
.LC40:
	ASCII(.ascii	"OK create file '%s' for chan %d yuv save.(crop %d)\012" )
	ASCII(.ascii	"\000" )
.LC41:
	ASCII(.ascii	"failed create file '%s' for yuv save!\012\000" )
	.space	1
.LC42:
	ASCII(.ascii	"OK close yuv save.\012\000" )
.LC43:
	ASCII(.ascii	"print memory tracer...\012\000" )
.LC44:
	ASCII(.ascii	"unmask vfmw mmu err int!\012\000" )
	.space	2
.LC45:
	ASCII(.ascii	"mask vfmw mmu err int!\012\000" )
.LC46:
	ASCII(.ascii	"Disable SedOnly Func\012\000" )
	.space	2
.LC47:
	ASCII(.ascii	"Enable SedOnly Func\012\000" )
	.space	3
.LC48:
	ASCII(.ascii	"The channel number is to Large.\012\000" )
	.space	3
.LC49:
	ASCII(.ascii	"Force vdm %d sleep.\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"Vfmw suspend totally take %d ms\012\000" )
	.space	3
.LC51:
	ASCII(.ascii	"Wait sleep time out %d ms (isScdSleep=%d, isVdmSlee" )
	ASCII(.ascii	"p=%d)!\012\000" )
	.space	1
.LC52:
	ASCII(.ascii	"Force scd %d sleep.\012\000" )
	.space	3
.LC53:
	ASCII(.ascii	"proc cmd need no param:%p\012\000" )
	.space	1
.LC54:
	ASCII(.ascii	"Vfmw resume totally take %d ms\012\000" )
.LC55:
	ASCII(.ascii	"%s,%d,pos(%d) error!\012\000" )
	.space	2
.LC56:
	ASCII(.ascii	"%s, %d, pos(%d) error!\012\000" )
.LC57:
	ASCII(.ascii	"ChanID out of range\000" )
.LC58:
	ASCII(.ascii	"can NOT config a not-opened Chan\000" )
	.space	3
.LC59:
	ASCII(.ascii	"event_report null!\000" )
	.space	1
.LC60:
	ASCII(.ascii	"%s Unkown Adapter Type: %d\012\000" )
.LC61:
	ASCII(.ascii	"pstStreamParam is NULL\000" )
	.space	1
.LC62:
	ASCII(.ascii	"L: %d, Stream Interface Error!!, ChanID: %d\012\000" )
	.space	3
.LC63:
	ASCII(.ascii	"pstStreamIntf is NULL\000" )
	.space	2
.LC64:
	ASCII(.ascii	"This Chan has not been created!!!\000" )
	.space	2
.LC65:
	ASCII(.ascii	"can NOT get a not-opened Chan's information of bits" )
	ASCII(.ascii	"tream\000" )
	.space	3
.LC66:
	ASCII(.ascii	"Raw FreshNum=%d, FreshSize=%d\012\000" )
	.space	1
.LC67:
	ASCII(.ascii	"Seg FreshNum=%d, FreshSize=%d\012\000" )
	.space	1
.LC68:
	ASCII(.ascii	"pArgs is null\000" )
	.space	2
.LC69:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC70:
	ASCII(.ascii	"no mem to arrange for soft dec\012\000" )
.LC71:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC72:
	ASCII(.ascii	"%s: L%d : vdm chan memory is too small to support u" )
	ASCII(.ascii	"ser decoder\012\000" )
.LC73:
	ASCII(.ascii	"FSP_ConfigInstance fail!\012\000" )
	.space	2
.LC74:
	ASCII(.ascii	"parameter err, null pointer!!!\000" )
	.space	1
.LC75:
	ASCII(.ascii	"%s FATAL: pstChan = NULL!\012\000" )
	.space	1
.LC76:
	ASCII(.ascii	"%s FATAL: pChanMem_vdh = NULL!\012\000" )
.LC77:
	ASCII(.ascii	"%s FATAL: pChanMem_frm = NULL!\012\000" )
.LC78:
	ASCII(.ascii	"DelAllFrameMemRecord err in VCTRL_FreeChanResource " )
	ASCII(.ascii	"!\012\000" )
	.space	2
.LC79:
	ASCII(.ascii	"%s FATAL: pChanMem_scd = NULL!\012\000" )
.LC80:
	ASCII(.ascii	"%s FATAL: pChanMem_ctx = NULL!\012\000" )
.LC81:
	ASCII(.ascii	"pstCfg is null\000" )
	.space	1
.LC82:
	ASCII(.ascii	"Chip not support beyond %dx%d when Std != H264/VP8/" )
	ASCII(.ascii	"MVC/USER.\012\000" )
	.space	2
.LC83:
	ASCII(.ascii	"%s,%d,s_pstVfmwChan[chanID]->FspInst.stDecFsRec[i]." )
	ASCII(.ascii	"phyFS.PhyAddr = 0x%x\012\000" )
	.space	3
.LC84:
	ASCII(.ascii	"%s,%d,can't find special frame match DecFs Num = %d" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC85:
	ASCII(.ascii	"call VCTRL_GetChanImage, ChanID = %d,\012\000" )
	.space	1
.LC86:
	ASCII(.ascii	"This channel is not opened\000" )
	.space	1
.LC87:
	ASCII(.ascii	"%s cannot output!\012\000" )
	.space	1
.LC88:
	ASCII(.ascii	"%s: view_0 id(%d) > view_1 id(%d), error!\012\000" )
	.space	1
.LC89:
	ASCII(.ascii	"%s: continuous view0 id(%d)!\012\000" )
	.space	2
.LC90:
	ASCII(.ascii	"%s: continuous view1 id(%d)!\012\000" )
	.space	2
.LC91:
	ASCII(.ascii	"pImage is NULL\000" )
	.space	1
.LC92:
	ASCII(.ascii	"call VCTRL_ReleaseChanImage, ChanID, ImgID = %d,%d\012" )
	ASCII(.ascii	"\000" )
.LC93:
	ASCII(.ascii	"vdm_ctrl.c,L%d: Chan inactive\012\000" )
	.space	1
.LC94:
	ASCII(.ascii	"vdm_ctrl.c,L%d: This channel is not opened\012\000" )
.LC95:
	ASCII(.ascii	"vdm_ctrl.c,L%d: VCTRL_TryToRelSpecialFrm success!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC96:
	ASCII(.ascii	"%s call SYNTAX_ReleaseImage failed\012\000" )
.LC97:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range\012\000" )
	.space	1
.LC98:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: Chan %d is not open or not ru" )
	ASCII(.ascii	"nning\012\000" )
	.space	2
.LC99:
	ASCII(.ascii	"%s VidStd=%d Error!\012\000" )
	.space	3
.LC100:
	ASCII(.ascii	"Get DecParam Type Failure!\012\000" )
.LC101:
	ASCII(.ascii	"vfmw_ctrl.c, line %d: ChanID out of range is %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC102:
	ASCII(.ascii	"Chan %d is not open or not running\012\000" )
.LC103:
	ASCII(.ascii	"ChanId out of range\000" )
.LC104:
	ASCII(.ascii	"This channel is not running\000" )
.LC105:
	ASCII(.ascii	"line: %d Flush DPB failed!\012\000" )
.LC106:
	ASCII(.ascii	"VCTRL_FlushDecoder\012\000" )
.LC107:
	ASCII(.ascii	"fuction return value is null,%s %d MVC_OK != MVC_Fl" )
	ASCII(.ascii	"ushDPB!!\012\000" )
	.space	3
.LC108:
	ASCII(.ascii	"chan not create\000" )
.LC109:
	ASCII(.ascii	"can NOT start a not-opened Chan\000" )
.LC110:
	ASCII(.ascii	"NULL == pArgs\000" )
	.space	2
.LC111:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC112:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame but VFMW_USER != s_pstVfmwChan" )
	ASCII(.ascii	"[ChanID]->eVidStd!\012\000" )
	.space	1
.LC113:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame but s_pstVfmwChan[ChanID]->s32" )
	ASCII(.ascii	"UsrdecFrameNum < MIN_USERDEC_FRAME_NUM!\012\000" )
.LC114:
	ASCII(.ascii	"get frame store fail!\012\000" )
	.space	1
.LC115:
	ASCII(.ascii	"get image buffer ok: LogicFsID = %d\012\000" )
	.space	3
.LC116:
	ASCII(.ascii	"line: %d, pLf is NULL!\012\000" )
.LC117:
	ASCII(.ascii	"decode %p, disp %p, tf %p\012\000" )
	.space	1
.LC118:
	ASCII(.ascii	"VCTRL_GetUsrdecFrame get LogicFs fail!\012\000" )
.LC119:
	ASCII(.ascii	"CAP_LEVEL_USER_DEFINE_WITH_OPTION option is illegal" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC120:
	ASCII(.ascii	"VCTRL_GetChanMemSizeByOption L%d: arrange return fa" )
	ASCII(.ascii	"ilure\012\000" )
	.space	2
.LC121:
	ASCII(.ascii	"ERROR: s32MaxRefFrameNum(%d), extra_ref(%d), s32Dis" )
	ASCII(.ascii	"playFrameNum(%d), extra_disp(%d)\012\000" )
	.space	3
.LC122:
	ASCII(.ascii	"MEM_MapRegisterAddr reg 0x%x failed!\012\000" )
	.space	2
.LC123:
	ASCII(.ascii	"MEM_AllocMemBlock Vdh %d failed!\012\000" )
	.space	2
.LC124:
	ASCII(.ascii	"VDMHAL_OpenHAL Vdh %d failed!\012\000" )
	.space	1
.LC125:
	ASCII(.ascii	"MEM_AllocMemBlock VFMW_VP9Prob %d failed!\012\000" )
	.space	1
.LC126:
	ASCII(.ascii	"MEM_AllocMemBlock Scd %d failed!\012\000" )
	.space	2
.LC127:
	ASCII(.ascii	"SM_OpenSCDDrv Scd %d failed!\012\000" )
	.space	2
.LC128:
	ASCII(.ascii	"Register irq %d failed!\012\000" )
	.space	3
.LC129:
	ASCII(.ascii	"extra_ref=\000" )
	.space	1
.LC130:
	ASCII(.ascii	"=\000" )
	.space	2
.LC131:
	ASCII(.ascii	" \000" )
	.space	2
.LC132:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC133:
	ASCII(.ascii	"ERROR: extra_ref = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC134:
	ASCII(.ascii	"extra_disp=\000" )
.LC135:
	ASCII(.ascii	"ERROR: extra_disp = %d is out of [ -5000, 5000 ]!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC136:
	ASCII(.ascii	"extra_cmd=\000" )
	.space	1
.LC137:
	ASCII(.ascii	"HI_VFMW_VideoDecode\000" )
.LC138:
	ASCII(.ascii	"(safe,warn,danger) :amount = %d,%d,%d,%d\012\000" )
	.space	2
.LC139:
	ASCII(.ascii	"strm_ctrl: I->IPB\012\000" )
	.space	1
.LC140:
	ASCII(.ascii	"strm_ctrl: IPB->I\012\000" )
	.space	1
.LC141:
	ASCII(.ascii	"(CurrMode,NextMode) = %d,%d\012\000" )
	.space	3
.LC142:
	ASCII(.ascii	"pic_pts: %lld\012\000" )
	.space	1
.LC143:
	ASCII(.ascii	"pic_usertag: %lld\012\000" )
	.space	1
.LC144:
	ASCII(.ascii	"pic_pts: %lld pic_usertag = %lld\012\000" )
	.space	2
.LC145:
	ASCII(.ascii	"Syntax is stopped from This channel\000" )
.LC146:
	ASCII(.ascii	"[%d] vdm busy\012\000" )
	.space	1
.LC147:
	ASCII(.ascii	"[%d] no frame\012\000" )
	.space	1
.LC148:
	ASCII(.ascii	"[%d] no stream\012\000" )
.LC149:
	ASCII(.ascii	"%s:ChanId %d this hevc file is 10bit!!!\012\000" )
	.space	3
.LC150:
	ASCII(.ascii	"DFS, Wait Partition\012\000" )
	.space	3
.LC151:
	ASCII(.ascii	"DFS, Partition fail, u32DynamicFrameStoreAllocEn: %" )
	ASCII(.ascii	"d, eFspPartitionState: %d\012\000" )
	.space	2
.LC152:
	ASCII(.ascii	"Thread running...\012\000" )
	.space	1
.LC153:
	ASCII(.ascii	"Thread stopped!\012\000" )
	.space	3
.LC154:
	ASCII(.ascii	"thread running...\012\000" )
	.space	1
.LC155:
	ASCII(.ascii	"thread stopped...\012\000" )
	.space	1
.LC156:
	ASCII(.ascii	"Thread killed!\012\000" )
.LC157:
	ASCII(.ascii	"ERROR:ReadNum = %d larger than VFMW_MAX_RESERVE_NUM" )
	ASCII(.ascii	"(%d)\012\000" )
	.space	3
.LC158:
	ASCII(.ascii	"%s,%d,specialFrmRec[%d]->PhyAddr = 0x%x,VirAddr = 0" )
	ASCII(.ascii	"x%x,Length = %d\012\000" )
.LC159:
	ASCII(.ascii	"pSpecialFrmInfo = null!!!\000" )
	.space	2
.LC160:
	ASCII(.ascii	"%s not support std %d\012\000" )
	.space	1
.LC161:
	ASCII(.ascii	"ChanID out of range!\000" )
	.space	3
.LC162:
	ASCII(.ascii	"pstChanState = NULL\000" )
.LC163:
	ASCII(.ascii	"s_pstVfmwChan = NULL\000" )
	.space	3
.LC164:
	ASCII(.ascii	"SetVdecExtra ERROR: extra_ref = %d is out of [ -500" )
	ASCII(.ascii	"0, 5000 ]!\012\000" )
	.space	1
.LC165:
	ASCII(.ascii	"SetVdecExtra ERROR: extra_disp = %d is out of [ -50" )
	ASCII(.ascii	"00, 5000 ]!\012\000" )
.LC166:
	ASCII(.ascii	"Command \"%d\" not registerd!\012\000" )
	.space	3
.LC167:
	ASCII(.ascii	"Chan %d Report Last Frame, Value=%d, LastFrameState" )
	ASCII(.ascii	"=%d\012\000" )
.LC168:
	ASCII(.ascii	"Last frame output failed!\012\000" )
	.space	1
.LC169:
	ASCII(.ascii	"Last frame output successed!\012\000" )
	.space	2
.LC170:
	ASCII(.ascii	"Last frame already output, image id: %d!\012\000" )
	.space	2
.LC171:
	ASCII(.ascii	"line %d can not know YuvFormat = %d\012\000" )
	.space	3
.LC172:
	ASCII(.ascii	"userdec frame(phy=%#x) address error!\012\000" )
	.space	1
.LC173:
	ASCII(.ascii	"can not map vir addr for usrdat frame(cbphy=%#x)\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC174:
	ASCII(.ascii	"line: %d, pLogic is Null!\012\000" )
	.space	1
.LC175:
	ASCII(.ascii	"eYuvFormat %d is not support!!\012\000" )
.LC176:
	ASCII(.ascii	"pUsrdecFrame == NULL\000" )
	.space	3
.LC177:
	ASCII(.ascii	"VCTRL_PutUsrdecFrame: VidStd is %d\012\000" )
.LC178:
	ASCII(.ascii	"VCTRL_PutUsrdecFrame return err\012\000" )
	.space	3
.LC179:
	ASCII(.ascii	"L:%d ChanID out of range\012\000" )
	.space	2
.LC180:
	ASCII(.ascii	"L:%d This Chan has not been created!!!\012\000" )
.LC181:
	ASCII(.ascii	"L:%d WARNING: vidio std not setted!\012\000" )
	.space	3
.LC182:
	ASCII(.ascii	"WARNING: vidio std not setted!\000" )
	.space	1
.LC183:
	ASCII(.ascii	"start chan %d: VCTRL_StartChan return %d\012\000" )
	.space	2
.LC184:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !\000" )
	.space	1
.LC185:
	ASCII(.ascii	"VCTRL_StopChanWithCheck fail!\012\000" )
	.space	1
.LC186:
	ASCII(.ascii	"vdm_ctrl.c,L%d: pOption->s32KeepBS error\012\000" )
	.space	2
.LC187:
	ASCII(.ascii	"---------------------------------------------------" )
	ASCII(.ascii	"----------------------\012\000" )
	.space	1
.LC188:
	ASCII(.ascii	"Param Invalid of PChanOption is NULL\012\000" )
	.space	2
.LC189:
	ASCII(.ascii	"line %d VCTRL_GetChanMemSize failed!\012\000" )
	.space	2
.LC190:
	ASCII(.ascii	"L: %d : part we can NOT alloc buffer for channel co" )
	ASCII(.ascii	"ntext\012\000" )
	.space	2
.LC191:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel context\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC192:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh\012\000" )
	.space	2
.LC193:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel vdh, %#x <" )
	ASCII(.ascii	" %#x\012\000" )
	.space	3
.LC194:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for channel scd\012\000" )
	.space	2
.LC195:
	ASCII(.ascii	"L: %d : can NOT alloc buffer for SCD\012\000" )
	.space	2
.LC196:
	ASCII(.ascii	"Chan:%d can NOT enable FSP instance\012\000" )
	.space	3
.LC197:
	ASCII(.ascii	"vfmw have max(%d) channels opened, can NOT create m" )
	ASCII(.ascii	"ore channels\012\000" )
	.space	3
.LC198:
	ASCII(.ascii	"VCTRL_CheckChanWH return err.\012\000" )
	.space	1
.LC199:
	ASCII(.ascii	"VFMW didn't support std %d.\012\000" )
	.space	3
.LC200:
	ASCII(.ascii	"VCTRL_ConfigChan with same config paramater.\012\000" )
	.space	2
.LC201:
	ASCII(.ascii	"can NOT VCTRL_PartitionMemForStdUser\012\000" )
	.space	2
.LC202:
	ASCII(.ascii	"chan %d: new StrmOFThr = %d\012\000" )
	.space	3
.LC203:
	ASCII(.ascii	"chan %d: new DecMode = %d\012\000" )
	.space	1
.LC204:
	ASCII(.ascii	"chan %d: GetChanCfg failed!\012\000" )
	.space	3
.LC205:
	ASCII(.ascii	"chan %d: new DecOrderOutput = %d\012\000" )
	.space	2
.LC206:
	ASCII(.ascii	"chan %d: new ChanErrThr = %d\012\000" )
	.space	2
.LC207:
	ASCII(.ascii	"reset chan %d: VCTRL_ResetChan return %d\012\000" )
	.space	2
.LC208:
	ASCII(.ascii	"%s:L%d: %s\012\000" )
.LC209:
	ASCII(.ascii	"This Chan has not been created or has been destroye" )
	ASCII(.ascii	"d !!!\000" )
	.space	3
.LC210:
	ASCII(.ascii	"can NOT stop a not-opened Chan\000" )
	.space	1
.LC211:
	ASCII(.ascii	"stop chan %d: VCTRL_StopChan return %d\012\000" )
.LC212:
	ASCII(.ascii	"WARNNING: dsp in lowdelay state, we can not support" )
	ASCII(.ascii	"ed  avs in the same time!!!\012\000" )
.LC213:
	ASCII(.ascii	"WARNNING: dsp in avs state, we can not supported  l" )
	ASCII(.ascii	"owdelay in the same time!!!\012\000" )
.LC214:
	ASCII(.ascii	"%s, %d, actul size = 0x%x, except size= 0x%x\012\000" )
	.space	2
.LC215:
	ASCII(.ascii	"%s, %d, configuredFrameNum = %x, PmvNodeStatus= 0x%" )
	ASCII(.ascii	"x\012\000" )
	.space	2
.LC216:
	ASCII(.ascii	"DFS, request frame store fail!, chanid: %d\012\000" )
.LC217:
	ASCII(.ascii	"DFS, set decoding thread state to success!\012 \000" )
	.space	3
.LC218:
	ASCII(.ascii	"%s set chan %d ctrl state CHAN_FRAME_STORE_ALLOC fa" )
	ASCII(.ascii	"iled!\012\000" )
	.bss
	.align	3
.LANCHOR0 = . + 0
.LANCHOR3 = . + 8184
.LANCHOR4 = . + 16368
	.type	s_pstVfmwChan, %object
	.size	s_pstVfmwChan, 128
s_pstVfmwChan:
	.space	128
	.type	s_VfmwCTrl, %object
	.size	s_VfmwCTrl, 264
s_VfmwCTrl:
	.space	264
	.type	g_StopDec, %object
	.size	g_StopDec, 4
g_StopDec:
	.space	4
	.type	g_SleepTime, %object
	.size	g_SleepTime, 4
g_SleepTime:
	.space	4
	.type	vfmw_save_el_file, %object
	.size	vfmw_save_el_file, 128
vfmw_save_el_file:
	.space	128
	.type	save_file_cnt.55966, %object
	.size	save_file_cnt.55966, 4
save_file_cnt.55966:
	.space	4
	.type	save_el_chan_num, %object
	.size	save_el_chan_num, 4
save_el_chan_num:
	.space	4
	.type	g_CurProcChan, %object
	.size	g_CurProcChan, 4
g_CurProcChan:
	.space	4
	.type	g_ResetCreateNewSave, %object
	.size	g_ResetCreateNewSave, 4
g_ResetCreateNewSave:
	.space	4
	.type	vfmw_save_metadata_reorder_file, %object
	.size	vfmw_save_metadata_reorder_file, 128
vfmw_save_metadata_reorder_file:
	.space	128
	.type	save_file_cnt.55960, %object
	.size	save_file_cnt.55960, 4
save_file_cnt.55960:
	.space	4
	.type	save_metadata_reorder_chan_num, %object
	.size	save_metadata_reorder_chan_num, 4
save_metadata_reorder_chan_num:
	.space	4
	.type	vfmw_save_metadata_file, %object
	.size	vfmw_save_metadata_file, 128
vfmw_save_metadata_file:
	.space	128
	.type	save_file_cnt.55954, %object
	.size	save_file_cnt.55954, 4
save_file_cnt.55954:
	.space	4
	.type	save_metadata_chan_num, %object
	.size	save_metadata_chan_num, 4
save_metadata_chan_num:
	.space	4
	.type	vfmw_save_seg_file, %object
	.size	vfmw_save_seg_file, 128
vfmw_save_seg_file:
	.space	128
	.type	save_file_cnt.55924, %object
	.size	save_file_cnt.55924, 4
save_file_cnt.55924:
	.space	4
	.type	save_seg_chan_num, %object
	.size	save_seg_chan_num, 4
save_seg_chan_num:
	.space	4
	.type	vfmw_save_str_file, %object
	.size	vfmw_save_str_file, 128
vfmw_save_str_file:
	.space	128
	.type	save_file_cnt.55918, %object
	.size	save_file_cnt.55918, 4
save_file_cnt.55918:
	.space	4
	.type	save_str_chan_num, %object
	.size	save_str_chan_num, 4
save_str_chan_num:
	.space	4
	.type	vfmw_save_yuv_file, %object
	.size	vfmw_save_yuv_file, 128
vfmw_save_yuv_file:
	.space	128
	.type	save_file_cnt.55932, %object
	.size	save_file_cnt.55932, 4
save_file_cnt.55932:
	.space	4
	.type	MemRecord_YUV, %object
	.size	MemRecord_YUV, 24
MemRecord_YUV:
	.space	24
	.type	pVl, %object
	.size	pVl, 4
pVl:
	.space	4
	.type	pUl, %object
	.size	pUl, 4
pUl:
	.space	4
	.type	pY, %object
	.size	pY, 4
pY:
	.space	4
	.type	pVl_2bit, %object
	.size	pVl_2bit, 4
pVl_2bit:
	.space	4
	.type	pUl_2bit, %object
	.size	pUl_2bit, 4
pUl_2bit:
	.space	4
	.type	pY_2bit, %object
	.size	pY_2bit, 4
pY_2bit:
	.space	4
	.type	save_yuv_with_crop, %object
	.size	save_yuv_with_crop, 4
save_yuv_with_crop:
	.space	4
	.type	g_IsrFlag, %object
	.size	g_IsrFlag, 1
g_IsrFlag:
	.space	1
	.space	3
	.type	s_StreamIntf, %object
	.size	s_StreamIntf, 384
s_StreamIntf:
	.space	384
	.type	FspInstInfo.55098, %object
	.size	FspInstInfo.55098, 3212
FspInstInfo.55098:
	.space	3212
	.type	g_VdmCharacter, %object
	.size	g_VdmCharacter, 4
g_VdmCharacter:
	.space	4
	.type	last_rec_pos_time.55396, %object
	.size	last_rec_pos_time.55396, 128
last_rec_pos_time.55396:
	.space	128
	.type	last_rec_pos_time.55406, %object
	.size	last_rec_pos_time.55406, 128
last_rec_pos_time.55406:
	.space	128
	.type	MemArrange.55679, %object
	.size	MemArrange.55679, 1368
MemArrange.55679:
	.space	1368
	.type	extra_ref, %object
	.size	extra_ref, 4
extra_ref:
	.space	4
	.type	extra_disp, %object
	.size	extra_disp, 4
extra_disp:
	.space	4
	.type	g_VfmwIrqHandle, %object
	.size	g_VfmwIrqHandle, 4
g_VfmwIrqHandle:
	.space	4
	.type	cmdline, %object
	.size	cmdline, 1024
cmdline:
	.space	1024
	.type	extra_cmd, %object
	.size	extra_cmd, 4
extra_cmd:
	.space	4
	.type	g_allow_B_before_P, %object
	.size	g_allow_B_before_P, 1
g_allow_B_before_P:
	.space	1
	.type	g_not_allow_H264FullPictureRepair_flag, %object
	.size	g_not_allow_H264FullPictureRepair_flag, 1
g_not_allow_H264FullPictureRepair_flag:
	.space	1
	.type	g_apple_airplay_mirrorinig_flag, %object
	.size	g_apple_airplay_mirrorinig_flag, 1
g_apple_airplay_mirrorinig_flag:
	.space	1
	.space	1
	.type	g_event_report, %object
	.size	g_event_report, 4
g_event_report:
	.space	4
	.type	g_DSPState, %object
	.size	g_DSPState, 128
g_DSPState:
	.space	128
	.type	last_rec_pos_time.55794, %object
	.size	last_rec_pos_time.55794, 128
last_rec_pos_time.55794:
	.space	128
	.type	last_rec_pos_decparam_time.55795, %object
	.size	last_rec_pos_decparam_time.55795, 128
last_rec_pos_decparam_time.55795:
	.space	128
	.type	ChanPriTab.55747, %object
	.size	ChanPriTab.55747, 128
ChanPriTab.55747:
	.space	128
	.type	g_VfmwChanStat, %object
	.size	g_VfmwChanStat, 9600
g_VfmwChanStat:
	.space	9600
	.type	PrioArray.55216, %object
	.size	PrioArray.55216, 128
PrioArray.55216:
	.space	128
	.type	pOption, %object
	.size	pOption, 4
pOption:
	.space	4
	.type	s_ChanControlState, %object
	.size	s_ChanControlState, 128
s_ChanControlState:
	.space	128
	.type	Capability.55264, %object
	.size	Capability.55264, 148
Capability.55264:
	.space	148
	.type	PrioArray.55263, %object
	.size	PrioArray.55263, 128
PrioArray.55263:
	.space	128
	.type	g_EsBufValidFlag, %object
	.size	g_EsBufValidFlag, 128
g_EsBufValidFlag:
	.space	128
	.type	g_u32DFSMaxAllocTime, %object
	.size	g_u32DFSMaxAllocTime, 4
g_u32DFSMaxAllocTime:
	.space	4
	.type	g_eVdmVersion, %object
	.size	g_eVdmVersion, 4
g_eVdmVersion:
	.space	4
	.type	g_StandardObedience, %object
	.size	g_StandardObedience, 4
g_StandardObedience:
	.space	4
	.type	g_VfmwGlobalStat, %object
	.size	g_VfmwGlobalStat, 64
g_VfmwGlobalStat:
	.space	64
	.type	AcceleratorCharacter, %object
	.size	AcceleratorCharacter, 4
AcceleratorCharacter:
	.space	4
	.type	g_SCDID, %object
	.size	g_SCDID, 4
g_SCDID:
	.space	4
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
