#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"vc1.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.type	VC1_Vfmw_GenerateIntensityMap, %function
VC1_Vfmw_GenerateIntensityMap:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w2
	mov	w21, w1
	uxtb	w22, w3
	bl	_mcount
	cmp	w20, 32
	sub	w0, w20, #64
	csel	w20, w0, w20, ge
	cbnz	w21, .L3
	lsl	w2, w20, 25
	mov	w4, -64
	sub	w2, w2, w20
	lsl	w2, w2, 7
	add	w2, w2, 12288
	add	w2, w2, 4032
.L4:
	cbnz	w22, .L5
	mov	x0, x19
	add	w2, w2, 32
	add	x5, x19, 256
	mov	w3, 255
	.p2align 2
.L6:
	asr	w1, w2, 6
	add	w2, w2, w4
	cmp	w1, wzr
	csel	w1, w1, wzr, ge
	cmp	w1, 255
	csel	w1, w1, w3, le
	strb	w1, [x0], 1
	cmp	x5, x0
	bne	.L6
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L5:
	lsl	w2, w4, 25
	mov	x0, x19
	sub	w2, w2, w4
	add	x5, x19, 256
	lsl	w2, w2, 7
	mov	w3, 255
	add	w2, w2, 8192
	add	w2, w2, 32
	.p2align 2
.L7:
	asr	w1, w2, 6
	add	w2, w2, w4
	cmp	w1, wzr
	csel	w1, w1, wzr, ge
	cmp	w1, 255
	csel	w1, w1, w3, le
	strb	w1, [x0], 1
	cmp	x5, x0
	bne	.L7
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3:
	add	w4, w21, 32
	lsl	w2, w20, 6
	b	.L4
	.size	VC1_Vfmw_GenerateIntensityMap, .-VC1_Vfmw_GenerateIntensityMap
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	VC1_Vfmw_UpdataLastPicRNDCTRL.part.5, %function
VC1_Vfmw_UpdataLastPicRNDCTRL.part.5:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 8192
	ldrb	w0, [x1, 2459]
	and	w2, w0, -5
	cbz	w2, .L15
	cmp	w0, 1
	ldrsb	w0, [x19, 10]
	uxtb	w2, w0
	beq	.L16
	strb	w0, [x19, 10]
	strb	w2, [x1, 2478]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L15:
	mov	w2, 1
	mov	w0, w2
	strb	w0, [x19, 10]
	strb	w2, [x1, 2478]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L16:
	cmp	w0, wzr
	cset	w0, eq
	mov	w2, w0
	sxtb	w0, w0
	strb	w0, [x19, 10]
	strb	w2, [x1, 2478]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_Vfmw_UpdataLastPicRNDCTRL.part.5, .-VC1_Vfmw_UpdataLastPicRNDCTRL.part.5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	emp_print
	.type	emp_print, %function
emp_print:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	mov	x0, x30
	stp	x2, x3, [x29, 16]
	stp	x4, x5, [x29, 32]
	stp	x6, x7, [x29, 48]
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 64
	ret
	.size	emp_print, .-emp_print
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AbandonBitsLenthNoUse
	.type	AbandonBitsLenthNoUse, %function
AbandonBitsLenthNoUse:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19]
	mov	w0, 0
	cbz	w1, .L27
	b	.L31
	.p2align 3
.L25:
	mov	w0, w2
.L27:
	ldrb	w1, [x19, -1]!
	add	w2, w0, 8
	cbz	w1, .L25
	add	w0, w0, 9
.L23:
	tbz	x1, 0, .L28
	b	.L21
	.p2align 3
.L26:
	mov	w2, w0
.L28:
	lsr	w1, w1, 1
	add	w0, w2, 1
	tbz	x1, 0, .L26
	add	w0, w2, 2
.L21:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L31:
	mov	w0, 1
	mov	w2, 0
	b	.L23
	.size	AbandonBitsLenthNoUse, .-AbandonBitsLenthNoUse
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_Init
	.type	VC1DEC_Init, %function
VC1DEC_Init:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	add	x19, x20, 53248
	bl	_mcount
	ldr	x3, .LC12
	mov	x2, 54280
	mov	w1, 0
	mov	x0, x20
	ldr	w22, [x19, 1016]
	ldr	x3, [x3, 96]
	blr	x3
	str	w22, [x19, 1016]
	add	x0, x19, 416
	bl	ResetVoQueue
	add	x4, x20, 12288
	ldr	w1, [x21, 32]
	str	x21, [x20]
	mov	w5, 1
	add	w1, w1, 255
	mov	x0, x20
	strb	w5, [x4, 2513]
	and	w1, w1, -256
	add	w3, w1, 4096
	add	w2, w1, 8192
	ldr	w6, [x21, 8]
	str	w6, [x19, 364]
	add	w6, w1, 2048
	str	w1, [x19, 336]
	add	w1, w1, 12288
	str	w3, [x19, 344]
	add	w3, w3, 2048
	str	w2, [x19, 352]
	add	w2, w2, 2048
	str	w6, [x19, 340]
	str	w3, [x19, 348]
	str	w2, [x19, 356]
	str	w1, [x19, 360]
	strb	w5, [x4, 2514]
	str	wzr, [x19, 296]
	str	wzr, [x19, 300]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 1024]
	beq	.L35
	ldr	x1, .LC16
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 1
.L34:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L35:
	ldr	x1, .LC14
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L34
	.size	VC1DEC_Init, .-VC1DEC_Init
	.align	3
.LC12:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC14:
	.xword	.LC13
	.align	3
.LC16:
	.xword	.LC15
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Vc1SMPSeqHdr
	.type	Vc1SMPSeqHdr, %function
Vc1SMPSeqHdr:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x2
	mov	w21, w1
	bl	_mcount
	lsl	w2, w21, 3
	mov	x1, x20
	add	x0, x29, 56
	bl	BsInit
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w20, w20, w0, lsl 8
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w20, w20, w0, lsl 16
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w0, w20, w0, lsl 24
	mov	w1, 8
	str	w0, [x19, 8]
	add	x0, x29, 56
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w20, w20, w0, lsl 8
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w20, w20, w0, lsl 16
	mov	w1, 8
	add	x0, x29, 56
	bl	BsGet
	add	w0, w20, w0, lsl 24
	ldr	w1, [x19, 8]
	str	w0, [x19, 12]
	cmp	w1, 8192
	bgt	.L40
	cmp	w0, 8192
	bgt	.L41
	cmp	w1, 31
	ble	.L40
	cmp	w0, 31
	ble	.L41
	mov	w1, 2
	add	x0, x29, 56
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 16]
	bhi	.L43
	mov	w1, 2
	add	x0, x29, 56
	bl	BsGet
	cbnz	w0, .L43
	mov	w1, 3
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 17]
	mov	w1, 5
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 18]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 19]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	cbnz	w0, .L43
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 20]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 21]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 22]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 23]
	mov	w1, 2
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 25]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	mov	w20, w0
	cbnz	w0, .L43
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 26]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 27]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 28]
	ldrb	w1, [x19, 16]
	cbnz	w1, .L44
	strb	wzr, [x19, 28]
.L44:
	mov	w1, 3
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 29]
	mov	w1, 2
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 30]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	strb	w0, [x19, 31]
	mov	w1, 1
	add	x0, x29, 56
	bl	BsGet
	mov	w1, 32
	add	x0, x29, 56
	bl	BsGet
	cbnz	w0, .L49
	mov	w0, w20
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L49:
	ldr	x1, .LC27
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L43:
	ldr	x3, .LC25
.L48:
	ldr	x2, .LC19
	mov	w0, 0
	ldr	x1, .LC21
	mov	w20, -1
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L41:
	ldr	x3, .LC23
	b	.L48
	.p2align 3
.L40:
	ldr	x3, .LC18
	b	.L48
	.size	Vc1SMPSeqHdr, .-Vc1SMPSeqHdr
	.align	3
.LC18:
	.xword	.LC17
	.align	3
.LC19:
	.xword	.LANCHOR0
	.align	3
.LC21:
	.xword	.LC20
	.align	3
.LC23:
	.xword	.LC22
	.align	3
.LC25:
	.xword	.LC24
	.align	3
.LC27:
	.xword	.LC26
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_SetImgFormat
	.type	VC1_SetImgFormat, %function
VC1_SetImgFormat:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 12288
	bl	_mcount
	add	x22, x20, 2504
	add	x1, x22, 20480
	add	x0, x21, 53248
	ldr	w1, [x1, 3860]
	ldr	w0, [x0, 1024]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L50
	mov	w23, 1
	str	w23, [x0, 412]
	ldrsb	w0, [x20, 2507]
	cmp	w0, 3
	beq	.L59
	ldr	x3, .LC28
	mov	x2, 4
	strb	wzr, [x19, 400]
	mov	w1, 0
	add	x0, x19, 124
	ldr	x3, [x3, 96]
	blr	x3
	ldrb	w0, [x19, 125]
	orr	w0, w0, 12
	bfi	w0, w23, 4, 2
	strb	w0, [x19, 125]
.L54:
	ldrb	w2, [x19, 126]
	add	x20, x20, 2504
	add	x20, x20, 20480
	mov	w1, 0
	and	w2, w2, -3
	strb	w2, [x19, 126]
	mov	x0, x19
	ldr	x3, [x21]
	ldr	w3, [x3, 592]
	cmp	w3, 1
	cset	w3, eq
	bfi	w2, w3, 2, 1
	strb	w2, [x19, 126]
	ldr	w2, [x20, 3804]
	str	w2, [x19, 132]
	ldr	w2, [x20, 3800]
	str	w2, [x19, 128]
	bl	SetAspectRatio
	ldr	w3, [x21, 14588]
	ldr	w1, [x19, 44]
	ldr	w2, [x19, 164]
	ldr	x4, [x19, 544]
	add	w0, w3, w1
	add	w5, w2, w1
	str	w1, [x19, 60]
	add	w2, w2, w0
	add	x3, x4, x3, uxtw
	stp	w1, w0, [x19, 28]
	stp	w5, w2, [x19, 36]
	str	x3, [x19, 552]
	str	w0, [x19, 48]
	str	x4, [x19, 560]
	bl	MEM_Phy2Vir
	str	x0, [x19, 568]
	ldr	w1, [x19, 32]
	mov	w2, 1
	str	w1, [x19, 64]
	mov	w1, 8
	ldr	w0, [x19, 128]
	ldr	w3, [x20, 3804]
	str	w3, [x19, 140]
	add	w0, w0, 511
	and	w0, w0, -512
	ldr	w3, [x20, 3800]
	lsr	w0, w0, 5
	strb	w2, [x19, 407]
	strb	w2, [x19, 405]
	str	w3, [x19, 136]
	str	w0, [x19, 168]
	str	w1, [x19, 416]
	str	w1, [x19, 420]
	str	w1, [x19, 424]
.L50:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L59:
	mov	w0, 4
	strb	w0, [x19, 400]
	ldrb	w1, [x19, 125]
	mov	w5, 0
	ldrb	w3, [x21, 24]
	ubfx	x2, x1, 2, 2
	mov	x0, x1
	add	w1, w3, w23
	orr	w1, w1, w2
	and	w2, w1, 3
	cmp	w1, 3
	csel	w1, w2, w5, ls
	bfi	w0, w1, 2, 2
	bfi	w0, w23, 0, 2
	bfi	w0, w23, 4, 2
	strb	w0, [x19, 125]
	b	.L54
	.size	VC1_SetImgFormat, .-VC1_SetImgFormat
	.align	3
.LC28:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_Destroy
	.type	VC1DEC_Destroy, %function
VC1DEC_Destroy:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VC1DEC_Destroy, .-VC1DEC_Destroy
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_RecycleImage
	.type	VC1DEC_RecycleImage, %function
VC1DEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L63
	add	x19, x19, 53248
	mov	w1, w20
	mov	w2, 0
	ldr	w0, [x19, 1024]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 1024]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L64
	ldr	w0, [x19, 1024]
	ldr	x1, [x20, 600]
	bl	FreeUsdByDec
	str	xzr, [x20, 600]
	ldr	x1, [x20, 608]
	ldr	w0, [x19, 1024]
	bl	FreeUsdByDec
	str	xzr, [x20, 608]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L63:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L64:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1DEC_RecycleImage, .-VC1DEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_GetRemainImg
	.type	VC1DEC_GetRemainImg, %function
VC1DEC_GetRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 12288
	add	x19, x19, 2504
	bl	_mcount
	ldr	x0, [x19, 24240]
	cbz	x0, .L72
	ldr	x0, [x20]
	add	x21, x20, 53248
	ldr	w0, [x0, 12]
	cmp	w0, 1
	beq	.L67
	add	x23, x19, 20480
	add	x21, x20, 53248
	ldr	w1, [x23, 3856]
	ldr	w0, [x21, 1024]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L67
	ldr	w0, [x21, 1024]
	ldr	w1, [x23, 3856]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L81
.L67:
	add	x19, x21, 416
.L71:
	mov	x0, x19
	bl	GetVoLastImageID
.L78:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L81:
	mov	x0, x20
	bl	VC1_SetImgFormat
	str	xzr, [x22, 600]
	mov	w2, 1
	str	xzr, [x22, 608]
	str	w2, [x22, 212]
	ldr	w1, [x22, 180]
	ldr	w0, [x21, 1024]
	bl	FSP_SetDisplay
	ldr	x0, [x19, 24240]
	ldrb	w1, [x0]
	cmp	w1, 1
	beq	.L82
.L68:
	add	x19, x21, 416
	ldr	w0, [x21, 1024]
	mov	x4, x22
	mov	x3, x19
	mov	x2, x20
	mov	w1, 1
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L69
	ldr	w1, [x22, 180]
	mov	x0, x20
	bl	VC1DEC_RecycleImage
	ldr	w0, [x21, 1024]
	ldr	x1, [x22, 600]
	bl	FreeUsdByDec
	str	xzr, [x22, 600]
	ldr	x1, [x22, 608]
	ldr	w0, [x21, 1024]
	bl	FreeUsdByDec
	str	xzr, [x22, 608]
	b	.L71
	.p2align 3
.L69:
	ldr	w0, [x22, 184]
	cmp	w0, 100
	bhi	.L67
	ldr	w0, [x22, 128]
	cmp	w0, 31
	bls	.L67
	ldr	w1, [x22, 132]
	mov	w0, 0
	cmp	w1, 31
	bhi	.L78
	b	.L71
	.p2align 3
.L82:
	strb	w1, [x0, 1]
	mov	w0, 3
	ldr	x1, [x19, 24240]
	strb	wzr, [x1]
	strb	w0, [x19, 1]
	b	.L68
.L72:
	mov	w0, -1
	b	.L78
	.size	VC1DEC_GetRemainImg, .-VC1DEC_GetRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_ArrangeVahbMem
	.type	VC1_ArrangeVahbMem, %function
VC1_ArrangeVahbMem:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	w21, w1
	mov	w23, w2
	bl	_mcount
	sub	w1, w21, #32
	mov	w0, 8160
	cmp	w1, w0
	bhi	.L84
	sub	w1, w23, #32
	cmp	w1, w0
	bhi	.L84
	add	x0, x22, 28672
	mov	w1, 0
	add	x0, x0, 128
	.p2align 2
.L87:
	str	w1, [x0, 1220]
	add	w1, w1, 1
	strb	wzr, [x0, 1]
	cmp	w1, 5
	strb	wzr, [x0]
	add	x0, x0, 1704
	bne	.L87
	ldr	x0, [x22]
	ldr	w19, [x0, 708]
	ldr	w2, [x0, 28]
	cmp	w2, 25
	cbnz	w19, .L88
	beq	.L114
.L108:
	mov	w19, w1
	mov	w24, 3
	mov	w20, 2
.L89:
	ldr	x0, .LC35
	mov	x2, 32
	mov	w1, 0
	ldr	x3, [x0, 96]
	add	x0, x29, 80
	blr	x3
	strb	wzr, [x29, 80]
	ldr	x0, [x22]
	stp	w21, w23, [x29, 104]
	strb	wzr, [x29, 81]
	ldr	w0, [x0, 28]
	stp	w21, w23, [x29, 88]
	cmp	w0, 24
	beq	.L99
	strb	w19, [x29, 85]
	sxtb	w19, w20
	strb	w24, [x29, 83]
.L104:
	add	x20, x22, 53248
	add	x1, x29, 80
	strb	w19, [x29, 86]
	strb	wzr, [x29, 82]
	ldr	w0, [x20, 1024]
	bl	FSP_ConfigInstance
	mov	w19, w0
	cbnz	w0, .L100
	ldr	x1, [x22]
	add	x3, x29, 76
	ldr	w0, [x20, 1024]
	ldr	w2, [x1, 24]
	ldr	w1, [x1, 20]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	beq	.L115
	cbnz	w0, .L102
	mov	w19, 1
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L84:
	ldr	x1, .LC32
	mov	w3, w23
	mov	w2, w21
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
.L110:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L88:
	bne	.L108
	ldr	w4, [x0, 668]
	ldr	w5, [x0, 672]
	cmp	w21, w4
	bhi	.L96
	cmp	w23, w5
	bhi	.L96
	ldr	w2, [x0, 696]
	mov	w20, 1
	ldr	w1, [x0, 692]
	add	w24, w1, 2
	cbnz	w2, .L116
	ldrsb	w19, [x0, 716]
	b	.L89
	.p2align 3
.L100:
	ldr	x1, .LC39
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L114:
	ldr	w4, [x0, 668]
	cmp	w21, w4
	bhi	.L117
	ldr	w1, [x0, 672]
	cmp	w23, w1
	mov	w5, w1
	bhi	.L91
	add	x2, x22, 12288
	mov	w19, 1
	ldrb	w2, [x2, 2504]
	tbnz	x2, 3, .L110
	ldr	w3, [x0, 696]
	mov	w20, w19
	ldr	w2, [x0, 692]
	add	w24, w2, 2
	cbz	w3, .L94
	add	w2, w2, w19
	mov	w19, 17
	cmp	w2, w19
	csel	w20, w2, w19, ls
.L94:
	ldrsb	w19, [x0, 716]
	mov	w23, w1
	mov	w21, w4
	b	.L89
	.p2align 3
.L99:
	mov	w0, 1
	strb	w19, [x29, 85]
	strb	w0, [x29, 83]
	mov	w19, 1
	b	.L104
	.p2align 3
.L96:
	ldr	x1, .LC34
	mov	w3, w23
	mov	w2, w21
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
	b	.L110
	.p2align 3
.L115:
	add	x0, x20, 416
	bl	ResetVoQueue
.L102:
	ldr	x1, .LC37
	mov	w0, 0
	bl	dprint_vfmw
	b	.L110
	.p2align 3
.L116:
	mov	w19, 17
	add	w1, w1, w20
	cmp	w1, w19
	csel	w20, w1, w19, ls
	ldrsb	w19, [x0, 716]
	b	.L89
.L117:
	ldr	w5, [x0, 672]
.L91:
	ldr	x1, .LC34
	mov	w3, w23
	mov	w2, w21
	mov	w0, 0
	bl	dprint_vfmw
	b	.L110
	.size	VC1_ArrangeVahbMem, .-VC1_ArrangeVahbMem
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC34:
	.xword	.LC33
	.align	3
.LC35:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC37:
	.xword	.LC36
	.align	3
.LC39:
	.xword	.LC38
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_WritePicMsg
	.type	VC1_WritePicMsg, %function
VC1_WritePicMsg:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 12288
	mov	x19, x1
	add	x21, x20, 2504
	bl	_mcount
	add	x22, x22, 53248
	add	x1, x21, 20480
	ldr	w0, [x22, 1024]
	ldr	w1, [x1, 3860]
	bl	FSP_GetLogicFs
	cbz	x0, .L143
	ldrsb	w1, [x21, 3104]
	cbz	w1, .L121
	ldr	w2, [x21, 10804]
	add	x1, x21, 8192
	strb	w2, [x19, 5]
	mov	w2, 3
	ldrb	w3, [x1, 2224]
	strb	w3, [x19, 4]
	ldrb	w1, [x1, 2569]
	cmp	w1, 4
	csel	w1, w1, w2, ne
	strb	w1, [x19, 3]
	ldr	w1, [x21, 10804]
	add	x21, x21, 36864
	cmp	w1, w2
	ldr	w1, [x21, 1908]
	beq	.L144
	sub	w1, w1, #1
	strh	w1, [x19, 84]
.L124:
	add	x2, x20, 2504
	add	x3, x2, 36864
	add	x1, x2, 8192
	add	x6, x2, 20480
	ldr	w3, [x3, 1904]
	sub	w3, w3, #1
	strh	w3, [x19, 82]
	ldrb	w3, [x1, 2609]
	strb	w3, [x19, 8]
	ldrb	w3, [x1, 2400]
	strb	w3, [x19, 6]
	ldrb	w3, [x1, 2600]
	strb	w3, [x19, 9]
	ldrb	w3, [x20, 2512]
	strb	w3, [x19, 7]
	ldrsw	x5, [x6, 3824]
	add	x4, x5, x5, lsl 3
	lsl	x3, x4, 3
	sub	x4, x3, x5
	lsl	x3, x4, 2
	sub	x3, x3, x4
	add	x3, x2, x3, lsl 3
	add	x3, x3, 12288
	ldrb	w3, [x3, 2747]
	strb	w3, [x19, 10]
	ldrsw	x5, [x6, 3840]
	add	x4, x5, x5, lsl 3
	lsl	x3, x4, 3
	sub	x4, x3, x5
	lsl	x3, x4, 2
	sub	x3, x3, x4
	add	x3, x2, x3, lsl 3
	add	x3, x3, 12288
	ldrb	w3, [x3, 2747]
	strb	w3, [x19, 11]
	ldrb	w3, [x1, 2598]
	strb	w3, [x19, 15]
	ldrb	w3, [x1, 2401]
	strb	w3, [x19, 13]
	ldrb	w3, [x1, 2405]
	strb	w3, [x19, 14]
	ldrb	w3, [x1, 2568]
	strb	w3, [x19, 12]
	ldrb	w3, [x1, 2736]
	strb	w3, [x19, 18]
	ldrb	w3, [x1, 2571]
	strb	w3, [x19, 19]
	ldrb	w3, [x1, 2578]
	strb	w3, [x19, 17]
	ldr	w2, [x20, 13380]
	strb	w2, [x19, 16]
	ldrb	w2, [x1, 2406]
	cbnz	w2, .L125
	ldrb	w1, [x1, 2578]
	cmp	w1, 8
	cset	w1, ls
	strb	w1, [x19, 20]
.L126:
	add	x2, x20, 2504
	add	x1, x2, 8192
	add	x4, x2, 36864
	ldrb	w3, [x1, 2730]
	strb	w3, [x19, 24]
	ldrb	w3, [x1, 2729]
	strb	w3, [x19, 23]
	ldrb	w3, [x1, 2403]
	strb	w3, [x19, 22]
	ldrb	w3, [x1, 2728]
	strb	w3, [x19, 25]
	ldr	w3, [x20, 13436]
	strb	w3, [x19, 26]
	ldrb	w3, [x1, 2731]
	strb	w3, [x19, 21]
	ldrb	w3, [x1, 2582]
	strb	w3, [x19, 27]
	ldrb	w3, [x1, 2583]
	strb	w3, [x19, 28]
	ldrb	w3, [x1, 2601]
	strb	w3, [x19, 34]
	ldrb	w3, [x1, 2593]
	strb	w3, [x19, 33]
	ldr	x5, [x20, 26744]
	ldrb	w3, [x1, 2609]
	add	x3, x5, x3
	ldrb	w3, [x3, 1029]
	strb	w3, [x19, 30]
	ldrb	w3, [x1, 2609]
	ldr	x5, [x20, 26736]
	add	x3, x5, x3
	ldrb	w3, [x3, 1029]
	strb	w3, [x19, 29]
	ldrb	w3, [x1, 2581]
	strb	w3, [x19, 31]
	ldrb	w3, [x1, 2599]
	strb	w3, [x19, 32]
	ldrb	w3, [x1, 2592]
	strb	w3, [x19, 35]
	ldrb	w3, [x1, 2404]
	strb	w3, [x19, 36]
	ldrb	w3, [x1, 2588]
	strb	w3, [x19, 37]
	ldrb	w3, [x1, 2590]
	strb	w3, [x19, 38]
	ldrb	w3, [x1, 2591]
	strb	w3, [x19, 39]
	ldrb	w3, [x1, 2589]
	strb	w3, [x19, 40]
	ldrb	w3, [x1, 2605]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 46]
	ldrb	w3, [x1, 2603]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 42]
	ldrb	w3, [x1, 2607]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 44]
	ldrb	w3, [x1, 2608]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 41]
	ldrb	w3, [x1, 2602]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 43]
	ldrb	w3, [x1, 2606]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 47]
	ldrb	w3, [x1, 2604]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 45]
	ldrb	w3, [x1, 2570]
	strb	w3, [x19, 50]
	ldrb	w3, [x1, 2587]
	strb	w3, [x19, 49]
	ldrb	w3, [x1, 2586]
	strb	w3, [x19, 48]
	ldrb	w3, [x1, 2597]
	strb	w3, [x19, 53]
	ldrb	w3, [x1, 2594]
	strb	w3, [x19, 54]
	ldrb	w3, [x1, 2595]
	strb	w3, [x19, 51]
	ldrb	w3, [x1, 2596]
	strb	w3, [x19, 52]
	ldr	w3, [x20, 13412]
	str	w3, [x19, 14424]
	ldr	w3, [x4, 1880]
	str	w3, [x19, 14428]
	ldr	w3, [x4, 1884]
	str	w3, [x19, 14432]
	ldrb	w3, [x1, 2409]
	strb	w3, [x19, 55]
	ldrb	w3, [x1, 2410]
	strb	w3, [x19, 56]
	ldrb	w3, [x1, 2411]
	strb	w3, [x19, 57]
	ldrb	w3, [x1, 2412]
	strb	w3, [x19, 58]
	ldr	w2, [x20, 13308]
	cmp	w2, 3
	beq	.L145
	ldrb	w2, [x1, 2409]
	strb	w2, [x0, 409]
	ldrb	w2, [x1, 2410]
	strb	w2, [x0, 410]
	ldrb	w2, [x1, 2411]
	strb	w2, [x0, 411]
	ldrb	w1, [x1, 2412]
	strb	w1, [x0, 412]
