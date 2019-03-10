#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vdm_hal.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GetHalMemSize
	.type	VDMHAL_V400R003_GetHalMemSize, %function
VDMHAL_V400R003_GetHalMemSize:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 6291456
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V400R003_GetHalMemSize, .-VDMHAL_V400R003_GetHalMemSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_OpenHAL
	.type	VDMHAL_V400R003_OpenHAL, %function
VDMHAL_V400R003_OpenHAL:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L15
	ldp	w23, w22, [x19]
	ldr	w19, [x19, 8]
	cbz	w23, .L16
	mov	w0, 6291455
	cmp	w22, w0
	ble	.L17
	cmp	w19, wzr
	bgt	.L18
	sxtw	x20, w19
	ldr	x25, .LC14
	ldr	x21, .LC15
	mov	x2, 268
	add	x0, x20, x20, lsl 4
	mov	w1, 0
	lsl	x0, x0, 2
	ldr	x3, [x25, 96]
	sub	x0, x0, x20
	add	x0, x21, x0, lsl 2
	blr	x3
	ldr	x24, .LC0
	lsl	x0, x20, 6
	ldr	x3, [x25, 96]
	sub	x0, x0, x20
	mov	w1, 4
	lsl	x0, x0, 2
	str	w1, [x21]
	sub	x25, x0, x20
	mov	x2, 1256
	mov	w1, 0
	add	x25, x0, x25, lsl 2
	add	x21, x24, x25
	mov	x0, x21
	blr	x3
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	mov	x2, x0
	ldr	x1, .LC17
	str	x0, [x24, x25]
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 53248
	movk	w0, 0xf8c3, lsl 16
	bl	MEM_Phy2Vir
	mov	x2, x0
	ldr	x1, .LC19
	str	x0, [x21, 16]
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 1256
	add	w4, w23, 1023
	and	w4, w4, -1024
	add	w1, w23, w22
	smull	x19, w19, w0
	sub	w1, w1, w4
	mov	w2, 1024
	add	x0, x19, 56
	add	x19, x19, 896
	stp	w4, w1, [x21, 32]
	str	w2, [x21, 40]
	add	x0, x24, x0
	add	x2, x24, x19
	mov	w1, w4
	.p2align 2
.L8:
	str	w1, [x0], 4
	add	w1, w1, 1280
	cmp	x0, x2
	bne	.L8
	lsl	x0, x20, 6
	add	w2, w4, 266240
	sub	x0, x0, x20
	add	w2, w2, 3072
	lsl	x0, x0, 2
	add	w3, w2, 4096
	sub	x20, x0, x20
	mov	w7, 210
	add	w3, w3, 1024
	add	x0, x0, x20, lsl 2
	add	w1, w3, 32768
	add	x0, x24, x0
	add	w1, w1, 1023
	and	w1, w1, -32768
	add	w4, w1, 4427776
	add	w5, w1, 4370432
	str	w7, [x0, 1080]
	add	x7, x0, 1024
	add	w4, w4, 1024
	add	w5, w5, 2048
	add	w6, w1, 589824
	add	w8, w1, 45056
	stp	w2, w1, [x7, 80]
	stp	w1, w1, [x7, 88]
	str	w3, [x0, 1124]
	add	w3, w1, 1773568
	add	w3, w3, 1152
	add	w7, w1, 1093632
	add	w2, w1, 4390912
	cmp	w4, w3
	add	w2, w2, 1024
	str	w7, [x0, 1164]
	add	w7, w1, 4423680
	str	w5, [x0, 1192]
	str	w3, [x0, 1152]
	add	w5, w1, 4374528
	str	w2, [x0, 1204]
	add	w5, w5, 1024
	str	w2, [x0, 1220]
	csel	w2, w4, w3, cs
	add	w3, w7, 1024
	str	w3, [x0, 1200]
	add	w3, w1, 1769472
	add	w4, w6, 2048
	add	w3, w3, 2048
	str	w5, [x0, 1196]
	sub	w2, w2, w23
	add	w5, w1, 1179648
	add	w5, w5, 2048
	str	w1, [x0, 1172]
	str	w4, [x0, 1132]
	cmp	w22, w2
	add	w4, w1, 2142208
	str	w3, [x0, 1144]
	str	w3, [x0, 1148]
	add	w3, w1, 3190784
	str	w6, [x0, 1120]
	add	w1, w1, 4239360
	str	w6, [x0, 1128]
	str	wzr, [x0, 1156]
	str	w8, [x0, 1160]
	str	wzr, [x0, 1184]
	str	w5, [x0, 1136]
	str	w5, [x0, 1140]
	str	w4, [x0, 1168]
	str	w3, [x0, 1176]
	str	w1, [x0, 1208]
	bcc	.L9
	mov	x0, x21
	bl	H264HAL_V400R003_InitHal
	cmp	w0, wzr
	mov	x0, x21
	csetm	w19, ne
	bl	HEVCHAL_V400R003_InitHal
	cmp	w0, wzr
	csinv	w19, w19, wzr, eq
.L4:
	mov	w0, w19
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L18:
	ldr	x1, .LC13
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L9:
	ldr	x1, .LC21
	mov	w3, w22
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	b	.L4
.L16:
	ldr	x3, .LC9
.L13:
	ldr	x2, .LC5
	mov	w0, 0
	ldr	x1, .LC7
	mov	w19, -1
	bl	dprint_vfmw
	b	.L4
.L17:
	ldr	x3, .LC11
	b	.L13
.L15:
	ldr	x3, .LC4
	b	.L13
	.size	VDMHAL_V400R003_OpenHAL, .-VDMHAL_V400R003_OpenHAL
	.align	3
.LC0:
	.xword	g_HwMem
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	.LANCHOR0
	.align	3
.LC7:
	.xword	.LC6
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
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC15:
	.xword	g_VdmExtParam
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC21:
	.xword	.LC20
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CloseHAL
	.type	VDMHAL_V400R003_CloseHAL, %function
VDMHAL_V400R003_CloseHAL:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V400R003_CloseHAL, .-VDMHAL_V400R003_CloseHAL
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CalcFsSize
	.type	VDMHAL_V400R003_CalcFsSize, %function
VDMHAL_V400R003_CalcFsSize:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w25, w0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	mov	w22, w3
	mov	w26, w4
	mov	x27, x5
	bl	_mcount
	sub	w1, w20, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L21
	sub	w1, w21, #32
	mov	w6, w21
	cmp	w1, w0
	bhi	.L21
	ldr	x1, .LC26
	add	w0, w20, 15
	asr	w0, w0, 4
	add	w3, w21, 15
	asr	w3, w3, 4
	cmp	w0, 45
	ldrb	w2, [x1]
	mov	w1, 36
	ccmp	w3, w1, 0, le
	mov	w19, 32
	cset	w4, le
	mov	w1, 64
	cmp	w4, wzr
	lsl	w28, w0, 4
	csel	w19, w19, w1, eq
	cmp	w2, 1
	csel	w19, w19, w1, ne
	cmp	w26, 16
	beq	.L26
	cmp	w26, 17
	beq	.L49
	mul	w19, w0, w19
	ldr	x4, .LC28
	add	w28, w28, 255
	add	w6, w21, 31
	and	w28, w28, -256
	mul	w19, w19, w3
	ldr	x0, [x4, w25, sxtw 3]
	and	w6, w6, -32
	add	w19, w19, 143
	mov	w7, 0
	and	w19, w19, -128
	mov	w8, 0
	asr	w9, w19, 1
.L38:
	ldr	w1, [x0, 1208]
	cmp	w1, 1
	beq	.L50
.L42:
	mov	w10, 0
	mov	w5, 0
	mov	w23, 0
.L29:
	cmp	w26, 3
	sub	w1, w26, #16
	ccmp	w26, wzr, 4, ne
	ccmp	w1, 1, 0, ne
	bls	.L51
	cmp	w22, 1
	mov	w21, 1024
	mov	w20, 0
	mov	w24, 0
	mul	w6, w6, w28
	beq	.L52
.L31:
	mul	w1, w7, w8
	lsl	w22, w6, 2
	lsl	w3, w23, 2
	lsl	w2, w1, 2
	sub	w22, w22, w6
	sub	w2, w2, w1
	lsr	w22, w22, 1
	sub	w3, w3, w23
	add	w1, w22, w2, lsr 1
	add	w22, w1, w3, lsr 1
	add	x1, x0, 290816
	ldr	w1, [x1, 3768]
	cbz	w1, .L53
.L33:
	add	x2, x0, 294912
	cmp	w26, 17
	str	w24, [x2, 3040]
	str	w20, [x2, 3044]
	str	w5, [x2, 3052]
	str	w10, [x2, 3056]
	str	w9, [x2, 3348]
	str	w22, [x2, 3376]
	beq	.L34
	add	x1, x0, 290816
	mov	w3, 32
	lsl	w28, w28, 4
	ldr	w1, [x1, 3776]
	str	w28, [x2, 2008]
	cmp	w1, 32
	csel	w1, w1, w3, le
	cmp	w26, 16
	str	w1, [x2, 3352]
	add	w1, w23, w6
	str	w1, [x2, 3076]
	beq	.L54
.L36:
	ldr	x0, [x4, w25, sxtw 3]
	mov	w5, 1024
	add	w1, w22, w21
	add	x3, x0, 294912
	add	w1, w1, 32
	add	w2, w1, w19
	str	w19, [x3, 3380]
	str	w5, [x3, 3388]
	ldrsb	w0, [x0, 44]
	cmp	w0, 1
	add	w0, w2, w5
	csel	w2, w0, w2, eq
	cbz	x27, .L44
	str	w1, [x27, 4]
	mov	w0, 0
	ldr	x3, [x4, w25, sxtw 3]
	add	x3, x3, 290816
	ldr	w3, [x3, 3776]
	stp	w3, w19, [x27, 8]
	ldr	x3, [x4, w25, sxtw 3]
	add	x3, x3, 294912
	ldr	w3, [x3, 3352]
	stp	w3, w5, [x27, 16]
	str	w2, [x27]
	ldr	x2, [x4, w25, sxtw 3]
	add	x2, x2, 294912
	str	w1, [x2, 3384]
.L45:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L51:
	adds	w24, w20, 255
	add	w20, w20, 510
	csel	w24, w20, w24, mi
	adds	w2, w21, 63
	add	w21, w21, 126
	asr	w24, w24, 8
	csel	w21, w21, w2, mi
	lsl	w24, w24, 6
	and	w21, w21, -64
	cmp	w21, wzr
	add	w20, w21, 7
	csel	w20, w20, w21, lt
	cmp	w22, 1
	asr	w20, w20, 3
	mul	w6, w6, w28
	mul	w20, w20, w24
	add	w21, w20, 1024
	bne	.L31
.L52:
	lsl	w1, w3, 6
	sub	w1, w1, w3, lsl 4
	mul	w22, w1, w28
	add	x1, x0, 290816
	ldr	w1, [x1, 3768]
	cbnz	w1, .L33
.L53:
	ldr	x1, .LC27
	add	x0, x0, 294912
	add	x0, x0, 2008
	mov	x2, 1384
	str	x4, [x29, 104]
	ldr	x3, [x1, 96]
	mov	w1, 0
	stp	w10, w9, [x29, 116]
	stp	w5, w6, [x29, 124]
	stp	w8, w7, [x29, 132]
	blr	x3
	ldr	x4, [x29, 104]
	ldp	w10, w9, [x29, 116]
	ldp	w5, w6, [x29, 124]
	ldp	w8, w7, [x29, 132]
	ldr	x0, [x4, w25, sxtw 3]
	b	.L33
	.p2align 3
.L54:
	ldr	w0, [x0, 1500]
	cmp	w0, 8
	ble	.L36
	lsl	w0, w6, 2
	ldr	x1, .LC30
	sub	w6, w0, w6
	lsl	w0, w23, 2
	sub	w0, w0, w23
	lsr	w23, w23, 1
	lsr	w0, w0, 1
	str	x4, [x29, 136]
	madd	w7, w7, w8, w23
	add	w6, w0, w6, lsr 1
	lsl	w8, w8, 5
	mov	w0, 31
	str	w8, [x2, 3060]
	str	w6, [x2, 3068]
	str	w7, [x2, 3072]
	bl	dprint_vfmw
	ldr	x4, [x29, 136]
	b	.L36
	.p2align 3
.L26:
	ldr	x4, .LC28
	mul	w19, w3, w28
	add	w28, w20, 255
	ldr	x0, [x4, w25, sxtw 3]
	add	w19, w19, 143
	and	w28, w28, -256
	and	w19, w19, -128
	ldr	w1, [x0, 1500]
	cmp	w1, 8
	ble	.L55
	ldr	w1, [x0, 1208]
	add	w7, w21, 31
	and	w7, w7, -32
	lsr	w8, w28, 2
	cmp	w1, 1
	asr	w9, w19, 1
	bne	.L42
	.p2align 2
.L50:
	adds	w2, w20, 511
	add	w1, w20, 1022
	csel	w1, w1, w2, mi
	add	w23, w21, 126
	and	w1, w1, -512
	cmp	w1, wzr
	add	w5, w1, 63
	csel	w5, w5, w1, lt
	adds	w1, w21, 63
	csel	w23, w23, w1, mi
	asr	w5, w5, 6
	asr	w23, w23, 6
	lsl	w5, w5, 1
	lsl	w23, w23, 5
	mul	w23, w23, w5
	mov	w10, w23
	b	.L29
	.p2align 3
.L34:
	add	w6, w23, w6
	lsl	w28, w28, 4
	mov	w0, 1
	str	w28, [x2, 2008]
	str	w6, [x2, 3076]
	str	w0, [x2, 3352]
	b	.L36
	.p2align 3
.L49:
	ldr	x4, .LC28
	add	w28, w20, 255
	add	w6, w21, 63
	mov	w9, 64
	mov	w19, 128
	and	w28, w28, -256
	and	w6, w6, -64
	movk	w9, 0x12, lsl 16
	ldr	x0, [x4, w25, sxtw 3]
	movk	w19, 0x24, lsl 16
	mov	w7, 0
	mov	w8, 0
	b	.L38
	.p2align 3
.L55:
	asr	w9, w19, 1
	mov	w7, 0
	mov	w8, 0
	b	.L38
	.p2align 3
.L44:
	mov	w0, 0
	b	.L45
	.p2align 3
.L21:
	ldr	x2, .LC24
	mov	w0, 0
	ldr	x3, .LC23
	ldr	x1, .LC25
	add	x2, x2, 24
	bl	dprint_vfmw
	mov	w0, -1
	b	.L45
	.size	VDMHAL_V400R003_CalcFsSize, .-VDMHAL_V400R003_CalcFsSize
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC24:
	.xword	.LANCHOR0
	.align	3
.LC25:
	.xword	.LC6
	.align	3
.LC26:
	.xword	g_not_direct_8x8_inference_flag
	.align	3
.LC27:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC28:
	.xword	s_pstVfmwChan
	.align	3
.LC30:
	.xword	.LC29
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GetRpuSize
	.type	VDMHAL_V400R003_GetRpuSize, %function
VDMHAL_V400R003_GetRpuSize:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1024
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V400R003_GetRpuSize, .-VDMHAL_V400R003_GetRpuSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ArrangeMem_Normal
	.type	VDMHAL_V400R003_ArrangeMem_Normal, %function
VDMHAL_V400R003_ArrangeMem_Normal:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w22, w2
	mov	w21, w3
	mov	w23, w4
	mov	x24, x5
	bl	_mcount
	add	x0, x29, 104
	cmp	w20, 20
	str	xzr, [x29, 120]
	stp	xzr, xzr, [x0]
	bhi	.L103
	ldr	x25, .LC35
	mov	w3, w23
	add	x5, x29, 104
	mov	w4, w20
	mov	w2, w21
	mov	w1, w22
	ldr	x0, [x25, w19, sxtw 3]
	add	x0, x0, 290816
	ldr	w23, [x0, 3772]
	mov	w0, w19
	bl	VDMHAL_V400R003_CalcFsSize
	cbnz	w0, .L104
	ldr	x26, [x25, w19, sxtw 3]
	ldr	w27, [x29, 104]
	add	x1, x26, 290816
	cmp	w23, w27
	ldr	w5, [x1, 3792]
	ldr	w23, [x1, 3776]
	beq	.L105
.L62:
	ldr	x2, .LC33
	mov	w4, w23
	ldr	x1, .LC39
	mov	w3, w27
	add	x2, x2, 96
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x1, [x25, w19, sxtw 3]
	add	x1, x1, 290816
	ldr	w0, [x1, 3768]
	str	w27, [x1, 3772]
	cbz	w0, .L106
	ldr	x2, .LC42
	ldr	w0, [x29, 112]
	str	w0, [x1, 3780]
	ldr	x4, [x2]
	cbz	x4, .L102
	ldr	w1, [x29, 108]
	mov	w3, 28
	ldr	w2, [x29, 120]
	stp	w0, w1, [x29, 128]
	ldr	w1, [x29, 116]
	ldr	w0, [x29, 124]
	stp	w1, w0, [x29, 140]
	str	w2, [x29, 136]
	mov	w1, 122
	stp	w22, w21, [x29, 148]
	add	x2, x29, 128
	mov	w0, w19
	blr	x4
.L102:
	ldr	x21, .LC43
.L72:
	ldr	x4, [x25, w19, sxtw 3]
	mov	w3, w23
	ldr	x1, .LC46
	mov	w2, w27
	add	x4, x4, 290816
	mov	w0, 31
	ldr	w4, [x4, 3792]
	bl	dprint_vfmw
	ldr	x19, [x25, w19, sxtw 3]
	ldr	x0, [x21]
	add	x19, x19, 294912
	blr	x0
	mov	w1, 2
	str	w0, [x19, 3392]
.L59:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	mov	w0, w1
	ldp	x29, x30, [sp], 160
	ret
	.p2align 3
