#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"syntax.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	InitVoQueue
	.type	InitVoQueue, %function
InitVoQueue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC1
	mov	w0, 12
	bl	dprint_vfmw
	strh	wzr, [x19, 2]
	mov	w1, 64
	strh	w1, [x19]
	add	x1, x19, 512
	strh	wzr, [x19, 4]
	strh	wzr, [x19, 6]
	mov	w0, -1
	strh	wzr, [x19, 8]
	stp	w0, w0, [x1, 16]
	stp	w0, w0, [x1, 24]
	str	w0, [x19, 544]
	str	w0, [x19, 548]
	mov	w0, 1
	str	wzr, [x19, 572]
	str	wzr, [x19, 600]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	InitVoQueue, .-InitVoQueue
	.align	3
.LC1:
	.xword	.LC0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PrintVoQueue
	.type	PrintVoQueue, %function
PrintVoQueue:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC3
	mov	w0, 1
	ldrh	w4, [x20, 8]
	ldrh	w3, [x20, 4]
	ldrh	w2, [x20, 6]
	bl	dprint_vfmw
	ldr	x22, .LC5
	ldrh	w0, [x20, 4]
	ldrh	w1, [x20, 8]
	and	w19, w0, 63
	cmp	w19, w1
	beq	.L5
	ldr	x21, .LC7
	b	.L6
	.p2align 3
.L4:
	uxtw	x2, w19
	mov	x1, x21
	add	x2, x2, 2
	mov	w0, 1
	ldr	x2, [x20, x2, lsl 3]
	ldr	w2, [x2, 180]
	bl	dprint_vfmw
	add	w0, w19, 1
	ldrh	w1, [x20, 8]
	and	w19, w0, 63
	cmp	w19, w1
	beq	.L5
.L6:
	and	w0, w0, 7
	cbnz	w0, .L4
	mov	x1, x22
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4
	.p2align 3
.L5:
	mov	x1, x22
	mov	w0, 1
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	PrintVoQueue, .-PrintVoQueue
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC5:
	.xword	.LC4
	.align	3
.LC7:
	.xword	.LC6
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ResetVoQueue
	.type	ResetVoQueue, %function
ResetVoQueue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x20, .LC8
	mov	w0, 2
	ldr	x1, [x20, 24]
	blr	x1
	ldrh	w2, [x19, 6]
	ldrh	w3, [x19, 4]
	ldrh	w4, [x19, 8]
	cmp	w2, w3
	beq	.L13
.L11:
	ldr	x1, .LC10
	mov	w0, 1
	bl	dprint_vfmw
.L12:
	add	x4, x19, 512
	strh	wzr, [x19, 2]
	strh	wzr, [x19, 4]
	mov	w0, 64
	strh	wzr, [x19, 6]
	mov	x3, -1
	strh	w0, [x19]
	mov	w0, -1
	strh	wzr, [x19, 8]
	ldr	w1, [x19, 600]
	ldr	x2, [x20, 32]
	stp	w0, w0, [x4, 16]
	stp	w0, w0, [x4, 24]
	add	w1, w1, 100
	str	w0, [x19, 544]
	str	w0, [x19, 548]
	mov	w0, 2
	str	x3, [x19, 584]
	str	w1, [x19, 600]
	str	wzr, [x19, 572]
	str	wzr, [x19, 580]
	str	xzr, [x19, 592]
	blr	x2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L13:
	cmp	w2, w4
	bne	.L11
	b	.L12
	.size	ResetVoQueue, .-ResetVoQueue
	.align	3
.LC8:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC10:
	.xword	.LC9
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReturnImageToSyntax
	.type	ReturnImageToSyntax, %function
ReturnImageToSyntax:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	mov	x21, x2
	bl	_mcount
	cmp	w19, 20
	bhi	.L14
	ldr	x0, .LC11
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx17
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx17:
	.section	.rodata
	.align	0
	.align	2
.L17:
	.byte	(.L16 - .Lrtx17) / 4
	.byte	(.L18 - .Lrtx17) / 4
	.byte	(.L19 - .Lrtx17) / 4
	.byte	(.L20 - .Lrtx17) / 4
	.byte	(.L14 - .Lrtx17) / 4
	.byte	(.L21 - .Lrtx17) / 4
	.byte	(.L22 - .Lrtx17) / 4
	.byte	(.L14 - .Lrtx17) / 4
	.byte	(.L23 - .Lrtx17) / 4
	.byte	(.L24 - .Lrtx17) / 4
	.byte	(.L25 - .Lrtx17) / 4
	.byte	(.L25 - .Lrtx17) / 4
	.byte	(.L25 - .Lrtx17) / 4
	.byte	(.L26 - .Lrtx17) / 4
	.byte	(.L14 - .Lrtx17) / 4
	.byte	(.L27 - .Lrtx17) / 4
	.byte	(.L28 - .Lrtx17) / 4
	.byte	(.L29 - .Lrtx17) / 4
	.byte	(.L14 - .Lrtx17) / 4
	.byte	(.L14 - .Lrtx17) / 4
	.byte	(.L30 - .Lrtx17) / 4
	.text
	.p2align 3
.L30:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	USERDEC_RecycleImage
.L14:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L16:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	H264DEC_RecycleImage
	b	.L14
	.p2align 3
.L18:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	VC1DEC_RecycleImage
	b	.L14
	.p2align 3
.L19:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	MPEG4DEC_RecycleImage
	b	.L14
	.p2align 3
.L20:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	MPEG2DEC_RecycleImage
	b	.L14
	.p2align 3
.L21:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	DIVX3DEC_RecycleImage
	b	.L14
	.p2align 3
.L22:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	AVSDEC_RecycleImage
	b	.L14
	.p2align 3
.L23:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	REAL8DEC_RecycleImage
	b	.L14
	.p2align 3
.L24:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	REAL9DEC_RecycleImage
	b	.L14
	.p2align 3
.L25:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	VP6DEC_RecycleImage
	b	.L14
	.p2align 3
.L26:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	VP8DEC_RecycleImage
	b	.L14
	.p2align 3
.L27:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	MVC_DEC_RecycleImage
	b	.L14
	.p2align 3
.L28:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	HEVC_DECRecycleImage
	b	.L14
	.p2align 3
.L29:
	ldr	w1, [x21, 180]
	mov	x0, x20
	bl	VP9DEC_RecycleImage
	b	.L14
	.size	ReturnImageToSyntax, .-ReturnImageToSyntax
	.align	3
.LC11:
	.xword	.L17
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProduceTimeStamp
	.type	ProduceTimeStamp, %function
ProduceTimeStamp:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	mov	w19, w2
	bl	_mcount
	cmp	w19, 20
	ldr	x0, [x20, 640]
	beq	.L32
	ldr	x2, [x21, 584]
	sub	w19, w19, #8
	sub	x1, x0, x2
	cmp	x1, 5
	ccmn	x2, #1, 4, ls
	beq	.L42
	cmp	w19, 1
	mov	x0, -1
	bls	.L34
.L32:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L42:
	cmp	w19, 1
	bhi	.L32
	ldrb	w1, [x20, 124]
	and	w1, w1, 3
	cmp	w1, 2
	bne	.L32
.L34:
	mov	x0, -1
	str	x0, [x20, 632]
	b	.L32
	.size	ProduceTimeStamp, .-ProduceTimeStamp
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertImgToVoQueue_PtsProcess
	.type	InsertImgToVoQueue_PtsProcess, %function
InsertImgToVoQueue_PtsProcess:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w1
	mov	x22, x2
	mov	x19, x3
	bl	_mcount
	ldr	x0, .LC12
	ldr	x0, [x0, w21, sxtw 3]
	ldr	w0, [x0, 148]
	cmp	w0, 1
	beq	.L54
.L44:
	ldr	x3, [x19, 640]
	cmp	w20, 20
	str	x3, [x19, 632]
	beq	.L48
	ldr	x1, [x22, 584]
	sub	w20, w20, #8
	sub	x2, x3, x1
	cmp	x2, 5
	ccmn	x1, #1, 4, ls
	beq	.L55
	cmp	w20, 1
	bls	.L47
	mov	x2, x3
	mov	x3, -1
.L45:
	ldr	x4, [x19, 648]
	mov	w0, 29
	ldr	x1, .LC14
	str	x3, [x19, 640]
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L55:
	cmp	w20, 1
	mov	x2, x3
	bhi	.L45
	ldrb	w1, [x19, 124]
	and	w1, w1, 3
	cmp	w1, 2
	bne	.L45
.L47:
	mov	x2, -1
	str	x2, [x19, 632]
	mov	x3, x2
	b	.L45
	.p2align 3
.L48:
	mov	x2, x3
	b	.L45
	.p2align 3
.L54:
	ldrb	w0, [x19, 126]
	orr	w0, w0, 8
	strb	w0, [x19, 126]
	b	.L44
	.size	InsertImgToVoQueue_PtsProcess, .-InsertImgToVoQueue_PtsProcess
	.align	3
.LC12:
	.xword	s_pstVfmwChan
	.align	3
.LC14:
	.xword	.LC13
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertImgToVoQueue_FillImageInfo
	.type	InsertImgToVoQueue_FillImageInfo, %function
InsertImgToVoQueue_FillImageInfo:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x3
	mov	w23, w0
	mov	x0, x30
	mov	w20, w1
	mov	x24, x2
	bl	_mcount
	ldr	w0, [x19, 136]
	cbz	w0, .L57
	ldr	w0, [x19, 140]
	cbnz	w0, .L82
.L57:
	ldp	w1, w0, [x19, 128]
	stp	w1, w0, [x19, 136]
	lsr	w2, w1, 1
	lsr	w0, w0, 1
	str	w2, [x19, 144]
	str	w0, [x19, 148]
.L58:
	add	x20, x24, 528
	str	w1, [x20, 28]
	ldr	w3, [x20, 8]
	ldr	w0, [x19, 132]
	str	w0, [x20, 32]
	ldrb	w0, [x19, 124]
	ubfx	x0, x0, 5, 3
	str	w0, [x20, 36]
	ldr	w0, [x19, 124]
	str	w0, [x20, 40]
	ldr	w0, [x19, 180]
	add	w0, w0, 2
	str	w0, [x20, 24]
	ldrb	w27, [x19, 125]
	ldr	w0, [x19, 124]
	ldr	w2, [x19, 188]
	ubfx	x27, x27, 0, 2
	ldp	w21, w1, [x19, 140]
	ldrh	w22, [x19, 148]
	cmp	w2, w3
	ubfx	x0, x0, 14, 3
	ldrh	w3, [x19, 136]
	uxtb	w25, w27
	orr	w22, w22, w1, lsl 16
	uxtb	w26, w0
	orr	w21, w3, w21, lsl 16
	beq	.L59
	str	w2, [x20, 48]
.L59:
	ldr	w1, [x20, 44]
	add	w2, w1, 1
	str	w2, [x20, 44]
	str	w1, [x19, 192]
	ldr	w1, [x24, 528]
	cmp	w26, w1
	beq	.L60
	ldr	x2, .LC15
	ldr	x4, [x2]
	cbz	x4, .L61
	strb	w1, [x29, 104]
	mov	w3, 2
	strb	w0, [x29, 105]
	add	x2, x29, 104
	mov	w1, 7
	mov	w0, w23
	blr	x4
.L61:
	str	w26, [x24, 528]
.L60:
	ldr	w0, [x20, 4]
	cmp	w25, w0
	beq	.L62
	ldr	x0, .LC15
	ldr	x4, [x0]
	cbz	x4, .L63
	add	x2, x29, 112
	mov	w3, 1
	mov	w1, 4
	mov	w0, w23
	strb	w27, [x2, -8]!
	blr	x4
.L63:
	str	w25, [x20, 4]
.L62:
	ldr	w0, [x20, 16]
	cmp	w21, w0
	beq	.L83
.L64:
	ldr	x0, .LC15
	stp	w21, w22, [x20, 16]
	ldr	x4, [x0]
	cbz	x4, .L65
	ldp	w3, w2, [x19, 136]
	ldp	w1, w0, [x19, 144]
	strh	w3, [x29, 104]
	mov	w3, 8
	strh	w2, [x29, 106]
	add	x2, x29, 104
	strh	w1, [x29, 108]
	mov	w1, 1
	strh	w0, [x29, 110]
	mov	w0, w23
	blr	x4