.L131:
	add	x1, x20, 2504
	add	x2, x1, 8192
	ldrb	w2, [x2, 2224]
	strb	w2, [x0, 414]
	ldrb	w0, [x20, 2515]
	strb	w0, [x19, 63]
	b	.L132
	.p2align 3
.L121:
	add	x1, x21, 8192
	strb	wzr, [x19, 5]
	add	x3, x21, 36864
	mov	w4, 3
	ldrb	w2, [x1, 2208]
	strb	w2, [x19, 4]
	ldrb	w2, [x1, 2459]
	cmp	w2, 4
	csel	w2, w2, w4, ne
	strb	w2, [x19, 3]
	ldr	w2, [x3, 1908]
	sub	w2, w2, #1
	strh	w2, [x19, 84]
	ldr	w2, [x3, 1904]
	strb	wzr, [x19, 8]
	sub	w2, w2, #1
	strh	w2, [x19, 82]
	ldrb	w2, [x1, 2211]
	strb	w2, [x19, 6]
	strb	wzr, [x19, 9]
	ldrb	w2, [x21, 8]
	strb	w2, [x19, 7]
	strb	wzr, [x19, 10]
	strb	wzr, [x19, 11]
	ldrb	w2, [x1, 2214]
	strb	w2, [x19, 13]
	ldrb	w2, [x1, 2218]
	strb	w2, [x19, 14]
	ldrb	w2, [x1, 2478]
	strb	w2, [x19, 12]
	ldrb	w2, [x1, 2488]
	strb	w2, [x19, 18]
	ldrb	w2, [x1, 2463]
	strb	w2, [x19, 19]
	ldrb	w2, [x1, 2462]
	strb	w2, [x19, 17]
	ldr	w2, [x21, 10752]
	strb	w2, [x19, 16]
	ldrb	w2, [x1, 2222]
	cbnz	w2, .L134
	ldrb	w1, [x1, 2462]
	cmp	w1, 8
	cset	w1, ls
	strb	w1, [x19, 20]
.L135:
	add	x2, x20, 2504
	add	x1, x2, 8192
	ldrb	w3, [x1, 2482]
	strb	w3, [x19, 24]
	ldrb	w3, [x1, 2481]
	strb	w3, [x19, 23]
	ldrb	w3, [x1, 2216]
	strb	w3, [x19, 22]
	ldrb	w3, [x1, 2480]
	strb	w3, [x19, 25]
	ldr	w3, [x20, 13188]
	strb	w3, [x19, 26]
	ldrb	w3, [x1, 2483]
	strb	w3, [x19, 21]
	ldrb	w3, [x1, 2467]
	strb	w3, [x19, 27]
	ldrb	w3, [x1, 2468]
	strb	w3, [x19, 28]
	ldr	x3, [x20, 26744]
	ldrb	w3, [x3, 1029]
	strb	w3, [x19, 30]
	ldr	x3, [x20, 26736]
	ldrb	w3, [x3, 1029]
	strb	w3, [x19, 29]
	ldrb	w3, [x1, 2465]
	strb	w3, [x19, 31]
	ldrb	w3, [x1, 2599]
	strb	w3, [x19, 32]
	ldrb	w3, [x1, 2477]
	strb	w3, [x19, 35]
	ldrb	w3, [x1, 2217]
	strb	w3, [x19, 36]
	ldrb	w3, [x1, 2473]
	strb	w3, [x19, 37]
	ldrb	w3, [x1, 2475]
	strb	w3, [x19, 38]
	ldrb	w3, [x1, 2476]
	strb	w3, [x19, 39]
	ldrb	w3, [x1, 2474]
	strb	w3, [x19, 40]
	ldr	w3, [x20, 13248]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 42]
	ldr	w3, [x20, 13244]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 43]
	ldr	w3, [x20, 13252]
	cmp	w3, wzr
	cset	w3, eq
	strb	w3, [x19, 45]
	ldrb	w3, [x1, 2460]
	strb	w3, [x19, 50]
	ldrb	w3, [x1, 2472]
	strb	w3, [x19, 49]
	ldrb	w3, [x1, 2471]
	strb	w3, [x19, 48]
	ldr	w3, [x20, 13260]
	str	w3, [x19, 14424]
	ldrb	w3, [x1, 2220]
	cmp	w3, 1
	beq	.L146
	mov	w5, 0
	mov	w2, 0
	mov	w4, 0
	mov	w3, 0
.L138:
	add	x1, x20, 2504
	strb	w3, [x19, 59]
	strb	w4, [x19, 60]
	add	x1, x1, 8192
	strb	w2, [x19, 61]
	str	w5, [x0, 436]
	ldrb	w1, [x1, 2208]
	strb	w1, [x0, 414]
.L132:
	add	x2, x20, 2504
	add	x20, x20, 2517
	add	x0, x2, 20480
	add	x1, x2, 36864
	ldr	x5, .LC42
	ldrh	w4, [x19, 82]
	ldr	w3, [x0, 3868]
	strh	w3, [x19, 76]
	add	w4, w4, 1
	ldr	w3, [x0, 3800]
	strh	w3, [x19, 78]
	ldr	w3, [x0, 3804]
	strh	w3, [x19, 80]
	ldrb	w3, [x2, 11]
	strb	w3, [x19, 63]
	ldrb	w2, [x2, 12]
	strb	w2, [x19, 62]
	ldr	w2, [x0, 3784]
	add	w3, w2, 254
	adds	w2, w2, 127
	csel	w2, w3, w2, mi
	asr	w2, w2, 7
	lsl	w2, w2, 4
	str	w2, [x19, 14456]
	ldr	w0, [x1, 1928]
	str	w0, [x19, 14460]
	ldr	w0, [x1, 1932]
	str	w0, [x19, 14464]
	ldr	w0, [x1, 1936]
	str	w0, [x19, 14468]
	ldr	w0, [x1, 1940]
	str	w0, [x19, 14472]
	ldr	w0, [x1, 1944]
	str	w0, [x19, 14476]
	ldr	w0, [x1, 1948]
	str	w0, [x19, 14480]
	ldr	w0, [x1, 1952]
	str	w0, [x19, 14484]
	str	x20, [x19, 64]
	ldrsw	x0, [x22, 1024]
	ldr	x0, [x5, x0, lsl 3]
	str	w4, [x0, 1492]
	ldrsw	x1, [x22, 1024]
	ldrh	w0, [x19, 84]
	ldr	x1, [x5, x1, lsl 3]
	add	w0, w0, 1
	str	w0, [x1, 1496]
.L118:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L134:
	cmp	w2, 1
	beq	.L147
	cmp	w2, 2
	beq	.L148
	mov	w1, 1
	strb	w1, [x19, 20]
	b	.L135
	.p2align 3
.L125:
	cmp	w2, 1
	beq	.L149
	cmp	w2, 2
	beq	.L150
	mov	w1, 1
	strb	w1, [x19, 20]
	b	.L126
	.p2align 3
.L149:
	ldrb	w1, [x1, 2579]
	cmp	w1, wzr
	cset	w1, ne
	strb	w1, [x19, 20]
	b	.L126
	.p2align 3
.L147:
	ldrb	w1, [x1, 2464]
	cmp	w1, wzr
	cset	w1, ne
	strb	w1, [x19, 20]
	b	.L135
	.p2align 3
.L145:
	ldrb	w2, [x1, 2609]
	cbnz	w2, .L130
	ldrb	w2, [x1, 2409]
	strb	w2, [x0, 409]
	ldrb	w2, [x1, 2410]
	strb	w2, [x0, 410]
	ldrb	w2, [x1, 2411]
	strb	w2, [x0, 411]
	ldrb	w2, [x1, 2412]
	strb	w2, [x0, 412]
	ldrb	w2, [x1, 2609]
.L130:
	cmp	w2, 1
	bne	.L131
	add	x1, x20, 2504
	add	x1, x1, 8192
	ldrb	w2, [x1, 2409]
	strb	w2, [x0, 404]
	ldrb	w2, [x1, 2410]
	strb	w2, [x0, 405]
	ldrb	w2, [x1, 2411]
	strb	w2, [x0, 406]
	ldrb	w1, [x1, 2412]
	strb	w1, [x0, 407]
	b	.L131
	.p2align 3
.L144:
	add	w1, w1, 1
	add	w1, w1, w1, lsr 31
	asr	w1, w1, 1
	sub	w1, w1, #1
	strh	w1, [x19, 84]
	b	.L124
	.p2align 3
.L146:
	add	x3, x2, 20480
	ldr	w5, [x3, 3824]
	ldr	w6, [x3, 3840]
	add	x3, x5, x5, lsl 3
	lsl	x3, x3, 3
	add	x4, x6, x6, lsl 3
	sub	x5, x3, x5
	lsl	x4, x4, 3
	lsl	x3, x5, 2
	sub	x6, x4, x6
	sub	x5, x3, x5
	lsl	x4, x6, 2
	ldrb	w3, [x1, 2459]
	sub	x4, x4, x6
	add	x5, x2, x5, lsl 3
	sub	w3, w3, #2
	add	x2, x2, x4, lsl 3
	and	w3, w3, -3
	add	x5, x5, 12288
	add	x2, x2, 12288
	uxtb	w3, w3
	ldrb	w4, [x5, 1722]
	ldrb	w2, [x2, 1722]
	cbnz	w3, .L139
	mov	w5, w2
	mov	w3, w2
	b	.L138
	.p2align 3
.L139:
	ldrb	w3, [x1, 2458]
	mov	w5, w3
	b	.L138
	.p2align 3
.L148:
	strb	wzr, [x19, 20]
	b	.L135
	.p2align 3
.L150:
	strb	wzr, [x19, 20]
	b	.L126
	.p2align 3
.L143:
	ldr	x1, .LC41
	mov	w2, 1129
	mov	w0, 22
	bl	dprint_vfmw
	b	.L118
	.size	VC1_WritePicMsg, .-VC1_WritePicMsg
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC42:
	.xword	s_pstVfmwChan
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_WriteSliceMsg
	.type	VC1_WriteSliceMsg, %function
VC1_WriteSliceMsg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	add	x2, x19, 20480
	ldr	x4, .LC43
	add	x1, x2, 3872
	add	x0, x20, 88
	ldr	w3, [x2, 3868]
	strb	w3, [x20, 74]
	ldr	w3, [x2, 3868]
	ldr	x4, [x4, 104]
	lsl	x2, x3, 3
	sub	x2, x2, x3
	lsl	x2, x2, 3
	blr	x4
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_WriteSliceMsg, .-VC1_WriteSliceMsg
	.align	3
.LC43:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_CfgVDH
	.type	VC1_CfgVDH, %function
VC1_CfgVDH:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldrsb	w0, [x19, 3104]
	cbz	w0, .L153
	ldr	w0, [x19, 10804]
	cmp	w0, 3
	beq	.L158
.L153:
	add	x0, x19, 36864
	ldr	w0, [x0, 1912]
	sub	w0, w0, #1
	str	w0, [x20, 14504]
.L154:
	add	x4, x19, 20480
	ldr	w1, [x20, 14596]
	mov	w0, 16385
	movk	w0, 0x2001, lsl 16
	ubfiz	w1, w1, 30, 1
	ldr	w3, [x4, 3808]
	cmp	w3, wzr
	add	w2, w3, 63
	csel	w2, w2, w3, lt
	asr	w2, w2, 6
	add	w0, w0, w2, lsl 4
	orr	w0, w0, w1
	str	w0, [x20, 14508]
	ldrsw	x3, [x4, 3840]
	ldrsw	x1, [x4, 3824]
	ldr	x4, [x19, 24232]
	add	x2, x3, x3, lsl 3
	add	x0, x1, x1, lsl 3
	lsl	x2, x2, 3
	sub	x2, x2, x3
	lsl	x0, x0, 3
	sub	x0, x0, x1
	lsl	x1, x2, 2
	sub	x2, x1, x2
	lsl	x3, x0, 2
	sub	x0, x3, x0
	ldr	w3, [x4, 1152]
	add	x2, x19, x2, lsl 3
	add	x19, x19, x0, lsl 3
	and	w0, w3, 3
	ubfiz	w3, w0, 4, 4
	ldr	w0, [x2, 15160]
	ldr	w2, [x19, 15160]
	and	w0, w0, 3
	strb	wzr, [x20, 73]
	and	w2, w2, 3
	orr	w0, w3, w0, lsl 2
	orr	w0, w0, w2
	strb	w0, [x20, 72]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L158:
	add	x0, x19, 36864
	ldr	w1, [x0, 1908]
	ldr	w2, [x0, 1904]
	add	w0, w1, 1
	add	w0, w0, w0, lsr 31
	asr	w0, w0, 1
	mul	w0, w0, w2
	sub	w0, w0, #1
	str	w0, [x20, 14504]
	b	.L154
	.size	VC1_CfgVDH, .-VC1_CfgVDH
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_GenerateDecPara
	.type	VC1_Vfmw_GenerateDecPara, %function
VC1_Vfmw_GenerateDecPara:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VC1_Vfmw_GenerateDecPara, .-VC1_Vfmw_GenerateDecPara
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_GetImageBuffer
	.type	VC1DEC_GetImageBuffer, %function
VC1DEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 12288
	add	x0, x0, 2504
	ldrsb	w1, [x0, 3]
	cmp	w1, 3
	beq	.L171
.L161:
	add	x19, x19, 53248
	ldr	w0, [x19, 1024]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L163
	ldr	w0, [x19, 1024]
	mov	w20, 0
	bl	FSP_IsNewFsAvalible
	cmn	w0, #1
	bne	.L162
	ldr	w0, [x19, 1024]
	add	x1, x19, 416
	bl	FSP_ClearNotInVoQueue
	b	.L162
	.p2align 3
.L171:
	ldrb	w0, [x0, 9]
	cmp	w0, 1
	beq	.L161
.L163:
	mov	w20, 1
.L162:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1DEC_GetImageBuffer, .-VC1DEC_GetImageBuffer
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_GetImageBuffer
	.type	VC1_Vfmw_GetImageBuffer, %function
VC1_Vfmw_GetImageBuffer:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x22, x21, 53248
	add	x19, x21, 12288
	bl	_mcount
	mov	w1, 1
	ldr	w0, [x22, 1024]
	bl	FSP_NewLogicFs
	mov	w1, w0
	add	x0, x19, 2504
	add	x20, x0, 20480
	str	w1, [x20, 3860]
	tbnz	w1, #31, .L192
	add	x20, x21, 28672
	add	x0, x0, 12288
	add	x0, x0, 1720
	ldrh	w2, [x20, 128]
	cbz	w2, .L182
	add	x21, x21, 36864
	add	x0, x20, 1832
	add	x4, x21, 456
.L179:
	ldrh	w3, [x0]
	mov	x2, x0
	add	x0, x0, 1704
	cmp	x0, x4
	cbz	w3, .L176
	bne	.L179
	ldr	w0, [x22, 1024]
	mov	w2, 1
	add	x21, x21, 457
	bl	FSP_ClearLogicFs
	ldr	x1, .LC49
	mov	w0, 1
	bl	dprint_vfmw
	add	x0, x20, 129
.L181:
	strb	wzr, [x0]
	strb	wzr, [x0, -1]
	add	x0, x0, 1704
	cmp	x0, x21
	bne	.L181
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L182:
	mov	x2, x0
.L176:
	str	x2, [x19, 26736]
	mov	w0, 1
	mov	w1, 0
	strb	w0, [x2, 1]
	.p2align 2
.L178:
	ldr	x4, [x19, 26736]
	sxtw	x0, w1
	uxtb	w2, w1
	add	w1, w1, 1
	add	x4, x4, x0
	cmp	w1, 256
	strb	w2, [x4, 3]
	ldr	x4, [x19, 26736]
	add	x4, x4, x0
	strb	w2, [x4, 259]
	ldr	x4, [x19, 26736]
	add	x4, x4, x0
	strb	w2, [x4, 515]
	ldr	x3, [x19, 26736]
	add	x0, x3, x0
	strb	w2, [x0, 771]
	bne	.L178
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L192:
	ldr	x1, .LC45
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x20, 3856]
	ldr	w0, [x22, 1024]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L174
	ldr	w0, [x22, 1024]
	ldr	x1, [x21, 600]
	bl	FreeUsdByDec
	ldr	w0, [x22, 1024]
	ldr	x1, [x21, 608]
	bl	FreeUsdByDec
	ldr	w0, [x22, 1024]
	ldr	x1, [x21, 616]
	bl	FreeUsdByDec
	ldr	w0, [x22, 1024]
	ldr	x1, [x21, 624]
	bl	FreeUsdByDec
	add	x0, x21, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	ldr	w1, [x20, 3856]
	ldr	w0, [x22, 1024]
	bl	FSP_ClearLogicFs
	ldr	w1, [x20, 3852]
	mov	w2, 1
	ldr	w0, [x22, 1024]
	bl	FSP_ClearLogicFs
	str	wzr, [x20, 3852]
	str	wzr, [x20, 3856]
	ldr	w0, [x22, 1024]
	bl	FSP_GetNullLogicFs
	str	w0, [x20, 3852]
	str	w0, [x20, 3856]
.L174:
	add	x0, x19, 2504
	add	x1, x22, 416
	add	x0, x0, 20480
	str	wzr, [x0, 3848]
	ldr	w0, [x22, 1024]
	bl	FSP_ClearNotInVoQueue
	ldr	x1, .LC47
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_Vfmw_GetImageBuffer, .-VC1_Vfmw_GetImageBuffer
	.align	3
.LC45:
	.xword	.LC44
	.align	3
.LC47:
	.xword	.LC46
	.align	3
.LC49:
	.xword	.LC48
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_MemMove
	.type	VC1_Vfmw_MemMove, %function
VC1_Vfmw_MemMove:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	ldr	x5, [x19, 24232]
	ldr	x1, [x19, 24240]
	ldr	x4, .LC50
	ldr	w3, [x0, 3788]
	ldr	w2, [x0, 3808]
	add	w3, w3, 1
	ldr	x4, [x4, 104]
	ldr	x1, [x1, 1584]
	add	w3, w3, w3, lsr 31
	ldr	x0, [x5, 1584]
	asr	w3, w3, 1
	lsl	w3, w3, 5
	mul	w2, w3, w2
	lsl	w3, w2, 2
	sub	w2, w3, w2
	asr	w2, w2, 1
	sxtw	x2, w2
	blr	x4
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_Vfmw_MemMove, .-VC1_Vfmw_MemMove
	.align	3
.LC50:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_BuildRefList
	.type	VC1_Vfmw_BuildRefList, %function
VC1_Vfmw_BuildRefList:
	sub	sp, sp, #512
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	mov	w25, w3
	mov	w19, w1
	mov	w24, w2
	bl	_mcount
	mov	x2, 256
	mov	w1, 0
	add	x0, x29, 96
	add	x22, x21, 20480
	bl	memset
	mov	x2, 256
	mov	w1, 0
	add	x0, x29, 352
	bl	memset
	ldr	x20, .LC51
	mov	x2, 16
	mov	w1, 0
	add	x0, x22, 3816
	ldr	x3, [x20, 96]
	blr	x3
	ldr	x3, [x20, 96]
	mov	x2, 16
	mov	w1, 0
	add	x0, x22, 3832
	blr	x3
	ldrsb	w0, [x21, 4]
	tst	w0, -3
	bne	.L195
	cmp	w19, 1
	beq	.L258
	cmp	w19, 2
	beq	.L259
.L204:
	str	wzr, [x22, 3820]
	str	wzr, [x22, 3836]
.L256:
	mov	w0, 1
.L241:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	add	sp, sp, 512
	ret
	.p2align 3
.L195:
	add	x26, x21, 8192
	ldrb	w0, [x26, 2572]
	cmp	w0, 1
	ldrb	w0, [x26, 2609]
	beq	.L260
	cbz	w0, .L261
.L215:
	ldr	x0, [x21, 24248]
	ldr	w27, [x0, 1220]
	mov	w23, w27
.L214:
	cmp	w19, 1
	beq	.L262
.L216:
	cmp	w19, 2
	bne	.L204
	mov	w0, 1
	strb	wzr, [x22, 3816]
	strb	w0, [x22, 3817]
	str	w19, [x22, 3820]
	str	w19, [x22, 3836]
	cbz	w24, .L230
	cbz	w25, .L231
	ldr	x0, [x21, 24248]
	ldr	x1, [x21, 24232]
	ldr	w7, [x0, 1220]
	str	w7, [x22, 3824]
	b	.L233
	.p2align 3
.L261:
	ldr	x0, [x21, 24240]
	cmp	w19, 1
	ldr	x1, [x21, 24248]
	ldr	w23, [x0, 1220]
	ldr	w27, [x1, 1220]
	bne	.L216
.L262:
	ldrb	w0, [x26, 2600]
	strb	w19, [x22, 3817]
	add	w0, w0, 1
	strb	wzr, [x22, 3816]
	str	w0, [x22, 3820]
	str	wzr, [x22, 3836]
	cbz	w24, .L217
	cbz	w25, .L218
	ldr	x0, [x21, 24248]
	ldr	x1, [x21, 24232]
	ldr	w19, [x0, 1220]
	str	w19, [x22, 3824]
	b	.L220
	.p2align 3
.L258:
	strb	wzr, [x22, 3816]
	str	w19, [x22, 3820]
	str	wzr, [x22, 3836]
	ldr	x0, [x21, 24248]
	ldr	w19, [x0, 1220]
	str	w19, [x22, 3824]
	ldrsb	w0, [x21, 3104]
	cbz	w0, .L197
	ldr	w1, [x21, 10804]
	add	x0, x21, 8192
	cmp	w1, 2
	ldrb	w20, [x0, 2584]
	ldrb	w22, [x0, 2585]
	ldrb	w0, [x0, 2582]
	beq	.L263
.L198:
	cmp	w0, 4
	beq	.L199
.L202:
	mov	w2, 1704
	add	x1, x21, 13
	smull	x2, w19, w2
	add	x2, x2, 12288
	add	x0, x2, 1723
	add	x2, x2, 1979
	add	x0, x21, x0
	add	x2, x21, x2
	.p2align 2
.L200:
	ldrb	w3, [x0]
	add	x0, x0, 1
	strb	w3, [x1]
	add	x1, x1, 1
	cmp	x0, x2
	ldrb	w3, [x0, 255]
	strb	w3, [x1, 255]
	ldrb	w3, [x0, 511]
	strb	w3, [x1, 511]
	ldrb	w3, [x0, 767]
	strb	w3, [x1, 767]
	bne	.L200
	b	.L256
	.p2align 3
.L260:
	cbz	w0, .L215
	ldr	x1, [x21, 24240]
	ldr	x0, [x21, 24248]
	ldr	w27, [x1, 1220]
	ldr	w23, [x0, 1220]
	b	.L214
.L259:
	strb	wzr, [x22, 3816]
	mov	w0, 1
	str	w0, [x22, 3820]
	str	w0, [x22, 3836]
	ldr	x0, [x21, 24248]
	ldr	w19, [x0, 1220]
	str	w19, [x22, 3824]
	strb	wzr, [x22, 3832]
	ldr	x0, [x21, 24240]
	ldr	w20, [x0, 1220]
	str	w20, [x22, 3840]
	ldrsb	w0, [x21, 3104]
	cbz	w0, .L205
	add	x0, x21, 8192
	ldrb	w22, [x0, 2584]
	ldrb	w23, [x0, 2585]
	ldrb	w0, [x0, 2582]
.L206:
	cmp	w0, 4
	beq	.L207
.L210:
	mov	w1, 1704
	mov	x3, 14011
	add	x0, x21, 13
	add	x4, x21, 269
	smaddl	x2, w19, w1, x3
	smaddl	x1, w20, w1, x3
	add	x2, x21, x2
	add	x1, x21, x1
	.p2align 2
.L208:
	add	x0, x0, 1
	ldrb	w3, [x2]
	add	x2, x2, 1
	add	x1, x1, 1
	cmp	x0, x4
	strb	w3, [x0, -1]
	ldrb	w3, [x2, 255]
	strb	w3, [x0, 255]
	ldrb	w3, [x2, 511]
	strb	w3, [x0, 511]
	ldrb	w3, [x2, 767]
	strb	w3, [x0, 767]
	ldrb	w3, [x1, -1]
	strb	w3, [x0, 1023]
	ldrb	w3, [x1, 255]
	strb	w3, [x0, 1279]
	ldrb	w3, [x1, 511]
	strb	w3, [x0, 1535]
	ldrb	w3, [x1, 767]
	strb	w3, [x0, 1791]
	bne	.L208
	b	.L256
.L197:
	add	x0, x21, 8192
	ldrb	w20, [x0, 2469]
	ldrb	w22, [x0, 2470]
	ldrb	w0, [x0, 2467]
	b	.L198
.L217:
	ldr	x0, [x21, 24248]
	ldr	w19, [x0, 1220]
	str	w19, [x22, 3824]
	ldr	x1, [x21, 24232]
.L220:
	ldr	w0, [x0, 1220]
	str	w0, [x22, 3828]
	ldr	w0, [x21, 10888]
	ldr	w20, [x1, 1220]
	cmp	w0, 1
	bls	.L264
.L221:
	tst	w0, -3
	bne	.L222
	ldrb	w1, [x26, 2582]
	cmp	w1, 4
	beq	.L265
.L222:
	mov	w3, 1704
	mov	x2, 14011
	add	x0, x21, 13
	add	x4, x21, 269
	smaddl	x1, w19, w3, x2
	smaddl	x2, w20, w3, x2
	add	x1, x21, x1
	add	x2, x21, x2
	.p2align 2
.L229:
	add	x0, x0, 1
	ldrb	w3, [x1]
	add	x1, x1, 1
	add	x2, x2, 1
	cmp	x0, x4
	strb	w3, [x0, -1]
	ldrb	w3, [x1, 255]
	strb	w3, [x0, 255]
	ldrb	w3, [x1, 511]
	strb	w3, [x0, 511]
	ldrb	w3, [x1, 767]
	strb	w3, [x0, 767]
	ldrb	w3, [x2, -1]
	strb	w3, [x0, 2047]
	ldrb	w3, [x2, 255]
	strb	w3, [x0, 2303]
	ldrb	w3, [x2, 511]
	strb	w3, [x0, 2559]
	ldrb	w3, [x2, 767]
	strb	w3, [x0, 2815]
	bne	.L229
	b	.L256
.L205:
	add	x0, x21, 8192
	ldrb	w22, [x0, 2469]
	ldrb	w23, [x0, 2470]
	ldrb	w0, [x0, 2467]
	b	.L206
