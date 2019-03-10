#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_drv.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VDMDRV_AdjustErrRatio, %function
VDMDRV_AdjustErrRatio:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	sxtw	x19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	ldr	x22, .LC0
	add	x1, x22, x19, lsl 6
	ldr	w24, [x1, 8]
	cbz	w20, .L3
	cmp	w20, 2
	bls	.L15
	add	x0, x29, 80
	ldr	w2, [x1, 12]
	ldr	x1, [x1, 48]
	str	w2, [x29, 68]
	str	w19, [x0, -16]!
	str	x1, [x29, 72]
	bl	PostPro_GetErrRatio
	str	w0, [x21]
	ldr	x20, .LC5
	cbnz	w0, .L16
.L6:
	add	x19, x22, x19, lsl 6
	ldr	x1, [x20, w24, sxtw 3]
	mov	w0, 0
	add	x1, x1, 294912
	ldr	w3, [x19, 12]
	sub	w4, w3, #8
	ldr	w2, [x1, 3988]
	cmp	w4, 1
	ccmp	w3, 5, 4, hi
	add	w2, w2, 1
	cset	w3, eq
	str	w2, [x1, 3988]
	cbz	w3, .L17
	str	w0, [x21]
.L18:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L15:
	ldr	x1, .LC4
	mov	w4, 100
	mov	w3, w20
	mov	w2, w24
	str	w4, [x21]
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3:
	ldr	x1, .LC2
	mov	w2, w24
	mov	w3, 0
	str	wzr, [x21]
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L17:
	ldr	w0, [x21]
	mov	w1, 100
	cmp	w0, w1
	csel	w0, w0, w1, le
	cmp	w0, wzr
	csel	w0, w0, wzr, ge
	str	w0, [x21]
	b	.L18
	.p2align 3
.L16:
	ldr	x3, [x20, w24, sxtw 3]
	mov	w4, w0
	ldr	x1, .LC7
	mov	w2, w24
	add	x3, x3, 294912
	mov	w0, 1
	ldr	w3, [x3, 3988]
	bl	dprint_vfmw
	b	.L6
	.size	VDMDRV_AdjustErrRatio, .-VDMDRV_AdjustErrRatio
	.align	3
.LC0:
	.xword	.LANCHOR0
	.align	3
.LC2:
	.xword	.LC1
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	s_pstVfmwChan
	.align	3
.LC7:
	.xword	.LC6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_Init
	.type	VDMDRV_Init, %function
VDMDRV_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	sxtw	x19, w0
	mov	x0, x30
	lsl	x20, x19, 6
	bl	_mcount
	ldr	x21, .LC9
	ldr	x0, .LC8
	mov	x2, 64
	mov	w1, 0
	add	x19, x21, x19, lsl 2
	ldr	x3, [x0, 96]
	add	x0, x21, x20
	blr	x3
	str	wzr, [x19, 64]
	ldr	x0, .LC10
	str	wzr, [x19, 72]
	add	x20, x0, x20
	str	wzr, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMDRV_Init, .-VDMDRV_Init
	.align	3
.LC8:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC9:
	.xword	.LANCHOR0
	.align	3
.LC10:
	.xword	g_VfmwGlobalStat
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_Reset
	.type	VDMDRV_Reset, %function
VDMDRV_Reset:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sbfiz	x19, x19, 6, 32
	bl	_mcount
	ldr	x3, .LC11
	mov	x2, 64
	ldr	x0, .LC12
	mov	w1, 0
	ldr	x3, [x3, 96]
	add	x0, x0, x19
	blr	x3
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_Reset, .-VDMDRV_Reset
	.align	3
.LC11:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC12:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_SetPriority
	.type	VDMDRV_SetPriority, %function
VDMDRV_SetPriority:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x6, .LC15
	mov	w4, 0
	mov	w3, 0
	add	x5, x6, 208
	.p2align 2
.L28:
	mov	x0, 0
	mov	w2, 0
	.p2align 2
.L23:
	ldr	w1, [x19, x0, lsl 2]
	cmp	w1, w2
	ble	.L22
	mov	w3, w0
	mov	w2, w1
.L22:
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L23
	cmp	w2, wzr
	ble	.L33
	str	w3, [x5], 4
	add	w4, w4, 1
	str	wzr, [x19, w3, sxtw 2]
	cmp	w4, 32
	bne	.L28
.L21:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L33:
	cmp	w4, 31
	add	x1, x6, 80
	mov	w2, -1
	bgt	.L21
	.p2align 2
.L29:
	add	x0, x1, x4, sxtw 2
	add	w4, w4, 1
	cmp	w4, 32
	str	w2, [x0, 128]
	bne	.L29
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_SetPriority, .-VDMDRV_SetPriority
	.align	3
.LC15:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_AdjustPriorityAfterDec
	.type	VDMDRV_AdjustPriorityAfterDec, %function
VDMDRV_AdjustPriorityAfterDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x8, .LC16
	ldr	w0, [x8, 208]
	cmp	w19, w0
	beq	.L44
	add	x2, x8, 212
	mov	x0, 1
	b	.L40
	.p2align 3
.L36:
	add	x0, x0, 1
	cmp	x0, 32
	beq	.L44
.L40:
	ldr	w3, [x2]
	mov	w1, w0
	add	x2, x2, 4
	cmp	w3, w19
	bne	.L36
	cmp	w0, 30
	bgt	.L34
	add	x3, x0, 1
	lsl	x3, x3, 2
.L35:
	add	x2, x8, 208
	add	x7, x2, x3
	ldr	w3, [x2, x3]
	tbz	w3, #31, .L41
	b	.L34
	.p2align 3
.L43:
	add	x7, x2, x3, lsl 2
	ldr	w3, [x2, x3, lsl 2]
	tbnz	w3, #31, .L34
.L41:
	add	x4, x8, 80
	ldr	w5, [x2, x0, lsl 2]
	add	w1, w1, 1
	ldr	w6, [x4, w3, sxtw 2]
	ldr	w4, [x4, w5, sxtw 2]
	cmp	w6, w4
	blt	.L42
	str	w3, [x2, x0, lsl 2]
	str	w5, [x7]
.L42:
	cmp	w1, 30
	sxtw	x0, w1
	add	x3, x0, 1
	ble	.L43
.L34:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L44:
	mov	x3, 4
	mov	x0, 0
	mov	w1, 0
	b	.L35
	.size	VDMDRV_AdjustPriorityAfterDec, .-VDMDRV_AdjustPriorityAfterDec
	.align	3
.LC16:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_PrepareSleep
	.type	VDMDRV_PrepareSleep, %function
VDMDRV_PrepareSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC19
	sxtw	x0, w19
	add	x2, x1, x0, lsl 2
	ldr	w3, [x2, 64]
	cbnz	w3, .L50
	lsl	x0, x0, 6
	ldr	w0, [x1, x0]
	cbz	w0, .L51
	mov	w1, 1
	mov	w0, 0
	str	w1, [x2, 64]
.L48:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L51:
	mov	w1, 2
	str	w1, [x2, 64]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L50:
	mov	w0, -1
	b	.L48
	.size	VDMDRV_PrepareSleep, .-VDMDRV_PrepareSleep
	.align	3
.LC19:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_GetSleepStage
	.type	VDMDRV_GetSleepStage, %function
VDMDRV_GetSleepStage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC20
	add	x19, x0, x19, sxtw 2
	ldr	w0, [x19, 64]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_GetSleepStage, .-VDMDRV_GetSleepStage
	.align	3
.LC20:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ForceSleep
	.type	VDMDRV_ForceSleep, %function
VDMDRV_ForceSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC21
	sxtw	x0, w19
	add	x19, x3, x0, lsl 2
	ldr	w1, [x19, 64]
	cmp	w1, 2
	beq	.L54
	ldr	x4, .LC22
	add	x0, x3, x0, lsl 6
	mov	x2, 64
	mov	w1, 0
	ldr	x3, [x4, 96]
	blr	x3
	mov	w0, 2
	str	w0, [x19, 64]
.L54:
	ldr	x1, .LC24
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ForceSleep, .-VDMDRV_ForceSleep
	.align	3
.LC21:
	.xword	.LANCHOR0
	.align	3
.LC22:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC24:
	.xword	.LC23
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ExitSleep
	.type	VDMDRV_ExitSleep, %function
VDMDRV_ExitSleep:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC25
	add	x19, x0, x19, sxtw 2
	str	wzr, [x19, 64]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ExitSleep, .-VDMDRV_ExitSleep
	.align	3
.LC25:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_StartRepair
	.type	VDMDRV_StartRepair, %function
VDMDRV_StartRepair:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	bl	_mcount
	mov	w0, 8
	bl	VCTRL_RecordPosTime
	ldr	x0, .LC26
	ldr	x3, [x0, 240]
	cbz	x3, .L60
	mov	x1, x21
	mov	w0, w19
	sbfiz	x19, x19, 6, 32
	blr	x3
	ldr	x0, .LC29
	str	w20, [x0, x19]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L60:
	ldr	x1, .LC28
	mov	w2, 296
	mov	w0, 0
	sbfiz	x19, x19, 6, 32
	bl	dprint_vfmw
	ldr	x0, .LC29
	str	w20, [x0, x19]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMDRV_StartRepair, .-VDMDRV_StartRepair
	.align	3