.L65:
	ldp	w1, w0, [x19, 44]
	ldr	w2, [x19, 164]
	stp	w1, w0, [x19, 28]
	add	w1, w1, w2
	add	w0, w2, w0
	stp	w1, w0, [x19, 36]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L82:
	sub	w0, w20, #15
	cmp	w0, 1
	ccmp	w20, wzr, 4, hi
	bne	.L57
	ldr	w1, [x19, 128]
	b	.L58
	.p2align 3
.L83:
	ldr	w0, [x20, 20]
	cmp	w22, w0
	bne	.L64
	b	.L65
	.size	InsertImgToVoQueue_FillImageInfo, .-InsertImgToVoQueue_FillImageInfo
	.align	3
.LC15:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertImgToVoQueue_ReportIMG
	.type	InsertImgToVoQueue_ReportIMG, %function
InsertImgToVoQueue_ReportIMG:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, .LC16
	ldr	x4, [x0]
	cbz	x4, .L84
	mov	w3, 664
	mov	x2, x20
	mov	w1, 5
	mov	w0, w19
	blr	x4
.L84:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	InsertImgToVoQueue_ReportIMG, .-InsertImgToVoQueue_ReportIMG
	.align	3
.LC16:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertImgToVoQueue
	.type	InsertImgToVoQueue, %function
InsertImgToVoQueue:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	w22, w0
	mov	x26, x4
	mov	x0, x30
	mov	w23, w1
	mov	x24, x2
	mov	x27, x3
	bl	_mcount
	cbz	x26, .L127
	ldr	x1, .LC20
	mov	w0, 2
	bl	dprint_vfmw
	ldr	x20, .LC21
	mov	w0, 2
	ldr	x1, [x20, 24]
	blr	x1
	ldrh	w19, [x27, 4]
	ldrh	w3, [x27, 8]
	and	w19, w19, 63
	cmp	w19, w3
	beq	.L96
	ldr	x25, .LC23
	mov	w21, 1000
	b	.L125
	.p2align 3
.L95:
	add	w19, w19, 1
	and	w19, w19, 63
	cmp	w19, w3
	beq	.L96
.L125:
	sxtw	x0, w19
	ldr	w1, [x26, 180]
	add	x0, x0, 2
	ldr	x0, [x27, x0, lsl 3]
	ldr	w2, [x0, 180]
	cmp	w2, w1
	bne	.L95
	mov	x1, x25
	mov	w0, 0
	add	w19, w19, 1
	bl	dprint_vfmw
	str	w21, [x26, 184]
	and	w19, w19, 63
	ldrh	w3, [x27, 8]
	cmp	w19, w3
	bne	.L125
	.p2align 2
.L96:
	ldr	w2, [x26, 184]
	cmp	w2, 100
	bhi	.L128
	ldp	w3, w4, [x26, 128]
	cmp	w3, 31
	bhi	.L129
.L98:
	ldr	x1, .LC25
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x26, 184]
	cmp	w0, 1000
	beq	.L101
	mov	x2, x26
	mov	x1, x24
	mov	w0, w23
	bl	ReturnImageToSyntax
.L101:
	ldr	x1, [x20, 32]
	mov	w0, 2
	blr	x1
	mov	w0, 1
.L91:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L129:
	cmp	w4, 31
	bls	.L98
	add	x1, x26, 248
	mov	w0, w22
	str	w23, [x26, 336]
	sxtw	x19, w22
	bl	VCTRL_GetHDRConfigInfo
	mov	w1, w23
	mov	x3, x26
	mov	x2, x27
	mov	w0, w22
	bl	InsertImgToVoQueue_PtsProcess
	mov	w1, w23
	mov	x3, x26
	mov	x2, x27
	mov	w0, w22
	bl	InsertImgToVoQueue_FillImageInfo
	ldrh	w4, [x27, 8]
	mov	w0, 12
	ldrh	w3, [x27, 6]
	ldr	w5, [x26, 180]
	ldrh	w2, [x27, 4]
	ldr	x1, .LC27
	bl	dprint_vfmw
	ldr	x21, .LC28
	ldrh	w2, [x27, 8]
	lsl	x1, x19, 4
	add	x1, x1, x19, lsl 2
	ldr	x24, .LC29
	mov	x0, x2
	add	x2, x2, 2
	add	x23, x21, x1, lsl 4
	add	w0, w0, 1
	and	w0, w0, 63
	sub	x23, x23, x1
	str	x26, [x27, x2, lsl 3]
	mov	w1, 5
	strh	w0, [x27, 8]
	str	wzr, [x26, 380]
	ldr	w0, [x26, 112]
	ldr	w2, [x24, w22, sxtw 2]
	str	w0, [x23, 20]
	mov	w0, w22
	bl	VDEC_Lowdelay_Event_Time
	ldr	w1, [x24, w22, sxtw 2]
	mov	w0, 2
	ldr	x2, [x20, 32]
	add	w1, w1, 1
	str	w1, [x24, w22, sxtw 2]
	blr	x2
	ldr	x0, .LC30
	ldr	x0, [x0, w22, sxtw 3]
	ldr	w0, [x0, 148]
	cbz	w0, .L102
	ldr	w0, [x23, 8]
	cbnz	w0, .L130
.L102:
	ldr	x0, .LC31
	ldr	x4, [x0]
	cbz	x4, .L103
	mov	w3, 664
	mov	x2, x26
	mov	w1, 5
	mov	w0, w22
	blr	x4
.L103:
	mov	w0, 8
	bl	CHECK_REC_POS_ENABLE
	cbnz	w0, .L131
.L105:
	lsl	x0, x19, 4
	ldr	x1, [x20]
	add	x0, x0, x19, lsl 2
	lsl	x20, x0, 4
	sub	x20, x20, x0
	add	x22, x21, x20
	ldr	w0, [x22, 4]
	add	w0, w0, 1
	str	w0, [x22, 4]
	blr	x1
	mov	w2, w0
	ldr	w1, [x21, x20]
	mov	w0, 1
	sub	w1, w2, w1
	cmp	w1, 299
	bls	.L91
	ldr	w0, [x22, 4]
	cbz	w0, .L107
	mov	w3, 10000
	mul	w0, w0, w3
	udiv	w1, w0, w1
	str	w1, [x22, 8]
.L107:
	lsl	x1, x19, 4
	mov	w0, 1
	add	x19, x1, x19, lsl 2
	lsl	x1, x19, 4
	sub	x19, x1, x19
	add	x1, x21, x19
	str	w2, [x21, x19]
	str	wzr, [x1, 4]
	b	.L91
	.p2align 3
.L128:
	ldp	w3, w4, [x26, 128]
	b	.L98
.L130:
	lsl	w1, w0, 2
	sub	w1, w1, w0
	lsl	w2, w1, 5
	add	w1, w1, w2
	add	w0, w1, w0
	str	w0, [x26, 160]
	b	.L102
.L131:
	ldr	x0, [x20]
	blr	x0
	mov	w4, w0
	ldr	x3, .LC32
	ldr	x1, .LC33
	ldr	w0, [x3, w22, sxtw 2]
	ldr	w1, [x1]
	sub	w0, w4, w0
	cmp	w0, w1
	bls	.L105
	lsl	w2, w22, 24
	ldr	x0, .LC34
	add	w2, w2, 524288
	mov	w1, 535
	str	w4, [x3, w22, sxtw 2]
	bl	DBG_AddTrace
	b	.L105
.L127:
	ldr	x1, .LC18
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -2
	b	.L91
	.size	InsertImgToVoQueue, .-InsertImgToVoQueue
	.align	3
.LC18:
	.xword	.LC17
	.align	3
.LC20:
	.xword	.LC19
	.align	3
.LC21:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC27:
	.xword	.LC26
	.align	3
.LC28:
	.xword	g_VfmwChanStat
	.align	3
.LC29:
	.xword	g_LowDelaySeqIndex
	.align	3
.LC30:
	.xword	s_pstVfmwChan
	.align	3
.LC31:
	.xword	g_event_report
	.align	3
.LC32:
	.xword	.LANCHOR0
	.align	3
.LC33:
	.xword	g_TraceFramePeriod
	.align	3
.LC34:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetQueueImgNum
	.type	GetQueueImgNum, %function
GetQueueImgNum:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x21, x1
	mov	x20, x2
	bl	_mcount
	ldrh	w0, [x19, 6]
	ldrh	w3, [x19, 4]
	cmp	w0, w3
	bcc	.L133
	sub	w3, w0, w3
.L134:
	ldrh	w4, [x19, 8]
	cmp	w0, w4
	bls	.L137
	add	w4, w4, 64
.L137:
	str	w3, [x21]
	sub	w0, w4, w0
	str	w0, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L133:
	add	w1, w0, 64
	sub	w3, w1, w3
	b	.L134
	.size	GetQueueImgNum, .-GetQueueImgNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_GetVoQue
	.type	SYNTAX_GetVoQue, %function
SYNTAX_GetVoQue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	cmp	w0, 20
	bls	.L156
.L155:
	mov	x0, 0
	b	.L139
	.p2align 3
.L156:
	ldr	x1, .LC35
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx141
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx141:
	.section	.rodata
	.align	0
	.align	2
.L141:
	.byte	(.L154 - .Lrtx141) / 4
	.byte	(.L142 - .Lrtx141) / 4
	.byte	(.L143 - .Lrtx141) / 4
	.byte	(.L144 - .Lrtx141) / 4
	.byte	(.L155 - .Lrtx141) / 4
	.byte	(.L145 - .Lrtx141) / 4
	.byte	(.L146 - .Lrtx141) / 4
	.byte	(.L155 - .Lrtx141) / 4
	.byte	(.L147 - .Lrtx141) / 4
	.byte	(.L148 - .Lrtx141) / 4
	.byte	(.L149 - .Lrtx141) / 4
	.byte	(.L149 - .Lrtx141) / 4
	.byte	(.L149 - .Lrtx141) / 4
	.byte	(.L150 - .Lrtx141) / 4
	.byte	(.L155 - .Lrtx141) / 4
	.byte	(.L151 - .Lrtx141) / 4
	.byte	(.L152 - .Lrtx141) / 4
	.byte	(.L153 - .Lrtx141) / 4
	.byte	(.L155 - .Lrtx141) / 4
	.byte	(.L155 - .Lrtx141) / 4
	.byte	(.L154 - .Lrtx141) / 4
	.text
	.p2align 3
.L154:
	add	x0, x19, 16
.L139:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L146:
	add	x19, x19, 12288
	add	x0, x19, 3920
	b	.L139
	.p2align 3
.L147:
	add	x19, x19, 53248
	add	x0, x19, 3264
	b	.L139
	.p2align 3
.L148:
	add	x19, x19, 53248
	add	x0, x19, 3232
	b	.L139
	.p2align 3
.L143:
	add	x19, x19, 20480
	add	x0, x19, 2224
	b	.L139
	.p2align 3
.L145:
	add	x19, x19, 40960
	add	x0, x19, 3208
	b	.L139
	.p2align 3
.L152:
	add	x19, x19, 61440
	add	x0, x19, 2000
	b	.L139
	.p2align 3
.L150:
	add	x19, x19, 8192
	add	x0, x19, 24
	b	.L139
	.p2align 3
.L151:
	add	x0, x19, 920
	b	.L139
	.p2align 3
.L144:
	add	x19, x19, 90112
	add	x0, x19, 240
	b	.L139
	.p2align 3
.L142:
	add	x19, x19, 53248
	add	x0, x19, 424
	b	.L139
	.p2align 3
.L153:
	add	x19, x19, 274432
	add	x0, x19, 1400
	b	.L139
	.p2align 3
.L149:
	add	x19, x19, 12288
	add	x0, x19, 472
	b	.L139
	.size	SYNTAX_GetVoQue, .-SYNTAX_GetVoQue
	.align	3
.LC35:
	.xword	.L141
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReceiveImage
	.type	SYNTAX_ReceiveImage, %function