.L230:
	ldr	x0, [x21, 24248]
	ldr	w7, [x0, 1220]
	str	w7, [x22, 3824]
	ldr	x1, [x21, 24232]
.L233:
	strb	wzr, [x22, 3832]
	mov	w0, 1
	strb	w0, [x22, 3833]
	ldr	x0, [x21, 24240]
	ldr	w6, [x0, 1220]
	str	w6, [x22, 3840]
	ldr	w0, [x0, 1220]
	str	w0, [x22, 3844]
	ldr	w0, [x21, 10888]
	ldr	w1, [x1, 1220]
	cmp	w0, 1
	bls	.L266
	ands	w0, w0, -3
	beq	.L267
.L235:
	mov	w8, 1704
	mov	x0, x21
	mov	x4, 0
	smull	x7, w7, w8
	smull	x6, w6, w8
	smull	x8, w1, w8
	.p2align 2
.L236:
	add	x3, x4, x7
	add	x0, x0, 1
	add	x3, x21, x3
	add	x2, x4, x6
	add	x3, x3, 12288
	add	x2, x21, x2
	add	x2, x2, 12288
	add	x1, x4, x8
	add	x1, x21, x1
	add	x4, x4, 1
	ldrb	w5, [x3, 1723]
	add	x1, x1, 12288
	strb	w5, [x0, 12]
	cmp	x4, 256
	ldrb	w5, [x3, 1979]
	strb	w5, [x0, 268]
	ldrb	w5, [x3, 2235]
	strb	w5, [x0, 524]
	ldrb	w3, [x3, 2491]
	strb	w3, [x0, 780]
	ldrb	w3, [x2, 1723]
	strb	w3, [x0, 1036]
	ldrb	w3, [x2, 1979]
	strb	w3, [x0, 1292]
	ldrb	w3, [x2, 2235]
	strb	w3, [x0, 1548]
	ldrb	w2, [x2, 2491]
	strb	w2, [x0, 1804]
	ldrb	w2, [x1, 1723]
	strb	w2, [x0, 2060]
	ldrb	w2, [x1, 1979]
	strb	w2, [x0, 2316]
	ldrb	w2, [x1, 2235]
	strb	w2, [x0, 2572]
	ldrb	w1, [x1, 2491]
	strb	w1, [x0, 2828]
	bne	.L236
	b	.L256
.L267:
	ldrb	w2, [x26, 2582]
	cmp	w2, 4
	bne	.L235
	b	.L241
.L218:
	ldr	x1, [x21, 24232]
	ldr	x0, [x21, 24248]
	ldr	w19, [x1, 1220]
	str	w19, [x22, 3824]
	b	.L220
.L231:
	ldr	x1, [x21, 24232]
	ldr	w7, [x1, 1220]
	str	w7, [x22, 3824]
	b	.L233
.L265:
	cbnz	w0, .L226
	ldr	w22, [x21, 10892]
	ldr	w24, [x21, 10896]
	uxtb	w22, w22
	uxtb	w24, w24
.L227:
	mov	w3, 0
	mov	w2, w24
	add	x0, x29, 96
	mov	w1, w22
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, w24
	mov	w1, w22
	add	x0, x29, 352
	mov	w3, 1
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, 1704
	sub	x0, x29, #3488
	smull	x2, w23, w2
	add	x2, x2, 12288
	add	x1, x2, 2235
	add	x2, x2, 2491
	add	x1, x21, x1
	add	x4, x21, x2
	.p2align 2
.L228:
	ldrb	w3, [x1]
	add	x1, x1, 1
	ldrb	w2, [x1, 255]
	cmp	x1, x4
	add	x3, x0, x3
	add	x2, x0, x2
	ldrb	w3, [x3, 3584]
	ldrb	w2, [x2, 3840]
	strb	w3, [x1, -1]
	strb	w2, [x1, 255]
	bne	.L228
	b	.L222
.L264:
	ldrb	w0, [x26, 2582]
	cmp	w0, 4
	bne	.L222
	ldrb	w22, [x26, 2584]
	mov	w3, 0
	ldrb	w24, [x26, 2585]
	add	x0, x29, 96
	mov	w1, w22
	mov	w2, w24
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w1, w22
	mov	w3, 1
	add	x0, x29, 352
	mov	w2, w24
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w0, 1704
	smull	x0, w27, w0
	add	x0, x0, 12288
	add	x1, x0, 1723
	add	x0, x0, 1979
	add	x3, x21, x0
	add	x1, x21, x1
	sub	x0, x29, #3488
	.p2align 2
.L223:
	ldrb	w2, [x1]
	add	x1, x1, 1
	add	x2, x0, x2
	ldrb	w2, [x2, 3584]
	strb	w2, [x1, -1]
	ldrb	w2, [x1, 255]
	add	x2, x0, x2
	ldrb	w2, [x2, 3840]
	strb	w2, [x1, 255]
	cmp	x1, x3
	bne	.L223
	ldr	w0, [x21, 10888]
	b	.L221
.L266:
	ldrb	w0, [x26, 2582]
	cmp	w0, 4
	bne	.L235
	mov	w0, 0
	b	.L241
.L263:
	ldr	w1, [x21, 10880]
	cmp	w1, 1
	bne	.L198
.L199:
	mov	w3, 0
	mov	w2, w22
	mov	w1, w20
	add	x0, x29, 96
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, w22
	mov	w1, w20
	add	x0, x29, 352
	mov	w3, 1
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w2, 1704
	sub	x0, x29, #3488
	smull	x2, w19, w2
	add	x2, x2, 12288
	add	x1, x2, 1723
	add	x2, x2, 1979
	add	x1, x21, x1
	add	x6, x21, x2
	.p2align 2
.L201:
	ldrb	w5, [x1]
	add	x1, x1, 1
	ldrb	w4, [x1, 255]
	ldrb	w3, [x1, 511]
	add	x5, x0, x5
	ldrb	w2, [x1, 767]
	add	x4, x0, x4
	add	x3, x0, x3
	cmp	x1, x6
	add	x2, x0, x2
	ldrb	w5, [x5, 3584]
	ldrb	w4, [x4, 3840]
	ldrb	w3, [x3, 3584]
	ldrb	w2, [x2, 3840]
	strb	w5, [x1, -1]
	strb	w4, [x1, 255]
	strb	w3, [x1, 511]
	strb	w2, [x1, 767]
	bne	.L201
	b	.L202
.L207:
	mov	w3, 0
	mov	w2, w23
	mov	w1, w22
	add	x0, x29, 96
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w3, 1
	mov	w2, w23
	mov	w1, w22
	add	x0, x29, 352
	bl	VC1_Vfmw_GenerateIntensityMap
	mov	w1, 1704
	mov	x2, 14011
	sub	x0, x29, #3488
	smull	x3, w19, w1
	smaddl	x2, w20, w1, x2
	add	x3, x3, 12288
	add	x1, x3, 1723
	add	x3, x3, 1979
	add	x1, x21, x1
	add	x2, x21, x2
	add	x7, x21, x3
	.p2align 2
.L209:
	ldrb	w6, [x1]
	add	x1, x1, 1
	ldrb	w5, [x1, 255]
	add	x2, x2, 1
	ldrb	w4, [x1, 511]
	add	x6, x0, x6
	ldrb	w3, [x1, 767]
	add	x5, x0, x5
	add	x4, x0, x4
	cmp	x1, x7
	add	x3, x0, x3
	ldrb	w6, [x6, 3584]
	ldrb	w5, [x5, 3840]
	ldrb	w4, [x4, 3584]
	ldrb	w3, [x3, 3840]
	strb	w6, [x1, -1]
	strb	w5, [x1, 255]
	strb	w4, [x1, 511]
	strb	w3, [x1, 767]
	ldrb	w6, [x2, -1]
	ldrb	w5, [x2, 255]
	ldrb	w4, [x2, 511]
	add	x6, x0, x6
	ldrb	w3, [x2, 767]
	add	x5, x0, x5
	add	x4, x0, x4
	add	x3, x0, x3
	ldrb	w6, [x6, 3584]
	ldrb	w5, [x5, 3840]
	ldrb	w4, [x4, 3584]
	ldrb	w3, [x3, 3840]
	strb	w6, [x2, -1]
	strb	w5, [x2, 255]
	strb	w4, [x2, 511]
	strb	w3, [x2, 767]
	bne	.L209
	b	.L210
.L226:
	ldrb	w22, [x26, 2584]
	ldrb	w24, [x26, 2585]
	b	.L227
	.size	VC1_Vfmw_BuildRefList, .-VC1_Vfmw_BuildRefList
	.align	3
.LC51:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_GetStreamInfo
	.type	VC1_Vfmw_GetStreamInfo, %function
VC1_Vfmw_GetStreamInfo:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 12288
	bl	_mcount
	add	x0, x19, 2504
	add	x1, x0, 20480
	ldrsb	w2, [x0, 3104]
	ldr	w22, [x1, 3784]
	cbz	w2, .L269
	ldr	w0, [x19, 13308]
	ldr	w20, [x1, 3788]
	cmp	w0, 3
	beq	.L354
.L351:
	ldrh	w0, [x19, 5862]
	ldrh	w1, [x19, 5860]
	add	w0, w0, 15
	add	w1, w1, 15
	asr	w0, w0, 4
	mul	w20, w20, w22
	asr	w1, w1, 4
.L321:
	lsl	w2, w1, 4
	mov	w4, 8160
	sub	w3, w2, #32
	cmp	w3, w4
	lsl	w3, w0, 4
	bhi	.L272
	sub	w5, w3, #32
	cmp	w5, w4
	bhi	.L272
	add	x4, x19, 2504
	add	x2, x4, 20480
	ldr	w3, [x2, 3796]
	cmp	w0, w3
	beq	.L355
.L275:
	add	x1, x19, 2504
	lsl	w0, w22, 4
	add	x2, x1, 20480
	add	w0, w0, 63
	and	w0, w0, -64
	mov	w3, 1
	ldr	w4, [x2, 3788]
	str	w22, [x2, 3792]
	str	w4, [x2, 3796]
	str	w0, [x2, 3808]
	ldrb	w0, [x19, 2512]
	cbz	w0, .L283
.L277:
	ldrsb	w1, [x19, 2507]
	cmp	w1, 3
	beq	.L356
.L280:
	ldrb	w1, [x19, 2504]
	eor	x1, x1, 8
	ubfx	x1, x1, 3, 1
	orr	w0, w3, w1
	cbnz	w0, .L283
.L287:
	mov	x0, x21
	bl	VC1_Vfmw_GetImageBuffer
	mov	w23, w0
	cbz	w0, .L357
	add	x1, x19, 2504
	add	x23, x21, 53248
	add	x1, x1, 20480
	ldr	w0, [x23, 1024]
	ldr	w1, [x1, 3860]
	bl	FSP_GetFsImagePtr
	mov	x2, x0
	cbz	x0, .L289
	ldr	x3, [x21]
	mov	x4, -1
	ldr	x1, .LC58
	mov	w0, 29
	ldr	x3, [x3, 56]
	str	x3, [x2, 640]
	ldr	x3, [x21]
	ldr	x3, [x3, 72]
	str	x3, [x2, 648]
	ldr	x3, [x21]
	ldr	x3, [x3, 88]
	str	x3, [x2, 656]
	ldr	x3, [x21]
	ldr	w3, [x3, 104]
	str	w3, [x2, 8]
	ldr	x3, [x21]
	ldr	w3, [x3, 108]
	str	w3, [x2, 12]
	ldr	x3, [x21]
	ldr	w3, [x3, 112]
	str	w3, [x2, 16]
	ldr	x3, [x21]
	ldr	w3, [x3, 128]
	str	w3, [x2, 20]
	ldr	x3, [x21]
	str	x4, [x3, 56]
	ldr	x3, [x2, 648]
	ldr	x2, [x2, 640]
	bl	dprint_vfmw
.L289:
	add	x0, x19, 2504
	ldrsb	w1, [x0, 3104]
	cbz	w1, .L290
	ldr	w1, [x19, 13308]
	cmp	w1, 3
	beq	.L358
.L290:
	ldr	x0, [x19, 26736]
	str	wzr, [x0, 1152]
.L291:
	ldr	x1, [x19, 26736]
	add	x0, x19, 2504
	strb	wzr, [x1, 2]
	ldrsb	w1, [x0, 3104]
	cbnz	w1, .L292
	add	x1, x0, 8192
	ldrb	w2, [x1, 2220]
	cmp	w2, 1
	beq	.L359
.L292:
	add	x24, x19, 2504
	ldrb	w0, [x24, 2]
	cmp	w0, 1
	ccmp	w0, 5, 4, hi
	bne	.L293
	add	x24, x24, 20480
	mov	w0, 2
	ldr	w1, [x24, 3848]
	ldr	w2, [x24, 3852]
	ldr	w3, [x24, 3856]
	cmp	w1, wzr
	csinc	w0, w0, wzr, ne
	str	w0, [x24, 3848]
	cmp	w2, w3
	beq	.L295
	ldr	x1, .LC61
	mov	w0, 13
	bl	dprint_vfmw
	ldr	w0, [x23, 1024]
	mov	w2, 0
	ldr	w1, [x24, 3852]
	bl	FSP_SetRef
	ldr	w3, [x24, 3856]
.L295:
	add	x24, x19, 2504
	mov	w2, 1
	add	x25, x24, 20480
	ldr	w1, [x25, 3860]
	str	w3, [x25, 3852]
	str	w1, [x25, 3856]
	ldr	w0, [x23, 1024]
	bl	FSP_SetRef
	ldr	w0, [x23, 1024]
	ldr	w1, [x25, 3852]
	bl	FSP_RemovePmv
	ldrb	w0, [x24, 2]
	cmp	w0, 1
	ccmp	w0, 5, 4, hi
	bne	.L297
	ldr	x0, [x24, 24248]
	mov	w1, 1
	strb	wzr, [x0]
	ldr	x0, [x24, 24232]
	strb	w1, [x0]
	ldr	x1, [x24, 24240]
	ldr	x0, [x24, 24232]
	str	x0, [x24, 24240]
	str	x1, [x24, 24248]
.L297:
	add	x25, x19, 2504
	ldr	w0, [x23, 1024]
	add	x26, x25, 20480
	ldr	w1, [x26, 3860]
	bl	FSP_GetLogicFs
	mov	x24, x0
	ldr	w1, [x26, 3852]
	ldr	w0, [x23, 1024]
	bl	FSP_GetLogicFs
	mov	x28, x0
	ldr	w1, [x26, 3856]
	ldr	w0, [x23, 1024]
	bl	FSP_GetLogicFs
	mov	x27, x0
	cmp	x24, xzr
	ccmp	x28, xzr, 4, ne
	ccmp	x0, xzr, 4, ne
	beq	.L360
	ldrsb	w0, [x25, 3104]
	cbnz	w0, .L361
.L303:
	str	wzr, [x24, 120]
.L304:
	ldrb	w1, [x19, 2506]
	add	x0, x19, 2504
	cmp	w1, 5
	beq	.L362
.L305:
	ldr	x0, [x24, 680]
	cbz	x0, .L306
	ldr	x1, [x24, 696]
	cbz	x1, .L306
	ldr	x1, [x24, 688]
	cbz	x1, .L306
	ldr	x1, [x27, 680]
	cbz	x1, .L308
	ldr	w0, [x1, 16]
.L309:
	str	w0, [x21, 14460]
	ldr	x0, [x28, 680]
	cbz	x0, .L363
.L352:
	ldr	w0, [x0, 16]
	str	w0, [x21, 14456]
	ldr	x0, [x24, 680]
	ldr	w0, [x0, 16]
	str	w0, [x21, 14580]
	ldr	w0, [x24, 704]
	str	w0, [x21, 14464]
	ldr	w0, [x27, 704]
	str	w0, [x21, 14468]
	ldr	x0, [x24, 688]
	ldr	w0, [x0, 16]
	str	w0, [x21, 14452]
	ldr	x0, [x24, 688]
	ldr	w0, [x0, 32]
	str	w0, [x21, 14532]
	ldr	x0, [x24, 688]
	ldr	w0, [x0, 76]
	str	w0, [x21, 14536]
	ldr	x0, [x24, 688]
	ldr	w0, [x0, 60]
	str	w0, [x21, 14540]
	ldr	x0, [x24, 688]
	ldr	w0, [x0, 64]
	str	w0, [x21, 14544]
	ldr	x0, [x24, 680]
	ldr	x24, [x19, 26736]
	ldr	w0, [x0, 16]
	bl	MEM_Phy2Vir
	str	x0, [x24, 1584]
	ldr	x24, [x19, 26752]
	ldr	w0, [x21, 14456]
	bl	MEM_Phy2Vir
	str	x0, [x24, 1584]
	ldr	x23, [x19, 26744]
	ldr	w0, [x21, 14460]
	bl	MEM_Phy2Vir
	str	x0, [x23, 1584]
.L282:
	add	x0, x19, 2504
	ldr	x2, [x0, 24232]
	ldrsb	w1, [x0, 3104]
	cbnz	w1, .L312
	strb	wzr, [x2, 1027]
	add	x1, x0, 8192
	ldr	x2, [x0, 24232]
	ldrb	w3, [x1, 2459]
	strb	w3, [x2, 1028]
	ldrb	w3, [x1, 2467]
	ldr	x2, [x0, 24232]
	sub	w0, w3, #2
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L326
	cmp	w3, 4
	mov	w0, 0
	beq	.L364
.L313:
	add	x24, x19, 2504
	strb	w0, [x2, 1030]
	add	x20, x24, 20480
	strb	w0, [x2, 1029]
	mov	w0, 1
	add	x22, x24, 36864
	strb	wzr, [x20, 3888]
	str	w0, [x20, 3868]
	ldr	x0, [x19, 5640]
	ldr	x23, [x22, 1832]
	bl	BsPos
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w0, w1, w0, lt
	asr	w0, w0, 3
	add	x0, x23, x0, sxtw
	str	x0, [x19, 26856]
	ldr	x0, [x19, 5640]
	ldr	w23, [x22, 1852]
	bl	BsPos
	add	w1, w0, 7
	cmp	w0, wzr
	csel	w0, w1, w0, lt
	add	w0, w23, w0, asr 3
	str	w0, [x20, 3892]
	ldr	x0, [x19, 5640]
	bl	BsPos
	and	w0, w0, 7
	str	w0, [x20, 3896]
	ldr	w23, [x22, 1860]
	ldr	x0, [x19, 5640]
	lsl	w23, w23, 3
	bl	BsPos
	sub	w0, w23, w0
	str	w0, [x20, 3900]
	ldr	w1, [x22, 1908]
	ldr	w0, [x22, 1904]
	mul	w0, w0, w1
	sub	w0, w0, #1
	str	w0, [x20, 3904]
	ldrb	w1, [x19, 2506]
.L314:
	add	x19, x19, 2504
	mov	w3, 1
	mov	w2, 0
	mov	x0, x19
	bl	VC1_Vfmw_BuildRefList
	mov	w23, w0
	cbz	w0, .L365
	mov	w23, 1
	b	.L350
	.p2align 3
.L272:
	ldr	x1, .LC52
	mov	w0, 0
	mov	w23, 0
	bl	dprint_vfmw
.L350:
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L269:
	ldr	w0, [x1, 3788]
	mov	w1, w22
	mul	w20, w22, w0
	b	.L321
	.p2align 3
.L354:
	add	w20, w20, 1
	add	w20, w20, w20, lsr 31
	asr	w20, w20, 1
	b	.L351
	.p2align 3
.L283:
	add	x0, x19, 2504
	add	x23, x21, 53248
	add	x25, x0, 20480
	add	x1, x25, 2048
	str	x1, [x19, 26736]
	str	x1, [x19, 26744]
	str	x1, [x19, 26752]
	str	x1, [x19, 26760]
	ldr	w0, [x23, 1024]
	ldr	w1, [x25, 3856]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	cbz	x0, .L279
	ldr	w0, [x23, 1024]
	ldr	x1, [x24, 600]
	bl	FreeUsdByDec
	ldr	w0, [x23, 1024]
	ldr	x1, [x24, 608]
	bl	FreeUsdByDec
	ldr	w0, [x23, 1024]
	ldr	x1, [x24, 616]
	bl	FreeUsdByDec
	ldr	w0, [x23, 1024]
	ldr	x1, [x24, 624]
	bl	FreeUsdByDec
	add	x0, x24, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	ldr	w0, [x23, 1024]
	ldr	w1, [x25, 3856]
	bl	FSP_ClearLogicFs
	ldr	w0, [x23, 1024]
	mov	w2, 1
	ldr	w1, [x25, 3852]
	bl	FSP_ClearLogicFs
	str	wzr, [x25, 3852]
	str	wzr, [x25, 3856]
	ldr	w0, [x23, 1024]
	bl	FSP_GetNullLogicFs
	str	w0, [x25, 3852]
	str	w0, [x25, 3856]
.L279:
	add	x2, x19, 2504
	add	x0, x21, 28672
	add	x2, x2, 20480
	add	x1, x21, 36864
	add	x0, x0, 129
	add	x1, x1, 457
	str	wzr, [x2, 3848]
	.p2align 2
.L285:
	strb	wzr, [x0]
	strb	wzr, [x0, -1]
	add	x0, x0, 1704
	cmp	x1, x0
	bne	.L285
	add	x24, x23, 416
	ldr	w0, [x23, 1024]
	mov	x1, x24
	bl	FSP_ClearNotInVoQueue
	ldrb	w0, [x19, 2504]
	tbnz	x0, 3, .L287
	mov	x0, x24
	bl	ResetVoQueue
	ldr	x1, [x21]
	ldr	w0, [x1, 668]
	ldr	w3, [x1, 672]
	adds	w1, w0, 15
	add	w0, w0, 30
	add	w2, w3, 30
	csel	w1, w0, w1, mi
	adds	w0, w3, 15
	asr	w1, w1, 4
	csel	w0, w2, w0, mi
	str	w1, [x21, 14620]
	asr	w0, w0, 4
	mov	w3, 2
	add	w2, w0, 1
	str	w0, [x21, 14624]
	lsl	w1, w1, 4
	mov	x0, x21
	add	w2, w2, w2, lsr 31
	asr	w2, w2, 1
	lsl	w2, w2, 5
	bl	VC1_ArrangeVahbMem
	cmp	w0, 1
	bne	.L286
	ldrb	w0, [x19, 2504]
	orr	w0, w0, 8
	strb	w0, [x19, 2504]
	b	.L287
	.p2align 3
.L357:
	ldr	x1, .LC56
	mov	w0, 1
	bl	dprint_vfmw
	b	.L350
	.p2align 3
.L355:
	ldr	w0, [x2, 3792]
	cmp	w1, w0
	bne	.L275
	lsl	w0, w22, 4
	mov	w3, 0
	add	w0, w0, 63
	and	w0, w0, -64
	str	w0, [x2, 3808]
	ldrb	w0, [x4, 8]
	cbz	w0, .L280
	b	.L277
	.p2align 3
.L293:
	add	x0, x24, 20480
	ldr	w1, [x0, 3848]
	cmp	w1, 1
	bhi	.L297
	ldr	w1, [x0, 3860]
	mov	w2, 1
	ldr	w0, [x23, 1024]
	mov	w23, 0
	bl	FSP_ClearLogicFs
	ldr	x2, [x24, 24232]
	mov	w0, 1
	ldr	x1, .LC63
	strb	wzr, [x2]
	ldr	x2, [x24, 24232]
	strb	wzr, [x2, 1]
	bl	dprint_vfmw
	b	.L350
	.p2align 3
.L360:
	ldr	w0, [x23, 1024]
	mov	w2, 1
	ldr	w1, [x26, 3860]
	bl	FSP_ClearLogicFs
	ldr	x0, [x25, 24232]
	mov	x5, x27
	ldr	x1, .LC65
	mov	x4, x28
	mov	x3, x24
	mov	w2, 2409
	strb	wzr, [x0]
	mov	w0, 0
	ldr	x6, [x25, 24232]
	strb	wzr, [x6, 1]
	bl	dprint_vfmw
	ldrb	w0, [x25, 2]
	cmp	w0, 5
	beq	.L366
.L301:
	ldr	x1, .LC67
	mov	w0, 1
	mov	w23, 0
	bl	dprint_vfmw
	b	.L350
	.p2align 3
.L312:
	ldr	w3, [x0, 10804]
	add	x1, x0, 8192
	strb	w3, [x2, 1027]
	ldr	x2, [x0, 24232]
	ldrb	w3, [x1, 2569]
	strb	w3, [x2, 1028]
	ldrb	w3, [x1, 2582]
	ldr	x4, [x0, 24232]
	sub	w2, w3, #2
	ldrb	w0, [x1, 2609]
	uxtb	w2, w2
	cmp	w2, 1
	bls	.L328
	cmp	w3, 4
	mov	w2, 0
	beq	.L367
.L315:
	add	x0, x4, x0, sxtw
	add	x3, x19, 2504
	add	x1, x3, 20480
	strb	w2, [x0, 1029]
	ldr	w5, [x1, 3868]
	cbz	w5, .L316
	sub	w5, w5, #1
	mov	w1, 0
	mov	w4, w5
	cbz	w5, .L353
	.p2align 2
.L341:
	sxtw	x2, w1
	lsl	x0, x2, 3
	sub	x0, x0, x2
	lsl	x0, x0, 3
	add	x2, x3, x0
	add	x0, x0, 20480
	add	x2, x2, 20480
	add	x0, x3, x0
	strb	w1, [x2, 3888]
	add	w1, w1, 1
	cmp	w4, w1
	ldr	w0, [x0, 3960]
	mul	w0, w22, w0
	sub	w0, w0, #1
	str	w0, [x2, 3904]
	bne	.L341
	uxtb	w4, w4
.L318:
	lsl	x0, x5, 3
	add	x2, x19, 2504
	sub	x0, x0, x5
	sub	w20, w20, #1
	add	x0, x2, x0, lsl 3
	add	x0, x0, 20480
	strb	w4, [x0, 3888]
	str	w20, [x0, 3904]
	ldrb	w1, [x19, 2506]
	cmp	w1, 2
	bne	.L314
	add	x0, x2, 8192
	ldr	w3, [x19, 13412]
	add	x2, x2, 36864
	ldrb	w0, [x0, 2599]
	mul	w3, w0, w3
	asr	w3, w3, 8
	str	w3, [x2, 1880]
	sub	w0, w0, w3
	subs	w0, w0, #1
	csel	w0, w0, wzr, pl
	str	w0, [x2, 1884]
	b	.L314
	.p2align 3