.L105:
	cmp	w5, 1
	beq	.L62
	ldr	w1, [x1, 3768]
	cmp	w1, 1
	beq	.L62
	cbz	x24, .L107
	add	x27, x26, 294912
	mov	x0, x26
	add	x20, x27, 2008
	ldr	w22, [x27, 3376]
	cbz	w23, .L108
.L74:
	add	x0, x0, 290816
	ldr	w2, [x0, 3780]
	cmp	w2, 30
	bgt	.L109
.L75:
	ldr	x21, .LC43
	add	x23, x27, 2008
	mov	w0, 8
	str	w2, [x23, 1080]
	ldr	x1, [x21, 24]
	blr	x1
	ldr	x8, [x25, w19, sxtw 3]
	add	x10, x8, 294912
	ldr	w0, [x10, 3416]
	cbz	w0, .L80
	ldr	w12, [x23, 1036]
	mov	x5, x23
	ldr	w11, [x23, 1344]
	mov	w6, 0
	ldr	w7, [x23, 1348]
	mov	w9, 1
	.p2align 2
.L79:
	uxtw	x1, w6
	uxtw	x0, w7
	lsl	x2, x1, 6
	lsl	x4, x0, 2
	add	x2, x2, x1, lsl 3
	sub	x0, x4, x0
	add	x2, x8, x2
	add	x4, x26, x4
	add	x2, x2, 290816
	add	x0, x26, x0, lsl 2
	add	x0, x0, 294912
	add	x4, x4, 294912
	add	w7, w7, 1
	add	w6, w6, 1
	ldr	w13, [x2, 3832]
	mov	x1, x2
	ldr	w14, [x2, 3812]
	add	w3, w13, 1023
	strb	w9, [x0, 2024]
	str	w14, [x0, 2020]
	and	w3, w3, -1024
	str	w3, [x0, 2016]
	sub	w0, w22, w13
	add	w0, w0, w3
	add	w3, w13, w12
	add	w13, w13, w0
	add	w0, w3, w0
	str	w13, [x4, 2912]
	str	w0, [x4, 2400]
	str	w7, [x5, 1348]
	ldr	w0, [x2, 3804]
	cmp	w0, 255
	beq	.L77
	ldr	w0, [x5, 1356]
	ldr	w4, [x2, 3848]
	add	w3, w0, 1
	uxtw	x2, w0
	lsl	x0, x2, 2
	sub	x0, x0, x2
	add	x0, x5, x0, lsl 2
	str	w4, [x0, 520]
	str	w3, [x5, 1356]
.L77:
	ldr	w0, [x5, 1352]
	cmp	w0, w11
	bcs	.L78
	ldr	w2, [x1, 3864]
	add	x1, x26, x0, uxtw 3
	add	x1, x1, 294912
	add	w0, w0, 1
	strb	w9, [x1, 3096]
	str	w2, [x1, 3092]
	str	w0, [x5, 1352]
.L78:
	ldr	w0, [x10, 3416]
	cmp	w6, w0
	bcc	.L79
.L80:
	ldr	x3, [x21, 104]
	mov	x2, 1368
	mov	x1, x20
	mov	x0, x24
	blr	x3
	ldr	x1, [x25, w19, sxtw 3]
	mov	w3, 1
	ldr	x2, [x21, 32]
	mov	w0, 8
	add	x1, x1, 294912
	str	w3, [x1, 3420]
	blr	x2
	mov	w1, 0
	b	.L59
	.p2align 3
.L106:
	add	x1, x1, 3800
	mov	w0, w19
	bl	DelAllFrameMemRecord
	cbnz	w0, .L110
.L65:
	ldr	x1, [x25, w19, sxtw 3]
	mov	w2, 255
	add	x0, x1, 290816
	add	x1, x1, 294912
	add	x0, x0, 3800
	add	x1, x1, 2008
	.p2align 2
.L66:
	str	w2, [x0], 72
	cmp	x1, x0
	bne	.L66
	mov	w0, 1088
	cmp	w22, 1920
	ccmp	w21, w0, 0, le
	ldr	x0, [x25, w19, sxtw 3]
	ble	.L67
	ldr	w2, [x29, 112]
.L68:
	add	x3, x0, 290816
	ldr	w1, [x0, 1456]
	add	w1, w2, w1
	str	w1, [x3, 3780]
	ldr	w4, [x0, 628]
	cmp	w4, 2
	ccmp	w20, 17, 4, eq
	beq	.L70
	str	w1, [x29, 120]
.L70:
	add	x0, x0, 294912
	mov	w1, 1
	str	wzr, [x0, 3416]
	str	w1, [x3, 3752]
	ldr	x3, .LC42
	str	w1, [x0, 3940]
	ldr	x4, [x3]
	cbz	x4, .L71
	ldr	w0, [x29, 108]
	ldp	w1, w3, [x29, 116]
	stp	w2, w0, [x29, 128]
	ldr	w0, [x29, 124]
	add	x2, x29, 128
	stp	w3, w1, [x29, 136]
	str	w0, [x29, 144]
	mov	w3, 28
	stp	w22, w21, [x29, 148]
	mov	w1, 121
	mov	w0, w19
	blr	x4
.L71:
	ldr	x21, .LC43
	mov	x2, 512
	ldr	x0, [x25, w19, sxtw 3]
	mov	w1, 0
	ldr	x3, [x21, 96]
	add	x0, x0, 294912
	add	x0, x0, 3424
	blr	x3
	ldr	x1, [x25, w19, sxtw 3]
	ldr	x0, .LC44
	add	x1, x1, 294912
	ldr	x0, [x0, w19, sxtw 3]
	str	wzr, [x1, 3936]
	bl	FSP_ClearContextAll
	b	.L72
	.p2align 3
.L67:
	ldr	w1, [x0, 36]
	ldr	w2, [x29, 112]
	cmp	w1, 24
	beq	.L68
	add	w2, w2, 4
	str	w2, [x29, 112]
	b	.L68
.L110:
	ldr	x1, .LC41
	mov	w0, 0
	bl	dprint_vfmw
	b	.L65
.L109:
	ldr	x1, .LC52
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x25, w19, sxtw 3]
	mov	w1, 30
	mov	w2, w1
	add	x0, x0, 290816
	str	w1, [x0, 3780]
	b	.L75
.L108:
	ldr	x1, .LC50
	mov	w0, 31
	bl	dprint_vfmw
	ldr	x0, [x25, w19, sxtw 3]
	b	.L74
.L103:
	ldr	x2, .LC33
	mov	w0, 0
	ldr	x1, .LC34
	ldr	x3, .LC32
	add	x2, x2, 56
	bl	dprint_vfmw
	mov	w1, -1
	b	.L59
.L104:
	ldr	x1, .LC37
	mov	w0, 31
	bl	dprint_vfmw
	mov	w1, -1
	b	.L59
.L107:
	ldr	x2, .LC33
	ldr	x1, .LC34
	ldr	x3, .LC48
	add	x2, x2, 136
	bl	dprint_vfmw
	mov	w1, -1
	b	.L59
	.size	VDMHAL_V400R003_ArrangeMem_Normal, .-VDMHAL_V400R003_ArrangeMem_Normal
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC33:
	.xword	.LANCHOR0
	.align	3
.LC34:
	.xword	.LC6
	.align	3
.LC35:
	.xword	s_pstVfmwChan
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC39:
	.xword	.LC38
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC42:
	.xword	g_event_report
	.align	3
.LC43:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC44:
	.xword	s_pFspInst
	.align	3
.LC46:
	.xword	.LC45
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC52:
	.xword	.LC51
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ArrangeMem_Specific
	.type	VDMHAL_V400R003_ArrangeMem_Specific, %function
VDMHAL_V400R003_ArrangeMem_Specific:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	w21, w0
	mov	w27, w2
	mov	x0, x30
	mov	w24, w1
	mov	w23, w4
	mov	w25, w5
	mov	w19, w6
	mov	w26, w7
	ldr	x20, [x29, 144]
	str	w3, [x29, 124]
	bl	_mcount
	cbz	w27, .L184
	sub	w1, w23, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L114
	sub	w1, w25, #32
	cmp	w1, w0
	bhi	.L114
	cbz	x20, .L185
	ldr	x0, .LC60
	cmp	w19, 20
	mov	x2, 1368
	mov	w1, 0
	mov	w6, 20
	mov	w22, 32
	ldr	x3, [x0, 96]
	mov	x0, x20
	csel	w19, w19, w6, le
	blr	x3
	ldr	x1, .LC61
	add	w0, w23, 15
	asr	w0, w0, 4
	add	w9, w25, 15
	cmp	w0, 45
	asr	w9, w9, 4
	ldrb	w2, [x1]
	mov	w1, 36
	ccmp	w9, w1, 0, le
	mov	w1, 64
	cset	w3, le
	cmp	w3, wzr
	lsl	w3, w0, 4
	csel	w22, w22, w1, eq
	cmp	w2, 1
	csel	w22, w22, w1, ne
	cmp	w24, 16
	beq	.L186
	cmp	w24, 17
	beq	.L122
	mul	w22, w0, w22
	ldr	w0, [x29, 124]
	mul	w22, w22, w9
	add	w22, w22, 143
	and	w22, w22, -128
	mul	w7, w19, w22
	cmp	w0, w7
	ble	.L120
	str	w19, [x20, 1344]
	add	w19, w27, 1023
	add	w3, w3, 255
	add	w10, w25, 31
	and	w19, w19, -1024
	asr	w0, w22, 1
	and	w28, w3, -256
	and	w10, w10, -32
	add	w4, w25, 63
	add	w2, w23, 255
	mov	w12, 0
	mov	w11, 0
	str	w0, [x20, 1340]
	sub	w6, w19, w27
.L124:
	adds	w0, w23, 511
	add	w23, w23, 1022
	csel	w0, w23, w0, mi
	ldr	w3, [x29, 128]
	and	w0, w0, -512
	cmp	w0, wzr
	add	w1, w0, 63
	csel	w0, w1, w0, lt
	cmp	w4, wzr
	add	w1, w4, 63
	asr	w0, w0, 6
	csel	w1, w1, w4, lt
	cmp	w2, wzr
	asr	w4, w1, 6
	add	w1, w2, 255
	csel	w2, w1, w2, lt
	lsl	w5, w4, 6
	asr	w2, w2, 8
	cmp	w5, wzr
	lsl	w1, w2, 6
	add	w2, w5, 7
	csel	w2, w2, w5, lt
	str	w1, [x20, 1032]
	asr	w2, w2, 3
	cmp	w3, 1
	mul	w2, w2, w1
	lsl	w1, w0, 6
	lsl	w0, w0, 1
	str	w2, [x20, 1036]
	mul	w1, w1, w4
	str	w0, [x20, 1044]
	lsl	w0, w28, 4
	str	w1, [x20, 1048]
	str	w0, [x20]
	beq	.L187
	mul	w4, w10, w28
	mul	w5, w12, w11
	lsl	w0, w4, 2
	lsl	w23, w1, 2
	sub	w4, w0, w4
	lsl	w0, w5, 2
	sub	w0, w0, w5
	sub	w23, w23, w1
	asr	w0, w0, 1
	add	w0, w0, w4, asr 1
	add	w23, w0, w23, lsr 1
.L127:
	ldr	w0, [x29, 136]
	tbnz	w0, #31, .L128
	stp	w7, w6, [x29, 96]
	stp	w10, w11, [x29, 104]
	stp	w12, w2, [x29, 112]
	str	w1, [x29, 120]
	bl	VCTRL_GetChanWidth
	mov	w21, w0
	ldr	w0, [x29, 136]
	bl	VCTRL_GetChanHeight
	cmn	w21, #1
	ldr	w1, [x29, 120]
	ccmn	w0, #1, 4, ne
	ldp	w7, w6, [x29, 96]
	ldp	w10, w11, [x29, 104]
	ldp	w12, w2, [x29, 112]
	beq	.L188
	ldr	w3, [x29, 128]
	add	w4, w21, 15
	and	w4, w4, -16
	add	w0, w0, 15
	cmp	w3, 1
	add	w9, w4, 255
	and	w0, w0, -16
	and	w9, w9, -256
	beq	.L189
	adds	w5, w0, 63
	add	w0, w0, 126
	csel	w0, w0, w5, mi
	adds	w5, w4, 511
	add	w4, w4, 1022
	asr	w0, w0, 6
	csel	w4, w4, w5, mi
	and	w4, w4, -512
	add	w5, w4, 63
	cmp	w4, wzr
	csel	w4, w5, w4, lt
	asr	w4, w4, 6
	lsl	w5, w4, 1
	lsl	w4, w0, 2
	mul	w9, w9, w0
	sub	w0, w4, w0
	lsl	w0, w0, 5
	mul	w4, w5, w0
	lsl	w0, w9, 2
	sub	w0, w0, w9
	lsl	w0, w0, 6
	asr	w0, w0, 1
	add	w0, w0, w4, lsr 1
.L131:
	cmp	w23, w0
	ldr	w21, [x29, 136]
	bgt	.L190
.L128:
	mul	w25, w10, w28
	cmp	w21, wzr
	str	w1, [x29, 120]
	add	w0, w25, w1
	ccmp	w24, 16, 0, ge
	str	w0, [x20, 1068]
	stp	w11, w12, [x29, 112]
	bne	.L133
	ldr	x0, .LC64
	stp	w7, w6, [x29, 100]
	str	w2, [x29, 108]
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 294912
	add	x0, x0, 4000
	bl	IsMain10Profile
	ldp	w7, w6, [x29, 100]
	ldp	w2, w11, [x29, 108]
	ldp	w12, w1, [x29, 116]
	cbnz	w0, .L191
	.p2align 2
.L133:
	cbnz	w26, .L135
	str	wzr, [x20, 1040]
	str	wzr, [x20, 1080]
.L136:
	ldr	x2, .LC55
	ldr	x3, .LC71
.L182:
	ldr	x1, .LC56
	add	x2, x2, 176
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L135:
	cmp	w24, wzr
	ldr	w0, [x29, 124]
	ccmp	w24, 3, 4, ne
	sub	w24, w24, #16
	ccmp	w24, 1, 0, ne
	sub	w7, w0, w7
	sub	w7, w7, w6
	bls	.L137
	sdiv	w7, w7, w23
	cmp	w26, 32
	mov	w3, 32
	str	wzr, [x20, 1040]
	csel	w3, w26, w3, le
	cmp	w7, w3
	csel	w3, w7, w3, le
	str	w3, [x20, 1080]
.L138:
	cbz	w3, .L136
	sub	w4, w3, #1
	mov	w0, 12
	mov	x1, 20
	ldr	w7, [x20, 1348]
	mov	x5, x4
	umaddl	x1, w4, w0, x1
	add	x0, x20, 8
	add	x1, x20, x1
	.p2align 2
.L141:
	str	w19, [x0], 12
	add	w19, w19, w23
	cmp	x0, x1
	bne	.L141
	madd	w23, w23, w3, w6
	add	x4, x4, 99
	add	w7, w3, w7
	add	w1, w23, w27
	add	x0, x20, 392
	add	x4, x20, x4, lsl 2
	str	w7, [x20, 1348]
	.p2align 2
.L143:
	str	w1, [x0], 4
	add	w1, w1, 32
	cmp	x0, x4
	bne	.L143
	ldr	w6, [x20, 1040]
	add	w23, w23, w3, lsl 5
	add	w0, w27, w23
	cbz	w6, .L144
	sub	w4, w6, #1
	add	x1, x20, 904
	add	x4, x4, 227
	add	x4, x20, x4, lsl 2
	.p2align 2
.L145:
	str	w0, [x1], 4
	add	w0, w0, w2
	cmp	x4, x1
	bne	.L145
	mul	w6, w6, w2
.L144:
	ldr	w4, [x20, 1344]
	add	w23, w23, w6
	add	w8, w27, w23
	cbz	w4, .L150
	sub	w0, w4, #1
	mov	x2, 1092
	ldr	w6, [x20, 1352]
	add	x1, x20, 1084
	add	x2, x2, x0, uxtw 3
	mov	w0, w8
	add	x2, x20, x2
	.p2align 2
.L149:
	str	w0, [x1], 8
	add	w0, w0, w22
	cmp	x1, x2
	bne	.L149
	add	w0, w4, w6
	str	w0, [x20, 1352]
.L150:
	madd	w22, w4, w22, w23
	str	w22, [x20, 4]
	tbnz	w21, #31, .L148
	ldr	x0, .LC64
	ldr	x0, [x0, w21, sxtw 3]
	cbz	x0, .L148
	add	w0, w22, w8
	cbz	w3, .L148
	mov	w2, 12
	mov	x4, 532
	add	x1, x20, 520
	umaddl	x5, w5, w2, x4
	add	x5, x20, x5
	.p2align 2
.L151:
	str	w0, [x1], 12
	add	w0, w0, 1024
	cmp	x5, x1
	bne	.L151
.L148:
	add	w22, w22, w3, lsl 10
	mov	w0, 0
	str	w22, [x20, 4]
.L176:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L137:
	add	w3, w23, w2
	cmp	w26, 32
	sdiv	w7, w7, w3
	mov	w3, 32
	csel	w3, w26, w3, le
	cmp	w7, w3
	csel	w3, w7, w3, le
	str	w3, [x20, 1040]
	str	w3, [x20, 1080]
	b	.L138
	.p2align 3
.L186:
	mul	w22, w9, w3
	ldr	w0, [x29, 124]
	add	w22, w22, 143
	and	w22, w22, -128
	mul	w7, w19, w22
	cmp	w0, w7
	ble	.L120
	asr	w0, w22, 1
	str	w19, [x20, 1344]
	str	w0, [x20, 1340]
	add	w19, w27, 1023
	add	w2, w23, 255
	and	w19, w19, -1024
	and	w28, w2, -256
	sub	w6, w19, w27
	tbnz	w21, #31, .L181
	ldr	x0, .LC64
	stp	w7, w6, [x29, 108]
	stp	w2, w9, [x29, 116]
	ldr	x0, [x0, w21, sxtw 3]
	add	x0, x0, 294912
	add	x0, x0, 4000
	bl	IsMain10Profile
	ldp	w7, w6, [x29, 108]
	ldp	w2, w9, [x29, 116]
	cbz	w0, .L181
	cmp	w28, wzr
	add	w11, w28, 3
	csel	w11, w11, w28, lt
	add	w12, w25, 31
	asr	w11, w11, 2
	and	w12, w12, -32
	add	w4, w25, 63
	mov	w10, w25
	b	.L124
	.p2align 3
