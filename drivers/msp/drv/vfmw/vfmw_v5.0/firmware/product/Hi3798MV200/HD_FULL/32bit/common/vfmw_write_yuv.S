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
	.file	"vfmw_write_yuv.c"
	.text
	.align	2
	.global	YUV_DumpFrameYuv
	.type	YUV_DumpFrameYuv, %function
YUV_DumpFrameYuv:
	UNWIND(.fnstart)
	@ args = 32, pretend = 0, frame = 56
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
	subs	r10, r0, #0
	mov	r9, r3
	mov	ip, r1
	mov	r3, #0
	str	r2, [fp, #-96]
	str	r3, [fp, #-92]
	str	r3, [fp, #-88]
	str	r3, [fp, #-84]
	str	r3, [fp, #-80]
	str	r3, [fp, #-76]
	str	r3, [fp, #-72]
	str	r3, [fp, #-68]
	str	r3, [fp, #-64]
	str	r3, [fp, #-60]
	str	r3, [fp, #-56]
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	ldr	r4, [fp, #32]
	ldr	r3, [fp, #20]
	beq	.L1
	sub	r2, r3, #1
	cmp	r2, #16
	bhi	.L4
	mov	r1, #1
	movw	r0, #7683
	mov	r2, r1, asl r2
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L5
	tst	r2, #65536
	bne	.L6
.L4:
	cmp	r3, #16
	add	r2, r9, #255
	bic	r0, r2, #255
	beq	.L51
	cmp	r3, #17
	beq	.L52
	ldr	r3, [fp, #4]
	mov	lr, #0
	add	r1, r3, #31
	mov	r3, lr
	bic	r1, r1, #31
.L8:
	ldr	r2, [r4, #200]
	cmp	r2, #10
	beq	.L10
.L57:
	ldr	r3, [fp, #4]
	mov	r8, #0
	ldr	r7, .L59
	mov	r6, r8
	mul	r5, r9, r3
.L11:
	ldr	r0, .L59+4
	ldr	r1, .L59+8
	sub	r3, fp, #92
	str	r6, [fp, #-72]
	ldr	r6, [fp, #-96]
	ldr	r1, [r1]
	str	ip, [fp, #-76]
	ldr	ip, [r0]
	sub	r0, fp, #76
	ldrb	lr, [r4, #126]	@ zero_extendqisi2
	str	r6, [fp, #-68]
	ldr	r6, [r4, #164]
	eor	lr, lr, #2
	str	r2, [fp, #-60]
	add	r2, ip, #9437184
	str	ip, [fp, #-92]
	add	ip, r1, #9437184
	str	r2, [fp, #-84]
	ubfx	lr, lr, #1, #1
	str	r1, [fp, #-88]
	ldr	r2, [r4, #132]
	ldr	r1, [r4, #128]
	str	r8, [fp, #-64]
	str	ip, [fp, #-80]
	str	lr, [fp, #-52]
	str	r6, [fp, #-48]
	bl	IMAGE_TileTo2D
	ldr	r3, [r4, #200]
	cmp	r3, #10
	ldrne	r0, [fp, #-92]
	beq	.L53
.L16:
	ldr	r3, [r7, #44]
	mov	r2, r10
	mov	r1, r5
	blx	r3
.L17:
	ldr	r1, [r4, #200]
	cmp	r1, #10
	beq	.L54
	ldr	r2, [r4, #132]
	ldr	r6, [fp, #-84]
	cmp	r2, #1
	bls	.L23
.L21:
	ldr	r3, [r4, #128]
	mov	r0, #0
	ldr	r5, .L59+12
	ldr	lr, .L59+16
.L31:
	cmp	r1, #10
	beq	.L24
	cmp	r3, #1
	movhi	r1, r6
	movhi	r2, #0
	bls	.L26
.L30:
	mul	r3, r0, r3
	ldr	ip, [r5]
	ldrb	r8, [r6, r2, asl #1]	@ zero_extendqisi2
	add	r1, r1, #2
	add	ip, ip, r2
	strb	r8, [ip, r3, lsr #1]
	ldr	ip, [r4, #128]
	ldr	r3, [lr]
	ldrb	r8, [r1, #-1]	@ zero_extendqisi2
	mul	ip, ip, r0
	add	r3, r3, r2
	add	r2, r2, #1
	strb	r8, [r3, ip, lsr #1]
	ldr	r3, [r4, #128]
	cmp	r2, r3, lsr #1
	bcc	.L30
	ldr	r1, [r4, #200]
.L26:
	add	r6, r6, r3
.L29:
	ldr	r2, [r4, #132]
	add	r0, r0, #1
	cmp	r0, r2, lsr #1
	bcc	.L31
.L22:
	cmp	r1, #10
	beq	.L55
.L32:
	mul	r1, r2, r3
	ldr	ip, [r7, #44]
	mov	r2, r10
	ldr	r0, [lr]
	mov	r1, r1, lsr #2
	blx	ip
	ldr	r1, [r4, #132]
	ldr	r3, [r4, #128]
	mov	r2, r10
	ldr	r0, [r5]
	ldr	ip, [r7, #44]
	mul	r1, r3, r1
	mov	r1, r1, lsr #2
	blx	ip
.L33:
	ldr	r1, [fp, #16]
	ldr	r3, [fp, #28]
	ldr	r2, [fp, #24]
	str	r1, [sp, #8]
	ldr	r1, [fp, #8]
	str	r3, [sp, #16]
	str	r2, [sp, #12]
	mov	r2, r9
	str	r1, [sp, #4]
	ldr	r1, [fp, #12]
	ldr	r3, [fp, #4]
	ldr	ip, [r7, #64]
	str	r1, [sp]
	ldr	r0, .L59+20
	ldr	r1, .L59+24
	blx	ip
	ldr	r3, [r4, #200]
	cmp	r3, #10
	bne	.L1
	ldr	r3, .L59+28
	ldr	r0, [r3, #8]
	cmp	r0, #0
	bne	.L56
.L1:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L24:
	cmp	r3, #1
	bls	.L27
	mov	r1, r6
	mov	r2, #0
.L28:
	mul	r3, r0, r3
	ldrh	r8, [r1]
	ldr	ip, [r5]
	add	r1, r1, #4
	add	r3, r2, r3, lsr #1
	mov	r3, r3, asl #1
	strh	r8, [ip, r3]	@ movhi
	ldr	r3, [r4, #128]
	ldrh	r8, [r1, #-2]
	ldr	ip, [lr]
	mul	r3, r3, r0
	add	r3, r2, r3, lsr #1
	add	r2, r2, #1
	mov	r3, r3, asl #1
	strh	r8, [ip, r3]	@ movhi
	ldr	r3, [r4, #128]
	cmp	r2, r3, lsr #1
	bcc	.L28
	ldr	r1, [r4, #200]
.L27:
	add	r6, r6, r3, lsl #1
	b	.L29
.L51:
	ldr	r3, [fp, #24]
	ldr	r1, [fp, #4]
	cmp	r3, #8
	ble	.L37
	cmp	r0, #0
	ldr	r2, [r4, #200]
	add	r3, r0, #3
	add	lr, r1, #31
	movge	r3, r0
	cmp	r2, #10
	bic	lr, lr, #31
	mov	r3, r3, asr #2
	bne	.L57
.L10:
	mul	r6, r1, r0
	ldr	r2, [fp, #4]
	ldr	r7, .L59
	mov	r1, #0
	ldr	r0, .L59+28
	mul	r5, r9, r2
	mov	r2, #24
	add	r6, r6, r6, lsl #1
	str	ip, [fp, #-100]
	add	r6, ip, r6, asr #1
	mla	r8, lr, r3, r6
	ldr	r3, [r7, #48]
	blx	r3
	ldr	r3, .L59+28
	mov	r1, #1
	mov	lr, #3
	str	r1, [sp]
	mov	r2, r5, asl #1
	mov	r1, #0
	ldr	r0, .L59+32
	str	lr, [r3, #20]
	bl	MEM_AllocMemBlock
	ldr	ip, [fp, #-100]
	cmp	r0, #0
	bne	.L58
	ldr	r3, .L59+28
	ldr	r1, .L59+28
	ldr	r2, [r4, #200]
	ldr	r3, [r3, #4]
	str	r3, [r1, #24]
	b	.L11
.L37:
	mov	lr, #0
	mov	r3, lr
	b	.L8
.L54:
	cmp	r5, #0
	ldr	r0, .L59+28
	movne	ip, #2
	movne	r3, #0
	beq	.L19
.L20:
	ldr	r2, [fp, #-80]
	mov	r1, r3, asl #1
	ldr	r6, [fp, #-84]
	ldr	lr, [r0, #24]
	ldrb	r2, [r2, r3, lsr #2]	@ zero_extendqisi2
	ldrb	r6, [r6, r3]	@ zero_extendqisi2
	and	r2, r2, #3
	add	r2, r2, r6, lsl #2
	strh	r2, [lr, r1]	@ movhi
	ldr	r2, [fp, #-84]
	ldr	r6, [fp, #-80]
	add	r2, r2, r3
	ldr	r1, [r0, #24]
	ldrb	lr, [r2, #1]	@ zero_extendqisi2
	ldrb	r2, [r6, r3, lsr #2]	@ zero_extendqisi2
	ubfx	r2, r2, #2, #2
	add	r2, r2, lr, lsl #2
	strh	r2, [r1, ip]	@ movhi
	ldr	r2, [fp, #-84]
	ldr	r6, [fp, #-80]
	add	r2, r2, r3
	ldr	r1, [r0, #24]
	ldrb	lr, [r2, #2]	@ zero_extendqisi2
	add	r1, r1, ip
	ldrb	r2, [r6, r3, lsr #2]	@ zero_extendqisi2
	ubfx	r2, r2, #4, #2
	add	r2, r2, lr, lsl #2
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [fp, #-84]
	ldr	r2, [fp, #-80]
	add	lr, lr, r3
	ldr	r1, [r0, #24]
	ldrb	r2, [r2, r3, lsr #2]	@ zero_extendqisi2
	add	r3, r3, #4
	ldrb	lr, [lr, #3]	@ zero_extendqisi2
	add	r1, r1, ip
	cmp	r3, r5
	add	ip, ip, #8
	mov	r2, r2, lsr #6
	add	r2, r2, lr, lsl #2
	strh	r2, [r1, #4]	@ movhi
	bcc	.L20
	ldr	r1, [r4, #200]
.L19:
	ldr	r2, [r4, #132]
	ldr	r6, [r0, #24]
	cmp	r2, #1
	bhi	.L21
	ldr	r3, [r4, #128]
	ldr	r5, .L59+12
	ldr	lr, .L59+16
	b	.L22
.L53:
	cmp	r5, #0
	ldr	r0, .L59+28
	beq	.L14
	mov	ip, #2
	mov	r3, #0
.L15:
	ldr	r6, [fp, #-92]
	mov	r1, r3, asl #1
	ldr	r2, [fp, #-88]
	ldr	lr, [r0, #24]
	ldrb	r8, [r6, r3]	@ zero_extendqisi2
	ldrb	r2, [r2, r3, lsr #2]	@ zero_extendqisi2
	ldr	r6, .L59+28
	and	r2, r2, #3
	add	r2, r2, r8, lsl #2
	strh	r2, [lr, r1]	@ movhi
	ldr	r2, [fp, #-92]
	ldr	r8, [fp, #-88]
	add	r2, r2, r3
	ldr	r1, [r0, #24]
	ldrb	lr, [r2, #1]	@ zero_extendqisi2
	ldrb	r2, [r8, r3, lsr #2]	@ zero_extendqisi2
	ubfx	r2, r2, #2, #2
	add	r2, r2, lr, lsl #2
	strh	r2, [r1, ip]	@ movhi
	ldr	r2, [fp, #-92]
	ldr	r8, [fp, #-88]
	add	r2, r2, r3
	ldr	r1, [r0, #24]
	ldrb	lr, [r2, #2]	@ zero_extendqisi2
	add	r1, r1, ip
	ldrb	r2, [r8, r3, lsr #2]	@ zero_extendqisi2
	ubfx	r2, r2, #4, #2
	add	r2, r2, lr, lsl #2
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [fp, #-92]
	ldr	r2, [fp, #-88]
	add	lr, lr, r3
	ldr	r1, [r0, #24]
	ldrb	r2, [r2, r3, lsr #2]	@ zero_extendqisi2
	add	r3, r3, #4
	ldrb	lr, [lr, #3]	@ zero_extendqisi2
	add	r1, r1, ip
	cmp	r3, r5
	add	ip, ip, #8
	mov	r2, r2, lsr #6
	add	r2, r2, lr, lsl #2
	strh	r2, [r1, #4]	@ movhi
	bcc	.L15
	ldr	r3, [r4, #200]
	ldr	r0, [r6, #24]
	cmp	r3, #10
	str	r0, [fp, #-92]
	bne	.L16
.L35:
	ldr	r3, [r7, #44]
	mov	r2, r10
	mov	r1, r5, asl #1
	blx	r3
	b	.L17
.L5:
	ldr	r2, [fp, #4]
	add	r1, r9, #15
	bic	r9, r1, #15
	add	r2, r2, #15
	bic	r2, r2, #15
	str	r2, [fp, #4]
	b	.L4
.L52:
	ldr	r3, [fp, #24]
	cmp	r3, #8
	ldr	r3, [fp, #4]
	add	r1, r3, #63
	bic	r1, r1, #63
	ble	.L37
	cmp	r0, #0
	add	r3, r0, #3
	mov	lr, r1
	movge	r3, r0
	mov	r3, r3, asr #2
	b	.L8
.L56:
	ldr	r1, [r3, #4]
	bl	MEM_ReleaseMemBlock
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L6:
	ldr	r2, [fp, #4]
	add	r1, r9, #7
	bic	r9, r1, #7
	add	r2, r2, #7
	bic	r2, r2, #7
	str	r2, [fp, #4]
	b	.L4
.L55:
	mul	r1, r2, r3
	ldr	ip, [r7, #44]
	mov	r2, r10
	ldr	r0, [lr]
	mov	r1, r1, lsr #1
	blx	ip
	ldr	r1, [r4, #132]
	ldr	r3, [r4, #128]
	mov	r2, r10
	ldr	r0, [r5]
	ldr	ip, [r7, #44]
	mul	r1, r3, r1
	mov	r1, r1, lsr #1
	blx	ip
	b	.L33
.L23:
	ldr	r3, [r4, #128]
	ldr	r5, .L59+12
	ldr	lr, .L59+16
	b	.L32
.L58:
	ldr	r3, [r7, #64]
	ldr	r1, .L59+24
	ldr	r0, .L59+36
	blx	r3
	b	.L1
.L14:
	ldr	r0, [r0, #24]
	str	r0, [fp, #-92]
	b	.L35
.L60:
	.align	2
.L59:
	.word	vfmw_Osal_Func_Ptr_S
	.word	pY
	.word	pY_2bit
	.word	pVl
	.word	pUl
	.word	.LC2
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	UNWIND(.fnend)
	.size	YUV_DumpFrameYuv, .-YUV_DumpFrameYuv
	.align	2
	.global	YUV_WriteYuv
	.type	YUV_WriteYuv, %function
YUV_WriteYuv:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #56)
	sub	sp, sp, #56
	ldr	r9, .L91
	mov	r3, #0
	mov	r5, r0
	mov	r4, r1
	str	r3, [fp, #-60]
	ldr	r2, [r9, r0, asl #2]
	str	r3, [fp, #-56]
	cmp	r2, r3
	str	r3, [fp, #-52]
	str	r3, [fp, #-48]
	str	r3, [fp, #-44]
	str	r3, [fp, #-40]
	beq	.L63
	add	r3, r1, #544
	ldrb	r8, [r1, #124]	@ zero_extendqisi2
	ldrd	r6, [r3]
	orrs	r3, r6, r7
	beq	.L64
	add	r3, r1, #560
	ldrd	r2, [r3, #-8]
	orrs	r1, r2, r3
	bne	.L65
.L64:
	ldr	r2, [r4, #28]
	sub	r0, fp, #60
	ldr	r3, .L91+4
	str	r2, [fp, #-52]
	ldr	r3, [r3, #160]
	blx	r3
	subs	r6, r0, #0
	beq	.L88
	ldr	r3, [r4, #32]
	ldr	r2, [r4, #28]
	rsb	r2, r2, r3
	adds	r2, r6, r2
	movne	r0, #1
	moveq	r0, #0
.L67:
	ldr	r1, [r4, #204]
	ldr	r3, .L91+8
	cmp	r1, #10
	movne	r1, #8
	cmp	r0, #0
	str	r1, [r3, #28]
	bne	.L89
.L63:
	ldr	r3, .L91+12
	ldr	r2, [r3, r5, asl #2]
	cmp	r2, #0
	beq	.L71
	add	r3, r4, #272
	ldrd	r0, [r3, #-8]
	orrs	r3, r0, r1
	beq	.L71
	ldr	r3, [r4, #252]
	cmp	r3, #0
	bne	.L90
.L71:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L65:
	cmp	r2, #0
	cmpne	r6, #0
	movne	r0, #1
	moveq	r0, #0
	b	.L67
.L90:
	ldr	ip, .L91+4
	mov	r1, r3
	ldr	r3, [ip, #44]
	blx	r3
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L89:
	ldr	r0, .L91+16
	tst	r8, #28
	ldr	r1, [r3, #28]
	mov	ip, #0
	ldr	r3, [r4, #200]
	moveq	r8, #1
	ldr	lr, [r0, r5, asl #2]
	movne	r8, #0
	str	r1, [sp, #24]
	mov	r1, r6
	str	r4, [sp, #28]
	ldr	r0, [r9, r5, asl #2]
	str	r3, [sp, #20]
	ldr	r9, [lr, #52]
	ldr	r7, [r4, #164]
	ldr	lr, [r4, #132]
	ldr	r3, [r4, #128]
	str	r9, [sp, #16]
	str	r8, [sp, #12]
	str	r7, [sp, #8]
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	YUV_DumpFrameYuv
	ldr	r3, .L91+4
	mov	r0, r6
	ldr	r3, [r3, #164]
	blx	r3
	b	.L63
.L88:
	ldr	r1, .L91+20
	mov	r0, #32
	bl	dprint_vfmw
	mov	r0, r6
	mov	r2, r6
	b	.L67
.L92:
	.align	2
.L91:
	.word	vfmw_save_yuv_file
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0
	.word	vfmw_save_metadata_reorder_file
	.word	s_pstVfmwChan
	.word	.LC3
	UNWIND(.fnend)
	.size	YUV_WriteYuv, .-YUV_WriteYuv
	.global	YuvMem
	.global	pYuv
	.global	g_SaveYUVBitWidth
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__func__.14477, %object
	.size	__func__.14477, 17
__func__.14477:
	.ascii	"YUV_DumpFrameYuv\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"IMAGE_10Bit\000" )
.LC1:
	ASCII(.ascii	"%s alloc calc mem size failed!\012\000" )
.LC2:
	ASCII(.ascii	"%s: Width=%d, Height=%d, Stride=%d, PicStructure=%d" )
	ASCII(.ascii	", ChromaIDC=%d, RealBitDepth=%d, SaveBitDepth=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC3:
	ASCII(.ascii	" luma_vir_addr MAP return error\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	YuvMem, %object
	.size	YuvMem, 24
YuvMem:
	.space	24
	.type	pYuv, %object
	.size	pYuv, 4
pYuv:
	.space	4
	.type	g_SaveYUVBitWidth, %object
	.size	g_SaveYUVBitWidth, 4
g_SaveYUVBitWidth:
	.space	4
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