.L361:
	ldr	w0, [x25, 10804]
	cmp	w0, 3
	bne	.L303
	ldr	x0, .LC59
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L303
	str	w0, [x24, 120]
	b	.L304
	.p2align 3
.L366:
	add	x25, x25, 36864
	ldr	w0, [x25, 1924]
	cmp	w0, wzr
	ble	.L301
	sub	w0, w0, #1
	str	w0, [x25, 1924]
	b	.L301
	.p2align 3
.L356:
	ldrb	w0, [x19, 2513]
	cmp	w0, 1
	bne	.L282
	b	.L280
	.p2align 3
.L365:
	add	x0, x19, 20480
	add	x21, x21, 53248
	mov	w2, 1
	ldr	w1, [x0, 3860]
	ldr	w0, [x21, 1024]
	bl	FSP_ClearLogicFs
	ldr	x2, [x19, 24232]
	mov	w0, 1
	ldr	x1, .LC71
	strb	wzr, [x2]
	ldr	x2, [x19, 24232]
	strb	wzr, [x2, 1]
	bl	dprint_vfmw
	b	.L350
	.p2align 3
.L306:
	add	x19, x19, 2504
	ldr	w0, [x23, 1024]
	add	x20, x19, 20480
	mov	w2, 1
	ldr	w1, [x20, 3860]
	bl	FSP_ClearLogicFs
	ldr	x2, [x19, 24232]
	mov	w0, 0
	ldr	x1, .LC69
	strb	wzr, [x2]
	ldr	x2, [x19, 24232]
	strb	wzr, [x2, 1]
	ldr	w2, [x20, 3852]
	ldr	w4, [x20, 3856]
	ldr	w3, [x20, 3860]
	ldr	x5, [x24, 680]
	ldr	x7, [x24, 688]
	ldr	x6, [x24, 696]
	bl	dprint_vfmw
	ldrb	w0, [x19, 2]
	cmp	w0, 5
	bne	.L301
	add	x19, x19, 36864
	ldr	w0, [x19, 1924]
	cmp	w0, wzr
	ble	.L301
	sub	w0, w0, #1
	str	w0, [x19, 1924]
	b	.L301
	.p2align 3
.L362:
	ldr	w1, [x28, 120]
	add	x0, x0, 36864
	str	w1, [x24, 120]
	ldr	x2, [x19, 26752]
	ldr	x1, [x19, 26736]
	ldr	w2, [x2, 1152]
	str	w2, [x1, 1152]
	ldr	w1, [x0, 1924]
	add	w1, w1, 1
	str	w1, [x0, 1924]
	b	.L305
	.p2align 3
.L316:
	mov	w0, 1
	mov	x5, 0
	str	w0, [x1, 3868]
.L353:
	mov	w4, 0
	b	.L318
	.p2align 3
.L359:
	ldr	x0, [x19, 26736]
	ldrb	w1, [x1, 2458]
	strb	w1, [x0, 2]
	b	.L292
	.p2align 3
.L358:
	ldr	x1, .LC59
	ldr	w1, [x1]
	cmp	w1, 1
	bne	.L290
	ldr	x0, [x19, 26736]
	str	w1, [x0, 1152]
	b	.L291
	.p2align 3
.L286:
	ldr	x1, .LC54
	mov	w0, 1
	mov	w23, 0
	bl	dprint_vfmw
	ldrb	w0, [x19, 2504]
	and	w0, w0, -9
	strb	w0, [x19, 2504]
	b	.L350
	.p2align 3
.L328:
	mov	w2, 1
	b	.L315
	.p2align 3
.L326:
	mov	w0, 1
	b	.L313
.L367:
	ldrb	w1, [x1, 2583]
	sub	w1, w1, #2
	uxtb	w1, w1
	cmp	w1, 1
	cset	w2, ls
	b	.L315
.L364:
	ldrb	w0, [x1, 2468]
	sub	w0, w0, #2
	uxtb	w0, w0
	cmp	w0, 1
	cset	w0, ls
	b	.L313
.L308:
	ldr	w0, [x0, 16]
	b	.L309
.L363:
	ldr	x0, [x24, 680]
	b	.L352
	.size	VC1_Vfmw_GetStreamInfo, .-VC1_Vfmw_GetStreamInfo
	.align	3
.LC52:
	.xword	.LC31
	.align	3
.LC54:
	.xword	.LC53
	.align	3
.LC56:
	.xword	.LC55
	.align	3
.LC58:
	.xword	.LC57
	.align	3
.LC59:
	.xword	USE_FF_APT_EN
	.align	3
.LC61:
	.xword	.LC60
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC67:
	.xword	.LC66
	.align	3
.LC69:
	.xword	.LC68
	.align	3
.LC71:
	.xword	.LC70
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_PrepareDecode
	.type	VC1_Vfmw_PrepareDecode, %function
VC1_Vfmw_PrepareDecode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	VC1_Vfmw_GetStreamInfo
	mov	w19, w0
	cbz	w0, .L371
	mov	w19, 1
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L371:
	ldr	x1, .LC73
	bl	dprint_vfmw
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_Vfmw_PrepareDecode, .-VC1_Vfmw_PrepareDecode
	.align	3
.LC73:
	.xword	.LC72
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecMvrange
	.type	VC1_DecMvrange, %function
VC1_DecMvrange:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x3, .LC74
	mov	w1, 3
	mov	x0, x19
	ldp	x8, x9, [x3, 16]
	ldp	x6, x7, [x3, 32]
	ldp	x4, x5, [x3, 48]
	ldp	x2, x3, [x3, 64]
	stp	x8, x9, [x29, 32]
	stp	x6, x7, [x29, 48]
	stp	x4, x5, [x29, 64]
	stp	x2, x3, [x29, 80]
	bl	BsShow
	add	x1, x29, 96
	add	x1, x1, x0, sxtw 3
	mov	x0, x19
	ldp	w19, w1, [x1, -64]
	bl	BsSkip
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.size	VC1_DecMvrange, .-VC1_DecMvrange
	.align	3
.LC74:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecTransacfrm
	.type	VC1_DecTransacfrm, %function
VC1_DecTransacfrm:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w2, 2
	mov	w3, 1
	mov	w1, w2
	mov	x0, x19
	stp	xzr, xzr, [x29, 32]
	str	w3, [x29, 36]
	stp	w3, w3, [x29, 44]
	stp	w2, w2, [x29, 52]
	str	w2, [x29, 60]
	stp	xzr, xzr, [x29, 64]
	stp	xzr, xzr, [x29, 80]
	bl	BsShow
	add	x1, x29, 96
	add	x1, x1, x0, sxtw 3
	mov	x0, x19
	ldp	w19, w1, [x1, -64]
	bl	BsSkip
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 96
	ret
	.size	VC1_DecTransacfrm, .-VC1_DecTransacfrm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_SetCurPicResolutionInfo
	.type	VC1_SetCurPicResolutionInfo, %function
VC1_SetCurPicResolutionInfo:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	add	x1, x19, 20480
	cmp	w20, 1
	add	x0, x19, 36864
	ldr	w2, [x1, 3784]
	beq	.L376
	cmp	w20, 2
	beq	.L382
	cbz	w20, .L381
	add	w2, w2, 1
	add	w2, w2, w2, lsr 31
	asr	w2, w2, 1
.L382:
	str	w2, [x0, 1904]
	ldr	w1, [x1, 3788]
	add	w1, w1, 1
	add	w1, w1, w1, lsr 31
	asr	w1, w1, 1
	str	w1, [x0, 1908]
	b	.L379
	.p2align 3
.L376:
	add	w2, w2, 1
	add	w2, w2, w2, lsr 31
	asr	w2, w2, 1
.L381:
	str	w2, [x0, 1904]
	ldr	w1, [x1, 3788]
	str	w1, [x0, 1908]
.L379:
	mul	w3, w2, w1
	str	w3, [x0, 1912]
	lsl	w2, w2, 4
	lsl	w1, w1, 4
	str	w2, [x0, 1896]
	str	w1, [x0, 1900]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_SetCurPicResolutionInfo, .-VC1_SetCurPicResolutionInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecMvmodeProgrP
	.type	VC1_DecMvmodeProgrP, %function
VC1_DecMvmodeProgrP:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	uxtb	w21, w1
	bl	_mcount
	mov	w1, 4
	mov	x0, x20
	bl	BsShow
	cmp	w0, 1
	ldr	x1, .LC76
	add	x2, x1, 104
	ldp	x4, x5, [x1, 80]
	ldr	w3, [x1, 96]
	ldp	x6, x7, [x2]
	add	x2, x29, 72
	ldr	w1, [x1, 120]
	stp	x4, x5, [x29, 48]
	str	w3, [x29, 64]
	stp	x6, x7, [x2]
	str	w1, [x29, 88]
	ble	.L391
	cmp	w0, 3
	ble	.L389
	cmp	w0, 8
	mov	w1, 2
	csinc	w1, w1, wzr, lt
	cset	w19, lt
.L385:
	mov	x0, x20
	sbfiz	x19, x19, 2, 32
	bl	BsSkip
	cmp	w21, 12
	add	x0, x29, 96
	add	x19, x0, x19
	bhi	.L392
.L386:
	ldr	w0, [x19, -24]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L389:
	mov	w1, 3
	mov	x0, x20
	mov	w19, 2
	bl	BsSkip
	sbfiz	x19, x19, 2, 32
	cmp	w21, 12
	add	x0, x29, 96
	add	x19, x0, x19
	bls	.L386
.L392:
	ldr	w0, [x19, -48]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L391:
	mov	w1, 4
	mov	w19, 3
	cbz	w0, .L385
	mov	w19, w1
	b	.L385
	.size	VC1_DecMvmodeProgrP, .-VC1_DecMvmodeProgrP
	.align	3
.LC76:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecMvmodeProgrB
	.type	VC1_DecMvmodeProgrB, %function
VC1_DecMvmodeProgrB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 1
	mov	x0, x19
	bl	BsSkip
	ldr	x19, [sp, 16]
	add	x1, x29, 48
	mov	w2, 3
	add	x0, x1, x0, sxtw 2
	mov	w1, 1
	stp	w2, w1, [x29, 40]
	ldr	w0, [x0, -8]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_DecMvmodeProgrB, .-VC1_DecMvmodeProgrB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecMvmodeInterB
	.type	VC1_DecMvmodeInterB, %function
VC1_DecMvmodeInterB:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	uxtb	w21, w1
	bl	_mcount
	mov	w1, 3
	mov	x0, x20
	bl	BsShow
	str	wzr, [x29, 88]
	add	x1, x29, 72
	mov	w3, 1
	mov	w2, 2
	cmp	w0, w3
	stp	w2, wzr, [x29, 64]
	stp	xzr, xzr, [x1]
	str	w3, [x29, 72]
	mov	w1, 3
	stp	w1, w3, [x29, 56]
	stp	w2, w1, [x29, 80]
	ble	.L401
	cmp	w0, 4
	csinc	w1, w2, wzr, lt
	cset	w19, lt
.L396:
	mov	x0, x20
	bl	BsSkip
	cmp	w21, 12
	sbfiz	x2, x19, 2, 32
	add	x0, x29, 96
	add	x2, x0, x2
	bhi	.L402
	ldr	w0, [x2, -24]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L402:
	ldr	w0, [x2, -40]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L401:
	mov	w19, w1
	cbz	w0, .L396
	mov	w19, w2
	b	.L396
	.size	VC1_DecMvmodeInterB, .-VC1_DecMvmodeInterB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecMvmode2
	.type	VC1_DecMvmode2, %function
VC1_DecMvmode2:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	uxtb	w21, w1
	bl	_mcount
	mov	w1, 3
	mov	x0, x20
	bl	BsShow
	mov	w3, 1
	mov	w1, 3
	mov	w2, 2
	cmp	w0, w3
	stp	w1, w3, [x29, 48]
	stp	w2, wzr, [x29, 56]
	stp	w3, wzr, [x29, 64]
	stp	w2, w1, [x29, 72]
	ble	.L410
	cmp	w0, 4
	csinc	w1, w2, wzr, lt
	cset	w19, lt
.L405:
	mov	x0, x20
	bl	BsSkip
	cmp	w21, 12
	sbfiz	x2, x19, 2, 32
	add	x0, x29, 80
	add	x2, x0, x2
	bhi	.L411
	ldr	w0, [x2, -16]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L411:
	ldr	w0, [x2, -32]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L410:
	mov	w19, w1
	cbz	w0, .L405
	mov	w19, w2
	b	.L405
	.size	VC1_DecMvmode2, .-VC1_DecMvmode2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecBfractionSMP
	.type	VC1_DecBfractionSMP, %function
VC1_DecBfractionSMP:
	stp	x29, x30, [sp, -256]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	mov	x22, x2
	bl	_mcount
	ldr	x0, .LC78
	add	x1, x0, 248
	add	x8, x0, 304
	ldp	x4, x5, [x0, 128]
	ldr	w3, [x0, 184]
	ldr	x6, [x0, 144]
	stp	x4, x5, [x29, 48]
	ldr	x4, [x0, 176]
	ldr	w7, [x0, 152]
	str	x6, [x29, 64]
	str	x4, [x29, 96]
	ldr	x6, [x0, 240]
	ldp	x4, x5, [x0, 192]
	str	w3, [x29, 104]
	ldr	x3, [x0, 296]
	str	w7, [x29, 72]
	stp	x4, x5, [x29, 144]
	str	x6, [x29, 192]
	ldp	x4, x5, [x0, 208]
	ldp	x6, x7, [x0, 160]
	str	x3, [x29, 248]
	ldp	x2, x3, [x0, 224]
	add	x0, x29, 200
	stp	x6, x7, [x29, 80]
	ldp	x6, x7, [x1]
	stp	x6, x7, [x0]
	ldp	x6, x7, [x8]
	stp	x6, x7, [x29, 112]
	add	x6, x29, 216
	mov	x0, x21
	stp	x4, x5, [x29, 160]
	ldp	x4, x5, [x1, 16]
	stp	x4, x5, [x6]
	add	x4, x29, 232
	stp	x2, x3, [x29, 176]
	ldp	x2, x3, [x1, 32]
	stp	x2, x3, [x4]
	ldp	x2, x3, [x8, 16]
	mov	w1, 3
	stp	x2, x3, [x29, 128]
	bl	BsShow
	cmp	w0, 6
	mov	w19, w0
	bgt	.L413
	mov	w1, 3
	mov	x0, x21
	bl	BsSkip
	add	x0, x29, 256
	add	x0, x0, x19, sxtw 2
	ldr	w2, [x0, -208]
	ldr	w1, [x0, -176]
.L414:
	sub	w1, w1, #1
	add	x3, x29, 256
	mov	w0, w19
	add	x1, x3, x1, sxtw 2
	ldr	w1, [x1, -144]
	mul	w1, w1, w2
	str	w1, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L413:
	mov	w1, 7
	mov	x0, x21
	bl	BsGet
	and	w19, w0, 15
	cmp	w19, 15
	beq	.L417
	sub	w0, w0, #112
	add	x1, x29, 256
	add	w19, w19, 7
	add	x0, x1, x0, sxtw 2
	ldr	w2, [x0, -112]
	ldr	w1, [x0, -56]
	b	.L414
	.p2align 3
.L417:
	mov	w1, 4
	strb	w1, [x22]
	mov	w0, 22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 256
	ret
	.size	VC1_DecBfractionSMP, .-VC1_DecBfractionSMP
	.align	3
.LC78:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecBfraction
	.type	VC1_DecBfraction, %function
VC1_DecBfraction:
	stp	x29, x30, [sp, -256]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, .LC84
	add	x0, x19, 248
	ldr	w6, [x19, 152]
	ldr	x8, [x19, 176]
	str	w6, [x29, 72]
	add	x6, x29, 200
	ldr	w5, [x19, 184]
	ldr	x4, [x19, 240]
	str	x8, [x29, 96]
	add	x8, x29, 216
	ldp	x2, x3, [x19, 128]
	str	w5, [x29, 104]
	str	x4, [x29, 192]
	ldp	x4, x5, [x0]
	stp	x4, x5, [x6]
	stp	x2, x3, [x29, 48]
	ldp	x4, x5, [x0, 16]
	ldp	x2, x3, [x19, 160]
	add	x6, x19, 304
	ldr	x7, [x19, 144]
	stp	x4, x5, [x8]
	stp	x2, x3, [x29, 80]
	add	x4, x29, 232
	str	x7, [x29, 64]
	ldp	x2, x3, [x19, 192]
	stp	x2, x3, [x29, 144]
	ldp	x2, x3, [x19, 208]
	stp	x2, x3, [x29, 160]
	ldp	x2, x3, [x0, 32]
	stp	x2, x3, [x4]
	ldp	x2, x3, [x6]
	ldp	x0, x1, [x19, 224]
	ldr	x7, [x19, 296]
	stp	x2, x3, [x29, 112]
	ldp	x2, x3, [x6, 16]
	stp	x0, x1, [x29, 176]
	mov	w1, 3
	mov	x0, x22
	str	x7, [x29, 248]
	stp	x2, x3, [x29, 128]
	bl	BsShow
	cmp	w0, 6
	mov	w20, w0
	bgt	.L419
	mov	w1, 3
	mov	x0, x22
	bl	BsSkip
	add	x0, x29, 256
	add	x0, x0, x20, sxtw 2
	ldr	w4, [x0, -176]
	ldr	w1, [x0, -208]
	sub	w0, w4, #1
	cmp	w0, 7
	bhi	.L423
.L425:
	add	x2, x29, 256
	add	x0, x2, x0, sxtw 2
	ldr	w0, [x0, -144]
	mul	w0, w1, w0
.L424:
	str	w0, [x21]
.L421:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 256
	ret
	.p2align 3
.L419:
	mov	w1, 7
	mov	x0, x22
	bl	BsGet
	and	w20, w0, 15
	sub	w1, w20, #14
	add	w20, w20, 7
	cmp	w1, 1
	bls	.L421
	sub	w1, w0, #112
	cmp	w1, 13
	bhi	.L422
	add	x0, x29, 256
	add	x0, x0, x1, sxtw 2
	ldr	w4, [x0, -56]
	ldr	w1, [x0, -112]
	sub	w0, w4, #1
	cmp	w0, 7
	bls	.L425
.L423:
	ldr	x1, .LC88
	mov	w3, 3594
	add	x2, x19, 336
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L424
	.p2align 3
.L422:
	ldr	x1, .LC86
	mov	w4, w0
	mov	w3, 3584
	add	x2, x19, 336
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC88
	mov	w4, 0
	mov	w3, 3594
	add	x2, x19, 336
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L424
	.size	VC1_DecBfraction, .-VC1_DecBfraction
	.align	3
.LC84:
	.xword	.LANCHOR0
	.align	3
.LC86:
	.xword	.LC85
	.align	3
.LC88:
	.xword	.LC87
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_VopDQuant
	.type	VC1_VopDQuant, %function
VC1_VopDQuant:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	uxtb	w21, w1
	uxtb	w20, w2
	mov	x19, x3
	bl	_mcount
	cmp	w21, 2
	beq	.L444
	mov	w1, 1
	mov	x0, x22
	bl	BsGet
	uxtb	w21, w0
	cmp	w21, 1
	strb	w21, [x19]
	beq	.L445
.L430:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L444:
	mov	w0, 1
	mov	w1, 3
	strb	w0, [x19, 3]
	strb	w0, [x19]
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 7
	strb	w0, [x19, 4]
	beq	.L446
	add	w20, w20, 1
	add	w0, w0, w20
	strb	w0, [x19, 8]
.L429:
	mov	w0, 1
	str	w0, [x19, 12]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L445:
	mov	w1, 2
	mov	x0, x22
	bl	BsGet
	uxtb	w1, w0
	strb	w1, [x19, 1]
	cbnz	w1, .L432
	str	w21, [x19, 12]
.L433:
	ldr	w0, [x19]
	and	w0, w0, 16776960
	cmp	w0, 768
	beq	.L430
	mov	w0, 1
	mov	w1, 3
	strb	w0, [x19, 3]
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 7
	strb	w0, [x19, 4]
	beq	.L447
	add	w20, w20, 1
	add	w0, w0, w20
	strb	w0, [x19, 8]
	b	.L430
	.p2align 3
.L432:
	cmp	w1, 2
	beq	.L448
	cmp	w1, 1
	beq	.L449
	cmp	w1, 3
	beq	.L450
	str	wzr, [x19, 12]
	b	.L433
.L450:
	mov	w1, w21
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	mov	w1, 10
	mov	w2, 11
	cmp	w0, wzr
	strb	w0, [x19, 2]
	csel	w0, w1, w2, ne
	str	w0, [x19, 12]
	b	.L433
	.p2align 3
.L446:
	mov	w1, 5
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 5]
	strb	w0, [x19, 8]
	b	.L429
.L448:
	mov	x0, x22
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x19, 6]
	add	w0, w1, 6
	str	w0, [x19, 12]
	b	.L433
.L449:
	mov	w1, 2
	mov	x0, x22
	bl	BsGet
	and	w1, w0, 255
	strb	w0, [x19, 7]
	add	w0, w1, 2
	str	w0, [x19, 12]
	b	.L433
.L447:
	mov	w1, 5
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 5]
	strb	w0, [x19, 8]
	b	.L430
	.size	VC1_VopDQuant, .-VC1_VopDQuant
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecNormDiff6Tile
	.type	VC1_DecNormDiff6Tile, %function
VC1_DecNormDiff6Tile:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x23, x1
	mov	x20, x0
	mov	x0, x30
	mov	w22, 0
	bl	_mcount
	ldr	w24, [x23]
	b	.L452
	.p2align 3
.L462:
	mov	w22, w19
.L452:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	mov	w21, w0
	mov	w1, 3
	mov	x0, x20
	cbnz	w21, .L461
	bl	BsGet
	cmp	w0, 1
	mov	w19, w0
	mov	w1, w0
	mov	x0, x20
	bgt	.L471
	bne	.L455
	bl	BsGet
	cbz	w0, .L456
	cbz	w22, .L462
.L468:
	str	w24, [x23]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L461:
	mov	w0, 0
.L453:
	eor	w1, w0, 63
	cmp	w22, wzr
	csel	w0, w1, w0, ne
	mov	w21, 1
	str	w0, [x23]
.L473:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L471:
	sub	w19, w19, #2
	mov	w0, 1
	lsl	w0, w0, w19
	b	.L453
	.p2align 3
.L455:
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	cmp	w0, 255
	beq	.L468
	ldr	x1, .LC94
	add	x1, x1, 488
	ldr	w0, [x1, w0, sxtw 2]
	b	.L453
	.p2align 3
.L456:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	ldr	x1, .LC94
	add	x1, x1, 360
	ldr	w1, [x1, w0, sxtw 2]
	cmp	w1, 2
	beq	.L472
	cmp	w1, 3
	beq	.L453
	str	w0, [x23]
	b	.L473
.L472:
	orr	w0, w0, 32
	b	.L453
	.size	VC1_DecNormDiff6Tile, .-VC1_DecNormDiff6Tile
	.align	3
.LC94:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvSeqHdr
	.type	VC1_Vfmw_ParseAdvSeqHdr, %function
VC1_Vfmw_ParseAdvSeqHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x2
	bl	_mcount
	add	x19, x22, 16
	ldr	x3, .LC97
	mov	x2, 172
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	mov	x0, x20
	bl	BsPos
	str	w0, [x19, 168]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	mov	w0, 2
	mov	w1, 3
	strb	w0, [x22, 16]
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 1]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 5]
	mov	w1, 12
	mov	x0, x20
	bl	BsGet
	uxth	w0, w0
	add	w2, w0, 1
	mov	w1, 12
	ubfiz	w2, w2, 1, 15
	mov	x0, x20
	strh	w2, [x19, 156]
	bl	BsGet
	uxth	w0, w0
	add	w2, w0, 1
	mov	w1, 1
	ubfiz	w2, w2, 1, 15
	mov	x0, x20
	strh	w2, [x19, 158]
	bl	BsGet
	strb	w0, [x19, 6]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 2
	mov	x0, x20
	bl	BsSkip
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w21, w0
	cmp	w21, 1
	strb	w21, [x19, 10]
	beq	.L488
	ldrh	w1, [x19, 156]
	ldrh	w0, [x19, 158]
	strh	w1, [x19, 160]
	strh	w0, [x19, 162]
.L481:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 23]
	beq	.L482
.L484:
	mov	x0, x20
	bl	BsPos
	ldr	w1, [x19, 168]
	mov	w2, 1
	sub	w0, w0, w1
	str	w0, [x19, 168]
.L483:
	mov	w0, w2
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L482:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 31
	strb	w0, [x19, 24]
	mov	w2, 0
	bhi	.L483
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 25]
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 26]
	ldrb	w1, [x19, 24]
	cbz	w1, .L484
	mov	w21, 0
	.p2align 2
.L485:
	add	x23, x22, x21, sxtw 1
	mov	w1, 16
	mov	x0, x20
	add	w21, w21, 1
	bl	BsGet
	strh	w0, [x23, 44]
	mov	w1, 16
	mov	x0, x20
	bl	BsGet
	strh	w0, [x23, 108]
	ldrb	w0, [x19, 24]
	cmp	w0, w21
	bgt	.L485
	b	.L484
	.p2align 3
.L488:
	mov	w1, 14
	mov	x0, x20
	bl	BsGet
	add	w0, w0, 1
	mov	w1, 14
	strh	w0, [x19, 160]
	mov	x0, x20
	bl	BsGet
	add	w0, w0, 1
	mov	w1, w21
	strh	w0, [x19, 162]
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 11]
	beq	.L489
.L477:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w1, w0
	cmp	w1, 1
	strb	w1, [x19, 15]
	beq	.L490
.L479:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 19]
	bne	.L481
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 20]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 22]
	b	.L481
	.p2align 3
.L490:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 16]
	cbnz	w0, .L480
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 17]
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	b	.L479
	.p2align 3
.L489:
	mov	w1, 4
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 15
	strb	w0, [x19, 12]
	bne	.L477
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 13]
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 14]
	b	.L477
.L480:
	mov	w1, 16
	mov	x0, x20
	bl	BsGet
	strh	w0, [x19, 164]
	b	.L479
	.size	VC1_Vfmw_ParseAdvSeqHdr, .-VC1_Vfmw_ParseAdvSeqHdr
	.align	3
.LC97:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvEntptHdr
	.type	VC1_Vfmw_ParseAdvEntptHdr, %function