.L187:
	lsl	w0, w9, 4
	mul	w0, w0, w28
	lsl	w23, w0, 2
	sub	w23, w23, w0
	b	.L127
	.p2align 3
.L122:
	lsl	w7, w19, 14
	ldr	w0, [x29, 124]
	add	w7, w7, w19, lsl 11
	add	w7, w7, w19
	lsl	w7, w7, 7
	cmp	w0, w7
	ble	.L120
	str	w19, [x20, 1344]
	add	w19, w27, 1023
	add	w4, w25, 63
	add	w2, w23, 255
	mov	w0, 64
	mov	w22, 128
	and	w19, w19, -1024
	movk	w0, 0x12, lsl 16
	and	w28, w2, -256
	and	w10, w4, -64
	movk	w22, 0x24, lsl 16
	mov	w12, 0
	mov	w11, 0
	str	w0, [x20, 1340]
	sub	w6, w19, w27
	b	.L124
	.p2align 3
.L181:
	add	w4, w25, 63
	mov	w10, w25
	mov	w12, 0
	mov	w11, 0
	b	.L124
	.p2align 3
.L189:
	mul	w0, w0, w9
	lsl	w4, w0, 2
	sub	w0, w4, w0
	b	.L131
.L114:
	ldr	x2, .LC55
	ldr	x3, .LC57
	b	.L182
.L191:
	lsl	w0, w25, 2
	str	w2, [x29, 120]
	sub	w3, w0, w25
	lsl	w0, w1, 2
	sub	w0, w0, w1
	lsr	w1, w1, 1
	lsr	w0, w0, 1
	madd	w12, w12, w11, w1
	add	w0, w0, w3, asr 1
	ldr	x1, .LC69
	lsl	w11, w11, 5
	str	w0, [x20, 1060]
	str	w11, [x20, 1052]
	mov	w0, 0
	str	w12, [x20, 1064]
	stp	w7, w6, [x29, 112]
	bl	dprint_vfmw
	ldp	w7, w6, [x29, 112]
	ldr	w2, [x29, 120]
	b	.L133
.L120:
	ldr	x2, .LC55
	ldr	x3, .LC63
	b	.L182
.L184:
	ldr	x2, .LC55
	ldr	x3, .LC54
	b	.L182
.L188:
	ldr	x1, .LC66
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L176
.L190:
	ldr	x2, .LC55
	ldr	x3, .LC68
	b	.L182
.L185:
	ldr	x2, .LC55
	ldr	x3, .LC59
	b	.L182
	.size	VDMHAL_V400R003_ArrangeMem_Specific, .-VDMHAL_V400R003_ArrangeMem_Specific
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC55:
	.xword	.LANCHOR0
	.align	3
.LC56:
	.xword	.LC6
	.align	3
.LC57:
	.xword	.LC22
	.align	3
.LC59:
	.xword	.LC58
	.align	3
.LC60:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC61:
	.xword	g_not_direct_8x8_inference_flag
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC64:
	.xword	s_pstVfmwChan
	.align	3
.LC66:
	.xword	.LC65
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC69:
	.xword	.LC29
	.align	3
.LC71:
	.xword	.LC70
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ArrangeMem
	.type	VDMHAL_V400R003_ArrangeMem, %function
VDMHAL_V400R003_ArrangeMem:
	sub	sp, sp, #112
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	stp	x23, x24, [sp, 80]
	stp	x25, x26, [sp, 96]
	mov	w23, w0
	mov	x0, x30
	mov	w19, w7
	mov	w24, w1
	mov	w20, w2
	mov	w21, w3
	mov	w25, w4
	mov	w26, w5
	mov	w22, w6
	bl	_mcount
	cmn	w19, #2
	beq	.L196
	tbnz	w19, #31, .L197
	mov	w0, w19
	bl	VCTRL_GetVidStd
	mov	w1, w0
	ldr	x0, .LC72
	ldr	x0, [x0, w19, sxtw 3]
	ldr	w0, [x0, 1448]
	cmp	w0, 1
	beq	.L199
.L194:
	ldr	x0, [x29, 80]
	mov	w7, w26
	str	x0, [sp, 16]
	mov	w6, w25
	mov	w5, w21
	mov	w4, w20
	mov	w3, w24
	mov	w2, w23
	str	w22, [sp]
	mov	w0, w19
	str	w19, [sp, 8]
	bl	VDMHAL_V400R003_ArrangeMem_Specific
.L198:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L197:
	mov	w1, 21
	b	.L194
	.p2align 3
.L196:
	mov	w1, 16
	b	.L194
	.p2align 3
.L199:
	ldr	x5, [x29, 80]
	mov	w4, w22
	mov	w3, w21
	mov	w2, w20
	mov	w0, w19
	bl	VDMHAL_V400R003_ArrangeMem_Normal
	b	.L198
	.size	VDMHAL_V400R003_ArrangeMem, .-VDMHAL_V400R003_ArrangeMem
	.align	3
.LC72:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ResetVdm
	.type	VDMHAL_V400R003_ResetVdm, %function
VDMHAL_V400R003_ResetVdm:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, wzr
	ble	.L201
	ldr	x2, .LC73
	mov	w4, 0
	ldr	x1, .LC75
	mov	w3, w21
	add	x2, x2, 216
	mov	w0, 0
	bl	dprint_vfmw
.L200:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L201:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L213
	sxtw	x22, w21
	ldr	x24, .LC78
	lsl	x0, x22, 6
	ldr	x20, .LC79
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	ldr	x2, [x20]
	add	x0, x0, x1, lsl 2
	ldr	x0, [x24, x0]
	ldr	w25, [x0, 36]
	ldr	w23, [x2, 120]
	tbz	x23, 0, .L200
	ldr	x26, .LC80
	mov	w0, 2
	bfi	w23, w0, 8, 2
	str	w23, [x2, 120]
	mov	w19, 0
	orr	w23, w23, 64
	ldr	x0, [x26, 224]
	blr	x0
	ldr	x0, [x20]
	str	w23, [x0, 120]
	b	.L205
	.p2align 3
.L214:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L206
.L205:
	ldr	x1, [x26, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20]
	ldr	w0, [x0, 372]
	tbz	x0, 2, .L214
	cmp	w19, 999
	bgt	.L206
	ldr	x2, .LC73
	mov	w3, w21
	ldr	x1, .LC84
	mov	w0, 0
	add	x2, x2, 216
	bl	dprint_vfmw
.L208:
	ldr	x0, [x20]
	and	w23, w23, -65
	str	w23, [x0, 120]
	and	w23, w23, -769
	ldr	x0, [x26, 224]
	blr	x0
	lsl	x0, x22, 6
	ldr	x1, [x20]
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x22, x0, x22
	str	w23, [x1, 120]
	add	x22, x0, x22, lsl 2
	ldr	x0, [x24, x22]
	str	w25, [x0, 36]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L206:
	ldr	x2, .LC73
	mov	w3, w21
	ldr	x1, .LC82
	mov	w0, 0
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L208
.L213:
	ldr	x1, .LC77
	mov	x2, 0
	bl	dprint_vfmw
	b	.L200
	.size	VDMHAL_V400R003_ResetVdm, .-VDMHAL_V400R003_ResetVdm
	.align	3
.LC73:
	.xword	.LANCHOR0
	.align	3
.LC75:
	.xword	.LC74
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC78:
	.xword	g_HwMem
	.align	3
.LC79:
	.xword	g_pstRegCrg
	.align	3
.LC80:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC84:
	.xword	.LC83
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_SetSmmuPageTableAddr
	.type	VDMHAL_V400R003_SetSmmuPageTableAddr, %function
VDMHAL_V400R003_SetSmmuPageTableAddr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC85
	ldr	x3, [x0, 360]
	cbz	x3, .L215
	add	x2, x29, 60
	add	x1, x29, 56
	add	x0, x29, 52
	blr	x3
	cbnz	w19, .L217
	ldr	x0, .LC86
	ldp	w3, w2, [x29, 52]
	ldr	w1, [x29, 60]
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w3, [x0, 524]
	str	w2, [x0, 772]
	str	w1, [x0, 776]
.L215:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L217:
	ldr	x20, .LC87
	mov	w3, w19
	ldr	x21, .LC89
	mov	w4, 1
	add	x20, x20, 248
	mov	w0, 32
	mov	x1, x21
	mov	x2, x20
	bl	dprint_vfmw
	mov	w3, w19
	mov	x2, x20
	mov	x1, x21
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	mov	w3, w19
	mov	x2, x20
	mov	x1, x21
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.size	VDMHAL_V400R003_SetSmmuPageTableAddr, .-VDMHAL_V400R003_SetSmmuPageTableAddr
	.align	3
.LC85:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC86:
	.xword	g_HwMem
	.align	3
.LC87:
	.xword	.LANCHOR0
	.align	3
.LC89:
	.xword	.LC88
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_EnableSmmu
	.type	VDMHAL_V400R003_EnableSmmu, %function
VDMHAL_V400R003_EnableSmmu:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC91
	mov	w1, 8
	ldr	x0, [x0]
	add	x0, x0, 61440
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V400R003_EnableSmmu, .-VDMHAL_V400R003_EnableSmmu
	.align	3
.LC91:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GlbResetX
	.type	VDMHAL_V400R003_GlbResetX, %function
VDMHAL_V400R003_GlbResetX:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w23, w0
	mov	x0, x30
	bl	_mcount
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L234
	ldr	x20, .LC95
	ldr	x0, [x20]
	ldr	w22, [x0, 120]
	tbnz	x22, 0, .L235
.L222:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L235:
	ldr	x21, .LC96
	mov	w1, 2
	bfi	w22, w1, 8, 2
	str	w22, [x0, 120]
	mov	w19, 0
	orr	w22, w22, 16
	ldr	x0, [x21, 224]
	blr	x0
	ldr	x0, [x20]
	str	w22, [x0, 120]
	b	.L226
	.p2align 3
.L236:
	add	w19, w19, 1
	cmp	w19, 1000
	beq	.L227
.L226:
	ldr	x1, [x21, 232]
	mov	x0, 30
	blr	x1
	ldr	x0, [x20]
	ldr	w0, [x0, 372]
	tbz	x0, 0, .L236
	cmp	w19, 999
	bgt	.L227
	ldr	x2, .LC92
	mov	w3, w23
	ldr	x1, .LC100
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
.L229:
	ldr	x0, [x20]
	and	w22, w22, -17
	str	w22, [x0, 120]
	and	w22, w22, -769
	ldr	x0, [x21, 224]
	blr	x0
	ldr	x0, [x20]
	str	w22, [x0, 120]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L227:
	ldr	x2, .LC92
	mov	w3, w23
	ldr	x1, .LC98
	mov	w0, 0
	add	x2, x2, 288
	bl	dprint_vfmw
	b	.L229
.L234:
	ldr	x2, .LC92
	mov	w3, -121438208
	ldr	x1, .LC94
	add	x2, x2, 288
	bl	dprint_vfmw
	b	.L222
	.size	VDMHAL_V400R003_GlbResetX, .-VDMHAL_V400R003_GlbResetX
	.align	3
.LC92:
	.xword	.LANCHOR0
	.align	3
.LC94:
	.xword	.LC93
	.align	3
.LC95:
	.xword	g_pstRegCrg
	.align	3
.LC96:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC98:
	.xword	.LC97
	.align	3
.LC100:
	.xword	.LC99
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GlbReset
	.type	VDMHAL_V400R003_GlbReset, %function
VDMHAL_V400R003_GlbReset:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L240
	mov	w0, 0
	bl	VDMHAL_V400R003_GlbResetX
.L237:
	ldp	x29, x30, [sp], 16
	ret
.L240:
	ldr	x2, .LC101
	mov	w3, -121438208
	ldr	x1, .LC102
	add	x2, x2, 320
	bl	dprint_vfmw
	b	.L237
	.size	VDMHAL_V400R003_GlbReset, .-VDMHAL_V400R003_GlbReset
	.align	3
.LC101:
	.xword	.LANCHOR0
	.align	3
.LC102:
	.xword	.LC93
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ClearIntState
	.type	VDMHAL_V400R003_ClearIntState, %function
VDMHAL_V400R003_ClearIntState:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x19, w0
	mov	x0, x30
	mov	x20, x19
	bl	_mcount
	ldr	x21, .LC104
	ldr	x0, .LC103
	add	x1, x21, x19, lsl 6
	ldrsw	x1, [x1, 8]
	ldr	x0, [x0, x1, lsl 3]
	cbz	x0, .L251
	ldr	w22, [x0, 1232]
.L242:
	cmp	w20, wzr
	bgt	.L253
	lsl	x0, x19, 6
	ldr	x23, .LC107
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	ldr	x0, [x23, x20]
	cbz	x0, .L254
.L245:
	cmp	w22, 1
	bne	.L252
	add	x19, x21, x19, lsl 6
	ldr	w1, [x19, 44]
	cmp	w1, 1
	beq	.L252
	ldr	w2, [x0, 28]
	cmp	w1, 2
	beq	.L255
	cmp	w1, 3
	bne	.L241
	mov	w1, -15
	str	w1, [x0, 32]
	b	.L241
	.p2align 3
.L253:
	ldr	x2, .LC105
	mov	w4, 0
	ldr	x1, .LC106
	mov	w3, w20
	add	x2, x2, 352
	mov	w0, 0
	bl	dprint_vfmw
