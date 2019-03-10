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
	.file	"vdm_hal.c"
	.text
	.align	2
	.type	VDMHAL_CalcPmvSlotLen.isra.0, %function
VDMHAL_CalcPmvSlotLen.isra.0:
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
	ldr	lr, .L10
	ldr	ip, [r1]
	ldr	r3, [r2]
	ldrb	r4, [lr]	@ zero_extendqisi2
	cmp	ip, #45
	cmple	r3, #36
	movle	lr, #64
	movgt	lr, #32
	cmp	r4, #1
	moveq	lr, #64
	cmp	r0, #16
	moveq	lr, r0
	beq	.L4
	cmp	r0, #17
	beq	.L9
.L4:
	mul	r0, ip, lr
	mul	r0, r3, r0
	add	r0, r0, #143
	bic	r0, r0, #127
	ldmfd	sp, {r4, fp, sp, pc}
.L9:
	mov	r0, #144
	mov	ip, #256
	mov	r3, r0
	str	ip, [r1]
	mov	lr, #64
	str	r0, [r2]
	ldr	ip, [r1]
	b	.L4
.L11:
	.align	2
.L10:
	.word	g_not_direct_8x8_inference_flag
	UNWIND(.fnend)
	.size	VDMHAL_CalcPmvSlotLen.isra.0, .-VDMHAL_CalcPmvSlotLen.isra.0
	.align	2
	.global	VDMHAL_V400R003_GetHalMemSize
	.type	VDMHAL_V400R003_GetHalMemSize, %function
VDMHAL_V400R003_GetHalMemSize:
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
	mov	r0, #6291456
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_GetHalMemSize, .-VDMHAL_V400R003_GetHalMemSize
	.align	2
	.global	VDMHAL_V400R003_OpenHAL
	.type	VDMHAL_V400R003_OpenHAL, %function