VC1_Vfmw_ParseAdvEntptHdr:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	bl	_mcount
	add	x19, x21, 188
	ldr	x3, .LC98
	mov	x2, 60
	mov	w1, 0
	mov	x0, x19
	add	x22, x21, 16
	ldr	x3, [x3, 96]
	blr	x3
	mov	x0, x20
	bl	BsPos
	str	w0, [x19, 56]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x21, 188]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 1]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 2]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 5]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 6]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 10]
	ldrb	w0, [x22, 23]
	cmp	w0, 1
	beq	.L492
.L495:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 11]
	beq	.L512
.L510:
	ldrh	w0, [x19, 52]
.L497:
	ldrh	w1, [x19, 50]
	ldrh	w2, [x22, 156]
	cmp	w1, 15
	ccmp	w1, w2, 2, hi
	bls	.L498
	strh	w2, [x19, 50]
.L498:
	ldrh	w1, [x22, 158]
	cmp	w0, 15
	ccmp	w1, w0, 0, hi
	bcs	.L499
	strh	w1, [x19, 52]
.L499:
	ldrb	w1, [x19, 6]
	cmp	w1, 1
	beq	.L513
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 13]
	beq	.L514
.L501:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 15]
	beq	.L515
.L502:
	mov	x0, x20
	bl	BsPos
	ldr	w1, [x19, 56]
	sub	w1, w0, w1
	str	w1, [x19, 56]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L492:
	ldrb	w0, [x22, 24]
	cbz	w0, .L495
	mov	w21, 0
	.p2align 2
.L496:
	mov	w1, 8
	mov	x0, x20
	bl	BsGet
	add	x1, x19, x21, sxtw
	add	w21, w21, 1
	strb	w0, [x1, 17]
	ldrb	w0, [x22, 24]
	cmp	w0, w21
	bgt	.L496
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 11]
	bne	.L510
.L512:
	mov	w1, 12
	mov	x0, x20
	bl	BsGet
	add	w0, w0, 1
	ubfiz	w0, w0, 1, 15
	mov	w1, 12
	strh	w0, [x19, 50]
	mov	x0, x20
	bl	BsGet
	add	w0, w0, 1
	ubfiz	w0, w0, 1, 15
	strh	w0, [x19, 52]
	b	.L497
	.p2align 3
.L515:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	b	.L502
	.p2align 3
.L513:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 13]
	bne	.L501
	.p2align 2
.L514:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 14]
	b	.L501
	.size	VC1_Vfmw_ParseAdvEntptHdr, .-VC1_Vfmw_ParseAdvEntptHdr
	.align	3
.LC98:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecFcm
	.type	VC1_DecFcm, %function
VC1_DecFcm:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 2
	mov	x0, x20
	bl	BsShow
	cmp	w0, 1
	mov	w19, w0
	ble	.L519
	mov	w1, 2
	mov	x0, x20
	bl	BsSkip
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L519:
	mov	w1, 1
	mov	x0, x20
	mov	w19, 0
	bl	BsSkip
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_DecFcm, .-VC1_DecFcm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecAdvPtype
	.type	VC1_DecAdvPtype, %function
VC1_DecAdvPtype:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 4
	mov	x0, x19
	bl	BsShow
	cmp	w0, 7
	ble	.L522
	cmp	w0, 11
	bgt	.L526
	mov	w1, 2
	mov	w20, w1
.L521:
	mov	x0, x19
	bl	BsSkip
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L526:
	cmp	w0, 13
	ble	.L524
	cmp	w0, 14
	mov	w1, 4
	beq	.L525
	mov	w20, 5
	b	.L521
	.p2align 3
.L522:
	mov	w1, 1
	mov	x0, x19
	mov	w20, w1
	bl	BsSkip
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L524:
	mov	w1, 3
	mov	w20, 0
	b	.L521
	.p2align 3
.L525:
	mov	w20, w1
	b	.L521
	.size	VC1_DecAdvPtype, .-VC1_DecAdvPtype
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecRefdist
	.type	VC1_DecRefdist, %function
VC1_DecRefdist:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	mov	w1, 5
	mov	x0, x20
	bl	BsShow
	cmp	w0, 23
	mov	w2, w0
	bgt	.L528
	mov	w1, 2
	mov	x0, x20
	asr	w19, w2, 3
	bl	BsSkip
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L528:
	cmp	w0, 27
	mov	w19, 3
	bgt	.L534
	mov	w1, w19
	mov	x0, x20
	bl	BsSkip
	mov	w0, w19
.L535:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L534:
	mov	w0, 5
	cmp	w2, 29
	mov	w19, 4
	csel	w19, w0, w19, gt
	mov	x0, x20
	mov	w1, w19
	bl	BsSkip
	mov	w0, w19
	b	.L535
	.size	VC1_DecRefdist, .-VC1_DecRefdist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_DecIntCompField
	.type	VC1_DecIntCompField, %function
VC1_DecIntCompField:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC99
	mov	w1, 2
	mov	x0, x19
	add	x2, x2, 552
	ldp	x4, x5, [x2]
	ldp	x2, x3, [x2, 16]
	stp	x4, x5, [x29, 32]
	stp	x2, x3, [x29, 48]
	bl	BsShow
	add	x1, x29, 64
	add	x1, x1, x0, sxtw 3
	mov	x0, x19
	ldp	w19, w1, [x1, -32]
	bl	BsSkip
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.size	VC1_DecIntCompField, .-VC1_DecIntCompField
	.align	3
.LC99:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_next_start_code
	.type	VC1_Vfmw_next_start_code, %function
VC1_Vfmw_next_start_code:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 0
	bl	_mcount
	mov	x0, x20
	bl	BsToNextByte
	mov	x0, x20
	bl	BsResidBits
	cmp	w0, wzr
	add	w1, w0, 7
	csel	w21, w1, w0, lt
	asr	w21, w21, 3
	sub	w21, w21, #3
	cmp	w21, wzr
	bgt	.L544
	b	.L541
	.p2align 3
.L547:
	bl	BsSkip
	cmp	w19, w21
	beq	.L541
.L544:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	mov	w2, w0
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L547
	mov	w0, w2
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L541:
	mov	w2, 0
	ldr	x21, [sp, 32]
	mov	w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_Vfmw_next_start_code, .-VC1_Vfmw_next_start_code
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_UserData
	.type	VC1_Vfmw_UserData, %function
VC1_Vfmw_UserData:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	VC1_Vfmw_UserData, .-VC1_Vfmw_UserData
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_RecordSlcStream
	.type	VC1_RecordSlcStream, %function
VC1_RecordSlcStream:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 20480
	mov	x21, x1
	mov	x23, x2
	bl	_mcount
	add	x1, x21, 536
	add	x5, x20, 3872
	ldr	w0, [x20, 3868]
	ldr	x4, [x22, 3136]
	uxtw	x21, w0
	lsl	x3, x21, 3
	sub	x3, x3, x21
	lsl	x3, x3, 3
	add	x19, x5, x3
	strb	w0, [x19, 16]
	ldr	w0, [x4, 32]
	ubfx	x0, x0, 3, 29
	add	x0, x23, x0
	str	x0, [x5, x3]
	ldr	w2, [x4, 32]
	and	w2, w2, 7
	str	w2, [x19, 24]
	ldr	w3, [x4, 24]
	ldr	w2, [x4, 32]
	lsl	w3, w3, 3
	sub	w3, w3, w2
	lsl	x2, x21, 2
	sub	x2, x2, x21
	str	w3, [x19, 28]
	add	x21, x1, x2, lsl 2
	bl	MEM_Vir2Phy
	add	x2, x22, 36864
	str	w0, [x19, 20]
	add	x0, x2, 1832
	ldr	w1, [x2, 1868]
	str	w1, [x19, 48]
	ldr	x1, [x2, 1840]
	cbz	x1, .L550
	ldr	w2, [x2, 1856]
	cbnz	w2, .L569
.L550:
	mov	x1, 0
	str	xzr, [x19, 8]
	stp	wzr, wzr, [x19, 36]
	str	wzr, [x19, 44]
	str	wzr, [x19, 52]
.L551:
	ldr	w4, [x20, 3784]
	ldr	w0, [x20, 3788]
	ldrb	w2, [x22, 8]
	mul	w4, w0, w4
	sub	w4, w4, #1
	cbz	w2, .L552
	add	w0, w0, 1
	ldr	w3, [x21, 4]
	add	w0, w0, w0, lsr 31
	sub	w3, w3, w0, asr 1
	str	w3, [x19, 32]
	cmp	w4, w3
	ccmp	w3, wzr, 4, cc
	bgt	.L570
.L553:
	ldr	w0, [x19, 28]
	cmp	w0, wzr
	ble	.L555
	cbz	x1, .L556
	ldr	w0, [x19, 44]
	cmp	w0, wzr
	ble	.L555
.L556:
	ldr	w1, [x20, 3868]
	mov	w0, 1
	add	w1, w1, w0
	str	w1, [x20, 3868]
.L554:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L552:
	ldr	w3, [x21, 4]
	str	w3, [x19, 32]
	cmp	w4, w3
	bcs	.L553
	ldr	w2, [x21, 4]
	mov	w0, 1
	ldr	x1, .LC104
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L569:
	str	x1, [x19, 8]
	str	wzr, [x19, 40]
	ldr	w2, [x0, 32]
	lsl	w2, w2, 3
	str	w2, [x19, 44]
	ldr	w2, [x0, 24]
	str	w2, [x19, 36]
	ldr	w0, [x0, 40]
	str	w0, [x19, 52]
	b	.L551
	.p2align 3
.L570:
	ldr	x1, .LC102
	mov	w0, 1
	ldr	w4, [x20, 3788]
	ldr	w2, [x21, 4]
	bl	dprint_vfmw
	mov	w0, 0
	b	.L554
	.p2align 3
.L555:
	ldr	x1, .LC106
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	VC1_RecordSlcStream, .-VC1_RecordSlcStream
	.align	3
.LC102:
	.xword	.LC101
	.align	3
.LC104:
	.xword	.LC103
	.align	3
.LC106:
	.xword	.LC105
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_UpdateAdvSPS
	.type	VC1_Vfmw_UpdateAdvSPS, %function
VC1_Vfmw_UpdateAdvSPS:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	add	x21, x0, 8192
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrh	w1, [x19, 238]
	ldrh	w0, [x21, 2446]
	cmp	w0, w1
	beq	.L572
	add	x0, x20, 20480
	add	w1, w1, 15
	asr	w1, w1, 4
	str	w1, [x0, 3784]
	ldrh	w1, [x19, 238]
	str	w1, [x0, 3800]
	ldrh	w1, [x19, 240]
	ldrh	w2, [x21, 2448]
	cmp	w2, w1
	beq	.L573
.L574:
	add	w1, w1, 15
	asr	w1, w1, 4
	str	w1, [x0, 3788]
	ldrh	w1, [x19, 240]
	str	w1, [x0, 3804]
.L573:
	add	x1, x19, 16
	add	x0, x21, 2224
	add	x19, x19, 188
	mov	x2, 172
	add	x21, x21, 2396
	bl	memcpy
	ldp	x0, x1, [x19]
	stp	x0, x1, [x21]
	mov	w0, 1
	ldp	x2, x3, [x19, 16]
	stp	x2, x3, [x21, 16]
	ldp	x2, x3, [x19, 32]
	stp	x2, x3, [x21, 32]
	ldr	x1, [x19, 48]
	str	x1, [x21, 48]
	ldr	w1, [x19, 56]
	str	w1, [x21, 56]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L572:
	ldrh	w1, [x19, 240]
	ldrh	w0, [x21, 2448]
	cmp	w0, w1
	bne	.L579
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L579:
	add	x0, x20, 20480
	b	.L574
	.size	VC1_Vfmw_UpdateAdvSPS, .-VC1_Vfmw_UpdateAdvSPS
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_UpdataLastPicRNDCTRL
	.type	VC1_Vfmw_UpdataLastPicRNDCTRL, %function
VC1_Vfmw_UpdataLastPicRNDCTRL:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrsb	w0, [x19, 3104]
	cbnz	w0, .L581
	mov	x0, x19
	bl	VC1_Vfmw_UpdataLastPicRNDCTRL.part.5
.L581:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_Vfmw_UpdataLastPicRNDCTRL, .-VC1_Vfmw_UpdataLastPicRNDCTRL
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_DecPQUANT
	.type	VC1_Vfmw_DecPQUANT, %function
VC1_Vfmw_DecPQUANT:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x1, .LC107
	mov	x2, 128
	add	x0, x29, 32
	add	x1, x1, 584
	bl	memcpy
	mov	w0, w19
	cbnz	w20, .L583
	add	x0, x29, 160
	add	x19, x0, x19, sxtw 2
	ldr	w0, [x19, -128]
.L583:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 160
	ret
	.size	VC1_Vfmw_DecPQUANT, .-VC1_Vfmw_DecPQUANT
	.align	3
.LC107:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseSMPIPicHdr
	.type	VC1_Vfmw_ParseSMPIPicHdr, %function
VC1_Vfmw_ParseSMPIPicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x23, x1
	bl	_mcount
	add	x19, x21, 248
	mov	w1, 7
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 5]
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 6]
	mov	w1, 0
	cbz	w22, .L586
	ldrb	w24, [x21, 14]
	mov	w1, w22
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 104]
	cmp	w22, 8
	bls	.L597
	strb	wzr, [x19, 7]
.L588:
	cmp	w24, 1
	beq	.L598
	strb	wzr, [x19, 8]
.L590:
	ldrb	w0, [x21, 7]
	cmp	w0, 1
	beq	.L599
	strb	wzr, [x19, 9]
.L592:
	ldrb	w0, [x19, 3]
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cbz	w0, .L595
	ldrb	w0, [x21, 4]
	cmp	w0, 1
	beq	.L600
.L595:
	ldrb	w1, [x19, 10]
.L594:
	mov	x0, x23
	bl	VC1_SetCurPicResolutionInfo
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 19]
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 20]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	mov	w1, 1
.L586:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L597:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	ldrb	w24, [x21, 14]
	b	.L588
	.p2align 3
.L599:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 9]
	b	.L592
	.p2align 3
.L598:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L590
	.p2align 3
.L600:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w1, w0
	strb	w1, [x19, 10]
	b	.L594
	.size	VC1_Vfmw_ParseSMPIPicHdr, .-VC1_Vfmw_ParseSMPIPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseSMPPPicHdr
	.type	VC1_Vfmw_ParseSMPPPicHdr, %function
VC1_Vfmw_ParseSMPPPicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x23, x1
	add	x19, x21, 248
	bl	_mcount
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 6]
	cbz	w22, .L613
	ldrb	w24, [x21, 14]
	uxtb	w1, w0
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 104]
	cmp	w22, 8
	bls	.L624
	strb	wzr, [x19, 7]
.L605:
	cmp	w24, 1
	beq	.L625
	strb	wzr, [x19, 8]
.L607:
	ldrb	w0, [x21, 7]
	cmp	w0, 1
	beq	.L626
	strb	wzr, [x19, 9]
.L609:
	ldrb	w0, [x21, 4]
	cmp	w0, 1
	beq	.L610
	ldrb	w1, [x19, 10]
.L611:
	mov	x0, x23
	bl	VC1_SetCurPicResolutionInfo
	mov	x0, x20
	bl	BsPos
	mov	w2, w0
	ldr	x1, .LC109
	mov	w0, 18
	bl	dprint_vfmw
	ldrb	w1, [x19, 104]
	mov	x0, x20
	bl	VC1_DecMvmodeProgrP
	uxtb	w0, w0
	cmp	w0, 4
	strb	w0, [x19, 11]
	beq	.L627
.L612:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x23
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L613
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 15]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	ldrb	w1, [x21, 8]
	cbnz	w1, .L628
.L614:
	mov	x0, x20
	bl	BsPos
	mov	w2, w0
	ldr	x1, .LC111
	mov	w0, 18
	bl	dprint_vfmw
	ldrb	w1, [x21, 9]
	cmp	w1, 1
	beq	.L629
.L616:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 19]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	mov	w1, 1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L613:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L624:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	ldrb	w24, [x21, 14]
	b	.L605
	.p2align 3
.L628:
	ldrb	w2, [x19, 104]
	add	x3, x21, 272
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L614
	.p2align 3
.L627:
	ldrb	w1, [x19, 104]
	mov	x0, x20
	bl	VC1_DecMvmode2
	strb	w0, [x19, 12]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 13]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 14]
	b	.L612
	.p2align 3
.L610:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w1, w0
	strb	w1, [x19, 10]
	b	.L611
	.p2align 3
.L626:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 9]
	b	.L609
	.p2align 3
.L625:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L607
	.p2align 3
.L629:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 17]
	bne	.L616
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	b	.L616
	.size	VC1_Vfmw_ParseSMPPPicHdr, .-VC1_Vfmw_ParseSMPPPicHdr
	.align	3
.LC109:
	.xword	.LC108
	.align	3
.LC111:
	.xword	.LC110
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseMPBPicHdr
	.type	VC1_Vfmw_ParseMPBPicHdr, %function
VC1_Vfmw_ParseMPBPicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x24, x1
	add	x19, x21, 248
	bl	_mcount
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 6]
	cbz	w22, .L640
	ldrb	w23, [x21, 14]
	uxtb	w1, w0
	mov	w0, w23
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 104]
	cmp	w22, 8
	bls	.L652
	strb	wzr, [x19, 7]
.L634:
	cmp	w23, 1
	beq	.L653
	strb	wzr, [x19, 8]
.L636:
	ldrb	w0, [x21, 7]
	cmp	w0, 1
	beq	.L654
	strb	wzr, [x19, 9]
.L638:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	mov	w1, 3
	mov	w3, 0
	csinc	w0, w1, wzr, eq
	mov	x2, x21
	strb	w0, [x19, 11]
	mov	x1, x24
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L640
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 15]
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	ldrb	w1, [x21, 8]
	cbnz	w1, .L655
.L641:
	ldrb	w1, [x21, 9]
	cmp	w1, 1
	beq	.L656
.L643:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 19]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	mov	w1, 1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L640:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L652:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 7]
	ldrb	w23, [x21, 14]
	b	.L634
	.p2align 3
.L655:
	ldrb	w2, [x19, 104]
	add	x3, x21, 272
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L641
	.p2align 3
.L654:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 9]
	b	.L638
	.p2align 3
.L653:
	mov	w1, w23
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L636
	.p2align 3
.L656:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 17]
	bne	.L643
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	b	.L643
	.size	VC1_Vfmw_ParseMPBPicHdr, .-VC1_Vfmw_ParseMPBPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseSMPPicHdr
	.type	VC1_Vfmw_ParseSMPPicHdr, %function
VC1_Vfmw_ParseSMPPicHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	add	x19, x2, 248
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	mov	x22, x2
	bl	_mcount
	ldrb	w23, [x19, 10]
	mov	x0, x21
	mov	w1, w23
	bl	VC1_SetCurPicResolutionInfo
	ldr	w0, [x20, 24]
	cmp	w0, 1
	ble	.L695
	ldr	x25, .LC112
	mov	x2, 112
	mov	w1, 0
	mov	x0, x19
	add	x24, x21, 36864
	ldr	x3, [x25, 96]
	blr	x3
	strb	w23, [x19, 10]
	ldr	x3, [x25, 96]
	add	x0, x21, 20480
	mov	x2, 14336
	mov	w1, 0
	add	x0, x0, 3872
	blr	x3
	ldr	x1, .LC114
	mov	w0, 18
	ldr	w2, [x24, 1824]
	bl	dprint_vfmw
	mov	x0, x20
	bl	BsPos
	str	w0, [x19, 88]
	ldrb	w0, [x22, 15]
	cbnz	w0, .L660
	ldrb	w2, [x22, 248]
.L661:
	ldr	x1, .LC116
	mov	w0, 18
	bl	dprint_vfmw
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 1]
	ldrb	w0, [x22, 12]
	cbnz	w0, .L696
.L662:
	ldrb	w0, [x22, 13]
	mov	w1, 1
	cbnz	w0, .L663
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	cset	w0, ne
	strb	w0, [x19, 3]
.L664:
	strb	w0, [x21, 2]
	strb	wzr, [x21, 4]
	ldrb	w0, [x19, 3]
	cmp	w0, 4
	bhi	.L693
	ldr	x1, .LC117
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx669
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx669:
	.section	.rodata
	.align	0
	.align	2
.L669:
	.byte	(.L668 - .Lrtx669) / 4
	.byte	(.L670 - .Lrtx669) / 4
	.byte	(.L671 - .Lrtx669) / 4
	.byte	(.L693 - .Lrtx669) / 4
	.byte	(.L672 - .Lrtx669) / 4
	.text
	.p2align 3
.L670:
	mov	x1, x21
	mov	x2, x22
	mov	x0, x20
	bl	VC1_Vfmw_ParseSMPPPicHdr
	mov	w21, w0
.L673:
	mov	x0, x20
	bl	BsPos
	ldr	w1, [x19, 88]
	sub	w0, w0, w1
	str	w0, [x19, 88]
	mov	x0, x20
	ldr	w19, [x24, 1860]
	bl	BsPos
	lsl	w19, w19, 3
	sub	w19, w19, w0
	mov	w0, w21
	cmp	w19, wzr
	bgt	.L686
	ldr	x1, .LC123
	mov	w0, 1
	bl	dprint_vfmw
	.p2align 2
.L693:
	mov	w0, 0
.L686:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L695:
	mov	w0, 5
	strb	w0, [x19, 3]
	strb	w0, [x21, 2]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L663:
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	beq	.L697
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	beq	.L698
	mov	w0, 2
	add	x2, x22, 251
	strb	w0, [x19, 3]
	add	x1, x22, 356
	mov	x0, x20
	bl	VC1_DecBfractionSMP
	uxtb	w0, w0
	cmp	w0, 21
	strb	w0, [x19, 4]
	beq	.L693
	ldrb	w0, [x19, 3]
	b	.L664
	.p2align 3
.L660:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w2, w0
	strb	w2, [x22, 248]
	b	.L661
	.p2align 3
.L697:
	strb	w0, [x19, 3]
	b	.L664
	.p2align 3
.L672:
	ldrb	w23, [x21, 3120]
	cmp	w23, 1
	bne	.L693
	mov	x1, x21
	mov	x2, x22
	mov	x0, x20
	bl	VC1_Vfmw_ParseSMPIPicHdr
	cmp	w0, 1
	mov	w21, w0
	beq	.L673
	ldr	x1, .LC121
	mov	w0, w23
	bl	dprint_vfmw
	b	.L673
	.p2align 3
.L671:
	ldrb	w23, [x21, 3120]
	cmp	w23, 1
	bne	.L693
	mov	x1, x21
	mov	x2, x22
	mov	x0, x20
	bl	VC1_Vfmw_ParseMPBPicHdr
	cmp	w0, 1
	mov	w21, w0
	beq	.L673
	ldr	x1, .LC119
	mov	w0, w23
	bl	dprint_vfmw
	b	.L673
	.p2align 3
.L668:
	mov	x1, x21
	mov	x2, x22
	mov	x0, x20
	bl	VC1_Vfmw_ParseSMPIPicHdr
	mov	w21, w0
	b	.L673
	.p2align 3
.L696:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 2]
	b	.L662
	.p2align 3
.L698:
	strb	wzr, [x19, 3]
	mov	w0, 0
	b	.L664
	.size	VC1_Vfmw_ParseSMPPicHdr, .-VC1_Vfmw_ParseSMPPicHdr
	.align	3
.LC112:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC114:
	.xword	.LC113
	.align	3
.LC116:
	.xword	.LC115
	.align	3
.LC117:
	.xword	.L669
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC121:
	.xword	.LC120
	.align	3
.LC123:
	.xword	.LC122
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvIPicHdr
	.type	VC1_Vfmw_ParseAdvIPicHdr, %function
VC1_Vfmw_ParseAdvIPicHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x25, x1
	bl	_mcount
	add	x23, x21, 16
	mov	w1, 1
	mov	x0, x20
	add	x19, x21, 360
	bl	BsGet
	strb	w0, [x21, 360]
	ldrb	w1, [x23, 7]
	cmp	w1, 1
	beq	.L715
.L700:
	ldr	w0, [x19, 44]
	cbnz	w0, .L701
	ldrb	w1, [x23, 9]
	cmp	w1, 1
	beq	.L716
.L701:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 10]
	cbz	w22, .L709
	add	x26, x21, 188
	ldrb	w24, [x26, 10]
	uxtb	w1, w0
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L717
	strb	wzr, [x19, 3]
.L705:
	cmp	w24, 1
	beq	.L718
	strb	wzr, [x19, 11]
.L707:
	ldrb	w0, [x23, 5]
	cmp	w0, 1
	beq	.L719
.L708:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L709
	mov	x0, x20
	mov	w22, 1
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 23]
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	ldrb	w1, [x26, 7]
	cbz	w1, .L703
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L709:
	mov	w22, 0
.L703:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L717:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w24, [x26, 10]
	b	.L705
	.p2align 3
.L716:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	b	.L701
	.p2align 3
.L715:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	b	.L700
	.p2align 3
.L719:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L708
	.p2align 3
.L718:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L707
	.size	VC1_Vfmw_ParseAdvIPicHdr, .-VC1_Vfmw_ParseAdvIPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvPPicHdr
	.type	VC1_Vfmw_ParseAdvPPicHdr, %function
VC1_Vfmw_ParseAdvPPicHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x26, x1
	bl	_mcount
	add	x22, x21, 16
	mov	w1, 1
	mov	x0, x20
	add	x19, x21, 360
	bl	BsGet
	strb	w0, [x21, 360]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	beq	.L721
	ldr	w0, [x19, 44]
	cmp	w0, 2
	beq	.L721
	ldrb	w1, [x22, 9]
	cmp	w1, 1
	beq	.L757
.L723:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w23, w0
	strb	w23, [x19, 10]
	cbz	w23, .L737
	add	x24, x21, 188
	ldrb	w25, [x24, 10]
	uxtb	w1, w0
	mov	w0, w25
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w23, 8
	bls	.L758
	strb	wzr, [x19, 3]
.L727:
	cmp	w25, 1
	beq	.L759
	strb	wzr, [x19, 11]
.L729:
	ldrb	w0, [x22, 5]
	cmp	w0, 1
	beq	.L760
.L730:
	ldrb	w0, [x24, 6]
	cmp	w0, 1
	beq	.L761