SYNTAX_ReceiveImage:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	x20, xzr
	ccmp	x19, xzr, 4, ne
	beq	.L161
	mov	x0, x19
	bl	SYNTAX_GetVoQue
	mov	x19, x0
	cbz	x0, .L163
	ldr	x22, .LC39
	mov	w0, 2
	mov	w21, -3
	ldr	x1, [x22, 24]
	blr	x1
	ldrh	w0, [x19, 6]
	ldrh	w1, [x19, 8]
	cmp	w1, w0
	beq	.L160
	add	x1, x0, 2
	ldr	x3, [x22, 104]
	mov	x2, 664
	mov	x0, x20
	ldr	x23, [x20, 328]
	mov	w21, 1
	ldr	x1, [x19, x1, lsl 3]
	blr	x3
	str	x23, [x20, 328]
	ldr	x1, .LC41
	mov	w0, 12
	ldr	w5, [x20, 180]
	ldrh	w4, [x19, 8]
	ldrh	w3, [x19, 6]
	ldrh	w2, [x19, 4]
	bl	dprint_vfmw
	ldr	w1, [x20, 180]
	ldr	w0, [x19, 600]
	add	w0, w1, w0
	str	w0, [x20, 180]
	ldrh	w0, [x19, 6]
	add	w0, w0, w21
	and	w0, w0, 63
	strh	w0, [x19, 6]
.L160:
	ldr	x1, [x22, 32]
	mov	w0, 2
	blr	x1
	mov	w0, w21
.L158:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L161:
	mov	w0, -2
	b	.L158
.L163:
	ldr	x2, .LC36
	mov	w0, 1
	ldr	x1, .LC38
	add	x2, x2, 24
	bl	dprint_vfmw
	mov	w0, -2
	b	.L158
	.size	SYNTAX_ReceiveImage, .-SYNTAX_ReceiveImage
	.align	3
.LC36:
	.xword	.LANCHOR1
	.align	3
.LC38:
	.xword	.LC37
	.align	3
.LC39:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC41:
	.xword	.LC40
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	.type	SYNTAX_ReleaseImage_RecycleImage_CheckRet, %function
SYNTAX_ReleaseImage_RecycleImage_CheckRet:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	w0, [x20]
	cmp	w0, 17
	bls	.L178
.L165:
	cmn	w19, #2
	beq	.L176
	cmp	w19, 1
	mov	w0, -20
	csinc	w0, w0, wzr, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L178:
	ldr	x1, .LC42
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx167
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx167:
	.section	.rodata
	.align	0
	.align	2
.L167:
	.byte	(.L170 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L165 - .Lrtx167) / 4
	.byte	(.L170 - .Lrtx167) / 4
	.byte	(.L170 - .Lrtx167) / 4
	.byte	(.L170 - .Lrtx167) / 4
	.text
	.p2align 3
.L170:
	mov	w0, -20
	cmp	w19, wzr
	csinc	w0, w0, wzr, ne
.L171:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L176:
	mov	w0, w19
	b	.L171
	.size	SYNTAX_ReleaseImage_RecycleImage_CheckRet, .-SYNTAX_ReleaseImage_RecycleImage_CheckRet
	.align	3
.LC42:
	.xword	.L167
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReleaseImage_RecycleImage
	.type	SYNTAX_ReleaseImage_RecycleImage, %function
SYNTAX_ReleaseImage_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	w0, [x19]
	cmp	w0, 20
	bls	.L197
.L196:
	mov	w1, -2
	b	.L180
	.p2align 3
.L197:
	ldr	x1, .LC43
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx182
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx182:
	.section	.rodata
	.align	0
	.align	2
.L182:
	.byte	(.L181 - .Lrtx182) / 4
	.byte	(.L183 - .Lrtx182) / 4
	.byte	(.L184 - .Lrtx182) / 4
	.byte	(.L185 - .Lrtx182) / 4
	.byte	(.L196 - .Lrtx182) / 4
	.byte	(.L186 - .Lrtx182) / 4
	.byte	(.L187 - .Lrtx182) / 4
	.byte	(.L196 - .Lrtx182) / 4
	.byte	(.L188 - .Lrtx182) / 4
	.byte	(.L189 - .Lrtx182) / 4
	.byte	(.L190 - .Lrtx182) / 4
	.byte	(.L190 - .Lrtx182) / 4
	.byte	(.L190 - .Lrtx182) / 4
	.byte	(.L191 - .Lrtx182) / 4
	.byte	(.L196 - .Lrtx182) / 4
	.byte	(.L192 - .Lrtx182) / 4
	.byte	(.L193 - .Lrtx182) / 4
	.byte	(.L194 - .Lrtx182) / 4
	.byte	(.L196 - .Lrtx182) / 4
	.byte	(.L196 - .Lrtx182) / 4
	.byte	(.L195 - .Lrtx182) / 4
	.text
	.p2align 3
.L181:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	H264DEC_RecycleImage
	mov	w1, w0
.L180:
	mov	x0, x19
	bl	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L183:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	VC1DEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L184:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	MPEG4DEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L185:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	MPEG2DEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L186:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	DIVX3DEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L187:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	AVSDEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L188:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	REAL8DEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L189:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	REAL9DEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L190:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	VP6DEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L191:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	VP8DEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L192:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	MVC_DEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L193:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	HEVC_DECRecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L194:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	VP9DEC_RecycleImage
	mov	w1, w0
	b	.L180
	.p2align 3
.L195:
	ldr	w1, [x20, 180]
	add	x0, x19, 8
	bl	USERDEC_RecycleImage
	mov	w1, w0
	b	.L180
	.size	SYNTAX_ReleaseImage_RecycleImage, .-SYNTAX_ReleaseImage_RecycleImage
	.align	3
.LC43:
	.xword	.L182
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReleaseImage
	.type	SYNTAX_ReleaseImage, %function
SYNTAX_ReleaseImage:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	x24, x1
	bl	_mcount
	cmp	x24, xzr
	ccmp	x21, xzr, 4, ne
	beq	.L217
	mov	x0, x21
	bl	SYNTAX_GetVoQue
	mov	x25, x0
	cbz	x0, .L218
	ldr	x22, .LC48
	mov	w0, 2
	ldr	x1, [x22, 24]
	blr	x1
	ldrh	w20, [x25, 4]
	ldrh	w1, [x25, 6]
	and	w20, w20, 63
	ldr	w26, [x24, 180]
	ldr	w0, [x25, 600]
	cmp	w20, w1
	sub	w26, w26, w0
	beq	.L209
	ldr	x23, .LC52
	b	.L215
	.p2align 3
.L206:
	add	w20, w20, 1
	and	w20, w20, 63
	cmp	w20, w1
	beq	.L209
.L215:
	sxtw	x19, w20
	add	x0, x19, 2
	ldr	x0, [x25, x0, lsl 3]
	cbz	x0, .L204
	ldr	w0, [x0, 180]
	cmp	w26, w0
	bne	.L206
	mov	w5, 1
.L205:
	ldrh	w4, [x25, 4]
	b	.L208
	.p2align 3
.L213:
	mov	w20, w1
.L208:
	cmp	w20, wzr
	sub	w0, w20, #1
	mov	w1, 63
	add	x2, x19, 2
	csel	w1, w0, w1, ne
	cmp	w20, w4
	sxtw	x0, w1
	add	x3, x0, 2
	mov	x19, x0
	ldr	x0, [x25, x3, lsl 3]
	str	x0, [x25, x2, lsl 3]
	bne	.L213
	ldr	w0, [x24, 180]
	cmp	w5, 1
	ldr	w1, [x25, 600]
	sub	w0, w0, w1
	str	w0, [x24, 180]
	ldrh	w2, [x25, 4]
	add	w2, w2, 1
	and	w2, w2, 63
	strh	w2, [x25, 4]
	beq	.L219
	ldrh	w1, [x25, 6]
	add	w20, w20, 1
	and	w20, w20, 63
	cmp	w20, w1
	bne	.L215
.L209:
	ldr	x1, .LC50
	mov	w2, w26
	mov	w0, 1
	mov	w19, -2
	bl	dprint_vfmw
.L203:
	ldr	x1, [x22, 32]
	mov	w0, 2
	blr	x1
	mov	w0, w19
.L200:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L204:
	mov	w2, w20
	mov	x1, x23
	mov	w0, 1
	bl	dprint_vfmw
	mov	w5, 2
	b	.L205
.L219:
	ldrh	w4, [x25, 8]
	mov	w0, 12
	ldrh	w3, [x25, 6]
	ldr	x1, .LC54
	ldr	w5, [x24, 180]
	bl	dprint_vfmw
	mov	x1, x24
	mov	x0, x21
	bl	SYNTAX_ReleaseImage_RecycleImage
	mov	w19, w0
	b	.L203
.L217:
	ldr	x1, .LC45
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -2
	b	.L200
.L218:
	ldr	x2, .LC46
	mov	w0, 1
	ldr	x1, .LC47
	add	x2, x2, 48
	bl	dprint_vfmw
	mov	w0, -2
	b	.L200
	.size	SYNTAX_ReleaseImage, .-SYNTAX_ReleaseImage
	.align	3
.LC45:
	.xword	.LC44
	.align	3
.LC46:
	.xword	.LANCHOR1
	.align	3
.LC47:
	.xword	.LC37
	.align	3
.LC48:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC50:
	.xword	.LC49
	.align	3
.LC52:
	.xword	.LC51
	.align	3
.LC54:
	.xword	.LC53
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SYNTAX_ReturnImage
	.type	SYNTAX_ReturnImage, %function
SYNTAX_ReturnImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	cmp	w0, 20
	bls	.L239
.L238:
	mov	w0, -2
	b	.L221
	.p2align 3
.L239:
	ldr	x1, .LC55
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx223
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx223:
	.section	.rodata
	.align	0
	.align	2
.L223:
	.byte	(.L236 - .Lrtx223) / 4
	.byte	(.L224 - .Lrtx223) / 4
	.byte	(.L225 - .Lrtx223) / 4
	.byte	(.L226 - .Lrtx223) / 4
	.byte	(.L238 - .Lrtx223) / 4
	.byte	(.L227 - .Lrtx223) / 4
	.byte	(.L228 - .Lrtx223) / 4
	.byte	(.L238 - .Lrtx223) / 4
	.byte	(.L229 - .Lrtx223) / 4
	.byte	(.L230 - .Lrtx223) / 4
	.byte	(.L231 - .Lrtx223) / 4
	.byte	(.L231 - .Lrtx223) / 4
	.byte	(.L231 - .Lrtx223) / 4
	.byte	(.L232 - .Lrtx223) / 4
	.byte	(.L238 - .Lrtx223) / 4
	.byte	(.L233 - .Lrtx223) / 4
	.byte	(.L234 - .Lrtx223) / 4
	.byte	(.L235 - .Lrtx223) / 4
	.byte	(.L238 - .Lrtx223) / 4
	.byte	(.L238 - .Lrtx223) / 4
	.byte	(.L236 - .Lrtx223) / 4
	.text
	.p2align 3
.L236:
	add	x19, x19, 16
	.p2align 2
.L237:
	ldr	x20, .LC56
	mov	w0, 2
	ldr	x1, [x20, 24]
	blr	x1
	ldrh	w1, [x19, 6]
	mov	w0, 2
	sub	w1, w1, #1
	and	w1, w1, 63
	strh	w1, [x19, 6]
	ldr	x1, [x20, 32]
	blr	x1
	mov	w0, 1
.L221:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L228:
	add	x19, x19, 12288
	add	x19, x19, 3920
	b	.L237
	.p2align 3
.L229:
	add	x19, x19, 53248
	add	x19, x19, 3264
	b	.L237
	.p2align 3
.L230:
	add	x19, x19, 53248
	add	x19, x19, 3232
	b	.L237
	.p2align 3
.L225:
	add	x19, x19, 20480
	add	x19, x19, 2224
	b	.L237
	.p2align 3
.L227:
	add	x19, x19, 40960
	add	x19, x19, 3208
	b	.L237
	.p2align 3
.L234:
	add	x19, x19, 61440
	add	x19, x19, 2000
	b	.L237
	.p2align 3
.L232:
	add	x19, x19, 8192
	add	x19, x19, 24
	b	.L237
	.p2align 3
.L233:
	add	x19, x19, 920
	b	.L237
	.p2align 3
.L226:
	add	x19, x19, 90112
	add	x19, x19, 240
	b	.L237
	.p2align 3
.L224:
	add	x19, x19, 53248
	add	x19, x19, 424
	b	.L237
	.p2align 3
.L235:
	add	x19, x19, 274432
	add	x19, x19, 1400
	b	.L237
	.p2align 3
.L231:
	add	x19, x19, 12288
	add	x19, x19, 472
	b	.L237
	.size	SYNTAX_ReturnImage, .-SYNTAX_ReturnImage
	.align	3
.LC55:
	.xword	.L223
	.align	3
.LC56:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_H264
	.type	DecodeStream_H264, %function