VDMHAL_V400R003_OpenHAL:
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
	subs	r3, r0, #0
	beq	.L23
	ldmia	r3, {r6, r7}
	ldr	r8, [r3, #8]
	cmp	r6, #0
	beq	.L24
	cmp	r7, #6291456
	blt	.L25
	cmp	r8, #0
	bgt	.L26
	ldr	r4, .L27
	mov	r2, #268
	ldr	r10, .L27+4
	mov	r1, #0
	ldr	r5, .L27+8
	mla	r0, r2, r8, r4
	ldr	r3, [r10, #48]
	blx	r3
	movw	r2, #1228
	mul	r9, r2, r8
	mov	r1, #4
	str	r1, [r4]
	mov	r1, #0
	ldr	r3, [r10, #48]
	add	r4, r5, r9
	mov	r0, r4
	blx	r3
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	ldr	r1, .L27+12
	mov	r3, r0
	mov	r2, r0
	str	r3, [r5, r9]
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, #53248
	movt	r0, 63683
	bl	MEM_Phy2Vir
	ldr	r1, .L27+16
	mov	r3, r0
	mov	r2, r0
	str	r3, [r4, #8]
	mov	r0, #22
	bl	dprint_vfmw
	add	ip, r6, #1020
	add	ip, ip, #3
	add	r3, r9, #36
	bic	ip, ip, #1020
	add	r1, r9, #876
	bic	ip, ip, #3
	add	r3, r5, r3
	add	r1, r5, r1
	add	r0, r7, r6
	mov	r2, ip
	rsb	r0, ip, r0
	mov	lr, #1024
	str	ip, [r4, #16]
	str	r0, [r4, #20]
	str	lr, [r4, #24]
.L19:
	str	r2, [r3, #4]!
	cmp	r3, r1
	add	r2, r2, #1280
	bne	.L19
	add	r3, ip, #274432
	add	ip, ip, #266240
	add	r1, ip, #41728
	movw	r2, #1228
	add	r1, r1, #255
	mov	r9, #210
	mla	r2, r2, r8, r5
	bic	r1, r1, #32512
	bic	r1, r1, #255
	add	ip, ip, #3072
	add	lr, r1, #4390912
	add	r5, r1, #1769472
	add	r10, lr, #37888
	add	r8, r5, #5248
	cmp	r8, r10
	rsbcs	r6, r6, r8
	rsbcc	r6, r6, r10
	add	r10, r1, #1081344
	cmp	r7, r6
	add	r10, r10, #12288
	str	r6, [fp, #-48]
	add	r6, r1, #2129920
	str	ip, [r2, #1088]
	add	ip, r1, #3178496
	str	r3, [r2, #1108]
	add	r3, r1, #4194304
	str	r1, [r2, #1156]
	mov	r0, #0
	str	r1, [r2, #1092]
	add	ip, ip, #12288
	str	r1, [r2, #1096]
	add	r3, r3, #45056
	str	r1, [r2, #1100]
	add	r5, r5, #2048
	str	r9, [r2, #1064]
	add	r9, r1, #45056
	str	r10, [r2, #1148]
	add	r10, r1, #4325376
	str	r9, [r2, #1144]
	add	r9, r1, #589824
	add	r1, r1, #1179648
	add	r6, r6, #12288
	add	r1, r1, #2048
	str	ip, [r2, #1160]
	str	r3, [r2, #1192]
	add	ip, r10, #47104
	add	r3, r9, #2048
	add	r10, r10, #50176
	str	ip, [r2, #1176]
	add	ip, lr, #33792
	str	r6, [r2, #1152]
	add	lr, lr, #1024
	str	r10, [r2, #1180]
	str	ip, [r2, #1184]
	str	r9, [r2, #1104]
	str	r9, [r2, #1112]
	str	r3, [r2, #1116]
	str	lr, [r2, #1204]
	str	lr, [r2, #1188]
	str	r1, [r2, #1120]
	str	r1, [r2, #1124]
	str	r8, [r2, #1136]
	str	r5, [r2, #1128]
	str	r5, [r2, #1132]
	str	r0, [r2, #1168]
	str	r0, [r2, #1140]
	bcc	.L20
	mov	r0, r4
	bl	H264HAL_V400R003_InitHal
	mov	r5, r0
	mov	r0, r4
	bl	HEVCHAL_V400R003_InitHal
	cmp	r0, #0
	mvnne	r0, #0
	bne	.L15
	adds	r0, r5, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L15:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L26:
	ldr	r1, .L27+20
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L20:
	mov	r3, r7
	ldr	r2, [fp, #-48]
	ldr	r1, .L27+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L15
.L24:
	mov	r0, r6
	ldr	r3, .L27+28
	ldr	r2, .L27+32
	ldr	r1, .L27+36
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L15
.L25:
	ldr	r3, .L27+40
	mov	r0, #0
	ldr	r2, .L27+32
	ldr	r1, .L27+36
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L15
.L23:
	ldr	r3, .L27+44
	ldr	r2, .L27+32
	ldr	r1, .L27+36
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L15
.L28:
	.align	2
.L27:
	.word	g_VdmExtParam
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HwMem
	.word	.LC5
	.word	.LC6
	.word	.LC4
	.word	.LC7
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC3
	.word	.LC0
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_OpenHAL, .-VDMHAL_V400R003_OpenHAL
	.align	2
	.global	VDMHAL_V400R003_CloseHAL
	.type	VDMHAL_V400R003_CloseHAL, %function
VDMHAL_V400R003_CloseHAL:
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
	.size	VDMHAL_V400R003_CloseHAL, .-VDMHAL_V400R003_CloseHAL
	.align	2
	.global	VDMHAL_V400R003_CalcFsSize
	.type	VDMHAL_V400R003_CalcFsSize, %function
VDMHAL_V400R003_CalcFsSize:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 40
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
	sub	ip, r1, #32
	mov	r5, r1
	movw	r1, #8160
	cmp	ip, r1
	mov	r9, r0
	mov	r6, r2
	str	r3, [fp, #-68]
	ldr	r7, [fp, #4]
	bhi	.L31
	sub	r3, r2, #32
	mov	r8, r2
	cmp	r3, r1
	bhi	.L31
	add	ip, r2, #15
	sub	r2, fp, #44
	add	r4, r5, #15
	sub	r1, fp, #52
	mov	ip, ip, asr #4
	mov	r0, r7
	str	ip, [r2, #-4]!
	mov	r4, r4, asr #4
	str	ip, [fp, #-56]
	str	r4, [fp, #-52]
	bl	VDMHAL_CalcPmvSlotLen.isra.0
	cmp	r7, #16
	ldr	r10, .L58
	ldr	ip, [fp, #-56]
	mov	r3, r0
	beq	.L51
	cmp	r7, #17
	beq	.L52
	mov	lr, r4, asl #4
	mov	r2, #0
	add	lr, lr, #255
	mov	r1, r2
	add	r8, r6, #31
	str	r2, [fp, #-80]
	bic	r2, lr, #255
	str	r2, [fp, #-56]
	ldr	r2, [r10, r9, asl #2]
	bic	r8, r8, #31
	str	r1, [fp, #-84]
.L35:
	ldr	r1, [r2, #1144]
	cmp	r1, #1
	beq	.L53
	mov	r1, #0
	str	r1, [fp, #-76]
	str	r1, [fp, #-72]
	str	r1, [fp, #-60]
.L37:
	cmp	r7, #3
	cmpne	r7, #0
	sub	r0, r7, #16
	movne	r1, #1
	moveq	r1, #0
	cmp	r0, #1
	movls	r1, #0
	andhi	r1, r1, #1
	cmp	r1, #0
	beq	.L54
	mov	r1, #1024
	str	r1, [fp, #-64]
	ldr	r1, [fp, #-68]
	mov	r6, #0
	mov	r5, r6
	cmp	r1, #1
	beq	.L55
.L39:
	ldr	r1, [fp, #-56]
	ldr	ip, [fp, #-80]
	mul	r8, r8, r1
	ldr	r1, [fp, #-60]
	add	r0, r1, r1, lsl #1
	ldr	r1, [fp, #-84]
	mul	r1, r1, ip
	add	ip, r8, r8, lsl #1
	mov	r4, ip, lsr #1
	add	r1, r1, r1, lsl #1
	add	r1, r4, r1, lsr #1
	add	r4, r1, r0, lsr #1
	add	r1, r2, #290816
	ldr	r1, [r1, #3160]
	cmp	r1, #0
	beq	.L56
.L41:
	add	r1, r2, #294912
	add	r0, r3, r3, lsr #31
	cmp	r7, #17
	mov	r0, r0, asr #1
	str	r0, [r1, #2740]
	ldr	r0, [fp, #-72]
	str	r4, [r1, #2768]
	str	r5, [r1, #2432]
	str	r0, [r1, #2444]
	ldr	r0, [fp, #-76]
	str	r6, [r1, #2436]
	str	r0, [r1, #2448]
	beq	.L42
	add	r0, r2, #290816
	ldr	ip, [fp, #-56]
	ldr	r0, [r0, #3168]
	mov	lr, ip, asl #4
	ldr	ip, [fp, #-60]
	cmp	r0, #32
	str	lr, [r1, #1400]
	add	ip, r8, ip
	str	ip, [r1, #2468]
	movge	r0, #32
	cmp	r7, #16
	str	r0, [r1, #2744]
	beq	.L57
.L44:
	ldr	r2, [r10, r9, asl #2]
	mov	r0, #1024
	ldr	r1, [fp, #-64]
	add	r4, r4, r1
	add	r1, r2, #294912
	add	r4, r4, #32
	str	r3, [r1, #2772]
	add	ip, r3, r4
	str	r0, [r1, #2780]
	ldrsb	r2, [r2, #44]
	cmp	r2, #1
	ldr	r2, [fp, #8]
	addeq	ip, ip, r0
	cmp	r2, #0
	beq	.L49
	str	r4, [r2, #4]
	mov	r1, #1024
	ldr	r2, [r10, r9, asl #2]
	mov	r0, #0
	ldr	lr, [fp, #8]
	add	r2, r2, #290816
	ldr	r2, [r2, #3168]
	str	r3, [lr, #12]
	str	r2, [lr, #8]
	ldr	r3, [r10, r9, asl #2]
	add	r3, r3, #294912
	ldr	r3, [r3, #2744]
	str	ip, [lr]
	str	r1, [lr, #20]
	str	r3, [lr, #16]
	ldr	r3, [r10, r9, asl #2]
	add	r3, r3, #294912
	str	r4, [r3, #2776]
.L33:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L54:
	add	r5, r5, #255
	add	r1, r5, #255
	cmp	r5, #0
	movlt	r5, r1
	adds	r1, r6, #63
	addmi	r6, r6, #126
	movpl	r6, r1
	mov	r5, r5, asr #8
	mov	r6, r6, asr #6
	mov	r5, r5, asl #6
	mov	r6, r6, asl #3
	mul	r6, r5, r6
	add	r1, r6, #1024
	str	r1, [fp, #-64]
	ldr	r1, [fp, #-68]
	cmp	r1, #1
	bne	.L39
.L55:
	ldr	r1, [fp, #-56]
	mov	r4, ip, asl #5
	add	r4, r4, ip, lsl #4
	mul	r8, r8, r1
	mul	r4, r1, r4
	add	r1, r2, #290816
	ldr	r1, [r1, #3160]
	cmp	r1, #0
	bne	.L41
.L56:
	ldr	ip, .L58+4
	movw	r0, #34168
	movt	r0, 4
	add	r0, r2, r0
	movw	r2, #1384
	str	r3, [fp, #-68]
	ldr	ip, [ip, #48]
	blx	ip
	ldr	r2, [r10, r9, asl #2]
	ldr	r3, [fp, #-68]
	b	.L41
.L57:
	ldr	r2, [r2, #1436]
	cmp	r2, #8
	ble	.L44
	ldr	r2, [fp, #-80]
	add	r8, r8, r8, lsl #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-84]
	ldr	lr, [fp, #-60]
	mul	ip, r2, r3
	add	r0, lr, lr, lsl #1
	mov	r2, r3, asl #5
	str	r2, [r1, #2452]
	mov	r0, r0, lsr #1
	add	r2, r0, r8, lsr #1
	add	ip, ip, lr, lsr #1
	str	r2, [r1, #2460]
	mov	r0, #31
	str	ip, [r1, #2464]
	ldr	r1, .L58+8
	bl	dprint_vfmw
	ldr	r3, [fp, #-56]
	b	.L44
.L42:
	ldr	r2, [fp, #-56]
	mov	lr, r2, asl #4
	ldr	r2, [fp, #-60]
	str	lr, [r1, #1400]
	add	r8, r8, r2
	mov	r2, #1
	str	r8, [r1, #2468]
	str	r2, [r1, #2744]
	b	.L44
.L53:
	add	r1, r5, #508
	add	r0, r5, #1020
	add	r1, r1, #3
	add	r0, r0, #2
	cmp	r1, #0
	movlt	r1, r0
	adds	r0, r6, #63
	addmi	r0, r6, #126
	mov	r1, r1, asr #9
	mov	r0, r0, asr #6
	mov	r1, r1, asl #4
	str	r1, [fp, #-72]
	mov	lr, r1
	mov	r1, r0, asl #5
	mul	r1, lr, r1
	str	r1, [fp, #-60]
	str	r1, [fp, #-76]
	b	.L37
.L51:
	add	lr, r5, #255
	bic	r2, lr, #255
	str	r2, [fp, #-56]
	ldr	r2, [r10, r9, asl #2]
	ldr	r1, [r2, #1436]
	cmp	r1, #8
	ble	.L46
	ldr	r0, [fp, #-56]
	add	r1, r6, #31
	bic	r1, r1, #31
	str	r1, [fp, #-80]
	mov	r0, r0, lsr #2
	str	r0, [fp, #-84]
	b	.L35
.L46:
	mov	r1, #0
	str	r1, [fp, #-80]
	str	r1, [fp, #-84]
	b	.L35
.L52:
	mov	r2, #0
	add	lr, r5, #255
	add	r8, r6, #63
	mov	r1, r2
	str	r2, [fp, #-80]
	bic	r8, r8, #63
	bic	r2, lr, #255
	str	r1, [fp, #-84]
	str	r2, [fp, #-56]
	ldr	r2, [r10, r9, asl #2]
	b	.L35
.L31:
	ldr	r3, .L58+12
	mov	r0, #0
	ldr	r2, .L58+16
	ldr	r1, .L58+20
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L49:
	ldr	r0, [fp, #8]
	b	.L33
.L59:
	.align	2
.L58:
	.word	s_pstVfmwChan
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	.word	.LC8
	.word	.LANCHOR0+24
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_CalcFsSize, .-VDMHAL_V400R003_CalcFsSize
	.align	2
	.global	VDMHAL_V400R003_GetRpuSize
	.type	VDMHAL_V400R003_GetRpuSize, %function
VDMHAL_V400R003_GetRpuSize:
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
	mov	r0, #1024
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_GetRpuSize, .-VDMHAL_V400R003_GetRpuSize
	.align	2
	.global	VDMHAL_V400R003_ArrangeMem_Normal
	.type	VDMHAL_V400R003_ArrangeMem_Normal, %function
VDMHAL_V400R003_ArrangeMem_Normal:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #108)
	sub	sp, sp, #108
	cmp	r1, #20
	mov	r8, r3
	mov	r7, r1
	mov	r3, #0
	mov	r9, r2
	mov	r5, r0
	str	r3, [fp, #-96]
	str	r3, [fp, #-92]
	str	r3, [fp, #-88]
	str	r3, [fp, #-84]
	str	r3, [fp, #-80]
	str	r3, [fp, #-76]
	bhi	.L110
	ldr	r6, .L118
	sub	lr, fp, #96
	ldr	r3, [fp, #4]
	mov	r2, r8
	mov	r1, r9
	ldr	ip, [r6, r0, asl #2]
	add	ip, ip, #290816
	ldr	r10, [ip, #3164]
	stmia	sp, {r7, lr}
	bl	VDMHAL_V400R003_CalcFsSize
	cmp	r0, #0
	bne	.L111
	ldr	r3, [r6, r5, asl #2]
	ldr	r4, [fp, #-96]
	str	r3, [fp, #-112]
	cmp	r10, r4
	add	r3, r3, #290816
	ldr	r10, [r3, #3168]
	ldr	r2, [r3, #3184]
	beq	.L112
.L66:
	str	r2, [sp, #4]
	mov	r3, r4
	ldr	r2, .L118+4
	mov	r0, #31
	str	r10, [sp]
	ldr	r1, .L118+8
	bl	dprint_vfmw
	ldr	r2, [r6, r5, asl #2]
	add	r3, r2, #290816
	ldr	ip, [r3, #3160]
	str	r4, [r3, #3164]
	cmp	ip, #0
	beq	.L113
	ldr	r2, .L118+12
	ldr	r0, [fp, #-88]
	ldr	ip, [r2]
	str	r0, [r3, #3172]
	cmp	ip, #0
	beq	.L109
	ldr	lr, [fp, #-80]
	mov	r3, #28
	ldr	r7, [fp, #-92]
	sub	r2, fp, #72
	str	r0, [fp, #-72]
	mov	r1, #122
	str	lr, [fp, #-64]
	mov	r0, r5
	ldr	lr, [fp, #-84]
	str	r9, [fp, #-52]
	str	r8, [fp, #-48]
	str	lr, [fp, #-60]
	ldr	lr, [fp, #-76]
	str	r7, [fp, #-68]
	str	lr, [fp, #-56]
	blx	ip
.L109:
	ldr	r3, .L118+16
	str	r3, [fp, #-128]
.L76:
	ldr	ip, [r6, r5, asl #2]
	mov	r2, r4
	mov	r3, r10
	ldr	r1, .L118+20
	add	ip, ip, #290816
	mov	r0, #31
	ldr	ip, [ip, #3184]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [fp, #-128]
	ldr	r4, [r6, r5, asl #2]
	ldr	r3, [r3]
	add	r4, r4, #294912
	blx	r3
	mov	r3, #2
	str	r0, [r4, #2784]
.L63:
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L112:
	cmp	r2, #1
	beq	.L66
	ldr	r3, [r3, #3160]
	cmp	r3, #1
	beq	.L66
	ldr	r3, [fp, #8]
	cmp	r3, #0
	beq	.L114
	ldr	r3, [fp, #-112]
	cmp	r10, #0
	movw	r2, #34168
	add	r4, r3, #294912
	movt	r2, 4
	add	r3, r3, r2
	str	r3, [fp, #-136]
	ldr	r1, [r4, #2768]
	ldrne	r3, [fp, #-112]
	str	r1, [fp, #-116]
	beq	.L115
.L78:
	add	r3, r3, #290816
	ldr	r2, [r3, #3172]
	cmp	r2, #30
	bgt	.L116
.L79:
	ldr	r3, .L118+16
	mov	r0, #8
	str	r2, [r4, #2480]
	str	r3, [fp, #-128]
	ldr	r3, [r3, #12]
	blx	r3
	ldr	r2, [r6, r5, asl #2]
	add	r9, r2, #294912
	ldr	r3, [r9, #2808]
	cmp	r3, #0
	beq	.L84
	ldr	r0, [r4, #2436]
	movw	r1, #8767
	ldr	r3, [r4, #2748]
	movt	r1, 1
	mov	r8, #0
	str	r5, [fp, #-140]
	str	r0, [fp, #-120]
	add	r1, r3, r1
	ldr	r0, [r4, #2744]
	mov	ip, r3, asl #4
	sub	ip, ip, r3, asl #2
	mov	r1, r1, asl #2
	str	r0, [fp, #-124]
	add	r0, r3, #1
	str	r0, [fp, #-132]
	sub	r3, r1, #512
	ldr	r0, [fp, #-112]
	add	ip, r0, ip
	add	r1, r0, r1
	add	r3, r0, r3
	str	r1, [fp, #-104]
	str	r3, [fp, #-108]
.L83:
	movw	r1, #31896
	movw	r3, #31876
	movt	r1, 4
	add	r1, r2, r1
	movt	r3, 4
	add	r3, r2, r3
	ldr	r1, [r1]
	add	r0, ip, #294912
	ldr	r10, [r3]
	movw	lr, #34180
	add	r3, r1, #1020
	movt	lr, 4
	add	r3, r3, #3
	add	lr, ip, lr
	bic	r3, r3, #1020
	movw	r5, #31912
	bic	r3, r3, #3
	str	r3, [r0, #1408]
	ldr	r0, [fp, #-116]
	movw	r7, #31928
	str	r10, [lr]
	movw	r10, #31868
	rsb	r0, r1, r0
	ldr	lr, [fp, #-120]
	add	r3, r0, r3
	movw	r0, #34184
	movt	r0, 4
	add	r0, ip, r0
	add	lr, r1, lr
	add	r1, r3, r1
	add	r3, lr, r3
	mov	lr, #1
	strb	lr, [r0]
	movt	r10, 4
	ldr	r0, [fp, #-104]
	add	r10, r2, r10
	movt	r5, 4
	movt	r7, 4
	add	r5, r2, r5
	add	r7, r2, r7
	str	r1, [r0, #4]!
	add	r2, r2, #72
	str	r0, [fp, #-104]
	add	ip, ip, #12
	ldr	r0, [fp, #-108]
	ldr	r1, [fp, #-132]
	str	r3, [r0, #4]!
	add	r1, r1, r8
	str	r1, [r4, #2748]
	add	r8, r8, lr
	ldr	r3, [r10]
	str	r0, [fp, #-108]
	cmp	r3, #255
	beq	.L81
	ldr	r1, [r4, #2756]
	ldr	lr, [r5]
	add	r0, r1, #1
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	add	r3, r4, r3
	str	lr, [r3, #1920]
	str	r0, [r4, #2756]
.L81:
	ldr	r3, [r4, #2752]
	ldr	r1, [fp, #-124]
	ldr	r0, [fp, #-112]
	cmp	r3, r1
	add	r1, r3, #1
	add	r3, r0, r3, lsl #3
	ldrcc	r0, [r7]
	add	r3, r3, #294912
	movcc	lr, #1
	strccb	lr, [r3, #2488]
	strcc	r0, [r3, #2484]
	strcc	r1, [r4, #2752]
	ldr	r3, [r9, #2808]
	cmp	r8, r3
	bcc	.L83
	ldr	r5, [fp, #-140]
.L84:
	ldr	r4, [fp, #-128]
	movw	r2, #1368
	ldr	r1, [fp, #-136]
	ldr	r0, [fp, #8]
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r6, r5, asl #2]
	mov	r1, #1
	ldr	r2, [r4, #16]
	add	r3, r3, #294912
	mov	r0, #8
	str	r1, [r3, #2812]
	blx	r2
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L113:
	movw	r1, #31864
	mov	r0, r5
	movt	r1, 4
	add	r1, r2, r1
	str	ip, [fp, #-104]
	bl	DelAllFrameMemRecord
	ldr	ip, [fp, #-104]
	cmp	r0, #0
	bne	.L117
.L69:
	ldr	r1, [r6, r5, asl #2]
	movw	r2, #31864
	movt	r2, 4
	mov	r3, #0
	add	r2, r1, r2
	mov	r1, #255
.L70:
	str	r1, [r2, r3]
	add	r3, r3, #72
	cmp	r3, #2304
	bne	.L70
	cmp	r9, #1920
	cmple	r8, #1088
	ldr	r0, [fp, #-88]
	ble	.L71
.L73:
	ldr	r3, [r6, r5, asl #2]
.L72:
	ldr	r1, [r3, #1392]
	add	r2, r3, #290816
	subs	r7, r7, #17
	mov	lr, #0
	add	r1, r0, r1
	str	r1, [r2, #3172]
	ldr	ip, [r3, #564]
	movne	r7, #1
	add	r3, r3, #294912
	cmp	ip, #2
	ldr	ip, .L118+12
	str	lr, [r3, #2808]
	movne	r7, #0
	cmp	r7, #0
	ldr	ip, [ip]
	strne	r1, [fp, #-80]
	mov	r1, #1
	cmp	ip, lr
	str	r1, [r2, #3144]
	str	r1, [r3, #3332]
	beq	.L75
	ldr	lr, [fp, #-80]
	mov	r3, #28
	ldr	r7, [fp, #-92]
	sub	r2, fp, #72
	str	r0, [fp, #-72]
	mov	r1, #121
	str	lr, [fp, #-64]
	mov	r0, r5
	ldr	lr, [fp, #-84]
	str	r9, [fp, #-52]
	str	r8, [fp, #-48]
	str	lr, [fp, #-60]
	ldr	lr, [fp, #-76]
	str	r7, [fp, #-68]
	str	lr, [fp, #-56]
	blx	ip
.L75:
	ldr	r0, [r6, r5, asl #2]
	mov	r2, #512
	ldr	r3, .L118+16
	mov	r1, #0
	add	r0, r0, #294912
	add	r0, r0, #2816
	str	r3, [fp, #-128]
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r6, r5, asl #2]
	ldr	r1, .L118+24
	mov	r2, #0
	add	r3, r3, #294912
	ldr	r0, [r1, r5, asl #2]
	str	r2, [r3, #3328]
	bl	FSP_ClearContextAll
	b	.L76
.L71:
	ldr	r3, [r6, r5, asl #2]
	ldr	r2, [r3, #36]
	cmp	r2, #24
	beq	.L73
	add	r0, r0, #4
	str	r0, [fp, #-88]
	b	.L72
.L117:
	mov	r0, ip
	ldr	r1, .L118+28
	bl	dprint_vfmw
	b	.L69
.L115:
	ldr	r1, .L118+32
	mov	r0, #31
	bl	dprint_vfmw
	ldr	r3, [r6, r5, asl #2]
	b	.L78
.L116:
	ldr	r1, .L118+36
	mov	r0, #31
	bl	dprint_vfmw
	ldr	r3, [r6, r5, asl #2]
	mov	r1, #30
	add	r3, r3, #290816
	mov	r2, r1
	str	r1, [r3, #3172]
	b	.L79
.L110:
	mov	r0, r3
	ldr	r2, .L118+40
	ldr	r3, .L118+44
	ldr	r1, .L118+48
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L63
.L111:
	ldr	r1, .L118+52
	mov	r0, #31
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L63
.L114:
	ldr	r3, .L118+56
	ldr	r2, .L118+60
	ldr	r1, .L118+48
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L63
.L119:
	.align	2
.L118:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+88
	.word	.LC12
	.word	g_event_report
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC14
	.word	s_pFspInst
	.word	.LC13
	.word	.LC16
	.word	.LC17
	.word	.LANCHOR0+52
	.word	.LC10
	.word	.LC1
	.word	.LC11
	.word	.LC15
	.word	.LANCHOR0+124
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_ArrangeMem_Normal, .-VDMHAL_V400R003_ArrangeMem_Normal
	.global	__aeabi_idiv
	.align	2
	.global	VDMHAL_V400R003_ArrangeMem_Specific
	.type	VDMHAL_V400R003_ArrangeMem_Specific, %function
VDMHAL_V400R003_ArrangeMem_Specific:
	UNWIND(.fnstart)
	@ args = 28, pretend = 0, frame = 48
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
	cmp	r2, #0
	mov	r10, r0
	str	r2, [fp, #-56]
	mov	r9, r1
	str	r3, [fp, #-60]
	ldmib	fp, {r5, r7, ip}
	ldr	r6, [fp, #28]
	beq	.L180
	sub	r2, r5, #32
	movw	r3, #8160
	cmp	r2, r3
	bhi	.L123
	sub	r2, r7, #32
	cmp	r2, r3
	bhi	.L123
	cmp	r6, #0
	beq	.L181
	ldr	r3, .L189
	cmp	ip, #20
	movw	r2, #1368
	mov	r1, #0
	mov	r0, r6
	movge	ip, #20
	ldr	r3, [r3, #48]
	str	ip, [fp, #-68]
	blx	r3
	add	r1, r7, #15
	sub	r2, fp, #44
	add	r3, r5, #15
	mov	r1, r1, asr #4
	str	r1, [fp, #-84]
	mov	r3, r3, asr #4
	str	r3, [fp, #-52]
	mov	r0, r1
	sub	r1, fp, #52
	str	r0, [r2, #-4]!
	mov	r0, r9
	str	r3, [fp, #-64]
	bl	VDMHAL_CalcPmvSlotLen.isra.0
	ldr	ip, [fp, #-68]
	ldr	r2, [fp, #-60]
	mul	r3, ip, r0
	mov	r8, r0
	cmp	r3, r2
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-64]
	ldrge	r3, .L189+4
	bge	.L179
	ldr	r1, [fp, #-56]
	add	r2, r0, r0, lsr #31
	cmp	r9, #16
	str	ip, [r6, #1344]
	add	r4, r1, #1020
	mov	r2, r2, asr #1
	add	r4, r4, #3
	str	r2, [r6, #1340]
	bic	r4, r4, #1020
	bic	r4, r4, #3
	rsb	r1, r1, r4
	str	r1, [fp, #-68]
	beq	.L182
	cmp	r9, #17
	beq	.L183
	mov	r2, r3, asl #4
	mov	r1, #0
	add	r3, r7, #31
	add	r2, r2, #255
	bic	r3, r3, #31
	mov	r0, r1
	str	r3, [fp, #-64]
	bic	r2, r2, #255
	str	r1, [fp, #-72]
	add	r3, r7, #63
	add	r1, r5, #255
	str	r0, [fp, #-76]
.L129:
	add	r0, r5, #508
	add	r5, r5, #1020
	add	r0, r0, #3
	add	ip, r3, #63
	cmp	r0, #0
	add	r5, r5, #2
	add	r7, r1, #255
	movge	r5, r0
	cmp	r3, #0
	mov	r5, r5, asr #9
	ldr	r0, [fp, #20]
	movlt	r3, ip
	cmp	r1, #0
	mov	r3, r3, asr #6
	mov	ip, r5, asl #9
	movlt	r1, r7
	cmp	r0, #1
	mov	r1, r1, asr #8
	mov	r0, r3, asl #3
	mul	r3, r3, ip
	mov	r1, r1, asl #6
	mov	r5, r5, asl #4
	str	r1, [r6, #1032]
	mul	r7, r1, r0
	str	r5, [r6, #1044]
	mov	r1, r2, asl #4
	str	r1, [r6]
	str	r3, [r6, #1048]
	str	r7, [r6, #1036]
	beq	.L184
	ldr	r0, [fp, #-72]
	add	r5, r3, r3, lsl #1
	ldr	r1, [fp, #-76]
	mul	r1, r1, r0
	ldr	r0, [fp, #-64]
	mul	r0, r2, r0
	add	r1, r1, r1, lsl #1
	add	r1, r1, r1, lsr #31
	add	r0, r0, r0, lsl #1
	mov	r1, r1, asr #1
	add	r1, r1, r0, asr #1
	add	r5, r1, r5, lsr #1
.L133:
	ldr	r1, [fp, #24]
	cmp	r1, #0
	blt	.L134
	mov	r0, r1
	str	r2, [fp, #-88]
	str	r3, [fp, #-84]
	bl	VCTRL_GetChanWidth
	mov	r10, r0
	ldr	r0, [fp, #24]
	bl	VCTRL_GetChanHeight
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-88]
	cmn	r0, #1
	cmnne	r10, #1
	beq	.L185
	ldr	r1, [fp, #20]
	add	ip, r10, #15
	bic	ip, ip, #15
	cmp	r1, #1
	add	lr, ip, #255
	add	r1, r0, #15
	bic	lr, lr, #255
	bic	r1, r1, #15
	beq	.L186
	add	r0, ip, #508
	adds	r10, r1, #63
	add	r0, r0, #3
	add	ip, ip, #1020
	addmi	r10, r1, #126
	add	ip, ip, #2
	cmp	r0, #0
	mov	r10, r10, asr #6
	movlt	r0, ip
	mov	r0, r0, asr #9
	mov	r1, r10, asl #7
	mul	lr, r10, lr
	mov	r0, r0, asl #4
	sub	r10, r1, r10, asl #5
	mul	r0, r0, r10
	mov	ip, lr, asl #7
	sub	lr, ip, lr, asl #5
	add	r0, lr, r0, lsr #1
.L137:
	cmp	r5, r0
	ldrgt	r3, .L189+8
	bgt	.L179
	ldr	r10, [fp, #24]
.L134:
	ldr	r1, [fp, #-64]
	cmp	r10, #0
	cmpge	r9, #16
	mvn	ip, r10
	str	r3, [fp, #-64]
	mov	ip, ip, lsr #31
	mul	r2, r2, r1
	add	r1, r3, r2
	str	r1, [r6, #1068]
	str	r2, [fp, #-84]
	bne	.L139
	ldr	r1, .L189+12
	str	ip, [fp, #-88]
	ldr	r0, [r1, r10, asl #2]
	add	r0, r0, #294912
	add	r0, r0, #3392
	bl	IsMain10Profile
	ldr	ip, [fp, #-88]
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-84]
	cmp	r0, #0
	bne	.L187
.L139:
	ldr	r3, [fp, #16]
	cmp	r3, #0
	streq	r3, [r6, #1080]
	streq	r3, [r6, #1040]
	beq	.L142
	cmp	r9, #3
	cmpne	r9, #0
	sub	r9, r9, #16
	ldr	r2, [fp, #-80]
	movne	r3, #1
	moveq	r3, #0
	cmp	r9, #1
	movls	r9, #0
	andhi	r9, r3, #1
	ldr	r3, [fp, #-60]
	cmp	r9, #0
	str	ip, [fp, #-60]
	rsb	r0, r2, r3
	ldr	r3, [fp, #-68]
	rsb	r0, r3, r0
	ldr	r3, [fp, #16]
	beq	.L143
	cmp	r3, #32
	mov	r1, r5
	movlt	r9, r3
	movge	r9, #32
	bl	__aeabi_idiv
	mov	r3, #0
	ldr	ip, [fp, #-60]
	str	r3, [r6, #1040]
	cmp	r9, r0
	movlt	r3, r9
	movge	r3, r0
	str	r3, [r6, #1080]
	b	.L144
.L143:
	cmp	r3, #32
	add	r1, r5, r7
	movlt	r9, r3
	movge	r9, #32
	bl	__aeabi_idiv
	ldr	ip, [fp, #-60]
	cmp	r9, r0
	movlt	r3, r9
	movge	r3, r0
	str	r3, [r6, #1080]
	str	r3, [r6, #1040]
.L144:
	cmp	r3, #0
	ldrne	r0, [r6, #1348]
	movne	r1, r6
	movne	r2, #0
	beq	.L142
.L147:
	add	r2, r2, #1
	str	r4, [r1, #8]
	cmp	r2, r3
	add	r4, r4, r5
	add	r1, r1, #12
	bne	.L147
	ldr	r2, [fp, #-68]
	mov	r1, #0
	mla	r5, r3, r5, r2
	add	r2, r0, r3
	str	r2, [r6, #1348]
	add	r0, r6, #388
	ldr	r2, [fp, #-56]
	add	r2, r5, r2
.L149:
	add	r1, r1, #1
	str	r2, [r0, #4]!
	cmp	r1, r3
	add	r2, r2, #32
	bne	.L149
	ldr	r4, [r6, #1040]
	add	r5, r5, r3, lsl #5
	ldr	r2, [fp, #-56]
	cmp	r4, #0
	add	r2, r5, r2
	beq	.L150
	add	r0, r6, #900
	mov	r1, #0
.L151:
	add	r1, r1, #1
	str	r2, [r0, #4]!
	cmp	r1, r4
	add	r2, r2, r7
	bne	.L151
	mul	r4, r7, r4
.L150:
	ldr	lr, [r6, #1344]
	ldr	r2, [fp, #-56]
	add	r5, r4, r5
	cmp	lr, #0
	add	r4, r5, r2
	beq	.L156
	ldr	r7, [r6, #1352]
	mov	r0, r6
	mov	r1, r4
	mov	r2, #0
.L155:
	add	r2, r2, #1
	str	r1, [r0, #1084]
	cmp	lr, r2
	add	r1, r1, r8
	add	r0, r0, #8
	bne	.L155
	add	r2, r7, lr
	str	r2, [r6, #1352]
.L156:
	mla	r8, lr, r8, r5
	cmp	ip, #0
	str	r8, [r6, #4]
	beq	.L154
	ldr	r2, .L189+12
	ldr	r2, [r2, r10, asl #2]
	cmp	r2, #0
	beq	.L154
	cmp	r3, #0
	add	r2, r8, r4
	beq	.L154
	mov	r0, r6
	mov	r1, #0
.L157:
	add	r1, r1, #1
	str	r2, [r0, #520]
	cmp	r1, r3
	add	r2, r2, #1024
	add	r0, r0, #12
	bne	.L157
.L154:
	mov	r0, #0
	add	r8, r8, r3, lsl #10
	str	r8, [r6, #4]
.L177:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L182:
	cmp	r10, #0
	add	r1, r5, #255
	bic	r2, r1, #255
	blt	.L188
	ldr	r3, .L189+12
	str	r2, [fp, #-72]
	str	r1, [fp, #-64]
	ldr	r0, [r3, r10, asl #2]
	add	r0, r0, #294912
	add	r0, r0, #3392
	bl	IsMain10Profile
	ldr	r1, [fp, #-64]
	ldr	r2, [fp, #-72]
	cmp	r0, #0
	bne	.L130
	str	r0, [fp, #-72]
	add	r3, r7, #63
	str	r0, [fp, #-76]
	str	r7, [fp, #-64]
	b	.L129
.L184:
	ldr	r1, [fp, #-84]
	mov	r5, r1, asl #4
	mul	r5, r2, r5
	add	r5, r5, r5, lsl #1
	b	.L133
.L188:
	mov	r3, #0
	str	r7, [fp, #-64]
	mov	r0, r3
	str	r3, [fp, #-72]
	str	r0, [fp, #-76]
	add	r3, r7, #63
	b	.L129
.L142:
	ldr	r3, .L189+16
.L179:
	ldr	r2, .L189+20
	mov	r0, #0
	ldr	r1, .L189+24
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L186:
	mul	r0, r1, lr
	add	r0, r0, r0, lsl #1
	b	.L137
.L183:
	mov	r2, #0
	add	r3, r7, #63
	add	r1, r5, #255
	mov	r0, r2
	str	r2, [fp, #-72]
	bic	r2, r3, #63
	str	r0, [fp, #-76]
	str	r2, [fp, #-64]
	bic	r2, r1, #255
	b	.L129
.L130:
	cmp	r2, #0
	add	r0, r2, #3
	add	r3, r7, #31
	str	r7, [fp, #-64]
	movge	r0, r2
	bic	r3, r3, #31
	mov	r0, r0, asr #2
	str	r3, [fp, #-72]
	str	r0, [fp, #-76]
	add	r3, r7, #63
	b	.L129
.L123:
	ldr	r3, .L189+28
	b	.L179
.L187:
	ldr	r0, [fp, #-76]
	add	r2, r2, r2, lsl #1
	str	ip, [fp, #-64]
	add	r1, r3, r3, lsl #1
	ldr	ip, [fp, #-72]
	mov	r2, r2, asr #1
	add	r2, r2, r1, lsr #1
	ldr	r1, .L189+32
	str	r2, [r6, #1060]
	mul	lr, r0, ip
	mov	r0, r0, asl #5
	str	r0, [r6, #1052]
	mov	r0, #0
	add	r3, lr, r3, lsr #1
	str	r3, [r6, #1064]
	bl	dprint_vfmw
	ldr	ip, [fp, #-64]
	b	.L139
.L180:
	mov	r0, r2
	ldr	r3, .L189+36
	ldr	r2, .L189+20
	ldr	r1, .L189+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L177
.L185:
	ldr	r1, .L189+40
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L177
.L181:
	mov	r0, r6
	ldr	r3, .L189+44
	ldr	r2, .L189+20
	ldr	r1, .L189+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L177
.L190:
	.align	2
.L189:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC20
	.word	.LC22
	.word	s_pstVfmwChan
	.word	.LC23
	.word	.LANCHOR0+160
	.word	.LC1
	.word	.LC8
	.word	.LC9
	.word	.LC18
	.word	.LC21
	.word	.LC19
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_ArrangeMem_Specific, .-VDMHAL_V400R003_ArrangeMem_Specific
	.align	2
	.global	VDMHAL_V400R003_ArrangeMem
	.type	VDMHAL_V400R003_ArrangeMem, %function
VDMHAL_V400R003_ArrangeMem:
	UNWIND(.fnstart)
	@ args = 20, pretend = 0, frame = 8
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
	ldr	r4, [fp, #16]
	mov	r9, r0
	mov	r5, r2
	cmn	r4, #2
	mov	r6, r3
	ldmib	fp, {r10, ip}
	ldr	r7, [fp, #12]
	ldr	r8, [fp, #20]
	beq	.L194
	cmp	r4, #0
	blt	.L195
	mov	r0, r4
	str	ip, [fp, #-52]
	str	r1, [fp, #-48]
	bl	VCTRL_GetVidStd
	ldr	r3, .L198
	ldr	r1, [fp, #-48]
	ldr	ip, [fp, #-52]
	ldr	r3, [r3, r4, asl #2]
	ldr	r3, [r3, #1384]
	cmp	r3, #1
	beq	.L197
.L193:
	mov	r3, r1
	str	r8, [sp, #24]
	mov	r1, r0
	str	r4, [sp, #20]
	mov	r2, r9
	str	r7, [sp, #16]
	str	ip, [sp, #12]
	mov	r0, r4
	stmia	sp, {r5, r6, r10}
	bl	VDMHAL_V400R003_ArrangeMem_Specific
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L195:
	mov	r0, #21
	b	.L193
.L194:
	mov	r0, #16
	b	.L193
.L197:
	mov	r1, r0
	str	r8, [fp, #8]
	mov	r3, r6
	str	r7, [fp, #4]
	mov	r2, r5
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDMHAL_V400R003_ArrangeMem_Normal
.L199:
	.align	2
.L198:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_ArrangeMem, .-VDMHAL_V400R003_ArrangeMem
	.align	2
	.global	VDMHAL_V400R003_ResetVdm
	.type	VDMHAL_V400R003_ResetVdm, %function
VDMHAL_V400R003_ResetVdm:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r6, r0, #0
	mov	r0, #0
	ble	.L201
	mov	r3, r6
	str	r0, [sp]
	ldr	r2, .L215
	ldr	r1, .L215+4
	bl	dprint_vfmw
.L200:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L201:
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r2, r0, #0
	beq	.L213
	movw	r3, #1228
	ldr	r8, .L215+8
	mul	r3, r3, r6
	ldr	r5, .L215+12
	ldr	r2, [r5]
	ldr	r3, [r8, r3]
	ldr	r9, [r3, #36]
	ldr	r7, [r2, #120]
	tst	r7, #1
	beq	.L200
	ldr	r10, .L215+16
	mov	r3, #2
	bfi	r7, r3, #8, #2
	str	r7, [r2, #120]
	mov	r4, #0
	orr	r7, r7, #64
	ldr	r3, [r10, #112]
	blx	r3
	ldr	r3, [r5]
	str	r7, [r3, #120]
	b	.L205
.L214:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L206
.L205:
	ldr	r3, [r10, #116]
	mov	r0, #30
	blx	r3
	ldr	r3, [r5]
	ldr	r2, [r3, #372]
	tst	r2, #4
	beq	.L214
	cmp	r4, #1000
	bge	.L206
	mov	r3, r6
	ldr	r2, .L215
	ldr	r1, .L215+20
	mov	r0, #0
	bl	dprint_vfmw
.L208:
	ldr	r2, [r5]
	bfc	r7, #6, #1
	ldr	r3, [r10, #112]
	str	r7, [r2, #120]
	bfc	r7, #8, #2
	blx	r3
	movw	r3, #1228
	mul	r6, r3, r6
	ldr	r3, [r5]
	str	r7, [r3, #120]
	ldr	r3, [r8, r6]
	str	r9, [r3, #36]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L206:
	mov	r3, r6
	ldr	r2, .L215
	ldr	r1, .L215+24
	mov	r0, #0
	bl	dprint_vfmw
	b	.L208
.L213:
	ldr	r1, .L215+28
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L216:
	.align	2
.L215:
	.word	.LANCHOR0+196
	.word	.LC24
	.word	g_HwMem
	.word	g_pstRegCrg
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC27
	.word	.LC26
	.word	.LC25
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_ResetVdm, .-VDMHAL_V400R003_ResetVdm
	.align	2
	.global	VDMHAL_V400R003_SetSmmuPageTableAddr
	.type	VDMHAL_V400R003_SetSmmuPageTableAddr, %function
VDMHAL_V400R003_SetSmmuPageTableAddr:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 16
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
	ldr	r3, .L223
	mov	r4, r0
	ldr	ip, [r3, #180]
	cmp	ip, #0
	beq	.L217
	sub	r2, fp, #24
	sub	r1, fp, #28
	sub	r0, fp, #32
	blx	ip
	cmp	r4, #0
	bne	.L219
	ldr	r3, .L223+4
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r3, [r3]
	ldr	r2, [fp, #-24]
	add	r3, r3, #61440
	str	r0, [r3, #524]
	str	r1, [r3, #772]
	str	r2, [r3, #776]
.L217:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L219:
	mov	r5, #1
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L223+8
	ldr	r1, .L223+12
	bl	dprint_vfmw
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L223+8
	ldr	r1, .L223+12
	bl	dprint_vfmw
	str	r5, [sp]
	mov	r3, r4
	ldr	r2, .L223+8
	ldr	r1, .L223+12
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L224:
	.align	2
.L223:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_HwMem
	.word	.LANCHOR0+224
	.word	.LC28
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_SetSmmuPageTableAddr, .-VDMHAL_V400R003_SetSmmuPageTableAddr
	.align	2
	.global	VDMHAL_V400R003_EnableSmmu
	.type	VDMHAL_V400R003_EnableSmmu, %function
VDMHAL_V400R003_EnableSmmu:
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
	ldr	r3, .L226
	mov	r2, #8
	ldr	r3, [r3]
	add	r3, r3, #61440
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L227:
	.align	2
.L226:
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_EnableSmmu, .-VDMHAL_V400R003_EnableSmmu
	.align	2
	.global	VDMHAL_V400R003_GlbResetX
	.type	VDMHAL_V400R003_GlbResetX, %function
VDMHAL_V400R003_GlbResetX:
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
	mov	r7, r0
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L240
	ldr	r5, .L242
	ldr	r3, [r5]
	ldr	r6, [r3, #120]
	tst	r6, #1
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r8, .L242+4
	mov	r2, #2
	bfi	r6, r2, #8, #2
	str	r6, [r3, #120]
	mov	r4, #0
	orr	r6, r6, #16
	ldr	r3, [r8, #112]
	blx	r3
	ldr	r3, [r5]
	str	r6, [r3, #120]
	b	.L232
.L241:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L233
.L232:
	ldr	r2, [r8, #116]
	mov	r0, #30
	blx	r2
	ldr	r2, [r5]
	ldr	r2, [r2, #372]
	tst	r2, #1
	beq	.L241
	cmp	r4, #1000
	bge	.L233
	mov	r3, r7
	ldr	r2, .L242+8
	ldr	r1, .L242+12
	mov	r0, #0
	bl	dprint_vfmw
.L235:
	ldr	r2, [r5]
	bfc	r6, #4, #1
	ldr	r3, [r8, #112]
	str	r6, [r2, #120]
	bfc	r6, #8, #2
	blx	r3
	ldr	r3, [r5]
	str	r6, [r3, #120]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L233:
	mov	r3, r7
	ldr	r2, .L242+8
	ldr	r1, .L242+16
	mov	r0, #0
	bl	dprint_vfmw
	b	.L235
.L240:
	mov	r3, #0
	ldr	r2, .L242+8
	movt	r3, 63683
	ldr	r1, .L242+20
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L243:
	.align	2
.L242:
	.word	g_pstRegCrg
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+264
	.word	.LC31
	.word	.LC30
	.word	.LC29
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_GlbResetX, .-VDMHAL_V400R003_GlbResetX
	.align	2
	.global	VDMHAL_V400R003_GlbReset
	.type	VDMHAL_V400R003_GlbReset, %function
VDMHAL_V400R003_GlbReset:
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
	movt	r0, 63683
	bl	MEM_Phy2Vir
	cmp	r0, #0
	beq	.L246
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMHAL_V400R003_GlbResetX
.L246:
	mov	r3, #0
	ldr	r2, .L247
	movt	r3, 63683
	ldr	r1, .L247+4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L248:
	.align	2
.L247:
	.word	.LANCHOR0+292
	.word	.LC29
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_GlbReset, .-VDMHAL_V400R003_GlbReset
	.align	2
	.global	VDMHAL_V400R003_ClearIntState
	.type	VDMHAL_V400R003_ClearIntState, %function
VDMHAL_V400R003_ClearIntState:
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
	ldr	r7, .L265
	mov	r5, r0, asl #3
	mov	r8, r0, asl #6
	rsb	r3, r5, r8
	ldr	r2, .L265+4
	add	r3, r7, r3
	ldr	r3, [r3, #8]
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	ldrne	r4, [r3, #1168]
	moveq	r4, r3
	cmp	r0, #0
	bgt	.L262
	movw	r6, #1228
	ldr	r9, .L265+8
	mul	r6, r6, r0
	ldr	r3, [r9, r6]
	cmp	r3, #0
	beq	.L263
.L253:
	cmp	r4, #1
	beq	.L264
.L260:
	mvn	r2, #0
	str	r2, [r3, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L262:
	mov	r2, #0
	mov	r3, r0
	str	r2, [sp]
	mov	r0, r2
	ldr	r1, .L265+12
	ldr	r2, .L265+16
	bl	dprint_vfmw
.L249:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L264:
	rsb	r5, r5, r8
	add	r7, r7, r5
	ldr	r2, [r7, #44]
	cmp	r2, #1
	beq	.L260
	cmp	r2, #2
	ldr	r1, [r3, #28]
	mvneq	r2, #11
	streq	r2, [r3, #32]
	beq	.L249
	cmp	r2, #3
	mvneq	r2, #14
	streq	r2, [r3, #32]
	b	.L249
.L263:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r9, r6]
	bne	.L253
.L254:
	ldr	r1, .L265+20
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L266:
	.align	2
.L265:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_HwMem
	.word	.LC24
	.word	.LANCHOR0+320
	.word	.LC32
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_ClearIntState, .-VDMHAL_V400R003_ClearIntState
	.align	2
	.global	VDMHAL_V400R003_ClearMMUIntState
	.type	VDMHAL_V400R003_ClearMMUIntState, %function
VDMHAL_V400R003_ClearMMUIntState:
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
	subs	r3, r0, #0
	bgt	.L272
	movw	r2, #1228
	ldr	r5, .L274
	mul	r4, r2, r3
	ldr	r2, [r5, r4]
	cmp	r2, #0
	beq	.L273
.L270:
	add	r2, r2, #61440
	mov	r3, #7
	str	r3, [r2, #44]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L272:
	mov	r0, #0
	ldr	r2, .L274+4
	str	r0, [sp]
	ldr	r1, .L274+8
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L273:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r2, r0, #0
	strne	r2, [r5, r4]
	bne	.L270
.L271:
	ldr	r1, .L274+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L275:
	.align	2
.L274:
	.word	g_HwMem
	.word	.LANCHOR0+352
	.word	.LC24
	.word	.LC32
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_ClearMMUIntState, .-VDMHAL_V400R003_ClearMMUIntState
	.align	2
	.global	VDMHAL_V400R003_MaskInt
	.type	VDMHAL_V400R003_MaskInt, %function
VDMHAL_V400R003_MaskInt:
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
	subs	r3, r0, #0
	bgt	.L281
	movw	r2, #1228
	ldr	r5, .L283
	mul	r4, r2, r3
	ldr	r3, [r5, r4]
	cmp	r3, #0
	beq	.L282
.L279:
	mvn	r2, #0
	str	r2, [r3, #36]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L281:
	mov	r0, #0
	ldr	r2, .L283+4
	str	r0, [sp]
	ldr	r1, .L283+8
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L282:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r5, r4]
	bne	.L279
.L280:
	ldr	r1, .L283+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L284:
	.align	2
.L283:
	.word	g_HwMem
	.word	.LANCHOR0+388
	.word	.LC24
	.word	.LC32
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_MaskInt, .-VDMHAL_V400R003_MaskInt
	.align	2
	.global	VDMHAL_V400R003_GetIntMaskCfg
	.type	VDMHAL_V400R003_GetIntMaskCfg, %function
VDMHAL_V400R003_GetIntMaskCfg:
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
	mvneq	r0, #5
	mvnne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_GetIntMaskCfg, .-VDMHAL_V400R003_GetIntMaskCfg
	.align	2
	.global	VDMHAL_V400R003_EnableInt
	.type	VDMHAL_V400R003_EnableInt, %function
VDMHAL_V400R003_EnableInt:
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
	ldr	r2, .L299
	mov	r3, r0, asl #6
	ldr	r1, .L299+4
	sub	r3, r3, r0, asl #3
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	ldr	r3, [r1, r3, asl #2]
	cmp	r3, #0
	ldrne	r4, [r3, #1168]
	moveq	r4, r3
	cmp	r0, #0
	bgt	.L297
	movw	r5, #1228
	ldr	r6, .L299+8
	mul	r5, r5, r0
	ldr	r3, [r6, r5]
	cmp	r3, #0
	beq	.L298
.L292:
	cmp	r4, #1
	mvneq	r2, #5
	mvnne	r2, #1
	str	r2, [r3, #36]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L297:
	mov	r2, #0
	mov	r3, r0
	str	r2, [sp]
	mov	r0, r2
	ldr	r1, .L299+12
	ldr	r2, .L299+16
	bl	dprint_vfmw
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L298:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r6, r5]
	bne	.L292
.L293:
	ldr	r1, .L299+20
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_vfmw
.L300:
	.align	2
.L299:
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	g_HwMem
	.word	.LC24
	.word	.LANCHOR0+412
	.word	.LC32
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_EnableInt, .-VDMHAL_V400R003_EnableInt
	.align	2
	.global	VDMHAL_V400R003_CheckReg
	.type	VDMHAL_V400R003_CheckReg, %function
VDMHAL_V400R003_CheckReg:
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
	subs	r5, r1, #0
	mov	r7, r0
	bgt	.L318
	movw	r4, #1228
	ldr	r6, .L320
	mul	r4, r4, r5
	ldr	r3, [r6, r4]
	cmp	r3, #0
	beq	.L319
.L304:
	sub	r2, r7, #1
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L310
.L312:
	.word	.L315
	.word	.L313
	.word	.L314
	.word	.L316
	.word	.L306
	.word	.L308
	.word	.L309
.L316:
	mov	r3, #40
.L311:
	movw	r1, #1228
	mul	r5, r1, r5
	ldr	r2, [r6, r5]
	ldr	r0, [r2, r3]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L315:
	mov	r3, #28
	b	.L311
.L314:
	mov	r3, #36
	b	.L311
.L313:
	mov	r3, #32
	b	.L311
.L309:
	movw	r3, #62272
	b	.L311
.L306:
	movw	r3, #61480
	b	.L311
.L308:
	movw	r3, #62304
	b	.L311
.L310:
	mov	r3, r7
	ldr	r2, .L320+4
	ldr	r1, .L320+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L319:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r8, r0, #0
	beq	.L305
	str	r8, [r6, r4]
	b	.L304
.L318:
	mov	r3, r5
	ldr	r2, .L320+4
	ldr	r1, .L320+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L305:
	ldr	r2, .L320+4
	ldr	r1, .L320+16
	bl	dprint_vfmw
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L321:
	.align	2
.L320:
	.word	g_HwMem
	.word	.LANCHOR0+440
	.word	.LC35
	.word	.LC33
	.word	.LC34
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_CheckReg, .-VDMHAL_V400R003_CheckReg
	.align	2
	.global	VDMHAL_V400R003_ReadMMUMask
	.type	VDMHAL_V400R003_ReadMMUMask, %function
VDMHAL_V400R003_ReadMMUMask:
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
	subs	r3, r0, #0
	ble	.L325
	mov	r1, #1
	ldr	r2, .L326
	str	r1, [sp]
	mov	r0, #32
	ldr	r1, .L326+4
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L325:
	movw	r0, #1228
	ldr	r2, .L326+8
	mul	r3, r0, r3
	ldr	r3, [r2, r3]
	add	r3, r3, #61440
	ldr	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L327:
	.align	2
.L326:
	.word	.LANCHOR0+468
	.word	.LC36
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_ReadMMUMask, .-VDMHAL_V400R003_ReadMMUMask
	.align	2
	.global	VDMHAL_V400R003_WriteMMUMask
	.type	VDMHAL_V400R003_WriteMMUMask, %function
VDMHAL_V400R003_WriteMMUMask:
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
	subs	r3, r1, #0
	ble	.L331
	mov	r1, #1
	ldr	r2, .L332
	str	r1, [sp]
	mov	r0, #32
	ldr	r1, .L332+4
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L331:
	movw	r1, #1228
	ldr	r2, .L332+8
	mul	r3, r1, r3
	ldr	r3, [r2, r3]
	add	r3, r3, #61440
	str	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L333:
	.align	2
.L332:
	.word	.LANCHOR0+496
	.word	.LC28
	.word	g_HwMem
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_WriteMMUMask, .-VDMHAL_V400R003_WriteMMUMask
	.align	2
	.global	VDMHAL_V400R003_PrepareDec
	.type	VDMHAL_V400R003_PrepareDec, %function
VDMHAL_V400R003_PrepareDec:
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
	subs	r7, r1, #0
	mov	r4, r0
	mov	r5, r2
	mov	r6, r3
	beq	.L353
	cmp	r2, #0
	bgt	.L354
	sub	r1, r0, #6
	mov	r2, #0
	clz	r1, r1
	mov	r0, r2
	mov	r1, r1, lsr #5
	bl	SCD_ConfigReg
	mov	r3, r6
	mov	r2, #0
	mov	r1, #1
	mov	r0, #8
	bl	SCD_ConfigReg
	cmp	r4, #17
	ldrls	pc, [pc, r4, asl #2]
	b	.L336
.L339:
	.word	.L349
	.word	.L340
	.word	.L341
	.word	.L342
	.word	.L336
	.word	.L343
	.word	.L344
	.word	.L336
	.word	.L345
	.word	.L346
	.word	.L347
	.word	.L347
	.word	.L347
	.word	.L348
	.word	.L336
	.word	.L349
	.word	.L350
	.word	.L351
.L349:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	H264HAL_V400R003_StartDec
.L350:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	HEVCHAL_V400R003_StartDec
.L351:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP9HAL_V400R003_StartDec
.L340:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1HAL_V400R003_StartDec
.L341:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MP4HAL_V400R003_StartDec
.L342:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MP2HAL_V400R003_StartDec
.L343:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	DIVX3HAL_V400R003_StartDec
.L344:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVSHAL_V400R003_StartDec
.L345:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RV8HAL_V400R003_StartDec
.L346:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RV9HAL_V400R003_StartDec
.L347:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP6HAL_V400R003_StartDec
.L348:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP8HAL_V400R003_StartDec
.L353:
	mov	r3, r7
	mov	r0, r7
	ldr	r2, .L355
	ldr	r1, .L355+4
	bl	dprint_vfmw
.L336:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L354:
	mov	r3, r2
	mov	r0, #0
	ldr	r2, .L355
	str	r0, [sp]
	ldr	r1, .L355+8
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L356:
	.align	2
.L355:
	.word	.LANCHOR0+528
	.word	.LC37
	.word	.LC24
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_PrepareDec, .-VDMHAL_V400R003_PrepareDec
	.align	2
	.global	VDMHAL_V400R003_IsVdmReady
	.type	VDMHAL_V400R003_IsVdmReady, %function
VDMHAL_V400R003_IsVdmReady:
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
	movw	r2, #1228
	mul	r2, r2, r0
	ldr	r3, .L364
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L362
	cmp	r0, #0
	ble	.L363
	mov	r3, r0
	mov	r1, #1
	ldr	r2, .L364+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r1, .L364+8
	bl	dprint_vfmw
	mov	r0, #0
.L359:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L363:
	ldr	r0, [r3, #28]
	ubfx	r0, r0, #17, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L362:
	mov	r0, r3
	ldr	r2, .L364+4
	ldr	r3, .L364+12
	ldr	r1, .L364+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L359
.L365:
	.align	2
.L364:
	.word	g_HwMem
	.word	.LANCHOR0+556
	.word	.LC36
	.word	.LC38
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_IsVdmReady, .-VDMHAL_V400R003_IsVdmReady
	.align	2
	.global	VDMHAL_V400R003_IsVdmRun
	.type	VDMHAL_V400R003_IsVdmRun, %function
VDMHAL_V400R003_IsVdmRun:
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
	movw	r2, #1228
	mul	r2, r2, r0
	ldr	r3, .L373
	ldr	r4, [r3, r2]
	cmp	r4, #0
	beq	.L371
	cmp	r0, #0
	ble	.L372
	mov	r3, r0
	mov	r4, #1
	ldr	r2, .L373+4
	mov	r0, #32
	str	r4, [sp]
	ldr	r1, .L373+8
	bl	dprint_vfmw
	mov	r0, r4
.L368:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L372:
	ldr	r0, [r4, #40]
	subs	r0, r0, #1
	movne	r0, #1
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L371:
	ldr	r1, .L373+12
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	b	.L368
.L374:
	.align	2
.L373:
	.word	g_HwMem
	.word	.LANCHOR0+584
	.word	.LC36
	.word	.LC39
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_IsVdmRun, .-VDMHAL_V400R003_IsVdmRun
	.align	2
	.global	VDMHAL_V400R003_IsVdhDecOver
	.type	VDMHAL_V400R003_IsVdhDecOver, %function
VDMHAL_V400R003_IsVdhDecOver:
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
	movw	r2, #1228
	ldr	r3, .L385
	mul	r2, r2, r1
	mov	r4, r0
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L383
	bl	VDMHAL_V400R003_CheckReg
	cmp	r4, #1
	beq	.L379
	cmp	r4, #2
	bne	.L384
	and	r0, r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L384:
	mov	r3, r4
	ldr	r2, .L385+4
	ldr	r1, .L385+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L379:
	ubfx	r0, r0, #17, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L383:
	mov	r0, r3
	ldr	r2, .L385+4
	ldr	r3, .L385+12
	ldr	r1, .L385+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L386:
	.align	2
.L385:
	.word	g_HwMem
	.word	.LANCHOR0+612
	.word	.LC35
	.word	.LC38
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_IsVdhDecOver, .-VDMHAL_V400R003_IsVdhDecOver
	.align	2
	.global	VDMHAL_V400R003_IsVdhPartDecOver
	.type	VDMHAL_V400R003_IsVdhPartDecOver, %function
VDMHAL_V400R003_IsVdhPartDecOver:
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
	movw	r2, #1228
	ldr	r3, .L397
	mul	r2, r2, r1
	mov	r4, r0
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L395
	bl	VDMHAL_V400R003_CheckReg
	cmp	r4, #1
	beq	.L391
	cmp	r4, #2
	bne	.L396
	ubfx	r0, r0, #2, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L396:
	mov	r3, r4
	ldr	r2, .L397+4
	ldr	r1, .L397+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L391:
	ubfx	r0, r0, #19, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L395:
	mov	r0, r3
	ldr	r2, .L397+4
	ldr	r3, .L397+12
	ldr	r1, .L397+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L398:
	.align	2
.L397:
	.word	g_HwMem
	.word	.LANCHOR0+644
	.word	.LC35
	.word	.LC38
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_IsVdhPartDecOver, .-VDMHAL_V400R003_IsVdhPartDecOver
	.align	2
	.global	VDMHAL_V400R003_UpdateHardwareInfo
	.type	VDMHAL_V400R003_UpdateHardwareInfo, %function
VDMHAL_V400R003_UpdateHardwareInfo:
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
	subs	r4, r0, #0
	bgt	.L400
	ldr	r2, .L448
	ldr	r3, [r2]
	cmp	r3, #1
	addne	r1, r2, #124
	bne	.L404
	b	.L401
.L444:
	cmp	r2, r1
	beq	.L443
.L404:
	ldr	r3, [r2, #4]!
	cmp	r3, #1
	bne	.L444
.L401:
	movw	r3, #1228
	ldr	r7, .L448+4
	mul	r3, r3, r4
	ldr	r3, [r7, r3]
	cmp	r3, #0
	beq	.L445
	mov	r2, #180
	ldr	r0, [r3, #12]
	mul	r2, r2, r4
	ldr	r6, .L448+8
	mov	r5, #1
	add	r1, r6, r2
	str	r0, [r6, r2]
	ldr	r8, [r3, #28]
	str	r8, [r1, #4]
.L407:
	movw	r3, #1228
	ubfx	r8, r8, #0, #17
	mla	r3, r3, r4, r7
	ldr	r0, [r3, #40]
	bl	MEM_Phy2Vir
	subs	ip, r0, #0
	beq	.L446
	movw	r1, #1228
	sub	r3, r8, #1
	mul	r1, r1, r4
	cmp	r3, #199
	subls	r3, r8, #-1073741823
	mov	r2, #180
	mla	r2, r2, r4, r6
	movls	r3, r3, asl #4
	movhi	r3, #0
	addls	r0, r3, #8
	ldr	lr, [ip, r3]
	movhi	r0, #8
	ldr	r3, [r7, r1]
	str	lr, [r2, #16]
	ldr	lr, [r3, #208]
	ldr	r0, [ip, r0]
	ldr	r1, [r3, #212]
	str	lr, [r2, #8]
	str	r0, [r2, #20]
	str	r1, [r2, #12]
	b	.L411
.L443:
	movw	r3, #1228
	ldr	r7, .L448+4
	mul	r3, r3, r4
	ldr	r3, [r7, r3]
	cmp	r3, #0
	beq	.L447
	mov	r2, #180
	ldr	r0, [r3, #12]
	mul	r2, r2, r4
	ldr	r6, .L448+8
	mov	r5, #0
	add	r1, r6, r2
	str	r0, [r6, r2]
	ldr	r2, [r3, #28]
	str	r2, [r1, #4]
.L408:
	mov	r2, #180
	add	r1, r3, #4096
	mla	r2, r2, r4, r6
	ldr	lr, [r1]
	ldr	ip, [r1, #20]
	cmp	r5, #0
	ldr	r0, [r3, #208]
	ldr	r1, [r3, #212]
	str	lr, [r2, #16]
	str	ip, [r2, #20]
	str	r0, [r2, #8]
	str	r1, [r2, #12]
	bne	.L411
	ldr	r7, [r3, #176]
	ldr	lr, [r3, #180]
	ldr	ip, [r3, #184]
	ldr	r0, [r3, #188]
	ldr	r1, [r3, #192]
	str	r7, [r2, #24]
	str	lr, [r2, #28]
	str	ip, [r2, #32]
	str	r0, [r2, #36]
	str	r1, [r2, #40]
.L411:
	mov	lr, #180
	add	r1, r3, #33024
	mul	lr, lr, r4
	add	r2, lr, #48
	add	lr, lr, #176
	add	r2, r6, r2
	add	lr, r6, lr
.L412:
	ldr	ip, [r1], #4
	str	ip, [r2, #4]!
	cmp	r2, lr
	bne	.L412
	cmp	r5, #0
	movne	r0, #0
	bne	.L433
	mov	r2, #180
	add	r3, r3, #32768
	mla	r4, r2, r4, r6
	ldr	r2, [r3, #384]
	ldr	r3, [r3, #388]
	mov	r0, r5
	str	r2, [r4, #48]
	str	r3, [r4, #44]
.L433:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L400:
	mov	r0, #0
	mov	r3, r4
	str	r0, [sp]
	ldr	r2, .L448+12
	ldr	r1, .L448+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L433
.L445:
	mov	r5, #1
.L415:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L406
	movw	r1, #1228
	mov	r2, #180
	mul	r1, r1, r4
	ldr	r6, .L448+8
	mul	r2, r2, r4
	cmp	r5, #1
	str	r3, [r7, r1]
	add	r1, r6, r2
	ldr	r0, [r3, #12]
	str	r0, [r6, r2]
	ldr	r8, [r3, #28]
	str	r8, [r1, #4]
	bne	.L408
	b	.L407
.L447:
	mov	r5, r3
	b	.L415
.L446:
	ldr	r3, .L448+20
	ldr	r2, .L448+12
	ldr	r1, .L448+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L433
.L406:
	ldr	r1, .L448+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L433
.L449:
	.align	2
.L448:
	.word	g_DSPState
	.word	g_HwMem
	.word	g_BackUp
	.word	.LANCHOR0+680
	.word	.LC24
	.word	.LC40
	.word	.LC1
	.word	.LC32
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_UpdateHardwareInfo, .-VDMHAL_V400R003_UpdateHardwareInfo
	.align	2
	.global	VDMHAL_V400R003_ReadMsgSlot
	.type	VDMHAL_V400R003_ReadMsgSlot, %function
VDMHAL_V400R003_ReadMsgSlot:
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
	cmpne	r0, #0
	mov	r3, r1
	moveq	r4, #1
	movne	r4, #0
	beq	.L454
	cmp	r2, #800
	bhi	.L455
	ldr	r3, .L456
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L455:
	mov	r0, r4
	ldr	r1, .L456+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L454:
	mov	r2, r0
	ldr	r1, .L456+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L457:
	.align	2
.L456:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC42
	.word	.LC41
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_ReadMsgSlot, .-VDMHAL_V400R003_ReadMsgSlot
	.align	2
	.global	VDMHAL_V400R003_WriteMsgSlot
	.type	VDMHAL_V400R003_WriteMsgSlot, %function
VDMHAL_V400R003_WriteMsgSlot:
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
	cmpne	r0, #0
	moveq	r4, #1
	movne	r4, #0
	beq	.L459
	sub	r3, r2, #1
	cmp	r3, #255
	bhi	.L459
	ldr	r3, .L462
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L459:
	ldr	r1, .L462+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L463:
	.align	2
.L462:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC43
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_WriteMsgSlot, .-VDMHAL_V400R003_WriteMsgSlot
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	2
	.global	VDMHAL_V400R003_CfgRpMsg
	.type	VDMHAL_V400R003_CfgRpMsg, %function
VDMHAL_V400R003_CfgRpMsg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #68)
	sub	sp, sp, #68
	mov	r7, r0
	ldr	r0, [r1, #48]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	str	r3, [fp, #-68]
	beq	.L501
	ldr	r2, [r7, #840]
	sub	r3, r2, #1
	cmp	r3, #199
	bhi	.L502
	ldr	r1, [r7, #24]
	ldr	r0, [r7, #864]
	ldr	ip, [r7, #848]
	mov	r1, r1, asl r0
	ldr	r3, [r7, #28]
	add	r2, r1, #255
	cmp	ip, #1
	bic	r2, r2, #255
	mov	r3, r3, asl r0
	movne	r1, #0
	mov	lr, r2, asl #4
	beq	.L503
.L468:
	ldr	r0, [r7]
	cmp	r0, #16
	beq	.L469
	add	r3, r3, #31
	mov	r0, #8
	bic	r3, r3, #31
	str	r0, [fp, #-80]
	mla	r3, r3, r2, r1
.L490:
	ldr	r2, [r7, #16]
	ldr	r4, [fp, #-68]
	mov	ip, #0	@ movhi
	mov	r0, ip	@ movhi
	str	r2, [r4]
	ldr	r2, [r7, #16]
	add	r2, r3, r2
	str	r2, [r4, #4]
	ldr	r2, [r7, #4]
	str	r2, [r4, #8]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r4, #12]
	str	lr, [r4, #16]
	str	r1, [r4, #20]
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #28]
	sub	r2, r2, #1
	sub	r3, r3, #1
	bfi	ip, r2, #0, #9
	bfi	r0, r3, #0, #9
	strh	ip, [fp, #-52]	@ movhi
	strh	r0, [fp, #-50]	@ movhi
	ldr	r3, [fp, #-52]
	str	r3, [r4, #24]
	ldr	r3, [r7, #852]
	ldr	r1, [r7, #856]
	sub	r3, r3, #1
	ldr	r2, [r7, #24]
	cmp	r3, #1
	ldr	r3, [r7, #28]
	str	r2, [fp, #-76]
	addls	r3, r3, r3, lsr #31
	movls	r3, r3, asr #1
	cmp	r1, #0
	str	r3, [fp, #-84]
	movne	r3, #0
	strne	r3, [fp, #-60]
	beq	.L504
.L472:
	cmp	r1, #1
	beq	.L488
	ldr	r3, [fp, #-60]
	sub	r3, r3, #1
	uxth	r3, r3
.L489:
	ldr	r1, [r7, #848]
	mov	r0, #0
	ldrb	r2, [fp, #-50]	@ zero_extendqisi2
	ldr	ip, [r7, #852]
	ldr	lr, [r7, #864]
	bfi	r2, r1, #0, #1
	ldrb	r1, [fp, #-49]	@ zero_extendqisi2
	and	ip, ip, #3
	sub	lr, lr, #4
	bfi	r2, ip, #4, #2
	bfi	r1, lr, #0, #2
	strh	r3, [fp, #-52]	@ movhi
	mov	r3, r2
	bfi	r3, ip, #6, #2
	mov	r2, r1
	ldr	r1, [fp, #-80]
	strb	r3, [fp, #-50]
	bfi	r2, r1, #2, #4
	strb	r2, [fp, #-49]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-68]
	str	r3, [r2, #28]
.L499:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L504:
	ldr	r3, [r7, #864]
	cmp	r3, #6
	moveq	r4, #2
	beq	.L473
	cmp	r3, #5
	moveq	r4, #4
	beq	.L473
	cmp	r3, #4
	moveq	r4, #8
	bne	.L505
.L473:
	ldr	r8, [r7, #840]
	cmp	r8, #0
	movle	r3, #0
	ldrle	r1, [r7, #856]
	strle	r3, [fp, #-60]
	ble	.L472
	ldr	r2, [fp, #-84]
	mov	r6, #0
	ldr	r3, [fp, #-76]
	str	r6, [fp, #-72]
	str	r6, [fp, #-60]
	mul	r3, r3, r2
	str	r7, [fp, #-56]
	sub	r2, r4, #1
	str	r2, [fp, #-88]
	str	r3, [fp, #-92]
	sub	r3, r3, #1
	str	r3, [fp, #-96]
	b	.L476
.L508:
	ldrsh	r0, [r5, #38]
	mov	r1, r4
	sub	r0, r0, #1
	add	r0, r0, r4
	bl	__aeabi_uidiv
	mul	r3, r4, r0
	cmp	r10, r3
	str	r3, [fp, #-72]
	ldrgt	r10, [fp, #-88]
	bgt	.L479
.L478:
	ldr	r3, [fp, #-56]
	add	r6, r6, #1
	ldr	r8, [r3, #840]
	cmp	r6, r8
	bge	.L506
	cmp	r6, #199
	bgt	.L507
.L476:
	ldr	r3, [fp, #-56]
	mov	r1, r4
	add	r5, r3, r6, lsl #2
	ldrsh	r7, [r5, #42]
	ldrh	r3, [r5, #40]
	sub	r0, r7, #1
	add	r0, r0, r4
	str	r3, [fp, #-64]
	bl	__aeabi_uidiv
	cmp	r6, #0
	mul	r10, r4, r0
	bgt	.L508
	ldr	r2, [fp, #-72]
	cmp	r10, r2
	movgt	r2, #0
	movle	r2, #1
	cmp	r6, #0
	moveq	r2, #0
	cmp	r2, #0
	bne	.L478
.L481:
	ldrsh	r0, [fp, #-64]
	mov	r1, r4
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-92]
	ldr	r5, [fp, #-96]
	cmp	r3, r10
	ldr	r3, [fp, #-60]
	movhi	r5, r10
	add	r3, r3, #1
	str	r3, [fp, #-60]
	mul	r8, r4, r0
	cmp	r8, r5
	movgt	r8, #0
	cmp	r3, #252
	bgt	.L509
	ldr	r7, [fp, #-76]
	mov	r0, r8
	mov	r1, r7
	bl	__aeabi_uidivmod
	mov	r0, r8
	mov	r3, #0	@ movhi
	bfi	r3, r1, #0, #9
	mov	r1, r7
	strh	r3, [fp, #-48]	@ movhi
	bl	__aeabi_uidiv
	mov	r3, #0	@ movhi
	ldr	r2, [fp, #-60]
	ldr	r9, [fp, #-68]
	mov	r1, r7
	add	r2, r2, #5
	mov	r8, r2, asl #3
	add	r8, r8, #4
	bfi	r3, r0, #0, #9
	strh	r3, [fp, #-46]	@ movhi
	ldr	r3, [fp, #-48]
	mov	r0, r5
	str	r3, [r9, r2, asl #3]
	bl	__aeabi_uidivmod
	mov	r0, r5
	mov	r3, #0	@ movhi
	bfi	r3, r1, #0, #9
	mov	r1, r7
	strh	r3, [fp, #-48]	@ movhi
	bl	__aeabi_uidiv
	mov	r3, #0	@ movhi
	bfi	r3, r0, #0, #9
	strh	r3, [fp, #-46]	@ movhi
	ldr	r3, [fp, #-48]
	str	r3, [r9, r8]
	b	.L478
.L482:
	bl	__aeabi_uidiv
	mov	r1, r4
	mul	r7, r4, r0
	ldrsh	r0, [r5, #44]
	bl	__aeabi_uidiv
	mul	r0, r4, r0
	cmp	r7, r0
	add	r2, r0, #1
	bhi	.L483
	cmp	r7, r2
	mov	r1, r4
	beq	.L483
	ldrsh	r0, [r5, #38]
	add	r0, r0, r10
	bl	__aeabi_uidiv
	mul	r0, r4, r0
	cmp	r7, r0
	bhi	.L510
.L483:
	cmp	r9, #198
	mov	r6, r9
	add	r5, r5, #4
	bgt	.L511
	ldrsh	r7, [r5, #42]
.L479:
	add	r9, r6, #1
	mov	r1, r4
	cmp	r9, r8
	add	r0, r10, r7
	blt	.L482
	ldr	r3, [fp, #-88]
	add	r0, r3, r7
	bl	__aeabi_uidiv
	mul	r10, r4, r0
	b	.L481
.L511:
	ldr	r3, [fp, #-56]
	mov	r1, r4
	add	r3, r3, r9, lsl #2
	ldrsh	r0, [r3, #42]
	sub	r0, r0, #1
	add	r0, r0, r4
	bl	__aeabi_uidiv
	mul	r10, r4, r0
	b	.L481
.L469:
	mla	r3, r2, r3, r1
	mov	r2, #10
	str	r2, [fp, #-80]
	b	.L490
.L503:
	add	r0, r1, #508
	adds	ip, r3, #63
	add	r0, r0, #3
	addmi	ip, r3, #126
	add	r1, r1, #1020
	cmp	r0, #0
	add	r1, r1, #2
	movge	r1, r0
	mov	r0, ip, asr #6
	mov	r1, r1, asr #9
	mov	r0, r0, asl #5
	mov	r1, r1, asl #4
	mul	r1, r1, r0
	b	.L468
.L509:
	ldr	r7, [fp, #-56]
	mov	r1, #1
	str	r1, [r7, #856]
.L488:
	ldr	r3, [fp, #-76]
	mov	lr, #0	@ movhi
	mov	ip, lr	@ movhi
	str	r1, [r7, #840]
	sub	r2, r3, #1
	ldr	r3, [fp, #-84]
	ldr	r1, [fp, #-68]
	sub	r0, r3, #1
	mov	r3, #0
	bfi	lr, r3, #0, #9
	bfi	ip, r3, #0, #9
	strh	lr, [fp, #-52]	@ movhi
	strh	ip, [fp, #-50]	@ movhi
	mov	ip, #0	@ movhi
	ldr	lr, [fp, #-52]
	bfi	ip, r2, #0, #9
	mov	r2, #0	@ movhi
	strh	ip, [fp, #-52]	@ movhi
	bfi	r2, r0, #0, #9
	strh	r2, [fp, #-50]	@ movhi
	ldr	r2, [fp, #-52]
	str	lr, [r1, #48]
	str	r2, [r1, #52]
	b	.L489
.L510:
	mov	r10, r7
	b	.L481
.L506:
	mov	r7, r3
	ldr	r1, [r3, #856]
	b	.L472
.L507:
	ldr	r7, [fp, #-56]
	mov	r0, #0
	ldr	r1, .L512
	movw	r3, #2130
	str	r6, [sp]
	ldr	r2, .L512+4
	str	r0, [fp, #-60]
	bl	dprint_vfmw
	ldr	r1, [r7, #856]
	b	.L472
.L505:
	ldr	r1, .L512+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r4, #1
	b	.L473
.L502:
	ldr	r1, .L512+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L499
.L501:
	ldr	r3, .L512+16
	ldr	r2, .L512+20
	ldr	r1, .L512+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L499
.L513:
	.align	2
.L512:
	.word	.LC47
	.word	.LANCHOR0+744
	.word	.LC46
	.word	.LC45
	.word	.LC44
	.word	.LANCHOR0+716
	.word	.LC1
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_CfgRpMsg, .-VDMHAL_V400R003_CfgRpMsg
	.align	2
	.global	VDMHAL_V400R003_CfgRpReg
	.type	VDMHAL_V400R003_CfgRpReg, %function
VDMHAL_V400R003_CfgRpReg:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #28)
	sub	sp, sp, #28
	subs	r6, r3, #0
	mov	r0, #0
	str	r0, [fp, #-32]
	bgt	.L548
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L549
.L517:
	ldr	r4, .L551
	ldr	r3, [r1, #48]
	ldrb	r2, [r4]	@ zero_extendqisi2
	bic	r3, r3, #15
	str	r3, [fp, #-32]
	cmp	r2, #1
	bne	.L550
	movw	r1, #1228
	ldr	r2, .L551+4
	mul	r1, r1, r6
	ldr	r1, [r2, r1]
	str	r3, [r1, #16]
.L520:
	movw	r3, #1228
	movw	r1, #53763
	mul	r3, r3, r6
	movt	r1, 8192
	ldr	r3, [r2, r3]
	str	r1, [r3, #12]
.L522:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #60]
.L524:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #64]
.L526:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #68]
.L528:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #72]
.L530:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #76]
.L532:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #80]
.L534:
	movw	r3, #1228
	movw	r1, #3075
	mul	r6, r3, r6
	mov	r0, #0
	movt	r1, 48
	ldr	r3, [r2, r6]
	str	r1, [r3, #84]
.L537:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L550:
	mov	r2, #16
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r2, [r4]	@ zero_extendqisi2
	movw	r3, #53763
	cmp	r2, #1
	movt	r3, 8192
	str	r3, [fp, #-32]
	ldreq	r2, .L551+4
	beq	.L520
	mov	r2, #12
	mov	r1, #2
	ldr	r0, [fp, #4]
	movw	r5, #3075
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	movt	r5, 48
	str	r5, [fp, #-32]
	cmp	r3, #1
	ldreq	r2, .L551+4
	beq	.L522
	mov	r3, r5
	mov	r2, #60
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L551+4
	beq	.L524
	mov	r3, r5
	mov	r2, #64
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L551+4
	beq	.L526
	mov	r3, r5
	mov	r2, #68
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L551+4
	beq	.L528
	mov	r3, r5
	mov	r2, #72
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L551+4
	beq	.L530
	mov	r3, r5
	mov	r2, #76
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L551+4
	beq	.L532
	mov	r3, r5
	mov	r2, #80
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L551+4
	beq	.L534
	ldr	r0, [fp, #4]
	mov	r3, r5
	mov	r2, #84
	mov	r1, #2
	bl	VDH_Record_RegData
	mov	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L549:
	mov	r0, #0
	str	r1, [fp, #-40]
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L518
	ldr	r1, [fp, #-40]
	str	r3, [r1]
	b	.L517
.L548:
	str	r0, [sp]
	ldr	r2, .L551+8
	ldr	r1, .L551+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L537
.L518:
	ldr	r1, .L551+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L537
.L552:
	.align	2
.L551:
	.word	g_HalDisable
	.word	g_HwMem
	.word	.LANCHOR0+768
	.word	.LC24
	.word	.LC32
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_CfgRpReg, .-VDMHAL_V400R003_CfgRpReg
	.align	2
	.global	VDMHAL_V400R003_MakeDecReport
	.type	VDMHAL_V400R003_MakeDecReport, %function
VDMHAL_V400R003_MakeDecReport:
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
	UNWIND(.pad #20)
	sub	sp, sp, #20
	subs	r3, r0, #0
	beq	.L582
	ldr	r5, [r3, #4]
	ldr	r8, [r3]
	cmp	r5, #0
	ldr	r6, [r3, #8]
	beq	.L583
	movw	r3, #1228
	ldr	r7, .L591
	mul	r3, r3, r6
	ldr	r0, [r7, r3]
	cmp	r0, #0
	beq	.L557
	ldr	r3, .L591+4
	ldr	r2, [r3]
	cmp	r2, #1
	addne	r1, r3, #124
	bne	.L560
	b	.L572
.L585:
	cmp	r3, r1
	beq	.L584
.L560:
	ldr	r2, [r3, #4]!
	cmp	r2, #1
	bne	.L585
.L572:
	mov	r4, r2
.L558:
	ldr	r3, .L591+8
	mov	r2, #816
	mov	r1, #0
	mov	r0, r5
	ldr	r3, [r3, #48]
	blx	r3
	movw	r3, #1228
	mla	r3, r3, r6, r7
	ldr	r1, .L591+12
	mov	r2, #180
	mla	r2, r2, r6, r1
	ldr	r3, [r3, #24]
	str	r3, [r5, #4]
	ldr	r3, [r2, #4]
	mov	r3, r3, lsr #17
	and	r2, r3, #3
	cmp	r2, #1
	moveq	r3, #0
	beq	.L561
	eor	r3, r3, #1
	and	r3, r3, #1
	cmp	r8, #3
	orrne	r3, r3, #1
.L561:
	mov	r2, #180
	str	r3, [r5]
	mla	r3, r2, r6, r1
	cmp	r8, #0
	cmpne	r8, #15
	ldr	r2, [r3, #4]
	ubfx	r2, r2, #0, #17
	str	r2, [r5, #8]
	beq	.L586
.L562:
	cmp	r2, #200
	bhi	.L587
.L564:
	movw	r3, #1228
	mla	r7, r3, r6, r7
	ldr	r7, [r7, #40]
	mov	r0, r7
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L588
	ldr	r8, .L591+16
	mov	r3, #3200
	ldr	r2, [r5, #8]
	mla	r4, r3, r6, r8
	mov	r2, r2, asl #2
	mov	r0, r4
	bl	VDMHAL_V400R003_ReadMsgSlot
	ldr	ip, [r5, #8]
	cmp	ip, #0
	movne	r3, r4
	movne	r2, r5
	movne	r1, #0
	beq	.L569
.L568:
	ldr	r0, [r3, #4]
	add	r1, r1, #1
	cmp	r1, ip
	add	r3, r3, #16
	add	r2, r2, #4
	strh	r0, [r2, #8]	@ movhi
	ldr	r0, [r3, #-8]
	strh	r0, [r2, #10]	@ movhi
	bne	.L568
.L569:
	mov	r0, #6
	bl	IsDprintTypeEnable
	cmp	r0, #0
	bne	.L589
.L555:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L586:
	cmp	r4, #1
	beq	.L590
	ldr	r1, .L591+20
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L562
	ldrb	r3, [r3, #19]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L562
	mov	r3, #1
	strh	r1, [r5, #12]	@ movhi
	mov	r0, r1
	strh	r1, [r5, #14]	@ movhi
	str	r3, [r5, #8]
	b	.L555
.L584:
	mov	r4, #0
	b	.L558
.L589:
	ldr	r2, [r5, #8]
	mov	r0, #6
	ldr	r1, .L591+24
	mov	r4, #0
	bl	dprint_vfmw
	mov	r2, r7
	ldr	r1, .L591+28
	mov	r0, #6
	bl	dprint_vfmw
	mov	r3, #3200
	mla	r6, r3, r6, r8
.L570:
	ldr	r1, [r6, #4]
	ldr	lr, [r6, #12]
	mov	r2, r4
	ldr	ip, [r6, #8]
	mov	r0, #6
	ldr	r3, [r6]
	add	r4, r4, #4
	str	r1, [sp]
	add	r6, r6, #16
	str	lr, [sp, #8]
	str	ip, [sp, #4]
	ldr	r1, .L591+32
	bl	dprint_vfmw
	ldr	r3, [r5, #8]
	mov	r3, r3, asl #2
	sub	r3, r3, #3
	cmp	r3, r4
	bhi	.L570
	ldr	r1, .L591+36
	mov	r0, #6
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L587:
	mov	r3, #200
	ldr	r1, .L591+40
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r5, #8]
	b	.L564
.L590:
	ldr	r3, [r3, #16]
	ubfx	r3, r3, #21, #2
	cmp	r3, #2
	bne	.L562
	mov	r3, #0
	str	r4, [r5, #8]
	strh	r3, [r5, #12]	@ movhi
	mov	r0, r3
	strh	r3, [r5, #14]	@ movhi
	b	.L555
.L588:
	ldr	r3, .L591+44
	ldr	r2, .L591+48
	ldr	r1, .L591+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L555
.L557:
	ldr	r3, .L591+56
	ldr	r2, .L591+48
	ldr	r1, .L591+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L555
.L583:
	mov	r0, r5
	ldr	r3, .L591+60
	ldr	r2, .L591+48
	ldr	r1, .L591+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L555
.L582:
	ldr	r3, .L591+64
	ldr	r2, .L591+48
	ldr	r1, .L591+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L555
.L592:
	.align	2
.L591:
	.word	g_HwMem
	.word	g_DSPState
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_BackUp
	.word	g_UpMsg
	.word	g_not_allow_H264FullPictureRepair_flag
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC50
	.word	.LC40
	.word	.LANCHOR0+796
	.word	.LC1
	.word	.LC38
	.word	.LC49
	.word	.LC48
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_MakeDecReport, .-VDMHAL_V400R003_MakeDecReport
	.align	2
	.global	VDMHAL_V400R003_PrepareRepair
	.type	VDMHAL_V400R003_PrepareRepair, %function
VDMHAL_V400R003_PrepareRepair:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 8
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
	movw	r4, #1228
	mul	r4, r4, r3
	ldr	r5, .L608
	cmp	r3, #0
	mov	r6, r3
	mov	r7, r0
	add	r8, r4, r5
	bgt	.L604
	ldr	r3, [r4, r5]
	cmp	r3, #0
	beq	.L605
.L596:
	cmp	r2, #0
	beq	.L606
	cmp	r2, #1
	movne	r0, #0
	beq	.L607
.L595:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L606:
	ldr	r4, .L608+4
	movw	r3, #1752
	mla	r3, r3, r6, r4
	ldr	r0, [r3, #840]
	cmp	r0, #0
	ble	.L599
	cmp	r7, #6
	bne	.L600
	ldrb	r0, [r1, #17]	@ zero_extendqisi2
	cmp	r0, #1
	moveq	r2, r0
	str	r2, [r3, #1728]
.L600:
	ldr	r3, [fp, #4]
	mov	r2, r1
	mov	r0, r7
	mov	r1, r8
	str	r3, [sp]
	mov	r3, r6
	bl	VDMHAL_V400R003_CfgRpReg
	movw	r0, #1752
	mov	r1, r8
	mov	r2, r6
	mla	r0, r0, r6, r4
	bl	VDMHAL_V400R003_CfgRpMsg
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L607:
	cmp	r7, #6
	bne	.L602
	ldrb	r3, [r1, #17]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L602
	movw	r4, #1752
	ldr	r5, .L608+4
	mul	r4, r4, r6
	add	ip, r5, r4
	ldr	r3, [ip, #1716]
	cmp	r3, #0
	ble	.L602
	ldr	r3, [fp, #4]
	mov	lr, #2
	mov	r2, r1
	mov	r0, r7
	mov	r1, r8
	str	r3, [sp]
	mov	r3, r6
	str	lr, [ip, #1728]
	bl	VDMHAL_V400R003_CfgRpReg
	add	r0, r4, #876
	mov	r2, r6
	add	r0, r5, r0
	mov	r1, r8
	bl	VDMHAL_V400R003_CfgRpMsg
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L605:
	mov	r0, #0
	str	r2, [fp, #-44]
	movt	r0, 63683
	str	r1, [fp, #-40]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L597
	str	r3, [r4, r5]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-44]
	b	.L596
.L604:
	mov	r0, #0
	ldr	r2, .L608+8
	str	r0, [sp]
	ldr	r1, .L608+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L595
.L602:
	ldr	r1, .L608+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L595
.L599:
	mov	r0, r2
	ldr	r1, .L608+20
	str	r2, [fp, #-40]
	bl	dprint_vfmw
	ldr	r2, [fp, #-40]
	mov	r0, r2
	b	.L595
.L597:
	ldr	r1, .L608+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L595
.L609:
	.align	2
.L608:
	.word	g_HwMem
	.word	g_RepairParam
	.word	.LANCHOR0+828
	.word	.LC24
	.word	.LC57
	.word	.LC56
	.word	.LC55
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_PrepareRepair, .-VDMHAL_V400R003_PrepareRepair
	.align	2
	.global	VDMHAL_V400R003_StartHwRepair
	.type	VDMHAL_V400R003_StartHwRepair, %function
VDMHAL_V400R003_StartHwRepair:
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
	ldr	r6, .L640
	mov	r5, r0
	mov	r4, r1
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L634
	cmp	r0, #0
	ble	.L635
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, .L640+4
	mov	r0, #32
	ldr	r1, .L640+8
	bl	dprint_vfmw
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L636
.L618:
	mov	r2, #1
	mov	r3, r5
	str	r2, [sp]
	mov	r0, #32
	ldr	r2, .L640+4
	ldr	r1, .L640+8
	bl	dprint_vfmw
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L630
.L613:
	cmp	r4, #0
	beq	.L637
	mov	r3, r5, asl #6
	ldr	r2, .L640+12
	sub	r3, r3, r5, asl #3
	mov	r1, #1
	add	r3, r2, r3
	str	r1, [r4, #4]
	mov	r0, r4
	ldr	r3, [r3, #8]
	strb	r1, [r4, #2]
	strb	r5, [r4]
	str	r3, [r4, #8]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	VDH_PostTask
.L635:
	movw	r3, #1228
	ldr	r4, .L640+16
	mul	r3, r3, r0
	mov	r2, #67108864
	ldr	r3, [r4, r3]
	str	r2, [r3, #8]
.L616:
	movw	r3, #1228
	ldr	r2, .L640+20
	mul	r3, r3, r5
	mvn	r1, #1
	ldr	r3, [r4, r3]
	str	r1, [r3, #36]
	ldr	r3, [r2, #112]
	blx	r3
.L625:
	movw	r3, #1228
	mov	r2, #0
	mul	r5, r3, r5
	mov	r1, #1
	ldr	r3, [r4, r5]
	str	r2, [r3]
	ldr	r3, [r4, r5]
	str	r1, [r3]
	ldr	r3, [r4, r5]
	str	r2, [r3]
.L610:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L634:
	mov	r3, #67108864
	mov	r2, #8
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L638
	cmp	r5, #0
	ldrle	r4, .L640+16
	bgt	.L618
	b	.L616
.L638:
	mvn	r3, #1
	mov	r2, #36
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L613
	ldr	r3, .L640+20
	ldr	r3, [r3, #112]
	blx	r3
	cmp	r5, #0
	ble	.L639
.L622:
	mov	r4, #1
	mov	r3, r5
	str	r4, [sp]
	mov	r0, #32
	ldr	r2, .L640+24
	ldr	r1, .L640+8
	bl	dprint_vfmw
	mov	r3, r5
	str	r4, [sp]
	mov	r0, #32
	ldr	r2, .L640+24
	ldr	r1, .L640+8
	bl	dprint_vfmw
	str	r4, [sp]
	mov	r3, r5
	ldr	r2, .L640+24
	ldr	r1, .L640+8
	mov	r0, #32
	bl	dprint_vfmw
	b	.L610
.L636:
	mvn	r3, #1
	mov	r2, #36
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L613
.L630:
	ldr	r3, .L640+20
	ldr	r3, [r3, #112]
	blx	r3
	b	.L622
.L637:
	mov	r3, r4
	mov	r0, r4
	ldr	r2, .L640+24
	ldr	r1, .L640+28
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_vfmw
.L639:
	ldr	r4, .L640+16
	b	.L625
.L641:
	.align	2
.L640:
	.word	g_HalDisable
	.word	.LANCHOR0+860
	.word	.LC28
	.word	g_VdmDrvParam
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+876
	.word	.LC58
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_StartHwRepair, .-VDMHAL_V400R003_StartHwRepair
	.align	2
	.global	VDMHAL_V400R003_CalVdhClkSkip
	.type	VDMHAL_V400R003_CalVdhClkSkip, %function
VDMHAL_V400R003_CalVdhClkSkip:
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
	ldr	r6, .L668
	ldr	r10, [r6, #128]
	cmp	r10, #0
	blt	.L663
	ldr	r8, .L668+4
	add	r4, r6, #128
	ldr	r7, .L668+8
	add	r6, r6, #252
	mov	r5, #30
	mov	r9, #0
.L644:
	mov	r0, r10
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L667
	ldr	r2, [r8, r10, asl #2]
	mov	r0, r10
	ldr	r1, [r7, r10, asl #2]
	ldr	r3, [r2, #28]
	ldr	r2, [r2, #32]
	adds	r9, r3, #15
	ldr	r1, [r1, #1456]
	addmi	r9, r3, #30
	adds	r3, r2, #15
	addmi	r3, r2, #30
	cmp	r1, #30
	mov	r9, r9, asr #4
	movgt	r5, r1
	mov	r10, r3, asr #4
	bl	VCTRL_GetVidStd
	cmp	r0, #17
	ldrls	pc, [pc, r0, asl #2]
	b	.L664
.L649:
	.word	.L658
	.word	.L658
	.word	.L658
	.word	.L658
	.word	.L664
	.word	.L658
	.word	.L658
	.word	.L664
	.word	.L658
	.word	.L658
	.word	.L658
	.word	.L658
	.word	.L658
	.word	.L658
	.word	.L664
	.word	.L659
	.word	.L658
	.word	.L658
.L658:
	mul	r9, r10, r9
	mul	r9, r9, r5
.L646:
	cmp	r4, r6
	beq	.L666
	ldr	r10, [r4, #4]!
	cmp	r10, #0
	bge	.L644
.L666:
	mov	r2, r9, asl #8
	movw	r3, #23813
	sub	r9, r2, r9, asl #6
	movt	r3, 56143
	umull	r2, r3, r9, r3
	mov	r0, r3, lsr #21
	rsb	r0, r0, #32
	cmp	r0, #25
	movge	r0, #25
	bic	r0, r0, r0, asr #31
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L659:
	mul	r9, r10, r9
	mul	r9, r9, r5
	mov	r9, r9, asl #1
	b	.L646
.L667:
	mov	r3, r10
	ldr	r2, .L668+12
	ldr	r1, .L668+16
	mov	r0, #1
	bl	dprint_vfmw
	b	.L646
.L664:
	mov	r9, #0
	b	.L646
.L663:
	mov	r0, #25
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L669:
	.align	2
.L668:
	.word	g_ChanCtx
	.word	s_pFspInst
	.word	s_pstVfmwChan
	.word	.LANCHOR0+908
	.word	.LC59
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_CalVdhClkSkip, .-VDMHAL_V400R003_CalVdhClkSkip
	.align	2
	.global	VDMHAL_V400R003_GetVdmClk
	.type	VDMHAL_V400R003_GetVdmClk, %function
VDMHAL_V400R003_GetVdmClk:
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
	mov	r3, r0, asl #6
	ldr	r2, .L678
	sub	r0, r3, r0, asl #3
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L671
.L673:
	.word	.L671
	.word	.L674
	.word	.L675
	.word	.L676
.L671:
	add	r3, r2, r0
	mov	r1, #500
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L675:
	add	r3, r2, r0
	mov	r1, #100
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L674:
	add	r3, r2, r0
	mov	r1, #540
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L676:
	add	r3, r2, r0
	mov	r1, #600
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L679:
	.align	2
.L678:
	.word	g_VdmDrvParam
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_GetVdmClk, .-VDMHAL_V400R003_GetVdmClk
	.align	2
	.global	VDMHAL_V400R003_StartHwDecode
	.type	VDMHAL_V400R003_StartHwDecode, %function
VDMHAL_V400R003_StartHwDecode:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	subs	r5, r0, #0
	mov	r4, r1
	ble	.L681
	mov	r0, #0
	mov	r3, r5
	str	r0, [sp]
	ldr	r2, .L719
	ldr	r1, .L719+4
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L681:
	ldr	r6, .L719+8
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L716
	ldr	r2, .L719+12
	ldr	r8, .L719+16
	ldr	r10, .L719+20
	ldr	r1, [r2]
	ldr	r3, [r1, #120]
	tst	r3, #768
	bfcne	r3, #8, #2
	strne	r3, [r1, #120]
	mov	r3, r5, asl #6
	mov	r1, #500
	sub	r3, r3, r5, asl #3
	add	r3, r8, r3
	ldr	r7, [r3, #8]
	str	r1, [r3, #16]
	ldr	r3, [r10, r7, asl #2]
	ldr	r9, [r3, #1168]
.L685:
	ldr	r2, [r2]
	ldr	r3, [r2, #120]
	bfc	r3, #12, #5
	bfc	r3, #17, #1
	str	r3, [r2, #120]
	ldr	r3, [r2, #120]
	orr	r3, r3, #131072
	str	r3, [r2, #120]
.L687:
	ldr	r1, [r10, r7, asl #2]
	mov	r2, r5
	mov	r3, r4
	mov	r0, #12
	ldr	r10, .L719+8
	ldr	r1, [r1, #544]
	cmp	r1, #16
	movne	r1, #3
	moveq	r1, #0
	bl	SCD_ConfigReg
	ldrb	r2, [r6]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L717
	movw	r2, #1228
	ldr	r3, .L719+24
	mul	r2, r2, r5
	ldr	r4, .L719+28
	ldr	r1, [r3]
	movw	r3, #43690
	bfi	r3, r3, #16, #16
	cmp	r1, #1
	ldr	r2, [r4, r2]
	moveq	r1, #7
	movne	r1, #0
	str	r3, [r2, #156]
.L690:
	movw	r2, #1228
	cmp	r9, #1
	mul	r2, r2, r5
	mvneq	r3, #5
	mvnne	r3, #1
	ldr	r2, [r4, r2]
	add	r2, r2, #61440
	str	r1, [r2, #32]
.L692:
	movw	r2, #1228
	mul	r2, r2, r5
	ldr	r2, [r4, r2]
	str	r3, [r2, #36]
.L694:
	ldr	r6, .L719+32
	mov	r0, #30
	ldr	r3, [r6, #116]
	blx	r3
	ldr	r3, [r6, #112]
	blx	r3
	movw	r3, #1228
	mul	r3, r3, r5
	mov	r1, #56
	mov	r2, #0
	mov	lr, #1
	mla	r5, r1, r5, r8
	ldr	ip, .L719+36
	mov	r1, #4
	ldr	r0, [r4, r3]
	str	r2, [r0]
	ldr	r0, [r4, r3]
	str	lr, [r0]
	ldr	r3, [r4, r3]
	str	r2, [r3]
	ldr	r0, [r5, #8]
	ldr	r2, [ip, r0, asl #2]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDEC_Lowdelay_Event_Time
.L717:
	movw	r3, #43690
	mov	r1, #2
	mov	r2, #156
	movt	r3, 43690
	mov	r0, r4
	bl	VDH_Record_RegData
	ldr	r3, .L719+24
	ldrb	r2, [r10]	@ zero_extendqisi2
	ldr	r3, [r3]
	cmp	r3, #1
	moveq	r1, #7
	movne	r1, #0
	cmp	r2, #1
	ldreq	r4, .L719+28
	beq	.L690
	mov	r3, r1
	movw	r2, #61472
	mov	r0, r4
	mov	r1, #2
	bl	VDH_Record_RegData
	cmp	r9, #1
	ldrb	r2, [r6]	@ zero_extendqisi2
	mvneq	r3, #5
	mvnne	r3, #1
	cmp	r2, #1
	ldreq	r4, .L719+28
	beq	.L692
	mov	r0, r4
	mov	r2, #36
	mov	r1, #2
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r4, .L719+28
	beq	.L694
	cmp	r4, #0
	beq	.L718
	mov	r3, #1
	str	r7, [r4, #8]
	strb	r5, [r4]
	mov	r0, r4
	str	r3, [r4, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDH_PostTask
.L716:
	mov	r3, #0
	mov	r0, r1
	mov	r2, r3
	mov	r1, r3
	bl	VDH_Record_RegData
	ldr	r8, .L719+16
	mov	r3, r5, asl #6
	ldr	r10, .L719+20
	sub	r3, r3, r5, asl #3
	ldrb	r1, [r6]	@ zero_extendqisi2
	add	r3, r8, r3
	mov	r2, #500
	cmp	r1, #1
	ldr	r7, [r3, #8]
	str	r2, [r3, #16]
	ldreq	r2, .L719+12
	ldr	r3, [r10, r7, asl #2]
	ldr	r9, [r3, #1168]
	beq	.L685
	mov	r3, #0
	mov	r2, #1
	mov	r1, r3
	mov	r0, r4
	bl	VDH_Record_RegData
	b	.L687
.L718:
	mov	r3, r4
	mov	r0, r4
	ldr	r2, .L719
	ldr	r1, .L719+40
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L720:
	.align	2
.L719:
	.word	.LANCHOR0+940
	.word	.LC24
	.word	g_HalDisable
	.word	g_pstRegCrg
	.word	g_VdmDrvParam
	.word	s_pstVfmwChan
	.word	mask_mmu_err_int
	.word	g_HwMem
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_LowDelaySeqIndex
	.word	.LC58
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_StartHwDecode, .-VDMHAL_V400R003_StartHwDecode
	.align	2
	.global	VDMHAL_V400R003_GetCharacter
	.type	VDMHAL_V400R003_GetCharacter, %function
VDMHAL_V400R003_GetCharacter:
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
	ldr	r1, .L722
	mov	r0, #15
	ldr	r3, .L722+4
	mov	r2, #4
	str	r0, [r1]
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L723:
	.align	2
.L722:
	.word	g_VdmCharacter
	.word	g_eVdmVersion
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_GetCharacter, .-VDMHAL_V400R003_GetCharacter
	.align	2
	.global	VDMHAL_V400R003_WriteBigTitle1DYuv
	.type	VDMHAL_V400R003_WriteBigTitle1DYuv, %function
VDMHAL_V400R003_WriteBigTitle1DYuv:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #100)
	sub	sp, sp, #100
	mov	r6, r3
	ubfx	r3, r3, #29, #2
	mov	r8, r1
	cmp	r3, #1
	mov	r1, #0
	str	r0, [fp, #-108]
	mov	r5, r2
	str	r1, [fp, #-92]
	moveq	r4, r1
	str	r1, [fp, #-88]
	str	r1, [fp, #-84]
	str	r1, [fp, #-80]
	str	r1, [fp, #-76]
	str	r1, [fp, #-72]
	str	r1, [fp, #-68]
	str	r1, [fp, #-64]
	str	r1, [fp, #-60]
	str	r1, [fp, #-56]
	str	r1, [fp, #-52]
	str	r1, [fp, #-48]
	beq	.L725
	cmp	r3, #2
	moveq	r4, #1
	movne	r4, #2
.L725:
	ldr	r3, [fp, #-108]
	cmp	r3, #0
	beq	.L724
	mov	r3, #0
	mov	r2, #4194304
	mov	r1, r3
	str	r3, [sp]
	ldr	r0, .L814
	sub	r3, fp, #92
	bl	MEM_AllocMemBlock
	subs	r1, r0, #0
	bne	.L728
	str	r1, [sp]
	mov	r2, #4194304
	sub	r3, fp, #68
	ldr	r0, .L814+4
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L728
	add	r6, r6, #15
	add	r5, r5, #15
	bic	r3, r6, #15
	str	r3, [fp, #-100]
	bic	r5, r5, #15
	mov	r2, r3
	adds	r3, r3, #31
	addmi	r3, r2, #62
	add	r6, r5, #255
	bic	r6, r6, #255
	cmp	r4, #0
	cmpne	r4, #3
	mov	r3, r3, asr #5
	mov	r2, r6, asl #4
	str	r2, [fp, #-104]
	mla	r3, r3, r6, r8
	str	r3, [fp, #-116]
	bne	.L729
	ldr	r3, [fp, #-100]
	mov	r1, r5, lsr #1
	ldr	r2, [fp, #-64]
	cmp	r3, #0
	ldr	r6, .L814+8
	mov	r3, r3, lsr #1
	ldr	r4, [fp, #-88]
	str	r2, [fp, #-120]
	movne	r9, r0
	add	r2, r2, #2097152
	str	r1, [fp, #-124]
	str	r2, [fp, #-128]
	str	r3, [fp, #-112]
	strne	r9, [fp, #-96]
	beq	.L731
.L730:
	cmp	r5, #0
	beq	.L733
	ldr	r2, [fp, #-96]
	mov	r7, #0
	and	r10, r2, #15
	mov	r3, r2, lsr #4
	ldr	r2, [fp, #-104]
	mul	r3, r2, r3
	add	r10, r3, r10, lsl #8
.L732:
	mov	r1, r7, lsr #8
	add	r0, r9, r7
	add	r0, r4, r0
	add	r7, r7, #256
	add	r1, r10, r1, lsl #12
	ldr	r3, [r6, #52]
	add	r1, r8, r1
	mov	r2, #256
	blx	r3
	cmp	r5, r7
	bhi	.L732
.L733:
	ldr	r3, [fp, #-96]
	add	r9, r9, r5
	ldr	r2, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r2, r3
	bne	.L730
.L731:
	ldr	r3, [fp, #-100]
	mov	r0, r4
	ldr	ip, [r6, #44]
	ldr	r2, [fp, #-108]
	mul	r1, r5, r3
	blx	ip
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L734
	ldr	r3, [fp, #-104]
	mov	r8, #0
	ldr	r9, [fp, #-116]
	str	r8, [fp, #-96]
	mov	r3, r3, asr #1
	str	r3, [fp, #-100]
.L735:
	cmp	r5, #0
	beq	.L738
	ldr	r2, [fp, #-96]
	mov	r7, #0
	and	r10, r2, #7
	mov	r3, r2, lsr #3
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	add	r10, r3, r10, lsl #8
.L736:
	mov	r1, r7, lsr #8
	add	r0, r8, r7
	add	r0, r4, r0
	add	r7, r7, #256
	add	r1, r10, r1, lsl #11
	ldr	r3, [r6, #52]
	add	r1, r9, r1
	mov	r2, #256
	blx	r3
	cmp	r5, r7
	bhi	.L736
.L738:
	ldr	r3, [fp, #-96]
	add	r8, r8, r5
	ldr	r2, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, r2
	bne	.L735
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L812
.L740:
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L741
	ldr	ip, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [fp, #-128]
	blx	ip
	ldr	ip, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [fp, #-120]
	blx	ip
.L741:
	ldr	r3, [fp, #-124]
.L811:
	ldr	r2, [fp, #-112]
	ldr	r5, [fp, #-108]
	ldr	ip, [r6, #44]
	mul	r4, r3, r2
	ldr	r0, [fp, #-120]
	mov	r2, r5
	mov	r1, r4
	blx	ip
	mov	r2, r5
	ldr	ip, [r6, #44]
	mov	r1, r4
	ldr	r0, [fp, #-128]
	blx	ip
	ldr	r1, [fp, #-88]
	ldr	r0, [fp, #-84]
	bl	MEM_ReleaseMemBlock
	mov	r2, #24
	ldr	ip, [r6, #48]
	mov	r1, #0
	sub	r0, fp, #92
	blx	ip
	ldr	r1, [fp, #-64]
	ldr	r0, [fp, #-60]
	bl	MEM_ReleaseMemBlock
	ldr	r3, [r6, #48]
	sub	r0, fp, #68
	mov	r2, #24
	mov	r1, #0
	blx	r3
.L724:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L728:
	ldr	r1, .L814+12
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L729:
	subs	r3, r4, #1
	ldr	r1, [fp, #-100]
	ldr	r2, [fp, #-64]
	movne	r3, #1
	cmp	r1, r3
	str	r3, [fp, #-124]
	add	r3, r2, #2097152
	str	r3, [fp, #-128]
	mov	r3, r5, lsr #1
	str	r3, [fp, #-132]
	mov	r3, r1, lsr #1
	str	r3, [fp, #-112]
	ldrhi	r3, [fp, #-124]
	str	r2, [fp, #-120]
	ldr	r6, .L814+8
	ldr	r7, [fp, #-88]
	strhi	r3, [fp, #-96]
	bls	.L748
.L750:
	cmp	r5, #0
	beq	.L751
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r9, r2, #15
	mov	r3, r2, lsr #4
	mov	r10, r2, lsr #1
	ldr	r2, [fp, #-104]
	mul	r10, r5, r10
	mul	r3, r2, r3
	add	r9, r3, r9, lsl #8
.L749:
	mov	r1, r4, lsr #8
	add	r0, r4, r10
	add	r0, r7, r0
	add	r4, r4, #256
	add	r1, r9, r1, lsl #12
	ldr	r3, [r6, #52]
	add	r1, r8, r1
	mov	r2, #256
	blx	r3
	cmp	r5, r4
	bhi	.L749
.L751:
	ldr	r3, [fp, #-96]
	ldr	r2, [fp, #-100]
	add	r3, r3, #2
	str	r3, [fp, #-96]
	cmp	r2, r3
	bhi	.L750
.L748:
	ldr	r3, [fp, #-100]
	mov	r0, r7
	ldr	ip, [r6, #44]
	ldr	r2, [fp, #-108]
	mul	r1, r5, r3
	mov	r1, r1, lsr #1
	blx	ip
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L752
	ldr	r3, [fp, #-104]
	mov	r8, #0
	ldr	r9, [fp, #-116]
	str	r8, [fp, #-96]
	mov	r3, r3, asr #1
	str	r3, [fp, #-100]
.L753:
	cmp	r5, #0
	beq	.L756
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r10, r2, #7
	mov	r3, r2, lsr #3
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	add	r10, r3, r10, lsl #8
.L754:
	mov	r1, r4, lsr #8
	add	r0, r8, r4
	add	r0, r7, r0
	add	r4, r4, #256
	add	r1, r10, r1, lsl #11
	ldr	r3, [r6, #52]
	add	r1, r9, r1
	mov	r2, #256
	blx	r3
	cmp	r5, r4
	bhi	.L754
.L756:
	ldr	r3, [fp, #-96]
	add	r8, r8, r5
	ldr	r2, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, r2
	bne	.L753
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L813
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L759
	ldr	r2, [fp, #-112]
	ldr	r3, [fp, #-124]
	cmp	r2, r3
	bls	.L764
.L765:
	add	r3, r3, #2
	cmp	r2, r3
	bhi	.L765
.L764:
	ldr	ip, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [fp, #-128]
	blx	ip
	ldr	ip, [r6, #48]
	mov	r2, #1048576
	mov	r1, #128
	ldr	r0, [fp, #-120]
	blx	ip
.L759:
	ldr	r3, [fp, #-132]
	b	.L811
.L812:
	ldr	r2, [fp, #-120]
	add	r4, r4, #1
	ldr	r7, [fp, #-124]
	mov	r3, #0
	ldr	r8, [fp, #-112]
.L742:
	cmp	r7, #0
	moveq	lr, r2
	beq	.L745
	sub	r0, r2, #-67108863
	add	lr, r2, r7
	sub	r0, r0, #65011712
	mov	r1, r4
.L743:
	ldrb	ip, [r1, #-1]	@ zero_extendqisi2
	strb	ip, [r0, #1]!
	ldrb	ip, [r1], #2	@ zero_extendqisi2
	strb	ip, [r2], #1
	cmp	r2, lr
	bne	.L743
.L745:
	add	r3, r3, #1
	mov	r2, lr
	cmp	r3, r8
	add	r4, r4, r5
	bne	.L742
	b	.L741
.L813:
	ldr	r3, [fp, #-124]
	ldr	r4, [fp, #-120]
	ldr	lr, [fp, #-132]
	mla	r2, r5, r3, r7
	ldr	r7, [fp, #-112]
	mov	r5, r5, asl #1
	mov	r3, #0
	add	r2, r2, #1
.L760:
	cmp	lr, #0
	beq	.L763
	mov	r1, r3, lsr #1
	mov	r0, r2
	mul	r1, lr, r1
	sub	ip, r1, #-67108863
	add	r9, r1, lr
	sub	ip, ip, #65011712
	add	r9, r4, r9
	add	ip, r4, ip
	add	r1, r4, r1
.L761:
	ldrb	r8, [r0, #-1]	@ zero_extendqisi2
	strb	r8, [ip, #1]!
	ldrb	r8, [r0], #2	@ zero_extendqisi2
	strb	r8, [r1], #1
	cmp	r1, r9
	bne	.L761
.L763:
	add	r3, r3, #2
	add	r2, r2, r5
	cmp	r7, r3
	bhi	.L760
	b	.L759
.L734:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L740
	b	.L741
.L752:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L759
	cmp	r3, #0
	beq	.L764
	b	.L759
.L815:
	.align	2
.L814:
	.word	.LC60
	.word	.LC62
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC61
	UNWIND(.fnend)
	.size	VDMHAL_V400R003_WriteBigTitle1DYuv, .-VDMHAL_V400R003_WriteBigTitle1DYuv
	.align	2
	.global	CRG_ConfigReg
	.type	CRG_ConfigReg, %function
CRG_ConfigReg:
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
	ldr	ip, .L823
	mov	lr, r2
	ldrb	ip, [ip]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L822
	cmp	r0, #0
	bne	.L818
	ldr	r3, .L823+4
	ldr	r3, [r3]
	ldr	r2, [r3, #120]
	ubfx	r0, r2, #8, #2
	cmp	r1, r0
	bfine	r2, r1, #8, #2
	strne	r2, [r3, #120]
	ldmfd	sp, {fp, sp, pc}
.L818:
	cmp	r0, #1
	ldmnefd	sp, {fp, sp, pc}
	ldr	r3, .L823+4
	ldr	r3, [r3]
	ldr	r2, [r3, #120]
	bfi	r2, r1, #12, #5
	bfc	r2, #17, #1
	str	r2, [r3, #120]
	ldr	r2, [r3, #120]
	orr	r2, r2, #131072
	str	r2, [r3, #120]
	ldmfd	sp, {fp, sp, pc}
.L822:
	mov	r3, r1
	mov	r2, r0
	mov	r1, #0
	mov	r0, lr
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDH_Record_RegData
.L824:
	.align	2
.L823:
	.word	g_HalDisable
	.word	g_pstRegCrg
	UNWIND(.fnend)
	.size	CRG_ConfigReg, .-CRG_ConfigReg
	.align	2
	.global	MFDE_ConfigReg
	.type	MFDE_ConfigReg, %function
MFDE_ConfigReg:
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
	ldr	ip, .L831
	mov	lr, r3
	ldrb	ip, [ip]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L829
	cmp	r2, #0
	ble	.L830
	mov	r3, r2
	str	ip, [sp]
	ldr	r2, .L831+4
	mov	r0, #32
	ldr	r1, .L831+8
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L830:
	movw	r3, #1228
	ldr	ip, .L831+12
	mul	r2, r3, r2
	ldr	r3, [ip, r2]
	str	r1, [r3, r0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L829:
	mov	r3, r1
	mov	r2, r0
	mov	r1, #2
	mov	r0, lr
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDH_Record_RegData
.L832:
	.align	2
.L831:
	.word	g_HalDisable
	.word	.LANCHOR0+860
	.word	.LC28
	.word	g_HwMem
	UNWIND(.fnend)
	.size	MFDE_ConfigReg, .-MFDE_ConfigReg
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.57222, %object
	.size	__func__.57222, 24
__func__.57222:
	.ascii	"VDMHAL_V400R003_OpenHAL\000"
	.type	__func__.57307, %object
	.size	__func__.57307, 27
__func__.57307:
	.ascii	"VDMHAL_V400R003_CalcFsSize\000"
	.space	1
	.type	__func__.57342, %object
	.size	__func__.57342, 34
__func__.57342:
	.ascii	"VDMHAL_V400R003_ArrangeMem_Normal\000"
	.space	2
	.type	__FUNCTION__.57343, %object
	.size	__FUNCTION__.57343, 34
__FUNCTION__.57343:
	.ascii	"VDMHAL_V400R003_ArrangeMem_Normal\000"
	.space	2
	.type	__func__.57319, %object
	.size	__func__.57319, 35
__func__.57319:
	.ascii	"VDMHAL_V400R003_FillMemArrangeInfo\000"
	.space	1
	.type	__func__.57435, %object
	.size	__func__.57435, 36
__func__.57435:
	.ascii	"VDMHAL_V400R003_ArrangeMem_Specific\000"
	.type	__func__.57458, %object
	.size	__func__.57458, 25
__func__.57458:
	.ascii	"VDMHAL_V400R003_ResetVdm\000"
	.space	3
	.type	__func__.57468, %object
	.size	__func__.57468, 37
__func__.57468:
	.ascii	"VDMHAL_V400R003_SetSmmuPageTableAddr\000"
	.space	3
	.type	__func__.57489, %object
	.size	__func__.57489, 26
__func__.57489:
	.ascii	"VDMHAL_V400R003_GlbResetX\000"
	.space	2
	.type	__func__.57478, %object
	.size	__func__.57478, 25
__func__.57478:
	.ascii	"VDMHAL_V400R003_GlbReset\000"
	.space	3
	.type	__func__.57501, %object
	.size	__func__.57501, 30
__func__.57501:
	.ascii	"VDMHAL_V400R003_ClearIntState\000"
	.space	2
	.type	__func__.57507, %object
	.size	__func__.57507, 33
__func__.57507:
	.ascii	"VDMHAL_V400R003_ClearMMUIntState\000"
	.space	3
	.type	__func__.57513, %object
	.size	__func__.57513, 24
__func__.57513:
	.ascii	"VDMHAL_V400R003_MaskInt\000"
	.type	__func__.57526, %object
	.size	__func__.57526, 26
__func__.57526:
	.ascii	"VDMHAL_V400R003_EnableInt\000"
	.space	2
	.type	__func__.57535, %object
	.size	__func__.57535, 25
__func__.57535:
	.ascii	"VDMHAL_V400R003_CheckReg\000"
	.space	3
	.type	__func__.57549, %object
	.size	__func__.57549, 28
__func__.57549:
	.ascii	"VDMHAL_V400R003_ReadMMUMask\000"
	.type	__func__.57554, %object
	.size	__func__.57554, 29
__func__.57554:
	.ascii	"VDMHAL_V400R003_WriteMMUMask\000"
	.space	3
	.type	__func__.57585, %object
	.size	__func__.57585, 27
__func__.57585:
	.ascii	"VDMHAL_V400R003_PrepareDec\000"
	.space	1
	.type	__func__.57590, %object
	.size	__func__.57590, 27
__func__.57590:
	.ascii	"VDMHAL_V400R003_IsVdmReady\000"
	.space	1
	.type	__func__.57595, %object
	.size	__func__.57595, 25
__func__.57595:
	.ascii	"VDMHAL_V400R003_IsVdmRun\000"
	.space	3
	.type	__func__.57601, %object
	.size	__func__.57601, 29
__func__.57601:
	.ascii	"VDMHAL_V400R003_IsVdhDecOver\000"
	.space	3
	.type	__func__.57610, %object
	.size	__func__.57610, 33
__func__.57610:
	.ascii	"VDMHAL_V400R003_IsVdhPartDecOver\000"
	.space	3
	.type	__func__.57625, %object
	.size	__func__.57625, 35
__func__.57625:
	.ascii	"VDMHAL_V400R003_UpdateHardwareInfo\000"
	.space	1
	.type	__func__.57698, %object
	.size	__func__.57698, 25
__func__.57698:
	.ascii	"VDMHAL_V400R003_CfgRpMsg\000"
	.space	3
	.type	__func__.57675, %object
	.size	__func__.57675, 24
__func__.57675:
	.ascii	"VDMHAL_CfgNotFullRepair\000"
	.type	__func__.57709, %object
	.size	__func__.57709, 25
__func__.57709:
	.ascii	"VDMHAL_V400R003_CfgRpReg\000"
	.space	3
	.type	__func__.57722, %object
	.size	__func__.57722, 30
__func__.57722:
	.ascii	"VDMHAL_V400R003_MakeDecReport\000"
	.space	2
	.type	__func__.57761, %object
	.size	__func__.57761, 30
__func__.57761:
	.ascii	"VDMHAL_V400R003_PrepareRepair\000"
	.space	2
	.type	__func__.57948, %object
	.size	__func__.57948, 15
__func__.57948:
	.ascii	"MFDE_ConfigReg\000"
	.space	1
	.type	__func__.57768, %object
	.size	__func__.57768, 30
__func__.57768:
	.ascii	"VDMHAL_V400R003_StartHwRepair\000"
	.space	2
	.type	__func__.57808, %object
	.size	__func__.57808, 30
__func__.57808:
	.ascii	"VDMHAL_V400R003_CalVdhClkSkip\000"
	.space	2
	.type	__func__.57830, %object
	.size	__func__.57830, 30
__func__.57830:
	.ascii	"VDMHAL_V400R003_StartHwDecode\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"pOpenParam = NULL error!\000" )
	.space	3
.LC1:
	ASCII(.ascii	"%s: %s\012\000" )
.LC2:
	ASCII(.ascii	"MemBaseAddr = 0 error!\000" )
	.space	1
.LC3:
	ASCII(.ascii	"VDMHAL_V400R003_OpenHAL: Size error!\000" )
	.space	3
.LC4:
	ASCII(.ascii	"VdhId is wrong!!!\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"g_VdmRegVirAddr, g_VdmResetVirAddr = %p\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"BPDRegVirAddr %p\012\000" )
	.space	2
.LC7:
	ASCII(.ascii	"!!!!!! HAL memory not enouph! need %d, have %d\012\000" )
.LC8:
	ASCII(.ascii	"image size out of range\000" )
.LC9:
	ASCII(.ascii	"VDMHAL ArrangeMem HEVC 10 bit\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"VidStd Invalid\000" )
	.space	1
.LC11:
	ASCII(.ascii	"VDMHAL_V400R003_CalcFsSize err!\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"%s, need arrange, Size: %#x, Num: %#x, RefChanged: " )
	ASCII(.ascii	"%#x\012\000" )
.LC13:
	ASCII(.ascii	"DelAllFrameMemRecord err in VDMHAL_V400R003_Arrange" )
	ASCII(.ascii	"Mem!\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"DFS, report event. Size: 0x%x, Num: %d, RefChanged:" )
	ASCII(.ascii	" %d\012\000" )
.LC15:
	ASCII(.ascii	"pVdmMemArrange is NULL\000" )
	.space	1
.LC16:
	ASCII(.ascii	"DFS, no ref frame!\012\000" )
.LC17:
	ASCII(.ascii	"DFS, Frame number = %d > 30, Then, Frame num = 30, " )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC18:
	ASCII(.ascii	"VDMHAL_V400R003_ArrangeMem Mem addr is NULL\000" )
.LC19:
	ASCII(.ascii	"'pVdmMemArrange' is NULL\000" )
	.space	3
.LC20:
	ASCII(.ascii	"MemSize not enough for pmv slot\000" )
.LC21:
	ASCII(.ascii	"VDMHAL_V200R003_ArrangeMem get ChanWidth/ChanHeight" )
	ASCII(.ascii	" failed!\012\000" )
	.space	3
.LC22:
	ASCII(.ascii	"ImgSlotLen > ChanSlotLen\000" )
	.space	3
.LC23:
	ASCII(.ascii	"cann't allocate img slot\000" )
	.space	3
.LC24:
	ASCII(.ascii	"%s: VdhId(%d) > %d\012\000" )
.LC25:
	ASCII(.ascii	"VDMHAL_V400R003_ResetVdm: map vdm register fail, vi" )
	ASCII(.ascii	"r(reg) = (%p)\012\000" )
	.space	2
.LC26:
	ASCII(.ascii	"%s module id %d failed!\012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"%s module id %d success!\012\000" )
	.space	2
.LC28:
	ASCII(.ascii	"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\012\000" )
	.space	3
.LC29:
	ASCII(.ascii	"%s: map vdm register 0x%x failed!\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"%s VdhId %d failed!\012\000" )
	.space	3
.LC31:
	ASCII(.ascii	"%s VdhId %d success!\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"vdm register virtual address not mapped, reset fail" )
	ASCII(.ascii	"ed!\012\000" )
.LC33:
	ASCII(.ascii	"%s: VdhId(%d) Invalid!\012\000" )
.LC34:
	ASCII(.ascii	"%s: vdm register virtual address not mapped, reset " )
	ASCII(.ascii	"failed!\012\000" )
.LC35:
	ASCII(.ascii	"%s: unkown reg_id = %d\012\000" )
.LC36:
	ASCII(.ascii	"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\012\000" )
	.space	3
.LC37:
	ASCII(.ascii	"%s: pDecParam(%p) = NULL\012\000" )
	.space	2
.LC38:
	ASCII(.ascii	"VDM register not mapped yet!\000" )
	.space	3
.LC39:
	ASCII(.ascii	"VDM register not mapped yet!\012\000" )
	.space	2
.LC40:
	ASCII(.ascii	"can NOT map vir addr for up-msg\000" )
.LC41:
	ASCII(.ascii	"ReadUpMsgSlot error! pDst=%p, pSrc=%p\012\000" )
	.space	1
.LC42:
	ASCII(.ascii	"ReadUpMsgSlot error! upmsg_size(%d) > 512\012\000" )
	.space	1
.LC43:
	ASCII(.ascii	"WriteMsgSlot error!\012\000" )
	.space	3
.LC44:
	ASCII(.ascii	"can not map repair msg virtual address!\000" )
.LC45:
	ASCII(.ascii	"ValidGroupNum=%d out of range!\012\000" )
.LC46:
	ASCII(.ascii	"align_mb error\012\000" )
.LC47:
	ASCII(.ascii	"[%s][%d]sclie_num is wrong! %d \012\000" )
	.space	3
.LC48:
	ASCII(.ascii	"'pMakeDecReport' is NULL\000" )
	.space	3
.LC49:
	ASCII(.ascii	"'pDecReport' is NULL\000" )
	.space	3
.LC50:
	ASCII(.ascii	"pDecReport->DecSliceNum(%d) > %d, set to 0 for full" )
	ASCII(.ascii	" repair.\012\000" )
	.space	3
.LC51:
	ASCII(.ascii	"\012***** UpMsg DecSliceNum=%d\012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"\012***** Up Msg (phy addr: %#8x) *****\012\000" )
	.space	2
.LC53:
	ASCII(.ascii	"\0120x%02x 0x%08x 0x%08x 0x%08x 0x%08x\012\000" )
	.space	3
.LC54:
	ASCII(.ascii	"\012***** Up Msg print finished *****\012\000" )
.LC55:
	ASCII(.ascii	"vdm register virtual address not mapped, VDMHAL_V20" )
	ASCII(.ascii	"0R003_PrepareRepair failed!\012\000" )
.LC56:
	ASCII(.ascii	"FIRST_REPAIR Parameter Error!\012\000" )
	.space	1
.LC57:
	ASCII(.ascii	"SECOND_REPAIR Parameter Error!\012\000" )
.LC58:
	ASCII(.ascii	"%s: pMfdeTask(%p) = NULL\012\000" )
	.space	2
.LC59:
	ASCII(.ascii	"%s The channel %d is not active\012\000" )
	.space	3
.LC60:
	ASCII(.ascii	"BigTile1d_y\000" )
.LC61:
	ASCII(.ascii	"failed mem_allocMemBlock BigTile_yuv save!\012\000" )
.LC62:
	ASCII(.ascii	"BigTile1d_uv\000" )
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