.L731:
	ldr	w0, [x19, 44]
	cbz	w0, .L762
	ldrb	w0, [x24, 12]
	cmp	w0, 1
	beq	.L763
	strb	wzr, [x19, 25]
.L735:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 26]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, 1
	str	w0, [x19, 120]
	beq	.L764
.L736:
	strb	wzr, [x19, 34]
.L733:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x26
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L737
	ldr	w1, [x19, 44]
	cmp	w1, 2
	beq	.L765
.L738:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	ldr	w1, [x19, 44]
	cbnz	w1, .L739
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
.L740:
	ldr	w22, [x19, 44]
	strb	w0, [x19, 19]
	cmp	w22, 2
	beq	.L766
.L741:
	ldrb	w1, [x24, 7]
	cbnz	w1, .L767
.L743:
	ldrb	w1, [x24, 8]
	cmp	w1, 1
	beq	.L768
.L745:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L737:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L721:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	ldrb	w1, [x22, 9]
	cmp	w1, 1
	bne	.L723
.L757:
	ldr	w0, [x19, 44]
	cbnz	w0, .L723
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	b	.L723
	.p2align 3
.L739:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	b	.L740
	.p2align 3
.L758:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w25, [x24, 10]
	b	.L727
	.p2align 3
.L764:
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 17]
	b	.L736
	.p2align 3
.L762:
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmodeProgrP
	uxtb	w0, w0
	cmp	w0, 4
	strb	w0, [x19, 14]
	bne	.L733
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmode2
	strb	w0, [x19, 15]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 17]
	b	.L733
	.p2align 3
.L767:
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L743
	.p2align 3
.L759:
	mov	w1, w25
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L729
	.p2align 3
.L761:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L731
	.p2align 3
.L760:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L730
	.p2align 3
.L765:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	b	.L738
	.p2align 3
.L766:
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 28]
	ldrb	w1, [x19, 26]
	mov	w0, 0
	cmp	w1, 1
	beq	.L769
	strb	w0, [x19, 29]
	b	.L741
	.p2align 3
.L768:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L745
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L745
	.p2align 3
.L763:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L735
.L769:
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 29]
	b	.L741
	.size	VC1_Vfmw_ParseAdvPPicHdr, .-VC1_Vfmw_ParseAdvPPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvBPicHdr
	.type	VC1_Vfmw_ParseAdvBPicHdr, %function
VC1_Vfmw_ParseAdvBPicHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x25, x1
	bl	_mcount
	add	x22, x21, 16
	mov	w1, 1
	mov	x0, x20
	add	x19, x21, 360
	bl	BsGet
	strb	w0, [x21, 360]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	beq	.L771
	ldr	w2, [x19, 44]
	cmp	w2, 2
	beq	.L771
.L772:
	ldrb	w1, [x22, 9]
	cmp	w1, 1
	beq	.L812
.L773:
	cbnz	w2, .L777
	add	x1, x21, 508
	mov	x0, x20
	bl	VC1_DecBfraction
	uxtb	w0, w0
	cmp	w0, 21
	strb	w0, [x19, 2]
	beq	.L775
.L777:
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w23, w0
	strb	w23, [x19, 10]
	cbz	w23, .L775
	add	x24, x21, 188
	ldrb	w26, [x24, 10]
	uxtb	w1, w0
	mov	w0, w26
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w23, 8
	bls	.L813
	strb	wzr, [x19, 3]
.L780:
	cmp	w26, 1
	beq	.L814
	strb	wzr, [x19, 11]
.L782:
	ldrb	w0, [x22, 5]
	cmp	w0, 1
	beq	.L815
.L783:
	ldr	w0, [x19, 44]
	cmp	w0, 2
	beq	.L816
.L784:
	ldrb	w0, [x24, 6]
	cmp	w0, 1
	beq	.L817
.L785:
	ldr	w0, [x19, 44]
	cbz	w0, .L818
	ldrb	w0, [x24, 12]
	cmp	w0, 1
	beq	.L819
.L789:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 120]
.L788:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L775
	ldr	w1, [x19, 44]
	cmp	w1, 2
	beq	.L820
.L790:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	ldr	w1, [x19, 44]
	cbnz	w1, .L791
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
.L792:
	ldr	w22, [x19, 44]
	strb	w0, [x19, 19]
	cmp	w22, 2
	beq	.L821
.L793:
	ldrb	w1, [x24, 7]
	cbnz	w1, .L822
.L794:
	ldrb	w1, [x24, 8]
	cmp	w1, 1
	beq	.L823
.L796:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L775:
	mov	w1, 0
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L812:
	cbnz	w2, .L777
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 9]
	ldr	w2, [x19, 44]
	b	.L773
	.p2align 3
.L771:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 8]
	ldr	w2, [x19, 44]
	b	.L772
	.p2align 3
.L791:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	b	.L792
	.p2align 3
.L813:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w26, [x24, 10]
	b	.L780
	.p2align 3
.L818:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	mov	w1, 3
	csinc	w1, w1, wzr, eq
	strb	w1, [x19, 14]
	b	.L788
	.p2align 3
.L822:
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L794
	.p2align 3
.L817:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L785
	.p2align 3
.L816:
	add	x1, x21, 508
	mov	x0, x20
	bl	VC1_DecBfraction
	strb	w0, [x19, 2]
	b	.L784
	.p2align 3
.L815:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L783
	.p2align 3
.L814:
	mov	w1, w26
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L782
	.p2align 3
.L823:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L796
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L796
	.p2align 3
.L821:
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 28]
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 29]
	b	.L793
	.p2align 3
.L820:
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	b	.L790
	.p2align 3
.L819:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L789
	.size	VC1_Vfmw_ParseAdvBPicHdr, .-VC1_Vfmw_ParseAdvBPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvFramePicHdr
	.type	VC1_Vfmw_ParseAdvFramePicHdr, %function
VC1_Vfmw_ParseAdvFramePicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x23, x1
	mov	x21, x2
	bl	_mcount
	mov	w1, 4
	mov	x0, x19
	bl	BsShow
	cmp	w0, 7
	ble	.L845
	cmp	w0, 11
	bgt	.L857
	mov	w24, 2
	mov	w1, w24
.L825:
	add	x20, x21, 360
	mov	x0, x19
	add	x22, x21, 16
	bl	BsSkip
	strb	w24, [x20, 1]
	ldrb	w0, [x23, 3545]
	strb	w0, [x23, 2]
	ldrb	w0, [x22, 8]
	cbnz	w0, .L858
.L826:
	ldrb	w0, [x22, 6]
	cbz	w0, .L827
	ldrb	w0, [x22, 7]
	cbnz	w0, .L828
	mov	w1, 2
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 6]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	ldrb	w0, [x22, 6]
	beq	.L832
.L861:
	cmp	w0, 1
	bne	.L831
	ldrb	w0, [x20, 6]
	add	w0, w0, 1
	str	w0, [x20, 144]
.L834:
	ldrb	w1, [x21, 190]
	cmp	w1, 1
	beq	.L835
.L843:
	ldrb	w0, [x20, 1]
	cmp	w0, 5
	bls	.L859
.L849:
	mov	w0, 0
	b	.L836
	.p2align 3
.L859:
	ldr	x1, .LC124
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx838
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx838:
	.section	.rodata
	.align	0
	.align	2
.L838:
	.byte	(.L841 - .Lrtx838) / 4
	.byte	(.L839 - .Lrtx838) / 4
	.byte	(.L840 - .Lrtx838) / 4
	.byte	(.L849 - .Lrtx838) / 4
	.byte	(.L841 - .Lrtx838) / 4
	.byte	(.L842 - .Lrtx838) / 4
	.text
	.p2align 3
.L857:
	cmp	w0, 13
	ble	.L847
	cmp	w0, 14
	beq	.L860
	mov	w24, 5
	mov	w1, 4
	b	.L825
	.p2align 3
.L841:
	mov	x2, x21
	mov	x1, x23
	mov	x0, x19
	bl	VC1_Vfmw_ParseAdvIPicHdr
.L836:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L827:
	mov	w0, 1
	strb	w0, [x20, 4]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	beq	.L830
.L831:
	mov	w0, 1
	str	w0, [x20, 144]
	ldrb	w1, [x21, 190]
	cmp	w1, 1
	bne	.L843
.L835:
	mov	x0, x19
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 7]
	bne	.L843
	ldr	w0, [x20, 144]
	cmp	w0, wzr
	ble	.L843
	mov	w24, 0
	.p2align 2
.L844:
	add	x22, x21, x24, sxtw 2
	mov	w1, 18
	mov	x0, x19
	add	w24, w24, 1
	bl	BsGet
	str	w0, [x22, 412]
	mov	w1, 18
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 428]
	mov	w1, 14
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 444]
	mov	w1, 14
	mov	x0, x19
	bl	BsGet
	str	w0, [x22, 460]
	ldr	w0, [x20, 144]
	cmp	w0, w24
	bgt	.L844
	b	.L843
	.p2align 3
.L830:
	mov	w0, 2
	str	w0, [x20, 144]
	b	.L834
	.p2align 3
.L845:
	mov	w24, 1
	mov	w1, w24
	b	.L825
	.p2align 3
.L858:
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	str	w0, [x20, 48]
	b	.L826
	.p2align 3
.L828:
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 4]
	mov	w1, 1
	mov	x0, x19
	bl	BsGet
	strb	w0, [x20, 5]
	ldrb	w0, [x22, 7]
	cmp	w0, 1
	ldrb	w0, [x22, 6]
	bne	.L861
.L832:
	cmp	w0, 1
	bne	.L830
	ldrb	w0, [x20, 5]
	add	w0, w0, 2
	str	w0, [x20, 144]
	b	.L834
	.p2align 3
.L839:
	mov	x2, x21
	mov	x1, x23
	mov	x0, x19
	bl	VC1_Vfmw_ParseAdvPPicHdr
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L842:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L840:
	mov	x2, x21
	mov	x1, x23
	mov	x0, x19
	bl	VC1_Vfmw_ParseAdvBPicHdr
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L847:
	mov	w24, 0
	mov	w1, 3
	b	.L825
	.p2align 3
.L860:
	mov	w24, 4
	mov	w1, w24
	b	.L825
	.size	VC1_Vfmw_ParseAdvFramePicHdr, .-VC1_Vfmw_ParseAdvFramePicHdr
	.align	3
.LC124:
	.xword	.L838
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvIFieldHdr
	.type	VC1_Vfmw_ParseAdvIFieldHdr, %function
VC1_Vfmw_ParseAdvIFieldHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x2
	mov	x25, x1
	add	x19, x21, 360
	bl	_mcount
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 10]
	cbz	w22, .L870
	add	x24, x21, 188
	ldrb	w23, [x24, 10]
	uxtb	w1, w0
	mov	w0, w23
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L876
	strb	wzr, [x19, 3]
.L866:
	cmp	w23, 1
	beq	.L877
	strb	wzr, [x19, 11]
.L868:
	ldrb	w0, [x21, 21]
	cmp	w0, 1
	beq	.L878
.L869:
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L870
	mov	x0, x20
	mov	w22, 1
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 23]
	mov	w1, w22
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	ldrb	w1, [x24, 7]
	cbz	w1, .L864
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	ldr	x25, [sp, 64]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L870:
	mov	w22, 0
.L864:
	mov	w0, w22
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L876:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w23, [x24, 10]
	b	.L866
	.p2align 3
.L878:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L869
	.p2align 3
.L877:
	mov	w1, w23
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L868
	.size	VC1_Vfmw_ParseAdvIFieldHdr, .-VC1_Vfmw_ParseAdvIFieldHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvPFieldHdr
	.type	VC1_Vfmw_ParseAdvPFieldHdr, %function
VC1_Vfmw_ParseAdvPFieldHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x23, x2
	add	x19, x23, 360
	bl	_mcount
	mov	w1, 5
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 10]
	mov	w1, 0
	cbz	w22, .L880
	add	x21, x23, 188
	ldrb	w24, [x21, 10]
	mov	w1, w22
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L907
	strb	wzr, [x19, 3]
.L882:
	cmp	w24, 1
	beq	.L908
	strb	wzr, [x19, 11]
.L884:
	ldrb	w0, [x23, 21]
	cmp	w0, 1
	beq	.L909
.L885:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	strb	w0, [x19, 32]
	cbz	w0, .L910
.L886:
	ldrb	w0, [x21, 6]
	cmp	w0, 1
	beq	.L911
.L887:
	ldrb	w0, [x21, 12]
	cmp	w0, 1
	beq	.L912
.L888:
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmodeProgrP
	uxtb	w0, w0
	cmp	w0, 4
	strb	w0, [x19, 14]
	beq	.L913
.L890:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	ldrb	w1, [x19, 32]
	cbnz	w1, .L892
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	mov	w1, 3
	strb	w0, [x19, 18]
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 19]
	ldrb	w1, [x19, 14]
	cbz	w1, .L894
.L916:
	ldrh	w0, [x19, 14]
	cmp	w0, 4
	beq	.L894
	ldrb	w1, [x21, 7]
	cbnz	w1, .L914
.L896:
	ldrb	w1, [x21, 8]
	cmp	w1, 1
	beq	.L915
.L898:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
.L880:
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L892:
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	mov	w1, 3
	strb	w0, [x19, 18]
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 19]
	ldrb	w1, [x19, 14]
	cbnz	w1, .L916
.L894:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 29]
	ldrb	w1, [x21, 7]
	cbz	w1, .L896
.L914:
	ldrb	w2, [x19, 116]
	add	x3, x23, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L896
	.p2align 3
.L907:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w24, [x21, 10]
	b	.L882
	.p2align 3
.L910:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	cmp	w0, wzr
	cset	w0, eq
	strb	w0, [x19, 33]
	b	.L886
	.p2align 3
.L913:
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmode2
	strb	w0, [x19, 15]
	mov	x0, x20
	bl	VC1_DecIntCompField
	str	w0, [x19, 128]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 16]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 17]
	ldr	w1, [x19, 128]
	cbnz	w1, .L890
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 132]
	mov	w1, 6
	mov	x0, x20
	bl	BsGet
	str	w0, [x19, 136]
	b	.L890
	.p2align 3
.L912:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L888
	.p2align 3
.L915:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L898
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L898
	.p2align 3
.L911:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L887
	.p2align 3
.L909:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L885
	.p2align 3
.L908:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L884
	.size	VC1_Vfmw_ParseAdvPFieldHdr, .-VC1_Vfmw_ParseAdvPFieldHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvBFieldHdr
	.type	VC1_Vfmw_ParseAdvBFieldHdr, %function
VC1_Vfmw_ParseAdvBFieldHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x19, x2, 360
	mov	x21, x2
	mov	x25, x1
	bl	_mcount
	mov	w0, 1
	mov	w1, 5
	strb	w0, [x19, 32]
	mov	x0, x20
	bl	BsGet
	uxtb	w22, w0
	strb	w22, [x19, 10]
	cbz	w22, .L927
	add	x23, x21, 188
	ldrb	w24, [x23, 10]
	uxtb	w1, w0
	mov	w0, w24
	bl	VC1_Vfmw_DecPQUANT
	str	w0, [x19, 116]
	cmp	w22, 8
	bls	.L939
	strb	wzr, [x19, 3]
.L921:
	cmp	w24, 1
	beq	.L940
	strb	wzr, [x19, 11]
.L923:
	ldrb	w0, [x21, 21]
	cmp	w0, 1
	beq	.L941
.L924:
	ldrb	w0, [x23, 6]
	cmp	w0, 1
	beq	.L942
.L925:
	ldrb	w0, [x23, 12]
	cmp	w0, 1
	beq	.L943
.L926:
	ldrb	w1, [x19, 116]
	mov	x0, x20
	bl	VC1_DecMvmodeInterB
	strb	w0, [x19, 14]
	mov	w3, 0
	mov	x2, x21
	mov	x1, x25
	mov	x0, x20
	bl	BPD_Drv
	cmp	w0, 1
	beq	.L927
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 27]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 18]
	mov	w1, 3
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 19]
	ldrb	w1, [x19, 14]
	cbz	w1, .L944
.L928:
	ldrb	w1, [x23, 7]
	cbnz	w1, .L945
.L929:
	ldrb	w1, [x23, 8]
	cmp	w1, 1
	beq	.L946
.L931:
	mov	x0, x20
	bl	VC1_DecTransacfrm
	strb	w0, [x19, 22]
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 24]
	mov	w1, 1
	mov	w0, w1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L927:
	mov	w1, 0
	ldr	x25, [sp, 64]
	mov	w0, w1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L939:
	mov	w1, 1
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 3]
	ldrb	w24, [x23, 10]
	b	.L921
	.p2align 3
.L945:
	ldrb	w2, [x19, 116]
	add	x3, x21, 520
	mov	x0, x20
	bl	VC1_VopDQuant
	b	.L929
	.p2align 3
.L944:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 29]
	b	.L928
	.p2align 3
.L943:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 25]
	b	.L926
	.p2align 3
.L942:
	mov	x0, x20
	bl	VC1_DecMvrange
	strb	w0, [x19, 13]
	b	.L925
	.p2align 3
.L941:
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 12]
	b	.L924
	.p2align 3
.L940:
	mov	w1, w24
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 11]
	b	.L923
	.p2align 3
.L946:
	mov	x0, x20
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 20]
	bne	.L931
	mov	w1, 2
	mov	x0, x20
	bl	BsGet
	strb	w0, [x19, 21]
	b	.L931
	.size	VC1_Vfmw_ParseAdvBFieldHdr, .-VC1_Vfmw_ParseAdvBFieldHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvFieldPicHdr
	.type	VC1_Vfmw_ParseAdvFieldPicHdr, %function
VC1_Vfmw_ParseAdvFieldPicHdr:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x1
	mov	x21, x0
	mov	x0, x30
	mov	x22, x2
	bl	_mcount
	ldrb	w0, [x20, 8]
	cbz	w0, .L948
	add	x0, x20, 20480
	ldr	w0, [x0, 3868]
	cbnz	w0, .L948
	add	x19, x22, 360
	ldr	w0, [x19, 156]
	strb	w0, [x19, 1]
	ldrb	w0, [x20, 3545]
	strb	w0, [x20, 2]
.L967:
	ldrb	w0, [x19, 1]
	cmp	w0, 4
	bls	.L988
.L976:
	ldrb	w1, [x19, 4]
	mov	w0, 0
	cbz	w1, .L974
.L993:
	ldrb	w1, [x20, 8]
	cmp	w1, wzr
	cset	w1, ne
	strb	w1, [x19, 41]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L948:
	mov	w1, 3
	mov	x0, x21
	add	x19, x22, 360
	add	x23, x22, 16
	bl	BsGet
	sbfiz	x1, x0, 3, 32
	ldr	x2, .LC125
	str	w0, [x19, 124]
	add	x0, x2, x1
	ldr	w1, [x2, x1]
	ldr	w0, [x0, 4]
	stp	w1, w0, [x19, 152]
	uxtb	w1, w1
	ldrb	w2, [x20, 8]
	uxtb	w0, w0
	cmp	w2, wzr
	csel	w0, w0, w1, ne
	strb	w0, [x19, 1]
	ldrb	w0, [x20, 3545]
	strb	w0, [x20, 2]
	ldrb	w0, [x23, 8]
	cbnz	w0, .L989
	ldrb	w0, [x23, 6]
	cbnz	w0, .L990
.L953:
	mov	w0, 1
	strb	w0, [x19, 4]
	ldrb	w0, [x23, 7]
	cmp	w0, 1
	beq	.L956
.L957:
	mov	w0, 1
	str	w0, [x19, 144]
.L960:
	add	x23, x22, 188
	ldrb	w1, [x23, 2]
	cmp	w1, 1
	beq	.L961
.L964:
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x22, 360]
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 8]
	ldrb	w0, [x23, 3]
	cmp	w0, 1
	beq	.L991
.L963:
	ldr	w0, [x19, 124]
	cmp	w0, 3
	ble	.L967
.L968:
	add	x1, x22, 508
	mov	x0, x21
	bl	VC1_DecBfraction
	strb	w0, [x19, 2]
	ldrb	w0, [x19, 1]
	cmp	w0, 4
	bhi	.L976
	.p2align 2
.L988:
	ldr	x1, .LC126
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx971
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx971:
	.section	.rodata
	.align	0
	.align	2
.L971:
	.byte	(.L970 - .Lrtx971) / 4
	.byte	(.L972 - .Lrtx971) / 4
	.byte	(.L973 - .Lrtx971) / 4
	.byte	(.L976 - .Lrtx971) / 4
	.byte	(.L970 - .Lrtx971) / 4
	.text
	.p2align 3
.L990:
	ldrb	w0, [x23, 7]
	cbz	w0, .L992
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 4]
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 5]
.L955:
	ldrb	w0, [x23, 7]
	cmp	w0, 1
	ldrb	w0, [x23, 6]
	beq	.L958
	cmp	w0, 1
	bne	.L957
	ldrb	w0, [x19, 6]
	add	w0, w0, 1
	str	w0, [x19, 144]
	b	.L960
	.p2align 3
.L973:
	mov	x2, x22
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvBFieldHdr
.L969:
	ldrb	w1, [x19, 4]
	cbnz	w1, .L993
.L974:
	ldrb	w1, [x20, 8]
	cmp	w1, 1
	cset	w1, ne
	strb	w1, [x19, 41]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L972:
	mov	x2, x22
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvPFieldHdr
	b	.L969
	.p2align 3
.L970:
	mov	x2, x22
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvIFieldHdr
	b	.L969
	.p2align 3
.L989:
	mov	w1, 8
	mov	x0, x21
	bl	BsGet
	str	w0, [x19, 48]
	ldrb	w0, [x23, 6]
	cbz	w0, .L953
	b	.L990
	.p2align 3
.L992:
	mov	w1, 2
	mov	x0, x21
	bl	BsGet
	strb	w0, [x19, 6]
	b	.L955
	.p2align 3
.L991:
	ldr	w0, [x19, 124]
	cmp	w0, 3
	bgt	.L968
	mov	x0, x21
	bl	VC1_DecRefdist
	strb	w0, [x19, 31]
	b	.L963
	.p2align 3
.L956:
	mov	w0, 2
	str	w0, [x19, 144]
	b	.L960
	.p2align 3
.L958:
	cmp	w0, 1
	bne	.L956
	ldrb	w0, [x19, 5]
	add	w0, w0, 2
	str	w0, [x19, 144]
	b	.L960
	.p2align 3
.L961:
	mov	x0, x21
	bl	BsGet
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 7]
	bne	.L964
	ldr	w0, [x19, 144]
	cmp	w0, wzr
	ble	.L964
	mov	w25, 0
	.p2align 2
.L965:
	add	x24, x22, x25, sxtw 2
	mov	w1, 18
	mov	x0, x21
	add	w25, w25, 1
	bl	BsGet
	str	w0, [x24, 412]
	mov	w1, 18
	mov	x0, x21
	bl	BsGet
	str	w0, [x24, 428]
	mov	w1, 14
	mov	x0, x21
	bl	BsGet
	str	w0, [x24, 444]
	mov	w1, 14
	mov	x0, x21
	bl	BsGet
	str	w0, [x24, 460]
	ldr	w0, [x19, 144]
	cmp	w0, w25
	bgt	.L965
	b	.L964
	.size	VC1_Vfmw_ParseAdvFieldPicHdr, .-VC1_Vfmw_ParseAdvFieldPicHdr
	.align	3
.LC125:
	.xword	.LANCHOR1
	.align	3
.LC126:
	.xword	.L971
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvPicHdr
	.type	VC1_Vfmw_ParseAdvPicHdr, %function
VC1_Vfmw_ParseAdvPicHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	mov	x20, x2
	bl	_mcount
	add	x2, x19, 20480
	add	x0, x19, 36864
	ldr	w1, [x2, 3784]
	str	w1, [x0, 1904]
	lsl	w4, w1, 4
	ldr	w3, [x2, 3788]
	str	w3, [x0, 1908]
	str	w4, [x0, 1896]
	lsl	w4, w3, 4
	mul	w1, w1, w3
	str	w1, [x0, 1912]
	str	w4, [x0, 1900]
	ldrb	w0, [x19, 8]
	cbz	w0, .L995
	ldr	w0, [x2, 3868]
	cbz	w0, .L1005
.L995:
	ldrb	w23, [x20, 23]
	cmp	w23, 1
	beq	.L1006
	mov	w1, 0
	mov	w0, 0
.L997:
	str	w0, [x20, 404]
	mov	x2, x20
	cbz	w1, .L1007
.L999:
	mov	x1, x19
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvFieldPicHdr
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1005:
	ldr	w1, [x20, 404]
	mov	x2, x20
	and	w1, w1, -3
	cbnz	w1, .L999
.L1007:
	mov	x1, x19
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvFramePicHdr
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1006:
	mov	w1, 2
	mov	x0, x21
	bl	BsShow
	cmp	w0, 1
	mov	w22, w0
	ble	.L1008
	mov	w1, 2
	mov	x0, x21
	bl	BsSkip
	and	w1, w22, -3
	mov	w0, w22
	b	.L997
	.p2align 3
.L1008:
	mov	w1, w23
	mov	x0, x21
	bl	BsSkip
	mov	w1, 0
	mov	w0, 0
	b	.L997
	.size	VC1_Vfmw_ParseAdvPicHdr, .-VC1_Vfmw_ParseAdvPicHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvSlcHdr
	.type	VC1_Vfmw_ParseAdvSlcHdr, %function
VC1_Vfmw_ParseAdvSlcHdr:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x1
	mov	x21, x2
	bl	_mcount
	add	x2, x22, 20480
	mov	w1, 9
	mov	x0, x20
	ldr	w19, [x2, 3868]
	bl	BsGet
	mov	w1, 1
	uxtw	x19, w19
	lsl	x2, x19, 2
	sub	x19, x2, x19
	add	x19, x21, x19, lsl 2
	str	w0, [x19, 540]
	mov	x0, x20
	bl	BsGet
	sxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 536]
	beq	.L1012
	mov	w0, 1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1012:
	add	x19, x22, 4096
	add	x4, x21, 188
	add	x3, x19, 2884
	mov	x2, 172
	add	x23, x19, 2696
	ldp	x0, x1, [x4]
	stp	x0, x1, [x3]
	add	x1, x21, 16
	add	x0, x19, 2712
	ldp	x6, x7, [x4, 16]
	stp	x6, x7, [x3, 16]
	ldp	x6, x7, [x4, 32]
	stp	x6, x7, [x3, 32]
	ldr	x5, [x21, 236]
	str	x5, [x3, 48]
	ldr	w4, [x21, 244]
	str	w4, [x22, 7036]
	bl	memcpy
	add	x1, x21, 360
	mov	x2, 176
	add	x0, x19, 3056
	bl	memcpy
	mov	x2, x23
	mov	x1, x22
	mov	x0, x20
	bl	VC1_Vfmw_ParseAdvPicHdr
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	VC1_Vfmw_ParseAdvSlcHdr, .-VC1_Vfmw_ParseAdvSlcHdr
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_ClearCurPacket
	.type	VC1_ClearCurPacket, %function
