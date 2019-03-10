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
	mov	r4, r1
	movw	r1, #8160
	cmp	ip, r1
	mov	r6, r0
	mov	r7, r2
	str	r3, [fp, #-68]
	ldr	r5, [fp, #4]
	bhi	.L31
	sub	r3, r2, #32
	cmp	r3, r1
	bhi	.L31
	str	r2, [fp, #-56]
	add	r3, r2, #15
	sub	r2, fp, #44
	add	r10, r4, #15
	mov	r3, r3, asr #4
	sub	r1, fp, #52
	mov	r0, r5
	str	r3, [r2, #-4]!
	str	r3, [fp, #-84]
	mov	r10, r10, asr #4
	str	r10, [fp, #-52]
	bl	VDMHAL_CalcPmvSlotLen.isra.0
	cmp	r5, #16
	ldr	r8, .L66
	ldr	ip, [fp, #-56]
	mov	r9, r0
	beq	.L59
	cmp	r5, #17
	beq	.L60
	mov	r10, r10, asl #4
	add	ip, r7, #31
	add	r10, r10, #255
	bic	ip, ip, #31
	bic	r2, r10, #255
	str	r2, [fp, #-56]
	ldr	r2, [r8, r6, asl #2]
	mov	r3, #0
	str	r3, [fp, #-76]
	str	r3, [fp, #-80]
.L35:
	ldr	r3, [r2, #1144]
	cmp	r3, #1
	movne	r10, #0
	strne	r10, [fp, #-64]
	movne	r3, r10
	beq	.L61
.L38:
	sub	r1, r5, #16
	cmp	r5, #3
	cmpne	r5, #0
	str	r1, [fp, #-72]
	mov	r0, r1
	movne	r1, #1
	moveq	r1, #0
	cmp	r0, #1
	movls	r1, #0
	andhi	r1, r1, #1
	cmp	r1, #0
	movne	r1, #1024
	strne	r1, [fp, #-60]
	beq	.L62
.L39:
	ldr	r1, [fp, #-68]
	cmp	r1, #1
	beq	.L63
	ldr	r0, [fp, #-76]
	ldr	r1, [fp, #-80]
	ldr	lr, [fp, #-56]
	mul	r1, r1, r0
	add	r0, r3, r3, lsl #1
	mul	r7, lr, ip
	add	r1, r1, r1, lsl #1
	add	r4, r7, r7, lsl #1
	mov	r1, r1, lsr #1
	add	r1, r1, r4, lsr #1
	add	r4, r1, r0, lsr #1
.L41:
	add	r1, r2, #307200
	ldr	r1, [r1, #3288]
	cmp	r1, #0
	beq	.L64
.L42:
	add	r1, r2, #311296
	add	r0, r9, r9, lsr #31
	cmp	r5, #17
	mov	r0, r0, asr #1
	str	r0, [r1, #2868]
	ldr	r0, [fp, #-64]
	str	r4, [r1, #2896]
	str	r10, [r1, #2576]
	str	r0, [r1, #2572]
	beq	.L43
	add	ip, r2, #307200
	ldr	r0, [ip, #3296]
	cmp	r0, #32
	movge	r0, #32
	str	r0, [r1, #2872]
	ldr	r0, [r2, #564]
	cmp	r0, #2
	ldreq	r0, [ip, #3300]
	streq	r0, [r1, #2872]
.L44:
	ldr	r0, [fp, #-72]
	cmp	r0, #1
	ldr	r0, [fp, #-56]
	mov	r10, r0, asl #4
	add	r0, r7, r3
	str	r10, [r1, #1528]
	str	r0, [r1, #2596]
	bls	.L65
.L45:
	ldr	r3, [r8, r6, asl #2]
	mov	r0, #1024
	ldr	r2, [fp, #-60]
	add	r4, r4, r2
	add	r2, r3, #311296
	add	r4, r4, #32
	str	r9, [r2, #2900]
	add	r1, r9, r4
	str	r0, [r2, #2908]
	ldrsb	r3, [r3, #44]
	cmp	r3, #1
	ldr	r3, [fp, #8]
	addeq	r1, r1, r0
	cmp	r3, #0
	beq	.L54
	str	r4, [r3, #4]
	mov	r2, #1024
	ldr	r3, [r8, r6, asl #2]
	mov	r0, #0
	ldr	ip, [fp, #8]
	add	r3, r3, #307200
	ldr	r3, [r3, #3296]
	str	r9, [ip, #12]
	str	r3, [ip, #8]
	ldr	r3, [r8, r6, asl #2]
	add	r3, r3, #311296
	ldr	r3, [r3, #2872]
	str	r1, [ip]
	str	r2, [ip, #20]
	str	r3, [ip, #16]
	ldr	r3, [r8, r6, asl #2]
	add	r3, r3, #311296
	str	r4, [r3, #2904]
.L58:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L64:
	ldr	ip, .L66+4
	movw	r0, #50680
	movt	r0, 4
	add	r0, r2, r0
	movw	r2, #1384
	str	r3, [fp, #-68]
	ldr	ip, [ip, #48]
	blx	ip
	ldr	r2, [r8, r6, asl #2]
	ldr	r3, [fp, #-68]
	b	.L42
.L43:
	mov	r0, #1
	str	r0, [r1, #2872]
	b	.L44
.L63:
	ldr	r1, [fp, #-84]
	mov	r4, r1, asl #5
	add	r4, r4, r1, lsl #4
	ldr	r1, [fp, #-56]
	mul	r7, r1, ip
	mul	r4, r1, r4
	b	.L41
.L61:
	sub	r10, r5, #17
	clz	r10, r10
	mov	r10, r10, lsr #5
	cmp	r4, #1920
	orrgt	r10, r10, #1
	cmp	r10, #0
	streq	r10, [fp, #-64]
	moveq	r3, r10
	beq	.L38
	add	lr, r7, #63
.L47:
	add	r1, r4, #2032
	add	r3, r4, #4080
	add	r1, r1, #15
	add	r3, r3, #14
	cmp	r1, #0
	movlt	r1, r3
	add	r3, lr, #63
	cmp	lr, #0
	mov	r1, r1, asr #11
	movlt	lr, r3
	mov	r3, r1, asl #9
	mov	lr, lr, asr #6
	mov	r1, r1, asl #4
	str	r1, [fp, #-64]
	mul	r3, lr, r3
	mov	r10, r3
	b	.L38
.L59:
	ldr	r2, [r8, r6, asl #2]
	add	r1, r4, #255
	bic	r3, r1, #255
	str	r3, [fp, #-56]
	ldr	r3, [r2, #1436]
	cmp	r3, #8
	ble	.L49
	ldr	r1, [fp, #-56]
	add	r3, r7, #31
	bic	r3, r3, #31
	str	r3, [fp, #-76]
	mov	r1, r1, lsr #2
	str	r1, [fp, #-80]
	b	.L35
.L65:
	ldr	r2, [r2, #1436]
	cmp	r2, #8
	ble	.L45
	ldr	ip, [fp, #-80]
	add	r2, r3, r3, lsl #1
	ldr	r0, [fp, #-76]
	add	r7, r7, r7, lsl #1
	mov	r2, r2, lsr #1
	add	r7, r2, r7, lsr #1
	str	r7, [r1, #2588]
	mul	r0, r0, ip
	mov	ip, ip, asl #4
	str	ip, [r1, #2580]
	add	r3, r0, r3, lsr #1
	mov	r0, #31
	str	r3, [r1, #2592]
	ldr	r1, .L66+8
	bl	dprint_vfmw
	b	.L45
.L60:
	ldr	r2, [r8, r6, asl #2]
	add	r1, r4, #255
	bic	r3, r1, #255
	str	r3, [fp, #-56]
	add	lr, r7, #63
	ldr	r3, [r2, #1436]
	bic	ip, lr, #63
	cmp	r3, #8
	ble	.L50
	ldr	r3, [fp, #-56]
	str	ip, [fp, #-76]
	mov	r3, r3, lsr #2
	str	r3, [fp, #-80]
.L37:
	ldr	r3, [r2, #1144]
	cmp	r3, #1
	beq	.L47
	mov	r10, #0
	mov	r3, #1
	str	r3, [fp, #-72]
	mov	r3, r10
	str	r10, [fp, #-64]
.L48:
	cmp	lr, #0
	add	r0, r1, #255
	addlt	r4, r7, #126
	movge	r4, lr
	cmp	r1, #0
	movlt	r1, r0
	mov	r4, r4, asr #6
	mov	r1, r1, asr #8
	mov	r4, r4, asl #3
	mov	r1, r1, asl #6
	mul	r4, r1, r4
	add	r1, r4, #1024
	str	r1, [fp, #-60]
	b	.L39
.L49:
	mov	r3, #0
	str	r3, [fp, #-76]
	str	r3, [fp, #-80]
	b	.L35
.L62:
	add	r1, r4, #255
	add	lr, r7, #63
	b	.L48
.L31:
	ldr	r3, .L66+12
	mov	r0, #0
	ldr	r2, .L66+16
	ldr	r1, .L66+20
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L54:
	ldr	r0, [fp, #8]
	b	.L58
.L50:
	mov	r3, #0
	str	r3, [fp, #-76]
	str	r3, [fp, #-80]
	b	.L37
.L67:
	.align	2
.L66:
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
	bhi	.L118
	ldr	r6, .L126
	sub	lr, fp, #96
	ldr	r3, [fp, #4]
	mov	r2, r8
	mov	r1, r9
	ldr	ip, [r6, r0, asl #2]
	add	ip, ip, #307200
	ldr	r10, [ip, #3292]
	stmia	sp, {r7, lr}
	bl	VDMHAL_V400R003_CalcFsSize
	cmp	r0, #0
	bne	.L119
	ldr	r3, [r6, r5, asl #2]
	ldr	r4, [fp, #-96]
	str	r3, [fp, #-112]
	cmp	r10, r4
	add	r3, r3, #307200
	ldr	r10, [r3, #3296]
	ldr	r2, [r3, #3312]
	beq	.L120
.L74:
	str	r2, [sp, #4]
	mov	r3, r4
	ldr	r2, .L126+4
	mov	r0, #31
	str	r10, [sp]
	ldr	r1, .L126+8
	bl	dprint_vfmw
	ldr	r2, [r6, r5, asl #2]
	add	r3, r2, #307200
	ldr	ip, [r3, #3288]
	str	r4, [r3, #3292]
	cmp	ip, #0
	beq	.L121
	ldr	r2, .L126+12
	ldr	r0, [fp, #-88]
	ldr	ip, [r2]
	str	r0, [r3, #3300]
	cmp	ip, #0
	beq	.L117
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
.L117:
	ldr	r3, .L126+16
	str	r3, [fp, #-128]
.L84:
	ldr	ip, [r6, r5, asl #2]
	mov	r2, r4
	mov	r3, r10
	ldr	r1, .L126+20
	add	ip, ip, #307200
	mov	r0, #31
	ldr	ip, [ip, #3312]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [fp, #-128]
	ldr	r4, [r6, r5, asl #2]
	ldr	r3, [r3]
	add	r4, r4, #311296
	blx	r3
	mov	r3, #2
	str	r0, [r4, #2912]
.L71:
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L120:
	cmp	r2, #1
	beq	.L74
	ldr	r3, [r3, #3288]
	cmp	r3, #1
	beq	.L74
	ldr	r3, [fp, #8]
	cmp	r3, #0
	beq	.L122
	ldr	r3, [fp, #-112]
	cmp	r10, #0
	movw	r2, #50680
	add	r4, r3, #311296
	movt	r2, 4
	add	r3, r3, r2
	str	r3, [fp, #-136]
	ldr	r1, [r4, #2896]
	ldrne	r3, [fp, #-112]
	str	r1, [fp, #-116]
	beq	.L123
.L86:
	add	r3, r3, #307200
	ldr	r2, [r3, #3300]
	cmp	r2, #30
	bgt	.L124
.L87:
	ldr	r3, .L126+16
	mov	r0, #8
	str	r2, [r4, #2608]
	str	r3, [fp, #-128]
	ldr	r3, [r3, #12]
	blx	r3
	ldr	r2, [r6, r5, asl #2]
	add	r9, r2, #311296
	ldr	r3, [r9, #2936]
	cmp	r3, #0
	beq	.L92
	ldr	r0, [r4, #2564]
	movw	r1, #12895
	ldr	r3, [r4, #2876]
	movt	r1, 1
	mov	r8, #0
	str	r5, [fp, #-140]
	str	r0, [fp, #-120]
	add	r1, r3, r1
	ldr	r0, [r4, #2872]
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
.L91:
	movw	r1, #48408
	movw	r3, #48388
	movt	r1, 4
	add	r1, r2, r1
	movt	r3, 4
	add	r3, r2, r3
	ldr	r1, [r1]
	add	r0, ip, #311296
	ldr	r10, [r3]
	movw	lr, #50692
	add	r3, r1, #1020
	movt	lr, 4
	add	r3, r3, #3
	add	lr, ip, lr
	bic	r3, r3, #1020
	movw	r5, #48424
	bic	r3, r3, #3
	str	r3, [r0, #1536]
	ldr	r0, [fp, #-116]
	movw	r7, #48440
	str	r10, [lr]
	movw	r10, #48380
	rsb	r0, r1, r0
	ldr	lr, [fp, #-120]
	add	r3, r0, r3
	movw	r0, #50696
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
	str	r1, [r4, #2876]
	add	r8, r8, lr
	ldr	r3, [r10]
	str	r0, [fp, #-108]
	cmp	r3, #255
	beq	.L89
	ldr	r1, [r4, #2884]
	ldr	lr, [r5]
	add	r0, r1, #1
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	add	r3, r4, r3
	str	lr, [r3, #2048]
	str	r0, [r4, #2884]
.L89:
	ldr	r3, [r4, #2880]
	ldr	r1, [fp, #-124]
	ldr	r0, [fp, #-112]
	cmp	r3, r1
	add	r1, r3, #1
	add	r3, r0, r3, lsl #3
	ldrcc	r0, [r7]
	add	r3, r3, #311296
	movcc	lr, #1
	strccb	lr, [r3, #2616]
	strcc	r0, [r3, #2612]
	strcc	r1, [r4, #2880]
	ldr	r3, [r9, #2936]
	cmp	r8, r3
	bcc	.L91
	ldr	r5, [fp, #-140]
.L92:
	ldr	r4, [fp, #-128]
	movw	r2, #1368
	ldr	r1, [fp, #-136]
	ldr	r0, [fp, #8]
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r6, r5, asl #2]
	mov	r1, #1
	ldr	r2, [r4, #16]
	add	r3, r3, #311296
	mov	r0, #8
	str	r1, [r3, #2940]
	blx	r2
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L121:
	movw	r1, #48376
	mov	r0, r5
	movt	r1, 4
	add	r1, r2, r1
	str	ip, [fp, #-104]
	bl	DelAllFrameMemRecord
	ldr	ip, [fp, #-104]
	cmp	r0, #0
	bne	.L125
.L77:
	ldr	r1, [r6, r5, asl #2]
	movw	r2, #48376
	movt	r2, 4
	mov	r3, #0
	add	r2, r1, r2
	mov	r1, #255
.L78:
	str	r1, [r2, r3]
	add	r3, r3, #72
	cmp	r3, #2304
	bne	.L78
	cmp	r9, #1920
	cmple	r8, #1088
	ble	.L79
.L81:
	ldr	r3, [r6, r5, asl #2]
	ldr	r0, [fp, #-88]
	add	r1, r3, #311296
.L80:
	ldr	r2, [r3, #1392]
	add	ip, r3, #307200
	subs	r7, r7, #17
	mov	lr, #0
	add	r2, r0, r2
	str	r2, [ip, #3300]
	ldr	r3, [r3, #564]
	movne	r7, #1
	str	lr, [r1, #2936]
	cmp	r3, #2
	mov	r3, #1
	str	r3, [ip, #3272]
	movne	r7, #0
	cmp	r7, #0
	strne	r2, [fp, #-80]
	ldr	r2, .L126+12
	str	r3, [r1, #3460]
	ldr	ip, [r2]
	cmp	ip, lr
	beq	.L83
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
.L83:
	ldr	r0, [r6, r5, asl #2]
	mov	r2, #512
	ldr	r3, .L126+16
	mov	r1, #0
	add	r0, r0, #311296
	add	r0, r0, #2944
	str	r3, [fp, #-128]
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r6, r5, asl #2]
	ldr	r1, .L126+24
	mov	r2, #0
	add	r3, r3, #311296
	ldr	r0, [r1, r5, asl #2]
	str	r2, [r3, #3456]
	bl	FSP_ClearContextAll
	b	.L84
.L79:
	ldr	r3, [r6, r5, asl #2]
	ldr	r2, [r3, #36]
	cmp	r2, #24
	beq	.L81
	add	r1, r3, #311296
	ldr	r2, [r1, #3504]
	cmp	r2, #0
	bne	.L81
	ldr	r0, [fp, #-88]
	add	r0, r0, #4
	str	r0, [fp, #-88]
	b	.L80
.L125:
	mov	r0, ip
	ldr	r1, .L126+28
	bl	dprint_vfmw
	b	.L77
.L124:
	ldr	r1, .L126+32
	mov	r0, #31
	bl	dprint_vfmw
	ldr	r3, [r6, r5, asl #2]
	mov	r1, #30
	add	r3, r3, #307200
	mov	r2, r1
	str	r1, [r3, #3300]
	b	.L87
.L123:
	ldr	r1, .L126+36
	mov	r0, #31
	bl	dprint_vfmw
	ldr	r3, [r6, r5, asl #2]
	b	.L86
.L118:
	mov	r0, r3
	ldr	r2, .L126+40
	ldr	r3, .L126+44
	ldr	r1, .L126+48
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L71
.L119:
	ldr	r1, .L126+52
	mov	r0, #31
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L71
.L122:
	ldr	r3, .L126+56
	ldr	r2, .L126+60
	ldr	r1, .L126+48
	bl	dprint_vfmw
	mvn	r3, #0
	b	.L71
.L127:
	.align	2
.L126:
	.word	s_pstVfmwChan
	.word	.LANCHOR0+88
	.word	.LC12
	.word	g_event_report
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC14
	.word	s_pFspInst
	.word	.LC13
	.word	.LC17
	.word	.LC16
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
	@ args = 28, pretend = 0, frame = 40
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
	subs	r7, r2, #0
	mov	r4, r3
	mov	r10, r1
	ldr	r5, [fp, #8]
	ldr	r3, [fp, #12]
	ldr	r6, [fp, #28]
	beq	.L198
	ldr	r2, [fp, #4]
	sub	r1, r2, #32
	movw	r2, #8160
	cmp	r1, r2
	bhi	.L131
	sub	r1, r5, #32
	cmp	r1, r2
	bhi	.L131
	cmp	r6, #0
	beq	.L199
	ldr	lr, .L208
	cmp	r3, #20
	str	r0, [fp, #-60]
	movw	r2, #1368
	mov	r1, #0
	mov	r0, r6
	ldr	r8, [lr, #48]
	movge	r3, #20
	str	r3, [fp, #-56]
	blx	r8
	ldr	r3, [fp, #4]
	add	r1, r5, #15
	sub	r2, fp, #44
	mov	r0, r10
	add	r8, r3, #15
	mov	r3, r1, asr #4
	sub	r1, fp, #52
	str	r3, [r2, #-4]!
	str	r3, [fp, #-80]
	mov	r8, r8, asr #4
	str	r8, [fp, #-52]
	bl	VDMHAL_CalcPmvSlotLen.isra.0
	ldr	r3, [fp, #-56]
	ldr	ip, [fp, #-60]
	mul	r1, r3, r0
	mov	r9, r0
	cmp	r1, r4
	ldrge	r3, .L208+4
	bge	.L197
	add	r2, r7, #1020
	rsb	r1, r1, r4
	add	r2, r2, #3
	cmp	r10, #16
	bic	r4, r2, #1020
	add	r2, r0, r0, lsr #31
	bic	r4, r4, #3
	str	r3, [r6, #1344]
	rsb	r3, r7, r4
	mov	r2, r2, asr #1
	str	r3, [fp, #-72]
	rsb	r3, r3, r1
	str	r2, [r6, #1340]
	str	r3, [fp, #-76]
	beq	.L200
	cmp	r10, #17
	beq	.L201
	mov	r8, r8, asl #4
	cmp	ip, #0
	add	r8, r8, #255
	add	r3, r5, #31
	bic	r2, r8, #255
	bic	r3, r3, #31
	str	r2, [fp, #-56]
	str	r3, [fp, #-60]
	mov	r3, r2, asl #4
	str	r3, [r6]
	blt	.L202
	ldr	r3, .L208+8
	mov	r2, #0
	ldr	r1, [fp, #4]
	add	r0, r5, #63
	str	r2, [fp, #-68]
	ldr	r3, [r3, ip, asl #2]
	add	r8, r1, #255
	str	r2, [fp, #-64]
	ldr	r3, [r3, #1144]
	cmp	r3, #1
	beq	.L143
.L207:
	add	r3, r0, #63
	mov	r1, #0
	cmp	r0, r1
	mov	lr, r1
	movlt	r0, r3
	mov	r3, r1
	mov	r0, r0, asr #6
.L142:
	add	r2, r8, #255
	cmp	r8, #0
	mov	r0, r0, asl #3
	str	lr, [r6, #1044]
	movlt	r8, r2
	ldr	r2, [fp, #20]
	mov	r8, r8, asr #8
	str	r1, [r6, #1048]
	cmp	r2, #1
	mov	r8, r8, asl #6
	str	r8, [r6, #1032]
	mul	r8, r8, r0
	str	r8, [r6, #1036]
	beq	.L203
	ldr	r1, [fp, #-64]
	add	r5, r3, r3, lsl #1
	ldr	r2, [fp, #-68]
	ldr	r0, [fp, #-60]
	mul	r2, r2, r1
	ldr	r1, [fp, #-56]
	mul	r1, r1, r0
	add	r2, r2, r2, lsl #1
	add	r2, r2, r2, lsr #31
	add	r1, r1, r1, lsl #1
	mov	r2, r2, asr #1
	add	r2, r2, r1, asr #1
	add	r5, r2, r5, lsr #1
.L146:
	ldr	r2, [fp, #24]
	cmp	r2, #0
	blt	.L147
	mov	r0, r2
	str	r3, [fp, #-84]
	bl	VCTRL_GetChanWidth
	str	r0, [fp, #-80]
	ldr	r0, [fp, #24]
	bl	VCTRL_GetChanHeight
	ldr	ip, [fp, #-80]
	cmn	r0, #1
	cmnne	ip, #1
	moveq	r3, #1
	movne	r3, #0
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-84]
	beq	.L204
	ldr	r2, [fp, #20]
	add	ip, ip, #15
	bic	ip, ip, #15
	add	r1, r0, #15
	cmp	r2, #1
	add	r2, ip, #255
	bic	r1, r1, #15
	bic	r2, r2, #255
	beq	.L205
	ldr	r0, .L208+8
	ldr	lr, [fp, #24]
	ldr	r0, [r0, lr, asl #2]
	ldr	r0, [r0, #1144]
	cmp	r0, #1
	beq	.L151
	adds	r0, r1, #63
	ldr	lr, [fp, #-80]
	addmi	r0, r1, #126
	mov	r0, r0, asr #6
.L152:
	mul	r2, r0, r2
	mov	r1, r2, asl #7
	sub	r2, r1, r2, asl #5
	add	lr, r2, lr
.L150:
	cmp	r5, lr
	ldrgt	r3, .L208+12
	bgt	.L197
	ldr	ip, [fp, #24]
.L147:
	ldr	r1, [fp, #-60]
	ldr	r2, [fp, #-56]
	mul	r2, r2, r1
	sub	r1, r10, #16
	cmp	r1, #1
	add	r1, r2, r3
	str	r1, [r6, #1068]
	bls	.L206
	ldr	r3, [fp, #16]
	cmp	r3, #0
	beq	.L156
	cmp	r10, #3
	cmpne	r10, #0
	beq	.L154
	cmp	r3, #32
	ldr	r0, [fp, #-76]
	mov	r1, r5
	str	ip, [fp, #-56]
	movlt	r10, r3
	movge	r10, #32
	bl	__aeabi_idiv
	ldr	ip, [fp, #-56]
	mov	r3, #0
	str	r3, [r6, #1040]
	cmp	r10, r0
	movlt	r3, r10
	movge	r3, r0
	str	r3, [r6, #1080]
.L157:
	cmp	r3, #0
	ldrne	r0, [r6, #1348]
	movne	r1, r6
	movne	r2, #0
	beq	.L155
.L160:
	add	r2, r2, #1
	str	r4, [r1, #8]
	cmp	r3, r2
	add	r4, r4, r5
	add	r1, r1, #12
	bne	.L160
	ldr	r2, [fp, #-72]
	mov	r1, #0
	mla	r5, r3, r5, r2
	add	r2, r3, r0
	add	r0, r6, #388
	str	r2, [r6, #1348]
	add	r2, r5, r7
.L162:
	add	r1, r1, #1
	str	r2, [r0, #4]!
	cmp	r3, r1
	add	r2, r2, #32
	bne	.L162
	ldr	r4, [r6, #1040]
	add	r5, r5, r3, lsl #5
	add	r2, r5, r7
	cmp	r4, #0
	beq	.L163
	add	r0, r6, #900
	mov	r1, #0
.L164:
	add	r1, r1, #1
	str	r2, [r0, #4]!
	cmp	r1, r4
	add	r2, r2, r8
	bne	.L164
	mul	r4, r8, r4
.L163:
	ldr	lr, [r6, #1344]
	add	r5, r4, r5
	cmp	lr, #0
	add	r7, r5, r7
	beq	.L169
	ldr	r4, [r6, #1352]
	mov	r0, r6
	mov	r1, r7
	mov	r2, #0
.L168:
	add	r2, r2, #1
	str	r1, [r0, #1084]
	cmp	lr, r2
	add	r1, r1, r9
	add	r0, r0, #8
	bne	.L168
	add	r2, r4, lr
	str	r2, [r6, #1352]
.L169:
	mla	r9, lr, r9, r5
	cmp	ip, #0
	str	r9, [r6, #4]
	blt	.L167
	ldr	r2, .L208+8
	ldr	r2, [r2, ip, asl #2]
	cmp	r2, #0
	beq	.L167
	cmp	r3, #0
	add	r7, r9, r7
	beq	.L167
	mov	r1, r6
	mov	r2, #0
.L170:
	add	r2, r2, #1
	str	r7, [r1, #520]
	cmp	r2, r3
	add	r7, r7, #1024
	add	r1, r1, #12
	bne	.L170
.L167:
	mov	r0, #0
	add	r9, r9, r3, lsl #10
	str	r9, [r6, #4]
.L195:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L206:
	ldr	r0, [fp, #16]
	mov	r1, r3, lsr #1
	ldr	lr, [fp, #-64]
	add	r3, r3, r3, lsl #1
	cmp	r0, #0
	ldr	r0, [fp, #-68]
	add	r2, r2, r2, lsl #1
	mov	r3, r3, lsr #1
	mla	r1, r0, lr, r1
	add	r3, r3, r2, asr #1
	mov	r2, r0, asl #4
	str	r3, [r6, #1060]
	str	r2, [r6, #1052]
	str	r1, [r6, #1064]
	bne	.L154
.L156:
	mov	r3, #0
	str	r3, [r6, #1080]
	str	r3, [r6, #1040]
.L155:
	ldr	r3, .L208+16
.L197:
	ldr	r2, .L208+20
	mov	r0, #0
	ldr	r1, .L208+24
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L154:
	ldr	r3, [fp, #16]
	add	r1, r5, r8
	ldr	r0, [fp, #-76]
	cmp	r3, #32
	str	ip, [fp, #-56]
	movlt	r10, r3
	movge	r10, #32
	bl	__aeabi_idiv
	ldr	ip, [fp, #-56]
	cmp	r10, r0
	movlt	r3, r10
	movge	r3, r0
	str	r3, [r6, #1080]
	str	r3, [r6, #1040]
	b	.L157
.L203:
	ldr	r2, [fp, #-80]
	mov	r5, r2, asl #4
	ldr	r2, [fp, #-56]
	mul	r5, r2, r5
	add	r5, r5, r5, lsl #1
	b	.L146
.L200:
	ldr	r3, [fp, #4]
	cmp	ip, #0
	add	r8, r3, #255
	bic	r3, r8, #255
	str	r3, [fp, #-56]
	blt	.L136
	ldr	r3, .L208+8
	str	ip, [fp, #-60]
	ldr	r0, [r3, ip, asl #2]
	str	r3, [fp, #-64]
	add	r0, r0, #311296
	add	r0, r0, #3520
	bl	IsMain10Profile
	ldr	ip, [fp, #-60]
	ldr	r3, [fp, #-64]
	cmp	r0, #0
	beq	.L137
	ldr	r0, [fp, #-56]
	add	r1, r5, #31
	bic	r1, r1, #31
	str	r5, [fp, #-60]
	cmp	r0, #0
	add	r2, r0, #3
	str	r1, [fp, #-64]
	movge	r2, r0
	add	r0, r5, #63
	mov	r2, r2, asr #2
	str	r2, [fp, #-68]
	b	.L138
.L201:
	ldr	r3, [fp, #4]
	cmp	ip, #0
	add	r0, r5, #63
	add	r8, r3, #255
	bic	r3, r0, #63
	str	r3, [fp, #-60]
	bic	r3, r8, #255
	str	r3, [fp, #-56]
	blt	.L140
	ldr	r3, .L208+8
	ldr	r2, [r3, ip, asl #2]
	ldr	r2, [r2, #1436]
	cmp	r2, #8
	ble	.L173
	ldr	r1, [fp, #-56]
	ldr	lr, [fp, #-60]
	cmp	r1, #0
	add	r2, r1, #3
	movge	r2, r1
	str	lr, [fp, #-64]
	mov	r2, r2, asr #2
	str	r2, [fp, #-68]
.L138:
	ldr	r2, [fp, #-56]
	mov	r2, r2, asl #4
	str	r2, [r6]
	ldr	r3, [r3, ip, asl #2]
	ldr	r3, [r3, #1144]
	cmp	r3, #1
	bne	.L207
.L143:
	sub	r1, r10, #17
	ldr	r3, [fp, #4]
	clz	r1, r1
	mov	r1, r1, lsr #5
	cmp	r3, #1920
	orrgt	r1, r1, #1
	cmp	r1, #0
	bne	.L144
	add	r3, r0, #63
	cmp	r0, #0
	mov	lr, r1
	movlt	r0, r3
	mov	r3, r1
	mov	r0, r0, asr #6
	b	.L142
.L136:
	add	r0, r5, #63
	str	r5, [fp, #-60]
.L140:
	mov	r1, #0
	add	r3, r0, #63
	cmp	r0, r1
	ldr	r2, [fp, #-56]
	mov	lr, r1
	str	r1, [fp, #-68]
	movlt	r0, r3
	str	r1, [fp, #-64]
	mov	r2, r2, asl #4
	mov	r0, r0, asr #6
	mov	r3, r1
	str	r2, [r6]
	b	.L142
.L205:
	mul	lr, r1, r2
	add	lr, lr, lr, lsl #1
	b	.L150
.L202:
	adds	r0, r5, #63
	ldr	r3, [fp, #4]
	addmi	r0, r5, #126
	mov	r1, #0
	add	r8, r3, #255
	mov	lr, r1
	str	r1, [fp, #-68]
	mov	r0, r0, asr #6
	str	r1, [fp, #-64]
	mov	r3, r1
	b	.L142
.L151:
	add	lr, ip, #2032
	adds	r0, r1, #63
	add	lr, lr, #15
	addmi	r0, r1, #126
	add	ip, ip, #4080
	cmp	lr, #0
	add	ip, ip, #14
	mov	r0, r0, asr #6
	movge	ip, lr
	mov	ip, ip, asr #11
	mov	lr, r0, asl #7
	sub	lr, lr, r0, asl #5
	mov	r1, ip, asl #4
	mul	lr, r1, lr
	mov	lr, lr, lsr #1
	b	.L152
.L144:
	ldr	r3, [fp, #4]
	ldr	r2, [fp, #4]
	add	r3, r3, #2032
	add	r3, r3, #15
	add	lr, r2, #4080
	cmp	r3, #0
	add	lr, lr, #14
	add	r2, r0, #63
	movlt	r3, lr
	cmp	r0, #0
	mov	lr, r3, asr #11
	movlt	r0, r2
	mov	r3, lr, asl #9
	mov	r0, r0, asr #6
	mov	lr, lr, asl #4
	mul	r3, r0, r3
	mov	r1, r3
	b	.L142
.L137:
	mov	r2, r0
	str	r0, [fp, #-64]
	str	r2, [fp, #-68]
	add	r0, r5, #63
	str	r5, [fp, #-60]
	b	.L138
.L173:
	mov	r2, #0
	str	r2, [fp, #-64]
	str	r2, [fp, #-68]
	b	.L138
.L131:
	ldr	r3, .L208+28
	b	.L197
.L198:
	mov	r0, r7
	ldr	r3, .L208+32
	ldr	r2, .L208+20
	ldr	r1, .L208+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L195
.L204:
	ldr	r1, .L208+36
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L195
.L199:
	mov	r0, r6
	ldr	r3, .L208+40
	ldr	r2, .L208+20
	ldr	r1, .L208+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L195
.L209:
	.align	2
.L208:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC20
	.word	s_pstVfmwChan
	.word	.LC22
	.word	.LC23
	.word	.LANCHOR0+160
	.word	.LC1
	.word	.LC8
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
	beq	.L213
	cmp	r4, #0
	blt	.L214
	mov	r0, r4
	str	ip, [fp, #-52]
	str	r1, [fp, #-48]
	bl	VCTRL_GetVidStd
	ldr	r3, .L217
	ldr	r1, [fp, #-48]
	ldr	ip, [fp, #-52]
	ldr	r3, [r3, r4, asl #2]
	ldr	r3, [r3, #1384]
	cmp	r3, #1
	beq	.L216
.L212:
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
.L214:
	mov	r0, #21
	b	.L212
.L213:
	mov	r0, #16
	b	.L212
.L216:
	mov	r1, r0
	str	r8, [fp, #8]
	mov	r3, r6
	str	r7, [fp, #4]
	mov	r2, r5
	mov	r0, r4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDMHAL_V400R003_ArrangeMem_Normal
.L218:
	.align	2
.L217:
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
	ble	.L220
	mov	r3, r6
	str	r0, [sp]
	ldr	r2, .L234
	ldr	r1, .L234+4
	bl	dprint_vfmw
.L219:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L220:
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r2, r0, #0
	beq	.L232
	movw	r3, #1228
	ldr	r8, .L234+8
	mul	r3, r3, r6
	ldr	r5, .L234+12
	ldr	r2, [r5]
	ldr	r3, [r8, r3]
	ldr	r9, [r3, #36]
	ldr	r7, [r2, #120]
	tst	r7, #1
	beq	.L219
	ldr	r10, .L234+16
	mov	r3, #2
	bfi	r7, r3, #8, #2
	str	r7, [r2, #120]
	mov	r4, #0
	orr	r7, r7, #64
	ldr	r3, [r10, #112]
	blx	r3
	ldr	r3, [r5]
	str	r7, [r3, #120]
	b	.L224
.L233:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L225
.L224:
	ldr	r3, [r10, #116]
	mov	r0, #30
	blx	r3
	ldr	r3, [r5]
	ldr	r2, [r3, #372]
	tst	r2, #4
	beq	.L233
	cmp	r4, #1000
	bge	.L225
	mov	r3, r6
	ldr	r2, .L234
	ldr	r1, .L234+20
	mov	r0, #0
	bl	dprint_vfmw
.L227:
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
.L225:
	mov	r3, r6
	ldr	r2, .L234
	ldr	r1, .L234+24
	mov	r0, #0
	bl	dprint_vfmw
	b	.L227
.L232:
	ldr	r1, .L234+28
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L235:
	.align	2
.L234:
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
	ldr	r3, .L242
	mov	r4, r0
	ldr	ip, [r3, #180]
	cmp	ip, #0
	beq	.L236
	sub	r2, fp, #24
	sub	r1, fp, #28
	sub	r0, fp, #32
	blx	ip
	cmp	r4, #0
	bne	.L238
	ldr	r3, .L242+4
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r3, [r3]
	ldr	r2, [fp, #-24]
	add	r3, r3, #61440
	str	r0, [r3, #524]
	str	r1, [r3, #772]
	str	r2, [r3, #776]
.L236:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L238:
	mov	r5, #1
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L242+8
	ldr	r1, .L242+12
	bl	dprint_vfmw
	mov	r3, r4
	str	r5, [sp]
	mov	r0, #32
	ldr	r2, .L242+8
	ldr	r1, .L242+12
	bl	dprint_vfmw
	str	r5, [sp]
	mov	r3, r4
	ldr	r2, .L242+8
	ldr	r1, .L242+12
	mov	r0, #32
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L243:
	.align	2
.L242:
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
	ldr	r3, .L245
	mov	r2, #8
	movt	r2, 3
	ldr	r3, [r3]
	add	r3, r3, #61440
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L246:
	.align	2
.L245:
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
	beq	.L259
	ldr	r5, .L261
	ldr	r3, [r5]
	ldr	r6, [r3, #120]
	tst	r6, #1
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r8, .L261+4
	mov	r2, #2
	bfi	r6, r2, #8, #2
	str	r6, [r3, #120]
	mov	r4, #0
	orr	r6, r6, #16
	ldr	r3, [r8, #112]
	blx	r3
	ldr	r3, [r5]
	str	r6, [r3, #120]
	b	.L251
.L260:
	add	r4, r4, #1
	cmp	r4, #1000
	beq	.L252
.L251:
	ldr	r2, [r8, #116]
	mov	r0, #30
	blx	r2
	ldr	r2, [r5]
	ldr	r2, [r2, #372]
	tst	r2, #1
	beq	.L260
	cmp	r4, #1000
	bge	.L252
	mov	r3, r7
	ldr	r2, .L261+8
	ldr	r1, .L261+12
	mov	r0, #0
	bl	dprint_vfmw
.L254:
	ldr	r2, [r5]
	bfc	r6, #4, #1
	ldr	r3, [r8, #112]
	str	r6, [r2, #120]
	bfc	r6, #8, #2
	blx	r3
	ldr	r3, [r5]
	str	r6, [r3, #120]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L252:
	mov	r3, r7
	ldr	r2, .L261+8
	ldr	r1, .L261+16
	mov	r0, #0
	bl	dprint_vfmw
	b	.L254
.L259:
	mov	r3, #0
	ldr	r2, .L261+8
	movt	r3, 63683
	ldr	r1, .L261+20
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L262:
	.align	2
.L261:
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
	beq	.L265
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDMHAL_V400R003_GlbResetX
.L265:
	mov	r3, #0
	ldr	r2, .L266
	movt	r3, 63683
	ldr	r1, .L266+4
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L267:
	.align	2
.L266:
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
	ldr	r7, .L284
	mov	r5, r0, asl #3
	mov	r8, r0, asl #6
	rsb	r3, r5, r8
	ldr	r2, .L284+4
	add	r3, r7, r3
	ldr	r3, [r3, #8]
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	ldrne	r4, [r3, #1168]
	moveq	r4, r3
	cmp	r0, #0
	bgt	.L281
	movw	r6, #1228
	ldr	r9, .L284+8
	mul	r6, r6, r0
	ldr	r3, [r9, r6]
	cmp	r3, #0
	beq	.L282
.L272:
	cmp	r4, #1
	beq	.L283
.L279:
	mvn	r2, #0
	str	r2, [r3, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L281:
	mov	r2, #0
	mov	r3, r0
	str	r2, [sp]
	mov	r0, r2
	ldr	r1, .L284+12
	ldr	r2, .L284+16
	bl	dprint_vfmw
.L268:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L283:
	rsb	r5, r5, r8
	add	r7, r7, r5
	ldr	r2, [r7, #44]
	cmp	r2, #1
	beq	.L279
	cmp	r2, #2
	ldr	r1, [r3, #28]
	mvneq	r2, #11
	streq	r2, [r3, #32]
	beq	.L268
	cmp	r2, #3
	mvneq	r2, #14
	streq	r2, [r3, #32]
	b	.L268
.L282:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r9, r6]
	bne	.L272
.L273:
	ldr	r1, .L284+20
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L285:
	.align	2
.L284:
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
	bgt	.L291
	movw	r2, #1228
	ldr	r5, .L293
	mul	r4, r2, r3
	ldr	r2, [r5, r4]
	cmp	r2, #0
	beq	.L292
.L289:
	add	r2, r2, #61440
	mov	r3, #7
	str	r3, [r2, #44]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L291:
	mov	r0, #0
	ldr	r2, .L293+4
	str	r0, [sp]
	ldr	r1, .L293+8
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L292:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r2, r0, #0
	strne	r2, [r5, r4]
	bne	.L289
.L290:
	ldr	r1, .L293+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L294:
	.align	2
.L293:
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
	bgt	.L300
	movw	r2, #1228
	ldr	r5, .L302
	mul	r4, r2, r3
	ldr	r3, [r5, r4]
	cmp	r3, #0
	beq	.L301
.L298:
	mvn	r2, #0
	str	r2, [r3, #36]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L300:
	mov	r0, #0
	ldr	r2, .L302+4
	str	r0, [sp]
	ldr	r1, .L302+8
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L301:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r5, r4]
	bne	.L298
.L299:
	ldr	r1, .L302+12
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L303:
	.align	2
.L302:
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
	ldr	r2, .L318
	mov	r3, r0, asl #6
	ldr	r1, .L318+4
	sub	r3, r3, r0, asl #3
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	ldr	r3, [r1, r3, asl #2]
	cmp	r3, #0
	ldrne	r4, [r3, #1168]
	moveq	r4, r3
	cmp	r0, #0
	bgt	.L316
	movw	r5, #1228
	ldr	r6, .L318+8
	mul	r5, r5, r0
	ldr	r3, [r6, r5]
	cmp	r3, #0
	beq	.L317
.L311:
	cmp	r4, #1
	mvneq	r2, #5
	mvnne	r2, #1
	str	r2, [r3, #36]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L316:
	mov	r2, #0
	mov	r3, r0
	str	r2, [sp]
	mov	r0, r2
	ldr	r1, .L318+12
	ldr	r2, .L318+16
	bl	dprint_vfmw
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L317:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	strne	r3, [r6, r5]
	bne	.L311
.L312:
	ldr	r1, .L318+20
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_vfmw
.L319:
	.align	2
.L318:
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
	bgt	.L337
	movw	r4, #1228
	ldr	r6, .L339
	mul	r4, r4, r5
	ldr	r3, [r6, r4]
	cmp	r3, #0
	beq	.L338
.L323:
	sub	r2, r7, #1
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L329
.L331:
	.word	.L334
	.word	.L332
	.word	.L333
	.word	.L335
	.word	.L325
	.word	.L327
	.word	.L328
.L335:
	mov	r3, #40
.L330:
	movw	r1, #1228
	mul	r5, r1, r5
	ldr	r2, [r6, r5]
	ldr	r0, [r2, r3]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L334:
	mov	r3, #28
	b	.L330
.L333:
	mov	r3, #36
	b	.L330
.L332:
	mov	r3, #32
	b	.L330
.L328:
	movw	r3, #62272
	b	.L330
.L325:
	movw	r3, #61480
	b	.L330
.L327:
	movw	r3, #62304
	b	.L330
.L329:
	mov	r3, r7
	ldr	r2, .L339+4
	ldr	r1, .L339+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L338:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r8, r0, #0
	beq	.L324
	str	r8, [r6, r4]
	b	.L323
.L337:
	mov	r3, r5
	ldr	r2, .L339+4
	ldr	r1, .L339+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L324:
	ldr	r2, .L339+4
	ldr	r1, .L339+16
	bl	dprint_vfmw
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L340:
	.align	2
.L339:
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
	ble	.L344
	mov	r1, #1
	ldr	r2, .L345
	str	r1, [sp]
	mov	r0, #32
	ldr	r1, .L345+4
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L344:
	movw	r0, #1228
	ldr	r2, .L345+8
	mul	r3, r0, r3
	ldr	r3, [r2, r3]
	add	r3, r3, #61440
	ldr	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L346:
	.align	2
.L345:
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
	ble	.L350
	mov	r1, #1
	ldr	r2, .L351
	str	r1, [sp]
	mov	r0, #32
	ldr	r1, .L351+4
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L350:
	movw	r1, #1228
	ldr	r2, .L351+8
	mul	r3, r1, r3
	ldr	r3, [r2, r3]
	add	r3, r3, #61440
	str	r0, [r3, #32]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L352:
	.align	2
.L351:
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
	beq	.L372
	cmp	r2, #0
	bgt	.L373
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
	b	.L355
.L358:
	.word	.L368
	.word	.L359
	.word	.L360
	.word	.L361
	.word	.L355
	.word	.L362
	.word	.L363
	.word	.L355
	.word	.L364
	.word	.L365
	.word	.L366
	.word	.L366
	.word	.L366
	.word	.L367
	.word	.L355
	.word	.L368
	.word	.L369
	.word	.L370
.L368:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	H264HAL_V400R003_StartDec
.L369:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	HEVCHAL_V400R003_StartDec
.L370:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP9HAL_V400R003_StartDec
.L359:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VC1HAL_V400R003_StartDec
.L360:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MP4HAL_V400R003_StartDec
.L361:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	MP2HAL_V400R003_StartDec
.L362:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	DIVX3HAL_V400R003_StartDec
.L363:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	AVSHAL_V400R003_StartDec
.L364:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RV8HAL_V400R003_StartDec
.L365:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	RV9HAL_V400R003_StartDec
.L366:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP6HAL_V400R003_StartDec
.L367:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VP8HAL_V400R003_StartDec
.L372:
	mov	r3, r7
	mov	r0, r7
	ldr	r2, .L374
	ldr	r1, .L374+4
	bl	dprint_vfmw
.L355:
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L373:
	mov	r3, r2
	mov	r0, #0
	ldr	r2, .L374
	str	r0, [sp]
	ldr	r1, .L374+8
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L375:
	.align	2
.L374:
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
	ldr	r3, .L383
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L381
	cmp	r0, #0
	ble	.L382
	mov	r3, r0
	mov	r1, #1
	ldr	r2, .L383+4
	mov	r0, #32
	str	r1, [sp]
	ldr	r1, .L383+8
	bl	dprint_vfmw
	mov	r0, #0
.L378:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L382:
	ldr	r0, [r3, #28]
	ubfx	r0, r0, #17, #1
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L381:
	mov	r0, r3
	ldr	r2, .L383+4
	ldr	r3, .L383+12
	ldr	r1, .L383+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L378
.L384:
	.align	2
.L383:
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
	ldr	r3, .L392
	ldr	r4, [r3, r2]
	cmp	r4, #0
	beq	.L390
	cmp	r0, #0
	ble	.L391
	mov	r3, r0
	mov	r4, #1
	ldr	r2, .L392+4
	mov	r0, #32
	str	r4, [sp]
	ldr	r1, .L392+8
	bl	dprint_vfmw
	mov	r0, r4
.L387:
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L391:
	ldr	r0, [r4, #40]
	subs	r0, r0, #1
	movne	r0, #1
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L390:
	ldr	r1, .L392+12
	mov	r0, r4
	bl	dprint_vfmw
	mov	r0, r4
	b	.L387
.L393:
	.align	2
.L392:
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
	ldr	r3, .L404
	mul	r2, r2, r1
	mov	r4, r0
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L402
	bl	VDMHAL_V400R003_CheckReg
	cmp	r4, #1
	beq	.L398
	cmp	r4, #2
	bne	.L403
	and	r0, r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L403:
	mov	r3, r4
	ldr	r2, .L404+4
	ldr	r1, .L404+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L398:
	ubfx	r0, r0, #17, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L402:
	mov	r0, r3
	ldr	r2, .L404+4
	ldr	r3, .L404+12
	ldr	r1, .L404+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L405:
	.align	2
.L404:
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
	ldr	r3, .L416
	mul	r2, r2, r1
	mov	r4, r0
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L414
	bl	VDMHAL_V400R003_CheckReg
	cmp	r4, #1
	beq	.L410
	cmp	r4, #2
	bne	.L415
	ubfx	r0, r0, #2, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L415:
	mov	r3, r4
	ldr	r2, .L416+4
	ldr	r1, .L416+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L410:
	ubfx	r0, r0, #19, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L414:
	mov	r0, r3
	ldr	r2, .L416+4
	ldr	r3, .L416+12
	ldr	r1, .L416+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L417:
	.align	2
.L416:
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
	bgt	.L419
	ldr	r2, .L453
	ldr	r0, [r2]
	cmp	r0, #1
	addne	r3, r2, #124
	bne	.L423
	b	.L436
.L447:
	cmp	r2, r3
	beq	.L446
.L423:
	ldr	r0, [r2, #4]!
	cmp	r0, #1
	bne	.L447
.L436:
	mov	r5, r0
.L420:
	movw	r6, #1228
	ldr	r8, .L453+4
	mul	r6, r6, r4
	ldr	r7, [r8, r6]
	cmp	r7, #0
	beq	.L448
.L424:
	mov	r2, #180
	ldr	r1, .L453+8
	mul	r2, r2, r4
	mov	r3, r4, asl #6
	sub	r3, r3, r4, asl #3
	ldr	r0, [r7, #12]
	ldr	r6, .L453+12
	add	r3, r3, r1
	ldr	r1, [r3, #4]
	add	r3, r6, r2
	str	r0, [r6, r2]
	ldr	r2, [r7, #28]
	cmp	r1, #1
	str	r2, [r3, #4]
	beq	.L449
	cmp	r5, #1
	beq	.L450
	add	r2, r7, #4096
	cmp	r5, #0
	ldr	ip, [r2]
	ldr	r0, [r2, #12]
	ldr	r1, [r7, #208]
	ldr	r2, [r7, #212]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	bne	.L429
	ldr	lr, [r7, #176]
	ldr	ip, [r7, #180]
	ldr	r0, [r7, #184]
	ldr	r1, [r7, #188]
	ldr	r2, [r7, #192]
	str	lr, [r3, #24]
	str	ip, [r3, #28]
	str	r0, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #40]
.L429:
	mov	lr, #180
	add	r1, r7, #33024
	mul	lr, lr, r4
	add	r2, lr, #48
	add	lr, lr, #176
	add	r2, r6, r2
	add	lr, r6, lr
.L430:
	ldr	ip, [r1], #4
	str	ip, [r2, #4]!
	cmp	r2, lr
	bne	.L430
	cmp	r5, #0
	bne	.L451
	mov	r3, #180
	add	r7, r7, #32768
	mla	r4, r3, r4, r6
	ldr	r2, [r7, #384]
	ldr	r3, [r7, #388]
	mov	r0, r5
	str	r2, [r4, #48]
	str	r3, [r4, #44]
.L441:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L451:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L446:
	mov	r5, #0
	b	.L420
.L449:
	add	r1, r7, #4096
	mov	r0, #0
	ldr	r1, [r1, #12]
	ubfx	ip, r1, #0, #20
	str	r1, [r3, #20]
	ldr	r1, [r7, #176]
	str	ip, [r3, #20]
	str	r1, [r3, #24]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L450:
	movw	r3, #1228
	ubfx	r7, r2, #0, #17
	mla	r3, r3, r4, r8
	ldr	r0, [r3, #40]
	bl	MEM_Phy2Vir
	subs	ip, r0, #0
	beq	.L452
	sub	r3, r7, #1
	movw	r1, #1228
	cmp	r3, #199
	mov	r2, #180
	subls	r3, r7, #-1073741823
	mul	r1, r1, r4
	movls	r3, r3, asl #4
	movhi	r3, #0
	addls	lr, r3, #8
	ldr	r0, [ip, r3]
	movhi	lr, #8
	mla	r3, r2, r4, r6
	ldr	r7, [r8, r1]
	str	r0, [r3, #16]
	ldr	r0, [r7, #208]
	ldr	r1, [ip, lr]
	ldr	r2, [r7, #212]
	str	r0, [r3, #8]
	str	r1, [r3, #20]
	str	r2, [r3, #12]
	b	.L429
.L448:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r7, r0, #0
	beq	.L425
	str	r7, [r8, r6]
	b	.L424
.L419:
	mov	r0, #0
	mov	r3, r4
	str	r0, [sp]
	ldr	r2, .L453+16
	ldr	r1, .L453+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L441
.L425:
	ldr	r1, .L453+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L441
.L452:
	ldr	r3, .L453+28
	ldr	r2, .L453+16
	ldr	r1, .L453+32
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L441
.L454:
	.align	2
.L453:
	.word	g_DSPState
	.word	g_HwMem
	.word	g_VdmDrvParam+48
	.word	g_BackUp
	.word	.LANCHOR0+680
	.word	.LC24
	.word	.LC32
	.word	.LC40
	.word	.LC1
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
	beq	.L459
	cmp	r2, #800
	bhi	.L460
	ldr	r3, .L461
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L460:
	mov	r0, r4
	ldr	r1, .L461+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L459:
	mov	r2, r0
	ldr	r1, .L461+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L462:
	.align	2
.L461:
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
	beq	.L464
	sub	r3, r2, #1
	cmp	r3, #255
	bhi	.L464
	ldr	r3, .L467
	mov	r2, r2, asl #2
	ldr	r3, [r3, #52]
	blx	r3
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L464:
	ldr	r1, .L467+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L468:
	.align	2
.L467:
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
	str	r3, [fp, #-60]
	beq	.L517
	ldr	r2, [r7, #840]
	sub	r3, r2, #1
	cmp	r3, #199
	bhi	.L518
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #864]
	ldr	r0, [r7, #28]
	mov	r2, r2, asl r3
	cmp	r2, #1920
	add	r1, r2, #255
	mov	r3, r0, asl r3
	bic	r1, r1, #255
	ble	.L473
	ldr	r0, [r7, #848]
	ldr	ip, [r7]
	cmp	r0, #1
	movne	r2, #0
	beq	.L474
.L475:
	cmp	ip, #16
	beq	.L477
.L500:
	add	r3, r3, #31
	mov	r0, #8
	bic	r3, r3, #31
	str	r0, [fp, #-80]
	mla	r3, r3, r1, r2
.L501:
	ldr	r0, [r7, #16]
	ldr	ip, [fp, #-60]
	str	r0, [ip]
	ldr	r0, [r7, #16]
	add	r0, r3, r0
	str	r0, [ip, #4]
	ldr	r0, [r7, #4]
	str	r0, [ip, #8]
	ldr	r0, [r7, #4]
	add	r3, r3, r0
	str	r3, [ip, #12]
	ldr	ip, [fp, #-60]
	mov	r0, #0	@ movhi
	ldr	r3, [r7, #872]
	cmp	r3, #0
	moveq	r1, r1, asl #4
	str	r1, [ip, #16]
	str	r2, [ip, #20]
	mov	r1, r0	@ movhi
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #28]
	sub	r2, r2, #1
	sub	r3, r3, #1
	bfi	r0, r2, #0, #9
	bfi	r1, r3, #0, #9
	strh	r0, [fp, #-52]	@ movhi
	strh	r1, [fp, #-50]	@ movhi
	ldr	r3, [fp, #-52]
	str	r3, [ip, #24]
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
	strne	r3, [fp, #-64]
	beq	.L519
.L482:
	cmp	r1, #1
	beq	.L498
	ldr	r3, [fp, #-64]
	sub	r3, r3, #1
	uxth	r3, r3
.L499:
	ldr	ip, [r7, #864]
	mov	r0, #0
	ldr	lr, [r7, #848]
	ldrb	r1, [fp, #-49]	@ zero_extendqisi2
	sub	ip, ip, #4
	ldrb	r2, [fp, #-50]	@ zero_extendqisi2
	bfi	r1, ip, #0, #2
	ldr	ip, [r7, #852]
	bfi	r2, lr, #0, #1
	ldr	lr, [fp, #-80]
	and	ip, ip, #3
	strh	r3, [fp, #-52]	@ movhi
	bfi	r1, lr, #2, #4
	bfi	r2, ip, #4, #2
	strb	r1, [fp, #-49]
	ldr	lr, [r7, #872]
	uxtb	r1, r1
	mov	r3, r2
	bfi	r3, ip, #6, #2
	bfi	r1, lr, #6, #1
	strb	r3, [fp, #-50]
	strb	r1, [fp, #-49]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-60]
	str	r3, [r2, #28]
.L515:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L473:
	ldr	ip, [r7]
	cmp	ip, #17
	beq	.L476
	cmp	ip, #16
	mov	r2, #0
	mov	r0, #1
	str	r2, [r7, #848]
	str	r0, [r7, #872]
	bne	.L500
.L477:
	mov	r0, #10
	str	r0, [fp, #-80]
	mla	r3, r1, r3, r2
	b	.L501
.L519:
	ldr	r3, [r7, #864]
	cmp	r3, #6
	moveq	r4, #2
	beq	.L483
	cmp	r3, #5
	moveq	r4, #4
	beq	.L483
	cmp	r3, #4
	moveq	r4, #8
	bne	.L520
.L483:
	ldr	r8, [r7, #840]
	cmp	r8, #0
	movle	r3, #0
	ldrle	r1, [r7, #856]
	strle	r3, [fp, #-64]
	ble	.L482
	ldr	r2, [fp, #-84]
	mov	r6, #0
	ldr	r3, [fp, #-76]
	str	r6, [fp, #-72]
	str	r6, [fp, #-64]
	mul	r3, r3, r2
	str	r7, [fp, #-56]
	sub	r2, r4, #1
	str	r2, [fp, #-88]
	str	r3, [fp, #-92]
	sub	r3, r3, #1
	str	r3, [fp, #-96]
	b	.L486
.L523:
	ldrsh	r0, [r5, #38]
	mov	r1, r4
	sub	r0, r0, #1
	add	r0, r0, r4
	bl	__aeabi_uidiv
	mul	r3, r4, r0
	cmp	r10, r3
	str	r3, [fp, #-72]
	ldrgt	r10, [fp, #-88]
	bgt	.L489
.L488:
	ldr	r3, [fp, #-56]
	add	r6, r6, #1
	ldr	r8, [r3, #840]
	cmp	r6, r8
	bge	.L521
	cmp	r6, #199
	bgt	.L522
.L486:
	ldr	r3, [fp, #-56]
	mov	r1, r4
	add	r5, r3, r6, lsl #2
	ldrsh	r7, [r5, #42]
	ldrh	r3, [r5, #40]
	sub	r0, r7, #1
	add	r0, r0, r4
	str	r3, [fp, #-68]
	bl	__aeabi_uidiv
	cmp	r6, #0
	mul	r10, r4, r0
	bgt	.L523
	ldr	r2, [fp, #-72]
	cmp	r10, r2
	movgt	r2, #0
	movle	r2, #1
	cmp	r6, #0
	moveq	r2, #0
	cmp	r2, #0
	bne	.L488
.L491:
	ldrsh	r0, [fp, #-68]
	mov	r1, r4
	bl	__aeabi_uidiv
	ldr	r3, [fp, #-92]
	ldr	r5, [fp, #-96]
	cmp	r3, r10
	ldr	r3, [fp, #-64]
	movhi	r5, r10
	add	r3, r3, #1
	str	r3, [fp, #-64]
	mul	r8, r4, r0
	cmp	r8, r5
	movgt	r8, #0
	cmp	r3, #252
	bgt	.L524
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
	ldr	r2, [fp, #-64]
	ldr	r9, [fp, #-60]
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
	b	.L488
.L492:
	bl	__aeabi_uidiv
	mov	r1, r4
	mul	r7, r4, r0
	ldrsh	r0, [r5, #44]
	bl	__aeabi_uidiv
	mul	r0, r4, r0
	cmp	r7, r0
	add	r2, r0, #1
	bhi	.L493
	cmp	r7, r2
	mov	r1, r4
	beq	.L493
	ldrsh	r0, [r5, #38]
	add	r0, r0, r10
	bl	__aeabi_uidiv
	mul	r0, r4, r0
	cmp	r7, r0
	bhi	.L525
.L493:
	cmp	r9, #198
	mov	r6, r9
	add	r5, r5, #4
	bgt	.L526
	ldrsh	r7, [r5, #42]
.L489:
	add	r9, r6, #1
	mov	r1, r4
	cmp	r9, r8
	add	r0, r10, r7
	blt	.L492
	ldr	r3, [fp, #-88]
	add	r0, r3, r7
	bl	__aeabi_uidiv
	mul	r10, r4, r0
	b	.L491
.L526:
	ldr	r3, [fp, #-56]
	mov	r1, r4
	add	r3, r3, r9, lsl #2
	ldrsh	r0, [r3, #42]
	sub	r0, r0, #1
	add	r0, r0, r4
	bl	__aeabi_uidiv
	mul	r10, r4, r0
	b	.L491
.L524:
	ldr	r7, [fp, #-56]
	mov	r1, #1
	str	r1, [r7, #856]
.L498:
	ldr	r3, [fp, #-76]
	mov	lr, #0	@ movhi
	mov	ip, lr	@ movhi
	str	r1, [r7, #840]
	sub	r2, r3, #1
	ldr	r3, [fp, #-84]
	ldr	r1, [fp, #-60]
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
	b	.L499
.L476:
	ldr	r0, [r7, #848]
	cmp	r0, #1
	movne	r2, #0
	bne	.L500
.L474:
	add	r0, r2, #2032
	adds	lr, r3, #63
	add	r0, r0, #15
	addmi	lr, r3, #126
	add	r2, r2, #4080
	cmp	r0, #0
	add	r2, r2, #14
	movge	r2, r0
	mov	r0, lr, asr #6
	mov	r2, r2, asr #11
	mov	r0, r0, asl #5
	mov	r2, r2, asl #4
	mul	r2, r2, r0
	b	.L475
.L525:
	mov	r10, r7
	b	.L491
.L521:
	mov	r7, r3
	ldr	r1, [r3, #856]
	b	.L482
.L522:
	ldr	r7, [fp, #-56]
	mov	r0, #0
	ldr	r1, .L527
	movw	r3, #2164
	str	r6, [sp]
	ldr	r2, .L527+4
	str	r0, [fp, #-64]
	bl	dprint_vfmw
	ldr	r1, [r7, #856]
	b	.L482
.L520:
	ldr	r1, .L527+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r4, #1
	b	.L483
.L518:
	ldr	r1, .L527+12
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L515
.L517:
	ldr	r3, .L527+16
	ldr	r2, .L527+20
	ldr	r1, .L527+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L515
.L528:
	.align	2
.L527:
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
	bgt	.L563
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L564
.L532:
	ldr	r4, .L566
	ldr	r3, [r1, #48]
	ldrb	r2, [r4]	@ zero_extendqisi2
	bic	r3, r3, #15
	str	r3, [fp, #-32]
	cmp	r2, #1
	bne	.L565
	movw	r1, #1228
	ldr	r2, .L566+4
	mul	r1, r1, r6
	ldr	r1, [r2, r1]
	str	r3, [r1, #16]
.L535:
	movw	r3, #1228
	movw	r1, #53763
	mul	r3, r3, r6
	movt	r1, 8192
	ldr	r3, [r2, r3]
	str	r1, [r3, #12]
.L537:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #60]
.L539:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #64]
.L541:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #68]
.L543:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #72]
.L545:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #76]
.L547:
	movw	r3, #1228
	movw	r1, #3075
	mul	r3, r3, r6
	movt	r1, 48
	ldr	r3, [r2, r3]
	str	r1, [r3, #80]
.L549:
	movw	r3, #1228
	movw	r1, #3075
	mul	r6, r3, r6
	mov	r0, #0
	movt	r1, 48
	ldr	r3, [r2, r6]
	str	r1, [r3, #84]
.L552:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L565:
	mov	r2, #16
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r2, [r4]	@ zero_extendqisi2
	movw	r3, #53763
	cmp	r2, #1
	movt	r3, 8192
	str	r3, [fp, #-32]
	ldreq	r2, .L566+4
	beq	.L535
	mov	r2, #12
	mov	r1, #2
	ldr	r0, [fp, #4]
	movw	r5, #3075
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	movt	r5, 48
	str	r5, [fp, #-32]
	cmp	r3, #1
	ldreq	r2, .L566+4
	beq	.L537
	mov	r3, r5
	mov	r2, #60
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L566+4
	beq	.L539
	mov	r3, r5
	mov	r2, #64
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L566+4
	beq	.L541
	mov	r3, r5
	mov	r2, #68
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L566+4
	beq	.L543
	mov	r3, r5
	mov	r2, #72
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L566+4
	beq	.L545
	mov	r3, r5
	mov	r2, #76
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L566+4
	beq	.L547
	mov	r3, r5
	mov	r2, #80
	mov	r1, #2
	ldr	r0, [fp, #4]
	bl	VDH_Record_RegData
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r2, .L566+4
	beq	.L549
	ldr	r0, [fp, #4]
	mov	r3, r5
	mov	r2, #84
	mov	r1, #2
	bl	VDH_Record_RegData
	mov	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L564:
	mov	r0, #0
	str	r1, [fp, #-40]
	movt	r0, 63683
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L533
	ldr	r1, [fp, #-40]
	str	r3, [r1]
	b	.L532
.L563:
	str	r0, [sp]
	ldr	r2, .L566+8
	ldr	r1, .L566+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L552
.L533:
	ldr	r1, .L566+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L552
.L567:
	.align	2
.L566:
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
	beq	.L597
	ldr	r5, [r3, #4]
	ldr	r8, [r3]
	cmp	r5, #0
	ldr	r6, [r3, #8]
	beq	.L598
	movw	r3, #1228
	ldr	r7, .L606
	mul	r3, r3, r6
	ldr	r0, [r7, r3]
	cmp	r0, #0
	beq	.L572
	ldr	r3, .L606+4
	ldr	r2, [r3]
	cmp	r2, #1
	addne	r1, r3, #124
	bne	.L575
	b	.L587
.L600:
	cmp	r3, r1
	beq	.L599
.L575:
	ldr	r2, [r3, #4]!
	cmp	r2, #1
	bne	.L600
.L587:
	mov	r4, r2
.L573:
	ldr	r3, .L606+8
	mov	r2, #816
	mov	r1, #0
	mov	r0, r5
	ldr	r3, [r3, #48]
	blx	r3
	movw	r3, #1228
	mla	r3, r3, r6, r7
	ldr	r1, .L606+12
	mov	r2, #180
	mla	r2, r2, r6, r1
	ldr	r3, [r3, #24]
	str	r3, [r5, #4]
	ldr	r3, [r2, #4]
	mov	r3, r3, lsr #17
	and	r2, r3, #3
	cmp	r2, #1
	moveq	r3, #0
	beq	.L576
	eor	r3, r3, #1
	and	r3, r3, #1
	cmp	r8, #3
	orrne	r3, r3, #1
.L576:
	mov	r2, #180
	str	r3, [r5]
	mla	r3, r2, r6, r1
	cmp	r8, #0
	cmpne	r8, #15
	ldr	r2, [r3, #4]
	ubfx	r2, r2, #0, #17
	str	r2, [r5, #8]
	beq	.L601
.L577:
	cmp	r2, #200
	bhi	.L602
.L579:
	movw	r3, #1228
	mla	r7, r3, r6, r7
	ldr	r7, [r7, #40]
	mov	r0, r7
	bl	MEM_Phy2Vir
	subs	r1, r0, #0
	beq	.L603
	ldr	r8, .L606+16
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
	beq	.L584
.L583:
	ldr	r0, [r3, #4]
	add	r1, r1, #1
	cmp	r1, ip
	add	r3, r3, #16
	add	r2, r2, #4
	strh	r0, [r2, #8]	@ movhi
	ldr	r0, [r3, #-8]
	strh	r0, [r2, #10]	@ movhi
	bne	.L583
.L584:
	mov	r0, #6
	bl	IsDprintTypeEnable
	cmp	r0, #0
	bne	.L604
.L570:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L601:
	cmp	r4, #1
	beq	.L605
	ldr	r1, .L606+20
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L577
	ldrb	r3, [r3, #19]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L577
	mov	r3, #1
	strh	r1, [r5, #12]	@ movhi
	mov	r0, r1
	strh	r1, [r5, #14]	@ movhi
	str	r3, [r5, #8]
	b	.L570
.L599:
	mov	r4, #0
	b	.L573
.L604:
	ldr	r2, [r5, #8]
	mov	r0, #6
	ldr	r1, .L606+24
	mov	r4, #0
	bl	dprint_vfmw
	mov	r2, r7
	ldr	r1, .L606+28
	mov	r0, #6
	bl	dprint_vfmw
	mov	r3, #3200
	mla	r6, r3, r6, r8
.L585:
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
	ldr	r1, .L606+32
	bl	dprint_vfmw
	ldr	r3, [r5, #8]
	mov	r3, r3, asl #2
	sub	r3, r3, #3
	cmp	r3, r4
	bhi	.L585
	ldr	r1, .L606+36
	mov	r0, #6
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L602:
	mov	r3, #200
	ldr	r1, .L606+40
	mov	r0, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r5, #8]
	b	.L579
.L605:
	ldr	r3, [r3, #16]
	ubfx	r3, r3, #21, #2
	cmp	r3, #2
	bne	.L577
	mov	r3, #0
	str	r4, [r5, #8]
	strh	r3, [r5, #12]	@ movhi
	mov	r0, r3
	strh	r3, [r5, #14]	@ movhi
	b	.L570
.L603:
	ldr	r3, .L606+44
	ldr	r2, .L606+48
	ldr	r1, .L606+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L570
.L572:
	ldr	r3, .L606+56
	ldr	r2, .L606+48
	ldr	r1, .L606+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L570
.L598:
	mov	r0, r5
	ldr	r3, .L606+60
	ldr	r2, .L606+48
	ldr	r1, .L606+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L570
.L597:
	ldr	r3, .L606+64
	ldr	r2, .L606+48
	ldr	r1, .L606+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L570
.L607:
	.align	2
.L606:
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
	ldr	r5, .L623
	cmp	r3, #0
	mov	r6, r3
	mov	r7, r0
	add	r8, r4, r5
	bgt	.L619
	ldr	r3, [r4, r5]
	cmp	r3, #0
	beq	.L620
.L611:
	cmp	r2, #0
	beq	.L621
	cmp	r2, #1
	movne	r0, #0
	beq	.L622
.L610:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L621:
	ldr	r4, .L623+4
	movw	r3, #1752
	mla	r3, r3, r6, r4
	ldr	r0, [r3, #840]
	cmp	r0, #0
	ble	.L614
	cmp	r7, #6
	bne	.L615
	ldrb	r0, [r1, #17]	@ zero_extendqisi2
	cmp	r0, #1
	moveq	r2, r0
	str	r2, [r3, #1728]
.L615:
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
.L622:
	cmp	r7, #6
	bne	.L617
	ldrb	r3, [r1, #17]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L617
	movw	r4, #1752
	ldr	r5, .L623+4
	mul	r4, r4, r6
	add	ip, r5, r4
	ldr	r3, [ip, #1716]
	cmp	r3, #0
	ble	.L617
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
.L620:
	mov	r0, #0
	str	r2, [fp, #-44]
	movt	r0, 63683
	str	r1, [fp, #-40]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L612
	str	r3, [r4, r5]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-44]
	b	.L611
.L619:
	mov	r0, #0
	ldr	r2, .L623+8
	str	r0, [sp]
	ldr	r1, .L623+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L610
.L617:
	ldr	r1, .L623+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #0
	b	.L610
.L614:
	mov	r0, r2
	ldr	r1, .L623+20
	str	r2, [fp, #-40]
	bl	dprint_vfmw
	ldr	r2, [fp, #-40]
	mov	r0, r2
	b	.L610
.L612:
	ldr	r1, .L623+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L610
.L624:
	.align	2
.L623:
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
	ldr	r6, .L655
	mov	r5, r0
	mov	r4, r1
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L649
	cmp	r0, #0
	ble	.L650
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, .L655+4
	mov	r0, #32
	ldr	r1, .L655+8
	bl	dprint_vfmw
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L651
.L633:
	mov	r2, #1
	mov	r3, r5
	str	r2, [sp]
	mov	r0, #32
	ldr	r2, .L655+4
	ldr	r1, .L655+8
	bl	dprint_vfmw
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L645
.L628:
	cmp	r4, #0
	beq	.L652
	mov	r3, r5, asl #6
	ldr	r2, .L655+12
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
.L650:
	movw	r3, #1228
	ldr	r4, .L655+16
	mul	r3, r3, r0
	mov	r2, #67108864
	ldr	r3, [r4, r3]
	str	r2, [r3, #8]
.L631:
	movw	r3, #1228
	ldr	r2, .L655+20
	mul	r3, r3, r5
	mvn	r1, #1
	ldr	r3, [r4, r3]
	str	r1, [r3, #36]
	ldr	r3, [r2, #112]
	blx	r3
.L640:
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
.L625:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L649:
	mov	r3, #67108864
	mov	r2, #8
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L653
	cmp	r5, #0
	ldrle	r4, .L655+16
	bgt	.L633
	b	.L631
.L653:
	mvn	r3, #1
	mov	r2, #36
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L628
	ldr	r3, .L655+20
	ldr	r3, [r3, #112]
	blx	r3
	cmp	r5, #0
	ble	.L654
.L637:
	mov	r4, #1
	mov	r3, r5
	str	r4, [sp]
	mov	r0, #32
	ldr	r2, .L655+24
	ldr	r1, .L655+8
	bl	dprint_vfmw
	mov	r3, r5
	str	r4, [sp]
	mov	r0, #32
	ldr	r2, .L655+24
	ldr	r1, .L655+8
	bl	dprint_vfmw
	str	r4, [sp]
	mov	r3, r5
	ldr	r2, .L655+24
	ldr	r1, .L655+8
	mov	r0, #32
	bl	dprint_vfmw
	b	.L625
.L651:
	mvn	r3, #1
	mov	r2, #36
	mov	r1, #2
	mov	r0, r4
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L628
.L645:
	ldr	r3, .L655+20
	ldr	r3, [r3, #112]
	blx	r3
	b	.L637
.L652:
	mov	r3, r4
	mov	r0, r4
	ldr	r2, .L655+24
	ldr	r1, .L655+28
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	dprint_vfmw
.L654:
	ldr	r4, .L655+16
	b	.L640
.L656:
	.align	2
.L655:
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
	ldr	r6, .L683
	ldr	r10, [r6, #128]
	cmp	r10, #0
	blt	.L678
	ldr	r8, .L683+4
	add	r4, r6, #128
	ldr	r7, .L683+8
	add	r6, r6, #252
	mov	r5, #30
	mov	r9, #0
.L659:
	mov	r0, r10
	bl	VCTRL_IsChanActive
	cmp	r0, #0
	bne	.L682
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
	b	.L679
.L664:
	.word	.L673
	.word	.L673
	.word	.L673
	.word	.L673
	.word	.L679
	.word	.L673
	.word	.L673
	.word	.L679
	.word	.L673
	.word	.L673
	.word	.L673
	.word	.L673
	.word	.L673
	.word	.L673
	.word	.L679
	.word	.L674
	.word	.L673
	.word	.L673
.L673:
	mul	r9, r10, r9
	mul	r9, r9, r5
.L661:
	cmp	r4, r6
	beq	.L681
	ldr	r10, [r4, #4]!
	cmp	r10, #0
	bge	.L659
.L681:
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
.L674:
	mul	r9, r10, r9
	mul	r9, r9, r5
	mov	r9, r9, asl #1
	b	.L661
.L682:
	mov	r3, r10
	ldr	r2, .L683+12
	ldr	r1, .L683+16
	mov	r0, #1
	bl	dprint_vfmw
	b	.L661
.L679:
	mov	r9, #0
	b	.L661
.L678:
	mov	r0, #25
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L684:
	.align	2
.L683:
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
	ldr	r2, .L693
	sub	r0, r3, r0, asl #3
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L686
.L688:
	.word	.L686
	.word	.L689
	.word	.L690
	.word	.L691
.L686:
	add	r3, r2, r0
	mov	r1, #500
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L690:
	add	r3, r2, r0
	mov	r1, #100
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L689:
	add	r3, r2, r0
	mov	r1, #540
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L691:
	add	r3, r2, r0
	mov	r1, #600
	mov	r0, r1
	str	r1, [r3, #16]
	ldmfd	sp, {fp, sp, pc}
.L694:
	.align	2
.L693:
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
	ble	.L696
	mov	r0, #0
	mov	r3, r5
	str	r0, [sp]
	ldr	r2, .L734
	ldr	r1, .L734+4
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L696:
	ldr	r6, .L734+8
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L731
	ldr	r2, .L734+12
	ldr	r8, .L734+16
	ldr	r10, .L734+20
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
.L700:
	ldr	r2, [r2]
	ldr	r3, [r2, #120]
	bfc	r3, #12, #5
	bfc	r3, #17, #1
	str	r3, [r2, #120]
	ldr	r3, [r2, #120]
	orr	r3, r3, #131072
	str	r3, [r2, #120]
.L702:
	ldr	r1, [r10, r7, asl #2]
	mov	r2, r5
	mov	r3, r4
	mov	r0, #12
	ldr	r10, .L734+8
	ldr	r1, [r1, #544]
	cmp	r1, #16
	movne	r1, #3
	moveq	r1, #0
	bl	SCD_ConfigReg
	ldrb	r2, [r6]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L732
	movw	r2, #1228
	ldr	r3, .L734+24
	mul	r2, r2, r5
	ldr	r4, .L734+28
	ldr	r1, [r3]
	movw	r3, #43690
	bfi	r3, r3, #16, #16
	cmp	r1, #1
	ldr	r2, [r4, r2]
	moveq	r1, #15
	movne	r1, #0
	str	r3, [r2, #156]
.L705:
	movw	r2, #1228
	cmp	r9, #1
	mul	r2, r2, r5
	mvneq	r3, #5
	mvnne	r3, #1
	ldr	r2, [r4, r2]
	add	r2, r2, #61440
	str	r1, [r2, #32]
.L707:
	movw	r2, #1228
	mul	r2, r2, r5
	ldr	r2, [r4, r2]
	str	r3, [r2, #36]
.L709:
	ldr	r6, .L734+32
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
	ldr	ip, .L734+36
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
.L732:
	movw	r3, #43690
	mov	r1, #2
	mov	r2, #156
	movt	r3, 43690
	mov	r0, r4
	bl	VDH_Record_RegData
	ldr	r3, .L734+24
	ldrb	r2, [r10]	@ zero_extendqisi2
	ldr	r3, [r3]
	cmp	r3, #1
	moveq	r1, #15
	movne	r1, #0
	cmp	r2, #1
	ldreq	r4, .L734+28
	beq	.L705
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
	ldreq	r4, .L734+28
	beq	.L707
	mov	r0, r4
	mov	r2, #36
	mov	r1, #2
	bl	VDH_Record_RegData
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r4, .L734+28
	beq	.L709
	cmp	r4, #0
	beq	.L733
	mov	r3, #1
	str	r7, [r4, #8]
	strb	r5, [r4]
	mov	r0, r4
	str	r3, [r4, #4]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	VDH_PostTask
.L731:
	mov	r3, #0
	mov	r0, r1
	mov	r2, r3
	mov	r1, r3
	bl	VDH_Record_RegData
	ldr	r8, .L734+16
	mov	r3, r5, asl #6
	ldr	r10, .L734+20
	sub	r3, r3, r5, asl #3
	ldrb	r1, [r6]	@ zero_extendqisi2
	add	r3, r8, r3
	mov	r2, #500
	cmp	r1, #1
	ldr	r7, [r3, #8]
	str	r2, [r3, #16]
	ldreq	r2, .L734+12
	ldr	r3, [r10, r7, asl #2]
	ldr	r9, [r3, #1168]
	beq	.L700
	mov	r3, #0
	mov	r2, #1
	mov	r1, r3
	mov	r0, r4
	bl	VDH_Record_RegData
	b	.L702
.L733:
	mov	r3, r4
	mov	r0, r4
	ldr	r2, .L734
	ldr	r1, .L734+40
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L735:
	.align	2
.L734:
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
	ldr	r1, .L737
	mov	r0, #15
	ldr	r3, .L737+4
	mov	r2, #4
	str	r0, [r1]
	str	r2, [r3]
	ldmfd	sp, {fp, sp, pc}
.L738:
	.align	2
.L737:
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
	beq	.L740
	cmp	r3, #2
	moveq	r4, #1
	movne	r4, #2
.L740:
	ldr	r3, [fp, #-108]
	cmp	r3, #0
	beq	.L739
	mov	r3, #0
	mov	r2, #4194304
	mov	r1, r3
	str	r3, [sp]
	ldr	r0, .L829
	sub	r3, fp, #92
	bl	MEM_AllocMemBlock
	subs	r1, r0, #0
	bne	.L743
	str	r1, [sp]
	mov	r2, #4194304
	sub	r3, fp, #68
	ldr	r0, .L829+4
	bl	MEM_AllocMemBlock
	cmp	r0, #0
	bne	.L743
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
	bne	.L744
	ldr	r3, [fp, #-100]
	mov	r1, r5, lsr #1
	ldr	r2, [fp, #-64]
	cmp	r3, #0
	ldr	r6, .L829+8
	mov	r3, r3, lsr #1
	ldr	r4, [fp, #-88]
	str	r2, [fp, #-120]
	movne	r9, r0
	add	r2, r2, #2097152
	str	r1, [fp, #-124]
	str	r2, [fp, #-128]
	str	r3, [fp, #-112]
	strne	r9, [fp, #-96]
	beq	.L746
.L745:
	cmp	r5, #0
	beq	.L748
	ldr	r2, [fp, #-96]
	mov	r7, #0
	and	r10, r2, #15
	mov	r3, r2, lsr #4
	ldr	r2, [fp, #-104]
	mul	r3, r2, r3
	add	r10, r3, r10, lsl #8
.L747:
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
	bhi	.L747
.L748:
	ldr	r3, [fp, #-96]
	add	r9, r9, r5
	ldr	r2, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r2, r3
	bne	.L745
.L746:
	ldr	r3, [fp, #-100]
	mov	r0, r4
	ldr	ip, [r6, #44]
	ldr	r2, [fp, #-108]
	mul	r1, r5, r3
	blx	ip
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L749
	ldr	r3, [fp, #-104]
	mov	r8, #0
	ldr	r9, [fp, #-116]
	str	r8, [fp, #-96]
	mov	r3, r3, asr #1
	str	r3, [fp, #-100]
.L750:
	cmp	r5, #0
	beq	.L753
	ldr	r2, [fp, #-96]
	mov	r7, #0
	and	r10, r2, #7
	mov	r3, r2, lsr #3
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	add	r10, r3, r10, lsl #8
.L751:
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
	bhi	.L751
.L753:
	ldr	r3, [fp, #-96]
	add	r8, r8, r5
	ldr	r2, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, r2
	bne	.L750
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L827
.L755:
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L756
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
.L756:
	ldr	r3, [fp, #-124]
.L826:
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
.L739:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L743:
	ldr	r1, .L829+12
	mov	r0, #1
	bl	dprint_vfmw
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L744:
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
	ldr	r6, .L829+8
	ldr	r7, [fp, #-88]
	strhi	r3, [fp, #-96]
	bls	.L763
.L765:
	cmp	r5, #0
	beq	.L766
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r9, r2, #15
	mov	r3, r2, lsr #4
	mov	r10, r2, lsr #1
	ldr	r2, [fp, #-104]
	mul	r10, r5, r10
	mul	r3, r2, r3
	add	r9, r3, r9, lsl #8
.L764:
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
	bhi	.L764
.L766:
	ldr	r3, [fp, #-96]
	ldr	r2, [fp, #-100]
	add	r3, r3, #2
	str	r3, [fp, #-96]
	cmp	r2, r3
	bhi	.L765
.L763:
	ldr	r3, [fp, #-100]
	mov	r0, r7
	ldr	ip, [r6, #44]
	ldr	r2, [fp, #-108]
	mul	r1, r5, r3
	mov	r1, r1, lsr #1
	blx	ip
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	beq	.L767
	ldr	r3, [fp, #-104]
	mov	r8, #0
	ldr	r9, [fp, #-116]
	str	r8, [fp, #-96]
	mov	r3, r3, asr #1
	str	r3, [fp, #-100]
.L768:
	cmp	r5, #0
	beq	.L771
	ldr	r2, [fp, #-96]
	mov	r4, #0
	and	r10, r2, #7
	mov	r3, r2, lsr #3
	ldr	r2, [fp, #-100]
	mul	r3, r2, r3
	add	r10, r3, r10, lsl #8
.L769:
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
	bhi	.L769
.L771:
	ldr	r3, [fp, #-96]
	add	r8, r8, r5
	ldr	r2, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-96]
	cmp	r3, r2
	bne	.L768
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L828
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L774
	ldr	r2, [fp, #-112]
	ldr	r3, [fp, #-124]
	cmp	r2, r3
	bls	.L779
.L780:
	add	r3, r3, #2
	cmp	r2, r3
	bhi	.L780
.L779:
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
.L774:
	ldr	r3, [fp, #-132]
	b	.L826
.L827:
	ldr	r2, [fp, #-120]
	add	r4, r4, #1
	ldr	r7, [fp, #-124]
	mov	r3, #0
	ldr	r8, [fp, #-112]
.L757:
	cmp	r7, #0
	moveq	lr, r2
	beq	.L760
	sub	r0, r2, #-67108863
	add	lr, r2, r7
	sub	r0, r0, #65011712
	mov	r1, r4
.L758:
	ldrb	ip, [r1, #-1]	@ zero_extendqisi2
	strb	ip, [r0, #1]!
	ldrb	ip, [r1], #2	@ zero_extendqisi2
	strb	ip, [r2], #1
	cmp	r2, lr
	bne	.L758
.L760:
	add	r3, r3, #1
	mov	r2, lr
	cmp	r3, r8
	add	r4, r4, r5
	bne	.L757
	b	.L756
.L828:
	ldr	r3, [fp, #-124]
	ldr	r4, [fp, #-120]
	ldr	lr, [fp, #-132]
	mla	r2, r5, r3, r7
	ldr	r7, [fp, #-112]
	mov	r5, r5, asl #1
	mov	r3, #0
	add	r2, r2, #1
.L775:
	cmp	lr, #0
	beq	.L778
	mov	r1, r3, lsr #1
	mov	r0, r2
	mul	r1, lr, r1
	sub	ip, r1, #-67108863
	add	r9, r1, lr
	sub	ip, ip, #65011712
	add	r9, r4, r9
	add	ip, r4, ip
	add	r1, r4, r1
.L776:
	ldrb	r8, [r0, #-1]	@ zero_extendqisi2
	strb	r8, [ip, #1]!
	ldrb	r8, [r0], #2	@ zero_extendqisi2
	strb	r8, [r1], #1
	cmp	r1, r9
	bne	.L776
.L778:
	add	r3, r3, #2
	add	r2, r2, r5
	cmp	r7, r3
	bhi	.L775
	b	.L774
.L749:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	bne	.L755
	b	.L756
.L767:
	ldr	r3, [fp, #4]
	cmp	r3, #1
	beq	.L774
	cmp	r3, #0
	beq	.L779
	b	.L774
.L830:
	.align	2
.L829:
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
	ldr	ip, .L838
	mov	lr, r2
	ldrb	ip, [ip]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L837
	cmp	r0, #0
	bne	.L833
	ldr	r3, .L838+4
	ldr	r3, [r3]
	ldr	r2, [r3, #120]
	ubfx	r0, r2, #8, #2
	cmp	r1, r0
	bfine	r2, r1, #8, #2
	strne	r2, [r3, #120]
	ldmfd	sp, {fp, sp, pc}
.L833:
	cmp	r0, #1
	ldmnefd	sp, {fp, sp, pc}
	ldr	r3, .L838+4
	ldr	r3, [r3]
	ldr	r2, [r3, #120]
	bfi	r2, r1, #12, #5
	bfc	r2, #17, #1
	str	r2, [r3, #120]
	ldr	r2, [r3, #120]
	orr	r2, r2, #131072
	str	r2, [r3, #120]
	ldmfd	sp, {fp, sp, pc}
.L837:
	mov	r3, r1
	mov	r2, r0
	mov	r1, #0
	mov	r0, lr
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDH_Record_RegData
.L839:
	.align	2
.L838:
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
	ldr	ip, .L846
	mov	lr, r3
	ldrb	ip, [ip]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L844
	cmp	r2, #0
	ble	.L845
	mov	r3, r2
	str	ip, [sp]
	ldr	r2, .L846+4
	mov	r0, #32
	ldr	r1, .L846+8
	bl	dprint_vfmw
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L845:
	movw	r3, #1228
	ldr	ip, .L846+12
	mul	r2, r3, r2
	ldr	r3, [ip, r2]
	str	r1, [r3, r0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L844:
	mov	r3, r1
	mov	r2, r0
	mov	r1, #2
	mov	r0, lr
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VDH_Record_RegData
.L847:
	.align	2
.L846:
	.word	g_HalDisable
	.word	.LANCHOR0+860
	.word	.LC28
	.word	g_HwMem
	UNWIND(.fnend)
	.size	MFDE_ConfigReg, .-MFDE_ConfigReg
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	__func__.55120, %object
	.size	__func__.55120, 24
__func__.55120:
	.ascii	"VDMHAL_V400R003_OpenHAL\000"
	.type	__func__.55205, %object
	.size	__func__.55205, 27
__func__.55205:
	.ascii	"VDMHAL_V400R003_CalcFsSize\000"
	.space	1
	.type	__func__.55240, %object
	.size	__func__.55240, 34
__func__.55240:
	.ascii	"VDMHAL_V400R003_ArrangeMem_Normal\000"
	.space	2
	.type	__FUNCTION__.55241, %object
	.size	__FUNCTION__.55241, 34
__FUNCTION__.55241:
	.ascii	"VDMHAL_V400R003_ArrangeMem_Normal\000"
	.space	2
	.type	__func__.55217, %object
	.size	__func__.55217, 35
__func__.55217:
	.ascii	"VDMHAL_V400R003_FillMemArrangeInfo\000"
	.space	1
	.type	__func__.55335, %object
	.size	__func__.55335, 36
__func__.55335:
	.ascii	"VDMHAL_V400R003_ArrangeMem_Specific\000"
	.type	__func__.55358, %object
	.size	__func__.55358, 25
__func__.55358:
	.ascii	"VDMHAL_V400R003_ResetVdm\000"
	.space	3
	.type	__func__.55368, %object
	.size	__func__.55368, 37
__func__.55368:
	.ascii	"VDMHAL_V400R003_SetSmmuPageTableAddr\000"
	.space	3
	.type	__func__.55389, %object
	.size	__func__.55389, 26
__func__.55389:
	.ascii	"VDMHAL_V400R003_GlbResetX\000"
	.space	2
	.type	__func__.55378, %object
	.size	__func__.55378, 25
__func__.55378:
	.ascii	"VDMHAL_V400R003_GlbReset\000"
	.space	3
	.type	__func__.55401, %object
	.size	__func__.55401, 30
__func__.55401:
	.ascii	"VDMHAL_V400R003_ClearIntState\000"
	.space	2
	.type	__func__.55407, %object
	.size	__func__.55407, 33
__func__.55407:
	.ascii	"VDMHAL_V400R003_ClearMMUIntState\000"
	.space	3
	.type	__func__.55413, %object
	.size	__func__.55413, 24
__func__.55413:
	.ascii	"VDMHAL_V400R003_MaskInt\000"
	.type	__func__.55426, %object
	.size	__func__.55426, 26
__func__.55426:
	.ascii	"VDMHAL_V400R003_EnableInt\000"
	.space	2
	.type	__func__.55435, %object
	.size	__func__.55435, 25
__func__.55435:
	.ascii	"VDMHAL_V400R003_CheckReg\000"
	.space	3
	.type	__func__.55449, %object
	.size	__func__.55449, 28
__func__.55449:
	.ascii	"VDMHAL_V400R003_ReadMMUMask\000"
	.type	__func__.55454, %object
	.size	__func__.55454, 29
__func__.55454:
	.ascii	"VDMHAL_V400R003_WriteMMUMask\000"
	.space	3
	.type	__func__.55485, %object
	.size	__func__.55485, 27
__func__.55485:
	.ascii	"VDMHAL_V400R003_PrepareDec\000"
	.space	1
	.type	__func__.55490, %object
	.size	__func__.55490, 27
__func__.55490:
	.ascii	"VDMHAL_V400R003_IsVdmReady\000"
	.space	1
	.type	__func__.55495, %object
	.size	__func__.55495, 25
__func__.55495:
	.ascii	"VDMHAL_V400R003_IsVdmRun\000"
	.space	3
	.type	__func__.55501, %object
	.size	__func__.55501, 29
__func__.55501:
	.ascii	"VDMHAL_V400R003_IsVdhDecOver\000"
	.space	3
	.type	__func__.55510, %object
	.size	__func__.55510, 33
__func__.55510:
	.ascii	"VDMHAL_V400R003_IsVdhPartDecOver\000"
	.space	3
	.type	__func__.55525, %object
	.size	__func__.55525, 35
__func__.55525:
	.ascii	"VDMHAL_V400R003_UpdateHardwareInfo\000"
	.space	1
	.type	__func__.55598, %object
	.size	__func__.55598, 25
__func__.55598:
	.ascii	"VDMHAL_V400R003_CfgRpMsg\000"
	.space	3
	.type	__func__.55575, %object
	.size	__func__.55575, 24
__func__.55575:
	.ascii	"VDMHAL_CfgNotFullRepair\000"
	.type	__func__.55609, %object
	.size	__func__.55609, 25
__func__.55609:
	.ascii	"VDMHAL_V400R003_CfgRpReg\000"
	.space	3
	.type	__func__.55622, %object
	.size	__func__.55622, 30
__func__.55622:
	.ascii	"VDMHAL_V400R003_MakeDecReport\000"
	.space	2
	.type	__func__.55661, %object
	.size	__func__.55661, 30
__func__.55661:
	.ascii	"VDMHAL_V400R003_PrepareRepair\000"
	.space	2
	.type	__func__.55848, %object
	.size	__func__.55848, 15
__func__.55848:
	.ascii	"MFDE_ConfigReg\000"
	.space	1
	.type	__func__.55668, %object
	.size	__func__.55668, 30
__func__.55668:
	.ascii	"VDMHAL_V400R003_StartHwRepair\000"
	.space	2
	.type	__func__.55708, %object
	.size	__func__.55708, 30
__func__.55708:
	.ascii	"VDMHAL_V400R003_CalVdhClkSkip\000"
	.space	2
	.type	__func__.55730, %object
	.size	__func__.55730, 30
__func__.55730:
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
	ASCII(.ascii	"VDMHAL ArrangeMem HEVC/VP9 10 bit\012\000" )
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