.L241:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L252:
	mov	w1, -1
	str	w1, [x0, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L251:
	mov	w22, 0
	b	.L242
	.p2align 3
.L254:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L246
	str	x0, [x23, x20]
	b	.L245
	.p2align 3
.L255:
	mov	w1, -12
	str	w1, [x0, 32]
	b	.L241
.L246:
	ldr	x1, .LC109
	mov	w0, 0
	bl	dprint_vfmw
	b	.L241
	.size	VDMHAL_V400R003_ClearIntState, .-VDMHAL_V400R003_ClearIntState
	.align	3
.LC103:
	.xword	s_pstVfmwChan
	.align	3
.LC104:
	.xword	g_VdmDrvParam
	.align	3
.LC105:
	.xword	.LANCHOR0
	.align	3
.LC106:
	.xword	.LC74
	.align	3
.LC107:
	.xword	g_HwMem
	.align	3
.LC109:
	.xword	.LC108
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ClearMMUIntState
	.type	VDMHAL_V400R003_ClearMMUIntState, %function
VDMHAL_V400R003_ClearMMUIntState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L261
	lsl	x3, x19, 6
	ldr	x20, .LC112
	sub	x3, x3, x19
	lsl	x3, x3, 2
	sub	x19, x3, x19
	add	x19, x3, x19, lsl 2
	ldr	x0, [x20, x19]
	cbz	x0, .L262
.L259:
	add	x0, x0, 61440
	mov	w1, 7
	str	w1, [x0, 44]
.L256:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L261:
	ldr	x2, .LC110
	mov	w3, w19
	ldr	x1, .LC111
	mov	w4, 0
	add	x2, x2, 384
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L262:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L260
	str	x0, [x20, x19]
	b	.L259
.L260:
	ldr	x1, .LC113
	mov	w0, 0
	bl	dprint_vfmw
	b	.L256
	.size	VDMHAL_V400R003_ClearMMUIntState, .-VDMHAL_V400R003_ClearMMUIntState
	.align	3
.LC110:
	.xword	.LANCHOR0
	.align	3
.LC111:
	.xword	.LC74
	.align	3
.LC112:
	.xword	g_HwMem
	.align	3
.LC113:
	.xword	.LC108
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_MaskInt
	.type	VDMHAL_V400R003_MaskInt, %function
VDMHAL_V400R003_MaskInt:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	bgt	.L268
	lsl	x3, x19, 6
	ldr	x20, .LC116
	sub	x3, x3, x19
	lsl	x3, x3, 2
	sub	x19, x3, x19
	add	x19, x3, x19, lsl 2
	ldr	x0, [x20, x19]
	cbz	x0, .L269
.L266:
	mov	w1, -1
	str	w1, [x0, 36]
.L263:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L268:
	ldr	x2, .LC114
	mov	w3, w19
	ldr	x1, .LC115
	mov	w4, 0
	add	x2, x2, 424
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L269:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L267
	str	x0, [x20, x19]
	b	.L266
.L267:
	ldr	x1, .LC117
	mov	w0, 0
	bl	dprint_vfmw
	b	.L263
	.size	VDMHAL_V400R003_MaskInt, .-VDMHAL_V400R003_MaskInt
	.align	3
.LC114:
	.xword	.LANCHOR0
	.align	3
.LC115:
	.xword	.LC74
	.align	3
.LC116:
	.xword	g_HwMem
	.align	3
.LC117:
	.xword	.LC108
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GetIntMaskCfg
	.type	VDMHAL_V400R003_GetIntMaskCfg, %function
VDMHAL_V400R003_GetIntMaskCfg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, 1
	mov	w1, -6
	mov	w0, -2
	ldr	x19, [sp, 16]
	csel	w0, w1, w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V400R003_GetIntMaskCfg, .-VDMHAL_V400R003_GetIntMaskCfg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_EnableInt
	.type	VDMHAL_V400R003_EnableInt, %function
VDMHAL_V400R003_EnableInt:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC119
	sxtw	x0, w19
	ldr	x2, .LC118
	add	x1, x1, x0, lsl 6
	ldrsw	x1, [x1, 8]
	ldr	x1, [x2, x1, lsl 3]
	cbz	x1, .L281
	ldr	w20, [x1, 1232]
.L274:
	cmp	w19, wzr
	bgt	.L282
	lsl	x19, x0, 6
	ldr	x21, .LC122
	sub	x19, x19, x0
	lsl	x19, x19, 2
	sub	x0, x19, x0
	add	x19, x19, x0, lsl 2
	ldr	x0, [x21, x19]
	cbz	x0, .L283
.L277:
	mov	w1, -6
	mov	w2, -2
	cmp	w20, 1
	csel	w1, w1, w2, eq
	str	w1, [x0, 36]
.L273:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L282:
	ldr	x2, .LC120
	mov	w3, w19
	ldr	x1, .LC121
	mov	w4, 0
	add	x2, x2, 448
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L281:
	mov	w20, 0
	b	.L274
	.p2align 3
.L283:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L278
	str	x0, [x21, x19]
	b	.L277
.L278:
	ldr	x1, .LC123
	mov	w0, 0
	bl	dprint_vfmw
	b	.L273
	.size	VDMHAL_V400R003_EnableInt, .-VDMHAL_V400R003_EnableInt
	.align	3
.LC118:
	.xword	s_pstVfmwChan
	.align	3
.LC119:
	.xword	g_VdmDrvParam
	.align	3
.LC120:
	.xword	.LANCHOR0
	.align	3
.LC121:
	.xword	.LC74
	.align	3
.LC122:
	.xword	g_HwMem
	.align	3
.LC123:
	.xword	.LC108
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CheckReg
	.type	VDMHAL_V400R003_CheckReg, %function
VDMHAL_V400R003_CheckReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	bgt	.L301
	lsl	x0, x19, 6
	ldr	x21, .LC127
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	ldr	x0, [x21, x20]
	cbz	x0, .L302
.L287:
	sub	w0, w22, #1
	cmp	w0, 6
	bls	.L303
	ldr	x2, .LC124
	mov	w3, w22
	ldr	x1, .LC131
	mov	w0, 0
	add	x2, x2, 480
	bl	dprint_vfmw
	mov	w0, 0
.L300:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L303:
	ldr	x1, .LC132
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx294
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx294:
	.section	.rodata
	.align	0
	.align	2
.L294:
	.byte	(.L298 - .Lrtx294) / 4
	.byte	(.L295 - .Lrtx294) / 4
	.byte	(.L296 - .Lrtx294) / 4
	.byte	(.L297 - .Lrtx294) / 4
	.byte	(.L299 - .Lrtx294) / 4
	.byte	(.L289 - .Lrtx294) / 4
	.byte	(.L291 - .Lrtx294) / 4
	.text
	.p2align 3
.L299:
	mov	x1, 61480
.L293:
	lsl	x0, x19, 6
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x21, x19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	w0, [x0, x1]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L298:
	mov	x1, 28
	b	.L293
	.p2align 3
.L297:
	mov	x1, 40
	b	.L293
	.p2align 3
.L296:
	mov	x1, 36
	b	.L293
	.p2align 3
.L295:
	mov	x1, 32
	b	.L293
	.p2align 3
.L291:
	mov	x1, 62272
	b	.L293
	.p2align 3
.L289:
	mov	x1, 62304
	b	.L293
	.p2align 3
.L302:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L288
	str	x0, [x21, x20]
	b	.L287
	.p2align 3
.L301:
	ldr	x2, .LC124
	mov	w3, w19
	ldr	x1, .LC126
	mov	w0, 0
	add	x2, x2, 480
	bl	dprint_vfmw
	mov	w0, -1
	b	.L300
.L288:
	ldr	x2, .LC124
	mov	w0, 0
	ldr	x1, .LC129
	add	x2, x2, 480
	bl	dprint_vfmw
	mov	w0, 0
	b	.L300
	.size	VDMHAL_V400R003_CheckReg, .-VDMHAL_V400R003_CheckReg
	.align	3
.LC124:
	.xword	.LANCHOR0
	.align	3
.LC126:
	.xword	.LC125
	.align	3
.LC127:
	.xword	g_HwMem
	.align	3
.LC129:
	.xword	.LC128
	.align	3
.LC131:
	.xword	.LC130
	.align	3
.LC132:
	.xword	.L294
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ReadMMUMask
	.type	VDMHAL_V400R003_ReadMMUMask, %function
VDMHAL_V400R003_ReadMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	sxtw	x19, w0
	mov	x0, x30
	bl	_mcount
	cmp	w19, wzr
	ble	.L307
	ldr	x2, .LC134
	mov	w3, w19
	ldr	x1, .LC136
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L307:
	lsl	x0, x19, 6
	ldr	x1, .LC133
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x1, x19]
	ldr	x19, [sp, 16]
	add	x0, x0, 61440
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 32]
	ret
	.size	VDMHAL_V400R003_ReadMMUMask, .-VDMHAL_V400R003_ReadMMUMask
	.align	3
.LC133:
	.xword	g_HwMem
	.align	3
.LC134:
	.xword	.LANCHOR1
	.align	3
.LC136:
	.xword	.LC135
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_WriteMMUMask
	.type	VDMHAL_V400R003_WriteMMUMask, %function
VDMHAL_V400R003_WriteMMUMask:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	sxtw	x19, w1
	bl	_mcount
	cmp	w19, wzr
	ble	.L311
	ldr	x2, .LC138
	mov	w3, w19
	ldr	x1, .LC139
	mov	w4, 1
	add	x2, x2, 32
	mov	w0, 32
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L311:
	lsl	x0, x19, 6
	ldr	x1, .LC137
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x1, x19]
	add	x0, x0, 61440
	str	w20, [x0, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V400R003_WriteMMUMask, .-VDMHAL_V400R003_WriteMMUMask
	.align	3
.LC137:
	.xword	g_HwMem
	.align	3
.LC138:
	.xword	.LANCHOR1
	.align	3
.LC139:
	.xword	.LC88
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_PrepareDec
	.type	VDMHAL_V400R003_PrepareDec, %function
VDMHAL_V400R003_PrepareDec:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w20, w0
	mov	x22, x1
	mov	x0, x30
	mov	w21, w2
	mov	x19, x3
	bl	_mcount
	cbz	x22, .L331
	cmp	w21, wzr
	bgt	.L332
	cmp	w20, 6
	mov	w2, 0
	cset	w1, eq
	mov	w0, 0
	mov	x3, x19
	bl	SCD_ConfigReg
	mov	x3, x19
	mov	w2, 0
	mov	w1, 1
	mov	w0, 8
	bl	SCD_ConfigReg
	cmp	w20, 17
	bls	.L333
.L330:
	mov	w0, -1
	b	.L314
	.p2align 3
.L333:
	ldr	x0, .LC144
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx317
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx317:
	.section	.rodata
	.align	0
	.align	2
.L317:
	.byte	(.L327 - .Lrtx317) / 4
	.byte	(.L318 - .Lrtx317) / 4
	.byte	(.L319 - .Lrtx317) / 4
	.byte	(.L320 - .Lrtx317) / 4
	.byte	(.L330 - .Lrtx317) / 4
	.byte	(.L321 - .Lrtx317) / 4
	.byte	(.L322 - .Lrtx317) / 4
	.byte	(.L330 - .Lrtx317) / 4
	.byte	(.L323 - .Lrtx317) / 4
	.byte	(.L324 - .Lrtx317) / 4
	.byte	(.L325 - .Lrtx317) / 4
	.byte	(.L325 - .Lrtx317) / 4
	.byte	(.L325 - .Lrtx317) / 4
	.byte	(.L326 - .Lrtx317) / 4
	.byte	(.L330 - .Lrtx317) / 4
	.byte	(.L327 - .Lrtx317) / 4
	.byte	(.L328 - .Lrtx317) / 4
	.byte	(.L329 - .Lrtx317) / 4
	.text
	.p2align 3
.L327:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	H264HAL_V400R003_StartDec
.L314:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L328:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	HEVCHAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L326:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP8HAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L325:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP6HAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L324:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	RV9HAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L323:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	RV8HAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L322:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	AVSHAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L321:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	DIVX3HAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L320:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	MP2HAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L319:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	MP4HAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L318:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VC1HAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L329:
	mov	x2, x19
	mov	w1, w21
	mov	x0, x22
	bl	VP9HAL_V400R003_StartDec
	b	.L314
	.p2align 3
.L332:
	ldr	x2, .LC140
	mov	w3, w21
	ldr	x1, .LC143
	mov	w4, 0
	add	x2, x2, 64
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L331:
	ldr	x2, .LC140
	mov	x3, 0
	ldr	x1, .LC142
	mov	w0, 0
	add	x2, x2, 64
	bl	dprint_vfmw
	mov	w0, -1
	b	.L314
	.size	VDMHAL_V400R003_PrepareDec, .-VDMHAL_V400R003_PrepareDec
	.align	3
.LC140:
	.xword	.LANCHOR1
	.align	3
.LC142:
	.xword	.LC141
	.align	3
.LC143:
	.xword	.LC74
	.align	3
.LC144:
	.xword	.L317
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_IsVdmReady
	.type	VDMHAL_V400R003_IsVdmReady, %function
VDMHAL_V400R003_IsVdmReady:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC145
	lsl	x1, x0, 6
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x2, x0]
	cbz	x0, .L339
	cmp	w19, wzr
	ble	.L340
	ldr	x2, .LC148
	mov	w4, 1
	ldr	x1, .LC150
	mov	w3, w19
	add	x2, x2, 96
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 0
.L336:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L340:
	ldr	w0, [x0, 28]
	ldr	x19, [sp, 16]
	ubfx	x0, x0, 17, 1
	ldp	x29, x30, [sp], 32
	ret
.L339:
	ldr	x2, .LC148
	ldr	x3, .LC147
	ldr	x1, .LC149
	add	x2, x2, 96
	bl	dprint_vfmw
	mov	w0, -1
	b	.L336
	.size	VDMHAL_V400R003_IsVdmReady, .-VDMHAL_V400R003_IsVdmReady
	.align	3
.LC145:
	.xword	g_HwMem
	.align	3
.LC147:
	.xword	.LC146
	.align	3
.LC148:
	.xword	.LANCHOR1
	.align	3
.LC149:
	.xword	.LC6
	.align	3
.LC150:
	.xword	.LC135
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_IsVdmRun
	.type	VDMHAL_V400R003_IsVdmRun, %function
VDMHAL_V400R003_IsVdmRun:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sxtw	x0, w19
	ldr	x2, .LC151
	lsl	x1, x0, 6
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x2, x0]
	cbz	x0, .L346
	cmp	w19, wzr
	ble	.L347
	ldr	x2, .LC154
	mov	w4, 1
	ldr	x1, .LC155
	mov	w3, w19
	add	x2, x2, 128
	mov	w0, 32
	bl	dprint_vfmw
	mov	w0, 1
.L343:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L347:
	ldr	w0, [x0, 40]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L346:
	ldr	x1, .LC153
	bl	dprint_vfmw
	mov	w0, 0
	b	.L343
	.size	VDMHAL_V400R003_IsVdmRun, .-VDMHAL_V400R003_IsVdmRun
	.align	3
.LC151:
	.xword	g_HwMem
	.align	3
.LC153:
	.xword	.LC152
	.align	3
.LC154:
	.xword	.LANCHOR1
	.align	3
.LC155:
	.xword	.LC135
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_IsVdhDecOver
	.type	VDMHAL_V400R003_IsVdhDecOver, %function
VDMHAL_V400R003_IsVdhDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	ldr	x1, .LC156
	lsl	x2, x0, 6
	sub	x2, x2, x0
	lsl	x2, x2, 2
	sub	x0, x2, x0
	add	x0, x2, x0, lsl 2
	ldr	x0, [x1, x0]
	cbz	x0, .L357
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V400R003_CheckReg
	cmp	w19, 1
	beq	.L352
	cmp	w19, 2
	and	w0, w0, 1
	bne	.L358
.L350:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L358:
	ldr	x2, .LC158
	mov	w3, w19
	ldr	x1, .LC160
	mov	w0, 0
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L352:
	ubfx	x0, x0, 17, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L357:
	ldr	x2, .LC158
	ldr	x3, .LC157
	ldr	x1, .LC159
	add	x2, x2, 160
	bl	dprint_vfmw
	mov	w0, -1
	b	.L350
	.size	VDMHAL_V400R003_IsVdhDecOver, .-VDMHAL_V400R003_IsVdhDecOver
	.align	3
.LC156:
	.xword	g_HwMem
	.align	3
.LC157:
	.xword	.LC146
	.align	3
.LC158:
	.xword	.LANCHOR1
	.align	3
.LC159:
	.xword	.LC6
	.align	3
.LC160:
	.xword	.LC130
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_IsVdhPartDecOver
	.type	VDMHAL_V400R003_IsVdhPartDecOver, %function
VDMHAL_V400R003_IsVdhPartDecOver:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	sxtw	x0, w20
	ldr	x1, .LC161
	lsl	x2, x0, 6
	sub	x2, x2, x0
	lsl	x2, x2, 2
	sub	x0, x2, x0
	add	x0, x2, x0, lsl 2
	ldr	x0, [x1, x0]
	cbz	x0, .L367
	mov	w1, w20
	mov	w0, w19
	bl	VDMHAL_V400R003_CheckReg
	cmp	w19, 1
	beq	.L363
	cmp	w19, 2
	ubfx	x0, x0, 2, 1
	bne	.L368
.L361:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L368:
	ldr	x2, .LC163
	mov	w3, w19
	ldr	x1, .LC165
	mov	w0, 0
	add	x2, x2, 192
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L363:
	ubfx	x0, x0, 19, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L367:
	ldr	x2, .LC163
	ldr	x3, .LC162
	ldr	x1, .LC164
	add	x2, x2, 192
	bl	dprint_vfmw
	mov	w0, -1
	b	.L361
	.size	VDMHAL_V400R003_IsVdhPartDecOver, .-VDMHAL_V400R003_IsVdhPartDecOver
	.align	3
.LC161:
	.xword	g_HwMem
	.align	3
.LC162:
	.xword	.LC146
	.align	3
.LC163:
	.xword	.LANCHOR1
	.align	3
.LC164:
	.xword	.LC6
	.align	3
.LC165:
	.xword	.LC130
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_UpdateHardwareInfo
	.type	VDMHAL_V400R003_UpdateHardwareInfo, %function
VDMHAL_V400R003_UpdateHardwareInfo:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	w21, w0
	mov	x0, x30
	bl	_mcount
	cmp	w21, wzr
	bgt	.L370
	ldr	x4, .LC166
	ldr	w0, [x4]
	cmp	w0, 1
	beq	.L371
	add	x0, x4, 4
	add	x4, x4, 128
	b	.L374
	.p2align 3
.L410:
	cmp	x0, x4
	beq	.L409
.L374:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 1
	bne	.L410
.L371:
	sxtw	x19, w21
	ldr	x24, .LC171
	lsl	x0, x19, 6
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x1, x0, x19
	add	x0, x0, x1, lsl 2
	ldr	x2, [x24, x0]
	cbz	x2, .L411
	lsl	x0, x19, 2
	ldr	x20, .LC172
	sub	x1, x0, x19
	ldr	w3, [x2, 12]
	lsl	x0, x1, 4
	mov	w22, 1
	sub	x0, x0, x1
	lsl	x0, x0, 2
	add	x1, x20, x0
	str	w3, [x20, x0]
	ldr	w2, [x2, 28]
	str	w2, [x1, 4]
.L377:
	lsl	x0, x19, 6
	and	w23, w2, 131071
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x1, x0, x19
	add	x0, x0, x1, lsl 2
	add	x0, x24, x0
	ldr	w0, [x0, 56]
	bl	MEM_Phy2Vir
	cbz	x0, .L412
	sub	w1, w23, #1
	cmp	w1, 199
	bhi	.L386
	lsl	w1, w23, 2
	sub	w1, w1, #4
	lsl	x1, x1, 2
	add	x3, x1, 8
.L380:
	lsl	x2, x19, 2
	ldr	w4, [x0, x1]
	sub	x2, x2, x19
	lsl	x1, x2, 4
	sub	x2, x1, x2
	lsl	x1, x19, 6
	sub	x1, x1, x19
	add	x2, x20, x2, lsl 2
	lsl	x1, x1, 2
	str	w4, [x2, 16]
	ldr	w3, [x0, x3]
	sub	x0, x1, x19
	str	w3, [x2, 20]
	add	x1, x1, x0, lsl 2
	ldr	x1, [x24, x1]
	ldr	w3, [x1, 208]
	ldr	w0, [x1, 212]
	stp	w3, w0, [x2, 8]
	b	.L381
	.p2align 3
.L409:
	sxtw	x19, w21
	ldr	x24, .LC171
	lsl	x0, x19, 6
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x1, x0, x19
	add	x0, x0, x1, lsl 2
	ldr	x1, [x24, x0]
	cbz	x1, .L413
	lsl	x0, x19, 2
	ldr	x20, .LC172
	sub	x2, x0, x19
	ldr	w3, [x1, 12]
	lsl	x0, x2, 4
	mov	w22, 0
	sub	x0, x0, x2
	lsl	x0, x0, 2
	add	x2, x20, x0
	str	w3, [x20, x0]
	ldr	w0, [x1, 28]
	str	w0, [x2, 4]
.L378:
	lsl	x0, x19, 2
	ldr	w2, [x1, 4096]
	sub	x4, x0, x19
	ldr	w5, [x1, 4116]
	lsl	x0, x4, 4
	ldr	w3, [x1, 208]
	sub	x0, x0, x4
	add	x0, x20, x0, lsl 2
	stp	w2, w5, [x0, 16]
	ldr	w2, [x1, 212]
	str	w3, [x0, 8]
	str	w2, [x0, 12]
	cbnz	w22, .L381
	ldr	w5, [x1, 176]
	ldr	w2, [x1, 180]
	stp	w5, w2, [x0, 24]
	ldr	w4, [x1, 184]
	ldr	w3, [x1, 188]
	ldr	w2, [x1, 192]
	stp	w4, w3, [x0, 32]
	str	w2, [x0, 40]