.LC26:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC28:
	.xword	.LC27
	.align	3
.LC29:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_StartDec
	.type	VDMDRV_StartDec, %function
VDMDRV_StartDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	mov	w0, 8
	bl	VCTRL_RecordPosTime
	ldr	x0, .LC30
	ldr	x2, [x0, 248]
	cbz	x2, .L63
	mov	x1, x20
	mov	w0, w19
	sbfiz	x19, x19, 6, 32
	blr	x2
	ldr	x0, .LC32
	mov	w1, 1
	str	w1, [x0, x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L63:
	ldr	x1, .LC31
	mov	w2, 305
	mov	w0, 0
	sbfiz	x19, x19, 6, 32
	bl	dprint_vfmw
	ldr	x0, .LC32
	mov	w1, 1
	str	w1, [x0, x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_StartDec, .-VDMDRV_StartDec
	.align	3
.LC30:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC31:
	.xword	.LC27
	.align	3
.LC32:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsChanDec
	.type	VDMDRV_IsChanDec, %function
VDMDRV_IsChanDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC33
	add	x19, x0, x19, sxtw 2
	ldr	w0, [x19, 336]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_IsChanDec, .-VDMDRV_IsChanDec
	.align	3
.LC33:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_SetChanIsDec
	.type	VDMDRV_SetChanIsDec, %function
VDMDRV_SetChanIsDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	add	w20, w20, 1
	ldr	x1, .LC34
	mov	w0, w19
	add	x19, x1, x19, sxtw 2
	str	w20, [x19, 336]
	bl	VDMDRV_AdjustPriorityAfterDec
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_SetChanIsDec, .-VDMDRV_SetChanIsDec
	.align	3
.LC34:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ClearChanIsDec
	.type	VDMDRV_ClearChanIsDec, %function
VDMDRV_ClearChanIsDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC35
	add	x19, x0, x19, sxtw 2
	str	wzr, [x19, 336]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_ClearChanIsDec, .-VDMDRV_ClearChanIsDec
	.align	3
.LC35:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ParamInit
	.type	VDMDRV_ParamInit, %function
VDMDRV_ParamInit:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC38
	mov	w3, 1
	add	x2, x0, 256
	.p2align 2
.L70:
	ldr	x1, [x0]
	add	x0, x0, 8
	cmp	x0, x2
	cbz	x1, .L69
	str	w3, [x1, 16]
.L69:
	bne	.L70
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_ParamInit, .-VDMDRV_ParamInit
	.align	3
.LC38:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_AddMatchMode
	.type	VDMDRV_AddMatchMode, %function
VDMDRV_AddMatchMode:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_AddMatchMode, .-VDMDRV_AddMatchMode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_CheckAttachMode
	.type	VDMDRV_CheckAttachMode, %function
VDMDRV_CheckAttachMode:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 31
	bgt	.L76
	ldr	x22, .LC40
	ldr	x0, [x22, w19, sxtw 3]
	cbz	x0, .L76
	add	x1, x0, 262144
	ldr	x20, .LC41
	ldr	w2, [x1, 2028]
	ldr	w1, [x1, 2032]
	cmp	w2, 3839
	cset	w21, hi
	cmp	w1, 2159
	cset	w1, hi
	ands	w21, w21, w1
	bne	.L101
	add	x1, x20, 592
	ldr	w1, [x1, w19, sxtw 2]
.L84:
	cmp	w1, 10
	beq	.L86
.L85:
	ldr	w1, [x0, 16]
	cbz	w1, .L87
.L86:
	ldr	w1, [x0, 1520]
	cmp	w1, 35
	ble	.L88
	cbz	w21, .L87
	ldr	x2, .LC42
	mov	w5, 1
	ldr	x1, .LC48
	mov	w4, w19
	str	w5, [x0, 1508]
	mov	w3, 581
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, [x22, w19, sxtw 3]
	.p2align 2
.L87:
	str	wzr, [x0, 16]
	add	x20, x20, 464
	ldr	x0, [x22, w19, sxtw 3]
	ldr	w0, [x0, 1520]
	str	w0, [x20, w19, sxtw 2]
.L76:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L101:
	ldr	w4, [x0, 1520]
	add	x0, x20, 464
	ldr	x24, .LC42
	mov	w3, 553
	ldr	x1, .LC44
	ldr	w5, [x0, w19, sxtw 2]
	mov	x2, x24
	cmp	w4, w5
	sub	w0, w5, w4
	sub	w23, w4, w5
	csel	w23, w0, w23, ls
	mov	w0, 22
	bl	dprint_vfmw
	cmp	w23, 2
	bgt	.L81
	add	x0, x20, 592
	ldr	w1, [x0, w19, sxtw 2]
	add	w1, w1, 1
	str	w1, [x0, w19, sxtw 2]
.L82:
	cmn	w1, #1
	beq	.L83
	ldr	x0, [x22, w19, sxtw 3]
	b	.L84
	.p2align 3
.L88:
	str	wzr, [x0, 1508]
	add	x20, x20, 464
	ldr	x0, [x22, w19, sxtw 3]
	str	wzr, [x0, 16]
	ldr	x0, [x22, w19, sxtw 3]
	ldr	w0, [x0, 1520]
	str	w0, [x20, w19, sxtw 2]
	b	.L76
	.p2align 3
.L81:
	add	x23, x20, 592
	ldr	x1, .LC46
	mov	w3, 562
	mov	x2, x24
	mov	w0, 22
	str	wzr, [x23, w19, sxtw 2]
	bl	dprint_vfmw
	ldr	w1, [x23, w19, sxtw 2]
	b	.L82
	.p2align 3
.L83:
	add	x1, x20, 592
	mov	w2, 11
	ldr	x0, [x22, w19, sxtw 3]
	str	w2, [x1, w19, sxtw 2]
	b	.L85
	.size	VDMDRV_CheckAttachMode, .-VDMDRV_CheckAttachMode
	.align	3
.LC40:
	.xword	s_pstVfmwChan
	.align	3
.LC41:
	.xword	.LANCHOR0
	.align	3
.LC42:
	.xword	.LANCHOR1
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
	.global	VDMDRV_ChnDecReady
	.type	VDMDRV_ChnDecReady, %function
VDMDRV_ChnDecReady:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	bl	_mcount
	mov	w0, w19
	bl	VCTRL_IsChanActive
	cbnz	w0, .L106
	ldr	x0, .LC54
	add	x0, x0, x19, sxtw 2
	ldr	w20, [x0, 336]
	cbnz	w20, .L107
	mov	w0, w19
	str	xzr, [x21]
	bl	VCTRL_GetDecParam
	str	x0, [x21]
	cbz	x0, .L108
.L104:
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L106:
	ldr	x2, .LC51
	mov	w3, w19
	ldr	x1, .LC53
	mov	w0, 22
	add	x2, x2, 24
	mov	w20, 1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L107:
	ldr	x1, .LC56
	mov	w2, w19
	mov	w0, 22
	mov	w20, 1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L108:
	ldr	x1, .LC58
	mov	w2, w19
	mov	w0, 22
	mov	w20, 1
	bl	dprint_vfmw
	b	.L104
	.size	VDMDRV_ChnDecReady, .-VDMDRV_ChnDecReady
	.align	3
.LC51:
	.xword	.LANCHOR1
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC54:
	.xword	.LANCHOR0
	.align	3
.LC56:
	.xword	.LC55
	.align	3
.LC58:
	.xword	.LC57
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PostPro_CopyYuvByProtocol
	.type	PostPro_CopyYuvByProtocol, %function
PostPro_CopyYuvByProtocol:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	w19, w3
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	sub	w3, w19, #1
	cmp	w3, 11
	bls	.L116
.L115:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L116:
	ldr	x0, .LC59
	ldrb	w0, [x0,w3,uxtw]
	adr	x1, .Lrtx112
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx112:
	.section	.rodata
	.align	0
	.align	2
.L112:
	.byte	(.L111 - .Lrtx112) / 4
	.byte	(.L113 - .Lrtx112) / 4
	.byte	(.L115 - .Lrtx112) / 4
	.byte	(.L115 - .Lrtx112) / 4
	.byte	(.L115 - .Lrtx112) / 4
	.byte	(.L115 - .Lrtx112) / 4
	.byte	(.L115 - .Lrtx112) / 4
	.byte	(.L115 - .Lrtx112) / 4
	.byte	(.L115 - .Lrtx112) / 4
	.byte	(.L114 - .Lrtx112) / 4
	.byte	(.L114 - .Lrtx112) / 4
	.byte	(.L114 - .Lrtx112) / 4
	.text
	.p2align 3
.L114:
	ldr	x0, [x22]
	mov	x2, x21
	mov	w1, w20
	bl	PostPro_CopyYuv_Vp6
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L113:
	ldr	x0, [x22]
	mov	x2, x21
	mov	w1, w20
	bl	PostPro_CopyYuv
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L111:
	ldr	x0, [x22]
	mov	x2, x21
	mov	w1, w20
	bl	PostPro_CopyYuv_Vc1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	PostPro_CopyYuvByProtocol, .-PostPro_CopyYuvByProtocol
	.align	3
.LC59:
	.xword	.L112
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_GetMb0QpInCurrPic
	.type	VDMDRV_GetMb0QpInCurrPic, %function
VDMDRV_GetMb0QpInCurrPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC60
	lsl	x1, x0, 2
	ldr	x19, [sp, 16]
	sub	x0, x1, x0
	lsl	x1, x0, 4
	sub	x0, x1, x0
	ldp	x29, x30, [sp], 32
	add	x0, x2, x0, lsl 2
	ldr	w0, [x0, 728]
	and	w0, w0, 31
	ret
	.size	VDMDRV_GetMb0QpInCurrPic, .-VDMDRV_GetMb0QpInCurrPic
	.align	3
.LC60:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_GetSwitchRounding
	.type	VDMDRV_GetSwitchRounding, %function
VDMDRV_GetSwitchRounding:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC61
	lsl	x1, x0, 2
	ldr	x19, [sp, 16]
	sub	x0, x1, x0
	lsl	x1, x0, 4
	sub	x0, x1, x0
	ldp	x29, x30, [sp], 32
	add	x0, x2, x0, lsl 2
	ldr	w0, [x0, 732]
	and	w0, w0, 1
	ret
	.size	VDMDRV_GetSwitchRounding, .-VDMDRV_GetSwitchRounding
	.align	3
.LC61:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_MMUIntServeProc
	.type	VDMDRV_MMUIntServeProc, %function
VDMDRV_MMUIntServeProc:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC62
	mov	w0, 0
	ldr	x1, [x21, 24]
	blr	x1
	ldr	x19, .LC63
	ldr	x2, [x19, 216]
	cbz	x2, .L125
	mov	w1, w20
	mov	w0, 5
	blr	x2
	mov	w24, w0
	ldr	x2, [x19, 216]
	cbz	x2, .L125
	mov	w1, w20
	mov	w0, 6
	and	w23, w24, 7
	mov	w22, 0
	blr	x2
	mov	w25, w0
	ldr	x2, [x19, 216]
	cbz	x2, .L120
	mov	w1, w20
	mov	w0, 7
	blr	x2
	mov	w22, w0
.L120:
	cbz	w23, .L125
	cbnz	w25, .L139
	cbnz	w22, .L140
	.p2align 2
.L125:
	ldr	x1, [x19, 192]
	cbz	x1, .L126
	mov	w0, w20
	blr	x1
.L127:
	ldr	x1, [x21, 32]
	mov	w0, 0
	blr	x1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L126:
	ldr	x1, .LC68
	mov	w2, 1536
	mov	w0, 0
	bl	dprint_vfmw
	b	.L127
	.p2align 3
.L140:
	ldr	x1, .LC67
	mov	w3, w22
	mov	w2, w24
	mov	w0, 32
	bl	dprint_vfmw
	b	.L125
	.p2align 3
.L139:
	ldr	x1, .LC65
	mov	w3, w25
	mov	w2, w24
	mov	w0, 32
	bl	dprint_vfmw
	cbz	w22, .L125
	b	.L140
	.size	VDMDRV_MMUIntServeProc, .-VDMDRV_MMUIntServeProc
	.align	3
.LC62:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC63:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC67:
	.xword	.LC66
	.align	3
.LC68:
	.xword	.LC27
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsVdmInISR
	.type	VDMDRV_IsVdmInISR, %function
VDMDRV_IsVdmInISR:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_IsVdmInISR, .-VDMDRV_IsVdmInISR
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_SetStateIdle
	.type	VDMDRV_SetStateIdle, %function
VDMDRV_SetStateIdle:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sbfiz	x19, x19, 6, 32
	bl	_mcount
	ldr	x0, .LC69
	str	wzr, [x0, x19]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_SetStateIdle, .-VDMDRV_SetStateIdle
	.align	3
.LC69:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsVdmIdle
	.type	VDMDRV_IsVdmIdle, %function
VDMDRV_IsVdmIdle:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sbfiz	x19, x19, 6, 32
	bl	_mcount
	ldr	x0, .LC70
	ldr	w0, [x0, x19]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_IsVdmIdle, .-VDMDRV_IsVdmIdle
	.align	3
.LC70:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_GetCurrChanID
	.type	VDMDRV_GetCurrChanID, %function
VDMDRV_GetCurrChanID:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	sbfiz	x19, x19, 6, 32
	bl	_mcount
	ldr	x0, .LC71
	add	x19, x0, x19
	ldr	w0, [x19, 8]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_GetCurrChanID, .-VDMDRV_GetCurrChanID
	.align	3
.LC71:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_WaitVdmReadyIfNoIsr
	.type	VDMDRV_WaitVdmReadyIfNoIsr, %function
VDMDRV_WaitVdmReadyIfNoIsr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	ldr	x20, .LC72
	b	.L147
	.p2align 3
.L149:
	add	w19, w19, 1
	cmp	w19, 400
	beq	.L148
.L147:
	ldr	x1, [x20, 264]
	mov	w0, w21
	cbz	x1, .L149
	blr	x1
	cbz	w0, .L149
.L148:
	cmp	w19, 399
	ldr	x21, [sp, 32]
	cset	w0, hi
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMDRV_WaitVdmReadyIfNoIsr, .-VDMDRV_WaitVdmReadyIfNoIsr
	.align	3
.LC72:
	.xword	g_vdm_hal_fun_ptr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_AvsFirstFldNeedRepair
	.type	VDMDRV_AvsFirstFldNeedRepair, %function
VDMDRV_AvsFirstFldNeedRepair:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	sxtw	x20, w2
	bl	_mcount
	cmp	w19, 6
	mov	w0, 0
	beq	.L158
.L155:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L158:
	ldrb	w1, [x21, 17]
	mov	w0, 0
	cmp	w1, 1
	bne	.L155
	lsl	x0, x20, 3
	ldr	x1, .LC73
	sub	x0, x0, x20
	lsl	x0, x0, 3
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x20, x0, x20
	add	x20, x1, x20, lsl 3
	ldr	w0, [x20, 1744]
	cmp	w0, wzr
	cset	w0, gt
	b	.L155
	.size	VDMDRV_AvsFirstFldNeedRepair, .-VDMDRV_AvsFirstFldNeedRepair
	.align	3
.LC73:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_AvsSecondFldNeedRepair
	.type	VDMDRV_AvsSecondFldNeedRepair, %function
VDMDRV_AvsSecondFldNeedRepair:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x21, x1
	sxtw	x20, w2
	bl	_mcount
	cmp	w19, 6
	mov	w0, 0
	beq	.L163
.L160:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L163:
	ldrb	w1, [x21, 17]
	mov	w0, 0
	cmp	w1, 1
	bne	.L160
	lsl	x0, x20, 3
	ldr	x1, .LC74
	sub	x0, x0, x20
	lsl	x0, x0, 3
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x20, x0, x20
	add	x20, x1, x20, lsl 3
	ldr	w0, [x20, 2620]
	cmp	w0, wzr
	cset	w0, gt
	b	.L160
	.size	VDMDRV_AvsSecondFldNeedRepair, .-VDMDRV_AvsSecondFldNeedRepair
	.align	3
.LC74:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsMpeg4NvopCopy
	.type	VDMDRV_IsMpeg4NvopCopy, %function
VDMDRV_IsMpeg4NvopCopy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L168
	cmp	w20, 2
	mov	w0, 0
	beq	.L169
.L166:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L169:
	ldrb	w0, [x19, 166]
	ldp	x19, x20, [sp, 16]
	cmp	w0, 1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L168:
	ldr	x1, .LC76
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L166
	.size	VDMDRV_IsMpeg4NvopCopy, .-VDMDRV_IsMpeg4NvopCopy
	.align	3
.LC76:
	.xword	.LC75
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsVc1SkpicCopy
	.type	VDMDRV_IsVc1SkpicCopy, %function
VDMDRV_IsVc1SkpicCopy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L174
	cmp	w20, 1
	mov	w0, 0
	beq	.L175
.L172:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L175:
	ldrb	w0, [x19, 1]
	ldp	x19, x20, [sp, 16]
	cmp	w0, 1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L174:
	ldr	x1, .LC78
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L172
	.size	VDMDRV_IsVc1SkpicCopy, .-VDMDRV_IsVc1SkpicCopy
	.align	3
.LC78:
	.xword	.LC77
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsVp6NvopCopy
	.type	VDMDRV_IsVp6NvopCopy, %function
VDMDRV_IsVp6NvopCopy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L180
	sub	w19, w19, #10
	mov	w0, 0
	cmp	w19, 2
	bhi	.L178
	ldrb	w0, [x20, 1]
	cmp	w0, 1
	cset	w0, eq
.L178:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L180:
	ldr	x1, .LC80
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L178
	.size	VDMDRV_IsVp6NvopCopy, .-VDMDRV_IsVp6NvopCopy
	.align	3
.LC80:
	.xword	.LC79
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsVp9RptFrmCopy
	.type	VDMDRV_IsVp9RptFrmCopy, %function
VDMDRV_IsVp9RptFrmCopy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L185
	cmp	w20, 17
	mov	w0, 0
	beq	.L186
.L183:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L186:
	add	x19, x19, 262144
	ldrb	w0, [x19, 1028]
	ldp	x19, x20, [sp, 16]
	cmp	w0, 1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L185:
	ldr	x1, .LC82
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L183
	.size	VDMDRV_IsVp9RptFrmCopy, .-VDMDRV_IsVp9RptFrmCopy
	.align	3
.LC82:
	.xword	.LC81
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsCopy
	.type	VDMDRV_IsCopy, %function
VDMDRV_IsCopy:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L195
	sub	w0, w19, #1
	cmp	w0, 11
	bls	.L196
.L194:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L196:
	ldr	x1, .LC85
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx191
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx191:
	.section	.rodata
	.align	0
	.align	2
.L191:
	.byte	(.L193 - .Lrtx191) / 4
	.byte	(.L192 - .Lrtx191) / 4
	.byte	(.L194 - .Lrtx191) / 4
	.byte	(.L194 - .Lrtx191) / 4
	.byte	(.L194 - .Lrtx191) / 4
	.byte	(.L194 - .Lrtx191) / 4
	.byte	(.L194 - .Lrtx191) / 4
	.byte	(.L194 - .Lrtx191) / 4
	.byte	(.L194 - .Lrtx191) / 4
	.byte	(.L193 - .Lrtx191) / 4
	.byte	(.L193 - .Lrtx191) / 4
	.byte	(.L193 - .Lrtx191) / 4
	.text
	.p2align 3
.L193:
	ldrb	w0, [x20, 1]
	cmp	w0, 1
	cset	w0, eq
.L189:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L192:
	ldrb	w0, [x20, 166]
	ldp	x19, x20, [sp, 16]
	cmp	w0, 1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L195:
	ldr	x1, .LC84
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L189
	.size	VDMDRV_IsCopy, .-VDMDRV_IsCopy
	.align	3
.LC84:
	.xword	.LC83
	.align	3
.LC85:
	.xword	.L191
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_DoBeforeDec
	.type	VDMDRV_DoBeforeDec, %function
VDMDRV_DoBeforeDec:
	stp	x29, x30, [sp, -304]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w21, w0
	mov	x0, x30
	mov	w23, w1
	mov	x22, x2
	bl	_mcount
	mov	x25, 0
	ldr	x0, .LC86
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L198
	ldr	x3, .LC87
	add	x0, x29, 112
	mov	x2, 188
	mov	w1, 0
	mov	x25, x0
	ldr	x3, [x3, 96]
	blr	x3
.L198:
	ldr	x0, [x22]
	cbz	x0, .L212
	mov	w0, w23
	sxtw	x24, w21
	bl	VCTRL_GetVidStd
	ldr	x19, .LC90
	ldr	x1, .LC91
	add	x26, x19, x24, lsl 6
	ldr	x1, [x1]
	str	w0, [x26, 12]
	cbz	x1, .L201
	ldr	x2, [x22]
	stp	w23, w0, [x29, 96]
	str	x2, [x29, 104]
	add	x0, x29, 96
	blr	x1
	cmp	w0, 1
	mov	w20, w0
	beq	.L200
	ldr	w0, [x26, 12]
.L201:
	ldr	x1, [x22]
	lsl	x27, x24, 6
	add	x26, x19, x27
	add	x28, x26, 4
	bl	VDMDRV_IsCopy
	mov	w20, w0
	cbnz	w0, .L213
	ldr	x0, .LC94
	ldr	x4, [x0, 256]
	cbz	x4, .L205
	ldr	w0, [x26, 12]
	mov	x3, x25
	ldr	x1, [x22]
	mov	w2, w21
	blr	x4
	cbz	w0, .L214
.L205:
	ldr	x1, .LC96
	mov	w0, 0
	add	x24, x19, x24, lsl 6
	add	x19, x19, x23, sxtw 2
	bl	dprint_vfmw
	mov	x2, x28
	mov	w1, 2
	mov	w0, w21
	bl	VDMDRV_AdjustErrRatio
	ldr	w1, [x24, 4]
	mov	w3, w21
	mov	x2, 0
	mov	w0, w23
	bl	VCTRL_VdmPostProc
	ldr	x3, .LC87
	mov	x2, 64
	mov	w1, 0
	mov	x0, x24
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x19, 336]
.L200:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L213:
	ldr	w3, [x26, 12]
	mov	x2, x25
	mov	x0, x22
	mov	w1, w21
	bl	PostPro_CopyYuvByProtocol
	mov	w20, w0
	cbz	w0, .L215
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L215:
	mov	w0, w21
	mov	x2, x28
	mov	w1, 0
	sxtw	x22, w23
	bl	VDMDRV_AdjustErrRatio
	mov	x2, x25
	mov	w1, w21
	mov	w0, 2
	add	w21, w21, 1
	bl	VDMDRV_StartRepair
	ldr	x0, .LC87
	ldr	x0, [x0]
	blr	x0
	mov	w1, w0
	ldr	x0, .LC92
	add	x2, x19, x22, lsl 2
	str	w1, [x26, 20]
	add	x27, x0, x27
	mov	w0, w23
	str	w21, [x2, 336]
	str	w1, [x27, 4]
	bl	VDMDRV_AdjustPriorityAfterDec
	add	x2, x19, 2656
	ldr	x3, .LC93
	mov	w4, 757
	add	x2, x2, x22, lsl 2
	mov	w1, 7
	mov	w0, w23
	bl	RecordPOS
	b	.L200
	.p2align 3
.L214:
	mov	x1, x25
	mov	w0, w21
	sxtw	x22, w23
	add	w21, w21, 1
	bl	VDMDRV_StartDec
	ldr	x0, .LC87
	ldr	x0, [x0]
	blr	x0
	mov	w1, w0
	ldr	x0, .LC92
	add	x2, x19, x22, lsl 2
	str	w1, [x26, 20]
	add	x27, x0, x27
	mov	w0, w23
	str	w21, [x2, 336]
	str	w1, [x27, 4]
	bl	VDMDRV_AdjustPriorityAfterDec
	add	x2, x19, 2656
	ldr	x3, .LC93
	add	x2, x2, x22, lsl 2
	mov	w0, w23
	mov	w4, 792
	mov	w1, 5
	bl	RecordPOS
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.p2align 3
.L212:
	ldr	x1, .LC89
	mov	w2, w23
	mov	w0, 22
	mov	w20, 1
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
	.size	VDMDRV_DoBeforeDec, .-VDMDRV_DoBeforeDec
	.align	3
.LC86:
	.xword	g_HalDisable
	.align	3
.LC87:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC89:
	.xword	.LC88
	.align	3
.LC90:
	.xword	.LANCHOR0
	.align	3
.LC91:
	.xword	AcceleratorCharacter
	.align	3
.LC92:
	.xword	g_VfmwGlobalStat
	.align	3
.LC93:
	.xword	.LANCHOR2
	.align	3
.LC94:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC96:
	.xword	.LC95
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ActivateVDH
	.type	VDMDRV_ActivateVDH, %function
VDMDRV_ActivateVDH:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w22, w0
	mov	x0, x30
	sbfiz	x20, x22, 6, 32
	bl	_mcount
	ldr	x25, .LC99
	ldr	x24, .LC98
	mov	w0, 5
	add	x21, x20, 48
	ldr	x1, [x25, 24]
	add	x21, x24, x21
	blr	x1
	ldr	w0, [x24, 208]
	tbnz	w0, #31, .L217
	add	x19, x24, 212
	add	x23, x24, 336
	add	x20, x24, x20
	b	.L218
	.p2align 3
.L221:
	cmp	x19, x23
	beq	.L217
	ldr	w0, [x19], 4
	tbnz	w0, #31, .L217
.L218:
	mov	w1, w0
	str	w0, [x20, 8]
	mov	x2, x21
	mov	w0, w22
	bl	VDMDRV_ChnDecReady
	cbnz	w0, .L221
	ldr	w1, [x20, 8]
	mov	x2, x21
	mov	w0, w22
	bl	VDMDRV_DoBeforeDec
	cbnz	w0, .L221
.L217:
	ldr	x1, [x25, 32]
	mov	w0, 5
	blr	x1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	VDMDRV_ActivateVDH, .-VDMDRV_ActivateVDH
	.align	3
.LC98:
	.xword	.LANCHOR0
	.align	3
.LC99:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_AfterDec
	.type	VDMDRV_AfterDec, %function
VDMDRV_AfterDec:
	stp	x29, x30, [sp, -464]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w24, w0
	mov	x0, x30
	uxtb	w25, w1
	bl	_mcount
	ldr	x22, .LC101
	mov	x2, 160
	mov	w1, 0
	add	x0, x29, 112
	ldr	x3, [x22, 96]
	blr	x3
	ldr	x0, .LC102
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L224
	add	x19, x29, 272
	ldr	x3, [x22, 96]
	mov	x2, 188
	mov	w1, 0
	mov	x0, x19
	blr	x3
	str	x19, [x29, 256]
.L224:
	ldr	x3, [x22, 96]
	add	x28, x29, 116
	mov	x2, 136
	mov	w1, 0
	mov	x0, x28
	sxtw	x21, w24
	lsl	x23, x21, 6
	blr	x3
	ldr	x20, .LC104
	ldr	x26, .LC103
	mov	w0, 2
	add	x19, x20, x23
	ldr	x1, .LC106
	ldr	w2, [x20, x23]
	add	x27, x19, 4
	strb	w25, [x29, 264]
	ldrsw	x3, [x19, 8]
	ldr	w4, [x19, 4]
	ldr	x3, [x26, x3, lsl 3]
	ldr	w3, [x3, 1232]
	str	w3, [x29, 112]
	ldr	w3, [x19, 28]
	bl	dprint_vfmw
	ldr	w3, [x20, x23]
	cmp	w3, 2
	beq	.L226
	cmp	w3, 3
	beq	.L227
	cmp	w3, 1
	beq	.L266
	ldr	x1, .LC114
	mov	w4, w25
	ldr	w2, [x19, 8]
	mov	w0, 0
	bl	dprint_vfmw
	ldrsw	x0, [x19, 8]
	add	x20, x20, x0, lsl 2
	str	wzr, [x20, 336]
.L223:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 464
	ret
	.p2align 3
.L266:
	ldr	w23, [x19, 28]
	cmp	w23, 1
	beq	.L267
	mov	w1, 3
	mov	x2, x27
	mov	w0, w24
	bl	VDMDRV_AdjustErrRatio
	ldr	w1, [x19, 4]
	cbz	w1, .L230
	ldr	x0, .LC109
	ldr	x4, [x0]
	cbz	x4, .L230
	ldr	w0, [x19, 8]
	mov	w3, 4
	str	w1, [x29, 104]
	add	x2, x29, 104
	mov	w1, 114
	blr	x4
.L230:
	ldr	w0, [x29, 112]
	cmp	w0, 1
	beq	.L268
.L231:
	add	x19, x20, x21, lsl 6
	ldr	w0, [x19, 8]
	ldr	x1, [x26, w0, sxtw 3]
	add	x1, x1, 294912
	ldrsb	w1, [x1, 3944]
	cbnz	w1, .L269
	ldr	w1, [x19, 4]
.L242:
	ldr	w2, [x29, 112]
	cmp	w2, 1
	bne	.L234
	add	x21, x20, x21, lsl 6
	mov	w3, w24
	ldr	w2, [x21, 44]
	cmp	w2, 2
	add	x2, x29, 116
	beq	.L270
.L264:
	bl	VCTRL_VdmPostProc
	ldr	w0, [x21, 8]
	bl	VCTRL_ClearDecparam
	mov	x2, 64
	mov	w1, 0
	mov	x0, x21
	ldrsw	x3, [x21, 8]
	ldr	x4, [x22, 96]
	b	.L263
	.p2align 3
.L227:
	ldp	w1, w0, [x19, 4]
	mov	w3, w24
	mov	x2, x28
	str	wzr, [x19, 28]
	bl	VCTRL_VdmPostProc
	ldr	w0, [x19, 8]
	bl	VCTRL_ClearDecparam
	ldrsw	x3, [x19, 8]
	mov	x2, 64
	ldr	x4, [x22, 96]
	mov	w1, 0
	mov	x0, x19
.L263:
	add	x20, x20, x3, lsl 2
	str	wzr, [x20, 336]
	blr	x4
	mov	w0, w24
	bl	VDMDRV_ActivateVDH
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 464
	ret
	.p2align 3
.L226:
	ldr	w0, [x19, 12]
	str	wzr, [x19, 28]
	cmp	w0, 6
	ldr	x1, [x19, 48]
	beq	.L271
.L239:
	bl	VDMDRV_IsCopy
	cbnz	w0, .L272
	add	x21, x20, x21, lsl 6
	mov	w3, w24
	add	x2, x29, 116
	ldp	w1, w0, [x21, 4]
	b	.L264
	.p2align 3
.L267:
	ldr	x1, [x19, 48]
	mov	w2, w24
	ldr	w0, [x19, 12]
	bl	PostPro_SetFullRepair
	mov	x2, x27
	mov	w1, w23
	mov	w0, w24
	bl	VDMDRV_AdjustErrRatio
	str	wzr, [x19, 28]
	ldrb	w2, [x29, 264]
	mov	w0, 0
	ldr	x1, .LC108
	bl	dprint_vfmw
	b	.L230
	.p2align 3
.L271:
	ldrb	w2, [x1, 17]
	cmp	w2, 1
	bne	.L239
	lsl	x3, x21, 3
	sub	x3, x3, x21
	lsl	x3, x3, 3
	sub	x3, x3, x21
	lsl	x3, x3, 2
	sub	x3, x3, x21
	add	x3, x20, x3, lsl 3
	ldr	w3, [x3, 2620]
	cmp	w3, wzr
	ble	.L239
	ldr	x3, .LC110
	ldr	x5, [x3, 280]
	cbz	x5, .L241
	ldr	x4, [x29, 256]
	mov	w3, w24
	blr	x5
	cbnz	w0, .L241
	ldr	x2, [x29, 256]
	mov	w1, w24
	mov	w0, 3
	bl	VDMDRV_StartRepair
	ldr	x2, .LC112
	mov	w4, 995
	ldr	x3, .LC111
	mov	w1, 7
	add	x2, x23, x2
	ldr	w0, [x19, 8]
	add	x3, x3, 56
	add	x2, x2, 4
	bl	RecordPOS
	b	.L223
	.p2align 3
.L269:
	ldr	x1, [x19, 48]
	ldr	w0, [x19, 12]
	bl	PostPro_GetRepairStratage
	cmp	w0, 1
	ldr	w1, [x19, 4]
	cset	w2, eq
	cmp	w1, wzr
	cset	w0, eq
	orr	w2, w2, w0
	cbnz	w2, .L273
	ldr	w0, [x19, 12]
	ldr	x1, [x19, 48]
	mov	w19, 2
	cmp	w0, 6
	beq	.L274
.L237:
	ldr	x3, .LC110
	ldr	x5, [x3, 280]
	cbz	x5, .L241
	ldr	x4, [x29, 256]
	mov	w3, w24
	blr	x5
	cbz	w0, .L275
.L241:
	lsl	x21, x21, 6
	mov	x2, x27
	add	x19, x20, x21
	mov	w0, w24
	mov	w1, 2
	bl	VDMDRV_AdjustErrRatio
	ldp	w1, w0, [x19, 4]
	mov	w3, w24
	add	x2, x29, 116
	bl	VCTRL_VdmPostProc
	ldr	w0, [x19, 8]
	bl	VCTRL_ClearDecparam
	str	wzr, [x20, x21]
	ldrsw	x0, [x19, 8]
	add	x20, x20, x0, lsl 2
	str	wzr, [x20, 336]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 464
	ret
	.p2align 3
.L234:
	mov	w3, w24
	add	x2, x29, 116
	add	x21, x20, x21, lsl 6
	b	.L264
	.p2align 3
.L272:
	mov	x2, x27
	mov	w0, w24
	mov	w1, 0
	add	x21, x20, x21, lsl 6
	bl	VDMDRV_AdjustErrRatio
	mov	w3, w24
	add	x2, x29, 116
	ldp	w1, w0, [x21, 4]
	b	.L264
	.p2align 3
.L268:
	mov	x2, x27
	mov	w1, 0
	mov	w0, w24
	bl	VDMDRV_AdjustErrRatio
	b	.L231
	.p2align 3
.L270:
	bl	VCTRL_VdmPostProc
	b	.L223
	.p2align 3
.L274:
	ldrb	w3, [x1, 17]
	cmp	w3, 1
	bne	.L237
	lsl	x2, x21, 3
	sub	x2, x2, x21
	lsl	x2, x2, 3
	sub	x2, x2, x21
	lsl	x2, x2, 2
	sub	x2, x2, x21
	add	x2, x20, x2, lsl 3
	ldr	w3, [x2, 2620]
	cmp	w3, wzr
	mov	w3, 3
	cset	w2, gt
	csel	w19, w19, w3, le
	b	.L237
	.p2align 3
.L275:
	ldr	x2, [x29, 256]
	mov	w1, w24
	mov	w0, w19
	bl	VDMDRV_StartRepair
	lsl	x2, x21, 6
	ldr	x0, .LC112
	add	x20, x20, x2
	ldr	x3, .LC111
	add	x2, x2, x0
	mov	w4, 964
	mov	w1, 7
	add	x3, x3, 24
	ldr	w0, [x20, 8]
	add	x2, x2, 4
	bl	RecordPOS
	b	.L223
.L273:
	ldr	w0, [x19, 8]
	b	.L242
	.size	VDMDRV_AfterDec, .-VDMDRV_AfterDec
	.align	3
.LC101:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC102:
	.xword	g_HalDisable
	.align	3
.LC103:
	.xword	s_pstVfmwChan
	.align	3
.LC104:
	.xword	.LANCHOR0
	.align	3
.LC106:
	.xword	.LC105
	.align	3
.LC108:
	.xword	.LC107
	.align	3
.LC109:
	.xword	g_event_report
	.align	3
.LC110:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC111:
	.xword	.LANCHOR2
	.align	3
.LC112:
	.xword	g_VfmwGlobalStat
	.align	3
.LC114:
	.xword	.LC113
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_CheckDevice
	.type	VDMDRV_CheckDevice, %function
VDMDRV_CheckDevice:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x19, w0
	mov	x0, x30
	lsl	x21, x19, 6
	mov	x22, x19
	bl	_mcount
	ldr	x20, .LC115
	add	x23, x20, x21
	ldr	w0, [x23, 8]
	bl	VCTRL_GetDecParam
	cbz	x0, .L305
.L277:
	lsl	x0, x19, 6
	add	x21, x20, x0
	ldr	w0, [x20, x0]
	cbnz	w0, .L306
.L278:
	add	x19, x20, x19, lsl 2
	mov	w0, 0
	ldr	w1, [x19, 64]
	cbz	w1, .L299
	cmp	w1, 1
	beq	.L307
.L283:
	mov	w0, 1
.L299:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L306:
	ldr	x0, .LC122
	ldr	x0, [x0]
	blr	x0
	str	w0, [x21, 24]
	ldr	w1, [x21, 20]
	cmp	w0, w1
	bcc	.L281
	sub	w3, w0, w1
	cmp	w1, wzr
	ccmp	w3, wzr, 1, ne
	blt	.L281
	cmp	w3, 1000
	bls	.L283
	ldr	x1, .LC124
	mov	w0, 1
	ldr	w2, [x21, 8]
	bl	dprint_vfmw
	ldr	x0, .LC125
	ldr	x4, [x0]
	cbz	x4, .L284
	ldr	w0, [x21, 8]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 101
	blr	x4
.L284:
	ldr	x0, .LC126
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L285
	mov	w1, w22
	mov	w0, 1
	bl	VDH_Reset_Module
.L286:
	lsl	x19, x19, 6
	mov	w21, 1
	add	x0, x20, x19
	ldr	w1, [x0, 36]
	str	w21, [x0, 28]
	cmp	w1, w21
	bne	.L288
	ldrsw	x1, [x0, 8]
	str	wzr, [x20, x19]
	str	wzr, [x0, 28]
	add	x19, x20, x1, lsl 2
	str	wzr, [x0, 36]
	mov	w0, 0
	str	wzr, [x19, 336]
	b	.L299
	.p2align 3
.L281:
	str	w0, [x21, 20]
	mov	w0, 1
	b	.L299
	.p2align 3
.L307:
	mov	w2, 2
	str	w2, [x19, 64]
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L305:
	ldr	w3, [x20, x21]
	cbz	w3, .L278
	ldr	x0, .LC116
	ldr	x1, [x0, 272]
	cbz	x1, .L279
	mov	w0, w19
	blr	x1
	ldr	w3, [x20, x21]
	cbnz	w0, .L308
.L279:
	lsl	x23, x19, 6
	ldr	x1, .LC120
	add	x21, x20, x23
	mov	w0, 1
	ldr	w2, [x21, 8]
	bl	dprint_vfmw
	str	wzr, [x21, 36]
	ldr	x0, .LC121
	mov	w1, 1133
	ldr	w2, [x20, x23]
	add	x0, x0, 88
	bl	DBG_AddTrace
	ldr	x3, .LC122
	mov	x2, 64
	mov	w1, 0
	mov	x0, x21
	ldr	x3, [x3, 96]
	blr	x3
	ldrsw	x0, [x21, 8]
	add	x0, x20, x0, lsl 2
	str	wzr, [x0, 336]
	b	.L277
	.p2align 3
.L288:
	mov	w0, w22
	mov	w1, 0
	bl	VDMDRV_AfterDec
	mov	w0, w21
	b	.L299
	.p2align 3
.L285:
	ldr	x0, .LC116
	ldr	x1, [x0, 160]
	cbz	x1, .L287
	mov	w0, w22
	blr	x1
	b	.L286
	.p2align 3
.L308:
	ldr	x1, .LC118
	mov	w0, 1
	ldr	w2, [x23, 8]
	bl	dprint_vfmw
	mov	w0, 1
	str	w0, [x23, 36]
	b	.L277
.L287:
	ldr	x1, .LC127
	mov	w2, 1165
	mov	w0, 0
	bl	dprint_vfmw
	b	.L286
	.size	VDMDRV_CheckDevice, .-VDMDRV_CheckDevice
	.align	3
.LC115:
	.xword	.LANCHOR0
	.align	3
.LC116:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC118:
	.xword	.LC117
	.align	3
.LC120:
	.xword	.LC119
	.align	3
.LC121:
	.xword	.LANCHOR2
	.align	3
.LC122:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC124:
	.xword	.LC123
	.align	3
.LC125:
	.xword	g_event_report
	.align	3
.LC126:
	.xword	g_HalDisable
	.align	3
.LC127:
	.xword	.LC27
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_WakeUpVdm
	.type	VDMDRV_WakeUpVdm, %function
VDMDRV_WakeUpVdm:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	bl	VDMDRV_CheckDevice
	cbz	w0, .L311
	ldp	x29, x30, [sp], 16
	ret
	.p2align 3
.L311:
	bl	VDMDRV_ActivateVDH
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMDRV_WakeUpVdm, .-VDMDRV_WakeUpVdm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_IsrProcess
	.type	VDMDRV_IsrProcess, %function
VDMDRV_IsrProcess:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L313
	ldr	x2, .LC128
	mov	w3, w19
	ldr	x1, .LC130
	mov	w4, 0
	add	x2, x2, 112
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L313:
	mov	w0, 9
	sxtw	x21, w19
	bl	VCTRL_RecordPosTime
	ldr	x23, .LC131
	mov	w0, 0
	ldr	x1, [x23, 24]
	blr	x1
	ldr	x20, .LC132
	add	x0, x20, x21, lsl 6
	ldr	w0, [x0, 8]
	tbnz	w0, #31, .L347
	ldr	x24, .LC133
	ldr	x1, [x24, w0, sxtw 3]
	cbz	x1, .L347
	ldr	x22, .LC134
	ldr	w25, [x1, 1232]
	ldr	x2, [x22, 320]
	cbz	x2, .L320
	mov	w1, w19
	mov	w0, 2
	blr	x2
	cbnz	w0, .L319
.L320:
	cmp	w25, 1
	beq	.L381
.L378:
	add	x0, x20, x21, lsl 6
	ldr	w0, [x0, 8]
.L347:
	lsl	x21, x21, 6
	str	wzr, [x20, x21]
	bl	VCTRL_InformVdmFree
	ldr	x0, .LC135
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L321
	mov	w1, w19
	mov	w0, 1
	bl	VDH_Notify_ModuleIdle
.L321:
	ldr	x1, [x23, 32]
	mov	w0, 0
	blr	x1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L381:
	ldr	x2, [x22, 328]
	cbz	x2, .L378
	mov	w1, w19
	mov	w0, 2
	blr	x2
	cbz	w0, .L378
.L319:
	add	x0, x20, x21, lsl 6
	ldr	w0, [x0, 8]
	tbnz	w0, #31, .L324
	ldr	x0, [x24, w0, sxtw 3]
	cbz	x0, .L324
	ldr	x2, [x22, 328]
	ldr	w24, [x0, 1232]
	cbz	x2, .L353
	mov	w1, w19
	mov	w0, 1
	blr	x2
	mov	w25, w0
.L325:
	ldr	x2, [x22, 320]
	cbz	x2, .L326
	mov	w1, w19
	mov	w0, 1
	blr	x2
	cmp	w24, 1
	beq	.L382
.L324:
	mov	w24, 1
.L323:
	ldr	x1, [x22, 296]
	cbz	x1, .L330
	mov	w0, w19
	blr	x1
.L331:
	ldr	x1, [x22, 184]
	cbz	x1, .L332
	mov	w0, w19
	blr	x1
.L333:
	lsl	x22, x21, 6
	ldr	x3, .LC128
	add	x0, x20, x22
	add	x2, x20, 2784
	mov	w4, 1463
	add	x3, x3, 136
	mov	w1, 6
	ldr	w0, [x0, 8]
	add	x2, x2, x0, sxtw 2
	bl	RecordPOS
	ldr	x0, [x23]
	blr	x0
	ldr	x4, .LC137
	add	x3, x4, x22
	ldr	w1, [x3, 4]
	cbz	w1, .L335
	ldr	w5, [x4, x22]
	add	w2, w5, 499712
	add	w2, w2, 288
	cmp	w1, w2
	bhi	.L336
	ldr	w2, [x3, 8]
.L337:
	lsl	x3, x21, 2
	sub	w1, w0, w1
	sub	w0, w0, w5
	sub	x5, x3, x21
	lsl	x3, x5, 4
	lsl	x7, x21, 6
	sub	x3, x3, x5
	add	w1, w1, w2
	add	x2, x4, x7
	cmp	w0, 999
	add	x3, x20, x3, lsl 2
	ldp	w5, w6, [x2, 28]
	ldr	w3, [x3, 744]
	add	w5, w5, 1
	stp	wzr, w1, [x2, 4]
	add	w6, w6, w3, lsr 10
	stp	w5, w6, [x2, 28]
	bls	.L335
	add	x7, x20, x7
	ldr	w3, [x7, 16]
	cbnz	w3, .L339
	ldr	w7, [x2, 12]
.L340:
	lsl	w2, w1, 6
	lsl	w3, w7, 6
	sub	w2, w2, w1
	sub	w3, w3, w7
	lsl	w2, w2, 1
	lsl	w3, w3, 1
	sub	w2, w2, w1
	lsl	w1, w5, 6
	sub	w1, w1, w5
	sub	w3, w3, w7
	lsl	w1, w1, 1
	lsl	w3, w3, 3
	sub	w1, w1, w5
	lsl	x5, x21, 6
	lsl	w2, w2, 3
	lsl	w1, w1, 3
	udiv	w3, w3, w0
	str	wzr, [x4, x5]
	add	x4, x4, x5
	stp	wzr, w6, [x4, 32]
	str	w0, [x4, 40]
	udiv	w2, w2, w0
	stp	w2, w3, [x4, 16]
	udiv	w1, w1, w0
	stp	w1, wzr, [x4, 24]
.L335:
	lsl	x0, x21, 6
	add	x22, x20, x0
	ldr	w1, [x22, 36]
	ldr	w25, [x22, 8]
	cmp	w1, 1
	beq	.L383
	ldr	w2, [x20, x0]
	cbz	w2, .L343
	ldr	x0, [x22, 48]
	cbz	x0, .L384
.L343:
	mov	w0, w25
	bl	VCTRL_IsChanActive
	cbnz	w0, .L385
	mov	w0, w25
	bl	VCTRL_GetDecParam
	cbz	x0, .L386
	mov	w1, 1
	mov	w0, w19
	bl	VDMDRV_AfterDec
.L350:
	add	x0, x20, x21, lsl 6
	ldr	w0, [x0, 8]
	bl	VCTRL_InformVdmFree
	cmp	w24, 1
	beq	.L387
.L346:
	ldr	x1, [x23, 32]
	mov	w0, 0
	blr	x1
	lsl	x0, x21, 2
	sub	x21, x0, x21
	mov	w0, 1
	lsl	x1, x21, 4
	sub	x21, x1, x21
	add	x20, x20, x21, lsl 2
	ldr	w1, [x20, 744]
	bl	VCTRL_RecordData
	mov	w0, 10
	bl	VCTRL_RecordPosTime
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L382:
	cmp	w0, 1
	cset	w2, eq
	cmp	w25, 1
	cset	w1, eq
	tst	w2, w1
	beq	.L327
.L329:
	add	x0, x20, x21, lsl 6
	mov	w1, 1
	mov	w24, w1
	str	w1, [x0, 44]
	b	.L323
	.p2align 3
.L385:
	ldr	x1, .LC143
	mov	w3, w25
	mov	w2, 1412
	mov	w0, 0
	bl	dprint_vfmw
.L342:
	lsl	x0, x21, 6
	add	x1, x20, x0
	str	wzr, [x20, x0]
	ldrsw	x0, [x1, 8]
	add	x0, x20, x0, lsl 2
	str	wzr, [x0, 336]
	b	.L350
	.p2align 3
.L336:
	str	w1, [x4, x22]
	mov	w5, w1
	mov	w2, 0
	b	.L337
	.p2align 3
.L326:
	cmp	w24, 1
	bne	.L324
	cmp	w25, 1
	bne	.L324
.L348:
	add	x0, x20, x21, lsl 6
	mov	w1, 2
	mov	w24, 0
	str	w1, [x0, 44]
	b	.L323
	.p2align 3
.L353:
	mov	w25, 0
	b	.L325
	.p2align 3
.L339:
	udiv	w7, w6, w3
	str	w7, [x2, 12]
	b	.L340
	.p2align 3
.L327:
	cmp	w0, wzr
	cset	w0, eq
	tst	w1, w0
	bne	.L348
	cmp	w25, wzr
	cset	w0, eq
	tst	w2, w0
	beq	.L324
	add	x0, x20, x21, lsl 6
	ldr	w1, [x0, 44]
	cmp	w1, 2
	bne	.L329
	mov	w1, 3
	str	w1, [x0, 44]
	b	.L323
	.p2align 3
.L332:
	ldr	x1, .LC136
	mov	w2, 1461
	mov	w0, 0
	bl	dprint_vfmw
	b	.L333
	.p2align 3
.L330:
	ldr	x1, .LC136
	mov	w2, 1459
	mov	w0, 0
	bl	dprint_vfmw
	b	.L331
	.p2align 3
.L387:
	ldr	x0, .LC135
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L346
	mov	w1, w19
	mov	w0, w24
	bl	VDH_Notify_ModuleIdle
	b	.L346
	.p2align 3
.L383:
	ldr	x1, .LC139
	mov	w2, 1383
	mov	w0, 0
	bl	dprint_vfmw
	str	wzr, [x22, 36]
	b	.L342
	.p2align 3
.L386:
	ldr	x1, .LC145
	mov	w3, w25
	mov	w2, 1418
	bl	dprint_vfmw
	b	.L342
	.p2align 3
.L384:
	ldr	x1, .LC141
	bl	dprint_vfmw
	mov	w0, w25
	bl	VCTRL_GetDecParam
	cbz	x0, .L342
	mov	w3, w19
	mov	x2, 0
	mov	w1, 100
	mov	w0, w25
	bl	VCTRL_VdmPostProc
	b	.L342
	.size	VDMDRV_IsrProcess, .-VDMDRV_IsrProcess
	.align	3
.LC128:
	.xword	.LANCHOR2
	.align	3
.LC130:
	.xword	.LC129
	.align	3
.LC131:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC132:
	.xword	.LANCHOR0
	.align	3
.LC133:
	.xword	s_pstVfmwChan
	.align	3
.LC134:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC135:
	.xword	g_HalDisable
	.align	3
.LC136:
	.xword	.LC27
	.align	3
.LC137:
	.xword	g_VfmwGlobalStat
	.align	3
.LC139:
	.xword	.LC138
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC143:
	.xword	.LC142
	.align	3
.LC145:
	.xword	.LC144
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_ResetVDH
	.type	VDMDRV_ResetVDH, %function
VDMDRV_ResetVDH:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC147
	ldr	w0, [x19, 8]
	cmp	w20, w0
	beq	.L393
.L388:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L393:
	ldr	x0, .LC148
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L390
	mov	w1, 0
	mov	w0, 1
	bl	VDH_Reset_Module
	str	wzr, [x19]
	b	.L388
	.p2align 3
.L390:
	ldr	x0, .LC149
	ldr	x1, [x0, 160]
	cbz	x1, .L392
	mov	w0, 0
	blr	x1
	str	wzr, [x19]
	b	.L388
.L392:
	ldr	x1, .LC150
	mov	w2, 1810
	mov	w0, 0
	bl	dprint_vfmw
	str	wzr, [x19]
	b	.L388
	.size	VDMDRV_ResetVDH, .-VDMDRV_ResetVDH
	.align	3
.LC147:
	.xword	.LANCHOR0
	.align	3
.LC148:
	.xword	g_HalDisable
	.align	3
.LC149:
	.xword	g_vdm_hal_fun_ptr
	.align	3
.LC150:
	.xword	.LC27
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_MarkReloadDsp
	.type	VDMDRV_MarkReloadDsp, %function
VDMDRV_MarkReloadDsp:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cbnz	w20, .L394
	add	w0, w19, 1
	cmp	w0, 32
	bhi	.L394
	ldr	x0, .LC151
	mov	w1, 1
	cmn	w19, #1
	str	w1, [x0, 40]
	beq	.L394
	ldr	x5, .LC152
	mov	w7, -1
	ldr	x2, .LC153
	mov	w4, 0
	ldr	x1, .LC155
	mov	w3, 1840
	ldr	x6, [x5, w19, sxtw 3]
	add	x2, x2, 160
	mov	w0, 22
	str	w7, [x6, 28]
	ldr	x5, [x5]
	ldr	w5, [x5, 28]
	bl	dprint_vfmw
.L394:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_MarkReloadDsp, .-VDMDRV_MarkReloadDsp
	.align	3
.LC151:
	.xword	.LANCHOR0
	.align	3
.LC152:
	.xword	s_pstVfmwChan
	.align	3
.LC153:
	.xword	.LANCHOR2
	.align	3
.LC155:
	.xword	.LC154
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMDRV_UpdateMatchMode
	.type	VDMDRV_UpdateMatchMode, %function
VDMDRV_UpdateMatchMode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cbnz	w20, .L401
	cmp	w19, 31
	bls	.L403
.L401:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L403:
	ldr	x4, .LC156
	mov	w7, 1
	ldr	x2, .LC157
	mov	w5, w19
	ldr	x1, .LC159
	mov	w3, 1853
	ldr	x6, [x4, w19, sxtw 3]
	add	x2, x2, 184
	mov	w0, 22
	str	w7, [x6, 28]
	ldr	x4, [x4, w19, sxtw 3]
	ldr	w4, [x4, 28]
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMDRV_UpdateMatchMode, .-VDMDRV_UpdateMatchMode
	.align	3
.LC156:
	.xword	s_pstVfmwChan
	.align	3
.LC157:
	.xword	.LANCHOR2
	.align	3
.LC159:
	.xword	.LC158
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
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.11837, %object
	.size	__func__.11837, 23
__func__.11837:
	.string	"VDMDRV_CheckAttachMode"
	.zero	1
	.type	__func__.11843, %object
	.size	__func__.11843, 19
__func__.11843:
	.string	"VDMDRV_ChnDecReady"
	.align	3
.LANCHOR2 = . + 0
	.type	__FUNCTION__.11884, %object
	.size	__FUNCTION__.11884, 19
__FUNCTION__.11884:
	.string	"VDMDRV_DoBeforeDec"
	.zero	5
	.type	__FUNCTION__.11921, %object
	.size	__FUNCTION__.11921, 29
__FUNCTION__.11921:
	.string	"VDMDRV_AfterDecProcessNormal"
	.zero	3
	.type	__FUNCTION__.11933, %object
	.size	__FUNCTION__.11933, 29
__FUNCTION__.11933:
	.string	"VDMDRV_AfterDecProcessRepair"
	.zero	3
	.type	__FUNCTION__.11971, %object
	.size	__FUNCTION__.11971, 19
__FUNCTION__.11971:
	.string	"VDMDRV_CheckDevice"
	.zero	5
	.type	__func__.12015, %object
	.size	__func__.12015, 18
__func__.12015:
	.string	"VDMDRV_IsrProcess"
	.zero	6
	.type	__FUNCTION__.12016, %object
	.size	__FUNCTION__.12016, 18
__FUNCTION__.12016:
	.string	"VDMDRV_IsrProcess"
	.zero	6
	.type	__func__.12105, %object
	.size	__func__.12105, 21
__func__.12105:
	.string	"VDMDRV_MarkReloadDsp"
	.zero	3
	.type	__func__.12110, %object
	.size	__func__.12110, 23
__func__.12110:
	.string	"VDMDRV_UpdateMatchMode"
	.data
	.align	3
	.type	USE_FF_APT_EN, %object
	.size	USE_FF_APT_EN, 4
USE_FF_APT_EN:
	.word	1
	.zero	4
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
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	ASCII(.string	"Chan %d: Not repair ErrRatio = %d \n" )
	.zero	4
.LC3:
	ASCII(.string	"Chan %d: CorrectType = %d ErrRatio = %d \n" )
	.zero	6
.LC6:
	ASCII(.string	"Chan %d: Current frame:%d  ErrRatio = %d\n" )
	.zero	6
.LC23:
	ASCII(.string	"====== forece VDM sleep! ======\n" )
	.zero	7
.LC27:
	ASCII(.string	"VDMHAL_NULL_FUN_PRINT,L%d\n" )
	.zero	5
.LC43:
	ASCII(.string	"%s,%d,  frameRate = %d,last = %d\n" )
	.zero	6
.LC45:
	ASCII(.string	"%s,%d, the frameRate change!\n" )
	.zero	2
.LC47:
	ASCII(.string	"%s,%d,chanid = %d,s32Is4k60fpsb = %d\n" )
	.zero	2
.LC52:
	ASCII(.string	"%s The channel %d is not active\n" )
	.zero	7
.LC55:
	ASCII(.string	"The channel %d is decoding\n" )
	.zero	4
.LC57:
	ASCII(.string	"The channel %d DEC PARAM is not ready\n" )
	.zero	1
.LC64:
	ASCII(.string	"SMMU_READ_ERR  MODULE : VFMW \t SMMU INT STATE: 0x%x \t read_err_addr  = 0x%x\n" )
	.zero	3
.LC66:
	ASCII(.string	"SMMU_WRITE_ERR MODULE : VFMW \t SMMU INT STATE: 0x%x \t write_err_addr = 0x%x\n" )
	.zero	3
.LC75:
	ASCII(.string	"VDMHAL_V200_IsMpeg4NvopCopy point of picture para null, wait forever!!!\n" )
	.zero	7
.LC77:
	ASCII(.string	"VDMDRV_IsVc1SkpicCopy point of picture para null, wait forever!!!\n" )
	.zero	5
.LC79:
	ASCII(.string	"VDMDRV_IsVp6NvopCopy point of picture para null, wait forever!!!\n" )
	.zero	6
.LC81:
	ASCII(.string	"VDMDRV_IsVp9RptFrmCopy point of picture para null, wait forever!!!\n" )
	.zero	4
.LC83:
	ASCII(.string	"VDMDRV_IsProtocolCopy point of picture para null, wait forever!!!\n" )
	.zero	5
.LC88:
	ASCII(.string	"The channel %d DEC PARAM is not ready(pDecParam == NULL)\n" )
	.zero	6
.LC95:
	ASCII(.string	"VDM Start Fail 2 !\n" )
	.zero	4
.LC105:
	ASCII(.string	"isr begin: *pVdmStateMachine = %d, timeout = %d, ErrRatio = %d\n" )
.LC107:
	ASCII(.string	"ISR process vdm timeout! FromInt = %d\n" )
	.zero	1
.LC113:
	ASCII(.string	"Chan %d VdmStateMachine=%d Error! FromInt = %d.\n" )
	.zero	7
.LC117:
	ASCII(.string	"Chan %d Mfde Running VdmStateMachine = %d, but DecParam = NULL!\n" )
	.zero	7
.LC119:
	ASCII(.string	"Chan %d VdmStateMachine = %d, but DecParam = NULL, Reset VDH MFDE!\n" )
	.zero	4
.LC123:
	ASCII(.string	"Chan %d VDM Time Out(%d ms), Reset VDM!\n" )
	.zero	7
.LC129:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC138:
	ASCII(.string	"Line %d, ISR called, ChanResetFlag = 1!!\n" )
	.zero	6
.LC140:
	ASCII(.string	"vdm state machine = %d, but DecParam is null!\n" )
	.zero	1
.LC142:
	ASCII(.string	"line :%d ISR called but chan %d is not active!\n" )
.LC144:
	ASCII(.string	"line :%d ISR called chan %d is active! But Dec Param in CTX is NULL!!!\n" )
.LC154:
	ASCII(.string	"%s,%d, i = %d, MatchVdhIdPlus1 = %d\n" )
	.zero	3
.LC158:
	ASCII(.string	"%s,%d, MatchVdhIdPlus1 = %d,chanId = %d\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	g_VdmDrvParam, %object
	.size	g_VdmDrvParam, 64
g_VdmDrvParam:
	.zero	64
	.type	s_eVdmDrvSleepState, %object
	.size	s_eVdmDrvSleepState, 4
s_eVdmDrvSleepState:
	.zero	4
	.zero	4
	.type	g_DspDrvState, %object
	.size	g_DspDrvState, 8
g_DspDrvState:
	.zero	8
	.type	g_ChanCtx, %object
	.size	g_ChanCtx, 384
g_ChanCtx:
	.zero	384
	.type	g_LastFPS.11834, %object
	.size	g_LastFPS.11834, 128
g_LastFPS.11834:
	.zero	128
	.type	DiffFrameCnt.11833, %object
	.size	DiffFrameCnt.11833, 128
DiffFrameCnt.11833:
	.zero	128
	.type	g_BackUp, %object
	.size	g_BackUp, 180
g_BackUp:
	.zero	180
	.zero	4
	.type	g_RepairParam, %object
	.size	g_RepairParam, 1752
g_RepairParam:
	.zero	1752
	.type	last_rec_pos_time.11881, %object
	.size	last_rec_pos_time.11881, 128
last_rec_pos_time.11881:
	.zero	128
	.type	LastRecPosTime.12013, %object
	.size	LastRecPosTime.12013, 128
LastRecPosTime.12013:
	.zero	128
	.type	g_VdmExtParam, %object
	.size	g_VdmExtParam, 268
g_VdmExtParam:
	.zero	268
	.zero	4
	.type	g_DecReport, %object
	.size	g_DecReport, 816
g_DecReport:
	.zero	816
	.type	g_HwMem, %object
	.size	g_HwMem, 1256
g_HwMem:
	.zero	1256
	.type	g_UpMsg, %object
	.size	g_UpMsg, 3200
g_UpMsg:
	.zero	3200
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
