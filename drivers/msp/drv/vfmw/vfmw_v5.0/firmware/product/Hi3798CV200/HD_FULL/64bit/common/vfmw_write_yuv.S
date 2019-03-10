#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vfmw_write_yuv.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	YUV_DumpFrameYuv
	.type	YUV_DumpFrameYuv, %function
YUV_DumpFrameYuv:
	sub	sp, sp, #224
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	stp	x23, x24, [sp, 64]
	stp	x25, x26, [sp, 80]
	stp	x27, x28, [sp, 96]
	mov	x21, x0
	mov	x0, x30
	mov	x27, x1
	mov	x28, x2
	mov	w19, w3
	mov	w20, w4
	mov	w23, w6
	mov	w24, w7
	ldr	w26, [x29, 208]
	ldr	x25, [x29, 232]
	str	w5, [x29, 124]
	bl	_mcount
	stp	xzr, xzr, [x29, 128]
	stp	xzr, xzr, [x29, 144]
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 176]
	stp	xzr, xzr, [x29, 192]
	cbz	x21, .L1
	sub	w0, w26, #1
	cmp	w0, 16
	bls	.L54
.L4:
	cmp	w26, 16
	add	w1, w19, 255
	and	w1, w1, -256
	beq	.L55
.L9:
	cmp	w26, 17
	beq	.L8
	add	w3, w20, 31
	mov	w6, 0
	and	w3, w3, -32
	mov	w0, 0
.L10:
	ldr	w2, [x25, 200]
	cmp	w2, 10
	beq	.L12
.L60:
	mul	w22, w19, w20
	ldr	x26, .LC1
	mov	x6, 0
	mov	x7, 0
.L13:
	ldrb	w0, [x25, 126]
	add	x3, x29, 128
	ldr	w4, [x25, 164]
	eor	x0, x0, 2
	str	w2, [x29, 192]
	ubfx	x0, x0, 1, 1
	ldr	w1, [x25, 128]
	stp	w0, w4, [x29, 200]
	ldr	x0, .LC8
	ldr	w2, [x25, 132]
	stp	x27, x7, [x29, 160]
	ldr	x0, [x0]
	str	x0, [x29, 128]
	add	x0, x0, 9437184
	str	x0, [x29, 144]
	ldr	x0, .LC9
	stp	x28, x6, [x29, 176]
	ldr	x0, [x0]
	str	x0, [x29, 136]
	add	x0, x0, 9437184
	str	x0, [x29, 152]
	add	x0, x29, 160
	bl	IMAGE_TileTo2D
	ldr	w0, [x25, 200]
	cmp	w0, 10
	beq	.L56
	ldr	x0, [x29, 128]
.L18:
	ldr	x3, [x26, 88]
	mov	x2, x21
	mov	w1, w22
	blr	x3
.L19:
	ldr	w6, [x25, 200]
	cmp	w6, 10
	beq	.L57
	ldr	w5, [x25, 132]
	ldr	x4, [x29, 144]
	cmp	w5, 1
	bls	.L25
.L23:
	ldr	x27, .LC10
	mov	w2, 0
	ldr	x7, .LC11
	ldr	w0, [x25, 128]
	.p2align 2
.L33:
	cmp	w6, 10
	beq	.L26
	cmp	w0, 1
	mov	w3, 1
	mov	w1, 0
	bls	.L28
	.p2align 2
.L45:
	mul	w0, w2, w0
	ubfiz	x6, x1, 1, 31
	ldr	x5, [x27]
	add	w0, w1, w0, lsr 1
	ldrb	w6, [x4, x6]
	strb	w6, [x5, x0]
	ldr	w0, [x25, 128]
	ldr	x5, [x7]
	ldrb	w6, [x4, w3, uxtw]
	add	w3, w3, 2
	mul	w0, w2, w0
	add	w0, w1, w0, lsr 1
	add	w1, w1, 1
	strb	w6, [x5, x0]
	ldr	w0, [x25, 128]
	cmp	w1, w0, lsr 1
	bcc	.L45
	ldr	w5, [x25, 132]
	ldr	w6, [x25, 200]