.L381:
	mov	w0, 180
	add	x4, x1, 32768
	add	x1, x4, 256
	smull	x2, w21, w0
	add	x0, x2, 52
	add	x2, x2, 180
	add	x0, x20, x0
	add	x3, x20, x2
	.p2align 2
.L382:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L382
	mov	w0, 0
	cbnz	w22, .L396
	lsl	x1, x19, 2
	ldr	w3, [x4, 384]
	sub	x19, x1, x19
	ldr	w2, [x4, 388]
	lsl	x1, x19, 4
	sub	x1, x1, x19
	add	x20, x20, x1, lsl 2
	stp	w2, w3, [x20, 44]
.L396:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L386:
	mov	x3, 8
	mov	x1, 0
	b	.L380
.L370:
	ldr	x2, .LC167
	mov	w4, 0
	ldr	x1, .LC168
	mov	w3, w21
	add	x2, x2, 232
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L396
.L413:
	mov	w22, 0
.L383:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L376
	lsl	x2, x19, 6
	lsl	x3, x19, 2
	sub	x2, x2, x19
	sub	x4, x3, x19
	lsl	x2, x2, 2
	lsl	x3, x4, 4
	sub	x1, x2, x19
	sub	x3, x3, x4
	ldr	x20, .LC172
	lsl	x3, x3, 2
	add	x2, x2, x1, lsl 2
	add	x1, x20, x3
	str	x0, [x24, x2]
	ldr	w2, [x0, 12]
	str	w2, [x20, x3]
	ldr	w2, [x0, 28]
	str	w2, [x1, 4]
	cbnz	w22, .L377
	mov	x1, x0
	b	.L378
.L411:
	mov	w22, 1
	b	.L383
.L412:
	ldr	x2, .LC167
	ldr	x3, .LC175
	ldr	x1, .LC176
	add	x2, x2, 232
	bl	dprint_vfmw
	mov	w0, -1
	b	.L396
.L376:
	ldr	x1, .LC173
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L396
	.size	VDMHAL_V400R003_UpdateHardwareInfo, .-VDMHAL_V400R003_UpdateHardwareInfo
	.align	3
.LC166:
	.xword	g_DSPState
	.align	3
.LC167:
	.xword	.LANCHOR1
	.align	3
.LC168:
	.xword	.LC74
	.align	3
.LC171:
	.xword	g_HwMem
	.align	3
.LC172:
	.xword	g_BackUp
	.align	3
.LC173:
	.xword	.LC108
	.align	3
.LC175:
	.xword	.LC174
	.align	3
.LC176:
	.xword	.LC6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_ReadMsgSlot
	.type	VDMHAL_V400R003_ReadMsgSlot, %function
VDMHAL_V400R003_ReadMsgSlot:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	mov	w19, w2
	bl	_mcount
	cmp	x20, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L418
	cmp	w19, 800
	bhi	.L419
	ldr	x3, .LC181
	ubfiz	x2, x19, 2, 30
	mov	x1, x21
	mov	x0, x20
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 0
.L416:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L419:
	ldr	x1, .LC180
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L416
	.p2align 3
.L418:
	ldr	x1, .LC178
	mov	x3, x21
	mov	x2, x20
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L416
	.size	VDMHAL_V400R003_ReadMsgSlot, .-VDMHAL_V400R003_ReadMsgSlot
	.align	3
.LC178:
	.xword	.LC177
	.align	3
.LC180:
	.xword	.LC179
	.align	3
.LC181:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_WriteMsgSlot
	.type	VDMHAL_V400R003_WriteMsgSlot, %function
VDMHAL_V400R003_WriteMsgSlot:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L421
	sub	w0, w21, #1
	cmp	w0, 255
	bhi	.L421
	ldr	x3, .LC184
	ubfiz	x2, x21, 2, 30
	mov	x1, x20
	mov	x0, x19
	ldr	x3, [x3, 104]
	blr	x3
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L421:
	ldr	x1, .LC183
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VDMHAL_V400R003_WriteMsgSlot, .-VDMHAL_V400R003_WriteMsgSlot
	.align	3
.LC183:
	.xword	.LC182
	.align	3
.LC184:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CfgRpMsg
	.type	VDMHAL_V400R003_CfgRpMsg, %function
VDMHAL_V400R003_CfgRpMsg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 64]
	bl	MEM_Phy2Vir
	mov	x20, x0
	cbz	x0, .L463
	ldr	w2, [x19, 840]
	sub	w0, w2, #1
	cmp	w0, 199
	bhi	.L464
	ldp	w2, w0, [x19, 24]
	ldr	w4, [x19, 864]
	mov	w3, 0
	ldr	w5, [x19, 848]
	lsl	w2, w2, w4
	lsl	w0, w0, w4
	add	w1, w2, 255
	cmp	w5, 1
	and	w1, w1, -256
	lsl	w5, w1, 4
	beq	.L465
.L428:
	ldr	w2, [x19]
	cmp	w2, 16
	beq	.L429
	add	w0, w0, 31
	mov	w23, 8
	and	w0, w0, -32
	madd	w0, w0, w1, w3
.L450:
	ldr	w1, [x19, 16]
	mov	w4, 0
	str	w1, [x20]
	mov	w2, 0
	ldr	w1, [x19, 16]
	add	w1, w0, w1
	str	w1, [x20, 4]
	ldr	w1, [x19, 4]
	str	w1, [x20, 8]
	ldr	w1, [x19, 4]
	add	w0, w0, w1
	str	w0, [x20, 12]
	str	w5, [x20, 16]
	str	w3, [x20, 20]
	ldp	w1, w0, [x19, 24]
	sub	w0, w0, #1
	sub	w1, w1, #1
	bfi	w2, w0, 0, 9
	bfi	w4, w1, 0, 9
	strh	w2, [x29, 74]
	strh	w4, [x29, 72]
	ldr	w0, [x29, 72]
	str	w0, [x20, 24]
	ldr	w0, [x19, 852]
	ldp	w21, w22, [x19, 24]
	sub	w0, w0, #1
	cmp	w0, 1
	bls	.L466
.L431:
	ldr	w0, [x19, 856]
	mov	w11, 0
	cbz	w0, .L467
.L432:
	cmp	w0, 1
	beq	.L448
.L472:
	sub	w11, w11, #1
	uxth	w11, w11
.L449:
	ldr	w4, [x19, 848]
	ldr	w2, [x19, 852]
	ldr	w3, [x19, 864]
	ldrb	w0, [x29, 74]
	and	w2, w2, 3
	ldrb	w1, [x29, 75]
	sub	w3, w3, #4
	bfi	w0, w4, 0, 1
	strh	w11, [x29, 72]
	bfi	w0, w2, 4, 2
	bfi	w1, w3, 0, 2
	bfi	w0, w2, 6, 2
	bfi	w1, w23, 2, 4
	strb	w0, [x29, 74]
	mov	w0, 0
	strb	w1, [x29, 75]
	ldr	w1, [x29, 72]
	str	w1, [x20, 28]
.L461:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L467:
	ldr	w0, [x19, 864]
	cmp	w0, 6
	beq	.L453
	cmp	w0, 5
	beq	.L454
	cmp	w0, 4
	mov	w2, 8
	beq	.L433
	ldr	x1, .LC192
	mov	w0, 1
	bl	dprint_vfmw
	mov	w2, 1
.L433:
	ldr	w8, [x19, 840]
	cmp	w8, wzr
	ble	.L462
	mul	w12, w22, w21
	mov	w4, 0
	mov	w6, 0
	sub	w13, w12, #1
	mov	w11, 0
	sub	w9, w2, #1
	b	.L436
	.p2align 3
.L470:
	ldrsh	w6, [x10, 38]
	sub	w6, w6, #1
	add	w6, w6, w2
	udiv	w6, w6, w2
	mul	w6, w6, w2
	cmp	w0, w6
	bgt	.L439
.L438:
	add	w4, w4, 1
	cmp	w4, w8
	bge	.L468
.L447:
	cmp	w4, 199
	bgt	.L469
.L436:
	add	x10, x19, x4, sxtw 2
	cmp	w4, wzr
	ldrsh	w1, [x10, 42]
	sub	w0, w1, #1
	add	w0, w0, w2
	udiv	w0, w0, w2
	mul	w0, w0, w2
	bgt	.L470
	ccmp	w0, w6, 0, ne
	ble	.L438
.L441:
	ldrsh	w1, [x10, 40]
	cmp	w12, w0
	csel	w0, w0, w13, hi
	add	w5, w11, 1
	udiv	w1, w1, w2
	mul	w1, w1, w2
	cmp	w1, w0
	csel	w1, w1, wzr, le
	cmp	w5, 252
	bgt	.L471
	udiv	w7, w1, w21
	sxtw	x3, w11
	mov	w11, w5
	mov	w8, 0
	add	x3, x3, 6
	add	w4, w4, 1
	lsl	x3, x3, 3
	udiv	w5, w0, w21
	msub	w1, w7, w21, w1
	bfi	w8, w1, 0, 9
	mov	w1, 0
	bfi	w1, w7, 0, 9
	strh	w8, [x29, 76]
	strh	w1, [x29, 78]
	mov	w1, 0
	msub	w0, w5, w21, w0
	bfi	w1, w0, 0, 9
	mov	w0, 0
	bfi	w0, w5, 0, 9
	ldr	w5, [x29, 76]
	str	w5, [x20, x3]
	add	x3, x3, 4
	strh	w1, [x29, 76]
	strh	w0, [x29, 78]
	ldr	w0, [x29, 76]
	str	w0, [x20, x3]
	ldr	w8, [x19, 840]
	cmp	w4, w8
	blt	.L447
.L468:
	ldr	w0, [x19, 856]
	cmp	w0, 1
	bne	.L472
	.p2align 2
.L448:
	strh	wzr, [x29, 72]
	sub	w21, w21, #1
	strh	wzr, [x29, 74]
	mov	w2, 0
	sub	w22, w22, #1
	mov	w1, 0
	ldr	w3, [x29, 72]
	bfi	w2, w21, 0, 9
	bfi	w1, w22, 0, 9
	strh	w2, [x29, 72]
	strh	w1, [x29, 74]
	mov	w11, 0
	str	w0, [x19, 840]
	str	w3, [x20, 48]
	ldr	w0, [x29, 72]
	str	w0, [x20, 52]
	b	.L449
	.p2align 3
.L429:
	madd	w0, w0, w1, w3
	mov	w23, 10
	b	.L450
	.p2align 3
.L465:
	adds	w3, w2, 511
	add	w2, w2, 1022
	csel	w2, w2, w3, mi
	add	w4, w0, 126
	and	w2, w2, -512
	cmp	w2, wzr
	add	w3, w2, 63
	csel	w2, w3, w2, lt
	adds	w6, w0, 63
	csel	w3, w4, w6, mi
	asr	w2, w2, 6
	asr	w3, w3, 6
	lsl	w2, w2, 1
	lsl	w3, w3, 5
	mul	w3, w2, w3
	b	.L428
	.p2align 3
.L466:
	add	w22, w22, w22, lsr 31
	asr	w22, w22, 1
	b	.L431
	.p2align 3
.L442:
	udiv	w0, w0, w2
	ldrsh	w1, [x5, 44]
	udiv	w1, w1, w2
	mul	w0, w0, w2
	mul	w1, w1, w2
	cmp	w0, w1
	add	w14, w1, 1
	bhi	.L443
	sub	w1, w4, #1
	cmp	w0, w14
	add	x1, x19, x1, sxtw 2
	beq	.L443
	ldrsh	w1, [x1, 42]
	sub	w1, w1, #1
	add	w1, w1, w2
	udiv	w1, w1, w2
	mul	w1, w1, w2
	cmp	w0, w1
	bhi	.L441
.L443:
	cmp	w7, 199
	mov	w4, w3
	bgt	.L473
	ldrsh	w1, [x5, 46]
.L439:
	add	w3, w4, 1
	add	x5, x19, x4, sxtw 2
	cmp	w8, w3
	add	w0, w9, w1
	add	w7, w3, 1
	bgt	.L442
	udiv	w0, w0, w2
	mul	w0, w0, w2
	b	.L441
.L454:
	mov	w2, 4
	b	.L433
	.p2align 3
.L473:
	add	x0, x19, x3, sxtw 2
	ldrsh	w0, [x0, 42]
	sub	w0, w0, #1
	add	w0, w0, w2
	udiv	w0, w0, w2
	mul	w0, w0, w2
	b	.L441
.L469:
	ldr	x2, .LC187
	mov	w3, 2130
	ldr	x1, .LC194
	mov	w0, 0
	add	x2, x2, 304
	bl	dprint_vfmw
.L462:
	mov	w11, 0
	ldr	w0, [x19, 856]
	b	.L432
.L453:
	mov	w2, 2
	b	.L433
.L471:
	mov	w0, 1
	str	w0, [x19, 856]
	b	.L448
.L464:
	ldr	x1, .LC190
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L461
.L463:
	ldr	x2, .LC187
	mov	w0, 0
	ldr	x3, .LC186
	ldr	x1, .LC188
	add	x2, x2, 272
	bl	dprint_vfmw
	mov	w0, -1
	b	.L461
	.size	VDMHAL_V400R003_CfgRpMsg, .-VDMHAL_V400R003_CfgRpMsg
	.align	3
.LC186:
	.xword	.LC185
	.align	3
.LC187:
	.xword	.LANCHOR1
	.align	3
.LC188:
	.xword	.LC6
	.align	3
.LC190:
	.xword	.LC189
	.align	3
.LC192:
	.xword	.LC191
	.align	3
.LC194:
	.xword	.LC193
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CfgRpReg
	.type	VDMHAL_V400R003_CfgRpReg, %function
VDMHAL_V400R003_CfgRpReg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x0, x30
	mov	w21, w3
	mov	x22, x1
	mov	x20, x4
	bl	_mcount
	str	wzr, [x29, 60]
	cmp	w21, wzr
	bgt	.L500
	ldr	x0, [x22]
	cbz	x0, .L501
.L477:
	ldr	x19, .LC198
	ldr	w3, [x22, 64]
	ldrb	w0, [x19]
	and	w3, w3, -16
	str	w3, [x29, 60]
	cmp	w0, 1
	beq	.L502
	mov	x0, x20
	mov	w2, 16
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	mov	w3, 53763
	movk	w3, 0x2000, lsl 16
	str	w3, [x29, 60]
	cmp	w0, 1
	beq	.L503
	mov	x0, x20
	mov	w2, 12
	mov	w1, 2
	mov	w22, 3075
	movk	w22, 0x30, lsl 16
	bl	VDH_Record_RegData
	str	w22, [x29, 60]
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L504
	mov	x0, x20
	mov	w3, w22
	mov	w2, 60
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L505
	mov	x0, x20
	mov	w3, w22
	mov	w2, 64
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L506
	mov	x0, x20
	mov	w3, w22
	mov	w2, 68
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L507
	mov	x0, x20
	mov	w3, w22
	mov	w2, 72
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L508
	mov	x0, x20
	mov	w3, w22
	mov	w2, 76
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L509
	mov	x0, x20
	mov	w3, w22
	mov	w2, 80
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x19]
	cmp	w0, 1
	beq	.L510
	mov	x0, x20
	mov	w3, w22
	mov	w2, 84
	mov	w1, 2
	bl	VDH_Record_RegData
	mov	w0, 0
.L497:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L502:
	sxtw	x1, w21
	ldr	x2, .LC199
	lsl	x0, x1, 6
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x4, x0, x1
	add	x0, x0, x4, lsl 2
	ldr	x0, [x2, x0]
	str	w3, [x0, 16]
.L480:
	lsl	x0, x1, 6
	mov	w4, 53763
	sub	x0, x0, x1
	movk	w4, 0x2000, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 12]
.L482:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 60]
.L484:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 64]
.L486:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 68]
.L488:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 72]
.L490:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 76]
.L492:
	lsl	x0, x1, 6
	mov	w4, 3075
	sub	x0, x0, x1
	movk	w4, 0x30, lsl 16
	lsl	x0, x0, 2
	sub	x3, x0, x1
	add	x0, x0, x3, lsl 2
	ldr	x0, [x2, x0]
	str	w4, [x0, 80]
.L494:
	lsl	x3, x1, 6
	mov	w4, 3075
	sub	x3, x3, x1
	movk	w4, 0x30, lsl 16
	lsl	x3, x3, 2
	mov	w0, 0
	sub	x1, x3, x1
	add	x1, x3, x1, lsl 2
	ldr	x1, [x2, x1]
	str	w4, [x1, 84]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L501:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L478
	str	x0, [x22]
	b	.L477
	.p2align 3
.L500:
	ldr	x2, .LC195
	mov	w4, 0
	ldr	x1, .LC196
	mov	w3, w21
	add	x2, x2, 328
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L497
.L478:
	ldr	x1, .LC197
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L497
.L507:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L488
.L506:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L486
.L505:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L484
.L504:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L482
.L509:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L492
.L508:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L490
.L510:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L494
.L503:
	ldr	x2, .LC199
	sxtw	x1, w21
	b	.L480
	.size	VDMHAL_V400R003_CfgRpReg, .-VDMHAL_V400R003_CfgRpReg
	.align	3
.LC195:
	.xword	.LANCHOR1
	.align	3
.LC196:
	.xword	.LC74
	.align	3
.LC197:
	.xword	.LC108
	.align	3
.LC198:
	.xword	g_HalDisable
	.align	3
.LC199:
	.xword	g_HwMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_MakeDecReport
	.type	VDMHAL_V400R003_MakeDecReport, %function
VDMHAL_V400R003_MakeDecReport:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L541
	ldr	x23, [x19, 8]
	ldr	w21, [x19]
	ldr	w22, [x19, 16]
	cbz	x23, .L542
	sxtw	x22, w22
	ldr	x20, .LC208
	lsl	x0, x22, 6
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	ldr	x0, [x20, x0]
	cbz	x0, .L515
	ldr	x2, .LC209
	add	x0, x2, 4
	add	x2, x2, 128
	ldr	w1, [x2, -128]
	cmp	w1, 1
	bne	.L518
	b	.L530
	.p2align 3