DecodeStream_H264:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x2, [x19, 8]
	add	x1, x29, 40
	ldrb	w4, [x19, 17]
	mov	x0, x20
	ldp	w6, w5, [x19, 20]
	ldr	w3, [x19, 28]
	ldr	x7, [x19, 32]
	str	x2, [x29, 48]
	ldrb	w2, [x19, 19]
	strb	w4, [x29, 40]
	stp	w6, w5, [x29, 56]
	str	w3, [x29, 64]
	str	x7, [x29, 72]
	strb	w2, [x29, 41]
	bl	H264DEC_DecodePacket
	cmn	w0, #2
	add	x0, x20, 65536
	beq	.L244
	strb	wzr, [x19, 1]
	ldr	x1, .LC57
	ldrsw	x2, [x0, 2820]
	ldr	x1, [x1, x2, lsl 3]
	strb	wzr, [x1, 1516]
	ldr	x1, [x20, 616]
	cbz	x1, .L245
.L240:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L244:
	mov	w1, 1
	strb	w1, [x19, 1]
	ldr	x2, .LC57
	ldrsw	x3, [x0, 2820]
	ldr	x2, [x2, x3, lsl 3]
	strb	w1, [x2, 1516]
	ldr	x1, [x20, 616]
	cbnz	x1, .L240
.L245:
	add	x20, x20, 12288
	ldrb	w1, [x20, 2640]
	cmp	w1, 1
	bne	.L240
	ldr	w0, [x0, 2820]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 2640]
	b	.L240
	.size	DecodeStream_H264, .-DecodeStream_H264
	.align	3
.LC57:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_HEVC
	.type	DecodeStream_HEVC, %function
DecodeStream_HEVC:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x2, [x19, 8]
	add	x1, x29, 40
	ldrb	w4, [x19, 17]
	mov	x0, x20
	ldp	w6, w5, [x19, 20]
	ldr	w3, [x19, 28]
	ldr	x7, [x19, 32]
	str	x2, [x29, 48]
	ldrb	w2, [x19, 19]
	strb	w4, [x29, 40]
	stp	w6, w5, [x29, 56]
	str	w3, [x29, 64]
	str	x7, [x29, 72]
	strb	w2, [x29, 41]
	bl	HEVCDEC_DecodePacket
	cmn	w0, #2
	beq	.L247
	ldrb	w0, [x20, 5]
	cbz	w0, .L248
.L247:
	mov	w0, 1
	strb	w0, [x19, 1]
	ldr	x1, .LC58
	ldrsw	x2, [x20, 244]
	ldr	x1, [x1, x2, lsl 3]
	strb	w0, [x1, 1516]
	ldr	x0, [x20, 2352]
	cbz	x0, .L254
.L246:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L248:
	strb	wzr, [x19, 1]
	ldr	x0, .LC58
	ldrsw	x1, [x20, 244]
	ldr	x0, [x0, x1, lsl 3]
	strb	wzr, [x0, 1516]
	ldr	x0, [x20, 2352]
	cbnz	x0, .L246
.L254:
	ldrb	w0, [x20, 7]
	cmp	w0, 1
	bne	.L246
	ldr	w0, [x20, 244]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 7]
	b	.L246
	.size	DecodeStream_HEVC, .-DecodeStream_HEVC
	.align	3
.LC58:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VP9
	.type	DecodeStream_VP9, %function
DecodeStream_VP9:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w0, [x19, 18]
	cmp	w0, 1
	beq	.L269
	ldr	x23, .LC59
	add	x22, x19, 88
	mov	x2, 80
	add	x1, x19, 8
	mov	x0, x22
	add	x21, x20, 294912
	ldr	x3, [x23, 104]
	blr	x3
	ldr	x3, [x23, 96]
	mov	x2, 80
	mov	w1, 0
	add	x0, x19, 168
	blr	x3
	mov	x1, x22
	mov	x0, x20
	bl	VP9DEC_DecodePacket
	ldr	w0, [x21, 3804]
	cbnz	w0, .L270
	ldr	w0, [x21, 3800]
	cbz	w0, .L271
.L259:
	mov	w0, 1
	strb	w0, [x19, 1]
	ldr	x0, [x20, 8]
	cbz	x0, .L272
.L255:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L270:
	ldr	w0, [x21, 3840]
	ldr	w1, [x21, 3844]
	cmp	w1, w0
	bne	.L259
	ldr	w0, [x21, 3800]
	cbnz	w0, .L259
.L271:
	strb	wzr, [x19, 1]
	ldr	x0, [x20, 8]
	cbnz	x0, .L255
.L272:
	add	x20, x20, 262144
	ldrb	w0, [x20, 1044]
	cbnz	w0, .L255
	ldr	x3, [x23, 96]
	mov	x2, 160
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldr	w1, [x19, 28]
	ldr	w0, [x21, 3904]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC60
	ldr	x4, [x0]
	cbz	x4, .L255
	ldr	w0, [x21, 3904]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L255
	.p2align 3
.L269:
	add	x20, x20, 294912
	ldr	w0, [x20, 3904]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 3904]
	bl	SM_ReleaseStreamSeg
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	DecodeStream_VP9, .-DecodeStream_VP9
	.align	3
.LC59:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC60:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_MVC
	.type	DecodeStream_MVC, %function
DecodeStream_MVC:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w3, [x19, 17]
	add	x1, x29, 40
	ldp	w5, w4, [x19, 20]
	ldr	w2, [x19, 28]
	mov	x0, x20
	ldr	x6, [x19, 8]
	ldr	x7, [x19, 32]
	strb	w3, [x29, 40]
	str	x6, [x29, 48]
	stp	w5, w4, [x29, 56]
	str	w2, [x29, 64]
	str	x7, [x29, 72]
	bl	MVC_DEC_DecodePacket
	cmn	w0, #2
	beq	.L277
	strb	wzr, [x19, 1]
	ldr	x0, [x20, 232]
	cbz	x0, .L278
.L273:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L277:
	mov	w0, 1
	strb	w0, [x19, 1]
	ldr	x0, [x20, 232]
	cbnz	x0, .L273
.L278:
	ldrb	w0, [x20, 1]
	cmp	w0, 1
	bne	.L273
	ldr	w0, [x20, 120]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 1]
	b	.L273
	.size	DecodeStream_MVC, .-DecodeStream_MVC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VC1_Smp
	.type	DecodeStream_VC1_Smp, %function
DecodeStream_VC1_Smp:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w0, [x19, 18]
	cmp	w0, 1
	beq	.L292
	ldr	x21, .LC61
	add	x22, x19, 88
	mov	x2, 80
	add	x1, x19, 8
	mov	x0, x22
	ldr	x3, [x21, 104]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 80
	mov	w1, 0
	add	x0, x19, 168
	blr	x3
	ldr	w0, [x19, 104]
	cmp	w0, 15
	ble	.L293
	add	x2, x20, 16384
	ldr	x0, [x19, 88]
	add	x2, x2, 1512
	mov	w1, 16
	bl	Vc1SMPSeqHdr
	cbz	w0, .L294
	ldr	x1, .LC66
.L291:
	mov	w0, 0
	add	x20, x20, 53248
	bl	dprint_vfmw
	ldr	w1, [x19, 108]
	ldr	w0, [x20, 1024]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC64
	ldr	x4, [x0]
	cbz	x4, .L279
	ldr	w0, [x20, 1024]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L279:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L293:
	ldr	x1, .LC63
	b	.L291
	.p2align 3
.L292:
	add	x20, x20, 53248
	ldr	w0, [x20, 1024]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 1024]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L294:
	ldp	w0, w3, [x19, 100]
	ldr	x2, [x19, 88]
	mov	x1, x22
	add	w0, w0, 16
	sub	w3, w3, #16
	add	x2, x2, 16
	str	x2, [x19, 88]
	stp	w0, w3, [x19, 100]
	mov	x0, x20
	bl	VC1DEC_Decode
	ldr	x3, [x21, 96]
	mov	x2, 160
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	DecodeStream_VC1_Smp, .-DecodeStream_VC1_Smp
	.align	3
.LC61:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC64:
	.xword	g_event_report
	.align	3
.LC66:
	.xword	.LC65
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_REAL8
	.type	DecodeStream_REAL8, %function
DecodeStream_REAL8:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w0, [x19, 18]
	cmp	w0, 1
	beq	.L305
	ldr	x22, .LC67
	add	x21, x19, 88
	mov	x2, 80
	add	x1, x19, 8
	mov	x0, x21
	ldr	x3, [x22, 104]
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 80
	mov	w1, 0
	add	x0, x19, 168
	blr	x3
	mov	x1, x21
	mov	x0, x20
	bl	REAL8DEC_Decode
	cmn	w0, #2
	beq	.L306
	strb	wzr, [x19, 1]
.L299:
	ldr	x0, [x20, 8]
	cbz	x0, .L307
.L295:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L306:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L299
	.p2align 3
.L305:
	add	x20, x20, 53248
	ldr	w0, [x20, 3864]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 3864]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L307:
	ldr	x3, [x22, 96]
	mov	x2, 160
	mov	w1, 0
	mov	x0, x21
	add	x20, x20, 53248
	blr	x3
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 3864]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC68
	ldr	x4, [x0]
	cbz	x4, .L295
	ldr	w0, [x20, 3864]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L295
	.size	DecodeStream_REAL8, .-DecodeStream_REAL8
	.align	3
.LC67:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC68:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_REAL9
	.type	DecodeStream_REAL9, %function
DecodeStream_REAL9:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w0, [x19, 18]
	cmp	w0, 1
	beq	.L318
	ldr	x22, .LC69
	add	x21, x19, 88
	mov	x2, 80
	add	x1, x19, 8
	mov	x0, x21
	ldr	x3, [x22, 104]
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 80
	mov	w1, 0
	add	x0, x19, 168
	blr	x3
	mov	x1, x21
	mov	x0, x20
	bl	REAL9DEC_Decode
	cmn	w0, #2
	beq	.L319
	strb	wzr, [x19, 1]
.L312:
	ldr	x0, [x20, 8]
	cbz	x0, .L320
.L308:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L319:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L312
	.p2align 3
.L318:
	add	x20, x20, 53248
	ldr	w0, [x20, 3832]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 3832]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L320:
	ldr	x3, [x22, 96]
	mov	x2, 160
	mov	w1, 0
	mov	x0, x21
	add	x20, x20, 53248
	blr	x3
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 3832]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC70
	ldr	x4, [x0]
	cbz	x4, .L308
	ldr	w0, [x20, 3832]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L308
	.size	DecodeStream_REAL9, .-DecodeStream_REAL9
	.align	3
.LC69:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC70:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_DIVX3
	.type	DecodeStream_DIVX3, %function
DecodeStream_DIVX3:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w0, [x19, 18]
	cmp	w0, 1
	beq	.L331
	ldr	x22, .LC71
	add	x21, x19, 88
	mov	x2, 80
	add	x1, x19, 8
	mov	x0, x21
	ldr	x3, [x22, 104]
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 80
	mov	w1, 0
	add	x0, x19, 168
	blr	x3
	mov	x1, x21
	mov	x0, x20
	bl	DIVX3DEC_Decode
	cmn	w0, #2
	beq	.L332
	strb	wzr, [x19, 1]
.L325:
	ldr	x0, [x20, 8]
	cbz	x0, .L333
.L321:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L332:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L325
	.p2align 3
.L331:
	add	x20, x20, 40960
	ldr	w0, [x20, 3808]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 3808]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L333:
	ldr	x3, [x22, 96]
	mov	x2, 160
	mov	w1, 0
	mov	x0, x21
	add	x20, x20, 40960
	blr	x3
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 3808]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC72
	ldr	x4, [x0]
	cbz	x4, .L321
	ldr	w0, [x20, 3808]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L321
	.size	DecodeStream_DIVX3, .-DecodeStream_DIVX3
	.align	3
.LC71:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC72:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VP8
	.type	DecodeStream_VP8, %function
DecodeStream_VP8:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w0, [x19, 18]
	cmp	w0, 1
	beq	.L344
	ldr	x22, .LC73
	add	x21, x19, 88
	mov	x2, 80
	add	x1, x19, 8
	mov	x0, x21
	ldr	x3, [x22, 104]
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 80
	mov	w1, 0
	add	x0, x19, 168
	blr	x3
	mov	x1, x21
	mov	x0, x20
	bl	VP8DEC_Decode
	cmn	w0, #2
	beq	.L345
	strb	wzr, [x19, 1]