VC1_ClearCurPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	w20, w0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 36]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
	ldrsb	w0, [x19, 16]
	cmp	w0, 1
	beq	.L1014
	ldr	w1, [x19, 40]
	mov	w0, w20
	bl	SM_ReleaseStreamSeg
.L1014:
	ldr	x3, .LC127
	mov	x2, 48
	mov	w1, 0
	mov	x0, x19
	ldr	x3, [x3, 96]
	blr	x3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_ClearCurPacket, .-VC1_ClearCurPacket
	.align	3
.LC127:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_ClearCurPic
	.type	VC1_ClearCurPic, %function
VC1_ClearCurPic:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	mov	w23, w1
	bl	_mcount
	ldrsb	w0, [x22, 3104]
	cbz	w0, .L1019
	add	x24, x22, 20480
	mov	w20, 0
	ldr	w0, [x24, 3868]
	cbnz	w0, .L1029
	b	.L1018
	.p2align 3
.L1022:
	ldr	w0, [x24, 3868]
	cmp	w0, w20
	bls	.L1018
.L1029:
	sxtw	x19, w20
	mov	w0, w23
	lsl	x1, x19, 3
	add	w20, w20, 1
	sub	x19, x1, x19
	add	x19, x22, x19, lsl 3
	add	x21, x19, 20480
	ldr	w1, [x21, 3920]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 24360]
	cbz	x0, .L1022
	ldr	w0, [x21, 3908]
	cbz	w0, .L1022
	ldr	w1, [x21, 3924]
	mov	w0, w23
	bl	SM_ReleaseStreamSeg
	ldr	w0, [x24, 3868]
	cmp	w0, w20
	bhi	.L1029
.L1018:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1019:
	add	x1, x22, 36864
	mov	w0, w23
	add	x1, x1, 1832
	bl	VC1_ClearCurPacket
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	VC1_ClearCurPic, .-VC1_ClearCurPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_VDMPostProc
	.type	VC1DEC_VDMPostProc, %function
VC1DEC_VDMPostProc:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 53248
	mov	w22, w1
	add	x20, x21, 12288
	bl	_mcount
	add	x0, x20, 2504
	ldr	w1, [x19, 1024]
	add	x25, x0, 20480
	bl	VC1_ClearCurPic
	ldr	w1, [x25, 3860]
	ldr	w0, [x19, 1024]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	ldr	w1, [x25, 3856]
	ldr	w0, [x19, 1024]
	bl	FSP_GetFsImagePtr
	mov	x24, x0
	ldr	w1, [x25, 3852]
	ldr	w0, [x19, 1024]
	bl	FSP_GetFsImagePtr
	cbz	x23, .L1067
	tbnz	w22, #31, .L1053
	mov	w0, 100
	cmp	w22, w0
	csel	w22, w22, w0, le
.L1036:
	mov	x0, x21
	str	w22, [x23, 184]
	bl	VC1_SetImgFormat
	ldrsb	w1, [x20, 2507]
	cmp	w1, 3
	beq	.L1068
	str	xzr, [x23, 600]
	str	xzr, [x23, 608]
	ldr	x0, [x21]
	ldr	w0, [x0, 12]
	cmp	w0, 1
	beq	.L1038
.L1073:
	add	x1, x20, 2504
	ldrb	w0, [x1, 2]
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cbz	w0, .L1039
	add	x1, x1, 20480
	ldr	w2, [x1, 3848]
	cmp	w2, 1
	bls	.L1054
	ldr	w1, [x1, 3852]
.L1040:
	add	x0, x20, 2504
	cmp	w2, 1
	add	x0, x0, 20480
	cset	w22, hi
	str	w1, [x0, 3864]
.L1041:
	add	x24, x20, 2504
	cmn	w1, #1
	add	x0, x24, 36864
	ldr	w2, [x0, 1824]
	add	w2, w2, 1
	str	w2, [x0, 1824]
	beq	.L1042
.L1072:
	ldr	w0, [x19, 1024]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L1069
	ldr	w2, [x0, 184]
	cbz	w2, .L1044
	ldr	x0, [x21]
	ldr	w3, [x0, 4]
	cmp	w2, w3
	bhi	.L1045
.L1044:
	add	x24, x20, 2504
	ldr	w0, [x19, 1024]
	add	x25, x24, 20480
	ldr	w26, [x25, 3864]
	mov	w1, w26
	bl	FSP_GetRef
	mov	w3, w0
	ldr	x1, .LC133
	mov	w2, w26
	mov	w0, 12
	bl	dprint_vfmw
	ldr	w0, [x19, 1024]
	mov	w2, 1
	ldr	w1, [x25, 3864]
	bl	FSP_SetDisplay
	cbnz	w22, .L1070
	ldr	x1, [x24, 24232]
	mov	w2, 1
	mov	w0, 2
	strb	w2, [x1, 1]
	strb	w0, [x24, 1]
.L1047:
	ldr	w0, [x19, 1024]
	mov	x4, x23
	add	x3, x19, 416
	mov	x2, x21
	mov	w1, 1
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L1048
	ldr	w0, [x19, 1024]
	add	x20, x20, 2504
	ldr	x1, [x23, 600]
	bl	FreeUsdByDec
	str	xzr, [x23, 600]
	ldr	x1, [x23, 608]
	ldr	w0, [x19, 1024]
	bl	FreeUsdByDec
	str	xzr, [x23, 608]
	add	x0, x20, 20480
	mov	w2, 0
	ldr	w1, [x0, 3864]
	ldr	w0, [x19, 1024]
	bl	FSP_SetDisplay
	cbnz	w22, .L1071
	ldr	x1, [x20, 24232]
	mov	w0, 0
	strb	wzr, [x1, 1]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1039:
	add	x2, x1, 20480
	ldr	w1, [x2, 3860]
	str	w1, [x2, 3864]
	cbz	x24, .L1055
	ldr	x0, [x23, 640]
	mov	w22, 0
	ldr	x3, [x24, 640]
	cmp	x3, x0
	bge	.L1041
	str	x3, [x23, 640]
	str	x0, [x24, 640]
	add	x24, x20, 2504
	add	x0, x24, 36864
	ldr	w1, [x2, 3864]
	ldr	w2, [x0, 1824]
	cmn	w1, #1
	add	w2, w2, 1
	str	w2, [x0, 1824]
	bne	.L1072
	.p2align 2
.L1042:
	mov	w0, 1
.L1035:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1068:
	ldrb	w0, [x20, 2513]
	cmp	w0, 1
	bne	.L1042
	str	xzr, [x23, 600]
	str	xzr, [x23, 608]
	ldr	x0, [x21]
	ldr	w0, [x0, 12]
	cmp	w0, 1
	bne	.L1073
	.p2align 2
.L1038:
	add	x0, x20, 2504
	mov	w22, 0
	add	x0, x0, 20480
	ldr	w1, [x0, 3860]
	str	w1, [x0, 3864]
	b	.L1041
	.p2align 3
.L1053:
	mov	w22, 0
	b	.L1036
	.p2align 3
.L1048:
	add	x20, x20, 2504
	ldrsb	w22, [x20, 1]
	cmp	w22, 3
	beq	.L1074
	cmp	w22, 1
	beq	.L1075
	cmp	w22, 2
	bne	.L1042
	ldr	x1, [x20, 24232]
	strb	wzr, [x1, 1]
	strb	wzr, [x20, 1]
	b	.L1035
	.p2align 3
.L1070:
	ldr	x0, [x24, 24248]
	strb	w22, [x0, 1]
	strb	w22, [x24, 1]
	b	.L1047
	.p2align 3
.L1045:
	ldr	x1, .LC135
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 1024]
	ldr	x1, [x23, 600]
	bl	FreeUsdByDec
	str	xzr, [x23, 600]
	ldr	x1, [x23, 608]
	ldr	w0, [x19, 1024]
	bl	FreeUsdByDec
	str	xzr, [x23, 608]
	add	x0, x24, 20480
	mov	w2, 0
	ldr	w1, [x0, 3864]
	ldr	w0, [x19, 1024]
	bl	FSP_SetDisplay
	cbnz	w22, .L1076
	ldr	x1, [x24, 24232]
	mov	w0, 1
	strb	wzr, [x1, 1]
	b	.L1035
	.p2align 3
.L1054:
	mov	w1, -1
	b	.L1040
	.p2align 3
.L1071:
	ldr	x1, [x20, 24248]
	mov	w0, 0
	strb	wzr, [x1, 1]
	b	.L1035
	.p2align 3
.L1075:
	ldr	x1, [x20, 24248]
	mov	w0, w22
	strb	wzr, [x1, 1]
	strb	wzr, [x20, 1]
	b	.L1035
	.p2align 3
.L1074:
	ldr	x0, [x20, 24240]
	strb	wzr, [x0, 1]
	strb	wzr, [x20, 1]
	b	.L1042
	.p2align 3
.L1067:
	ldr	x1, .LC129
	mov	x4, x0
	mov	x3, x24
	mov	x2, 0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1035
	.p2align 3
.L1055:
	mov	w22, 0
	b	.L1041
	.p2align 3
.L1069:
	ldr	x1, .LC131
	mov	w2, 736
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1035
	.p2align 3
.L1076:
	ldr	x1, [x24, 24248]
	mov	w0, w22
	strb	wzr, [x1, 1]
	b	.L1035
	.size	VC1DEC_VDMPostProc, .-VC1DEC_VDMPostProc
	.align	3
.LC129:
	.xword	.LC128
	.align	3
.LC131:
	.xword	.LC130
	.align	3
.LC133:
	.xword	.LC132
	.align	3
.LC135:
	.xword	.LC134
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_DecodeArbiter
	.type	VC1_Vfmw_DecodeArbiter, %function
VC1_Vfmw_DecodeArbiter:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 12288
	bl	_mcount
	add	x3, x19, 2504
	ldrb	w0, [x19, 2504]
	tbz	x0, 4, .L1130
	mov	w2, -21
	add	x1, x3, 36864
	and	w0, w0, w2
	strb	w0, [x19, 2504]
	ldr	w0, [x1, 1956]
	sub	w0, w0, #2
	cmp	w0, 1
	ldr	x0, [x20]
	bls	.L1080
	add	x3, x3, 20480
	ldr	w2, [x0, 8]
	ldr	w3, [x3, 3848]
.L1081:
	add	x0, x19, 2504
	sub	w1, w2, #1
	add	x0, x0, 36864
	cmp	w1, 3
	str	w2, [x0, 1956]
	bls	.L1132
.L1108:
	mov	w4, 1
	.p2align 2
.L1087:
	cbz	w3, .L1098
.L1097:
	cmp	w3, 1
	bls	.L1133
.L1101:
	cbz	w4, .L1100
	add	x19, x19, 2504
	add	x20, x20, 16384
	ldrsb	w0, [x19, 3104]
	cbnz	w0, .L1103
	add	x1, x20, 1592
	add	x19, x19, 8192
	add	x0, x19, 2048
	add	x20, x20, 1840
	add	x19, x19, 2456
	ldp	x2, x3, [x1]
	stp	x2, x3, [x0, 160]
	mov	w0, 1
	ldp	x2, x3, [x20]
	stp	x2, x3, [x19]
	ldp	x2, x3, [x20, 16]
	stp	x2, x3, [x19, 16]
	ldp	x2, x3, [x20, 32]
	stp	x2, x3, [x19, 32]
	ldp	x2, x3, [x20, 48]
	stp	x2, x3, [x19, 48]
	ldp	x2, x3, [x20, 64]
	stp	x2, x3, [x19, 64]
	ldp	x2, x3, [x20, 80]
	stp	x2, x3, [x19, 80]
	ldp	x2, x3, [x20, 96]
	stp	x2, x3, [x19, 96]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1129:
	ldr	x0, [x20]
	ldr	w1, [x0, 8]
	add	x0, x19, 2504
	add	x0, x0, 36864
	sub	w2, w1, #1
	cmp	w2, 3
	str	w1, [x0, 1956]
	bls	.L1134
	mov	w4, 1
	.p2align 2
.L1098:
	ldrb	w0, [x19, 2506]
	sub	w2, w0, #1
	sub	w1, w0, #4
	uxtb	w2, w2
	uxtb	w1, w1
	cmp	w2, 1
	ccmp	w1, 1, 0, hi
	bls	.L1104
.L1099:
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cbnz	w0, .L1101
	ldr	x1, .LC142
	mov	w0, 1
	bl	dprint_vfmw
	.p2align 2
.L1100:
	add	x20, x20, 53248
	add	x0, x19, 2504
	ldr	w1, [x20, 1024]
	bl	VC1_ClearCurPic
	ldr	x0, .LC144
	ldr	x4, [x0]
	cbz	x4, .L1130
	ldr	w0, [x20, 1024]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L1130:
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1132:
	ldr	x0, .LC138
	ldrb	w0, [x0,w1,uxtw]
	adr	x1, .Lrtx1089
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1089:
	.section	.rodata
	.align	0
	.align	2
.L1089:
	.byte	(.L1088 - .Lrtx1089) / 4
	.byte	(.L1090 - .Lrtx1089) / 4
	.byte	(.L1091 - .Lrtx1089) / 4
	.byte	(.L1092 - .Lrtx1089) / 4
	.text
	.p2align 3
.L1080:
	ldr	w2, [x0, 8]
	cmp	w2, 1
	ccmp	w2, 4, 4, hi
	beq	.L1082
	add	x3, x3, 20480
	ldr	w3, [x3, 3848]
	b	.L1081
	.p2align 3
.L1091:
	mov	w4, 0
	b	.L1087
	.p2align 3
.L1090:
	ldrb	w0, [x19, 2506]
	cmp	w0, wzr
	cset	w4, eq
	b	.L1087
	.p2align 3
.L1092:
	add	x0, x19, 2504
	ldrb	w1, [x0, 2]
	cbnz	w1, .L1093
	add	x0, x0, 36864
	mov	w4, 1
	str	wzr, [x0, 1888]
	b	.L1087
	.p2align 3
.L1088:
	ldrb	w0, [x19, 2506]
	sub	w0, w0, #2
	and	w0, w0, -3
	uxtb	w0, w0
	cmp	w0, wzr
	cset	w4, ne
	b	.L1087
	.p2align 3
.L1093:
	cmp	w1, 2
	bne	.L1095
	add	x0, x0, 36864
	ldr	w0, [x0, 1888]
	cbnz	w0, .L1108
	mov	w4, 0
	cbnz	w3, .L1097
	.p2align 2
.L1104:
	ldr	x1, .LC140
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1100
	.p2align 3
.L1103:
	add	x21, x19, 8192
	add	x1, x20, 1608
	mov	x2, 172
	add	x0, x21, 2224
	bl	memcpy
	add	x4, x20, 1780
	add	x3, x21, 2396
	mov	x2, 176
	ldp	x0, x1, [x4]
	stp	x0, x1, [x3]
	add	x1, x20, 1952
	add	x0, x21, 2568
	ldp	x6, x7, [x4, 16]
	stp	x6, x7, [x3, 16]
	ldp	x6, x7, [x4, 32]
	stp	x6, x7, [x3, 32]
	ldr	x5, [x4, 48]
	str	x5, [x3, 48]
	ldr	w4, [x20, 1836]
	str	w4, [x19, 10644]
	bl	memcpy
	ldr	w0, [x20, 1996]
	add	x3, x19, 20480
	strb	w0, [x19, 4]
	add	x1, x20, 2128
	ldr	x2, .LC143
	add	x0, x21, 2744
	ldr	w3, [x3, 3868]
	ldr	x4, [x2, 104]
	lsl	x2, x3, 2
	sub	x2, x2, x3
	lsl	x2, x2, 2
	blr	x4
	ldr	x23, [sp, 48]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1095:
	and	w1, w1, -5
	uxtb	w1, w1
	cmp	w1, 1
	bne	.L1108
	add	x0, x0, 36864
	mov	w4, w1
	str	w1, [x0, 1888]
	cbz	w3, .L1104
	b	.L1097
	.p2align 3
.L1082:
	ldr	x1, .LC137
	add	x21, x3, 20480
	mov	w0, 2
	add	x23, x20, 53248
	bl	dprint_vfmw
	ldr	w1, [x21, 3856]
	ldr	w0, [x23, 1024]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L1083
	ldr	w0, [x23, 1024]
	ldr	x1, [x22, 600]
	bl	FreeUsdByDec
	ldr	w0, [x23, 1024]
	ldr	x1, [x22, 608]
	bl	FreeUsdByDec
	ldr	w0, [x23, 1024]
	ldr	x1, [x22, 616]
	bl	FreeUsdByDec
	ldr	w0, [x23, 1024]
	ldr	x1, [x22, 624]
	bl	FreeUsdByDec
	add	x0, x22, 512
	mov	w2, 1
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	ldr	w1, [x21, 3856]
	ldr	w0, [x23, 1024]
	bl	FSP_ClearLogicFs
	ldr	w1, [x21, 3852]
	mov	w2, 1
	ldr	w0, [x23, 1024]
	bl	FSP_ClearLogicFs
	str	wzr, [x21, 3852]
	str	wzr, [x21, 3856]
	ldr	w0, [x23, 1024]
	bl	FSP_GetNullLogicFs
	str	w0, [x21, 3852]
	str	w0, [x21, 3856]
.L1083:
	add	x0, x19, 2504
	add	x1, x0, 20480
	str	wzr, [x1, 3848]
	ldr	x2, [x0, 24240]
	cbz	x2, .L1129
	ldr	x3, [x0, 24248]
	cbz	x3, .L1129
	strb	wzr, [x2, 1]
	ldr	x2, [x0, 24248]
	strb	wzr, [x2, 1]
	ldr	x2, [x0, 24240]
	strb	wzr, [x2]
	ldr	x0, [x0, 24248]
	strb	wzr, [x0]
	ldr	x0, [x20]
	ldr	w3, [x1, 3848]
	ldr	w2, [x0, 8]
	b	.L1081