.L544:
	cmp	x0, x2
	beq	.L543
.L518:
	ldr	w1, [x0]
	add	x0, x0, 4
	cmp	w1, 1
	bne	.L544
.L530:
	mov	w19, w1
.L516:
	ldr	x3, .LC213
	mov	x2, 816
	mov	w1, 0
	mov	x0, x23
	ldr	x3, [x3, 96]
	blr	x3
	lsl	x0, x22, 6
	lsl	x1, x22, 2
	sub	x0, x0, x22
	sub	x1, x1, x22
	lsl	x0, x0, 2
	lsl	x2, x1, 4
	sub	x3, x0, x22
	sub	x1, x2, x1
	ldr	x4, .LC214
	add	x2, x0, x3, lsl 2
	add	x2, x20, x2
	add	x1, x4, x1, lsl 2
	ldr	w0, [x2, 40]
	str	w0, [x23, 4]
	ldr	w1, [x1, 4]
	ubfx	x0, x1, 17, 2
	cmp	w0, 1
	beq	.L531
	and	w1, w1, 131072
	cmp	w1, wzr
	ccmp	w21, 3, 0, ne
	cset	w1, ne
.L519:
	lsl	x0, x22, 2
	str	w1, [x23]
	sub	x0, x0, x22
	cmp	w21, wzr
	lsl	x1, x0, 4
	ccmp	w21, 15, 4, ne
	sub	x0, x1, x0
	add	x0, x4, x0, lsl 2
	ldr	w2, [x0, 4]
	and	w2, w2, 131071
	str	w2, [x23, 8]
	beq	.L545
.L520:
	cmp	w2, 200
	bhi	.L546
.L522:
	lsl	x0, x22, 6
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	add	x20, x20, x0
	ldr	w21, [x20, 56]
	mov	w0, w21
	bl	MEM_Phy2Vir
	cbz	x0, .L547
	lsl	x3, x22, 2
	ldr	x19, .LC219
	sub	x3, x3, x22
	ldr	w2, [x23, 8]
	mov	x1, x0
	add	x20, x22, x3, lsl 3
	lsl	w2, w2, 2
	add	x0, x19, x20, lsl 7
	bl	VDMHAL_V400R003_ReadMsgSlot
	ldr	w0, [x23, 8]
	cbz	w0, .L527
	sub	w2, w0, #1
	mov	x5, 18
	add	x1, x23, 14
	mov	w0, 2
	add	x5, x5, x2, uxtw 2
	lsl	x3, x20, 5
	add	x5, x23, x5
	.p2align 2
.L526:
	sub	w2, w0, #1
	add	x4, x3, x0, uxtw
	add	x2, x3, x2
	add	w0, w0, 4
	ldr	w2, [x19, x2, lsl 2]
	strh	w2, [x1, -2]
	ldr	w2, [x19, x4, lsl 2]
	strh	w2, [x1], 4
	cmp	x5, x1
	bne	.L526
.L527:
	mov	w0, 6
	bl	IsDprintTypeEnable
	cbnz	w0, .L548
.L513:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L545:
	cmp	w19, 1
	beq	.L549
	ldr	x1, .LC215
	ldrb	w1, [x1]
	cbnz	w1, .L520
	ldrb	w0, [x0, 19]
	and	w0, w0, 3
	cmp	w0, 2
	bne	.L520
	mov	w0, 1
	strh	wzr, [x23, 12]
	str	w0, [x23, 8]
	mov	w0, 0
	strh	wzr, [x23, 14]
	b	.L513
	.p2align 3
.L543:
	mov	w19, 0
	b	.L516
	.p2align 3
.L548:
	ldr	x1, .LC221
	mov	w0, 6
	ldr	w2, [x23, 8]
	mov	w20, 0
	bl	dprint_vfmw
	mov	w2, w21
	ldr	x1, .LC223
	lsl	x21, x22, 2
	mov	w0, 6
	sub	x21, x21, x22
	bl	dprint_vfmw
	ldr	x24, .LC225
	add	x21, x22, x21, lsl 3
	lsl	x21, x21, 5
	.p2align 2
.L528:
	add	w1, w20, 3
	add	w3, w20, 2
	add	w0, w20, 1
	add	x7, x21, x20, uxtw
	add	x1, x21, x1
	add	x3, x21, x3
	add	x0, x21, x0
	mov	w2, w20
	add	w20, w20, 4
	ldr	w6, [x19, x1, lsl 2]
	mov	x1, x24
	ldr	w5, [x19, x3, lsl 2]
	ldr	w4, [x19, x0, lsl 2]
	mov	w0, 6
	ldr	w3, [x19, x7, lsl 2]
	bl	dprint_vfmw
	ldr	w0, [x23, 8]
	lsl	w0, w0, 2
	sub	w0, w0, #3
	cmp	w0, w20
	bhi	.L528
	ldr	x1, .LC227
	mov	w0, 6
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L531:
	mov	w1, 0
	b	.L519
	.p2align 3
.L546:
	ldr	x1, .LC217
	mov	w3, 200
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x23, 8]
	b	.L522
	.p2align 3
.L549:
	ldr	w0, [x0, 16]
	ubfx	x0, x0, 21, 2
	cmp	w0, 2
	bne	.L520
	strh	wzr, [x23, 12]
	mov	w0, 0
	strh	wzr, [x23, 14]
	str	w19, [x23, 8]
	b	.L513
.L547:
	ldr	x2, .LC204
	ldr	x3, .LC218
	ldr	x1, .LC205
	add	x2, x2, 360
	bl	dprint_vfmw
	mov	w0, -1
	b	.L513
.L515:
	ldr	x2, .LC204
	ldr	x3, .LC210
.L539:
	ldr	x1, .LC205
	mov	w0, 0
	add	x2, x2, 360
	bl	dprint_vfmw
	mov	w0, -1
	b	.L513
.L542:
	ldr	x2, .LC204
	ldr	x3, .LC207
	b	.L539
.L541:
	ldr	x2, .LC204
	ldr	x3, .LC203
	b	.L539
	.size	VDMHAL_V400R003_MakeDecReport, .-VDMHAL_V400R003_MakeDecReport
	.align	3
.LC203:
	.xword	.LC202
	.align	3
.LC204:
	.xword	.LANCHOR1
	.align	3
.LC205:
	.xword	.LC6
	.align	3
.LC207:
	.xword	.LC206
	.align	3
.LC208:
	.xword	g_HwMem
	.align	3
.LC209:
	.xword	g_DSPState
	.align	3
.LC210:
	.xword	.LC146
	.align	3
.LC213:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC214:
	.xword	g_BackUp
	.align	3
.LC215:
	.xword	g_not_allow_H264FullPictureRepair_flag
	.align	3
.LC217:
	.xword	.LC216
	.align	3
.LC218:
	.xword	.LC174
	.align	3
.LC219:
	.xword	g_UpMsg
	.align	3
.LC221:
	.xword	.LC220
	.align	3
.LC223:
	.xword	.LC222
	.align	3
.LC225:
	.xword	.LC224
	.align	3
.LC227:
	.xword	.LC226
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_PrepareRepair
	.type	VDMHAL_V400R003_PrepareRepair, %function
VDMHAL_V400R003_PrepareRepair:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w22, w0
	mov	x0, x30
	sxtw	x19, w3
	mov	x23, x1
	mov	w26, w2
	mov	x24, x4
	bl	_mcount
	ldr	x25, .LC228
	lsl	x0, x19, 6
	cmp	w19, wzr
	sub	x0, x0, x19
	mov	x21, x19
	lsl	x0, x0, 2
	sub	x20, x0, x19
	add	x20, x0, x20, lsl 2
	add	x27, x20, x25
	bgt	.L561
	ldr	x0, [x20, x25]
	cbz	x0, .L562
	cbz	w26, .L563
.L555:
	cmp	w26, 1
	mov	w20, 0
	beq	.L564
.L552:
	mov	w0, w20
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L562:
	mov	w0, -121438208
	bl	MEM_Phy2Vir
	cbz	x0, .L554
	str	x0, [x20, x25]
	cbnz	w26, .L555
	.p2align 2
.L563:
	lsl	x0, x19, 3
	ldr	x25, .LC233
	sub	x0, x0, x19
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x25, x0, lsl 3
	ldr	w1, [x0, 840]
	cmp	w1, wzr
	ble	.L556
	cmp	w22, 6
	bne	.L557
	ldrb	w1, [x23, 17]
	mov	w2, 0
	cmp	w1, 1
	csel	w1, w1, w2, eq
	str	w1, [x0, 1728]
.L557:
	mov	x4, x24
	mov	w3, w21
	mov	x2, x23
	mov	x1, x27
	mov	w0, w22
	mov	w20, 0
	bl	VDMHAL_V400R003_CfgRpReg
	lsl	x0, x19, 3
	mov	w2, w21
	sub	x0, x0, x19
	mov	x1, x27
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	add	x0, x25, x0, lsl 3
	bl	VDMHAL_V400R003_CfgRpMsg
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L564:
	cmp	w22, 6
	bne	.L559
	ldrb	w0, [x23, 17]
	cmp	w0, 1
	bne	.L559
	lsl	x0, x19, 3
	ldr	x25, .LC233
	sub	x0, x0, x19
	lsl	x0, x0, 3
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	lsl	x19, x19, 3
	add	x0, x25, x19
	ldr	w1, [x0, 1716]
	cmp	w1, wzr
	ble	.L559
	mov	w1, 2
	mov	x4, x24
	mov	w3, w21
	mov	x2, x23
	str	w1, [x0, 1728]
	mov	x1, x27
	mov	w0, w22
	bl	VDMHAL_V400R003_CfgRpReg
	add	x0, x19, 876
	mov	w2, w21
	mov	x1, x27
	add	x0, x25, x0
	bl	VDMHAL_V400R003_CfgRpMsg
	ldr	x27, [sp, 80]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L561:
	ldr	x2, .LC229
	mov	w4, 0
	ldr	x1, .LC230
	mov	w3, w19
	add	x2, x2, 392
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L552
	.p2align 3
.L559:
	ldr	x1, .LC237
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	b	.L552
.L556:
	ldr	x1, .LC235
	mov	w0, 0
	mov	w20, 0
	bl	dprint_vfmw
	b	.L552
.L554:
	ldr	x1, .LC232
	mov	w0, 0
	mov	w20, -1
	bl	dprint_vfmw
	b	.L552
	.size	VDMHAL_V400R003_PrepareRepair, .-VDMHAL_V400R003_PrepareRepair
	.align	3
.LC228:
	.xword	g_HwMem
	.align	3
.LC229:
	.xword	.LANCHOR1
	.align	3
.LC230:
	.xword	.LC74
	.align	3
.LC232:
	.xword	.LC231
	.align	3
.LC233:
	.xword	g_RepairParam
	.align	3
.LC235:
	.xword	.LC234
	.align	3
.LC237:
	.xword	.LC236
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_StartHwRepair
	.type	VDMHAL_V400R003_StartHwRepair, %function
VDMHAL_V400R003_StartHwRepair:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	sxtw	x20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC238
	ldrb	w4, [x21]
	cmp	w4, 1
	bne	.L589
	cmp	w20, wzr
	ble	.L590
	ldr	x22, .LC240
	mov	w3, w20
	ldr	x23, .LC241
	mov	w0, 32
	add	x2, x22, 424
	mov	x1, x23
	bl	dprint_vfmw
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L573
	mov	x0, x19
	mov	w3, -2
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L586
.L568:
	cbz	x19, .L591
.L582:
	ldr	x1, .LC244
	sbfiz	x0, x20, 6, 32
	mov	w2, 1
	str	w2, [x19, 4]
	add	x1, x1, x0
	mov	x0, x19
	ldr	w1, [x1, 8]
	str	w1, [x19, 8]
	strb	w20, [x19]
	strb	w2, [x19, 2]
	bl	VDH_PostTask
.L565:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L590:
	sxtw	x0, w20
	ldr	x3, .LC239
	lsl	x1, x0, 6
	mov	w4, 67108864
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x2, x1, x0
	add	x1, x1, x2, lsl 2
	ldr	x1, [x3, x1]
	str	w4, [x1, 8]
.L571:
	lsl	x1, x0, 6
	mov	w2, -2
	sub	x1, x1, x0
	lsl	x1, x1, 2
	sub	x0, x1, x0
	add	x0, x1, x0, lsl 2
	ldr	x0, [x3, x0]
	str	w2, [x0, 36]
.L569:
	ldr	x0, .LC245
	ldr	x0, [x0, 224]
	blr	x0
	cmp	w20, wzr
	ble	.L585
	ldr	x22, .LC240
	ldr	x23, .LC241
.L578:
	add	x22, x22, 440
	mov	w3, w20
	mov	x2, x22
	mov	x1, x23
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	mov	w3, w20
	mov	x2, x22
	mov	x1, x23
	mov	w4, 1
	mov	w0, 32
	bl	dprint_vfmw
	mov	w4, 1
	mov	w3, w20
	mov	x2, x22
	mov	x1, x23
	mov	w0, 32
	bl	dprint_vfmw
	b	.L565
	.p2align 3
.L567:
	cmp	w20, wzr
	ble	.L583
	ldr	x22, .LC240
	ldr	x23, .LC241
.L573:
	mov	w4, 1
	mov	w3, w20
	add	x2, x22, 424
	mov	x1, x23
	mov	w0, 32
	bl	dprint_vfmw
	ldrb	w0, [x21]
	cmp	w0, 1
	bne	.L568
.L586:
	ldr	x0, .LC245
	ldr	x0, [x0, 224]
	blr	x0
	b	.L578
	.p2align 3
.L589:
	mov	x0, x19
	mov	w3, 67108864
	mov	w2, 8
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L567
	mov	x0, x19
	mov	w3, -2
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L569
	cbnz	x19, .L582
.L591:
	ldr	x2, .LC240
	mov	x3, 0
	ldr	x1, .LC243
	mov	w0, 0
	add	x2, x2, 440
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L585:
	lsl	x0, x20, 6
	ldr	x1, .LC239
	sub	x0, x0, x20
	mov	w3, 1
	lsl	x0, x0, 2
	sub	x20, x0, x20
	add	x0, x0, x20, lsl 2
	ldr	x2, [x1, x0]
	str	wzr, [x2]
	ldr	x2, [x1, x0]
	str	w3, [x2]
	ldr	x0, [x1, x0]
	str	wzr, [x0]
	b	.L565
.L583:
	ldr	x3, .LC239
	sxtw	x0, w20
	b	.L571
	.size	VDMHAL_V400R003_StartHwRepair, .-VDMHAL_V400R003_StartHwRepair
	.align	3
.LC238:
	.xword	g_HalDisable
	.align	3
.LC239:
	.xword	g_HwMem
	.align	3
.LC240:
	.xword	.LANCHOR1
	.align	3
.LC241:
	.xword	.LC88
	.align	3
.LC243:
	.xword	.LC242
	.align	3
.LC244:
	.xword	g_VdmDrvParam
	.align	3
.LC245:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_CalVdhClkSkip
	.type	VDMHAL_V400R003_CalVdhClkSkip, %function
VDMHAL_V400R003_CalVdhClkSkip:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x0, x30
	bl	_mcount
	ldr	x21, .LC247
	ldr	w28, [x21, 128]
	tbnz	w28, #31, .L620
	ldr	x24, .LC250
	add	x19, x21, 132
	ldr	x23, .LC253
	add	x21, x21, 256
	ldr	x22, .LC254
	mov	w20, 30
	ldr	x25, .LC255
	mov	w27, 0
	ldr	x26, .LC252
	add	x24, x24, 472
	.p2align 2
.L595:
	mov	w0, w28
	bl	VCTRL_IsChanActive
	cbnz	w0, .L621
	ldr	x2, [x23, w28, sxtw 3]
	mov	w0, w28
	ldr	x3, [x22, w28, sxtw 3]
	ldp	w1, w2, [x2, 28]
	ldr	w4, [x3, 1520]
	adds	w3, w1, 15
	add	w1, w1, 30
	csel	w1, w1, w3, mi
	add	w3, w2, 30
	adds	w2, w2, 15
	asr	w27, w1, 4
	csel	w2, w3, w2, mi
	cmp	w4, 31
	csel	w20, w20, w4, lt
	asr	w28, w2, 4
	bl	VCTRL_GetVidStd
	cmp	w0, 17
	bls	.L622
.L616:
	cmp	x21, x19
	mov	w27, 0
	bne	.L613
.L623:
	lsl	w0, w27, 2
	mov	w3, 23813
	sub	w27, w0, w27
	movk	w3, 0xdb4f, lsl 16
	lsl	w1, w27, 6
	mov	w0, 32
	mov	w2, 25
	umull	x1, w1, w3
	ldp	x19, x20, [sp, 16]
	lsr	x1, x1, 53
	sub	w0, w0, w1
	cmp	w0, w2
	csel	w0, w0, w2, le
	cmp	w0, wzr
	csel	w0, w0, wzr, ge
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L622:
	ldrb	w0, [x25,w0,uxtw]
	adr	x1, .Lrtx600
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx600:
	.section	.rodata
	.align	0
	.align	2