.L338:
	ldr	x0, [x20, 8]
	cbz	x0, .L346
.L334:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L345:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L338
	.p2align 3
.L344:
	ldr	w0, [x20, 8816]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 8816]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L346:
	ldr	x3, [x22, 96]
	mov	x2, 160
	mov	w1, 0
	mov	x0, x21
	blr	x3
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 8816]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC74
	ldr	x4, [x0]
	cbz	x4, .L334
	ldr	w0, [x20, 8816]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L334
	.size	DecodeStream_VP8, .-DecodeStream_VP8
	.align	3
.LC73:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC74:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VP6
	.type	DecodeStream_VP6, %function
DecodeStream_VP6:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w0, [x19, 18]
	cmp	w0, 1
	beq	.L357
	ldr	x22, .LC75
	add	x21, x19, 88
	mov	x2, 80
	add	x1, x19, 8
	mov	x0, x21
	ldr	x3, [x22, 104]
	blr	x3
	ldr	x3, [x22, 96]
	mov	x2, 80
	mov	w1, 0
	add	x0, x19, 168
	blr	x3
	mov	x1, x21
	mov	x0, x20
	bl	VP6DEC_Decode
	cmn	w0, #2
	beq	.L358
	strb	wzr, [x19, 1]
.L351:
	ldr	x0, [x20, 8]
	cbz	x0, .L359
.L347:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L358:
	mov	w0, 1
	strb	w0, [x19, 1]
	b	.L351
	.p2align 3
.L357:
	ldr	w0, [x20, 13360]
	bl	VCTRL_OutputLastFrame
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 13360]
	bl	SM_ReleaseStreamSeg
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L359:
	ldr	x3, [x22, 96]
	mov	x2, 160
	mov	w1, 0
	mov	x0, x21
	blr	x3
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 13360]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC76
	ldr	x4, [x0]
	cbz	x4, .L347
	ldr	w0, [x20, 13360]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L347
	.size	DecodeStream_VP6, .-DecodeStream_VP6
	.align	3
.LC75:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC76:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SegMan
	.type	SegMan, %function
SegMan:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L361
	ldr	x0, [x19, 8]
	cbz	x0, .L361
	ldr	x0, .LC79
	ldr	x0, [x0, w20, sxtw 3]
	ldr	w1, [x0, 1448]
	cmp	w1, 1
	beq	.L381
.L364:
	ldrb	w0, [x19, 17]
	strb	wzr, [x19, 408]
	cmp	w0, 1
	beq	.L382
	cbnz	w0, .L380
	ldr	x21, .LC80
	add	x23, x19, 88
	mov	x2, 80
	add	x1, x19, 8
	mov	x0, x23
	add	x22, x19, 168
	ldr	x3, [x21, 104]
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 80
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldrb	w0, [x19, 2]
	add	w0, w0, 1
	uxtb	w0, w0
	strb	w0, [x19, 2]
	cmp	w0, 1
	bls	.L380
	ldr	w1, [x19, 108]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldr	w1, [x19, 188]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldr	x3, [x21, 96]
	mov	x2, 80
	mov	w1, 0
	mov	x0, x23
	blr	x3
	ldr	x3, [x21, 96]
	mov	x2, 80
	mov	w1, 0
	mov	x0, x22
	blr	x3
	ldr	x1, .LC82
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC83
	ldr	x4, [x0]
	cbz	x4, .L368
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	mov	w0, w20
	blr	x4
.L368:
	strb	wzr, [x19, 2]
.L380:
	mov	w0, -1
.L379:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L381:
	ldr	w0, [x0, 1488]
	cmp	w0, 1
	bne	.L364
	ldrb	w0, [x19, 408]
	cmp	w0, 1
	bne	.L364
	mov	x2, 160
	add	x1, x19, 248
	add	x0, x19, 88
	bl	memcpy
	strb	wzr, [x19, 408]
	mov	w0, 0
	b	.L379
	.p2align 3
.L382:
	ldrb	w21, [x19, 2]
	cbz	w21, .L383
	cmp	w21, 1
	bne	.L380
	ldr	w0, [x19, 104]
	cmp	w0, 1023
	bgt	.L370
	ldr	x1, .LC85
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x22, .LC80
	ldrsw	x2, [x19, 104]
	ldr	x0, [x19, 8]
	ldr	x1, [x19, 88]
	ldr	x3, [x22, 104]
	sub	x0, x0, x2
	blr	x3
	strb	w21, [x19, 97]
	ldp	w0, w1, [x19, 104]
	ldp	w2, w4, [x19, 20]
	ldr	x3, [x19, 8]
	sub	w2, w2, w0
	sub	x3, x3, x0, sxtw
	add	w0, w4, w0
	str	x3, [x19, 88]
	stp	w2, w0, [x19, 100]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x19, 28]
	mov	x2, 80
	ldr	x3, [x22, 96]
	mov	w1, 0
	str	w0, [x19, 108]
	add	x0, x19, 168
	blr	x3
.L371:
	mov	w0, 1
	add	x1, x19, 88
	strb	w0, [x19, 408]
	mov	x2, 160
	strb	wzr, [x19, 2]
	add	x0, x19, 248
	bl	memcpy
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L370:
	ldr	x1, .LC87
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x3, .LC80
	mov	x2, 80
	add	x1, x19, 8
	add	x0, x19, 168
	ldr	x3, [x3, 104]
	blr	x3
	b	.L371
	.p2align 3
.L383:
	ldr	x20, .LC80
	mov	x2, 80
	add	x1, x19, 8
	add	x0, x19, 88
	ldr	x3, [x20, 104]
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 80
	mov	w1, 0
	add	x0, x19, 168
	blr	x3
	strb	wzr, [x19, 2]
	mov	w0, 0
	b	.L379
	.p2align 3
.L361:
	ldr	x1, .LC78
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L379
	.size	SegMan, .-SegMan
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC79:
	.xword	s_pstVfmwChan
	.align	3
.LC80:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC83:
	.xword	g_event_report
	.align	3
.LC85:
	.xword	.LC84
	.align	3
.LC87:
	.xword	.LC86
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VC1_Adv
	.type	DecodeStream_VC1_Adv, %function
DecodeStream_VC1_Adv:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	add	x21, x1, 53248
	bl	_mcount
	mov	x0, x19
	ldr	w22, [x21, 1024]
	bl	VC1_GetPacketState
	cmp	w0, 2
	beq	.L389
.L385:
	ldr	w0, [x21, 1024]
	mov	x1, x20
	bl	SegMan
	cbz	w0, .L390
	ldr	x0, [x19, 8]
	cbz	x0, .L391
.L384:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L390:
	add	x20, x20, 88
	mov	x0, x19
	mov	x1, x20
	bl	VC1DEC_Decode
	ldr	x3, .LC89
	mov	x2, 160
	mov	w1, 0
	mov	x0, x20
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x0, [x19, 8]
	cbnz	x0, .L384
.L391:
	add	x19, x19, 12288
	ldrb	w0, [x19, 2511]
	cmp	w0, 1
	bne	.L384
	ldr	w0, [x21, 1024]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x19, 2511]
	b	.L384
	.p2align 3
.L389:
	ldr	x0, .LC88
	ldr	x0, [x0, w22, sxtw 3]
	ldr	w1, [x0, 1448]
	cmp	w1, 1
	beq	.L392
.L386:
	add	x1, x19, 12288
	mov	x0, x19
	add	x1, x1, 2344
	bl	VC1DEC_Decode
	b	.L385
	.p2align 3
.L392:
	ldr	w0, [x0, 1488]
	cbnz	w0, .L385
	b	.L386
	.size	DecodeStream_VC1_Adv, .-DecodeStream_VC1_Adv
	.align	3
.LC88:
	.xword	s_pstVfmwChan
	.align	3
.LC89:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_VC1
	.type	DecodeStream_VC1, %function
DecodeStream_VC1:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrb	w2, [x19, 17]
	mov	w0, 22
	ldr	x1, .LC91
	bl	dprint_vfmw
	ldr	x1, .LC93
	mov	w0, 22
	ldr	w2, [x19, 20]
	bl	dprint_vfmw
	ldr	x1, .LC95
	mov	w0, 22
	ldr	w2, [x19, 24]
	bl	dprint_vfmw
	ldr	x1, [x20]
	ldr	w0, [x1, 556]
	cmp	w0, 1
	bhi	.L398
	ldr	w2, [x1, 560]
	cmp	w2, 8
	bgt	.L399
	add	x2, x20, 16384
	sxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x2, 1512]
	ldr	w0, [x1, 560]
	mov	x1, x20
	strb	w0, [x2, 1514]
	mov	x0, x19
	beq	.L400
	bl	DecodeStream_VC1_Smp
.L393:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L398:
	ldr	x1, .LC97
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L399:
	ldr	x1, .LC99
	mov	w0, 0
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L400:
	bl	DecodeStream_VC1_Adv
	b	.L393
	.size	DecodeStream_VC1, .-DecodeStream_VC1
	.align	3
.LC91:
	.xword	.LC90
	.align	3
.LC93:
	.xword	.LC92
	.align	3
.LC95:
	.xword	.LC94
	.align	3
.LC97:
	.xword	.LC96
	.align	3
.LC99:
	.xword	.LC98
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_MPEG2
	.type	DecodeStream_MPEG2, %function
DecodeStream_MPEG2:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	add	x20, x1, 90112
	bl	_mcount
	mov	x0, x19
	ldr	w22, [x20, 840]
	bl	MP2_GetPacketState
	cmp	w0, 2
	beq	.L407
.L402:
	ldr	w0, [x20, 840]
	mov	x1, x21
	bl	SegMan
	cbz	w0, .L408
	ldr	x0, [x19, 8]
	cbz	x0, .L409
.L401:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L408:
	add	x1, x21, 88
	mov	x0, x19
	bl	MPEG2DEC_Decode
	ldrb	w0, [x20, 857]
	cmp	w0, 1
	csel	w0, w0, wzr, eq
	strb	w0, [x21, 1]
	ldr	x0, [x19, 8]
	cbnz	x0, .L401
.L409:
	ldrb	w0, [x20, 858]
	cmp	w0, 1
	bne	.L401
	ldr	w0, [x20, 840]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 858]
	b	.L401
	.p2align 3
.L407:
	ldr	x0, .LC100
	ldr	x0, [x0, w22, sxtw 3]
	ldr	w1, [x0, 1448]
	cmp	w1, 1
	beq	.L410
.L403:
	add	x1, x19, 86016
	mov	x0, x19
	add	x1, x1, 3776
	bl	MPEG2DEC_Decode
	b	.L402
	.p2align 3
.L410:
	ldr	w0, [x0, 1488]
	cbnz	w0, .L402
	b	.L403
	.size	DecodeStream_MPEG2, .-DecodeStream_MPEG2
	.align	3
.LC100:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_MPEG4
	.type	DecodeStream_MPEG4, %function
DecodeStream_MPEG4:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	add	x20, x1, 20480
	bl	_mcount
	mov	x0, x19
	ldr	w22, [x20, 2824]
	bl	MP4_GetPacketState
	cmp	w0, 3
	beq	.L416
.L412:
	ldr	w0, [x20, 2824]
	mov	x1, x21
	bl	SegMan
	cbz	w0, .L417
	ldr	x0, [x19, 1040]
	cbz	x0, .L418
.L411:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L417:
	add	x1, x21, 88
	mov	x0, x19
	bl	MPEG4DEC_Decode
	ldr	x0, [x19, 1040]
	cbnz	x0, .L411
.L418:
	ldrb	w0, [x20, 2860]
	cmp	w0, 1
	bne	.L411
	ldr	w0, [x20, 2824]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x20, 2860]
	b	.L411
	.p2align 3
.L416:
	ldr	x0, .LC101
	ldr	x0, [x0, w22, sxtw 3]
	ldr	w1, [x0, 1448]
	cmp	w1, 1
	beq	.L419
.L413:
	add	x1, x19, 12288
	mov	x0, x19
	add	x1, x1, 3456
	bl	MPEG4DEC_Decode
	b	.L412
	.p2align 3
.L419:
	ldr	w0, [x0, 1488]
	cbnz	w0, .L412
	b	.L413
	.size	DecodeStream_MPEG4, .-DecodeStream_MPEG4
	.align	3
.LC101:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream_AVS
	.type	DecodeStream_AVS, %function