.L1134:
	ldr	x0, .LC145
	mov	w3, 0
	ldrh	w0, [x0,w2,uxtw #1]
	adr	x1, .Lrtx1107
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx1107:
	.section	.rodata
	.align	0
	.align	2
.L1107:
	.2byte	(.L1088 - .Lrtx1107) / 4
	.2byte	(.L1090 - .Lrtx1107) / 4
	.2byte	(.L1091 - .Lrtx1107) / 4
	.2byte	(.L1092 - .Lrtx1107) / 4
	.text
.L1133:
	ldrb	w0, [x19, 2506]
	b	.L1099
	.size	VC1_Vfmw_DecodeArbiter, .-VC1_Vfmw_DecodeArbiter
	.align	3
.LC137:
	.xword	.LC136
	.align	3
.LC138:
	.xword	.L1089
	.align	3
.LC140:
	.xword	.LC139
	.align	3
.LC142:
	.xword	.LC141
	.align	3
.LC143:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC144:
	.xword	g_event_report
	.align	3
.LC145:
	.xword	.L1107
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_StartDecode
	.type	VC1_Vfmw_StartDecode, %function
VC1_Vfmw_StartDecode:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 16
	add	x22, x20, 12288
	bl	_mcount
	add	x21, x22, 2504
	ldr	x0, [x20]
	ldr	w1, [x0, 592]
	str	w1, [x19, 14596]
	ldr	w0, [x0, 632]
	str	w0, [x19, 14600]
	ldrsb	w0, [x21, 3104]
	cbz	w0, .L1150
.L1136:
	mov	x1, x19
	mov	x0, x20
	add	x23, x22, 2504
	bl	VC1_WritePicMsg
	add	x2, x23, 20480
	ldr	x3, .LC146
	add	x1, x2, 3872
	add	x0, x20, 104
	ldr	w2, [x2, 3868]
	strb	w2, [x19, 74]
	uxtw	x2, w2
	ldr	x4, [x3, 104]
	lsl	x3, x2, 3
	sub	x2, x3, x2
	lsl	x2, x2, 3
	blr	x4
	mov	x0, x21
	mov	x1, x19
	bl	VC1_CfgVDH
	ldrb	w0, [x22, 2506]
	cmp	w0, 1
	bls	.L1151
.L1137:
	cmp	w0, 5
	beq	.L1152
	strb	wzr, [x19, 1]
	add	x23, x22, 2504
	ldrsb	w1, [x22, 2508]
	ldrb	w0, [x22, 2512]
	strb	w1, [x20, 16]
	strb	w1, [x23, 3]
	strb	w0, [x23, 9]
	ldrb	w1, [x19, 3]
	cmp	w1, 2
	beq	.L1153
.L1140:
	and	w0, w1, -5
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L1141
	add	x23, x23, 36864
	str	w0, [x23, 1888]
.L1141:
	ldr	x2, [x20]
	str	x19, [x20, 8]
	ldr	w0, [x2, 864]
	cmp	w0, 1
	beq	.L1154
	cmp	w0, 2
	beq	.L1155
.L1145:
	mov	w0, 1
.L1142:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1155:
	ldr	w0, [x2, 868]
	cmp	w0, wzr
	ccmp	x19, xzr, 4, gt
	beq	.L1145
	sub	w1, w1, #2
	mov	w0, 1
	and	w1, w1, -3
	uxtb	w1, w1
	cbnz	w1, .L1142
	ldr	x1, [x22, 26736]
	add	x3, x20, 53248
	mov	x0, x21
	strb	wzr, [x1, 1]
	ldr	x2, [x20]
	ldr	w1, [x2, 868]
	sub	w1, w1, #1
	str	w1, [x2, 868]
	ldr	w1, [x3, 1024]
	bl	VC1_ClearCurPic
	str	xzr, [x20, 8]
	mov	w0, 0
	b	.L1142
	.p2align 3
.L1152:
	mov	w3, 1
	strb	w3, [x19, 1]
	add	x2, x22, 2504
	strb	w3, [x22, 2512]
	ldrsb	w1, [x22, 2509]
	add	x4, x2, 36864
	strb	w1, [x22, 2508]
	add	x23, x22, 2504
	mov	w0, 1
	ldr	w2, [x4, 1912]
	sub	w2, w2, #1
	str	w2, [x19, 14504]
	strb	w1, [x20, 16]
	strb	w1, [x23, 3]
	strb	w0, [x23, 9]
	ldrb	w1, [x19, 3]
	cmp	w1, 2
	bne	.L1140
.L1153:
	add	x24, x23, 36864
	ldr	w0, [x24, 1888]
	cbnz	w0, .L1141
	add	x1, x20, 53248
	mov	x0, x21
	ldr	w1, [x1, 1024]
	bl	VC1_ClearCurPic
	ldr	x1, [x23, 24232]
	mov	w0, 0
	strb	wzr, [x1]
	ldr	w1, [x24, 1892]
	add	w1, w1, 1
	str	w1, [x24, 1892]
	str	xzr, [x20, 8]
	b	.L1142
	.p2align 3
.L1151:
	ldrb	w1, [x22, 2508]
	strb	w1, [x22, 2509]
	b	.L1137
	.p2align 3
.L1154:
	cbz	x19, .L1142
	sub	w1, w1, #2
	and	w1, w1, -3
	uxtb	w1, w1
	cbnz	w1, .L1142
	ldr	x2, [x22, 26736]
	add	x1, x20, 53248
	mov	x0, x21
	strb	wzr, [x2, 1]
	ldr	w1, [x1, 1024]
	bl	VC1_ClearCurPic
	str	xzr, [x20, 8]
	mov	w0, 0
	b	.L1142
	.p2align 3
.L1150:
	mov	x0, x21
	bl	VC1_Vfmw_UpdataLastPicRNDCTRL.part.5
	b	.L1136
	.size	VC1_Vfmw_StartDecode, .-VC1_Vfmw_StartDecode
	.align	3
.LC146:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseAdvHdr
	.type	VC1_Vfmw_ParseAdvHdr, %function
VC1_Vfmw_ParseAdvHdr:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	w24, w2
	mov	x25, x1
	bl	_mcount
	add	x22, x20, 36864
	ldr	x21, [x20, 3136]
	mov	w1, 32
	strb	wzr, [x20, 6]
	add	x23, x22, 1832
	mov	x0, x21
	bl	BsGet
	ldr	x19, [x22, 1832]
	ldr	w3, [x21, 32]
	uxtb	w26, w0
	ldr	w2, [x23, 28]
	mov	x0, x21
	lsr	w3, w3, 3
	add	x19, x19, x3
	sub	w2, w2, w3
	mov	x1, x19
	bl	BsInit
	sub	w0, w26, #10
	cmp	w0, 5
	bhi	.L1157
	cmp	w26, 11
	beq	.L1227
	ldrb	w1, [x20]
	and	w2, w1, 7
	cmp	w2, 7
	beq	.L1228
	add	x27, x20, 20480
	strb	wzr, [x20, 8]
	ldr	x2, .LC154
	str	wzr, [x27, 3868]
	ldrh	w0, [x2,w0,uxtw #1]
	adr	x2, .Lrtx1173
	add	x0, x2, w0, sxth #2
	br	x0
.Lrtx1173:
	.section	.rodata
	.align	0
	.align	2
.L1173:
	.2byte	(.L1172 - .Lrtx1173) / 4
	.2byte	(.L1189 - .Lrtx1173) / 4
	.2byte	(.L1174 - .Lrtx1173) / 4
	.2byte	(.L1191 - .Lrtx1173) / 4
	.2byte	(.L1176 - .Lrtx1173) / 4
	.2byte	(.L1177 - .Lrtx1173) / 4
	.text
	.p2align 3
.L1157:
	sub	w0, w26, #27
	cmp	w0, 4
	bls	.L1190
	cmp	w26, 254
	beq	.L1229
.L1189:
	mov	w0, w24
	mov	x1, x23
	bl	VC1_ClearCurPacket
	mov	w0, 0
.L1162:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1227:
	ldrb	w0, [x20]
	and	w0, w0, 7
	cmp	w0, 7
	bne	.L1189
	mov	x0, x21
	mov	x2, x25
	mov	x1, x20
	bl	VC1_Vfmw_ParseAdvSlcHdr
	cmp	w0, 1
	mov	w21, w0
	bne	.L1160
	add	x27, x20, 20480
	ldr	w0, [x27, 3868]
	cmp	w0, 255
	bls	.L1161
	mov	w1, w24
	mov	x0, x20
	bl	VC1_ClearCurPic
	ldr	x1, .LC148
	mov	w0, w21
	ldr	w2, [x27, 3868]
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1162
	.p2align 3
.L1229:
	mov	w1, 32
	mov	x0, x21
	bl	BsGet
	mov	w19, w0
	mov	w1, 32
	mov	x0, x21
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w19, w2
	ccmp	w0, w1, 0, eq
	bne	.L1189
	ldrb	w0, [x20]
	mov	w1, 1
	strb	w1, [x20, 7]
	and	w1, w0, 7
	cmp	w1, 7
	bne	.L1190
	add	x1, x20, 20480
	ldr	w1, [x1, 3868]
	cbz	w1, .L1190
	orr	w0, w0, 16
	strb	w0, [x20]
.L1190:
	mov	x1, x23
	mov	w0, w24
	bl	VC1_ClearCurPacket
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1191:
	ldr	x26, .LC155
.L1222:
	ldr	x3, [x26, 96]
	mov	x2, 176
	mov	w1, 0
	add	x0, x25, 360
	ldrb	w28, [x25, 391]
	blr	x3
	strb	w28, [x25, 391]
.L1178:
	ldr	x3, [x26, 96]
	add	x28, x27, 3872
	mov	x2, 14336
	mov	w1, 0
	mov	x0, x28
	blr	x3
	mov	x0, x21
	bl	BsPos
	str	w0, [x25, 500]
	mov	x2, x25
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvPicHdr
	cmp	w0, 1
	mov	w26, w0
	beq	.L1230
	mov	x1, x23
	mov	w0, w24
	bl	VC1_ClearCurPacket
	ldr	x1, .LC157
	mov	w2, 6131
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w26
	b	.L1162
	.p2align 3
.L1228:
	mov	w0, 1
	orr	w1, w1, 16
	strb	w0, [x20, 6]
	mov	w0, 1
	strb	w1, [x20]
	b	.L1162
	.p2align 3
.L1172:
	orr	w0, w1, 32
	mov	x1, x23
	strb	w0, [x20]
	mov	w0, w24
	bl	VC1_ClearCurPacket
	mov	w0, 1
	b	.L1162
	.p2align 3
.L1176:
	mov	x2, x25
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvEntptHdr
	cmp	w0, 1
	mov	w19, w0
	beq	.L1231
.L1187:
	mov	w0, w24
	mov	x1, x23
	bl	VC1_ClearCurPacket
	mov	w0, w19
	b	.L1162
	.p2align 3
.L1177:
	mov	x2, x25
	mov	x1, x20
	mov	x0, x21
	bl	VC1_Vfmw_ParseAdvSeqHdr
	cmp	w0, 1
	mov	w19, w0
	bne	.L1187
	ldrb	w0, [x20]
	orr	w0, w0, 1
	strb	w0, [x20]
	b	.L1187
	.p2align 3
.L1174:
	ldr	x26, .LC155
	mov	w0, 1
	strb	w0, [x20, 8]
	mov	x2, 16
	mov	w1, 0
	add	x0, x25, 520
	ldr	x3, [x26, 96]
	blr	x3
	ldrb	w0, [x20, 8]
	cbnz	w0, .L1178
	b	.L1222
	.p2align 3
.L1160:
	mov	x1, x23
	mov	w0, w24
	bl	VC1_ClearCurPacket
	ldr	x1, .LC153
	mov	w2, 6042
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w21
	b	.L1162
	.p2align 3
.L1230:
	mov	x0, x21
	add	x22, x22, 1832
	bl	BsPos
	ldr	w1, [x25, 500]
	sub	w0, w0, w1
	str	w0, [x25, 500]
	mov	x0, x21
	ldrb	w1, [x20]
	orr	w1, w1, 4
	strb	w1, [x20]
	bl	BsPos
	add	w0, w0, 32
	ldr	w1, [x22, 28]
	cmp	w0, w1, lsl 3
	bge	.L1180
	ldr	w3, [x27, 3868]
	add	x23, x25, 536
	ldr	x2, [x20, 3136]
	uxtw	x0, w3
	lsl	x1, x0, 3
	sub	x1, x1, x0
	lsl	x1, x1, 3
	add	x21, x28, x1
	strb	w3, [x21, 16]
	lsl	x3, x0, 2
	sub	x0, x3, x0
	add	x23, x23, x0, lsl 2
	ldr	w0, [x2, 32]
	ubfx	x0, x0, 3, 29
	add	x0, x19, x0
	str	x0, [x28, x1]
	ldr	w1, [x2, 32]
	and	w1, w1, 7
	str	w1, [x21, 24]
	ldr	w1, [x2, 24]
	ldr	w2, [x2, 32]
	lsl	w1, w1, 3
	sub	w1, w1, w2
	str	w1, [x21, 28]
	bl	MEM_Vir2Phy
	str	w0, [x21, 20]
	ldr	w0, [x22, 36]
	str	w0, [x21, 48]
	ldr	x1, [x22, 8]
	cbz	x1, .L1181
	ldr	w0, [x22, 24]
	cbz	w0, .L1181
	str	x1, [x21, 8]
	str	wzr, [x21, 40]
	ldr	w0, [x22, 32]
	lsl	w0, w0, 3
	str	w0, [x21, 44]
	ldr	w0, [x22, 24]
	str	w0, [x21, 36]
	ldr	w0, [x22, 40]
	str	w0, [x21, 52]
.L1182:
	ldr	w4, [x27, 3784]
	ldr	w0, [x27, 3788]
	ldrb	w2, [x20, 8]
	mul	w4, w0, w4
	sub	w4, w4, #1
	cbz	w2, .L1183
	add	w0, w0, 1
	ldr	w3, [x23, 4]
	add	w0, w0, w0, lsr 31
	sub	w3, w3, w0, asr 1
	str	w3, [x21, 32]
	cmp	w3, wzr
	ccmp	w4, w3, 2, gt
	bcc	.L1232
.L1166:
	ldr	w0, [x21, 28]
	cmp	w0, wzr
	ble	.L1169
	cbz	x1, .L1185
	ldr	w0, [x21, 44]
	cmp	w0, wzr
	ble	.L1169
.L1185:
	ldr	w1, [x27, 3868]
	mov	w0, 1
	add	w1, w1, w0
	str	w1, [x27, 3868]
	b	.L1162
	.p2align 3
.L1180:
	mov	x1, x23
	mov	w0, w24
	bl	VC1_ClearCurPacket
	ldr	x1, .LC157
	mov	w2, 6125
	mov	w0, w26
	bl	dprint_vfmw
	mov	w0, w26
	b	.L1162
	.p2align 3
.L1161:
	uxtw	x4, w0
	add	x3, x27, 3872
	lsl	x1, x4, 3
	ldr	x2, [x20, 3136]
	sub	x1, x1, x4
	add	x22, x25, 536
	lsl	x1, x1, 3
	add	x21, x3, x1
	strb	w0, [x21, 16]
	lsl	x0, x4, 2
	sub	x4, x0, x4
	ldr	w0, [x2, 32]
	add	x22, x22, x4, lsl 2
	ubfx	x0, x0, 3, 29
	add	x0, x19, x0
	str	x0, [x3, x1]
	ldr	w1, [x2, 32]
	and	w1, w1, 7
	str	w1, [x21, 24]
	ldr	w1, [x2, 24]
	ldr	w2, [x2, 32]
	lsl	w1, w1, 3
	sub	w1, w1, w2
	str	w1, [x21, 28]
	bl	MEM_Vir2Phy
	str	w0, [x21, 20]
	ldr	w0, [x23, 36]
	str	w0, [x21, 48]
	ldr	x1, [x23, 8]
	cbz	x1, .L1163
	ldr	w0, [x23, 24]
	cbz	w0, .L1163
	str	x1, [x21, 8]
	str	wzr, [x21, 40]
	ldr	w0, [x23, 32]
	lsl	w0, w0, 3
	str	w0, [x21, 44]
	ldr	w0, [x23, 24]
	str	w0, [x21, 36]
	ldr	w0, [x23, 40]
	str	w0, [x21, 52]
.L1164:
	ldr	w4, [x27, 3784]
	ldr	w0, [x27, 3788]
	ldrb	w2, [x20, 8]
	mul	w4, w0, w4
	sub	w4, w4, #1
	cbz	w2, .L1165
	add	w0, w0, 1
	ldr	w3, [x22, 4]
	add	w0, w0, w0, lsr 31
	sub	w3, w3, w0, asr 1
	str	w3, [x21, 32]
	cmp	w3, wzr
	ccmp	w4, w3, 2, gt
	bcs	.L1166
	ldr	x1, .LC149
	mov	w0, 1
	ldr	w2, [x22, 4]
	ldr	w4, [x27, 3788]
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1162
	.p2align 3
.L1181:
	mov	x1, 0
	str	xzr, [x21, 8]
	stp	wzr, wzr, [x21, 36]
	str	wzr, [x21, 44]
	str	wzr, [x21, 52]
	b	.L1182
.L1231:
	mov	x1, x25
	mov	x0, x20
	bl	VC1_Vfmw_UpdateAdvSPS
	ldrb	w0, [x20]
	orr	w0, w0, 2
	strb	w0, [x20]
	b	.L1187
.L1183:
	ldr	w3, [x23, 4]
	str	w3, [x21, 32]
	cmp	w4, w3
	bcs	.L1166
	ldr	x1, .LC150
	mov	w0, 1
	ldr	w2, [x23, 4]
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1162
.L1163:
	mov	x1, 0
	str	xzr, [x21, 8]
	stp	wzr, wzr, [x21, 36]
	str	wzr, [x21, 44]
	str	wzr, [x21, 52]
	b	.L1164
.L1165:
	ldr	w3, [x22, 4]
	str	w3, [x21, 32]
	cmp	w4, w3
	bcs	.L1166
	ldr	x1, .LC150
	mov	w0, 1
	ldr	w2, [x22, 4]
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1162
.L1169:
	ldr	x1, .LC151
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1162
.L1232:
	ldr	x1, .LC149
	mov	w0, 1
	ldr	w2, [x23, 4]
	ldr	w4, [x27, 3788]
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1162
	.size	VC1_Vfmw_ParseAdvHdr, .-VC1_Vfmw_ParseAdvHdr
	.align	3
.LC148:
	.xword	.LC147
	.align	3
.LC149:
	.xword	.LC101
	.align	3
.LC150:
	.xword	.LC103
	.align	3
.LC151:
	.xword	.LC105
	.align	3
.LC153:
	.xword	.LC152
	.align	3
.LC154:
	.xword	.L1173
	.align	3
.LC155:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC157:
	.xword	.LC156
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_Vfmw_ParseHeader
	.type	VC1_Vfmw_ParseHeader, %function
VC1_Vfmw_ParseHeader:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w21, w2
	bl	_mcount
	ldrsb	w0, [x19, 3104]
	cbnz	w0, .L1234
	ldrb	w3, [x19]
	mov	x2, x20
	ldr	x0, [x19, 3136]
	mov	x1, x19
	orr	w3, w3, 3
	strb	w3, [x19]
	bl	VC1_Vfmw_ParseSMPPicHdr
	cmp	w0, 1
	beq	.L1236
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1234:
	mov	w2, w21
	mov	x1, x20
	mov	x0, x19
	bl	VC1_Vfmw_ParseAdvHdr
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1236:
	ldrb	w2, [x19]
	mov	w1, 20
	orr	w1, w2, w1
	strb	w1, [x19]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	VC1_Vfmw_ParseHeader, .-VC1_Vfmw_ParseHeader
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_SetCodeInfo
	.type	VC1_SetCodeInfo, %function
VC1_SetCodeInfo:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 12288
	mov	x21, x1
	bl	_mcount
	add	x2, x19, 2504
	add	x0, x2, 3144
	str	x0, [x19, 5640]
	ldrb	w1, [x2, 3106]
	cmp	w1, 8
	beq	.L1242
	strb	wzr, [x2, 12]
	strb	w1, [x2, 11]
.L1239:
	add	x20, x19, 2504
	ldr	w2, [x21, 28]
	ldrsb	w1, [x20, 3104]
	cbz	w1, .L1243
	ldr	x1, [x21]
	bl	BsInit
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1243:
	ldr	x1, [x21]
	bl	BsInit
	ldr	w1, [x19, 5616]
	add	x2, x20, 20480
	add	x3, x20, 3120
	add	x20, x20, 3184
	adds	w4, w1, 15
	add	w0, w1, 30
	csel	w0, w0, w4, mi
	asr	w0, w0, 4
	str	w0, [x2, 3784]
	ldr	w0, [x19, 5620]
	str	w0, [x2, 3804]
	str	w1, [x2, 3800]
	add	w1, w0, 30
	adds	w0, w0, 15
	csel	w0, w1, w0, mi
	asr	w0, w0, 4
	str	w0, [x2, 3788]
	ldp	x0, x1, [x3]
	stp	x0, x1, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1242:
	mov	w3, 1
	mov	w1, 6
	strb	w3, [x2, 12]
	strb	w1, [x2, 11]
	b	.L1239
	.size	VC1_SetCodeInfo, .-VC1_SetCodeInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_ReceivePacket
	.type	VC1_ReceivePacket, %function
VC1_ReceivePacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x0, x20, 53248
	add	x1, x0, 240
	cbz	x19, .L1252
	ldr	w2, [x19, 12]
	str	w2, [x1, 20]
	ldr	x2, [x19]
	str	x2, [x0, 240]
	ldr	w2, [x19, 16]
	str	w2, [x1, 28]
	ldrb	w2, [x19, 9]
	strb	w2, [x1, 16]
	ldr	w2, [x19, 20]
	str	w2, [x1, 36]
	ldrb	w2, [x19, 9]
	cmp	w2, 1
	beq	.L1247
	ldr	w2, [x19, 92]
	str	w2, [x1, 24]
	ldr	x2, [x19, 80]
	str	x2, [x1, 8]
	ldr	w2, [x19, 96]
	str	w2, [x1, 32]
	ldrb	w2, [x19, 89]
	strb	w2, [x1, 17]
	ldr	w2, [x19, 100]
	str	w2, [x1, 40]
	ldrb	w2, [x19, 89]
	cmp	w2, 1
	bne	.L1253
.L1248:
	mov	x0, x20
	bl	VC1_SetCodeInfo
	mov	w0, 1
.L1246:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1253:
	ldr	w0, [x0, 1024]
	bl	VC1_ClearCurPacket
	ldrb	w2, [x19, 89]
	mov	w0, 1
	ldr	x1, .LC161
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1247:
	strb	wzr, [x1, 17]
	str	xzr, [x1, 8]
	str	wzr, [x1, 24]
	str	wzr, [x1, 32]
	str	wzr, [x1, 40]
	b	.L1248
	.p2align 3
.L1252:
	ldr	x1, .LC159
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L1246
	.size	VC1_ReceivePacket, .-VC1_ReceivePacket
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC161:
	.xword	.LC160
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1DEC_Decode
	.type	VC1DEC_Decode, %function
VC1DEC_Decode:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x22, x1
	add	x20, x19, 12288
	bl	_mcount
	add	x21, x20, 2344
	ldr	x3, .LC162
	mov	x2, 160
	mov	x1, x22
	mov	x0, x21
	ldr	x3, [x3, 104]
	blr	x3
	mov	x1, x21
	mov	x0, x19
	bl	VC1_ReceivePacket
	mov	w21, w0
	cbz	w0, .L1281
	ldr	x0, [x19]
	add	x22, x19, 53248
	ldr	w1, [x0, 832]
	cmp	w1, 1
	beq	.L1282
.L1257:
	ldrb	w0, [x20, 2504]
	strb	w0, [x22, 368]
.L1258:
	add	x20, x20, 2504
	add	x1, x19, 16384
	ldr	w2, [x22, 1024]
	add	x1, x1, 1592
	mov	x0, x20
	bl	VC1_Vfmw_ParseHeader
	mov	w23, w0
	cbnz	w0, .L1259
	ldr	w0, [x22, 1024]
	add	x1, x22, 240
	bl	VC1_ClearCurPacket
	ldr	x0, .LC165
	ldr	x4, [x0]
	cbz	x4, .L1261
	ldr	w0, [x22, 1024]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	mov	w21, 0
	blr	x4
.L1278:
	mov	w0, w21
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1259:
	mov	x0, x19
	bl	VC1_Vfmw_DecodeArbiter
	cbnz	w0, .L1283
.L1261:
	mov	w21, 0
.L1285:
	mov	w0, w21
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1282:
	ldr	w0, [x0, 872]
	cmp	w0, 1
	bne	.L1257
	ldrb	w0, [x22, 368]
	strb	w0, [x20, 2504]
	b	.L1258
	.p2align 3
.L1281:
	add	x19, x19, 53248
	ldr	x1, .LC164
	ldr	w2, [x19, 232]
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1283:
	mov	x0, x19
	bl	VC1_Vfmw_GetStreamInfo
	mov	w21, w0
	cbz	w0, .L1284
	mov	x0, x19
	bl	VC1_Vfmw_StartDecode
	mov	w21, w0
	cbz	w0, .L1265
	mov	w21, w23
	b	.L1278
	.p2align 3
.L1284:
	ldr	x1, .LC166
	bl	dprint_vfmw
	ldr	x0, [x19]
	ldr	w1, [x0, 832]
	cmp	w1, 1
	bne	.L1263
	ldr	w0, [x0, 872]
	cmp	w0, 1
	beq	.L1264
.L1263:
	ldr	w1, [x22, 1024]
	mov	x0, x20
	bl	VC1_ClearCurPic
.L1264:
	ldr	x0, .LC165
	ldr	x4, [x0]
	cbz	x4, .L1261
.L1279:
	ldr	w0, [x22, 1024]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	b	.L1278
	.p2align 3
.L1265:
	add	x19, x19, 36864
	ldr	w0, [x22, 1024]
	mov	w2, 1
	ldr	w1, [x19, 2268]
	bl	FSP_ClearLogicFs
	ldr	x1, [x19, 2160]
	ldr	x0, .LC165
	strb	wzr, [x1]
	ldr	x1, [x19, 2160]
	strb	wzr, [x1, 1]
	ldr	x4, [x0]
	cbnz	x4, .L1279
	mov	w21, 0
	b	.L1285
	.size	VC1DEC_Decode, .-VC1DEC_Decode
	.align	3
.LC162:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC164:
	.xword	.LC163
	.align	3
.LC165:
	.xword	g_event_report
	.align	3
.LC166:
	.xword	.LC72
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	VC1_GetPacketState
	.type	VC1_GetPacketState, %function
VC1_GetPacketState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 12288
	bl	_mcount
	mov	w0, 2
	ldrsb	w1, [x19, 2510]
	ldr	x19, [sp, 16]
	cmp	w1, 1
	csel	w0, w0, wzr, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	VC1_GetPacketState, .-VC1_GetPacketState
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	__func__.11854, %object
	.size	__func__.11854, 13
__func__.11854:
	.string	"Vc1SMPSeqHdr"
	.zero	3
.LC0:
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	2
	.word	1
	.word	2
	.word	2
	.word	3
	.word	3
	.word	3
.LC1:
	.word	3
	.word	1
	.word	2
	.word	0
	.word	4
	.zero	4
.LC2:
	.word	1
	.word	0
	.word	2
	.word	3
	.word	4
	.zero	4
.LC3:
	.word	1
	.word	1
	.word	2
	.word	1
	.word	3
	.word	1
	.word	2
	.zero	4
.LC4:
	.word	2
	.word	3
	.word	3
	.word	4
	.word	4
	.word	5
	.word	5
	.zero	4
.LC5:
	.word	3
	.word	4
	.word	1
	.word	5
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	1
	.word	3
	.word	5
	.word	7
.LC6:
	.word	5
	.word	5
	.word	6
	.word	6
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	8
	.word	8
	.word	8
	.word	8
.LC7:
	.word	256
	.word	128
	.word	85
	.word	64
	.word	51
	.word	43
	.word	37
	.word	32
	.type	__func__.12165, %object
	.size	__func__.12165, 17
__func__.12165:
	.string	"VC1_DecBfraction"
	.zero	7
	.type	aCount, %object
	.size	aCount, 128
aCount:
	.word	0
	.word	1
	.word	1
	.word	2
	.word	1
	.word	2
	.word	2
	.word	3
	.word	1
	.word	2
	.word	2
	.word	3
	.word	2
	.word	3
	.word	3
	.word	4
	.word	1
	.word	2
	.word	2
	.word	3
	.word	2
	.word	3
	.word	3
	.word	4
	.word	2
	.word	3
	.word	3
	.word	4
	.word	3
	.word	4
	.word	4
	.word	5
	.type	a2On4Off, %object
	.size	a2On4Off, 60
a2On4Off:
	.word	3
	.word	5
	.word	6
	.word	9
	.word	10
	.word	12
	.word	17
	.word	18
	.word	20
	.word	24
	.word	33
	.word	34
	.word	36
	.word	40
	.word	48
	.zero	4
.LC8:
	.word	1
	.word	2
	.word	2
	.word	2
	.word	0
	.word	1
	.word	0
	.word	1
.LC9:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	27
	.word	29
	.word	31
	.align	3
.LANCHOR1 = . + 0
	.type	FldPTypeTab, %object
	.size	FldPTypeTab, 64
FldPTypeTab:
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	2
	.word	4
	.word	4
	.word	2
	.word	4
	.word	4
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC13:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC15:
	ASCII(.string	"VC1 INIT!!!\n" )
	.zero	3
.LC17:
	ASCII(.string	"picture width out of range" )
	.zero	5
.LC20:
	ASCII(.string	"%s: %s\n" )
.LC22:
	ASCII(.string	"picture height out of range" )
	.zero	4
.LC24:
	ASCII(.string	"Vc1SMPSeqHdr Err, BS is wrong" )
	.zero	2
.LC26:
	ASCII(.string	"Vc1SMPSeqHdr Err, BS is wrong\n" )
	.zero	1
.LC31:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC33:
	ASCII(.string	"vc1 actual frame size(%dx%d) exeed max config(%dx%d)\n" )
	.zero	2
.LC36:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC38:
	ASCII(.string	"ERROR: FSP_ConfigInstance fail!\n" )
	.zero	7
.LC40:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC44:
	ASCII(.string	"get frame store fail!\n" )
	.zero	1
.LC46:
	ASCII(.string	"VC1_Vfmw_GetImageBuffer get imgbuf err, clear all ref!\n" )
.LC48:
	ASCII(.string	"VC1_Vfmw_GetImageBuffer get_flag!=1, FSP_ClearLogicFs.\n" )
.LC53:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo VC1_ArrangeVahbMem err!\n" )
.LC55:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_GetImageBuffer err!\n" )
	.zero	3
.LC57:
	ASCII(.string	"dec_pts: %lld Usertag = %lld\n" )
	.zero	2
.LC60:
	ASCII(.string	"---------- unref %d\n" )
	.zero	3
.LC62:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo B pic pCodecInf->RefNum < 2 err!\n" )
	.zero	7
.LC64:
	ASCII(.string	"line: %d (pCur,pFwd,pBwd)(%p,%p,%p)\n" )
	.zero	3
.LC66:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo imgbuf = NULL err!\n" )
	.zero	5
.LC68:
	ASCII(.string	"CurFsID(fwd%d,%d,bwd%d) abnormal!(%p,%p,%p)\n" )
	.zero	3
.LC70:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo VC1_Vfmw_BuildRefList err!\n" )
	.zero	5
.LC72:
	ASCII(.string	"VC1_Vfmw_GetStreamInfo error! Release all packets!\n" )
	.zero	4
.LC85:
	ASCII(.string	"%s:%d Code(%d) is invalid\n" )
	.zero	5
.LC87:
	ASCII(.string	"%s:%d Denominator(%d) is invalid\n" )
	.zero	6
.LC101:
	ASCII(.string	"SLICE_ADDR = %d,SlcEndMbn = %d, MbHeight = %d\n" )
	.zero	1
.LC103:
	ASCII(.string	"SLICE_ADDR = %d,SlcEndMbn = %d, totalMbMin1 = %d\n" )
	.zero	6
.LC105:
	ASCII(.string	"VC1_RecordSlcStream stream len <= 0\n" )
	.zero	3
.LC108:
	ASCII(.string	"Check Pos 2: %d\n" )
	.zero	7
.LC110:
	ASCII(.string	"Check Pos 3: %d\n" )
	.zero	7
.LC113:
	ASCII(.string	"\n======PicNum  :%6d=========\n" )
	.zero	2
.LC115:
	ASCII(.string	"INTERPFRM  :%#x\n" )
	.zero	7
.LC118:
	ASCII(.string	"VC1_Vfmw_ParseMPBPicHdr err!\n" )
	.zero	2
.LC120:
	ASCII(.string	"VC1_Vfmw_ParseSMPIPicHdr err!\n" )
	.zero	1
.LC122:
	ASCII(.string	"After VC1_Vfmw_ParseSMPPicHdr BS Len <= 0 err!\n" )
.LC128:
	ASCII(.string	"pImg is null, pCurImg %p pBwdImg %p pFwdImg %p\n" )
.LC130:
	ASCII(.string	"line: %d, pToQueImg is Null!\n" )
	.zero	2
.LC132:
	ASCII(.string	"insert buf %d ref %d\n" )
	.zero	2
.LC134:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC136:
	ASCII(.string	"----------------- VC1 Imode -> %d ------------------\n" )
	.zero	2
.LC139:
	ASCII(.string	"NOTE: Drop non-I\n" )
	.zero	6
.LC141:
	ASCII(.string	"NOTE: Drop B\n" )
	.zero	2
.LC147:
	ASCII(.string	" pCodecInf->SlcNum = %d >= 256 \n" )
	.zero	7
.LC152:
	ASCII(.string	"line %d, Code = VC1_SCSLC failed!\n" )
	.zero	5
.LC156:
	ASCII(.string	"line %d, Code = VC1_SCFRM failed!\n" )
	.zero	5
.LC158:
	ASCII(.string	"bitsream para error -----\n" )
	.zero	5
.LC160:
	ASCII(.string	"line %d, pPacket->StreamPack[1].IsLastSeg = %d\n" )
.LC163:
	ASCII(.string	"ERROR: frm %d, Invalid packet pointer!\n" )
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