.L600:
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L616 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L616 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L616 - .Lrtx600) / 4
	.byte	(.L610 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.byte	(.L609 - .Lrtx600) / 4
	.text
	.p2align 3
.L609:
	mul	w27, w27, w28
	mul	w27, w27, w20
.L597:
	cmp	x21, x19
	beq	.L623
.L613:
	ldr	w28, [x19], 4
	tbz	w28, #31, .L595
	lsl	w1, w27, 2
	mov	w0, 23813
	sub	w27, w1, w27
	movk	w0, 0xdb4f, lsl 16
	lsl	w27, w27, 6
	mov	w1, 32
	mov	w2, 25
	umull	x0, w27, w0
	lsr	x0, x0, 53
	sub	w0, w1, w0
	cmp	w0, w2
	csel	w0, w0, w2, le
	cmp	w0, wzr
	csel	w0, w0, wzr, ge
.L593:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L610:
	mul	w27, w27, w28
	mul	w27, w27, w20
	lsl	w27, w27, 1
	b	.L597
	.p2align 3
.L621:
	mov	w3, w28
	mov	x2, x24
	mov	x1, x26
	mov	w0, 1
	bl	dprint_vfmw
	b	.L597
.L620:
	mov	w0, 25
	b	.L593
	.size	VDMHAL_V400R003_CalVdhClkSkip, .-VDMHAL_V400R003_CalVdhClkSkip
	.align	3
.LC247:
	.xword	g_ChanCtx
	.align	3
.LC250:
	.xword	.LANCHOR1
	.align	3
.LC252:
	.xword	.LC251
	.align	3
.LC253:
	.xword	s_pFspInst
	.align	3
.LC254:
	.xword	s_pstVfmwChan
	.align	3
.LC255:
	.xword	.L600
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GetVdmClk
	.type	VDMHAL_V400R003_GetVdmClk, %function
VDMHAL_V400R003_GetVdmClk:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 3
	bls	.L632
.L625:
	ldr	x0, .LC258
	sbfiz	x19, x19, 6, 32
	mov	w1, 500
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L632:
	ldr	x0, .LC257
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx627
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx627:
	.section	.rodata
	.align	0
	.align	2
.L627:
	.byte	(.L625 - .Lrtx627) / 4
	.byte	(.L628 - .Lrtx627) / 4
	.byte	(.L629 - .Lrtx627) / 4
	.byte	(.L630 - .Lrtx627) / 4
	.text
	.p2align 3
.L629:
	ldr	x0, .LC258
	sbfiz	x19, x19, 6, 32
	mov	w1, 100
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L628:
	ldr	x0, .LC258
	sbfiz	x19, x19, 6, 32
	mov	w1, 540
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L630:
	ldr	x0, .LC258
	sbfiz	x19, x19, 6, 32
	mov	w1, 600
	add	x19, x0, x19
	mov	w0, w1
	str	w1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VDMHAL_V400R003_GetVdmClk, .-VDMHAL_V400R003_GetVdmClk
	.align	3
.LC257:
	.xword	.L627
	.align	3
.LC258:
	.xword	g_VdmDrvParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_StartHwDecode
	.type	VDMHAL_V400R003_StartHwDecode, %function
VDMHAL_V400R003_StartHwDecode:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cmp	w20, wzr
	ble	.L634
	ldr	x2, .LC259
	mov	w4, 0
	ldr	x1, .LC260
	mov	w3, w20
	add	x2, x2, 504
	mov	w0, 0
	bl	dprint_vfmw
.L633:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L634:
	ldr	x21, .LC261
	ldrb	w0, [x21]
	cmp	w0, 1
	bne	.L669
	ldr	x1, .LC264
	ldr	x2, [x1]
	ldr	w0, [x2, 120]
	ubfx	x3, x0, 8, 2
	cbz	w3, .L639
	and	w0, w0, -769
	str	w0, [x2, 120]
.L639:
	ldr	x25, .LC262
	sxtw	x22, w20
	ldr	x24, .LC263
	mov	w2, 500
	add	x0, x25, x22, lsl 6
	ldr	w23, [x0, 8]
	str	w2, [x0, 16]
	ldr	x0, [x24, w23, sxtw 3]
	ldr	w26, [x0, 1232]
.L638:
	ldr	x0, [x1]
	ldr	w1, [x0, 120]
	and	w1, w1, -258049
	str	w1, [x0, 120]
	ldr	w1, [x0, 120]
	orr	w1, w1, 131072
	str	w1, [x0, 120]
.L640:
	ldr	x0, [x24, w23, sxtw 3]
	mov	w1, 3
	mov	x3, x19
	mov	w2, w20
	ldr	w0, [x0, 608]
	cmp	w0, 16
	mov	w0, 12
	csel	w1, w1, wzr, ne
	bl	SCD_ConfigReg
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L664
	mov	w1, 2
	mov	x0, x19
	mov	w3, -1431655766
	mov	w2, 156
	bl	VDH_Record_RegData
	ldr	x1, .LC265
	ldrb	w0, [x21]
	ldr	w1, [x1]
	cmp	w1, 1
	beq	.L670
.L644:
	mov	w3, 0
.L643:
	cmp	w0, 1
	beq	.L671
	mov	x0, x19
	mov	w2, 61472
	mov	w1, 2
	bl	VDH_Record_RegData
	cmp	w26, 1
	ldrb	w0, [x21]
	beq	.L672
.L647:
	mov	w3, -2
.L646:
	cmp	w0, 1
	beq	.L673
	mov	x0, x19
	mov	w2, 36
	mov	w1, 2
	bl	VDH_Record_RegData
	ldrb	w0, [x21]
	cmp	w0, 1
	beq	.L674
	cbz	x19, .L675
	mov	w0, 1
	strb	w20, [x19]
	stp	w0, w23, [x19, 4]
	mov	x0, x19
	bl	VDH_PostTask
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L672:
	mov	w3, -6
	b	.L646
	.p2align 3
.L670:
	mov	w3, 7
	b	.L643
	.p2align 3
.L669:
	mov	w2, 0
	mov	w1, 0
	mov	x0, x19
	mov	w3, 0
	sxtw	x22, w20
	bl	VDH_Record_RegData
	ldr	x25, .LC262
	ldr	x24, .LC263
	mov	w1, 500
	add	x0, x25, x22, lsl 6
	ldrb	w2, [x21]
	cmp	w2, 1
	ldr	w23, [x0, 8]
	str	w1, [x0, 16]
	ldr	x0, [x24, w23, sxtw 3]
	ldr	w26, [x0, 1232]
	beq	.L676
	mov	w3, 0
	mov	w2, 1
	mov	w1, 0
	mov	x0, x19
	bl	VDH_Record_RegData
	b	.L640
	.p2align 3
.L664:
	ldr	x2, .LC265
	lsl	x1, x22, 6
	sub	x1, x1, x22
	ldr	x24, .LC266
	lsl	x1, x1, 2
	ldr	w2, [x2]
	cmp	w2, 1
	sub	x2, x1, x22
	add	x1, x1, x2, lsl 2
	mov	w2, -1431655766
	ldr	x1, [x24, x1]
	str	w2, [x1, 156]
	bne	.L644
	mov	w3, 7
	b	.L645
	.p2align 3
.L671:
	ldr	x24, .LC266
.L645:
	lsl	x0, x22, 6
	cmp	w26, 1
	sub	x0, x0, x22
	lsl	x0, x0, 2
	sub	x1, x0, x22
	add	x0, x0, x1, lsl 2
	ldr	x0, [x24, x0]
	add	x0, x0, 61440
	str	w3, [x0, 32]
	beq	.L660
	mov	w0, 1
	b	.L647
	.p2align 3
.L673:
	ldr	x24, .LC266
.L648:
	lsl	x1, x22, 6
	ldr	x19, .LC267
	sub	x1, x1, x22
	mov	x0, 30
	lsl	x1, x1, 2
	sub	x2, x1, x22
	add	x1, x1, x2, lsl 2
	ldr	x1, [x24, x1]
	str	w3, [x1, 36]
	ldr	x1, [x19, 232]
	blr	x1
	ldr	x0, [x19, 224]
	blr	x0
.L651:
	lsl	x0, x22, 6
	mov	w2, 1
	sub	x1, x0, x22
	add	x25, x25, x0
	lsl	x0, x1, 2
	ldr	x3, .LC269
	sub	x22, x0, x22
	mov	w1, 4
	add	x22, x0, x22, lsl 2
	ldr	x0, [x24, x22]
	str	wzr, [x0]
	ldr	x0, [x24, x22]
	str	w2, [x0]
	ldr	x0, [x24, x22]
	str	wzr, [x0]
	ldr	w2, [x25, 8]
	mov	w0, w2
	ldr	w2, [x3, w2, sxtw 2]
	bl	VDEC_Lowdelay_Event_Time
	b	.L633
	.p2align 3
.L675:
	ldr	x2, .LC259
	mov	x3, 0
	ldr	x1, .LC268
	mov	w0, 0
	add	x2, x2, 504
	bl	dprint_vfmw
	b	.L633
	.p2align 3
.L660:
	mov	w3, -6
	b	.L648
.L676:
	ldr	x1, .LC264
	b	.L638
.L674:
	ldr	x19, .LC267
	mov	x0, 30
	ldr	x1, [x19, 232]
	blr	x1
	ldr	x0, [x19, 224]
	blr	x0
	ldr	x24, .LC266
	b	.L651
	.size	VDMHAL_V400R003_StartHwDecode, .-VDMHAL_V400R003_StartHwDecode
	.align	3
.LC259:
	.xword	.LANCHOR1
	.align	3
.LC260:
	.xword	.LC74
	.align	3
.LC261:
	.xword	g_HalDisable
	.align	3
.LC262:
	.xword	g_VdmDrvParam
	.align	3
.LC263:
	.xword	s_pstVfmwChan
	.align	3
.LC264:
	.xword	g_pstRegCrg
	.align	3
.LC265:
	.xword	mask_mmu_err_int
	.align	3
.LC266:
	.xword	g_HwMem
	.align	3
.LC267:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC268:
	.xword	.LC242
	.align	3
.LC269:
	.xword	g_LowDelaySeqIndex
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_GetCharacter
	.type	VDMHAL_V400R003_GetCharacter, %function
VDMHAL_V400R003_GetCharacter:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC270
	mov	w3, 15
	ldr	x0, .LC271
	mov	w1, 4
	str	w3, [x2]
	str	w1, [x0]
	ldp	x29, x30, [sp], 16
	ret
	.size	VDMHAL_V400R003_GetCharacter, .-VDMHAL_V400R003_GetCharacter
	.align	3
.LC270:
	.xword	g_VdmCharacter
	.align	3
.LC271:
	.xword	g_eVdmVersion
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VDMHAL_V400R003_WriteBigTitle1DYuv
	.type	VDMHAL_V400R003_WriteBigTitle1DYuv, %function
VDMHAL_V400R003_WriteBigTitle1DYuv:
	stp	x29, x30, [sp, -208]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x0, [x29, 112]
	mov	x0, x30
	mov	w21, w3
	mov	x22, x1
	mov	w19, w2
	str	w4, [x29, 108]
	bl	_mcount
	ubfx	x0, x21, 29, 2
	stp	xzr, xzr, [x29, 144]
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x29, 192]
	cmp	w0, 1
	beq	.L722
	mov	w20, 2
	cmp	w0, w20
	csinc	w20, w20, wzr, ne
.L679:
	ldr	x0, [x29, 112]
	cbz	x0, .L678
	ldr	x0, .LC273
	mov	w4, 0
	add	x3, x29, 144
	mov	w2, 4194304
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L682
	ldr	x0, .LC277
	mov	w4, 0
	add	x3, x29, 176
	mov	w2, 4194304
	mov	w1, 0
	bl	MEM_AllocMemBlock
	cbnz	w0, .L682
	add	w19, w19, 15
	add	w21, w21, 15
	and	w19, w19, -16
	and	w0, w21, -16
	add	w1, w19, 255
	mov	w3, w0
	and	w1, w1, -256
	add	w0, w0, 62
	lsl	w1, w1, 4
	ldr	x25, [x29, 184]
	mov	w2, w1
	adds	w1, w3, 31
	csel	w0, w0, w1, mi
	add	w21, w2, 15
	cmp	w2, wzr
	asr	w0, w0, 5
	csel	w21, w21, w2, lt
	cmp	w20, wzr
	asr	w21, w21, 4
	ccmp	w20, 3, 4, ne
	stp	w2, w3, [x29, 124]
	mul	w21, w0, w21
	add	x21, x22, x21, sxtw
	bne	.L683
	lsr	w1, w3, 1
	lsr	w0, w19, 1
	str	w1, [x29, 120]
	add	x1, x25, 2097152
	str	w0, [x29, 104]
	str	x1, [x29, 136]
	ldr	x28, .LC278
	ldr	x20, [x29, 152]
	cbz	w3, .L685
	mov	w27, 0
	str	wzr, [x29, 132]
	.p2align 2
.L684:
	cbz	w19, .L687
	ldr	w0, [x29, 124]
	lsr	w23, w27, 4
	ldr	w24, [x29, 132]
	mov	w26, 0
	mul	w0, w23, w0
	ubfiz	x23, x27, 8, 4
	add	x23, x0, x23
	.p2align 2
.L686:
	lsr	w1, w26, 8
	add	x0, x24, x26, uxtw
	ubfiz	x1, x1, 12, 20
	ldr	x5, [x28, 104]
	add	x1, x1, x23
	mov	x2, 256
	add	x1, x22, x1
	add	x0, x20, x0
	add	w26, w26, 256
	blr	x5
	cmp	w19, w26
	bhi	.L686
.L687:
	ldr	w0, [x29, 132]
	add	w27, w27, 1
	add	w0, w0, w19
	str	w0, [x29, 132]
	ldr	w0, [x29, 128]
	cmp	w0, w27
	bne	.L684
.L685:
	ldr	w0, [x29, 128]
	ldr	x3, [x28, 88]
	ldr	x2, [x29, 112]
	mul	w1, w19, w0
	mov	x0, x20
	blr	x3
	ldr	w0, [x29, 120]
	cbz	w0, .L777
	ldr	w1, [x29, 124]
	mov	w26, 0
	mov	w24, 0
	asr	w0, w1, 1
	str	w0, [x29, 132]
	.p2align 2
.L691:
	cbz	w19, .L693
	ldr	w0, [x29, 132]
	lsr	w22, w24, 3
	uxtw	x23, w26
	mov	w27, 0
	mul	w0, w22, w0
	ubfiz	x22, x24, 8, 3
	add	x22, x0, x22
	.p2align 2
.L690:
	lsr	w1, w27, 8
	add	x0, x23, x27, uxtw
	ubfiz	x1, x1, 11, 21
	ldr	x5, [x28, 104]
	add	x1, x1, x22
	mov	x2, 256
	add	x1, x21, x1
	add	x0, x20, x0
	add	w27, w27, 256
	blr	x5
	cmp	w19, w27
	bhi	.L690
.L693:
	ldr	w0, [x29, 120]
	add	w24, w24, 1
	add	w26, w26, w19
	cmp	w0, w24
	bne	.L691
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L778
.L719:
	ldr	w0, [x29, 108]
	cbnz	w0, .L696
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	ldr	x0, [x29, 136]
	mov	w1, 128
	blr	x3
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	mov	w1, 128
	mov	x0, x25
	blr	x3
.L696:
	ldr	w0, [x29, 104]
	ldr	w1, [x29, 120]