DecodeStream_AVS:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	mov	x0, x19
	ldr	w21, [x19, 4]
	bl	AVS_GetPacketState
	cbnz	w0, .L421
	ldr	x0, .LC102
	ldr	x0, [x0, w21, sxtw 3]
	ldr	w1, [x0, 1448]
	cmp	w1, 1
	beq	.L425
	add	x1, x19, 16384
	mov	x0, x19
	add	x1, x1, 432
	bl	AVSDEC_Decode
.L421:
	ldr	w0, [x19, 4]
	mov	x1, x20
	bl	SegMan
	cbz	w0, .L426
	ldr	x0, [x19, 24]
	cbz	x0, .L427
.L420:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L425:
	ldr	w0, [x0, 1488]
	cbnz	w0, .L421
	add	x1, x19, 16384
	mov	x0, x19
	add	x1, x1, 432
	bl	AVSDEC_Decode
	b	.L421
	.p2align 3
.L426:
	add	x1, x20, 88
	mov	x0, x19
	bl	AVSDEC_Decode
	ldr	x0, [x19, 24]
	cbnz	x0, .L420
.L427:
	ldrb	w0, [x19]
	cmp	w0, 1
	bne	.L420
	ldr	w0, [x19, 4]
	bl	VCTRL_OutputLastFrame
	strb	wzr, [x19]
	b	.L420
	.size	DecodeStream_AVS, .-DecodeStream_AVS
	.align	3
.LC102:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecodeStream
	.type	DecodeStream, %function
DecodeStream:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	bl	_mcount
	mov	w0, 6
	bl	VCTRL_RecordPosTime
	cmp	w19, 17
	bls	.L445
.L429:
	ldr	x2, .LC104
	mov	w3, 1830
	ldr	x1, .LC106
	mov	w0, 32
	add	x2, x2, 72
	bl	dprint_vfmw
.L444:
	mov	w0, 7
	bl	VCTRL_RecordPosTime
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L445:
	ldr	x0, .LC103
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx431
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx431:
	.section	.rodata
	.align	0
	.align	2
.L431:
	.byte	(.L430 - .Lrtx431) / 4
	.byte	(.L432 - .Lrtx431) / 4
	.byte	(.L433 - .Lrtx431) / 4
	.byte	(.L434 - .Lrtx431) / 4
	.byte	(.L429 - .Lrtx431) / 4
	.byte	(.L435 - .Lrtx431) / 4
	.byte	(.L436 - .Lrtx431) / 4
	.byte	(.L429 - .Lrtx431) / 4
	.byte	(.L437 - .Lrtx431) / 4
	.byte	(.L438 - .Lrtx431) / 4
	.byte	(.L439 - .Lrtx431) / 4
	.byte	(.L439 - .Lrtx431) / 4
	.byte	(.L439 - .Lrtx431) / 4
	.byte	(.L440 - .Lrtx431) / 4
	.byte	(.L429 - .Lrtx431) / 4
	.byte	(.L441 - .Lrtx431) / 4
	.byte	(.L442 - .Lrtx431) / 4
	.byte	(.L443 - .Lrtx431) / 4
	.text
	.p2align 3
.L443:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_VP9
	b	.L444
	.p2align 3
.L430:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_H264
	b	.L444
	.p2align 3
.L432:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_VC1
	b	.L444
	.p2align 3
.L433:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_MPEG4
	b	.L444
	.p2align 3
.L434:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_MPEG2
	b	.L444
	.p2align 3
.L435:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_DIVX3
	b	.L444
	.p2align 3
.L436:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_AVS
	b	.L444
	.p2align 3
.L437:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_REAL8
	b	.L444
	.p2align 3
.L438:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_REAL9
	b	.L444
	.p2align 3
.L439:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_VP6
	b	.L444
	.p2align 3
.L440:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_VP8
	b	.L444
	.p2align 3
.L441:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_MVC
	b	.L444
	.p2align 3
.L442:
	mov	x1, x21
	mov	x0, x20
	bl	DecodeStream_HEVC
	b	.L444
	.size	DecodeStream, .-DecodeStream
	.align	3
.LC103:
	.xword	.L431
	.align	3
.LC104:
	.xword	.LANCHOR1
	.align	3
.LC106:
	.xword	.LC105
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleasePacket
	.type	ReleasePacket, %function
ReleasePacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	sub	w0, w20, #5
	cmp	w0, 12
	bls	.L471
.L447:
	ldr	x1, .LC116
	mov	w2, w20
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L471:
	ldr	x1, .LC107
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx449
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx449:
	.section	.rodata
	.align	0
	.align	2
.L449:
	.byte	(.L448 - .Lrtx449) / 4
	.byte	(.L447 - .Lrtx449) / 4
	.byte	(.L447 - .Lrtx449) / 4
	.byte	(.L450 - .Lrtx449) / 4
	.byte	(.L451 - .Lrtx449) / 4
	.byte	(.L452 - .Lrtx449) / 4
	.byte	(.L452 - .Lrtx449) / 4
	.byte	(.L452 - .Lrtx449) / 4
	.byte	(.L453 - .Lrtx449) / 4
	.byte	(.L447 - .Lrtx449) / 4
	.byte	(.L447 - .Lrtx449) / 4
	.byte	(.L447 - .Lrtx449) / 4
	.byte	(.L454 - .Lrtx449) / 4
	.text
	.p2align 3
.L454:
	ldr	x20, [x19]
	add	x19, x19, 294912
	ldr	w1, [x20, 244]
	ldr	w0, [x19, 3904]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x20, 233]
	cmp	w0, 1
	beq	.L461
	ldr	x1, .LC114
	mov	w0, 1
	bl	dprint_vfmw
.L461:
	ldr	x3, .LC108
	mov	x2, 160
	mov	w1, 0
	add	x0, x20, 224
	ldr	x3, [x3, 96]
	blr	x3
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L448:
	ldr	x20, [x19]
	ldrb	w1, [x20, 233]
	cmp	w1, 1
	bne	.L461
	add	x19, x19, 40960
	ldr	w1, [x20, 244]
	ldr	w0, [x19, 3808]
	bl	SM_ReleaseStreamSeg
	b	.L461
	.p2align 3
.L450:
	ldr	x20, [x19]
	ldrb	w1, [x20, 233]
	cmp	w1, 1
	bne	.L461
	add	x19, x19, 53248
	ldr	w1, [x20, 244]
	ldr	w0, [x19, 3864]
	bl	SM_ReleaseStreamSeg
	b	.L461
	.p2align 3
.L451:
	ldr	x20, [x19]
	ldrb	w1, [x20, 233]
	cmp	w1, 1
	bne	.L461
	add	x19, x19, 53248
	ldr	w1, [x20, 244]
	ldr	w0, [x19, 3832]
	bl	SM_ReleaseStreamSeg
	b	.L461
	.p2align 3
.L452:
	ldr	x20, [x19]
	ldr	w0, [x19, 13360]
	ldr	w1, [x20, 244]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x20, 233]
	cmp	w0, 1
	beq	.L461
	ldr	x1, .LC112
	mov	w0, 1
	bl	dprint_vfmw
	b	.L461
	.p2align 3
.L453:
	ldr	x20, [x19]
	ldr	w0, [x19, 8816]
	ldr	w1, [x20, 244]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x20, 233]
	cmp	w0, 1
	beq	.L461
	ldr	x1, .LC110
	mov	w0, 1
	bl	dprint_vfmw
	b	.L461
	.size	ReleasePacket, .-ReleasePacket
	.align	3
.LC107:
	.xword	.L449
	.align	3
.LC108:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC110:
	.xword	.LC109
	.align	3
.LC112:
	.xword	.LC111
	.align	3
.LC114:
	.xword	.LC113
	.align	3
.LC116:
	.xword	.LC115
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic_VPx
	.type	ReleaseCurPic_VPx, %function
ReleaseCurPic_VPx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	sub	w0, w19, #10
	cmp	w0, 7
	bhi	.L472
	ldr	x1, .LC117
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx475
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx475:
	.section	.rodata
	.align	0
	.align	2
.L475:
	.byte	(.L474 - .Lrtx475) / 4
	.byte	(.L474 - .Lrtx475) / 4
	.byte	(.L474 - .Lrtx475) / 4
	.byte	(.L476 - .Lrtx475) / 4
	.byte	(.L472 - .Lrtx475) / 4
	.byte	(.L472 - .Lrtx475) / 4
	.byte	(.L472 - .Lrtx475) / 4
	.byte	(.L477 - .Lrtx475) / 4
	.text
	.p2align 3
.L474:
	ldr	x19, [x20]
	ldr	w0, [x20, 13360]
	ldr	w1, [x19, 244]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 233]
	cmp	w0, 1
	beq	.L480
	ldr	x1, .LC121
	mov	w0, 1
	bl	dprint_vfmw
.L480:
	ldr	x3, .LC119
	mov	x2, 160
	mov	w1, 0
	add	x0, x19, 224
	ldr	x3, [x3, 96]
	blr	x3
.L472:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L477:
	ldr	x19, [x20]
	add	x20, x20, 294912
	ldr	w1, [x19, 244]
	ldr	w0, [x20, 3904]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 233]
	cmp	w0, 1
	beq	.L480
	ldr	x1, .LC118
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x3, .LC119
	mov	x2, 160
	mov	w1, 0
	add	x0, x19, 224
	ldr	x3, [x3, 96]
	blr	x3
	b	.L472
	.p2align 3
.L476:
	ldr	x19, [x20]
	ldr	w0, [x20, 8816]
	ldr	w1, [x19, 244]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 233]
	cmp	w0, 1
	beq	.L480
	ldr	x1, .LC120
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x3, .LC119
	mov	x2, 160
	mov	w1, 0
	add	x0, x19, 224
	ldr	x3, [x3, 96]
	blr	x3
	b	.L472
	.size	ReleaseCurPic_VPx, .-ReleaseCurPic_VPx
	.align	3
.LC117:
	.xword	.L475
	.align	3
.LC118:
	.xword	.LC113
	.align	3
.LC119:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC120:
	.xword	.LC109
	.align	3
.LC121:
	.xword	.LC111
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic_Realx
	.type	ReleaseCurPic_Realx, %function
ReleaseCurPic_Realx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 8
	beq	.L492
	cmp	w19, 9
	bne	.L490
	ldr	x19, [x20]
	ldrb	w1, [x19, 233]
	cmp	w1, 1
	beq	.L496
.L495:
	ldr	x3, .LC122
	mov	x2, 160
	mov	w1, 0
	add	x0, x19, 224
	ldr	x3, [x3, 96]
	blr	x3
.L490:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L492:
	ldr	x19, [x20]
	ldrb	w1, [x19, 233]
	cmp	w1, 1
	bne	.L495
	add	x20, x20, 53248
	ldr	w1, [x19, 244]
	ldr	w0, [x20, 3864]
	bl	SM_ReleaseStreamSeg
	b	.L495
	.p2align 3
.L496:
	add	x20, x20, 53248
	ldr	w1, [x19, 244]
	ldr	w0, [x20, 3832]
	bl	SM_ReleaseStreamSeg
	b	.L495
	.size	ReleaseCurPic_Realx, .-ReleaseCurPic_Realx
	.align	3
.LC122:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic_DIVX3
	.type	ReleaseCurPic_DIVX3, %function
ReleaseCurPic_DIVX3:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	ldr	x19, [x20]
	ldrb	w1, [x19, 233]
	cmp	w1, 1
	beq	.L499
.L498:
	ldr	x3, .LC123
	mov	x2, 160
	mov	w1, 0
	add	x0, x19, 224
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L499:
	add	x20, x20, 40960
	ldr	w1, [x19, 244]
	ldr	w0, [x20, 3808]
	bl	SM_ReleaseStreamSeg
	b	.L498
	.size	ReleaseCurPic_DIVX3, .-ReleaseCurPic_DIVX3
	.align	3
.LC123:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseCurPic
	.type	ReleaseCurPic, %function
ReleaseCurPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cmp	w19, 17
	bls	.L517
.L501:
	ldr	x1, .LC125
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
.L500:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L517:
	ldr	x0, .LC124
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx503
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx503:
	.section	.rodata
	.align	0
	.align	2