.L28:
	add	x4, x4, x0, uxtw
.L31:
	add	w2, w2, 1
	cmp	w2, w5, lsr 1
	bcc	.L33
.L24:
	cmp	w6, 10
	beq	.L58
.L34:
	mul	w1, w5, w0
	ldr	x3, [x26, 88]
	mov	x2, x21
	ldr	x0, [x7]
	lsr	w1, w1, 2
	blr	x3
	ldp	w1, w3, [x25, 128]
	ldr	x0, [x27]
	mov	x2, x21
	mul	w1, w1, w3
	ldr	x3, [x26, 88]
	lsr	w1, w1, 2
	blr	x3
.L35:
	ldr	w0, [x29, 224]
	mov	w6, w24
	str	w0, [sp]
	mov	w4, w23
	ldr	x1, .LC5
	mov	w3, w20
	ldr	w5, [x29, 124]
	mov	w2, w19
	ldr	w7, [x29, 216]
	ldr	x0, .LC13
	ldr	x8, [x26, 128]
	blr	x8
	ldr	w0, [x25, 200]
	cmp	w0, 10
	bne	.L1
	ldr	x1, .LC2
	ldr	w0, [x1, 16]
	cbnz	w0, .L59
.L1:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
.L54:
	ldr	x1, .LC0
	ldrh	w0, [x1,w0,uxtw #1]
	adr	x1, .Lrtx6
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx6:
	.section	.rodata
	.align	0
	.align	2
.L6:
	.2byte	(.L5 - .Lrtx6) / 4
	.2byte	(.L5 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L5 - .Lrtx6) / 4
	.2byte	(.L5 - .Lrtx6) / 4
	.2byte	(.L5 - .Lrtx6) / 4
	.2byte	(.L5 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L4 - .Lrtx6) / 4
	.2byte	(.L7 - .Lrtx6) / 4
	.text
.L55:
	ldr	w0, [x29, 216]
	mov	w3, w20
	cmp	w0, 8
	ble	.L39
	ldr	w2, [x25, 200]
	cmp	w1, wzr
	add	w0, w1, 3
	add	w6, w20, 31
	csel	w0, w0, w1, lt
	cmp	w2, 10
	asr	w0, w0, 2
	and	w6, w6, -32
	bne	.L60
.L12:
	mul	w7, w3, w1
	ldr	x26, .LC1
	mov	x2, 32
	lsl	w1, w7, 2
	ldr	x8, .LC2
	sub	w7, w1, w7
	mov	w1, 0
	mul	w0, w0, w6
	asr	w7, w7, 1
	ldr	x3, [x26, 96]
	str	x8, [x29, 112]
	add	x7, x27, x7, sxtw
	add	x6, x7, x0, sxtw
	mov	x0, x8
	stp	x7, x6, [x29, 96]
	blr	x3
	ldr	x8, [x29, 112]
	mov	w9, 3
	mul	w22, w19, w20
	ldr	x0, .LC4
	mov	x3, x8
	mov	w4, 1
	lsl	w2, w22, 1
	mov	w1, 0
	str	w9, [x8, 28]
	bl	MEM_AllocMemBlock
	ldp	x7, x6, [x29, 96]
	ldr	x8, [x29, 112]
	cbnz	w0, .L61
	ldr	x0, [x8, 8]
	ldr	w2, [x25, 200]
	str	x0, [x8, 32]
	b	.L13
.L7:
	add	w19, w19, 7
	add	w20, w20, 7
	and	w19, w19, -8
	and	w20, w20, -8
	add	w1, w19, 255
	and	w1, w1, -256
.L8:
	ldr	w0, [x29, 216]
	add	w3, w20, 63
	and	w3, w3, -64
	cmp	w0, 8
	ble	.L39
	cmp	w1, wzr
	add	w0, w1, 3
	csel	w0, w0, w1, lt
	mov	w6, w3
	asr	w0, w0, 2
	b	.L10
.L5:
	add	w19, w19, 15
	cmp	w26, 16
	and	w19, w19, -16
	add	w20, w20, 15
	add	w1, w19, 255
	and	w20, w20, -16
	and	w1, w1, -256
	bne	.L9
	b	.L55
.L39:
	mov	w6, 0
	mov	w0, 0
	b	.L10
	.p2align 3
.L26:
	cmp	w0, 1
	bls	.L29
	mov	w3, 2
	mov	w1, 0
	.p2align 2
.L30:
	mul	w0, w2, w0
	ubfiz	x6, x1, 2, 30
	ldr	x5, [x27]
	add	w0, w1, w0, lsr 1
	ubfiz	x0, x0, 1, 31
	ldrh	w6, [x4, x6]
	strh	w6, [x5, x0]
	ldr	w0, [x25, 128]
	ldr	x5, [x7]
	ldrh	w6, [x4, w3, uxtw]
	add	w3, w3, 4
	mul	w0, w2, w0
	add	w0, w1, w0, lsr 1
	add	w1, w1, 1
	ubfiz	x0, x0, 1, 31
	strh	w6, [x5, x0]
	ldr	w0, [x25, 128]
	cmp	w1, w0, lsr 1
	bcc	.L30
	ldr	w5, [x25, 132]
	ldr	w6, [x25, 200]
.L29:
	ubfiz	x1, x0, 1, 31
	add	x4, x4, x1
	b	.L31
.L57:
	cbz	w22, .L62
	ldr	x1, .LC2
	mov	w0, 0
	.p2align 2
.L22:
	ldp	x2, x3, [x29, 144]
	ubfx	x4, x0, 2, 30
	ldr	x10, [x1, 32]
	add	w9, w0, 1
	add	w8, w0, 2
	ldrb	w2, [x2, w0, uxtw]
	add	w6, w0, 3
	ldrb	w7, [x3, x4]
	ubfiz	w3, w2, 2, 14
	and	w2, w7, 3
	add	w2, w2, w3
	strh	w2, [x10, w0, uxtw 1]
	add	w0, w0, 4
	ldp	x2, x3, [x29, 144]
	ldr	x7, [x1, 32]
	cmp	w0, w22
	ldrb	w3, [x3, x4]
	ldrb	w2, [x2, w9, uxtw]
	ubfx	x3, x3, 2, 2
	ubfiz	w2, w2, 2, 14
	add	w2, w3, w2
	strh	w2, [x7, w9, uxtw 1]
	ldp	x2, x3, [x29, 144]
	ldr	x7, [x1, 32]
	ldrb	w3, [x3, x4]
	ldrb	w2, [x2, w8, uxtw]
	ubfx	x3, x3, 4, 2
	ubfiz	w2, w2, 2, 14
	add	w2, w3, w2
	strh	w2, [x7, w8, uxtw 1]
	ldp	x2, x3, [x29, 144]
	ldr	x7, [x1, 32]
	ldrb	w2, [x2, w6, uxtw]
	ldrb	w3, [x3, x4]
	ubfiz	w2, w2, 2, 14
	add	w2, w2, w3, lsr 6
	strh	w2, [x7, w6, uxtw 1]
	bcc	.L22
	ldr	w6, [x25, 200]
.L21:
	ldr	w5, [x25, 132]
	ldr	x4, [x1, 32]
	cmp	w5, 1
	bhi	.L23
	ldr	x27, .LC10
	ldr	x7, .LC11
	ldr	w0, [x25, 128]
	b	.L24
	.p2align 3
.L56:
	cbz	w22, .L16
	ldr	x1, .LC2
	mov	w0, 0
	.p2align 2
.L17:
	ldp	x2, x3, [x29, 128]
	ubfx	x4, x0, 2, 30
	ldr	x10, [x1, 32]
	add	w9, w0, 1
	add	w8, w0, 2
	ldrb	w2, [x2, w0, uxtw]
	add	w6, w0, 3
	ldrb	w7, [x3, x4]
	ubfiz	w3, w2, 2, 14
	and	w2, w7, 3
	add	w2, w2, w3
	strh	w2, [x10, w0, uxtw 1]
	add	w0, w0, 4
	ldp	x2, x3, [x29, 128]
	ldr	x7, [x1, 32]
	cmp	w0, w22
	ldrb	w3, [x3, x4]
	ldrb	w2, [x2, w9, uxtw]
	ubfx	x3, x3, 2, 2
	ubfiz	w2, w2, 2, 14
	add	w2, w3, w2
	strh	w2, [x7, w9, uxtw 1]
	ldp	x2, x3, [x29, 128]
	ldr	x7, [x1, 32]
	ldrb	w3, [x3, x4]
	ldrb	w2, [x2, w8, uxtw]
	ubfx	x3, x3, 4, 2
	ubfiz	w2, w2, 2, 14
	add	w2, w3, w2
	strh	w2, [x7, w8, uxtw 1]
	ldp	x2, x3, [x29, 128]
	ldr	x7, [x1, 32]
	ldrb	w2, [x2, w6, uxtw]
	ldrb	w3, [x3, x4]
	ubfiz	w2, w2, 2, 14
	add	w2, w2, w3, lsr 6
	strh	w2, [x7, w6, uxtw 1]
	bcc	.L17
	ldr	x0, [x1, 32]
	ldr	w1, [x25, 200]
	str	x0, [x29, 128]
	cmp	w1, 10
	bne	.L18
.L37:
	ldr	x3, [x26, 88]
	mov	x2, x21
	lsl	w1, w22, 1
	blr	x3
	b	.L19
.L59:
	ldr	x1, [x1, 8]
	bl	MEM_ReleaseMemBlock
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
.L58:
	mul	w1, w5, w0
	ldr	x3, [x26, 88]
	mov	x2, x21
	ldr	x0, [x7]
	lsr	w1, w1, 1
	blr	x3
	ldp	w1, w3, [x25, 128]
	ldr	x0, [x27]
	mov	x2, x21
	mul	w1, w1, w3
	ldr	x3, [x26, 88]
	lsr	w1, w1, 1
	blr	x3
	b	.L35
.L25:
	ldr	x27, .LC10
	ldr	x7, .LC11
	ldr	w0, [x25, 128]
	b	.L34
.L61:
	ldr	x1, .LC5
	ldr	x2, [x26, 128]
	ldr	x0, .LC7
	blr	x2
	b	.L1
.L16:
	ldr	x1, .LC2
	ldr	x0, [x1, 32]
	str	x0, [x29, 128]
	b	.L37
.L62:
	ldr	x1, .LC2
	b	.L21
	.size	YUV_DumpFrameYuv, .-YUV_DumpFrameYuv
	.align	3
.LC0:
	.xword	.L6
	.align	3
.LC1:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC2:
	.xword	.LANCHOR0
	.align	3
.LC4:
	.xword	.LC3
	.align	3
.LC5:
	.xword	.LANCHOR1
	.align	3
.LC7:
	.xword	.LC6
	.align	3
.LC8:
	.xword	pY
	.align	3
.LC9:
	.xword	pY_2bit
	.align	3
.LC10:
	.xword	pVl
	.align	3
.LC11:
	.xword	pUl
	.align	3
.LC13:
	.xword	.LC12
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	YUV_WriteYuv
	.type	YUV_WriteYuv, %function
YUV_WriteYuv:
	sub	sp, sp, #128
	stp	x29, x30, [sp, 32]
	add	x29, sp, 32
	stp	x19, x20, [sp, 48]
	stp	x21, x22, [sp, 64]
	str	x23, [sp, 80]
	mov	w22, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x21, .LC14
	stp	xzr, xzr, [x29, 64]
	stp	xzr, xzr, [x29, 80]
	ldr	x0, [x21, w22, sxtw 3]
	cbz	x0, .L65
	ldr	x20, [x19, 544]
	ldrb	w23, [x19, 124]
	cbz	x20, .L66
	ldr	x2, [x19, 552]
	mov	w3, 1
	cbz	x2, .L66
.L69:
	ldr	w1, [x19, 204]
	ldr	x0, .LC18
	cmp	w1, 10
	beq	.L89
	mov	w1, 8
.L89:
	str	w1, [x0, 40]
	cbnz	w3, .L90
.L65:
	ldr	x0, .LC20
	ldr	x2, [x0, w22, sxtw 3]
	cbz	x2, .L73
	ldr	x0, [x19, 264]
	cbz	x0, .L73
	ldr	w1, [x19, 252]
	cbnz	w1, .L91
.L73:
	add	sp, x29, 0
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L66:
	ldr	x1, .LC15
	ldr	w0, [x19, 28]
	str	w0, [x29, 80]
	add	x0, x29, 64
	ldr	x1, [x1, 320]
	blr	x1
	mov	x20, x0
	cbz	x0, .L92
	ldp	w2, w0, [x19, 28]
	sub	w2, w0, w2
	adds	x2, x20, x2
	cset	w3, ne
	b	.L69
	.p2align 3
.L91:
	ldr	x3, .LC15
	ldr	x3, [x3, 88]
	blr	x3
	add	sp, x29, 0
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L90:
	str	x19, [sp, 24]
	tst	w23, 28
	ldr	x1, .LC19
	cset	w7, eq
	ldr	w3, [x19, 200]
	mov	w5, 0
	ldr	w0, [x0, 40]
	ldr	w6, [x19, 164]
	str	w3, [sp, 8]
	str	w0, [sp, 16]
	ldr	x1, [x1, w22, sxtw 3]
	ldr	x0, [x21, w22, sxtw 3]
	ldr	w1, [x1, 52]
	str	w1, [sp]
	mov	x1, x20
	ldp	w3, w4, [x19, 128]
	bl	YUV_DumpFrameYuv
	ldr	x1, .LC15
	mov	x0, x20
	ldr	x1, [x1, 328]
	blr	x1
	b	.L65
	.p2align 3
.L92:
	ldr	x1, .LC17
	mov	w0, 32
	bl	dprint_vfmw
	mov	w3, 0
	mov	x2, 0
	b	.L69
	.size	YUV_WriteYuv, .-YUV_WriteYuv
	.align	3
.LC14:
	.xword	vfmw_save_yuv_file
	.align	3
.LC15:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC18:
	.xword	.LANCHOR0
	.align	3
.LC19:
	.xword	s_pstVfmwChan
	.align	3
.LC20:
	.xword	vfmw_save_metadata_reorder_file
	.global	YuvMem
	.global	pYuv
	.global	g_SaveYUVBitWidth
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	__func__.11788, %object
	.size	__func__.11788, 17
__func__.11788:
	.string	"YUV_DumpFrameYuv"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	ASCII(.string	"IMAGE_10Bit" )
	.zero	4
.LC6:
	ASCII(.string	"%s alloc calc mem size failed!\n" )
.LC12:
	ASCII(.string	"%s: Width=%d, Height=%d, Stride=%d, PicStructure=%d, ChromaIDC=%d, RealBitDepth=%d, SaveBitDepth=%d\n" )
	.zero	3
.LC16:
	ASCII(.string	" luma_vir_addr MAP return error\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	YuvMem, %object
	.size	YuvMem, 32
YuvMem:
	.zero	32
	.type	pYuv, %object
	.size	pYuv, 8
pYuv:
	.zero	8
	.type	g_SaveYUVBitWidth, %object
	.size	g_SaveYUVBitWidth, 4
g_SaveYUVBitWidth:
	.zero	4
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
