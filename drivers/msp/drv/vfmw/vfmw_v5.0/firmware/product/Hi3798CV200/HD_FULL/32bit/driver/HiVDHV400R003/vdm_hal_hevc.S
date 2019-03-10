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
	.file	"vdm_hal_hevc.c"
	.text
	.align	2
	.global	HEVCWriteCabacTab
	.type	HEVCWriteCabacTab, %function
HEVCWriteCabacTab:
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
	ldr	r6, .L19
	mov	r9, #0
	ldr	r10, .L19+4
	mov	r1, r9
	mov	r8, r9
	mov	r7, r9
	mov	r5, #16
.L2:
	add	lr, r5, r9
	mov	r4, r1, asl #1
	rsb	r5, r1, r5
	add	ip, r6, r4
	add	lr, r10, lr, lsl #2
.L6:
	ldr	r3, [lr], #4
	add	r1, r1, #1
	add	ip, ip, #2
	cmn	r3, #1
	and	r2, r3, #15
	mov	r3, r3, asr #4
	streqb	r7, [r6, r4]
	mov	r2, r2, asl #3
	streqb	r7, [ip, #-1]
	addne	r3, r3, r3, lsl #2
	subne	r2, r2, #16
	subne	r3, r3, #45
	strneb	r3, [r6, r4]
	add	r3, r5, r1
	strneb	r2, [ip, #-1]
	cmp	r3, #159
	mov	r4, r1, asl #1
	ble	.L6
	add	r8, r8, #1
	cmp	r8, #3
	beq	.L17
	cmp	r8, #0
	add	r9, r9, #160
	moveq	r5, #16
	movne	r5, #0
	b	.L2
.L17:
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	addne	r3, r3, #2
	ldrne	r2, .L19+8
	addne	r0, r2, #928
	beq	.L18
.L10:
	ldrb	r1, [r2, #-1]	@ zero_extendqisi2
	add	r3, r3, #2
	strb	r1, [r3, #-3]
	ldrb	r1, [r2], #2	@ zero_extendqisi2
	cmp	r2, r0
	strb	r1, [r3, #-4]
	bne	.L10
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L18:
	ldr	r3, .L19+12
	ldr	r2, .L19+16
	ldr	r1, .L19+20
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.word	.LANCHOR1+20
	.word	.LANCHOR0+1
	.word	.LC0
	.word	.LANCHOR1
	.word	.LC1
	UNWIND(.fnend)
	.size	HEVCWriteCabacTab, .-HEVCWriteCabacTab
	.align	2
	.global	HEVCHAL_V400R003_InitHal
	.type	HEVCHAL_V400R003_InitHal, %function
HEVCHAL_V400R003_InitHal:
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
	ldr	r0, [r0, #1108]
	bl	HEVCWriteCabacTab
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r1, .L26
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	.LC2
	UNWIND(.fnend)
	.size	HEVCHAL_V400R003_InitHal, .-HEVCHAL_V400R003_InitHal
	.align	2
	.global	HEVCGet_V400R003_VirAddr
	.type	HEVCGet_V400R003_VirAddr, %function
HEVCGet_V400R003_VirAddr:
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
	add	r0, r1, r0, lsl #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCGet_V400R003_VirAddr, .-HEVCGet_V400R003_VirAddr
	.align	2
	.global	HEVCGet_V400R003_PhyAddr
	.type	HEVCGet_V400R003_PhyAddr, %function
HEVCGet_V400R003_PhyAddr:
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
	add	r0, r1, r0, lsl #2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCGet_V400R003_PhyAddr, .-HEVCGet_V400R003_PhyAddr
	.align	2
	.global	HEVCHAL_V400R003_CutSliceChain
	.type	HEVCHAL_V400R003_CutSliceChain, %function
HEVCHAL_V400R003_CutSliceChain:
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
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	beq	.L33
	mov	r0, #0
	str	r0, [r3, #252]
	ldmfd	sp, {fp, sp, pc}
.L33:
	ldr	r3, .L34
	ldr	r2, .L34+4
	ldr	r1, .L34+8
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	.LC3
	.word	.LANCHOR1+1940
	.word	.LC1
	UNWIND(.fnend)
	.size	HEVCHAL_V400R003_CutSliceChain, .-HEVCHAL_V400R003_CutSliceChain
	.align	2
	.global	HEVC_WriteQmatrix
	.type	HEVC_WriteQmatrix, %function
HEVC_WriteQmatrix:
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
	subs	r9, r1, #0
	mov	r8, r0
	mov	r10, r2
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	sub	r6, r3, #4
	sub	r7, r0, #4
	mov	r4, #0
.L38:
	ldr	r3, [r7, #4]!
	mov	r2, r4
	ldr	r1, .L41
	mov	r0, #4
	add	r4, r4, #1
	mov	r5, r7
	str	r3, [r6, #4]!
	ldr	r3, [r5], r10
	bl	dprint_vfmw
	ldr	r3, [r6]
	rsb	r2, r8, r5
	ldr	r1, .L41+4
	mov	r0, #4
	bl	dprint_vfmw
	cmp	r4, r9
	bne	.L38
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L42:
	.align	2
.L41:
	.word	.LC4
	.word	.LC5
	UNWIND(.fnend)
	.size	HEVC_WriteQmatrix, .-HEVC_WriteQmatrix
	.align	2
	.global	HEVC_WriteTileInfo
	.type	HEVC_WriteTileInfo, %function
HEVC_WriteTileInfo:
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
	str	r0, [fp, #-52]
	mov	r4, r0
	ldr	r0, [r1, #1112]
	bl	MEM_Phy2Vir
	subs	r3, r0, #0
	str	r3, [fp, #-48]
	beq	.L44
	add	r7, r3, #1024
	add	r8, r3, #4
	add	r7, r7, #4
	mov	r5, #0
	mov	r9, r4
	str	r4, [fp, #-56]
.L45:
	mov	r10, r9
	mov	r6, r8
	mov	r4, #0
	b	.L49
.L65:
	ldrb	r3, [r10, #1866]	@ zero_extendqisi2
	ldrb	ip, [r10, #1867]	@ zero_extendqisi2
	ldrb	r1, [r10, #1864]	@ zero_extendqisi2
	ldrb	r2, [r10, #1865]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	orr	r3, r3, ip, asl #24
	orr	r3, r3, r1
	ldr	r1, .L66
	orr	r2, r3, r2, asl #8
	str	r2, [r6, #-4]
	bl	dprint_vfmw
.L48:
	add	r4, r4, #4
	add	r6, r6, #4
	cmp	r4, #512
	add	r10, r10, #4
	beq	.L64
.L49:
	cmp	r4, #252
	mov	r2, #0
	ldr	r1, .L66
	mov	r0, #4
	ble	.L65
	str	r5, [r6, #-4]
	bl	dprint_vfmw
	b	.L48
.L64:
	add	r8, r8, #512
	add	r9, r9, #256
	cmp	r8, r7
	bne	.L45
	ldr	r6, [fp, #-56]
	mov	r3, #0
	ldr	r2, [fp, #-52]
	mov	ip, r3
.L50:
	cmp	r3, #9
	add	r3, r3, #1
	strgt	ip, [r7, #-4]
	add	r2, r2, #8
	ldrle	r0, [r2, #2372]
	add	r7, r7, #4
	ldrle	r1, [r2, #2368]
	orrle	r1, r1, r0, asl #16
	strle	r1, [r7, #-8]
	cmp	r3, #20
	bne	.L50
	ldr	r3, [fp, #-48]
	add	r2, r3, #1104
	mov	r3, #0
	add	r2, r2, #4
	mov	ip, r3
.L56:
	cmp	r3, #10
	add	r3, r3, #1
	strgt	ip, [r2, #-4]
	add	r6, r6, #8
	ldrle	r0, [r6, #2452]
	add	r2, r2, #4
	ldrle	r1, [r6, #2448]
	orrle	r1, r1, r0, asl #16
	strle	r1, [r2, #-8]
	cmp	r3, #22
	bne	.L56
	mov	r0, #0
.L61:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L44:
	ldr	r3, .L66+4
	ldr	r2, .L66+8
	ldr	r1, .L66+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L61
.L67:
	.align	2
.L66:
	.word	.LC7
	.word	.LC6
	.word	.LANCHOR1+1972
	.word	.LC1
	UNWIND(.fnend)
	.size	HEVC_WriteTileInfo, .-HEVC_WriteTileInfo
	.align	2
	.global	HEVCHAL_V400R003_SetPicMsg
	.type	HEVCHAL_V400R003_SetPicMsg, %function
HEVCHAL_V400R003_SetPicMsg:
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
	mov	r4, r0
	mov	r0, r2
	mov	r6, r2
	mov	r8, r1
	str	r3, [fp, #-48]
	bl	MEM_Phy2Vir
	subs	r5, r0, #0
	beq	.L83
	ldr	r3, .L85
	mov	r2, #1280
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r1, .L85+4
	mov	r0, #4
	bl	dprint_vfmw
	ldrb	r1, [r4]	@ zero_extendqisi2
	ldrb	ip, [r4, #1]	@ zero_extendqisi2
	mov	r2, r6
	ldrb	r7, [r4, #2]	@ zero_extendqisi2
	mov	r0, #4
	ldr	r3, [r4, #16]
	mov	r1, r1, asl #25
	ldr	lr, [r4, #8]
	orr	r1, r1, ip, asl #24
	ldrb	ip, [r4, #3]	@ zero_extendqisi2
	orr	r1, r1, r7, asl #23
	ldrb	r10, [r4, #4]	@ zero_extendqisi2
	mov	r3, r3, asl #9
	ldr	r9, [r4, #20]
	orr	r3, r3, lr, asl #19
	ldrb	r7, [r4, #12]	@ zero_extendqisi2
	orr	r1, r1, ip, asl #22
	orr	lr, r3, r9
	orr	ip, r1, r10, asl #21
	ldr	r1, .L85+8
	orr	r3, lr, r7, asl #18
	orr	r3, r3, ip
	str	r3, [r5]
	ldr	r3, [r5]
	bl	dprint_vfmw
	ldr	r3, [r4, #24]
	str	r3, [r5, #4]
	ldr	r2, [r4, #36]
	ldr	r1, [r4, #28]
	ldr	ip, [r4, #68]
	ldr	r3, [r4, #40]
	mov	r2, r2, asl #24
	ldr	r0, [r4, #44]
	orr	r2, r2, r1, asl #29
	ldr	lr, [r4, #48]
	orr	r2, r2, ip
	ldr	r1, [r4, #52]
	orr	r3, r2, r3, asl #21
	ldr	ip, [r4, #56]
	orr	r3, r3, r0, asl #18
	ldr	r2, [r4, #60]
	orr	r0, r3, lr, asl #15
	orr	r1, r0, r1, asl #12
	ldr	r0, [r4, #64]
	ldrb	r3, [r4, #32]	@ zero_extendqisi2
	orr	r1, r1, ip, asl #9
	orr	r2, r1, r2, asl #6
	ldrb	r1, [r4, #33]	@ zero_extendqisi2
	orr	r2, r2, r0, asl #3
	orr	r3, r2, r3, asl #28
	orr	r3, r3, r1, asl #27
	str	r3, [r5, #8]
	ldr	r0, [r4, #76]
	ldr	r2, [r4, #72]
	ldr	r1, [r4, #92]
	ldr	ip, [r4, #80]
	mov	r0, r0, asl #16
	ldr	r3, [r4, #84]
	orr	r2, r0, r2, asl #22
	orr	r2, r2, r1
	ldr	r1, [r4, #88]
	orr	r2, r2, ip, asl #12
	orr	r3, r2, r3, asl #8
	orr	r3, r3, r1, asl #4
	str	r3, [r5, #12]
	ldr	r3, [r8, #1092]
	str	r3, [r5, #16]
	ldr	r3, [r8, #1096]
	str	r3, [r5, #20]
	ldr	r3, [r4, #1284]
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #1468]
	str	r3, [r5, #24]
	ldr	r3, [r8, #1104]
	str	r3, [r5, #28]
	ldr	r2, [r4, #2608]
	cmp	r2, #0
	beq	.L71
	add	r0, r4, #2528
	add	ip, r5, #32
	add	r0, r0, #12
	mov	r1, #0
.L72:
	ldr	r3, [r0, #4]!
	add	r1, r1, #1
	add	r3, r3, #332
	add	r3, r3, #2
	ldr	r3, [r4, r3, asl #2]
	str	r3, [ip], #4
	ldr	r2, [r4, #2608]
	cmp	r2, r1
	bhi	.L72
	cmp	r2, #15
	bhi	.L75
.L71:
	add	r1, r2, #8
	add	r1, r5, r1, lsl #2
.L74:
	ldr	r3, [r4, #2544]
	add	r2, r2, #1
	cmp	r2, #15
	add	r3, r3, #332
	add	r3, r3, #2
	ldr	r3, [r4, r3, asl #2]
	str	r3, [r1], #4
	bls	.L74
.L75:
	ldr	r1, [r8, #1108]
	add	r3, r4, #116
	add	r2, r5, #104
	add	r0, r4, #180
	str	r1, [r5, #100]
.L73:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	str	r1, [r2], #4
	bne	.L73
	ldr	r3, [r8, #1100]
	mov	r1, r8
	mov	r0, r4
	str	r3, [r5, #172]
	ldr	r3, [r4, #1280]
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #1732]
	str	r3, [r5, #208]
	ldr	r3, [r4, #1860]
	str	r3, [r5, #212]
	ldr	r2, [r4, #184]
	ldr	r3, [r4, #188]
	orr	r3, r3, r2, asl #16
	str	r3, [r5, #216]
	bl	HEVC_WriteTileInfo
	subs	r7, r0, #0
	bne	.L84
	ldr	r3, [r8, #1112]
	mov	r1, r5
	mov	r0, #64
	str	r3, [r5, #220]
	ldr	r3, [r8, #1124]
	str	r3, [r5, #224]
	ldr	r3, [r8, #1116]
	str	r3, [r5, #228]
	ldr	r3, [r8, #1128]
	str	r3, [r5, #232]
	ldr	r3, [r8, #1120]
	str	r3, [r5, #236]
	ldr	r2, [r4, #220]
	ldr	lr, [r4, #224]
	ldr	ip, [r4, #236]
	ldrb	r3, [r4, #212]	@ zero_extendqisi2
	mov	r2, r2, asl #16
	ldrb	r10, [r4, #213]	@ zero_extendqisi2
	orr	lr, r2, lr, asl #13
	and	ip, ip, #31
	ldrb	r9, [r4, #228]	@ zero_extendqisi2
	orr	ip, lr, ip
	ldrb	lr, [r4, #215]	@ zero_extendqisi2
	ldrb	r2, [r4, #229]	@ zero_extendqisi2
	mov	r3, r3, asl #24
	ldrb	r8, [r4, #214]	@ zero_extendqisi2
	orr	r3, r3, r10, asl #23
	ldr	r10, [r4, #232]
	orr	ip, ip, r9, asl #12
	str	lr, [fp, #-52]
	orr	r2, ip, r2, asl #11
	and	ip, r10, #31
	ldr	r10, [fp, #-52]
	ldrb	lr, [r4, #230]	@ zero_extendqisi2
	orr	r8, r3, r8, asl #22
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	ldrb	r9, [r4, #217]	@ zero_extendqisi2
	orr	r8, r8, r10, asl #21
	orr	r2, r2, lr, asl #10
	orr	r3, r8, r3, asl #20
	orr	ip, r2, ip, asl #5
	orr	r9, r3, r9, asl #19
	orr	ip, ip, r9
	str	ip, [r5, #240]
	ldr	r2, [r4, #240]
	ldr	r3, [r4, #244]
	orr	r3, r3, r2, asl #16
	str	r3, [r5, #244]
	ldr	r3, [fp, #-48]
	str	r3, [r5, #252]
	bl	HEVC_GetVirAddr
	mov	r1, r6
	mov	r5, r0
	mov	r0, #64
	bl	HEVC_GetPhyAddr
	mov	r3, r5
	mov	r1, #256
	mov	r2, r0
	add	r0, r4, #252
	bl	HEVC_WriteQmatrix
.L70:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L84:
	ldr	r1, .L85+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L70
.L83:
	ldr	r3, .L85+16
	mvn	r7, #0
	ldr	r2, .L85+20
	ldr	r1, .L85+24
	bl	dprint_vfmw
	b	.L70
.L86:
	.align	2
.L85:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC8
	.word	.LANCHOR1+1992
	.word	.LC1
	UNWIND(.fnend)
	.size	HEVCHAL_V400R003_SetPicMsg, .-HEVCHAL_V400R003_SetPicMsg
	.align	2
	.global	HEVCHAL_SetSliceMsgStreamAddrInfo
	.type	HEVCHAL_SetSliceMsgStreamAddrInfo, %function
HEVCHAL_SetSliceMsgStreamAddrInfo:
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
	mov	r5, #0
	mov	r4, r2
	add	r7, r1, #16
	add	r10, r4, #8
	mov	r6, r3
	mov	r8, r5
	str	r1, [fp, #-52]
	str	r0, [fp, #-48]
.L93:
	cmp	r8, #0
	mov	r3, r6
	mov	r2, r5
	ldr	r1, .L96
	mov	r0, #4
	beq	.L95
	ldr	r9, [r7, #-16]
	cmp	r9, #0
	beq	.L91
.L89:
	ldr	r2, [fp, #-48]
	mov	r3, r6
	ldr	lr, [r7]
	mov	r0, #4
	ldr	r1, .L96
	ldr	ip, [r2, #1324]
	bic	lr, lr, #15
	mov	r2, r5
	bic	ip, ip, #15
	rsb	ip, ip, lr
	str	ip, [r4]
	ldr	ip, [r10, #-8]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r7]
	ldr	r0, [r7, #-8]
	add	r3, r6, #4
	add	r2, r5, #1
	ldr	r1, .L96
	add	ip, r0, ip, lsl #3
	mov	r0, #4
	and	ip, ip, #127
	str	ip, [r4, #4]
	ldr	ip, [r4, #4]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r7, #-16]
	add	r3, r6, #8
	add	r2, r5, #2
	ldr	r1, .L96
	mov	r0, #4
	str	ip, [r10]
	ldr	ip, [r4, #8]
	str	ip, [sp]
	bl	dprint_vfmw
.L92:
	add	r8, r8, #1
	add	r7, r7, #4
	cmp	r8, #2
	add	r4, r4, #12
	add	r5, r5, #3
	add	r6, r6, #12
	add	r10, r10, #12
	bne	.L93
	mov	r0, #0
.L90:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L91:
	str	r9, [r4]
	ldr	lr, [r10, #-8]
	str	lr, [sp]
	bl	dprint_vfmw
	str	r9, [r4, #4]
	ldr	lr, [r4, #4]
	add	r3, r6, #4
	add	r2, r5, #1
	ldr	r1, .L96
	mov	r0, #4
	str	lr, [sp]
	bl	dprint_vfmw
	str	r9, [r10]
	ldr	ip, [r4, #8]
	add	r3, r6, #8
	add	r2, r5, #2
	ldr	r1, .L96
	mov	r0, #4
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L92
.L95:
	ldr	r3, [fp, #-52]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L89
	mov	r0, r8
	ldr	r2, .L96+4
	ldr	r1, .L96+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L90
.L97:
	.align	2
.L96:
	.word	.LC13
	.word	.LANCHOR1+2020
	.word	.LC12
	UNWIND(.fnend)
	.size	HEVCHAL_SetSliceMsgStreamAddrInfo, .-HEVCHAL_SetSliceMsgStreamAddrInfo
	.align	2
	.global	HEVCHAL_SetSliceMsgAPCIndex
	.type	HEVCHAL_SetSliceMsgAPCIndex, %function
HEVCHAL_SetSliceMsgAPCIndex:
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
	ldr	r2, [r0, #68]
	cmp	r2, #0
	addne	r4, r0, #368
	movne	lr, #0
	movne	r6, #15
	movne	ip, lr
	beq	.L105
.L104:
	and	r3, ip, #7
	ldr	r5, [r4, #4]!
	cmp	r3, #7
	sub	r2, r2, #1
	mov	r3, r3, asl #2
	orr	lr, lr, r5, asl r3
	streq	lr, [r1, r6, asl #2]
	addeq	r6, r6, #1
	moveq	lr, #0
	beq	.L103
	cmp	r2, ip
	streq	lr, [r1, r6, asl #2]
.L103:
	ldr	r2, [r0, #68]
	add	ip, ip, #1
	cmp	r2, ip
	bhi	.L104
.L105:
	ldr	r2, [r0, #72]
	cmp	r2, #0
	beq	.L112
	mov	lr, #0
	add	r4, r0, #432
	mov	ip, lr
	mov	r6, #17
.L108:
	and	r3, ip, #7
	ldr	r5, [r4, #4]!
	cmp	r3, #7
	sub	r2, r2, #1
	mov	r3, r3, asl #2
	orr	lr, lr, r5, asl r3
	streq	lr, [r1, r6, asl #2]
	addeq	r6, r6, #1
	moveq	lr, #0
	beq	.L107
	cmp	r2, ip
	streq	lr, [r1, r6, asl #2]
.L107:
	ldr	r2, [r0, #72]
	add	ip, ip, #1
	cmp	r2, ip
	bhi	.L108
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L112:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCHAL_SetSliceMsgAPCIndex, .-HEVCHAL_SetSliceMsgAPCIndex
	.align	2
	.global	HEVCHAL_SetSliceMsgWPInfo
	.type	HEVCHAL_SetSliceMsgWPInfo, %function
HEVCHAL_SetSliceMsgWPInfo:
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
	mov	r7, r0
	mov	r4, r1
	mov	r0, #64
	mov	r1, r2
	mov	r6, r2
	bl	HEVC_GetVirAddr
	mov	r1, r6
	mov	r5, r0
	mov	r0, #128
	bl	HEVC_GetVirAddr
	ldrb	r3, [r7, #33]	@ zero_extendqisi2
	cmp	r3, #0
	mov	lr, r0
	beq	.L114
	ldr	r3, [r4, #76]
	cmp	r3, #1
	beq	.L115
.L114:
	ldrb	r3, [r7, #32]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r3, [r4, #76]
	cmp	r3, #0
	bne	.L135
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L122
.L121:
	mov	r1, #0
	add	r7, r4, #712
	add	r6, r4, #584
	mov	r0, r1
	mov	r3, r4
.L119:
	ldr	r8, [r7, #4]!
	add	ip, r1, #128
	ldr	r10, [r6, #4]!
	add	r0, r0, #1
	ldr	r9, [r4, #580]
	add	r3, r3, #8
	uxtb	r8, r8
	ubfx	r10, r10, #0, #9
	and	r9, r9, #7
	mov	r8, r8, asl #12
	orr	r2, r8, r10, asl #3
	orr	r2, r2, r9
	str	r2, [r5, r1]
	ldr	r9, [r3, #836]
	ldrb	r2, [r3, #1092]	@ zero_extendqisi2
	ldr	r8, [r4, #584]
	ubfx	r9, r9, #0, #9
	mov	r2, r2, asl #12
	and	r8, r8, #7
	orr	r2, r2, r9, asl #3
	orr	r2, r2, r8
	str	r2, [lr, r1]
	ldr	r2, [r3, #840]
	add	r1, r1, #4
	ldrb	r8, [r3, #1096]	@ zero_extendqisi2
	ubfx	r2, r2, #0, #9
	orr	r2, r2, r8, asl #9
	str	r2, [lr, ip]
	ldr	r2, [r4, #68]
	cmp	r2, r0
	bhi	.L119
	ldr	r3, [r4, #76]
	cmp	r3, #0
	ldmnefd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L122:
	ldr	r3, [r4, #72]
	cmp	r3, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	mov	r1, #0
	add	r7, r4, #776
	add	r6, r4, #648
	mov	ip, r1
	mov	r2, r4
.L120:
	ldr	r8, [r7, #4]!
	add	r10, r1, #64
	ldr	r3, [r6, #4]!
	add	r0, r1, #192
	ldr	r9, [r4, #580]
	add	ip, ip, #1
	uxtb	r8, r8
	ubfx	r3, r3, #0, #9
	and	r9, r9, #7
	add	r2, r2, #8
	mov	r8, r8, asl #12
	add	r1, r1, #4
	orr	r3, r8, r3, asl #3
	orr	r3, r3, r9
	str	r3, [r5, r10]
	ldr	r3, [r2, #964]
	ldrb	r9, [r2, #1220]	@ zero_extendqisi2
	ldr	r8, [r4, #584]
	ubfx	r3, r3, #0, #9
	mov	r9, r9, asl #12
	and	r8, r8, #7
	orr	r3, r9, r3, asl #3
	orr	r3, r3, r8
	str	r3, [lr, r10]
	ldr	r3, [r2, #968]
	ldrb	r8, [r2, #1224]	@ zero_extendqisi2
	ubfx	r3, r3, #0, #9
	orr	r3, r3, r8, asl #9
	str	r3, [lr, r0]
	ldr	r3, [r4, #72]
	cmp	r3, ip
	bhi	.L120
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L115:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	bne	.L121
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L135:
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCHAL_SetSliceMsgWPInfo, .-HEVCHAL_SetSliceMsgWPInfo
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	2
	.global	HEVCHAL_V400R003_SetSliceMsg
	.type	HEVCHAL_V400R003_SetSliceMsg, %function
HEVCHAL_V400R003_SetSliceMsg:
	UNWIND(.fnstart)
	@ args = 24, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r5, r0
	mov	r0, r3
	mov	r8, r3
	mov	r4, r2
	ldr	r7, [fp, #12]
	bl	MEM_Phy2Vir
	subs	r6, r0, #0
	beq	.L148
	ldr	r3, .L149
	mov	r2, #1280
	mov	r1, #0
	ldr	r3, [r3, #48]
	blx	r3
	mov	r3, r8
	mov	r2, r6
	mov	r1, r4
	mov	r0, r5
	bl	HEVCHAL_SetSliceMsgStreamAddrInfo
	cmn	r0, #1
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r1, [r4, #28]
	mov	r0, r7
	ldrb	ip, [r4, #32]	@ zero_extendqisi2
	ldrb	r2, [r4, #24]	@ zero_extendqisi2
	and	r1, r1, #127
	ldrb	r3, [r4, #25]	@ zero_extendqisi2
	ldr	lr, [r4, #36]
	mov	ip, ip, asl #18
	orr	r1, ip, r1, asl #19
	mov	r2, r2, asl #27
	orr	r1, r1, lr
	orr	r3, r2, r3, asl #26
	orr	r3, r1, r3
	str	r3, [r6, #24]
	ldr	r1, [r4, #44]
	ldr	r3, [r4, #56]
	ldr	lr, [r4, #76]
	ldr	r2, [r4, #60]
	mov	r1, r1, asl #24
	ldr	ip, .L149+4
	orr	r1, r1, r3, asl #20
	ldr	r3, [r4, #72]
	ldr	r9, [r4, #68]
	add	lr, ip, lr, lsl #2
	orr	r2, r1, r2, asl #16
	ldrb	r8, [r4, #64]	@ zero_extendqisi2
	orr	r2, r2, r3, asl #8
	ldr	ip, [lr, #2088]
	ldr	r1, [r4, #40]
	orr	r3, r2, r9, asl #2
	ldrb	lr, [r4, #65]	@ zero_extendqisi2
	orr	ip, r3, ip
	ldrb	r3, [r4, #52]	@ zero_extendqisi2
	orr	ip, ip, r8, asl #15
	mov	r2, r1, asl #28
	orr	r1, ip, lr, asl #14
	orr	r2, r2, r3, asl #27
	orr	r3, r1, r2
	str	r3, [r6, #28]
	str	r7, [r6, #32]
	ldr	r8, [r5, #20]
	add	r8, r8, #1
	mov	r1, r8
	bl	__aeabi_uidiv
	mov	r1, r8
	mov	r8, r0, asl #16
	mov	r0, r7
	bl	__aeabi_uidivmod
	ldr	r3, [fp, #16]
	orr	r1, r8, r1
	str	r1, [r6, #36]
	str	r3, [r6, #40]
	ldr	r2, [r4, #96]
	ldr	r3, [r4, #100]
	and	r2, r2, #31
	and	r3, r3, #31
	orr	r3, r3, r2, asl #8
	str	r3, [r6, #44]
	ldr	r0, [r4, #108]
	ldr	r2, [r4, #104]
	and	r0, r0, #15
	ldrb	r1, [r4, #115]	@ zero_extendqisi2
	and	r2, r2, #15
	ldrb	ip, [r4, #113]	@ zero_extendqisi2
	mov	r0, r0, asl #8
	ldrb	r3, [r4, #112]	@ zero_extendqisi2
	orr	r2, r0, r2, asl #16
	ldrb	r0, [r4, #114]	@ zero_extendqisi2
	orr	r2, r2, r1
	orr	r2, r2, ip, asl #3
	orr	r3, r2, r3, asl #2
	orr	r3, r3, r0, asl #1
	str	r3, [r6, #48]
	ldr	r0, [r4, #68]
	cmp	r0, #0
	beq	.L144
	mov	ip, #0
	add	r2, r4, #112
	mov	r3, ip
.L140:
	ldr	r1, [r2, #4]!
	orr	ip, ip, r1, asl r3
	add	r3, r3, #1
	cmp	r3, r0
	bne	.L140
.L139:
	str	ip, [r6, #52]
	ldr	r0, [r4, #72]
	cmp	r0, #0
	beq	.L145
	mov	ip, #0
	add	r2, r4, #176
	mov	r3, ip
.L142:
	ldr	r1, [r2, #4]!
	orr	ip, ip, r1, asl r3
	add	r3, r3, #1
	cmp	r3, r0
	bne	.L142
.L141:
	str	ip, [r6, #56]
	mov	r1, r6
	mov	r0, r4
	bl	HEVCHAL_SetSliceMsgAPCIndex
	ldr	r3, [r4, #564]
	mov	r0, r5
	mov	r1, r4
	mov	r2, r6
	str	r3, [r6, #92]
	ldr	r3, [r5, #76]
	mov	r3, r3, lsr #1
	mov	r3, r3, asl #8
	orr	r3, r3, #16384
	orr	r3, r3, #10
	str	r3, [r6, #96]
	ldr	r3, [fp, #20]
	str	r3, [r6, #172]
	ldr	r3, [fp, #24]
	str	r3, [r6, #176]
	ldr	r3, [fp, #8]
	str	r3, [r6, #252]
	bl	HEVCHAL_SetSliceMsgWPInfo
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L144:
	mov	ip, r0
	b	.L139
.L145:
	mov	ip, r0
	b	.L141
.L148:
	ldr	r3, .L149+8
	ldr	r2, .L149+12
	ldr	r1, .L149+16
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L150:
	.align	2
.L149:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LC14
	.word	.LANCHOR1+2056
	.word	.LC1
	UNWIND(.fnend)
	.size	HEVCHAL_V400R003_SetSliceMsg, .-HEVCHAL_V400R003_SetSliceMsg
	.align	2
	.global	HEVCHAL_CheckParaValid
	.type	HEVCHAL_CheckParaValid, %function
HEVCHAL_CheckParaValid:
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
	cmp	r1, #0
	bgt	.L156
	cmp	r0, #0
	beq	.L157
	ldr	r3, [r0, #2608]
	cmp	r3, #16
	movls	r0, #0
	bhi	.L158
.L153:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L156:
	mov	r3, r1
	ldr	r2, .L159
	mov	r1, #1
	mov	r0, #0
	str	r1, [sp]
	ldr	r1, .L159+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L153
.L158:
	ldr	r3, .L159+8
	mov	r0, #0
	ldr	r2, .L159
	ldr	r1, .L159+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L153
.L157:
	ldr	r3, .L159+16
	ldr	r2, .L159
	ldr	r1, .L159+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L153
.L160:
	.align	2
.L159:
	.word	.LANCHOR1+2100
	.word	.LC15
	.word	.LC17
	.word	.LC1
	.word	.LC16
	UNWIND(.fnend)
	.size	HEVCHAL_CheckParaValid, .-HEVCHAL_CheckParaValid
	.align	2
	.global	HEVCHAL_GetVdmRegVirAddr
	.type	HEVCHAL_GetVdmRegVirAddr, %function
HEVCHAL_GetVdmRegVirAddr:
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
	mov	r4, r0
	bne	.L167
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L164
.L166:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L164:
	mov	r0, #0
	movt	r0, 63683
	bl	MEM_Phy2Vir
	cmp	r0, #0
	str	r0, [r4]
	bne	.L166
	ldr	r2, .L168
	ldr	r1, .L168+4
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L167:
	ldr	r1, .L168+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L169:
	.align	2
.L168:
	.word	.LANCHOR1+2124
	.word	.LC19
	.word	.LC18
	UNWIND(.fnend)
	.size	HEVCHAL_GetVdmRegVirAddr, .-HEVCHAL_GetVdmRegVirAddr
	.align	2
	.global	HEVCHAL_CheckSlicePara
	.type	HEVCHAL_CheckSlicePara, %function
HEVCHAL_CheckSlicePara:
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
	beq	.L174
	cmp	r1, #0
	ldr	r1, [r0, #92]
	movgt	r0, #1
	movle	r0, #0
	cmp	r1, r2
	movcs	r0, #0
	andcc	r0, r0, #1
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	mov	r3, r2
	mov	r0, #1
	mov	r2, r1
	ldr	r1, .L175
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L174:
	mov	r3, r1
	ldr	r2, .L175+4
	ldr	r1, .L175+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L176:
	.align	2
.L175:
	.word	.LC21
	.word	.LANCHOR1+2152
	.word	.LC20
	UNWIND(.fnend)
	.size	HEVCHAL_CheckSlicePara, .-HEVCHAL_CheckSlicePara
	.align	2
	.global	HEVCHAL_FindNextSlicePara
	.type	HEVCHAL_FindNextSlicePara, %function
HEVCHAL_FindNextSlicePara:
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
	cmp	r2, r1
	ldr	lr, [r0, #92]
	str	r2, [r3]
	ldmgefd	sp, {fp, sp, pc}
	ldr	r0, [r0, #1356]
	cmp	r0, #0
	beq	.L181
	ldr	ip, [r0, #92]
	cmp	lr, ip
	ldmccfd	sp, {fp, sp, pc}
	add	r2, r2, #1
	b	.L180
.L182:
	ldr	r0, [r0, #1356]
	cmp	r0, #0
	beq	.L181
	ldr	ip, [r0, #92]
	cmp	lr, ip
	ldmccfd	sp, {fp, sp, pc}
.L180:
	cmp	r2, r1
	str	r2, [r3]
	add	r2, r2, #1
	bne	.L182
	ldmfd	sp, {fp, sp, pc}
.L181:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HEVCHAL_FindNextSlicePara, .-HEVCHAL_FindNextSlicePara
	.align	2
	.global	HEVCHAL_CheckSliceAddrValid
	.type	HEVCHAL_CheckSliceAddrValid, %function
HEVCHAL_CheckSliceAddrValid:
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
	cmp	r1, r2
	ldr	r3, [r0, #572]
	bgt	.L188
	cmp	r2, r3
	blt	.L188
	ldr	r2, [r0, #92]
	cmp	r2, r3
	movls	r0, #0
	bhi	.L192
.L190:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L188:
	str	r2, [sp]
	mov	r0, #1
	mov	r2, r1
	ldr	r1, .L193
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L190
.L192:
	ldr	r1, .L193+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L190
.L194:
	.align	2
.L193:
	.word	.LC22
	.word	.LC23
	UNWIND(.fnend)
	.size	HEVCHAL_CheckSliceAddrValid, .-HEVCHAL_CheckSliceAddrValid
	.align	2
	.global	HEVCHAL_V400R003_CfgVdmReg
	.type	HEVCHAL_V400R003_CfgVdmReg, %function
HEVCHAL_V400R003_CfgVdmReg:
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
	mov	r5, r2
	mov	ip, r5, asl #6
	ldr	r2, .L209
	sub	ip, ip, r5, asl #3
	ldr	r6, .L209+4
	add	ip, r2, ip
	ldr	lr, .L209+8
	mov	r10, r1
	mov	r4, r0
	ldr	r1, [ip, #8]
	ldrb	r2, [r6]	@ zero_extendqisi2
	mov	r6, r3
	subs	r2, r2, #1
	ldr	r1, [lr, r1, asl #2]
	movne	r2, #1
	cmp	r3, #0
	movne	r0, #0
	andeq	r0, r2, #1
	cmp	r0, #0
	ldr	r0, [r1, #1148]
	str	r0, [fp, #-56]
	bne	.L207
	cmp	r1, #0
	mov	r8, #0
	mov	r0, #1
	str	r8, [fp, #-48]
	ldrne	ip, [r1, #1168]
	moveq	ip, r1
	moveq	r3, ip
	streq	ip, [fp, #-60]
	mov	r9, #3
	uxtbne	r3, ip
	str	ip, [fp, #-64]
	andne	r1, r3, #1
	strne	r1, [fp, #-60]
	cmp	r2, #0
	strneb	r3, [r6, #1]
	ldr	r3, [r4, #20]
	mov	r2, #0
	ldr	r1, [r4, #16]
	bfi	r2, r8, #7, #1
	ldrb	lr, [r4, #1]	@ zero_extendqisi2
	strb	r2, [fp, #-46]
	bfi	r0, lr, #6, #1
	mla	r2, r1, r3, r3
	and	r0, r0, #111
	bfi	r0, r8, #5, #1
	strb	r0, [fp, #-45]
	ldr	r7, [fp, #-48]
	mov	r3, r6
	add	r1, r2, r1
	mov	r0, #8
	bfi	r7, r1, #0, #20
	mov	r2, r5
	str	r7, [r4, #2628]
	mov	r1, r7
	str	r7, [fp, #-48]
	bl	MFDE_ConfigReg
	mov	r2, r7
	ldr	r1, .L209+12
	mov	r0, r9
	bl	dprint_vfmw
	ldr	r3, [fp, #-56]
	ldr	r1, [r4, #1320]
	mov	r2, #0
	bfi	r2, r3, #3, #1
	strh	r9, [fp, #-46]	@ movhi
	bfi	r2, r1, #4, #1
	mov	r3, #0
	bfi	r3, r8, #5, #1
	strb	r3, [fp, #-45]
	ldr	lr, [r4, #1332]
	and	r2, r2, #223
	ldr	r0, [r4, #1316]
	uxtb	r1, r3
	bfi	r2, lr, #6, #1
	mov	r3, #13
	bfi	r1, r0, #6, #1
	ldr	r0, [fp, #-60]
	mvn	r2, r2, asl #25
	and	r1, r1, #127
	strb	r3, [fp, #-48]
	bfi	r1, r0, #4, #1
	mvn	r2, r2, lsr #25
	strb	r1, [fp, #-45]
	strb	r2, [fp, #-47]
	mov	r3, r6
	ldr	r8, [fp, #-48]
	mov	r2, r5
	mov	r0, #12
	movw	r7, #3075
	movt	r7, 48
	mov	r1, r8
	str	r8, [r4, #2632]
	bl	MFDE_ConfigReg
	mov	r2, r8
	ldr	r1, .L209+16
	mov	r0, r9
	bl	dprint_vfmw
	ldr	r8, [r10, #56]
	mov	r3, r6
	mov	r2, r5
	bic	r8, r8, #15
	mov	r0, #16
	str	r8, [r4, #2636]
	mov	r1, r8
	bl	MFDE_ConfigReg
	mov	r2, r8
	ldr	r1, .L209+20
	mov	r0, r9
	bl	dprint_vfmw
	ldr	r1, [r10, #40]
	mov	r3, r6
	mov	r2, r5
	bic	r1, r1, #15
	mov	r0, #20
	str	r1, [r4, #2640]
	bl	MFDE_ConfigReg
	ldr	r1, [r4, #1324]
	mov	r3, r6
	mov	r2, r5
	bic	r1, r1, #15
	mov	r0, #24
	str	r1, [r4, #2644]
	bl	MFDE_ConfigReg
	mov	r1, r7
	mov	r3, r6
	mov	r2, r5
	mov	r0, #60
	str	r7, [r4, #2652]
	str	r7, [r4, #2656]
	str	r7, [r4, #2660]
	str	r7, [r4, #2664]
	str	r7, [r4, #2668]
	str	r7, [r4, #2672]
	str	r7, [r4, #2676]
	bl	MFDE_ConfigReg
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, #64
	bl	MFDE_ConfigReg
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, #68
	bl	MFDE_ConfigReg
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, #72
	bl	MFDE_ConfigReg
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, #76
	bl	MFDE_ConfigReg
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, #80
	bl	MFDE_ConfigReg
	mov	r3, r6
	mov	r2, r5
	mov	r1, r7
	mov	r0, #84
	bl	MFDE_ConfigReg
	ldr	r1, [r4, #1280]
	mov	r3, r6
	mov	r2, r5
	add	r1, r1, #332
	mov	r0, #96
	add	r1, r1, #2
	ldr	r1, [r4, r1, asl #2]
	bic	r1, r1, #255
	str	r1, [r4, #2680]
	str	r1, [fp, #-48]
	bl	MFDE_ConfigReg
	ldr	ip, [fp, #-64]
	cmp	ip, #1
	beq	.L208
.L200:
	ldr	r8, [r4, #1288]
	mov	r3, r6
	mov	r2, r5
	mov	r0, #100
	mov	r7, #0
	str	r8, [r4, #2684]
	mov	r1, r8
	bl	MFDE_ConfigReg
	mov	r2, r8
	ldr	r1, .L209+24
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r8, [r4, #1292]
	mov	r3, r6
	mov	r2, r5
	mov	r0, #104
	str	r8, [r4, #2688]
	mov	r1, r8
	bl	MFDE_ConfigReg
	mov	r2, r8
	ldr	r1, .L209+28
	mov	r0, #3
	bl	dprint_vfmw
	ldr	r1, [r4, #1300]
	mov	r3, r6
	mov	r2, r5
	mov	r0, #108
	bl	MFDE_ConfigReg
	ldr	r1, [r4, #1304]
	mov	r3, r6
	mov	r2, r5
	mov	r0, #116
	str	r1, [r4, #2704]
	bl	MFDE_ConfigReg
	ldr	r1, [r4, #1308]
	mov	r3, r6
	mov	r2, r5
	mov	r0, #120
	str	r1, [r4, #2708]
	bl	MFDE_ConfigReg
	ldr	r1, [r4, #1312]
	mov	r3, r6
	mov	r2, r5
	mov	r0, #124
	str	r1, [r4, #2712]
	bl	MFDE_ConfigReg
	str	r7, [r4, #2728]
	mov	r1, r7
	mov	r3, r6
	mov	r2, r5
	mov	r0, #128
	str	r7, [fp, #-48]
	bl	MFDE_ConfigReg
	strh	r7, [fp, #-48]	@ movhi
	mov	r3, r6
	ldr	r1, [fp, #-48]
	mov	r2, r5
	mov	r0, #132
	str	r1, [r4, #2732]
	bl	MFDE_ConfigReg
	ldr	r3, [r4, #188]
	mov	r2, r5
	mov	r0, #4
	cmp	r3, #4096
	mov	r3, r6
	movls	r1, #1
	movhi	r1, r7
	mov	r4, r1
	bl	SCD_ConfigReg
	mov	r2, r4
	ldr	r1, .L209+32
	mov	r0, #3
	bl	dprint_vfmw
	mov	r3, r6
	mov	r2, r5
	mov	r1, #2
	mov	r0, #152
	bl	MFDE_ConfigReg
	mov	r2, #2
	ldr	r1, .L209+36
	mov	r0, #3
	bl	dprint_vfmw
	mov	r0, #32
	mov	r3, r6
	mov	r2, r5
	mvn	r1, #0
	bl	MFDE_ConfigReg
	mov	r0, #0
.L197:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L208:
	mov	r3, r6
	mov	r2, r5
	mov	r1, #60
	mov	r0, #92
	bl	MFDE_ConfigReg
	mov	r2, #60
	ldr	r1, .L209+40
	mov	r0, r9
	bl	dprint_vfmw
	ldr	r1, [r4, #1280]
	mov	r2, r5
	mov	r3, r6
	mov	r0, #112
	add	r1, r4, r1, lsl #2
	ldr	r7, [r1, #1604]
	mov	r1, r7
	bl	MFDE_ConfigReg
	mov	r2, r7
	mov	r0, r9
	ldr	r1, .L209+44
	bl	dprint_vfmw
	b	.L200
.L207:
	ldr	r2, .L209+48
	mov	r0, #0
	ldr	r1, .L209+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L197
.L210:
	.align	2
.L209:
	.word	g_VdmDrvParam
	.word	g_HalDisable
	.word	s_pstVfmwChan
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC28
	.word	.LC29
	.word	.LANCHOR1+2176
	.word	.LC24
	UNWIND(.fnend)
	.size	HEVCHAL_V400R003_CfgVdmReg, .-HEVCHAL_V400R003_CfgVdmReg
	.align	2
	.global	HEVCHAL_V400R003_StartDec
	.type	HEVCHAL_V400R003_StartDec, %function
HEVCHAL_V400R003_StartDec:
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
	UNWIND(.pad #76)
	sub	sp, sp, #76
	mov	r4, r2
	ldr	r2, .L274
	movw	ip, #1228
	str	r1, [fp, #-88]
	mov	r9, r0
	mla	r3, ip, r1, r2
	str	r3, [fp, #-80]
	bl	HEVCHAL_CheckParaValid
	cmn	r0, #1
	beq	.L265
	ldr	r6, [fp, #-88]
	ldr	r5, [fp, #-80]
	mov	r1, r6
	mov	r0, r5
	bl	HEVCHAL_GetVdmRegVirAddr
	cmn	r0, #1
	beq	.L265
	mov	r3, r4
	mov	r2, r6
	mov	r1, r5
	mov	r0, r9
	bl	HEVCHAL_V400R003_CfgVdmReg
	ldr	r3, [r5, #60]
	mov	r1, r5
	ldr	r2, [r5, #56]
	mov	r0, r9
	bl	HEVCHAL_V400R003_SetPicMsg
	ldr	r4, [r9, #2616]
	cmp	r4, #0
	beq	.L267
	ldr	r5, [r4, #92]
	cmp	r5, #0
	bne	.L268
	mov	r10, r4
	str	r5, [fp, #-92]
.L216:
	ldr	r2, [r9, #20]
	ldr	r3, [r9, #16]
	ldr	r1, [r9, #2612]
	mla	r3, r2, r3, r3
	cmp	r1, #0
	add	r3, r3, r2
	str	r3, [fp, #-76]
	ble	.L219
	ldr	r0, [fp, #-88]
	movw	r2, #307
	ldr	r1, [fp, #-92]
	mul	r2, r2, r0
	add	r3, r1, #4
	add	r1, r1, #5
	str	r1, [fp, #-68]
	mov	r0, r2
	str	r2, [fp, #-72]
	mov	r2, #0
	add	r3, r0, r3
	mov	r5, r2
	str	r2, [fp, #-48]
	str	r3, [fp, #-84]
.L232:
	ldr	r3, [fp, #-68]
	mov	r0, r10
	ldr	r1, [fp, #-72]
	add	r7, r3, r5
	ldr	r3, [fp, #-84]
	ldr	lr, .L274
	add	ip, r1, r7
	add	r3, r3, r5
	add	ip, ip, #10
	add	r3, r3, #10
	mov	r1, r5
	ldr	ip, [lr, ip, asl #2]
	ldr	r3, [lr, r3, asl #2]
	str	ip, [fp, #-56]
	str	r3, [fp, #-52]
	bl	HEVCHAL_CheckSlicePara
	cmn	r0, #1
	beq	.L265
	ldr	r2, [r9, #2612]
	add	r5, r5, #1
	ldr	r6, [r10, #92]
	cmp	r2, r5
	ldr	ip, [r10, #80]
	ble	.L220
	ldr	r4, [r10, #1356]
	cmp	r4, #0
	bne	.L264
	b	.L221
.L270:
	add	r5, r5, #1
	cmp	r5, r2
	beq	.L269
	ldr	r4, [r4, #1356]
	cmp	r4, #0
	beq	.L221
.L264:
	ldr	r3, [r4, #92]
	cmp	r6, r3
	bcs	.L270
.L227:
	cmp	r7, #209
	cmpne	r2, r5
	beq	.L233
	ldrb	r2, [r9, #217]	@ zero_extendqisi2
	ldr	r3, [r4, #92]
	cmp	r2, #0
	ldr	r2, [fp, #-68]
	sub	r7, r3, #1
	ldr	r3, [fp, #-72]
	ldrne	r8, [r4, #568]
	add	r2, r3, r2
	ldr	r3, .L274
	add	r2, r2, r5
	moveq	r8, r7
	add	r2, r2, #10
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-60]
.L229:
	str	r7, [r10, #572]
	mov	r1, r8
	ldr	r2, [fp, #-76]
	mov	r0, r10
	str	ip, [fp, #-64]
	bl	HEVCHAL_CheckSliceAddrValid
	cmn	r0, #1
	beq	.L265
	ldr	ip, [fp, #-64]
	mov	r2, r10
	str	r7, [sp, #20]
	mov	r0, r9
	ldr	r3, [fp, #-56]
	str	ip, [sp, #8]
	ldr	ip, [fp, #-60]
	str	r8, [sp, #16]
	str	r6, [sp, #12]
	str	ip, [sp, #4]
	ldr	ip, [fp, #-52]
	ldr	r1, [fp, #-80]
	str	ip, [sp]
	bl	HEVCHAL_V400R003_SetSliceMsg
	cmp	r0, #0
	bne	.L271
	ldr	r3, [r9, #2612]
	ldr	r2, [fp, #-48]
	cmp	r5, r3
	add	r2, r2, #1
	str	r2, [fp, #-48]
	ldr	r2, [r10, #572]
	bge	.L272
	mov	r10, r4
	b	.L232
.L268:
	ldrb	r3, [r9, #217]	@ zero_extendqisi2
	movw	r0, #1228
	ldr	r2, .L274
	mov	r6, #1
	cmp	r3, #0
	ldr	r3, [r4]
	ldr	r10, [r4, #4]
	sub	ip, r5, #1
	str	r6, [r4]
	str	r3, [fp, #-48]
	moveq	lr, ip
	ldr	r3, [fp, #-88]
	ldrne	lr, [r4, #568]
	ldr	r8, [r4, #16]
	mla	r0, r0, r3, r2
	ldr	r3, [r4, #8]
	mov	r2, r4
	ldr	r1, [fp, #-80]
	str	r3, [fp, #-52]
	ldr	r3, [r4, #12]
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [r4, #4]
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	ldr	r7, [r9, #1324]
	str	r7, [r4, #16]
	ldr	r7, [r4, #20]
	str	r3, [r4, #20]
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	ldr	r3, [r0, #60]
	str	ip, [sp, #20]
	ldr	ip, [r0, #64]
	ldr	r0, [r0, #56]
	str	lr, [sp, #16]
	str	ip, [sp, #4]
	str	r0, [sp]
	mov	r0, r9
	bl	HEVCHAL_V400R003_SetSliceMsg
	cmp	r0, #0
	bne	.L273
	ldr	r3, [fp, #-48]
	str	r5, [r4, #92]
	str	r8, [r4, #16]
	stmia	r4, {r3, r10}
	ldr	r3, [fp, #-52]
	str	r7, [r4, #20]
	str	r6, [fp, #-92]
	str	r3, [r4, #8]
	ldr	r3, [fp, #-56]
	str	r3, [r4, #12]
	ldr	r10, [r9, #2616]
	b	.L216
.L269:
	cmp	r4, #0
	beq	.L221
.L233:
	ldr	r3, [fp, #-76]
	mov	r7, #0
	str	r7, [r10, #1356]
	str	r7, [fp, #-60]
	mov	r8, r3
	ldr	r5, [r9, #2612]
	mov	r7, r3
	b	.L229
.L220:
	cmp	r10, #0
	beq	.L221
	mov	r4, r10
	b	.L227
.L219:
	ldr	r1, .L274+4
	mov	r0, #1
	bl	dprint_vfmw
.L265:
	mvn	r7, #0
.L260:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L221:
	ldr	r2, .L274+8
	mov	r0, #1
	ldr	r1, .L274+12
	mvn	r7, #0
	bl	dprint_vfmw
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L271:
	ldr	r2, .L274+8
	mov	r0, #1
	ldr	r1, .L274+16
	mvn	r7, #0
	bl	dprint_vfmw
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L272:
	cmp	r3, #0
	ldr	r1, [fp, #-48]
	mov	r7, r0
	movgt	r2, #1
	movle	r2, #0
	cmp	r1, #0
	andgt	r2, r2, #1
	movle	r2, #0
	cmp	r2, #0
	beq	.L219
	ldr	r2, [fp, #-88]
	movw	r5, #307
	ldr	r1, [fp, #-92]
	mla	r5, r5, r2, r1
	ldr	r2, .L274
	add	r3, r5, r3
	add	r3, r3, #14
	ldr	r0, [r2, r3, asl #2]
	bl	HEVCHAL_V400R003_CutSliceChain
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L273:
	mov	r0, r6
	ldr	r2, .L274+8
	ldr	r1, .L274+20
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L260
.L267:
	mov	r0, r4
	ldr	r2, .L274+8
	ldr	r1, .L274+24
	mvn	r7, #0
	bl	dprint_vfmw
	b	.L260
.L275:
	.align	2
.L274:
	.word	g_HwMem
	.word	.LC38
	.word	.LANCHOR1+2204
	.word	.LC36
	.word	.LC37
	.word	.LC35
	.word	.LC34
	UNWIND(.fnend)
	.size	HEVCHAL_V400R003_StartDec, .-HEVCHAL_V400R003_StartDec
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.14797, %object
	.size	__func__.14797, 18
__func__.14797:
	.ascii	"HEVCWriteCabacTab\000"
	.space	2
	.type	s_InitValue, %object
	.size	s_InitValue, 1920
s_InitValue:
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	153
	.word	200
	.word	139
	.word	141
	.word	157
	.word	154
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	184
	.word	-1
	.word	-1
	.word	-1
	.word	184
	.word	63
	.word	94
	.word	138
	.word	182
	.word	154
	.word	111
	.word	141
	.word	154
	.word	154
	.word	139
	.word	139
	.word	138
	.word	153
	.word	136
	.word	167
	.word	152
	.word	152
	.word	110
	.word	110
	.word	124
	.word	125
	.word	140
	.word	153
	.word	125
	.word	127
	.word	140
	.word	109
	.word	111
	.word	143
	.word	127
	.word	111
	.word	79
	.word	108
	.word	123
	.word	63
	.word	110
	.word	110
	.word	124
	.word	125
	.word	140
	.word	153
	.word	125
	.word	127
	.word	140
	.word	109
	.word	111
	.word	143
	.word	127
	.word	111
	.word	79
	.word	108
	.word	123
	.word	63
	.word	91
	.word	171
	.word	134
	.word	141
	.word	140
	.word	92
	.word	137
	.word	138
	.word	140
	.word	152
	.word	138
	.word	139
	.word	153
	.word	74
	.word	149
	.word	92
	.word	139
	.word	107
	.word	122
	.word	152
	.word	140
	.word	179
	.word	166
	.word	182
	.word	140
	.word	227
	.word	122
	.word	197
	.word	111
	.word	111
	.word	125
	.word	110
	.word	110
	.word	94
	.word	124
	.word	108
	.word	124
	.word	107
	.word	125
	.word	141
	.word	179
	.word	153
	.word	125
	.word	107
	.word	125
	.word	141
	.word	179
	.word	153
	.word	125
	.word	107
	.word	125
	.word	141
	.word	179
	.word	153
	.word	125
	.word	140
	.word	139
	.word	182
	.word	182
	.word	152
	.word	136
	.word	152
	.word	136
	.word	153
	.word	136
	.word	139
	.word	111
	.word	136
	.word	139
	.word	111
	.word	-1
	.word	153
	.word	138
	.word	138
	.word	-1
	.word	-1
	.word	79
	.word	110
	.word	122
	.word	95
	.word	79
	.word	63
	.word	31
	.word	31
	.word	153
	.word	153
	.word	168
	.word	140
	.word	198
	.word	-1
	.word	-1
	.word	-1
	.word	153
	.word	185
	.word	107
	.word	139
	.word	126
	.word	154
	.word	197
	.word	185
	.word	201
	.word	149
	.word	154
	.word	139
	.word	154
	.word	154
	.word	154
	.word	152
	.word	149
	.word	107
	.word	167
	.word	154
	.word	153
	.word	111
	.word	154
	.word	154
	.word	139
	.word	139
	.word	107
	.word	167
	.word	91
	.word	122
	.word	107
	.word	167
	.word	125
	.word	110
	.word	94
	.word	110
	.word	95
	.word	79
	.word	125
	.word	111
	.word	110
	.word	78
	.word	110
	.word	111
	.word	111
	.word	95
	.word	94
	.word	108
	.word	123
	.word	108
	.word	125
	.word	110
	.word	94
	.word	110
	.word	95
	.word	79
	.word	125
	.word	111
	.word	110
	.word	78
	.word	110
	.word	111
	.word	111
	.word	95
	.word	94
	.word	108
	.word	123
	.word	108
	.word	121
	.word	140
	.word	61
	.word	154
	.word	154
	.word	196
	.word	196
	.word	167
	.word	154
	.word	152
	.word	167
	.word	182
	.word	182
	.word	134
	.word	149
	.word	136
	.word	153
	.word	121
	.word	136
	.word	137
	.word	169
	.word	194
	.word	166
	.word	167
	.word	154
	.word	167
	.word	137
	.word	182
	.word	155
	.word	154
	.word	139
	.word	153
	.word	139
	.word	123
	.word	123
	.word	63
	.word	153
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	170
	.word	153
	.word	123
	.word	123
	.word	107
	.word	121
	.word	107
	.word	121
	.word	167
	.word	151
	.word	183
	.word	140
	.word	151
	.word	183
	.word	140
	.word	-1
	.word	124
	.word	138
	.word	94
	.word	-1
	.word	-1
	.word	79
	.word	154
	.word	137
	.word	95
	.word	79
	.word	63
	.word	31
	.word	31
	.word	153
	.word	153
	.word	168
	.word	169
	.word	198
	.word	-1
	.word	-1
	.word	-1
	.word	153
	.word	160
	.word	107
	.word	139
	.word	126
	.word	154
	.word	197
	.word	185
	.word	201
	.word	134
	.word	154
	.word	139
	.word	154
	.word	154
	.word	183
	.word	152
	.word	149
	.word	92
	.word	167
	.word	154
	.word	153
	.word	111
	.word	154
	.word	154
	.word	139
	.word	139
	.word	107
	.word	167
	.word	91
	.word	107
	.word	107
	.word	167
	.word	125
	.word	110
	.word	124
	.word	110
	.word	95
	.word	94
	.word	125
	.word	111
	.word	111
	.word	79
	.word	125
	.word	126
	.word	111
	.word	111
	.word	79
	.word	108
	.word	123
	.word	93
	.word	125
	.word	110
	.word	124
	.word	110
	.word	95
	.word	94
	.word	125
	.word	111
	.word	111
	.word	79
	.word	125
	.word	126
	.word	111
	.word	111
	.word	79
	.word	108
	.word	123
	.word	93
	.word	121
	.word	140
	.word	61
	.word	154
	.word	154
	.word	196
	.word	167
	.word	167
	.word	154
	.word	152
	.word	167
	.word	182
	.word	182
	.word	134
	.word	149
	.word	136
	.word	153
	.word	121
	.word	136
	.word	122
	.word	169
	.word	208
	.word	166
	.word	167
	.word	154
	.word	152
	.word	167
	.word	182
	.word	170
	.word	154
	.word	139
	.word	153
	.word	139
	.word	123
	.word	123
	.word	63
	.word	124
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	166
	.word	183
	.word	140
	.word	136
	.word	153
	.word	154
	.word	170
	.word	153
	.word	138
	.word	138
	.word	122
	.word	121
	.word	122
	.word	121
	.word	167
	.word	151
	.word	183
	.word	140
	.word	151
	.word	183
	.word	140
	.word	-1
	.word	224
	.word	167
	.word	122
	.word	-1
	.word	-1
	.type	__func__.14818, %object
	.size	__func__.14818, 31
__func__.14818:
	.ascii	"HEVCHAL_V400R003_CutSliceChain\000"
	.space	1
	.type	__func__.14837, %object
	.size	__func__.14837, 19
__func__.14837:
	.ascii	"HEVC_WriteTileInfo\000"
	.space	1
	.type	__func__.14863, %object
	.size	__func__.14863, 27
__func__.14863:
	.ascii	"HEVCHAL_V400R003_SetPicMsg\000"
	.space	1
	.type	__func__.14883, %object
	.size	__func__.14883, 34
__func__.14883:
	.ascii	"HEVCHAL_SetSliceMsgStreamAddrInfo\000"
	.space	2
	.type	__func__.14937, %object
	.size	__func__.14937, 29
__func__.14937:
	.ascii	"HEVCHAL_V400R003_SetSliceMsg\000"
	.space	3
	.type	s_SliceTypeForPMV, %object
	.size	s_SliceTypeForPMV, 12
s_SliceTypeForPMV:
	.word	2
	.word	1
	.word	0
	.type	__func__.14948, %object
	.size	__func__.14948, 23
__func__.14948:
	.ascii	"HEVCHAL_CheckParaValid\000"
	.space	1
	.type	__func__.14957, %object
	.size	__func__.14957, 25
__func__.14957:
	.ascii	"HEVCHAL_GetVdmRegVirAddr\000"
	.space	3
	.type	__func__.14963, %object
	.size	__func__.14963, 23
__func__.14963:
	.ascii	"HEVCHAL_CheckSlicePara\000"
	.space	1
	.type	__func__.14990, %object
	.size	__func__.14990, 27
__func__.14990:
	.ascii	"HEVCHAL_V400R003_CfgVdmReg\000"
	.space	1
	.type	__func__.15017, %object
	.size	__func__.15017, 26
__func__.15017:
	.ascii	"HEVCHAL_V400R003_StartDec\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"can not map mn virtual address!\012\000" )
	.space	3
.LC1:
	ASCII(.ascii	"%s: %s\012\000" )
.LC2:
	ASCII(.ascii	"HEVCWriteCabacTab return error.\012\000" )
	.space	3
.LC3:
	ASCII(.ascii	"can not map slice msg virtual address!\012\000" )
.LC4:
	ASCII(.ascii	"qmatrix[%d] = 0x%x\012\000" )
.LC5:
	ASCII(.ascii	"picmsg Dxx addr 0x%x = 0x%x\012\000" )
	.space	3
.LC6:
	ASCII(.ascii	"can not map slice segment info virtual address!\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC7:
	ASCII(.ascii	"TileId: 0x%x\012\000" )
	.space	2
.LC8:
	ASCII(.ascii	"can not map down msg virtual address!\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"pic msg burst0:\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"picmsg D[0] addr 0x%x = 0x%x\012\000" )
	.space	2
.LC11:
	ASCII(.ascii	"HEVC_WriteTileInfo return error.\012\000" )
	.space	2
.LC12:
	ASCII(.ascii	"%s FATAL: i=0, valid_bitlen=0\012\000" )
	.space	1
.LC13:
	ASCII(.ascii	"slicemsg D[%d] addr 0x%x = 0x%x\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"HEVCHAL_V400R003_SetSliceMsg can not map slice msg " )
	ASCII(.ascii	"virtual address!\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"%s VdhId %d >= %d\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"pParam is null\012\000" )
.LC17:
	ASCII(.ascii	"FATAL: ApcSize > 16\012\000" )
	.space	3
.LC18:
	ASCII(.ascii	"VdhId is wrong! HEVC4HAL_V200R003_StartDec\012\000" )
.LC19:
	ASCII(.ascii	"%s vdm register virtual address not mapped, reset f" )
	ASCII(.ascii	"ailed!\012\000" )
	.space	1
.LC20:
	ASCII(.ascii	"%s: i = %d, pSlicePara = NULL!\012\000" )
.LC21:
	ASCII(.ascii	"SliceSegmentTileAddress %d < prevEndCtbInSliceTile " )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"end_ctb_in_slice_raster(%d)/end_ctb_in_slice_tile(%" )
	ASCII(.ascii	"d) > pic_max_ctb(%d)\012\000" )
	.space	3
.LC23:
	ASCII(.ascii	"SliceSegmentTileAddress %d > end_ctb_in_slice_tile " )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC24:
	ASCII(.ascii	"%s: pMfdeTask(%p) = NULL\012\000" )
	.space	2
.LC25:
	ASCII(.ascii	"HEVC_BASIC_CFG0 = 0x%x\012\000" )
.LC26:
	ASCII(.ascii	"HEVC_BASIC_CFG1 = 0x%x\012\000" )
.LC27:
	ASCII(.ascii	"AVM_ADDR = 0x%x\012\000" )
	.space	3
.LC28:
	ASCII(.ascii	"VREG_V200R003_PART_DEC_OVER_INT_LEVEL=0x%x\012\000" )
.LC29:
	ASCII(.ascii	"VREG_LINE_NUM_STADDR = 0x%x\012\000" )
	.space	3
.LC30:
	ASCII(.ascii	"HEVC_VFMW_YSTADDR_1D = 0x%x\012\000" )
	.space	3
.LC31:
	ASCII(.ascii	"HEVC_VFMW_UVOFFSET_1D = 0x%x\012\000" )
	.space	2
.LC32:
	ASCII(.ascii	"SCD REG_EMAR_ID = 0x%x\012\000" )
.LC33:
	ASCII(.ascii	"VREG_FF_APT_EN = 0x%x\012\000" )
	.space	1
.LC34:
	ASCII(.ascii	"%s pFirstSlice = NULL!\012\000" )
.LC35:
	ASCII(.ascii	"%s 0: set slice msg failed!\012\000" )
	.space	3
.LC36:
	ASCII(.ascii	"%s pTargetSlicePara is NULL!\012\000" )
	.space	2
.LC37:
	ASCII(.ascii	"%s 1: set slice msg failed!\012\000" )
	.space	3
.LC38:
	ASCII(.ascii	"No slice to dec, add up msg report.\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	s_CabacMN, %object
	.size	s_CabacMN, 928
s_CabacMN:
	.space	928
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