.L503:
	.byte	(.L502 - .Lrtx503) / 4
	.byte	(.L504 - .Lrtx503) / 4
	.byte	(.L505 - .Lrtx503) / 4
	.byte	(.L506 - .Lrtx503) / 4
	.byte	(.L501 - .Lrtx503) / 4
	.byte	(.L507 - .Lrtx503) / 4
	.byte	(.L508 - .Lrtx503) / 4
	.byte	(.L501 - .Lrtx503) / 4
	.byte	(.L509 - .Lrtx503) / 4
	.byte	(.L510 - .Lrtx503) / 4
	.byte	(.L511 - .Lrtx503) / 4
	.byte	(.L511 - .Lrtx503) / 4
	.byte	(.L511 - .Lrtx503) / 4
	.byte	(.L512 - .Lrtx503) / 4
	.byte	(.L501 - .Lrtx503) / 4
	.byte	(.L513 - .Lrtx503) / 4
	.byte	(.L514 - .Lrtx503) / 4
	.byte	(.L515 - .Lrtx503) / 4
	.text
	.p2align 3
.L515:
	mov	x1, x20
	mov	w0, 17
	bl	ReleaseCurPic_VPx
	b	.L500
	.p2align 3
.L502:
	mov	x0, x20
	bl	H264_ClearCurrPic
	b	.L500
	.p2align 3
.L504:
	add	x1, x20, 53248
	add	x0, x20, 12288
	add	x0, x0, 2504
	ldr	w1, [x1, 1024]
	bl	VC1_ClearCurPic
	b	.L500
	.p2align 3
.L505:
	mov	x0, x20
	bl	MP4_ClearCurPic
	mov	x0, x20
	bl	MP4_Clean_HeadPacket
	b	.L500
	.p2align 3
.L506:
	mov	x0, x20
	bl	MP2_ClearCurPic
	b	.L500
	.p2align 3
.L507:
	mov	x1, x20
	mov	w0, 5
	bl	ReleaseCurPic_DIVX3
	b	.L500
	.p2align 3
.L508:
	mov	x0, x20
	bl	AVS_ClearCurPic
	b	.L500
	.p2align 3
.L509:
	mov	x1, x20
	mov	w0, 8
	bl	ReleaseCurPic_Realx
	b	.L500
	.p2align 3
.L510:
	mov	x1, x20
	mov	w0, 9
	bl	ReleaseCurPic_Realx
	b	.L500
	.p2align 3
.L511:
	mov	x1, x20
	mov	w0, w19
	bl	ReleaseCurPic_VPx
	b	.L500
	.p2align 3
.L512:
	mov	x1, x20
	mov	w0, 13
	bl	ReleaseCurPic_VPx
	b	.L500
	.p2align 3
.L513:
	mov	x0, x20
	bl	MVC_ClearCurrPic
	b	.L500
	.p2align 3
.L514:
	mov	x0, x20
	bl	HEVC_ClearCurrPic
	b	.L500
	.size	ReleaseCurPic, .-ReleaseCurPic
	.align	3
.LC124:
	.xword	.L503
	.align	3
.LC125:
	.xword	.LC115
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegMpeg2
	.type	CheckNewPicSegMpeg2, %function
CheckNewPicSegMpeg2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w2, [x20, 3]
	mov	w1, 179
	add	w0, w2, 73
	cmp	w2, wzr
	ccmp	w2, w1, 4, ne
	uxtb	w0, w0
	ccmp	w0, 1, 0, ne
	bhi	.L522
	ldr	w0, [x19]
	cbnz	w0, .L522
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w2, [x20, 3]
.L519:
	cbnz	w2, .L520
	str	wzr, [x19]
.L520:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L522:
	mov	w0, -1
	b	.L519
	.size	CheckNewPicSegMpeg2, .-CheckNewPicSegMpeg2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegMpeg4
	.type	CheckNewPicSegMpeg4, %function
CheckNewPicSegMpeg4:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	mov	w21, w2
	bl	_mcount
	ldrb	w3, [x20, 3]
	mov	w1, 47
	mov	w0, 176
	cmp	w3, 254
	add	w4, w3, 75
	ccmp	w3, w1, 0, ne
	cset	w1, ls
	cmp	w3, 179
	ccmp	w3, w0, 4, ne
	uxtb	w4, w4
	cset	w0, eq
	cmp	w4, 1
	orr	w0, w1, w0
	cset	w1, ls
	orr	w0, w1, w0
	cbnz	w0, .L535
.L524:
	cmp	w21, 1
	bne	.L528
.L525:
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w3, [x20, 3]
.L526:
	cmp	w3, 182
	bne	.L527
	str	wzr, [x19]
.L527:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L535:
	ldr	w0, [x19]
	cbz	w0, .L525
	b	.L524
	.p2align 3
.L528:
	mov	w0, -1
	b	.L526
	.size	CheckNewPicSegMpeg4, .-CheckNewPicSegMpeg4
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegAVS
	.type	CheckNewPicSegAVS, %function
CheckNewPicSegAVS:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w2, [x20, 3]
	add	w0, w2, 74
	cmp	w2, 179
	cset	w3, eq
	uxtb	w0, w0
	cmp	w0, 1
	cset	w1, ls
	cmp	w2, 176
	cset	w0, eq
	orr	w0, w3, w0
	orr	w0, w1, w0
	cbz	w0, .L540
	ldr	w0, [x19]
	cbnz	w0, .L540
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w2, [x20, 3]
	cmp	w2, 179
	cset	w3, eq
.L537:
	cmp	w2, 182
	cset	w1, eq
	orr	w1, w3, w1
	cbz	w1, .L538
	str	wzr, [x19]
.L538:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L540:
	mov	w0, -1
	b	.L537
	.size	CheckNewPicSegAVS, .-CheckNewPicSegAVS
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegVC1
	.type	CheckNewPicSegVC1, %function
CheckNewPicSegVC1:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w2, [x20, 3]
	sub	w0, w2, #12
	uxtb	w0, w0
	cmp	w0, 3
	ccmp	w2, 10, 4, hi
	bne	.L548
	ldr	w0, [x19]
	cbnz	w0, .L548
	mov	w0, 1
	str	w0, [x19]
	mov	w0, 0
	ldrb	w2, [x20, 3]
.L545:
	cmp	w2, 13
	bne	.L546
	str	wzr, [x19]
.L546:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L548:
	mov	w0, -1
	b	.L545
	.size	CheckNewPicSegVC1, .-CheckNewPicSegVC1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckNewPicSegByVidStd
	.type	CheckNewPicSegByVidStd, %function
CheckNewPicSegByVidStd:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	mov	w22, w3
	bl	_mcount
	cmp	w19, 16
	ldr	x1, [x21]
	bls	.L570
.L561:
	mov	w0, -1
.L550:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L570:
	ldr	x0, .LC126
	ldrb	w0, [x0,w19,uxtw]
	adr	x2, .Lrtx552
	add	x0, x2, w0, sxtb #2
	br	x0
.Lrtx552:
	.section	.rodata
	.align	0
	.align	2
.L552:
	.byte	(.L551 - .Lrtx552) / 4
	.byte	(.L553 - .Lrtx552) / 4
	.byte	(.L554 - .Lrtx552) / 4
	.byte	(.L555 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L556 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L561 - .Lrtx552) / 4
	.byte	(.L557 - .Lrtx552) / 4
	.byte	(.L558 - .Lrtx552) / 4
	.text
	.p2align 3
.L551:
	mov	x0, x20
	bl	H264_IsNewPicNal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L553:
	ldrb	w2, [x1, 3]
	mov	w0, -1
	sub	w3, w2, #12
	uxtb	w3, w3
	cmp	w3, 3
	ccmp	w2, 10, 4, hi
	cset	w3, eq
	cbnz	w3, .L571
.L560:
	cmp	w2, 13
	bne	.L550
	str	wzr, [x20]
.L573:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L554:
	mov	w2, w22
	mov	x0, x20
	bl	CheckNewPicSegMpeg4
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L555:
	ldrb	w2, [x1, 3]
	mov	w4, 179
	mov	w0, -1
	add	w3, w2, 73
	cmp	w2, wzr
	ccmp	w2, w4, 4, ne
	uxtb	w3, w3
	ccmp	w3, 1, 0, ne
	cset	w3, ls
	cbnz	w3, .L572
.L559:
	cbnz	w2, .L550
.L569:
	str	wzr, [x20]
	b	.L573
	.p2align 3
.L557:
	mov	x0, x20
	bl	MVC_IsNewPicNal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L558:
	mov	x0, x20
	bl	HEVC_IsNewPicNal
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L556:
	mov	x0, x20
	bl	CheckNewPicSegAVS
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L572:
	ldr	w3, [x20]
	cbnz	w3, .L559
	mov	w0, 1
	str	w0, [x20]
	mov	w0, 0
	ldrb	w2, [x1, 3]
	cbz	w2, .L569
	b	.L550
	.p2align 3
.L571:
	ldr	w3, [x20]
	cbnz	w3, .L560
	mov	w0, 1
	str	w0, [x20]
	mov	w0, 0
	ldrb	w2, [x1, 3]
	b	.L560
	.size	CheckNewPicSegByVidStd, .-CheckNewPicSegByVidStd
	.align	3
.LC126:
	.xword	.L552
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsNewpicSeg
	.type	IsNewpicSeg, %function
IsNewpicSeg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	mov	x19, x2
	bl	_mcount
	cmp	w20, 2
	mov	w3, 0
	ldr	x0, [x19]
	beq	.L585
.L575:
	ldrb	w2, [x0]
	ldrb	w5, [x0, 1]
	ldrb	w4, [x0, 2]
	cbnz	w2, .L578
	cbnz	w5, .L578
	cmp	w4, 1
	bne	.L578
.L576:
	mov	x2, x19
	mov	w1, w20
	mov	x0, x21
	bl	CheckNewPicSegByVidStd
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L585:
	ldrb	w1, [x19, 72]
	and	w3, w1, 1
	tbz	x1, 0, .L575
	b	.L576
	.p2align 3
.L578:
	ldr	x1, .LC128
	mov	w3, w5
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	IsNewpicSeg, .-IsNewpicSeg
	.align	3
.LC128:
	.xword	.LC127
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	OpenUsdPool
	.type	OpenUsdPool, %function
OpenUsdPool:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC131
	add	x19, x19, 128
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L592
.L587:
	add	x1, x0, 204800
	str	wzr, [x0]
	add	x1, x1, 536
	add	x0, x0, 1048
	.p2align 2
.L589:
	stp	wzr, wzr, [x0, -4]
	add	x0, x0, 1064
	cmp	x0, x1
	bne	.L589
	mov	w0, 0
.L588:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L592:
	ldr	x1, .LC132
	mov	w0, 7688
	movk	w0, 0x3, lsl 16
	ldr	x1, [x1, 400]
	blr	x1
	str	x0, [x19, w20, sxtw 3]
	cbnz	x0, .L587
	mov	w0, -1
	b	.L588
	.size	OpenUsdPool, .-OpenUsdPool
	.align	3
.LC131:
	.xword	.LANCHOR0
	.align	3
.LC132:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CloseUsdPool
	.type	CloseUsdPool, %function
CloseUsdPool:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	x19, .LC134
	add	x19, x19, 128
	ldr	x0, [x19, w20, sxtw 3]
	cbz	x0, .L593
	ldr	x1, .LC135
	ldr	x1, [x1, 408]
	blr	x1
	str	xzr, [x19, w20, sxtw 3]
.L593:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CloseUsdPool, .-CloseUsdPool
	.align	3
.LC134:
	.xword	.LANCHOR0
	.align	3
.LC135:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	OpenUsdPool_WithMem
	.type	OpenUsdPool_WithMem, %function
OpenUsdPool_WithMem:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, .LC137
	add	x1, x1, 128
	ldr	x0, [x1, w19, sxtw 3]
	cbz	x0, .L604
.L599:
	add	x1, x0, 204800
	str	wzr, [x0]
	add	x1, x1, 536
	add	x0, x0, 1048
	.p2align 2
.L601:
	stp	wzr, wzr, [x0, -4]
	add	x0, x0, 1064
	cmp	x0, x1
	bne	.L601
	mov	w0, 0
.L600:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L604:
	str	x20, [x1, w19, sxtw 3]
	cbz	x20, .L602
	mov	x0, x20
	b	.L599
.L602:
	mov	w0, -1
	b	.L600
	.size	OpenUsdPool_WithMem, .-OpenUsdPool_WithMem
	.align	3
.LC137:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CloseUsdPool_WithMem
	.type	CloseUsdPool_WithMem, %function
