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
	.file	"hal_venc.c"
	.text
	.align	2
	.global	VENC_HAL_ClrAllInt
	.type	VENC_HAL_ClrAllInt, %function
VENC_HAL_ClrAllInt:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mvn	r3, #0
	str	r3, [r0, #12]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VENC_HAL_ClrAllInt, .-VENC_HAL_ClrAllInt
	.align	2
	.global	VENC_HAL_DisableAllInt
	.type	VENC_HAL_DisableAllInt, %function
VENC_HAL_DisableAllInt:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r3, #0
	str	r3, [r0, #4]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VENC_HAL_DisableAllInt, .-VENC_HAL_DisableAllInt
	.align	2
	.global	VENC_HAL_ReadReg_Smmu
	.type	VENC_HAL_ReadReg_Smmu, %function
VENC_HAL_ReadReg_Smmu:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r3, [r0, #20]
	mvn	r1, #0
	add	r3, r3, #61440
	ldr	r2, [r3, #40]
	and	r2, r2, #1
	str	r2, [r0, #2688]
	ldr	r2, [r3, #40]
	ubfx	r2, r2, #1, #1
	str	r2, [r0, #2692]
	ldr	r2, [r3, #40]
	ubfx	r2, r2, #2, #1
	str	r2, [r0, #2696]
	ldr	r2, [r3, #40]
	ubfx	r2, r2, #3, #1
	str	r2, [r0, #2700]
	ldr	r2, [r3, #24]
	and	r2, r2, #1
	str	r2, [r0, #2672]
	ldr	r2, [r3, #24]
	ubfx	r2, r2, #1, #1
	str	r2, [r0, #2676]
	ldr	r2, [r3, #24]
	ubfx	r2, r2, #2, #1
	str	r2, [r0, #2680]
	ldr	r2, [r3, #24]
	ubfx	r2, r2, #3, #1
	str	r2, [r0, #2684]
	str	r1, [r3, #28]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VENC_HAL_ReadReg_Smmu, .-VENC_HAL_ReadReg_Smmu
	.align	2
	.global	VENC_HAL_CfgSmmuReg
	.type	VENC_HAL_CfgSmmuReg, %function
VENC_HAL_CfgSmmuReg:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	r2, r0
	mov	r0, #0
	ldr	r3, [r2, #20]
	ldr	r1, [r2, #2644]
	add	r3, r3, #61440
	str	r1, [r3, #520]
	ldr	r1, [r2, #2644]
	str	r1, [r3, #524]
	ldr	r1, [r2, #2652]
	str	r1, [r3, #752]
	ldr	r1, [r2, #2648]
	str	r1, [r3, #756]
	ldr	r1, [r2, #2652]
	str	r1, [r3, #772]
	ldr	r2, [r2, #2648]
	str	r2, [r3, #776]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	VENC_HAL_CfgSmmuReg, .-VENC_HAL_CfgSmmuReg
	.global	__aeabi_uidiv
	.align	2
	.global	VENC_HAL_ReadReg
	.type	VENC_HAL_ReadReg, %function
VENC_HAL_ReadReg:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	ip, [r0, #20]
	mov	r4, r0
	ldr	r3, [ip]
	and	r3, r3, #1
	str	r3, [r0, #2656]
	ldr	r3, [ip]
	ubfx	r3, r3, #1, #1
	str	r3, [r0, #2660]
	ldr	r0, [ip]
	ubfx	r0, r0, #3, #1
	str	r0, [r4, #2664]
	orrs	r3, r0, r3
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, ip, #4096
	ldr	r0, [r4, #24]
	ldr	r3, [r5, #1644]
	cmp	r0, #0
	bic	r3, r3, #-67108864
	str	r3, [r4, #2668]
	beq	.L13
	ldr	r3, [r5, #3712]
	mov	lr, r3, asl #3
	str	lr, [r1, #24]
	ldr	r3, [r5, #1540]
	ldr	ip, [r5, #1572]
	ubfx	r0, r3, #0, #19
	ubfx	r3, ip, #0, #17
	add	r3, r0, r3
.L8:
	add	r0, r3, #3
	cmp	r3, #0
	movlt	r3, r0
	mov	r3, r3, asr #2
	str	r3, [r1, #112]
	ldr	r3, [r2, #96]
	add	r3, lr, r3
	str	r3, [r2, #96]
	ldr	r0, [r1, #24]
	cmp	r3, r0
	strls	r0, [r2, #96]
	ldrhi	r3, [r2, #100]
	movls	r3, #1
	addhi	r3, r3, #1
	str	r3, [r2, #100]
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ldr	r3, [r1, #16]
	ldr	r1, [r1, #12]
	addeq	r3, r3, #15
	addne	r3, r3, #7
	addeq	r1, r1, #15
	addne	r1, r1, #7
	moveq	r3, r3, lsr #4
	movne	r3, r3, lsr #3
	moveq	r1, r1, lsr #4
	movne	r1, r1, lsr #3
	ldreq	r0, [r4, #2668]
	ldrne	r0, [r4, #2668]
	mul	r1, r1, r3
	bl	__aeabi_uidiv
	str	r0, [r4, #2668]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L13:
	add	ip, ip, #8192
	ldr	r3, [ip, #132]
	mov	lr, r3, asl #3
	str	lr, [r1, #24]
	ldr	r0, [r5, #1544]
	ldr	r6, [r5, #1548]
	ldr	r3, [r5, #1576]
	ubfx	ip, r0, #0, #19
	ubfx	r0, r6, #0, #19
	add	r0, ip, r0
	ubfx	r3, r3, #0, #19
	add	r3, r0, r3
	b	.L8
	UNWIND(.fnend)
	.size	VENC_HAL_ReadReg, .-VENC_HAL_ReadReg
	.align	2
	.global	VENC_HAL_VEDU_Cfg_CABAC_VLC
	.type	VENC_HAL_VEDU_Cfg_CABAC_VLC, %function
VENC_HAL_VEDU_Cfg_CABAC_VLC:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [r1, #44]
	movw	r1, #513
	ldr	r3, [r0, #20]
	movw	ip, #9729
	ldr	lr, [r0, #2360]
	cmp	r4, #0
	add	r2, r3, #4096
	moveq	ip, r1
	mov	r1, #0
	bfi	r1, lr, #8, #3
	bfi	r1, ip, #16, #16
	str	r1, [r2, #3584]
	ldr	r4, [r0, #252]
	mov	ip, #0
	ldr	lr, [r0, #260]
	mov	r1, ip
	bfi	ip, r4, #0, #5
	mov	r4, r1
	bfi	ip, lr, #16, #16
	str	ip, [r2, #3588]
	ldr	r5, [r0, #256]
	mov	lr, r1
	ldr	ip, [r0, #264]
	bfi	r1, r5, #0, #5
	bfi	r1, ip, #16, #16
	str	r1, [r2, #3628]
	ldr	ip, [r0, #244]
	ldr	r1, [r0, #252]
	rsb	r1, r1, #16
	mov	r1, ip, asl r1
	bfi	r4, r1, #0, #16
	str	r4, [r2, #3592]
	ldr	r1, [r0, #256]
	ldr	ip, [r0, #248]
	rsb	r1, r1, #16
	mov	r1, ip, asl r1
	bfi	lr, r1, #0, #16
	str	lr, [r2, #3632]
	ldr	r1, [r0, #24]
	cmp	r1, #4
	beq	.L31
	ldr	r1, [r0, #292]
	add	r3, r3, #8192
	str	r1, [r3, #4]
	ldr	r1, [r0, #296]
	str	r1, [r3, #8]
	ldr	r1, [r0, #300]
	str	r1, [r3, #12]
	ldr	r1, [r0, #304]
	str	r1, [r3, #16]
	ldr	r1, [r0, #308]
	str	r1, [r3, #20]
	ldr	r1, [r0, #312]
	str	r1, [r3, #24]
	ldr	r1, [r0, #316]
	str	r1, [r3, #28]
	ldr	r1, [r0, #320]
	str	r1, [r3, #32]
	ldr	r1, [r0, #140]
	ldr	ip, [r3, #36]
	sub	r1, r1, #1
	bfi	ip, r1, #16, #7
	str	ip, [r3, #36]
	ldr	r1, [r0, #140]
	ldr	ip, [r3, #36]
	mov	r1, r1, lsr #8
	sub	r1, r1, #1
	bfi	ip, r1, #8, #6
	str	ip, [r3, #36]
	ldrh	r1, [r0, #142]
	ldr	ip, [r3, #36]
	sub	r1, r1, #1
	bfi	ip, r1, #0, #6
	str	ip, [r3, #36]
	ldr	r1, [r0, #24]
	cmp	r1, #4
	beq	.L32
.L24:
	ldr	r2, [r0, #148]
	str	r2, [r3, #44]
	ldr	r2, [r0, #152]
	str	r2, [r3, #48]
	ldr	r2, [r0, #156]
	str	r2, [r3, #52]
	ldr	r2, [r0, #160]
	str	r2, [r3, #56]
	ldr	r2, [r0, #164]
	str	r2, [r3, #60]
	ldr	r2, [r0, #168]
	str	r2, [r3, #64]
	ldr	r2, [r0, #172]
	str	r2, [r3, #68]
	ldr	r2, [r0, #176]
	str	r2, [r3, #72]
	ldr	r2, [r0, #144]
	ldr	r1, [r3, #76]
	sub	r2, r2, #1
	bfi	r1, r2, #16, #7
	str	r1, [r3, #76]
	ldr	r2, [r0, #144]
	ldr	r1, [r3, #76]
	mov	r2, r2, lsr #8
	sub	r2, r2, #1
	bfi	r1, r2, #8, #6
	str	r1, [r3, #76]
	ldrh	r2, [r0, #146]
	ldr	r1, [r3, #76]
	sub	r2, r2, #1
	bfi	r1, r2, #0, #6
	str	r1, [r3, #76]
.L30:
	ldr	r2, [r3, #40]
	mov	r1, #0
	bfc	r2, #1, #24
	str	r2, [r3, #40]
	ldr	r2, [r3, #40]
	bfc	r2, #0, #1
	str	r2, [r3, #40]
	str	r1, [r3, #40]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L31:
	ldr	r1, [r0, #260]
	add	r3, r3, #8192
	cmp	r1, #31
	rsbls	r1, r1, #32
	ldrls	ip, [r0, #180]
	ldrhi	r1, [r0, #180]
	movls	r1, ip, asl r1
	str	r1, [r2, #3596]
	ldr	r1, [r0, #260]
	cmp	r1, #63
	rsbls	r1, r1, #64
	ldrhi	r1, [r0, #184]
	ldrls	ip, [r0, #184]
	movls	r1, ip, asl r1
	str	r1, [r2, #3600]
	ldr	r1, [r0, #260]
	cmp	r1, #64
	rsbhi	r1, r1, #96
	ldrhi	ip, [r0, #188]
	movhi	r1, ip, asl r1
	strhi	r1, [r2, #3604]
	ldr	r1, [r0, #192]
	str	r1, [r2, #3608]
	ldr	r1, [r0, #196]
	str	r1, [r2, #3612]
	ldr	r1, [r0, #200]
	str	r1, [r2, #3616]
	ldr	r1, [r0, #204]
	str	r1, [r2, #3620]
	ldr	r1, [r0, #208]
	str	r1, [r2, #3624]
	ldr	r1, [r0, #24]
	cmp	r1, #4
	bne	.L24
.L32:
	ldr	r1, [r0, #264]
	cmp	r1, #31
	rsbls	r1, r1, #32
	ldrls	ip, [r0, #212]
	ldrhi	r1, [r0, #212]
	movls	r1, ip, asl r1
	str	r1, [r2, #3636]
	ldr	r1, [r0, #264]
	cmp	r1, #63
	rsbls	r1, r1, #64
	ldrhi	r1, [r0, #216]
	ldrls	ip, [r0, #216]
	movls	r1, ip, asl r1
	str	r1, [r2, #3640]
	ldr	r1, [r0, #264]
	cmp	r1, #64
	rsbhi	r1, r1, #96
	ldrhi	ip, [r0, #220]
	movhi	r1, ip, asl r1
	strhi	r1, [r2, #3644]
	ldr	r1, [r0, #224]
	str	r1, [r2, #3648]
	ldr	r1, [r0, #228]
	str	r1, [r2, #3652]
	ldr	r1, [r0, #232]
	str	r1, [r2, #3656]
	ldr	r1, [r0, #236]
	str	r1, [r2, #3660]
	ldr	r1, [r0, #240]
	str	r1, [r2, #3664]
	b	.L30
	UNWIND(.fnend)
	.size	VENC_HAL_VEDU_Cfg_CABAC_VLC, .-VENC_HAL_VEDU_Cfg_CABAC_VLC
	.align	2
	.global	VENC_HAL_CfgReg
	.type	VENC_HAL_CfgReg, %function
VENC_HAL_CfgReg:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #84)
	sub	sp, sp, #84
	mov	r8, r1
	str	r1, [fp, #-48]
	mov	r2, #11
	ldr	r1, [r1, #68]
	mov	r4, r0
	ldr	r9, [r0, #20]
	mov	r3, #0
	bfi	r2, r1, #10, #1
	bfc	r3, #0, #1
	bfc	r2, #16, #1
	orr	r3, r3, #2
	bfc	r2, #17, #1
	bfc	r3, #2, #1
	orr	r2, r2, #134217728
	mov	r6, #0
	bfc	r2, #30, #1
	str	r2, [r9, #4]
	ldr	r0, [r0, #24]
	bfc	r6, #0, #9
	ldr	r1, [r8, #68]
	bfc	r6, #16, #9
	subs	r2, r0, #4
	ldr	lr, [r4, #2356]
	ldr	r5, [r4, #704]
	movne	r2, #1
	bfi	r3, r2, #3, #2
	bfi	r3, r1, #5, #1
	ldr	r2, [r4, #2352]
	ldr	r1, [r8, #44]
	bfi	r3, lr, #6, #1
	bfi	r3, r2, #7, #1
	ldr	lr, [r4, #2348]
	clz	r2, r1
	bfc	r3, #8, #1
	bfc	r3, #24, #1
	ldr	r7, [r4, #2344]
	mov	r2, r2, lsr #5
	bfi	r3, r5, #9, #1
	bfi	r3, r2, #10, #2
	cmp	r0, #4
	bfi	r3, lr, #12, #1
	ldr	lr, [r4, #424]
	bfi	r3, r1, #16, #1
	moveq	r1, #2
	orr	r3, r3, #131072
	movne	r1, #0
	bfi	r3, r7, #18, #2
	mov	r5, #0
	bfc	r3, #21, #1
	mov	r2, r5
	bfc	r3, #22, #1
	mov	r0, r5
	bfc	r3, #25, #1
	bfc	r0, #0, #5
	bfi	r3, r1, #26, #2
	mov	r1, r5
	bfi	r3, lr, #28, #2
	bfi	r1, r5, #0, #1
	bfc	r3, #30, #1
	mov	lr, r5
	bfc	r3, #31, #1
	str	r3, [r9, #20]
	str	r6, [r9, #24]
	bfi	lr, r5, #8, #2
	ldrh	r3, [r4, #28]
	bfi	r1, r5, #1, #1
	ldrb	r6, [r4]
	bfi	lr, r5, #4, #4
	bfi	r5, r3, #17, #1
	ldr	r3, [r4, #32]
	bfi	r5, r6, #16, #1
	bfc	r0, #5, #5
	bfi	r5, r3, #0, #16
	str	r5, [r9, #28]
	ldr	r3, [r8, #176]
	bfi	r1, r2, #2, #1
	ldr	r5, [r4, #2224]
	bfi	lr, r2, #0, #4
	bfi	r0, r3, #10, #6
	ldr	r3, [r4, #2200]
	bfi	r0, r5, #18, #1
	bfi	r1, r2, #3, #1
	bfi	r0, r3, #19, #1
	str	r0, [r9, #32]
	str	r2, [r9, #36]
	orr	r1, r1, #458752
	str	r2, [r9, #40]
	mov	r0, r2
	str	lr, [r9, #44]
	bfi	r0, r2, #16, #9
	ldr	r6, [r4, #416]
	mov	r5, r2
	ldr	lr, [r4, #420]
	bfi	r0, r2, #0, #9
	bfi	r1, r6, #19, #2
	mov	r3, r2
	bfi	r1, lr, #21, #1
	bfi	r1, r2, #23, #1
	str	r1, [r9, #48]
	ldr	r1, [r8, #16]
	ldr	r2, [r8, #12]
	sub	r1, r1, #1
	bfi	r5, r1, #16, #13
	sub	r2, r2, #1
	bfi	r5, r2, #0, #13
	str	r5, [r9, #52]
	str	r0, [r9, #56]
	ldr	r2, [r4, #432]
	str	r2, [r9, #60]
	ldr	r1, [r4, #440]
	ldr	r2, [r4, #444]
	bfi	r3, r1, #4, #4
	bfi	r3, r2, #0, #4
	str	r3, [r9, #64]
	ldr	r3, [r4, #24]
	cmp	r3, #4
	beq	.L66
	cmp	r3, #0
	moveq	r3, #15
	moveq	ip, #0
	bfieq	ip, r3, #16, #6
	moveq	r3, #31
	bfieq	ip, r3, #0, #7
.L38:
	mov	r1, #3
	mov	r3, #0
	bfi	r3, r1, #0, #3
	mov	r2, #1
	bfi	r3, r2, #3, #2
	str	ip, [r9, #88]
	bfi	r3, r1, #5, #3
	str	r1, [r9, #92]
	bfi	r3, r1, #8, #3
	mov	r2, #1
	str	r2, [r9, #96]
	mov	r5, #0
	str	r3, [r9, #100]
	mov	r2, r5
	ldr	r6, [r4, #412]
	mov	lr, r5
	mov	ip, r5
	mov	r0, r5
	mov	r3, r5
	bfc	r3, #0, #1
	str	r6, [r9, #184]
	bfc	r3, #1, #1
	ldr	r6, [r4, #68]
	bfc	r3, #2, #1
	bfc	r3, #3, #3
	str	r6, [r9, #188]
	ldr	r6, [r4, #72]
	str	r6, [r9, #192]
	ldr	r6, [r4, #76]
	str	r6, [r9, #196]
	ldr	r7, [r4, #52]
	ldr	r6, [r4, #56]
	bfi	r5, r7, #16, #16
	ldr	r7, [fp, #-48]
	bfi	r5, r6, #0, #16
	str	r5, [r9, #208]
	ldr	r5, [r7, #52]
	add	r5, r5, #32
	ldr	r5, [r4, r5, asl #2]
	str	r5, [r9, #212]
	ldr	r5, [r7, #48]
	add	r5, r5, #20
	ldr	r5, [r4, r5, asl #2]
	str	r5, [r9, #216]
	ldr	r5, [r7, #48]
	add	r5, r5, #22
	ldr	r5, [r4, r5, asl #2]
	str	r5, [r9, #220]
	ldr	r6, [r4, #276]
	ldr	r5, [r4, #280]
	bfi	r2, r6, #0, #16
	bfi	r2, r5, #16, #16
	str	r2, [r9, #224]
	ldr	r2, [r7, #48]
	add	r2, r2, #24
	ldr	r2, [r4, r2, asl #2]
	str	r2, [r9, #228]
	ldr	r2, [r7, #48]
	add	r2, r2, #26
	ldr	r2, [r4, r2, asl #2]
	str	r2, [r9, #232]
	ldr	r2, [r4, #284]
	bfi	lr, r2, #0, #16
	str	lr, [r9, #236]
	ldr	r2, [r7, #48]
	clz	r2, r2
	mov	r2, r2, lsr #5
	add	r2, r2, #20
	ldr	r2, [r4, r2, asl #2]
	str	r2, [r9, #240]
	ldr	r2, [r7, #48]
	clz	r2, r2
	mov	r2, r2, lsr #5
	add	r2, r2, #22
	ldr	r2, [r4, r2, asl #2]
	str	r2, [r9, #244]
	ldr	lr, [r4, #280]
	ldr	r2, [r4, #276]
	bfi	ip, lr, #0, #16
	bfi	ip, r2, #16, #16
	str	ip, [r9, #248]
	ldr	r2, [r7, #48]
	clz	r2, r2
	mov	r2, r2, lsr #5
	add	r2, r2, #24
	ldr	r2, [r4, r2, asl #2]
	str	r2, [r9, #252]
	ldr	r2, [r7, #48]
	clz	r2, r2
	mov	r2, r2, lsr #5
	add	r2, r2, #26
	ldr	r2, [r4, r2, asl #2]
	str	r2, [r9, #256]
	ldr	ip, [r4, #284]
	ldr	r2, [r4, #288]
	bfi	r0, ip, #16, #16
	bfi	r0, r2, #0, #16
	str	r0, [r9, #260]
	ldr	r2, [r7, #48]
	clz	r2, r2
	mov	r2, r2, lsr #5
	add	r2, r2, #30
	ldr	r2, [r4, r2, asl #2]
	str	r2, [r9, #264]
	ldr	r2, [r7, #48]
	add	r2, r2, #30
	ldr	r2, [r4, r2, asl #2]
	str	r2, [r9, #268]
	ldr	r2, [r7, #48]
	add	r2, r2, #28
	ldr	r2, [r4, r2, asl #2]
	str	r2, [r9, #276]
	ldr	r2, [r7, #48]
	clz	r2, r2
	mov	r2, r2, lsr #5
	add	r2, r2, #28
	ldr	r2, [r4, r2, asl #2]
	str	r2, [r9, #280]
	ldr	r2, [r4, #36]
	str	r2, [r9, #284]
	ldr	r2, [r4, #44]
	str	r2, [r9, #288]
	ldr	r2, [r4, #40]
	str	r2, [r9, #292]
	ldr	r2, [r4, #60]
	cmp	r2, #2
	beq	.L39
	cmp	r2, #1
	beq	.L61
	cmp	r2, #0
	bfc	r3, #6, #4
	bfc	r3, #14, #1
	bne	.L40
	ldr	r2, [r4, #64]
	clz	r2, r2
	mov	r2, r2, lsr #5
.L41:
	bfi	r3, r2, #16, #8
	str	r3, [r9, #296]
	ldr	r1, [r4, #2340]
	mov	r2, #0
	ldr	ip, [r4, #2336]
	mov	r0, #5
	mov	r3, r2
	bfi	r2, r1, #0, #3
	bfc	r3, #0, #1
	mov	r1, #0
	bfi	r1, r0, #24, #8
	bfi	r2, ip, #4, #1
	bfi	r1, r0, #16, #8
	bfc	r3, #1, #1
	mov	ip, #15
	bfc	r2, #5, #1
	bfi	r1, ip, #8, #8
	bfc	r3, #2, #1
	mov	r0, #0
	bfi	r1, ip, #0, #8
	orr	r2, r2, #30464
	orr	r3, r3, #24
	str	r2, [r9, #316]
	movt	r0, 100
	mov	r2, #3
	str	r2, [r9, #320]
	str	r3, [r9, #324]
	mov	r3, #500
	bfi	r0, r3, #0, #16
	str	r0, [r9, #328]
	str	r1, [r9, #332]
	mov	r2, #0
	ldr	r0, [r4, #716]
	mov	r3, r2
	ldr	r1, [r4, #712]
	mov	ip, r2
	bfi	r2, r0, #0, #1
	ldr	r0, [r4, #708]
	bfi	r2, r1, #1, #1
	mov	r6, r3
	bfi	r2, r0, #2, #1
	mov	r5, r3
	orr	r2, r2, #8
	mov	r0, r3
	bfc	r2, #4, #1
	str	r2, [r9, #352]
	ldr	lr, [r4, #8]
	mvn	r1, #127
	bfi	r0, r1, #0, #8
	mov	r7, #2
	mov	r2, #128
	bfi	r0, r1, #8, #8
	str	lr, [r9, #392]
	bfi	r6, r1, #0, #8
	ldr	lr, [r4, #2192]
	bfi	r5, r2, #0, #10
	ldr	r8, [r4, #2196]
	bfi	r0, r1, #16, #8
	bfi	r3, lr, #0, #1
	ldr	lr, [r4, #2208]
	bfi	r3, r8, #1, #1
	ldr	r8, [r4, #2220]
	bfi	r3, lr, #2, #1
	ldr	lr, [r4, #2188]
	bfi	r3, r8, #4, #1
	ldr	r8, [r4, #2184]
	bfi	r3, lr, #8, #1
	ldr	lr, [r4, #2268]
	bfi	r3, r8, #9, #1
	ldr	r8, [r4, #2272]
	bfi	r3, lr, #10, #1
	ldr	lr, [r4, #2276]
	bfi	r3, r8, #11, #1
	ldr	r8, [r4, #2180]
	bfi	r3, lr, #12, #1
	ldr	lr, [r4, #2176]
	bfi	r3, r8, #13, #1
	ldr	r8, [r4, #2280]
	bfi	r3, lr, #14, #1
	mov	lr, ip
	bfi	r3, r8, #15, #1
	str	r3, [r9, #440]
	ldr	r3, [r4, #2212]
	bfc	lr, #0, #1
	bfi	r6, r1, #8, #8
	bfi	r5, r2, #10, #10
	bfi	ip, r3, #1, #1
	bfc	lr, #1, #8
	bfi	ip, r7, #16, #8
	movw	r2, #43691
	bfi	ip, r7, #24, #8
	str	ip, [r9, #444]
	str	r0, [r9, #464]
	movt	r2, 43690
	str	r6, [r9, #468]
	mov	r1, #1
	str	r5, [r9, #472]
	mov	r0, #0
	str	lr, [r9, #476]
	mov	ip, r0
	ldr	r10, [fp, #-48]
	mov	lr, r0
	mov	r8, r0
	str	r0, [fp, #-60]
	str	r0, [fp, #-64]
	ldr	r3, [r10, #52]
	add	r3, r3, r7
	umull	r6, r7, r3, r2
	mov	r5, r7, lsr r1
	add	r5, r5, r5, lsl #1
	rsb	r3, r5, r3
	add	r3, r3, #32
	ldr	r3, [r4, r3, asl #2]
	str	r3, [r9, #480]
	ldr	r5, [r10, #52]
	add	r5, r5, r1
	umull	r2, r3, r5, r2
	mov	r3, r3, lsr r1
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r5
	add	r3, r3, #32
	ldr	r3, [r4, r3, asl #2]
	str	r3, [r9, #484]
	str	r1, [r9, #492]
	ldrb	r2, [r4, #476]
	ldrb	r1, [r4, #472]
	ldrb	r7, [r4, #468]
	ldrb	r10, [r4, #464]
	orr	r3, r1, r2
	ldrb	r5, [r4, #460]
	orr	r3, r7, r3
	ldrb	r6, [r4, #456]
	orr	r3, r10, r3
	orr	r3, r5, r3
	str	r5, [fp, #-52]
	orr	r3, r6, r3
	ldrb	r5, [r4, #452]
	str	r6, [fp, #-56]
	ldrb	r6, [r4, #448]
	orr	r3, r5, r3
	orr	r3, r6, r3
	bfi	r0, r3, #24, #1
	ldr	r3, [r4, #700]
	bfi	r0, r3, #23, #1
	ldr	r3, [r4, #696]
	bfi	r0, r3, #22, #1
	ldr	r3, [r4, #692]
	bfi	r0, r3, #21, #1
	ldr	r3, [r4, #688]
	bfi	r0, r3, #20, #1
	ldr	r3, [r4, #684]
	bfi	r0, r3, #19, #1
	ldr	r3, [r4, #680]
	bfi	r0, r3, #18, #1
	ldr	r3, [r4, #676]
	bfi	r0, r3, #17, #1
	ldr	r3, [r4, #672]
	bfi	r0, r3, #16, #1
	ldr	r3, [r4, #508]
	bfi	r0, r3, #15, #1
	ldr	r3, [r4, #504]
	bfi	r0, r3, #14, #1
	ldr	r3, [r4, #500]
	bfi	r0, r3, #13, #1
	ldr	r3, [r4, #496]
	bfi	r0, r3, #12, #1
	ldr	r3, [r4, #492]
	bfi	r0, r3, #11, #1
	ldr	r3, [r4, #488]
	bfi	r0, r3, #10, #1
	ldr	r3, [r4, #484]
	bfi	r0, r3, #9, #1
	ldr	r3, [r4, #480]
	bfi	r0, r3, #8, #1
	mov	r3, lr
	bfi	r0, r2, #7, #1
	ldr	r2, [fp, #-52]
	bfi	r0, r1, #6, #1
	mov	r1, lr
	bfi	r0, r7, #5, #1
	mov	r7, lr
	bfi	r0, r10, #4, #1
	ldr	r10, [fp, #-56]
	bfi	r0, r2, #3, #1
	mov	r2, lr
	bfi	r0, r10, #2, #1
	mov	r10, lr
	bfi	r0, r5, #1, #1
	str	ip, [fp, #-52]
	bfi	r0, r6, #0, #1
	str	r0, [r9, #512]
	ldr	r0, [r4, #524]
	ldr	r5, [r4, #520]
	ldr	r6, [r4, #516]
	bfi	lr, r0, #24, #7
	bfi	lr, r5, #16, #7
	ldr	r0, [r4, #512]
	bfi	lr, r6, #8, #7
	mov	r6, r1
	bfi	lr, r0, #0, #7
	str	lr, [r9, #516]
	ldr	r0, [r4, #540]
	ldr	lr, [r4, #536]
	ldr	r5, [r4, #532]
	bfi	ip, r0, #24, #7
	bfi	ip, lr, #16, #7
	ldr	r0, [r4, #528]
	bfi	ip, r5, #8, #7
	mov	r5, r8
	bfi	ip, r0, #0, #7
	str	ip, [r9, #520]
	ldr	ip, [r4, #576]
	mov	lr, r1
	ldr	r0, [r4, #544]
	bfi	r8, ip, #16, #10
	bfi	r8, r0, #0, #10
	str	r8, [r9, #524]
	ldr	ip, [r4, #580]
	mov	r8, r1
	ldr	r0, [r4, #548]
	bfi	r8, ip, #16, #10
	mov	ip, r1
	bfi	r8, r0, #0, #10
	str	r8, [r9, #528]
	ldr	r8, [r4, #584]
	ldr	r0, [r4, #552]
	bfi	r6, r8, #16, #10
	bfi	r6, r0, #0, #10
	str	r6, [r9, #532]
	ldr	r6, [r4, #588]
	mov	r0, r1
	ldr	r8, [r4, #556]
	bfi	r1, r6, #16, #10
	bfi	r1, r8, #0, #10
	str	r1, [r9, #536]
	ldr	r6, [r4, #592]
	mov	r1, r2
	ldr	r8, [r4, #560]
	bfi	r2, r6, #16, #10
	bfi	r2, r8, #0, #10
	str	r2, [r9, #540]
	ldr	r8, [r4, #564]
	mov	r2, r3
	ldr	r6, [r4, #596]
	bfi	r3, r6, #16, #10
	bfi	r3, r8, #0, #10
	str	r3, [r9, #544]
	ldr	r6, [r4, #600]
	mov	r3, r7
	ldr	r8, [r4, #568]
	bfi	r7, r6, #16, #10
	mov	r6, r5
	bfi	r7, r8, #0, #10
	str	r7, [r9, #548]
	ldr	r8, [r4, #604]
	ldr	r7, [r4, #572]
	bfi	r10, r8, #16, #10
	bfi	r10, r7, #0, #10
	str	r10, [r9, #552]
	ldr	r8, [r4, #640]
	ldr	r7, [r4, #608]
	bfi	r6, r8, #16, #9
	bfi	r6, r7, #0, #9
	str	r6, [r9, #556]
	ldr	r7, [r4, #644]
	ldr	r6, [r4, #612]
	bfi	r5, r7, #16, #9
	bfi	r5, r6, #0, #9
	str	r5, [r9, #560]
	ldr	r6, [r4, #648]
	ldr	r5, [r4, #616]
	bfi	lr, r6, #16, #9
	bfi	lr, r5, #0, #9
	str	lr, [r9, #564]
	ldr	r5, [r4, #652]
	ldr	lr, [r4, #620]
	bfi	ip, r5, #16, #9
	bfi	ip, lr, #0, #9
	str	ip, [r9, #568]
	ldr	lr, [r4, #656]
	ldr	ip, [r4, #624]
	bfi	r0, lr, #16, #9
	bfi	r0, ip, #0, #9
	str	r0, [r9, #572]
	ldr	ip, [r4, #660]
	ldr	r0, [r4, #628]
	bfi	r1, ip, #16, #9
	bfi	r1, r0, #0, #9
	str	r1, [r9, #576]
	ldr	r0, [r4, #664]
	ldr	r1, [r4, #632]
	bfi	r2, r0, #16, #9
	bfi	r2, r1, #0, #9
	str	r2, [r9, #580]
	ldr	r1, [r4, #668]
	ldr	r2, [r4, #636]
	bfi	r3, r1, #16, #9
	bfi	r3, r2, #0, #9
	str	r3, [r9, #584]
	ldr	r3, [r4, #24]
	ldr	r7, [fp, #-48]
	cmp	r3, #0
	ldr	r0, [r7, #12]
	moveq	r5, #16
	movne	r5, #64
	sub	r0, r0, #1
	mov	r1, r5
	add	r0, r0, r5
	bl	__aeabi_uidiv
	ldr	r3, [r7, #16]
	mov	r1, r5
	mov	r6, r0
	sub	r0, r3, #1
	add	r0, r0, r5
	bl	__aeabi_uidiv
	str	r7, [fp, #-48]
	mul	r1, r6, r0
	ldr	r0, [r7, #172]
	bl	__aeabi_uidiv
	mov	r3, #0
	mov	r6, r3
	mov	r1, r3
	mov	r5, r3
	str	r3, [fp, #-52]
	str	r3, [fp, #-56]
	mov	ip, r3
	str	r3, [fp, #-60]
	mov	lr, r3
	str	r3, [fp, #-64]
	mov	r8, r3
	str	r3, [fp, #-68]
	mov	r10, r3
	str	r3, [fp, #-72]
	mov	r2, r3
	str	r3, [fp, #-76]
	mov	r7, r3
	str	r3, [fp, #-80]
	str	r3, [fp, #-84]
	str	r3, [fp, #-88]
	str	r3, [fp, #-92]
	str	r3, [fp, #-96]
	str	r3, [fp, #-100]
	str	r3, [fp, #-104]
	str	r3, [fp, #-108]
	str	r3, [fp, #-112]
	str	r3, [fp, #-116]
	str	r3, [fp, #-120]
	bfi	r3, r0, #0, #20
	str	r3, [r9, #588]
	ldr	r0, [r4, #720]
	mov	r3, r1
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #724]
	bfi	r3, r0, #0, #10
	str	r3, [r9, #640]
	ldr	r0, [r4, #728]
	mov	r3, r1
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #732]
	bfi	r3, r0, #0, #8
	str	r3, [r9, #644]
	ldr	r0, [r4, #736]
	mov	r3, r1
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #740]
	bfi	r3, r0, #0, #10
	str	r3, [r9, #648]
	ldr	r0, [r4, #744]
	mov	r3, r1
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #748]
	bfi	r3, r0, #0, #8
	str	r3, [r9, #652]
	ldr	r0, [r4, #752]
	mov	r3, r1
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #756]
	bfi	r3, r0, #0, #10
	str	r3, [r9, #656]
	ldr	r0, [r4, #760]
	mov	r3, r1
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #764]
	bfi	r3, r0, #0, #8
	str	r3, [r9, #660]
	ldr	r0, [r4, #768]
	mov	r3, r1
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #772]
	bfi	r3, r0, #0, #10
	str	r3, [r9, #664]
	ldr	r0, [r4, #776]
	mov	r3, r1
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #780]
	bfi	r3, r0, #0, #8
	str	r3, [r9, #668]
	ldr	r0, [r4, #784]
	mov	r3, r5
	bfi	lr, r0, #12, #4
	ldr	r0, [r4, #788]
	bfi	lr, r0, #8, #4
	ldr	r0, [r4, #792]
	bfi	lr, r0, #4, #4
	ldr	r0, [r4, #796]
	bfi	lr, r0, #0, #4
	ldr	r0, [r4, #800]
	bfi	lr, r0, #28, #4
	ldr	r0, [r4, #804]
	bfi	lr, r0, #24, #4
	ldr	r0, [r4, #808]
	bfi	lr, r0, #20, #4
	ldr	r0, [r4, #812]
	bfi	lr, r0, #16, #4
	str	lr, [r9, #672]
	ldr	r0, [r4, #816]
	mov	lr, r5
	bfi	ip, r0, #12, #4
	ldr	r0, [r4, #820]
	bfi	ip, r0, #8, #4
	ldr	r0, [r4, #824]
	bfi	ip, r0, #4, #4
	ldr	r0, [r4, #828]
	bfi	ip, r0, #0, #4
	ldr	r0, [r4, #832]
	bfi	ip, r0, #28, #4
	ldr	r0, [r4, #836]
	bfi	ip, r0, #24, #4
	ldr	r0, [r4, #840]
	bfi	ip, r0, #20, #4
	ldr	r0, [r4, #844]
	bfi	ip, r0, #16, #4
	str	ip, [r9, #676]
	ldr	r0, [r4, #848]
	mov	ip, r6
	bfi	r1, r0, #12, #4
	ldr	r0, [r4, #852]
	bfi	r1, r0, #8, #4
	ldr	r0, [r4, #856]
	bfi	r1, r0, #4, #4
	ldr	r0, [r4, #860]
	bfi	r1, r0, #0, #4
	ldr	r0, [r4, #864]
	bfi	r1, r0, #28, #4
	ldr	r0, [r4, #868]
	bfi	r1, r0, #24, #4
	ldr	r0, [r4, #872]
	bfi	r1, r0, #20, #4
	ldr	r0, [r4, #876]
	bfi	r1, r0, #16, #4
	str	r1, [r9, #680]
	ldr	r1, [r4, #880]
	mov	r0, r6
	bfi	r2, r1, #12, #4
	ldr	r1, [r4, #884]
	bfi	r2, r1, #8, #4
	ldr	r1, [r4, #888]
	bfi	r2, r1, #4, #4
	ldr	r1, [r4, #892]
	bfi	r2, r1, #0, #4
	ldr	r1, [r4, #896]
	bfi	r2, r1, #28, #4
	ldr	r1, [r4, #900]
	bfi	r2, r1, #24, #4
	ldr	r1, [r4, #904]
	bfi	r2, r1, #20, #4
	ldr	r1, [r4, #908]
	bfi	r2, r1, #16, #4
	str	r2, [r9, #684]
	ldr	r2, [r4, #912]
	mov	r1, r6
	bfi	r3, r2, #12, #4
	ldr	r2, [r4, #916]
	bfi	r3, r2, #8, #4
	ldr	r2, [r4, #920]
	bfi	r3, r2, #4, #4
	ldr	r2, [r4, #924]
	bfi	r3, r2, #0, #4
	ldr	r2, [r4, #928]
	bfi	r3, r2, #28, #4
	ldr	r2, [r4, #932]
	bfi	r3, r2, #24, #4
	ldr	r2, [r4, #936]
	bfi	r3, r2, #20, #4
	ldr	r2, [r4, #940]
	bfi	r3, r2, #16, #4
	str	r3, [r9, #688]
	ldr	r3, [r4, #944]
	mov	r2, r6
	bfi	r10, r3, #12, #4
	ldr	r3, [r4, #948]
	bfi	r10, r3, #8, #4
	ldr	r3, [r4, #952]
	bfi	r10, r3, #4, #4
	ldr	r3, [r4, #956]
	bfi	r10, r3, #0, #4
	ldr	r3, [r4, #960]
	bfi	r10, r3, #28, #4
	ldr	r3, [r4, #964]
	bfi	r10, r3, #24, #4
	ldr	r3, [r4, #968]
	bfi	r10, r3, #20, #4
	ldr	r3, [r4, #972]
	bfi	r10, r3, #16, #4
	str	r10, [r9, #692]
	ldr	r3, [r4, #976]
	mov	r10, r6
	bfi	r8, r3, #12, #4
	ldr	r3, [r4, #980]
	bfi	r8, r3, #8, #4
	ldr	r3, [r4, #984]
	bfi	r8, r3, #4, #4
	ldr	r3, [r4, #988]
	bfi	r8, r3, #0, #4
	ldr	r3, [r4, #992]
	bfi	r8, r3, #28, #4
	ldr	r3, [r4, #996]
	bfi	r8, r3, #24, #4
	ldr	r3, [r4, #1000]
	bfi	r8, r3, #20, #4
	ldr	r3, [r4, #1004]
	bfi	r8, r3, #16, #4
	str	r8, [r9, #696]
	ldr	r3, [r4, #1008]
	mov	r8, r6
	bfi	r7, r3, #12, #4
	ldr	r3, [r4, #1012]
	bfi	r7, r3, #8, #4
	ldr	r3, [r4, #1016]
	bfi	r7, r3, #4, #4
	ldr	r3, [r4, #1020]
	bfi	r7, r3, #0, #4
	ldr	r3, [r4, #1024]
	bfi	r7, r3, #28, #4
	ldr	r3, [r4, #1028]
	bfi	r7, r3, #24, #4
	ldr	r3, [r4, #1032]
	bfi	r7, r3, #20, #4
	ldr	r3, [r4, #1036]
	bfi	r7, r3, #16, #4
	str	r7, [r9, #700]
	ldr	r3, [r4, #1040]
	mov	r7, r6
	bfi	r5, r3, #12, #4
	ldr	r3, [r4, #1044]
	bfi	r5, r3, #8, #4
	ldr	r3, [r4, #1048]
	bfi	r5, r3, #4, #4
	ldr	r3, [r4, #1052]
	bfi	r5, r3, #0, #4
	ldr	r3, [r4, #1056]
	bfi	r5, r3, #28, #4
	ldr	r3, [r4, #1060]
	bfi	r5, r3, #24, #4
	ldr	r3, [r4, #1064]
	bfi	r5, r3, #20, #4
	ldr	r3, [r4, #1068]
	bfi	r5, r3, #16, #4
	str	r5, [r9, #704]
	ldr	r3, [r4, #1072]
	mov	r5, r6
	bfi	r1, r3, #0, #3
	ldr	r3, [r4, #1076]
	bfi	r1, r3, #3, #7
	ldr	r3, [r4, #1080]
	bfi	r1, r3, #10, #3
	ldr	r3, [r4, #1084]
	bfi	r1, r3, #13, #5
	ldr	r3, [r4, #1088]
	bfi	r1, r3, #18, #4
	ldr	r3, [r4, #1092]
	bfi	r1, r3, #22, #4
	ldr	r3, [r4, #1096]
	bfi	r1, r3, #26, #4
	str	r1, [r9, #708]
	ldr	r3, [r4, #1100]
	mov	r1, r6
	bfi	r1, r3, #0, #3
	ldr	r3, [r4, #1104]
	bfi	r1, r3, #3, #7
	ldr	r3, [r4, #1108]
	bfi	r1, r3, #10, #3
	ldr	r3, [r4, #1112]
	bfi	r1, r3, #13, #5
	ldr	r3, [r4, #1116]
	bfi	r1, r3, #18, #4
	ldr	r3, [r4, #1120]
	bfi	r1, r3, #22, #4
	ldr	r3, [r4, #1124]
	bfi	r1, r3, #26, #4
	str	r1, [r9, #712]
	ldr	r3, [r4, #1128]
	mov	r1, r6
	bfi	r1, r3, #0, #3
	ldr	r3, [r4, #1132]
	bfi	r1, r3, #3, #7
	ldr	r3, [r4, #1136]
	bfi	r1, r3, #10, #3
	ldr	r3, [r4, #1140]
	bfi	r1, r3, #13, #5
	ldr	r3, [r4, #1144]
	bfi	r1, r3, #18, #4
	ldr	r3, [r4, #1148]
	bfi	r1, r3, #22, #4
	ldr	r3, [r4, #1152]
	bfi	r1, r3, #26, #4
	str	r1, [r9, #716]
	ldr	r3, [r4, #1428]
	mov	r1, r6
	bfi	r5, r3, #0, #3
	ldr	r3, [r4, #1432]
	bfi	r5, r3, #3, #7
	ldr	r3, [r4, #1436]
	bfi	r5, r3, #10, #3
	ldr	r3, [r4, #1440]
	bfi	r5, r3, #13, #5
	ldr	r3, [r4, #1444]
	bfi	r5, r3, #18, #4
	ldr	r3, [r4, #1448]
	bfi	r5, r3, #22, #4
	ldr	r3, [r4, #1452]
	bfi	r5, r3, #26, #4
	str	r5, [r9, #720]
	ldr	r3, [r4, #1456]
	mov	r5, r6
	bfi	r5, r3, #0, #3
	ldr	r3, [r4, #1460]
	bfi	r5, r3, #3, #7
	ldr	r3, [r4, #1464]
	bfi	r5, r3, #10, #3
	ldr	r3, [r4, #1468]
	bfi	r5, r3, #13, #5
	ldr	r3, [r4, #1472]
	bfi	r5, r3, #18, #4
	ldr	r3, [r4, #1476]
	bfi	r5, r3, #22, #4
	ldr	r3, [r4, #1480]
	bfi	r5, r3, #26, #4
	str	r5, [r9, #724]
	ldr	r5, [r4, #1484]
	mov	r3, r6
	bfi	r7, r5, #0, #3
	ldr	r5, [r4, #1488]
	bfi	r7, r5, #3, #7
	ldr	r5, [r4, #1492]
	bfi	r7, r5, #10, #3
	ldr	r5, [r4, #1496]
	bfi	r7, r5, #13, #5
	ldr	r5, [r4, #1500]
	bfi	r7, r5, #18, #4
	ldr	r5, [r4, #1504]
	bfi	r7, r5, #22, #4
	ldr	r5, [r4, #1508]
	bfi	r7, r5, #26, #4
	str	r7, [r9, #728]
	ldr	r5, [r4, #1512]
	mov	r7, r6
	bfi	r7, r5, #0, #3
	ldr	r5, [r4, #1516]
	bfi	r7, r5, #3, #7
	ldr	r5, [r4, #1520]
	bfi	r7, r5, #10, #3
	ldr	r5, [r4, #1524]
	bfi	r7, r5, #13, #5
	ldr	r5, [r4, #1528]
	bfi	r7, r5, #18, #4
	ldr	r5, [r4, #1532]
	bfi	r7, r5, #22, #4
	ldr	r5, [r4, #1536]
	bfi	r7, r5, #26, #4
	str	r7, [r9, #732]
	ldr	r5, [r4, #1156]
	mov	r7, lr
	bfi	r6, r5, #0, #4
	ldr	r5, [r4, #1160]
	bfi	r6, r5, #4, #4
	ldr	r5, [r4, #1164]
	bfi	r6, r5, #8, #4
	ldr	r5, [r4, #1168]
	bfi	r6, r5, #12, #4
	ldr	r5, [r4, #1172]
	bfi	r6, r5, #16, #4
	ldr	r5, [r4, #1176]
	bfi	r6, r5, #20, #4
	ldr	r5, [r4, #1180]
	bfi	r6, r5, #24, #4
	ldr	r5, [r4, #1184]
	bfi	r6, r5, #28, #4
	str	r6, [r9, #736]
	ldr	r5, [r4, #1188]
	mov	r6, lr
	bfi	r6, r5, #0, #4
	ldr	r5, [r4, #1192]
	bfi	r6, r5, #4, #4
	ldr	r5, [r4, #1196]
	bfi	r6, r5, #8, #4
	ldr	r5, [r4, #1200]
	bfi	r6, r5, #12, #4
	ldr	r5, [r4, #1204]
	bfi	r6, r5, #16, #4
	ldr	r5, [r4, #1208]
	bfi	r6, r5, #20, #4
	str	r6, [r9, #740]
	ldr	r5, [r4, #1212]
	mov	r6, lr
	bfi	lr, r5, #0, #10
	ldr	r5, [r4, #1216]
	bfi	lr, r5, #16, #5
	str	lr, [r9, #744]
	ldr	lr, [r4, #1220]
	mov	r5, r2
	bfi	r2, lr, #0, #8
	ldr	lr, [r4, #1224]
	bfi	r2, lr, #16, #5
	str	r2, [r9, #748]
	ldr	r2, [r4, #1228]
	mov	lr, ip
	bfi	ip, r2, #0, #10
	ldr	r2, [r4, #1232]
	bfi	ip, r2, #16, #5
	str	ip, [r9, #752]
	ldr	r2, [r4, #1236]
	mov	ip, r0
	bfi	r0, r2, #0, #8
	ldr	r2, [r4, #1240]
	bfi	r0, r2, #16, #5
	str	r0, [r9, #756]
	ldr	r2, [r4, #1244]
	mov	r0, r1
	bfi	r1, r2, #0, #10
	ldr	r2, [r4, #1248]
	bfi	r1, r2, #16, #5
	str	r1, [r9, #760]
	ldr	r2, [r4, #1252]
	mov	r1, r8
	bfi	r6, r2, #0, #8
	ldr	r2, [r4, #1256]
	bfi	r6, r2, #16, #5
	str	r6, [r9, #764]
	ldr	r6, [r4, #1540]
	mov	r2, r8
	bfi	r3, r6, #0, #4
	ldr	r6, [r4, #1544]
	bfi	r3, r6, #4, #4
	ldr	r6, [r4, #1548]
	bfi	r3, r6, #8, #4
	ldr	r6, [r4, #1552]
	bfi	r3, r6, #12, #4
	ldr	r6, [r4, #1556]
	bfi	r3, r6, #16, #4
	ldr	r6, [r4, #1560]
	bfi	r3, r6, #20, #4
	str	r3, [r9, #768]
	ldr	r6, [r4, #1564]
	mov	r3, r8
	bfi	r10, r6, #0, #12
	ldr	r6, [r4, #1568]
	bfi	r10, r6, #12, #12
	ldr	r6, [r4, #1572]
	bfi	r10, r6, #24, #8
	str	r10, [r9, #772]
	ldr	r6, [r4, #1576]
	mov	r10, r8
	bfc	r10, #14, #1
	bfi	r8, r6, #0, #12
	ldr	r6, [r4, #1580]
	bfc	r10, #15, #1
	bfi	r8, r6, #12, #12
	ldr	r6, [r4, #1584]
	bfi	r8, r6, #24, #8
	str	r8, [r9, #776]
	ldr	r6, [r4, #1588]
	mov	r8, r7
	bfc	r8, #0, #8
	bfi	r7, r6, #0, #12
	ldr	r6, [r4, #1592]
	orr	r8, r8, #65280
	bfi	r7, r6, #12, #12
	ldr	r6, [r4, #1596]
	movt	r8, 65280
	bfi	r7, r6, #24, #8
	str	r7, [r9, #780]
	ldr	r7, [r4, #1600]
	mov	r6, r5
	bfi	r6, r7, #0, #8
	ldr	r7, [r4, #1604]
	bfi	r6, r7, #8, #8
	ldr	r7, [r4, #1608]
	bfi	r6, r7, #16, #8
	str	r6, [r9, #784]
	ldr	r6, [r4, #1260]
	mov	r7, r5
	bfi	r5, r6, #0, #1
	ldr	r6, [r4, #1264]
	bfi	r5, r6, #1, #3
	ldr	r6, [r4, #1268]
	bfi	r5, r6, #4, #6
	ldr	r6, [r4, #1272]
	bfi	r5, r6, #10, #5
	ldr	r6, [r4, #1276]
	bfi	r5, r6, #15, #6
	ldr	r6, [r4, #1280]
	bfi	r5, r6, #21, #5
	str	r5, [r9, #788]
	ldr	r5, [r4, #1284]
	mov	r6, lr
	bfi	lr, r5, #0, #1
	ldr	r5, [r4, #1288]
	bfi	lr, r5, #1, #3
	ldr	r5, [r4, #1292]
	bfi	lr, r5, #4, #6
	ldr	r5, [r4, #1296]
	bfi	lr, r5, #10, #5
	ldr	r5, [r4, #1300]
	bfi	lr, r5, #15, #6
	ldr	r5, [r4, #1304]
	bfi	lr, r5, #21, #5
	str	lr, [r9, #792]
	ldr	r5, [r4, #1308]
	mov	lr, ip
	bfi	ip, r5, #0, #1
	ldr	r5, [r4, #1312]
	bfi	ip, r5, #1, #3
	ldr	r5, [r4, #1316]
	bfi	ip, r5, #4, #6
	ldr	r5, [r4, #1320]
	bfi	ip, r5, #10, #5
	ldr	r5, [r4, #1324]
	bfi	ip, r5, #15, #6
	ldr	r5, [r4, #1328]
	bfi	ip, r5, #21, #5
	str	ip, [r9, #796]
	ldr	r5, [r4, #1332]
	mov	ip, r0
	bfi	r0, r5, #0, #1
	ldr	r5, [r4, #1336]
	bfi	r0, r5, #1, #3
	ldr	r5, [r4, #1340]
	bfi	r0, r5, #4, #6
	ldr	r5, [r4, #1344]
	bfi	r0, r5, #10, #5
	ldr	r5, [r4, #1348]
	bfi	r0, r5, #15, #6
	ldr	r5, [r4, #1352]
	bfi	r0, r5, #21, #5
	str	r0, [r9, #800]
	ldr	r5, [r4, #1356]
	mov	r0, r1
	bfi	r1, r5, #0, #1
	ldr	r5, [r4, #1360]
	bfi	r1, r5, #1, #3
	ldr	r5, [r4, #1364]
	bfi	r1, r5, #4, #6
	ldr	r5, [r4, #1368]
	bfi	r1, r5, #10, #5
	ldr	r5, [r4, #1372]
	bfi	r1, r5, #15, #6
	ldr	r5, [r4, #1376]
	bfi	r1, r5, #21, #5
	str	r1, [r9, #804]
	ldr	r5, [r4, #1380]
	mov	r1, r2
	bfi	r2, r5, #0, #1
	ldr	r5, [r4, #1384]
	bfi	r2, r5, #1, #3
	ldr	r5, [r4, #1388]
	bfi	r2, r5, #4, #6
	ldr	r5, [r4, #1392]
	bfi	r2, r5, #10, #5
	ldr	r5, [r4, #1396]
	bfi	r2, r5, #15, #6
	ldr	r5, [r4, #1400]
	bfi	r2, r5, #21, #5
	str	r2, [r9, #808]
	ldr	r2, [r4, #1404]
	mov	r5, r7
	bfi	r3, r2, #0, #1
	ldr	r2, [r4, #1408]
	bfi	r3, r2, #1, #3
	ldr	r2, [r4, #1412]
	bfi	r3, r2, #4, #6
	ldr	r2, [r4, #1416]
	bfi	r3, r2, #10, #5
	ldr	r2, [r4, #1420]
	bfi	r3, r2, #15, #6
	ldr	r2, [r4, #1424]
	bfi	r3, r2, #21, #5
	ldr	r2, [fp, #-48]
	str	r3, [r9, #812]
	ldr	r3, [r4, #408]
	bfi	r10, r3, #20, #8
	ldr	r3, [r2, #68]
	mov	r2, r7
	bfi	r10, r3, #28, #1
	str	r10, [r9, #1024]
	str	r8, [r9, #1120]
	mov	r8, r7
	ldr	r3, [r4, #2392]
	bfi	r8, r3, #0, #1
	str	r8, [r9, #1536]
	ldr	r3, [r4, #2396]
	mov	r8, r7
	bfi	r7, r3, #0, #16
	str	r7, [r9, #1540]
	ldr	r3, [r4, #2400]
	mov	r7, r6
	bfi	r6, r3, #0, #16
	str	r6, [r9, #1544]
	ldr	r3, [r4, #2404]
	mov	r6, lr
	bfi	lr, r3, #0, #16
	str	lr, [r9, #1548]
	ldr	lr, [r4, #2408]
	mov	r3, ip
	bfi	ip, lr, #18, #9
	ldr	lr, [r4, #2412]
	bfi	ip, lr, #9, #9
	ldr	lr, [r4, #2416]
	bfi	ip, lr, #0, #9
	str	ip, [r9, #1556]
	ldr	ip, [r4, #2420]
	ldr	lr, [r4, #2424]
	bfi	r0, ip, #16, #8
	ldr	ip, [r4, #2428]
	bfi	r0, lr, #8, #8
	bfi	r0, ip, #0, #8
	str	r0, [r9, #1560]
	ldr	r0, [r4, #2432]
	ldr	ip, [r4, #2436]
	bfi	r1, r0, #8, #4
	ldr	r0, [r4, #2440]
	bfi	r1, ip, #4, #4
	bfi	r1, r0, #0, #4
	mov	r0, #3
	bfi	r1, r0, #20, #8
	mov	r0, #20
	bfi	r1, r0, #12, #8
	str	r1, [r9, #1564]
	ldr	r1, [r4, #2572]
	bfi	r5, r1, #0, #16
	bfc	r5, #16, #8
	bfc	r5, #24, #8
	str	r5, [r9, #1568]
	ldr	r0, [r4, #2588]
	ldr	r1, [r4, #2584]
	bfi	r2, r0, #0, #8
	ldr	r0, [r4, #2580]
	bfi	r2, r1, #8, #8
	ldr	r1, [r4, #2576]
	bfi	r2, r0, #16, #8
	bfi	r2, r1, #24, #8
	str	r2, [r9, #1572]
	ldr	r1, [r4, #2448]
	ldr	r2, [r4, #2452]
	bfi	r8, r1, #24, #8
	ldr	r1, [r4, #2456]
	bfi	r8, r2, #16, #8
	ldr	r2, [r4, #2460]
	bfi	r8, r1, #8, #8
	bfi	r8, r2, #0, #8
	str	r8, [r9, #1584]
	ldr	r1, [r4, #2464]
	ldr	r2, [r4, #2468]
	bfi	r7, r1, #0, #8
	ldr	r1, [r4, #2472]
	bfi	r7, r2, #8, #8
	ldr	r2, [r4, #2616]
	bfi	r7, r1, #16, #1
	bfi	r7, r2, #17, #1
	str	r7, [r9, #1588]
	ldr	r1, [r4, #2476]
	ldr	r2, [r4, #2480]
	bfi	r6, r1, #0, #16
	bfi	r6, r2, #16, #16
	str	r6, [r9, #1592]
	ldr	r2, [r4, #2484]
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #2488]
	bfi	r3, r2, #22, #9
	cmp	r0, #0
	ldr	r2, [r4, #2492]
	bfi	r3, r1, #17, #5
	bfi	r3, r2, #9, #8
	ldrne	r2, [r4, #2444]
	moveq	r2, #32
	bfi	r3, r2, #0, #9
	str	r3, [r9, #1596]
	ldr	ip, [r4, #2496]
	mov	r3, #0
	ldr	r0, [r4, #2500]
	mov	r1, r3
	mov	r2, r3
	bfi	r3, ip, #8, #14
	bfi	r3, r0, #0, #8
	str	r3, [r9, #1732]
	ldr	r0, [r4, #2504]
	mov	r8, r1
	ldr	ip, [r4, #2508]
	mov	r3, r1
	mov	lr, r1
	bfi	r1, r0, #16, #8
	ldr	r0, [r4, #2512]
	bfi	r1, ip, #8, #8
	mov	r7, r2
	mov	ip, r2
	bfi	r1, r0, #0, #8
	str	r1, [r9, #1736]
	ldr	r5, [r4, #2520]
	mov	r0, r2
	ldr	r1, [r4, #2524]
	mov	r6, r8
	bfi	r2, r5, #17, #1
	ldr	r5, [r4, #2528]
	bfi	r2, r1, #12, #2
	ldr	r1, [r4, #2532]
	bfi	r2, r5, #4, #4
	mov	r5, r8
	bfi	r2, r1, #0, #4
	str	r2, [r9, #1740]
	ldr	r2, [r4, #2536]
	mov	r1, r8
	ldr	r10, [r4, #2540]
	bfi	r8, r2, #0, #10
	mov	r2, r3
	bfi	r8, r10, #16, #9
	str	r8, [r9, #1744]
	ldr	r10, [r4, #2544]
	mov	r8, #1
	bfi	r3, r10, #0, #10
	ldr	r10, [r4, #2548]
	bfi	r3, r10, #16, #9
	str	r3, [r9, #1748]
	mov	r3, lr
	ldr	r10, [r4, #2552]
	bfi	r3, r8, #0, #8
	bfi	r3, r8, #8, #8
	ldr	r8, [r4, #2556]
	bfi	lr, r10, #0, #10
	bfi	lr, r8, #16, #9
	str	lr, [r9, #1752]
	ldr	r10, [r4, #2560]
	mov	lr, ip
	ldr	r8, [r4, #2564]
	movt	r3, 200
	bfi	ip, r10, #0, #10
	bfi	ip, r8, #16, #9
	str	ip, [r9, #1756]
	ldr	ip, [r4, #2568]
	bfi	r7, ip, #0, #16
	str	r7, [r9, #1776]
	ldr	r7, [r4, #2592]
	ldr	ip, [r4, #2596]
	bfi	r0, r7, #0, #13
	bfi	r0, ip, #13, #1
	str	r0, [r9, #1780]
	ldr	r0, [r4, #2600]
	bfi	r6, r0, #0, #18
	str	r6, [r9, #1784]
	ldr	r0, [r4, #2604]
	bfi	r5, r0, #0, #18
	str	r5, [r9, #1788]
	ldr	ip, [r4, #2628]
	ldr	r0, [r4, #2632]
	bfi	r1, ip, #16, #7
	bfi	r1, r0, #23, #7
	str	r1, [r9, #1792]
	ldr	r1, [r4, #2620]
	ldr	r0, [r4, #2624]
	bfi	r2, r1, #0, #8
	ldr	r1, [r4, #2608]
	bfi	r2, r0, #8, #8
	bfi	r2, r1, #16, #8
	str	r2, [r9, #1796]
	ldr	r2, [r4, #2612]
	ldr	r1, [r4, #2636]
	bfi	lr, r2, #12, #8
	ldr	r2, [r4, #2640]
	bfi	lr, r1, #8, #4
	bfi	lr, r2, #0, #8
	str	lr, [r9, #1800]
	str	r3, [r9, #1804]
	ldr	r2, [r4, #24]
	cmp	r2, #0
	bne	.L45
	mov	r0, #23
	mov	r3, #0
	bfi	r3, r0, #0, #5
	mov	r1, #15
	bfi	r3, r1, #5, #5
	bfi	r3, r0, #10, #5
	bfi	r3, r1, #15, #5
	bfi	r3, r2, #20, #1
	str	r3, [r9, #2052]
.L46:
	ldr	r7, [fp, #-48]
	mov	r1, #16
	mov	r3, #0
	mov	r2, #0
	bfc	r3, #16, #16
	bfi	r2, r1, #6, #6
	bfc	r3, #0, #16
	mov	r0, #2
	mov	r1, #10
	str	r0, [r9, #2560]
	bfi	r2, r1, #0, #6
	str	r3, [r9, #2592]
	str	r2, [r9, #2596]
	mov	r3, #0
	ldr	r2, [r7, #8]
	ldr	r0, [r7, #4]
	bfi	r3, r2, #8, #6
	ldr	r1, [r4, #1808]
	orr	r3, r3, #64
	ldr	r2, [r4, #1776]
	bfi	r3, r0, #0, #6
	bfi	r3, r1, #16, #6
	bfi	r3, r2, #24, #4
	str	r3, [r9, #3076]
	ldr	r3, [r4, #24]
	ldr	r0, [r7, #12]
	cmp	r3, #0
	sub	r0, r0, #1
	moveq	r5, #16
	movne	r5, #64
	mov	r1, r5
	add	r0, r0, r5
	bl	__aeabi_uidiv
	ldr	r3, [r7, #16]
	mov	r1, r5
	mov	r6, r0
	sub	r0, r3, #1
	add	r0, r0, r5
	bl	__aeabi_uidiv
	mul	r1, r6, r0
	ldr	r0, [r7, #172]
	bl	__aeabi_uidiv
	ldr	r2, [r4, #1796]
	mov	r3, #0
	bfi	r3, r0, #0, #16
	mov	r0, #0
	bfi	r3, r2, #16, #6
	str	r3, [r9, #3080]
	ldr	r3, [r4, #24]
	mov	r1, r0
	ldr	ip, [r4, #1788]
	cmp	r3, #0
	ldrne	r2, [r4, #1832]
	moveq	r2, #4
	movne	r3, #0
	bfi	r3, r2, #0, #6
	ldr	r2, [r4, #1792]
	bfi	r3, ip, #24, #6
	ldr	ip, [r4, #1800]
	bfi	r3, r2, #16, #6
	mov	r2, r0
	bfi	r3, ip, #8, #6
	str	r3, [r9, #3084]
	ldr	lr, [r4, #1644]
	mov	r3, r0
	ldr	r5, [r4, #1640]
	mov	ip, r0
	bfi	r0, lr, #24, #8
	ldr	lr, [r4, #1636]
	bfi	r0, r5, #16, #8
	ldr	r5, [r4, #1632]
	bfi	r0, lr, #8, #8
	mov	lr, r1
	bfi	r0, r5, #0, #8
	str	r0, [r9, #3088]
	ldr	r6, [r4, #1660]
	mov	r0, r1
	ldr	r5, [r4, #1656]
	bfi	r1, r6, #24, #8
	ldr	r6, [r4, #1652]
	bfi	r1, r5, #16, #8
	ldr	r5, [r4, #1648]
	bfi	r1, r6, #8, #8
	bfi	r1, r5, #0, #8
	str	r1, [r9, #3092]
	ldr	r5, [r4, #1676]
	ldr	r1, [r4, #1672]
	bfi	r2, r5, #24, #8
	ldr	r5, [r4, #1668]
	bfi	r2, r1, #16, #8
	ldr	r1, [r4, #1664]
	bfi	r2, r5, #8, #8
	bfi	r2, r1, #0, #8
	str	r2, [r9, #3096]
	ldr	r1, [r4, #1692]
	ldr	r2, [r4, #1688]
	bfi	r3, r1, #24, #8
	ldr	r1, [r4, #1684]
	bfi	r3, r2, #16, #8
	ldr	r2, [r4, #1680]
	bfi	r3, r1, #8, #8
	bfi	r3, r2, #0, #8
	str	r3, [r9, #3072]
	ldr	r2, [r4, #1824]
	ldr	r3, [r4, #1828]
	bfi	ip, r2, #0, #4
	bfi	ip, r3, #4, #4
	str	ip, [r9, #3100]
	ldr	r3, [r4, #1768]
	bfi	lr, r3, #0, #4
	str	lr, [r9, #3104]
	ldr	r2, [r4, #1764]
	ldr	r3, [r4, #1772]
	bfi	r0, r2, #0, #4
	bfi	r0, r3, #4, #4
	str	r0, [r9, #3108]
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ldrne	r2, [r4, #1780]
	moveq	r2, #3
	movne	r3, #0
	bfi	r3, r2, #0, #4
	str	r3, [r9, #3112]
	ldr	r3, [r4, #1696]
	mov	r2, #0
	ldr	r0, [r4, #1700]
	mov	ip, r2
	mov	r1, r2
	bfi	r2, r3, #0, #2
	ldr	r3, [r4, #1704]
	bfi	r2, r0, #2, #2
	ldr	r0, [r4, #1708]
	bfi	r2, r3, #4, #2
	ldr	r3, [r4, #1712]
	bfi	r2, r0, #6, #2
	ldr	r0, [r4, #1716]
	bfi	r2, r3, #8, #2
	ldr	r3, [r4, #1720]
	bfi	r2, r0, #10, #2
	ldr	r0, [r4, #1724]
	bfi	r2, r3, #12, #2
	ldr	r3, [r4, #1728]
	bfi	r2, r0, #14, #2
	ldr	r0, [r4, #1732]
	bfi	r2, r3, #16, #2
	ldr	r3, [r4, #1736]
	bfi	r2, r0, #18, #2
	ldr	r0, [r4, #1740]
	bfi	r2, r3, #20, #2
	ldr	r3, [r4, #1744]
	bfi	r2, r0, #22, #2
	ldr	r0, [r4, #1748]
	bfi	r2, r3, #24, #2
	ldr	r3, [r4, #1752]
	bfi	r2, r0, #26, #2
	ldr	r0, [r4, #1756]
	bfi	r2, r3, #28, #2
	add	r3, r4, #1824
	bfi	r2, r0, #30, #2
	str	r2, [r9, #3116]
	ldr	r2, [r4, #1760]
	add	r0, r4, #2144
	add	r3, r3, #8
	add	r0, r0, #8
	bfi	ip, r2, #0, #5
	str	ip, [r9, #3120]
	ldr	ip, [r4, #1812]
	add	r2, r9, #3152
	ldr	lr, [r4, #1816]
	bfi	r1, ip, #24, #4
	ldr	ip, [r4, #1820]
	bfi	r1, lr, #28, #4
	ldr	lr, [r4, #1784]
	bfi	r1, ip, #16, #6
	ldr	ip, [r4, #1804]
	bfi	r1, lr, #8, #4
	bfi	r1, ip, #0, #6
	str	r1, [r9, #3124]
.L52:
	ldr	r1, [r3, #4]!
	add	r2, r2, #4
	cmp	r3, r0
	str	r1, [r2, #-4]
	bne	.L52
	add	r3, r9, #4096
	mov	r6, #0
	mov	r0, r6
	mov	r2, r6
	bfi	r0, r6, #0, #16
	bfi	r2, r6, #0, #16
	mov	r1, r6
	bfi	r1, r6, #16, #16
	str	r6, [r9, #3660]
	bfi	r0, r6, #16, #16
	bfi	r2, r6, #16, #16
	bfi	r1, r6, #0, #16
	mov	lr, r6
	mov	ip, r6
	bfi	lr, r6, #0, #1
	bfi	ip, r6, #0, #1
	str	lr, [r3, #512]
	mov	lr, #13
	str	ip, [r3, #516]
	mov	ip, r6
	str	r6, [r3, #520]
	bfi	ip, lr, #0, #4
	str	ip, [r3, #524]
	mvn	ip, #0
	str	r6, [r3, #528]
	mov	r10, r6
	str	r0, [r3, #532]
	mov	r7, r6
	str	r2, [r3, #536]
	mov	r2, #7
	str	r1, [r3, #540]
	mov	r8, r6
	str	ip, [r3, #544]
	mov	lr, r6
	str	r2, [r3, #548]
	mov	r0, r4
	str	ip, [r3, #552]
	add	r5, r9, #8192
	str	r2, [r3, #556]
	str	ip, [r3, #560]
	str	r2, [r3, #564]
	str	ip, [r3, #568]
	str	r2, [r3, #572]
	ldr	r2, [r4, #2364]
	ldr	r1, [fp, #-48]
	bfi	r10, r2, #0, #1
	str	r10, [r3, #1212]
	ldr	r2, [r4, #2368]
	str	r2, [r3, #1188]
	ldr	r2, [r4, #2372]
	str	r2, [r3, #1192]
	ldr	r2, [r4, #2376]
	str	r2, [r3, #1196]
	ldr	r2, [r4, #2380]
	str	r2, [r3, #1200]
	ldr	r2, [r4, #2384]
	str	r2, [r3, #1204]
	ldr	r2, [r4, #2388]
	str	r2, [r3, #1208]
	ldr	ip, [r4, #1612]
	ldr	r2, [r4, #1616]
	bfi	r7, ip, #0, #16
	bfi	r7, r2, #16, #16
	str	r7, [r3, #1668]
	ldr	r2, [r4, #1628]
	bfi	r8, r2, #16, #16
	str	r8, [r3, #1672]
	ldr	ip, [r4, #1620]
	ldr	r2, [r4, #1624]
	bfi	lr, ip, #0, #16
	bfi	lr, r2, #16, #16
	str	lr, [r3, #1676]
	bl	VENC_HAL_VEDU_Cfg_CABAC_VLC
	ldr	r1, [r4, #48]
	mov	r2, r6
	mov	r3, r6
	bfi	r3, r6, #16, #8
	mov	ip, #0
	str	r1, [r5, #1028]
	mov	r0, #0
	ldr	r1, [r4, #428]
	bfi	r2, r1, #0, #1
	str	r2, [r5, #1040]
	ldr	r2, [r4, #436]
	mov	r1, r0
	str	r2, [r5, #1044]
	ldr	r2, [fp, #-48]
	ldr	r2, [r2, #44]
	cmp	r2, r6
	mov	r6, r0
	bfieq	r3, r2, #0, #1
	orrne	r3, r3, #1
	str	r3, [r5, #1048]
	mvn	r2, #84
	ldr	r3, [r4, #268]
	bfi	ip, r2, #0, #8
	mov	r2, #85
	bfi	ip, r2, #8, #8
	mov	r2, r0
	str	r3, [r5, #1052]
	mov	r3, r0
	str	r0, [r5, #1056]
	str	r0, [r5, #1060]
	str	r0, [r5, #1064]
	str	ip, [r5, #1536]
	ldr	ip, [r4, #2156]
	ldr	lr, [r4, #2160]
	bfi	r1, ip, #0, #6
	ldr	ip, [r4, #2164]
	bfi	r1, lr, #8, #2
	ldr	lr, [r4, #2168]
	bfi	r1, ip, #10, #1
	ldr	ip, [r4, #2172]
	bfi	r1, lr, #12, #4
	bfi	r1, ip, #16, #5
	str	r1, [r5, #4048]
	ldr	r1, [r4, #2228]
	str	r1, [r5, #4052]
	ldr	r1, [r4, #2232]
	str	r1, [r5, #4056]
	ldr	ip, [r4, #2236]
	ldr	r1, [r4, #2240]
	bfi	r3, ip, #0, #16
	ldr	ip, [r4, #2244]
	bfi	r3, r1, #16, #2
	ldr	r1, [r4, #2248]
	bfi	r3, ip, #18, #2
	ldr	ip, [r4, #2252]
	bfi	r3, r1, #20, #4
	ldr	r1, [r4, #2260]
	bfi	r3, ip, #24, #1
	ldr	ip, [r4, #2264]
	bfi	r3, r1, #25, #2
	ldr	r1, [r4, #2256]
	bfi	r3, ip, #27, #1
	bfi	r3, r1, #28, #1
	str	r3, [r5, #4060]
	ldr	r1, [r4, #2296]
	ldr	r3, [r4, #2292]
	bfi	r2, r1, #0, #1
	ldr	r1, [r4, #2288]
	bfi	r2, r3, #2, #2
	ldr	r3, [r4, #2284]
	bfi	r2, r1, #4, #2
	ldr	r1, [r4, #2304]
	bfi	r2, r3, #6, #1
	ldr	r3, [r4, #2308]
	bfi	r2, r1, #8, #6
	bfi	r2, r3, #24, #6
	str	r2, [r5, #4064]
	ldr	r2, [r4, #2312]
	ldr	r3, [r4, #2316]
	bfi	r0, r2, #0, #6
	ldr	r2, [r4, #2320]
	bfi	r0, r3, #8, #6
	ldr	r3, [r4, #2324]
	bfi	r0, r2, #16, #6
	bfi	r0, r3, #24, #6
	str	r0, [r5, #4068]
	ldr	r2, [r4, #2328]
	ldr	r1, [r4, #24]
	ldr	r3, [r4, #2332]
	cmp	r1, r6
	bfi	r6, r2, #0, #6
	bfi	r6, r3, #6, #25
	ldr	r3, [fp, #-48]
	ldr	r1, [r3, #16]
	ldr	r0, [r3, #172]
	moveq	r1, r1, lsr #4
	movne	r1, r1, lsr #6
	bl	__aeabi_uidiv
	mov	r3, #0
	mov	r2, r3
	mov	r1, r3
	bfi	r6, r0, #6, #25
	str	r6, [r5, #4072]
	ldr	ip, [r4, #328]
	ldr	r0, [r4, #344]
	bfi	r3, ip, #10, #1
	ldr	ip, [r4, #324]
	bfi	r3, r0, #9, #1
	ldr	r0, [r4, #348]
	bfi	r3, ip, #8, #1
	ldr	ip, [r4, #352]
	bfi	r3, r0, #7, #1
	ldr	r0, [r4, #336]
	bfi	r3, ip, #6, #1
	ldr	ip, [r4, #332]
	bfi	r3, r0, #5, #1
	ldr	r0, [r4, #356]
	bfi	r3, ip, #4, #1
	ldr	ip, [r4, #360]
	bfi	r3, r0, #3, #1
	ldr	r0, [r4, #364]
	bfi	r3, ip, #2, #1
	ldr	ip, [r4, #368]
	bfi	r3, r0, #1, #1
	add	r0, r9, #61440
	bfi	r3, ip, #0, #1
	str	r3, [r9, #504]
	ldr	lr, [r4, #340]
	mov	r3, r2
	ldr	ip, [r4, #372]
	bfi	r3, r2, #1, #1
	bfi	r2, lr, #7, #1
	ldr	lr, [r4, #376]
	bfi	r2, ip, #6, #1
	ldr	ip, [r4, #380]
	bfi	r2, lr, #5, #1
	ldr	lr, [r4, #384]
	bfi	r2, ip, #4, #1
	ldr	ip, [r4, #388]
	bfi	r2, lr, #3, #1
	ldr	lr, [r4, #392]
	bfi	r2, ip, #2, #1
	ldr	ip, [r4, #396]
	bfi	r2, lr, #1, #1
	bfc	r3, #2, #1
	bfi	r2, ip, #0, #1
	str	r2, [r9, #508]
	ldr	r2, [r4, #400]
	mov	lr, #3
	ldr	ip, [r4, #404]
	bfc	r3, #3, #1
	bfi	r1, r2, #0, #1
	mov	r2, #0
	bfi	r1, ip, #3, #1
	mov	ip, #1
	bfi	r1, lr, #16, #4
	str	r1, [r0]
	str	r3, [r0, #32]
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #2644]
	add	r3, r3, #61440
	str	r1, [r3, #520]
	ldr	r1, [r4, #2644]
	str	r1, [r3, #524]
	ldr	r1, [r4, #2652]
	str	r1, [r3, #752]
	ldr	r1, [r4, #2648]
	str	r1, [r3, #756]
	ldr	r1, [r4, #2652]
	str	r1, [r3, #772]
	ldr	r1, [r4, #2648]
	str	r1, [r3, #776]
	str	r2, [r0, #8]
	str	r2, [r9, #16]
	str	ip, [r9, #16]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L45:
	mov	r2, #15
	mov	r3, #0
	bfi	r3, r2, #0, #5
	bfi	r3, r2, #5, #5
	bfi	r3, r2, #10, #5
	bfi	r3, r2, #15, #5
	bfc	r3, #20, #1
	str	r3, [r9, #2052]
	b	.L46
.L61:
	mov	r1, #6
.L39:
	bfi	r3, r1, #6, #4
	bfc	r3, #14, #1
.L40:
	ldrb	r2, [r4, #64]
	b	.L41
.L66:
	ldr	r2, [r8, #16]
	ldr	r3, [r8, #12]
	mov	r2, r2, lsr #2
	sub	r2, r2, #16
	mov	r3, r3, lsr #2
	sub	r3, r3, #16
	mov	r2, r2, lsr #1
	cmp	r2, #32
	mov	r3, r3, lsr #1
	movcs	r2, #32
	cmp	r3, #72
	bic	r2, r2, #-2147483645
	movcs	r3, #72
	cmp	r2, #7
	bic	r3, r3, #-2147483645
	movls	r2, #7
	bls	.L36
	cmp	r2, #32
	movcs	r2, #32
	sub	r2, r2, #1
	and	r2, r2, #63
.L36:
	cmp	r3, #7
	movls	r3, #7
	bls	.L37
	cmp	r3, #72
	movcs	r3, #72
	sub	r3, r3, #1
	and	r3, r3, #127
.L37:
	mov	ip, #0
	bfi	ip, r2, #16, #6
	bfi	ip, r3, #0, #7
	b	.L38
	UNWIND(.fnend)
	.size	VENC_HAL_CfgReg, .-VENC_HAL_CfgReg
	.align	2
	.global	VENC_HAL_VEDU_DDRCfg_CABAC_VLC
	.type	VENC_HAL_VEDU_DDRCfg_CABAC_VLC, %function
VENC_HAL_VEDU_DDRCfg_CABAC_VLC:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r2, [r0, #24]
	ldr	r3, [r0, #4]
	cmp	r2, #4
	beq	.L84
	ldr	r2, [r0, #292]
	mov	r1, #0
	mov	ip, r1
	bfc	ip, #0, #1
	str	r2, [r3, #256]
	ldr	r2, [r0, #296]
	str	r2, [r3, #260]
	ldr	r2, [r0, #300]
	str	r2, [r3, #264]
	ldr	r2, [r0, #304]
	str	r2, [r3, #268]
	ldr	r2, [r0, #308]
	str	r2, [r3, #272]
	ldr	r2, [r0, #312]
	str	r2, [r3, #276]
	ldr	r2, [r0, #316]
	str	r2, [r3, #280]
	ldr	r2, [r0, #320]
	str	r2, [r3, #284]
	ldr	r2, [r0, #140]
	str	ip, [r3, #292]
	sub	lr, r2, #1
	mov	ip, r2, lsr #8
	bfi	r1, lr, #16, #7
	sub	ip, ip, #1
	mov	r2, r2, lsr #16
	sub	r2, r2, #1
	bfi	r1, ip, #8, #6
	bfi	r1, r2, #0, #6
	str	r1, [r3, #288]
	ldr	r2, [r0, #24]
	cmp	r2, #4
	beq	.L85
.L77:
	ldr	r2, [r0, #148]
	mov	r1, #0
	str	r2, [r3, #296]
	ldr	r2, [r0, #152]
	str	r2, [r3, #300]
	ldr	r2, [r0, #156]
	str	r2, [r3, #304]
	ldr	r2, [r0, #160]
	str	r2, [r3, #308]
	ldr	r2, [r0, #164]
	str	r2, [r3, #312]
	ldr	r2, [r0, #168]
	str	r2, [r3, #316]
	ldr	r2, [r0, #172]
	str	r2, [r3, #320]
	ldr	r2, [r0, #176]
	str	r2, [r3, #324]
	ldr	r2, [r0, #144]
	sub	ip, r2, #1
	mov	r0, r2, lsr #8
	bfi	r1, ip, #16, #7
	sub	r0, r0, #1
	mov	r2, r2, lsr #16
	bfi	r1, r0, #8, #6
	sub	r2, r2, #1
	bfi	r1, r2, #0, #6
	str	r1, [r3, #328]
	ldmfd	sp, {r4, fp, sp, pc}
.L84:
	ldr	r4, [r1, #44]
	mov	r2, #0
	ldr	lr, [r0, #2360]
	movw	r1, #513
	cmp	r4, r2
	movw	ip, #9729
	bfi	r2, lr, #8, #3
	moveq	ip, r1
	bfi	r2, ip, #16, #16
	str	r2, [r3, #256]
	mov	r1, #0
	ldr	ip, [r0, #252]
	mov	r2, r1
	ldr	r4, [r0, #260]
	mov	lr, r1
	bfi	r1, ip, #0, #5
	mov	ip, r2
	bfi	r1, r4, #16, #16
	str	r1, [r3, #260]
	ldr	r4, [r0, #256]
	ldr	r1, [r0, #264]
	bfi	r2, r4, #0, #5
	bfi	r2, r1, #16, #16
	str	r2, [r3, #300]
	ldr	r1, [r0, #244]
	ldr	r2, [r0, #252]
	rsb	r2, r2, #16
	mov	r2, r1, asl r2
	bfi	lr, r2, #0, #16
	str	lr, [r3, #264]
	ldr	r1, [r0, #248]
	ldr	r2, [r0, #256]
	rsb	r2, r2, #16
	mov	r2, r1, asl r2
	bfi	ip, r2, #0, #16
	str	ip, [r3, #304]
	ldr	r2, [r0, #260]
	cmp	r2, #31
	rsbls	r2, r2, #32
	ldrls	r1, [r0, #180]
	ldrhi	r2, [r0, #180]
	movls	r2, r1, asl r2
	str	r2, [r3, #268]
	ldr	r2, [r0, #260]
	cmp	r2, #63
	rsbls	r2, r2, #64
	ldrhi	r2, [r0, #184]
	ldrls	r1, [r0, #184]
	movls	r2, r1, asl r2
	str	r2, [r3, #272]
	ldr	r2, [r0, #260]
	cmp	r2, #64
	rsbhi	r2, r2, #96
	ldrhi	r1, [r0, #188]
	movhi	r2, r1, asl r2
	strhi	r2, [r3, #276]
	ldr	r2, [r0, #192]
	str	r2, [r3, #280]
	ldr	r2, [r0, #196]
	str	r2, [r3, #284]
	ldr	r2, [r0, #200]
	str	r2, [r3, #288]
	ldr	r2, [r0, #204]
	str	r2, [r3, #292]
	ldr	r2, [r0, #208]
	str	r2, [r3, #296]
	ldr	r2, [r0, #24]
	cmp	r2, #4
	bne	.L77
.L85:
	ldr	r2, [r0, #264]
	cmp	r2, #31
	rsbls	r2, r2, #32
	ldrls	r1, [r0, #212]
	ldrhi	r2, [r0, #212]
	movls	r2, r1, asl r2
	str	r2, [r3, #308]
	ldr	r2, [r0, #264]
	cmp	r2, #63
	rsbls	r2, r2, #64
	ldrhi	r2, [r0, #216]
	ldrls	r1, [r0, #216]
	movls	r2, r1, asl r2
	str	r2, [r3, #312]
	ldr	r2, [r0, #264]
	cmp	r2, #64
	rsbhi	r2, r2, #96
	ldrhi	r1, [r0, #220]
	movhi	r2, r1, asl r2
	strhi	r2, [r3, #316]
	ldr	r2, [r0, #224]
	str	r2, [r3, #320]
	ldr	r2, [r0, #228]
	str	r2, [r3, #324]
	ldr	r2, [r0, #232]
	str	r2, [r3, #328]
	ldr	r2, [r0, #236]
	str	r2, [r3, #332]
	ldr	r2, [r0, #240]
	str	r2, [r3, #336]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	VENC_HAL_VEDU_DDRCfg_CABAC_VLC, .-VENC_HAL_VEDU_DDRCfg_CABAC_VLC
	.align	2
	.global	VENC_HAL_DDRCfgReg
	.type	VENC_HAL_DDRCfgReg, %function
VENC_HAL_DDRCfgReg:
	UNWIND(.fnstart)


	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #92)
	sub	sp, sp, #92
	mov	r10, r1
	ldr	r1, [r1, #68]
	mov	r2, #11
	ldr	r3, [r0, #20]
	mov	r4, r0
	bfi	r2, r1, #10, #1
	ldr	r9, [r0, #4]
	bfc	r2, #16, #1
	mov	r6, #0
	bfc	r2, #17, #1
	mov	r8, r3
	orr	r2, r2, #134217728
	str	r3, [fp, #-48]
	bfc	r2, #30, #1
	str	r2, [r8, #4]
	ldr	lr, [r0, #24]
	mov	r3, #0
	bfc	r3, #0, #1
	ldr	r1, [r10, #68]
	subs	r2, lr, #4
	orr	r3, r3, #6
	ldr	r0, [r0, #2356]
	bfc	r6, #0, #9
	movne	r2, #1
	bfi	r3, r2, #3, #2
	bfi	r3, r1, #5, #1
	ldr	r2, [r4, #2352]
	ldr	r1, [r10, #44]
	bfi	r3, r0, #6, #1
	bfi	r3, r2, #7, #1
	ldr	r0, [r4, #704]
	clz	r2, r1
	bfc	r3, #8, #1
	bfc	r3, #24, #1
	ldr	r7, [r4, #2348]
	mov	r2, r2, lsr #5
	bfi	r3, r0, #9, #1
	bfi	r3, r2, #10, #2
	ldr	r0, [r4, #2344]
	bfi	r3, r7, #12, #1
	cmp	lr, #4
	bfi	r3, r1, #16, #1
	ldr	lr, [r4, #424]
	orr	r3, r3, #131072
	moveq	r1, #2
	bfi	r3, r0, #18, #2
	movne	r1, #0
	bfc	r3, #21, #1
	mov	r7, #0
	bfc	r3, #22, #1
	bfc	r6, #16, #9
	bfc	r3, #25, #1
	mov	r2, r7
	bfi	r3, r1, #26, #2
	mov	r1, r7
	bfi	r3, lr, #28, #2
	bfi	r1, r7, #0, #1
	bfc	r3, #30, #1
	mov	lr, r7
	bfc	r3, #31, #1
	str	r3, [r8, #20]
	str	r6, [r9, #512]
	bfi	lr, r7, #8, #2
	ldrh	r3, [r4, #28]
	mov	r0, r7
	ldrb	r6, [r4]
	bfi	r1, r7, #1, #1
	bfi	lr, r7, #4, #4
	bfi	r7, r3, #17, #1
	ldr	r3, [r4, #32]
	bfi	r7, r6, #16, #1
	bfc	r0, #0, #5
	bfi	r1, r2, #2, #1
	bfi	r7, r3, #0, #16
	str	r7, [r9, #516]
	ldr	r3, [r10, #176]
	bfc	r0, #5, #5
	ldr	r6, [r4, #2224]
	bfi	lr, r2, #0, #4
	bfi	r0, r3, #10, #6
	ldr	r3, [r4, #2200]
	bfi	r0, r6, #18, #1
	bfi	r1, r2, #3, #1
	bfi	r0, r3, #19, #1
	str	r0, [r8, #32]
	str	r2, [r8, #36]
	orr	r1, r1, #458752
	str	r2, [r8, #40]
	mov	r0, r2
	str	lr, [r9, #520]
	bfi	r0, r2, #16, #9
	ldr	r7, [r4, #416]
	mov	r6, r2
	ldr	lr, [r4, #420]
	bfi	r0, r2, #0, #9
	bfi	r1, r7, #19, #2
	mov	r3, r2
	bfi	r1, lr, #21, #1
	bfi	r1, r2, #23, #1
	str	r1, [r8, #48]
	ldr	r1, [r10, #16]
	ldr	r2, [r10, #12]
	sub	r1, r1, #1
	bfi	r6, r1, #16, #13
	sub	r2, r2, #1
	bfi	r6, r2, #0, #13
	str	r6, [r9]
	str	r0, [r8, #56]
	ldr	r2, [r4, #432]
	str	r2, [r8, #60]
	ldr	r1, [r4, #440]
	ldr	r2, [r4, #444]
	bfi	r3, r1, #4, #4
	bfi	r3, r2, #0, #4
	str	r3, [r8, #64]
	ldr	r3, [r4, #24]
	cmp	r3, #4
	beq	.L121
	cmp	r3, #0
	moveq	r3, #15
	moveq	ip, #0
	bfieq	ip, r3, #16, #6
	moveq	r3, #31
	bfieq	ip, r3, #0, #7
.L91:
	mov	r2, #3
	mov	r3, #0
	bfi	r3, r2, #0, #3
	mov	r1, #1
	bfi	r3, r1, #3, #2
	mov	r1, #1
	str	r1, [r9, #524]
	bfi	r3, r2, #5, #3
	ldr	r1, [fp, #-48]
	bfi	r3, r2, #8, #3
	str	ip, [r9, #16]
	mov	lr, #0
	str	r2, [r9, #20]
	mov	ip, lr
	str	r3, [r1, #100]
	mov	r6, lr
	ldr	r7, [r4, #412]
	mov	r0, lr
	mov	r1, lr
	mov	r3, lr
	bfc	r3, #0, #1
	str	r7, [r9, #128]
	bfc	r3, #1, #1
	ldr	r7, [r4, #68]
	bfc	r3, #2, #1
	bfc	r3, #3, #3
	str	r7, [r9, #132]
	ldr	r7, [r4, #72]
	str	r7, [r9, #136]
	ldr	r7, [r4, #76]
	str	r7, [r9, #140]
	ldr	r8, [r4, #52]
	ldr	r7, [r4, #56]
	bfi	lr, r8, #16, #16
	bfi	lr, r7, #0, #16
	str	lr, [r9, #152]
	ldr	lr, [r10, #52]
	add	lr, lr, #32
	ldr	lr, [r4, lr, asl #2]
	str	lr, [r9, #156]
	ldr	lr, [r10, #48]
	add	lr, lr, #20
	ldr	lr, [r4, lr, asl #2]
	str	lr, [r9, #160]
	ldr	lr, [r10, #48]
	add	lr, lr, #22
	ldr	lr, [r4, lr, asl #2]
	str	lr, [r9, #164]
	ldr	r7, [r4, #276]
	ldr	lr, [r4, #280]
	bfi	ip, r7, #0, #16
	bfi	ip, lr, #16, #16
	str	ip, [r9, #168]
	ldr	ip, [r10, #48]
	add	ip, ip, #24
	ldr	ip, [r4, ip, asl #2]
	str	ip, [r9, #172]
	ldr	ip, [r10, #48]
	add	ip, ip, #26
	ldr	ip, [r4, ip, asl #2]
	str	ip, [r9, #176]
	ldr	ip, [r4, #284]
	bfi	r6, ip, #0, #16
	str	r6, [r9, #180]
	ldr	ip, [r10, #48]
	clz	ip, ip
	mov	ip, ip, lsr #5
	add	ip, ip, #20
	ldr	ip, [r4, ip, asl #2]
	str	ip, [r9, #184]
	ldr	ip, [r10, #48]
	clz	ip, ip
	mov	ip, ip, lsr #5
	add	ip, ip, #22
	ldr	ip, [r4, ip, asl #2]
	str	ip, [r9, #188]
	ldr	lr, [r4, #280]
	ldr	ip, [r4, #276]
	bfi	r0, lr, #0, #16
	bfi	r0, ip, #16, #16
	str	r0, [r9, #192]
	ldr	r0, [r10, #48]
	clz	r0, r0
	mov	r0, r0, lsr #5
	add	r0, r0, #24
	ldr	r0, [r4, r0, asl #2]
	str	r0, [r9, #196]
	ldr	r0, [r10, #48]
	clz	r0, r0
	mov	r0, r0, lsr #5
	add	r0, r0, #26
	ldr	r0, [r4, r0, asl #2]
	str	r0, [r9, #200]
	ldr	ip, [r4, #284]
	ldr	r0, [r4, #288]
	bfi	r1, ip, #16, #16
	bfi	r1, r0, #0, #16
	str	r1, [r9, #204]
	ldr	r1, [r10, #48]
	clz	r1, r1
	mov	r1, r1, lsr #5
	add	r1, r1, #30
	ldr	r1, [r4, r1, asl #2]
	str	r1, [r9, #208]
	ldr	r1, [r10, #48]
	add	r1, r1, #30
	ldr	r1, [r4, r1, asl #2]
	str	r1, [r9, #212]
	ldr	r1, [r10, #48]
	add	r1, r1, #28
	ldr	r1, [r4, r1, asl #2]
	str	r1, [r9, #48]
	ldr	r1, [r10, #48]
	clz	r1, r1
	mov	r1, r1, lsr #5
	add	r1, r1, #28
	ldr	r1, [r4, r1, asl #2]
	str	r1, [r9, #52]
	ldr	r1, [r4, #36]
	str	r1, [r9, #56]
	ldr	r1, [r4, #44]
	str	r1, [r9, #60]
	ldr	r1, [r4, #40]
	str	r1, [r9, #64]
	ldr	r1, [r4, #60]
	cmp	r1, #2
	beq	.L92
	cmp	r1, #1
	beq	.L115
	cmp	r1, #0
	bfc	r3, #6, #4
	bfc	r3, #14, #1
	bne	.L93
	ldr	r2, [r4, #64]
	clz	r2, r2
	mov	r2, r2, lsr #5
.L94:
	bfi	r3, r2, #16, #8
	str	r3, [r9, #4]
	ldr	r1, [r4, #2340]
	mov	r2, #0
	ldr	ip, [r4, #2336]
	mov	r0, #5
	mov	r3, r2
	bfi	r2, r1, #0, #3
	bfc	r3, #0, #1
	mov	r1, #0
	bfi	r1, r0, #24, #8
	bfi	r2, ip, #4, #1
	bfi	r1, r0, #16, #8
	bfc	r3, #1, #1
	mov	ip, #15
	bfc	r2, #5, #1
	bfi	r1, ip, #8, #8
	bfc	r3, #2, #1
	mov	r0, #0
	bfi	r1, ip, #0, #8
	orr	r2, r2, #30464
	str	r1, [r9, #544]
	str	r2, [r9, #528]
	orr	r3, r3, #24
	mov	r2, #500
	str	r3, [r9, #532]
	movt	r0, 100
	mov	r3, #3
	bfi	r0, r2, #0, #16
	str	r3, [r9, #72]
	str	r0, [r9, #536]
	mov	ip, #0
	ldr	r0, [r4, #716]
	mov	r3, ip
	ldr	r2, [r4, #712]
	mov	r1, ip
	bfi	ip, r0, #0, #1
	ldr	r0, [r4, #708]
	ldr	r5, [fp, #-48]
	bfi	ip, r2, #1, #1
	bfi	ip, r0, #2, #1
	mov	r6, r3
	orr	ip, ip, #8
	mov	r0, r3
	bfc	ip, #4, #1
	str	ip, [r5, #352]
	ldr	ip, [r4, #8]
	mov	lr, r3
	mvn	r2, #127
	bfi	r0, r2, #0, #8
	mov	r8, #128
	bfi	r0, r2, #8, #8
	str	ip, [r5, #392]
	bfi	r6, r2, #0, #8
	ldr	ip, [r4, #2192]
	bfi	lr, r8, #0, #10
	ldr	r7, [r4, #2196]
	bfi	r0, r2, #16, #8
	bfi	r3, ip, #0, #1
	ldr	ip, [r4, #2208]
	bfi	r3, r7, #1, #1
	ldr	r7, [r4, #2220]
	bfi	r3, ip, #2, #1
	ldr	ip, [r4, #2188]
	bfi	r3, r7, #4, #1
	ldr	r7, [r4, #2184]
	bfi	r3, ip, #8, #1
	ldr	ip, [r4, #2268]
	bfi	r3, r7, #9, #1
	ldr	r7, [r4, #2272]
	bfi	r3, ip, #10, #1
	ldr	ip, [r4, #2276]
	bfi	r3, r7, #11, #1
	ldr	r7, [r4, #2180]
	bfi	r3, ip, #12, #1
	ldr	ip, [r4, #2176]
	bfi	r3, r7, #13, #1
	ldr	r7, [r4, #2280]
	bfi	r3, ip, #14, #1
	mov	ip, r1
	bfi	r3, r7, #15, #1
	str	r3, [r5, #440]
	ldr	r3, [r4, #2212]
	bfc	ip, #0, #1
	bfi	r6, r2, #8, #8
	bfi	lr, r8, #10, #10
	bfi	r1, r3, #1, #1
	mov	r3, #2
	bfi	r1, r3, #16, #8
	str	r0, [r9, #1760]
	bfi	r1, r3, #24, #8
	str	r6, [r9, #1764]
	str	lr, [r9, #1768]
	bfc	ip, #1, #8
	str	r1, [r9, #540]
	movw	r0, #43691
	str	ip, [r9, #32]
	movt	r0, 43690
	ldr	r1, [r10, #52]
	mov	lr, #1
	mov	r3, #0
	str	r3, [fp, #-64]
	add	r1, r1, #2
	mov	ip, r3
	mov	r2, r3
	str	r3, [fp, #-68]
	umull	r6, r7, r1, r0
	str	r3, [fp, #-72]
	mov	r6, r7, lsr lr
	add	r6, r6, r6, lsl #1
	rsb	r1, r6, r1
	add	r1, r1, #32
	ldr	r1, [r4, r1, asl #2]
	str	r1, [r9, #216]
	ldr	r6, [r10, #52]
	add	r6, r6, lr
	umull	r0, r1, r6, r0
	mov	r1, r1, lsr lr
	add	r1, r1, r1, lsl #1
	rsb	r1, r1, r6
	add	r1, r1, #32
	ldr	r1, [r4, r1, asl #2]
	str	r1, [r9, #220]
	str	lr, [r5, #492]
	ldrb	lr, [r4, #476]
	ldrb	r0, [r4, #472]
	ldrb	r6, [r4, #468]
	ldrb	r7, [r4, #464]
	orr	r1, r0, lr
	ldrb	r8, [r4, #460]
	orr	r1, r6, r1
	ldrb	r5, [r4, #456]
	orr	r1, r7, r1
	orr	r1, r8, r1
	str	r5, [fp, #-52]
	mov	r5, r8
	ldrb	r8, [r4, #452]
	str	r8, [fp, #-56]
	ldr	r8, [fp, #-52]
	orr	r1, r8, r1
	ldrb	r8, [r4, #448]
	str	r8, [fp, #-60]
	ldr	r8, [fp, #-56]
	orr	r1, r8, r1
	ldr	r8, [fp, #-60]
	orr	r1, r8, r1
	mov	r8, ip
	bfi	r3, r1, #24, #1
	ldr	r1, [r4, #700]
	bfi	r3, r1, #23, #1
	ldr	r1, [r4, #696]
	bfi	r3, r1, #22, #1
	ldr	r1, [r4, #692]
	bfi	r3, r1, #21, #1
	ldr	r1, [r4, #688]
	bfi	r3, r1, #20, #1
	ldr	r1, [r4, #684]
	bfi	r3, r1, #19, #1
	ldr	r1, [r4, #680]
	bfi	r3, r1, #18, #1
	ldr	r1, [r4, #676]
	bfi	r3, r1, #17, #1
	ldr	r1, [r4, #672]
	bfi	r3, r1, #16, #1
	ldr	r1, [r4, #508]
	bfi	r3, r1, #15, #1
	ldr	r1, [r4, #504]
	bfi	r3, r1, #14, #1
	ldr	r1, [r4, #500]
	bfi	r3, r1, #13, #1
	ldr	r1, [r4, #496]
	bfi	r3, r1, #12, #1
	ldr	r1, [r4, #492]
	bfi	r3, r1, #11, #1
	ldr	r1, [r4, #488]
	bfi	r3, r1, #10, #1
	ldr	r1, [r4, #484]
	bfi	r3, r1, #9, #1
	ldr	r1, [r4, #480]
	bfi	r3, r1, #8, #1
	bfi	r3, lr, #7, #1
	ldr	lr, [fp, #-52]
	bfi	r3, r0, #6, #1
	str	ip, [fp, #-52]
	bfi	r3, r6, #5, #1
	mov	r6, ip
	bfi	r3, r7, #4, #1
	mov	r7, ip
	bfi	r3, r5, #3, #1
	mov	r5, ip
	bfi	r3, lr, #2, #1
	ldr	lr, [fp, #-56]
	str	r8, [fp, #-56]
	bfi	r3, lr, #1, #1
	ldr	lr, [fp, #-60]
	bfi	r3, lr, #0, #1
	str	r3, [r9, #1024]
	ldr	r3, [r4, #524]
	mov	lr, ip
	ldr	r1, [r4, #520]
	ldr	r0, [r4, #516]
	bfi	ip, r3, #24, #7
	bfi	ip, r1, #16, #7
	ldr	r3, [r4, #512]
	bfi	ip, r0, #8, #7
	bfi	ip, r3, #0, #7
	str	ip, [r9, #1028]
	ldr	r3, [r4, #540]
	mov	ip, r8
	ldr	r1, [r4, #536]
	ldr	r0, [r4, #532]
	bfi	r2, r3, #24, #7
	bfi	r2, r1, #16, #7
	ldr	r3, [r4, #528]
	bfi	r2, r0, #8, #7
	mov	r1, r8
	bfi	r2, r3, #0, #7
	str	r2, [r9, #1032]
	ldr	r2, [r4, #576]
	mov	r0, r8
	ldr	r3, [r4, #544]
	bfi	r1, r2, #16, #10
	bfi	r1, r3, #0, #10
	str	r1, [r9, #1036]
	ldr	r2, [r4, #580]
	mov	r1, r8
	ldr	r3, [r4, #548]
	bfi	r1, r2, #16, #10
	bfi	r1, r3, #0, #10
	str	r1, [r9, #1040]
	ldr	r2, [r4, #584]
	mov	r1, r8
	ldr	r3, [r4, #552]
	bfi	r1, r2, #16, #10
	bfi	r1, r3, #0, #10
	str	r1, [r9, #1044]
	ldr	r2, [r4, #588]
	mov	r1, r8
	ldr	r3, [r4, #556]
	bfi	r8, r2, #16, #10
	bfi	r8, r3, #0, #10
	str	r8, [r9, #1048]
	ldr	r2, [r4, #592]
	mov	r8, r7
	ldr	r3, [r4, #560]
	bfi	r7, r2, #16, #10
	mov	r2, r6
	bfi	r7, r3, #0, #10
	str	r7, [r9, #1052]
	ldr	r7, [r4, #596]
	ldr	r3, [r4, #564]
	bfi	r6, r7, #16, #10
	bfi	r6, r3, #0, #10
	str	r6, [r9, #1056]
	ldr	r7, [r4, #600]
	mov	r3, r5
	ldr	r6, [r4, #568]
	bfi	r5, r7, #16, #10
	mov	r7, r5
	bfi	r7, r6, #0, #10
	str	r7, [r9, #1060]
	mov	r5, lr
	ldr	r7, [r4, #604]
	ldr	r6, [r4, #572]
	bfi	r5, r7, #16, #10
	mov	r7, r5
	bfi	r7, r6, #0, #10
	str	r7, [r9, #1064]
	ldr	r7, [r4, #640]
	ldr	r6, [r4, #608]
	bfi	lr, r7, #16, #9
	mov	r7, ip
	bfi	lr, r6, #0, #9
	str	lr, [r9, #1068]
	ldr	r6, [r4, #644]
	ldr	lr, [r4, #612]
	bfi	r7, r6, #16, #9
	bfi	r7, lr, #0, #9
	str	r7, [r9, #1072]
	ldr	r6, [r4, #648]
	ldr	lr, [r4, #616]
	bfi	ip, r6, #16, #9
	bfi	ip, lr, #0, #9
	str	ip, [r9, #1076]
	ldr	lr, [r4, #652]
	ldr	ip, [r4, #620]
	bfi	r0, lr, #16, #9
	bfi	r0, ip, #0, #9
	str	r0, [r9, #1080]
	ldr	ip, [r4, #656]
	ldr	r0, [r4, #624]
	bfi	r1, ip, #16, #9
	bfi	r1, r0, #0, #9
	str	r1, [r9, #1084]
	ldr	r0, [r4, #660]
	ldr	r1, [r4, #628]
	bfi	r8, r0, #16, #9
	bfi	r8, r1, #0, #9
	str	r8, [r9, #1088]
	ldr	r0, [r4, #664]
	ldr	r1, [r4, #632]
	bfi	r2, r0, #16, #9
	bfi	r2, r1, #0, #9
	str	r2, [r9, #1092]
	ldr	r1, [r4, #668]
	ldr	r2, [r4, #636]
	bfi	r3, r1, #16, #9
	bfi	r3, r2, #0, #9
	str	r3, [r9, #1096]
	ldr	r3, [r4, #24]
	ldr	r0, [r10, #12]
	cmp	r3, #0
	sub	r0, r0, #1
	moveq	r6, #16
	movne	r6, #64
	mov	r1, r6
	add	r0, r0, r6
	bl	__aeabi_uidiv
	ldr	r3, [r10, #16]
	mov	r1, r6
	mov	r7, r0
	sub	r0, r3, #1
	add	r0, r0, r6
	bl	__aeabi_uidiv
	mul	r1, r7, r0
	ldr	r0, [r10, #172]
	bl	__aeabi_uidiv
	mov	r3, #0
	mov	r5, r3
	mov	r7, r3
	mov	r2, r3
	mov	r6, r3
	str	r3, [fp, #-56]
	mov	r1, r3
	str	r3, [fp, #-60]
	mov	ip, r3
	str	r3, [fp, #-64]
	mov	lr, r3
	str	r3, [fp, #-72]
	mov	r8, r3
	str	r3, [fp, #-76]
	str	r3, [fp, #-80]
	str	r3, [fp, #-84]
	str	r3, [fp, #-88]
	str	r3, [fp, #-92]
	str	r3, [fp, #-96]
	str	r3, [fp, #-100]
	str	r3, [fp, #-104]
	str	r3, [fp, #-108]
	str	r3, [fp, #-112]
	str	r3, [fp, #-116]
	str	r3, [fp, #-120]
	str	r3, [fp, #-124]
	bfi	r5, r0, #0, #20
	ldr	r0, [fp, #-48]
	str	r5, [r0, #588]
	ldr	r0, [r4, #720]
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #724]
	bfi	r3, r0, #0, #10
	str	r3, [r9, #1536]
	ldr	r0, [r4, #728]
	mov	r3, r2
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #732]
	bfi	r3, r0, #0, #8
	str	r3, [r9, #1540]
	ldr	r0, [r4, #736]
	mov	r3, r2
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #740]
	bfi	r3, r0, #0, #10
	str	r3, [r9, #1544]
	ldr	r0, [r4, #744]
	mov	r3, r2
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #748]
	bfi	r3, r0, #0, #8
	str	r3, [r9, #1548]
	ldr	r0, [r4, #752]
	mov	r3, r2
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #756]
	bfi	r3, r0, #0, #10
	str	r3, [r9, #1552]
	ldr	r0, [r4, #760]
	mov	r3, r2
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #764]
	bfi	r3, r0, #0, #8
	str	r3, [r9, #1556]
	ldr	r0, [r4, #768]
	mov	r3, r2
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #772]
	bfi	r3, r0, #0, #10
	str	r3, [r9, #1560]
	ldr	r0, [r4, #776]
	mov	r3, r2
	bfi	r3, r0, #16, #5
	ldr	r0, [r4, #780]
	bfi	r3, r0, #0, #8
	str	r3, [r9, #1564]
	ldr	r0, [r4, #784]
	mov	r3, r6
	bfi	lr, r0, #12, #4
	ldr	r0, [r4, #788]
	bfi	lr, r0, #8, #4
	ldr	r0, [r4, #792]
	bfi	lr, r0, #4, #4
	ldr	r0, [r4, #796]
	bfi	lr, r0, #0, #4
	ldr	r0, [r4, #800]
	bfi	lr, r0, #28, #4
	ldr	r0, [r4, #804]
	bfi	lr, r0, #24, #4
	ldr	r0, [r4, #808]
	bfi	lr, r0, #20, #4
	ldr	r0, [r4, #812]
	bfi	lr, r0, #16, #4
	str	lr, [r9, #1568]
	ldr	r0, [r4, #816]
	mov	lr, r7
	bfi	ip, r0, #12, #4
	ldr	r0, [r4, #820]
	bfi	ip, r0, #8, #4
	ldr	r0, [r4, #824]
	bfi	ip, r0, #4, #4
	ldr	r0, [r4, #828]
	bfi	ip, r0, #0, #4
	ldr	r0, [r4, #832]
	bfi	ip, r0, #28, #4
	ldr	r0, [r4, #836]
	bfi	ip, r0, #24, #4
	ldr	r0, [r4, #840]
	bfi	ip, r0, #20, #4
	ldr	r0, [r4, #844]
	bfi	ip, r0, #16, #4
	str	ip, [r9, #1572]
	ldr	r0, [r4, #848]
	mov	ip, r6
	mov	r5, ip
	bfi	r1, r0, #12, #4
	ldr	r0, [r4, #852]
	bfi	r1, r0, #8, #4
	ldr	r0, [r4, #856]
	bfi	r1, r0, #4, #4
	ldr	r0, [r4, #860]
	bfi	r1, r0, #0, #4
	ldr	r0, [r4, #864]
	bfi	r1, r0, #28, #4
	ldr	r0, [r4, #868]
	bfi	r1, r0, #24, #4
	ldr	r0, [r4, #872]
	bfi	r1, r0, #20, #4
	ldr	r0, [r4, #876]
	bfi	r1, r0, #16, #4
	str	r1, [r9, #1576]
	ldr	r1, [r4, #880]
	mov	r0, r7
	bfi	r2, r1, #12, #4
	ldr	r1, [r4, #884]
	bfi	r2, r1, #8, #4
	ldr	r1, [r4, #888]
	bfi	r2, r1, #4, #4
	ldr	r1, [r4, #892]
	bfi	r2, r1, #0, #4
	ldr	r1, [r4, #896]
	bfi	r2, r1, #28, #4
	ldr	r1, [r4, #900]
	bfi	r2, r1, #24, #4
	ldr	r1, [r4, #904]
	bfi	r2, r1, #20, #4
	ldr	r1, [r4, #908]
	bfi	r2, r1, #16, #4
	str	r2, [r9, #1580]
	ldr	r2, [r4, #912]
	mov	r1, r7
	bfi	r3, r2, #12, #4
	ldr	r2, [r4, #916]
	bfi	r3, r2, #8, #4
	ldr	r2, [r4, #920]
	bfi	r3, r2, #4, #4
	ldr	r2, [r4, #924]
	bfi	r3, r2, #0, #4
	ldr	r2, [r4, #928]
	bfi	r3, r2, #28, #4
	ldr	r2, [r4, #932]
	bfi	r3, r2, #24, #4
	ldr	r2, [r4, #936]
	bfi	r3, r2, #20, #4
	ldr	r2, [r4, #940]
	bfi	r3, r2, #16, #4
	str	r3, [r9, #1584]
	ldr	r3, [r4, #944]
	mov	r2, r6
	bfi	r2, r3, #12, #4
	ldr	r3, [r4, #948]
	bfi	r2, r3, #8, #4
	ldr	r3, [r4, #952]
	bfi	r2, r3, #4, #4
	ldr	r3, [r4, #956]
	bfi	r2, r3, #0, #4
	ldr	r3, [r4, #960]
	bfi	r2, r3, #28, #4
	ldr	r3, [r4, #964]
	bfi	r2, r3, #24, #4
	ldr	r3, [r4, #968]
	bfi	r2, r3, #20, #4
	ldr	r3, [r4, #972]
	bfi	r2, r3, #16, #4
	str	r2, [r9, #1588]
	ldr	r3, [r4, #976]
	mov	r2, r6
	bfi	r2, r3, #12, #4
	ldr	r3, [r4, #980]
	bfi	r2, r3, #8, #4
	ldr	r3, [r4, #984]
	bfi	r2, r3, #4, #4
	ldr	r3, [r4, #988]
	bfi	r2, r3, #0, #4
	ldr	r3, [r4, #992]
	bfi	r2, r3, #28, #4
	ldr	r3, [r4, #996]
	bfi	r2, r3, #24, #4
	ldr	r3, [r4, #1000]
	bfi	r2, r3, #20, #4
	ldr	r3, [r4, #1004]
	bfi	r2, r3, #16, #4
	str	r2, [r9, #1592]
	ldr	r3, [r4, #1008]
	mov	r2, r7
	bfi	r8, r3, #12, #4
	ldr	r3, [r4, #1012]
	bfi	r8, r3, #8, #4
	ldr	r3, [r4, #1016]
	bfi	r8, r3, #4, #4
	ldr	r3, [r4, #1020]
	bfi	r8, r3, #0, #4
	ldr	r3, [r4, #1024]
	bfi	r8, r3, #28, #4
	ldr	r3, [r4, #1028]
	bfi	r8, r3, #24, #4
	ldr	r3, [r4, #1032]
	bfi	r8, r3, #20, #4
	ldr	r3, [r4, #1036]
	bfi	r8, r3, #16, #4
	str	r8, [r9, #1596]
	ldr	r3, [r4, #1040]
	mov	r8, r7
	bfi	r6, r3, #12, #4
	ldr	r3, [r4, #1044]
	bfi	r6, r3, #8, #4
	ldr	r3, [r4, #1048]
	bfi	r6, r3, #4, #4
	ldr	r3, [r4, #1052]
	bfi	r6, r3, #0, #4
	ldr	r3, [r4, #1056]
	bfi	r6, r3, #28, #4
	ldr	r3, [r4, #1060]
	bfi	r6, r3, #24, #4
	ldr	r3, [r4, #1064]
	bfi	r6, r3, #20, #4
	ldr	r3, [r4, #1068]
	bfi	r6, r3, #16, #4
	str	r6, [r9, #1600]
	ldr	r3, [r4, #1072]
	mov	r6, r7
	bfi	r2, r3, #0, #3
	ldr	r3, [r4, #1076]
	bfi	r2, r3, #3, #7
	ldr	r3, [r4, #1080]
	bfi	r2, r3, #10, #3
	ldr	r3, [r4, #1084]
	bfi	r2, r3, #13, #5
	ldr	r3, [r4, #1088]
	bfi	r2, r3, #18, #4
	ldr	r3, [r4, #1092]
	bfi	r2, r3, #22, #4
	ldr	r3, [r4, #1096]
	bfi	r2, r3, #26, #4
	str	r2, [r9, #1604]
	ldr	r3, [r4, #1100]
	mov	r2, r7
	bfi	r2, r3, #0, #3
	ldr	r3, [r4, #1104]
	bfi	r2, r3, #3, #7
	ldr	r3, [r4, #1108]
	bfi	r2, r3, #10, #3
	ldr	r3, [r4, #1112]
	bfi	r2, r3, #13, #5
	ldr	r3, [r4, #1116]
	bfi	r2, r3, #18, #4
	ldr	r3, [r4, #1120]
	bfi	r2, r3, #22, #4
	ldr	r3, [r4, #1124]
	bfi	r2, r3, #26, #4
	str	r2, [r9, #1608]
	ldr	r3, [r4, #1128]
	mov	r2, r7
	bfi	r2, r3, #0, #3
	ldr	r3, [r4, #1132]
	bfi	r2, r3, #3, #7
	ldr	r3, [r4, #1136]
	bfi	r2, r3, #10, #3
	ldr	r3, [r4, #1140]
	bfi	r2, r3, #13, #5
	ldr	r3, [r4, #1144]
	bfi	r2, r3, #18, #4
	ldr	r3, [r4, #1148]
	bfi	r2, r3, #22, #4
	ldr	r3, [r4, #1152]
	bfi	r2, r3, #26, #4
	str	r2, [r9, #1612]
	ldr	r3, [r4, #1428]
	mov	r2, r7
	bfi	r2, r3, #0, #3
	ldr	r3, [r4, #1432]
	bfi	r2, r3, #3, #7
	ldr	r3, [r4, #1436]
	bfi	r2, r3, #10, #3
	ldr	r3, [r4, #1440]
	bfi	r2, r3, #13, #5
	ldr	r3, [r4, #1444]
	bfi	r2, r3, #18, #4
	ldr	r3, [r4, #1448]
	bfi	r2, r3, #22, #4
	ldr	r3, [r4, #1452]
	bfi	r2, r3, #26, #4
	str	r2, [r9, #1616]
	ldr	r3, [r4, #1456]
	mov	r2, r7
	bfi	r6, r3, #0, #3
	ldr	r3, [r4, #1460]
	bfi	r6, r3, #3, #7
	ldr	r3, [r4, #1464]
	bfi	r6, r3, #10, #3
	ldr	r3, [r4, #1468]
	bfi	r6, r3, #13, #5
	ldr	r3, [r4, #1472]
	bfi	r6, r3, #18, #4
	ldr	r3, [r4, #1476]
	bfi	r6, r3, #22, #4
	ldr	r3, [r4, #1480]
	bfi	r6, r3, #26, #4
	str	r6, [r9, #1620]
	ldr	r6, [r4, #1484]
	mov	r3, r7
	bfi	r8, r6, #0, #3
	ldr	r6, [r4, #1488]
	bfi	r8, r6, #3, #7
	ldr	r6, [r4, #1492]
	bfi	r8, r6, #10, #3
	ldr	r6, [r4, #1496]
	bfi	r8, r6, #13, #5
	ldr	r6, [r4, #1500]
	bfi	r8, r6, #18, #4
	ldr	r6, [r4, #1504]
	bfi	r8, r6, #22, #4
	ldr	r6, [r4, #1508]
	bfi	r8, r6, #26, #4
	str	r8, [r9, #1624]
	ldr	r6, [r4, #1512]
	mov	r8, r7
	bfi	r8, r6, #0, #3
	ldr	r6, [r4, #1516]
	bfi	r8, r6, #3, #7
	ldr	r6, [r4, #1520]
	bfi	r8, r6, #10, #3
	ldr	r6, [r4, #1524]
	bfi	r8, r6, #13, #5
	ldr	r6, [r4, #1528]
	bfi	r8, r6, #18, #4
	ldr	r6, [r4, #1532]
	bfi	r8, r6, #22, #4
	ldr	r6, [r4, #1536]
	bfi	r8, r6, #26, #4
	str	r8, [r9, #1628]
	ldr	r6, [r4, #1156]
	mov	r8, r7
	bfi	r7, r6, #0, #4
	ldr	r6, [r4, #1160]
	bfi	r7, r6, #4, #4
	ldr	r6, [r4, #1164]
	bfi	r7, r6, #8, #4
	ldr	r6, [r4, #1168]
	bfi	r7, r6, #12, #4
	ldr	r6, [r4, #1172]
	bfi	r7, r6, #16, #4
	ldr	r6, [r4, #1176]
	bfi	r7, r6, #20, #4
	ldr	r6, [r4, #1180]
	bfi	r7, r6, #24, #4
	ldr	r6, [r4, #1184]
	bfi	r7, r6, #28, #4
	str	r7, [r9, #1632]
	ldr	r6, [r4, #1188]
	bfi	r5, r6, #0, #4
	ldr	r6, [r4, #1192]
	bfi	r5, r6, #4, #4
	ldr	r6, [r4, #1196]
	bfi	r5, r6, #8, #4
	ldr	r6, [r4, #1200]
	bfi	r5, r6, #12, #4
	ldr	r6, [r4, #1204]
	bfi	r5, r6, #16, #4
	ldr	r6, [r4, #1208]
	bfi	r5, r6, #20, #4
	str	r5, [r9, #1636]
	ldr	r6, [r4, #1212]
	mov	r5, ip
	bfi	ip, r6, #0, #10
	ldr	r6, [r4, #1216]
	bfi	ip, r6, #16, #5
	str	ip, [r9, #1640]
	ldr	ip, [r4, #1220]
	mov	r6, lr
	bfi	lr, ip, #0, #8
	ldr	ip, [r4, #1224]
	bfi	lr, ip, #16, #5
	str	lr, [r9, #1644]
	ldr	ip, [r4, #1228]
	mov	lr, r0
	bfi	r0, ip, #0, #10
	ldr	ip, [r4, #1232]
	bfi	r0, ip, #16, #5
	str	r0, [r9, #1648]
	ldr	r0, [r4, #1236]
	mov	ip, r1
	bfi	r5, r0, #0, #8
	ldr	r0, [r4, #1240]
	bfi	r5, r0, #16, #5
	str	r5, [r9, #1652]
	ldr	r5, [r4, #1244]
	mov	r0, r1
	bfi	r1, r5, #0, #10
	ldr	r5, [r4, #1248]
	bfi	r1, r5, #16, #5
	str	r1, [r9, #1656]
	ldr	r5, [r4, #1252]
	mov	r1, r2
	bfi	r2, r5, #0, #8
	ldr	r5, [r4, #1256]
	bfi	r2, r5, #16, #5
	str	r2, [r9, #1660]
	ldr	r5, [r4, #1540]
	mov	r2, r3
	bfi	r3, r5, #0, #4
	ldr	r5, [r4, #1544]
	bfi	r3, r5, #4, #4
	ldr	r5, [r4, #1548]
	bfi	r3, r5, #8, #4
	ldr	r5, [r4, #1552]
	bfi	r3, r5, #12, #4
	ldr	r5, [r4, #1556]
	bfi	r3, r5, #16, #4
	ldr	r5, [r4, #1560]
	bfi	r3, r5, #20, #4
	str	r3, [r9, #1664]
	ldr	r7, [r4, #1564]
	mov	r5, r8
	mov	r3, r8
	bfi	r5, r7, #0, #12
	ldr	r7, [r4, #1568]
	bfi	r5, r7, #12, #12
	ldr	r7, [r4, #1572]
	bfi	r5, r7, #24, #8
	mov	r7, r8
	str	r5, [r9, #1668]
	mov	r5, r8
	ldr	r8, [r4, #1576]
	bfc	r5, #14, #1
	bfc	r5, #15, #1
	str	r5, [fp, #-68]
	bfi	r7, r8, #0, #12
	ldr	r8, [r4, #1580]
	mov	r5, r6
	bfi	r7, r8, #12, #12
	ldr	r8, [r4, #1584]
	bfi	r7, r8, #24, #8
	str	r7, [r9, #1672]
	ldr	r8, [r4, #1588]
	mov	r7, r6
	bfc	r7, #0, #8
	bfi	r5, r8, #0, #12
	ldr	r8, [r4, #1592]
	orr	r7, r7, #65280
	bfi	r5, r8, #12, #12
	ldr	r8, [r4, #1596]
	movt	r7, 65280
	str	r7, [fp, #-52]
	mov	r7, r5
	bfi	r7, r8, #24, #8
	str	r7, [r9, #1676]
	mov	r7, r6
	ldr	r8, [r4, #1600]
	bfi	r7, r8, #0, #8
	ldr	r8, [r4, #1604]
	bfi	r7, r8, #8, #8
	ldr	r8, [r4, #1608]
	bfi	r7, r8, #16, #8
	str	r7, [r9, #1680]
	ldr	r7, [r4, #1260]
	mov	r8, r6
	bfi	r6, r7, #0, #1
	ldr	r7, [r4, #1264]
	bfi	r6, r7, #1, #3
	ldr	r7, [r4, #1268]
	bfi	r6, r7, #4, #6
	ldr	r7, [r4, #1272]
	bfi	r6, r7, #10, #5
	ldr	r7, [r4, #1276]
	bfi	r6, r7, #15, #6
	ldr	r7, [r4, #1280]
	bfi	r6, r7, #21, #5
	str	r6, [r9, #1684]
	ldr	r6, [r4, #1284]
	mov	r7, lr
	bfi	lr, r6, #0, #1
	ldr	r6, [r4, #1288]
	bfi	lr, r6, #1, #3
	ldr	r6, [r4, #1292]
	bfi	lr, r6, #4, #6
	ldr	r6, [r4, #1296]
	bfi	lr, r6, #10, #5
	ldr	r6, [r4, #1300]
	bfi	lr, r6, #15, #6
	ldr	r6, [r4, #1304]
	bfi	lr, r6, #21, #5
	str	lr, [r9, #1688]
	ldr	lr, [r4, #1308]
	mov	r6, ip
	bfi	ip, lr, #0, #1
	ldr	lr, [r4, #1312]
	bfi	ip, lr, #1, #3
	ldr	lr, [r4, #1316]
	bfi	ip, lr, #4, #6
	ldr	lr, [r4, #1320]
	bfi	ip, lr, #10, #5
	ldr	lr, [r4, #1324]
	bfi	ip, lr, #15, #6
	ldr	lr, [r4, #1328]
	bfi	ip, lr, #21, #5
	str	ip, [r9, #1692]
	ldr	lr, [r4, #1332]
	mov	ip, r0
	bfi	r0, lr, #0, #1
	ldr	lr, [r4, #1336]
	bfi	r0, lr, #1, #3
	ldr	lr, [r4, #1340]
	bfi	r0, lr, #4, #6
	ldr	lr, [r4, #1344]
	bfi	r0, lr, #10, #5
	ldr	lr, [r4, #1348]
	bfi	r0, lr, #15, #6
	ldr	lr, [r4, #1352]
	bfi	r0, lr, #21, #5
	str	r0, [r9, #1696]
	ldr	lr, [r4, #1356]
	mov	r0, r1
	bfi	r1, lr, #0, #1
	ldr	lr, [r4, #1360]
	bfi	r1, lr, #1, #3
	ldr	lr, [r4, #1364]
	bfi	r1, lr, #4, #6
	ldr	lr, [r4, #1368]
	bfi	r1, lr, #10, #5
	ldr	lr, [r4, #1372]
	bfi	r1, lr, #15, #6
	ldr	lr, [r4, #1376]
	bfi	r1, lr, #21, #5
	str	r1, [r9, #1700]
	ldr	lr, [r4, #1380]
	mov	r1, r2
	bfi	r2, lr, #0, #1
	ldr	lr, [r4, #1384]
	bfi	r2, lr, #1, #3
	ldr	lr, [r4, #1388]
	bfi	r2, lr, #4, #6
	ldr	lr, [r4, #1392]
	bfi	r2, lr, #10, #5
	ldr	lr, [r4, #1396]
	bfi	r2, lr, #15, #6
	ldr	lr, [r4, #1400]
	bfi	r2, lr, #21, #5
	str	r2, [r9, #1704]
	ldr	r2, [r4, #1404]
	mov	lr, r8
	bfi	r3, r2, #0, #1
	ldr	r2, [r4, #1408]
	bfi	r3, r2, #1, #3
	ldr	r2, [r4, #1412]
	bfi	r3, r2, #4, #6
	ldr	r2, [r4, #1416]
	bfi	r3, r2, #10, #5
	ldr	r2, [r4, #1420]
	bfi	r3, r2, #15, #6
	ldr	r2, [r4, #1424]
	bfi	r3, r2, #21, #5
	str	r3, [r9, #1708]
	ldr	r3, [r4, #408]
	ldr	r5, [fp, #-68]
	ldr	r2, [fp, #-52]
	bfi	r5, r3, #20, #8
	ldr	r3, [r10, #68]
	str	r2, [r9, #12]
	bfi	r5, r3, #28, #1
	str	r5, [r9, #8]
	mov	r2, r8
	ldr	r3, [r4, #2392]
	bfi	r2, r3, #0, #1
	str	r2, [r9, #1824]
	ldr	r3, [r4, #2396]
	mov	r2, r8
	bfi	r8, r3, #0, #16
	str	r8, [r9, #1828]
	ldr	r3, [r4, #2400]
	mov	r8, r7
	bfi	r7, r3, #0, #16
	str	r7, [r9, #1832]
	ldr	r7, [r4, #2404]
	mov	r3, r6
	bfi	r6, r7, #0, #16
	str	r6, [r9, #1836]
	ldr	r7, [r4, #2408]
	mov	r6, ip
	ldr	r5, [r4, #2412]
	bfi	ip, r7, #18, #9
	ldr	r7, [r4, #2416]
	bfi	ip, r5, #9, #9
	bfi	ip, r7, #0, #9
	str	ip, [r9, #1844]
	ldr	r7, [r4, #2420]
	mov	ip, r0
	ldr	r5, [r4, #2424]
	bfi	r0, r7, #16, #8
	ldr	r7, [r4, #2428]
	bfi	r0, r5, #8, #8
	bfi	r0, r7, #0, #8
	str	r0, [r9, #1848]
	ldr	r0, [r4, #2432]
	ldr	r7, [r4, #2436]
	bfi	r1, r0, #8, #4
	ldr	r0, [r4, #2440]
	bfi	r1, r7, #4, #4
	bfi	r1, r0, #0, #4
	mov	r0, #3
	bfi	r1, r0, #20, #8
	mov	r0, #20
	bfi	r1, r0, #12, #8
	str	r1, [r9, #1852]
	ldr	r1, [r4, #2572]
	bfi	lr, r1, #0, #16
	bfc	lr, #16, #8
	bfc	lr, #24, #8
	str	lr, [r9, #1856]
	ldr	r0, [r4, #2588]
	ldr	r1, [r4, #2584]
	bfi	r2, r0, #0, #8
	ldr	r0, [r4, #2580]
	bfi	r2, r1, #8, #8
	ldr	r1, [r4, #2576]
	bfi	r2, r0, #16, #8
	bfi	r2, r1, #24, #8
	str	r2, [r9, #1860]
	ldr	r1, [r4, #2448]
	ldr	r2, [r4, #2452]
	bfi	r8, r1, #24, #8
	ldr	r1, [r4, #2456]
	bfi	r8, r2, #16, #8
	ldr	r2, [r4, #2460]
	bfi	r8, r1, #8, #8
	bfi	r8, r2, #0, #8
	str	r8, [r9, #1872]
	ldr	r1, [r4, #2464]
	ldr	r2, [r4, #2468]
	bfi	r3, r1, #0, #8
	ldr	r1, [r4, #2472]
	bfi	r3, r2, #8, #8
	ldr	r2, [r4, #2616]
	bfi	r3, r1, #16, #1
	bfi	r3, r2, #17, #1
	str	r3, [r9, #1876]
	ldr	r2, [r4, #2476]
	ldr	r3, [r4, #2480]
	bfi	r6, r2, #0, #16
	bfi	r6, r3, #16, #16
	str	r6, [r9, #1880]
	ldr	r3, [r4, #2484]
	ldr	r1, [r4, #24]
	ldr	r2, [r4, #2488]
	bfi	ip, r3, #22, #9
	cmp	r1, #0
	ldr	r3, [r4, #2492]
	bfi	ip, r2, #17, #5
	bfi	ip, r3, #9, #8
	ldrne	r3, [r4, #2444]
	moveq	r3, #32
	bfi	ip, r3, #0, #9
	str	ip, [r9, #1884]
	ldr	r2, [r4, #2496]
	mov	r3, #0
	ldr	ip, [r4, #2500]
	mov	r0, r3
	mov	r1, r3
	bfi	r3, r2, #8, #14
	bfi	r3, ip, #0, #8
	str	r3, [r9, #1792]
	ldr	r6, [r4, #2504]
	mov	r2, r0
	ldr	ip, [r4, #2508]
	mov	lr, r0
	mov	r3, r0
	bfi	r0, r6, #16, #8
	ldr	r6, [r4, #2512]
	bfi	r0, ip, #8, #8
	mov	r8, r1
	mov	ip, r1
	bfi	r0, r6, #0, #8
	str	r0, [r9, #1796]
	ldr	r6, [r4, #2520]
	mov	r0, r1
	ldr	r7, [r4, #2524]
	bfi	r1, r6, #17, #1
	ldr	r6, [r4, #2528]
	ldr	r5, [r4, #2532]
	bfi	r1, r7, #12, #2
	bfi	r1, r6, #4, #4
	mov	r7, r2
	bfi	r1, r5, #0, #4
	str	r1, [r9, #1800]
	ldr	r1, [r4, #2536]
	mov	r6, r2
	ldr	r5, [r4, #2540]
	bfi	r2, r1, #0, #10
	mov	r1, lr
	bfi	r2, r5, #16, #9
	str	r2, [r9, #1808]
	ldr	r5, [r4, #2544]
	mov	r2, lr
	bfi	lr, r5, #0, #10
	ldr	r5, [r4, #2548]
	bfi	lr, r5, #16, #9
	str	lr, [r9, #1812]
	ldr	r5, [r4, #2552]
	mov	lr, #1
	bfi	r3, r5, #0, #10
	ldr	r5, [r4, #2556]
	bfi	r3, r5, #16, #9
	str	r3, [r9, #1816]
	mov	r3, ip
	ldr	r5, [r4, #2560]
	bfi	r3, lr, #0, #8
	bfi	r3, lr, #8, #8
	ldr	lr, [r4, #2564]
	bfi	ip, r5, #0, #10
	bfi	ip, lr, #16, #9
	str	ip, [r9, #1820]
	ldr	lr, [r4, #2568]
	mov	ip, r8
	movt	r3, 200
	bfi	r8, lr, #0, #16
	str	r8, [r9, #1804]
	ldr	r8, [r4, #2592]
	ldr	lr, [r4, #2596]
	bfi	r0, r8, #0, #13
	bfi	r0, lr, #13, #1
	str	r0, [r9, #36]
	ldr	r0, [r4, #2600]
	bfi	r7, r0, #0, #18
	str	r7, [r9, #40]
	ldr	r0, [r4, #2604]
	bfi	r6, r0, #0, #18
	str	r6, [r9, #44]
	ldr	lr, [r4, #2628]
	ldr	r0, [r4, #2632]
	bfi	r1, lr, #16, #7
	ldr	lr, [fp, #-48]
	bfi	r1, r0, #23, #7
	str	r1, [lr, #1792]
	ldr	r1, [r4, #2620]
	ldr	r0, [r4, #2624]
	bfi	r2, r1, #0, #8
	ldr	r1, [r4, #2608]
	bfi	r2, r0, #8, #8
	bfi	r2, r1, #16, #8
	str	r2, [lr, #1796]
	ldr	r2, [r4, #2612]
	ldr	r1, [r4, #2636]
	bfi	ip, r2, #12, #8
	ldr	r2, [r4, #2640]
	bfi	ip, r1, #8, #4
	bfi	ip, r2, #0, #8
	str	ip, [lr, #1800]
	str	r3, [lr, #1804]
	ldr	r2, [r4, #24]
	cmp	r2, #0
	bne	.L98
	mov	r0, #23
	mov	r3, #0
	bfi	r3, r0, #0, #5
	mov	r1, #15
	bfi	r3, r1, #5, #5
	bfi	r3, r0, #10, #5
	bfi	r3, r1, #15, #5
	bfi	r3, r2, #20, #1
	str	r3, [r9, #24]
.L99:
	mov	r1, #16
	mov	r2, #0
	mov	r3, #0
	bfc	r2, #16, #16
	bfi	r3, r1, #6, #6
	bfc	r2, #0, #16
	mov	r1, #10
	str	r2, [r9, #552]
	bfi	r3, r1, #0, #6
	mov	r2, #2
	str	r3, [r9, #556]
	mov	r3, #0
	str	r2, [r9, #548]
	ldmib	r10, {r0, r2}
	ldr	r1, [r4, #1808]
	bfi	r3, r2, #8, #6
	ldr	r5, [fp, #-48]
	orr	r3, r3, #64
	ldr	r2, [r4, #1776]
	bfi	r3, r0, #0, #6
	bfi	r3, r1, #16, #6
	bfi	r3, r2, #24, #4
	str	r3, [r5, #3076]
	ldr	r3, [r4, #24]
	ldr	r0, [r10, #12]
	cmp	r3, #0
	sub	r0, r0, #1
	moveq	r6, #16
	movne	r6, #64
	mov	r1, r6
	add	r0, r0, r6
	bl	__aeabi_uidiv
	ldr	r3, [r10, #16]
	mov	r1, r6
	mov	r7, r0
	sub	r0, r3, #1
	add	r0, r0, r6
	bl	__aeabi_uidiv
	mul	r1, r7, r0
	ldr	r0, [r10, #172]
	bl	__aeabi_uidiv
	ldr	r2, [r4, #1796]
	mov	r3, #0
	ldr	r8, [fp, #-48]
	bfi	r3, r0, #0, #16
	mov	r0, #0
	bfi	r3, r2, #16, #6
	str	r3, [r5, #3080]
	ldr	r3, [r4, #24]
	mov	r2, r5
	ldr	ip, [r4, #1788]
	mov	r1, r0
	cmp	r3, #0
	ldrne	r2, [r4, #1832]
	moveq	r2, #4
	movne	r3, #0
	bfi	r3, r2, #0, #6
	ldr	r2, [r4, #1792]
	bfi	r3, ip, #24, #6
	ldr	ip, [r4, #1800]
	bfi	r3, r2, #16, #6
	mov	r2, r0
	bfi	r3, ip, #8, #6
	str	r3, [r8, #3084]
	ldr	lr, [r4, #1644]
	mov	r3, r0
	ldr	r6, [r4, #1640]
	mov	ip, r0
	bfi	r0, lr, #24, #8
	ldr	lr, [r4, #1636]
	bfi	r0, r6, #16, #8
	ldr	r6, [r4, #1632]
	bfi	r0, lr, #8, #8
	mov	lr, r1
	bfi	r0, r6, #0, #8
	str	r0, [r8, #3088]
	ldr	r7, [r4, #1660]
	mov	r0, r1
	ldr	r6, [r4, #1656]
	bfi	r1, r7, #24, #8
	ldr	r7, [r4, #1652]
	bfi	r1, r6, #16, #8
	ldr	r6, [r4, #1648]
	bfi	r1, r7, #8, #8
	bfi	r1, r6, #0, #8
	str	r1, [r8, #3092]
	ldr	r6, [r4, #1676]
	ldr	r1, [r4, #1672]
	bfi	r2, r6, #24, #8
	ldr	r6, [r4, #1668]
	bfi	r2, r1, #16, #8
	ldr	r1, [r4, #1664]
	bfi	r2, r6, #8, #8
	ldr	r5, [fp, #-48]
	bfi	r2, r1, #0, #8
	str	r2, [r8, #3096]
	ldr	r1, [r4, #1692]
	ldr	r2, [r4, #1688]
	bfi	r3, r1, #24, #8
	ldr	r1, [r4, #1684]
	bfi	r3, r2, #16, #8
	ldr	r2, [r4, #1680]
	bfi	r3, r1, #8, #8
	bfi	r3, r2, #0, #8
	str	r3, [r8, #3072]
	ldr	r2, [r4, #1824]
	ldr	r3, [r4, #1828]
	bfi	ip, r2, #0, #4
	bfi	ip, r3, #4, #4
	str	ip, [r8, #3100]
	ldr	r3, [r4, #1768]
	bfi	lr, r3, #0, #4
	str	lr, [r8, #3104]
	ldr	r2, [r4, #1764]
	ldr	r3, [r4, #1772]
	bfi	r0, r2, #0, #4
	bfi	r0, r3, #4, #4
	str	r0, [r8, #3108]
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ldrne	r2, [r4, #1780]
	moveq	r2, #3
	movne	r3, #0
	bfi	r3, r2, #0, #4
	str	r3, [r5, #3112]
	ldr	r2, [r4, #1696]
	mov	r3, #0
	ldr	r1, [r4, #1700]
	mov	ip, r3
	mov	r0, r3
	bfi	r3, r2, #0, #2
	ldr	r2, [r4, #1704]
	bfi	r3, r1, #2, #2
	ldr	r1, [r4, #1708]
	bfi	r3, r2, #4, #2
	ldr	r2, [r4, #1712]
	bfi	r3, r1, #6, #2
	ldr	r1, [r4, #1716]
	bfi	r3, r2, #8, #2
	ldr	r2, [r4, #1720]
	bfi	r3, r1, #10, #2
	ldr	r1, [r4, #1724]
	bfi	r3, r2, #12, #2
	ldr	r2, [r4, #1728]
	bfi	r3, r1, #14, #2
	ldr	r1, [r4, #1732]
	bfi	r3, r2, #16, #2
	ldr	r2, [r4, #1736]
	bfi	r3, r1, #18, #2
	ldr	r1, [r4, #1740]
	bfi	r3, r2, #20, #2
	ldr	r2, [r4, #1744]
	bfi	r3, r1, #22, #2
	ldr	r1, [r4, #1748]
	bfi	r3, r2, #24, #2
	ldr	r2, [r4, #1752]
	bfi	r3, r1, #26, #2
	ldr	r1, [r4, #1756]
	bfi	r3, r2, #28, #2
	add	r2, r4, #1824
	bfi	r3, r1, #30, #2
	str	r3, [r5, #3116]
	ldr	lr, [r4, #1760]
	add	r1, r9, #1088
	add	r3, r4, #1888
	add	r2, r2, #8
	bfi	ip, lr, #0, #5
	str	ip, [r5, #3120]
	ldr	ip, [r4, #1812]
	add	r1, r1, #12
	ldr	lr, [r4, #1816]
	add	r3, r3, #8
	bfi	r0, ip, #24, #4
	ldr	ip, [r4, #1820]
	bfi	r0, lr, #28, #4
	ldr	lr, [r4, #1784]
	bfi	r0, ip, #16, #6
	ldr	ip, [r4, #1804]
	bfi	r0, lr, #8, #4
	bfi	r0, ip, #0, #6
	str	r0, [r5, #3124]
	ldr	r5, [fp, #-128]
.L105:
	ldr	r0, [r2, #4]!
	cmp	r2, r3
	bfi	r5, r0, #0, #20
	str	r5, [r1, #4]!
	bne	.L105
	add	r2, r9, #1264
	add	r0, r4, #2144
	add	r2, r2, #12
	add	r0, r0, #8
.L106:
	ldr	r1, [r3, #4]!
	cmp	r3, r0
	bfi	r5, r1, #0, #20
	str	r5, [r2, #4]!
	bne	.L106
	ldr	r6, [fp, #-48]
	mov	r5, #0
	mov	r1, r5
	mov	r2, r5
	bfi	r1, r5, #0, #16
	bfi	r2, r5, #0, #16
	mov	r3, r5
	bfi	r3, r5, #16, #16
	str	r5, [r6, #3660]
	bfi	r1, r5, #16, #16
	str	r5, [r9, #572]
	bfi	r2, r5, #16, #16
	str	r5, [r9, #580]
	bfi	r3, r5, #0, #16
	str	r1, [r9, #584]
	mov	r0, r5
	str	r2, [r9, #588]
	bfi	r0, r5, #0, #1
	str	r3, [r9, #592]
	mvn	r2, #0
	str	r0, [r9, #564]
	mov	r3, #7
	str	r2, [r9, #596]
	mov	r1, r5
	str	r2, [r9, #604]
	bfi	r1, r5, #0, #1
	str	r2, [r9, #612]
	mov	r7, r5
	str	r1, [r9, #568]
	mov	r1, #13
	str	r2, [r9, #620]
	mov	ip, r5
	str	r1, [r9, #576]
	mov	lr, r5
	str	r3, [r9, #600]
	mov	r2, r5
	str	r3, [r9, #608]
	mov	r1, r10
	str	r3, [r9, #616]
	mov	r0, r4
	str	r3, [r9, #624]
	add	r6, r6, #8192
	ldr	r3, [r4, #2364]
	bfi	r7, r3, #0, #1
	str	r7, [r9, #120]
	ldr	r3, [r4, #2368]
	str	r3, [r9, #96]
	ldr	r3, [r4, #2372]
	str	r3, [r9, #100]
	ldr	r3, [r4, #2376]
	str	r3, [r9, #104]
	ldr	r3, [r4, #2380]
	str	r3, [r9, #108]
	ldr	r3, [r4, #2384]
	str	r3, [r9, #112]
	ldr	r3, [r4, #2388]
	str	r3, [r9, #116]
	ldr	r7, [r4, #1612]
	ldr	r3, [r4, #1616]
	bfi	ip, r7, #0, #16
	bfi	ip, r3, #16, #16
	str	ip, [r9, #1728]
	ldr	r3, [r4, #1628]
	bfi	lr, r3, #16, #16
	str	lr, [r9, #1732]
	ldr	ip, [r4, #1620]
	ldr	r3, [r4, #1624]
	bfi	r2, ip, #0, #16
	bfi	r2, r3, #16, #16
	str	r2, [r9, #1736]
	bl	VENC_HAL_VEDU_DDRCfg_CABAC_VLC
	ldr	r1, [r4, #48]
	mov	r2, r5
	bfi	r2, r5, #0, #1
	mov	r3, r5
	bfi	r3, r5, #16, #8
	str	r1, [r9, #68]
	mov	ip, #0
	str	r2, [r6, #1040]
	mvn	r1, #84
	ldr	r2, [r4, #436]
	mov	r0, ip
	str	r2, [r6, #1044]
	ldr	r2, [r10, #44]
	cmp	r2, r5
	mov	r5, ip
	bfieq	r3, r2, #0, #1
	orrne	r3, r3, #1
	str	r3, [r9, #76]
	mov	r3, #0
	ldr	r2, [r4, #268]
	bfi	r3, r1, #0, #8
	str	ip, [r9, #84]
	mov	r1, #85
	str	ip, [r9, #88]
	bfi	r3, r1, #8, #8
	str	r2, [r9, #80]
	mov	r1, ip
	str	r3, [r9, #28]
	mov	r2, ip
	str	ip, [r9, #92]
	mov	r3, ip
	ldr	ip, [r4, #2156]
	ldr	lr, [r4, #2160]
	bfi	r1, ip, #0, #6
	ldr	ip, [r4, #2164]
	bfi	r1, lr, #8, #2
	ldr	lr, [r4, #2168]
	bfi	r1, ip, #10, #1
	ldr	ip, [r4, #2172]
	bfi	r1, lr, #12, #4
	bfi	r1, ip, #16, #5
	str	r1, [r6, #4048]
	ldr	r1, [r4, #2228]
	str	r1, [r6, #4052]
	ldr	r1, [r4, #2232]
	str	r1, [r6, #4056]
	ldr	ip, [r4, #2236]
	ldr	r1, [r4, #2240]
	bfi	r3, ip, #0, #16
	ldr	ip, [r4, #2244]
	bfi	r3, r1, #16, #2
	ldr	r1, [r4, #2248]
	bfi	r3, ip, #18, #2
	ldr	ip, [r4, #2252]
	bfi	r3, r1, #20, #4
	ldr	r1, [r4, #2260]
	bfi	r3, ip, #24, #1
	ldr	ip, [r4, #2264]
	bfi	r3, r1, #25, #2
	ldr	r1, [r4, #2256]
	bfi	r3, ip, #27, #1
	bfi	r3, r1, #28, #1
	str	r3, [r6, #4060]
	ldr	r1, [r4, #2296]
	ldr	r3, [r4, #2292]
	bfi	r2, r1, #0, #1
	ldr	r1, [r4, #2288]
	bfi	r2, r3, #2, #2
	ldr	r3, [r4, #2284]
	bfi	r2, r1, #4, #2
	ldr	r1, [r4, #2304]
	bfi	r2, r3, #6, #1
	ldr	r3, [r4, #2308]
	bfi	r2, r1, #8, #6
	bfi	r2, r3, #24, #6
	str	r2, [r6, #4064]
	ldr	r2, [r4, #2312]
	ldr	r3, [r4, #2316]
	bfi	r0, r2, #0, #6
	ldr	r2, [r4, #2320]
	bfi	r0, r3, #8, #6
	ldr	r3, [r4, #2324]
	bfi	r0, r2, #16, #6
	bfi	r0, r3, #24, #6
	str	r0, [r6, #4068]
	ldr	r1, [r4, #24]
	ldr	r2, [r4, #2328]
	cmp	r1, r5
	ldr	r1, [r10, #16]
	ldr	r3, [r4, #2332]
	bfi	r5, r2, #0, #6
	ldr	r0, [r10, #172]
	moveq	r1, r1, lsr #4
	movne	r1, r1, lsr #6
	bfi	r5, r3, #6, #25
	bl	__aeabi_uidiv
	mov	r3, #0
	mov	r2, r3
	mov	r1, r3
	bfi	r5, r0, #6, #25
	str	r5, [r6, #4072]
	ldr	ip, [r4, #328]
	ldr	r0, [r4, #344]
	bfi	r3, ip, #10, #1
	ldr	ip, [r4, #324]
	bfi	r3, r0, #9, #1
	ldr	r0, [r4, #348]
	bfi	r3, ip, #8, #1
	ldr	ip, [r4, #352]
	bfi	r3, r0, #7, #1
	ldr	r0, [r4, #336]
	bfi	r3, ip, #6, #1
	ldr	ip, [r4, #332]
	bfi	r3, r0, #5, #1
	ldr	r0, [r4, #356]
	bfi	r3, ip, #4, #1
	ldr	ip, [r4, #360]
	ldr	r5, [fp, #-48]
	bfi	r3, r0, #3, #1
	ldr	r0, [r4, #364]
	bfi	r3, ip, #2, #1
	ldr	ip, [r4, #368]
	bfi	r3, r0, #1, #1
	add	r0, r5, #61440
	bfi	r3, ip, #0, #1
	str	r3, [r5, #504]
	ldr	lr, [r4, #340]
	mov	r3, r2
	ldr	ip, [r4, #372]
	bfi	r3, r2, #1, #1
	bfi	r2, lr, #7, #1
	ldr	lr, [r4, #376]
	bfi	r2, ip, #6, #1
	ldr	ip, [r4, #380]
	bfi	r2, lr, #5, #1
	ldr	lr, [r4, #384]
	bfi	r2, ip, #4, #1
	ldr	ip, [r4, #388]
	bfi	r2, lr, #3, #1
	ldr	lr, [r4, #392]
	bfi	r2, ip, #2, #1
	ldr	ip, [r4, #396]
	bfi	r2, lr, #1, #1
	bfc	r3, #2, #1
	bfi	r2, ip, #0, #1
	str	r2, [r5, #508]
	ldr	r2, [r4, #400]
	mov	lr, #3
	ldr	ip, [r4, #404]
	bfc	r3, #3, #1
	bfi	r1, r2, #0, #1
	mov	r2, #0
	bfi	r1, ip, #3, #1
	mov	ip, #1
	bfi	r1, lr, #16, #4
	str	r1, [r0]
	str	r3, [r0, #32]
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #2644]
	add	r3, r3, #61440
	str	r1, [r3, #520]
	ldr	r1, [r4, #2644]
	str	r1, [r3, #524]
	ldr	r1, [r4, #2652]
	str	r1, [r3, #752]
	ldr	r1, [r4, #2648]
	str	r1, [r3, #756]
	ldr	r1, [r4, #2652]
	str	r1, [r3, #772]
	ldr	r1, [r4, #2648]
	str	r1, [r3, #776]
	str	r2, [r0, #8]
	str	r2, [r5, #16]
	str	ip, [r5, #16]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L98:
	mov	r2, #15
	mov	r3, #0
	bfi	r3, r2, #0, #5
	bfi	r3, r2, #5, #5
	bfi	r3, r2, #10, #5
	bfi	r3, r2, #15, #5
	bfc	r3, #20, #1
	str	r3, [r9, #24]
	b	.L99
.L115:
	mov	r2, #6
.L92:
	bfi	r3, r2, #6, #4
	bfc	r3, #14, #1
.L93:
	ldrb	r2, [r4, #64]
	b	.L94
.L121:
	ldr	r2, [r10, #16]
	ldr	r3, [r10, #12]
	mov	r2, r2, lsr #2
	sub	r2, r2, #16
	mov	r3, r3, lsr #2
	sub	r3, r3, #16
	mov	r2, r2, lsr #1
	cmp	r2, #32
	mov	r3, r3, lsr #1
	movcs	r2, #32
	cmp	r3, #72
	bic	r2, r2, #-2147483645
	movcs	r3, #72
	cmp	r2, #7
	bic	r3, r3, #-2147483645
	movls	r2, #7
	bls	.L89
	cmp	r2, #32
	movcs	r2, #32
	sub	r2, r2, #1
	and	r2, r2, #63
.L89:
	cmp	r3, #7
	movls	r3, #7
	bls	.L90
	cmp	r3, #72
	movcs	r3, #72
	sub	r3, r3, #1
	and	r3, r3, #127
.L90:
	mov	ip, #0
	bfi	ip, r2, #16, #6
	bfi	ip, r3, #0, #7
	b	.L91
	UNWIND(.fnend)
	.size	VENC_HAL_DDRCfgReg, .-VENC_HAL_DDRCfgReg
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