.L772:
	mul	w19, w0, w1
	ldr	x20, [x29, 112]
	mov	x0, x25
	ldr	x3, [x28, 88]
	mov	w1, w19
	mov	x2, x20
	blr	x3
	ldr	x3, [x28, 88]
	mov	x2, x20
	ldr	x0, [x29, 136]
	mov	w1, w19
	blr	x3
	ldr	w0, [x29, 160]
	ldr	x1, [x29, 152]
	bl	MEM_ReleaseMemBlock
	ldr	x3, [x28, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 144
	blr	x3
	ldr	w0, [x29, 192]
	ldr	x1, [x29, 184]
	bl	MEM_ReleaseMemBlock
	ldr	x3, [x28, 96]
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 176
	blr	x3
.L678:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
	.p2align 3
.L682:
	ldr	x1, .LC275
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
	.p2align 3
.L722:
	mov	w20, 0
	b	.L679
.L683:
	cmp	w20, 1
	ldr	w1, [x29, 128]
	cset	w0, ne
	str	w0, [x29, 120]
	cmp	w1, w0
	lsr	w0, w19, 1
	str	w0, [x29, 104]
	lsr	w0, w1, 1
	str	w0, [x29, 132]
	add	x0, x25, 2097152
	str	x0, [x29, 136]
	ldr	x28, .LC278
	ldr	x20, [x29, 152]
	bls	.L701
	ldr	w27, [x29, 120]
	.p2align 2
.L703:
	cbz	w19, .L704
	ldr	w0, [x29, 124]
	lsr	w24, w27, 4
	lsr	w23, w27, 1
	mov	w26, 0
	mul	w0, w24, w0
	mul	w23, w23, w19
	ubfiz	x24, x27, 8, 4
	add	x24, x0, x24
	.p2align 2
.L702:
	lsr	w1, w26, 8
	add	x0, x23, x26, uxtw
	ubfiz	x1, x1, 12, 20
	ldr	x5, [x28, 104]
	add	x1, x1, x24
	mov	x2, 256
	add	x1, x22, x1
	add	x0, x20, x0
	add	w26, w26, 256
	blr	x5
	cmp	w19, w26
	bhi	.L702
.L704:
	ldr	w0, [x29, 128]
	add	w27, w27, 2
	cmp	w0, w27
	bhi	.L703
.L701:
	ldr	w0, [x29, 128]
	ldr	x3, [x28, 88]
	ldr	x2, [x29, 112]
	mul	w1, w19, w0
	mov	x0, x20
	lsr	w1, w1, 1
	blr	x3
	ldr	w0, [x29, 132]
	cbz	w0, .L779
	ldr	w1, [x29, 124]
	mov	w26, 0
	mov	w24, 0
	asr	w0, w1, 1
	str	w0, [x29, 128]
	.p2align 2
.L708:
	cbz	w19, .L710
	ldr	w0, [x29, 128]
	lsr	w22, w24, 3
	uxtw	x23, w26
	mov	w27, 0
	mul	w0, w22, w0
	ubfiz	x22, x24, 8, 3
	add	x22, x0, x22
	.p2align 2
.L707:
	lsr	w1, w27, 8
	add	x0, x23, x27, uxtw
	ubfiz	x1, x1, 11, 21
	ldr	x5, [x28, 104]
	add	x1, x1, x22
	mov	x2, 256
	add	x1, x21, x1
	add	x0, x20, x0
	add	w27, w27, 256
	blr	x5
	cmp	w19, w27
	bhi	.L707
.L710:
	ldr	w0, [x29, 132]
	add	w24, w24, 1
	add	w26, w26, w19
	cmp	w0, w24
	bne	.L708
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L780
	ldr	w0, [x29, 108]
	cbnz	w0, .L713
	ldr	w1, [x29, 120]
	ldr	w0, [x29, 132]
	cmp	w0, w1
	bls	.L716
	.p2align 2
.L717:
	ldr	w0, [x29, 120]
	ldr	w1, [x29, 132]
	add	w0, w0, 2
	str	w0, [x29, 120]
	cmp	w1, w0
	bhi	.L717
.L716:
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	ldr	x0, [x29, 136]
	mov	w1, 128
	blr	x3
	ldr	x3, [x28, 96]
	mov	x2, 1048576
	mov	w1, 128
	mov	x0, x25
	blr	x3
.L713:
	ldr	w0, [x29, 104]
	ldr	w1, [x29, 132]
	b	.L772
.L778:
	mov	w0, 0
	mov	w6, 0
	.p2align 2
.L695:
	ldr	w1, [x29, 104]
	mov	w5, w0
	cbz	w1, .L697
	ldr	w1, [x29, 104]
	add	w5, w1, w0
	mov	w1, 1
	.p2align 2
.L694:
	sub	w3, w1, #1
	uxtw	x2, w0
	ldr	x4, [x29, 136]
	add	w0, w0, 1
	cmp	w0, w5
	ldrb	w3, [x20, x3]
	strb	w3, [x4, x2]
	ldrb	w3, [x20, w1, uxtw]
	add	w1, w1, 2
	strb	w3, [x25, x2]
	bne	.L694
.L697:
	ldr	w0, [x29, 120]
	add	w6, w6, 1
	add	x20, x20, x19
	cmp	w0, w6
	mov	w0, w5
	bne	.L695
	b	.L696
.L780:
	ldr	w0, [x29, 120]
	mov	w7, 0
	mul	w1, w19, w0
	lsl	w0, w19, 1
	add	x20, x20, x1
	.p2align 2
.L712:
	ldr	w3, [x29, 104]
	cbz	w3, .L714
	lsr	w1, w7, 1
	mov	w2, 1
	mul	w1, w1, w3
	add	w6, w3, w1
	.p2align 2
.L711:
	sub	w5, w2, #1
	uxtw	x3, w1
	ldr	x4, [x29, 136]
	add	w1, w1, 1
	cmp	w6, w1
	ldrb	w5, [x20, x5]
	strb	w5, [x4, x3]
	ldrb	w5, [x20, w2, uxtw]
	add	w2, w2, 2
	strb	w5, [x25, x3]
	bne	.L711
.L714:
	ldr	w1, [x29, 132]
	add	w7, w7, 2
	add	x20, x20, x0
	cmp	w1, w7
	bhi	.L712
	b	.L713
.L779:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	beq	.L713
	ldr	w0, [x29, 108]
	cbz	w0, .L716
	b	.L713
.L777:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	bne	.L719
	b	.L696
	.size	VDMHAL_V400R003_WriteBigTitle1DYuv, .-VDMHAL_V400R003_WriteBigTitle1DYuv
	.align	3
.LC273:
	.xword	.LC272
	.align	3
.LC275:
	.xword	.LC274
	.align	3
.LC277:
	.xword	.LC276
	.align	3
.LC278:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CRG_ConfigReg
	.type	CRG_ConfigReg, %function
CRG_ConfigReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	ldr	x0, .LC279
	ldrb	w0, [x0]
	cmp	w0, 1
	bne	.L788
	cbnz	w19, .L784
	ldr	x0, .LC280
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	ubfx	x2, x0, 8, 2
	cmp	w20, w2
	beq	.L781
	bfi	w0, w20, 8, 2
	str	w0, [x1, 120]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L784:
	cmp	w19, 1
	beq	.L789
.L781:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L788:
	mov	w3, w20
	mov	w2, w19
	mov	x0, x21
	mov	w1, 0
	bl	VDH_Record_RegData
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L789:
	ldr	x0, .LC280
	ldr	x1, [x0]
	ldr	w0, [x1, 120]
	bfi	w0, w20, 12, 5
	and	w0, w0, -131073
	str	w0, [x1, 120]
	ldr	w0, [x1, 120]
	orr	w0, w0, 131072
	str	w0, [x1, 120]
	b	.L781
	.size	CRG_ConfigReg, .-CRG_ConfigReg
	.align	3
.LC279:
	.xword	g_HalDisable
	.align	3
.LC280:
	.xword	g_pstRegCrg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MFDE_ConfigReg
	.type	MFDE_ConfigReg, %function
MFDE_ConfigReg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	uxtw	x20, w0
	mov	x0, x30
	mov	w21, w1
	sxtw	x19, w2
	mov	x22, x3
	bl	_mcount
	ldr	x0, .LC281
	ldrb	w4, [x0]
	cmp	w4, 1
	bne	.L794
	cmp	w19, wzr
	ble	.L795
	ldr	x2, .LC283
	mov	w3, w19
	ldr	x1, .LC284
	mov	w0, 32
	add	x2, x2, 424
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L795:
	lsl	x0, x19, 6
	ldr	x1, .LC282
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x19, x0, x19
	add	x19, x0, x19, lsl 2
	ldr	x0, [x1, x19]
	str	w21, [x0, x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L794:
	mov	w3, w21
	mov	w2, w20
	mov	x0, x22
	mov	w1, 2
	bl	VDH_Record_RegData
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MFDE_ConfigReg, .-MFDE_ConfigReg
	.align	3
.LC281:
	.xword	g_HalDisable
	.align	3
.LC282:
	.xword	g_HwMem
	.align	3
.LC283:
	.xword	.LANCHOR1
	.align	3
.LC284:
	.xword	.LC88
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.54553, %object
	.size	__func__.54553, 24
__func__.54553:
	.string	"VDMHAL_V400R003_OpenHAL"
	.type	__func__.54638, %object
	.size	__func__.54638, 27
__func__.54638:
	.string	"VDMHAL_V400R003_CalcFsSize"
	.zero	5
	.type	__func__.54673, %object
	.size	__func__.54673, 34
__func__.54673:
	.string	"VDMHAL_V400R003_ArrangeMem_Normal"
	.zero	6
	.type	__FUNCTION__.54674, %object
	.size	__FUNCTION__.54674, 34
__FUNCTION__.54674:
	.string	"VDMHAL_V400R003_ArrangeMem_Normal"
	.zero	6
	.type	__func__.54650, %object
	.size	__func__.54650, 35
__func__.54650:
	.string	"VDMHAL_V400R003_FillMemArrangeInfo"
	.zero	5
	.type	__func__.54766, %object
	.size	__func__.54766, 36
__func__.54766:
	.string	"VDMHAL_V400R003_ArrangeMem_Specific"
	.zero	4
	.type	__func__.54789, %object
	.size	__func__.54789, 25
__func__.54789:
	.string	"VDMHAL_V400R003_ResetVdm"
	.zero	7
	.type	__func__.54799, %object
	.size	__func__.54799, 37
__func__.54799:
	.string	"VDMHAL_V400R003_SetSmmuPageTableAddr"
	.zero	3
	.type	__func__.54820, %object
	.size	__func__.54820, 26
__func__.54820:
	.string	"VDMHAL_V400R003_GlbResetX"
	.zero	6
	.type	__func__.54809, %object
	.size	__func__.54809, 25
__func__.54809:
	.string	"VDMHAL_V400R003_GlbReset"
	.zero	7
	.type	__func__.54832, %object
	.size	__func__.54832, 30
__func__.54832:
	.string	"VDMHAL_V400R003_ClearIntState"
	.zero	2
	.type	__func__.54838, %object
	.size	__func__.54838, 33
__func__.54838:
	.string	"VDMHAL_V400R003_ClearMMUIntState"
	.zero	7
	.type	__func__.54844, %object
	.size	__func__.54844, 24
__func__.54844:
	.string	"VDMHAL_V400R003_MaskInt"
	.type	__func__.54857, %object
	.size	__func__.54857, 26
__func__.54857:
	.string	"VDMHAL_V400R003_EnableInt"
	.zero	6
	.type	__func__.54866, %object
	.size	__func__.54866, 25
__func__.54866:
	.string	"VDMHAL_V400R003_CheckReg"
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.54880, %object
	.size	__func__.54880, 28
__func__.54880:
	.string	"VDMHAL_V400R003_ReadMMUMask"
	.zero	4
	.type	__func__.54885, %object
	.size	__func__.54885, 29
__func__.54885:
	.string	"VDMHAL_V400R003_WriteMMUMask"
	.zero	3
	.type	__func__.54916, %object
	.size	__func__.54916, 27
__func__.54916:
	.string	"VDMHAL_V400R003_PrepareDec"
	.zero	5
	.type	__func__.54921, %object
	.size	__func__.54921, 27
__func__.54921:
	.string	"VDMHAL_V400R003_IsVdmReady"
	.zero	5
	.type	__func__.54926, %object
	.size	__func__.54926, 25
__func__.54926:
	.string	"VDMHAL_V400R003_IsVdmRun"
	.zero	7
	.type	__func__.54932, %object
	.size	__func__.54932, 29
__func__.54932:
	.string	"VDMHAL_V400R003_IsVdhDecOver"
	.zero	3
	.type	__func__.54941, %object
	.size	__func__.54941, 33
__func__.54941:
	.string	"VDMHAL_V400R003_IsVdhPartDecOver"
	.zero	7
	.type	__func__.54956, %object
	.size	__func__.54956, 35
__func__.54956:
	.string	"VDMHAL_V400R003_UpdateHardwareInfo"
	.zero	5
	.type	__func__.55029, %object
	.size	__func__.55029, 25
__func__.55029:
	.string	"VDMHAL_V400R003_CfgRpMsg"
	.zero	7
	.type	__func__.55006, %object
	.size	__func__.55006, 24
__func__.55006:
	.string	"VDMHAL_CfgNotFullRepair"
	.type	__func__.55040, %object
	.size	__func__.55040, 25
__func__.55040:
	.string	"VDMHAL_V400R003_CfgRpReg"
	.zero	7
	.type	__func__.55053, %object
	.size	__func__.55053, 30
__func__.55053:
	.string	"VDMHAL_V400R003_MakeDecReport"
	.zero	2
	.type	__func__.55092, %object
	.size	__func__.55092, 30
__func__.55092:
	.string	"VDMHAL_V400R003_PrepareRepair"
	.zero	2
	.type	__func__.55279, %object
	.size	__func__.55279, 15
__func__.55279:
	.string	"MFDE_ConfigReg"
	.zero	1
	.type	__func__.55099, %object
	.size	__func__.55099, 30
__func__.55099:
	.string	"VDMHAL_V400R003_StartHwRepair"
	.zero	2
	.type	__func__.55139, %object
	.size	__func__.55139, 30
__func__.55139:
	.string	"VDMHAL_V400R003_CalVdhClkSkip"
	.zero	2
	.type	__func__.55161, %object
	.size	__func__.55161, 30
__func__.55161:
	.string	"VDMHAL_V400R003_StartHwDecode"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"pOpenParam = NULL error!" )
	.zero	7
.LC6:
	ASCII(.string	"%s: %s\n" )
.LC8:
	ASCII(.string	"MemBaseAddr = 0 error!" )
	.zero	1
.LC10:
	ASCII(.string	"VDMHAL_V400R003_OpenHAL: Size error!" )
	.zero	3
.LC12:
	ASCII(.string	"VdhId is wrong!!!\n" )
	.zero	5
.LC16:
	ASCII(.string	"g_VdmRegVirAddr, g_VdmResetVirAddr = %p\n" )
	.zero	7
.LC18:
	ASCII(.string	"BPDRegVirAddr %p\n" )
	.zero	6
.LC20:
	ASCII(.string	"!!!!!! HAL memory not enouph! need %d, have %d\n" )
.LC22:
	ASCII(.string	"image size out of range" )
.LC29:
	ASCII(.string	"VDMHAL ArrangeMem HEVC 10 bit\n" )
	.zero	1
.LC31:
	ASCII(.string	"VidStd Invalid" )
	.zero	1
.LC36:
	ASCII(.string	"VDMHAL_V400R003_CalcFsSize err!\n" )
	.zero	7
.LC38:
	ASCII(.string	"%s, need arrange, Size: %#x, Num: %#x, RefChanged: %#x\n" )
.LC40:
	ASCII(.string	"DelAllFrameMemRecord err in VDMHAL_V400R003_ArrangeMem!\n" )
	.zero	7
.LC45:
	ASCII(.string	"DFS, report event. Size: 0x%x, Num: %d, RefChanged: %d\n" )
.LC47:
	ASCII(.string	"pVdmMemArrange is NULL" )
	.zero	1
.LC49:
	ASCII(.string	"DFS, no ref frame!\n" )
	.zero	4
.LC51:
	ASCII(.string	"DFS, Frame number = %d > 30, Then, Frame num = 30, \n" )
	.zero	3
.LC53:
	ASCII(.string	"VDMHAL_V400R003_ArrangeMem Mem addr is NULL" )
	.zero	4
.LC58:
	ASCII(.string	"'pVdmMemArrange' is NULL" )
	.zero	7
.LC62:
	ASCII(.string	"MemSize not enough for pmv slot" )
.LC65:
	ASCII(.string	"VDMHAL_V200R003_ArrangeMem get ChanWidth/ChanHeight failed!\n" )
	.zero	3
.LC67:
	ASCII(.string	"ImgSlotLen > ChanSlotLen" )
	.zero	7
.LC70:
	ASCII(.string	"cann't allocate img slot" )
	.zero	7
.LC74:
	ASCII(.string	"%s: VdhId(%d) > %d\n" )
	.zero	4
.LC76:
	ASCII(.string	"VDMHAL_V400R003_ResetVdm: map vdm register fail, vir(reg) = (%p)\n" )
	.zero	6
.LC81:
	ASCII(.string	"%s module id %d failed!\n" )
	.zero	7
.LC83:
	ASCII(.string	"%s module id %d success!\n" )
	.zero	6
.LC88:
	ASCII(.string	"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC93:
	ASCII(.string	"%s: map vdm register 0x%x failed!\n" )
	.zero	5
.LC97:
	ASCII(.string	"%s VdhId %d failed!\n" )
	.zero	3
.LC99:
	ASCII(.string	"%s VdhId %d success!\n" )
	.zero	2
.LC108:
	ASCII(.string	"vdm register virtual address not mapped, reset failed!\n" )
.LC125:
	ASCII(.string	"%s: VdhId(%d) Invalid!\n" )
.LC128:
	ASCII(.string	"%s: vdm register virtual address not mapped, reset failed!\n" )
	.zero	4
.LC130:
	ASCII(.string	"%s: unkown reg_id = %d\n" )
.LC135:
	ASCII(.string	"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n" )
	.zero	3
.LC141:
	ASCII(.string	"%s: pDecParam(%p) = NULL\n" )
	.zero	6
.LC146:
	ASCII(.string	"VDM register not mapped yet!" )
	.zero	3
.LC152:
	ASCII(.string	"VDM register not mapped yet!\n" )
	.zero	2
.LC174:
	ASCII(.string	"can NOT map vir addr for up-msg" )
.LC177:
	ASCII(.string	"ReadUpMsgSlot error! pDst=%p, pSrc=%p\n" )
	.zero	1
.LC179:
	ASCII(.string	"ReadUpMsgSlot error! upmsg_size(%d) > 512\n" )
	.zero	5
.LC182:
	ASCII(.string	"WriteMsgSlot error!\n" )
	.zero	3
.LC185:
	ASCII(.string	"can not map repair msg virtual address!" )
.LC189:
	ASCII(.string	"ValidGroupNum=%d out of range!\n" )
.LC191:
	ASCII(.string	"align_mb error\n" )
.LC193:
	ASCII(.string	"[%s][%d]sclie_num is wrong! %d \n" )
	.zero	7
.LC202:
	ASCII(.string	"'pMakeDecReport' is NULL" )
	.zero	7
.LC206:
	ASCII(.string	"'pDecReport' is NULL" )
	.zero	3
.LC216:
	ASCII(.string	"pDecReport->DecSliceNum(%d) > %d, set to 0 for full repair.\n" )
	.zero	3
.LC220:
	ASCII(.string	"\n***** UpMsg DecSliceNum=%d\n" )
	.zero	3
.LC222:
	ASCII(.string	"\n***** Up Msg (phy addr: %#8x) *****\n" )
	.zero	2
.LC224:
	ASCII(.string	"\n0x%02x 0x%08x 0x%08x 0x%08x 0x%08x\n" )
	.zero	3
.LC226:
	ASCII(.string	"\n***** Up Msg print finished *****\n" )
	.zero	4
.LC231:
	ASCII(.string	"vdm register virtual address not mapped, VDMHAL_V200R003_PrepareRepair failed!\n" )
.LC234:
	ASCII(.string	"FIRST_REPAIR Parameter Error!\n" )
	.zero	1
.LC236:
	ASCII(.string	"SECOND_REPAIR Parameter Error!\n" )
.LC242:
	ASCII(.string	"%s: pMfdeTask(%p) = NULL\n" )
	.zero	6
.LC251:
	ASCII(.string	"%s The channel %d is not active\n" )
	.zero	7
.LC272:
	ASCII(.string	"BigTile1d_y" )
	.zero	4
.LC274:
	ASCII(.string	"failed mem_allocMemBlock BigTile_yuv save!\n" )
	.zero	4
.LC276:
	ASCII(.string	"BigTile1d_uv" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