CloseUsdPool_WithMem:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC139
	add	x0, x0, 128
	ldr	x1, [x0, w19, sxtw 3]
	cbz	x1, .L605
	str	xzr, [x0, w19, sxtw 3]
.L605:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CloseUsdPool_WithMem, .-CloseUsdPool_WithMem
	.align	3
.LC139:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitUsdPool
	.type	InitUsdPool, %function
InitUsdPool:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC141
	add	x0, x0, 128
	ldr	x0, [x0, w19, sxtw 3]
	cbz	x0, .L613
	add	x1, x0, 204800
	str	wzr, [x0]
	add	x1, x1, 536
	add	x0, x0, 1048
	.p2align 2
.L612:
	stp	wzr, wzr, [x0, -4]
	add	x0, x0, 1064
	cmp	x0, x1
	bne	.L612
	mov	w0, 0
.L611:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L613:
	mov	w0, -1
	b	.L611
	.size	InitUsdPool, .-InitUsdPool
	.align	3
.LC141:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetUsd
	.type	GetUsd, %function
GetUsd:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC143
	add	x0, x0, 128
	ldr	x3, [x0, w19, sxtw 3]
	cbz	x3, .L619
	add	x0, x3, 1048
	mov	w1, 0
	b	.L618
	.p2align 3
.L617:
	add	w1, w1, 1
	add	x0, x0, 1064
	cmp	w1, 192
	beq	.L619
.L618:
	ldr	w2, [x0]
	cbnz	w2, .L617
	ldr	w2, [x0, -4]
	cbnz	w2, .L617
	sxtw	x0, w1
	lsl	x1, x0, 7
	add	x1, x1, x0, lsl 2
	add	x0, x1, x0
	add	x1, x3, x0, lsl 3
	add	x0, x1, 8
	strb	wzr, [x1, 1034]
	strb	wzr, [x1, 1035]
	strb	wzr, [x1, 1036]
	strh	wzr, [x1, 1038]
	str	wzr, [x1, 1044]
	str	wzr, [x1, 1052]
	str	wzr, [x1, 1056]
	str	wzr, [x1, 1060]
	str	xzr, [x1, 1064]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L619:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetUsd, .-GetUsd
	.align	3
.LC143:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FreeUsdByDec
	.type	FreeUsdByDec, %function
FreeUsdByDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L621
	str	wzr, [x19, 1040]
.L621:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	FreeUsdByDec, .-FreeUsdByDec
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MarkUsdByDnr
	.type	MarkUsdByDnr, %function
MarkUsdByDnr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L626
	mov	w0, 1
	str	w0, [x19, 1036]
.L626:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MarkUsdByDnr, .-MarkUsdByDnr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkUsdByDnr
	.type	UnMarkUsdByDnr, %function
UnMarkUsdByDnr:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L631
	str	wzr, [x19, 1036]
.L631:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	UnMarkUsdByDnr, .-UnMarkUsdByDnr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsImageInVoQueue
	.type	IsImageInVoQueue, %function
IsImageInVoQueue:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L648
	ldrh	w0, [x19, 4]
	ldrh	w4, [x19, 8]
	and	w0, w0, 63
	.p2align 2
.L647:
	cmp	w0, w4
	beq	.L641
	sxtw	x2, w0
	add	w0, w0, 1
	add	x2, x2, 2
	and	w0, w0, 63
	ldr	x2, [x19, x2, lsl 3]
	cbz	x2, .L647
	ldr	w3, [x2, 180]
	ldr	w2, [x20, 180]
	cmp	w3, w2
	bne	.L647
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L641:
	mov	w0, -1
.L638:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L648:
	ldr	x1, .LC145
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L638
	.size	IsImageInVoQueue, .-IsImageInVoQueue
	.align	3
.LC145:
	.xword	.LC17
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsVoQueueEmpty
	.type	IsVoQueueEmpty, %function
IsVoQueueEmpty:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L653
	ldrh	w2, [x19, 6]
	mov	w0, 0
	ldrh	w1, [x19, 8]
	cmp	w1, w2
	beq	.L654
.L651:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L654:
	ldrh	w0, [x19, 4]
	ldr	x19, [sp, 16]
	cmp	w0, w1
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L653:
	ldr	x2, .LC146
	mov	w0, 0
	ldr	x1, .LC148
	add	x2, x2, 88
	bl	dprint_vfmw
	mov	w0, 0
	b	.L651
	.size	IsVoQueueEmpty, .-IsVoQueueEmpty
	.align	3
.LC146:
	.xword	.LANCHOR1
	.align	3
.LC148:
	.xword	.LC147
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SetAspectRatio
	.type	SetAspectRatio, %function
SetAspectRatio:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 5
	bls	.L665
	ldr	x1, .LC151
	mov	w2, w20
	mov	w0, 1
	stp	wzr, w0, [x19]
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L665:
	ldr	x0, .LC149
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx658
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx658:
	.section	.rodata
	.align	0
	.align	2
.L658:
	.byte	(.L657 - .Lrtx658) / 4
	.byte	(.L659 - .Lrtx658) / 4
	.byte	(.L660 - .Lrtx658) / 4
	.byte	(.L661 - .Lrtx658) / 4
	.byte	(.L662 - .Lrtx658) / 4
	.byte	(.L663 - .Lrtx658) / 4
	.text
	.p2align 3
.L662:
	mov	w1, 235
	mov	w0, 100
	stp	w1, w0, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L663:
	mov	w0, 2
	stp	wzr, w0, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L657:
	mov	w0, 1
	stp	wzr, w0, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L659:
	mov	w1, 4
	mov	w0, 3
	stp	w1, w0, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L660:
	mov	w1, 16
	mov	w0, 9
	stp	w1, w0, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L661:
	mov	w1, 221
	mov	w0, 100
	stp	w1, w0, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SetAspectRatio, .-SetAspectRatio
	.align	3
.LC149:
	.xword	.L658
	.align	3
.LC151:
	.xword	.LC150
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetVoLastImageID
	.type	GetVoLastImageID, %function
GetVoLastImageID:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 552]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	csinv	w0, w0, wzr, hi
	ldp	x29, x30, [sp], 32
	ret
	.size	GetVoLastImageID, .-GetVoLastImageID
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsMain10Profile
	.type	IsMain10Profile, %function
IsMain10Profile:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 86016
	ldr	w2, [x1, 2872]
	cmp	w2, 1
	beq	.L672
	ldr	w3, [x1, 2876]
	mov	w0, 0
	cmp	w3, 1
	beq	.L675
	cmp	w2, 2
	beq	.L674
	ldr	w0, [x1, 2880]
	cmp	w0, 1
	cset	w0, eq
.L671:
	ldr	w1, [x1, 2880]
	cmp	w1, 1
	cset	w1, eq
	orr	w0, w1, w0
.L675:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L672:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L674:
	mov	w0, 1
	b	.L671
	.size	IsMain10Profile, .-IsMain10Profile
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MetadataMapToSec
	.type	MetadataMapToSec, %function
MetadataMapToSec:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	MetadataMapToSec, .-MetadataMapToSec
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MetadataUnMapToSec
	.type	MetadataUnMapToSec, %function
MetadataUnMapToSec:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	MetadataUnMapToSec, .-MetadataUnMapToSec
	.global	pstVdecUsdPool
	.global	g_DnrEnable
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	__FUNCTION__.12886, %object
	.size	__FUNCTION__.12886, 19
__FUNCTION__.12886:
	.string	"InsertImgToVoQueue"
	.zero	5
	.type	__func__.12922, %object
	.size	__func__.12922, 20
__func__.12922:
	.string	"SYNTAX_ReceiveImage"
	.zero	4
	.type	__func__.12968, %object
	.size	__func__.12968, 20
__func__.12968:
	.string	"SYNTAX_ReleaseImage"
	.zero	4
	.type	__func__.13097, %object
	.size	__func__.13097, 13
__func__.13097:
	.string	"DecodeStream"
	.zero	3
	.type	__func__.13270, %object
	.size	__func__.13270, 15
__func__.13270:
	.string	"IsVoQueueEmpty"
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"Initializing VO queue\n" )
	.zero	1
.LC2:
	ASCII(.string	"VoQueue state: head(%d) history(%d) tail(%d)" )
	.zero	3
.LC4:
	ASCII(.string	"\n" )
	.zero	6
.LC6:
	ASCII(.string	"%d " )
	.zero	4
.LC9:
	ASCII(.string	"ResetVoQueue but queue not empty: head(%d) history(%d) tail(%d)\n" )
	.zero	7
.LC13:
	ASCII(.string	"out_pts: %lld -> %lld Usertag %lld\n" )
	.zero	4
.LC17:
	ASCII(.string	"image point NULL\n" )
	.zero	6
.LC19:
	ASCII(.string	"call InsertVOQueue\n" )
	.zero	4
.LC22:
	ASCII(.string	"FATAL: p_image(id=%d) has already in the VoQueue!\n" )
	.zero	5
.LC24:
	ASCII(.string	"error=%d,W=%d,H=%d,not acceptable!\n" )
	.zero	4
.LC26:
	ASCII(.string	"Queue=(%02d,%02d,%02d) + F%d\n" )
	.zero	2
.LC37:
	ASCII(.string	"%s, pstVoQue is NULL!!!\n" )
	.zero	7
.LC40:
	ASCII(.string	"Queue=(%02d,%02d,%02d) - F%d\n" )
	.zero	2
.LC44:
	ASCII(.string	"SYNTAX_ReleaseImage p_image is null\n" )
	.zero	3
.LC49:
	ASCII(.string	"Image %d not found in vo queue.\n" )
	.zero	7
.LC51:
	ASCII(.string	"image[%d] null\n" )
.LC53:
	ASCII(.string	"Queue=(%02d,%02d,%02d) x F%d\n" )
	.zero	2
.LC62:
	ASCII(.string	"LENTH ERROR: VC1 S/MP BS is wrong!\n" )
	.zero	4
.LC65:
	ASCII(.string	"SYNTAX ERROR: VC1 S/MP BS is wrong!\n" )
	.zero	3
.LC77:
	ASCII(.string	"pSegMan error!\n" )
.LC81:
	ASCII(.string	"More than two packet!!!ERROR!!!\n" )
	.zero	7
.LC84:
	ASCII(.string	"*****************copy packets tobe one*****************\n" )
	.zero	7
.LC86:
	ASCII(.string	"*****************two packet*****************\n" )
	.zero	2
.LC90:
	ASCII(.string	"pSegMan->CurrSeg.IsLastSeg=%d\n" )
	.zero	1
.LC92:
	ASCII(.string	"pSegMan->CurrSeg.PhyAddr=%#x\n" )
	.zero	2
.LC94:
	ASCII(.string	"pSegMan->CurrSeg.LenInByte=%#x\n" )
.LC96:
	ASCII(.string	"ERROR: Wrong PreParseInfo about Vc1 IsAdvProfile!\n" )
	.zero	5
.LC98:
	ASCII(.string	"ERROR: Wrong PreParseInfo about Vc1 CodecVersion!\n" )
	.zero	5
.LC105:
	ASCII(.string	"Func: %s, Line: %d\n" )
	.zero	4
.LC109:
	ASCII(.string	"ERROR: VFMW_VP8 one packet stream, but IsLastSeg == 0\n" )
	.zero	1
.LC111:
	ASCII(.string	"ERROR: VFMW_VP6 one packet stream, but IsLastSeg == 0\n" )
	.zero	1
.LC113:
	ASCII(.string	"ERROR: VFMW_VP9 one packet stream, but IsLastSeg == 0\n" )
	.zero	1
.LC115:
	ASCII(.string	"VidStd=%d Error!\n" )
	.zero	6
.LC127:
	ASCII(.string	"pu8[0] = %x,pu8[1] = %x, pu8[2] = %x\n" )
	.zero	2
.LC147:
	ASCII(.string	"%s pstVoQue NULL\n" )
	.zero	6
.LC150:
	ASCII(.string	"WARNNING: aspect ration (%d) is not expected!\n" )
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	last_rec_pos_time.12883, %object
	.size	last_rec_pos_time.12883, 128
last_rec_pos_time.12883:
	.zero	128
	.type	pstVdecUsdPool, %object
	.size	pstVdecUsdPool, 256
pstVdecUsdPool:
	.zero	256
	.type	g_DnrEnable, %object
	.size	g_DnrEnable, 4
g_DnrEnable:
	.zero	4
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
