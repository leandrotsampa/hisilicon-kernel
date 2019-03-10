#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"mvc.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	MVC_IsSTRefFlg
	.type	MVC_IsSTRefFlg, %function
MVC_IsSTRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 65536
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_IsSTRefFlg, .-MVC_IsSTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IsLTRefFlg
	.type	MVC_IsLTRefFlg, %function
MVC_IsLTRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 256
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_IsLTRefFlg, .-MVC_IsLTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_pic_by_pic_num_desc
	.type	MVC_compare_pic_by_pic_num_desc, %function
MVC_compare_pic_by_pic_num_desc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, 1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 20]
	ldr	w2, [x2, 20]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_pic_by_pic_num_desc, .-MVC_compare_pic_by_pic_num_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_pic_by_lt_pic_num_asc
	.type	MVC_compare_pic_by_lt_pic_num_asc, %function
MVC_compare_pic_by_lt_pic_num_asc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, -1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 16]
	ldr	w2, [x2, 16]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_pic_by_lt_pic_num_asc, .-MVC_compare_pic_by_lt_pic_num_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_fs_by_frame_num_desc
	.type	MVC_compare_fs_by_frame_num_desc, %function
MVC_compare_fs_by_frame_num_desc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, 1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 24]
	ldr	w2, [x2, 24]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_fs_by_frame_num_desc, .-MVC_compare_fs_by_frame_num_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_fs_by_lt_pic_idx_asc
	.type	MVC_compare_fs_by_lt_pic_idx_asc, %function
MVC_compare_fs_by_lt_pic_idx_asc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, -1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 28]
	ldr	w2, [x2, 28]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, hi
	csel	w0, w0, w3, cs
	ret
	.size	MVC_compare_fs_by_lt_pic_idx_asc, .-MVC_compare_fs_by_lt_pic_idx_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_pic_by_poc_asc
	.type	MVC_compare_pic_by_poc_asc, %function
MVC_compare_pic_by_poc_asc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, -1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 24]
	ldr	w2, [x2, 24]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_pic_by_poc_asc, .-MVC_compare_pic_by_poc_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_pic_by_poc_desc
	.type	MVC_compare_pic_by_poc_desc, %function
MVC_compare_pic_by_poc_desc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, 1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 24]
	ldr	w2, [x2, 24]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_pic_by_poc_desc, .-MVC_compare_pic_by_poc_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_fs_by_poc_asc
	.type	MVC_compare_fs_by_poc_asc, %function
MVC_compare_fs_by_poc_asc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, -1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 32]
	ldr	w2, [x2, 32]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_fs_by_poc_asc, .-MVC_compare_fs_by_poc_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_compare_fs_by_poc_desc
	.type	MVC_compare_fs_by_poc_desc, %function
MVC_compare_fs_by_poc_desc:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19]
	mov	w3, 1
	ldr	x2, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	w1, [x0, 32]
	ldr	w2, [x2, 32]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	MVC_compare_fs_by_poc_desc, .-MVC_compare_fs_by_poc_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	MVC_SetFrmRepeatCount.part.1, %function
MVC_SetFrmRepeatCount.part.1:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	add	x3, x19, 11124736
	ldp	w0, w2, [x19, 132]
	ldr	w3, [x3, 920]
	lsr	w0, w0, 1
	add	w2, w3, w2, lsr 1
	add	w3, w2, 1
	cmp	w0, w3
	bcc	.L28
	sub	w0, w0, #1
	sub	w0, w0, w2
	cmp	w0, 1
	bls	.L29
	mov	w0, 2
	str	w0, [x20, 24]
	ldr	w0, [x19, 136]
	add	w0, w0, 4
	str	w0, [x19, 136]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L28:
	str	wzr, [x20, 24]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L29:
	mov	w0, 1
	str	w0, [x20, 24]
	ldr	w0, [x19, 136]
	add	w0, w0, 2
	str	w0, [x19, 136]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_SetFrmRepeatCount.part.1, .-MVC_SetFrmRepeatCount.part.1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	MVC_CombinePacket.part.12, %function
MVC_CombinePacket.part.12:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC1
	mov	w0, 7
	bl	dprint_vfmw
	ldr	x2, [x19, 240]
	mov	w0, 7
	ldr	x1, .LC3
	ldp	w5, w3, [x2, 48]
	ldr	w4, [x2, 16]
	ldr	w2, [x2, 20]
	bl	dprint_vfmw
	ldr	x1, [x19, 240]
	ldr	x3, .LC4
	ldr	w2, [x1, 16]
	ldr	x0, [x1, 40]
	ldr	x3, [x3, 104]
	ldr	x1, [x1, 8]
	sub	x0, x0, x2
	blr	x3
	ldr	x2, [x19, 240]
	mov	w4, 1
	ldr	x1, .LC6
	mov	w0, 7
	ldr	w3, [x2, 68]
	ldr	w20, [x2, 36]
	str	w3, [x2, 36]
	ldr	x2, [x19, 240]
	str	wzr, [x2, 28]
	ldr	x2, [x19, 240]
	ldr	w5, [x2, 16]
	ldr	x3, [x2, 40]
	sub	x3, x3, x5
	str	x3, [x2, 8]
	ldr	x2, [x19, 240]
	ldr	w5, [x2, 16]
	ldr	w3, [x2, 52]
	sub	w3, w3, w5
	str	w3, [x2, 20]
	ldr	x2, [x19, 240]
	ldr	w5, [x2, 16]
	ldr	w3, [x2, 48]
	add	w3, w5, w3
	str	w3, [x2, 16]
	ldr	x2, [x19, 240]
	str	w4, [x2, 76]
	ldr	x2, [x19, 240]
	ldp	w3, w2, [x2, 16]
	bl	dprint_vfmw
	ldr	w0, [x19, 120]
	mov	w1, w20
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 240]
	str	xzr, [x0, 40]
	ldr	x0, [x19, 240]
	str	wzr, [x0, 60]
	ldr	x0, [x19, 240]
	str	wzr, [x0, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_CombinePacket.part.12, .-MVC_CombinePacket.part.12
	.align	3
.LC1:
	.xword	.LC0
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC4:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC6:
	.xword	.LC5
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_ue_v
	.type	mvc_ue_v, %function
mvc_ue_v:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	add	x23, x21, 872
	bl	_mcount
	mov	w1, 32
	mov	x0, x23
	bl	BsShow
	mov	w20, w0
	bl	ZerosMS_32
	cmp	w0, 15
	mov	w19, w0
	bls	.L37
	cmp	w0, 31
	bls	.L38
	mov	w0, 1
	mov	w20, -1
	strb	w0, [x21, 10]
	mov	w19, 32
.L35:
	ldr	x4, [x21, 240]
	mov	w3, w20
	ldr	x1, .LC8
	mov	x2, x22
	mov	w0, 21
	ldr	w5, [x4, 72]
	add	w19, w5, w19
	str	w19, [x4, 72]
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L37:
	lsl	w19, w0, 1
	mov	w2, 32
	add	w19, w19, 1
	mov	x0, x23
	sub	w2, w2, w19
	mov	w1, w19
	lsr	w20, w20, w2
	sub	w20, w20, #1
	bl	BsSkip
	b	.L35
	.p2align 3
.L38:
	mov	w1, w0
	mov	x0, x23
	add	w24, w19, 1
	lsl	w19, w19, 1
	bl	BsSkip
	add	w19, w19, 1
	mov	w1, w24
	mov	x0, x23
	bl	BsShow
	sub	w20, w0, #1
	mov	w1, w24
	mov	x0, x23
	bl	BsSkip
	b	.L35
	.size	mvc_ue_v, .-mvc_ue_v
	.align	3
.LC8:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_se_v
	.type	mvc_se_v, %function
mvc_se_v:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	add	x23, x21, 872
	bl	_mcount
	mov	w1, 32
	mov	x0, x23
	bl	BsShow
	mov	w20, w0
	bl	ZerosMS_32
	cmp	w0, 15
	mov	w19, w0
	bhi	.L40
	lsl	w19, w0, 1
	mov	w2, 32
	add	w19, w19, 1
	mov	x0, x23
	sub	w2, w2, w19
	mov	w1, w19
	lsr	w20, w20, w2
	and	w2, w20, 1
	lsr	w20, w20, 1
	cmp	w2, wzr
	csneg	w20, w20, w20, eq
	bl	BsSkip
.L42:
	ldr	x4, [x21, 240]
	mov	w3, w20
	ldr	x1, .LC9
	mov	x2, x22
	mov	w0, 21
	ldr	w5, [x4, 72]
	add	w19, w5, w19
	str	w19, [x4, 72]
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L40:
	cmp	w0, 31
	bls	.L49
	mov	w0, 1
	mov	w20, 2147483647
	strb	w0, [x21, 10]
	mov	w19, 32
	b	.L42
	.p2align 3
.L49:
	mov	w1, w0
	mov	x0, x23
	bl	BsSkip
	mov	w1, w19
	mov	x0, x23
	lsl	w19, w19, 1
	bl	BsGet
	mov	w20, w0
	mov	w1, 1
	mov	x0, x23
	add	w19, w19, 1
	bl	BsGet
	and	w0, w0, 1
	cmp	w0, wzr
	csneg	w20, w20, w20, eq
	b	.L42
	.size	mvc_se_v, .-mvc_se_v
	.align	3
.LC9:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_u_v
	.type	mvc_u_v, %function
mvc_u_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x2
	mov	w19, w1
	bl	_mcount
	mov	w1, w19
	add	x0, x21, 872
	bl	BsGet
	mov	w20, w0
	ldr	x4, [x21, 240]
	mov	w3, w0
	ldr	x1, .LC10
	mov	x2, x22
	mov	w0, 21
	ldr	w5, [x4, 72]
	add	w19, w5, w19
	str	w19, [x4, 72]
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	mvc_u_v, .-mvc_u_v
	.align	3
.LC10:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_u_1
	.type	mvc_u_1, %function
mvc_u_1:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	mov	w1, 1
	add	x0, x20, 872
	bl	BsGet
	mov	w19, w0
	ldr	x5, [x20, 240]
	mov	w3, w0
	ldr	x1, .LC11
	mov	x2, x21
	mov	w0, 21
	ldr	w4, [x5, 72]
	add	w4, w4, 1
	str	w4, [x5, 72]
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	mvc_u_1, .-mvc_u_1
	.align	3
.LC11:
	.xword	.LC7
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetMinPOC
	.type	MVC_GetMinPOC, %function
MVC_GetMinPOC:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x24, x3
	mov	x21, x0
	mov	x0, x30
	mov	x23, x2
	mov	w22, w1
	add	x26, x21, 11124736
	bl	_mcount
	mov	w0, -1
	str	w0, [x24]
	mov	w0, 2147483647
	str	w0, [x23]
	ldr	w0, [x26, 920]
	ldr	w1, [x26, 924]
	cmp	w1, w0
	bls	.L53
	str	w0, [x26, 924]
.L53:
	mov	w25, -1
	mov	w20, 0
	cbnz	w0, .L68
	b	.L59
	.p2align 3
.L56:
	ldr	w2, [x1, 32]
	ldr	w3, [x23]
	cmp	w3, w2
	ble	.L55
	ldrb	w3, [x1, 5]
	cbz	w3, .L55
	ldrb	w0, [x0, 1]
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 1
	bls	.L75
	.p2align 2
.L55:
	ldr	w0, [x26, 920]
	add	w20, w20, 1
	cmp	w0, w20
	bls	.L59
.L68:
	add	x19, x21, x20, uxtw 3
	add	x19, x19, 11124736
	ldr	x0, [x19, 536]
	cbz	x0, .L55
	ldrsb	w1, [x0, 6]
	ldr	w0, [x21, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L55
	cmn	w22, #1
	ldr	x1, [x19, 536]
	bne	.L56
	ldrb	w2, [x1, 5]
	cbz	w2, .L55
	ldrb	w0, [x0, 1]
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 1
	bhi	.L55
	ldr	w0, [x1, 32]
	ldr	w2, [x23]
	cmp	w2, w0
	ble	.L57
	str	w0, [x23]
	str	w20, [x24]
	add	w20, w20, 1
	ldr	x0, [x19, 536]
	ldr	w25, [x0, 56]
	ldr	w0, [x26, 920]
	cmp	w0, w20
	bhi	.L68
.L59:
	ldr	w0, [x24]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x25, x26, [sp, 64]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L75:
	ldr	w0, [x1, 56]
	cmp	w22, w0
	bne	.L55
	str	w2, [x23]
	str	w20, [x24]
	b	.L55
	.p2align 3
.L57:
	bne	.L55
	ldr	w0, [x1, 56]
	cmp	w0, w25
	bge	.L55
	str	w20, [x24]
	ldr	x0, [x19, 536]
	ldr	w25, [x0, 56]
	b	.L55
	.size	MVC_GetMinPOC, .-MVC_GetMinPOC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FrameStoreRefFlg
	.type	MVC_FrameStoreRefFlg, %function
MVC_FrameStoreRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 3]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_FrameStoreRefFlg, .-MVC_FrameStoreRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_NonLongTermRefFlg
	.type	MVC_NonLongTermRefFlg, %function
MVC_NonLongTermRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 3]
	cmp	w1, 3
	beq	.L96
	tbnz	x1, 0, .L97
	mov	w0, 0
	tbnz	x1, 1, .L82
.L89:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L97:
	ldrb	w2, [x19, 785]
	mov	w0, 1
	cbz	w2, .L89
	mov	w0, 0
	tbz	x1, 1, .L89
	b	.L82
	.p2align 3
.L96:
	ldrb	w1, [x19, 737]
	mov	w0, 1
	cbz	w1, .L89
	ldrb	w1, [x19, 785]
	cbz	w1, .L89
.L82:
	ldrb	w0, [x19, 833]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_NonLongTermRefFlg, .-MVC_NonLongTermRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ShortTermRefFlg
	.type	MVC_ShortTermRefFlg, %function
MVC_ShortTermRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 3]
	cmp	w1, 3
	beq	.L114
	tbnz	x1, 0, .L115
.L102:
	mov	w0, 0
	tbnz	x1, 1, .L103
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L115:
	ldr	w0, [x19, 784]
	and	w0, w0, 16776960
	cmp	w0, 65536
	bne	.L102
.L107:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L114:
	ldr	w0, [x19, 736]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L107
	ldr	w0, [x19, 784]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L107
.L103:
	ldr	w0, [x19, 832]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 65536
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_ShortTermRefFlg, .-MVC_ShortTermRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_LongTermRefFlg
	.type	MVC_LongTermRefFlg, %function
MVC_LongTermRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 3]
	cmp	w1, 3
	beq	.L132
	tbnz	x1, 0, .L133
.L120:
	mov	w0, 0
	tbnz	x1, 1, .L121
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L133:
	ldr	w0, [x19, 784]
	and	w0, w0, 16776960
	cmp	w0, 256
	bne	.L120
.L125:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L132:
	ldr	w0, [x19, 736]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L125
	ldr	w0, [x19, 784]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L125
.L121:
	ldr	w0, [x19, 832]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 256
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_LongTermRefFlg, .-MVC_LongTermRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UpdateLTReflist
	.type	MVC_UpdateLTReflist, %function
MVC_UpdateLTReflist:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	add	x26, x23, 11124736
	bl	_mcount
	ldr	w24, [x26, 920]
	cbz	w24, .L135
	sub	w22, w24, #1
	add	x20, x26, 536
	add	x22, x22, 1388544
	mov	w19, 0
	add	x22, x22, 2116
	add	x25, x23, 11161600
	add	x22, x23, x22, lsl 3
	b	.L137
	.p2align 3
.L136:
	cmp	x22, x20
	beq	.L151
.L137:
	ldr	x21, [x20]
	add	x20, x20, 8
	mov	x0, x21
	cbz	x21, .L136
	bl	MVC_LongTermRefFlg
	cbz	w0, .L136
	ldr	w1, [x21, 56]
	ldr	w0, [x25, 392]
	cmp	w1, w0
	bne	.L136
	uxtw	x0, w19
	cmp	x22, x20
	add	x0, x0, 1388544
	add	w19, w19, 1
	add	x0, x23, x0, lsl 3
	str	x21, [x0, 17176]
	bne	.L137
	.p2align 2
.L151:
	cmp	w19, w24
	str	w19, [x26, 932]
	bcs	.L134
	.p2align 2
.L146:
	uxtw	x0, w19
	add	w19, w19, 1
	add	x0, x0, 1388544
	cmp	w19, w24
	add	x0, x23, x0, lsl 3
	str	xzr, [x0, 17176]
	bne	.L146
.L134:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L135:
	str	wzr, [x26, 932]
	b	.L134
	.size	MVC_UpdateLTReflist, .-MVC_UpdateLTReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UpdateReflist
	.type	MVC_UpdateReflist, %function
MVC_UpdateReflist:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	add	x26, x23, 11124736
	bl	_mcount
	ldr	w24, [x26, 920]
	cbz	w24, .L153
	sub	w22, w24, #1
	add	x20, x26, 536
	add	x22, x22, 1388544
	mov	w19, 0
	add	x22, x22, 2116
	add	x25, x23, 11161600
	add	x22, x23, x22, lsl 3
	b	.L155
	.p2align 3
.L154:
	cmp	x22, x20
	beq	.L169
.L155:
	ldr	x21, [x20]
	add	x20, x20, 8
	mov	x0, x21
	cbz	x21, .L154
	bl	MVC_ShortTermRefFlg
	cbz	w0, .L154
	ldr	w1, [x21, 56]
	ldr	w0, [x25, 392]
	cmp	w1, w0
	bne	.L154
	uxtw	x0, w19
	cmp	x22, x20
	add	x0, x0, 1388544
	add	w19, w19, 1
	add	x0, x23, x0, lsl 3
	str	x21, [x0, 17048]
	bne	.L155
	.p2align 2
.L169:
	cmp	w19, w24
	str	w19, [x26, 928]
	bcs	.L152
	.p2align 2
.L164:
	uxtw	x0, w19
	add	w19, w19, 1
	add	x0, x0, 1388544
	cmp	w19, w24
	add	x0, x23, x0, lsl 3
	str	xzr, [x0, 17048]
	bne	.L164
.L152:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L153:
	str	wzr, [x26, 928]
	b	.L152
	.size	MVC_UpdateReflist, .-MVC_UpdateReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetPicNumX
	.type	MVC_GetPicNumX, %function
MVC_GetPicNumX:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldrb	w0, [x20, 3]
	ldr	w2, [x20, 696]
	cbz	w0, .L172
	lsl	w2, w2, 1
	add	w2, w2, 1
.L172:
	mvn	w0, w19
	add	w0, w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_GetPicNumX, .-MVC_GetPicNumX
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkFrameStoreRef
	.type	MVC_UnMarkFrameStoreRef, %function
MVC_UnMarkFrameStoreRef:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 2]
	tbz	x0, 0, .L174
	ldrb	w1, [x19, 3]
	strb	wzr, [x19, 785]
	and	w1, w1, 2
	strb	wzr, [x19, 786]
	strb	w1, [x19, 3]
.L174:
	tbz	x0, 1, .L175
	ldrb	w1, [x19, 3]
	strb	wzr, [x19, 833]
	and	w1, w1, 1
	strb	wzr, [x19, 834]
	strb	w1, [x19, 3]
.L175:
	cmp	w0, 3
	bne	.L176
	strb	wzr, [x19, 738]
	strb	wzr, [x19, 737]
.L176:
	strb	wzr, [x19, 3]
	mov	w2, 0
	ldrsb	w1, [x19, 6]
	ldr	w0, [x20, 120]
	bl	FSP_SetRef
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_UnMarkFrameStoreRef, .-MVC_UnMarkFrameStoreRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	MVC_SlidingWinMark.part.2, %function
MVC_SlidingWinMark.part.2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11124736
	ldr	w5, [x1, 920]
	cbz	w5, .L200
	add	x1, x1, 536
	mov	w7, 0
	mov	w6, 2147483647
	mov	w2, 0
	add	x8, x19, 11161600
	.p2align 2
.L190:
	ldr	x0, [x1]
	cbz	x0, .L185
	ldr	w3, [x0, 64]
	cmp	w3, w6
	bcs	.L185
	ldrb	w4, [x0, 3]
	cbz	w4, .L185
	cmp	w4, 3
	beq	.L256
	tbnz	x4, 0, .L257
.L189:
	tbnz	x4, 1, .L198
	.p2align 2
.L185:
	add	w2, w2, 1
	add	x1, x1, 8
	cmp	w2, w5
	bne	.L190
.L184:
	sxtw	x0, w7
	add	x0, x0, 1388544
	add	x0, x19, x0, lsl 3
	ldr	x1, [x0, 16920]
	cbz	x1, .L183
	ldrb	w0, [x1, 3]
	cbz	w0, .L183
	cmp	w0, 3
	beq	.L258
	tbnz	x0, 0, .L259
.L195:
	tbnz	x0, 1, .L199
.L183:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L257:
	ldrb	w9, [x0, 785]
	cbnz	w9, .L189
.L187:
	ldr	w4, [x0, 56]
	ldr	w0, [x8, 392]
	cmp	w4, w0
	csel	w6, w6, w3, ne
	csel	w7, w7, w2, ne
	b	.L185
	.p2align 3
.L256:
	ldrb	w4, [x0, 737]
	cbz	w4, .L187
	ldrb	w4, [x0, 785]
	cbz	w4, .L187
.L198:
	ldrb	w4, [x0, 833]
	cbnz	w4, .L185
	ldr	w4, [x0, 56]
	ldr	w0, [x8, 392]
	cmp	w4, w0
	csel	w6, w6, w3, ne
	csel	w7, w7, w2, ne
	b	.L185
	.p2align 3
.L259:
	ldrb	w2, [x1, 785]
	cbnz	w2, .L195
.L193:
	add	x0, x19, 11161600
	ldr	w2, [x1, 56]
	ldr	w0, [x0, 392]
	cmp	w2, w0
	bne	.L183
	mov	x0, x19
	bl	MVC_UnMarkFrameStoreRef
	mov	x0, x19
	bl	MVC_UpdateReflist
	b	.L183
	.p2align 3
.L258:
	ldrb	w0, [x1, 737]
	cbz	w0, .L193
	ldrb	w0, [x1, 785]
	cbz	w0, .L193
.L199:
	ldrb	w0, [x1, 833]
	cbz	w0, .L193
	b	.L183
.L200:
	mov	w7, 0
	b	.L184
	.size	MVC_SlidingWinMark.part.2, .-MVC_SlidingWinMark.part.2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkLTFrmByFrmIdx
	.type	MVC_UnMarkLTFrmByFrmIdx, %function
MVC_UnMarkLTFrmByFrmIdx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 11124736
	ldr	w2, [x0, 932]
	cbz	w2, .L260
	sub	w4, w2, #1
	add	x0, x0, 792
	add	x4, x4, 1388544
	add	x5, x20, 11161600
	add	x4, x4, 2148
	add	x4, x20, x4, lsl 3
	b	.L263
	.p2align 3
.L262:
	cmp	x0, x4
	beq	.L260
.L263:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 28]
	cmp	w3, w19
	bne	.L262
	ldr	w3, [x1, 56]
	ldr	w2, [x5, 392]
	cmp	w3, w2
	bne	.L262
	mov	x0, x20
	bl	MVC_UnMarkFrameStoreRef
.L260:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_UnMarkLTFrmByFrmIdx, .-MVC_UnMarkLTFrmByFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkLTFldByFrmIdx
	.type	MVC_UnMarkLTFldByFrmIdx, %function
MVC_UnMarkLTFldByFrmIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	mov	w20, w2
	mov	w19, w3
	bl	_mcount
	add	x0, x21, 11124736
	ldr	w4, [x0, 932]
	cbz	w4, .L268
	sub	w6, w4, #1
	add	x0, x0, 792
	add	x6, x6, 1388544
	add	x7, x21, 11161600
	add	x6, x6, 2148
	add	x6, x21, x6, lsl 3
	b	.L272
	.p2align 3
.L270:
	cmp	x0, x6
	beq	.L268
.L272:
	ldr	x4, [x0]
	add	x0, x0, 8
	ldr	w5, [x4, 28]
	cmp	w5, w19
	bne	.L270
	ldr	w5, [x4, 56]
	ldr	w3, [x7, 392]
	cmp	w5, w3
	bne	.L270
	cmp	w20, 1
	beq	.L284
	cmp	w20, 2
	bne	.L270
	ldrb	w1, [x4, 785]
	cmp	w1, wzr
	ccmp	x4, x22, 0, ne
	beq	.L270
.L283:
	mov	x1, x4
	mov	x0, x21
	bl	MVC_UnMarkFrameStoreRef
.L268:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L284:
	ldrb	w1, [x4, 833]
	cmp	w1, wzr
	ccmp	x4, x22, 0, ne
	beq	.L270
	b	.L283
	.size	MVC_UnMarkLTFldByFrmIdx, .-MVC_UnMarkLTFldByFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkSTRef
	.type	MVC_UnMarkSTRef, %function
MVC_UnMarkSTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	mov	w21, w2
	bl	_mcount
	ldrb	w0, [x20, 3]
	cbnz	w0, .L286
	add	x0, x19, 11124736
	ldr	w3, [x20, 696]
	sub	w3, w3, #1
	ldr	w1, [x0, 928]
	sub	w2, w3, w21
	cbz	w1, .L285
	sub	w4, w1, #1
	add	x0, x0, 664
	add	x4, x4, 1388544
	add	x5, x19, 11161600
	add	x4, x4, 2132
	add	x4, x19, x4, lsl 3
	b	.L292
	.p2align 3
.L291:
	cmp	x0, x4
	beq	.L285
.L292:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 756]
	cmp	w3, w2
	bne	.L291
	ldrb	w3, [x1, 3]
	cmp	w3, 3
	bne	.L291
	ldr	w3, [x1, 736]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L291
	ldr	w6, [x1, 56]
	ldr	w3, [x5, 392]
	cmp	w6, w3
	bne	.L291
	mov	x0, x19
	bl	MVC_UnMarkFrameStoreRef
.L285:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L286:
	add	x1, x19, 11124736
	ldr	w0, [x20, 696]
	add	x4, x1, 664
	mov	w3, 0
	lsl	w0, w0, 1
	add	x8, x19, 11161600
	ldr	w6, [x1, 928]
	sub	w2, w0, w21
	cbz	w6, .L285
	.p2align 2
.L306:
	ldr	x1, [x4]
	add	x4, x4, 8
	ldrb	w0, [x1, 3]
	and	w7, w0, 1
	tbz	x0, 0, .L293
	ldr	w5, [x1, 784]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L313
.L293:
	tbz	x0, 1, .L295
	ldr	w0, [x1, 832]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L314
.L295:
	add	w3, w3, 1
	cmp	w3, w6
	bne	.L306
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L313:
	ldr	w9, [x1, 56]
	ldr	w5, [x8, 392]
	cmp	w9, w5
	bne	.L293
	ldr	w5, [x1, 804]
	cmp	w5, w2
	bne	.L293
	add	x2, x19, x3, uxtw 3
	and	w0, w0, 2
	add	x2, x2, 11124736
	strb	w0, [x1, 3]
	ldr	x0, [x2, 664]
	strb	wzr, [x0, 786]
	ldr	x0, [x2, 664]
	ldrb	w1, [x0, 736]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L294
	strb	wzr, [x0, 738]
	ldr	x0, [x2, 664]
	strb	wzr, [x0, 737]
	ldr	x0, [x2, 664]
.L294:
	ldrb	w1, [x0, 3]
	cbnz	w1, .L285
	ldr	w1, [x0, 48]
	mov	w2, 0
	add	x1, x19, x1, lsl 2
	str	wzr, [x1, 148]
	ldrsb	w1, [x0, 6]
	ldr	w0, [x19, 120]
	bl	FSP_SetRef
	b	.L285
	.p2align 3
.L314:
	ldr	w5, [x1, 56]
	ldr	w0, [x8, 392]
	cmp	w5, w0
	bne	.L295
	ldr	w0, [x1, 852]
	cmp	w0, w2
	bne	.L295
	add	x0, x19, x3, uxtw 3
	strb	w7, [x1, 3]
	add	x0, x0, 11124736
	ldr	x1, [x0, 664]
	strb	wzr, [x1, 834]
	ldr	x1, [x0, 664]
	ldrb	w2, [x1, 736]
	cmp	w2, 3
	ccmp	w2, wzr, 4, ne
	bne	.L296
	strb	wzr, [x1, 738]
	ldr	x1, [x0, 664]
	strb	wzr, [x1, 737]
	ldr	x1, [x0, 664]
.L296:
	ldrb	w0, [x1, 3]
	cbnz	w0, .L285
	ldr	w0, [x1, 48]
	mov	w2, 0
	add	x0, x19, x0, lsl 2
	str	wzr, [x0, 148]
	ldrsb	w1, [x1, 6]
	ldr	w0, [x19, 120]
	bl	FSP_SetRef
	b	.L285
	.size	MVC_UnMarkSTRef, .-MVC_UnMarkSTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkLTRef
	.type	MVC_UnMarkLTRef, %function
MVC_UnMarkLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x1
	mov	x19, x0
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	ldrb	w0, [x21, 3]
	cbz	w0, .L316
	add	x0, x19, 11124736
	mov	w3, 0
	add	x4, x0, 792
	add	x2, x19, 11161600
	ldr	w6, [x0, 932]
	cbz	w6, .L315
	.p2align 2
.L336:
	ldr	x1, [x4]
	add	x4, x4, 8
	ldrb	w0, [x1, 3]
	and	w7, w0, 1
	tbz	x0, 0, .L321
	ldr	w5, [x1, 784]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L343
.L321:
	tbz	x0, 1, .L323
	ldr	w0, [x1, 832]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L344
.L323:
	add	w3, w3, 1
	cmp	w3, w6
	bne	.L336
.L315:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L343:
	ldr	w8, [x1, 56]
	ldr	w5, [x2, 392]
	cmp	w8, w5
	bne	.L321
	ldr	w5, [x1, 800]
	cmp	w20, w5
	bne	.L321
	add	x2, x19, x3, uxtw 3
	and	w0, w0, 2
	add	x2, x2, 11124736
	strb	w0, [x1, 3]
	ldr	x0, [x2, 792]
	strb	wzr, [x0, 785]
	ldr	x0, [x2, 792]
	ldrb	w1, [x0, 736]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L322
	strb	wzr, [x0, 738]
	ldr	x0, [x2, 792]
	strb	wzr, [x0, 737]
	ldr	x0, [x2, 792]
.L322:
	ldrb	w1, [x0, 3]
	cbnz	w1, .L315
	ldr	w1, [x0, 48]
	mov	w2, 0
	add	x1, x19, x1, lsl 2
	str	wzr, [x1, 148]
	ldrsb	w1, [x0, 6]
	ldr	w0, [x19, 120]
	bl	FSP_SetRef
	b	.L315
	.p2align 3
.L344:
	ldr	w5, [x1, 56]
	ldr	w0, [x2, 392]
	cmp	w5, w0
	bne	.L323
	ldr	w0, [x1, 848]
	cmp	w20, w0
	bne	.L323
	add	x0, x19, x3, uxtw 3
	strb	w7, [x1, 3]
	add	x0, x0, 11124736
	ldr	x1, [x0, 792]
	strb	wzr, [x1, 833]
	ldr	x1, [x0, 792]
	ldrb	w2, [x1, 736]
	cmp	w2, 3
	ccmp	w2, wzr, 4, ne
	bne	.L324
	strb	wzr, [x1, 738]
	ldr	x1, [x0, 792]
	strb	wzr, [x1, 737]
	ldr	x1, [x0, 792]
.L324:
	ldrb	w0, [x1, 3]
	cbnz	w0, .L315
	ldr	w0, [x1, 48]
	mov	w2, 0
	add	x0, x19, x0, lsl 2
	str	wzr, [x0, 148]
	ldrsb	w1, [x1, 6]
	ldr	w0, [x19, 120]
	bl	FSP_SetRef
	b	.L315
	.p2align 3
.L316:
	add	x0, x19, 11124736
	ldr	w1, [x0, 932]
	cbz	w1, .L315
	sub	w4, w1, #1
	add	x0, x0, 792
	add	x4, x4, 1388544
	add	x5, x19, 11161600
	add	x4, x4, 2148
	add	x4, x19, x4, lsl 3
	b	.L327
	.p2align 3
.L326:
	cmp	x0, x4
	beq	.L315
.L327:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 752]
	cmp	w3, w20
	bne	.L326
	ldrb	w2, [x1, 3]
	cmp	w2, 3
	bne	.L326
	ldr	w2, [x1, 736]
	and	w2, w2, 16776960
	cmp	w2, 256
	bne	.L326
	ldr	w3, [x1, 56]
	ldr	w2, [x5, 392]
	cmp	w3, w2
	bne	.L326
	mov	x0, x19
	bl	MVC_UnMarkFrameStoreRef
	b	.L315
	.size	MVC_UnMarkLTRef, .-MVC_UnMarkLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_MarkPicLTRef
	.type	MVC_MarkPicLTRef, %function
MVC_MarkPicLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x3
	mov	x21, x0
	mov	x0, x30
	mov	w20, w2
	mov	w19, w1
	bl	_mcount
	ldrb	w2, [x22, 3]
	add	x0, x21, 11124736
	cbz	w2, .L346
	ldr	w7, [x0, 928]
	mov	w3, 0
	add	x4, x0, 664
	add	x8, x21, 11161600
	cbz	w7, .L345
	.p2align 2
.L367:
	ldr	x0, [x4]
	ldrb	w5, [x0, 3]
	tbz	x5, 0, .L352
	ldr	w6, [x0, 784]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L373
.L352:
	tbz	x5, 1, .L355
	ldr	w1, [x0, 832]
	and	w1, w1, 16776960
	cmp	w1, 65536
	beq	.L374
.L355:
	add	w3, w3, 1
	add	x4, x4, 8
	cmp	w3, w7
	bne	.L367
.L345:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L373:
	ldr	w1, [x0, 804]
	cmp	w20, w1
	bne	.L352
	ldr	w6, [x0, 56]
	ldr	w1, [x8, 392]
	cmp	w6, w1
	bne	.L352
	ldrb	w1, [x0, 833]
	cmp	w1, 1
	bne	.L356
	ldr	w1, [x0, 28]
	cmp	w19, w1
	bne	.L355
.L356:
	add	x3, x21, x3, uxtw 3
	str	w19, [x0, 28]
	add	x0, x3, 11124736
	cmp	w2, 1
	lsl	w1, w19, 1
	mov	w2, 1
	csinc	w1, w1, w1, ne
	ldr	x3, [x0, 664]
	str	w1, [x3, 800]
	ldr	x1, [x0, 664]
	strb	w2, [x1, 785]
	ldr	x1, [x0, 664]
	strb	wzr, [x1, 786]
	ldr	x1, [x0, 664]
	ldrb	w2, [x1, 736]
	cmp	w2, 3
	ccmp	w2, wzr, 4, ne
	bne	.L345
	ldrb	w3, [x1, 785]
	ldrb	w2, [x1, 833]
	cmp	w2, w3
	bne	.L345
	strb	w2, [x1, 737]
	ldr	x0, [x0, 664]
	ldrb	w1, [x0, 786]
	strb	w1, [x0, 738]
	b	.L345
	.p2align 3
.L374:
	ldr	w1, [x0, 852]
	cmp	w1, w20
	bne	.L355
	ldr	w5, [x0, 56]
	ldr	w1, [x8, 392]
	cmp	w5, w1
	bne	.L355
	ldrb	w1, [x0, 785]
	cmp	w1, 1
	bne	.L359
	ldr	w1, [x0, 28]
	cmp	w1, w19
	bne	.L355
.L359:
	add	x3, x21, x3, uxtw 3
	str	w19, [x0, 28]
	add	x0, x3, 11124736
	cmp	w2, 2
	lsl	w1, w19, 1
	mov	w2, 1
	csinc	w1, w1, w1, ne
	ldr	x3, [x0, 664]
	str	w1, [x3, 848]
	ldr	x1, [x0, 664]
	strb	w2, [x1, 833]
	ldr	x1, [x0, 664]
	strb	wzr, [x1, 834]
	ldr	x1, [x0, 664]
	ldrb	w2, [x1, 736]
	cmp	w2, 3
	ccmp	w2, wzr, 4, ne
	bne	.L345
	ldrb	w3, [x1, 785]
	ldrb	w2, [x1, 833]
	cmp	w2, w3
	bne	.L345
	strb	w2, [x1, 737]
	ldr	x0, [x0, 664]
	ldrb	w1, [x0, 834]
	strb	w1, [x0, 738]
	b	.L345
	.p2align 3
.L346:
	ldr	w6, [x0, 928]
	cbz	w6, .L345
	add	x0, x0, 664
	mov	w1, 0
	add	x3, x21, 11161600
	b	.L351
	.p2align 3
.L350:
	add	w1, w1, 1
	cmp	w1, w6
	beq	.L345
.L351:
	ldr	x4, [x0]
	add	x0, x0, 8
	ldrb	w5, [x4, 3]
	cmp	w5, 3
	bne	.L350
	ldr	w5, [x4, 736]
	and	w5, w5, 16776960
	cmp	w5, 65536
	bne	.L350
	ldr	w2, [x4, 756]
	cmp	w20, w2
	bne	.L350
	ldr	w2, [x3, 392]
	ldr	w5, [x4, 56]
	cmp	w5, w2
	bne	.L350
	add	x0, x21, x1, uxtw 3
	str	w19, [x4, 28]
	add	x0, x0, 11124736
	mov	w1, 1
	ldr	x2, [x0, 664]
	str	w19, [x2, 752]
	ldr	x2, [x0, 664]
	strb	w1, [x2, 737]
	ldr	x2, [x0, 664]
	strb	w1, [x2, 785]
	ldr	x2, [x0, 664]
	strb	w1, [x2, 833]
	ldr	x1, [x0, 664]
	strb	wzr, [x1, 738]
	ldr	x1, [x0, 664]
	strb	wzr, [x1, 786]
	ldr	x0, [x0, 664]
	strb	wzr, [x0, 834]
	b	.L345
	.size	MVC_MarkPicLTRef, .-MVC_MarkPicLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_MarkSTToLTRef
	.type	MVC_MarkSTToLTRef, %function
MVC_MarkSTToLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	mov	x21, x0
	mov	x0, x30
	mov	w20, w2
	mov	w19, w3
	bl	_mcount
	ldrb	w0, [x22, 3]
	cbnz	w0, .L376
	ldr	w2, [x22, 696]
	mov	w1, w19
	mov	x0, x21
	sub	w2, w2, #1
	sub	w20, w2, w20
	bl	MVC_UnMarkLTFrmByFrmIdx
.L377:
	mov	x3, x22
	mov	w2, w20
	mov	w1, w19
	mov	x0, x21
	bl	MVC_MarkPicLTRef
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L376:
	add	x0, x21, 11124736
	ldr	w3, [x22, 696]
	lsl	w3, w3, 1
	ldr	w1, [x0, 928]
	sub	w20, w3, w20
	cbz	w1, .L377
	sub	w5, w1, #1
	add	x0, x0, 664
	add	x5, x5, 1388544
	add	x6, x21, 11161600
	add	x5, x5, 2132
	add	x5, x21, x5, lsl 3
	.p2align 2
.L380:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 3]
	tbz	x3, 0, .L378
	ldr	w4, [x1, 784]
	and	w4, w4, 16776960
	cmp	w4, 65536
	beq	.L391
.L378:
	tbz	x3, 1, .L379
	ldr	w3, [x1, 832]
	and	w3, w3, 16776960
	cmp	w3, 65536
	beq	.L392
.L379:
	cmp	x0, x5
	bne	.L380
	b	.L377
	.p2align 3
.L391:
	ldr	w2, [x1, 804]
	cmp	w2, w20
	bne	.L378
	ldr	w4, [x1, 56]
	ldr	w2, [x6, 392]
	cmp	w4, w2
	bne	.L378
	mov	w3, w19
	mov	w2, 1
	mov	x0, x21
	bl	MVC_UnMarkLTFldByFrmIdx
	b	.L377
	.p2align 3
.L392:
	ldr	w2, [x1, 852]
	cmp	w2, w20
	bne	.L379
	ldr	w3, [x1, 56]
	ldr	w2, [x6, 392]
	cmp	w3, w2
	bne	.L379
	mov	w3, w19
	mov	w2, 2
	mov	x0, x21
	bl	MVC_UnMarkLTFldByFrmIdx
	b	.L377
	.size	MVC_MarkSTToLTRef, .-MVC_MarkSTToLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UpdateMaxLTFrmIdx
	.type	MVC_UpdateMaxLTFrmIdx, %function
MVC_UpdateMaxLTFrmIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 11124736
	mov	w20, w1
	bl	_mcount
	ldr	w0, [x21, 932]
	str	w20, [x21, 936]
	cbz	w0, .L393
	mov	w2, w20
	mov	w19, 0
	add	x20, x22, 11161600
	b	.L395
	.p2align 3
.L401:
	ldr	w2, [x21, 936]
.L395:
	uxtw	x0, w19
	add	w19, w19, 1
	add	x0, x0, 1388544
	add	x0, x22, x0, lsl 3
	ldr	x1, [x0, 17176]
	ldr	w0, [x1, 28]
	cmp	w0, w2
	bcc	.L396
	ldr	w2, [x1, 56]
	ldr	w0, [x20, 392]
	cmp	w2, w0
	beq	.L400
.L396:
	ldr	w0, [x21, 932]
	cmp	w0, w19
	bhi	.L401
.L393:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L400:
	mov	x0, x22
	bl	MVC_UnMarkFrameStoreRef
	b	.L396
	.size	MVC_UpdateMaxLTFrmIdx, .-MVC_UpdateMaxLTFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UnMarkAllSTRef
	.type	MVC_UnMarkAllSTRef, %function
MVC_UnMarkAllSTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 11124736
	mov	w19, 0
	bl	_mcount
	add	x22, x20, 11161600
	ldr	w0, [x21, 928]
	cbnz	w0, .L407
	b	.L402
	.p2align 3
.L404:
	ldr	w0, [x21, 928]
	cmp	w0, w19
	bls	.L402
.L407:
	uxtw	x0, w19
	ldr	w2, [x22, 392]
	add	x0, x0, 1388544
	add	w19, w19, 1
	add	x0, x20, x0, lsl 3
	ldr	x1, [x0, 17048]
	ldr	w0, [x1, 56]
	cmp	w0, w2
	bne	.L404
	mov	x0, x20
	bl	MVC_UnMarkFrameStoreRef
	ldr	w0, [x21, 928]
	cmp	w0, w19
	bhi	.L407
.L402:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_UnMarkAllSTRef, .-MVC_UnMarkAllSTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_MarkCurrPicLT
	.type	MVC_MarkCurrPicLT, %function
MVC_MarkCurrPicLT:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	x21, x0
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	ldrb	w2, [x19, 3]
	cbz	w2, .L412
	ldr	x1, [x19, 680]
	mov	w3, w20
	mov	x0, x21
	bl	MVC_UnMarkLTFldByFrmIdx
	strb	wzr, [x19, 5]
	str	w20, [x19, 700]
	mov	w0, 1
	strb	w0, [x19, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L412:
	mov	w1, w20
	mov	x0, x21
	bl	MVC_UnMarkLTFrmByFrmIdx
	strb	wzr, [x19, 5]
	str	w20, [x19, 700]
	mov	w0, 1
	strb	w0, [x19, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_MarkCurrPicLT, .-MVC_MarkCurrPicLT
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_RemoveFrameStoreOutDPB
	.type	MVC_RemoveFrameStoreOutDPB, %function
MVC_RemoveFrameStoreOutDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w19, w1
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, x19, uxtw 3
	add	x19, x19, 11124736
	bl	_mcount
	ldr	x1, [x19, 536]
	cbz	x1, .L413
	ldr	w0, [x1, 52]
	add	x21, x20, 11124736
	add	x0, x20, x0
	add	x0, x0, 11124736
	strb	wzr, [x0, 944]
	ldr	w0, [x21, 1156]
	cmp	w0, wzr
	cset	w2, ne
	sub	w0, w0, w2
	str	w0, [x21, 1156]
	ldrsb	w1, [x1, 6]
	ldr	w0, [x20, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L416
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	beq	.L417
	ldr	x1, [x19, 536]
	mov	w2, 0
	ldr	w0, [x20, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
.L417:
	ldr	x1, [x19, 536]
	mov	w2, 0
	ldr	w0, [x20, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetRef
.L416:
	ldr	x0, [x19, 536]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 536]
	strb	wzr, [x0, 5]
	ldr	x0, [x19, 536]
	strb	wzr, [x0, 3]
	str	xzr, [x19, 536]
	ldr	w0, [x21, 924]
	sub	w0, w0, #1
	str	w0, [x21, 924]
.L413:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_RemoveFrameStoreOutDPB, .-MVC_RemoveFrameStoreOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_RemoveUnUsedFrameStore
	.type	MVC_RemoveUnUsedFrameStore, %function
MVC_RemoveUnUsedFrameStore:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	mov	w22, w1
	mov	w19, 0
	bl	_mcount
	add	x0, x23, 11124736
	add	x20, x0, 536
	ldr	w21, [x0, 920]
	cbz	w21, .L445
	.p2align 2
.L440:
	ldr	x2, [x20]
	add	x20, x20, 8
	cbz	x2, .L431
	ldrb	w0, [x2, 3]
	cbnz	w0, .L431
	ldrb	w0, [x2, 5]
	cbnz	w0, .L431
	ldr	w0, [x2, 56]
	cmp	w0, w22
	ccmn	w22, #1, 4, ne
	beq	.L446
	.p2align 2
.L431:
	add	w19, w19, 1
	cmp	w21, w19
	bne	.L440
.L445:
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L446:
	ldr	w3, [x2, 16]
	mov	w1, w19
	mov	x0, x23
	cmp	w3, 1
	beq	.L431
	strb	wzr, [x2, 2]
	bl	MVC_RemoveFrameStoreOutDPB
	b	.L431
	.size	MVC_RemoveUnUsedFrameStore, .-MVC_RemoveUnUsedFrameStore
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_CheckFrameStore
	.type	MVC_CheckFrameStore, %function
MVC_CheckFrameStore:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldrb	w0, [x20, 6]
	cbnz	w0, .L448
	ldrsb	w0, [x19, 8]
	cmp	w0, 1
	bne	.L460
	strb	w0, [x20, 6]
.L448:
	ldrsb	w1, [x19, 6]
	ldr	w0, [x20, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L450
	ldrsb	w3, [x0, 1]
	cmp	w3, 3
	ccmp	w3, wzr, 4, ne
	beq	.L469
	ldrb	w2, [x19, 2]
	ldrb	w3, [x19, 1]
	cbz	w2, .L459
	cmp	w3, 1
	beq	.L459
	mov	x1, 16711680
	ldr	x4, [x19]
	movk	x1, 0xff, lsl 32
	mov	x3, 196608
	movk	x3, 0x3, lsl 32
	and	x1, x4, x1
	cmp	x1, x3
	beq	.L470
	cmp	w2, 1
	beq	.L471
	cmp	w2, 2
	beq	.L472
.L456:
	ldr	x1, [x20, 224]
	ldr	w2, [x0, 192]
	mov	w0, 0
	ldr	w3, [x1, 4]
	cmp	w2, w3
	bhi	.L473
.L466:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L469:
	ldrsb	w2, [x19, 6]
	mov	w0, 1
	ldr	x1, .LC15
	bl	dprint_vfmw
.L452:
	ldr	w0, [x19, 16]
	cmp	w0, 1
	beq	.L457
	mov	w0, -3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L471:
	ldrb	w3, [x19, 4]
	tbz	x3, 0, .L456
	ldr	x1, .LC23
	mov	w0, w2
	bl	dprint_vfmw
	mov	w0, -1
	b	.L466
	.p2align 3
.L472:
	ldrb	w3, [x19, 4]
	tbz	x3, 1, .L456
	ldr	x1, .LC25
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L466
	.p2align 3
.L457:
	mov	w1, 2
	mov	w0, -3
	str	w1, [x19, 16]
	b	.L466
	.p2align 3
.L460:
	mov	w0, -1
	b	.L466
	.p2align 3
.L450:
	ldrsb	w4, [x19, 6]
	mov	x2, x19
	ldr	x1, .LC17
	mov	w0, 1
	ldr	w3, [x19, 16]
	bl	dprint_vfmw
	b	.L452
	.p2align 3
.L459:
	ldr	x1, .LC19
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L466
	.p2align 3
.L473:
	ldr	x1, .LC27
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L466
.L470:
	ldrb	w3, [x19, 4]
	mov	w0, 1
	ldr	x1, .LC21
	bl	dprint_vfmw
	mov	w0, -1
	b	.L466
	.size	MVC_CheckFrameStore, .-MVC_CheckFrameStore
	.align	3
.LC15:
	.xword	.LC14
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
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
	.global	MVC_ExchangePts
	.type	MVC_ExchangePts, %function
MVC_ExchangePts:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x24, x1
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x24, 712]
	cmn	x0, #1
	beq	.L474
	add	x25, x21, 11124736
	ldr	w0, [x25, 920]
	cbz	w0, .L474
	mov	w23, -1
	mov	w20, 0
	mov	x22, -2
	.p2align 2
.L479:
	add	x19, x21, x20, sxtw 3
	add	x19, x19, 11124736
	ldr	x0, [x19, 536]
	cbz	x0, .L478
	ldrsb	w1, [x0, 6]
	ldr	w0, [x21, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L478
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	ccmp	w0, wzr, 4, ne
	beq	.L478
	ldr	x0, [x19, 536]
	ldr	x0, [x0, 712]
	cmp	x0, x22
	bcs	.L478
	mov	w23, w20
	mov	x22, x0
	.p2align 2
.L478:
	ldr	w0, [x25, 920]
	add	w20, w20, 1
	cmp	w0, w20
	bhi	.L479
	cmn	w23, #1
	beq	.L474
	ldr	x2, [x24, 712]
	cmp	x22, x2
	bcc	.L493
.L474:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L493:
	ldr	x1, .LC29
	mov	x3, x22
	mov	w0, 29
	bl	dprint_vfmw
	sxtw	x0, w23
	ldr	x1, [x24, 712]
	add	x0, x0, 1388544
	add	x21, x21, x0, lsl 3
	ldr	x0, [x21, 16920]
	str	x1, [x0, 712]
	str	x22, [x24, 712]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	MVC_ExchangePts, .-MVC_ExchangePts
	.align	3
.LC29:
	.xword	.LC28
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetImagePara
	.type	MVC_GetImagePara, %function
MVC_GetImagePara:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x5, x20, 11116544
	mov	w1, 2240
	ldp	x6, x7, [x20, 272]
	mov	w2, 3992
	ldrb	w4, [x19, 197]
	ldr	w0, [x5, 2984]
	and	w3, w4, -4
	mov	w4, w3
	umull	x1, w0, w1
	ldrb	w0, [x19, 196]
	add	x1, x7, x1
	and	w0, w0, -4
	ldr	w1, [x1, 28]
	strb	w3, [x19, 197]
	strb	w0, [x19, 196]
	umull	x1, w1, w2
	add	x2, x6, x1
	ldrb	w1, [x2, 20]
	cbz	w1, .L495
	add	x1, x20, 11161600
	ldr	w1, [x1, 368]
	lsl	w1, w1, 4
	cmp	w1, 1920
	bhi	.L496
.L495:
	ldrb	w1, [x19, 198]
	orr	w1, w1, 2
	strb	w1, [x19, 198]
	ldr	x3, [x20, 224]
	ldr	w3, [x3, 632]
	cmp	w3, 1
	beq	.L546
.L498:
	and	w1, w1, -5
	strb	w1, [x19, 198]
.L499:
	ldrb	w6, [x19, 2]
	add	x3, x20, 11124736
	ldr	w1, [x20, 56]
	cmp	w6, 3
	str	w1, [x19, 232]
	bhi	.L500
	ldr	x1, .LC30
	ldrb	w1, [x1,w6,uxtw]
	adr	x3, .Lrtx502
	add	x1, x3, w1, sxtb #2
	br	x1
.Lrtx502:
	.section	.rodata
	.align	0
	.align	2
.L502:
	.byte	(.L501 - .Lrtx502) / 4
	.byte	(.L503 - .Lrtx502) / 4
	.byte	(.L504 - .Lrtx502) / 4
	.byte	(.L501 - .Lrtx502) / 4
	.text
	.p2align 3
.L504:
	mov	w1, 2
	bfi	w4, w1, 2, 2
.L503:
	ldrb	w7, [x19]
	orr	w1, w4, 3
	ldr	w3, [x19, 44]
	mov	w4, w1
	bfi	w0, w7, 0, 2
	str	w3, [x19, 256]
	strb	w1, [x19, 197]
	add	x3, x20, 11124736
	strb	w0, [x19, 196]
.L500:
	ldrb	w1, [x2, 20]
	mov	w0, 0
	str	w1, [x19, 584]
	str	w1, [x19, 588]
	ldrb	w1, [x2, 24]
	cbz	w1, .L518
	ldr	w0, [x2, 68]
.L518:
	str	w0, [x19, 596]
	mov	w0, 1
	str	w0, [x19, 592]
	ldrb	w1, [x5, 2979]
	cmp	w1, w0
	csel	w1, w1, wzr, eq
	str	w1, [x19, 296]
	ldr	x0, [x20, 224]
	ldr	w0, [x0, 12]
	cmp	w0, wzr
	ble	.L521
	ldrb	w0, [x19, 736]
	cbz	w0, .L547
.L521:
	ldrsb	w0, [x3, 488]
	cbz	w0, .L522
	ldr	w0, [x3, 504]
	cmp	w0, 3
	beq	.L548
	cmp	w0, 4
	beq	.L549
	cmp	w0, 5
	beq	.L550
	str	wzr, [x19, 464]
	mov	w0, 0
	ldr	x1, .LC32
	ldr	w2, [x3, 504]
	bl	dprint_vfmw
	.p2align 2
.L522:
	ldr	w0, [x20, 120]
	ldrsb	w1, [x19, 6]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L494
	ldr	x3, .LC33
	mov	x2, 664
	add	x1, x19, 72
	ldr	x3, [x3, 104]
	blr	x3
	mov	w0, 15
	str	w0, [x20, 412]
	mov	w2, 4
	mov	w1, 1
	ldrb	w0, [x19, 736]
	strb	w1, [x20, 407]
	cmp	w0, wzr
	csel	w0, w0, w2, eq
	strb	w0, [x20, 400]
	ldr	w0, [x19, 772]
	str	w0, [x20, 416]
	strb	w1, [x20, 405]
	str	w0, [x20, 420]
	str	w0, [x20, 424]
.L494:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L547:
	cmp	w6, 3
	bne	.L521
	and	w0, w4, -4
	strb	w0, [x19, 197]
	b	.L521
	.p2align 3
.L496:
	ldrb	w1, [x19, 198]
	and	w1, w1, -3
	strb	w1, [x19, 198]
	ldr	x3, [x20, 224]
	ldr	w3, [x3, 632]
	cmp	w3, 1
	bne	.L498
.L546:
	ldrb	w3, [x19, 198]
	tbnz	x3, 1, .L498
	orr	w3, w3, 4
	strb	w3, [x19, 198]
	b	.L499
	.p2align 3
.L501:
	ldrb	w1, [x19, 736]
	cbnz	w1, .L505
	ldp	w1, w3, [x19, 40]
	str	w3, [x19, 256]
	ldrb	w9, [x19]
	cbnz	w1, .L528
	mov	w10, 2
	mov	w7, 3
.L506:
	ldr	w3, [x19, 808]
	ldr	w1, [x19, 856]
	cmp	w3, w1
	beq	.L551
	cset	w1, le
.L516:
	add	x3, x20, 11124736
	ldrb	w8, [x3, 524]
	cmp	w8, 3
	beq	.L529
	cmp	w8, 4
	mov	w8, 0
	csel	w1, w1, w8, ne
.L517:
	bfi	w4, w1, 4, 2
	bfi	w0, w9, 0, 2
	bfi	w4, w7, 2, 2
	strb	w0, [x19, 196]
	mov	w0, w4
	bfi	w0, w10, 0, 2
	strb	w0, [x19, 197]
	mov	w4, w0
	b	.L500
	.p2align 3
.L548:
	mov	w0, 1
	str	w0, [x19, 464]
	b	.L522
	.p2align 3
.L550:
	mov	w0, 3
	str	w0, [x19, 464]
	b	.L522
	.p2align 3
.L505:
	ldr	w3, [x19, 816]
	ldr	w1, [x20, 116]
	ldr	w11, [x19, 864]
	cmp	w3, w1
	bhi	.L552
	cmp	w1, w11
	bcc	.L510
.L508:
	ldr	w1, [x19, 44]
	mov	w7, 3
	ldrb	w9, [x19]
	ldrb	w8, [x19, 835]
	ldrb	w10, [x19, 787]
	str	w1, [x19, 256]
.L511:
	ldrb	w1, [x19, 4]
	cmp	w1, 1
	beq	.L553
	cmp	w1, 2
	beq	.L554
.L513:
	stp	w10, w8, [x19, 188]
	mov	w10, 3
	b	.L506
	.p2align 3
.L510:
	ldrb	w9, [x19, 787]
	mov	w7, 1
	ldrb	w8, [x19, 835]
	mov	w10, w9
	str	w3, [x19, 256]
	b	.L511
	.p2align 3
.L549:
	mov	w0, 2
	str	w0, [x19, 464]
	b	.L522
	.p2align 3
.L529:
	mov	w1, 1
	b	.L517
	.p2align 3
.L551:
	mov	x1, 720
	ldr	x3, [x19, 200]
	movk	x1, 0x1e0, lsl 32
	cmp	x3, x1
	cset	w1, ne
	b	.L516
	.p2align 3
.L552:
	cmp	w1, w11
	bcc	.L508
	ldrb	w9, [x19, 835]
	mov	w7, 2
	ldrb	w10, [x19, 787]
	mov	w8, w9
	str	w11, [x19, 256]
	b	.L511
	.p2align 3
.L528:
	mov	w10, 3
	mov	w7, w10
	b	.L506
	.p2align 3
.L553:
	mov	w9, w8
	mov	w7, 2
	str	w11, [x19, 256]
	b	.L513
	.p2align 3
.L554:
	mov	w9, w10
	mov	w7, 1
	str	w3, [x19, 256]
	b	.L513
	.size	MVC_GetImagePara, .-MVC_GetImagePara
	.align	3
.LC30:
	.xword	.L502
	.align	3
.LC32:
	.xword	.LC31
	.align	3
.LC33:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SetFrmRepeatCount
	.type	MVC_SetFrmRepeatCount, %function
MVC_SetFrmRepeatCount:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bls	.L556
	mov	x1, x20
	mov	x0, x19
	bl	MVC_SetFrmRepeatCount.part.1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L556:
	str	wzr, [x20, 24]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_SetFrmRepeatCount, .-MVC_SetFrmRepeatCount
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SplitFrmToFlds
	.type	MVC_SplitFrmToFlds, %function
MVC_SplitFrmToFlds:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w4, [x19, 737]
	mov	w6, 1
	ldrb	w3, [x19, 738]
	mov	w5, 2
	ldrb	w1, [x19, 739]
	ldr	w2, [x19, 768]
	ldr	x0, [x19, 744]
	strb	w4, [x19, 785]
	strb	w3, [x19, 786]
	strb	w6, [x19, 784]
	strb	w1, [x19, 787]
	strb	w4, [x19, 833]
	strb	w3, [x19, 834]
	strb	w5, [x19, 832]
	strb	w1, [x19, 835]
	str	x0, [x19, 792]
	str	w2, [x19, 816]
	str	x0, [x19, 840]
	str	w2, [x19, 864]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_SplitFrmToFlds, .-MVC_SplitFrmToFlds
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_CombineFldsToFrm
	.type	MVC_CombineFldsToFrm, %function
MVC_CombineFldsToFrm:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 808]
	mov	w5, 3
	ldr	w3, [x19, 816]
	ldr	w2, [x19, 856]
	ldr	w0, [x19, 864]
	cmp	w1, w2
	ldr	x4, [x19, 792]
	add	w0, w3, w0
	ldrb	w3, [x19, 833]
	csel	w1, w1, w2, le
	lsr	w0, w0, 1
	strb	w5, [x19, 736]
	str	w1, [x19, 32]
	str	x4, [x19, 744]
	str	w1, [x19, 760]
	str	w0, [x19, 768]
	cbz	w3, .L560
	ldrb	w1, [x19, 785]
	cbz	w1, .L560
	mov	w1, 1
	strb	w1, [x19, 737]
.L562:
	mov	w3, 0
.L563:
	ldrb	w2, [x19, 835]
	ldrb	w1, [x19, 787]
	str	w0, [x19, 44]
	cmp	w1, w2, uxtb
	strb	w3, [x19, 738]
	csel	w0, w1, w2, cs
	strb	w0, [x19, 739]
	strb	w0, [x19]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L560:
	ldr	w1, [x19, 832]
	strb	wzr, [x19, 737]
	tst	w1, 16776960
	beq	.L562
	ldr	w1, [x19, 784]
	mov	w3, 1
	tst	w1, 16776960
	bne	.L563
	b	.L562
	.size	MVC_CombineFldsToFrm, .-MVC_CombineFldsToFrm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetAPC
	.type	MVC_GetAPC, %function
MVC_GetAPC:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x21, x1
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	cbz	x21, .L596
	cmp	w19, 1
	beq	.L576
	cmp	w19, 2
	beq	.L577
	ldr	w23, [x21, 808]
	ldr	w24, [x21, 856]
.L578:
	add	x20, x22, 11124736
	ldr	w2, [x20, 1152]
	cbz	w2, .L587
	ldrb	w0, [x20, 944]
	cbz	w0, .L597
	add	x0, x20, 945
	mov	w19, 0
	b	.L581
	.p2align 3
.L585:
	ldrb	w1, [x0], 1
	cbz	w1, .L579
.L581:
	add	w19, w19, 1
	cmp	w19, w2
	bne	.L585
.L587:
	mov	w0, -1
.L591:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L577:
	ldr	w23, [x21, 856]
	mov	w24, w23
	b	.L578
.L597:
	mov	w19, 0
	.p2align 2
.L579:
	ldrsb	w1, [x21, 6]
	ldr	w0, [x22, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L582
	ldr	x1, [x0, 680]
	cbz	x1, .L582
	uxtw	x1, w19
	mov	w2, 1
	add	x3, x22, x1
	mov	w4, 16
	add	x3, x3, 11124736
	add	x1, x22, x1, lsl 2
	add	x1, x1, 11124736
	strb	w2, [x3, 944]
	mov	w3, w19
	ldr	x0, [x0, 680]
	ldr	w0, [x0, 8]
	str	w0, [x1, 960]
	mov	w0, 13
	str	w23, [x1, 1024]
	str	w24, [x1, 1088]
	ldr	x1, .LC41
	ldr	w2, [x20, 1156]
	cmp	w2, 15
	csinc	w2, w4, w2, hi
	str	w2, [x20, 1156]
	ldr	w2, [x21, 252]
	bl	dprint_vfmw
	str	w19, [x21, 52]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L576:
	ldr	w23, [x21, 808]
	mov	w24, w23
	b	.L578
.L582:
	ldrsb	w2, [x21, 6]
	mov	x4, x0
	ldrb	w3, [x21, 3]
	mov	x5, 0
	ldr	x1, .LC43
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L591
.L596:
	ldr	x2, .LC37
	mov	w3, 2109
	ldr	x1, .LC39
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L591
	.size	MVC_GetAPC, .-MVC_GetAPC
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
.LC43:
	.xword	.LC42
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SlidingWinMark
	.type	MVC_SlidingWinMark, %function
MVC_SlidingWinMark:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11124736
	ldr	x0, [x19, 248]
	ldr	w2, [x1, 932]
	ldr	w0, [x0, 3944]
	ldr	w1, [x1, 928]
	sub	w0, w0, w2
	cmp	w1, w0
	bne	.L598
	mov	x0, x19
	bl	MVC_SlidingWinMark.part.2
.L598:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_SlidingWinMark, .-MVC_SlidingWinMark
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DumpDPB
	.type	MVC_DumpDPB, %function
MVC_DumpDPB:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC44
	ldr	w0, [x0]
	tbz	x0, 14, .L600
	add	x22, x21, 11124736
	ldr	w0, [x22, 924]
	cbz	w0, .L606
	ldr	x20, .LC48
	mov	w19, 0
	.p2align 2
.L605:
	uxtw	x3, w19
	mov	w2, w19
	add	x3, x3, 1388544
	mov	x1, x20
	mov	w0, 14
	add	w19, w19, 1
	add	x3, x21, x3, lsl 3
	ldr	x3, [x3, 16920]
	ldrb	w5, [x3, 3]
	ldr	w4, [x3, 32]
	ldr	w3, [x3, 20]
	bl	dprint_vfmw
	ldr	w0, [x22, 924]
	cmp	w0, w19
	bhi	.L605
.L606:
	ldr	x25, .LC46
	mov	w0, 14
	mov	x1, x25
	bl	dprint_vfmw
	ldr	w0, [x22, 928]
	cbz	w0, .L604
	ldr	x24, .LC50
	mov	w19, 0
	ldr	x23, .LC52
	.p2align 2
.L607:
	add	x20, x21, x19, uxtw 3
	mov	w2, w19
	add	x20, x20, 11124736
	mov	x1, x24
	mov	w0, 14
	ldr	x3, [x20, 664]
	ldrb	w5, [x3, 3]
	ldr	w4, [x3, 32]
	ldr	w3, [x3, 20]
	bl	dprint_vfmw
	ldr	x3, [x20, 664]
	mov	w2, w19
	mov	x1, x23
	mov	w0, 14
	add	w19, w19, 1
	ldr	w3, [x3, 760]
	bl	dprint_vfmw
	ldr	w0, [x22, 928]
	cmp	w0, w19
	bhi	.L607
.L604:
	mov	x1, x25
	mov	w0, 14
	bl	dprint_vfmw
.L600:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	MVC_DumpDPB, .-MVC_DumpDPB
	.align	3
.LC44:
	.xword	g_PrintEnable
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
	.global	MVC_UpdateCurrFrameInfo
	.type	MVC_UpdateCurrFrameInfo, %function
MVC_UpdateCurrFrameInfo:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x3, x19, 11157504
	mov	w0, 3
	ldr	x19, [x3, 4400]
	ldrb	w2, [x3, 3722]
	strb	w2, [x19, 1]
	ldrb	w2, [x3, 3724]
	cbnz	w2, .L614
	ldrb	w0, [x3, 3725]
	mov	w1, 3
	cmp	w0, wzr
	csel	w0, w0, w1, eq
.L614:
	strb	w0, [x19, 3]
	add	x4, x3, 3720
	mov	w1, 3
	ldr	w0, [x3, 4416]
	str	w0, [x19, 20]
	ldr	w0, [x3, 4460]
	str	w0, [x19, 44]
	ldrb	w0, [x4, 12]
	strb	w0, [x19]
	ldr	w0, [x3, 4428]
	str	w0, [x19, 32]
	ldr	w0, [x3, 4484]
	str	w0, [x19, 48]
	ldr	w0, [x3, 4420]
	str	w0, [x19, 28]
	ldrb	w0, [x4, 9]
	str	w0, [x19, 40]
	ldrb	w0, [x4, 7]
	cmp	w0, 1
	csel	w0, w1, wzr, eq
	strb	w0, [x19, 4]
	ldrb	w5, [x4, 3]
	cmp	w5, 1
	beq	.L617
	cbz	w5, .L618
	cmp	w5, 2
	bne	.L613
	str	x19, [x19, 840]
	mov	w2, 1
	strb	w2, [x19, 832]
	ldrb	w2, [x4, 4]
	strb	w2, [x19, 833]
	ldrb	w2, [x4, 5]
	strb	w2, [x19, 834]
	ldr	w2, [x3, 4436]
	str	w2, [x19, 856]
	ldrb	w6, [x4, 12]
	strb	w6, [x19, 835]
	ldr	w2, [x3, 4460]
	str	w2, [x19, 864]
	str	wzr, [x19, 40]
	ldrb	w7, [x4, 1]
	cbz	w7, .L640
	ldr	w5, [x19, 816]
	orr	w0, w0, 2
	strb	w1, [x19, 2]
	mov	w1, 0
	add	w2, w2, w5
	str	w2, [x19, 44]
	str	w2, [x19, 768]
	ldrb	w2, [x4, 7]
	cmp	w2, 1
	csel	w0, w0, w1, eq
	strb	w0, [x19, 4]
	ldr	x0, [x3, 4376]
	cmn	x0, #1
	beq	.L626
	ldr	x1, [x19, 712]
	cmn	x1, #1
	beq	.L641
.L626:
	ldrb	w1, [x19, 787]
.L644:
	cmp	w1, w6
	mov	x0, x19
	csel	w6, w1, w6, cs
	strb	w6, [x19]
	ldr	w1, [x3, 4428]
	str	w1, [x19, 32]
	bl	MVC_CombineFldsToFrm
.L613:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L618:
	strb	w1, [x19, 2]
	add	x1, x3, 3736
	strb	wzr, [x19, 736]
	mov	x2, 664
	str	x19, [x19, 744]
	add	x0, x19, 72
	ldrb	w23, [x4, 4]
	strb	w23, [x19, 737]
	ldrb	w22, [x4, 5]
	strb	w22, [x19, 738]
	ldr	w5, [x3, 4432]
	str	w5, [x19, 760]
	ldrb	w20, [x4, 12]
	strb	w20, [x19, 739]
	ldr	w21, [x3, 4460]
	str	w21, [x19, 768]
	ldr	w4, [x3, 4436]
	str	w4, [x19, 808]
	ldr	w3, [x3, 4440]
	str	w3, [x19, 856]
	bl	memcpy
	strb	w23, [x19, 785]
	strb	w22, [x19, 786]
	mov	w1, 1
	strb	w20, [x19, 787]
	mov	w0, 2
	strb	w1, [x19, 784]
	strb	w23, [x19, 833]
	strb	w22, [x19, 834]
	strb	w0, [x19, 832]
	strb	w20, [x19, 835]
	str	x19, [x19, 792]
	str	w21, [x19, 816]
	str	x19, [x19, 840]
	str	w21, [x19, 864]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L617:
	strb	w5, [x19, 784]
	str	x19, [x19, 792]
	ldrb	w2, [x4, 4]
	strb	w2, [x19, 785]
	ldrb	w2, [x4, 5]
	strb	w2, [x19, 786]
	ldr	w2, [x3, 4436]
	str	w2, [x19, 808]
	ldrb	w6, [x4, 12]
	strb	w6, [x19, 787]
	ldr	w2, [x3, 4460]
	str	w2, [x19, 816]
	str	wzr, [x19, 40]
	ldrb	w7, [x4, 1]
	cbz	w7, .L642
	ldr	w5, [x19, 864]
	orr	w0, w0, 1
	strb	w1, [x19, 2]
	mov	w1, 0
	add	w2, w2, w5
	str	w2, [x19, 44]
	str	w2, [x19, 768]
	ldrb	w2, [x4, 7]
	cmp	w2, 1
	csel	w0, w0, w1, eq
	strb	w0, [x19, 4]
	ldr	x0, [x3, 4376]
	cmn	x0, #1
	beq	.L622
	ldr	x1, [x19, 712]
	cmn	x1, #1
	beq	.L643
.L622:
	ldrb	w1, [x19, 835]
	mov	x0, x19
	cmp	w1, w6
	csel	w6, w1, w6, cs
	strb	w6, [x19]
	ldr	w1, [x3, 4428]
	str	w1, [x19, 32]
	bl	MVC_CombineFldsToFrm
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L640:
	strb	w5, [x19, 2]
	add	x1, x3, 3736
	str	w2, [x19, 44]
	add	x0, x19, 72
	str	w2, [x19, 768]
	mov	x2, 664
	ldrb	w3, [x4, 7]
	cmp	w3, 1
	csel	w7, wzr, w5, ne
	strb	w7, [x19, 4]
	bl	memcpy
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L642:
	str	w2, [x19, 44]
	add	x1, x3, 3736
	str	w2, [x19, 768]
	add	x0, x19, 72
	strb	w5, [x19, 2]
	mov	x2, 664
	ldrb	w3, [x4, 7]
	cmp	w3, 1
	cset	w3, eq
	strb	w3, [x19, 4]
	bl	memcpy
	b	.L613
	.p2align 3
.L643:
	str	x0, [x19, 712]
	b	.L622
	.p2align 3
.L641:
	str	x0, [x19, 712]
	ldrb	w1, [x19, 787]
	b	.L644
	.size	MVC_UpdateCurrFrameInfo, .-MVC_UpdateCurrFrameInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SimpleSlideDPB
	.type	MVC_SimpleSlideDPB, %function
MVC_SimpleSlideDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 11161600
	bl	_mcount
	add	x0, x20, 11124736
	ldr	w19, [x0, 920]
	ldr	w1, [x0, 924]
	cmp	w1, w19
	bcc	.L646
	cbz	w19, .L651
	add	x0, x0, 536
	mov	w5, 0
	mov	w4, 2147483647
	mov	w1, 0
	.p2align 2
.L649:
	ldr	x2, [x0]
	add	x0, x0, 8
	cbz	x2, .L648
	ldr	w3, [x2, 64]
	cmp	w3, w4
	bcs	.L648
	ldr	w6, [x2, 56]
	ldr	w2, [x21, 392]
	cmp	w6, w2
	csel	w4, w4, w3, ne
	csel	w5, w5, w1, ne
.L648:
	add	w1, w1, 1
	cmp	w19, w1
	bne	.L649
	mov	w19, w5
.L647:
	sxtw	x1, w5
	mov	x0, x20
	add	x1, x1, 1388544
	add	x1, x20, x1, lsl 3
	ldr	x1, [x1, 16920]
	bl	MVC_UnMarkFrameStoreRef
	mov	w1, w19
	mov	x0, x20
	bl	MVC_RemoveFrameStoreOutDPB
.L646:
	add	x20, x20, 11157504
	strb	wzr, [x20, 3724]
	ldr	w0, [x21, 328]
	cbz	w0, .L645
	mov	w0, 1
	strb	w0, [x20, 3725]
.L645:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L651:
	mov	w5, 0
	b	.L647
	.size	MVC_SimpleSlideDPB, .-MVC_SimpleSlideDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReleaseNAL
	.type	MVC_ReleaseNAL, %function
MVC_ReleaseNAL:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w21, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L669
	ldr	x23, .LC58
	add	x19, x20, 8
	strb	wzr, [x20, 1]
	add	x22, x20, 72
	strb	wzr, [x20, 3]
.L664:
	ldr	x1, [x19]
	mov	w0, w21
	cbz	x1, .L663
	ldr	w1, [x19, 28]
	bl	SM_ReleaseStreamSeg
	ldr	w3, [x19, 8]
	mov	x1, x23
	ldr	x2, [x19]
	mov	w0, 7
	bl	dprint_vfmw
	str	xzr, [x19]
	str	wzr, [x19, 8]
	str	wzr, [x19, 20]
.L663:
	add	x19, x19, 32
	cmp	x19, x22
	bne	.L664
	strb	wzr, [x20]
	str	wzr, [x20, 76]
.L660:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L669:
	ldr	x2, .LC55
	mov	w3, 4022
	ldr	x1, .LC56
	mov	w0, 0
	bl	dprint_vfmw
	b	.L660
	.size	MVC_ReleaseNAL, .-MVC_ReleaseNAL
	.align	3
.LC55:
	.xword	.LC36
	.align	3
.LC56:
	.xword	.LC38
	.align	3
.LC58:
	.xword	.LC57
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearCurrNal
	.type	MVC_ClearCurrNal, %function
MVC_ClearCurrNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 240]
	cbz	x1, .L671
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L671:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_ClearCurrNal, .-MVC_ClearCurrNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearCurrSlice
	.type	MVC_ClearCurrSlice, %function
MVC_ClearCurrSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC60
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 240]
	cbz	x1, .L676
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L676:
	ldr	w1, [x19, 80]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 80]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_ClearCurrSlice, .-MVC_ClearCurrSlice
	.align	3
.LC60:
	.xword	.LC59
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearAllNal
	.type	MVC_ClearAllNal, %function
MVC_ClearAllNal:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 12288
	add	x19, x21, 1520
	bl	_mcount
	add	x20, x20, 2384
	b	.L682
	.p2align 3
.L681:
	add	x19, x19, 96
	cmp	x19, x20
	beq	.L684
.L682:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L681
	ldr	w0, [x21, 120]
	mov	x1, x19
	add	x19, x19, 96
	bl	MVC_ReleaseNAL
	cmp	x19, x20
	bne	.L682
.L684:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_ClearAllNal, .-MVC_ClearAllNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearAllSlice
	.type	MVC_ClearAllSlice, %function
MVC_ClearAllSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 11161600
	add	x19, x20, 1208
	add	x20, x20, 2296
	bl	_mcount
	.p2align 2
.L687:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L686
	ldr	w0, [x21, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19]
.L686:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L687
	str	wzr, [x21, 64]
	mov	w0, 0
	str	wzr, [x21, 104]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_ClearAllSlice, .-MVC_ClearAllSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearCurrPic
	.type	MVC_ClearCurrPic, %function
MVC_ClearCurrPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	mov	w4, 32
	ldr	w8, [x19, 40]
	mov	w7, 23352
	movk	w7, 0x1, lsl 16
	mov	w6, 2
	strb	w4, [x0, 530]
	add	x4, x0, 512
	strb	wzr, [x0, 528]
	mov	w5, 7
	strb	w6, [x0, 529]
	mov	w3, 3
	strb	w5, [x0, 531]
	mov	w2, -1
	str	w8, [x0, 540]
	mov	w1, 262144
	str	w7, [x0, 544]
	stp	w3, w2, [x4, 40]
	stp	wzr, wzr, [x4, 48]
	str	w1, [x0, 568]
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_ClearCurrPic, .-MVC_ClearCurrPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ArrangeVahbMem
	.type	MVC_ArrangeVahbMem, %function
MVC_ArrangeVahbMem:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w2
	mov	w20, w1
	mov	w22, w4
	bl	_mcount
	mov	w0, 8160
	sub	w2, w21, #32
	sub	w1, w20, #32
	cmp	w2, w0
	ccmp	w1, w0, 2, ls
	bhi	.L694
	ldr	x3, .LC61
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x3, 96]
	blr	x3
	strb	wzr, [x29, 64]
	ldr	x0, [x19, 224]
	stp	w20, w21, [x29, 88]
	strb	wzr, [x29, 65]
	ldr	w0, [x0, 28]
	stp	w20, w21, [x29, 72]
	stp	w20, w21, [x29, 80]
	cmp	w0, 24
	beq	.L707
	add	x0, x19, 11124736
	mov	w1, 5
	strb	wzr, [x29, 68]
	sxtb	w4, w22
	strb	w1, [x29, 69]
	ldr	w0, [x0, 920]
	add	w0, w0, 3
	strb	w0, [x29, 67]
.L702:
	ldr	w0, [x19, 120]
	add	x1, x29, 64
	strb	w4, [x29, 70]
	strb	wzr, [x29, 66]
	bl	FSP_ConfigInstance
	cbnz	w0, .L698
	ldr	x1, [x19, 224]
	add	x3, x29, 60
	ldr	w0, [x19, 120]
	ldr	w2, [x1, 24]
	ldr	w1, [x1, 20]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	mov	w1, w0
	beq	.L708
	mov	w0, 1
	cbnz	w1, .L700
.L703:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L707:
	mov	w1, 1
	mov	w0, 5
	strb	w1, [x29, 67]
	mov	w4, 1
	strb	wzr, [x29, 68]
	strb	w0, [x29, 69]
	b	.L702
	.p2align 3
.L708:
	add	x0, x19, 912
	bl	ResetVoQueue
.L700:
	ldr	x1, .LC65
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L703
	.p2align 3
.L694:
	ldr	x1, .LC63
	mov	w3, w21
	mov	w2, w20
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L698:
	ldr	x1, .LC67
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L703
	.size	MVC_ArrangeVahbMem, .-MVC_ArrangeVahbMem
	.align	3
.LC61:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC65:
	.xword	.LC64
	.align	3
.LC67:
	.xword	.LC66
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_RepairList
	.type	MVC_RepairList, %function
MVC_RepairList:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x6, x19, 11116544
	ldrb	w0, [x6, 2968]
	cmp	w0, 1
	beq	.L727
	cbz	w0, .L712
	cmp	w0, 2
	mov	w0, 0
	bne	.L723
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L723:
	mov	x0, x19
	bl	MVC_ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L727:
	mov	w10, 2
.L711:
	add	x6, x6, 3016
	add	x5, x19, 288
	mov	x8, 0
	mov	w7, 0
	mov	w12, 1
	add	x11, x19, 11161600
	.p2align 2
.L724:
	ldr	w0, [x6]
	cbz	w0, .L714
	ldr	x1, [x5]
	cbnz	x1, .L738
	sub	w3, w0, #1
	add	x9, x8, 37
	add	x0, x5, 8
	add	x4, x9, x3, uxtw
	add	x4, x19, x4, lsl 3
	b	.L717
	.p2align 3
.L718:
	ldr	x2, [x0], 8
	cbnz	x2, .L725
.L717:
	cmp	x0, x4
	bne	.L718
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L723
	ldr	x2, [x11, 304]
	add	x2, x2, 736
.L725:
	add	x3, x9, x3, uxtw
	mov	x0, x5
	add	x3, x19, x3, lsl 3
	cbz	x1, .L739
	.p2align 2
.L720:
	add	x0, x0, 8
	cmp	x3, x0
	beq	.L721
.L740:
	ldr	x1, [x0]
	cbnz	x1, .L720
.L739:
	str	x2, [x0]
	add	x0, x0, 8
	cmp	x3, x0
	bne	.L740
	.p2align 2
.L721:
	add	w7, w7, 1
	add	x6, x6, 4
	cmp	w7, w10
	add	x5, x5, 264
	add	x8, x8, 33
	bcc	.L724
.L741:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L714:
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L723
	str	w12, [x6]
	add	w7, w7, 1
	cmp	w7, w10
	add	x6, x6, 4
	ldr	x0, [x11, 304]
	add	x8, x8, 33
	add	x0, x0, 736
	str	x0, [x5]
	add	x5, x5, 264
	bcc	.L724
	b	.L741
.L738:
	sub	w3, w0, #1
	mov	x2, x1
	add	x9, x8, 37
	b	.L725
.L712:
	mov	w10, 1
	b	.L711
	.size	MVC_RepairList, .-MVC_RepairList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetShortTermPicPoint
	.type	MVC_GetShortTermPicPoint, %function
MVC_GetShortTermPicPoint:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 11116544
	mov	w5, 0
	ldrb	w1, [x0, 2969]
	cbz	w1, .L743
	ldrb	w0, [x0, 2970]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L743:
	add	x0, x20, 11124736
	ldr	w2, [x0, 928]
	cbz	w2, .L751
	sub	w2, w2, #1
	add	x0, x0, 664
	add	x2, x2, 1388544
	add	x2, x2, 2132
	add	x4, x20, x2, lsl 3
	b	.L748
	.p2align 3
.L761:
	cmp	w3, 3
	beq	.L760
.L746:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L751
.L748:
	ldr	x2, [x0]
	ldrb	w3, [x2, 3]
	cbz	w5, .L761
	tbz	x3, 0, .L747
	ldr	w6, [x2, 784]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L762
.L747:
	tbz	x3, 1, .L746
	ldr	w3, [x2, 832]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L746
	ldr	w1, [x2, 852]
	cmp	w19, w1
	bne	.L746
	add	x0, x2, 832
	b	.L744
	.p2align 3
.L762:
	ldr	w1, [x2, 804]
	cmp	w1, w19
	bne	.L747
	add	x0, x2, 784
	b	.L744
	.p2align 3
.L760:
	ldr	w3, [x2, 736]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L746
	ldr	w1, [x2, 756]
	cmp	w19, w1
	bne	.L746
	add	x0, x2, 736
	b	.L744
	.p2align 3
.L751:
	mov	x0, 0
.L744:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_GetShortTermPicPoint, .-MVC_GetShortTermPicPoint
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetLongTermPicPoint
	.type	MVC_GetLongTermPicPoint, %function
MVC_GetLongTermPicPoint:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 11116544
	mov	w5, 0
	ldrb	w1, [x0, 2969]
	cbz	w1, .L764
	ldrb	w0, [x0, 2970]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L764:
	add	x0, x20, 11124736
	ldr	w2, [x0, 932]
	cbz	w2, .L772
	sub	w2, w2, #1
	add	x0, x0, 792
	add	x2, x2, 1388544
	add	x2, x2, 2148
	add	x4, x20, x2, lsl 3
	b	.L769
	.p2align 3
.L782:
	cmp	w3, 3
	beq	.L781
.L767:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L772
.L769:
	ldr	x2, [x0]
	ldrb	w3, [x2, 3]
	cbz	w5, .L782
	tbz	x3, 0, .L768
	ldr	w6, [x2, 784]
	and	w6, w6, 16776960
	cmp	w6, 256
	beq	.L783
.L768:
	tbz	x3, 1, .L767
	ldr	w3, [x2, 832]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L767
	ldr	w1, [x2, 848]
	cmp	w19, w1
	bne	.L767
	add	x0, x2, 832
	b	.L765
	.p2align 3
.L783:
	ldr	w1, [x2, 800]
	cmp	w1, w19
	bne	.L768
	add	x0, x2, 784
	b	.L765
	.p2align 3
.L781:
	ldr	w3, [x2, 736]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L767
	ldr	w1, [x2, 752]
	cmp	w19, w1
	bne	.L767
	add	x0, x2, 736
	b	.L765
	.p2align 3
.L772:
	mov	x0, 0
.L765:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_GetLongTermPicPoint, .-MVC_GetLongTermPicPoint
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReorderSTList
	.type	MVC_ReorderSTList, %function
MVC_ReorderSTList:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	mov	w23, w3
	mov	x22, x4
	mov	w24, w5
	bl	_mcount
	uxtw	x6, w20
	mov	x0, x19
	lsl	x2, x6, 8
	mov	w1, w23
	add	x6, x2, x6, lsl 3
	add	x6, x6, 288
	add	x19, x19, x6
	bl	MVC_GetShortTermPicPoint
	ldr	w6, [x22]
	add	w2, w21, 1
	cmp	w2, w6
	ble	.L785
	mov	w1, w2
	.p2align 2
.L786:
	add	x6, x19, x1, sxtw 3
	ldr	x6, [x6, -8]
	str	x6, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w6, [x22]
	cmp	w6, w1
	blt	.L786
.L785:
	add	w1, w6, 1
	str	w1, [x22]
	str	x0, [x19, w6, sxtw 3]
	ldr	w0, [x22]
	cmp	w2, w0
	mov	w4, w0
	bge	.L794
	b	.L784
	.p2align 3
.L789:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L788:
	cmp	w2, w0
	blt	.L784
.L794:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L788
	ldrb	w6, [x1, 1]
	cbnz	w6, .L789
	ldr	w6, [x1, 20]
	cmp	w23, w6
	bne	.L789
	ldr	x3, [x1, 8]
	ldr	w3, [x3, 56]
	cmp	w3, w24
	bne	.L789
	cmp	w2, w0
	bge	.L794
.L784:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	MVC_ReorderSTList, .-MVC_ReorderSTList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReorderLTList
	.type	MVC_ReorderLTList, %function
MVC_ReorderLTList:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	w21, w2
	mov	w23, w3
	mov	x22, x4
	mov	w24, w5
	bl	_mcount
	uxtw	x6, w20
	mov	x0, x19
	lsl	x2, x6, 8
	mov	w1, w23
	add	x6, x2, x6, lsl 3
	add	x6, x6, 288
	add	x19, x19, x6
	bl	MVC_GetLongTermPicPoint
	ldr	w6, [x22]
	add	w2, w21, 1
	cmp	w2, w6
	ble	.L800
	mov	w1, w2
	.p2align 2
.L801:
	add	x6, x19, x1, sxtw 3
	ldr	x6, [x6, -8]
	str	x6, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w6, [x22]
	cmp	w6, w1
	blt	.L801
.L800:
	add	w1, w6, 1
	str	w1, [x22]
	str	x0, [x19, w6, sxtw 3]
	ldr	w0, [x22]
	cmp	w2, w0
	mov	w4, w0
	bge	.L811
	b	.L799
	.p2align 3
.L804:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L803:
	cmp	w2, w0
	blt	.L799
.L811:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L803
	ldrb	w6, [x1, 1]
	cbz	w6, .L804
	ldr	w6, [x1, 16]
	cmp	w23, w6
	bne	.L804
	ldr	x3, [x1, 8]
	ldr	w3, [x3, 56]
	cmp	w3, w24
	bne	.L804
	cmp	w2, w0
	bge	.L811
.L799:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	MVC_ReorderLTList, .-MVC_ReorderLTList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetMaxViewIdx
	.type	MVC_GetMaxViewIdx, %function
MVC_GetMaxViewIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w1
	mov	w22, w2
	mov	w20, w3
	bl	_mcount
	add	x0, x21, 10768384
	add	x1, x0, 4068
	ldr	w5, [x0, 4064]
	adds	w5, w5, 1
	beq	.L825
	ldr	w0, [x0, 4068]
	cmp	w19, w0
	beq	.L825
	mov	w6, w5
	mov	w0, 0
	b	.L819
	.p2align 3
.L821:
	ldr	w4, [x1, w0, sxtw 2]
	cmp	w19, w4
	beq	.L827
.L819:
	add	w0, w0, 1
	cmp	w0, w5
	bne	.L821
.L822:
	mov	w0, 0
	tbnz	w6, #31, .L820
.L818:
	sbfiz	x0, x20, 1, 32
	add	x0, x0, x6, sxtw
	cbnz	w22, .L828
	add	x0, x21, x0, lsl 2
	add	x0, x0, 10772480
	ldr	w0, [x0, 12]
.L820:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L828:
	add	x0, x0, 2691072
	ldp	x19, x20, [sp, 16]
	add	x0, x21, x0, lsl 2
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ldr	w0, [x0, 8172]
	ret
	.p2align 3
.L827:
	mov	w6, w0
	b	.L822
.L825:
	mov	w6, 0
	b	.L818
	.size	MVC_GetMaxViewIdx, .-MVC_GetMaxViewIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_get_inter_view_pic
	.type	mvc_get_inter_view_pic, %function
mvc_get_inter_view_pic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w22, w3
	mov	w19, w1
	mov	w21, w2
	bl	_mcount
	uxtw	x1, w22
	add	x2, x1, 2777088
	lsl	x0, x1, 3
	sub	x0, x0, x1
	add	x2, x20, x2, lsl 2
	lsl	x0, x0, 3
	sub	x0, x0, x1
	lsl	x0, x0, 5
	ldr	w1, [x2, 12808]
	add	x0, x0, 11108352
	add	x0, x0, 272
	add	x0, x20, x0
	cbz	w1, .L835
	sub	w4, w1, #1
	add	x5, x20, 11157504
	add	x4, x4, 1
	lsl	x3, x4, 3
	sub	x3, x3, x4
	lsl	x3, x3, 3
	sub	x4, x3, x4
	add	x4, x0, x4, lsl 4
	b	.L834
	.p2align 3
.L831:
	add	x0, x0, 880
	cmp	x0, x4
	beq	.L835
.L834:
	ldr	w3, [x0, 56]
	cmp	w3, w19
	bne	.L831
	ldrb	w1, [x5, 3723]
	cmp	w1, 1
	cbnz	w1, .L832
	ldr	w1, [x0, 764]
	cmp	w21, w1
	bne	.L831
	add	x0, x0, 736
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L832:
	bne	.L833
	ldr	w1, [x0, 812]
	cmp	w1, w21
	bne	.L831
	add	x0, x0, 784
	b	.L830
	.p2align 3
.L833:
	cmp	w1, 2
	bne	.L831
	ldr	w1, [x0, 860]
	cmp	w21, w1
	bne	.L831
	add	x0, x0, 832
	b	.L830
	.p2align 3
.L835:
	mov	x0, 0
.L830:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	mvc_get_inter_view_pic, .-mvc_get_inter_view_pic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_reorder_interview
	.type	mvc_reorder_interview, %function
mvc_reorder_interview:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	w24, w5
	mov	w22, w3
	mov	w23, w4
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	uxtw	x0, w24
	mov	w3, w24
	lsl	x5, x0, 8
	mov	w2, w23
	add	x5, x5, x0, lsl 3
	mov	w1, w22
	mov	x0, x19
	add	x5, x5, 288
	add	x19, x19, x5
	bl	mvc_get_inter_view_pic
	cbz	x0, .L837
	ldr	w3, [x21]
	add	w1, w20, 1
	cmp	w1, w3
	bls	.L839
	mov	w2, w1
	uxtw	x5, w1
	.p2align 2
.L840:
	sub	w2, w2, #1
	lsl	x3, x5, 3
	uxtw	x5, w2
	ldr	x6, [x19, w2, uxtw 3]
	str	x6, [x19, x3]
	ldr	w3, [x21]
	cmp	w3, w2
	bcc	.L840
.L839:
	add	w2, w3, 1
	str	w2, [x21]
	str	x0, [x19, w3, uxtw 3]
	ldr	w0, [x21]
	cmp	w1, w0
	bcc	.L837
	mov	w3, w0
	b	.L844
	.p2align 3
.L842:
	str	x2, [x19, w3, uxtw 3]
	cmp	w1, w0
	add	w3, w3, 1
	bcc	.L837
.L844:
	ldr	x2, [x19, w0, uxtw 3]
	add	w0, w0, 1
	cbz	x2, .L842
	ldr	x5, [x2, 8]
	ldr	w5, [x5, 56]
	cmp	w22, w5
	bne	.L842
	ldr	w5, [x2, 28]
	cmp	w23, w5
	bne	.L842
	cmp	w1, w0
	bcs	.L844
.L837:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	mvc_reorder_interview, .-mvc_reorder_interview
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReorderRefPiclist
	.type	MVC_ReorderRefPiclist, %function
MVC_ReorderRefPiclist:
	stp	x29, x30, [sp, -192]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x27, x0
	mov	x0, x30
	add	x20, x27, 11116544
	mov	w19, w1
	mov	w21, w2
	bl	_mcount
	str	wzr, [x29, 188]
	mov	w0, 0
	ldrb	w1, [x20, 2969]
	cbz	w1, .L852
	ldrb	w1, [x20, 2970]
	mov	w0, 2
	cmp	w1, wzr
	csinc	w0, w0, wzr, ne
.L852:
	cmp	w19, 1
	bls	.L908
.L851:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	ret
	.p2align 3
.L908:
	cbz	w19, .L909
	add	x1, x20, 2052
	str	x1, [x29, 168]
	add	x1, x20, 2316
	str	x1, [x29, 120]
	add	x1, x20, 2576
	str	x1, [x29, 104]
	ldr	x1, [x27, 248]
	add	x28, x20, 2836
	ldr	w25, [x1, 2896]
	add	w1, w25, 4
	mov	w25, 1
	lsl	w1, w25, w1
	str	w1, [x29, 148]
	cbnz	w0, .L856
.L914:
	ldr	w0, [x20, 2996]
	str	w0, [x29, 144]
.L857:
	cmn	w21, #2
	beq	.L851
	ldr	x0, [x29, 168]
	ldr	w1, [x0]
	cmp	w1, 3
	beq	.L851
	add	w23, w21, 1
	mov	w2, 1
	lsl	x0, x23, 2
	str	x0, [x29, 160]
	stp	w2, wzr, [x29, 152]
	add	x0, x27, 10768384
	add	x2, x27, 11161600
	mov	x23, 0
	str	x2, [x29, 136]
	mov	w22, 0
	ubfiz	x2, x19, 1, 32
	mov	w26, 0
	ldr	w24, [x29, 144]
	add	x25, x0, 4068
	str	x0, [x29, 112]
	str	x2, [x29, 128]
	b	.L860
	.p2align 3
.L913:
	ldr	w3, [x0, 8188]
.L883:
	ldr	x0, [x29, 136]
	mov	w5, w19
	add	x2, x29, 188
	mov	w1, w21
	ldr	w4, [x0, 332]
	mov	x0, x27
	bl	mvc_reorder_interview
.L865:
	ldr	x0, [x29, 160]
	cmp	x0, x23
	beq	.L851
	add	x23, x23, 4
	ldr	x0, [x29, 168]
	ldr	w1, [x0, x23]
	cmp	w1, 3
	beq	.L851
.L860:
	cmp	w1, 1
	bls	.L910
	cmp	w1, 2
	beq	.L911
	ldr	w0, [x29, 152]
	cbnz	w0, .L867
	ldrb	w5, [x20, 2977]
	mov	w6, w26
.L868:
	cmp	w1, 4
	ldr	w0, [x28, x23]
	beq	.L912
	add	w0, w0, 1
	add	w26, w0, w6
	cmp	w22, w26
	sub	w0, w26, w22
	csel	w26, w0, w26, le
.L881:
	ldr	w1, [x29, 156]
	ldr	x0, [x29, 128]
	add	x0, x0, x26, sxtw
	add	x0, x0, x1, sxtw
	add	x0, x0, 2691072
	add	x0, x27, x0, lsl 2
	cbnz	w5, .L913
	ldr	w3, [x0, 8220]
	b	.L883
	.p2align 3
.L909:
	add	x1, x20, 1920
	str	x1, [x29, 168]
	add	x1, x20, 2184
	str	x1, [x29, 120]
	add	x1, x20, 2448
	str	x1, [x29, 104]
	ldr	x1, [x27, 248]
	add	x28, x20, 2704
	ldr	w25, [x1, 2896]
	add	w1, w25, 4
	mov	w25, 1
	lsl	w1, w25, w1
	str	w1, [x29, 148]
	cbz	w0, .L914
.L856:
	ldr	w0, [x20, 2996]
	ldr	w1, [x29, 148]
	lsl	w0, w0, 1
	add	w0, w0, 1
	lsl	w1, w1, 1
	stp	w0, w1, [x29, 144]
	b	.L857
	.p2align 3
.L910:
	ldr	x0, [x29, 120]
	ldr	w0, [x0, x23]
	cbnz	w1, .L862
	mvn	w0, w0
	add	w24, w24, w0
	ldr	w0, [x29, 148]
	cmp	w24, wzr
	add	w0, w24, w0
	csel	w24, w0, w24, lt
.L863:
	ldr	w0, [x29, 144]
	add	x4, x29, 188
	mov	w2, w21
	mov	w1, w19
	cmp	w0, w24
	add	x0, x27, 11120640
	ldr	w5, [x0, 512]
	ldr	w0, [x29, 148]
	sub	w3, w24, w0
	mov	x0, x27
	csel	w3, w3, w24, lt
	bl	MVC_ReorderSTList
	b	.L865
	.p2align 3
.L912:
	mvn	w0, w0
	add	w26, w0, w6
	cmp	w26, wzr
	add	w0, w26, w22
	csel	w26, w0, w26, lt
	b	.L881
	.p2align 3
.L867:
	ldr	x4, [x29, 112]
	add	x0, x27, 11120640
	ldr	w2, [x4, 4064]
	ldr	w3, [x0, 512]
	adds	w2, w2, 1
	beq	.L870
	ldr	w0, [x4, 4068]
	cmp	w3, w0
	beq	.L870
	mov	w0, 0
	str	w2, [x29, 156]
	b	.L873
	.p2align 3
.L874:
	ldr	w4, [x25, w0, sxtw 2]
	cmp	w3, w4
	beq	.L915
.L873:
	add	w0, w0, 1
	cmp	w2, w0
	bne	.L874
.L905:
	ldrb	w5, [x20, 2977]
	mov	w6, w2
	mov	w0, 0
	b	.L877
	.p2align 3
.L878:
	ldr	w4, [x25, w0, sxtw 2]
	cmp	w3, w4
	beq	.L907
.L877:
	add	w0, w0, 1
	cmp	w0, w2
	bne	.L878
	tbnz	w6, #31, .L891
.L885:
	sbfiz	x0, x19, 1, 32
	add	x0, x0, x6, sxtw
	cbz	w5, .L879
	add	x0, x0, 2691072
	mov	w6, -1
	str	wzr, [x29, 152]
	add	x0, x27, x0, lsl 2
	ldr	w22, [x0, 8172]
	b	.L868
	.p2align 3
.L862:
	add	w0, w0, 1
	add	w24, w24, w0
	ldr	w0, [x29, 148]
	cmp	w0, w24
	sub	w0, w24, w0
	csel	w24, w0, w24, le
	b	.L863
	.p2align 3
.L911:
	add	x0, x27, 11120640
	add	x4, x29, 188
	mov	w2, w21
	mov	w1, w19
	ldr	w5, [x0, 512]
	ldr	x0, [x29, 104]
	ldr	w3, [x0, x23]
	mov	x0, x27
	bl	MVC_ReorderLTList
	b	.L865
	.p2align 3
.L907:
	mov	w6, w0
	tbz	w6, #31, .L885
.L891:
	mov	w6, -1
	mov	w22, 0
	str	wzr, [x29, 152]
	b	.L868
	.p2align 3
.L915:
	str	w0, [x29, 156]
	b	.L905
	.p2align 3
.L879:
	add	x0, x27, x0, lsl 2
	mov	w6, -1
	add	x0, x0, 10772480
	str	wzr, [x29, 152]
	ldr	w22, [x0, 12]
	b	.L868
.L870:
	ldrb	w5, [x20, 2977]
	mov	w6, 0
	str	wzr, [x29, 156]
	b	.L885
	.size	MVC_ReorderRefPiclist, .-MVC_ReorderRefPiclist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReorderListX
	.type	MVC_ReorderListX, %function
MVC_ReorderListX:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11116544
	bl	_mcount
	ldrb	w1, [x19, 2968]
	cmp	w1, 2
	beq	.L916
	ldrb	w0, [x19, 1916]
	cbnz	w0, .L928
.L919:
	ldr	w0, [x19, 3028]
	cmp	w1, 1
	add	w0, w0, 1
	str	w0, [x19, 3016]
	bne	.L916
	ldrb	w0, [x19, 1917]
	cbnz	w0, .L929
.L921:
	ldr	w0, [x19, 3032]
	add	w0, w0, 1
	str	w0, [x19, 3020]
.L916:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L928:
	ldr	w2, [x19, 3028]
	mov	w1, 0
	mov	x0, x20
	bl	MVC_ReorderRefPiclist
	ldrb	w1, [x19, 2968]
	b	.L919
	.p2align 3
.L929:
	ldr	w2, [x19, 3032]
	mov	x0, x20
	bl	MVC_ReorderRefPiclist
	b	.L921
	.size	MVC_ReorderListX, .-MVC_ReorderListX
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GenPiclistfromFrmlist
	.type	MVC_GenPiclistfromFrmlist, %function
MVC_GenPiclistfromFrmlist:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	w21, w0
	mov	x0, x30
	mov	w20, w2
	mov	x19, x1
	mov	x25, x3
	mov	x24, x4
	mov	w23, w5
	bl	_mcount
	cmp	w20, 31
	mov	w22, 31
	csel	w22, w20, w22, ls
	cbnz	w23, .L952
	cmp	w21, 1
	ldr	x23, .LC69
	beq	.L992
.L932:
	cmp	w21, 2
	bne	.L941
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L943:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L941
.L993:
	cmp	w21, w22
	bcc	.L976
	b	.L948
	.p2align 3
.L944:
	add	w21, w21, 1
	cmp	w22, w21
	bls	.L948
.L976:
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 2]
	tbz	x1, 1, .L944
	add	x0, x0, 832
	blr	x23
	cbz	w0, .L944
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 832
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
.L948:
	cmp	w20, w22
	bcc	.L975
	b	.L943
	.p2align 3
.L949:
	add	w20, w20, 1
	cmp	w22, w20
	bls	.L943
.L975:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 2]
	tbz	x1, 0, .L949
	add	x0, x0, 784
	blr	x23
	cbz	w0, .L949
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	add	x0, x0, 784
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	bcc	.L993
.L941:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L952:
	cmp	w21, 1
	ldr	x23, .LC68
	bne	.L932
.L992:
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L933:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L941
	cmp	w20, w22
	bcc	.L974
	b	.L991
	.p2align 3
.L934:
	add	w20, w20, 1
	cmp	w20, w22
	bcs	.L991
.L974:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 2]
	tbz	x1, 0, .L934
	add	x0, x0, 784
	blr	x23
	cbz	w0, .L934
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	add	x0, x0, 784
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	.p2align 2
.L991:
	cmp	w21, w22
	bcs	.L933
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 2]
	tbnz	x1, 1, .L994
.L939:
	add	w21, w21, 1
	b	.L991
	.p2align 3
.L994:
	add	x0, x0, 832
	blr	x23
	cbz	w0, .L939
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 832
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	b	.L933
	.size	MVC_GenPiclistfromFrmlist, .-MVC_GenPiclistfromFrmlist
	.align	3
.LC68:
	.xword	MVC_IsLTRefFlg
	.align	3
.LC69:
	.xword	MVC_IsSTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetBaseViewId
	.type	MVC_GetBaseViewId, %function
MVC_GetBaseViewId:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 12288
	mov	x1, 0
	add	x0, x0, 2400
	.p2align 2
.L998:
	ldr	w2, [x0]
	add	x3, x0, 335872
	cbz	w2, .L996
	ldrb	w0, [x0, -4]
	cbnz	w0, .L1006
.L996:
	add	w1, w1, 1
	add	x0, x3, 308
	cmp	w1, 32
	bne	.L998
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1006:
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x1, x0, x1
	lsl	x0, x1, 2
	sub	x1, x0, x1
	lsl	x0, x1, 6
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ldr	w0, [x0, 14692]
	ret
	.size	MVC_GetBaseViewId, .-MVC_GetBaseViewId
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetVOIdx
	.type	MVC_GetVOIdx, %function
MVC_GetVOIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	w19, w1
	mov	x0, x30
	mov	w21, w2
	bl	_mcount
	cbz	w19, .L1012
	ldr	w0, [x20]
	cmp	w21, w0
	beq	.L1012
	mov	w0, w19
	mov	w3, 0
	b	.L1009
	.p2align 3
.L1010:
	ldr	w4, [x20, w3, sxtw 2]
	cmp	w4, w21
	beq	.L1013
.L1009:
	add	w3, w3, 1
	cmp	w3, w19
	bne	.L1010
.L1008:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1013:
	mov	w0, w3
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1012:
	mov	w0, 0
	b	.L1008
	.size	MVC_GetVOIdx, .-MVC_GetVOIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_is_view_id_in_ref_view_list
	.type	MVC_is_view_id_in_ref_view_list, %function
MVC_is_view_id_in_ref_view_list:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	w19, w2
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	cbz	w19, .L1019
	ldr	w0, [x21]
	cmp	w20, w0
	beq	.L1019
	mov	w0, 0
	b	.L1016
	.p2align 3
.L1017:
	ldr	w3, [x21, w0, sxtw 2]
	cmp	w3, w20
	beq	.L1015
.L1016:
	add	w0, w0, 1
	cmp	w0, w19
	mov	w1, w0
	bne	.L1017
.L1015:
	cmp	w19, wzr
	ldr	x21, [sp, 32]
	ccmp	w19, w1, 0, ne
	cset	w0, hi
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1019:
	mov	w1, 0
	b	.L1015
	.size	MVC_is_view_id_in_ref_view_list, .-MVC_is_view_id_in_ref_view_list
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GenPiclistfromFrmlist_Interview
	.type	MVC_GenPiclistfromFrmlist_Interview, %function
MVC_GenPiclistfromFrmlist_Interview:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w22, w0
	mov	x0, x30
	mov	x23, x1
	mov	w20, w2
	mov	x21, x3
	mov	x19, x4
	bl	_mcount
	cmp	w22, 1
	beq	.L1034
	cmp	w22, 2
	bne	.L1020
	cbz	w20, .L1020
	sub	w2, w20, #1
	mov	x1, 1712
	mov	w20, 880
	ldr	w0, [x19]
	add	x5, x23, 832
	umaddl	x20, w2, w20, x1
	add	x1, x23, x20
	.p2align 2
.L1025:
	str	x5, [x21, w0, uxtw 3]
	add	x5, x5, 880
	cmp	x5, x1
	ldr	w0, [x19]
	add	w0, w0, 1
	str	w0, [x19]
	bne	.L1025
.L1020:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1034:
	cbz	w20, .L1020
	sub	w2, w20, #1
	mov	x1, 1664
	mov	w20, 880
	ldr	w0, [x19]
	add	x4, x23, 784
	umaddl	x20, w2, w20, x1
	add	x1, x23, x20
	.p2align 2
.L1023:
	str	x4, [x21, w0, uxtw 3]
	add	x4, x4, 880
	cmp	x1, x4
	ldr	w0, [x19]
	add	w0, w0, 1
	str	w0, [x19]
	bne	.L1023
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	MVC_GenPiclistfromFrmlist_Interview, .-MVC_GenPiclistfromFrmlist_Interview
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_append_interview_list
	.type	mvc_append_interview_list, %function
mvc_append_interview_list:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	mov	x21, x2
	mov	x24, x3
	bl	_mcount
	add	x0, x20, 10768384
	add	x1, x20, 11120640
	add	x6, x0, 4068
	ldr	w2, [x0, 4064]
	ldr	w3, [x1, 512]
	adds	w2, w2, 1
	beq	.L1036
	ldr	w0, [x0, 4068]
	cmp	w3, w0
	beq	.L1054
	mov	w5, w2
	mov	w0, 0
	b	.L1037
	.p2align 3
.L1038:
	ldr	w4, [x6, w0, sxtw 2]
	cmp	w3, w4
	beq	.L1036
.L1037:
	add	w0, w0, 1
	cmp	w0, w5
	mov	w2, w0
	bne	.L1038
.L1036:
	add	x0, x20, 11116544
	ldrb	w0, [x0, 2977]
	cbz	w0, .L1039
	ubfiz	x0, x19, 1, 32
	add	x0, x0, x2, uxtw
	add	x0, x0, 2691072
	add	x23, x0, 2044
	add	x0, x20, x0, lsl 2
	add	x23, x20, x23, lsl 2
	add	x23, x23, 12
	ldr	w25, [x0, 8172]
.L1040:
	add	x22, x20, 11157504
	add	x0, x20, 11124736
	ldrb	w1, [x22, 3723]
	ldr	w19, [x0, 920]
	cmp	w1, 2
	cset	w26, eq
	subs	w19, w19, #1
	bmi	.L1035
	ldr	x4, .LC70
	add	x27, x20, 11161600
	mov	w28, 880
	b	.L1071
	.p2align 3
.L1082:
	ldrb	w0, [x1, 2]
	cmp	w0, 3
	beq	.L1081
.L1042:
	subs	w19, w19, #1
	bmi	.L1035
.L1071:
	sxtw	x0, w19
	add	x0, x0, 1388544
	add	x0, x20, x0, lsl 3
	ldr	x1, [x0, 16920]
	cbz	x1, .L1042
	ldrb	w0, [x22, 3723]
	cbz	w0, .L1082
	cmp	w0, 1
	beq	.L1083
	cmp	w0, 2
	bne	.L1042
	ldrb	w2, [x22, 3721]
	ldrb	w0, [x1, 2]
	ubfx	x0, x0, 1, 1
	cbz	w2, .L1048
	ldr	x2, [x27, 304]
	ldr	w3, [x2, 812]
	ldr	w2, [x1, 812]
	cmp	w3, w2
	cset	w2, eq
	and	w0, w0, w2
.L1048:
	cbz	w0, .L1042
	ldr	w2, [x1, 860]
	.p2align 2
.L1044:
	add	x0, x1, x26
	ldrb	w0, [x0, 12]
	cbz	w0, .L1042
	ldr	w0, [x27, 332]
	cmp	w0, w2
	bne	.L1042
	ldr	w3, [x1, 56]
	cbz	w25, .L1042
	ldr	w0, [x23]
	cmp	w3, w0
	beq	.L1049
	mov	w0, 0
	.p2align 2
.L1050:
	add	w0, w0, 1
	cmp	w25, w0
	beq	.L1042
	ldr	w2, [x23, w0, sxtw 2]
	cmp	w3, w2
	bne	.L1050
.L1049:
	ldr	w0, [x24]
	mov	x2, 880
	ldr	x3, [x4, 104]
	str	x4, [x29, 104]
	umull	x0, w0, w28
	add	x0, x21, x0
	blr	x3
	ldr	w0, [x24]
	umull	x0, w0, w28
	add	x0, x21, x0
	str	x0, [x0, 744]
	str	x0, [x0, 792]
	str	x0, [x0, 840]
	ldr	w0, [x24]
	ldr	w1, [x20, 52]
	umull	x0, w0, w28
	sub	w1, w1, #1
	add	x0, x21, x0
	str	w1, [x0, 48]
	ldr	w0, [x24]
	cmp	w25, w0
	beq	.L1035
	add	w0, w0, 1
	subs	w19, w19, #1
	str	w0, [x24]
	ldr	x4, [x29, 104]
	bpl	.L1071
.L1035:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1083:
	ldrb	w2, [x22, 3721]
	ldrb	w0, [x1, 2]
	and	w0, w0, 1
	cbz	w2, .L1046
	ldr	x2, [x27, 304]
	ldr	w3, [x2, 860]
	ldr	w2, [x1, 860]
	cmp	w3, w2
	cset	w2, eq
	and	w0, w0, w2
.L1046:
	cbz	w0, .L1042
	ldr	w2, [x1, 812]
	b	.L1044
	.p2align 3
.L1081:
	ldr	w2, [x1, 764]
	b	.L1044
	.p2align 3
.L1039:
	ubfiz	x0, x19, 1, 32
	add	x0, x0, x2, uxtw
	add	x0, x0, 2691072
	add	x23, x0, 2052
	add	x0, x20, x0, lsl 2
	add	x23, x20, x23, lsl 2
	add	x23, x23, 12
	ldr	w25, [x0, 8204]
	b	.L1040
.L1054:
	mov	w2, 0
	b	.L1036
	.size	mvc_append_interview_list, .-mvc_append_interview_list
	.align	3
.LC70:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InitListX
	.type	MVC_InitListX, %function
MVC_InitListX:
	stp	x29, x30, [sp, -480]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 11120640
	add	x20, x19, 11116544
	bl	_mcount
	add	x21, x19, 11157504
	str	wzr, [x22, 520]
	str	wzr, [x22, 524]
	ldrb	w0, [x20, 2968]
	cbnz	w0, .L1085
	ldrb	w0, [x21, 3723]
	add	x27, x19, 11124736
	cbnz	w0, .L1228
	ldr	w0, [x27, 928]
	cbz	w0, .L1165
	sub	w3, w0, #1
	mov	w24, 0
	add	x3, x3, 1388544
	add	x0, x27, 664
	add	x3, x3, 2132
	add	x3, x19, x3, lsl 3
	b	.L1091
	.p2align 3
.L1090:
	cmp	x0, x3
	beq	.L1089
.L1091:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 3]
	cmp	w2, 3
	bne	.L1090
	ldr	w2, [x1, 736]
	and	w2, w2, 16776960
	cmp	w2, 65536
	bne	.L1090
	add	x2, x19, x24, uxtw 3
	add	x1, x1, 736
	cmp	x0, x3
	add	w24, w24, 1
	str	x1, [x2, 288]
	bne	.L1091
	.p2align 2
.L1089:
	add	x23, x19, 288
	ldr	x3, .LC71
	mov	w1, w24
	mov	w2, 8
	mov	x0, x23
	bl	qsort
	str	w24, [x20, 3016]
	ldr	w1, [x27, 932]
	cbz	w1, .L1166
	sub	w2, w1, #1
	add	x0, x27, 792
	add	x2, x2, 1388544
	mov	w25, w24
	add	x2, x2, 2148
	add	x2, x19, x2, lsl 3
	b	.L1094
	.p2align 3
.L1093:
	cmp	x2, x0
	beq	.L1229
.L1094:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 3]
	cmp	w3, 3
	bne	.L1093
	ldr	w3, [x1, 736]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L1093
	add	x3, x19, x25, uxtw 3
	add	x1, x1, 736
	cmp	x2, x0
	add	w25, w25, 1
	str	x1, [x3, 288]
	bne	.L1094
	.p2align 2
.L1229:
	sub	w1, w25, w24
.L1092:
	uxtw	x0, w24
	ldr	x3, .LC72
	add	x0, x0, 36
	mov	w2, 8
	add	x0, x19, x0, lsl 3
	bl	qsort
	str	w25, [x20, 3016]
	ldrsb	w0, [x20, 2980]
	str	wzr, [x20, 3020]
	cbnz	w0, .L1100
.L1144:
	add	x24, x19, 11108352
	mov	x0, x19
	add	x25, x24, 272
	add	x3, x22, 520
	mov	w1, 0
	mov	x2, x25
	bl	mvc_append_interview_list
	ldrb	w0, [x21, 3723]
	cbnz	w0, .L1230
	ldr	w3, [x22, 520]
	ldr	w0, [x20, 3016]
	cbz	w3, .L1169
	add	x1, x24, 1008
	add	w3, w0, w3
	.p2align 2
.L1147:
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w3, w0
	str	x1, [x2, 288]
	add	x1, x1, 880
	bne	.L1147
.L1146:
	str	w3, [x20, 3016]
.L1148:
	ldrb	w1, [x20, 2968]
	cmp	w1, 1
	beq	.L1231
.L1145:
	cbnz	w1, .L1152
.L1234:
	ldr	w2, [x20, 3016]
	cbz	w2, .L1232
.L1153:
	ldr	w1, [x20, 3028]
	ldr	w0, [x20, 3032]
	ldr	w3, [x20, 3020]
	add	w1, w1, 1
	add	w0, w0, 1
	cmp	w1, w2
	csel	w1, w1, w2, ls
	cmp	w0, w3
	csel	w0, w0, w3, ls
	str	w1, [x20, 3016]
	cmp	w1, 32
	str	w0, [x20, 3020]
	bhi	.L1159
	.p2align 2
.L1191:
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	cmp	w1, 33
	str	xzr, [x2, 288]
	bne	.L1191
.L1159:
	cmp	w0, 32
	bhi	.L1157
	.p2align 2
.L1190:
	add	x1, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w0, 33
	str	xzr, [x1, 552]
	bne	.L1190
.L1157:
	mov	w0, 0
.L1218:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 480
	ret
	.p2align 3
.L1085:
	ldrb	w0, [x21, 3723]
	add	x27, x19, 11124736
	cbz	w0, .L1109
	ldr	w0, [x27, 928]
	cbz	w0, .L1233
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 1388544
	add	x0, x27, 664
	add	x3, x3, 2132
	add	x6, x19, 11161600
	add	x3, x19, x3, lsl 3
	.p2align 2
.L1128:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldrb	w1, [x2, 2]
	cbz	w1, .L1127
	ldr	w4, [x2, 32]
	add	x1, x29, 480
	ldr	w5, [x6, 332]
	add	x1, x1, x23, uxtw 3
	sub	x1, x1, #4096
	cmp	w5, w4
	blt	.L1127
	add	w23, w23, 1
	str	x2, [x1, 3712]
.L1127:
	cmp	x0, x3
	bne	.L1128
	add	x25, x29, 96
	ldr	x3, .LC79
	mov	w2, 8
	mov	w1, w23
	mov	x0, x25
	bl	qsort
	ldr	w24, [x27, 928]
	cbz	w24, .L1129
.L1163:
	sub	w1, w24, #1
	add	x0, x27, 664
	add	x1, x1, 1388544
	mov	w28, w23
	add	x1, x1, 2132
	add	x6, x19, 11161600
	add	x1, x19, x1, lsl 3
	.p2align 2
.L1131:
	ldr	x3, [x0]
	add	x0, x0, 8
	ldrb	w2, [x3, 2]
	cbz	w2, .L1130
	ldr	w4, [x3, 32]
	add	x2, x29, 480
	ldr	w5, [x6, 332]
	add	x2, x2, x28, uxtw 3
	sub	x2, x2, #4096
	cmp	w5, w4
	bge	.L1130
	add	w28, w28, 1
	str	x3, [x2, 3712]
.L1130:
	cmp	x0, x1
	bne	.L1131
	sub	w24, w28, w23
	ldr	x3, .LC80
	mov	w2, 8
	mov	w1, w24
	add	x0, x25, x23, uxtw 3
	bl	qsort
	cbz	w23, .L1132
.L1162:
	mov	x0, 0
	.p2align 2
.L1133:
	add	w1, w24, w0
	add	x3, x29, 480
	ldr	x2, [x25, x0, lsl 3]
	add	x0, x0, 1
	add	x1, x3, x1, lsl 3
	cmp	w23, w0
	str	x2, [x1, -256]
	bhi	.L1133
.L1132:
	cmp	w28, w23
	bls	.L1134
	mov	w0, w23
	.p2align 2
.L1135:
	add	x2, x29, 480
	sub	w1, w0, w23
	add	x2, x2, x0, uxtw 3
	add	x3, x29, 480
	sub	x2, x2, #4096
	add	x1, x3, x1, lsl 3
	add	w0, w0, 1
	cmp	w28, w0
	ldr	x2, [x2, 3712]
	str	x2, [x1, -256]
	bne	.L1135
.L1134:
	str	wzr, [x20, 3016]
	add	x23, x19, 288
	str	wzr, [x20, 3020]
	add	x26, x20, 3016
	mov	x1, x25
	mov	w2, w28
	ldrb	w0, [x21, 3723]
	mov	w5, 0
	mov	x4, x26
	mov	x3, x23
	add	x24, x19, 552
	add	x25, x20, 3020
	bl	MVC_GenPiclistfromFrmlist
	ldrb	w0, [x21, 3723]
	mov	w2, w28
	mov	w5, 0
	mov	x4, x25
	mov	x3, x24
	add	x1, x29, 224
	bl	MVC_GenPiclistfromFrmlist
	ldr	w28, [x27, 932]
	add	x27, x29, 352
	cbz	w28, .L1136
	mov	x1, 0
	add	x27, x29, 352
	.p2align 2
.L1137:
	lsl	x0, x1, 3
	add	x0, x0, 11124736
	add	x0, x0, 792
	ldr	x0, [x19, x0]
	str	x0, [x27, x1, lsl 3]
	add	x1, x1, 1
	cmp	w28, w1
	bhi	.L1137
.L1136:
	ldr	x3, .LC74
	mov	w2, 8
	mov	w1, w28
	mov	x0, x27
	bl	qsort
	ldrb	w0, [x21, 3723]
	mov	x4, x26
	mov	w5, 1
	mov	x3, x23
	mov	w2, w28
	mov	x1, x27
	bl	MVC_GenPiclistfromFrmlist
	ldrb	w0, [x21, 3723]
	mov	x3, x24
	mov	x1, x27
	mov	w5, 1
	mov	x4, x25
	mov	w2, w28
	bl	MVC_GenPiclistfromFrmlist
	ldr	w24, [x20, 3016]
	ldr	w0, [x20, 3020]
	cmp	w0, w24
	cset	w1, eq
.L1126:
	cmp	w24, 1
	cset	w0, hi
	tst	w1, w0
	beq	.L1138
	cbz	w24, .L1139
	ldr	x4, [x19, 288]
	ldr	x0, [x19, 552]
	cmp	x4, x0
	bne	.L1138
	sub	w24, w24, #1
	mov	x1, x19
	add	x0, x19, x24, lsl 3
.L1141:
	cmp	x0, x1
	beq	.L1143
	ldr	x3, [x1, 296]
	add	x1, x1, 8
	ldr	x2, [x1, 552]
	cmp	x3, x2
	beq	.L1141
	.p2align 2
.L1138:
	ldrsb	w0, [x20, 2980]
	cbz	w0, .L1144
.L1223:
	ldrb	w1, [x20, 2968]
.L1237:
	cbz	w1, .L1234
.L1152:
	ldr	x0, [x20, 3016]
	cbz	x0, .L1154
	ldr	w2, [x20, 3016]
	b	.L1153
	.p2align 3
.L1109:
	ldr	w0, [x27, 928]
	cbz	w0, .L1167
	sub	w3, w0, #1
	mov	w24, 0
	add	x3, x3, 1388544
	add	x0, x27, 664
	add	x3, x3, 2132
	add	x6, x19, 11161600
	add	x3, x19, x3, lsl 3
	b	.L1114
	.p2align 3
.L1113:
	cmp	x0, x3
	beq	.L1112
.L1114:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 3]
	cmp	w2, 3
	bne	.L1113
	ldr	w2, [x1, 760]
	add	x5, x19, x24, uxtw 3
	ldr	w4, [x6, 336]
	add	x1, x1, 736
	cmp	w4, w2
	blt	.L1113
	str	x1, [x5, 288]
	cmp	x0, x3
	add	w24, w24, 1
	bne	.L1114
	.p2align 2
.L1112:
	add	x23, x19, 288
	ldr	x3, .LC77
	mov	w2, 8
	mov	w1, w24
	mov	x0, x23
	bl	qsort
	ldr	w25, [x27, 928]
	cbz	w25, .L1115
	sub	w1, w25, #1
	add	x0, x27, 664
	add	x1, x1, 1388544
	mov	w26, w24
	add	x1, x1, 2132
	add	x6, x19, 11161600
	add	x1, x19, x1, lsl 3
	b	.L1117
	.p2align 3
.L1116:
	cmp	x0, x1
	beq	.L1235
.L1117:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldrb	w3, [x2, 3]
	cmp	w3, 3
	bne	.L1116
	ldr	w3, [x2, 760]
	add	x5, x19, x26, uxtw 3
	ldr	w4, [x6, 336]
	add	x2, x2, 736
	cmp	w4, w3
	bge	.L1116
	str	x2, [x5, 288]
	cmp	x0, x1
	add	w26, w26, 1
	bne	.L1117
	.p2align 2
.L1235:
	uxtw	x0, w24
	sub	w25, w26, w24
	add	x0, x0, 36
	ldr	x3, .LC78
	uxtw	x28, w26
	mov	w2, 8
	add	x0, x19, x0, lsl 3
	mov	w1, w25
	add	x28, x28, 36
	bl	qsort
	add	x28, x19, x28, lsl 3
	cbz	w24, .L1119
.L1161:
	mov	x2, x23
	mov	w0, 0
	.p2align 2
.L1120:
	add	w1, w25, w0
	ldr	x3, [x2], 8
	add	x1, x1, 69
	add	w0, w0, 1
	cmp	w0, w24
	str	x3, [x19, x1, lsl 3]
	bcc	.L1120
.L1119:
	cmp	w26, w24
	bls	.L1121
	mov	w0, w24
	.p2align 2
.L1122:
	sub	w1, w0, w24
	add	x2, x19, x0, uxtw 3
	add	x1, x1, 69
	add	w0, w0, 1
	cmp	w0, w26
	ldr	x2, [x2, 288]
	str	x2, [x19, x1, lsl 3]
	bne	.L1122
.L1121:
	str	w26, [x20, 3016]
	str	w26, [x20, 3020]
	ldr	w1, [x27, 932]
	cbz	w1, .L1168
	sub	w2, w1, #1
	add	x0, x27, 792
	add	x2, x2, 1388544
	mov	w24, w26
	add	x2, x2, 2148
	add	x2, x19, x2, lsl 3
	b	.L1125
	.p2align 3
.L1124:
	cmp	x0, x2
	beq	.L1236
.L1125:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 2]
	cmp	w3, 3
	bne	.L1124
	ldrb	w3, [x1, 737]
	cmp	w3, 1
	bne	.L1124
	add	x3, x19, x24, uxtw 3
	add	x1, x1, 736
	cmp	x0, x2
	add	w24, w24, 1
	str	x1, [x3, 288]
	str	x1, [x3, 552]
	bne	.L1125
	.p2align 2
.L1236:
	sub	w1, w24, w26
.L1123:
	ldr	x25, .LC72
	mov	x0, x28
	mov	w2, 8
	mov	x3, x25
	bl	qsort
	ldr	w0, [x20, 3016]
	mov	x3, x25
	mov	w2, 8
	sub	w1, w24, w0
	uxtw	x0, w0
	add	x0, x0, 69
	add	x0, x19, x0, lsl 3
	bl	qsort
	str	w24, [x20, 3016]
	mov	w1, 1
	str	w24, [x20, 3020]
	b	.L1126
	.p2align 3
.L1228:
	ldr	w0, [x27, 928]
	mov	w25, 0
	cbz	w0, .L1088
	sub	w4, w0, #1
	mov	w25, 0
	add	x4, x4, 1388544
	add	x0, x27, 664
	add	x4, x4, 2132
	add	x4, x19, x4, lsl 3
	.p2align 2
.L1097:
	ldr	x2, [x0]
	add	x1, x29, 480
	add	x1, x1, x25, uxtw 3
	add	x0, x0, 8
	sub	x1, x1, #4096
	cmp	x4, x0
	ldrb	w3, [x2, 3]
	cbz	w3, .L1096
	add	w25, w25, 1
	str	x2, [x1, 3712]
.L1096:
	bne	.L1097
.L1088:
	ldr	x3, .LC73
	mov	w1, w25
	mov	w2, 8
	add	x0, x29, 96
	add	x23, x19, 288
	add	x24, x20, 3016
	bl	qsort
	str	wzr, [x20, 3016]
	mov	w2, w25
	mov	w5, 0
	ldrb	w0, [x21, 3723]
	add	x1, x29, 96
	mov	x4, x24
	mov	x3, x23
	bl	MVC_GenPiclistfromFrmlist
	ldr	w25, [x27, 932]
	add	x27, x29, 352
	cbz	w25, .L1098
	mov	x1, 0
	add	x27, x29, 352
	.p2align 2
.L1099:
	lsl	x0, x1, 3
	add	x0, x0, 11124736
	add	x0, x0, 792
	ldr	x0, [x19, x0]
	str	x0, [x27, x1, lsl 3]
	add	x1, x1, 1
	cmp	w25, w1
	bhi	.L1099
.L1098:
	ldr	x3, .LC74
	mov	w2, 8
	mov	w1, w25
	mov	x0, x27
	bl	qsort
	ldrb	w0, [x21, 3723]
	mov	w5, 1
	mov	x4, x24
	mov	x3, x23
	mov	w2, w25
	mov	x1, x27
	bl	MVC_GenPiclistfromFrmlist
	str	wzr, [x20, 3020]
	ldrsb	w0, [x20, 2980]
	cbz	w0, .L1144
.L1100:
	ldr	w0, [x20, 3016]
	cbnz	w0, .L1223
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L1104
	ldrb	w0, [x21, 3723]
	cbnz	w0, .L1105
	add	x0, x19, 11161600
	ldr	x0, [x0, 304]
	add	x0, x0, 736
	str	x0, [x19, 288]
.L1106:
	mov	w0, 1
	ldrb	w1, [x20, 2968]
	str	w0, [x20, 3016]
	b	.L1237
.L1230:
	ldr	w2, [x22, 520]
	add	x4, x20, 3016
	mov	x3, x23
	mov	x1, x25
	bl	MVC_GenPiclistfromFrmlist_Interview
	b	.L1148
.L1139:
	ldr	x4, [x19, 552]
.L1143:
	ldr	x0, [x19, 560]
	str	x0, [x19, 552]
	str	x4, [x19, 560]
	b	.L1138
.L1105:
	cmp	w0, 1
	add	x0, x19, 11161600
	ldr	x0, [x0, 304]
	beq	.L1238
	add	x0, x0, 832
	str	x0, [x19, 288]
	b	.L1106
.L1231:
	add	x23, x24, 2032
	mov	x0, x19
	add	x3, x22, 524
	mov	x2, x23
	bl	mvc_append_interview_list
	ldrb	w0, [x21, 3723]
	cbnz	w0, .L1149
	ldr	w3, [x22, 524]
	ldr	w1, [x20, 3020]
	cbz	w3, .L1170
	add	x0, x24, 2768
	add	w3, w3, w1
	.p2align 2
.L1151:
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	cmp	w3, w1
	str	x0, [x2, 552]
	add	x0, x0, 880
	bne	.L1151
.L1150:
	ldrb	w1, [x20, 2968]
	str	w3, [x20, 3020]
	b	.L1145
.L1169:
	mov	w3, w0
	b	.L1146
.L1238:
	add	x0, x0, 784
	str	x0, [x19, 288]
	b	.L1106
.L1166:
	mov	w25, w24
	b	.L1092
.L1115:
	uxtw	x28, w24
	ldr	x3, .LC78
	add	x28, x28, 36
	mov	w2, 8
	mov	w1, 0
	mov	w26, w24
	add	x28, x19, x28, lsl 3
	mov	x0, x28
	bl	qsort
	cbnz	w24, .L1161
	b	.L1121
	.p2align 3
.L1168:
	mov	w24, w26
	b	.L1123
.L1165:
	mov	w24, 0
	b	.L1089
.L1233:
	add	x25, x29, 96
	ldr	x3, .LC79
	mov	w2, 8
	mov	w1, 0
	mov	x0, x25
	mov	w23, 0
	bl	qsort
	ldr	w24, [x27, 928]
	cbnz	w24, .L1163
	ldr	x3, .LC80
	mov	w2, 8
	mov	w1, 0
	mov	x0, x25
	mov	w28, 0
	bl	qsort
	b	.L1134
	.p2align 3
.L1167:
	mov	w24, 0
	b	.L1112
.L1129:
	ldr	x3, .LC80
	mov	w2, 8
	mov	w1, 0
	add	x0, x25, x23, uxtw 3
	mov	w28, w23
	bl	qsort
	cbnz	w23, .L1162
	b	.L1134
	.p2align 3
.L1149:
	ldr	w2, [x22, 524]
	mov	x1, x23
	add	x4, x20, 3020
	add	x3, x19, 552
	bl	MVC_GenPiclistfromFrmlist_Interview
	ldrb	w1, [x20, 2968]
	b	.L1237
.L1154:
	ldr	x1, .LC84
.L1224:
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	MVC_ClearCurrSlice
	mov	w0, -1
	b	.L1218
.L1232:
	ldr	x1, .LC82
	b	.L1224
.L1104:
	ldr	x1, .LC76
	b	.L1224
.L1170:
	mov	w3, w1
	b	.L1150
	.size	MVC_InitListX, .-MVC_InitListX
	.align	3
.LC71:
	.xword	MVC_compare_pic_by_pic_num_desc
	.align	3
.LC72:
	.xword	MVC_compare_pic_by_lt_pic_num_asc
	.align	3
.LC73:
	.xword	MVC_compare_fs_by_frame_num_desc
	.align	3
.LC74:
	.xword	MVC_compare_fs_by_lt_pic_idx_asc
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC77:
	.xword	MVC_compare_pic_by_poc_desc
	.align	3
.LC78:
	.xword	MVC_compare_pic_by_poc_asc
	.align	3
.LC79:
	.xword	MVC_compare_fs_by_poc_desc
	.align	3
.LC80:
	.xword	MVC_compare_fs_by_poc_asc
	.align	3
.LC82:
	.xword	.LC81
	.align	3
.LC84:
	.xword	.LC83
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DumpList
	.type	MVC_DumpList, %function
MVC_DumpList:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC85
	ldr	w0, [x0]
	tbz	x0, 13, .L1239
	add	x24, x22, 11116544
	ldr	x23, .LC87
	mov	w20, 0
	add	x24, x24, 3016
.L1241:
	ldr	w0, [x24]
	cbz	w0, .L1244
	uxtw	x0, w20
	mov	w19, 0
	lsl	x21, x0, 5
	add	x21, x21, x0
	.p2align 2
.L1242:
	add	x4, x21, x19, uxtw
	mov	w3, w19
	add	x4, x4, 36
	mov	w2, w20
	mov	x1, x23
	mov	w0, 13
	add	w19, w19, 1
	ldr	x4, [x22, x4, lsl 3]
	ldr	x4, [x4, 8]
	ldr	w5, [x4, 32]
	ldr	w4, [x4, 20]
	bl	dprint_vfmw
	ldr	w0, [x24]
	cmp	w0, w19
	bhi	.L1242
.L1244:
	add	w20, w20, 1
	add	x24, x24, 4
	cmp	w20, 2
	bne	.L1241
.L1239:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	MVC_DumpList, .-MVC_DumpList
	.align	3
.LC85:
	.xword	g_PrintEnable
	.align	3
.LC87:
	.xword	.LC86
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FindNearestPOCPicId
	.type	MVC_FindNearestPOCPicId, %function
MVC_FindNearestPOCPicId:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 11124736
	ldr	w0, [x2, 924]
	cbz	w0, .L1256
	add	x1, x19, 11161600
	ldr	w0, [x2, 920]
	ldr	w7, [x1, 332]
	cbz	w0, .L1257
	sub	w1, w0, #1
	add	x2, x2, 536
	add	x1, x1, 1388544
	mov	w6, 2147483647
	add	x1, x1, 2116
	mov	w0, 0
	add	x5, x19, x1, lsl 3
	.p2align 2
.L1255:
	ldr	x3, [x2]
	add	x2, x2, 8
	cbz	x3, .L1254
	ldr	w1, [x3, 32]
	sub	w1, w7, w1
	sxtw	x1, w1
	eor	x4, x1, x1, asr 63
	sub	x4, x4, x1, asr 63
	cmp	w4, w6
	bge	.L1254
	ldr	w0, [x3, 252]
	mov	w6, w4
.L1254:
	cmp	x2, x5
	bne	.L1255
.L1253:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1257:
	mov	w0, 0
	b	.L1253
.L1256:
	mov	w0, -1
	b	.L1253
	.size	MVC_FindNearestPOCPicId, .-MVC_FindNearestPOCPicId
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FindMinRefIdx
	.type	MVC_FindMinRefIdx, %function
MVC_FindMinRefIdx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 11116544
	ldrb	w1, [x0, 2968]
	cmp	w1, 2
	beq	.L1262
	add	x1, x19, 11157504
	ldrb	w1, [x1, 3723]
	cbnz	w1, .L1292
	add	x6, x19, 11124736
	ldr	w5, [x0, 3016]
	add	x6, x6, 1160
	mov	w4, 0
	.p2align 2
.L1266:
	cbz	w5, .L1270
	add	x1, x19, 288
	mov	w3, 32
	mov	w0, 0
	b	.L1268
	.p2align 3
.L1267:
	add	w0, w0, 1
	cmp	w0, w5
	beq	.L1293
.L1268:
	ldr	x2, [x1]
	add	x1, x1, 8
	ldr	x2, [x2, 8]
	ldr	w2, [x2, 52]
	cmp	w2, w4
	bne	.L1267
	cmp	w3, w0
	csel	w3, w3, w0, ls
	add	w0, w0, 1
	stp	w3, w3, [x6]
	cmp	w0, w5
	bne	.L1268
.L1293:
	cmp	w3, 31
	bhi	.L1270
.L1269:
	add	w4, w4, 1
	add	x6, x6, 8
	cmp	w4, 16
	bne	.L1266
.L1262:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1292:
	ldr	w6, [x0, 3016]
	add	x7, x19, 11124736
	add	x7, x7, 1160
	mov	w4, 0
	cbz	w6, .L1274
	.p2align 2
.L1295:
	add	x2, x19, 288
	mov	w5, 32
	mov	w1, 0
	b	.L1272
	.p2align 3
.L1271:
	add	w1, w1, 1
	cmp	w1, w6
	beq	.L1294
.L1272:
	ldr	x0, [x2]
	add	x2, x2, 8
	ldr	x3, [x0, 8]
	ldrb	w0, [x0]
	cmp	w0, 2
	ldr	w0, [x3, 52]
	cset	w3, eq
	orr	w0, w3, w0, lsl 1
	cmp	w0, w4
	bne	.L1271
	cmp	w5, w1
	csel	w5, w5, w1, ls
	add	w1, w1, 1
	str	w5, [x7]
	cmp	w1, w6
	bne	.L1272
.L1294:
	cmp	w5, 31
	bhi	.L1274
.L1273:
	add	w4, w4, 1
	add	x7, x7, 4
	cmp	w4, 32
	beq	.L1262
	cbnz	w6, .L1295
	.p2align 2
.L1274:
	str	wzr, [x7]
	b	.L1273
	.p2align 3
.L1270:
	stp	wzr, wzr, [x6]
	b	.L1269
	.size	MVC_FindMinRefIdx, .-MVC_FindMinRefIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecList
	.type	MVC_DecList, %function
MVC_DecList:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11124736
	mov	w6, -1
	ldr	w0, [x1, 924]
	cbz	w0, .L1297
	add	x2, x19, 11161600
	ldr	w0, [x1, 920]
	ldr	w7, [x2, 332]
	cbz	w0, .L1305
	add	w4, w0, w6
	add	x1, x1, 536
	add	x4, x4, 1388544
	mov	w6, 0
	add	x4, x4, 2116
	mov	w5, 2147483647
	add	x4, x19, x4, lsl 3
	.p2align 2
.L1299:
	ldr	x2, [x1]
	add	x1, x1, 8
	cbz	x2, .L1298
	ldr	w0, [x2, 32]
	sub	w0, w7, w0
	sxtw	x0, w0
	eor	x3, x0, x0, asr 63
	sub	x3, x3, x0, asr 63
	cmp	w3, w5
	bge	.L1298
	ldr	w6, [x2, 252]
	mov	w5, w3
.L1298:
	cmp	x1, x4
	bne	.L1299
.L1297:
	add	x21, x19, 11120640
	add	x0, x19, 11116544
	mov	w20, -1
	str	w6, [x21, 508]
	str	w20, [x21, 504]
	ldrb	w1, [x0, 2968]
	cmp	w1, 2
	beq	.L1313
	mov	x0, x19
	bl	MVC_InitListX
	cbnz	w0, .L1314
	mov	x0, x19
	bl	MVC_ReorderListX
	mov	x0, x19
	bl	MVC_RepairList
	cbnz	w0, .L1306
	mov	x0, x19
	bl	MVC_FindMinRefIdx
	ldr	x0, [x19, 288]
	cbz	x0, .L1303
	ldr	x0, [x0, 8]
	ldr	w20, [x0, 252]
.L1303:
	mov	w0, 0
	str	w20, [x21, 504]
.L1301:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1313:
	str	wzr, [x0, 3016]
	str	wzr, [x0, 3020]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1306:
	mov	w0, w20
	b	.L1301
.L1305:
	mov	w6, 0
	b	.L1297
.L1314:
	ldr	x1, .LC89
	mov	w0, 13
	bl	dprint_vfmw
	mov	w0, w20
	b	.L1301
	.size	MVC_DecList, .-MVC_DecList
	.align	3
.LC89:
	.xword	.LC88
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_NoPicOut
	.type	MVC_NoPicOut, %function
MVC_NoPicOut:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 48]
	cbz	w0, .L1322
	mov	x1, 51327
	sub	w3, w0, #1
	mov	w2, 880
	movk	x1, 0xa9, lsl 16
	add	x0, x19, 11124736
	umaddl	x2, w3, w2, x1
	add	x0, x0, 1295
	add	x2, x19, x2
	b	.L1321
	.p2align 3
.L1329:
	ldrb	w3, [x0, -2]
	cmp	w3, 1
	beq	.L1319
	add	x0, x0, 880
	cmp	x0, x2
	beq	.L1322
.L1321:
	ldrb	w1, [x0]
	cmp	w1, 1
	bne	.L1329
.L1319:
	strb	wzr, [x0, -5]
	strb	wzr, [x0, -4]
	add	x0, x0, 880
	cmp	x0, x2
	bne	.L1321
.L1322:
	ldr	w0, [x19, 52]
	cbz	w0, .L1315
	sub	w1, w0, #1
	add	x0, x19, 148
	add	x1, x1, 38
	add	x1, x19, x1, lsl 2
	.p2align 2
.L1323:
	str	wzr, [x0], 4
	cmp	x0, x1
	bne	.L1323
.L1315:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_NoPicOut, .-MVC_NoPicOut
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetBackPicFromVOQueue
	.type	MVC_GetBackPicFromVOQueue, %function
MVC_GetBackPicFromVOQueue:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x22, 120]
	bl	FSP_GetFspType
	cbz	w0, .L1347
.L1331:
	ldr	w0, [x22, 48]
	mov	w23, 0
	mov	w21, 880
	cbz	w0, .L1338
	.p2align 2
.L1342:
	uxtw	x1, w23
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 3
	sub	x0, x0, x1
	umull	x20, w23, w21
	add	x0, x22, x0, lsl 4
	add	x0, x0, 11124736
	add	x20, x20, 11124736
	add	x19, x20, 1960
	add	x20, x20, 1992
	add	x19, x22, x19
	add	x20, x22, x20
	strb	wzr, [x0, 1290]
	strb	wzr, [x0, 1291]
.L1336:
	ldr	x1, [x19]
	cbnz	x1, .L1348
.L1335:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L1336
	ldr	w0, [x22, 48]
	add	w23, w23, 1
	cmp	w0, w23
	bhi	.L1342
.L1338:
	ldr	w0, [x22, 52]
	cbz	w0, .L1330
	sub	w1, w0, #1
	add	x0, x22, 148
	add	x1, x1, 38
	add	x22, x22, x1, lsl 2
	.p2align 2
.L1339:
	str	wzr, [x0], 4
	cmp	x0, x22
	bne	.L1339
.L1330:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1348:
	ldr	w0, [x22, 120]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L1335
.L1347:
	add	x0, x22, 912
	bl	ResetVoQueue
	b	.L1331
	.size	MVC_GetBackPicFromVOQueue, .-MVC_GetBackPicFromVOQueue
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_wait_vo
	.type	mvc_wait_vo, %function
mvc_wait_vo:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	mvc_wait_vo, .-mvc_wait_vo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_RoundLog2
	.type	MVC_RoundLog2, %function
MVC_RoundLog2:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	mul	w2, w19, w19
	mov	w0, 0
	mov	w3, 1
	.p2align 2
.L1351:
	add	w0, w0, 1
	lsl	w1, w3, w0
	cmp	w2, w1
	bge	.L1351
	asr	w0, w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_RoundLog2, .-MVC_RoundLog2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetReRangeFlag
	.type	MVC_GetReRangeFlag, %function
MVC_GetReRangeFlag:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 11116544
	mov	x19, x1
	bl	_mcount
	mov	w0, 2240
	ldr	x3, [x20, 280]
	ldr	w1, [x22, 2984]
	ldrsb	w2, [x22, 2980]
	umull	x0, w1, w0
	cmn	w2, #1
	add	x0, x3, x0
	beq	.L1370
	cbnz	w2, .L1356
	ldrb	w1, [x20, 2]
	cmp	w1, 1
	beq	.L1371
	ldr	w0, [x0, 28]
	ldr	w1, [x20, 28]
	cmp	w1, w0
	beq	.L1358
	ldr	x1, .LC91
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1356:
	ldr	x1, .LC93
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1370:
	ldr	w0, [x0, 28]
	mov	w21, 3992
	ldr	x1, [x20, 272]
	umull	x0, w0, w21
	add	x21, x1, x0
.L1355:
	ldrb	w0, [x21, 20]
	mov	w2, 2
	ldr	w1, [x21, 3952]
	sub	w0, w2, w0
	ldr	w3, [x21, 3948]
	ldp	w6, w5, [x20, 12]
	madd	w1, w1, w0, w0
	add	w2, w3, 1
	cmp	w6, w2
	ccmp	w5, w1, 0, eq
	bne	.L1360
	add	x0, x20, 11124736
	ldr	w3, [x21, 3972]
	mov	w4, 0
	ldr	w0, [x0, 920]
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L1360
.L1361:
	ldrb	w0, [x22, 2979]
	cmp	w0, 1
	beq	.L1372
.L1365:
	ldr	w1, [x21, 3972]
	sub	w1, w1, #1
.L1364:
	ldr	w2, [x20, 44]
	mov	w0, w4
	cmp	w2, w1
	cset	w2, ne
	orr	w4, w2, w4
	str	w4, [x19]
	str	w1, [x20, 44]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1360:
	ldr	x0, .LC94
	ldr	x4, [x0]
	cbz	x4, .L1367
	ubfiz	w2, w2, 4, 12
	ubfiz	w1, w1, 4, 12
	ldr	w0, [x20, 120]
	ubfiz	w6, w6, 4, 12
	ubfiz	w5, w5, 4, 12
	strh	w2, [x29, 60]
	strh	w1, [x29, 62]
	mov	w3, 8
	strh	w6, [x29, 56]
	add	x2, x29, 56
	strh	w5, [x29, 58]
	mov	w1, 2
	blr	x4
	ldrb	w0, [x22, 2979]
	mov	w4, 1
	cmp	w0, 1
	bne	.L1365
.L1372:
	add	x0, x20, 290816
	add	x3, x20, 11051008
	add	x0, x0, 2488
	add	x3, x3, 56
	mov	w2, 0
	.p2align 2
.L1363:
	ldr	w1, [x0]
	add	x0, x0, 335872
	add	x0, x0, 308
	cmp	w1, w2
	sub	w1, w1, #1
	csel	w2, w1, w2, hi
	cmp	x0, x3
	bne	.L1363
	add	w0, w2, 1
	mov	w1, 16
	lsl	w0, w0, 1
	cmp	w0, w1
	csel	w1, w0, w1, cc
	b	.L1364
	.p2align 3
.L1358:
	add	x21, x20, 11046912
	add	x21, x21, 180
	b	.L1355
	.p2align 3
.L1371:
	ldr	w1, [x0, 28]
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x0, x0, x1
	lsl	x21, x0, 2
	sub	x21, x21, x0
	lsl	x1, x21, 6
	add	x21, x21, x1
	add	x21, x20, x21, lsl 2
	add	x21, x21, 286720
	add	x21, x21, 2612
	b	.L1355
	.p2align 3
.L1367:
	mov	w4, 1
	b	.L1361
	.size	MVC_GetReRangeFlag, .-MVC_GetReRangeFlag
	.align	3
.LC91:
	.xword	.LC90
	.align	3
.LC93:
	.xword	.LC92
	.align	3
.LC94:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecPOC
	.type	MVC_DecPOC, %function
MVC_DecPOC:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, [x19, 248]
	mov	w4, 1
	add	x0, x19, 11116544
	ldr	w3, [x2, 2900]
	ldr	w1, [x2, 2896]
	cmp	w3, w4
	ldrb	w5, [x0, 2971]
	add	w1, w1, 4
	lsl	w1, w4, w1
	beq	.L1375
	cbz	w3, .L1376
	cmp	w3, 2
	bne	.L1373
	cmp	w5, 5
	beq	.L1430
	ldrsb	w2, [x0, 1832]
	cbz	w2, .L1409
	ldr	w3, [x0, 1888]
	mov	w2, 0
	mov	w1, 0
	str	wzr, [x0, 1884]
	str	wzr, [x0, 1896]
.L1410:
	str	w1, [x0, 1892]
.L1412:
	ldrb	w4, [x0, 2976]
	add	w1, w3, w1
	str	w1, [x0, 1880]
	lsl	w1, w1, 1
	cbnz	w4, .L1413
	sub	w1, w1, #1
	str	w1, [x0, 1868]
.L1414:
	ldrb	w3, [x0, 2969]
	cbnz	w3, .L1415
	str	w1, [x0, 1856]
	str	w1, [x0, 1860]
	str	w1, [x0, 1864]
.L1408:
	ldr	w1, [x0, 1888]
	str	w1, [x0, 1884]
	str	w2, [x0, 1896]
.L1373:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1376:
	ldr	w1, [x2, 2904]
	cmp	w5, 5
	add	w1, w1, 4
	lsl	w4, w4, w1
	beq	.L1382
	ldrsb	w1, [x0, 1832]
	cbnz	w1, .L1380
	ldr	w5, [x0, 1844]
	ldr	w3, [x0, 1848]
	mov	w2, w5
.L1381:
	ldr	w1, [x0, 1836]
	cmp	w1, w3
	bcs	.L1379
	sub	w6, w3, w1
	cmp	w6, w4, lsr 1
	bcc	.L1379
	add	w2, w2, w4
	str	w2, [x0, 1852]
.L1383:
	ldrb	w3, [x0, 2969]
	cbnz	w3, .L1385
.L1433:
	ldr	w3, [x0, 1840]
	add	w1, w1, w2
	str	w1, [x0, 1856]
	add	w2, w1, w3
	str	w2, [x0, 1860]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 1868]
.L1386:
	ldr	w3, [x0, 1884]
	ldr	w2, [x0, 1888]
	str	w1, [x0, 1864]
	cmp	w2, w3
	beq	.L1388
	str	w2, [x0, 1884]
.L1388:
	ldrb	w1, [x0, 2976]
	cbz	w1, .L1373
	ldr	w2, [x0, 1836]
	ldr	w1, [x0, 1852]
	str	w1, [x0, 1844]
	str	w2, [x0, 1848]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1375:
	cmp	w5, 5
	beq	.L1431
	ldrsb	w3, [x0, 1832]
	cbz	w3, .L1391
	mov	w1, 0
	str	wzr, [x0, 1884]
	str	wzr, [x0, 1896]
.L1392:
	str	w1, [x0, 1892]
.L1390:
	ldr	w1, [x2, 2916]
	cbz	w1, .L1394
	ldr	w1, [x0, 1888]
	ldr	w5, [x0, 1892]
	ldrb	w6, [x0, 2976]
	add	w5, w5, w1
	str	w5, [x0, 1880]
	cbnz	w6, .L1396
	cbz	w5, .L1397
	sub	w5, w5, #1
	str	w5, [x0, 1880]
.L1396:
	str	wzr, [x0, 1912]
	ldr	w1, [x2, 2916]
	cmp	w1, wzr
	ble	.L1398
.L1417:
	mov	w4, 0
	mov	w3, 0
	.p2align 2
.L1399:
	add	x1, x2, x3, sxtw 2
	add	w3, w3, 1
	ldr	w1, [x1, 2920]
	add	w4, w4, w1
	str	w4, [x0, 1912]
	ldr	w1, [x2, 2916]
	cmp	w1, w3
	bgt	.L1399
.L1398:
	cbz	w5, .L1400
	sub	w5, w5, #1
	ldr	w7, [x0, 1912]
	udiv	w1, w5, w1
	str	w1, [x0, 1904]
	ldr	w4, [x2, 2916]
	udiv	w3, w5, w4
	mul	w1, w1, w7
	str	w1, [x0, 1908]
	msub	w5, w3, w4, w5
	str	w5, [x0, 1900]
	tbnz	w5, #31, .L1401
	mov	w3, 0
	.p2align 2
.L1402:
	add	x4, x2, x3, sxtw 2
	add	w3, w3, 1
	cmp	w5, w3
	ldr	w4, [x4, 2920]
	add	w1, w1, w4
	str	w1, [x0, 1908]
	bge	.L1402
.L1401:
	cbnz	w6, .L1403
	ldr	w3, [x2, 2908]
	add	w1, w1, w3
	str	w1, [x0, 1908]
.L1403:
	ldrb	w3, [x0, 2969]
	cbnz	w3, .L1404
	ldr	w3, [x0, 1872]
	ldr	w4, [x0, 1876]
	add	w1, w1, w3
	str	w1, [x0, 1856]
	ldr	w2, [x2, 2912]
	add	w2, w1, w2
	add	w2, w2, w4
	str	w2, [x0, 1860]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 1868]
.L1405:
	ldr	w3, [x0, 1888]
	ldr	w2, [x0, 1892]
	str	w1, [x0, 1864]
	str	w3, [x0, 1884]
	str	w2, [x0, 1896]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1380:
	ldrsb	w1, [x0, 1833]
	cbz	w1, .L1432
.L1382:
	ldr	w1, [x0, 1836]
	mov	w2, 0
	mov	w5, 0
	str	wzr, [x0, 1844]
	str	wzr, [x0, 1848]
.L1379:
	cmp	w1, w3
	bls	.L1384
	sub	w3, w1, w3
	cmp	w3, w4, lsr 1
	bls	.L1384
	sub	w2, w2, w4
	str	w2, [x0, 1852]
	b	.L1383
	.p2align 3
.L1430:
	add	x1, x0, 1792
	mov	w2, 0
	stp	wzr, wzr, [x1, 64]
	stp	wzr, wzr, [x1, 72]
	str	wzr, [x0, 1892]
	b	.L1408
	.p2align 3
.L1431:
	str	wzr, [x0, 1892]
	b	.L1390
	.p2align 3
.L1384:
	ldrb	w3, [x0, 2969]
	str	w5, [x0, 1852]
	cbz	w3, .L1433
.L1385:
	ldrb	w3, [x0, 2970]
	add	w1, w1, w2
	cbnz	w3, .L1387
	str	w1, [x0, 1856]
	str	w1, [x0, 1868]
	b	.L1386
	.p2align 3
.L1394:
	ldrb	w6, [x0, 2976]
	str	wzr, [x0, 1880]
.L1397:
	str	wzr, [x0, 1912]
	mov	w5, 0
	ldr	w1, [x2, 2916]
	cmp	w1, wzr
	bgt	.L1417
	.p2align 2
.L1400:
	mov	w1, 0
	str	wzr, [x0, 1908]
	b	.L1401
	.p2align 3
.L1404:
	ldrb	w3, [x0, 2970]
	cbnz	w3, .L1406
	ldr	w2, [x0, 1872]
	add	w1, w1, w2
	str	w1, [x0, 1856]
	str	w1, [x0, 1868]
	b	.L1405
	.p2align 3
.L1409:
	ldr	w2, [x0, 1884]
	ldr	w3, [x0, 1888]
	cmp	w3, w2
	ldr	w2, [x0, 1896]
	bcs	.L1411
	add	w1, w1, w2
	str	w1, [x0, 1892]
	mov	w2, w1
	b	.L1412
	.p2align 3
.L1391:
	ldr	w3, [x0, 1884]
	ldr	w4, [x0, 1888]
	cmp	w4, w3
	bcs	.L1393
	ldr	w3, [x0, 1896]
	add	w1, w3, w1
	str	w1, [x0, 1892]
	b	.L1390
	.p2align 3
.L1415:
	ldrb	w3, [x0, 2970]
	str	w1, [x0, 1864]
	cbnz	w3, .L1416
	str	w1, [x0, 1856]
	b	.L1408
	.p2align 3
.L1413:
	str	w1, [x0, 1868]
	b	.L1414
	.p2align 3
.L1387:
	str	w1, [x0, 1860]
	str	w1, [x0, 1868]
	b	.L1386
	.p2align 3
.L1406:
	ldr	w3, [x2, 2912]
	ldr	w2, [x0, 1872]
	add	w1, w1, w3
	add	w1, w1, w2
	str	w1, [x0, 1860]
	str	w1, [x0, 1868]
	b	.L1405
	.p2align 3
.L1432:
	ldr	w3, [x0, 1856]
	mov	w2, 0
	mov	w5, 0
	str	wzr, [x0, 1844]
	str	w3, [x0, 1848]
	b	.L1381
	.p2align 3
.L1416:
	str	w1, [x0, 1860]
	b	.L1408
.L1393:
	ldr	w1, [x0, 1896]
	b	.L1392
.L1411:
	mov	w1, w2
	b	.L1410
	.size	MVC_DecPOC, .-MVC_DecPOC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_CalcPicNum
	.type	MVC_CalcPicNum, %function
MVC_CalcPicNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11157504
	ldr	x0, [x19, 248]
	mov	w8, 1
	ldrb	w2, [x1, 3723]
	add	x1, x19, 11124736
	ldr	w0, [x0, 2896]
	add	w0, w0, 4
	lsl	w8, w8, w0
	cbz	w2, .L1435
	ldr	w0, [x1, 928]
	cmp	w2, 1
	cset	w6, eq
	cmp	w2, 2
	cset	w7, eq
	mov	w2, 0
	add	x9, x19, 11161600
	cbz	w0, .L1455
	.p2align 2
.L1472:
	add	x0, x19, x2, uxtw 3
	add	x0, x0, 11124736
	ldr	x3, [x0, 664]
	ldrb	w4, [x3, 3]
	cbz	w4, .L1449
	ldr	w4, [x3, 20]
	ldr	w5, [x9, 320]
	cmp	w4, w5
	bls	.L1450
	sub	w4, w4, w8
	str	w4, [x3, 24]
.L1451:
	ldr	x3, [x0, 664]
	ldrb	w4, [x3, 3]
	tbz	x4, 0, .L1452
	ldr	w5, [x3, 784]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L1482
.L1452:
	tbz	x4, 1, .L1449
	ldr	w0, [x3, 832]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L1483
	.p2align 2
.L1449:
	ldr	w0, [x1, 928]
	add	w2, w2, 1
	cmp	w0, w2
	bhi	.L1472
.L1455:
	ldr	w0, [x1, 932]
	mov	w2, 0
	cbz	w0, .L1434
	.p2align 2
.L1471:
	add	x0, x19, x2, uxtw 3
	add	w2, w2, 1
	add	x0, x0, 11124736
	ldr	x4, [x0, 792]
	ldrb	w3, [x4, 3]
	cbz	w3, .L1457
	tbz	x3, 0, .L1458
	ldr	w5, [x4, 784]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L1484
.L1458:
	tbz	x3, 1, .L1457
	ldr	w0, [x4, 832]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L1485
	.p2align 2
.L1457:
	ldr	w0, [x1, 932]
	cmp	w0, w2
	bhi	.L1471
.L1434:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1450:
	str	w4, [x3, 24]
	b	.L1451
	.p2align 3
.L1435:
	ldr	w2, [x1, 928]
	mov	w0, 0
	add	x5, x19, 11161600
	cbnz	w2, .L1470
	.p2align 2
.L1445:
	ldr	w0, [x1, 932]
	mov	w2, 0
	cbz	w0, .L1434
	uxtw	x0, w2
	add	w2, w2, 1
	add	x0, x0, 1388544
	add	x0, x19, x0, lsl 3
	ldr	x0, [x0, 17176]
	ldrb	w3, [x0, 3]
	cmp	w3, 3
	beq	.L1486
	.p2align 2
.L1446:
	ldr	w0, [x1, 932]
	cmp	w0, w2
	bls	.L1434
	uxtw	x0, w2
	add	w2, w2, 1
	add	x0, x0, 1388544
	add	x0, x19, x0, lsl 3
	ldr	x0, [x0, 17176]
	ldrb	w3, [x0, 3]
	cmp	w3, 3
	bne	.L1446
.L1486:
	ldr	w3, [x0, 736]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L1446
	ldr	w3, [x0, 28]
	str	w3, [x0, 752]
	b	.L1446
	.p2align 3
.L1488:
	ldr	w4, [x3, 736]
	and	w4, w4, 16776960
	cmp	w4, 65536
	bne	.L1441
	ldr	w4, [x3, 20]
	ldr	w6, [x5, 320]
	cmp	w4, w6
	sub	w6, w4, w8
	bhi	.L1487
	str	w4, [x3, 24]
.L1443:
	ldr	x2, [x2, 664]
	ldr	w3, [x2, 24]
	str	w3, [x2, 756]
	.p2align 2
.L1441:
	ldr	w2, [x1, 928]
	add	w0, w0, 1
	cmp	w2, w0
	bls	.L1445
.L1470:
	add	x2, x19, x0, uxtw 3
	add	x2, x2, 11124736
	ldr	x3, [x2, 664]
	ldrb	w4, [x3, 3]
	cmp	w4, 3
	bne	.L1441
	b	.L1488
	.p2align 3
.L1484:
	ldr	w3, [x4, 28]
	add	w3, w6, w3, lsl 1
	str	w3, [x4, 800]
	ldr	x4, [x0, 792]
	ldrb	w3, [x4, 3]
	b	.L1458
	.p2align 3
.L1482:
	ldr	w4, [x3, 24]
	add	w4, w6, w4, lsl 1
	str	w4, [x3, 804]
	ldr	x3, [x0, 664]
	ldrb	w4, [x3, 3]
	b	.L1452
	.p2align 3
.L1485:
	ldr	w0, [x4, 28]
	add	w0, w7, w0, lsl 1
	str	w0, [x4, 848]
	b	.L1457
	.p2align 3
.L1483:
	ldr	w0, [x3, 24]
	add	w0, w7, w0, lsl 1
	str	w0, [x3, 852]
	b	.L1449
	.p2align 3
.L1487:
	str	w6, [x3, 24]
	b	.L1443
	.size	MVC_CalcPicNum, .-MVC_CalcPicNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IsOutDPB
	.type	MVC_IsOutDPB, %function
MVC_IsOutDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L1494
	add	x2, x20, 11124736
	ldr	w0, [x2, 920]
	cbz	w0, .L1494
	ldr	x1, [x2, 536]
	cmp	x19, x1
	ccmp	x1, xzr, 4, eq
	bne	.L1496
	sub	w0, w0, #1
	add	x2, x2, 544
	add	x0, x0, 1388544
	add	x0, x0, 2116
	add	x0, x20, x0, lsl 3
	b	.L1491
	.p2align 3
.L1492:
	ldr	x3, [x2], 8
	cmp	x19, x3
	ccmp	x3, xzr, 4, eq
	bne	.L1496
.L1491:
	cmp	x2, x0
	bne	.L1492
.L1494:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1496:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_IsOutDPB, .-MVC_IsOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_combine_scalinglist
	.type	mvc_combine_scalinglist, %function
mvc_combine_scalinglist:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	x20, x1
	bl	_mcount
	cmp	w19, wzr
	ble	.L1497
	ldr	x1, .LC97
	mov	x5, 0
	mov	w2, 255
	b	.L1501
	.p2align 3
.L1499:
	ldrb	w3, [x5, x0]
.L1500:
	lsr	w6, w3, 2
	ldr	w4, [x21, w3, uxtw 2]
	ubfiz	w7, w3, 3, 2
	add	x5, x5, 1
	lsl	w3, w2, w7
	and	w4, w4, 255
	ldr	w0, [x20, w6, uxtw 2]
	lsl	w4, w4, w7
	cmp	w19, w5
	bic	w0, w0, w3
	orr	w0, w4, w0
	str	w0, [x20, w6, uxtw 2]
	ble	.L1497
.L1501:
	cmp	w19, 16
	add	x0, x1, 16
	bne	.L1499
	ldrb	w3, [x1, x5]
	b	.L1500
	.p2align 3
.L1497:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	mvc_combine_scalinglist, .-mvc_combine_scalinglist
	.align	3
.LC97:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_assign_quant_params
	.type	mvc_assign_quant_params, %function
mvc_assign_quant_params:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	cbz	x20, .L1535
	cbz	x19, .L1536
	ldrb	w0, [x19, 18]
	cbz	w0, .L1524
	ldr	x21, .LC102
	add	x0, x19, 2016
	ldr	x22, .LC99
	add	x24, x19, 5
	mov	x26, x0
	add	x25, x19, 1984
	mov	w27, 1
	mov	w28, 0
	mov	x23, x21
	str	x0, [x29, 104]
	b	.L1509
	.p2align 3
.L1539:
	cbz	w28, .L1537
	cmp	w28, 3
	beq	.L1538
	ldr	x8, .LC102
	sub	w1, w28, #1
	add	x1, x1, 126
	mov	x2, 16
	mov	x0, x26
	ldr	x8, [x8, 104]
	add	x1, x19, x1, lsl 4
	blr	x8
.L1517:
	cmp	w27, 7
	bhi	.L1524
.L1523:
	add	w28, w28, 1
	add	w27, w27, 1
	add	x24, x24, 1
	add	x26, x26, 16
	add	x25, x25, 4
.L1509:
	cmp	w28, 5
	ldrsb	w0, [x24]
	bhi	.L1510
	cbz	w0, .L1539
	ldr	w0, [x25]
	cbz	w0, .L1517
	cmp	w28, 2
	ldr	x1, .LC99
	ldr	x8, [x23, 104]
	bls	.L1518
	add	x1, x1, 16
.L1518:
	mov	x2, 16
	mov	x0, x26
	blr	x8
	cmp	w27, 7
	bls	.L1523
	.p2align 2
.L1524:
	mov	w0, 0
.L1506:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1510:
	cbnz	w0, .L1519
	ldrb	w0, [x20, 27]
	cbnz	w0, .L1520
	ldr	x1, .LC102
	sub	w0, w28, #6
	add	x0, x0, 33
	cmp	w28, 6
	ldr	x8, [x1, 104]
	add	x0, x19, x0, lsl 6
	ldr	x1, .LC99
	beq	.L1534
	add	x1, x1, 96
.L1522:
	mov	x2, 64
	blr	x8
	b	.L1517
	.p2align 3
.L1519:
	sub	w0, w28, #6
	add	x1, x19, x0, lsl 2
	ldr	w1, [x1, 2008]
	cbz	w1, .L1517
	add	x0, x0, 33
	cmp	w28, 6
	ldr	x8, [x21, 104]
	add	x0, x19, x0, lsl 6
	beq	.L1527
	add	x1, x22, 96
	b	.L1522
	.p2align 3
.L1520:
	ldr	x0, .LC102
	sub	w1, w28, #6
	mov	x2, 64
	ldr	x8, [x0, 104]
	add	x0, x1, 33
	add	x1, x20, x1, lsl 6
	add	x1, x1, 2768
	add	x0, x19, x0, lsl 6
	blr	x8
	b	.L1517
.L1535:
	ldr	x2, .LC100
	mov	w3, 6980
	ldr	x1, .LC101
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1506
.L1536:
	ldr	x2, .LC100
	mov	w3, 6981
	ldr	x1, .LC101
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1506
.L1537:
	ldrb	w0, [x20, 27]
	cbnz	w0, .L1513
	ldr	x0, .LC102
	mov	x2, 16
	ldr	x1, .LC99
	ldr	x8, [x0, 104]
	ldr	x0, [x29, 104]
	blr	x8
	b	.L1523
.L1538:
	ldrb	w0, [x20, 27]
	cbnz	w0, .L1516
	ldr	x0, .LC102
	mov	x2, 16
	ldr	x1, .LC103
	ldr	x8, [x0, 104]
	add	x0, x19, 2064
	blr	x8
	b	.L1523
.L1513:
	ldr	x0, .LC102
	mov	x2, 16
	add	x1, x20, 2672
	ldr	x8, [x0, 104]
	ldr	x0, [x29, 104]
	blr	x8
	b	.L1523
.L1516:
	ldr	x0, .LC102
	mov	x2, 16
	add	x1, x20, 2720
	ldr	x8, [x0, 104]
	add	x0, x19, 2064
	blr	x8
	b	.L1523
.L1527:
	ldr	x1, .LC99
.L1534:
	add	x1, x1, 32
	b	.L1522
	.size	mvc_assign_quant_params, .-mvc_assign_quant_params
	.align	3
.LC99:
	.xword	.LANCHOR1
	.align	3
.LC100:
	.xword	.LC36
	.align	3
.LC101:
	.xword	.LC38
	.align	3
.LC102:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC103:
	.xword	.LANCHOR1+16
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_WriteCurrPicYUV
	.type	MVC_WriteCurrPicYUV, %function
MVC_WriteCurrPicYUV:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 11161600
	add	x19, x19, 11157504
	bl	_mcount
	ldr	x1, .LC105
	mov	w0, 2
	ldr	x2, [x20, 304]
	ldrb	w19, [x19, 3723]
	ldr	w3, [x2, 252]
	mov	w2, w19
	bl	dprint_vfmw
	cmp	w19, 3
	ldr	w3, [x20, 368]
	ccmp	w19, wzr, 4, ne
	ldr	w4, [x20, 372]
	cset	w0, eq
	ldr	x1, .LC107
	cmp	w0, wzr
	mov	w2, 1
	csinc	w2, w2, w19, ne
	mov	w0, 22
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_WriteCurrPicYUV, .-MVC_WriteCurrPicYUV
	.align	3
.LC105:
	.xword	.LC104
	.align	3
.LC107:
	.xword	.LC106
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_WritePicMsg
	.type	MVC_WritePicMsg, %function
MVC_WritePicMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11161600
	add	x21, x20, 11157504
	bl	_mcount
	add	x22, x20, 11108352
	ldr	x1, .LC109
	mov	w0, 2
	ldrb	w3, [x21, 3723]
	add	x24, x20, 11112448
	ldr	w2, [x19, 328]
	ldr	w5, [x19, 388]
	ldr	w4, [x21, 3916]
	bl	dprint_vfmw
	str	wzr, [x20, 64]
	add	x0, x20, 11116544
	ldr	x1, [x19, 280]
	str	x1, [x19, 2304]
	ldr	w3, [x19, 328]
	ldr	x1, [x20, 864]
	str	x1, [x19, 3352]
	ldr	w4, [x19, 372]
	ldr	w1, [x21, 3900]
	str	w1, [x19, 3132]
	ldr	w2, [x19, 376]
	ldr	w1, [x21, 3904]
	str	w1, [x19, 3136]
	ldr	w1, [x21, 3908]
	str	w1, [x19, 3140]
	str	w3, [x19, 2312]
	ldrb	w1, [x21, 3723]
	strb	w1, [x19, 2296]
	ldr	x1, [x20, 248]
	ldrb	w3, [x1, 21]
	str	w3, [x19, 2328]
	str	w4, [x19, 2316]
	str	w2, [x19, 2320]
	ldr	w2, [x1, 3948]
	add	w2, w2, 1
	str	w2, [x19, 2324]
	ldrb	w2, [x22, 3812]
	strb	w2, [x19, 2299]
	ldr	w2, [x24, 3748]
	str	w2, [x19, 2332]
	ldrb	w2, [x24, 3688]
	str	w2, [x19, 2336]
	ldr	w1, [x1, 748]
	strb	w1, [x19, 2297]
	ldrb	w2, [x24, 3692]
	str	w2, [x19, 2340]
	ldr	x1, [x19, 304]
	ldr	w2, [x0, 1868]
	str	w2, [x19, 2344]
	ldr	w2, [x0, 1856]
	str	w2, [x19, 2348]
	ldr	w0, [x0, 1860]
	str	w0, [x19, 2352]
	ldrsb	w1, [x1, 6]
	ldr	w0, [x20, 120]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cbz	x0, .L1577
	ldr	x2, [x0, 680]
	ldr	x3, [x0, 688]
	cbz	x2, .L1547
	cbz	x3, .L1547
	ldr	w0, [x20, 120]
	add	x3, x19, 2732
	add	x2, x19, 2604
	add	x1, x19, 2992
	add	x21, x20, 11124736
	bl	FSP_GetDecFsAddrTab
	ldr	x0, [x23, 680]
	add	x2, x19, 2996
	add	x1, x19, 3124
	ldr	w0, [x0, 8]
	str	w0, [x19, 2588]
	ldr	w0, [x20, 120]
	bl	FSP_GetPmvAddrTab
	ldr	w0, [x19, 388]
	str	w0, [x19, 2596]
	ldr	w0, [x23, 708]
	str	w0, [x19, 3128]
	ldr	x0, [x23, 688]
	ldr	w0, [x0, 16]
	str	w0, [x19, 2592]
	ldr	x0, [x23, 688]
	ldr	w0, [x0, 76]
	str	w0, [x19, 2600]
	ldr	w4, [x21, 1152]
	str	w4, [x19, 3344]
	cbz	w4, .L1553
	sub	w3, w4, #1
	add	x0, x21, 960
	add	x3, x3, 2781184
	add	x1, x19, 3152
	add	x3, x3, 241
	add	x3, x20, x3, lsl 2
	.p2align 2
.L1552:
	ldr	w2, [x0]
	add	x0, x0, 4
	str	w2, [x1]
	add	x1, x1, 4
	cmp	x3, x0
	ldr	w2, [x0, 60]
	str	w2, [x1, 60]
	ldr	w2, [x0, 124]
	str	w2, [x1, 124]
	bne	.L1552
.L1553:
	ldrb	w0, [x22, 3819]
	cbnz	w0, .L1578
	ldrb	w0, [x24, 3706]
	cbnz	w0, .L1554
	ldr	x9, .LC114
	add	x5, x19, 2356
	mov	w1, 0
	.p2align 2
.L1555:
	and	w2, w1, 3
	add	x0, x9, 352
	add	w1, w1, 1
	cmp	w1, 24
	ldr	w0, [x0, w2, uxtw 2]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1555
	add	x19, x19, 2452
	mov	w5, 0
	.p2align 2
.L1556:
	add	w0, w5, 1
	and	w2, w5, 14
	add	x1, x9, 368
	and	w0, w0, 15
	add	x19, x19, 8
	add	w5, w5, 2
	cmp	w5, 32
	ldr	w0, [x1, w0, uxtw 2]
	ldr	w1, [x1, w2, uxtw 2]
	lsr	w7, w0, 16
	ubfx	x2, x0, 8, 8
	lsr	w3, w1, 16
	lsr	w6, w1, 24
	ubfiz	w10, w0, 16, 8
	ubfiz	w8, w3, 8, 8
	and	w0, w0, -16777216
	and	w3, w1, 255
	ubfx	x1, x1, 8, 8
	orr	w0, w0, w2, lsl 16
	orr	w7, w10, w7, lsl 24
	orr	w3, w8, w3
	orr	w1, w1, w6, lsl 8
	orr	w2, w7, w3
	orr	w0, w1, w0
	stp	w2, w0, [x19, -8]
	bne	.L1556
.L1562:
	mov	w22, 0
	cbz	w4, .L1558
	.p2align 2
.L1566:
	add	x19, x20, x22, uxtw 2
	ldr	w0, [x20, 120]
	add	x23, x19, 11124736
	mov	w1, 0
	add	x19, x19, 11161600
	add	w22, w22, 1
	ldr	w2, [x23, 960]
	bl	FSP_GetStoreType
	cmp	w0, wzr
	cset	w0, ne
	str	w0, [x19, 3488]
	ldr	w0, [x23, 960]
	str	w0, [x19, 3552]
	ldr	w0, [x21, 1152]
	cmp	w0, w22
	bhi	.L1566
.L1558:
	mov	w0, 0
.L1545:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1578:
	ldrb	w0, [x24, 3706]
.L1554:
	cmp	w0, 1
	add	x5, x19, 2356
	mov	w1, 0
	beq	.L1560
	.p2align 2
.L1563:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 2777088
	cmp	w1, 24
	add	x0, x0, 1616
	ldr	w0, [x20, x0, lsl 2]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1563
	add	x19, x19, 2452
	mov	w9, 1
	mov	w5, 0
	.p2align 2
.L1564:
	ubfx	x1, x5, 3, 29
	ubfiz	x0, x5, 1, 3
	and	x2, x9, 15
	lsl	x1, x1, 4
	add	x2, x1, x2
	add	x1, x1, x0
	add	x1, x1, 2777088
	add	x0, x2, 2777088
	add	x0, x0, 1640
	add	x1, x1, 1640
	add	x19, x19, 8
	add	w5, w5, 1
	cmp	w5, 16
	add	w9, w9, 2
	ldr	w0, [x20, x0, lsl 2]
	ldr	w1, [x20, x1, lsl 2]
	lsr	w3, w0, 16
	ubfx	x7, x0, 8, 8
	lsr	w8, w1, 16
	lsr	w6, w1, 24
	ubfiz	w10, w8, 8, 8
	ubfiz	w11, w0, 16, 8
	and	w8, w1, 255
	ubfx	x2, x1, 8, 8
	lsl	w6, w6, 8
	and	w1, w0, -16777216
	orr	w0, w2, w1
	orr	w8, w10, w8
	orr	w3, w11, w3, lsl 24
	orr	w6, w6, w7, lsl 16
	orr	w1, w8, w3
	orr	w0, w6, w0
	stp	w1, w0, [x19, -8]
	bne	.L1564
	b	.L1562
	.p2align 3
.L1560:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 2777088
	cmp	w1, 24
	add	x0, x20, x0, lsl 2
	ldr	w0, [x0, 9800]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1560
	add	x19, x19, 2452
	mov	w9, 1
	mov	w5, 0
	.p2align 2
.L1561:
	ubfx	x1, x5, 3, 29
	ubfiz	x0, x5, 1, 3
	and	x2, x9, 15
	lsl	x1, x1, 4
	add	x2, x1, x2
	add	x1, x1, x0
	add	x1, x1, 2777088
	add	x0, x2, 2777088
	add	x19, x19, 8
	add	w5, w5, 1
	add	x0, x20, x0, lsl 2
	add	x1, x20, x1, lsl 2
	cmp	w5, 16
	add	w9, w9, 2
	ldr	w0, [x0, 9896]
	ldr	w1, [x1, 9896]
	lsr	w8, w0, 16
	ubfx	x7, x0, 8, 8
	lsr	w3, w1, 16
	lsr	w6, w1, 24
	ubfiz	w11, w0, 16, 8
	ubfiz	w10, w3, 8, 8
	ubfx	x2, x1, 8, 8
	and	w3, w1, 255
	lsl	w6, w6, 8
	and	w1, w0, -16777216
	orr	w0, w2, w1
	orr	w8, w11, w8, lsl 24
	orr	w3, w10, w3
	orr	w6, w6, w7, lsl 16
	orr	w1, w8, w3
	orr	w0, w6, w0
	stp	w1, w0, [x19, -8]
	bne	.L1561
	b	.L1562
.L1547:
	ldr	x1, .LC113
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1545
.L1577:
	ldr	x2, [x19, 304]
	mov	w0, 0
	ldr	x1, .LC111
	ldrsb	w2, [x2, 6]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1545
	.size	MVC_WritePicMsg, .-MVC_WritePicMsg
	.align	3
.LC109:
	.xword	.LC108
	.align	3
.LC111:
	.xword	.LC110
	.align	3
.LC113:
	.xword	.LC112
	.align	3
.LC114:
	.xword	.LANCHOR1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_UpdatePicQpInf
	.type	MVC_UpdatePicQpInf, %function
MVC_UpdatePicQpInf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	ldp	w1, w0, [x19, 36]
	cmp	w1, w20
	csel	w1, w1, w20, ge
	cmp	w0, w20
	csel	w0, w0, w20, le
	stp	w1, w0, [x19, 36]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_UpdatePicQpInf, .-MVC_UpdatePicQpInf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_WriteSliceMsg
	.type	MVC_WriteSliceMsg, %function
MVC_WriteSliceMsg:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w5, [x19, 64]
	ldr	w1, [x19, 32]
	add	w0, w5, 1
	ldr	x6, [x19, 864]
	uxtw	x21, w5
	sub	w1, w1, #1
	lsl	x4, x21, 7
	cmp	w5, w1
	sub	x4, x4, x21
	str	w0, [x19, 64]
	lsl	x4, x4, 5
	add	x22, x6, x4
	bcs	.L1581
	lsl	x1, x0, 7
	sub	x0, x1, x0
	add	x0, x6, x0, lsl 5
	str	x0, [x22, 4056]
.L1582:
	ldr	x3, [x19, 240]
	ldrb	w2, [x3]
	ldr	w0, [x3, 76]
	cmp	w2, 1
	ccmp	w2, w0, 2, ls
	bcs	.L1583
	.p2align 2
.L1584:
	uxtw	x0, w2
	add	w2, w2, 1
	lsl	x1, x0, 5
	add	x3, x3, x1
	add	x0, x22, x0, lsl 2
	ldr	w3, [x3, 28]
	str	w3, [x0, 16]
	ldr	x3, [x19, 240]
	add	x3, x3, x1
	ldr	w3, [x3, 24]
	str	w3, [x0, 8]
	ldr	x3, [x19, 240]
	add	x1, x3, x1
	ldr	w1, [x1, 32]
	str	w1, [x0, 24]
	ldr	x3, [x19, 240]
	ldr	w0, [x3, 76]
	cmp	w0, w2
	ccmp	w2, 1, 2, hi
	bls	.L1584
.L1583:
	cmp	w0, 1
	bhi	.L1589
	.p2align 2
.L1660:
	add	x1, x22, x0, uxtw 2
	add	w0, w0, 1
	cmp	w0, 2
	str	wzr, [x1, 8]
	str	wzr, [x1, 16]
	str	wzr, [x1, 24]
	bne	.L1660
.L1589:
	add	x20, x19, 11157504
	add	x23, x19, 11112448
	add	x1, x19, 11120640
	ldrb	w0, [x20, 3729]
	strb	w0, [x22, 1]
	ldr	w0, [x23, 3736]
	add	w2, w0, 26
	ldr	w0, [x1, 488]
	add	w0, w2, w0
	str	w0, [x22, 32]
	cbnz	w5, .L1685
	add	x24, x19, 11161600
	ldr	x2, [x24, 304]
	str	w0, [x2, 772]
	ldr	x0, [x24, 304]
	ldr	w2, [x22, 32]
	str	w2, [x0, 776]
.L1590:
	ldr	w0, [x1, 484]
	add	x28, x19, 11116544
	str	w0, [x22, 36]
	ldr	w0, [x28, 3032]
	str	w0, [x22, 40]
	ldr	w0, [x28, 3028]
	str	w0, [x22, 44]
	ldrb	w0, [x28, 2968]
	strb	w0, [x6, x4]
	ldr	w0, [x28, 3024]
	str	w0, [x22, 48]
	ldrb	w0, [x28, 2974]
	strb	w0, [x22, 2]
	ldr	x0, [x19, 248]
	ldrb	w0, [x0, 22]
	strb	w0, [x22, 3]
	ldr	w0, [x28, 3016]
	str	w0, [x22, 52]
	ldr	w0, [x28, 3020]
	str	w0, [x22, 56]
	ldrb	w0, [x28, 2968]
	cmp	w0, 1
	beq	.L1686
	cbz	w0, .L1687
	strb	wzr, [x22, 4]
.L1592:
	ldr	w0, [x23, 3740]
	str	w0, [x22, 60]
	ldr	w0, [x23, 3744]
	str	w0, [x22, 64]
	ldr	w0, [x1, 496]
	str	w0, [x22, 68]
	ldr	w0, [x1, 500]
	str	w0, [x22, 72]
	ldr	w0, [x1, 492]
	str	w0, [x22, 76]
	ldrb	w0, [x28, 2968]
	cmp	w0, 2
	beq	.L1631
	ldr	w0, [x28, 3016]
	cbz	w0, .L1634
	ldr	x1, [x19, 288]
	ldr	x1, [x1, 8]
	ldrb	w2, [x1, 1]
	cbz	w2, .L1597
	sub	w3, w0, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1599
	.p2align 3
.L1601:
	ldr	x1, [x0, 296]
	add	x0, x0, 8
	ldr	x1, [x1, 8]
	ldrb	w2, [x1, 1]
	cbz	w2, .L1597
.L1599:
	cmp	x3, x0
	bne	.L1601
.L1634:
	mov	w25, 0
.L1596:
	ldr	w0, [x28, 3020]
	cbz	w0, .L1635
	ldr	x1, [x19, 552]
	ldr	x1, [x1, 8]
	ldrb	w2, [x1, 1]
	cbz	w2, .L1603
	sub	w3, w0, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1605
	.p2align 3
.L1607:
	ldr	x1, [x0, 560]
	add	x0, x0, 8
	ldr	x1, [x1, 8]
	ldrb	w2, [x1, 1]
	cbz	w2, .L1603
.L1605:
	cmp	x3, x0
	bne	.L1607
.L1635:
	str	wzr, [x29, 108]
.L1602:
	ldrb	w0, [x20, 3723]
	cbz	w0, .L1608
	ldr	w0, [x28, 3016]
	mov	w26, 0
	cbnz	w0, .L1659
	b	.L1624
	.p2align 3
.L1689:
	cbz	x0, .L1641
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1620:
	lsl	x0, x20, 5
	add	x0, x0, x20, lsl 2
	add	x0, x22, x0
	str	w1, [x0, 1640]
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 52]
	str	w1, [x0, 1644]
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 32]
	str	w1, [x0, 1632]
	ldr	x1, [x27, 288]
	ldrb	w1, [x1]
	strb	w1, [x0, 1624]
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 736]
	strb	w1, [x0, 1626]
	ldr	x1, [x27, 288]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1688
	strb	w1, [x0, 1630]
	add	w26, w26, 1
	ldr	x1, [x27, 288]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1631]
	ldr	x1, [x27, 288]
	ldr	w1, [x1, 24]
	str	w1, [x0, 1656]
	ldr	w0, [x28, 3016]
	cmp	w0, w26
	bls	.L1624
.L1659:
	uxtw	x20, w26
	ldr	w0, [x19, 120]
	add	x27, x19, x20, lsl 3
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	ldr	x3, [x27, 288]
	lsl	x1, x20, 5
	add	x1, x1, x20, lsl 2
	add	x1, x22, x1
	ldr	x3, [x3, 8]
	ldr	w3, [x3, 48]
	str	w3, [x1, 1636]
	ldr	x3, [x27, 288]
	ldr	x3, [x3, 8]
	ldrb	w3, [x3, 2]
	strb	w3, [x1, 1625]
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 1]
	cmp	w1, 1
	bne	.L1689
	mov	w1, w25
	b	.L1620
	.p2align 3
.L1581:
	str	xzr, [x22, 4056]
	b	.L1582
	.p2align 3
.L1685:
	add	x24, x19, 11161600
	ldr	x2, [x24, 304]
	ldr	w3, [x2, 772]
	cmp	w3, w0
	csel	w3, w3, w0, ge
	str	w3, [x2, 772]
	ldr	w3, [x2, 776]
	cmp	w3, w0
	csel	w0, w3, w0, le
	str	w0, [x2, 776]
	b	.L1590
	.p2align 3
.L1687:
	ldrb	w0, [x23, 3690]
	strb	w0, [x22, 4]
	b	.L1592
	.p2align 3
.L1688:
	strb	w1, [x0, 1628]
	add	w26, w26, 1
	ldr	x1, [x27, 288]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1629]
	ldr	x1, [x27, 288]
	ldr	w1, [x1, 24]
	str	w1, [x0, 1652]
	ldr	w0, [x28, 3016]
	cmp	w0, w26
	bhi	.L1659
.L1624:
	ldrb	w0, [x28, 2968]
	cmp	w0, 1
	beq	.L1690
.L1611:
	add	x1, x19, 11124736
	add	x0, x22, 3928
	add	x1, x1, 1160
	add	x3, x22, 4056
	.p2align 2
.L1617:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L1617
	ldrb	w0, [x23, 3690]
	str	w0, [x24, 2580]
	ldr	w1, [x23, 3732]
	str	w1, [x24, 2584]
	cbz	w0, .L1629
	ldrb	w0, [x28, 2968]
	cbnz	w0, .L1629
.L1630:
	ldr	w0, [x28, 3036]
	mov	w2, 0
	str	w0, [x22, 80]
	ldr	w0, [x28, 3040]
	str	w0, [x22, 84]
	.p2align 2
.L1632:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x19, x0
	add	x0, x22, x0
	add	x1, x1, 11116544
	ldr	w3, [x1, 3044]
	str	w3, [x0, 88]
	ldr	w3, [x1, 3172]
	str	w3, [x0, 216]
	ldr	w3, [x1, 3300]
	str	w3, [x0, 344]
	ldr	w3, [x1, 3812]
	str	w3, [x0, 856]
	ldr	w3, [x1, 3940]
	str	w3, [x0, 984]
	ldr	w1, [x1, 4068]
	str	w1, [x0, 1112]
	ldr	w0, [x28, 3028]
	cmp	w0, w2
	bcs	.L1632
	ldrb	w0, [x28, 2968]
	cmp	w0, 1
	beq	.L1691
	.p2align 2
.L1631:
	add	x21, x21, 1392640
	ldr	x0, [x19, 240]
	add	x21, x19, x21, lsl 3
	str	x0, [x21, 21688]
	str	xzr, [x19, 240]
.L1580:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1641:
	mov	w1, 0
	b	.L1620
	.p2align 3
.L1597:
	ldrsb	w1, [x1, 6]
	ldr	w0, [x19, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L1692
	ldr	x0, [x0, 680]
	ldr	w25, [x0, 8]
	b	.L1596
	.p2align 3
.L1629:
	cmp	w1, 1
	bne	.L1631
	ldrb	w0, [x28, 2968]
	cmp	w0, 1
	bne	.L1631
	b	.L1630
	.p2align 3
.L1608:
	ldr	w0, [x28, 3016]
	mov	w26, 0
	cbnz	w0, .L1658
	b	.L1616
	.p2align 3
.L1693:
	cbz	x0, .L1637
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1614:
	lsl	x0, x20, 5
	add	w26, w26, 1
	add	x0, x0, x20, lsl 2
	add	x0, x22, x0
	str	w1, [x0, 1640]
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 52]
	str	w1, [x0, 1644]
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 32]
	str	w1, [x0, 1632]
	ldr	x1, [x27, 288]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1627]
	ldr	x1, [x27, 288]
	ldrb	w1, [x1]
	strb	w1, [x0, 1626]
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 760]
	str	w1, [x0, 1648]
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 808]
	str	w1, [x0, 1652]
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 856]
	str	w1, [x0, 1656]
	strb	wzr, [x0, 1624]
	ldr	w0, [x28, 3016]
	cmp	w0, w26
	bls	.L1616
.L1658:
	uxtw	x20, w26
	ldr	w0, [x19, 120]
	add	x27, x19, x20, lsl 3
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	ldr	x3, [x27, 288]
	lsl	x1, x20, 5
	add	x1, x1, x20, lsl 2
	add	x1, x22, x1
	ldr	x3, [x3, 8]
	ldr	w3, [x3, 48]
	str	w3, [x1, 1636]
	ldr	x3, [x27, 288]
	ldr	x3, [x3, 8]
	ldrb	w3, [x3, 2]
	strb	w3, [x1, 1625]
	ldr	x1, [x27, 288]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 1]
	cmp	w1, 1
	bne	.L1693
	mov	w1, w25
	b	.L1614
	.p2align 3
.L1637:
	mov	w1, 0
	b	.L1614
	.p2align 3
.L1616:
	ldrb	w0, [x28, 2968]
	cmp	w0, 1
	bne	.L1611
	ldr	w0, [x28, 3020]
	cbz	w0, .L1611
	mov	w27, 0
	b	.L1619
	.p2align 3
.L1694:
	cbz	x0, .L1639
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1618:
	lsl	x0, x20, 5
	add	w27, w27, 1
	add	x0, x0, x20, lsl 2
	add	x0, x22, x0
	str	w1, [x0, 1640]
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 52]
	str	w1, [x0, 2796]
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 32]
	str	w1, [x0, 2784]
	ldr	x1, [x25, 552]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2779]
	ldr	x1, [x25, 552]
	ldrb	w1, [x1]
	strb	w1, [x0, 2778]
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 760]
	str	w1, [x0, 2800]
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 808]
	str	w1, [x0, 2804]
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 856]
	str	w1, [x0, 2808]
	strb	wzr, [x0, 2776]
	ldr	w0, [x28, 3020]
	cmp	w0, w27
	bls	.L1611
.L1619:
	uxtw	x20, w27
	ldr	w0, [x19, 120]
	add	x25, x19, x20, lsl 3
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldr	w2, [x1, 48]
	lsl	x1, x20, 5
	add	x1, x1, x20, lsl 2
	add	x1, x22, x1
	str	w2, [x1, 2788]
	ldr	x2, [x25, 552]
	ldr	x2, [x2, 8]
	ldrb	w2, [x2, 2]
	strb	w2, [x1, 2777]
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 1]
	cmp	w1, 1
	bne	.L1694
	ldr	w1, [x29, 108]
	b	.L1618
	.p2align 3
.L1603:
	ldrsb	w1, [x1, 6]
	ldr	w0, [x19, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L1695
	ldr	x0, [x0, 680]
	ldr	w0, [x0, 8]
	str	w0, [x29, 108]
	b	.L1602
	.p2align 3
.L1686:
	ldr	w0, [x23, 3732]
	strb	w0, [x22, 4]
	b	.L1592
.L1691:
	mov	w2, 0
	.p2align 2
.L1633:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x19, x0
	add	x0, x22, x0
	add	x3, x1, 11116544
	add	x1, x1, 11120640
	ldr	w4, [x3, 3428]
	str	w4, [x0, 472]
	ldr	w4, [x3, 3556]
	str	w4, [x0, 600]
	ldr	w3, [x3, 3684]
	str	w3, [x0, 728]
	ldr	w3, [x1, 100]
	str	w3, [x0, 1240]
	ldr	w3, [x1, 228]
	str	w3, [x0, 1368]
	ldr	w1, [x1, 356]
	str	w1, [x0, 1496]
	ldr	w0, [x28, 3032]
	cmp	w0, w2
	bcs	.L1633
	b	.L1631
.L1639:
	mov	w1, 0
	b	.L1618
.L1690:
	ldr	w0, [x28, 3020]
	cbz	w0, .L1611
	mov	w27, 0
	b	.L1628
	.p2align 3
.L1697:
	cbz	x0, .L1643
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1625:
	lsl	x0, x20, 5
	add	x0, x0, x20, lsl 2
	add	x0, x22, x0
	str	w1, [x0, 2792]
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 52]
	str	w1, [x0, 2796]
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldr	w1, [x1, 32]
	str	w1, [x0, 2784]
	ldr	x1, [x25, 552]
	ldrb	w1, [x1]
	strb	w1, [x0, 2776]
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 736]
	strb	w1, [x0, 2778]
	ldr	x1, [x25, 552]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1696
	strb	w1, [x0, 2782]
	ldr	x1, [x25, 552]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2783]
	ldr	x1, [x25, 552]
	ldr	w1, [x1, 24]
	str	w1, [x0, 2808]
.L1627:
	ldr	w0, [x28, 3020]
	add	w27, w27, 1
	cmp	w0, w27
	bls	.L1611
.L1628:
	uxtw	x20, w27
	ldr	w0, [x19, 120]
	add	x25, x19, x20, lsl 3
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	ldr	x2, [x25, 552]
	lsl	x1, x20, 5
	add	x1, x1, x20, lsl 2
	add	x1, x22, x1
	ldr	x2, [x2, 8]
	ldr	w2, [x2, 48]
	str	w2, [x1, 2788]
	ldr	x2, [x25, 552]
	ldr	x2, [x2, 8]
	ldrb	w2, [x2, 2]
	strb	w2, [x1, 2777]
	ldr	x1, [x25, 552]
	ldr	x1, [x1, 8]
	ldrb	w1, [x1, 1]
	cmp	w1, 1
	bne	.L1697
	ldr	w1, [x29, 108]
	b	.L1625
	.p2align 3
.L1696:
	strb	w1, [x0, 2780]
	ldr	x1, [x25, 552]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2781]
	ldr	x1, [x25, 552]
	ldr	w1, [x1, 24]
	str	w1, [x0, 2804]
	b	.L1627
.L1643:
	mov	w1, 0
	b	.L1625
.L1692:
	ldr	x2, .LC117
	mov	w3, 8038
	ldr	x1, .LC119
	add	x2, x2, 80
	bl	dprint_vfmw
	b	.L1580
.L1695:
	ldr	x2, .LC117
	mov	w3, 8059
	ldr	x1, .LC119
	add	x2, x2, 80
	bl	dprint_vfmw
	b	.L1580
	.size	MVC_WriteSliceMsg, .-MVC_WriteSliceMsg
	.align	3
.LC117:
	.xword	.LANCHOR0
	.align	3
.LC119:
	.xword	.LC118
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_StopPicNum
	.type	MVC_StopPicNum, %function
MVC_StopPicNum:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	MVC_StopPicNum, .-MVC_StopPicNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetPicStreamSize
	.type	MVC_GetPicStreamSize, %function
MVC_GetPicStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 11161600
	bl	_mcount
	mov	w0, 0
	ldr	x2, [x19, 3352]
	cbz	x2, .L1700
	.p2align 2
.L1701:
	ldp	w3, w1, [x2, 8]
	ldr	x2, [x2, 4056]
	add	w1, w3, w1
	add	w1, w1, 7
	add	w0, w0, w1, lsr 3
	cbnz	x2, .L1701
.L1700:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_GetPicStreamSize, .-MVC_GetPicStreamSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SliceCheck
	.type	MVC_SliceCheck, %function
MVC_SliceCheck:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11116544
	bl	_mcount
	ldr	x1, .LC121
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x21, 3024]
	ldrb	w1, [x19, 10]
	cbnz	w1, .L1714
	mov	w1, 262143
	cmp	w0, w1
	bhi	.L1715
	ldp	w1, w2, [x19, 12]
	mul	w1, w1, w2
	sub	w1, w1, #1
	cmp	w0, w1
	bhi	.L1714
	ldr	x1, .LC125
	mov	x0, x19
	bl	mvc_ue_v
	mov	w2, w0
	ldr	x1, .LC127
	mov	w20, w0
	mov	w0, 19
	bl	dprint_vfmw
	ldrb	w0, [x19, 10]
	cbnz	w0, .L1714
	cmp	w20, 9
	bls	.L1716
	ldr	x1, .LC130
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
.L1714:
	mov	w0, -1
.L1706:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1716:
	ldr	x0, .LC128
	ldrb	w0, [x0,w20,uxtw]
	adr	x1, .Lrtx1711
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1711:
	.section	.rodata
	.align	0
	.align	2
.L1711:
	.byte	(.L1710 - .Lrtx1711) / 4
	.byte	(.L1712 - .Lrtx1711) / 4
	.byte	(.L1713 - .Lrtx1711) / 4
	.byte	(.L1710 - .Lrtx1711) / 4
	.byte	(.L1713 - .Lrtx1711) / 4
	.byte	(.L1710 - .Lrtx1711) / 4
	.byte	(.L1712 - .Lrtx1711) / 4
	.byte	(.L1713 - .Lrtx1711) / 4
	.byte	(.L1710 - .Lrtx1711) / 4
	.byte	(.L1713 - .Lrtx1711) / 4
	.text
	.p2align 3
.L1710:
	strb	wzr, [x21, 2968]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1713:
	mov	w1, 2
	strb	w1, [x21, 2968]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1712:
	mov	w1, 1
	strb	w1, [x21, 2968]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1715:
	ldr	x1, .LC123
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1706
	.size	MVC_SliceCheck, .-MVC_SliceCheck
	.align	3
.LC121:
	.xword	.LC120
	.align	3
.LC123:
	.xword	.LC122
	.align	3
.LC125:
	.xword	.LC124
	.align	3
.LC127:
	.xword	.LC126
	.align	3
.LC128:
	.xword	.L1711
	.align	3
.LC130:
	.xword	.LC129
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_PPSSPSCheck
	.type	MVC_PPSSPSCheck, %function
MVC_PPSSPSCheck:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11116544
	bl	_mcount
	ldr	x1, .LC132
	mov	w0, 19
	ldr	w2, [x19, 2984]
	bl	dprint_vfmw
	ldr	w2, [x19, 2984]
	mov	w0, 2240
	ldr	x3, [x20, 280]
	umull	x0, w2, w0
	add	x3, x3, x0
	ldrb	w0, [x3, 19]
	cbz	w0, .L1727
	ldrsb	w19, [x19, 2980]
	cmn	w19, #1
	beq	.L1728
	cbnz	w19, .L1722
	ldr	w2, [x3, 28]
	uxtw	x1, w2
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x0, x0, x1
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x0, x1, 6
	add	x1, x1, x0
	lsl	x1, x1, 2
	add	x0, x20, x1
	add	x1, x1, 286720
	add	x4, x0, 12288
	add	x1, x20, x1
	add	x1, x1, 2612
	ldrb	w4, [x4, 2396]
	cbz	w4, .L1723
	add	x0, x0, 286720
	ldrb	w0, [x0, 2637]
	cbz	w0, .L1723
.L1721:
	mov	w0, 0
	stp	x1, x3, [x20, 256]
.L1719:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1728:
	ldr	w2, [x3, 28]
	mov	w1, 3992
	ldr	x0, [x20, 272]
	umull	x1, w2, w1
	add	x1, x0, x1
	ldrb	w0, [x1, 25]
	cbnz	w0, .L1721
	ldr	x1, .LC136
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w19
	b	.L1719
	.p2align 3
.L1723:
	ldr	x1, .LC138
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1719
	.p2align 3
.L1727:
	ldr	x1, .LC134
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1719
	.p2align 3
.L1722:
	ldr	x1, .LC139
	mov	w2, w19
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1719
	.size	MVC_PPSSPSCheck, .-MVC_PPSSPSCheck
	.align	3
.LC132:
	.xword	.LC131
	.align	3
.LC134:
	.xword	.LC133
	.align	3
.LC136:
	.xword	.LC135
	.align	3
.LC138:
	.xword	.LC137
	.align	3
.LC139:
	.xword	.LC92
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_PPSSPSCheckTmpId
	.type	MVC_PPSSPSCheckTmpId, %function
MVC_PPSSPSCheckTmpId:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x1, .LC141
	mov	w2, w20
	mov	w0, 19
	bl	dprint_vfmw
	mov	w0, 2240
	ldr	x1, [x19, 280]
	umull	x0, w20, w0
	add	x0, x1, x0
	ldrb	w1, [x0, 19]
	cbz	w1, .L1735
	ldr	w1, [x19, 36]
	ldr	w2, [x0, 28]
	sub	w0, w1, #1
	cmp	w2, w0
	bhi	.L1736
	add	x1, x19, 11116544
	mov	w0, 0
	ldrsb	w20, [x1, 2980]
	cmn	w20, #1
	beq	.L1737
.L1731:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1737:
	mov	w1, 3992
	ldr	x3, [x19, 272]
	umull	x1, w2, w1
	add	x1, x3, x1
	ldrb	w1, [x1, 25]
	cbnz	w1, .L1731
	ldr	x1, .LC147
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w20
	b	.L1731
	.p2align 3
.L1735:
	ldr	x1, .LC143
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1731
	.p2align 3
.L1736:
	ldr	x1, .LC145
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1731
	.size	MVC_PPSSPSCheckTmpId, .-MVC_PPSSPSCheckTmpId
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC143:
	.xword	.LC142
	.align	3
.LC145:
	.xword	.LC144
	.align	3
.LC147:
	.xword	.LC146
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IsNewPic
	.type	MVC_IsNewPic, %function
MVC_IsNewPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11120640
	add	x3, x19, 11116544
	ldr	x4, [x19, 248]
	ldr	w5, [x3, 2984]
	ldr	w8, [x1, 540]
	ldr	w6, [x1, 536]
	ldr	w2, [x4, 744]
	cmp	w8, w5
	ldr	w0, [x3, 2996]
	ldr	w7, [x1, 544]
	ccmp	w6, w2, 0, eq
	ldrb	w5, [x1, 528]
	cset	w2, ne
	ldrb	w6, [x3, 2969]
	cmp	w7, w0
	ccmp	w5, w6, 0, eq
	cset	w0, ne
	cmp	w6, wzr
	ccmp	w5, wzr, 4, ne
	orr	w0, w2, w0
	beq	.L1740
	ldrb	w2, [x3, 2970]
	ldrb	w5, [x1, 529]
	cmp	w5, w2
	cset	w2, ne
	orr	w0, w0, w2
.L1740:
	ldrb	w2, [x1, 531]
	ldrb	w5, [x3, 2976]
	cmp	w2, w5
	beq	.L1746
	cmp	w5, wzr
	ccmp	w2, wzr, 4, ne
	cset	w7, eq
.L1741:
	ldrb	w6, [x1, 530]
	ldrb	w5, [x3, 2971]
	cmp	w6, w5
	cset	w2, ne
	cmp	w6, 5
	ccmp	w5, 5, 0, eq
	orr	w0, w2, w0
	orr	w2, w0, w7
	beq	.L1753
.L1742:
	ldr	w0, [x4, 2900]
	cbnz	w0, .L1743
	ldr	w6, [x1, 552]
	ldr	w5, [x3, 1836]
	ldr	w0, [x3, 1840]
	ldr	w4, [x1, 556]
	cmp	w6, w5
	ccmp	w4, w0, 0, eq
	cset	w0, ne
	orr	w2, w2, w0
.L1744:
	ldrb	w0, [x3, 2979]
	cbz	w0, .L1745
	ldr	w4, [x1, 512]
	ldr	w5, [x1, 572]
	ldrb	w6, [x1, 532]
	ldrb	w0, [x3, 2977]
	cmp	w5, w4
	ldrb	w5, [x1, 533]
	cset	w1, ne
	ldrb	w4, [x3, 2978]
	cmp	w6, w0
	cset	w0, ne
	cmp	w5, w4
	orr	w0, w1, w0
	cset	w1, ne
	orr	w0, w1, w0
	orr	w2, w2, w0
.L1745:
	ldr	w3, [x3, 3024]
	mov	w0, 19
	ldr	x1, .LC149
	cmp	w3, wzr
	cset	w19, eq
	orr	w19, w19, w2
	mov	w2, w19
	bl	dprint_vfmw
	mov	w0, w19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1743:
	cmp	w0, 1
	bne	.L1744
	ldr	w6, [x1, 560]
	ldr	w5, [x3, 1872]
	ldr	w0, [x3, 1876]
	ldr	w4, [x1, 564]
	cmp	w6, w5
	ccmp	w4, w0, 0, eq
	cset	w0, ne
	orr	w2, w2, w0
	b	.L1744
	.p2align 3
.L1746:
	mov	w7, 0
	b	.L1741
	.p2align 3
.L1753:
	ldr	w0, [x3, 3012]
	ldr	w5, [x1, 548]
	cmp	w5, w0
	cset	w0, ne
	orr	w2, w2, w0
	b	.L1742
	.size	MVC_IsNewPic, .-MVC_IsNewPic
	.align	3
.LC149:
	.xword	.LC148
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_ref_pic_list_reordering
	.type	mvc_ref_pic_list_reordering, %function
mvc_ref_pic_list_reordering:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 11116544
	mov	w21, 3
	bl	_mcount
	mov	w22, 1
	ldr	x0, [x19, 256]
	mov	w2, 5
	ldrb	w3, [x20, 2979]
	ldrb	w1, [x20, 2969]
	strb	wzr, [x20, 1916]
	cmp	w3, wzr
	strb	wzr, [x20, 1917]
	csel	w21, w21, w2, eq
	ldr	w0, [x0, 2896]
	cbz	w1, .L1756
	add	w0, w0, w2
	lsl	w22, w22, w0
	ldrb	w0, [x20, 2968]
	cmp	w0, 1
	bls	.L1809
.L1808:
	ldrb	w3, [x19, 10]
.L1775:
	cmp	w3, wzr
	csetm	w0, ne
.L1807:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1756:
	add	w0, w0, 4
	lsl	w22, w22, w0
	ldrb	w0, [x20, 2968]
	cmp	w0, 1
	bhi	.L1808
.L1809:
	ldr	x1, .LC151
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 1916]
	cbz	w0, .L1765
	ldr	w0, [x20, 3028]
	cmn	w0, #2
	beq	.L1791
	ldr	x23, .LC153
	mov	w28, 0
	ldr	x26, .LC163
	ldr	x25, .LC161
	ldr	x24, .LC157
	b	.L1772
	.p2align 3
.L1766:
	cmp	w0, 2
	beq	.L1810
	sub	w0, w0, #4
	cmp	w0, 1
	bls	.L1811
.L1769:
	ldr	w0, [x20, 3028]
	add	w28, w28, 1
	add	w0, w0, 2
	cmp	w0, w28
	bls	.L1812
.L1772:
	add	x27, x19, x28, uxtw 2
	mov	x1, x23
	add	x27, x27, 11116544
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w21, w0
	str	w0, [x27, 1920]
	ldrb	w3, [x19, 10]
	bcc	.L1762
	cbnz	w3, .L1762
	cmp	w0, 3
	beq	.L1765
	cmp	w0, 1
	bhi	.L1766
	mov	x1, x24
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x27, 2184]
	cmp	w22, w0
	ldrb	w3, [x19, 10]
	bls	.L1768
	cbz	w3, .L1769
.L1768:
	ldr	x1, .LC159
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1807
	.p2align 3
.L1765:
	ldrb	w0, [x20, 2968]
	cmp	w0, 1
	bne	.L1808
	ldr	x1, .LC167
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 1917]
	cbz	w0, .L1808
	ldr	w0, [x20, 3032]
	cmn	w0, #2
	beq	.L1808
	ldr	x23, .LC169
	mov	w27, 0
	ldr	x26, .LC179
	ldr	x25, .LC177
	ldr	x24, .LC173
	b	.L1788
	.p2align 3
.L1781:
	cmp	w0, 2
	beq	.L1813
	sub	w0, w0, #4
	cmp	w0, 1
	bls	.L1814
	ldr	w0, [x20, 3032]
	add	w0, w0, 2
	cmp	w27, w0
	beq	.L1789
.L1787:
	add	w27, w27, 1
	cmp	w27, w0
	bcs	.L1808
.L1788:
	add	x28, x19, x27, uxtw 2
	mov	x1, x23
	add	x28, x28, 11116544
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w21, w0
	str	w0, [x28, 2052]
	ldrb	w3, [x19, 10]
	bcc	.L1779
	cbnz	w3, .L1779
	cmp	w0, 3
	beq	.L1775
	cmp	w0, 1
	bhi	.L1781
	mov	x1, x24
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x28, 2316]
	cmp	w22, w0
	ldrb	w3, [x19, 10]
	bls	.L1783
	cbnz	w3, .L1783
.L1784:
	ldr	w0, [x20, 3032]
	add	w0, w0, 2
	cmp	w0, w27
	bne	.L1787
	ldr	w1, [x28, 2052]
	cmp	w1, 3
	beq	.L1787
.L1789:
	ldr	x1, .LC181
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1807
	.p2align 3
.L1810:
	mov	x1, x25
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x27, 2448]
	b	.L1769
	.p2align 3
.L1813:
	mov	x1, x25
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x28, 2576]
	b	.L1784
	.p2align 3
.L1811:
	mov	x1, x26
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x27, 2704]
	b	.L1769
	.p2align 3
.L1814:
	mov	x1, x26
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x28, 2836]
	b	.L1784
	.p2align 3
.L1762:
	ldr	x1, .LC155
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1807
	.p2align 3
.L1779:
	ldr	x1, .LC171
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1807
	.p2align 3
.L1812:
	bne	.L1765
.L1760:
	uxtw	x0, w28
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 10112]
	cmp	w0, 3
	beq	.L1765
	ldr	x1, .LC165
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1807
.L1783:
	ldr	x1, .LC175
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1807
.L1791:
	mov	w28, 0
	b	.L1760
	.size	mvc_ref_pic_list_reordering, .-mvc_ref_pic_list_reordering
	.align	3
.LC151:
	.xword	.LC150
	.align	3
.LC153:
	.xword	.LC152
	.align	3
.LC155:
	.xword	.LC154
	.align	3
.LC157:
	.xword	.LC156
	.align	3
.LC159:
	.xword	.LC158
	.align	3
.LC161:
	.xword	.LC160
	.align	3
.LC163:
	.xword	.LC162
	.align	3
.LC165:
	.xword	.LC164
	.align	3
.LC167:
	.xword	.LC166
	.align	3
.LC169:
	.xword	.LC168
	.align	3
.LC171:
	.xword	.LC170
	.align	3
.LC173:
	.xword	.LC172
	.align	3
.LC175:
	.xword	.LC174
	.align	3
.LC177:
	.xword	.LC176
	.align	3
.LC179:
	.xword	.LC178
	.align	3
.LC181:
	.xword	.LC180
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_pred_weight_table
	.type	mvc_pred_weight_table, %function
mvc_pred_weight_table:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x28, x0
	mov	x0, x30
	add	x20, x28, 11116544
	mov	w19, 1
	bl	_mcount
	mov	w24, 0
	ldp	x21, x2, [x28, 256]
	ldr	x1, .LC183
	mov	x0, x28
	str	x2, [x29, 104]
	bl	mvc_ue_v
	str	w0, [x20, 3036]
	lsl	w23, w19, w0
	ldr	w1, [x21, 748]
	cbnz	w1, .L1840
.L1816:
	cmp	w0, 7
	bhi	.L1819
	ldr	w0, [x20, 3040]
	cmp	w0, 7
	bhi	.L1819
	ldrb	w2, [x28, 10]
	cbnz	w2, .L1818
	ldr	x22, .LC189
	mov	w25, 0
	ldr	x27, .LC191
	b	.L1827
	.p2align 3
.L1822:
	str	w23, [x1, 3044]
	add	x0, x28, x19, lsl 2
	str	wzr, [x1, 3812]
	add	x0, x0, 11116544
	ldr	w1, [x21, 748]
	cbnz	w1, .L1841
.L1824:
	str	wzr, [x0, 3172]
	str	wzr, [x0, 3300]
	str	wzr, [x0, 3940]
	str	wzr, [x0, 4068]
.L1826:
	ldr	w0, [x20, 3028]
	add	w25, w25, 1
	cmp	w0, w25
	bcc	.L1842
.L1827:
	mov	x1, x22
	mov	x0, x28
	uxtw	x19, w25
	bl	mvc_u_1
	add	x1, x28, x19, lsl 2
	add	x1, x1, 11116544
	cbz	w0, .L1822
	mov	x1, x27
	mov	x0, x28
	bl	mvc_se_v
	add	x4, x28, x19, lsl 2
	ldr	x1, .LC193
	add	x26, x4, 11116544
	str	w0, [x26, 3044]
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x26, 3812]
	add	x0, x28, x19, lsl 2
	ldr	w1, [x21, 748]
	add	x0, x0, 11116544
	cbz	w1, .L1824
.L1841:
	ldr	x1, .LC195
	mov	x0, x28
	bl	mvc_u_1
	add	x1, x28, x19, lsl 2
	add	x1, x1, 11116544
	cbnz	w0, .L1843
	str	w24, [x1, 3172]
	add	w25, w25, 1
	str	w24, [x1, 3300]
	str	wzr, [x1, 3940]
	str	wzr, [x1, 4068]
	ldr	w0, [x20, 3028]
	cmp	w0, w25
	bcs	.L1827
.L1842:
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 44]
	cmp	w0, 1
	beq	.L1828
.L1829:
	ldrb	w0, [x28, 10]
	cmp	w0, wzr
	csetm	w0, ne
.L1821:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1843:
	ldr	x1, .LC197
	mov	x0, x28
	add	x19, x28, x19, lsl 2
	add	x19, x19, 11116544
	bl	mvc_se_v
	ldr	x1, .LC199
	str	w0, [x19, 3172]
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 3940]
	ldr	x1, .LC197
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 3300]
	ldr	x1, .LC199
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 4068]
	b	.L1826
	.p2align 3
.L1840:
	ldr	x1, .LC185
	mov	x0, x28
	bl	mvc_ue_v
	mov	w24, w0
	ldr	w0, [x20, 3036]
	str	w24, [x20, 3040]
	lsl	w24, w19, w24
	b	.L1816
	.p2align 3
.L1828:
	ldrb	w0, [x20, 2968]
	cmp	w0, 1
	bne	.L1829
	ldr	x22, .LC201
	mov	w25, 0
	ldr	x27, .LC203
	b	.L1835
	.p2align 3
.L1830:
	add	x0, x28, x19, lsl 2
	add	x1, x0, 11116544
	add	x0, x0, 11120640
	str	w23, [x1, 3428]
	str	wzr, [x0, 100]
	add	x0, x28, x19, lsl 2
	ldr	w1, [x21, 748]
	cbnz	w1, .L1844
.L1832:
	add	x1, x0, 11116544
	add	x0, x0, 11120640
	str	wzr, [x1, 3556]
	str	wzr, [x0, 228]
	str	wzr, [x1, 3684]
	str	wzr, [x0, 356]
.L1834:
	ldr	w0, [x20, 3032]
	add	w25, w25, 1
	cmp	w0, w25
	bcc	.L1829
.L1835:
	mov	x1, x22
	mov	x0, x28
	uxtw	x19, w25
	bl	mvc_u_1
	cbz	w0, .L1830
	mov	x1, x27
	mov	x0, x28
	add	x26, x28, x19, lsl 2
	bl	mvc_se_v
	add	x1, x26, 11116544
	str	w0, [x1, 3428]
	mov	x0, x28
	ldr	x1, .LC205
	bl	mvc_se_v
	add	x4, x26, 11120640
	str	w0, [x4, 100]
	add	x0, x28, x19, lsl 2
	ldr	w1, [x21, 748]
	cbz	w1, .L1832
.L1844:
	ldr	x1, .LC207
	mov	x0, x28
	bl	mvc_u_1
	cbnz	w0, .L1845
	add	x0, x28, x19, lsl 2
	add	x1, x0, 11116544
	add	x0, x0, 11120640
	str	w24, [x1, 3556]
	str	wzr, [x0, 228]
	str	w24, [x1, 3684]
	str	wzr, [x0, 356]
	b	.L1834
.L1819:
	ldrb	w2, [x28, 10]
.L1818:
	ldr	x1, .LC187
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1821
.L1845:
	add	x19, x28, x19, lsl 2
	ldr	x1, .LC209
	add	x0, x19, 11116544
	add	x19, x19, 11120640
	mov	x26, x0
	mov	x0, x28
	bl	mvc_se_v
	ldr	x1, .LC211
	str	w0, [x26, 3556]
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 228]
	ldr	x1, .LC209
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x26, 3684]
	ldr	x1, .LC211
	mov	x0, x28
	bl	mvc_se_v
	str	w0, [x19, 356]
	b	.L1834
	.size	mvc_pred_weight_table, .-mvc_pred_weight_table
	.align	3
.LC183:
	.xword	.LC182
	.align	3
.LC185:
	.xword	.LC184
	.align	3
.LC187:
	.xword	.LC186
	.align	3
.LC189:
	.xword	.LC188
	.align	3
.LC191:
	.xword	.LC190
	.align	3
.LC193:
	.xword	.LC192
	.align	3
.LC195:
	.xword	.LC194
	.align	3
.LC197:
	.xword	.LC196
	.align	3
.LC199:
	.xword	.LC198
	.align	3
.LC201:
	.xword	.LC200
	.align	3
.LC203:
	.xword	.LC202
	.align	3
.LC205:
	.xword	.LC204
	.align	3
.LC207:
	.xword	.LC206
	.align	3
.LC209:
	.xword	.LC208
	.align	3
.LC211:
	.xword	.LC210
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecMMCO
	.type	MVC_DecMMCO, %function
MVC_DecMMCO:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x26, x0
	mov	w19, w1
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L1847
	mov	w21, 100
	ldr	x20, .LC215
	ldr	x23, .LC217
	ldr	x25, .LC223
	ldr	x22, .LC221
	ldr	x24, .LC219
	b	.L1858
	.p2align 3
.L1859:
	cmp	w19, 2
	beq	.L1872
.L1860:
	cmp	w19, 6
	cset	w0, eq
	orr	w0, w27, w0
	cbnz	w0, .L1863
	cmp	w19, 4
	beq	.L1873
.L1864:
	cmp	w19, 6
	bhi	.L1856
	ldrb	w0, [x26, 10]
	cbnz	w0, .L1856
.L1874:
	cbz	w19, .L1866
.L1865:
	subs	w21, w21, #1
	beq	.L1867
.L1858:
	mov	x1, x20
	mov	x0, x26
	bl	mvc_ue_v
	cmp	w0, 3
	mov	w19, w0
	and	w0, w0, -3
	cset	w27, eq
	cmp	w0, 1
	bne	.L1859
	mov	x1, x23
	mov	x0, x26
	bl	mvc_ue_v
	cmp	w19, 2
	bne	.L1860
.L1872:
	mov	x1, x24
	mov	x0, x26
	bl	mvc_ue_v
	ldrb	w0, [x26, 10]
	cbz	w0, .L1874
	.p2align 2
.L1856:
	ldr	x1, .LC225
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L1850:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1863:
	mov	x1, x22
	mov	x0, x26
	bl	mvc_ue_v
	cmp	w19, 4
	bne	.L1864
.L1873:
	mov	x1, x25
	mov	x0, x26
	bl	mvc_ue_v
	ldrb	w0, [x26, 10]
	cbz	w0, .L1865
	b	.L1856
	.p2align 3
.L1847:
	ldr	x20, .LC215
	mov	w28, 0
	ldr	x22, .LC217
	ldr	x24, .LC219
	ldr	x21, .LC221
	ldr	x23, .LC223
	b	.L1849
	.p2align 3
.L1851:
	cmp	w1, 2
	beq	.L1875
.L1852:
	cmp	w1, 3
	ccmp	w1, 6, 4, ne
	beq	.L1876
.L1853:
	cmp	w1, 4
	beq	.L1877
.L1854:
	cmp	w1, 6
	bhi	.L1856
	ldrb	w0, [x26, 10]
	cbnz	w0, .L1856
	add	w28, w28, 1
	cbz	w1, .L1866
	cmp	w28, 100
	beq	.L1878
.L1849:
	mov	x1, x20
	mov	x0, x26
	ldrb	w25, [x26, 3]
	uxtw	x27, w28
	bl	mvc_ue_v
	mov	w1, w0
	lsl	x0, x25, 6
	lsl	x19, x27, 4
	sub	x0, x0, x25
	add	x19, x19, x27, lsl 2
	lsl	x0, x0, 2
	and	w2, w1, -3
	sub	x0, x0, x25
	cmp	w2, 1
	lsl	x0, x0, 1
	sub	x0, x0, x25
	add	x19, x19, x0, lsl 2
	add	x19, x26, x19
	add	x19, x19, 11120640
	str	w1, [x19, 580]
	bne	.L1851
	mov	x1, x22
	mov	x0, x26
	bl	mvc_ue_v
	str	w0, [x19, 584]
	ldr	w1, [x19, 580]
	cmp	w1, 2
	bne	.L1852
.L1875:
	mov	x1, x24
	mov	x0, x26
	bl	mvc_ue_v
	lsl	x1, x25, 6
	sub	x1, x1, x25
	lsl	x1, x1, 2
	sub	x1, x1, x25
	lsl	x1, x1, 1
	sub	x2, x1, x25
	lsl	x1, x27, 4
	add	x1, x1, x27, lsl 2
	add	x1, x1, x2, lsl 2
	add	x1, x26, x1
	add	x1, x1, 11120640
	str	w0, [x1, 588]
	ldr	w1, [x1, 580]
	cmp	w1, 3
	ccmp	w1, 6, 4, ne
	bne	.L1853
	.p2align 2
.L1876:
	mov	x1, x21
	mov	x0, x26
	bl	mvc_ue_v
	lsl	x1, x25, 6
	lsl	x2, x27, 4
	sub	x1, x1, x25
	add	x2, x2, x27, lsl 2
	lsl	x1, x1, 2
	sub	x1, x1, x25
	lsl	x1, x1, 1
	sub	x1, x1, x25
	add	x2, x2, x1, lsl 2
	add	x2, x26, x2
	add	x2, x2, 11120640
	ldr	w1, [x2, 580]
	str	w0, [x2, 592]
	cmp	w1, 4
	bne	.L1854
.L1877:
	mov	x1, x23
	mov	x0, x26
	bl	mvc_ue_v
	lsl	x1, x25, 6
	sub	x1, x1, x25
	lsl	x1, x1, 2
	sub	x1, x1, x25
	lsl	x1, x1, 1
	sub	x25, x1, x25
	lsl	x1, x27, 4
	add	x27, x1, x27, lsl 2
	add	x27, x27, x25, lsl 2
	add	x27, x26, x27
	add	x27, x27, 11120640
	ldr	w1, [x27, 580]
	str	w0, [x27, 596]
	b	.L1854
	.p2align 3
.L1866:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1878:
	ldr	x1, .LC213
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1850
.L1867:
	mov	w0, -1
	b	.L1850
	.size	MVC_DecMMCO, .-MVC_DecMMCO
	.align	3
.LC213:
	.xword	.LC212
	.align	3
.LC215:
	.xword	.LC214
	.align	3
.LC217:
	.xword	.LC216
	.align	3
.LC219:
	.xword	.LC218
	.align	3
.LC221:
	.xword	.LC220
	.align	3
.LC223:
	.xword	.LC222
	.align	3
.LC225:
	.xword	.LC224
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_dec_ref_pic_marking
	.type	mvc_dec_ref_pic_marking, %function
mvc_dec_ref_pic_marking:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x21, 11116544
	ldrb	w22, [x21, 3]
	ldrb	w0, [x1, 2973]
	cbz	w0, .L1880
	cmp	w22, wzr
	cset	w19, eq
	strb	w19, [x21, 3]
.L1889:
	ldrb	w0, [x1, 2971]
	cmp	w0, 5
	beq	.L1900
	ldr	x1, .LC233
	mov	x0, x21
	sxtw	x19, w19
	bl	mvc_u_1
	mov	w4, w0
	lsl	x3, x19, 6
	ldr	x1, .LC235
	sub	x3, x3, x19
	uxtb	w2, w0
	lsl	x3, x3, 2
	mov	w0, 16
	sub	x3, x3, x19
	lsl	x3, x3, 1
	sub	x19, x3, x19
	add	x19, x21, x19, lsl 2
	add	x19, x19, 11120640
	strb	w4, [x19, 579]
	bl	dprint_vfmw
	ldrb	w0, [x19, 579]
	cbnz	w0, .L1883
.L1887:
	mov	w20, 0
.L1897:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1880:
	sxtw	x20, w22
	mov	w19, w22
	lsl	x0, x20, 6
	sub	x0, x0, x20
	lsl	x0, x0, 2
	sub	x0, x0, x20
	lsl	x0, x0, 1
	sub	x20, x0, x20
	add	x20, x21, x20, lsl 2
	add	x20, x20, 11120640
	ldrb	w0, [x20, 576]
	cbz	w0, .L1889
	ldrb	w0, [x1, 2971]
	cmp	w0, 5
	beq	.L1901
	ldr	x1, .LC233
	mov	x0, x21
	ldrb	w19, [x20, 579]
	bl	mvc_u_1
	cmp	w19, w0
	bne	.L1902
	ldrb	w0, [x20, 579]
	cbz	w0, .L1887
	mov	w1, 0
	mov	x0, x21
	bl	MVC_DecMMCO
	mov	w20, w0
	b	.L1897
	.p2align 3
.L1883:
	mov	w1, 1
	mov	x0, x21
	bl	MVC_DecMMCO
	cmn	w0, #1
	mov	w20, w0
	beq	.L1903
	mov	w0, 1
	strb	w0, [x19, 576]
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1901:
	ldr	x1, .LC227
	mov	x0, x21
	ldrb	w19, [x20, 577]
	bl	mvc_u_1
	cmp	w19, w0
	bne	.L1904
	ldr	x1, .LC229
	mov	x0, x21
	ldrb	w19, [x20, 578]
	bl	mvc_u_1
	cmp	w19, w0
	beq	.L1887
	ldr	x1, .LC241
	mov	w0, 1
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1897
	.p2align 3
.L1900:
	ldr	x1, .LC227
	mov	x0, x21
	sxtw	x19, w19
	mov	w20, 0
	bl	mvc_u_1
	lsl	x2, x19, 6
	ldr	x1, .LC229
	sub	x2, x2, x19
	lsl	x2, x2, 2
	sub	x2, x2, x19
	lsl	x2, x2, 1
	sub	x19, x2, x19
	add	x19, x21, x19, lsl 2
	add	x19, x19, 11120640
	strb	w0, [x19, 577]
	mov	x0, x21
	bl	mvc_u_1
	strb	w0, [x19, 578]
	ldrb	w2, [x19, 577]
	mov	w0, 16
	ldr	x1, .LC231
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L1902:
	ldr	x1, .LC243
	mov	w0, 1
	mov	w20, -1
	bl	dprint_vfmw
	ldr	x1, .LC245
	mov	w0, 1
	ldr	w4, [x21, 68]
	ldr	w2, [x21, 88]
	ldr	w3, [x21, 100]
	bl	dprint_vfmw
	b	.L1897
.L1904:
	ldr	x1, .LC239
	mov	w0, 1
	mov	w20, -1
	bl	dprint_vfmw
	b	.L1897
.L1903:
	strb	wzr, [x19, 576]
	mov	w0, 1
	ldr	x1, .LC237
	strb	w22, [x21, 3]
	bl	dprint_vfmw
	b	.L1897
	.size	mvc_dec_ref_pic_marking, .-mvc_dec_ref_pic_marking
	.align	3
.LC227:
	.xword	.LC226
	.align	3
.LC229:
	.xword	.LC228
	.align	3
.LC231:
	.xword	.LC230
	.align	3
.LC233:
	.xword	.LC232
	.align	3
.LC235:
	.xword	.LC234
	.align	3
.LC237:
	.xword	.LC236
	.align	3
.LC239:
	.xword	.LC238
	.align	3
.LC241:
	.xword	.LC240
	.align	3
.LC243:
	.xword	.LC242
	.align	3
.LC245:
	.xword	.LC244
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessSliceHeaderFirstPart
	.type	MVC_ProcessSliceHeaderFirstPart, %function
MVC_ProcessSliceHeaderFirstPart:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC247
	mov	x0, x19
	bl	mvc_ue_v
	mov	w21, w0
	ldr	w0, [x19, 40]
	sub	w0, w0, #1
	cmp	w21, w0
	bhi	.L1906
	ldrb	w0, [x19, 10]
	cbnz	w0, .L1906
	mov	w1, w21
	mov	x0, x19
	bl	MVC_PPSSPSCheckTmpId
	cbnz	w0, .L1960
	add	x20, x19, 11116544
	mov	x0, x19
	str	w21, [x20, 2984]
	bl	MVC_PPSSPSCheck
	mov	w22, w0
	cbnz	w0, .L1961
	ldp	x21, x23, [x19, 256]
	ldr	x2, .LC255
	mov	x0, x19
	ldr	w1, [x21, 2896]
	add	w1, w1, 4
	bl	mvc_u_v
	str	w0, [x20, 2996]
	ldrb	w1, [x19, 10]
	cbnz	w1, .L1932
	ldrb	w1, [x20, 2971]
	cmp	w1, 5
	ccmp	w0, wzr, 4, eq
	bne	.L1962
.L1912:
	strb	wzr, [x20, 2969]
	strb	wzr, [x20, 2970]
	ldrb	w0, [x21, 20]
	cbz	w0, .L1963
	ldr	w1, [x21, 3952]
	ldr	w2, [x21, 3948]
	add	w0, w1, 1
	madd	w0, w2, w0, w0
.L1935:
	ldrb	w1, [x21, 21]
	cbnz	w1, .L1918
	strb	wzr, [x20, 2972]
.L1920:
	ldr	w1, [x20, 3024]
	cmp	w1, w0
	bcs	.L1964
.L1921:
	ldrb	w0, [x20, 2971]
	cmp	w0, 5
	beq	.L1965
.L1923:
	str	wzr, [x20, 1836]
	str	wzr, [x20, 1840]
	ldr	w0, [x21, 2900]
	cbz	w0, .L1966
.L1927:
	str	wzr, [x20, 1872]
	str	wzr, [x20, 1876]
	ldr	w0, [x21, 2900]
	cmp	w0, 1
	beq	.L1967
.L1930:
	ldrb	w0, [x19, 10]
	cbnz	w0, .L1932
	ldrb	w0, [x23, 17]
	cbz	w0, .L1933
	ldr	x1, .LC279
	mov	x0, x19
	bl	mvc_ue_v
	cbnz	w0, .L1934
	ldrb	w0, [x19, 10]
	cbz	w0, .L1933
.L1934:
	ldr	x1, .LC281
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC282
	ldr	x4, [x0]
	cbz	x4, .L1932
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	mov	w22, -1
	blr	x4
.L1944:
	mov	w0, w22
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1963:
	ldr	x1, .LC259
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 2969]
	cbnz	w0, .L1968
	ldr	w2, [x21, 3952]
	ldr	w1, [x21, 3948]
	add	w0, w2, 1
	ldrb	w3, [x21, 20]
	madd	w1, w1, w0, w0
	lsl	w0, w1, 1
	cbz	w3, .L1935
.L1915:
	ldrb	w2, [x20, 2969]
	mov	w0, 1
	b	.L1916
	.p2align 3
.L1918:
	mov	w1, 1
	strb	w1, [x20, 2972]
.L1937:
	ldr	w1, [x20, 3024]
	cmp	w1, w0, lsr 1
	bcc	.L1921
	ldr	x1, .LC263
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1944
	.p2align 3
.L1968:
	ldr	x1, .LC261
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 2970]
	ldr	w0, [x21, 3952]
	ldr	w1, [x21, 3948]
	ldrb	w2, [x21, 20]
	add	w0, w0, 1
	madd	w1, w1, w0, w0
	cbnz	w2, .L1915
	ldrb	w2, [x20, 2969]
	mov	w0, 2
.L1916:
	mul	w0, w0, w1
	cbz	w2, .L1935
	strb	wzr, [x20, 2972]
	cmp	w2, 1
	bne	.L1920
	b	.L1937
	.p2align 3
.L1933:
	mov	x0, x19
	bl	MVC_IsNewPic
	uxtb	w0, w0
	strb	w0, [x20, 2973]
	cbnz	w0, .L1944
	add	x19, x19, 11120640
	ldr	w1, [x20, 3024]
	ldr	w0, [x19, 568]
	cmp	w1, w0
	bhi	.L1944
	ldr	x1, .LC284
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1944
	.p2align 3
.L1966:
	ldr	w1, [x21, 2904]
	mov	x0, x19
	ldr	x2, .LC271
	add	w1, w1, 4
	bl	mvc_u_v
	str	w0, [x20, 1836]
	ldrb	w0, [x23, 1]
	cbz	w0, .L1927
	ldrb	w0, [x20, 2969]
	cbnz	w0, .L1927
	ldr	x1, .LC273
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 1840]
	b	.L1927
	.p2align 3
.L1967:
	ldrb	w0, [x21, 18]
	cbnz	w0, .L1930
	ldr	x1, .LC275
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 1872]
	ldrb	w0, [x23, 1]
	cmp	w0, 1
	bne	.L1930
	ldrb	w0, [x20, 2969]
	cbnz	w0, .L1930
	ldr	x1, .LC277
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 1876]
	b	.L1930
	.p2align 3
.L1932:
	mov	w22, -1
	ldr	x23, [sp, 48]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1906:
	ldr	x1, .LC249
	mov	w2, w21
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1965:
	ldr	x1, .LC267
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3012]
	mov	w1, 65535
	cmp	w0, w1
	bhi	.L1924
	ldrb	w0, [x19, 10]
	cbz	w0, .L1923
.L1924:
	ldr	x1, .LC269
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1923
	.p2align 3
.L1960:
	ldr	x1, .LC251
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1944
	.p2align 3
.L1961:
	ldr	x1, .LC253
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1944
	.p2align 3
.L1962:
	add	x0, x19, 11120640
	ldr	w0, [x0, 512]
	cmp	w0, wzr
	bgt	.L1912
	ldr	x1, .LC257
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1912
.L1964:
	ldr	x1, .LC265
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1944
	.size	MVC_ProcessSliceHeaderFirstPart, .-MVC_ProcessSliceHeaderFirstPart
	.align	3
.LC247:
	.xword	.LC246
	.align	3
.LC249:
	.xword	.LC248
	.align	3
.LC251:
	.xword	.LC250
	.align	3
.LC253:
	.xword	.LC252
	.align	3
.LC255:
	.xword	.LC254
	.align	3
.LC257:
	.xword	.LC256
	.align	3
.LC259:
	.xword	.LC258
	.align	3
.LC261:
	.xword	.LC260
	.align	3
.LC263:
	.xword	.LC262
	.align	3
.LC265:
	.xword	.LC264
	.align	3
.LC267:
	.xword	.LC266
	.align	3
.LC269:
	.xword	.LC268
	.align	3
.LC271:
	.xword	.LC270
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
.LC279:
	.xword	.LC278
	.align	3
.LC281:
	.xword	.LC280
	.align	3
.LC282:
	.xword	g_event_report
	.align	3
.LC284:
	.xword	.LC283
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessSliceHeaderSecondPart
	.type	MVC_ProcessSliceHeaderSecondPart, %function
MVC_ProcessSliceHeaderSecondPart:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11116544
	bl	_mcount
	ldr	w0, [x20, 40]
	ldr	w2, [x19, 2984]
	sub	w0, w0, #1
	ldr	x21, [x20, 264]
	cmp	w0, w2
	bcc	.L1970
	ldrb	w22, [x20, 10]
	cbnz	w22, .L1970
	mov	x0, x20
	bl	MVC_PPSSPSCheck
	cbnz	w0, .L2052
	ldrb	w1, [x19, 2968]
	cmp	w1, 1
	beq	.L2053
	ldr	w0, [x21, 36]
	cmp	w1, 1
	str	w0, [x19, 3028]
	ldr	w0, [x21, 40]
	str	w0, [x19, 3032]
	bls	.L2054
.L1975:
	cmp	w1, 2
	beq	.L2001
.L1985:
	mov	w0, 32
	str	w0, [x19, 3032]
.L1986:
	mov	x0, x20
	bl	mvc_ref_pic_list_reordering
	mov	w23, w0
	cbnz	w0, .L2055
	ldrb	w0, [x21, 2]
	cbz	w0, .L1988
	ldrb	w0, [x19, 2968]
	cbnz	w0, .L1988
	mov	w22, 1
	mov	w2, w22
.L1989:
	ldr	x1, .LC302
	mov	w0, 19
	strb	w22, [x19, 2975]
	bl	dprint_vfmw
	str	wzr, [x19, 3036]
	ldrb	w0, [x19, 2975]
	str	wzr, [x19, 3040]
	cbnz	w0, .L2056
.L1990:
	ldrb	w0, [x19, 2976]
	cbnz	w0, .L2057
.L1991:
	add	x22, x20, 11120640
	str	wzr, [x22, 484]
	ldrb	w0, [x21]
	cbz	w0, .L1992
	ldrb	w0, [x19, 2968]
	cmp	w0, 1
	bls	.L2058
.L1992:
	ldr	x1, .LC312
	mov	x0, x20
	bl	mvc_se_v
	add	x1, x22, 256
	stp	w0, wzr, [x1, 232]
	stp	wzr, wzr, [x1, 240]
	ldrb	w0, [x21, 3]
	cbnz	w0, .L2059
.L2021:
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1988:
	ldr	w0, [x21, 44]
	mov	w2, 0
	cmp	w0, 1
	bne	.L1989
	ldrb	w0, [x19, 2968]
	cmp	w0, 1
	bne	.L1989
	mov	w22, w0
	mov	w2, w0
	b	.L1989
	.p2align 3
.L2059:
	ldr	x1, .LC314
	mov	x0, x20
	bl	mvc_ue_v
	cmp	w0, 2
	str	w0, [x22, 492]
	bhi	.L1995
	ldrb	w1, [x20, 10]
	cbnz	w1, .L1995
	cmp	w0, 1
	beq	.L2021
	ldr	x1, .LC318
	mov	x0, x20
	bl	mvc_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x22, 496]
	bhi	.L1998
	ldrb	w0, [x20, 10]
	cbnz	w0, .L1998
	ldr	x1, .LC322
	mov	x0, x20
	bl	mvc_se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x22, 500]
	bhi	.L2000
	ldrb	w0, [x20, 10]
	cbz	w0, .L2021
.L2000:
	ldr	x1, .LC324
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2021
	.p2align 3
.L2056:
	mov	x0, x20
	bl	mvc_pred_weight_table
	cbz	w0, .L1990
	ldr	x1, .LC304
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2021
	.p2align 3
.L2057:
	mov	x0, x20
	bl	mvc_dec_ref_pic_marking
	cbz	w0, .L1991
	ldr	x1, .LC306
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2021
	.p2align 3
.L2001:
	mov	w0, 32
	str	w0, [x19, 3028]
	b	.L1985
	.p2align 3
.L2053:
	ldr	x1, .LC288
	mov	x0, x20
	bl	mvc_u_1
	strb	w0, [x19, 2974]
	ldrb	w1, [x19, 2968]
	ldr	w0, [x21, 36]
	str	w0, [x19, 3028]
	cmp	w1, 1
	ldr	w0, [x21, 40]
	str	w0, [x19, 3032]
	bhi	.L1975
	.p2align 2
.L2054:
	ldr	x1, .LC290
	mov	x0, x20
	bl	mvc_u_1
	cbnz	w0, .L1976
	ldr	w1, [x19, 3028]
.L1977:
	ldrb	w0, [x19, 2969]
	cbnz	w0, .L1978
	cmp	w1, 15
	bhi	.L1979
	ldr	w0, [x19, 3032]
	cmp	w0, 15
	bhi	.L2060
.L1980:
	ldrb	w0, [x20, 10]
	cbnz	w0, .L1979
.L1981:
	ldrb	w0, [x19, 2968]
	cmp	w0, 2
	beq	.L2001
	cmp	w0, 1
	beq	.L1986
	b	.L1985
	.p2align 3
.L1970:
	ldr	x1, .LC285
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2058:
	ldr	x1, .LC308
	mov	x0, x20
	bl	mvc_ue_v
	cmp	w0, 2
	str	w0, [x22, 484]
	bhi	.L1993
	ldrb	w0, [x20, 10]
	cbz	w0, .L1992
.L1993:
	ldr	x1, .LC310
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2021
	.p2align 3
.L1978:
	cmp	w1, 31
	bhi	.L1982
	ldr	w0, [x19, 3032]
	cmp	w0, 31
	bls	.L1983
	ldrb	w0, [x19, 2968]
	cmp	w0, 1
	bne	.L1983
.L1982:
	ldr	x1, .LC298
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2021
	.p2align 3
.L1983:
	ldrb	w0, [x20, 10]
	cbz	w0, .L1981
	b	.L1982
	.p2align 3
.L2060:
	ldrb	w0, [x19, 2968]
	cmp	w0, 1
	bne	.L1980
.L1979:
	ldr	x1, .LC296
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2021
	.p2align 3
.L1976:
	ldr	x1, .LC292
	mov	x0, x20
	bl	mvc_ue_v
	mov	w1, w0
	ldrb	w0, [x19, 2968]
	str	w1, [x19, 3028]
	cmp	w0, 1
	bne	.L1977
	ldr	x1, .LC294
	mov	x0, x20
	bl	mvc_ue_v
	str	w0, [x19, 3032]
	ldr	w1, [x19, 3028]
	b	.L1977
	.p2align 3
.L1998:
	ldr	x1, .LC320
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2021
	.p2align 3
.L1995:
	ldr	x1, .LC316
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2021
	.p2align 3
.L2052:
	ldr	x1, .LC286
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2021
	.p2align 3
.L2055:
	ldr	x1, .LC300
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L2021
	.size	MVC_ProcessSliceHeaderSecondPart, .-MVC_ProcessSliceHeaderSecondPart
	.align	3
.LC285:
	.xword	.LC248
	.align	3
.LC286:
	.xword	.LC250
	.align	3
.LC288:
	.xword	.LC287
	.align	3
.LC290:
	.xword	.LC289
	.align	3
.LC292:
	.xword	.LC291
	.align	3
.LC294:
	.xword	.LC293
	.align	3
.LC296:
	.xword	.LC295
	.align	3
.LC298:
	.xword	.LC297
	.align	3
.LC300:
	.xword	.LC299
	.align	3
.LC302:
	.xword	.LC301
	.align	3
.LC304:
	.xword	.LC303
	.align	3
.LC306:
	.xword	.LC305
	.align	3
.LC308:
	.xword	.LC307
	.align	3
.LC310:
	.xword	.LC309
	.align	3
.LC312:
	.xword	.LC311
	.align	3
.LC314:
	.xword	.LC313
	.align	3
.LC316:
	.xword	.LC315
	.align	3
.LC318:
	.xword	.LC317
	.align	3
.LC320:
	.xword	.LC319
	.align	3
.LC322:
	.xword	.LC321
	.align	3
.LC324:
	.xword	.LC323
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ExitSlice
	.type	MVC_ExitSlice, %function
MVC_ExitSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11116544
	add	x0, x19, 11120640
	ldr	x3, [x19, 248]
	ldr	w2, [x1, 2984]
	str	w2, [x0, 540]
	ldr	w2, [x3, 744]
	str	w2, [x0, 536]
	ldr	w2, [x1, 3024]
	str	w2, [x0, 568]
	ldr	w2, [x1, 2996]
	str	w2, [x0, 544]
	ldrb	w2, [x1, 2969]
	strb	w2, [x0, 528]
	cbz	w2, .L2062
	ldrb	w2, [x1, 2970]
	strb	w2, [x0, 529]
.L2062:
	ldrb	w2, [x1, 2976]
	strb	w2, [x0, 531]
	ldrb	w2, [x1, 2971]
	strb	w2, [x0, 530]
	cmp	w2, 5
	beq	.L2070
.L2063:
	ldr	w2, [x3, 2900]
	cbnz	w2, .L2064
	ldr	w2, [x1, 1836]
	str	w2, [x0, 552]
	ldr	w2, [x1, 1840]
	str	w2, [x0, 556]
	ldr	w2, [x3, 2900]
.L2064:
	cmp	w2, 1
	beq	.L2071
.L2065:
	ldrb	w2, [x1, 2979]
	cmp	w2, 1
	bne	.L2066
	ldr	w2, [x0, 512]
	str	w2, [x0, 572]
	ldrb	w2, [x1, 2977]
	strb	w2, [x0, 532]
	ldrb	w1, [x1, 2978]
	strb	w1, [x0, 533]
.L2066:
	ldr	w0, [x19, 80]
	add	w0, w0, 1
	str	w0, [x19, 80]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2071:
	ldr	w2, [x1, 1872]
	str	w2, [x0, 560]
	ldr	w2, [x1, 1876]
	str	w2, [x0, 564]
	b	.L2065
	.p2align 3
.L2070:
	ldr	w2, [x1, 3012]
	str	w2, [x0, 548]
	b	.L2063
	.size	MVC_ExitSlice, .-MVC_ExitSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_PicTypeStatistic
	.type	MVC_PicTypeStatistic, %function
MVC_PicTypeStatistic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 11116544
	ldrb	w0, [x1, 2968]
	cmp	w0, 1
	beq	.L2074
	cbz	w0, .L2075
	cmp	w0, 2
	bne	.L2072
	ldrb	w0, [x1, 2971]
	add	x19, x19, 11157504
	cmp	w0, 5
	beq	.L2082
.L2077:
	strb	wzr, [x19, 3733]
.L2072:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2075:
	add	x19, x19, 11157504
	ldrb	w0, [x19, 3732]
	cmp	w0, 2
	beq	.L2077
	mov	w0, 1
	strb	wzr, [x19, 3733]
	strb	w0, [x19, 3732]
	b	.L2072
	.p2align 3
.L2074:
	add	x19, x19, 11157504
	mov	w0, 2
	strb	wzr, [x19, 3733]
	strb	w0, [x19, 3732]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2082:
	mov	w0, 1
	strb	w0, [x19, 3733]
	b	.L2072
	.size	MVC_PicTypeStatistic, .-MVC_PicTypeStatistic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_CalcStreamBits
	.type	MVC_CalcStreamBits, %function
MVC_CalcStreamBits:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 11112448
	ldrb	w0, [x0, 3688]
	cbz	w0, .L2084
	ldr	x1, [x19, 240]
	ldr	w0, [x1, 72]
	add	w0, w0, 7
	and	w0, w0, -8
	str	w0, [x1, 72]
	ldr	x1, [x19, 240]
	ldr	w0, [x1, 80]
	sub	w0, w0, #1
	str	w0, [x1, 80]
.L2084:
	ldr	x3, [x19, 240]
	ldrb	w21, [x3]
	cbz	w21, .L2095
	sub	w1, w21, #1
	mov	w4, 32
	mov	x2, 48
	add	x0, x3, 16
	mov	w20, 0
	umaddl	x2, w1, w4, x2
	add	x2, x3, x2
	.p2align 2
.L2086:
	ldr	w1, [x0], 32
	cmp	x0, x2
	add	w20, w20, w1
	bne	.L2086
.L2085:
	sbfiz	x4, x21, 5, 32
	ldr	w2, [x3, 72]
	add	x4, x3, x4
	ldr	w5, [x3, 80]
	ldr	x1, .LC326
	mov	w3, w20
	mov	w0, 7
	ldr	w4, [x4, 16]
	bl	dprint_vfmw
	ldr	x2, [x19, 240]
	ubfiz	x3, x21, 5, 8
	ldrb	w0, [x2]
	ldr	w1, [x2, 72]
	add	x0, x2, x0, lsl 5
	and	w1, w1, 7
	str	w1, [x0, 28]
	ldr	x2, [x19, 240]
	ldrb	w1, [x2]
	ldr	w0, [x2, 72]
	add	x1, x2, x1, lsl 5
	ldr	w2, [x1, 20]
	add	w0, w2, w0, lsr 3
	mov	w2, w21
	sub	w0, w0, w20
	str	w0, [x1, 32]
	ldr	x4, [x19, 240]
	ldrb	w1, [x4]
	ldr	w0, [x4, 72]
	add	x4, x4, x1, lsl 5
	ldr	w1, [x4, 16]
	add	w20, w20, w1
	lsl	w20, w20, 3
	sub	w0, w20, w0
	str	w0, [x4, 24]
	ldr	x1, [x19, 240]
	ldrb	w0, [x1]
	add	x0, x1, x0, lsl 5
	ldp	w4, w1, [x0, 28]
	ubfiz	w1, w1, 3, 2
	add	w1, w1, w4
	str	w1, [x0, 28]
	ldr	x1, .LC328
	ldr	x4, [x19, 240]
	ldrb	w0, [x4]
	add	x4, x4, x0, lsl 5
	mov	w0, 7
	ldr	w5, [x4, 32]
	and	w5, w5, -4
	str	w5, [x4, 32]
	ldr	x6, [x19, 240]
	add	x3, x6, x3
	ldrb	w5, [x6]
	ldp	w4, w3, [x3, 24]
	add	x5, x6, x5, lsl 5
	ldr	w5, [x5, 32]
	bl	dprint_vfmw
	ldr	x0, [x19, 240]
	ldr	w2, [x0, 76]
	sub	w1, w2, #1
	cmp	w1, 1
	bhi	.L2106
	ldrb	w20, [x0]
	add	w3, w20, 1
	cmp	w3, 1
	ccmp	w2, w3, 0, ls
	bls	.L2089
	ldr	x21, .LC332
	add	w20, w20, 2
	.p2align 2
.L2090:
	sub	w2, w20, #1
	mov	x1, x21
	ubfiz	x3, x2, 5, 32
	add	x4, x0, x3
	mov	w0, 7
	str	wzr, [x4, 28]
	ldr	x4, [x19, 240]
	add	x4, x4, x3
	ldr	w5, [x4, 20]
	str	w5, [x4, 32]
	ldr	x4, [x19, 240]
	add	x4, x4, x3
	ldr	w5, [x4, 16]
	lsl	w5, w5, 3
	str	w5, [x4, 24]
	ldr	x4, [x19, 240]
	add	x4, x4, x3
	ldp	w6, w5, [x4, 28]
	ubfiz	w5, w5, 3, 2
	add	w5, w5, w6
	str	w5, [x4, 28]
	ldr	x4, [x19, 240]
	add	x4, x4, x3
	ldr	w5, [x4, 32]
	and	w5, w5, -4
	str	w5, [x4, 32]
	ldr	x4, [x19, 240]
	add	x3, x4, x3
	ldp	w4, w3, [x3, 24]
	bl	dprint_vfmw
	ldr	x0, [x19, 240]
	cmp	w20, 1
	cset	w3, ls
	ldr	w1, [x0, 76]
	cmp	w1, w20
	add	w20, w20, 1
	cset	w2, hi
	tst	w3, w2
	bne	.L2090
	sub	w1, w1, #1
.L2089:
	ubfiz	x1, x1, 5, 32
	ldr	w2, [x0, 80]
	add	x0, x0, x1
	add	x5, x19, 11161600
	ldr	w1, [x0, 24]
	sub	w1, w1, w2
	str	w1, [x0, 24]
	ldr	x3, [x19, 240]
	ldrb	w0, [x3]
	ldr	w4, [x3, 76]
	cmp	w0, w4
	bcs	.L2083
	.p2align 2
.L2100:
	ubfiz	x1, x0, 5, 32
	ldr	w2, [x5, 384]
	add	x1, x3, x1
	add	w0, w0, 1
	ldr	w1, [x1, 32]
	cmp	w1, w2
	bcs	.L2092
	str	w1, [x5, 384]
	ldr	w4, [x3, 76]
.L2092:
	cmp	w4, w0
	bhi	.L2100
.L2083:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2106:
	ldr	x1, .LC330
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L2095:
	mov	w20, 0
	b	.L2085
	.size	MVC_CalcStreamBits, .-MVC_CalcStreamBits
	.align	3
.LC326:
	.xword	.LC325
	.align	3
.LC328:
	.xword	.LC327
	.align	3
.LC330:
	.xword	.LC329
	.align	3
.LC332:
	.xword	.LC331
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_Scaling_List
	.type	MVC_Scaling_List, %function
MVC_Scaling_List:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x0, [x29, 104]
	mov	x0, x30
	mov	w27, w3
	mov	x28, x1
	mov	x25, x2
	mov	x22, x4
	bl	_mcount
	cmp	w27, wzr
	ble	.L2107
	sub	w26, w27, #1
	mov	w0, 8
	ldr	x21, .LC333
	add	x26, x26, 1
	mov	x20, 0
	mov	w24, w0
	mov	w23, 255
	b	.L2112
	.p2align 3
.L2111:
	lsr	w6, w19, 2
	str	w24, [x28, w19, uxtw 2]
	ubfiz	w1, w19, 3, 2
	and	w4, w24, 255
	lsl	w5, w23, w1
	lsl	w4, w4, w1
	ldr	w1, [x25, w6, sxtw 2]
	cmp	x26, x20
	bic	w1, w1, w5
	orr	w1, w1, w4
	str	w1, [x25, w6, sxtw 2]
	beq	.L2107
.L2112:
	cmp	w27, 16
	add	x1, x21, 16
	beq	.L2120
	ldrb	w19, [x20, x1]
.L2110:
	add	x20, x20, 1
	cbz	w0, .L2111
	ldr	x1, .LC335
	ldr	x0, [x29, 104]
	bl	mvc_se_v
	add	w0, w0, w24
	and	w0, w0, 255
	cmp	w19, wzr
	ccmp	w0, wzr, 0, eq
	cset	w1, eq
	cmp	w0, wzr
	csel	w24, w24, w0, eq
	str	w1, [x22]
	b	.L2111
	.p2align 3
.L2120:
	ldrb	w19, [x21, x20]
	b	.L2110
	.p2align 3
.L2107:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.size	MVC_Scaling_List, .-MVC_Scaling_List
	.align	3
.LC333:
	.xword	.LANCHOR0
	.align	3
.LC335:
	.xword	.LC334
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessPPS
	.type	MVC_ProcessPPS, %function
MVC_ProcessPPS:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, .LC339
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2170
	ldr	x1, .LC341
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 1]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2170
	ldr	x1, .LC343
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 32]
	cbnz	w0, .L2125
	ldrb	w0, [x19, 10]
	cbz	w0, .L2126
.L2125:
	ldr	x1, .LC345
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC346
	ldr	x4, [x0]
	cbz	x4, .L2170
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, -1
.L2123:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2126:
	ldr	x1, .LC348
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 31
	str	w0, [x20, 36]
	bhi	.L2127
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2127
	ldr	x1, .LC352
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 31
	str	w0, [x20, 40]
	bhi	.L2129
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2129
	ldr	x1, .LC356
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 2]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2170
	ldr	x2, .LC358
	mov	w1, 2
	mov	x0, x19
	bl	mvc_u_v
	cmp	w0, 2
	str	w0, [x20, 44]
	bhi	.L2171
	ldr	x1, .LC362
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 48]
	ldr	x1, .LC364
	mov	x0, x19
	bl	mvc_se_v
	ldr	x1, .LC366
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 52]
	ldr	x1, .LC368
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 3]
	ldr	x1, .LC370
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 4]
	ldr	x1, .LC372
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 17]
	cbnz	w0, .L2172
.L2132:
	ldr	w0, [x20, 52]
	stp	w0, wzr, [x20, 56]
	strb	wzr, [x20, 18]
	add	x0, x19, 872
	bl	BsResidBits
	ldr	x1, [x19, 240]
	ldr	w1, [x1, 80]
	add	w1, w1, 3
	cmp	w0, w1
	bcc	.L2153
	ldr	x1, .LC376
	mov	x0, x19
	bl	mvc_u_1
	str	w0, [x20, 60]
	ldr	x1, .LC378
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 18]
	beq	.L2134
.L2152:
	ldr	x1, .LC380
	mov	x0, x19
	bl	mvc_se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x20, 56]
	bhi	.L2135
	ldrb	w0, [x19, 10]
	cbz	w0, .L2153
.L2135:
	ldr	x1, .LC387
	mov	w0, 1
	bl	dprint_vfmw
.L2170:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2153:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2172:
	ldr	x1, .LC374
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2132
	.p2align 3
.L2127:
	ldr	x1, .LC350
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2123
	.p2align 3
.L2129:
	ldr	x1, .LC354
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2123
	.p2align 3
.L2134:
	ldr	x27, .LC383
	add	x21, x29, 120
	ldr	x25, .LC382
	add	x23, x20, 5
	add	x22, x20, 2016
	add	x24, x20, 64
	mov	w26, 0
	mov	x28, x27
	b	.L2143
	.p2align 3
.L2176:
	ldr	w0, [x20, 28]
	mov	x2, 16
	umull	x0, w0, w3
	ldr	x3, [x19, 272]
	add	x3, x3, x0
	ldr	x0, .LC337
	add	x1, x0, 16
	mov	x0, x22
	ldrb	w4, [x3, 27]
	cmp	w4, 1
	beq	.L2173
	ldr	x4, .LC337
	cmp	w26, wzr
	ldr	x3, [x28, 104]
	csel	x1, x1, x4, ne
	blr	x3
.L2138:
	add	w26, w26, 1
	add	x21, x21, 4
	cmp	w26, 6
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	beq	.L2174
.L2143:
	mov	x1, x25
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x23]
	cmp	w0, 1
	str	w0, [x21]
	mov	w3, 3992
	beq	.L2175
	cmp	w26, wzr
	ccmp	w26, 3, 4, ne
	beq	.L2176
	sub	w1, w26, #1
	ldr	x3, [x27, 104]
	add	x1, x1, 126
	mov	x0, x22
	mov	x2, 16
	add	x1, x20, x1, lsl 4
	blr	x3
	b	.L2138
	.p2align 3
.L2174:
	ldr	x21, .LC383
	add	x26, x20, 2112
	ldr	x23, .LC337
	add	x28, x20, 448
	mov	x27, 0
	add	x22, x29, 112
	mov	w24, 3992
	mov	x25, x21
.L2151:
	ldr	w0, [x20, 60]
	mov	w8, w27
	cmp	w0, 1
	beq	.L2177
	add	x0, x20, x27
	str	wzr, [x22, x27, lsl 2]
	strb	wzr, [x0, 11]
.L2146:
	ldr	w0, [x20, 28]
	ldr	x1, [x19, 272]
	umull	x0, w0, w24
	add	x0, x1, x0
	ldrb	w1, [x0, 27]
	cmp	w1, 1
	beq	.L2178
	add	x1, x23, 96
	ldr	x3, [x21, 104]
	cbz	w8, .L2179
.L2150:
	mov	x2, 64
	mov	x0, x26
	blr	x3
.L2147:
	add	x27, x27, 1
	add	x26, x26, 64
	cmp	x27, 2
	add	x28, x28, 256
	bne	.L2151
	b	.L2152
	.p2align 3
.L2175:
	mov	x0, x19
	mov	x4, x21
	mov	x2, x22
	mov	x1, x24
	mov	w3, 16
	bl	MVC_Scaling_List
	ldr	w0, [x21]
	cmp	w0, 1
	bne	.L2138
	ldr	x0, .LC337
	cmp	w26, 2
	mov	x2, 16
	add	x1, x0, 16
	csel	x1, x0, x1, ls
	ldr	x0, .LC383
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	b	.L2138
.L2173:
	uxtw	x1, w26
	ldr	x0, .LC383
	add	x1, x1, 167
	add	x1, x3, x1, lsl 4
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	b	.L2138
.L2171:
	ldr	x1, .LC360
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2123
.L2177:
	ldr	x1, .LC385
	mov	x0, x19
	str	w27, [x29, 108]
	bl	mvc_u_1
	cmp	w0, 1
	add	x1, x20, x27
	str	w0, [x22, x27, lsl 2]
	ldr	w8, [x29, 108]
	strb	w0, [x1, 11]
	bne	.L2146
	mov	x0, x19
	add	x4, x22, x27, lsl 2
	mov	w3, 64
	mov	x2, x26
	mov	x1, x28
	str	w8, [x29, 108]
	bl	MVC_Scaling_List
	ldr	w0, [x22, x27, lsl 2]
	ldr	w8, [x29, 108]
	cmp	w0, 1
	bne	.L2147
	ldr	x0, .LC383
	ldr	x3, [x0, 104]
	ldr	x0, .LC337
	add	x1, x0, 96
	cbnz	w8, .L2150
	add	x1, x0, 32
	b	.L2150
	.p2align 3
.L2178:
	ubfiz	x1, x8, 6, 32
	ldr	x3, [x25, 104]
	add	x1, x1, 2768
	mov	x2, 64
	add	x1, x0, x1
	mov	x0, x26
	blr	x3
	b	.L2147
.L2179:
	ldr	x1, .LC337
	add	x1, x1, 32
	b	.L2150
	.size	MVC_ProcessPPS, .-MVC_ProcessPPS
	.align	3
.LC337:
	.xword	.LANCHOR1
	.align	3
.LC339:
	.xword	.LC338
	.align	3
.LC341:
	.xword	.LC340
	.align	3
.LC343:
	.xword	.LC342
	.align	3
.LC345:
	.xword	.LC344
	.align	3
.LC346:
	.xword	g_event_report
	.align	3
.LC348:
	.xword	.LC347
	.align	3
.LC350:
	.xword	.LC349
	.align	3
.LC352:
	.xword	.LC351
	.align	3
.LC354:
	.xword	.LC353
	.align	3
.LC356:
	.xword	.LC355
	.align	3
.LC358:
	.xword	.LC357
	.align	3
.LC360:
	.xword	.LC359
	.align	3
.LC362:
	.xword	.LC361
	.align	3
.LC364:
	.xword	.LC363
	.align	3
.LC366:
	.xword	.LC365
	.align	3
.LC368:
	.xword	.LC367
	.align	3
.LC370:
	.xword	.LC369
	.align	3
.LC372:
	.xword	.LC371
	.align	3
.LC374:
	.xword	.LC373
	.align	3
.LC376:
	.xword	.LC375
	.align	3
.LC378:
	.xword	.LC377
	.align	3
.LC380:
	.xword	.LC379
	.align	3
.LC382:
	.xword	.LC381
	.align	3
.LC383:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC385:
	.xword	.LC384
	.align	3
.LC387:
	.xword	.LC386
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_PPSEqual
	.type	MVC_PPSEqual, %function
MVC_PPSEqual:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L2202
	cbz	x20, .L2203
	ldrb	w3, [x19]
	ldrb	w2, [x20]
	ldrb	w1, [x19, 1]
	ldrb	w0, [x20, 1]
	cmp	w3, w2
	ldp	w4, w2, [x19, 24]
	ccmp	w1, w0, 0, eq
	ldr	w5, [x19, 36]
	ldp	w3, w0, [x20, 24]
	cset	w1, eq
	ldrb	w7, [x19, 2]
	cmp	w4, w3
	ldr	w3, [x19, 40]
	ccmp	w2, w0, 0, eq
	ldr	w6, [x19, 48]
	ldp	w4, w0, [x20, 36]
	cset	w2, eq
	ldr	w12, [x19, 60]
	cmp	w5, w4
	ldrb	w5, [x20, 2]
	ccmp	w3, w0, 0, eq
	ldr	w3, [x19, 44]
	cset	w4, eq
	cmp	w7, w5
	ldp	w0, w5, [x20, 44]
	ldr	w7, [x19, 52]
	and	w1, w1, w2
	ccmp	w3, w0, 0, eq
	ldr	w3, [x20, 52]
	cset	w0, eq
	cmp	w6, w5
	ldrb	w5, [x20, 3]
	and	w1, w4, w1
	ldrb	w6, [x19, 3]
	ccmp	w7, w3, 0, eq
	cset	w3, eq
	and	w0, w0, w1
	cmp	w6, w5
	ldrb	w1, [x20, 4]
	ldrb	w5, [x19, 4]
	and	w0, w3, w0
	ldr	w4, [x20, 60]
	ccmp	w5, w1, 0, eq
	ldrb	w2, [x19, 18]
	ldrb	w3, [x20, 18]
	cset	w1, eq
	cmp	w4, w12
	and	w0, w1, w0
	ccmp	w3, w2, 0, eq
	cset	w1, eq
	and	w0, w1, w0
	cbz	w2, .L2184
	lsl	w12, w12, 1
	cmn	w12, #6
	beq	.L2184
	add	x10, x19, 1984
	add	x9, x20, 1984
	mov	x11, x20
	add	x7, x19, 64
	mov	w8, -6
	mov	x1, 0
	.p2align 2
.L2189:
	add	x3, x19, x1
	add	x2, x20, x1
	ldrsb	w3, [x3, 5]
	ldrsb	w2, [x2, 5]
	cmp	w2, w3
	cset	w2, eq
	and	w0, w0, w2
	cbz	w3, .L2185
	cmp	w1, 5
	bhi	.L2186
	ldr	w3, [x9]
	ldr	w2, [x10]
	cmp	w3, w2
	cset	w3, eq
	and	w0, w0, w3
	cbnz	w2, .L2185
	sub	x2, x7, #64
	mov	x3, x11
	.p2align 2
.L2187:
	ldr	w5, [x2, 64]
	add	x2, x2, 4
	ldr	w4, [x3, 64]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x7, x2
	and	w0, w0, w4
	bne	.L2187
	.p2align 2
.L2185:
	add	w8, w8, 1
	add	x1, x1, 1
	cmp	w8, w12
	add	x10, x10, 4
	add	x9, x9, 4
	add	x11, x11, 64
	add	x7, x7, 64
	bne	.L2189
.L2184:
	ldr	w1, [x20, 56]
	ldr	w2, [x19, 56]
	cmp	w2, w1
	cset	w1, eq
	tst	w1, w0
	csetm	w0, eq
.L2182:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2186:
	uxtw	x2, w8
	add	x3, x2, 500
	lsl	x3, x3, 2
	add	x4, x19, x3
	add	x3, x20, x3
	ldr	w4, [x4, 8]
	ldr	w3, [x3, 8]
	cmp	w3, w4
	cset	w3, eq
	and	w0, w0, w3
	cbnz	w4, .L2185
	lsl	x2, x2, 8
	add	x3, x2, 448
	add	x2, x2, 704
	add	x6, x19, x2
	add	x2, x19, x3
	add	x3, x20, x3
	.p2align 2
.L2188:
	ldr	w5, [x2], 4
	ldr	w4, [x3], 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x6, x2
	and	w0, w0, w4
	bne	.L2188
	add	w8, w8, 1
	add	x1, x1, 1
	cmp	w8, w12
	add	x10, x10, 4
	add	x9, x9, 4
	add	x11, x11, 64
	add	x7, x7, 64
	bne	.L2189
	b	.L2184
.L2203:
	ldr	x2, .LC388
	mov	w3, 10268
	ldr	x1, .LC389
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2182
.L2202:
	ldr	x2, .LC388
	mov	w3, 10267
	ldr	x1, .LC389
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2182
	.size	MVC_PPSEqual, .-MVC_PPSEqual
	.align	3
.LC388:
	.xword	.LC36
	.align	3
.LC389:
	.xword	.LC38
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecPPS
	.type	MVC_DecPPS, %function
MVC_DecPPS:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC391
	mov	x0, x19
	bl	mvc_ue_v
	mov	w20, w0
	ldr	w0, [x19, 40]
	sub	w0, w0, #1
	cmp	w20, w0
	bls	.L2205
	ldr	x1, .LC393
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 40]
	sub	w0, w1, #1
	cmp	w20, w0
	bls	.L2212
	ldr	x0, .LC394
	ldr	x4, [x0]
	cbz	x4, .L2212
	ldr	w0, [x19, 120]
	mov	w3, 8
	stp	w20, w1, [x29, 56]
	add	x2, x29, 56
	mov	w1, 110
	blr	x4
	mov	w0, -1
.L2206:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2205:
	ldr	x1, .LC396
	mov	x0, x19
	bl	mvc_ue_v
	mov	w2, w0
	ldr	w0, [x19, 36]
	sub	w0, w0, #1
	cmp	w2, w0
	bhi	.L2216
	mov	w21, 2240
	ldr	x0, [x19, 280]
	umull	x21, w20, w21
	add	x0, x0, x21
	ldrb	w1, [x0, 19]
	cbz	w1, .L2208
	ldr	x22, .LC399
	mov	x0, x19
	mov	x1, x22
	stp	w20, w2, [x22, 24]
	bl	MVC_ProcessPPS
	cbnz	w0, .L2217
	ldr	x1, [x19, 280]
	mov	x0, x22
	add	x1, x1, x21
	bl	MVC_PPSEqual
	cbz	w0, .L2206
	ldr	x3, .LC402
	mov	w1, 1
	ldr	x0, [x19, 280]
	mov	x2, 2240
	strb	w1, [x22, 20]
	ldr	x3, [x3, 112]
	add	x0, x0, x21
	strb	w1, [x22, 19]
	mov	x1, x22
	blr	x3
	mov	w0, 0
	b	.L2206
	.p2align 3
.L2208:
	str	w20, [x0, 24]
	mov	x0, x19
	ldr	x1, [x19, 280]
	add	x1, x1, x21
	str	w2, [x1, 28]
	ldr	x1, [x19, 280]
	add	x1, x1, x21
	bl	MVC_ProcessPPS
	cbnz	w0, .L2218
	ldr	x1, [x19, 280]
	mov	w2, 1
	add	x1, x1, x21
	strb	w2, [x1, 20]
	ldr	x1, [x19, 280]
	add	x21, x1, x21
	strb	w2, [x21, 19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2212:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 64
	ret
.L2216:
	ldr	x1, .LC398
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2206
.L2217:
	ldr	x1, .LC401
	mov	w2, 10031
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2206
.L2218:
	ldr	x1, .LC401
	mov	w2, 10051
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 280]
	mov	w2, 1
	mov	w0, -1
	add	x1, x1, x21
	strb	w2, [x1, 20]
	ldr	x1, [x19, 280]
	add	x21, x1, x21
	strb	wzr, [x21, 19]
	b	.L2206
	.size	MVC_DecPPS, .-MVC_DecPPS
	.align	3
.LC391:
	.xword	.LC390
	.align	3
.LC393:
	.xword	.LC392
	.align	3
.LC394:
	.xword	g_event_report
	.align	3
.LC396:
	.xword	.LC395
	.align	3
.LC398:
	.xword	.LC397
	.align	3
.LC399:
	.xword	.LANCHOR2
	.align	3
.LC401:
	.xword	.LC400
	.align	3
.LC402:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	mvc_vui_parameters
	.type	mvc_vui_parameters, %function
mvc_vui_parameters:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x1, .LC404
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20]
	cbnz	w0, .L2261
	strb	wzr, [x20, 15]
.L2221:
	ldr	x1, .LC412
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 1]
	cbnz	w0, .L2262
.L2222:
	ldr	x1, .LC416
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 3]
	cbnz	w0, .L2263
	mov	w0, 5
	str	w0, [x20, 28]
.L2224:
	ldr	x1, .LC430
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 6]
	cbnz	w0, .L2264
.L2225:
	ldr	x1, .LC436
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 8]
	cbnz	w0, .L2265
.L2227:
	ldr	x1, .LC444
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 7]
	cbz	w0, .L2229
	ldr	x1, .LC446
	mov	x0, x19
	add	x24, x20, 60
	bl	mvc_ue_v
	ldr	x2, .LC448
	mov	w1, 4
	str	w0, [x24, 36]
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x24, 32]
	ldr	x2, .LC450
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x24, 33]
	ldr	w1, [x24, 36]
	cmp	w1, 31
	bhi	.L2232
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2232
	ldr	x27, .LC454
	mov	w21, 0
	ldr	x26, .LC456
	ldr	x25, .LC458
	.p2align 2
.L2233:
	uxtw	x22, w21
	mov	x1, x27
	mov	x0, x19
	add	w21, w21, 1
	add	x23, x20, x22, lsl 2
	bl	mvc_ue_v
	mov	x1, x26
	str	w0, [x23, 100]
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x23, 228]
	mov	x1, x25
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x24, x22]
	ldr	w0, [x24, 36]
	cmp	w0, w21
	bcs	.L2233
	ldr	x2, .LC460
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 296]
	ldr	x2, .LC462
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 300]
	ldr	x2, .LC464
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 304]
	ldr	x2, .LC466
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 308]
.L2229:
	ldr	x1, .LC468
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 10]
	cbnz	w0, .L2266
	ldrb	w0, [x20, 7]
	cbz	w0, .L2237
.L2238:
	ldr	x1, .LC470
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 14]
.L2237:
	ldr	x1, .LC472
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 11]
	ldr	x1, .LC474
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 12]
	cbnz	w0, .L2239
	ldrb	w0, [x19, 10]
.L2240:
	cmp	w0, wzr
	csetm	w0, ne
.L2260:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2265:
	ldr	x2, .LC438
	mov	w1, 32
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 52]
	ldr	x2, .LC440
	mov	w1, 32
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 56]
	ldr	x1, .LC442
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 9]
	bne	.L2227
	ldr	w2, [x20, 52]
	cbz	w2, .L2227
	ldr	w0, [x20, 56]
	lsl	w1, w0, 6
	sub	w1, w1, w0
	lsl	w1, w1, 1
	sub	w0, w1, w0
	lsl	w0, w0, 3
	udiv	w0, w0, w2
	lsr	w0, w0, 1
	str	w0, [x19, 56]
	b	.L2227
	.p2align 3
.L2264:
	ldr	x1, .LC432
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 44]
	ldr	x1, .LC434
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 48]
	b	.L2225
	.p2align 3
.L2263:
	ldr	x2, .LC418
	mov	w1, 3
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 28]
	ldr	x1, .LC420
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 4]
	ldr	x1, .LC422
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 5]
	cbz	w0, .L2224
	ldr	x2, .LC424
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 32]
	ldr	x2, .LC426
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 36]
	ldr	x2, .LC428
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 40]
	b	.L2224
	.p2align 3
.L2262:
	ldr	x1, .LC414
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 2]
	b	.L2222
	.p2align 3
.L2261:
	ldr	x2, .LC406
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	uxtb	w0, w0
	cmp	w0, 255
	strb	w0, [x20, 15]
	bne	.L2221
	ldr	x2, .LC408
	mov	w1, 16
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 16]
	ldr	x2, .LC410
	mov	w1, 16
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 20]
	b	.L2221
	.p2align 3
.L2266:
	ldr	x1, .LC446
	mov	x0, x19
	add	x24, x20, 372
	bl	mvc_ue_v
	ldr	x2, .LC448
	mov	w1, 4
	str	w0, [x24, 36]
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x24, 32]
	ldr	x2, .LC450
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x24, 33]
	ldr	w1, [x24, 36]
	cmp	w1, 31
	bhi	.L2232
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2232
	ldr	x27, .LC454
	mov	w21, 0
	ldr	x26, .LC456
	ldr	x25, .LC458
	.p2align 2
.L2235:
	uxtw	x22, w21
	mov	x1, x27
	mov	x0, x19
	add	w21, w21, 1
	add	x23, x20, x22, lsl 2
	bl	mvc_ue_v
	mov	x1, x26
	str	w0, [x23, 412]
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x23, 540]
	mov	x1, x25
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x24, x22]
	ldr	w0, [x24, 36]
	cmp	w0, w21
	bcs	.L2235
	ldr	x2, .LC460
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 296]
	ldr	x2, .LC462
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 300]
	ldr	x2, .LC464
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 304]
	ldr	x2, .LC466
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x24, 308]
	ldrb	w0, [x20, 7]
	cbnz	w0, .L2238
	ldrb	w0, [x20, 10]
	cbnz	w0, .L2238
	b	.L2237
	.p2align 3
.L2239:
	ldr	x1, .LC476
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 13]
	ldr	x1, .LC478
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 684]
	ldr	x1, .LC480
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 688]
	ldr	x1, .LC482
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 696]
	ldr	x1, .LC484
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 692]
	ldr	x1, .LC486
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 700]
	ldr	x1, .LC488
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 704]
	ldrb	w0, [x19, 10]
	cbz	w0, .L2240
	mov	w0, -1
	b	.L2260
.L2232:
	ldr	x1, .LC452
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2260
	.size	mvc_vui_parameters, .-mvc_vui_parameters
	.align	3
.LC404:
	.xword	.LC403
	.align	3
.LC406:
	.xword	.LC405
	.align	3
.LC408:
	.xword	.LC407
	.align	3
.LC410:
	.xword	.LC409
	.align	3
.LC412:
	.xword	.LC411
	.align	3
.LC414:
	.xword	.LC413
	.align	3
.LC416:
	.xword	.LC415
	.align	3
.LC418:
	.xword	.LC417
	.align	3
.LC420:
	.xword	.LC419
	.align	3
.LC422:
	.xword	.LC421
	.align	3
.LC424:
	.xword	.LC423
	.align	3
.LC426:
	.xword	.LC425
	.align	3
.LC428:
	.xword	.LC427
	.align	3
.LC430:
	.xword	.LC429
	.align	3
.LC432:
	.xword	.LC431
	.align	3
.LC434:
	.xword	.LC433
	.align	3
.LC436:
	.xword	.LC435
	.align	3
.LC438:
	.xword	.LC437
	.align	3
.LC440:
	.xword	.LC439
	.align	3
.LC442:
	.xword	.LC441
	.align	3
.LC444:
	.xword	.LC443
	.align	3
.LC446:
	.xword	.LC445
	.align	3
.LC448:
	.xword	.LC447
	.align	3
.LC450:
	.xword	.LC449
	.align	3
.LC452:
	.xword	.LC451
	.align	3
.LC454:
	.xword	.LC453
	.align	3
.LC456:
	.xword	.LC455
	.align	3
.LC458:
	.xword	.LC457
	.align	3
.LC460:
	.xword	.LC459
	.align	3
.LC462:
	.xword	.LC461
	.align	3
.LC464:
	.xword	.LC463
	.align	3
.LC466:
	.xword	.LC465
	.align	3
.LC468:
	.xword	.LC467
	.align	3
.LC470:
	.xword	.LC469
	.align	3
.LC472:
	.xword	.LC471
	.align	3
.LC474:
	.xword	.LC473
	.align	3
.LC476:
	.xword	.LC475
	.align	3
.LC478:
	.xword	.LC477
	.align	3
.LC480:
	.xword	.LC479
	.align	3
.LC482:
	.xword	.LC481
	.align	3
.LC484:
	.xword	.LC483
	.align	3
.LC486:
	.xword	.LC485
	.align	3
.LC488:
	.xword	.LC487
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_SPSEqual
	.type	MVC_SPSEqual, %function
MVC_SPSEqual:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L2299
	cbz	x20, .L2300
	ldr	w3, [x19, 736]
	ldr	w2, [x20, 736]
	ldrb	w1, [x19]
	ldrb	w0, [x20]
	cmp	w3, w2
	ldrb	w4, [x19, 1]
	ldrb	w2, [x20, 1]
	ccmp	w1, w0, 0, eq
	ldrb	w1, [x19, 2]
	cset	w3, eq
	ldrb	w0, [x20, 2]
	cmp	w4, w2
	ldr	w6, [x19, 740]
	ccmp	w1, w0, 0, eq
	ldr	w5, [x20, 740]
	cset	w0, eq
	ldr	w2, [x20, 744]
	ldr	w4, [x19, 744]
	and	w0, w3, w0
	ldrb	w1, [x19, 27]
	cmp	w6, w5
	ldrb	w3, [x20, 27]
	ccmp	w4, w2, 0, eq
	cset	w2, eq
	cmp	w3, w1
	and	w0, w2, w0
	cset	w2, eq
	and	w0, w2, w0
	cbz	w1, .L2271
	mov	x2, x19
	mov	x8, x20
	mov	w9, -6
	mov	x1, 0
	.p2align 2
.L2276:
	add	x4, x19, x1
	add	x3, x20, x1
	add	x6, x2, 64
	ldrsb	w3, [x3, 6]
	ldrsb	w4, [x4, 6]
	cmp	w3, w4
	cset	w3, eq
	and	w0, w0, w3
	cbz	w4, .L2272
	cmp	w1, 5
	bhi	.L2273
	mov	x3, x8
	.p2align 2
.L2274:
	ldr	w5, [x2, 752]
	add	x2, x2, 4
	ldr	w4, [x3, 752]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x6, x2
	and	w0, w0, w4
	bne	.L2274
.L2272:
	add	x1, x1, 1
	add	w9, w9, 1
	cmp	x1, 8
	mov	x2, x6
	add	x8, x8, 64
	bne	.L2276
.L2271:
	ldr	w4, [x19, 2896]
	ldr	w3, [x20, 2896]
	ldr	w2, [x20, 2900]
	ldr	w1, [x19, 2900]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbz	w1, .L2278
	cmp	w1, 1
	bne	.L2277
	ldrb	w4, [x19, 18]
	ldrb	w3, [x20, 18]
	ldr	w2, [x19, 2908]
	ldr	w1, [x20, 2908]
	cmp	w4, w3
	ldr	w5, [x19, 2912]
	ldr	w4, [x20, 2912]
	ccmp	w2, w1, 0, eq
	ldr	w2, [x20, 2916]
	cset	w3, eq
	ldr	w1, [x19, 2916]
	cmp	w5, w4
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w2, w3, w2
	and	w0, w0, w2
	cbz	w1, .L2277
	sub	w5, w1, #1
	add	x2, x20, 2920
	add	x5, x5, 731
	add	x1, x19, 2920
	add	x5, x19, x5, lsl 2
	.p2align 2
.L2280:
	ldr	w4, [x1], 4
	ldr	w3, [x2], 4
	cmp	w4, w3
	cset	w3, eq
	cmp	x1, x5
	and	w0, w0, w3
	bne	.L2280
.L2277:
	ldr	w4, [x19, 3944]
	ldr	w3, [x20, 3944]
	ldrb	w2, [x19, 19]
	ldrb	w1, [x20, 19]
	cmp	w4, w3
	ldr	w6, [x19, 3948]
	ldr	w4, [x20, 3948]
	ccmp	w2, w1, 0, eq
	ldr	w5, [x19, 3952]
	cset	w2, eq
	ldr	w1, [x20, 3952]
	cmp	w6, w4
	ldrb	w3, [x19, 20]
	ldrb	w4, [x20, 20]
	ccmp	w5, w1, 0, eq
	cset	w1, eq
	cmp	w4, w3
	and	w2, w2, w1
	cset	w1, eq
	and	w1, w2, w1
	and	w0, w1, w0
	cbnz	w3, .L2281
	ldrb	w1, [x20, 21]
	ldrb	w2, [x19, 21]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
.L2281:
	ldrb	w4, [x19, 22]
	ldrb	w3, [x20, 22]
	ldrb	w2, [x20, 23]
	ldrb	w1, [x19, 23]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbnz	w1, .L2301
.L2282:
	ldrb	w1, [x20, 24]
	ldrb	w2, [x19, 24]
	cmp	w2, w1
	cset	w1, eq
	tst	w1, w0
	csetm	w0, eq
.L2269:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2301:
	ldr	w4, [x19, 3956]
	ldr	w3, [x20, 3956]
	ldr	w2, [x19, 3960]
	ldr	w1, [x20, 3960]
	cmp	w4, w3
	ldr	w5, [x19, 3964]
	ldr	w4, [x20, 3964]
	ccmp	w2, w1, 0, eq
	ldr	w3, [x19, 3968]
	cset	w2, eq
	ldr	w1, [x20, 3968]
	cmp	w5, w4
	ccmp	w3, w1, 0, eq
	cset	w1, eq
	and	w1, w2, w1
	and	w0, w0, w1
	b	.L2282
	.p2align 3
.L2273:
	ubfiz	x3, x9, 8, 32
	add	x4, x3, 1136
	add	x7, x3, 1392
	add	x7, x19, x7
	add	x3, x19, x4
	add	x4, x20, x4
	.p2align 2
.L2275:
	ldr	w6, [x3], 4
	ldr	w5, [x4], 4
	cmp	w6, w5
	cset	w5, eq
	cmp	x3, x7
	and	w0, w0, w5
	bne	.L2275
	add	x1, x1, 1
	add	x6, x2, 64
	cmp	x1, 8
	add	w9, w9, 1
	mov	x2, x6
	add	x8, x8, 64
	bne	.L2276
	b	.L2271
	.p2align 3
.L2278:
	ldr	w1, [x20, 2904]
	ldr	w2, [x19, 2904]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
	b	.L2277
.L2300:
	ldr	x2, .LC489
	mov	w3, 10512
	ldr	x1, .LC490
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2269
.L2299:
	ldr	x2, .LC489
	mov	w3, 10511
	ldr	x1, .LC490
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2269
	.size	MVC_SPSEqual, .-MVC_SPSEqual
	.align	3
.LC489:
	.xword	.LC36
	.align	3
.LC490:
	.xword	.LC38
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetDar
	.type	MVC_GetDar, %function
MVC_GetDar:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w20, w0
	mov	x0, x30
	mov	w19, w1
	mov	w21, w2
	mov	w23, w3
	mov	w22, w4
	bl	_mcount
	cbz	w20, .L2313
	mov	w0, 255
	cmp	w20, 16
	ccmp	w20, w0, 4, gt
	bne	.L2313
	cmp	w19, wzr
	ccmp	w21, wzr, 4, ne
	ccmp	w20, w0, 0, eq
	beq	.L2313
	cmp	w20, 1
	beq	.L2314
	cmp	w20, w0
	beq	.L2304
	ldr	x0, .LC491
	sbfiz	x20, x20, 3, 32
	add	x0, x0, 104
	add	x1, x0, x20
	ldr	w19, [x0, x20]
	ldr	w21, [x1, 4]
.L2304:
	mul	w19, w19, w23
	mul	w2, w21, w22
	lsl	w19, w19, 10
	sdiv	w2, w19, w2
	subs	w1, w2, #2406
	bmi	.L2324
.L2305:
	subs	w0, w2, #2263
	bmi	.L2325
	cmp	w1, w0
	mov	w19, 4
	blt	.L2303
.L2309:
	subs	w1, w2, #1820
	bmi	.L2326
	cmp	w0, w1
	mov	w19, 3
	blt	.L2303
.L2310:
	subs	w0, w2, #1365
	bmi	.L2327
.L2308:
	mov	w19, 2
	cmp	w1, w0
	csinc	w19, w19, wzr, lt
	b	.L2303
	.p2align 3
.L2313:
	mov	w19, 0
	mov	w2, 0
.L2303:
	ldr	x1, .LC493
	mov	w3, w19
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2314:
	mov	w19, 5
	mov	w2, 0
	b	.L2303
	.p2align 3
.L2325:
	mov	w0, 2263
	mov	w19, 4
	sub	w0, w0, w2
	cmp	w1, w0
	blt	.L2303
	b	.L2309
	.p2align 3
.L2324:
	mov	w1, 2406
	sub	w1, w1, w2
	b	.L2305
	.p2align 3
.L2326:
	mov	w1, 1820
	mov	w19, 3
	sub	w1, w1, w2
	cmp	w0, w1
	blt	.L2303
	b	.L2310
.L2327:
	mov	w0, 1365
	sub	w0, w0, w2
	b	.L2308
	.size	MVC_GetDar, .-MVC_GetDar
	.align	3
.LC491:
	.xword	.LANCHOR0
	.align	3
.LC493:
	.xword	.LC492
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessSPS
	.type	MVC_ProcessSPS, %function
MVC_ProcessSPS:
	stp	x29, x30, [sp, -144]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L2447
	ldr	w0, [x20, 736]
	mov	w3, 128
	mov	w2, 100
	sub	w1, w0, #110
	and	w4, w0, -17
	and	w1, w1, -9
	cmp	w1, wzr
	ccmp	w4, w3, 4, ne
	cset	w1, eq
	cmp	w0, 122
	ccmp	w0, w2, 4, ne
	cset	w0, eq
	orr	w0, w1, w0
	cbnz	w0, .L2448
	mov	w0, 1
	strb	wzr, [x20, 27]
	str	w0, [x20, 748]
.L2341:
	ldr	x1, .LC519
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 12
	str	w0, [x20, 2896]
	bhi	.L2354
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2354
	ldr	x1, .LC523
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 2
	str	w0, [x20, 2900]
	bhi	.L2356
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2356
	cbz	w0, .L2449
	cmp	w0, 1
	beq	.L2450
.L2360:
	ldr	x1, .LC581
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3944]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2445
	ldr	x1, .LC543
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 19]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2445
	ldr	x1, .LC545
	mov	x0, x19
	bl	mvc_ue_v
	sub	w1, w0, #1
	cmp	w1, 509
	str	w0, [x20, 3948]
	bhi	.L2367
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2367
	ldr	x1, .LC549
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3952]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2445
	ldr	x1, .LC551
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 20]
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2445
	cbnz	w0, .L2451
	ldr	x1, .LC583
	mov	x0, x19
	bl	mvc_u_1
	ldr	w22, [x20, 3952]
	strb	w0, [x20, 21]
	add	w22, w22, 1
	cmp	w22, 255
	bhi	.L2401
	ldr	w3, [x20, 3948]
	cmp	w22, 1
	mov	w23, 2
	add	w3, w3, 1
	ccmp	w3, 3, 0, hi
	cset	w0, ls
	cbz	w0, .L2371
.L2401:
	ldr	x1, .LC553
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2437
	.p2align 3
.L2448:
	ldr	x1, .LC499
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 1
	str	w0, [x20, 748]
	bhi	.L2332
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2332
	ldr	x1, .LC503
	mov	x0, x19
	bl	mvc_ue_v
	cbnz	w0, .L2334
	ldrb	w0, [x19, 10]
	cbz	w0, .L2335
.L2334:
	ldr	x1, .LC505
	mov	w0, 1
	bl	dprint_vfmw
.L2335:
	ldr	x1, .LC507
	mov	x0, x19
	bl	mvc_ue_v
	cbnz	w0, .L2336
	ldrb	w0, [x19, 10]
	cbz	w0, .L2337
.L2336:
	ldr	x1, .LC509
	mov	w0, 1
	bl	dprint_vfmw
.L2337:
	ldr	x1, .LC511
	mov	x0, x19
	bl	mvc_u_1
	cbnz	w0, .L2338
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2338
	ldr	x1, .LC515
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 27]
	bne	.L2341
	ldr	x25, .LC495
	add	x21, x29, 120
	ldr	x26, .LC516
	add	x23, x20, 6
	add	x22, x20, 2672
	add	x24, x20, 752
	mov	w28, 0
	ldr	x27, .LC517
	b	.L2347
	.p2align 3
.L2454:
	ldr	x0, .LC495
	cmp	w28, wzr
	ldr	x3, [x27, 104]
	mov	x2, 16
	csel	x1, x0, x1, eq
	mov	x0, x22
	blr	x3
.L2343:
	add	w28, w28, 1
	add	x21, x21, 4
	cmp	w28, 6
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	beq	.L2452
.L2347:
	mov	x1, x26
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x23]
	cmp	w0, 1
	str	w0, [x21]
	add	x1, x25, 16
	beq	.L2453
	cmp	w28, wzr
	ccmp	w28, 3, 4, ne
	beq	.L2454
	ldr	x0, .LC517
	sub	w1, w28, #1
	add	x1, x1, 167
	mov	x2, 16
	add	w28, w28, 1
	add	x21, x21, 4
	ldr	x3, [x0, 104]
	add	x1, x20, x1, lsl 4
	mov	x0, x22
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	blr	x3
	cmp	w28, 6
	bne	.L2347
.L2452:
	ldr	x24, .LC517
	add	x21, x20, 2768
	ldr	x23, .LC495
	add	x22, x20, 1136
	mov	x27, 0
	add	x25, x29, 104
	mov	x28, x24
.L2352:
	mov	x1, x26
	mov	x0, x19
	bl	mvc_u_1
	cmp	w0, 1
	add	x2, x20, x27
	str	w0, [x25, x27, lsl 2]
	add	x1, x23, 96
	strb	w0, [x2, 12]
	beq	.L2455
	ldr	x3, [x24, 104]
	cbz	w27, .L2456
.L2351:
	mov	x0, x21
	mov	x2, 64
.L2441:
	blr	x3
.L2349:
	add	x27, x27, 1
	add	x21, x21, 64
	cmp	x27, 2
	add	x22, x22, 256
	bne	.L2352
	b	.L2341
	.p2align 3
.L2398:
	ldr	w2, [x0, 708]
	ldr	w1, [x0, 712]
	cmp	w24, w2
	ccmp	w22, w1, 2, ls
	bls	.L2397
	ldr	x0, .LC579
	ldr	x4, [x0]
	cbz	x4, .L2445
	ldr	w0, [x19, 120]
	mov	w3, 8
	strh	w2, [x29, 116]
	add	x2, x29, 112
	strh	w1, [x29, 118]
	mov	w1, 107
	strh	w24, [x29, 112]
	strh	w22, [x29, 114]
	blr	x4
	.p2align 2
.L2445:
	mov	w0, -1
.L2437:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2451:
	ldr	w22, [x20, 3952]
	strb	wzr, [x20, 21]
	sub	w0, w22, #1
	cmp	w0, 509
	bhi	.L2401
	ldr	w3, [x20, 3948]
	mov	w23, 1
	add	w22, w22, 1
	add	w3, w3, w23
.L2371:
	mul	w22, w23, w22
	lsl	w24, w3, 4
	mov	w1, 100663296
	lsl	w22, w22, 4
	mul	w0, w24, w22
	lsr	w0, w0, 1
	lsl	w21, w0, 2
	sub	w0, w21, w0
	cmp	w0, w1
	bhi	.L2457
	ldr	w2, [x20, 740]
	sub	w1, w2, #10
	cmp	w1, 31
	bls	.L2458
.L2373:
	ldr	x1, .LC558
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2437
	.p2align 3
.L2449:
	ldr	x1, .LC527
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 12
	str	w0, [x20, 2904]
	bhi	.L2359
	ldrb	w0, [x19, 10]
	cbz	w0, .L2360
.L2359:
	ldr	x1, .LC529
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2437
	.p2align 3
.L2458:
	ldr	x3, .LC556
	ldrh	w1, [x3,w1,uxtw #1]
	adr	x3, .Lrtx2375
	add	x1, x3, w1, sxth #2
	br	x1
.Lrtx2375:
	.section	.rodata
	.align	0
	.align	2
.L2375:
	.2byte	(.L2374 - .Lrtx2375) / 4
	.2byte	(.L2408 - .Lrtx2375) / 4
	.2byte	(.L2377 - .Lrtx2375) / 4
	.2byte	(.L2377 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2377 - .Lrtx2375) / 4
	.2byte	(.L2378 - .Lrtx2375) / 4
	.2byte	(.L2380 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2380 - .Lrtx2375) / 4
	.2byte	(.L2381 - .Lrtx2375) / 4
	.2byte	(.L2382 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2373 - .Lrtx2375) / 4
	.2byte	(.L2384 - .Lrtx2375) / 4
	.2byte	(.L2384 - .Lrtx2375) / 4
	.text
	.p2align 3
.L2377:
	mov	w21, 60416
	movk	w21, 0xd, lsl 16
.L2376:
	udiv	w21, w21, w0
	mov	w2, 16
	ldr	x1, .LC560
	mov	w0, 21
	cmp	w21, w2
	csel	w21, w21, w2, ls
	mov	w2, w21
	bl	dprint_vfmw
	ldr	w2, [x20, 3944]
	cmp	w2, w21
	bhi	.L2385
	ldrb	w0, [x19, 10]
	cbz	w0, .L2386
.L2385:
	ldr	x1, .LC562
	mov	w3, w21
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x20, 3944]
	cmp	w0, 16
	bhi	.L2442
	cmp	w21, w0
	csel	w21, w21, w0, cs
.L2442:
	str	w21, [x20, 3944]
.L2386:
	ldr	x1, .LC564
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 22]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2445
	ldr	x1, .LC566
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 23]
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2445
	cbnz	w0, .L2459
.L2388:
	add	x2, x20, 3840
	lsr	w1, w24, 1
	lsr	w0, w22, 1
	stp	w24, w22, [x2, 136]
	stp	w1, w0, [x2, 144]
.L2390:
	ldr	x1, .LC576
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x20, 24]
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2445
	mov	w1, 2
	str	w1, [x20, 68]
	cbnz	w0, .L2460
	mov	w0, 5
	strb	wzr, [x20, 43]
	str	w0, [x20, 56]
	mov	w0, 0
.L2393:
	ldp	w1, w2, [x20, 44]
	mov	w4, w22
	mov	w3, w24
	bl	MVC_GetDar
	str	w0, [x20, 52]
	ldr	w1, [x20, 3944]
	cbz	w1, .L2396
	cmp	w21, w1
	csel	w21, w21, w1, ls
.L2396:
	ldr	x0, [x19, 224]
	cmp	w21, 16
	mov	w1, 16
	csel	w21, w21, w1, ls
	ldr	w1, [x0, 28]
	cmp	w1, 25
	beq	.L2461
.L2397:
	cmp	w22, 1919
	bls	.L2399
	mov	w0, 4
	cmp	w21, w0
	csel	w21, w21, w0, ls
.L2399:
	add	w21, w21, 1
	str	w21, [x20, 3972]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2384:
	mov	w21, 12582912
	b	.L2376
	.p2align 3
.L2380:
	mov	w21, 30208
	movk	w21, 0x2f, lsl 16
	b	.L2376
	.p2align 3
.L2453:
	mov	x0, x19
	mov	x4, x21
	mov	x2, x22
	mov	x1, x24
	mov	w3, 16
	bl	MVC_Scaling_List
	ldr	w0, [x21]
	cmp	w0, 1
	bne	.L2343
	ldr	x0, .LC495
	cmp	w28, 2
	mov	x2, 16
	add	x1, x0, 16
	csel	x1, x0, x1, ls
	ldr	x0, .LC517
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	b	.L2343
	.p2align 3
.L2332:
	ldr	x1, .LC501
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2354:
	ldr	x1, .LC521
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2437
	.p2align 3
.L2459:
	ldr	x1, .LC568
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3956]
	ldr	x1, .LC570
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3960]
	ldr	x1, .LC572
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3964]
	ldr	x1, .LC574
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 3968]
	ldr	w1, [x20, 3964]
	ldr	w2, [x20, 3956]
	lsl	w1, w1, 1
	ldr	w3, [x20, 3960]
	lsl	w2, w2, 1
	mul	w1, w1, w23
	sub	w4, w24, w2
	lsl	w23, w23, 1
	sub	w3, w4, w3, lsl 1
	sub	w4, w22, w1
	cmp	w3, wzr
	msub	w0, w23, w0, w4
	ccmp	w0, wzr, 4, gt
	ble	.L2388
	add	x4, x20, 3840
	add	w2, w2, w3, lsr 1
	add	w1, w1, w0, lsr 1
	stp	w3, w0, [x4, 136]
	stp	w2, w1, [x4, 144]
	b	.L2390
	.p2align 3
.L2460:
	add	x1, x20, 28
	mov	x0, x19
	bl	mvc_vui_parameters
	cbnz	w0, .L2444
	ldrb	w0, [x20, 40]
	cbz	w0, .L2444
	ldr	w2, [x20, 732]
	cmp	w2, wzr
	ccmp	w21, w2, 0, ne
	bcc	.L2462
	ldr	w21, [x20, 3944]
	ldrb	w0, [x20, 43]
	cmp	w21, w2
	csel	w21, w21, w2, cs
	b	.L2393
.L2462:
	ldr	x1, .LC578
	mov	w3, w21
	mov	w0, 1
	bl	dprint_vfmw
	.p2align 2
.L2444:
	ldrb	w0, [x20, 43]
	b	.L2393
	.p2align 3
.L2461:
	ldr	w1, [x0, 748]
	cbnz	w1, .L2397
	ldr	w1, [x0, 732]
	cmp	w21, w1
	bls	.L2398
	ldr	x0, .LC579
	ldr	x4, [x0]
	cbz	x4, .L2445
	ldr	w0, [x19, 120]
	mov	w3, 8
	stp	w21, w1, [x29, 112]
	add	x2, x29, 112
	mov	w1, 106
	blr	x4
	mov	w0, -1
	b	.L2437
	.p2align 3
.L2338:
	ldr	x1, .LC513
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2437
	.p2align 3
.L2450:
	ldr	x1, .LC531
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x20, 18]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2445
	ldr	x1, .LC533
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 2908]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2445
	ldr	x1, .LC535
	mov	x0, x19
	bl	mvc_se_v
	str	w0, [x20, 2912]
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2445
	ldr	x1, .LC537
	mov	x0, x19
	bl	mvc_ue_v
	cmp	w0, 255
	str	w0, [x20, 2916]
	bhi	.L2363
	ldrb	w1, [x19, 10]
	cbnz	w1, .L2363
	cbz	w0, .L2360
	ldr	x22, .LC541
	mov	w21, 0
	b	.L2366
	.p2align 3
.L2463:
	ldr	w0, [x20, 2916]
	cmp	w0, w21
	bls	.L2360
.L2366:
	mov	x1, x22
	mov	x0, x19
	bl	mvc_se_v
	add	x1, x20, x21, uxtw 2
	add	w21, w21, 1
	str	w0, [x1, 2920]
	ldrb	w0, [x19, 10]
	cbz	w0, .L2463
	b	.L2445
	.p2align 3
.L2367:
	ldr	x1, .LC547
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2437
	.p2align 3
.L2408:
	mov	w21, 17920
	movk	w21, 0x5, lsl 16
	b	.L2376
	.p2align 3
.L2381:
	mov	w21, 30720
	movk	w21, 0x69, lsl 16
	b	.L2376
	.p2align 3
.L2378:
	mov	w21, 55296
	movk	w21, 0x1b, lsl 16
	b	.L2376
	.p2align 3
.L2374:
	mov	w21, 20992
	movk	w21, 0x2, lsl 16
	b	.L2376
	.p2align 3
.L2382:
	mov	w21, 7864320
	b	.L2376
.L2363:
	ldr	x1, .LC539
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2437
	.p2align 3
.L2455:
	mov	x0, x19
	add	x4, x25, x27, lsl 2
	mov	x2, x21
	mov	x1, x22
	mov	w3, 64
	bl	MVC_Scaling_List
	ldr	w0, [x25, x27, lsl 2]
	cmp	w0, 1
	bne	.L2349
	ldr	x1, .LC495
	mov	x2, 64
	mov	x0, x21
	ldr	x3, [x28, 104]
	add	x1, x1, 96
	cbnz	w27, .L2441
	ldr	x1, .LC495
	add	x1, x1, 32
	b	.L2441
	.p2align 3
.L2356:
	ldr	x1, .LC525
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2437
.L2457:
	ldr	x1, .LC555
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2437
.L2447:
	ldr	x2, .LC496
	mov	w3, 10701
	ldr	x1, .LC497
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2437
.L2456:
	ldr	x1, .LC495
	add	x1, x1, 32
	b	.L2351
	.size	MVC_ProcessSPS, .-MVC_ProcessSPS
	.align	3
.LC495:
	.xword	.LANCHOR1
	.align	3
.LC496:
	.xword	.LC36
	.align	3
.LC497:
	.xword	.LC38
	.align	3
.LC499:
	.xword	.LC498
	.align	3
.LC501:
	.xword	.LC500
	.align	3
.LC503:
	.xword	.LC502
	.align	3
.LC505:
	.xword	.LC504
	.align	3
.LC507:
	.xword	.LC506
	.align	3
.LC509:
	.xword	.LC508
	.align	3
.LC511:
	.xword	.LC510
	.align	3
.LC513:
	.xword	.LC512
	.align	3
.LC515:
	.xword	.LC514
	.align	3
.LC516:
	.xword	.LC381
	.align	3
.LC517:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC519:
	.xword	.LC518
	.align	3
.LC521:
	.xword	.LC520
	.align	3
.LC523:
	.xword	.LC522
	.align	3
.LC525:
	.xword	.LC524
	.align	3
.LC527:
	.xword	.LC526
	.align	3
.LC529:
	.xword	.LC528
	.align	3
.LC531:
	.xword	.LC530
	.align	3
.LC533:
	.xword	.LC532
	.align	3
.LC535:
	.xword	.LC534
	.align	3
.LC537:
	.xword	.LC536
	.align	3
.LC539:
	.xword	.LC538
	.align	3
.LC541:
	.xword	.LC540
	.align	3
.LC543:
	.xword	.LC542
	.align	3
.LC545:
	.xword	.LC544
	.align	3
.LC547:
	.xword	.LC546
	.align	3
.LC549:
	.xword	.LC548
	.align	3
.LC551:
	.xword	.LC550
	.align	3
.LC553:
	.xword	.LC552
	.align	3
.LC555:
	.xword	.LC554
	.align	3
.LC556:
	.xword	.L2375
	.align	3
.LC558:
	.xword	.LC557
	.align	3
.LC560:
	.xword	.LC559
	.align	3
.LC562:
	.xword	.LC561
	.align	3
.LC564:
	.xword	.LC563
	.align	3
.LC566:
	.xword	.LC565
	.align	3
.LC568:
	.xword	.LC567
	.align	3
.LC570:
	.xword	.LC569
	.align	3
.LC572:
	.xword	.LC571
	.align	3
.LC574:
	.xword	.LC573
	.align	3
.LC576:
	.xword	.LC575
	.align	3
.LC578:
	.xword	.LC577
	.align	3
.LC579:
	.xword	g_event_report
	.align	3
.LC581:
	.xword	.LC580
	.align	3
.LC583:
	.xword	.LC582
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecSPS
	.type	MVC_DecSPS, %function
MVC_DecSPS:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC585
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	mov	w21, w0
	ldr	x1, .LC587
	mov	x0, x19
	bl	mvc_u_1
	mov	w27, w0
	ldr	x1, .LC589
	mov	x0, x19
	bl	mvc_u_1
	mov	w26, w0
	ldr	x1, .LC591
	mov	x0, x19
	bl	mvc_u_1
	mov	w25, w0
	ldr	x1, .LC593
	mov	x0, x19
	bl	mvc_u_1
	mov	w24, w0
	ldr	x1, .LC595
	mov	x0, x19
	bl	mvc_u_1
	mov	w23, w0
	ldr	x1, .LC597
	mov	x0, x19
	bl	mvc_u_1
	str	w0, [x29, 108]
	ldr	x2, .LC599
	mov	w1, 2
	mov	x0, x19
	bl	mvc_u_v
	ldr	x2, .LC601
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	mov	w20, w0
	ldr	x1, .LC603
	mov	x0, x19
	bl	mvc_ue_v
	mov	w22, w0
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2502
	ldr	w0, [x19, 36]
	sub	w0, w0, #1
	cmp	w22, w0
	bhi	.L2504
	cmp	w21, 100
	mov	w28, w21
	beq	.L2470
	bgt	.L2471
	cmp	w21, 77
	beq	.L2470
	cmp	w21, 88
	beq	.L2472
	cmp	w21, 66
	bne	.L2469
	ldr	x1, .LC607
	mov	w0, 1
	bl	dprint_vfmw
.L2470:
	cmp	w20, 9
	mov	w2, w20
	bls	.L2501
.L2507:
	cmp	w20, 41
	bhi	.L2501
	mov	w20, 3992
	ldr	x0, [x19, 272]
	umull	x20, w22, w20
	add	x0, x0, x20
	ldrb	w1, [x0, 25]
	cbz	w1, .L2477
.L2508:
	ldr	x21, .LC616
	mov	x0, x19
	ldrb	w3, [x29, 108]
	add	x21, x21, 2240
	strb	w27, [x21]
	str	w28, [x21, 736]
	mov	x1, x21
	strb	w26, [x21, 1]
	strb	w25, [x21, 2]
	strb	w24, [x21, 3]
	strb	w23, [x21, 4]
	strb	w3, [x21, 5]
	str	w2, [x21, 740]
	str	w22, [x21, 744]
	bl	MVC_ProcessSPS
	cbnz	w0, .L2505
	ldr	x1, [x19, 272]
	mov	x0, x21
	add	x1, x1, x20
	bl	MVC_SPSEqual
	cbnz	w0, .L2506
.L2466:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2471:
	cmp	w21, 122
	beq	.L2474
	cmp	w21, 144
	beq	.L2474
	cmp	w21, 110
	beq	.L2474
.L2469:
	ldr	x1, .LC613
	mov	w2, w21
	mov	w0, 1
	mov	w28, 100
	bl	dprint_vfmw
	cmp	w20, 9
	mov	w2, w20
	bhi	.L2507
	.p2align 2
.L2501:
	ldr	x1, .LC615
	mov	w3, 41
	mov	w0, 1
	mov	w20, 3992
	bl	dprint_vfmw
	umull	x20, w22, w20
	ldr	x0, [x19, 272]
	mov	w2, 41
	add	x0, x0, x20
	ldrb	w1, [x0, 25]
	cbnz	w1, .L2508
.L2477:
	str	w28, [x0, 736]
	mov	x0, x19
	ldrb	w3, [x29, 108]
	ldr	x1, [x19, 272]
	strb	w27, [x1, x20]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	strb	w26, [x1, 1]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	strb	w25, [x1, 2]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	strb	w24, [x1, 3]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	strb	w23, [x1, 4]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	strb	w3, [x1, 5]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	str	w2, [x1, 740]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	str	w22, [x1, 744]
	ldr	x1, [x19, 272]
	add	x1, x1, x20
	bl	MVC_ProcessSPS
	cbnz	w0, .L2509
	ldr	x1, [x19, 272]
	mov	w2, 1
	add	x1, x1, x20
	strb	w2, [x1, 26]
	ldr	x1, [x19, 272]
	add	x20, x1, x20
	strb	w2, [x20, 25]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2504:
	ldr	x1, .LC604
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 36]
	sub	w0, w1, #1
	cmp	w22, w0
	bls	.L2502
	ldr	x0, .LC605
	ldr	x5, [x0]
	cbz	x5, .L2502
	ldr	w0, [x19, 120]
	mov	w3, 8
	stp	w22, w1, [x29, 120]
	add	x2, x29, 120
	mov	w1, 109
	blr	x5
.L2502:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2474:
	ldr	x1, .LC611
	mov	w0, 1
	bl	dprint_vfmw
	cmp	w20, 9
	mov	w2, w20
	bhi	.L2507
	b	.L2501
	.p2align 3
.L2472:
	ldr	x1, .LC609
	mov	w0, 1
	bl	dprint_vfmw
	cmp	w20, 9
	mov	w2, w20
	bhi	.L2507
	b	.L2501
	.p2align 3
.L2506:
	ldr	x3, .LC619
	mov	w1, 1
	ldr	x0, [x19, 272]
	mov	x2, 3992
	strb	w1, [x21, 26]
	ldr	x3, [x3, 112]
	add	x0, x0, x20
	strb	w1, [x21, 25]
	mov	x1, x21
	blr	x3
	mov	w0, 0
	b	.L2466
	.p2align 3
.L2505:
	ldr	x1, .LC618
	mov	w3, w22
	mov	w2, 11245
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2466
.L2509:
	ldr	x1, .LC618
	mov	w2, 11272
	mov	w3, w22
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 272]
	mov	w2, 1
	mov	w0, -1
	add	x1, x1, x20
	strb	w2, [x1, 26]
	ldr	x1, [x19, 272]
	add	x20, x1, x20
	strb	wzr, [x20, 25]
	b	.L2466
	.size	MVC_DecSPS, .-MVC_DecSPS
	.align	3
.LC585:
	.xword	.LC584
	.align	3
.LC587:
	.xword	.LC586
	.align	3
.LC589:
	.xword	.LC588
	.align	3
.LC591:
	.xword	.LC590
	.align	3
.LC593:
	.xword	.LC592
	.align	3
.LC595:
	.xword	.LC594
	.align	3
.LC597:
	.xword	.LC596
	.align	3
.LC599:
	.xword	.LC598
	.align	3
.LC601:
	.xword	.LC600
	.align	3
.LC603:
	.xword	.LC602
	.align	3
.LC604:
	.xword	.LC397
	.align	3
.LC605:
	.xword	g_event_report
	.align	3
.LC607:
	.xword	.LC606
	.align	3
.LC609:
	.xword	.LC608
	.align	3
.LC611:
	.xword	.LC610
	.align	3
.LC613:
	.xword	.LC612
	.align	3
.LC615:
	.xword	.LC614
	.align	3
.LC616:
	.xword	.LANCHOR2
	.align	3
.LC618:
	.xword	.LC617
	.align	3
.LC619:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FreeMvcExtMem
	.type	MVC_FreeMvcExtMem, %function
MVC_FreeMvcExtMem:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	MVC_FreeMvcExtMem, .-MVC_FreeMvcExtMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FreeMvcVuiExtMem
	.type	MVC_FreeMvcVuiExtMem, %function
MVC_FreeMvcVuiExtMem:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	MVC_FreeMvcVuiExtMem, .-MVC_FreeMvcVuiExtMem
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessSUBSPSMvcExt
	.type	MVC_ProcessSUBSPSMvcExt, %function
MVC_ProcessSUBSPSMvcExt:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2572
	ldr	x1, .LC624
	mov	x0, x20
	bl	mvc_ue_v
	cmp	w0, 1
	str	w0, [x19, 4]
	bhi	.L2515
	ldrb	w1, [x20, 10]
	cbnz	w1, .L2515
	ldr	x22, .LC628
	mov	w21, 0
	.p2align 2
.L2517:
	mov	x1, x22
	mov	x0, x20
	bl	mvc_ue_v
	add	x1, x19, x21, uxtw 2
	add	w21, w21, 1
	str	w0, [x1, 8]
	ldr	w0, [x19, 4]
	cmp	w0, w21
	bcs	.L2517
	str	wzr, [x19, 16]
	str	wzr, [x19, 24]
	cbz	w0, .L2518
	ldr	x27, .LC630
	mov	w25, 1
	ldr	x23, .LC636
	mov	w26, 15
	ldr	x24, .LC640
	.p2align 2
.L2528:
	uxtw	x22, w25
	mov	x1, x27
	mov	x0, x20
	add	x21, x19, x22, lsl 2
	bl	mvc_ue_v
	str	w0, [x21, 16]
	ldr	w1, [x19, 4]
	cmp	w1, 15
	csel	w1, w1, w26, ls
	cmp	w0, w1
	bhi	.L2519
	ldrb	w1, [x20, 10]
	cbnz	w1, .L2519
	mov	w28, 0
	cbz	w0, .L2524
	.p2align 2
.L2523:
	mov	x1, x23
	mov	x0, x20
	bl	mvc_ue_v
	add	x1, x22, x28, uxtw
	add	w28, w28, 1
	add	x1, x1, 8
	str	w0, [x19, x1, lsl 2]
	ldr	w0, [x21, 16]
	cmp	w28, w0
	bcc	.L2523
.L2524:
	ldr	x1, .LC632
	mov	x0, x20
	bl	mvc_ue_v
	str	w0, [x21, 24]
	ldr	w1, [x19, 4]
	cmp	w1, 15
	csel	w2, w1, w26, ls
	cmp	w0, w2
	bhi	.L2521
	ldrb	w2, [x20, 10]
	cbnz	w2, .L2521
	mov	w28, 0
	cbz	w0, .L2526
	.p2align 2
.L2527:
	mov	x1, x24
	mov	x0, x20
	bl	mvc_ue_v
	add	x1, x22, x28, uxtw
	add	w28, w28, 1
	add	x1, x1, 10
	str	w0, [x19, x1, lsl 2]
	ldr	w0, [x21, 24]
	cmp	w28, w0
	bcc	.L2527
	ldr	w1, [x19, 4]
.L2526:
	add	w25, w25, 1
	cmp	w1, w25
	bcs	.L2528
	str	wzr, [x19, 48]
	str	wzr, [x19, 56]
	cbz	w1, .L2542
	ldr	x27, .LC644
	mov	w25, 1
	ldr	x23, .LC650
	mov	w26, 15
	ldr	x24, .LC654
	.p2align 2
.L2541:
	uxtw	x22, w25
	mov	x1, x27
	mov	x0, x20
	add	x21, x19, x22, lsl 2
	bl	mvc_ue_v
	str	w0, [x21, 48]
	ldr	w1, [x19, 4]
	cmp	w1, 15
	csel	w1, w1, w26, ls
	cmp	w0, w1
	bhi	.L2532
	ldrb	w1, [x20, 10]
	cbnz	w1, .L2532
	mov	w28, 0
	cbz	w0, .L2537
	.p2align 2
.L2536:
	mov	x1, x23
	mov	x0, x20
	bl	mvc_ue_v
	add	x1, x22, x28, uxtw
	add	w28, w28, 1
	add	x1, x1, 16
	str	w0, [x19, x1, lsl 2]
	ldr	w0, [x21, 48]
	cmp	w28, w0
	bcc	.L2536
.L2537:
	ldr	x1, .LC646
	mov	x0, x20
	bl	mvc_ue_v
	str	w0, [x21, 56]
	ldr	w1, [x19, 4]
	cmp	w1, 15
	csel	w2, w1, w26, ls
	cmp	w0, w2
	bhi	.L2534
	ldrb	w2, [x20, 10]
	cbnz	w2, .L2534
	mov	w28, 0
	cbz	w0, .L2539
	.p2align 2
.L2540:
	mov	x1, x24
	mov	x0, x20
	bl	mvc_ue_v
	add	x1, x22, x28, uxtw
	add	w28, w28, 1
	add	x1, x1, 18
	str	w0, [x19, x1, lsl 2]
	ldr	w0, [x21, 56]
	cmp	w28, w0
	bcc	.L2540
	ldr	w1, [x19, 4]
.L2539:
	add	w25, w25, 1
	cmp	w25, w1
	bls	.L2541
.L2542:
	ldr	x1, .LC642
	mov	x0, x20
	bl	mvc_ue_v
	add	w1, w0, 1
	cmp	w1, 16
	str	w0, [x19, 80]
	str	w1, [x29, 140]
	bhi	.L2530
	ldrb	w0, [x20, 10]
	cbnz	w0, .L2530
	ldr	w0, [x29, 140]
	cbz	w0, .L2547
	add	x0, x19, 8192
	ldr	x22, .LC672
	add	x1, x19, 84
	add	x0, x0, 212
	stp	x1, x19, [x29, 120]
	stp	xzr, x0, [x29, 104]
	str	wzr, [x29, 144]
.L2546:
	ldr	x2, .LC658
	mov	w1, 8
	mov	x0, x20
	bl	mvc_u_v
	ldr	x21, [x29, 120]
	ldr	x1, .LC660
	str	w0, [x21]
	mov	x0, x20
	bl	mvc_ue_v
	add	w27, w0, 1
	cmp	w27, 64
	str	w0, [x21, 64]
	bhi	.L2544
	ldrb	w0, [x20, 10]
	cbnz	w0, .L2544
	cbz	w27, .L2555
	ldp	x26, x25, [x29, 104]
	ldr	x23, [x29, 128]
	mov	w24, 0
.L2545:
	ldr	x2, .LC664
	mov	w1, 3
	mov	x0, x20
	bl	mvc_u_v
	str	w0, [x23, 212]
	ldr	x1, .LC666
	mov	x0, x20
	bl	mvc_ue_v
	add	w2, w0, 1
	cmp	w2, 64
	str	w0, [x23, 4308]
	bhi	.L2548
	ldrb	w1, [x20, 10]
	cbnz	w1, .L2548
	cbz	w2, .L2553
	add	x21, x26, x0, uxtw
	mov	x28, x25
	add	x21, x21, 2102
	add	x21, x19, x21, lsl 2
	.p2align 2
.L2552:
	mov	x1, x22
	mov	x0, x20
	bl	mvc_ue_v
	str	w0, [x28], 4
	cmp	x28, x21
	bne	.L2552
.L2553:
	ldr	x1, .LC668
	mov	x0, x20
	bl	mvc_ue_v
	cmp	w0, 1023
	add	x1, x23, 270336
	str	w0, [x1, 212]
	bhi	.L2550
	ldrb	w1, [x20, 10]
	cbnz	w1, .L2550
	add	w24, w24, 1
	add	x23, x23, 4
	cmp	w27, w24
	add	x25, x25, 256
	add	x26, x26, 64
	bne	.L2545
.L2555:
	ldr	x1, [x29, 120]
	ldr	w0, [x29, 144]
	add	x1, x1, 4
	str	x1, [x29, 120]
	ldr	w1, [x29, 140]
	add	w0, w0, 1
	str	w0, [x29, 144]
	cmp	w1, w0
	ldr	x0, [x29, 128]
	add	x0, x0, 256
	str	x0, [x29, 128]
	ldr	x0, [x29, 112]
	add	x0, x0, 16384
	str	x0, [x29, 112]
	ldr	x0, [x29, 104]
	add	x0, x0, 4096
	str	x0, [x29, 104]
	bne	.L2546
.L2547:
	mov	w0, 0
	b	.L2567
	.p2align 3
.L2519:
	ldr	x1, .LC634
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L2567:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
.L2521:
	ldr	x1, .LC638
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	ret
.L2532:
	ldr	x1, .LC648
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2567
.L2515:
	ldr	x1, .LC626
	mov	w3, 65534
	mov	w2, w0
	str	w3, [x19, 80]
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2567
.L2534:
	ldr	x1, .LC652
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2567
.L2518:
	str	wzr, [x19, 48]
	str	wzr, [x19, 56]
	b	.L2542
.L2550:
	ldr	x1, .LC674
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2567
.L2548:
	ldr	x0, [x29, 144]
	mov	w3, 65534
	ldr	x1, .LC670
	ubfiz	x28, x0, 6, 32
	mov	w0, 1
	add	x24, x28, x24, uxtw
	add	x19, x19, x24, lsl 2
	str	w3, [x19, 4308]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2567
.L2572:
	ldr	x2, .LC621
	mov	w3, 11392
	ldr	x1, .LC622
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2567
.L2530:
	mov	w0, 65534
	ldr	x1, .LC656
	ldr	w2, [x29, 140]
	str	w0, [x19, 80]
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2567
.L2544:
	ldr	x0, [x29, 144]
	mov	w3, 65534
	ldr	x1, .LC662
	mov	w2, w27
	add	x19, x19, x0, uxtw 2
	mov	w0, 1
	str	w3, [x19, 148]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2567
	.size	MVC_ProcessSUBSPSMvcExt, .-MVC_ProcessSUBSPSMvcExt
	.align	3
.LC621:
	.xword	.LC36
	.align	3
.LC622:
	.xword	.LC38
	.align	3
.LC624:
	.xword	.LC623
	.align	3
.LC626:
	.xword	.LC625
	.align	3
.LC628:
	.xword	.LC627
	.align	3
.LC630:
	.xword	.LC629
	.align	3
.LC632:
	.xword	.LC631
	.align	3
.LC634:
	.xword	.LC633
	.align	3
.LC636:
	.xword	.LC635
	.align	3
.LC638:
	.xword	.LC637
	.align	3
.LC640:
	.xword	.LC639
	.align	3
.LC642:
	.xword	.LC641
	.align	3
.LC644:
	.xword	.LC643
	.align	3
.LC646:
	.xword	.LC645
	.align	3
.LC648:
	.xword	.LC647
	.align	3
.LC650:
	.xword	.LC649
	.align	3
.LC652:
	.xword	.LC651
	.align	3
.LC654:
	.xword	.LC653
	.align	3
.LC656:
	.xword	.LC655
	.align	3
.LC658:
	.xword	.LC657
	.align	3
.LC660:
	.xword	.LC659
	.align	3
.LC662:
	.xword	.LC661
	.align	3
.LC664:
	.xword	.LC663
	.align	3
.LC666:
	.xword	.LC665
	.align	3
.LC668:
	.xword	.LC667
	.align	3
.LC670:
	.xword	.LC669
	.align	3
.LC672:
	.xword	.LC671
	.align	3
.LC674:
	.xword	.LC673
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ProcessSUBSPSMvcVuiExt
	.type	MVC_ProcessSUBSPSMvcVuiExt, %function
MVC_ProcessSUBSPSMvcVuiExt:
	stp	x29, x30, [sp, -208]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	mov	x26, x1
	bl	_mcount
	add	x0, x26, 278528
	ldr	x1, .LC676
	mov	x20, x0
	mov	x0, x19
	str	x20, [x29, 112]
	bl	mvc_ue_v
	cmp	w0, 1023
	str	w0, [x20, 560]
	bhi	.L2605
	ldr	x2, [x29, 112]
	uxtw	x0, w0
	add	x0, x0, 1
	add	x1, x26, 294912
	str	x0, [x29, 128]
	add	x0, x2, 432
	ldr	x25, .LC686
	add	x24, x1, 1368
	str	x0, [x29, 184]
	add	x0, x2, 820
	str	x26, [x29, 152]
	stp	x26, x26, [x29, 168]
	str	xzr, [x29, 192]
	str	x0, [x29, 160]
	.p2align 2
.L2591:
	ldr	x3, [x29, 168]
	mov	w1, 3
	ldr	x2, .LC680
	mov	x0, x19
	add	x22, x3, 278528
	ldr	w3, [x29, 192]
	str	w3, [x29, 148]
	bl	mvc_u_v
	strb	w0, [x22, 112]
	ldr	x1, .LC682
	mov	x0, x19
	bl	mvc_ue_v
	cmn	w0, #1
	ldr	x1, [x29, 176]
	add	x1, x1, 278528
	str	w0, [x1, 564]
	beq	.L2581
	uxtw	x20, w0
	ldr	x0, [x29, 192]
	ldr	x21, [x29, 160]
	add	x20, x20, x0, lsl 6
	add	x20, x20, 69632
	add	x20, x20, 206
	add	x20, x26, x20, lsl 2
	.p2align 2
.L2580:
	mov	x1, x25
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x21], 4
	cmp	x21, x20
	bne	.L2580
.L2581:
	ldr	x1, .LC684
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x22, 368]
	cbnz	w0, .L2606
.L2579:
	ldr	x1, .LC694
	mov	x0, x19
	bl	mvc_u_1
	uxtb	w0, w0
	ldr	x1, [x29, 184]
	strb	w0, [x1]
	cbz	w0, .L2582
	ldr	x1, .LC696
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x24]
	ldr	x2, .LC698
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	ldr	x1, [x29, 152]
	ldr	x2, .LC700
	add	x1, x1, 294912
	mov	x20, x1
	str	x20, [x29, 136]
	strb	w0, [x1, 1364]
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 1365]
	ldr	w0, [x24]
	cmp	w0, 31
	bhi	.L2584
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2584
	ldr	x0, [x29, 192]
	mov	w28, 0
	ldr	w23, [x29, 148]
	and	x27, x0, 4294967295
	ldr	x21, .LC705
	lsl	x0, x27, 3
	lsl	x1, x23, 3
	sub	x0, x0, x27
	sub	x1, x1, x23
	lsl	x0, x0, 1
	lsl	x1, x1, 1
	sub	x0, x0, x27
	sub	x1, x1, x23
	lsl	x27, x0, 2
	lsl	x23, x1, 2
	sub	x27, x27, x0
	sub	x1, x23, x1
	lsl	x0, x27, 1
	str	x0, [x29, 200]
	ldr	x0, [x29, 112]
	mov	x27, x24
	ldr	x20, .LC707
	add	x23, x0, 112
	str	x22, [x29, 120]
	add	x0, x23, x1, lsl 3
	mov	w22, w28
	mov	x28, x0
	.p2align 2
.L2585:
	ldr	x1, .LC703
	mov	x0, x19
	uxtw	x23, w22
	add	w22, w22, 1
	bl	mvc_ue_v
	ldr	x1, [x29, 200]
	add	x1, x1, x23
	add	x23, x28, x23
	add	x23, x23, 16384
	add	x1, x26, x1, lsl 2
	add	x24, x1, 294912
	mov	x1, x21
	str	w0, [x24, 1372]
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x24, 1500]
	mov	x1, x20
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x23, 1220]
	ldr	w0, [x27]
	cmp	w0, w22
	bcs	.L2585
	ldr	x2, .LC709
	mov	w1, 5
	mov	x0, x19
	ldr	x22, [x29, 120]
	mov	x24, x27
	bl	mvc_u_v
	ldr	x20, [x29, 136]
	ldr	x2, .LC711
	mov	w1, 5
	str	w0, [x20, 1628]
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1632]
	ldr	x2, .LC713
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1636]
	ldr	x2, .LC715
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1640]
.L2582:
	ldr	x1, .LC717
	add	x2, x22, 496
	mov	x0, x19
	str	x2, [x29, 136]
	bl	mvc_u_1
	uxtb	w0, w0
	strb	w0, [x22, 496]
	cbnz	w0, .L2607
	ldr	x0, [x29, 184]
	ldrb	w0, [x0]
	cbz	w0, .L2589
.L2590:
	ldr	x1, .LC719
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x22, 176]
.L2589:
	ldr	x2, [x29, 192]
	mov	x0, x19
	ldr	x1, .LC721
	add	x24, x24, 312
	add	x2, x2, 1
	mov	x20, x2
	ldr	x2, [x29, 168]
	str	x20, [x29, 192]
	add	x2, x2, 1
	str	x2, [x29, 168]
	ldr	x2, [x29, 176]
	add	x2, x2, 4
	str	x2, [x29, 176]
	ldr	x2, [x29, 152]
	add	x2, x2, 312
	str	x2, [x29, 152]
	bl	mvc_u_1
	strb	w0, [x22, 304]
	ldr	w1, [x29, 148]
	ldr	x0, [x29, 128]
	add	w1, w1, 1
	cmp	w1, 63
	ccmp	x0, x20, 0, ls
	ldr	x0, [x29, 184]
	add	x0, x0, 1
	str	x0, [x29, 184]
	ldr	x0, [x29, 160]
	add	x0, x0, 256
	str	x0, [x29, 160]
	bhi	.L2591
	mov	w0, 0
.L2601:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
	.p2align 3
.L2606:
	ldr	x0, [x29, 176]
	mov	w1, 32
	ldr	x2, .LC688
	add	x20, x0, 294912
	mov	x0, x19
	bl	mvc_u_v
	ldr	x2, .LC690
	mov	w1, 32
	str	w0, [x20, 820]
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1076]
	ldr	x1, .LC692
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x22, 240]
	b	.L2579
	.p2align 3
.L2607:
	ldr	x1, .LC696
	mov	x0, x19
	bl	mvc_ue_v
	ldr	x1, [x29, 152]
	ldr	x2, .LC698
	add	x1, x1, 315392
	mov	x20, x1
	str	x20, [x29, 120]
	add	x28, x20, 856
	str	w0, [x1, 856]
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 852]
	ldr	x2, .LC700
	mov	w1, 4
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 853]
	ldr	w0, [x20, 856]
	cmp	w0, 31
	bhi	.L2584
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2584
	ldr	x0, [x29, 192]
	ldr	w23, [x29, 148]
	and	x27, x0, 4294967295
	ldr	x21, .LC705
	lsl	x0, x27, 3
	lsl	x1, x23, 3
	sub	x0, x0, x27
	sub	x1, x1, x23
	lsl	x0, x0, 1
	lsl	x1, x1, 1
	sub	x0, x0, x27
	sub	x1, x1, x23
	lsl	x27, x0, 2
	lsl	x23, x1, 2
	sub	x27, x27, x0
	sub	x1, x23, x1
	lsl	x0, x27, 1
	str	x0, [x29, 200]
	ldr	x0, [x29, 112]
	ldr	x20, .LC707
	add	x23, x0, 112
	add	x0, x23, x1, lsl 3
	mov	w23, 0
	stp	x22, x24, [x29, 96]
	mov	x24, x28
	mov	w22, w23
	mov	x28, x0
	.p2align 2
.L2587:
	ldr	x1, .LC703
	mov	x0, x19
	uxtw	x27, w22
	add	w22, w22, 1
	bl	mvc_ue_v
	ldr	x1, [x29, 200]
	add	x2, x1, x27
	mov	x1, x21
	add	x27, x28, x27
	add	x2, x26, x2, lsl 2
	add	x27, x27, 36864
	add	x23, x2, 315392
	str	w0, [x23, 860]
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x23, 988]
	mov	x1, x20
	mov	x0, x19
	bl	mvc_u_1
	strb	w0, [x27, 708]
	ldr	w0, [x24]
	cmp	w0, w22
	bcs	.L2587
	ldr	x2, .LC709
	mov	w1, 5
	mov	x0, x19
	ldp	x22, x24, [x29, 96]
	bl	mvc_u_v
	ldr	x20, [x29, 120]
	ldr	x2, .LC711
	mov	w1, 5
	str	w0, [x20, 1116]
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1120]
	ldr	x2, .LC713
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1124]
	ldr	x2, .LC715
	mov	w1, 5
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 1128]
	ldr	x0, [x29, 184]
	ldrb	w0, [x0]
	cbnz	w0, .L2590
	ldr	x0, [x29, 136]
	ldrb	w0, [x0]
	cbnz	w0, .L2590
	b	.L2589
	.p2align 3
.L2584:
	ldr	x1, .LC701
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 208
	ret
.L2605:
	ldr	x1, .LC678
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2601
	.size	MVC_ProcessSUBSPSMvcVuiExt, .-MVC_ProcessSUBSPSMvcVuiExt
	.align	3
.LC676:
	.xword	.LC675
	.align	3
.LC678:
	.xword	.LC677
	.align	3
.LC680:
	.xword	.LC679
	.align	3
.LC682:
	.xword	.LC681
	.align	3
.LC684:
	.xword	.LC683
	.align	3
.LC686:
	.xword	.LC685
	.align	3
.LC688:
	.xword	.LC687
	.align	3
.LC690:
	.xword	.LC689
	.align	3
.LC692:
	.xword	.LC691
	.align	3
.LC694:
	.xword	.LC693
	.align	3
.LC696:
	.xword	.LC695
	.align	3
.LC698:
	.xword	.LC697
	.align	3
.LC700:
	.xword	.LC699
	.align	3
.LC701:
	.xword	.LC451
	.align	3
.LC703:
	.xword	.LC702
	.align	3
.LC705:
	.xword	.LC704
	.align	3
.LC707:
	.xword	.LC706
	.align	3
.LC709:
	.xword	.LC708
	.align	3
.LC711:
	.xword	.LC710
	.align	3
.LC713:
	.xword	.LC712
	.align	3
.LC715:
	.xword	.LC714
	.align	3
.LC717:
	.xword	.LC716
	.align	3
.LC719:
	.xword	.LC718
	.align	3
.LC721:
	.xword	.LC720
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecSubSPS
	.type	MVC_DecSubSPS, %function
MVC_DecSubSPS:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x2, .LC723
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	mov	w20, w0
	ldr	x1, .LC725
	mov	x0, x19
	bl	mvc_u_1
	mov	w27, w0
	ldr	x1, .LC727
	mov	x0, x19
	bl	mvc_u_1
	mov	w26, w0
	ldr	x1, .LC729
	mov	x0, x19
	bl	mvc_u_1
	mov	w25, w0
	ldr	x1, .LC731
	mov	x0, x19
	bl	mvc_u_1
	str	w0, [x29, 120]
	ldr	x1, .LC733
	mov	x0, x19
	bl	mvc_u_1
	str	w0, [x29, 116]
	ldr	x1, .LC735
	mov	x0, x19
	bl	mvc_u_1
	mov	w22, w0
	ldr	x2, .LC737
	mov	w1, 2
	mov	x0, x19
	bl	mvc_u_v
	ldr	x2, .LC739
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	mov	w21, w0
	ldr	x1, .LC741
	mov	x0, x19
	bl	mvc_ue_v
	mov	w4, w0
	ldrb	w0, [x19, 10]
	cbnz	w0, .L2621
	cmp	w4, 31
	bhi	.L2631
	sub	w0, w20, #66
	cmp	w0, 78
	bls	.L2632
.L2611:
	ldr	x1, .LC748
	mov	w2, w20
	mov	w0, 1
	mov	w21, -1
	bl	dprint_vfmw
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2632:
	ldr	x1, .LC743
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2613
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2613:
	.section	.rodata
	.align	0
	.align	2
.L2613:
	.byte	(.L2612 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2614 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2615 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2614 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2616 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2614 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2616 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2614 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2611 - .Lrtx2613) / 4
	.byte	(.L2616 - .Lrtx2613) / 4
	.text
	.p2align 3
.L2612:
	ldr	x1, .LC744
	mov	w0, 1
	str	w4, [x29, 104]
	bl	dprint_vfmw
	ldr	w4, [x29, 104]
.L2614:
	cmp	w21, 41
	bhi	.L2633
.L2617:
	uxtw	x23, w4
	mov	x0, x19
	lsl	x1, x23, 3
	sub	x1, x1, x23
	lsl	x1, x1, 2
	sub	x1, x1, x23
	lsl	x1, x1, 4
	sub	x1, x1, x23
	lsl	x2, x1, 2
	sub	x1, x2, x1
	lsl	x2, x1, 6
	add	x2, x1, x2
	lsl	x24, x2, 2
	ldrb	w2, [x29, 120]
	add	x5, x19, x24
	add	x1, x24, 286720
	add	x28, x5, 286720
	add	x1, x19, x1
	add	x1, x1, 2612
	str	x5, [x29, 104]
	strb	w2, [x28, 2615]
	ldrb	w2, [x29, 116]
	str	w21, [x28, 3352]
	strb	w27, [x28, 2612]
	strb	w26, [x28, 2613]
	strb	w25, [x28, 2614]
	strb	w2, [x28, 2616]
	strb	w22, [x28, 2617]
	str	w20, [x28, 3348]
	str	w4, [x28, 3356]
	bl	MVC_ProcessSPS
	mov	w21, w0
	ldr	x5, [x29, 104]
	cbnz	w0, .L2634
	mov	w1, 128
	cmp	w20, 118
	mov	w0, 1
	ccmp	w20, w1, 4, ne
	strb	w0, [x28, 2637]
	beq	.L2635
.L2619:
	lsl	x0, x23, 3
	mov	w2, 1
	sub	x0, x0, x23
	lsl	x0, x0, 2
	sub	x0, x0, x23
	lsl	x0, x0, 4
	sub	x0, x0, x23
	lsl	x1, x0, 2
	sub	x0, x1, x0
	lsl	x1, x0, 6
	add	x0, x0, x1
	add	x19, x19, x0, lsl 2
	add	x19, x19, 12288
	strb	w2, [x19, 2396]
.L2609:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2633:
	ldr	x1, .LC750
	mov	w2, w21
	mov	w0, 1
	str	w4, [x29, 104]
	mov	w21, 41
	bl	dprint_vfmw
	ldr	w4, [x29, 104]
	b	.L2617
	.p2align 3
.L2635:
	ldr	x1, .LC754
	add	x22, x5, 12288
	mov	x0, x19
	add	x20, x24, 12288
	add	x20, x19, x20
	bl	mvc_u_1
	add	x20, x20, 2396
	strb	w0, [x22, 2397]
	mov	x1, x20
	mov	x0, x19
	bl	MVC_ProcessSUBSPSMvcExt
	cbnz	w0, .L2636
	ldr	x1, .LC758
	mov	x0, x19
	bl	mvc_u_1
	str	w0, [x28, 2608]
	cbz	w0, .L2619
	mov	x1, x20
	mov	x0, x19
	bl	MVC_ProcessSUBSPSMvcVuiExt
	cbz	w0, .L2619
	ldr	x1, .LC760
	mov	w0, 1
	mov	w21, -1
	bl	dprint_vfmw
	strb	wzr, [x22, 2396]
	b	.L2609
	.p2align 3
.L2616:
	ldr	x1, .LC746
	mov	w0, 1
	str	w4, [x29, 104]
	bl	dprint_vfmw
	ldr	w4, [x29, 104]
	b	.L2614
	.p2align 3
.L2615:
	ldr	x1, .LC745
	mov	w0, 1
	str	w4, [x29, 104]
	bl	dprint_vfmw
	ldr	w4, [x29, 104]
	b	.L2614
	.p2align 3
.L2621:
	mov	w21, -1
	b	.L2609
	.p2align 3
.L2631:
	ldr	x1, .LC742
	mov	w0, 1
	mov	w21, -1
	bl	dprint_vfmw
	b	.L2609
	.p2align 3
.L2634:
	ldr	x1, .LC752
	mov	w0, 1
	str	x5, [x29, 120]
	mov	w21, -1
	bl	dprint_vfmw
	ldr	x5, [x29, 120]
	add	x5, x5, 12288
	strb	wzr, [x5, 2396]
	strb	wzr, [x28, 2637]
	b	.L2609
.L2636:
	ldr	x1, .LC756
	mov	w0, 1
	mov	w21, -1
	bl	dprint_vfmw
	strb	wzr, [x22, 2396]
	b	.L2609
	.size	MVC_DecSubSPS, .-MVC_DecSubSPS
	.align	3
.LC723:
	.xword	.LC722
	.align	3
.LC725:
	.xword	.LC724
	.align	3
.LC727:
	.xword	.LC726
	.align	3
.LC729:
	.xword	.LC728
	.align	3
.LC731:
	.xword	.LC730
	.align	3
.LC733:
	.xword	.LC732
	.align	3
.LC735:
	.xword	.LC734
	.align	3
.LC737:
	.xword	.LC736
	.align	3
.LC739:
	.xword	.LC738
	.align	3
.LC741:
	.xword	.LC740
	.align	3
.LC742:
	.xword	.LC397
	.align	3
.LC743:
	.xword	.L2613
	.align	3
.LC744:
	.xword	.LC606
	.align	3
.LC745:
	.xword	.LC608
	.align	3
.LC746:
	.xword	.LC610
	.align	3
.LC748:
	.xword	.LC747
	.align	3
.LC750:
	.xword	.LC749
	.align	3
.LC752:
	.xword	.LC751
	.align	3
.LC754:
	.xword	.LC753
	.align	3
.LC756:
	.xword	.LC755
	.align	3
.LC758:
	.xword	.LC757
	.align	3
.LC760:
	.xword	.LC759
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_PassBytes
	.type	MVC_PassBytes, %function
MVC_PassBytes:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x0, [x20, 240]
	cmp	w19, wzr
	ccmp	x0, xzr, 4, ne
	beq	.L2646
	ldrb	w2, [x0]
	sbfiz	x1, x2, 5, 32
	add	x1, x0, x1
	ldr	x1, [x1, 8]
	cbz	x1, .L2646
	ldr	w1, [x0, 76]
	cmp	w2, 1
	ccmp	w1, 2, 2, ls
	bhi	.L2646
	cmp	w1, w2
	bls	.L2646
	uxtw	x5, w2
	add	x3, x0, x5, lsl 5
	ldr	w1, [x3, 28]
	ldr	w3, [x3, 16]
	add	w1, w1, w19, lsl 3
	lsl	w3, w3, 3
	cmp	w1, w3
	bhi	.L2641
	b	.L2639
	.p2align 3
.L2642:
	ldr	w4, [x6, 28]
	ldr	w6, [x6, 16]
	sub	w4, w4, w3
	add	w1, w1, w4
	lsl	w3, w6, 3
	cmp	w1, w3
	bls	.L2639
.L2641:
	add	x0, x0, x5, lsl 5
	add	w5, w2, 1
	mov	x2, x5
	str	w3, [x0, 28]
	ldr	x0, [x20, 240]
	ldrb	w4, [x0]
	add	w4, w4, 1
	strb	w4, [x0]
	ldr	x0, [x20, 240]
	add	x6, x0, x5, lsl 5
	ldr	w4, [x0, 76]
	cmp	w4, w5
	bhi	.L2642
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2639:
	add	x5, x0, x5, lsl 5
	mov	w0, 1
	str	w1, [x5, 28]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2646:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_PassBytes, .-MVC_PassBytes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_GetBytes
	.type	MVC_GetBytes, %function
MVC_GetBytes:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x19, x1
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	cbz	x19, .L2662
	ldr	x1, [x21, 240]
	cmp	x1, xzr
	ccmp	w20, wzr, 4, ne
	beq	.L2662
	ldrb	w2, [x1]
	sbfiz	x0, x2, 5, 32
	add	x0, x1, x0
	ldr	x0, [x0, 8]
	cbz	x0, .L2662
	ldr	w0, [x1, 76]
	cmp	w2, 1
	ccmp	w0, 2, 2, ls
	bhi	.L2662
	cmp	w0, w2
	bls	.L2662
	mov	w6, 0
.L2657:
	ubfiz	x7, x2, 5, 32
	add	x3, x1, x7
	ldr	w0, [x3, 28]
	ldr	x4, [x3, 8]
	ldr	w8, [x3, 16]
	add	w0, w0, 7
	ubfx	x0, x0, 3, 29
	add	x8, x4, x8
	add	x5, x4, x0
	cmp	x5, x8
	bcs	.L2652
	ldrb	w0, [x4, x0]
	add	w6, w6, 1
	strb	w0, [x19]
	cmp	w20, w6
	add	x19, x19, 1
	add	x5, x5, 1
	ldr	x0, [x21, 240]
	add	x0, x0, x7
	ldr	w3, [x0, 28]
	add	w3, w3, 8
	str	w3, [x0, 28]
	bhi	.L2655
	b	.L2654
	.p2align 3
.L2656:
	ldrb	w1, [x5], 1
	add	w6, w6, 1
	strb	w1, [x19], 1
	cmp	w20, w6
	ldr	x3, [x21, 240]
	add	x3, x3, x7
	ldr	w4, [x3, 28]
	add	w4, w4, 8
	str	w4, [x3, 28]
	bls	.L2654
.L2655:
	cmp	x8, x5
	bne	.L2656
	ldr	x1, [x21, 240]
.L2652:
	ldrb	w0, [x1]
	add	w2, w2, 1
	add	w0, w0, 1
	strb	w0, [x1]
	ldr	x1, [x21, 240]
	ldr	w0, [x1, 76]
	cmp	w0, w2
	bhi	.L2657
	mov	w0, w6
	b	.L2651
	.p2align 3
.L2654:
	mov	w0, w20
.L2651:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2662:
	mov	w0, -1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_GetBytes, .-MVC_GetBytes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecFramePackingSEI
	.type	MVC_DecFramePackingSEI, %function
MVC_DecFramePackingSEI:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11124736
	bl	_mcount
	add	x20, x21, 488
	ldr	x1, .LC762
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x20, 24]
	ldr	x2, .LC764
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	sxtb	w0, w0
	strb	w0, [x20, 1]
	cbz	w0, .L2670
.L2665:
	ldr	x2, .LC796
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x21, 490]
	mov	w1, 1
	strb	w1, [x21, 488]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2670:
	ldr	x2, .LC766
	mov	w1, 7
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 16]
	ldr	x2, .LC768
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 3]
	ldr	x2, .LC770
	mov	w1, 6
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x20, 20]
	ldr	x2, .LC772
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 4]
	ldr	x2, .LC774
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 5]
	ldr	x2, .LC776
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 6]
	ldr	x2, .LC778
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 7]
	ldr	x2, .LC780
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 8]
	ldr	x2, .LC782
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 9]
	ldrsb	w1, [x20, 3]
	cbnz	w1, .L2666
	ldr	w0, [x20, 16]
	cmp	w0, 5
	beq	.L2666
	ldr	x2, .LC784
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 10]
	ldr	x2, .LC786
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 11]
	ldr	x2, .LC788
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 12]
	ldr	x2, .LC790
	mov	w1, 1
	mov	x0, x19
	bl	mvc_u_v
	strb	w0, [x20, 13]
.L2666:
	ldr	x2, .LC792
	mov	w1, 8
	mov	x0, x19
	bl	mvc_u_v
	str	w0, [x21, 516]
	ldr	x1, .LC794
	mov	x0, x19
	bl	mvc_ue_v
	str	w0, [x21, 520]
	b	.L2665
	.size	MVC_DecFramePackingSEI, .-MVC_DecFramePackingSEI
	.align	3
.LC762:
	.xword	.LC761
	.align	3
.LC764:
	.xword	.LC763
	.align	3
.LC766:
	.xword	.LC765
	.align	3
.LC768:
	.xword	.LC767
	.align	3
.LC770:
	.xword	.LC769
	.align	3
.LC772:
	.xword	.LC771
	.align	3
.LC774:
	.xword	.LC773
	.align	3
.LC776:
	.xword	.LC775
	.align	3
.LC778:
	.xword	.LC777
	.align	3
.LC780:
	.xword	.LC779
	.align	3
.LC782:
	.xword	.LC781
	.align	3
.LC784:
	.xword	.LC783
	.align	3
.LC786:
	.xword	.LC785
	.align	3
.LC788:
	.xword	.LC787
	.align	3
.LC790:
	.xword	.LC789
	.align	3
.LC792:
	.xword	.LC791
	.align	3
.LC794:
	.xword	.LC793
	.align	3
.LC796:
	.xword	.LC795
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecPicTimingSEI
	.type	MVC_DecPicTimingSEI, %function
MVC_DecPicTimingSEI:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 3992
	bl	_mcount
	add	x0, x20, 11112448
	ldr	x3, [x20, 272]
	ldr	w0, [x0, 440]
	umull	x19, w0, w19
	add	x19, x3, x19
	ldrb	w0, [x19, 25]
	cbnz	w0, .L2672
	ldr	w0, [x20, 36]
	cmp	w0, wzr
	ble	.L2673
	ldrb	w1, [x3, 25]
	cbnz	w1, .L2691
	sub	w1, w0, #1
	add	x0, x3, 3992
	add	x1, x1, 1
	lsl	x2, x1, 6
	sub	x2, x2, x1
	lsl	x2, x2, 1
	sub	x2, x2, x1
	lsl	x2, x2, 2
	sub	x1, x2, x1
	add	x1, x3, x1, lsl 3
	b	.L2676
	.p2align 3
.L2677:
	ldrb	w2, [x2]
	cbnz	w2, .L2674
.L2676:
	cmp	x0, x1
	mov	x19, x0
	add	x0, x0, 3992
	sub	x2, x0, #3967
	bne	.L2677
.L2673:
	ldr	x1, .LC798
	mov	w0, 1
	mov	w19, -1
	bl	dprint_vfmw
.L2678:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2691:
	mov	x19, x3
	.p2align 2
.L2674:
	cbz	x19, .L2673
.L2672:
	ldrb	w0, [x19, 24]
	cbz	w0, .L2679
	ldrb	w0, [x19, 35]
	cbz	w0, .L2692
	ldr	w1, [x19, 388]
	ldr	w22, [x19, 392]
	add	w1, w1, 1
	add	w22, w22, 1
.L2682:
	ldr	x2, .LC800
	mov	x0, x20
	add	x21, x20, 11124736
	bl	mvc_u_v
	ldr	x2, .LC802
	mov	w1, w22
	str	w0, [x21, 528]
	mov	x0, x20
	bl	mvc_u_v
	str	w0, [x21, 532]
.L2679:
	ldrb	w0, [x19, 39]
	mov	w19, 0
	cbz	w0, .L2678
	ldr	x2, .LC804
	mov	x0, x20
	add	x20, x20, 11124736
	mov	w1, 4
	bl	mvc_u_v
	strb	w0, [x20, 524]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2692:
	ldrb	w0, [x19, 38]
	cbz	w0, .L2679
	ldr	w1, [x19, 700]
	ldr	w22, [x19, 704]
	add	w1, w1, 1
	add	w22, w22, 1
	b	.L2682
	.size	MVC_DecPicTimingSEI, .-MVC_DecPicTimingSEI
	.align	3
.LC798:
	.xword	.LC797
	.align	3
.LC800:
	.xword	.LC799
	.align	3
.LC802:
	.xword	.LC801
	.align	3
.LC804:
	.xword	.LC803
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecSEI
	.type	MVC_DecSEI, %function
MVC_DecSEI:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x26, x0
	mov	x0, x30
	add	x21, x29, 128
	mov	w23, 0
	bl	_mcount
	add	x20, x26, 872
	ldr	x0, [x26, 240]
	mov	w1, 32
	strb	wzr, [x21, -1]!
	str	w1, [x0, 28]
	b	.L2696
	.p2align 3
.L2855:
	mov	w1, 8
	mov	x0, x20
	bl	BsSkip
	cmp	w19, wzr
	ble	.L2695
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2854
.L2696:
	mov	w2, 1
	mov	x1, x21
	mov	x0, x26
	bl	MVC_GetBytes
	mov	w19, w0
	ldr	w2, [x26, 896]
	ldr	w0, [x26, 904]
	ldrb	w1, [x29, 127]
	add	w0, w0, 8
	cmp	w0, w2, lsl 3
	add	w23, w23, w1
	bls	.L2855
.L2695:
	ldr	x1, .LC806
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2698
	.p2align 3
.L2854:
	ldr	x25, .LC812
	mov	w24, 0
	ldr	x22, .LC809
	add	x0, x25, 240
	str	x0, [x29, 104]
	.p2align 2
.L2832:
	mov	w19, 0
	b	.L2702
	.p2align 3
.L2857:
	mov	w1, 8
	mov	x0, x20
	bl	BsSkip
	cmp	w28, wzr
	ble	.L2700
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2856
.L2702:
	mov	w2, 1
	mov	x1, x21
	mov	x0, x26
	bl	MVC_GetBytes
	mov	w28, w0
	ldr	w2, [x26, 896]
	ldr	w0, [x26, 904]
	ldrb	w1, [x29, 127]
	add	w0, w0, 8
	cmp	w0, w2, lsl 3
	add	w19, w19, w1
	bls	.L2857
.L2700:
	ldr	x1, .LC808
	mov	w0, 1
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
.L2856:
	cmp	w19, 409600
	bgt	.L2700
	ldr	x0, [x26, 240]
	ldr	w1, [x0, 76]
	ldr	w2, [x0, 28]
	cmp	w1, 2
	beq	.L2858
.L2704:
	cmp	w23, 45
	bls	.L2859
.L2705:
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2860
.L2824:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2825
	.p2align 3
.L2826:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2825:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2826
	.p2align 2
.L2731:
	ldr	w0, [x26, 60]
	cmp	w0, 3
	bhi	.L2861
.L2827:
	mov	w23, 0
	b	.L2831
	.p2align 3
.L2829:
	mov	w1, 8
	mov	x0, x20
	bl	BsSkip
	cmp	w19, wzr
	ble	.L2830
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2862
.L2831:
	mov	w2, 1
	mov	x1, x21
	mov	x0, x26
	bl	MVC_GetBytes
	mov	w19, w0
	ldr	w2, [x26, 896]
	ldr	w0, [x26, 904]
	ldrb	w1, [x29, 127]
	add	w0, w0, 8
	cmp	w0, w2, lsl 3
	add	w23, w23, w1
	bls	.L2829
.L2830:
	mov	w0, 0
.L2698:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2862:
	cmp	w0, 128
	bne	.L2832
	b	.L2830
	.p2align 3
.L2859:
	ldrh	w0, [x22,w23,uxtw #1]
	adr	x1, .Lrtx2707
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx2707:
	.section	.rodata
	.align	0
	.align	2
.L2707:
	.2byte	(.L2706 - .Lrtx2707) / 4
	.2byte	(.L2708 - .Lrtx2707) / 4
	.2byte	(.L2709 - .Lrtx2707) / 4
	.2byte	(.L2710 - .Lrtx2707) / 4
	.2byte	(.L2711 - .Lrtx2707) / 4
	.2byte	(.L2712 - .Lrtx2707) / 4
	.2byte	(.L2713 - .Lrtx2707) / 4
	.2byte	(.L2714 - .Lrtx2707) / 4
	.2byte	(.L2715 - .Lrtx2707) / 4
	.2byte	(.L2716 - .Lrtx2707) / 4
	.2byte	(.L2717 - .Lrtx2707) / 4
	.2byte	(.L2718 - .Lrtx2707) / 4
	.2byte	(.L2719 - .Lrtx2707) / 4
	.2byte	(.L2720 - .Lrtx2707) / 4
	.2byte	(.L2721 - .Lrtx2707) / 4
	.2byte	(.L2722 - .Lrtx2707) / 4
	.2byte	(.L2723 - .Lrtx2707) / 4
	.2byte	(.L2724 - .Lrtx2707) / 4
	.2byte	(.L2725 - .Lrtx2707) / 4
	.2byte	(.L2726 - .Lrtx2707) / 4
	.2byte	(.L2727 - .Lrtx2707) / 4
	.2byte	(.L2728 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2705 - .Lrtx2707) / 4
	.2byte	(.L2729 - .Lrtx2707) / 4
	.text
.L2729:
	mov	w1, w19
	mov	x0, x26
	ldr	w28, [x26, 904]
	bl	MVC_DecFramePackingSEI
	ldr	w3, [x26, 904]
	sub	w0, w3, w28
	lsl	w28, w19, 3
	cmp	w0, w28
	bge	.L2818
	sub	w28, w28, w0
	ldr	w0, [x26, 896]
	cmp	w28, wzr
	add	w23, w28, 7
	csel	w23, w23, w28, lt
	lsl	w0, w0, 3
	asr	w23, w23, 3
	cmp	w23, wzr
	ble	.L2820
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2820
	mov	w27, 0
	b	.L2821
	.p2align 3
.L2822:
	ldr	w0, [x26, 896]
	ldr	w3, [x26, 904]
	lsl	w0, w0, 3
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2820
.L2821:
	mov	w1, 8
	mov	x0, x20
	add	w27, w27, 1
	bl	BsSkip
	cmp	w27, w23
	bne	.L2822
	ldr	w0, [x26, 896]
	ldr	w3, [x26, 904]
	lsl	w0, w0, 3
.L2820:
	asr	w1, w28, 31
	lsr	w2, w1, 29
	add	w1, w28, w2
	and	w1, w1, 7
	sub	w1, w1, w2
	add	w3, w1, w3
	cmp	w3, w0
	bls	.L2863
.L2818:
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbz	w0, #31, .L2731
	ldr	x1, .LC814
	mov	w3, 12870
	ldr	x2, .LC868
	mov	w0, 20
	bl	dprint_vfmw
	b	.L2731
.L2728:
	ldr	x1, .LC865
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2864
.L2814:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2815
	.p2align 3
.L2816:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2815:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2816
	ldr	w0, [x26, 60]
	cmp	w0, 3
	bls	.L2827
.L2861:
	ldr	x1, .LC867
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
.L2727:
	ldr	x1, .LC863
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2865
.L2811:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2812
	.p2align 3
.L2813:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2812:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2813
	b	.L2731
.L2726:
	ldr	x1, .LC861
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2866
.L2808:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2809
	.p2align 3
.L2810:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2809:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2810
	b	.L2731
.L2725:
	ldr	x1, .LC859
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2867
.L2805:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2806
	.p2align 3
.L2807:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2806:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2807
	b	.L2731
.L2724:
	ldr	x1, .LC857
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2868
.L2802:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2803
	.p2align 3
.L2804:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2803:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2804
	b	.L2731
.L2723:
	ldr	x1, .LC855
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2869
.L2799:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2800
	.p2align 3
.L2801:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2800:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2801
	b	.L2731
.L2722:
	ldr	x1, .LC853
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2870
.L2796:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2797
	.p2align 3
.L2798:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2797:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2798
	b	.L2731
.L2721:
	ldr	x1, .LC851
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2871
.L2793:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2794
	.p2align 3
.L2795:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2794:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2795
	b	.L2731
.L2720:
	ldr	x1, .LC849
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2872
.L2790:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2791
	.p2align 3
.L2792:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2791:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2792
	b	.L2731
.L2719:
	ldr	x1, .LC847
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2873
.L2787:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2788
	.p2align 3
.L2789:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2788:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2789
	b	.L2731
.L2718:
	ldr	x1, .LC845
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2874
.L2784:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2785
	.p2align 3
.L2786:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2785:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2786
	b	.L2731
.L2717:
	ldr	x1, .LC843
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2875
.L2781:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2782
	.p2align 3
.L2783:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2782:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2783
	b	.L2731
.L2716:
	ldr	x1, .LC841
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2876
.L2778:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2779
	.p2align 3
.L2780:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2779:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2780
	b	.L2731
.L2715:
	ldr	x1, .LC839
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2877
.L2775:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2776
	.p2align 3
.L2777:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2776:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2777
	b	.L2731
.L2714:
	ldr	x1, .LC837
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2878
.L2772:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2773
	.p2align 3
.L2774:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2773:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2774
	b	.L2731
.L2713:
	ldr	x1, .LC835
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	cmp	w19, wzr
	ble	.L2769
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2769
	mov	w23, 0
	b	.L2770
	.p2align 3
.L2771:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2769
.L2770:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2771
.L2769:
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbz	w0, #31, .L2731
	ldr	x2, .LC812
	mov	w3, 12442
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2731
.L2712:
	cbnz	w24, .L2711
	ldr	x1, .LC824
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
.L2748:
	ldr	w23, [x26, 60]
	ldr	w0, [x26, 120]
	add	x23, x26, x23, uxtw 3
	bl	GetUsd
	str	x0, [x23, 832]
	ldr	w0, [x26, 60]
	add	x0, x0, 104
	ldr	x1, [x26, x0, lsl 3]
	cbz	x1, .L2835
	ldr	x5, [x26, 240]
	cmp	w19, 1024
	mov	w7, 1024
	csel	w27, w19, w7, le
	ldrb	w3, [x5]
	ldr	w6, [x5, 76]
	cmp	w3, w6
	bcs	.L2836
	mov	w28, 0
	.p2align 2
.L2750:
	ubfiz	x2, x3, 5, 32
	add	w3, w3, 1
	add	x2, x5, x2
	cmp	w3, w6
	ldr	w0, [x2, 28]
	ldr	w2, [x2, 16]
	add	w0, w0, 7
	sub	w0, w2, w0, lsr 3
	add	w28, w28, w0
	bne	.L2750
	mov	w0, w28
.L2749:
	cmp	w27, w0
	csel	w28, w28, w27, gt
	cbnz	w24, .L2879
	mov	w23, 0
	mov	w25, 0
.L2752:
	sub	w2, w28, w23
	mov	x0, x26
	bl	MVC_GetBytes
	cmp	w0, wzr
	mov	w28, w0
	ble	.L2880
	sub	w0, w27, w25
	cmp	w28, w0
	blt	.L2881
	ldr	w0, [x26, 60]
	sub	w23, w19, w25
	cmp	w27, w19
	add	x0, x0, 104
	ldr	x0, [x26, x0, lsl 3]
	str	w23, [x0, 1052]
	bcc	.L2882
.L2763:
	cmp	w23, wzr
	ble	.L2758
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2758
	mov	w19, 0
	b	.L2765
	.p2align 3
.L2766:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2758
.L2765:
	mov	w1, 8
	mov	x0, x20
	add	w19, w19, 1
	bl	BsSkip
	cmp	w23, w19
	bne	.L2766
.L2758:
	ldr	w0, [x26, 60]
	add	x0, x0, 104
.L2852:
	ldr	x1, [x26, 224]
	ldr	x0, [x26, x0, lsl 3]
	ldr	x1, [x1, 56]
	str	x1, [x0, 1056]
	mov	w1, 8
	ldr	w0, [x26, 60]
	add	x0, x0, 104
	ldr	x0, [x26, x0, lsl 3]
	str	w1, [x0, 1040]
	ldr	x1, .LC831
	ldr	w0, [x26, 60]
	add	x0, x0, 104
	ldr	x5, [x1]
	ldr	w1, [x26, 84]
	ldr	x0, [x26, x0, lsl 3]
	str	w1, [x0, 1044]
	cbz	x5, .L2731
	ldr	w0, [x26, 60]
	mov	w3, 1064
	mov	w1, 6
	add	x0, x0, 104
	ldr	x2, [x26, x0, lsl 3]
	ldr	w0, [x26, 120]
	blr	x5
	b	.L2731
.L2710:
	ldr	x1, .LC820
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2883
.L2744:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2745
	.p2align 3
.L2746:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2745:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2746
	b	.L2731
.L2709:
	ldr	x1, .LC818
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2884
.L2741:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2742
	.p2align 3
.L2743:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2742:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2743
	b	.L2731
.L2708:
	ldr	x1, .LC816
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	ldr	w28, [x26, 904]
	mov	w1, w19
	mov	x0, x26
	bl	MVC_DecPicTimingSEI
	ldr	w3, [x26, 904]
	sub	w0, w3, w28
	lsl	w28, w19, 3
	cmp	w0, w28
	bge	.L2735
	sub	w28, w28, w0
	ldr	w0, [x26, 896]
	cmp	w28, wzr
	add	w23, w28, 7
	csel	w23, w23, w28, lt
	lsl	w0, w0, 3
	asr	w23, w23, 3
	cmp	w23, wzr
	ble	.L2737
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2737
	mov	w25, 0
	b	.L2738
	.p2align 3
.L2739:
	ldr	w0, [x26, 896]
	ldr	w3, [x26, 904]
	lsl	w0, w0, 3
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2737
.L2738:
	mov	w1, 8
	mov	x0, x20
	add	w25, w25, 1
	bl	BsSkip
	cmp	w25, w23
	bne	.L2739
	ldr	w0, [x26, 896]
	ldr	w3, [x26, 904]
	lsl	w0, w0, 3
.L2737:
	asr	w1, w28, 31
	lsr	w2, w1, 29
	add	w1, w28, w2
	and	w1, w1, 7
	sub	w1, w1, w2
	add	w3, w1, w3
	cmp	w3, w0
	bls	.L2885
.L2735:
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbz	w0, #31, .L2731
	ldr	x2, .LC812
	mov	w3, 12216
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2731
.L2706:
	ldr	x1, .LC811
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x26
	bl	MVC_PassBytes
	tbnz	w0, #31, .L2886
.L2730:
	cmp	w19, wzr
	ble	.L2731
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
	mov	w23, 0
	b	.L2732
	.p2align 3
.L2733:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2731
.L2732:
	mov	w1, 8
	mov	x0, x20
	add	w23, w23, 1
	bl	BsSkip
	cmp	w19, w23
	bne	.L2733
	b	.L2731
	.p2align 3
.L2858:
	ldr	w0, [x0, 60]
	add	w2, w2, w0
	lsr	w2, w2, 3
	b	.L2704
.L2881:
	ldr	w0, [x26, 60]
	add	x0, x0, 104
	ldr	x0, [x26, x0, lsl 3]
	str	w28, [x0, 1052]
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2758
	mov	w19, 0
	b	.L2759
	.p2align 3
.L2761:
	ldr	w1, [x26, 896]
	ldr	w0, [x26, 904]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2758
.L2759:
	mov	w1, 8
	mov	x0, x20
	add	w19, w19, 1
	bl	BsSkip
	cmp	w28, w19
	bne	.L2761
	b	.L2758
.L2711:
	ldr	x1, .LC822
	mov	w3, w19
	mov	w0, 20
	mov	w24, 1
	bl	dprint_vfmw
	b	.L2748
.L2879:
	strb	w24, [x1, 1026]
	mov	x0, x26
	ldr	x2, .LC826
	mov	w1, 8
	ldr	w3, [x26, 60]
	add	x3, x3, 104
	ldr	x23, [x26, x3, lsl 3]
	bl	mvc_u_v
	strb	w0, [x23, 1027]
	ldr	w0, [x26, 60]
	add	x0, x0, 104
	ldr	x23, [x26, x0, lsl 3]
	ldrb	w0, [x23, 1027]
	cmp	w0, 255
	beq	.L2753
	strb	wzr, [x23, 1028]
	mov	w23, 3
	mov	w25, w23
.L2754:
	ldr	w0, [x26, 60]
	mov	w1, 16
	ldr	x2, .LC830
	add	x0, x0, 104
	ldr	x5, [x26, x0, lsl 3]
	mov	x0, x26
	str	x5, [x29, 96]
	bl	mvc_u_v
	ldr	x5, [x29, 96]
	mov	w1, w23
	strh	w0, [x5, 1030]
	mov	x0, x26
	bl	MVC_PassBytes
	ldr	w0, [x26, 60]
	cmp	w28, w23
	add	x0, x0, 104
	beq	.L2852
	ldr	x1, [x26, x0, lsl 3]
	b	.L2752
.L2863:
	mov	x0, x20
	bl	BsSkip
	b	.L2818
.L2885:
	mov	x0, x20
	bl	BsSkip
	b	.L2735
.L2865:
	ldr	x2, .LC812
	mov	w3, 12792
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2811
.L2866:
	ldr	x2, .LC812
	mov	w3, 12766
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2808
.L2860:
	ldr	x1, .LC814
	mov	w3, 12882
	ldr	x2, [x29, 104]
	mov	w0, 20
	bl	dprint_vfmw
	b	.L2824
.L2864:
	ldr	x1, .LC814
	mov	w3, 12818
	ldr	x2, .LC868
	mov	w0, 20
	bl	dprint_vfmw
	b	.L2814
.L2883:
	ldr	x2, .LC812
	mov	w3, 12254
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2744
.L2869:
	ldr	x2, .LC812
	mov	w3, 12688
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2799
.L2870:
	ldr	x2, .LC812
	mov	w3, 12662
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2796
.L2867:
	ldr	x2, .LC812
	mov	w3, 12740
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2805
.L2876:
	ldr	x2, .LC812
	mov	w3, 12506
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2778
.L2884:
	ldr	x2, .LC812
	mov	w3, 12228
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2741
.L2886:
	ldr	x2, .LC812
	mov	w3, 12163
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2730
.L2868:
	ldr	x2, .LC812
	mov	w3, 12714
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2802
.L2873:
	ldr	x2, .LC812
	mov	w3, 12584
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2787
.L2874:
	ldr	x2, .LC812
	mov	w3, 12558
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2784
.L2871:
	ldr	x2, .LC812
	mov	w3, 12636
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2793
.L2872:
	ldr	x2, .LC812
	mov	w3, 12610
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2790
.L2877:
	ldr	x2, .LC812
	mov	w3, 12480
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2775
.L2878:
	ldr	x2, .LC812
	mov	w3, 12454
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2772
.L2875:
	ldr	x2, .LC812
	mov	w3, 12532
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2781
.L2882:
	sub	w1, w19, w27
	mov	x0, x26
	bl	MVC_PassBytes
	tbz	w0, #31, .L2763
	ldr	x2, .LC812
	mov	w3, 12390
	ldr	x1, .LC814
	mov	w0, 20
	add	x2, x2, 240
	bl	dprint_vfmw
	b	.L2763
.L2836:
	mov	w0, 0
	mov	w28, 0
	b	.L2749
.L2753:
	ldr	x2, .LC828
	mov	w1, 8
	mov	x0, x26
	bl	mvc_u_v
	strb	w0, [x23, 1028]
	mov	w23, 4
	mov	w25, w23
	b	.L2754
.L2880:
	ldr	x1, .LC833
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x26, 60]
	ldr	w0, [x26, 120]
	add	x1, x1, 104
	ldr	x1, [x26, x1, lsl 3]
	bl	FreeUsdByDec
	ldr	w1, [x26, 60]
	mov	w0, -1
	add	x1, x1, 104
	str	xzr, [x26, x1, lsl 3]
	b	.L2698
.L2835:
	mov	w0, -1
	b	.L2698
	.size	MVC_DecSEI, .-MVC_DecSEI
	.align	3
.LC806:
	.xword	.LC805
	.align	3
.LC808:
	.xword	.LC807
	.align	3
.LC809:
	.xword	.L2707
	.align	3
.LC811:
	.xword	.LC810
	.align	3
.LC812:
	.xword	.LANCHOR0
	.align	3
.LC814:
	.xword	.LC813
	.align	3
.LC816:
	.xword	.LC815
	.align	3
.LC818:
	.xword	.LC817
	.align	3
.LC820:
	.xword	.LC819
	.align	3
.LC822:
	.xword	.LC821
	.align	3
.LC824:
	.xword	.LC823
	.align	3
.LC826:
	.xword	.LC825
	.align	3
.LC828:
	.xword	.LC827
	.align	3
.LC830:
	.xword	.LC829
	.align	3
.LC831:
	.xword	g_event_report
	.align	3
.LC833:
	.xword	.LC832
	.align	3
.LC835:
	.xword	.LC834
	.align	3
.LC837:
	.xword	.LC836
	.align	3
.LC839:
	.xword	.LC838
	.align	3
.LC841:
	.xword	.LC840
	.align	3
.LC843:
	.xword	.LC842
	.align	3
.LC845:
	.xword	.LC844
	.align	3
.LC847:
	.xword	.LC846
	.align	3
.LC849:
	.xword	.LC848
	.align	3
.LC851:
	.xword	.LC850
	.align	3
.LC853:
	.xword	.LC852
	.align	3
.LC855:
	.xword	.LC854
	.align	3
.LC857:
	.xword	.LC856
	.align	3
.LC859:
	.xword	.LC858
	.align	3
.LC861:
	.xword	.LC860
	.align	3
.LC863:
	.xword	.LC862
	.align	3
.LC865:
	.xword	.LC864
	.align	3
.LC867:
	.xword	.LC866
	.align	3
.LC868:
	.xword	.LANCHOR0+240
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InitOldSlice
	.type	MVC_InitOldSlice, %function
MVC_InitOldSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 11120640
	mov	w4, 32
	ldr	w8, [x19, 40]
	mov	w7, 23352
	movk	w7, 0x1, lsl 16
	mov	w6, 2
	strb	w4, [x0, 530]
	add	x4, x0, 512
	strb	wzr, [x0, 528]
	mov	w5, 7
	strb	w6, [x0, 529]
	mov	w3, 3
	strb	w5, [x0, 531]
	mov	w2, -1
	str	w8, [x0, 540]
	mov	w1, 262144
	str	w7, [x0, 544]
	stp	w3, w2, [x4, 40]
	stp	wzr, wzr, [x4, 48]
	str	w1, [x0, 568]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_InitOldSlice, .-MVC_InitOldSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IsNewPicNal
	.type	MVC_IsNewPicNal, %function
MVC_IsNewPicNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x20, 3]
	and	w0, w0, 31
	sub	w0, w0, #1
	cmp	w0, 7
	bls	.L2897
.L2896:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2897:
	ldr	x1, .LC869
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2891
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2891:
	.section	.rodata
	.align	0
	.align	2
.L2891:
	.byte	(.L2890 - .Lrtx2891) / 4
	.byte	(.L2896 - .Lrtx2891) / 4
	.byte	(.L2896 - .Lrtx2891) / 4
	.byte	(.L2896 - .Lrtx2891) / 4
	.byte	(.L2890 - .Lrtx2891) / 4
	.byte	(.L2896 - .Lrtx2891) / 4
	.byte	(.L2892 - .Lrtx2891) / 4
	.byte	(.L2892 - .Lrtx2891) / 4
	.text
	.p2align 3
.L2892:
	ldr	w0, [x19]
	mov	w1, 1
	str	w1, [x19]
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2890:
	ldr	w0, [x19]
	cbz	w0, .L2893
.L2895:
	mov	w0, -1
	str	wzr, [x19]
.L2898:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2893:
	ldr	w20, [x20, 4]
	rev	w20, w20
	mov	w0, w20
	bl	ZerosMS_32
	cmp	w0, 15
	bhi	.L2895
	mov	w1, 31
	str	wzr, [x19]
	sub	w0, w1, w0, lsl 1
	lsr	w20, w20, w0
	cmp	w20, 1
	csetm	w0, ne
	b	.L2898
	.size	MVC_IsNewPicNal, .-MVC_IsNewPicNal
	.align	3
.LC869:
	.xword	.L2891
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FindZeroBitsInSeg
	.type	MVC_FindZeroBitsInSeg, %function
MVC_FindZeroBitsInSeg:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x22, x0
	mov	x0, x30
	mov	w23, w1
	bl	_mcount
	cmp	x22, xzr
	ccmp	w23, wzr, 4, ne
	ble	.L2919
	and	w1, w23, 63
	add	w0, w23, 63
	cmp	w1, wzr
	cset	w26, ne
	cmp	w23, wzr
	csel	w0, w0, w23, lt
	add	w26, w26, w0, asr 6
	cmp	w26, wzr
	ble	.L2912
	ldr	x20, .LC873
	mov	w25, w23
	ldr	x27, .LC872
	mov	w19, 0
	mov	w24, 64
	add	x20, x20, 1880
	.p2align 2
.L2911:
	cmp	w25, 64
	uxtw	x1, w25
	csel	w21, w25, w24, ls
	ldr	x3, [x27, 104]
	sub	x1, x1, x21
	mov	x2, x21
	add	x1, x22, x1
	sub	x21, x21, #1
	mov	x0, x20
	blr	x3
	ldrb	w1, [x20, x21]
	add	x0, x20, x21
	cbnz	w1, .L2903
	cmp	x0, x20
	add	w19, w19, 1
	bne	.L2906
	b	.L2904
	.p2align 3
.L2907:
	add	w19, w19, 1
	beq	.L2904
.L2906:
	ldrb	w1, [x0, -1]!
	cmp	x0, x20
	cbz	w1, .L2907
.L2903:
	lsl	w0, w19, 3
.L2902:
	cmp	w19, w23
	mov	w1, 0
	bge	.L2908
	sxtw	x2, w23
	sub	x2, x2, #1
	sub	x19, x2, x19, sxtw
	ldrb	w2, [x22, x19]
	tbnz	x2, 0, .L2908
	lsr	w2, w2, 1
	mov	w1, 1
	.p2align 2
.L2910:
	tbnz	x2, 0, .L2908
	add	w1, w1, 1
	lsr	w2, w2, 1
	cmp	w1, 8
	bne	.L2910
.L2908:
	add	w0, w1, w0
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2904:
	subs	w26, w26, #1
	sub	w25, w25, #64
	bne	.L2911
	b	.L2903
.L2919:
	ldr	x1, .LC871
	mov	w2, w23
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L2912:
	mov	w0, 0
	mov	w19, 0
	b	.L2902
	.size	MVC_FindZeroBitsInSeg, .-MVC_FindZeroBitsInSeg
	.align	3
.LC871:
	.xword	.LC870
	.align	3
.LC872:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC873:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FindTrailZeros
	.type	MVC_FindTrailZeros, %function
MVC_FindTrailZeros:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2926
	ldr	x2, [x19, 240]
	ldr	w0, [x2, 76]
	cmp	w0, 1
	bls	.L2925
	ldr	w1, [x2, 48]
	ldr	x0, [x2, 40]
	bl	MVC_FindZeroBitsInSeg
	ldr	x2, [x19, 240]
	ldr	w1, [x2, 48]
	cmp	w0, w1, lsl 3
	bcs	.L2929
	cmn	w0, #1
	beq	.L2925
	add	w0, w0, 1
	str	w0, [x2, 80]
	ldr	x0, [x19, 240]
	ldr	w1, [x0, 76]
	cmp	w1, 1
	bls	.L2927
.L2930:
	ldr	w2, [x0, 48]
	mov	w20, 0
	ldr	w1, [x0, 80]
	cmp	w1, w2, lsl 3
	bcc	.L2921
	ldr	w1, [x0, 68]
	ldr	w0, [x19, 120]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 240]
	mov	w1, 1
	str	xzr, [x0, 40]
	ldr	x0, [x19, 240]
	str	w1, [x0, 76]
	ldr	x0, [x19, 240]
	str	wzr, [x0, 80]
.L2921:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2929:
	ldr	w1, [x2, 68]
	ldr	w0, [x19, 120]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 240]
	mov	w1, 1
	str	xzr, [x0, 40]
	ldr	x0, [x19, 240]
	str	w1, [x0, 76]
	ldr	x2, [x19, 240]
.L2925:
	ldr	w1, [x2, 16]
	ldr	x0, [x2, 8]
	bl	MVC_FindZeroBitsInSeg
	add	w0, w0, 1
	ldr	x2, [x19, 240]
	str	w0, [x2, 80]
	ldr	x0, [x19, 240]
	ldr	w1, [x0, 76]
	cmp	w1, 1
	bhi	.L2930
.L2927:
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2926:
	mov	w20, -1
	b	.L2921
	.size	MVC_FindTrailZeros, .-MVC_FindTrailZeros
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_CombinePacket
	.type	MVC_CombinePacket, %function
MVC_CombinePacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 240]
	ldr	w0, [x0, 16]
	cmp	w0, 4095
	bhi	.L2931
	mov	x0, x19
	bl	MVC_CombinePacket.part.12
.L2931:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_CombinePacket, .-MVC_CombinePacket
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FindNaluArraySlot
	.type	MVC_FindNaluArraySlot, %function
MVC_FindNaluArraySlot:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 1521]
	cbz	w0, .L2938
	add	x0, x19, 1617
	mov	x1, 1
	b	.L2936
	.p2align 3
.L2935:
	add	w1, w1, 1
	cmp	w1, 137
	beq	.L2941
.L2936:
	ldrb	w2, [x0]
	add	x0, x0, 96
	cbnz	w2, .L2935
	mov	w0, w1
.L2934:
	lsl	x2, x1, 2
	mov	w3, 1
	sub	x1, x2, x1
	add	x1, x19, x1, lsl 5
	strb	w3, [x1, 1521]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2941:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2938:
	mov	w0, 0
	mov	x1, 0
	b	.L2934
	.size	MVC_FindNaluArraySlot, .-MVC_FindNaluArraySlot
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InquireSliceProperty
	.type	MVC_InquireSliceProperty, %function
MVC_InquireSliceProperty:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x23, x1
	mov	x21, x2
	bl	_mcount
	add	x20, x19, 11116544
	ldr	w2, [x19, 68]
	mov	w0, 22
	ldr	x1, .LC876
	sub	w2, w2, #1
	bl	dprint_vfmw
	str	wzr, [x21]
	str	wzr, [x23]
	add	x2, x19, 11120640
	add	x0, x19, 12288
	mov	w3, -1
	ldr	x1, [x19, 240]
	ldrb	w4, [x1, 2]
	strb	w4, [x20, 2971]
	ldrb	w5, [x1, 4]
	strb	w5, [x20, 2976]
	ldrsb	w1, [x1, 5]
	strb	w1, [x20, 2980]
	strb	wzr, [x20, 2979]
	str	w3, [x2, 512]
	ldrb	w3, [x0, 2384]
	cmp	w3, 1
	beq	.L2978
	cmn	w1, #1
	beq	.L2979
.L2944:
	mov	x0, x19
	bl	MVC_SliceCheck
	mov	w22, w0
	cbnz	w0, .L2960
	mov	x0, x19
	bl	MVC_ProcessSliceHeaderFirstPart
	cbnz	w0, .L2980
	ldrb	w1, [x20, 2973]
	mov	w0, 2240
	cmp	w1, 1
	cset	w1, eq
	str	w1, [x23]
	ldr	w1, [x20, 2984]
	ldrsb	w2, [x20, 2980]
	ldr	x3, [x19, 280]
	umull	x0, w1, w0
	cmn	w2, #1
	add	x0, x3, x0
	beq	.L2981
	cbnz	w2, .L2956
	ldrb	w1, [x19, 2]
	cmp	w1, 1
	beq	.L2982
	ldr	w1, [x0, 28]
	add	x0, x19, 11046912
	ldr	w2, [x19, 28]
	add	x0, x0, 180
	cmp	w2, w1
	bne	.L2983
.L2955:
	ldrb	w1, [x0, 20]
	mov	w2, 2
	ldr	w5, [x0, 3952]
	sub	w1, w2, w1
	ldr	w2, [x0, 3948]
	ldp	w3, w4, [x19, 12]
	madd	w1, w5, w1, w1
	add	w2, w2, 1
	cmp	w1, w4
	ccmp	w2, w3, 0, eq
	beq	.L2959
	mov	w1, 1
	str	w1, [x21]
.L2959:
	add	x19, x19, 11124736
	ldr	w1, [x0, 3972]
	ldr	w0, [x19, 920]
	add	w0, w0, 1
	cmp	w1, w0
	bls	.L2952
	mov	w0, 1
	str	w0, [x21]
.L2952:
	mov	w0, w22
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2978:
	strb	w3, [x20, 2979]
	ldr	w1, [x19, 14680]
	str	w1, [x2, 512]
	ldrb	w1, [x0, 2388]
	strb	w1, [x20, 2977]
	ldrb	w0, [x0, 2389]
	strb	w0, [x20, 2978]
	b	.L2944
	.p2align 3
.L2981:
	ldr	w1, [x0, 28]
	mov	w0, 3992
	ldr	x2, [x19, 272]
	umull	x0, w1, w0
	add	x0, x2, x0
	b	.L2955
	.p2align 3
.L2979:
	ldr	w1, [x19, 20]
	cbz	w1, .L2944
	add	x1, x19, 10768384
	ldr	w3, [x1, 4064]
	cbnz	w3, .L2947
	ldrb	w3, [x1, 4060]
	cbnz	w3, .L2947
	add	x0, x0, 2400
	mov	x1, 0
	.p2align 2
.L2950:
	ldr	w3, [x0]
	add	x5, x0, 335872
	cbz	w3, .L2948
	ldrb	w0, [x0, -4]
	cbnz	w0, .L2984
.L2948:
	add	w1, w1, 1
	add	x0, x5, 308
	cmp	w1, 32
	bne	.L2950
	mov	w0, -1
	b	.L2977
	.p2align 3
.L2982:
	ldr	w1, [x0, 28]
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x0, x0, x1
	lsl	x1, x0, 2
	sub	x1, x1, x0
	lsl	x0, x1, 6
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	add	x0, x0, 286720
	add	x0, x0, 2612
	b	.L2955
	.p2align 3
.L2947:
	ldr	w0, [x1, 4068]
.L2977:
	cmn	w0, #1
	str	w0, [x2, 512]
	beq	.L2944
	cmp	w4, 5
	mov	w0, 1
	cset	w1, eq
	strb	w0, [x20, 2979]
	strb	w0, [x20, 2978]
	strb	w1, [x20, 2977]
	b	.L2944
	.p2align 3
.L2960:
	mov	w22, -1
	b	.L2952
	.p2align 3
.L2983:
	ldr	x1, .LC879
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L2952
	.p2align 3
.L2980:
	ldr	x1, .LC878
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L2952
	.p2align 3
.L2956:
	ldr	x1, .LC881
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L2952
	.p2align 3
.L2984:
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x1, x0, x1
	lsl	x0, x1, 2
	sub	x1, x0, x1
	lsl	x0, x1, 6
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 14692]
	b	.L2977
	.size	MVC_InquireSliceProperty, .-MVC_InquireSliceProperty
	.align	3
.LC876:
	.xword	.LC875
	.align	3
.LC878:
	.xword	.LC877
	.align	3
.LC879:
	.xword	.LC90
	.align	3
.LC881:
	.xword	.LC880
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_HaveSliceToDec
	.type	MVC_HaveSliceToDec, %function
MVC_HaveSliceToDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 64]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	csetm	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_HaveSliceToDec, .-MVC_HaveSliceToDec
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IsRefListWrong
	.type	MVC_IsRefListWrong, %function
MVC_IsRefListWrong:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 11116544
	bl	_mcount
	ldr	w0, [x21, 3016]
	cbz	w0, .L2987
	mov	w19, 0
	b	.L2991
	.p2align 3
.L2988:
	ldr	x0, [x0, 680]
	cbz	x0, .L2990
	ldr	w0, [x21, 3016]
	cmp	w0, w19
	bls	.L3015
.L2991:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x20, 120]
	add	w19, w19, 1
	ldr	x1, [x1, 288]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	cbnz	x0, .L2988
.L2990:
	mov	w0, -1
.L3017:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2987:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3015:
	cbz	w0, .L2987
	ldr	w0, [x21, 3020]
	mov	w19, 0
	cbnz	w0, .L3004
	b	.L2987
	.p2align 3
.L3016:
	ldr	x0, [x0, 680]
	cbz	x0, .L2990
	ldr	w0, [x21, 3020]
	cmp	w0, w19
	bls	.L2987
.L3004:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x20, 120]
	add	w19, w19, 1
	ldr	x1, [x1, 552]
	ldr	x1, [x1, 8]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetLogicFs
	cbnz	x0, .L3016
	mov	w0, -1
	b	.L3017
	.size	MVC_IsRefListWrong, .-MVC_IsRefListWrong
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_Destroy
	.type	MVC_DEC_Destroy, %function
MVC_DEC_Destroy:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 12288
	add	x19, x21, 1520
	bl	_mcount
	add	x20, x20, 2384
	mov	x0, x21
	bl	MVC_ClearAllSlice
	add	x0, x21, 11120640
	mov	w1, 23352
	ldr	w2, [x21, 40]
	movk	w1, 0x1, lsl 16
	mov	w6, 2
	mov	w5, 7
	mov	w4, 32
	mov	w3, 3
	str	w2, [x0, 540]
	mov	w2, -1
	str	w1, [x0, 544]
	mov	w1, 262144
	strb	wzr, [x0, 528]
	strb	w6, [x0, 529]
	strb	w5, [x0, 531]
	strb	w4, [x0, 530]
	str	w3, [x0, 552]
	str	wzr, [x0, 560]
	str	wzr, [x0, 564]
	str	w2, [x0, 556]
	str	w1, [x0, 568]
	b	.L3020
	.p2align 3
.L3019:
	add	x19, x19, 96
	cmp	x20, x19
	beq	.L3039
.L3020:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L3019
	ldr	w0, [x21, 120]
	mov	x1, x19
	add	x19, x19, 96
	bl	MVC_ReleaseNAL
	cmp	x20, x19
	bne	.L3020
.L3039:
	ldr	w2, [x21, 60]
	mov	w19, 0
	cbz	w2, .L3025
	.p2align 2
.L3033:
	add	x20, x21, x19, uxtw 3
	add	w19, w19, 1
	ldr	x0, [x20, 832]
	mov	x1, x0
	cbz	x0, .L3023
	ldr	w0, [x21, 120]
	bl	FreeUsdByDec
	str	xzr, [x20, 832]
	ldr	w2, [x21, 60]
.L3023:
	cmp	w2, w19
	bhi	.L3033
.L3025:
	add	x20, x21, 11124736
	add	x22, x21, 11161600
	add	x20, x20, 1992
	add	x22, x22, 328
	.p2align 2
.L3022:
	sub	x19, x20, #32
.L3027:
	ldr	x1, [x19]
	cbnz	x1, .L3040
.L3026:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L3027
	add	x20, x19, 880
	cmp	x20, x22
	bne	.L3022
	ldr	x1, .LC883
	mov	w0, 2
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3040:
	ldr	w0, [x21, 120]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L3026
	.size	MVC_DEC_Destroy, .-MVC_DEC_Destroy
	.align	3
.LC883:
	.xword	.LC882
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_RecycleImage
	.type	MVC_DEC_RecycleImage, %function
MVC_DEC_RecycleImage:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	bl	_mcount
	ldr	x1, .LC885
	mov	w0, 2
	bl	dprint_vfmw
	ldr	w0, [x21, 120]
	mov	w1, w22
	bl	FSP_GetLogicFs
	cbz	x0, .L3046
	ldrsb	w1, [x0, 1]
	cbz	w1, .L3046
	add	x19, x0, 608
	add	x20, x0, 640
.L3044:
	ldr	x1, [x19]
	cbnz	x1, .L3051
.L3043:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L3044
	ldr	w0, [x21, 120]
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, 0
.L3042:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3051:
	ldr	w0, [x21, 120]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L3043
	.p2align 3
.L3046:
	mov	w0, -1
	b	.L3042
	.size	MVC_DEC_RecycleImage, .-MVC_DEC_RecycleImage
	.align	3
.LC885:
	.xword	.LC884
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_OutputFrmToVO
	.type	MVC_OutputFrmToVO, %function
MVC_OutputFrmToVO:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	mov	w22, w2
	bl	_mcount
	cmp	x20, xzr
	cset	w21, eq
	cmp	x19, xzr
	cset	w0, eq
	orr	w0, w21, w0
	cbnz	w0, .L3086
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 12]
	cmp	w0, wzr
	ble	.L3055
	ldrb	w0, [x19, 8]
	cmp	w0, 2
	beq	.L3055
	ldr	x0, [x19, 816]
	cbz	x0, .L3057
	strb	wzr, [x0, 2]
	mov	w0, 1
	str	xzr, [x19, 816]
.L3085:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3055:
	mov	x1, x20
	mov	x0, x19
	bl	MVC_CheckFrameStore
	cmn	w0, #3
	beq	.L3057
	ldr	x1, [x19, 816]
	cbz	x1, .L3059
	mov	x0, x19
	bl	MVC_GetImagePara
	ldr	x1, [x19, 816]
	mov	x0, x19
	bl	MVC_CheckFrameStore
	mov	w23, w0
	cbz	w0, .L3087
	cmn	w0, #3
	beq	.L3067
	ldr	x1, .LC893
	mov	w3, w0
	mov	w2, 1934
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 816]
	mov	x0, x19
	ldr	w1, [x1, 252]
	bl	MVC_DEC_RecycleImage
	cmp	w23, 1
	cset	w1, eq
.L3066:
	ldr	x0, [x19, 816]
	tst	w21, w1
	strb	wzr, [x0, 2]
	str	xzr, [x19, 816]
	bne	.L3075
.L3059:
	mov	x1, x20
	mov	x0, x19
	bl	MVC_GetImagePara
	mov	x1, x20
	mov	x0, x19
	bl	MVC_CheckFrameStore
	cbz	w0, .L3088
	ldr	x1, .LC893
	mov	w3, w0
	mov	w2, 1983
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x20, 252]
	mov	x0, x19
	bl	MVC_DEC_RecycleImage
	ldr	x23, [sp, 48]
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3086:
	ldr	x1, .LC887
	mov	x3, x20
	mov	x2, x19
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3057:
	mov	w0, 1
	b	.L3085
	.p2align 3
.L3088:
	ldrsb	w1, [x20, 6]
	mov	w2, 1
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
	ldrsb	w1, [x20, 6]
	ldr	w0, [x19, 120]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L3089
	cmp	w22, 1
	beq	.L3090
.L3071:
	ldr	w0, [x19, 120]
	mov	x4, x21
	add	x3, x19, 912
	mov	x2, x19
	mov	w1, 15
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L3091
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L3092
	str	wzr, [x21, 24]
.L3074:
	ldr	w1, [x19, 136]
	mov	w0, 0
	ldr	w2, [x19, 144]
	add	w1, w1, 2
	str	w1, [x19, 136]
	add	w2, w2, 1
	str	w2, [x19, 144]
	b	.L3085
	.p2align 3
.L3090:
	str	w22, [x0, 212]
	b	.L3071
.L3091:
	ldr	x1, .LC891
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	ldrsb	w1, [x20, 6]
	mov	w2, 0
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
	mov	w1, 1
	mov	x0, x19
	bl	MVC_ClearAll
	mov	w0, -1
	b	.L3085
	.p2align 3
.L3067:
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 2]
	str	xzr, [x19, 816]
	b	.L3059
	.p2align 3
.L3087:
	ldr	x1, [x19, 816]
	mov	w2, 1
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
	ldr	x1, [x19, 816]
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L3093
	ldr	x0, [x19, 816]
	cmp	x0, x20
	ccmp	w22, 1, 0, eq
	beq	.L3094
.L3062:
	ldr	w0, [x19, 120]
	mov	x4, x23
	add	x3, x19, 912
	mov	x2, x19
	mov	w1, 15
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L3095
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L3096
	str	wzr, [x23, 24]
.L3065:
	ldr	w0, [x19, 136]
	mov	w1, 1
	ldr	w2, [x19, 144]
	add	w0, w0, 2
	str	w0, [x19, 136]
	add	w2, w2, w1
	str	w2, [x19, 144]
	b	.L3066
	.p2align 3
.L3075:
	mov	w0, 0
	b	.L3085
	.p2align 3
.L3092:
	mov	x1, x21
	mov	x0, x19
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L3074
	.p2align 3
.L3096:
	mov	x1, x23
	mov	x0, x19
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L3065
.L3095:
	ldr	x1, .LC891
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, [x19, 816]
	mov	w2, 0
	strb	wzr, [x0, 2]
	ldr	x1, [x19, 816]
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
	str	xzr, [x19, 816]
	mov	w1, 1
	mov	x0, x19
	bl	MVC_ClearAll
	mov	w0, -1
	b	.L3085
	.p2align 3
.L3094:
	mov	w0, 1
	str	w0, [x23, 212]
	b	.L3062
.L3089:
	ldr	x1, .LC889
	mov	w2, 1957
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3085
.L3093:
	ldr	x1, .LC889
	mov	w2, 1905
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3085
	.size	MVC_OutputFrmToVO, .-MVC_OutputFrmToVO
	.align	3
.LC887:
	.xword	.LC886
	.align	3
.LC889:
	.xword	.LC888
	.align	3
.LC891:
	.xword	.LC890
	.align	3
.LC893:
	.xword	.LC892
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_OutputFrmFromDPB
	.type	MVC_OutputFrmFromDPB, %function
MVC_OutputFrmFromDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w21, w1
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, x21, uxtw 3
	add	x19, x19, 11124736
	bl	_mcount
	ldr	x0, [x19, 536]
	cbz	x0, .L3099
	strb	wzr, [x0, 5]
	mov	w2, 0
	mov	x0, x20
	ldr	x1, [x19, 536]
	bl	MVC_OutputFrmToVO
	cmn	w0, #1
	ldr	x1, [x19, 536]
	csetm	w19, eq
	ldrb	w0, [x1, 3]
	cbz	w0, .L3100
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3100:
	mov	w1, w21
	mov	x0, x20
	bl	MVC_RemoveFrameStoreOutDPB
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3099:
	mov	w19, 0
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	MVC_OutputFrmFromDPB, .-MVC_OutputFrmFromDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FlushDPB
	.type	MVC_FlushDPB, %function
MVC_FlushDPB:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	cbz	x20, .L3120
	add	x21, x20, 11124736
	mov	w22, 0
	ldr	w0, [x21, 920]
	cbz	w0, .L3108
	.p2align 2
.L3142:
	uxtw	x0, w22
	add	w22, w22, 1
	add	x0, x0, 1388544
	add	x0, x20, x0, lsl 3
	ldr	x1, [x0, 16920]
	cbz	x1, .L3106
	ldrb	w0, [x1, 3]
	cbz	w0, .L3106
	ldr	w0, [x1, 56]
	cmp	w0, w19
	ccmn	w19, #1, 4, ne
	bne	.L3106
	mov	x0, x20
	bl	MVC_UnMarkFrameStoreRef
	.p2align 2
.L3106:
	ldr	w0, [x21, 920]
	cmp	w0, w22
	bhi	.L3142
.L3108:
	mov	w1, w19
	mov	x0, x20
	bl	MVC_RemoveUnUsedFrameStore
	ldr	w0, [x21, 920]
	cbz	w0, .L3105
	sub	w2, w0, #1
	mov	w22, -1
	add	x2, x2, 1388544
	add	x0, x21, 536
	add	x2, x2, 2116
	mov	w21, 0
	add	x2, x20, x2, lsl 3
	.p2align 2
.L3112:
	ldr	x1, [x0]
	cmn	w19, #1
	add	x0, x0, 8
	cbz	x1, .L3110
	ldr	w1, [x1, 56]
	ccmp	w19, w1, 4, ne
	csinc	w21, w21, w21, ne
	cmp	w19, w1
	ccmn	w19, #1, 4, ne
	csel	w22, w22, w1, eq
.L3110:
	cmp	x2, x0
	bne	.L3112
	cbz	w21, .L3105
	cmn	w22, #1
	cset	w24, ne
	cmp	w19, w22
	cset	w23, gt
	and	w23, w24, w23
	b	.L3118
	.p2align 3
.L3119:
	subs	w21, w21, #1
	beq	.L3105
.L3118:
	add	x3, x29, 72
	add	x2, x29, 76
	mov	w1, w22
	mov	x0, x20
	cbz	w23, .L3115
	bl	MVC_GetMinPOC
	ldr	w1, [x29, 72]
	mov	x0, x20
	cmn	w1, #1
	beq	.L3105
	bl	MVC_OutputFrmFromDPB
	cbnz	w0, .L3120
.L3115:
	mov	w1, w19
	add	x3, x29, 72
	add	x2, x29, 76
	mov	x0, x20
	bl	MVC_GetMinPOC
	ldr	w1, [x29, 72]
	mov	x0, x20
	cmn	w1, #1
	beq	.L3105
	bl	MVC_OutputFrmFromDPB
	cbnz	w0, .L3120
	cmp	w19, w22
	cset	w0, lt
	tst	w24, w0
	beq	.L3119
	mov	w1, w22
	add	x3, x29, 72
	add	x2, x29, 76
	mov	x0, x20
	bl	MVC_GetMinPOC
	ldr	w1, [x29, 72]
	mov	x0, x20
	cmn	w1, #1
	beq	.L3105
	bl	MVC_OutputFrmFromDPB
	cbz	w0, .L3119
.L3120:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3105:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.size	MVC_FlushDPB, .-MVC_FlushDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_AdaptiveMemMark
	.type	MVC_AdaptiveMemMark, %function
MVC_AdaptiveMemMark:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x25, x20, 11161600
	add	x22, x20, 11157504
	bl	_mcount
	ldr	x23, .LC894
	add	x24, x20, 11116544
	add	x22, x22, 3720
	ldr	x21, [x25, 312]
	mov	w26, 1
	add	x19, x21, 8
	add	x21, x21, 2008
	.p2align 2
.L3166:
	ldr	w0, [x19, -4]
	cmp	w0, 6
	bhi	.L3157
	ldrb	w0, [x23,w0,uxtw]
	adr	x1, .Lrtx3159
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx3159:
	.section	.rodata
	.align	0
	.align	2
.L3159:
	.byte	(.L3158 - .Lrtx3159) / 4
	.byte	(.L3160 - .Lrtx3159) / 4
	.byte	(.L3161 - .Lrtx3159) / 4
	.byte	(.L3162 - .Lrtx3159) / 4
	.byte	(.L3163 - .Lrtx3159) / 4
	.byte	(.L3164 - .Lrtx3159) / 4
	.byte	(.L3165 - .Lrtx3159) / 4
	.text
	.p2align 3
.L3164:
	mov	x0, x20
	bl	MVC_UnMarkAllSTRef
	mov	x0, x20
	bl	MVC_UpdateReflist
	mov	w1, 0
	mov	x0, x20
	bl	MVC_UpdateMaxLTFrmIdx
	mov	x0, x20
	bl	MVC_UpdateLTReflist
	strb	w26, [x24, 1832]
	.p2align 2
.L3157:
	add	x19, x19, 20
	cmp	x19, x21
	bne	.L3166
	.p2align 2
.L3158:
	ldrsb	w1, [x24, 1832]
	mov	w0, 0
	cmp	w1, 1
	beq	.L3174
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3163:
	ldr	w1, [x19, 12]
	mov	x0, x20
	bl	MVC_UpdateMaxLTFrmIdx
	mov	x0, x20
	bl	MVC_UpdateLTReflist
	b	.L3157
	.p2align 3
.L3162:
	ldr	w2, [x19]
	mov	x1, x22
	ldr	w3, [x19, 8]
	mov	x0, x20
	bl	MVC_MarkSTToLTRef
	mov	x0, x20
	bl	MVC_UpdateReflist
	mov	x0, x20
	bl	MVC_UpdateLTReflist
	b	.L3157
	.p2align 3
.L3161:
	ldr	w2, [x19, 4]
	mov	x0, x20
	mov	x1, x22
	bl	MVC_UnMarkLTRef
	mov	x0, x20
	bl	MVC_UpdateLTReflist
	b	.L3157
	.p2align 3
.L3160:
	ldr	w2, [x19]
	mov	x0, x20
	mov	x1, x22
	bl	MVC_UnMarkSTRef
	mov	x0, x20
	bl	MVC_UpdateReflist
	b	.L3157
	.p2align 3
.L3165:
	ldr	w2, [x19, 8]
	mov	x1, x22
	mov	x0, x20
	bl	MVC_MarkCurrPicLT
	b	.L3157
	.p2align 3
.L3174:
	add	x0, x20, 11120640
	str	wzr, [x25, 320]
	add	x1, x20, 11157504
	ldr	w0, [x0, 516]
	add	x0, x0, 2777088
	add	x0, x20, x0, lsl 2
	str	wzr, [x0, 11180]
	str	wzr, [x25, 1184]
	ldrb	w0, [x1, 3723]
	cmp	w0, 1
	beq	.L3169
	cbz	w0, .L3170
	cmp	w0, 2
	bne	.L3168
	str	wzr, [x25, 332]
	str	wzr, [x25, 344]
	str	wzr, [x24, 1860]
	str	wzr, [x24, 1868]
.L3168:
	ldr	w1, [x25, 392]
	mov	x0, x20
	bl	MVC_FlushDPB
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L3170:
	ldr	w2, [x25, 332]
	ldr	w0, [x25, 340]
	ldr	w1, [x25, 344]
	sub	w0, w0, w2
	str	w0, [x25, 340]
	sub	w1, w1, w2
	str	w1, [x25, 344]
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x25, 332]
	str	w0, [x25, 336]
	ldr	w2, [x24, 1868]
	ldr	w0, [x24, 1856]
	ldr	w1, [x24, 1860]
	sub	w0, w0, w2
	str	w0, [x24, 1856]
	sub	w1, w1, w2
	str	w1, [x24, 1860]
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x24, 1864]
	str	w0, [x24, 1868]
	b	.L3168
.L3169:
	str	wzr, [x25, 332]
	str	wzr, [x25, 340]
	str	wzr, [x24, 1856]
	str	wzr, [x24, 1868]
	b	.L3168
	.size	MVC_AdaptiveMemMark, .-MVC_AdaptiveMemMark
	.align	3
.LC894:
	.xword	.L3159
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_IDRMemMarking
	.type	MVC_IDRMemMarking, %function
MVC_IDRMemMarking:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 11161600
	bl	_mcount
	ldr	x0, [x21, 312]
	ldrb	w0, [x0, 1]
	cbz	w0, .L3176
	ldr	w0, [x20, 52]
	cbz	w0, .L3203
	sub	w4, w0, #1
	add	x24, x20, 11124736
	add	x4, x4, 38
	add	x2, x24, 536
	add	x1, x20, 148
	add	x4, x20, x4, lsl 2
	b	.L3184
	.p2align 3
.L3182:
	ldr	w3, [x0, 56]
	ldr	w0, [x21, 392]
	cmp	w3, w0
	beq	.L3204
.L3181:
	add	x1, x1, 4
	cmp	x1, x4
	beq	.L3185
.L3184:
	ldr	x0, [x2]
	add	x2, x2, 8
	cbz	x0, .L3181
	ldr	w3, [x0, 16]
	cmp	w3, 1
	bne	.L3182
	strb	w3, [x20, 6]
	ldr	w3, [x0, 56]
	ldr	w0, [x21, 392]
	cmp	w3, w0
	bne	.L3181
.L3204:
	str	wzr, [x1]
	add	x1, x1, 4
	cmp	x1, x4
	bne	.L3184
.L3185:
	ldr	w0, [x24, 920]
	cbz	w0, .L3179
	sub	w22, w0, #1
	add	x19, x24, 536
	add	x22, x22, 1388544
	mov	w23, 1
	add	x22, x22, 2116
	add	x22, x20, x22, lsl 3
	b	.L3190
	.p2align 3
.L3188:
	add	x19, x19, 8
	cmp	x19, x22
	beq	.L3179
.L3190:
	ldr	x0, [x19]
	cbz	x0, .L3188
	ldr	w2, [x0, 56]
	ldr	w1, [x21, 392]
	cmp	w2, w1
	bne	.L3188
	strb	wzr, [x0, 738]
	mov	w2, 0
	strb	wzr, [x0, 737]
	ldr	x0, [x19]
	strb	wzr, [x0, 786]
	strb	wzr, [x0, 785]
	ldr	x0, [x19]
	strb	wzr, [x0, 834]
	strb	wzr, [x0, 833]
	ldr	x0, [x19]
	strb	wzr, [x0, 3]
	ldr	x1, [x19]
	ldr	w0, [x20, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetRef
	ldr	x0, [x19]
	strb	wzr, [x0, 2]
	ldr	x0, [x19]
	strb	wzr, [x0, 5]
	ldr	x0, [x19]
	strb	w23, [x0, 7]
	ldr	x1, [x19]
	ldr	w0, [x1, 52]
	add	x0, x20, x0
	add	x0, x0, 11124736
	strb	wzr, [x0, 944]
	ldrsb	w1, [x1, 6]
	ldr	w0, [x20, 120]
	bl	FSP_GetDisplay
	cmp	w0, 3
	mov	w2, 0
	beq	.L3189
	ldr	x1, [x19]
	ldr	w0, [x20, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
.L3189:
	str	xzr, [x19]
	add	x19, x19, 8
	str	xzr, [x19, 120]
	str	xzr, [x19, 248]
	cmp	x19, x22
	ldr	w0, [x24, 924]
	sub	w0, w0, #1
	str	w0, [x24, 924]
	bne	.L3190
	.p2align 2
.L3179:
	mov	x0, x20
	bl	MVC_UpdateReflist
	mov	x0, x20
	bl	MVC_UpdateLTReflist
	ldr	x0, [x21, 312]
	ldrb	w0, [x0, 2]
	cbnz	w0, .L3205
	add	x20, x20, 11157504
	str	wzr, [x24, 936]
	mov	w1, 1
	mov	w0, 0
	strb	wzr, [x20, 3724]
	strb	w1, [x20, 3725]
.L3191:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3205:
	add	x20, x20, 11157504
	mov	w1, 1
	str	w1, [x24, 936]
	mov	w0, 0
	str	wzr, [x21, 324]
	strb	w1, [x20, 3724]
	strb	wzr, [x20, 3725]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3176:
	ldr	w1, [x21, 392]
	mov	x0, x20
	bl	MVC_FlushDPB
	cbnz	w0, .L3192
	add	x24, x20, 11124736
	b	.L3179
.L3203:
	add	x24, x20, 11124736
	b	.L3185
.L3192:
	mov	w0, -1
	b	.L3191
	.size	MVC_IDRMemMarking, .-MVC_IDRMemMarking
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_Marking
	.type	MVC_Marking, %function
MVC_Marking:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11157504
	bl	_mcount
	add	x0, x20, 11116544
	strb	wzr, [x0, 1832]
	ldrb	w1, [x19, 3723]
	cmp	w1, 2
	cset	w1, eq
	strb	w1, [x0, 1833]
	ldrb	w0, [x19, 3726]
	cmp	w0, 5
	beq	.L3207
	ldrb	w0, [x19, 3732]
	cbnz	w0, .L3208
	ldr	x0, [x20, 224]
	ldr	w1, [x0, 680]
	cmp	w1, 1
	beq	.L3232
.L3208:
	add	x21, x20, 11161600
	ldr	x0, [x21, 312]
	ldrb	w1, [x0, 3]
	cbz	w1, .L3233
	ldr	w0, [x21, 328]
	cbnz	w0, .L3234
.L3215:
	mov	w0, 0
.L3230:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3233:
	ldr	w1, [x21, 328]
	cbz	w1, .L3215
.L3218:
	ldrb	w1, [x19, 3721]
	cbnz	w1, .L3219
	add	x1, x20, 11124736
	ldr	x2, [x20, 248]
	ldr	w4, [x1, 932]
	ldr	w2, [x2, 3944]
	ldr	w3, [x1, 928]
	sub	w1, w2, w4
	cmp	w3, w1
	beq	.L3235
.L3220:
	strb	wzr, [x0]
	strb	wzr, [x19, 3724]
.L3211:
	ldr	w0, [x21, 328]
	cbz	w0, .L3215
.L3219:
	ldrb	w1, [x19, 3724]
	mov	w0, 0
	cmp	w1, wzr
	cset	w1, eq
	strb	w1, [x19, 3725]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3234:
	mov	x0, x20
	bl	MVC_AdaptiveMemMark
	ldr	x1, [x21, 312]
	strb	wzr, [x1]
	cbnz	w0, .L3209
.L3216:
	ldrb	w0, [x19, 3726]
	cmp	w0, 5
	beq	.L3211
	ldr	w0, [x21, 328]
	cbz	w0, .L3215
	ldr	x0, [x21, 312]
	ldrb	w1, [x0, 3]
	cbnz	w1, .L3219
	b	.L3218
	.p2align 3
.L3232:
	ldr	w1, [x0, 676]
	cbnz	w1, .L3208
	ldr	w1, [x0, 684]
	cbnz	w1, .L3208
	ldr	w0, [x0, 644]
	add	w0, w0, 1024
	cmp	w0, 2048
	bls	.L3208
	.p2align 2
.L3207:
	mov	x0, x20
	bl	MVC_IDRMemMarking
	cbnz	w0, .L3209
	add	x21, x20, 11161600
	b	.L3216
	.p2align 3
.L3235:
	mov	x0, x20
	bl	MVC_SlidingWinMark.part.2
	ldr	x0, [x21, 312]
	b	.L3220
	.p2align 3
.L3209:
	mov	w0, -1
	b	.L3230
	.size	MVC_Marking, .-MVC_Marking
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DirectOutput
	.type	MVC_DirectOutput, %function
MVC_DirectOutput:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11157504
	bl	_mcount
	ldrb	w0, [x21, 3723]
	cmp	w0, 1
	beq	.L3238
	cbz	w0, .L3239
	cmp	w0, 2
	beq	.L3240
	mov	w22, 0
.L3237:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3240:
	add	x20, x19, 11161600
	mov	w1, 3
	ldr	x0, [x20, 304]
	strb	w1, [x0, 736]
	ldrb	w0, [x21, 3721]
	cbnz	w0, .L3255
	ldr	x1, [x19, 816]
	cbz	x1, .L3256
	mov	w2, 0
	mov	x0, x19
	bl	MVC_OutputFrmToVO
	mov	w22, w0
	ldr	x0, [x20, 304]
	str	x0, [x19, 816]
	str	x0, [x0, 840]
.L3257:
	ldr	x0, [x19, 816]
	mov	w23, 2
	ldrb	w3, [x21, 3722]
	mov	x2, 664
	add	x1, x21, 3736
	strb	w3, [x0, 1]
	ldr	x0, [x19, 816]
	strb	w23, [x0, 2]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 5]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 7]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 3]
	ldr	x0, [x19, 816]
	ldrb	w3, [x21, 3732]
	strb	w3, [x0]
	ldr	x0, [x19, 816]
	str	wzr, [x0, 40]
	ldr	x0, [x19, 816]
	add	x0, x0, 72
	bl	memcpy
	ldr	x1, [x19, 816]
	mov	w0, 2
	ldr	w2, [x20, 364]
	str	w2, [x1, 864]
	ldr	x1, [x19, 816]
	ldr	w2, [x1, 864]
	str	w2, [x1, 44]
	str	w2, [x1, 768]
	ldr	x1, [x19, 816]
	strb	w23, [x1, 832]
	ldrb	w2, [x21, 3727]
	ldr	x1, [x19, 816]
	cmp	w2, 1
	csel	w0, wzr, w0, ne
	strb	w0, [x1, 4]
.L3312:
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 332]
	str	w1, [x0, 32]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 392]
	str	w1, [x0, 56]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 396]
	str	w1, [x0, 60]
	ldrb	w21, [x19, 9]
	cmp	w21, 1
	bne	.L3237
	ldr	x1, [x19, 816]
	mov	w2, 0
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetRef
	ldr	x1, [x19, 816]
	mov	w2, 0
	mov	x0, x19
	bl	MVC_OutputFrmToVO
	mov	w22, w0
	ldr	x0, [x19, 816]
	cbz	x0, .L3265
	ldr	x1, [x20, 304]
	mov	w2, w21
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_ClearLogicFs
.L3265:
	str	xzr, [x19, 816]
.L3315:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3239:
	add	x20, x19, 11161600
	ldr	x0, [x20, 304]
	strb	wzr, [x0, 736]
	ldr	x1, [x19, 816]
	cbz	x1, .L3241
	mov	w2, 0
	mov	x0, x19
	bl	MVC_OutputFrmToVO
	cbnz	w0, .L3314
.L3242:
	ldr	x0, [x19, 816]
	cbz	x0, .L3241
	ldr	x1, [x20, 304]
	mov	w2, 1
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_ClearLogicFs
.L3241:
	ldr	x0, [x20, 304]
	mov	w3, 3
	str	x0, [x19, 816]
	mov	x2, 664
	add	x1, x21, 3736
	str	x0, [x0, 744]
	ldr	x0, [x19, 816]
	ldr	x4, [x20, 304]
	str	x4, [x0, 792]
	ldr	x0, [x19, 816]
	ldr	x4, [x20, 304]
	str	x4, [x0, 840]
	ldr	x0, [x19, 816]
	ldrb	w4, [x21, 3722]
	strb	w4, [x0, 1]
	ldr	x0, [x19, 816]
	strb	w3, [x0, 2]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 3]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 5]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 7]
	ldr	x0, [x19, 816]
	add	x0, x0, 72
	bl	memcpy
	ldr	x1, [x19, 816]
	mov	w0, 3
	ldr	w3, [x20, 364]
	mov	w2, 0
	str	w3, [x1, 44]
	str	w3, [x1, 768]
	ldr	x1, [x19, 816]
	strb	wzr, [x1, 736]
	ldr	x1, [x19, 816]
	ldrb	w3, [x21, 3732]
	strb	w3, [x1]
	ldr	x1, [x19, 816]
	ldrb	w3, [x21, 3729]
	str	w3, [x1, 40]
	ldrb	w3, [x21, 3727]
	ldr	x1, [x19, 816]
	cmp	w3, 1
	csel	w0, wzr, w0, ne
	strb	w0, [x1, 4]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 332]
	str	w1, [x0, 32]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 392]
	str	w1, [x0, 56]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 396]
	str	w1, [x0, 60]
.L3310:
	ldr	x1, [x19, 816]
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetRef
	ldr	x1, [x19, 816]
	mov	w2, 0
	mov	x0, x19
	bl	MVC_OutputFrmToVO
	mov	w22, w0
	ldr	x0, [x19, 816]
	cbz	x0, .L3265
	ldr	x1, [x20, 304]
	mov	w2, 1
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_ClearLogicFs
	str	xzr, [x19, 816]
	b	.L3315
	.p2align 3
.L3238:
	add	x20, x19, 11161600
	mov	w1, 3
	ldr	x0, [x20, 304]
	strb	w1, [x0, 736]
	ldrb	w0, [x21, 3721]
	cbnz	w0, .L3245
	ldr	x1, [x19, 816]
	cbz	x1, .L3246
	mov	w2, 0
	mov	x0, x19
	bl	MVC_OutputFrmToVO
	mov	w22, w0
	ldr	x0, [x20, 304]
	str	x0, [x19, 816]
	str	x0, [x0, 792]
.L3247:
	ldr	x0, [x19, 816]
	mov	w23, 1
	ldrb	w3, [x21, 3722]
	add	x1, x21, 3736
	mov	x2, 664
	strb	w3, [x0, 1]
	ldr	x0, [x19, 816]
	strb	w23, [x0, 2]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 5]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 7]
	ldr	x0, [x19, 816]
	strb	wzr, [x0, 3]
	ldr	x0, [x19, 816]
	ldrb	w3, [x21, 3732]
	strb	w3, [x0]
	ldr	x0, [x19, 816]
	str	wzr, [x0, 40]
	ldr	x0, [x19, 816]
	add	x0, x0, 72
	bl	memcpy
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 364]
	str	w1, [x0, 816]
	ldr	x0, [x19, 816]
	ldr	w1, [x0, 816]
	str	w1, [x0, 44]
	str	w1, [x0, 768]
	ldr	x0, [x19, 816]
	strb	w23, [x0, 784]
	ldrb	w1, [x21, 3727]
	ldr	x0, [x19, 816]
	cmp	w1, 1
	cset	w1, eq
	strb	w1, [x0, 4]
	b	.L3312
	.p2align 3
.L3255:
	ldr	x3, [x19, 816]
	cbz	x3, .L3316
.L3260:
	mov	x2, 664
	add	x1, x21, 3736
	add	x0, x3, 72
	ldr	x24, [x3, 712]
	ldr	x23, [x3, 720]
	ldr	x22, [x3, 728]
	bl	memcpy
	ldr	x0, [x20, 280]
	cmn	x0, #1
	ccmn	x24, #1, 4, eq
	beq	.L3261
	ldr	x0, [x19, 816]
	str	x24, [x0, 712]
.L3261:
	ldr	x0, [x20, 288]
	ldr	x1, [x19, 816]
	cmp	x0, x23
	csel	x0, x0, x23, ls
	str	x0, [x1, 720]
	ldr	x0, [x20, 296]
	ldr	x1, [x19, 816]
	cmp	x0, x22
	csel	x0, x0, x22, ls
	str	x0, [x1, 728]
	ldr	x1, [x19, 816]
	ldrb	w0, [x1, 1]
	cbz	w0, .L3262
	ldrb	w0, [x21, 3722]
.L3262:
	strb	w0, [x1, 1]
	mov	w4, 2
	mov	w3, 3
	ldr	x1, [x19, 816]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 2
	strb	w0, [x1, 2]
	ldr	x1, [x19, 816]
	ldrb	w0, [x21, 3732]
	ldrb	w2, [x1]
	cmp	w0, w2, uxtb
	csel	w0, w0, w2, cs
	strb	w0, [x1]
	ldr	x0, [x19, 816]
	strb	w4, [x0, 832]
	ldr	x0, [x19, 816]
	strb	w3, [x0, 736]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 364]
	str	w1, [x0, 864]
	ldr	x1, [x19, 816]
	ldr	w2, [x1, 816]
	ldr	w0, [x1, 864]
	add	w0, w2, w0
	lsr	w0, w0, 1
	str	w0, [x1, 768]
	ldr	x0, [x19, 816]
	ldr	w1, [x0, 768]
	str	w1, [x0, 44]
	ldr	x0, [x19, 816]
	ldr	x1, [x0, 840]
	str	x1, [x0, 744]
	ldrb	w0, [x21, 3727]
	ldr	x1, [x19, 816]
	cmp	w0, 1
	beq	.L3317
.L3263:
	ldrb	w0, [x1, 4]
.L3264:
	strb	w0, [x1, 4]
	mov	w2, 0
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 332]
	str	w1, [x0, 32]
	b	.L3310
	.p2align 3
.L3245:
	ldr	x3, [x19, 816]
	cbz	x3, .L3318
.L3249:
	mov	x2, 664
	add	x1, x21, 3736
	add	x0, x3, 72
	ldr	x24, [x3, 712]
	ldr	x23, [x3, 720]
	ldr	x22, [x3, 728]
	bl	memcpy
	ldr	x0, [x20, 280]
	cmn	x0, #1
	ccmn	x24, #1, 4, eq
	beq	.L3250
	ldr	x0, [x19, 816]
	str	x24, [x0, 712]
.L3250:
	ldr	x0, [x20, 288]
	ldr	x1, [x19, 816]
	cmp	x0, x23
	csel	x0, x0, x23, ls
	str	x0, [x1, 720]
	ldr	x0, [x20, 296]
	ldr	x1, [x19, 816]
	cmp	x0, x22
	csel	x0, x0, x22, ls
	str	x0, [x1, 728]
	ldr	x1, [x19, 816]
	ldrb	w0, [x1, 1]
	cbz	w0, .L3251
	ldrb	w0, [x21, 3722]
.L3251:
	strb	w0, [x1, 1]
	mov	w4, 1
	mov	w3, 3
	ldr	x1, [x19, 816]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 1
	strb	w0, [x1, 2]
	ldr	x1, [x19, 816]
	ldrb	w0, [x21, 3732]
	ldrb	w2, [x1]
	cmp	w0, w2, uxtb
	csel	w0, w0, w2, cs
	strb	w0, [x1]
	ldr	x0, [x19, 816]
	strb	w4, [x0, 784]
	ldr	x0, [x19, 816]
	strb	w3, [x0, 736]
	ldr	x0, [x19, 816]
	ldr	w1, [x20, 364]
	str	w1, [x0, 816]
	ldr	x1, [x19, 816]
	ldr	w2, [x1, 816]
	ldr	w0, [x1, 864]
	add	w0, w2, w0
	lsr	w0, w0, w4
	str	w0, [x1, 768]
	ldr	x0, [x19, 816]
	ldr	w1, [x0, 768]
	str	w1, [x0, 44]
	ldr	x0, [x19, 816]
	ldr	x1, [x0, 792]
	str	x1, [x0, 744]
	ldrb	w0, [x21, 3727]
	ldr	x1, [x19, 816]
	cmp	w0, 1
	bne	.L3263
	ldrb	w0, [x1, 4]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L3264
	.p2align 3
.L3314:
	ldr	x2, .LC895
	mov	w4, w0
	ldr	x1, .LC897
	mov	w3, 2534
	add	x2, x2, 256
	mov	w0, 22
	bl	dprint_vfmw
	b	.L3242
	.p2align 3
.L3317:
	ldrb	w0, [x1, 4]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L3264
	.p2align 3
.L3246:
	ldr	x0, [x20, 304]
	mov	w22, 0
	str	x0, [x19, 816]
	str	x0, [x0, 792]
	b	.L3247
	.p2align 3
.L3256:
	ldr	x0, [x20, 304]
	mov	w22, 0
	str	x0, [x19, 816]
	str	x0, [x0, 840]
	b	.L3257
	.p2align 3
.L3316:
	ldr	x0, [x20, 304]
	str	x0, [x19, 816]
	str	x0, [x0, 840]
	ldr	x3, [x19, 816]
	b	.L3260
	.p2align 3
.L3318:
	ldr	x0, [x20, 304]
	str	x0, [x19, 816]
	str	x0, [x0, 792]
	ldr	x3, [x19, 816]
	b	.L3249
	.size	MVC_DirectOutput, .-MVC_DirectOutput
	.align	3
.LC895:
	.xword	.LANCHOR0
	.align	3
.LC897:
	.xword	.LC896
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_GetRemainImg
	.type	MVC_DEC_GetRemainImg, %function
MVC_DEC_GetRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x19, x22, 11124736
	bl	_mcount
	ldr	w0, [x19, 920]
	cbz	w0, .L3333
	mov	w20, 0
	mov	w21, 0
	b	.L3322
	.p2align 3
.L3321:
	ldr	w0, [x19, 920]
	cmp	w0, w21
	bls	.L3360
.L3322:
	uxtw	x0, w21
	add	w21, w21, 1
	add	x0, x0, 1388544
	add	x0, x22, x0, lsl 3
	ldr	x0, [x0, 16920]
	cbz	x0, .L3321
	ldrb	w1, [x0, 5]
	cbz	w1, .L3321
	ldrsb	w1, [x0, 6]
	ldr	w0, [x22, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L3321
	ldrb	w0, [x0, 1]
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 1
	ldr	w0, [x19, 920]
	csinc	w20, w20, w20, hi
	cmp	w0, w21
	bhi	.L3322
.L3360:
	mov	w21, -1
	cbnz	w20, .L3326
	b	.L3323
	.p2align 3
.L3324:
	add	x1, x22, x1, lsl 3
	ldr	x1, [x1, 16920]
	bl	MVC_OutputFrmToVO
	mov	w21, w0
	subs	w20, w20, #1
	beq	.L3358
.L3326:
	add	x2, x29, 60
	mov	w1, -1
	add	x3, x29, 56
	mov	x0, x22
	bl	MVC_GetMinPOC
	ldr	w1, [x29, 56]
	mov	w2, w20
	mov	x0, x22
	cmn	w1, #1
	uxtw	x1, w1
	add	x1, x1, 1388544
	bne	.L3324
.L3358:
	ldr	w0, [x19, 920]
	cbz	w0, .L3320
.L3325:
	mov	w20, 0
	b	.L3329
	.p2align 3
.L3328:
	ldr	w0, [x19, 920]
	cmp	w0, w20
	bls	.L3320
.L3329:
	uxtw	x0, w20
	add	w20, w20, 1
	add	x0, x0, 1388544
	add	x0, x22, x0, lsl 3
	ldr	x1, [x0, 16920]
	cbz	x1, .L3328
	ldrb	w0, [x1, 3]
	cbz	w0, .L3328
	mov	x0, x22
	bl	MVC_UnMarkFrameStoreRef
	ldr	w0, [x19, 920]
	cmp	w0, w20
	bhi	.L3329
.L3320:
	mov	w1, -1
	mov	x0, x22
	bl	MVC_RemoveUnUsedFrameStore
	cbnz	w21, .L3331
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L3323:
	cbnz	w0, .L3325
	mov	w1, w21
	mov	x0, x22
	bl	MVC_RemoveUnUsedFrameStore
.L3331:
	add	x0, x22, 912
	bl	GetVoLastImageID
	mov	w21, w0
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L3333:
	mov	w21, -1
	b	.L3320
	.size	MVC_DEC_GetRemainImg, .-MVC_DEC_GetRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	MVC_InitDPB.part.15, %function
MVC_InitDPB.part.15:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 11124736
	add	x19, x22, 536
	add	x21, x22, 664
	bl	_mcount
	.p2align 2
.L3365:
	ldr	x0, [x19]
	mov	w2, 1
	cbz	x0, .L3362
	ldrsb	w1, [x0, 6]
	ldr	w0, [x20, 120]
	bl	FSP_ClearLogicFs
.L3362:
	ldr	x0, [x19, 128]
	mov	w2, 1
	cbz	x0, .L3363
	ldrsb	w1, [x0, 6]
	ldr	w0, [x20, 120]
	bl	FSP_ClearLogicFs
.L3363:
	ldr	x0, [x19, 256]
	mov	w2, 1
	cbz	x0, .L3364
	ldrsb	w1, [x0, 6]
	ldr	w0, [x20, 120]
	bl	FSP_ClearLogicFs
.L3364:
	str	xzr, [x19, 128]
	str	xzr, [x19, 256]
	str	xzr, [x19], 8
	cmp	x19, x21
	bne	.L3365
	add	x1, x22, 768
	ldr	w0, [x20, 44]
	stp	w0, wzr, [x1, 152]
	stp	wzr, wzr, [x1, 160]
	str	wzr, [x22, 936]
	ldr	x1, [x20, 816]
	cbz	x1, .L3367
	ldrb	w0, [x20, 8]
	cmp	w0, 2
	beq	.L3368
.L3372:
	add	x0, x20, 11161600
	ldr	x0, [x0, 304]
	cbz	x0, .L3370
	ldrsb	w1, [x0, 6]
	mov	w2, 1
	ldr	w0, [x20, 120]
	bl	FSP_ClearLogicFs
.L3370:
	str	xzr, [x20, 816]
.L3367:
	ldr	x3, .LC901
	mov	w1, 0
	mov	x2, 344
	add	x0, x22, 944
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x22, 1156]
	ldr	w0, [x22, 920]
	add	x1, x20, 220
	str	w0, [x22, 1152]
	add	x0, x20, 148
	.p2align 2
.L3374:
	str	wzr, [x0], 4
	cmp	x0, x1
	bne	.L3374
	add	x1, x20, 288
	add	x0, x20, 552
	.p2align 2
.L3375:
	str	xzr, [x1], 8
	cmp	x1, x0
	bne	.L3375
	add	x1, x20, 11116544
	add	x20, x20, 816
	str	wzr, [x1, 3016]
	.p2align 2
.L3376:
	str	xzr, [x0], 8
	cmp	x20, x0
	bne	.L3376
	str	wzr, [x1, 3020]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L3368:
	mov	w2, 0
	mov	x0, x20
	bl	MVC_OutputFrmToVO
	cbnz	w0, .L3393
.L3371:
	ldr	x0, [x20, 816]
	cbnz	x0, .L3372
	b	.L3367
	.p2align 3
.L3393:
	ldr	x2, .LC898
	mov	w4, w0
	ldr	x1, .LC900
	mov	w3, 5952
	add	x2, x2, 280
	mov	w0, 22
	bl	dprint_vfmw
	b	.L3371
	.size	MVC_InitDPB.part.15, .-MVC_InitDPB.part.15
	.align	3
.LC898:
	.xword	.LANCHOR0
	.align	3
.LC900:
	.xword	.LC899
	.align	3
.LC901:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InitDPB
	.type	MVC_InitDPB, %function
MVC_InitDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L3396
	mov	x0, x19
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_InitDPB.part.15
.L3395:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3396:
	mov	w0, -1
	b	.L3395
	.size	MVC_InitDPB, .-MVC_InitDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearDPB
	.type	MVC_ClearDPB, %function
MVC_ClearDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	MVC_FlushDPB
	cbnz	w0, .L3405
	cbz	x19, .L3401
.L3399:
	mov	x0, x19
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_InitDPB.part.15
	cbnz	w0, .L3401
	strb	wzr, [x19, 6]
	mov	w0, 0
	str	wzr, [x19, 220]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3405:
	ldr	x2, .LC902
	mov	w3, 310
	ldr	x1, .LC904
	mov	w0, 22
	add	x2, x2, 296
	bl	dprint_vfmw
	cbnz	x19, .L3399
.L3401:
	ldr	x2, .LC902
	mov	w3, 315
	ldr	x1, .LC906
	mov	w0, 22
	add	x2, x2, 296
	bl	dprint_vfmw
	strb	wzr, [x19, 6]
	str	wzr, [x19, 220]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_ClearDPB, .-MVC_ClearDPB
	.align	3
.LC902:
	.xword	.LANCHOR0
	.align	3
.LC904:
	.xword	.LC903
	.align	3
.LC906:
	.xword	.LC905
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecVDM
	.type	MVC_DecVDM, %function
MVC_DecVDM:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11157504
	bl	_mcount
	ldrb	w0, [x21, 3723]
	cbz	w0, .L3407
	ldrb	w0, [x21, 3721]
	cmp	w0, 1
	beq	.L3407
.L3408:
	ldr	w20, [x19, 108]
	ldrb	w0, [x19, 8]
	ubfx	x20, x20, 16, 2
	cmp	w20, w0
	beq	.L3409
	sub	w0, w0, #2
	uxtb	w0, w0
	cmp	w0, 1
	ccmp	w20, 1, 2, ls
	bls	.L3477
.L3409:
	uxtb	w20, w20
	strb	w20, [x19, 8]
	cmp	w20, 2
	beq	.L3412
	cmp	w20, 3
	beq	.L3413
	cmp	w20, 1
	beq	.L3478
	ldrb	w0, [x19, 11]
	cmp	w0, 1
	beq	.L3479
.L3420:
	ldr	w0, [x19, 64]
.L3432:
	ldrb	w1, [x21, 3733]
	strb	w1, [x19, 11]
.L3421:
	cbz	w0, .L3475
	ldrb	w0, [x21, 3732]
	cmp	w0, 2
	beq	.L3480
	cmp	w0, 1
	add	x20, x19, 11161600
	beq	.L3481
.L3424:
	ldr	w2, [x19, 88]
	mov	w0, 2
	ldr	x1, .LC912
	ldrb	w3, [x21, 3723]
	sub	w2, w2, #1
	bl	dprint_vfmw
	ldr	w1, [x20, 380]
	ldr	w0, [x20, 384]
	str	w0, [x20, 3144]
	mov	w0, 1
	str	w1, [x20, 3148]
	strb	w0, [x20, 2298]
	mov	w0, 0
	ldr	w1, [x19, 64]
	str	w1, [x20, 3348]
	ldr	w1, [x19, 88]
	cbz	w1, .L3457
	ldrb	w0, [x21, 3732]
	cbnz	w0, .L3425
	ldr	x0, .LC913
	ldr	x5, [x0]
	cbz	x5, .L3426
	ldr	x1, [x20, 3352]
	cbz	x1, .L3435
	mov	w2, 0
	.p2align 2
.L3428:
	ldp	w3, w0, [x1, 8]
	ldr	x1, [x1, 4056]
	add	w0, w3, w0
	add	w0, w0, 7
	add	w2, w2, w0, lsr 3
	mov	w4, w2
	cbnz	x1, .L3428
.L3427:
	add	x2, x29, 64
	ldr	w0, [x19, 120]
	mov	w1, 20
	mov	w3, 4
	str	w4, [x2, -8]!
	blr	x5
	ldr	x1, [x19, 224]
.L3429:
	add	x2, x20, 2296
	str	x2, [x19, 232]
	ldr	w0, [x1, 904]
	cmp	w0, 1
	beq	.L3482
.L3430:
	cmp	w0, 2
	beq	.L3483
.L3431:
	ldr	w2, [x1, 632]
	mov	w0, 0
	str	w2, [x20, 3616]
	ldr	w1, [x1, 672]
	str	w1, [x20, 3620]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3407:
	ldp	w0, w1, [x19, 140]
	ldr	x2, [x19, 224]
	add	w0, w0, 1
	cmp	w0, w1
	csel	w0, w0, w1, ge
	str	w0, [x19, 140]
	sub	w0, w0, w1
	str	w0, [x2, 616]
	b	.L3408
	.p2align 3
.L3413:
	mov	x0, x19
	mov	w21, -1
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	ldr	w4, [x19, 40]
	mov	w1, 7
	mov	w3, 23352
	movk	w3, 0x1, lsl 16
	mov	w2, 2
	strb	w1, [x0, 531]
	mov	w1, 32
	strb	wzr, [x0, 528]
	strb	w2, [x0, 529]
	strb	w1, [x0, 530]
	str	w4, [x0, 540]
	str	w3, [x0, 544]
	str	w20, [x0, 552]
.L3471:
	add	x6, x0, 512
	mov	w2, 262144
	mov	w1, w21
	mov	x0, x19
	stp	w21, wzr, [x6, 44]
	stp	wzr, w2, [x6, 52]
	bl	MVC_ClearDPB
	mov	w0, w21
.L3457:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3478:
	ldrb	w0, [x21, 3732]
	cmp	w0, 2
	bne	.L3420
	add	x20, x19, 11161600
	ldr	w0, [x20, 328]
	cbz	w0, .L3417
	ldrb	w0, [x19, 11]
	cmp	w0, 1
	bne	.L3420
.L3433:
	ldrb	w1, [x21, 3733]
	strb	w1, [x19, 11]
	ldr	w0, [x19, 64]
	b	.L3421
	.p2align 3
.L3412:
	ldrb	w0, [x21, 3732]
	cbnz	w0, .L3417
	ldr	w0, [x19, 64]
	cbz	w0, .L3432
	ldr	x1, [x19, 864]
	ldr	w1, [x1, 48]
	cbz	w1, .L3432
.L3417:
	mov	w1, 1
	mov	x0, x19
	strb	w1, [x21, 3727]
	b	.L3474
	.p2align 3
.L3425:
	add	x0, x19, 11124736
	ldr	w0, [x0, 924]
	cbnz	w0, .L3426
	ldr	x1, [x19, 224]
	ldr	w0, [x1, 12]
	cmp	w0, 2
	beq	.L3429
.L3475:
	mov	x0, x19
.L3474:
	bl	MVC_ClearAllSlice
	add	x1, x19, 11120640
	ldr	w8, [x19, 40]
	mov	w7, 23352
	mov	w6, 2
	movk	w7, 0x1, lsl 16
	mov	w0, -1
	mov	w5, 7
	mov	w4, 32
	mov	w3, 3
	mov	w2, 262144
	strb	wzr, [x1, 528]
	strb	w6, [x1, 529]
	str	w8, [x1, 540]
	str	w7, [x1, 544]
.L3472:
	strb	w4, [x1, 530]
	add	x4, x1, 512
	strb	w5, [x1, 531]
	stp	w3, w0, [x4, 40]
	stp	wzr, wzr, [x4, 48]
	str	w2, [x1, 568]
	b	.L3457
	.p2align 3
.L3480:
	ldrb	w22, [x19, 7]
	add	x20, x19, 11161600
	cmp	w22, 2
	bne	.L3424
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 12]
	cbnz	w0, .L3424
	ldr	x1, .LC910
	mov	w0, 1
	ldr	w3, [x20, 328]
	mov	w21, -1
	ldr	w2, [x20, 332]
	bl	dprint_vfmw
	mov	x0, x19
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	ldr	w4, [x19, 40]
	add	x5, x0, 512
	mov	w3, 23352
	movk	w3, 0x1, lsl 16
	mov	w2, 7
	strb	wzr, [x0, 528]
	mov	w1, 32
	strb	w2, [x0, 531]
	mov	w2, 3
	strb	w1, [x0, 530]
	mov	w1, 262144
	strb	w22, [x0, 529]
	str	w4, [x0, 540]
	str	w3, [x0, 544]
	stp	w2, w21, [x5, 40]
	stp	wzr, wzr, [x5, 48]
	str	w1, [x0, 568]
	mov	w2, 0
	ldr	x1, [x20, 304]
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
	mov	w0, w21
	b	.L3457
	.p2align 3
.L3481:
	ldr	w1, [x20, 392]
	cbnz	w1, .L3424
	strb	w0, [x19, 7]
	b	.L3424
	.p2align 3
.L3426:
	ldr	x1, [x19, 224]
	add	x2, x20, 2296
	str	x2, [x19, 232]
	ldr	w0, [x1, 904]
	cmp	w0, 1
	bne	.L3430
.L3482:
	cbz	x2, .L3431
	ldrb	w21, [x21, 3732]
	cmp	w21, 2
	bne	.L3431
	str	xzr, [x19, 232]
	mov	w2, 0
	ldr	w0, [x19, 120]
	ldr	x1, [x20, 304]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
	mov	x0, x19
.L3473:
	bl	MVC_ClearAllSlice
	add	x1, x19, 11120640
	ldr	w7, [x19, 40]
	mov	w6, 23352
	mov	w0, -1
	movk	w6, 0x1, lsl 16
	mov	w5, 7
	mov	w4, 32
	mov	w3, 3
	mov	w2, 262144
	strb	wzr, [x1, 528]
	strb	w21, [x1, 529]
	str	w7, [x1, 540]
	str	w6, [x1, 544]
	b	.L3472
	.p2align 3
.L3479:
	ldrb	w0, [x21, 3732]
	cmp	w0, 2
	beq	.L3433
	b	.L3420
	.p2align 3
.L3483:
	ldr	w0, [x1, 908]
	cmp	w0, wzr
	ccmp	x2, xzr, 4, gt
	beq	.L3431
	ldrb	w21, [x21, 3732]
	cmp	w21, 2
	bne	.L3431
	str	xzr, [x19, 232]
	mov	w2, 0
	ldr	w0, [x19, 120]
	ldr	x1, [x20, 304]
	ldrsb	w1, [x1, 6]
	bl	FSP_SetDisplay
	ldr	x2, [x19, 224]
	mov	x0, x19
	ldr	w1, [x2, 908]
	sub	w1, w1, #1
	str	w1, [x2, 908]
	b	.L3473
	.p2align 3
.L3435:
	mov	w4, 0
	b	.L3427
.L3477:
	ldr	x1, .LC908
	mov	w2, w20
	mov	w0, 2
	mov	w21, -1
	bl	dprint_vfmw
	strb	w20, [x19, 8]
	mov	x0, x19
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	ldr	w4, [x19, 40]
	mov	w2, 2
	mov	w1, 7
	mov	w3, 23352
	movk	w3, 0x1, lsl 16
	strb	w2, [x0, 529]
	strb	w1, [x0, 531]
	mov	w2, 32
	mov	w1, 3
	strb	wzr, [x0, 528]
	strb	w2, [x0, 530]
	str	w4, [x0, 540]
	str	w3, [x0, 544]
	str	w1, [x0, 552]
	b	.L3471
	.size	MVC_DecVDM, .-MVC_DecVDM
	.align	3
.LC908:
	.xword	.LC907
	.align	3
.LC910:
	.xword	.LC909
	.align	3
.LC912:
	.xword	.LC911
	.align	3
.LC913:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_FlushDecoder
	.type	MVC_FlushDecoder, %function
MVC_FlushDecoder:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 11116544
	mov	w1, 1
	mov	x0, x19
	strb	w1, [x2, 2973]
	str	wzr, [x2, 3024]
	strb	w1, [x19]
	bl	MVC_DecVDM
	cbz	w0, .L3484
	ldr	x2, .LC914
	mov	w3, 12981
	ldr	x1, .LC916
	mov	w0, 22
	add	x2, x2, 312
	bl	dprint_vfmw
.L3484:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	MVC_FlushDecoder, .-MVC_FlushDecoder
	.align	3
.LC914:
	.xword	.LANCHOR0
	.align	3
.LC916:
	.xword	.LC915
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ReceivePacket
	.type	MVC_ReceivePacket, %function
MVC_ReceivePacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 11161600
	bl	_mcount
	ldr	x1, .LC918
	mov	w0, 7
	ldp	w3, w4, [x20, 16]
	ldr	x2, [x20, 8]
	bl	dprint_vfmw
	str	wzr, [x21, 3632]
	ldr	x0, [x19, 224]
	ldr	w1, [x0, 872]
	cmp	w1, 1
	beq	.L3554
.L3490:
	ldr	x0, [x19, 240]
	cbz	x0, .L3495
	ldrb	w1, [x20]
	cmp	w1, 1
	beq	.L3555
.L3493:
	ldr	x1, .LC920
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 240]
	cbz	x1, .L3495
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L3495:
	ldr	w0, [x20, 20]
	cmp	w0, wzr
	ble	.L3497
	ldr	x0, [x20, 8]
	cbz	x0, .L3497
	ldr	w0, [x20, 16]
	cbz	w0, .L3497
	ldrb	w0, [x19, 1521]
	cbz	w0, .L3515
	add	x1, x19, 1617
	mov	x0, 1
	b	.L3500
	.p2align 3
.L3499:
	add	w0, w0, 1
	cmp	w0, 137
	beq	.L3513
.L3500:
	ldrb	w2, [x1]
	add	x1, x1, 96
	cbnz	w2, .L3499
	sxtw	x1, w0
.L3498:
	lsl	x2, x0, 2
	mov	w3, 1
	sub	x0, x2, x0
	cmn	w1, #1
	add	x0, x19, x0, lsl 5
	strb	w3, [x0, 1521]
	beq	.L3513
	lsl	x0, x1, 2
	mov	w2, 1
	sub	x0, x0, x1
	lsl	x0, x0, 5
	add	x1, x0, 1520
	add	x0, x19, x0
	add	x1, x19, x1
	str	x1, [x19, 240]
	ldr	x1, [x20, 8]
	str	x1, [x0, 1528]
	ldr	w1, [x20, 20]
	str	w1, [x0, 1536]
	ldr	w1, [x20, 16]
	str	w1, [x0, 1540]
	ldr	x0, [x19, 240]
	str	wzr, [x0, 28]
	ldr	x0, [x19, 240]
	ldr	w1, [x20, 24]
	str	w1, [x0, 36]
	ldr	x0, [x19, 240]
	ldr	x1, [x20, 32]
	str	x1, [x0, 88]
	ldr	x0, [x19, 240]
	str	w2, [x0, 76]
	ldr	x0, [x19, 240]
	strb	wzr, [x0]
	ldr	x0, [x19, 240]
	ldrb	w1, [x20]
	strb	w1, [x0, 3]
	ldr	x0, [x19, 240]
	b	.L3505
	.p2align 3
.L3555:
	ldr	w2, [x0, 76]
	cmp	w2, 1
	bhi	.L3493
	ldrb	w2, [x0, 3]
	cmp	w2, 1
	bne	.L3494
	b	.L3493
	.p2align 3
.L3554:
	ldr	w0, [x0, 912]
	cbz	w0, .L3490
	ldr	x0, [x19, 240]
	cbz	x0, .L3495
	ldrb	w1, [x20]
.L3494:
	strb	w1, [x0, 3]
	ldr	x0, [x19, 224]
	ldr	w1, [x0, 872]
	cmp	w1, 1
	beq	.L3556
.L3507:
	ldr	w0, [x20, 20]
	cmp	w0, wzr
	ble	.L3508
	ldr	x1, [x20, 8]
	cbz	x1, .L3508
	ldr	w0, [x20, 16]
	cbz	w0, .L3508
	ldr	x0, [x19, 240]
	ldr	w2, [x0, 76]
	cmp	w2, 1
	bls	.L3557
.L3509:
	mov	w1, 1
	strb	w1, [x0, 3]
	ldr	w0, [x19, 120]
	ldr	w1, [x20, 24]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC923
	ldr	x4, [x0]
	cbz	x4, .L3551
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3551:
	ldr	x0, [x19, 240]
.L3505:
	ldrb	w0, [x0, 3]
	ldp	x19, x20, [sp, 16]
	cmp	w0, wzr
	ldr	x21, [sp, 32]
	csetm	w0, eq
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3497:
	ldr	x1, .LC925
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 120]
	ldr	w1, [x20, 24]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC923
	ldr	x4, [x0]
	cbz	x4, .L3553
.L3552:
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3553:
	mov	w0, -1
.L3560:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3508:
	ldr	x0, [x19, 240]
	b	.L3509
	.p2align 3
.L3556:
	ldr	w0, [x0, 912]
	cbnz	w0, .L3551
	b	.L3507
	.p2align 3
.L3557:
	ubfiz	x2, x2, 5, 32
	add	x0, x0, x2
	str	x1, [x0, 8]
	ldr	x1, [x19, 240]
	ldr	w2, [x20, 20]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 16]
	ldr	x1, [x19, 240]
	ldr	w2, [x20, 16]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 20]
	ldr	x1, [x19, 240]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	wzr, [x0, 28]
	ldr	x1, [x19, 240]
	ldr	w2, [x20, 24]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 36]
	ldr	x1, [x19, 240]
	ldr	w0, [x1, 76]
	add	w0, w0, 1
	str	w0, [x1, 76]
	ldr	x0, [x19, 240]
	ldr	w1, [x0, 16]
	cmp	w1, 4095
	bls	.L3558
.L3510:
	mov	w1, 1
	str	w1, [x21, 3632]
	b	.L3505
	.p2align 3
.L3558:
	mov	x0, x19
	bl	MVC_CombinePacket.part.12
	ldr	x0, [x19, 240]
	b	.L3510
.L3513:
	ldr	x1, .LC922
	mov	w0, 0
	add	x21, x19, 12288
	add	x20, x19, 1520
	add	x21, x21, 2384
	bl	dprint_vfmw
	b	.L3502
	.p2align 3
.L3501:
	add	x20, x20, 96
	cmp	x21, x20
	beq	.L3559
.L3502:
	ldrb	w0, [x20, 1]
	cmp	w0, 1
	bne	.L3501
	ldr	w0, [x19, 120]
	mov	x1, x20
	bl	MVC_ReleaseNAL
	b	.L3501
.L3559:
	mov	x0, x19
	mov	w20, -1
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	mov	w3, 23352
	movk	w3, 0x1, lsl 16
	ldr	w4, [x19, 40]
	mov	w2, 2
	mov	w1, 7
	str	w3, [x0, 544]
	add	x3, x0, 512
	strb	w2, [x0, 529]
	mov	w2, 32
	strb	w1, [x0, 531]
	mov	w1, 3
	strb	w2, [x0, 530]
	mov	w2, 262144
	str	w4, [x0, 540]
	strb	wzr, [x0, 528]
	stp	w1, w20, [x3, 40]
	stp	wzr, wzr, [x3, 48]
	str	w2, [x0, 568]
	mov	w1, w20
	mov	x0, x19
	bl	MVC_ClearDPB
	ldr	x0, .LC923
	ldr	x4, [x0]
	cbnz	x4, .L3552
	mov	w0, -1
	b	.L3560
.L3515:
	mov	x1, 0
	mov	x0, 0
	b	.L3498
	.size	MVC_ReceivePacket, .-MVC_ReceivePacket
	.align	3
.LC918:
	.xword	.LC917
	.align	3
.LC920:
	.xword	.LC919
	.align	3
.LC922:
	.xword	.LC921
	.align	3
.LC923:
	.xword	g_event_report
	.align	3
.LC925:
	.xword	.LC924
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_ClearAll
	.type	MVC_ClearAll, %function
MVC_ClearAll:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	w22, w1
	mov	x0, x30
	add	x1, x20, 11120640
	mov	x23, x1
	str	x1, [x29, 104]
	bl	_mcount
	add	x21, x20, 12288
	ldr	x1, .LC927
	mov	w0, 22
	add	x19, x20, 1520
	add	x21, x21, 2384
	bl	dprint_vfmw
	mov	x0, x20
	bl	MVC_ClearAllSlice
	mov	w1, 23352
	ldr	w2, [x20, 40]
	movk	w1, 0x1, lsl 16
	mov	w0, 7
	mov	w4, 2
	mov	w3, 32
	strb	w0, [x23, 531]
	mov	w0, 262144
	str	w2, [x23, 540]
	mov	w2, 3
	str	w1, [x23, 544]
	mov	w1, -1
	strb	wzr, [x23, 528]
	strb	w4, [x23, 529]
	strb	w3, [x23, 530]
	str	wzr, [x23, 560]
	str	wzr, [x23, 564]
	str	w0, [x23, 568]
	str	w2, [x23, 552]
	str	w1, [x23, 556]
	b	.L3563
	.p2align 3
.L3562:
	add	x19, x19, 96
	cmp	x19, x21
	beq	.L3594
.L3563:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L3562
	ldr	w0, [x20, 120]
	mov	x1, x19
	add	x19, x19, 96
	bl	MVC_ReleaseNAL
	cmp	x19, x21
	bne	.L3563
.L3594:
	cbz	x20, .L3566
	mov	x0, x20
	bl	MVC_ClearAllSlice
	mov	x0, x20
	bl	MVC_InitDPB.part.15
	cbnz	w0, .L3566
.L3565:
	cbz	w22, .L3567
	ldr	w0, [x20, 120]
	add	x1, x20, 912
	bl	FSP_ClearNotInVoQueue
.L3568:
	mov	x25, x20
	mov	w28, 0
	mov	w26, -1
	mov	w21, 1
	mov	w24, 18
	mov	w23, 16
	mov	w22, 2
	.p2align 2
.L3571:
	add	x0, x25, 11124736
	add	x2, x0, 1280
	add	x1, x0, 1288
	add	x19, x0, 1960
	add	x27, x0, 1992
	strb	wzr, [x0, 1289]
	strb	wzr, [x0, 1290]
	strb	wzr, [x0, 1291]
	strb	wzr, [x0, 1293]
	strb	w21, [x0, 1295]
	strb	wzr, [x0, 2024]
	strb	w21, [x0, 2072]
	strb	w22, [x0, 2120]
	stp	wzr, w26, [x2, 28]
	stp	wzr, wzr, [x2, 36]
	str	w24, [x0, 1336]
	str	w23, [x0, 1340]
	str	w28, [x0, 1540]
	str	x1, [x0, 2032]
	str	x1, [x0, 2080]
	str	x1, [x0, 2128]
.L3570:
	ldr	x1, [x19]
	cbnz	x1, .L3595
.L3569:
	add	x19, x19, 8
	cmp	x19, x27
	bne	.L3570
	add	w28, w28, 1
	add	x25, x25, 880
	cmp	w28, 40
	bne	.L3571
	add	x22, x20, 11161600
	add	x19, x22, 240
	add	x21, x22, 272
.L3573:
	ldr	x1, [x19]
	cbnz	x1, .L3596
.L3572:
	add	x19, x19, 8
	cmp	x21, x19
	bne	.L3573
	ldr	w2, [x20, 60]
	mov	w19, 0
	cbz	w2, .L3577
	.p2align 2
.L3584:
	add	x21, x20, x19, uxtw 3
	add	w19, w19, 1
	ldr	x0, [x21, 832]
	mov	x1, x0
	cbz	x0, .L3575
	ldr	w0, [x20, 120]
	bl	FreeUsdByDec
	str	xzr, [x21, 832]
	ldr	w2, [x20, 60]
.L3575:
	cmp	w2, w19
	bhi	.L3584
.L3577:
	ldr	x0, .LC930
	add	x19, x20, 11116544
	strb	wzr, [x20, 4]
	mov	x2, 1656
	strb	wzr, [x20, 9]
	mov	w1, 0
	strb	wzr, [x20, 6]
	strb	wzr, [x20, 7]
	strb	wzr, [x20, 3]
	stp	wzr, wzr, [x20, 60]
	str	wzr, [x20, 104]
	ldr	x3, [x0, 96]
	ldr	x0, [x29, 104]
	str	wzr, [x20, 220]
	str	xzr, [x20, 240]
	add	x20, x20, 11157504
	strb	wzr, [x0, 2580]
	strb	wzr, [x0, 576]
	strb	wzr, [x0, 2581]
	strb	wzr, [x0, 577]
	add	x0, x19, 2968
	blr	x3
	mov	w1, 2
	mov	w0, 1
	strb	w1, [x19, 2968]
	strb	w0, [x19, 2973]
	mov	w0, 256
	strb	wzr, [x20, 3720]
	str	w0, [x22, 1184]
	mov	w0, 0
	strb	wzr, [x22, 1176]
	str	wzr, [x22, 1180]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3595:
	ldr	w0, [x20, 120]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L3569
.L3596:
	ldr	w0, [x20, 120]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L3572
.L3567:
	add	x0, x20, 912
	bl	ResetVoQueue
	ldr	w0, [x20, 120]
	bl	FSP_EmptyInstance
	b	.L3568
.L3566:
	ldr	x2, .LC928
	mov	w3, 340
	ldr	x1, .LC929
	mov	w0, 22
	add	x2, x2, 336
	bl	dprint_vfmw
	b	.L3565
	.size	MVC_ClearAll, .-MVC_ClearAll
	.align	3
.LC927:
	.xword	.LC926
	.align	3
.LC928:
	.xword	.LANCHOR0
	.align	3
.LC929:
	.xword	.LC905
	.align	3
.LC930:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InsertFrmInDPB
	.type	MVC_InsertFrmInDPB, %function
MVC_InsertFrmInDPB:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x23, x0
	mov	x0, x30
	uxtw	x21, w1
	mov	x19, x2
	bl	_mcount
	add	x0, x23, 11124736
	ldr	w0, [x0, 924]
	cbnz	w0, .L3598
	ldr	x0, .LC931
	str	wzr, [x0, 1948]
.L3598:
	ldrb	w22, [x19, 3]
	cmp	w22, 1
	beq	.L3600
	cbz	w22, .L3601
	cmp	w22, 2
	beq	.L3602
	ldr	x1, .LC935
	mov	w2, w22
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x23
	bl	MVC_ClearAll
.L3606:
	mov	w0, w19
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3602:
	ldr	x0, [x19, 680]
	mov	w1, 3
	strb	w1, [x0, 736]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3620
	add	x20, x23, x21, lsl 3
	add	x20, x20, 11124736
	ldr	x0, [x20, 536]
	cbz	x0, .L3620
	strb	w22, [x0, 832]
	ldr	x0, [x20, 536]
	ldr	x1, [x19, 680]
	str	x1, [x0, 840]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 833]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 834]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 720]
	str	w1, [x0, 856]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 12]
	strb	w1, [x0, 835]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 740]
	str	w1, [x0, 864]
	ldr	x0, [x20, 536]
	ldr	w2, [x0, 816]
	ldr	w1, [x0, 864]
	add	w1, w2, w1
	str	w1, [x0, 44]
	str	w1, [x0, 768]
	ldr	x1, [x20, 536]
	ldrb	w0, [x1, 1]
	cbz	w0, .L3626
	ldrb	w0, [x19, 2]
.L3626:
	strb	w0, [x1, 1]
	ldr	x1, [x20, 536]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 2
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 536]
	cmp	w0, 1
	beq	.L3694
	ldrb	w0, [x1, 4]
.L3628:
	strb	w0, [x1, 4]
	mov	x2, 664
	add	x1, x19, 16
	ldr	x0, [x20, 536]
	add	x0, x0, 72
	ldr	x25, [x0, 640]
	ldr	x24, [x0, 648]
	ldr	x22, [x0, 656]
	bl	memcpy
	ldr	x0, [x19, 656]
	cmn	x0, #1
	ccmn	x25, #1, 4, eq
	beq	.L3629
	ldr	x0, [x20, 536]
	str	x25, [x0, 712]
.L3629:
	ldr	x0, [x19, 664]
	ldr	x1, [x20, 536]
	cmp	x0, x24
	csel	x0, x0, x24, ls
	str	x0, [x1, 720]
	ldr	x0, [x19, 672]
	ldr	x1, [x20, 536]
	cmp	x0, x22
	csel	x0, x0, x22, ls
	str	x0, [x1, 728]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3630
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3630
.L3631:
	ldr	x1, [x20, 536]
	ldrb	w2, [x1, 835]
	ldrb	w0, [x1, 787]
	cmp	w0, w2, uxtb
	csel	w0, w0, w2, cs
	strb	w0, [x1]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 736]
	str	w1, [x0, 860]
	ldr	x1, [x20, 536]
	ldr	w0, [x1, 812]
	ldr	w2, [x1, 860]
	cmp	w0, w2
	csel	w0, w0, w2, le
	str	w0, [x1, 36]
	ldr	x0, [x20, 536]
	bl	MVC_CombineFldsToFrm
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 11]
	strb	w1, [x0, 13]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 10]
	strb	w1, [x0, 11]
	ldr	x1, [x20, 536]
	ldr	w0, [x1, 52]
	ldr	w1, [x1, 856]
	add	x0, x0, 2781184
	add	x0, x0, 272
	str	w1, [x23, x0, lsl 2]
	b	.L3619
	.p2align 3
.L3601:
	add	x20, x23, x21, lsl 3
	ldr	x1, [x19, 680]
	add	x20, x20, 11124736
	mov	w2, 3
	mov	w0, 3
	str	x1, [x20, 536]
	ldrb	w3, [x19, 2]
	strb	w3, [x1, 1]
	ldr	x1, [x20, 536]
	strb	w2, [x1, 2]
	ldr	x2, [x19, 680]
	ldr	x1, [x20, 536]
	ldrb	w2, [x2, 5]
	strb	w2, [x1, 5]
	ldr	x2, [x19, 680]
	ldr	x1, [x20, 536]
	ldrb	w2, [x2, 7]
	strb	w2, [x1, 7]
	ldrb	w2, [x19, 4]
	ldr	x1, [x20, 536]
	cbz	w2, .L3695
.L3603:
	strb	w0, [x1, 3]
	mov	x2, 664
	add	x1, x19, 16
	mov	w22, 3
	ldr	x0, [x20, 536]
	ldr	w3, [x19, 764]
	str	w3, [x0, 48]
	ldr	x0, [x20, 536]
	add	x0, x0, 72
	bl	memcpy
	ldr	x0, [x20, 536]
	mov	w6, 1
	ldr	w1, [x19, 740]
	str	w1, [x0, 44]
	str	w1, [x0, 768]
	ldr	x0, [x20, 536]
	ldr	x1, [x19, 680]
	str	x1, [x0, 744]
	str	x1, [x0, 792]
	str	x1, [x0, 840]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 700]
	str	w1, [x0, 28]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 696]
	str	w1, [x0, 20]
	ldr	x0, [x20, 536]
	strb	wzr, [x0, 736]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 737]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 738]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 12]
	strb	w1, [x0, 739]
	strb	w1, [x0]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 9]
	str	w1, [x0, 40]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 708]
	str	w1, [x0, 32]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 712]
	str	w1, [x0, 760]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 716]
	str	w1, [x0, 808]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 720]
	str	w1, [x0, 856]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 724]
	str	w1, [x0, 36]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 728]
	str	w1, [x0, 764]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 732]
	str	w1, [x0, 812]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 736]
	str	w1, [x0, 860]
	ldrb	w1, [x19, 7]
	ldr	x0, [x20, 536]
	cmp	w1, 1
	csel	w22, wzr, w22, ne
	strb	w22, [x0, 4]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 768]
	str	w1, [x0, 56]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 772]
	str	w1, [x0, 60]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 11]
	strb	w1, [x0, 13]
	strb	w1, [x0, 12]
	ldr	x1, .LC931
	ldr	x2, [x20, 536]
	ldrb	w3, [x19, 10]
	ldr	w0, [x1, 1948]
	strb	w3, [x2, 11]
	strb	w3, [x2, 10]
	add	w2, w0, 1
	str	w2, [x1, 1948]
	ldr	x1, [x20, 536]
	str	w0, [x1, 64]
	ldr	x0, [x20, 536]
	ldrb	w2, [x0, 739]
	ldr	x1, [x0, 744]
	ldrb	w4, [x0, 737]
	ldrb	w3, [x0, 738]
	ldr	w5, [x0, 768]
	strb	w2, [x0, 787]
	strb	w2, [x0, 835]
	mov	w2, 0
	str	x1, [x0, 792]
	str	x1, [x0, 840]
	mov	w1, 2
	strb	w4, [x0, 785]
	strb	w3, [x0, 786]
	strb	w6, [x0, 784]
	strb	w4, [x0, 833]
	strb	w3, [x0, 834]
	str	w5, [x0, 816]
	str	w5, [x0, 864]
	strb	w1, [x0, 832]
	mov	x0, x23
	ldr	x1, [x19, 680]
	bl	MVC_GetAPC
	cbnz	w0, .L3696
.L3619:
	add	x21, x21, 1388544
	mov	w19, 0
	add	x21, x23, x21, lsl 3
	ldr	x0, [x21, 16920]
	ldrb	w1, [x0, 3]
	cbz	w1, .L3606
	ldrsb	w1, [x0, 6]
	mov	w2, 1
	ldr	w0, [x23, 120]
	bl	FSP_SetRef
	ldr	x25, [sp, 64]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3600:
	ldr	x0, [x19, 680]
	mov	w1, 3
	strb	w1, [x0, 736]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3607
	add	x20, x23, x21, lsl 3
	add	x20, x20, 11124736
	ldr	x0, [x20, 536]
	cbz	x0, .L3607
	strb	w22, [x0, 784]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 12]
	strb	w1, [x0, 787]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 785]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 786]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 716]
	str	w1, [x0, 808]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 12]
	strb	w1, [x0, 787]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 740]
	str	w1, [x0, 816]
	ldr	x0, [x20, 536]
	ldr	w2, [x0, 816]
	ldr	w1, [x0, 864]
	add	w1, w2, w1
	str	w1, [x0, 44]
	str	w1, [x0, 768]
	ldr	x1, [x20, 536]
	ldrb	w0, [x1, 1]
	cbz	w0, .L3612
	ldrb	w0, [x19, 2]
.L3612:
	strb	w0, [x1, 1]
	ldr	x1, [x20, 536]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 1
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 536]
	cmp	w0, 1
	beq	.L3697
	ldrb	w0, [x1, 4]
.L3614:
	strb	w0, [x1, 4]
	mov	x2, 664
	add	x1, x19, 16
	ldr	x0, [x20, 536]
	add	x0, x0, 72
	ldr	x25, [x0, 640]
	ldr	x24, [x0, 648]
	ldr	x22, [x0, 656]
	bl	memcpy
	ldr	x0, [x19, 656]
	cmn	x0, #1
	ccmn	x25, #1, 4, eq
	beq	.L3615
	ldr	x0, [x20, 536]
	str	x25, [x0, 712]
.L3615:
	ldr	x0, [x19, 664]
	ldr	x1, [x20, 536]
	cmp	x0, x24
	csel	x0, x0, x24, ls
	str	x0, [x1, 720]
	ldr	x0, [x19, 672]
	ldr	x1, [x20, 536]
	cmp	x0, x22
	csel	x0, x0, x22, ls
	str	x0, [x1, 728]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3616
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3616
.L3617:
	ldr	x1, [x20, 536]
	ldrb	w2, [x1, 835]
	ldrb	w0, [x1, 787]
	cmp	w0, w2, uxtb
	csel	w0, w0, w2, cs
	strb	w0, [x1]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 732]
	str	w1, [x0, 812]
	ldr	x1, [x20, 536]
	ldr	w0, [x1, 812]
	ldr	w2, [x1, 860]
	cmp	w0, w2
	csel	w0, w0, w2, le
	str	w0, [x1, 36]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 11]
	strb	w1, [x0, 12]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 10]
	strb	w1, [x0, 10]
	ldr	x0, [x20, 536]
	bl	MVC_CombineFldsToFrm
	ldr	x1, [x20, 536]
	ldr	w0, [x1, 52]
	ldr	w1, [x1, 808]
	add	x0, x0, 2781184
	add	x0, x0, 256
	str	w1, [x23, x0, lsl 2]
	b	.L3619
	.p2align 3
.L3607:
	add	x20, x23, x21, lsl 3
	ldr	x0, [x19, 680]
	add	x20, x20, 11124736
	mov	w1, 1
	str	x0, [x20, 536]
	strb	w1, [x0, 784]
	ldr	x0, [x20, 536]
	ldr	x2, [x19, 680]
	str	x2, [x0, 792]
	ldr	x0, [x20, 536]
	ldrb	w2, [x19, 4]
	strb	w2, [x0, 785]
	ldr	x0, [x20, 536]
	ldrb	w2, [x19, 5]
	strb	w2, [x0, 786]
	ldr	x0, [x20, 536]
	ldr	w2, [x19, 716]
	str	w2, [x0, 808]
	ldr	x0, [x20, 536]
	ldrb	w2, [x19, 12]
	strb	w2, [x0, 787]
	ldr	x0, [x20, 536]
	ldr	w2, [x19, 740]
	str	w2, [x0, 816]
	ldr	x0, [x20, 536]
	ldr	w2, [x0, 816]
	str	w2, [x0, 44]
	str	w2, [x0, 768]
	ldr	x0, [x20, 536]
	ldrb	w2, [x19, 2]
	strb	w2, [x0, 1]
	ldr	x0, [x20, 536]
	strb	w1, [x0, 2]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 536]
	ldrb	w1, [x1, 5]
	strb	w1, [x0, 5]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 536]
	ldrb	w1, [x1, 7]
	strb	w1, [x0, 7]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3609
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3609
.L3610:
	ldr	x0, [x20, 536]
	mov	x2, 664
	add	x1, x19, 16
	str	wzr, [x0, 40]
	ldr	x0, [x20, 536]
	add	x0, x0, 72
	bl	memcpy
	ldr	x0, [x20, 536]
	mov	w2, 1
	ldr	w1, [x19, 764]
	ldr	x3, .LC931
	str	w1, [x0, 48]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 696]
	str	w1, [x0, 20]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 708]
	str	w1, [x0, 32]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 724]
	str	w1, [x0, 36]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 12]
	strb	w1, [x0]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 732]
	str	w1, [x0, 812]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 768]
	str	w1, [x0, 56]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 772]
	str	w1, [x0, 60]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 11]
	strb	w1, [x0, 12]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 10]
	strb	w1, [x0, 10]
	mov	x0, x23
	ldr	x4, [x20, 536]
	ldr	w1, [x3, 1948]
	str	w1, [x4, 64]
	add	w5, w1, w2
	str	w5, [x3, 1948]
	ldr	x1, [x20, 536]
	ldrb	w3, [x19, 7]
	cmp	w3, w2
	cset	w3, eq
	strb	w3, [x1, 4]
	ldr	x1, [x19, 680]
	bl	MVC_GetAPC
	cbz	w0, .L3619
	ldr	x1, .LC933
	mov	w3, w0
	mov	w2, 2292
	b	.L3692
	.p2align 3
.L3620:
	add	x20, x23, x21, lsl 3
	ldr	x0, [x19, 680]
	add	x20, x20, 11124736
	mov	w1, 2
	str	x0, [x20, 536]
	strb	w1, [x0, 832]
	ldr	x0, [x20, 536]
	ldr	x2, [x19, 680]
	str	x2, [x0, 840]
	ldr	x0, [x20, 536]
	ldrb	w2, [x19, 4]
	strb	w2, [x0, 833]
	ldr	x0, [x20, 536]
	ldrb	w2, [x19, 5]
	strb	w2, [x0, 834]
	ldr	x0, [x20, 536]
	ldr	w2, [x19, 720]
	str	w2, [x0, 856]
	ldr	x0, [x20, 536]
	ldrb	w2, [x19, 12]
	strb	w2, [x0, 835]
	ldr	x0, [x20, 536]
	ldr	w2, [x19, 740]
	str	w2, [x0, 864]
	ldr	x0, [x20, 536]
	ldr	w2, [x0, 816]
	str	w2, [x0, 44]
	str	w2, [x0, 768]
	ldr	x0, [x20, 536]
	ldrb	w2, [x19, 2]
	strb	w2, [x0, 1]
	ldr	x0, [x20, 536]
	strb	w1, [x0, 2]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 536]
	ldrb	w1, [x1, 5]
	strb	w1, [x0, 5]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 536]
	ldrb	w1, [x1, 7]
	strb	w1, [x0, 7]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3622
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3622
.L3623:
	ldr	x0, [x20, 536]
	mov	x2, 664
	add	x1, x19, 16
	str	wzr, [x0, 40]
	ldr	x0, [x20, 536]
	add	x0, x0, 72
	bl	memcpy
	ldr	x0, [x20, 536]
	mov	w2, 2
	ldr	w1, [x19, 764]
	str	w1, [x0, 48]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 696]
	str	w1, [x0, 20]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 708]
	str	w1, [x0, 32]
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 724]
	str	w1, [x0, 36]
	ldr	x0, [x20, 536]
	ldrb	w1, [x19, 12]
	strb	w1, [x0, 835]
	strb	w1, [x0]
	mov	x0, x23
	ldr	x1, [x20, 536]
	ldr	w3, [x19, 736]
	str	w3, [x1, 860]
	ldr	x1, [x20, 536]
	ldr	w3, [x19, 768]
	str	w3, [x1, 56]
	ldr	x1, [x20, 536]
	ldr	w3, [x19, 772]
	str	w3, [x1, 60]
	ldr	x1, [x20, 536]
	ldrb	w3, [x19, 11]
	strb	w3, [x1, 13]
	ldr	x1, [x20, 536]
	ldrb	w3, [x19, 10]
	strb	w3, [x1, 11]
	ldr	x4, [x20, 536]
	ldr	x3, .LC931
	ldr	w1, [x3, 1948]
	str	w1, [x4, 64]
	add	w1, w1, 1
	str	w1, [x3, 1948]
	ldrb	w3, [x19, 7]
	ldr	x1, [x20, 536]
	cmp	w3, 1
	csel	w22, w22, wzr, eq
	strb	w22, [x1, 4]
	ldr	x1, [x19, 680]
	bl	MVC_GetAPC
	cbz	w0, .L3619
	ldr	x1, .LC933
	mov	w3, w0
	mov	w2, 2417
.L3692:
	mov	w0, 0
	mov	w19, -1
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x23
	bl	MVC_ClearDPB
	b	.L3606
	.p2align 3
.L3695:
	ldrb	w0, [x19, 5]
	mov	w2, 3
	cmp	w0, wzr
	csel	w0, w0, w2, eq
	b	.L3603
	.p2align 3
.L3609:
	ldr	x0, [x20, 536]
	mov	w1, 1
	strb	w1, [x0, 3]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3610
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 700]
	str	w1, [x0, 28]
	b	.L3610
	.p2align 3
.L3622:
	ldr	x0, [x20, 536]
	mov	w1, 2
	strb	w1, [x0, 3]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3623
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 700]
	str	w1, [x0, 28]
	b	.L3623
	.p2align 3
.L3630:
	ldr	x1, [x20, 536]
	ldrb	w0, [x1, 3]
	orr	w0, w0, 2
	strb	w0, [x1, 3]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3631
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 700]
	str	w1, [x0, 28]
	b	.L3631
	.p2align 3
.L3616:
	ldr	x1, [x20, 536]
	ldrb	w0, [x1, 3]
	orr	w0, w0, 1
	strb	w0, [x1, 3]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3617
	ldr	x0, [x20, 536]
	ldr	w1, [x19, 700]
	str	w1, [x0, 28]
	b	.L3617
	.p2align 3
.L3694:
	ldrb	w0, [x1, 4]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L3628
	.p2align 3
.L3697:
	ldrb	w0, [x1, 4]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L3614
.L3696:
	ldr	x1, .LC933
	mov	w3, w0
	mov	w2, 2229
	b	.L3692
	.size	MVC_InsertFrmInDPB, .-MVC_InsertFrmInDPB
	.align	3
.LC931:
	.xword	.LANCHOR3
	.align	3
.LC933:
	.xword	.LC932
	.align	3
.LC935:
	.xword	.LC934
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_AllocFrameStore
	.type	MVC_AllocFrameStore, %function
MVC_AllocFrameStore:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x23, x0
	mov	x0, x30
	add	x20, x23, 11116544
	mov	w21, w1
	bl	_mcount
	mov	w25, 0
	ldrb	w0, [x20, 2969]
	cbz	w0, .L3699
	ldrb	w0, [x20, 2970]
	mov	w25, 2
	cmp	w0, wzr
	csinc	w25, w25, wzr, ne
.L3699:
	cmp	w21, 1
	ldrb	w0, [x23, 8]
	beq	.L3700
	cmp	w0, 2
	add	x24, x23, 11157504
	beq	.L3790
	sub	w0, w25, #1
	strb	wzr, [x24, 3721]
	cmp	w0, 1
	bls	.L3794
.L3702:
	strb	wzr, [x24, 3720]
	ldr	w5, [x23, 48]
	cbz	w5, .L3726
	add	x4, x23, 11124736
	mov	x3, 0
	add	x19, x4, 1288
	.p2align 2
.L3725:
	ldrb	w0, [x19, 2]
	cbnz	w0, .L3720
	cbz	x19, .L3721
	ldr	w0, [x4, 920]
	cbz	w0, .L3721
	ldr	x1, [x4, 536]
	cmp	x1, x19
	ccmp	x1, xzr, 4, eq
	bne	.L3720
	sub	w2, w0, #1
	add	x0, x4, 544
	add	x2, x2, 1388544
	add	x2, x2, 2116
	add	x2, x23, x2, lsl 3
	b	.L3723
	.p2align 3
.L3724:
	ldr	x1, [x0], 8
	cmp	x1, x19
	ccmp	x1, xzr, 4, eq
	bne	.L3720
.L3723:
	cmp	x2, x0
	bne	.L3724
.L3721:
	lsl	x22, x3, 3
	add	x26, x23, 11161600
	sub	x22, x22, x3
	mov	w27, 1
	lsl	x22, x22, 3
	strb	w27, [x24, 3720]
	sub	x3, x22, x3
	str	x19, [x26, 304]
	mov	w4, 101
	mov	x2, 664
	add	x22, x23, x3, lsl 4
	add	x0, x24, 3736
	add	x22, x22, 11124736
	add	x1, x22, 1360
	str	wzr, [x22, 1332]
	str	w4, [x26, 364]
	bl	memcpy
	str	wzr, [x24, 3920]
	strb	wzr, [x22, 1292]
	strb	wzr, [x19, 7]
	ldr	x0, [x26, 304]
	strb	wzr, [x0, 3]
	ldr	x0, [x26, 304]
	strb	w27, [x0, 5]
	ldr	x0, [x26, 304]
	str	wzr, [x0, 16]
	ldrb	w19, [x24, 3720]
	cmp	w19, 1
	bne	.L3726
	cmp	w21, wzr
	ldr	w0, [x23, 120]
	cset	w1, eq
	bl	FSP_NewLogicFs
	mov	w22, w0
	mov	w1, w0
	ldr	w0, [x23, 120]
	bl	FSP_GetLogicFs
	mov	x27, x0
	cmp	w22, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L3727
	add	x1, x0, 8
	ldr	x0, [x23, 224]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L3795
.L3728:
	ldr	x19, .LC940
	mov	x2, 664
	ldr	x0, [x26, 304]
	ldr	x3, [x19, 104]
	add	x0, x0, 72
	blr	x3
	ldr	x1, [x26, 304]
	mov	x2, 664
	ldr	x3, [x19, 104]
	add	x0, x24, 3736
	add	x1, x1, 72
	blr	x3
	ldr	x0, [x26, 304]
	strb	w22, [x0, 6]
	ldrsb	w0, [x27, 4]
	str	w0, [x26, 388]
.L3719:
	uxtb	w1, w25
	cmp	w21, 1
	strb	w1, [x24, 3723]
	beq	.L3738
.L3802:
	ldrb	w0, [x20, 2969]
	mov	w3, 3
	ldr	x2, [x26, 304]
	cmp	w0, wzr
	csel	w0, w0, w3, eq
	strb	w0, [x2, 736]
	ldrb	w0, [x24, 3721]
	cmp	w0, 1
	beq	.L3796
	strb	w1, [x26, 1176]
	add	x0, x23, 11120640
	ldr	w1, [x20, 2996]
	str	w1, [x26, 1184]
	ldrb	w1, [x20, 2976]
	str	w1, [x26, 1180]
	ldr	w1, [x23, 128]
	str	w1, [x26, 1188]
	ldr	w0, [x0, 512]
	str	w0, [x26, 1200]
	str	w22, [x26, 1192]
	cbnz	w25, .L3797
	strb	wzr, [x26, 1177]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3720:
	add	w3, w3, 1
	add	x19, x19, 880
	cmp	w3, w5
	bne	.L3725
.L3726:
	ldr	x1, .LC939
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x23
	bl	MVC_ClearAll
	mov	w0, -1
.L3785:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3797:
	mov	w1, 1
	strb	w1, [x26, 1177]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3700:
	cmp	w0, 2
	beq	.L3798
	add	x24, x23, 11157504
	mov	w25, 0
.L3790:
	strb	wzr, [x24, 3721]
	b	.L3702
.L3794:
	add	x26, x23, 11161600
	ldrb	w0, [x26, 1176]
	cbz	w0, .L3703
	add	x1, x23, 11120640
	ldr	w2, [x26, 1200]
	ldr	w1, [x1, 512]
	cmp	w2, w1
	beq	.L3704
.L3703:
	add	x0, x23, 11124736
	ldr	w1, [x0, 920]
	subs	w1, w1, #1
	bmi	.L3702
	add	x3, x23, 11120640
	b	.L3713
	.p2align 3
.L3706:
	cmp	w25, 2
	beq	.L3799
.L3705:
	subs	w1, w1, #1
	bmi	.L3702
.L3713:
	sxtw	x0, w1
	add	x0, x0, 1388544
	add	x0, x23, x0, lsl 3
	ldr	x19, [x0, 16920]
	cbz	x19, .L3705
	cmp	w25, 1
	bne	.L3706
	ldrb	w0, [x19, 2]
	cmp	w0, 2
	bne	.L3705
.L3707:
	ldr	w0, [x19, 20]
	ldr	w2, [x20, 2996]
	cmp	w2, w0
	bne	.L3705
	ldr	w2, [x3, 512]
	ldr	w0, [x19, 56]
	cmp	w2, w0
	bne	.L3705
	ldrb	w0, [x20, 2976]
	cbz	w0, .L3800
	ldrb	w0, [x19, 3]
	cbz	w0, .L3705
.L3709:
	mov	w0, 1
	strb	w0, [x24, 3721]
	add	x1, x19, 72
	mov	x2, 664
	add	x0, x24, 3736
	str	x19, [x26, 304]
	bl	memcpy
	ldrsb	w1, [x19, 6]
	ldr	w0, [x23, 120]
	bl	FSP_GetLogicFs
	cbz	x0, .L3801
	ldrsb	w0, [x0, 4]
	str	w0, [x26, 388]
	ldrb	w0, [x24, 3721]
	cbz	w0, .L3702
	ldr	x0, [x26, 304]
	cbz	x0, .L3702
.L3789:
	uxtb	w1, w25
	cmp	w21, 1
	strb	w1, [x24, 3723]
	mov	w22, 0
	bne	.L3802
.L3738:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 112
	ret
.L3795:
	ldp	w3, w2, [x23, 12]
	ldr	w19, [x1, 164]
	lsl	w2, w2, 4
	ldr	w0, [x1, 44]
	str	w2, [x1, 132]
	mul	w19, w2, w19
	lsl	w2, w3, 4
	str	w2, [x1, 128]
	add	w0, w19, w0
	str	w0, [x1, 48]
	str	x1, [x29, 104]
	bl	MEM_Phy2Vir
	ldr	x1, [x29, 104]
	ldr	w2, [x1, 28]
	ldr	w3, [x1, 164]
	str	x0, [x1, 552]
	add	w2, w19, w2
	ldr	w0, [x1, 60]
	str	w2, [x1, 32]
	add	w2, w3, w2
	add	w0, w19, w0
	str	w2, [x1, 40]
	str	w0, [x1, 64]
	bl	MEM_Phy2Vir
	ldr	x1, [x29, 104]
	str	x0, [x1, 568]
	b	.L3728
	.p2align 3
.L3799:
	ldrb	w0, [x19, 2]
	cmp	w0, 1
	bne	.L3705
	b	.L3707
.L3796:
	strb	wzr, [x26, 1176]
	add	x1, x23, 11120640
	mov	w0, 0
	ldr	w2, [x20, 2996]
	str	w2, [x26, 1184]
	ldrb	w2, [x20, 2976]
	str	w2, [x26, 1180]
	ldr	w2, [x23, 128]
	str	w2, [x26, 1188]
	strb	wzr, [x26, 1177]
	str	w22, [x26, 1192]
	ldr	w1, [x1, 512]
	str	w1, [x26, 1200]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3798:
	add	x24, x23, 11157504
	mov	w25, 0
	strb	wzr, [x24, 3721]
	b	.L3702
.L3800:
	ldrb	w0, [x19, 3]
	cbnz	w0, .L3705
	b	.L3709
	.p2align 3
.L3704:
	cmp	w0, 1
	ccmp	w25, 2, 0, eq
	beq	.L3714
	cmp	w0, 2
	ccmp	w25, 1, 0, eq
	bne	.L3702
.L3714:
	ldr	w0, [x20, 2996]
	ldr	w1, [x26, 1184]
	cmp	w1, w0
	bne	.L3702
	ldrb	w0, [x20, 2976]
	cbnz	w0, .L3715
	ldr	w0, [x26, 1180]
	cbnz	w0, .L3702
.L3716:
	ldp	w1, w0, [x23, 124]
	sub	w0, w0, w1
	cmp	w0, 2
	bhi	.L3702
	mov	w0, 1
	strb	w0, [x24, 3721]
	ldr	x0, [x26, 304]
	cbz	x0, .L3790
	cmp	w25, 2
	beq	.L3803
	cmp	w25, 1
	mov	w22, 0
	bne	.L3719
	ldrb	w0, [x0, 2]
	cmp	w0, 2
	beq	.L3719
	strb	wzr, [x24, 3721]
	b	.L3702
	.p2align 3
.L3727:
	strb	wzr, [x24, 3720]
	mov	w0, 0
	ldr	x1, .LC942
	ldr	x2, [x26, 304]
	strb	wzr, [x2, 5]
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x23
	bl	MVC_ClearAll
	mov	w0, -1
	b	.L3785
.L3801:
	ldr	x1, .LC937
	mov	w2, 6621
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3785
.L3803:
	ldrb	w0, [x0, 2]
	cmp	w0, 1
	beq	.L3789
	strb	wzr, [x24, 3721]
	b	.L3702
.L3715:
	ldr	w0, [x26, 1180]
	cbz	w0, .L3702
	b	.L3716
	.size	MVC_AllocFrameStore, .-MVC_AllocFrameStore
	.align	3
.LC937:
	.xword	.LC936
	.align	3
.LC939:
	.xword	.LC938
	.align	3
.LC940:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC942:
	.xword	.LC941
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_Init
	.type	MVC_DEC_Init, %function
MVC_DEC_Init:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x22, .LC943
	mov	x2, 24136
	mov	w1, 0
	movk	x2, 0xaa, lsl 16
	mov	x0, x20
	ldr	x3, [x22, 96]
	ldr	w21, [x20, 1512]
	blr	x3
	str	w21, [x20, 1512]
	add	x0, x20, 912
	bl	ResetVoQueue
	strb	wzr, [x20]
	stp	x19, xzr, [x20, 224]
	ldr	w0, [x19, 28]
	cmp	w0, 25
	beq	.L3813
	mov	w2, 32
	mov	w1, 256
	mov	w0, 136
	str	w1, [x20, 40]
	stp	w0, w2, [x20, 32]
.L3806:
	ldr	w0, [x19, 624]
	mov	w21, 2240
	bl	MEM_Phy2Vir
	ldr	x1, [x20, 224]
	mov	w2, 3992
	ldp	w4, w5, [x20, 36]
	ldrsw	x3, [x1, 620]
	smull	x2, w4, w2
	add	x3, x0, x3
	add	x1, x3, x2
	cmp	x1, xzr
	smaddl	x0, w5, w21, x1
	ccmp	x3, xzr, 4, ne
	str	x0, [x20, 864]
	ccmp	x0, xzr, 4, ne
	stp	x3, x1, [x20, 272]
	beq	.L3814
	ldr	w1, [x19, 648]
	cbz	w1, .L3815
.L3809:
	add	x2, x20, 11112448
	ldr	x6, [x22, 96]
	mov	w1, 0
	add	x23, x20, 12288
	add	x19, x23, 2396
	add	x21, x20, 10768384
	str	w4, [x2, 440]
	add	x21, x21, 4060
	str	w5, [x2, 3712]
	ldrsw	x3, [x20, 32]
	lsl	x2, x3, 7
	sub	x2, x2, x3
	lsl	x2, x2, 5
	blr	x6
	strb	wzr, [x20, 4]
	ldr	w0, [x20, 108]
	mov	w1, 40
	strb	wzr, [x20, 6]
	mov	x2, 9856
	ubfx	x0, x0, 16, 2
	strb	w0, [x20, 8]
	mov	w0, 18
	strb	wzr, [x20, 7]
	stp	w1, w0, [x20, 48]
	add	x0, x20, 512
	str	wzr, [x20, 220]
	stp	wzr, wzr, [x20, 56]
	stp	wzr, wzr, [x20, 68]
	stp	wzr, wzr, [x20, 76]
	stp	wzr, wzr, [x20, 84]
	stp	wzr, wzr, [x20, 92]
	stp	xzr, xzr, [x0, 320]
	stp	xzr, xzr, [x0, 336]
	movk	x2, 0xa4, lsl 16
	mov	w1, 0
	ldr	x3, [x22, 96]
	mov	x0, x19
	blr	x3
	mov	x2, 8500
	ldr	x3, [x22, 96]
	mov	w1, 0
	movk	x2, 0x5, lsl 16
	mov	x0, x21
	blr	x3
	mov	x0, x19
	.p2align 2
.L3810:
	add	x1, x0, 274432
	add	x2, x0, 335872
	strb	wzr, [x0]
	add	x0, x2, 308
	cmp	x21, x0
	strb	wzr, [x1, 241]
	bne	.L3810
	add	x0, x20, 11108352
	strb	wzr, [x23, 2384]
	add	x0, x0, 3792
	mov	w1, 32
	str	x0, [x20, 248]
	mov	x0, x20
	strb	wzr, [x20, 2]
	stp	wzr, w1, [x20, 20]
	str	w1, [x20, 28]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x20, 120]
	beq	.L3816
	mov	w1, 0
	mov	x0, x20
	bl	MVC_ClearAll
	mov	w0, 1
.L3808:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L3815:
	ldr	x4, [x22, 96]
	mov	x0, x3
	blr	x4
	ldr	w2, [x20, 40]
	mov	w1, 0
	ldr	x0, [x20, 280]
	ldr	x3, [x22, 96]
	smull	x2, w2, w21
	blr	x3
	ldp	w4, w5, [x20, 36]
	ldr	x0, [x20, 864]
	b	.L3809
.L3813:
	ldr	w0, [x19, 724]
	str	w0, [x20, 36]
	ldr	w0, [x19, 728]
	str	w0, [x20, 40]
	ldr	w0, [x19, 716]
	str	w0, [x20, 32]
	b	.L3806
.L3814:
	ldr	x2, .LC944
	mov	w3, 13910
	ldr	x1, .LC946
	mov	w0, 22
	add	x2, x2, 352
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3808
.L3816:
	ldr	x1, .LC948
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3808
	.size	MVC_DEC_Init, .-MVC_DEC_Init
	.align	3
.LC943:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC944:
	.xword	.LANCHOR0
	.align	3
.LC946:
	.xword	.LC945
	.align	3
.LC948:
	.xword	.LC947
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_StorePicInDpb
	.type	MVC_StorePicInDpb, %function
MVC_StorePicInDpb:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x25, x19, 11157504
	bl	_mcount
	add	x0, x19, 11116544
	strb	wzr, [x0, 1832]
	ldrb	w1, [x25, 3723]
	cmp	w1, 2
	cset	w1, eq
	strb	w1, [x0, 1833]
	ldrb	w0, [x25, 3720]
	cbz	w0, .L3987
	ldr	w0, [x19, 128]
	add	x21, x19, 11161600
	str	w0, [x19, 124]
	ldrb	w0, [x25, 3733]
	cbz	w0, .L3820
	ldr	x0, [x21, 312]
	ldrb	w0, [x0, 1]
	cbz	w0, .L3821
	cbz	x19, .L3823
	mov	x0, x19
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_InitDPB.part.15
	cbnz	w0, .L3823
.L3820:
	ldrb	w0, [x19, 8]
	cmp	w0, 2
	beq	.L3988
	ldr	x20, [x19, 224]
	ldr	w0, [x20, 12]
	cmp	w0, wzr
	ble	.L3989
.L3827:
	ldrb	w1, [x25, 3722]
	cbz	w1, .L3990
.L3828:
	cmp	w0, 2
	ldr	w0, [x21, 328]
	beq	.L3991
.L3852:
	cbz	w0, .L3860
	ldr	w3, [x19, 112]
	ldr	w2, [x21, 364]
	cmp	w3, w2
	bcs	.L3861
	ldrb	w0, [x25, 3722]
	cbz	w0, .L3992
.L3861:
	mov	x0, x19
	bl	MVC_Marking
	cbnz	w0, .L3993
	mov	x0, x19
	bl	MVC_UpdateReflist
	mov	x0, x19
	bl	MVC_UpdateLTReflist
	ldr	w1, [x21, 392]
	mov	x0, x19
	bl	MVC_RemoveUnUsedFrameStore
.L3853:
	ldrb	w0, [x25, 3721]
	cmp	w0, 1
	beq	.L3864
	add	x20, x19, 11124736
	ldr	w0, [x20, 920]
.L3865:
	ldr	w1, [x21, 328]
	cbz	w1, .L3874
	ldr	w4, [x20, 928]
	ldr	w5, [x20, 932]
	add	w1, w4, w5
	cmp	w1, w0
	bcs	.L3900
.L3874:
	mov	w23, -1
	mov	w22, w23
	b	.L3883
	.p2align 3
.L3877:
	ldr	w22, [x29, 88]
.L3878:
	ldr	w3, [x21, 328]
	mov	w1, w22
	mov	x0, x19
	mov	w23, w2
	cbnz	w3, .L3879
	ldr	w3, [x21, 332]
	ldr	w2, [x29, 84]
	cmp	w3, w2
	blt	.L3994
.L3879:
	bl	MVC_OutputFrmFromDPB
	cmn	w0, #1
	mov	w24, w0
	beq	.L3882
	ldr	w0, [x20, 920]
.L3883:
	ldr	w4, [x20, 924]
	add	x3, x29, 88
	add	x2, x29, 84
	mov	w1, -1
	cmp	w4, w0
	mov	x0, x19
	bcc	.L3876
	bl	MVC_GetMinPOC
	tbnz	w0, #31, .L3995
	ldr	w2, [x20, 924]
	cmp	w23, w2
	bne	.L3877
	ldr	w0, [x29, 88]
	cmp	w22, w0
	beq	.L3996
	mov	w22, w0
	b	.L3878
	.p2align 3
.L3990:
	ldrb	w2, [x25, 3723]
	ldr	x23, [x21, 304]
	sub	w1, w2, #1
	uxtb	w1, w1
	cbnz	w2, .L3997
.L3829:
	cmp	w1, 1
	bls	.L3998
.L3971:
	cbnz	w2, .L3999
.L3834:
	cmp	w0, wzr
	ble	.L3904
	add	x24, x25, 3720
	mov	x22, x23
.L3837:
	cbz	w2, .L3839
	ldrb	w0, [x24, 1]
	cmp	w0, 1
	beq	.L4000
.L3839:
	ldr	w0, [x24, 740]
	str	w0, [x22, 44]
.L3840:
	mov	x1, x22
	mov	x0, x19
	bl	MVC_GetImagePara
	ldrsb	w1, [x22, 6]
	ldr	w0, [x19, 120]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L4001
	ldr	x0, [x24, 656]
	str	x0, [x20, 640]
	ldr	x0, [x24, 664]
	str	x0, [x20, 648]
	ldr	x0, [x24, 672]
	str	x0, [x20, 656]
	ldr	w0, [x22, 44]
	str	w0, [x20, 184]
	cbz	w0, .L3847
	ldrb	w1, [x20, 124]
	and	w1, w1, 3
	cbz	w1, .L4002
.L3845:
	ldr	x1, [x19, 224]
	ldr	w1, [x1, 4]
	cmp	w1, w0
	bcc	.L4003
.L3847:
	ldrsb	w1, [x22, 6]
	mov	w2, 1
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
	ldr	w0, [x19, 120]
	mov	x4, x20
	add	x3, x19, 912
	mov	x2, x19
	mov	w1, 15
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L3844
	ldrsb	w1, [x22, 6]
	mov	w2, 0
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
.L3844:
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L4004
	str	wzr, [x20, 24]
.L3850:
	ldr	w0, [x19, 136]
	add	w0, w0, 2
	str	w0, [x19, 136]
.L3838:
	ldr	w0, [x19, 220]
	cmp	w0, 2
	beq	.L3851
.L3836:
	mov	w0, 1
	str	w0, [x22, 16]
	strb	w0, [x23, 8]
.L3851:
	ldr	x0, [x19, 224]
	mov	w1, 2
	str	w1, [x19, 220]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	ldr	w0, [x21, 328]
	bne	.L3852
.L3991:
	cbz	w0, .L3853
	add	x20, x19, 11124736
	mov	x0, x19
	bl	MVC_SimpleSlideDPB
	ldr	w1, [x20, 920]
	cbz	w1, .L3854
	ldr	x0, [x20, 536]
	cbz	x0, .L4005
	add	x2, x20, 544
	mov	w0, 0
	b	.L3856
	.p2align 3
.L3857:
	ldr	x3, [x2], 8
	cbz	x3, .L4006
.L3856:
	add	w0, w0, 1
	cmp	w0, w1
	bne	.L3857
.L3854:
	add	x2, x25, 3720
	mov	x0, x19
	bl	MVC_InsertFrmInDPB
	cbnz	w0, .L4007
	ldr	w1, [x20, 924]
	mov	x0, x19
	add	w1, w1, 1
	str	w1, [x20, 924]
	bl	MVC_UpdateReflist
	mov	x0, x19
	bl	MVC_UpdateLTReflist
	ldr	x1, .LC952
	mov	w3, 3797
	mov	w2, 0
	mov	w0, 14
	bl	dprint_vfmw
	.p2align 2
.L3859:
	mov	w20, 0
.L3898:
	strb	wzr, [x25, 3720]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L3860:
	ldrb	w0, [x25, 3721]
	cmp	w0, 1
	beq	.L3864
	add	x20, x19, 11124736
	ldr	w0, [x20, 920]
	b	.L3874
	.p2align 3
.L3864:
	ldr	x0, [x19, 816]
	ldr	x4, [x21, 304]
	cmp	x0, xzr
	ccmp	x4, x0, 0, ne
	bne	.L4008
	mov	x0, x19
	bl	MVC_DirectOutput
	cmn	w0, #1
	mov	w20, w0
	beq	.L4009
.L3870:
	ldr	x1, .LC952
	mov	w3, 3849
	mov	w2, w20
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3826
	.p2align 3
.L3995:
	ldr	x1, .LC971
	mov	w2, 3899
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, -1
	mov	x0, x19
	bl	MVC_ClearDPB
.L3876:
	ldr	w0, [x21, 328]
	cbz	w0, .L3888
	ldrb	w0, [x25, 3724]
	cbnz	w0, .L3888
	ldr	w0, [x20, 928]
	cbz	w0, .L3888
	mov	w1, 0
	b	.L3893
	.p2align 3
.L3890:
	ldr	w0, [x20, 928]
	cmp	w0, w1
	bls	.L3888
.L3893:
	add	x0, x19, x1, uxtw 3
	ldr	w3, [x21, 320]
	add	x0, x0, 11124736
	add	w1, w1, 1
	ldr	x2, [x0, 664]
	ldr	w4, [x2, 20]
	cmp	w4, w3
	bne	.L3890
	ldr	w4, [x2, 56]
	ldr	w3, [x21, 392]
	cmp	w4, w3
	bne	.L3890
	strb	wzr, [x2, 3]
	ldr	x2, [x0, 664]
	ldrb	w3, [x2, 5]
	cmp	w3, 1
	beq	.L4010
.L3892:
	ldr	w0, [x2, 48]
	ldr	w3, [x19, 52]
	cmp	w0, w3
	add	x0, x19, x0, uxtw 2
	beq	.L3890
	str	wzr, [x0, 148]
	str	w3, [x2, 48]
	b	.L3890
	.p2align 3
.L3888:
	ldr	w1, [x20, 920]
	cbz	w1, .L3887
	ldr	x0, [x20, 536]
	cbz	x0, .L4011
	add	x2, x20, 544
	mov	w0, 0
	b	.L3895
	.p2align 3
.L3896:
	ldr	x3, [x2], 8
	cbz	x3, .L4012
.L3895:
	add	w0, w0, 1
	cmp	w0, w1
	bne	.L3896
.L3887:
	add	x2, x25, 3720
	mov	x0, x19
	bl	MVC_InsertFrmInDPB
	cbnz	w0, .L4013
	ldr	w1, [x20, 924]
	mov	x0, x19
	add	w1, w1, 1
	str	w1, [x20, 924]
	bl	MVC_UpdateReflist
	mov	x0, x19
	bl	MVC_UpdateLTReflist
	b	.L3859
	.p2align 3
.L3989:
	ldr	w1, [x19, 220]
	cmp	w1, 2
	bne	.L3827
	b	.L3828
	.p2align 3
.L3997:
	ldrb	w3, [x23, 2]
	cmp	w3, wzr
	ccmp	w1, 1, 0, eq
	bhi	.L3828
	b	.L3829
	.p2align 3
.L3999:
	ldrb	w1, [x23, 2]
	cbz	w1, .L3828
	b	.L3834
	.p2align 3
.L3998:
	ldr	w1, [x19, 220]
	cbnz	w1, .L3831
	mov	w0, 1
	mov	x2, 776
	str	w0, [x19, 220]
	add	x1, x25, 3720
	add	x0, x21, 400
	bl	memcpy
	ldr	w0, [x20, 12]
	b	.L3828
.L4008:
	add	x20, x19, 11124736
	ldr	w0, [x20, 920]
	cbz	w0, .L3867
	ldr	x1, [x20, 536]
	add	x3, x20, 544
	cmp	x4, x1
	ccmp	x1, xzr, 4, eq
	mov	w1, 0
	bne	.L4014
	.p2align 2
.L3871:
	add	w1, w1, 1
	cmp	w1, w0
	beq	.L3865
	ldr	x2, [x3], 8
	cmp	x4, x2
	ccmp	x2, xzr, 4, eq
	beq	.L3871
.L3868:
	add	x2, x25, 3720
	mov	x0, x19
	bl	MVC_InsertFrmInDPB
	cmn	w0, #1
	mov	w20, w0
	beq	.L4015
	mov	x0, x19
	bl	MVC_UpdateReflist
	mov	x0, x19
	bl	MVC_UpdateLTReflist
	ldr	x1, .LC952
	mov	w3, 3875
	mov	w2, 0
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3859
.L3831:
	cmp	w1, 1
	bne	.L3971
	cmp	w0, wzr
	ldr	x22, [x21, 1080]
	ble	.L3836
	add	x24, x21, 400
	ldrb	w2, [x24, 3]
	b	.L3837
	.p2align 3
.L3882:
	ldr	x22, .LC963
	mov	w3, w0
	mov	w2, 3939
	mov	w0, 1
	mov	x1, x22
	bl	dprint_vfmw
	ldr	x1, .LC952
	mov	w3, 3940
	mov	w2, w24
	mov	w0, 14
	bl	dprint_vfmw
.L3902:
	ldr	x1, [x21, 304]
	mov	w2, 1
	ldr	w0, [x19, 120]
	mov	w20, -1
	ldrsb	w1, [x1, 6]
	bl	FSP_ClearLogicFs
	mov	w3, w20
	mov	x1, x22
	mov	w2, 3998
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, [x21, 304]
	strb	wzr, [x0, 5]
	ldr	x0, [x21, 304]
	strb	wzr, [x0, 2]
	mov	w0, w20
	strb	wzr, [x25, 3720]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4012:
	mov	w1, w0
	b	.L3887
	.p2align 3
.L3821:
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbz	w0, .L3820
	ldr	x1, .LC956
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, .LC952
	mov	w3, 3626
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x22, .LC963
	b	.L3902
	.p2align 3
.L3988:
	ldr	x1, .LC958
	bl	dprint_vfmw
	mov	x0, x19
	bl	MVC_DirectOutput
	mov	w20, w0
	ldr	w1, [x19, 52]
	ldr	w0, [x21, 388]
	cmp	w0, w1
	beq	.L3825
	add	x0, x19, x0, uxtw 2
	str	wzr, [x0, 148]
	str	w1, [x21, 388]
.L3825:
	ldr	x1, .LC952
	mov	w3, 3645
	mov	w2, w20
	mov	w0, 14
	bl	dprint_vfmw
.L3826:
	cmn	w20, #1
	bne	.L3898
	ldr	x22, .LC963
	b	.L3902
	.p2align 3
.L3994:
	ldrb	w0, [x19, 8]
	cmp	w0, 2
	beq	.L4016
.L3880:
	mov	x0, x19
	bl	MVC_DirectOutput
	cmn	w0, #1
	mov	w20, w0
	beq	.L4017
.L3881:
	ldr	x1, .LC952
	mov	w3, 3931
	mov	w2, w20
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3826
	.p2align 3
.L3823:
	ldr	x1, .LC954
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, .LC952
	mov	w3, 3616
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x22, .LC963
	b	.L3902
.L3904:
	mov	x22, x23
	b	.L3838
.L4010:
	strb	w3, [x2, 7]
	ldr	x2, [x0, 664]
	strb	wzr, [x2, 5]
	ldr	x2, [x0, 664]
	b	.L3892
.L3996:
	ldr	x2, .LC972
	mov	w3, w22
	ldr	x1, .LC974
	mov	w0, 1
	add	x2, x2, 368
	bl	dprint_vfmw
	ldr	x1, .LC952
	mov	w3, 3908
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x22, .LC963
	b	.L3902
.L4004:
	mov	x1, x20
	mov	x0, x19
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L3850
.L4016:
	ldrb	w0, [x25, 3723]
	cbz	w0, .L3880
	ldr	x0, [x21, 304]
	str	x0, [x19, 824]
	b	.L3880
.L4006:
	mov	w1, w0
	b	.L3854
.L4002:
	ldr	x1, .LC960
	mov	w2, 3726
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC961
	ldr	x4, [x0]
	cbz	x4, .L3846
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 111
	blr	x4
.L3846:
	ldr	w0, [x20, 184]
	cbnz	w0, .L3845
	b	.L3847
	.p2align 3
.L4000:
	mov	w0, 3
	strb	w0, [x22, 2]
	ldr	w1, [x22, 44]
	ldr	w0, [x24, 740]
	add	w0, w1, w0
	str	w0, [x22, 44]
	b	.L3840
.L3987:
	ldr	x1, .LC950
	add	x21, x19, 11161600
	bl	dprint_vfmw
	ldr	x1, .LC952
	mov	w3, 3602
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x22, .LC963
	b	.L3902
.L4017:
	ldr	x1, .LC963
	mov	w3, w0
	mov	w2, 3928
	mov	w0, 1
	bl	dprint_vfmw
	b	.L3881
.L3993:
	ldr	x1, .LC967
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC952
	mov	w3, 3822
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x22, .LC963
	b	.L3902
.L4011:
	mov	w1, 0
	b	.L3887
.L4013:
	ldr	x22, .LC963
	mov	w3, w0
	mov	w2, 3984
	mov	w0, 1
	mov	x1, x22
	bl	dprint_vfmw
	ldr	x1, .LC952
	mov	w3, 3985
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3902
.L3867:
	ldr	w1, [x21, 328]
	cbz	w1, .L3874
	ldr	w4, [x20, 928]
	ldr	w5, [x20, 932]
.L3900:
	ldr	x1, .LC969
	mov	w3, w0
	mov	w2, 3888
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	mov	x0, x19
	bl	MVC_ClearDPB
	ldr	x1, .LC952
	mov	w3, 3891
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x22, .LC963
	b	.L3902
.L3992:
	ldr	x1, .LC965
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC961
	ldr	x4, [x0]
	cbz	x4, .L3862
	ldr	w1, [x19, 112]
	mov	w3, 8
	ldr	w2, [x21, 364]
	ldr	w0, [x19, 120]
	stp	w2, w1, [x29, 88]
	add	x2, x29, 88
	mov	w1, 104
	blr	x4
.L3862:
	mov	x0, x19
	mov	w20, -1
	bl	MVC_ClearAllSlice
	add	x3, x19, 11120640
	mov	w2, 23352
	movk	w2, 0x1, lsl 16
	ldr	w4, [x19, 40]
	mov	w0, 2
	mov	w1, w20
	str	w2, [x3, 544]
	add	x2, x3, 512
	strb	w0, [x3, 529]
	mov	w0, 32
	str	w4, [x3, 540]
	strb	w0, [x3, 530]
	mov	w0, 3
	strb	wzr, [x3, 528]
	stp	w0, w20, [x2, 40]
	stp	wzr, wzr, [x2, 48]
	mov	w2, 7
	mov	x0, x19
	strb	w2, [x3, 531]
	mov	w2, 262144
	str	w2, [x3, 568]
	bl	MVC_ClearDPB
	ldr	x1, .LC952
	mov	w3, 3813
	mov	w2, w20
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x22, .LC963
	b	.L3902
.L4009:
	ldr	x1, .LC963
	mov	w3, w0
	mov	w2, 3845
	mov	w0, 1
	bl	dprint_vfmw
	b	.L3870
.L4005:
	mov	w1, 0
	b	.L3854
.L4014:
	mov	w1, 0
	b	.L3868
.L4007:
	ldr	x22, .LC963
	mov	w3, w0
	mov	w2, 3788
	mov	w0, 0
	mov	x1, x22
	bl	dprint_vfmw
	ldr	x1, .LC952
	mov	w3, 3789
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3902
.L4015:
	ldr	x22, .LC963
	mov	w3, w0
	mov	w2, 3868
	mov	w0, 1
	mov	x1, x22
	bl	dprint_vfmw
	ldr	x1, .LC952
	mov	w3, 3869
	mov	w2, w20
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3902
.L4003:
	ldrsb	w1, [x22, 6]
	mov	w2, 0
	ldr	w0, [x19, 120]
	bl	FSP_SetDisplay
	ldr	x1, .LC952
	mov	w3, 3745
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x22, .LC963
	b	.L3902
.L4001:
	ldr	x1, .LC952
	mov	w3, 3715
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x22, .LC963
	b	.L3902
	.size	MVC_StorePicInDpb, .-MVC_StorePicInDpb
	.align	3
.LC950:
	.xword	.LC949
	.align	3
.LC952:
	.xword	.LC951
	.align	3
.LC954:
	.xword	.LC953
	.align	3
.LC956:
	.xword	.LC955
	.align	3
.LC958:
	.xword	.LC957
	.align	3
.LC960:
	.xword	.LC959
	.align	3
.LC961:
	.xword	g_event_report
	.align	3
.LC963:
	.xword	.LC962
	.align	3
.LC965:
	.xword	.LC964
	.align	3
.LC967:
	.xword	.LC966
	.align	3
.LC969:
	.xword	.LC968
	.align	3
.LC971:
	.xword	.LC970
	.align	3
.LC972:
	.xword	.LANCHOR0
	.align	3
.LC974:
	.xword	.LC973
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecGap
	.type	MVC_DecGap, %function
MVC_DecGap:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x23, x19, 11116544
	add	x24, x19, 11120640
	bl	_mcount
	add	x28, x19, 11161600
	ldrb	w2, [x19, 3]
	mov	w21, 2
	ldr	w0, [x23, 1872]
	str	w0, [x29, 108]
	lsl	x0, x2, 6
	sub	x0, x0, x2
	ldr	x3, [x19, 248]
	lsl	x0, x0, 2
	ldr	w1, [x24, 516]
	sub	x0, x0, x2
	ldr	w25, [x23, 2996]
	lsl	x0, x0, 1
	add	x1, x1, 2777088
	sub	x0, x0, x2
	ldrb	w2, [x3, 19]
	lsl	x0, x0, 2
	add	x1, x19, x1, lsl 2
	cmp	w2, 1
	add	x2, x19, x0
	add	x2, x2, 11120640
	add	x0, x0, 11120640
	ldr	w5, [x1, 11180]
	add	x0, x0, 576
	add	x0, x19, x0
	ldr	w22, [x3, 2896]
	ldrb	w1, [x2, 579]
	csel	w26, w21, wzr, eq
	ldr	w2, [x23, 1876]
	stp	w1, w2, [x29, 100]
	add	x1, x19, 11124736
	str	x0, [x28, 312]
	ldr	w0, [x1, 924]
	cbz	w0, .L4034
	add	w22, w22, 4
	mov	w20, 1
	add	w2, w5, 1
	lsl	w22, w20, w22
	ldr	x1, .LC978
	mov	w0, w21
	udiv	w5, w2, w22
	str	wzr, [x23, 1872]
	str	wzr, [x23, 1876]
	msub	w27, w5, w22, w2
	bl	dprint_vfmw
	ldr	x1, .LC980
	mov	w0, w21
	mov	w3, w27
	mov	w2, w25
	add	x21, x19, 11157504
	bl	dprint_vfmw
	cmp	w25, w27
	bgt	.L4031
	b	.L4027
	.p2align 3
.L4024:
	strb	wzr, [x21, 3724]
	mov	x0, x19
	bl	MVC_StorePicInDpb
	add	w1, w27, 1
	cbnz	w0, .L4035
.L4025:
	sdiv	w2, w1, w22
	ldr	w0, [x24, 516]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	str	w27, [x0, 11180]
	msub	w27, w2, w22, w1
	cmp	w25, w27
	ble	.L4027
.L4031:
	mov	w1, 1
	mov	x0, x19
	bl	MVC_AllocFrameStore
	cbnz	w0, .L4036
	ldr	x1, .LC984
	mov	w0, 2
	bl	dprint_vfmw
	strb	w20, [x21, 3726]
	ldr	x0, [x28, 304]
	str	w27, [x0, 20]
	str	w27, [x28, 320]
	ldr	x0, [x28, 304]
	str	w27, [x0, 756]
	str	w26, [x28, 328]
	ldr	x0, [x28, 304]
	str	wzr, [x0, 752]
	ldr	x0, [x28, 304]
	strb	w20, [x0, 7]
	ldr	x0, [x28, 304]
	strb	wzr, [x0, 5]
	ldr	x0, [x28, 304]
	strb	w20, [x0, 1]
	strb	w20, [x21, 3722]
	ldr	x0, [x28, 312]
	ldr	w1, [x24, 512]
	str	w1, [x28, 392]
	strb	wzr, [x0, 3]
	ldr	x0, [x19, 248]
	ldr	w0, [x0, 2900]
	cbz	w0, .L4024
	mov	x0, x19
	str	w27, [x23, 1888]
	bl	MVC_DecPOC
	ldr	w0, [x23, 1868]
	str	w0, [x28, 332]
	ldr	w0, [x23, 1864]
	str	w0, [x28, 336]
	ldr	w0, [x23, 1856]
	str	w0, [x28, 340]
	ldr	w0, [x23, 1860]
	str	w0, [x28, 344]
	mov	x0, x19
	strb	wzr, [x21, 3724]
	bl	MVC_StorePicInDpb
	add	w1, w27, 1
	cbz	w0, .L4025
.L4035:
	ldr	w1, [x29, 108]
	mov	w3, w0
	str	w1, [x23, 1872]
	mov	w2, 6921
	ldr	w1, [x29, 104]
	mov	w0, 0
	str	w1, [x23, 1876]
	ldrb	w5, [x29, 100]
	ldr	x4, [x28, 312]
	ldr	x1, .LC986
	strb	w5, [x4, 3]
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4034:
	ldr	x1, .LC976
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4027:
	ldr	w0, [x29, 108]
	str	w0, [x23, 1872]
	ldr	w0, [x29, 104]
	str	w0, [x23, 1876]
	mov	w0, 0
	ldrb	w2, [x29, 100]
	ldr	x1, [x28, 312]
	strb	w2, [x1, 3]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4036:
	ldr	w0, [x29, 108]
	str	w0, [x23, 1872]
	ldr	w0, [x29, 104]
	str	w0, [x23, 1876]
	mov	w0, 0
	ldrb	w3, [x29, 100]
	ldr	x2, [x28, 312]
	ldr	x1, .LC982
	strb	w3, [x2, 3]
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.size	MVC_DecGap, .-MVC_DecGap
	.align	3
.LC976:
	.xword	.LC975
	.align	3
.LC978:
	.xword	.LC977
	.align	3
.LC980:
	.xword	.LC979
	.align	3
.LC982:
	.xword	.LC981
	.align	3
.LC984:
	.xword	.LC983
	.align	3
.LC986:
	.xword	.LC985
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_InitPic
	.type	MVC_InitPic, %function
MVC_InitPic:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 11116544
	add	x21, x19, 11157504
	bl	_mcount
	mov	w20, 2240
	ldr	x2, [x19, 280]
	ldr	w0, [x22, 2984]
	ldrb	w1, [x21, 3720]
	str	wzr, [x29, 108]
	umull	x0, w0, w20
	add	x20, x2, x0
	cbz	w1, .L4038
	add	x23, x19, 11161600
	ldr	x0, [x23, 304]
	cbz	x0, .L4039
	ldrb	w1, [x0, 2]
	cbz	w1, .L4200
.L4039:
	strb	wzr, [x21, 3720]
.L4038:
	add	x1, x29, 108
	mov	x0, x19
	bl	MVC_GetReRangeFlag
	mov	w24, w0
	ldrsb	w0, [x22, 2980]
	cmn	w0, #1
	beq	.L4201
.L4040:
	cbnz	w0, .L4043
	ldrb	w0, [x19, 2]
	cmp	w0, 1
	beq	.L4202
	ldr	w1, [x19, 28]
	ldr	w0, [x20, 28]
	cmp	w1, w0
	bne	.L4203
	add	x0, x19, 11046912
	add	x0, x0, 180
	str	x0, [x19, 248]
.L4043:
	add	x23, x19, 11112448
	ldr	w0, [x20, 24]
	ldr	w1, [x23, 3712]
	cmp	w1, w0
	beq	.L4204
.L4047:
	strb	wzr, [x20, 20]
	mov	x1, x20
	ldr	x0, [x19, 248]
	bl	mvc_assign_quant_params
	ldr	x3, .LC987
	mov	x2, 2240
	mov	x1, x20
	add	x0, x23, 3688
	ldr	x3, [x3, 112]
	blr	x3
.L4048:
	ldr	w0, [x29, 108]
	cbnz	w0, .L4205
	ldr	x0, [x19, 224]
	ldr	w1, [x0, 912]
	cmp	w1, 1
	beq	.L4050
.L4060:
	ldr	w0, [x20, 24]
	ldr	w1, [x23, 3712]
	cmp	w1, w0
	bne	.L4070
	ldrb	w0, [x20, 20]
	cbnz	w0, .L4070
	ldrsb	w0, [x22, 2980]
	cmn	w0, #1
	beq	.L4206
.L4072:
	cbnz	w0, .L4073
	add	x0, x19, 10768384
	add	x24, x19, 11120640
	add	x5, x0, 4068
	ldr	w2, [x0, 4064]
	ldr	w3, [x24, 512]
	adds	w2, w2, 1
	beq	.L4074
	ldr	w0, [x0, 4068]
	cmp	w3, w0
	beq	.L4207
	mov	w4, w2
	mov	w0, 0
	b	.L4076
	.p2align 3
.L4077:
	ldr	w1, [x5, w0, sxtw 2]
	cmp	w3, w1
	beq	.L4074
.L4076:
	add	w0, w0, 1
	cmp	w0, w4
	mov	w2, w0
	bne	.L4077
.L4074:
	str	w2, [x24, 516]
.L4073:
	ldrb	w1, [x22, 2971]
	ldr	x0, [x19, 248]
	cmp	w1, 5
	ldr	w2, [x0, 2896]
	beq	.L4078
.L4215:
	ldrb	w0, [x19, 8]
	ldr	w1, [x22, 2996]
	cmp	w0, 2
	beq	.L4080
.L4216:
	ldr	x3, [x19, 224]
	ldr	w0, [x3, 12]
	cmp	w0, 2
	beq	.L4080
	add	x24, x19, 11120640
	ldr	w0, [x24, 516]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 11180]
	cmp	w0, w1
	beq	.L4080
	add	w2, w2, 4
	mov	w4, 1
	lsl	w20, w4, w2
	add	w0, w0, w4
	udiv	w2, w0, w20
	msub	w0, w2, w20, w0
	cmp	w0, w1
	beq	.L4080
	str	w4, [x3, 640]
	ldr	x0, [x19, 224]
	ldr	w1, [x0, 640]
	cbnz	w1, .L4081
	ldr	w1, [x0, 680]
	cmp	w1, w4
	beq	.L4208
.L4082:
	ldr	w0, [x24, 516]
	ldr	w2, [x22, 2996]
	add	x0, x19, x0, lsl 2
	add	x0, x0, 11116544
	ldr	w1, [x0, 2988]
	cmp	w2, w1
	sub	w3, w2, w1
	bls	.L4083
	ldr	w4, [x23, 3668]
	cmp	w4, w3
	ccmp	w1, wzr, 4, cc
	beq	.L4081
	ldrb	w1, [x22, 2968]
	cmp	w1, 2
	bne	.L4209
	cbnz	w2, .L4085
	sub	w2, w20, #1
.L4086:
	str	w2, [x0, 2988]
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbz	w0, .L4081
	ldr	x1, .LC990
	mov	w3, w0
	mov	w2, 7393
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
	.p2align 3
.L4205:
	ldr	x0, [x19, 224]
	ldr	w1, [x0, 748]
	cbnz	w1, .L4050
	ldr	w1, [x0, 28]
	cmp	w1, 25
	beq	.L4210
.L4050:
	ldr	w1, [x19, 84]
	add	w1, w1, 1
	str	w1, [x19, 84]
	cbnz	w24, .L4061
	ldr	w0, [x0, 912]
	cmp	w0, 1
	beq	.L4061
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbnz	w0, .L4211
	cbz	x19, .L4111
.L4219:
	mov	x0, x19
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_InitDPB.part.15
	cbnz	w0, .L4064
	cbnz	w24, .L4066
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 912]
	cmp	w0, 1
	bne	.L4060
.L4066:
	ldr	w4, [x23, 3668]
	add	x2, x19, 11108352
	mov	w1, 2
	add	x3, x19, 48
	lsl	w4, w4, 1
	str	w4, [x19, 52]
	ldr	w0, [x23, 3648]
	ldrb	w24, [x2, 3812]
	add	w0, w0, 1
	ldr	w25, [x23, 3644]
	sub	w24, w1, w24
	lsl	w0, w0, 4
	add	w25, w25, 1
	mul	w24, w0, w24
	lsl	w25, w25, 4
	mov	x0, x19
	mov	w2, w24
	mov	w1, w25
	bl	MVC_ArrangeVahbMem
	cmp	w0, 1
	beq	.L4212
.L4196:
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 912]
	cmp	w0, 1
	beq	.L4213
	ldr	x1, .LC998
	mov	w0, 0
	stp	wzr, wzr, [x19, 12]
	bl	dprint_vfmw
	mov	w1, 0
	mov	x0, x19
	bl	MVC_ClearAll
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	mov	w0, -1
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4201:
	mov	w1, 1
	strb	w1, [x19, 2]
	mov	w1, 3992
	ldr	x4, [x19, 272]
	ldr	w2, [x20, 28]
	add	x3, x19, 11112448
	str	w2, [x19, 24]
	ldr	w2, [x20, 28]
	ldr	w3, [x3, 440]
	umull	x1, w2, w1
	add	x1, x4, x1
	ldr	w2, [x1, 744]
	cmp	w3, w2
	beq	.L4214
.L4041:
	ldr	w0, [x19, 84]
	add	x23, x19, 11108352
	ldr	x3, .LC987
	add	x23, x23, 3792
	add	w0, w0, 1
	str	w0, [x19, 84]
	strb	wzr, [x1, 26]
	mov	x2, 3992
	mov	x0, x23
	ldr	x3, [x3, 112]
	blr	x3
	ldrsb	w0, [x22, 2980]
	str	x23, [x19, 248]
	b	.L4040
	.p2align 3
.L4070:
	ldr	x3, .LC987
	mov	x2, 2240
	strb	wzr, [x20, 20]
	mov	x1, x20
	add	x0, x23, 3688
	ldr	x3, [x3, 112]
	blr	x3
	ldrsb	w0, [x22, 2980]
	cmn	w0, #1
	bne	.L4072
.L4206:
	add	x24, x19, 11120640
	str	wzr, [x24, 516]
	ldrb	w1, [x22, 2971]
	ldr	x0, [x19, 248]
	cmp	w1, 5
	ldr	w2, [x0, 2896]
	bne	.L4215
.L4078:
	add	x24, x19, 11120640
	ldr	w1, [x22, 2996]
	ldr	w0, [x24, 516]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	str	w1, [x0, 11180]
	ldrb	w0, [x19, 8]
	cmp	w0, 2
	bne	.L4216
	.p2align 2
.L4080:
	ldrb	w0, [x22, 2976]
	cbz	w0, .L4094
	add	x24, x19, 11120640
	ldr	w0, [x24, 516]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	str	w1, [x0, 11180]
.L4094:
	mov	x0, x19
	str	w1, [x22, 1888]
	bl	MVC_DecPOC
	mov	w1, 0
	mov	x0, x19
	bl	MVC_AllocFrameStore
	cbnz	w0, .L4217
	strb	wzr, [x21, 3727]
	mov	w0, 1
	strb	w0, [x21, 3720]
	add	x20, x19, 11161600
	add	x6, x20, 256
	mov	w4, -1
	ldrb	w0, [x22, 2971]
	mov	w5, 1
	strb	w0, [x21, 3726]
	ldr	w8, [x22, 2996]
	str	w8, [x20, 320]
	ldrb	w7, [x22, 2976]
	str	w7, [x20, 328]
	ldr	w3, [x22, 1868]
	str	w3, [x20, 332]
	ldr	w2, [x22, 1864]
	str	w2, [x20, 336]
	ldr	w1, [x22, 1856]
	str	w1, [x20, 340]
	ldr	w0, [x22, 1860]
	stp	w0, w3, [x6, 88]
	stp	w2, w1, [x6, 96]
	str	w0, [x20, 360]
	strb	wzr, [x21, 3722]
	strb	wzr, [x21, 3725]
	strb	wzr, [x21, 3724]
	str	w4, [x20, 384]
	ldrb	w4, [x22, 2969]
	cbz	w4, .L4096
	strb	w5, [x22, 2969]
	mov	w4, w5
	mov	w5, 2
.L4096:
	ldr	x3, [x19, 248]
	mov	w2, 2
	mov	w6, 0
	ldrb	w1, [x3, 20]
	ldr	w0, [x3, 3952]
	sub	w1, w2, w1
	madd	w1, w0, w1, w1
	udiv	w0, w1, w5
	str	w0, [x20, 372]
	ldrb	w1, [x3, 20]
	sub	w1, w2, w1
	ldr	w2, [x3, 3952]
	madd	w1, w2, w1, w1
	str	w1, [x20, 376]
	ldr	w1, [x3, 3948]
	add	w1, w1, 1
	str	w1, [x20, 368]
	mul	w0, w0, w1
	str	w0, [x20, 380]
	ldrb	w0, [x23, 3688]
	strb	w0, [x21, 3728]
	cbnz	w4, .L4097
	ldrb	w0, [x3, 21]
	cmp	w0, wzr
	cset	w6, ne
.L4097:
	strb	w6, [x21, 3729]
	add	x24, x19, 11120640
	cbz	w7, .L4098
	ldr	w0, [x24, 516]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	str	w8, [x0, 11180]
.L4098:
	ldr	x0, [x20, 304]
	cbz	x0, .L4099
	ldrsb	w1, [x22, 2980]
	strb	w1, [x0, 9]
.L4099:
	mov	w0, -1
	str	w0, [x20, 392]
	ldrb	w0, [x22, 2979]
	cbz	w0, .L4100
	ldr	w0, [x24, 512]
	str	w0, [x20, 392]
	ldrb	w0, [x22, 2977]
	strb	w0, [x21, 3730]
	ldrb	w0, [x22, 2978]
	strb	w0, [x21, 3731]
.L4100:
	ldr	w0, [x24, 516]
	mov	x23, -1
	str	w0, [x20, 396]
	mov	w0, 29
	ldr	x1, .LC1012
	mov	w25, 2
	ldrb	w3, [x19, 3]
	lsl	x2, x3, 6
	sub	x2, x2, x3
	lsl	x2, x2, 2
	sub	x2, x2, x3
	lsl	x2, x2, 1
	sub	x2, x2, x3
	lsl	x2, x2, 2
	add	x2, x2, 11120640
	add	x2, x2, 576
	add	x2, x19, x2
	str	x2, [x20, 312]
	ldr	x2, [x19, 224]
	ldr	x3, [x2, 56]
	str	x3, [x20, 280]
	ldr	x3, [x2, 72]
	str	x3, [x20, 288]
	ldr	x3, [x2, 88]
	str	x3, [x20, 296]
	str	x23, [x2, 56]
	ldr	x2, [x20, 280]
	bl	dprint_vfmw
	ldr	x1, .LC1014
	mov	w0, 29
	ldr	x2, [x20, 288]
	bl	dprint_vfmw
	ldr	x2, [x19, 248]
	ldr	w0, [x2, 3948]
	add	w0, w0, 1
	lsl	w0, w0, 4
	str	w0, [x21, 3864]
	ldrb	w1, [x2, 20]
	ldr	w3, [x2, 3952]
	sub	w0, w25, w1
	add	x1, x19, 11108352
	madd	w0, w3, w0, w0
	ldr	x3, .LC987
	lsl	w0, w0, 4
	str	w0, [x21, 3868]
	mov	x0, x1
	mov	w1, 0
	ldr	w2, [x2, 748]
	ldr	x3, [x3, 96]
	cmp	w2, 1
	ldr	w26, [x0, 3844]
	mov	x2, 4
	add	x0, x21, 3860
	cset	w27, ne
	and	w26, w26, 7
	blr	x3
	ldrb	w0, [x21, 3860]
	mov	w1, w26
	ldrb	w2, [x21, 3861]
	and	w0, w0, 252
	bfi	w0, w27, 2, 3
	strb	w0, [x21, 3860]
	bfi	w2, w25, 0, 2
	ldr	x3, [x19, 248]
	and	w2, w2, -13
	bfi	w2, w25, 4, 2
	ldr	w4, [x3, 56]
	strb	w2, [x21, 3861]
	bfi	w0, w4, 5, 3
	strb	w0, [x21, 3860]
	add	x0, x21, 3736
	ldr	w3, [x3, 52]
	ldr	w2, [x21, 3860]
	bfi	w2, w3, 14, 3
	str	w2, [x21, 3860]
	bl	SetAspectRatio
	ldr	w0, [x19, 84]
	str	w0, [x21, 3924]
	ldr	x1, [x20, 304]
	cbz	x1, .L4218
	ldr	x0, [x19, 248]
	ldr	w0, [x0, 3984]
	str	w0, [x1, 216]
	str	w0, [x21, 3880]
	ldr	x0, [x19, 248]
	ldr	x1, [x20, 304]
	ldr	w0, [x0, 3988]
	str	w0, [x1, 220]
	str	w0, [x21, 3884]
	ldr	x0, [x19, 248]
	ldr	x1, [x20, 304]
	ldr	w0, [x0, 3976]
	str	w0, [x1, 208]
	str	w0, [x21, 3872]
	ldr	x0, [x19, 248]
	ldr	x1, [x20, 304]
	ldr	w0, [x0, 3980]
	str	w0, [x1, 212]
	str	w0, [x21, 3876]
	ldrb	w0, [x21, 3723]
	ldr	w1, [x21, 3860]
	cmp	w0, wzr
	cset	w0, ne
	str	w0, [x21, 3848]
	ldr	x0, [x20, 304]
	str	w1, [x0, 196]
	ldr	x0, [x20, 304]
	ldr	w1, [x21, 3848]
	str	w1, [x0, 184]
	ldr	w0, [x22, 2996]
	str	w0, [x21, 3944]
	ldr	w1, [x24, 512]
	str	w1, [x21, 3952]
	ldr	x1, [x20, 304]
	str	w0, [x1, 280]
	ldr	x0, [x20, 304]
	ldr	w1, [x24, 512]
	str	w1, [x0, 288]
	ldr	x1, [x20, 304]
	ldr	w0, [x19, 120]
	ldrsb	w1, [x1, 6]
	bl	FSP_GetDispPhyFs
	cbz	x0, .L4102
	ldr	w3, [x21, 3848]
	mov	w1, 0
	ldr	w2, [x0, 8]
	cmp	w3, wzr
	ldr	w0, [x19, 120]
	cset	w3, ne
	bl	FSP_SetStoreType
.L4102:
	ldr	w1, [x19, 60]
	add	x4, x20, 240
	add	x20, x20, 272
.L4106:
	ldr	x0, [x4]
	cbnz	x0, .L4103
	cbz	w1, .L4103
	ldr	x0, [x19, 832]
	subs	w1, w1, #1
	str	x0, [x4]
	beq	.L4104
	add	x2, x19, 832
	mov	w0, 0
	.p2align 2
.L4105:
	add	w0, w0, 1
	cmp	w0, w1
	add	x3, x19, x0, uxtw 3
	ldr	x3, [x3, 832]
	str	x3, [x2], 8
	bne	.L4105
.L4104:
	add	x0, x19, x1, uxtw 3
	str	xzr, [x0, 832]
	str	w1, [x19, 60]
.L4103:
	add	x4, x4, 8
	cmp	x20, x4
	bne	.L4106
	cbz	w1, .L4108
	cmp	w1, wzr
	ble	.L4108
	.p2align 2
.L4109:
	add	x22, x19, x1, sxtw 3
	sub	w20, w1, #1
	ldr	w0, [x19, 120]
	ldr	x1, [x22, 824]
	bl	FreeUsdByDec
	str	xzr, [x22, 824]
	mov	w1, w20
	cbnz	w20, .L4109
.L4108:
	str	wzr, [x19, 60]
	mov	x0, x19
	strb	wzr, [x21, 3732]
	bl	MVC_UpdateReflist
	mov	x0, x19
	bl	MVC_UpdateLTReflist
	mov	x0, x19
	bl	MVC_CalcPicNum
	mov	w0, 0
.L4046:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L4208:
	ldr	w1, [x0, 676]
	cbnz	w1, .L4082
	ldr	w1, [x0, 684]
	cbnz	w1, .L4082
	ldr	w0, [x0, 644]
	add	w0, w0, 1024
	cmp	w0, 2048
	bls	.L4082
	.p2align 2
.L4081:
	add	x0, x19, 11108352
	ldrb	w0, [x0, 3811]
	cbnz	w0, .L4090
	ldr	x1, .LC1004
	mov	w0, 2
	bl	dprint_vfmw
	ldr	x0, [x19, 224]
	ldr	w0, [x0, 644]
	tst	w0, -1025
	bne	.L4197
	ldr	w0, [x24, 512]
	cbnz	w0, .L4197
	ldr	w0, [x24, 516]
	ldr	w1, [x22, 2996]
	add	x0, x0, 2777088
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 11180]
	add	w0, w0, 1
	udiv	w2, w0, w20
	msub	w0, w2, w20, w0
	cmp	w1, w0
	bcs	.L4080
	ldrb	w0, [x22, 2968]
	cmp	w0, 2
	beq	.L4080
	mov	x0, x19
	mov	w23, -1
	bl	MVC_ClearAllSlice
	add	x7, x24, 512
	ldr	w0, [x19, 40]
	mov	w2, 2
	str	w0, [x24, 540]
	strb	w2, [x24, 529]
	mov	w0, 23352
	strb	wzr, [x24, 528]
	mov	w2, 32
	strb	w2, [x24, 530]
	movk	w0, 0x1, lsl 16
	stp	w23, wzr, [x7, 44]
	mov	w2, 262144
	mov	w1, w23
	stp	wzr, w2, [x7, 52]
	str	w0, [x24, 544]
	mov	w0, 7
	strb	w0, [x24, 531]
	mov	w0, 3
	str	w0, [x24, 552]
	mov	x0, x19
	bl	MVC_ClearDPB
	ldr	w4, [x24, 516]
	mov	w2, 7447
	ldr	x1, .LC1006
	mov	w0, 0
	add	x4, x4, 2777088
	ldr	w3, [x22, 2996]
	add	x19, x19, x4, lsl 2
	ldr	w4, [x19, 11180]
	add	w4, w4, 1
	udiv	w5, w4, w20
	msub	w4, w5, w20, w4
	bl	dprint_vfmw
	mov	w0, w23
	b	.L4046
	.p2align 3
.L4204:
	ldrb	w0, [x20, 20]
	cbz	w0, .L4048
	b	.L4047
	.p2align 3
.L4061:
	ldr	x1, .LC1000
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x19
	bl	MVC_GetBackPicFromVOQueue
	cbnz	x19, .L4219
.L4111:
	mov	w0, -1
.L4064:
	ldr	x1, .LC992
	mov	w3, w0
	mov	w2, 7282
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
	.p2align 3
.L4214:
	ldrb	w2, [x1, 26]
	cbnz	w2, .L4041
	add	x23, x19, 11108352
	add	x23, x23, 3792
	str	x23, [x19, 248]
	b	.L4040
	.p2align 3
.L4200:
	ldrsb	w1, [x0, 6]
	mov	w2, 1
	ldr	w0, [x19, 120]
	bl	FSP_ClearLogicFs
	ldr	x0, [x23, 304]
	strb	wzr, [x0, 2]
	ldr	x0, [x23, 304]
	strb	wzr, [x0, 5]
	b	.L4039
	.p2align 3
.L4213:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	mov	w0, -2
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4090:
	mov	x0, x19
	bl	MVC_DecGap
	cbnz	w0, .L4093
.L4197:
	ldr	w1, [x22, 2996]
	b	.L4080
.L4210:
	ldr	w0, [x19, 84]
	add	w0, w0, 1
	str	w0, [x19, 84]
	cbnz	w24, .L4220
.L4051:
	cbz	x19, .L4110
	mov	x0, x19
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_InitDPB.part.15
	mov	w3, w0
	cbnz	w0, .L4052
	add	x2, x19, 11108352
	ldr	w1, [x23, 3648]
	ldr	w26, [x23, 3644]
	add	w1, w1, 1
	ldrb	w25, [x2, 3812]
	mov	w2, 2
	lsl	w1, w1, 4
	add	w26, w26, 1
	sub	w25, w2, w25
	lsl	w26, w26, 4
	mul	w25, w1, w25
	cbz	w24, .L4054
	ldr	w1, [x19, 12]
	cbnz	w1, .L4054
	ldr	w4, [x23, 3668]
	ldr	x3, [x19, 224]
	lsl	w4, w4, 1
	str	w4, [x19, 52]
	ldr	w1, [x3, 708]
	cmp	w26, w1
	bhi	.L4055
	ldr	w2, [x3, 712]
	cmp	w25, w2
	bhi	.L4055
	add	x5, x19, 11124736
	ldr	w6, [x3, 732]
	ldr	w5, [x5, 920]
	cmp	w6, w5
	bcc	.L4221
	ldr	w0, [x3, 736]
	cbnz	w0, .L4058
	mov	w4, 1
	str	w4, [x19, 52]
	ldr	w1, [x3, 708]
	ldr	w2, [x3, 712]
.L4058:
	add	x3, x19, 48
	mov	x0, x19
	bl	MVC_ArrangeVahbMem
	cmp	w0, 1
	bne	.L4196
.L4054:
	lsr	w26, w26, 4
	lsr	w25, w25, 4
	stp	w26, w25, [x19, 12]
	b	.L4060
.L4202:
	strb	wzr, [x19, 2]
	ldr	x0, .LC987
	ldr	w1, [x20, 28]
	ldr	x3, [x0, 112]
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x1, x0, x1
	add	x0, x19, 10768384
	lsl	x2, x1, 2
	add	x0, x0, 4060
	sub	x1, x2, x1
	lsl	x2, x1, 6
	add	x1, x1, x2
	mov	x2, 8500
	movk	x2, 0x5, lsl 16
	add	x1, x19, x1, lsl 2
	add	x1, x1, 12288
	add	x1, x1, 2396
	blr	x3
	add	x0, x19, 11046912
	add	x0, x0, 180
	str	x0, [x19, 248]
	ldr	w0, [x0, 744]
	str	w0, [x19, 28]
	b	.L4043
	.p2align 3
.L4212:
	lsr	w25, w25, 4
	lsr	w24, w24, 4
	stp	w25, w24, [x19, 12]
	b	.L4060
.L4083:
	ldr	w4, [x23, 3668]
	add	w3, w3, w20
	cmp	w4, w3
	ccmp	w1, wzr, 4, cc
	beq	.L4081
	ldrb	w1, [x22, 2968]
	cmp	w1, 2
	bne	.L4222
	cbnz	w2, .L4088
	sub	w2, w20, #1
.L4089:
	str	w2, [x0, 2988]
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbz	w0, .L4081
	ldr	x1, .LC990
	mov	w3, w0
	mov	w2, 7420
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
	.p2align 3
.L4110:
	mov	w3, -1
.L4052:
	ldr	x1, .LC992
	mov	w2, 7198
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
	.p2align 3
.L4220:
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbz	w0, .L4051
	ldr	x1, .LC990
	mov	w3, w0
	mov	w2, 7189
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
	.p2align 3
.L4211:
	ldr	x1, .LC990
	mov	w3, w0
	mov	w2, 7273
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
.L4093:
	ldr	x1, .LC1008
	mov	w2, 7474
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
	.p2align 3
.L4203:
	ldr	x1, .LC988
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
.L4207:
	mov	w2, 0
	b	.L4074
.L4217:
	ldr	x1, .LC1010
	mov	w2, 7494
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
.L4218:
	ldr	x1, .LC1016
	mov	w2, 7598
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, w23
	b	.L4046
.L4088:
	sub	w2, w2, #1
	b	.L4089
.L4085:
	sub	w2, w2, #1
	b	.L4086
.L4222:
	mov	x0, x19
	mov	w20, -1
	bl	MVC_ClearAllSlice
	add	x8, x24, 512
	ldr	w0, [x19, 40]
	mov	w2, 2
	str	w0, [x24, 540]
	strb	w2, [x24, 529]
	mov	w0, 23352
	strb	wzr, [x24, 528]
	mov	w2, 32
	strb	w2, [x24, 530]
	movk	w0, 0x1, lsl 16
	stp	w20, wzr, [x8, 44]
	mov	w2, 262144
	mov	w1, w20
	stp	wzr, w2, [x8, 52]
	str	w0, [x24, 544]
	mov	w0, 7
	strb	w0, [x24, 531]
	mov	w0, 3
	str	w0, [x24, 552]
	mov	x0, x19
	bl	MVC_ClearDPB
	ldr	w5, [x24, 516]
	mov	w2, 7409
	ldr	x1, .LC1002
	ldr	w6, [x22, 2996]
	add	x5, x5, 2777088
	ldr	w4, [x23, 3668]
.L4198:
	add	x19, x19, x5, lsl 2
	mov	w0, 0
	ldr	w3, [x19, 11180]
	sub	w3, w6, w3
	bl	dprint_vfmw
	mov	w0, w20
	b	.L4046
.L4209:
	mov	x0, x19
	mov	w20, -1
	bl	MVC_ClearAllSlice
	add	x9, x24, 512
	ldr	w0, [x19, 40]
	mov	w2, 2
	str	w0, [x24, 540]
	strb	w2, [x24, 529]
	mov	w0, 23352
	strb	wzr, [x24, 528]
	mov	w2, 32
	strb	w2, [x24, 530]
	movk	w0, 0x1, lsl 16
	stp	w20, wzr, [x9, 44]
	mov	w2, 262144
	mov	w1, w20
	stp	wzr, w2, [x9, 52]
	str	w0, [x24, 544]
	mov	w0, 7
	strb	w0, [x24, 531]
	mov	w0, 3
	str	w0, [x24, 552]
	mov	x0, x19
	bl	MVC_ClearDPB
	ldr	w5, [x24, 516]
	mov	w2, 7382
	ldr	x1, .LC1002
	ldr	w6, [x22, 2996]
	add	x5, x5, 2777088
	ldr	w4, [x23, 3668]
	b	.L4198
.L4055:
	ldr	x1, .LC994
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
.L4221:
	ldr	x1, .LC996
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4046
	.size	MVC_InitPic, .-MVC_InitPic
	.align	3
.LC987:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC988:
	.xword	.LC90
	.align	3
.LC990:
	.xword	.LC989
	.align	3
.LC992:
	.xword	.LC991
	.align	3
.LC994:
	.xword	.LC993
	.align	3
.LC996:
	.xword	.LC995
	.align	3
.LC998:
	.xword	.LC997
	.align	3
.LC1000:
	.xword	.LC999
	.align	3
.LC1002:
	.xword	.LC1001
	.align	3
.LC1004:
	.xword	.LC1003
	.align	3
.LC1006:
	.xword	.LC1005
	.align	3
.LC1008:
	.xword	.LC1007
	.align	3
.LC1010:
	.xword	.LC1009
	.align	3
.LC1012:
	.xword	.LC1011
	.align	3
.LC1014:
	.xword	.LC1013
	.align	3
.LC1016:
	.xword	.LC1015
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecSlice
	.type	MVC_DecSlice, %function
MVC_DecSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 11116544
	bl	_mcount
	ldr	w2, [x20, 68]
	mov	w0, 22
	ldr	x1, .LC1017
	sub	w2, w2, #1
	bl	dprint_vfmw
	ldr	x1, [x20, 240]
	mov	x0, x20
	ldrb	w2, [x1, 2]
	strb	w2, [x19, 2971]
	ldrb	w1, [x1, 4]
	strb	w1, [x19, 2976]
	bl	MVC_ProcessSliceHeaderFirstPart
	cbnz	w0, .L4269
	mov	x0, x20
	bl	MVC_ProcessSliceHeaderSecondPart
	cbnz	w0, .L4269
	ldr	w2, [x20, 64]
	mov	w3, 0
	add	x11, x20, 11161600
	cbz	w2, .L4230
	sub	w9, w2, #1
	add	x11, x20, 11161600
	add	x9, x9, 1392640
	add	x4, x11, 1208
	add	x9, x9, 2712
	mov	x0, 0
	mov	w10, 0
	mov	w3, 0
	add	x9, x20, x9, lsl 3
	.p2align 2
.L4238:
	ldr	x1, [x4]
	ldr	x6, [x1, 8]
	cbz	x6, .L4250
	ldr	x5, [x1, 40]
	ldr	w7, [x1, 16]
	cbz	x5, .L4251
.L4274:
	ldr	w1, [x1, 48]
.L4233:
	cbz	x0, .L4234
	cmp	x6, x0
	mov	w8, w7
	bls	.L4235
	sub	x0, x6, x0
	sub	w0, w0, w10
	add	w8, w0, w7
.L4235:
	add	w3, w1, w3
	add	w3, w8, w3
.L4236:
	cbz	x5, .L4253
	mov	x0, x5
	mov	w10, w1
.L4237:
	add	x4, x4, 8
	cmp	x9, x4
	bne	.L4238
.L4230:
	str	w3, [x20, 104]
	ldr	w0, [x11, 368]
	ldr	w4, [x11, 372]
	mul	w4, w0, w4
	cmp	w4, 1620
	bgt	.L4270
	lsl	w1, w4, 2
	mov	w5, 32769
	sub	w1, w1, w4
	mov	w4, 16384
	lsl	w1, w1, 8
	asr	w0, w1, 1
	cmp	w1, w5
	csel	w4, w0, w4, gt
.L4240:
	ldr	w0, [x20, 32]
	cmp	w0, w2
	bls	.L4241
	cmp	w4, w3
	bcc	.L4241
	ldrb	w0, [x19, 2973]
	cbz	w0, .L4244
	ldr	x1, .LC1025
	mov	w0, 2
	bl	dprint_vfmw
	str	wzr, [x20, 100]
	ldr	w1, [x20, 88]
	add	x0, x20, 11157504
	add	w1, w1, 1
	str	w1, [x20, 88]
	ldrb	w0, [x0, 3723]
	cbnz	w0, .L4245
	ldr	w0, [x20, 92]
	add	w0, w0, 1
	str	w0, [x20, 92]
.L4246:
	mov	x0, x20
	bl	MVC_InitPic
	cmn	w0, #2
	beq	.L4227
	cbnz	w0, .L4271
	mov	x0, x20
	bl	MVC_WritePicMsg
.L4244:
	mov	x0, x20
	bl	MVC_PicTypeStatistic
	mov	x0, x20
	bl	MVC_DecList
	cbnz	w0, .L4272
	mov	x0, x20
	bl	MVC_IsRefListWrong
	cbnz	w0, .L4273
	mov	x0, x20
	bl	MVC_CalcStreamBits
	mov	x0, x20
	bl	MVC_WriteSliceMsg
	mov	x0, x20
	bl	MVC_ExitSlice
	ldr	w1, [x20, 100]
	mov	w2, 1
	mov	w0, 0
	strb	w2, [x20, 4]
	add	w1, w1, 1
	str	w1, [x20, 100]
.L4227:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4253:
	mov	x0, x6
	mov	w10, w7
	b	.L4237
	.p2align 3
.L4234:
	add	w3, w7, w3
	add	w3, w3, w1
	b	.L4236
	.p2align 3
.L4250:
	ldr	x5, [x1, 40]
	mov	w7, 0
	cbnz	x5, .L4274
	.p2align 2
.L4251:
	mov	w1, 0
	b	.L4233
	.p2align 3
.L4270:
	lsl	w4, w4, 7
	b	.L4240
	.p2align 3
.L4245:
	ldr	w0, [x20, 96]
	add	w0, w0, 1
	str	w0, [x20, 96]
	b	.L4246
.L4269:
	ldr	x1, .LC1018
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC1019
	ldr	x4, [x0]
	cbz	x4, .L4267
	add	x2, x29, 48
	ldr	w0, [x20, 120]
	mov	w5, -1
	mov	w3, 4
	mov	w1, 100
	str	w5, [x2, -8]!
	blr	x4
.L4267:
	mov	x0, x20
	bl	MVC_ClearCurrSlice
	mov	w0, -1
	b	.L4227
.L4241:
	ldr	x1, .LC1021
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x20, 32]
	ldr	w2, [x20, 64]
	cmp	w2, w1
	bcc	.L4243
	ldr	x0, .LC1019
	ldr	x4, [x0]
	cbz	x4, .L4243
	ldr	w0, [x20, 120]
	mov	w3, 8
	stp	w2, w1, [x29, 40]
	add	x2, x29, 40
	mov	w1, 108
	blr	x4
.L4243:
	ldr	x1, .LC1023
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x20
	bl	MVC_ClearAllSlice
	add	x1, x20, 11120640
	mov	w4, 32
	ldr	w8, [x20, 40]
	mov	w7, 23352
	movk	w7, 0x1, lsl 16
	mov	w6, 2
	strb	w4, [x1, 530]
	add	x4, x1, 512
	strb	wzr, [x1, 528]
	mov	w5, 7
	strb	w6, [x1, 529]
	mov	w0, -1
	strb	w5, [x1, 531]
	mov	w3, 3
	str	w8, [x1, 540]
	mov	w2, 262144
	str	w7, [x1, 544]
	stp	w3, w0, [x4, 40]
	stp	wzr, wzr, [x4, 48]
	str	w2, [x1, 568]
	b	.L4227
.L4272:
	ldr	x1, .LC1029
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4227
.L4273:
	ldr	x1, .LC1031
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4267
.L4271:
	ldr	x1, .LC1027
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4227
	.size	MVC_DecSlice, .-MVC_DecSlice
	.align	3
.LC1017:
	.xword	.LC875
	.align	3
.LC1018:
	.xword	.LC877
	.align	3
.LC1019:
	.xword	g_event_report
	.align	3
.LC1021:
	.xword	.LC1020
	.align	3
.LC1023:
	.xword	.LC1022
	.align	3
.LC1025:
	.xword	.LC1024
	.align	3
.LC1027:
	.xword	.LC1026
	.align	3
.LC1029:
	.xword	.LC1028
	.align	3
.LC1031:
	.xword	.LC1030
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DecOneNal
	.type	MVC_DecOneNal, %function
MVC_DecOneNal:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w21, w1
	bl	_mcount
	ldr	x3, [x19, 240]
	ldr	w0, [x3, 76]
	cbz	w0, .L4280
	ldr	w2, [x19, 104]
	mov	w0, 0
	.p2align 2
.L4279:
	ubfiz	x1, x0, 5, 32
	add	w0, w0, 1
	add	x1, x3, x1
	ldr	w1, [x1, 16]
	add	w2, w2, w1
	str	w2, [x19, 104]
	ldr	w1, [x3, 76]
	cmp	w1, w0
	bhi	.L4279
.L4280:
	add	x22, x19, 872
	strb	wzr, [x3]
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w20, w0
	and	w4, w0, 31
	ldr	x0, [x19, 240]
	ubfx	x3, x20, 5, 2
	ubfx	x1, x20, 7, 1
	mov	w2, -1
	strb	w4, [x0, 2]
	ldr	x0, [x19, 240]
	strb	w3, [x0, 4]
	ldr	x0, [x19, 240]
	str	w1, [x0, 84]
	ldr	x1, [x19, 240]
	ldr	w0, [x1, 72]
	add	w0, w0, 32
	str	w0, [x1, 72]
	strb	wzr, [x19, 10]
	ldr	x0, [x19, 240]
	strb	w2, [x0, 5]
	ldr	x0, [x19, 240]
	ldrb	w3, [x0, 2]
	cmp	w3, 14
	ccmp	w3, 20, 4, ne
	beq	.L4457
	ldr	x1, .LC1033
	mov	w0, 22
	ldr	w2, [x19, 68]
	bl	dprint_vfmw
	ldr	w0, [x19, 68]
	cmp	w0, 371
	beq	.L4458
.L4283:
	ldr	x1, [x19, 240]
	add	w0, w0, 1
	str	w0, [x19, 68]
	ldrb	w2, [x1, 2]
	sub	w0, w2, #1
	cmp	w0, 29
	bls	.L4459
.L4284:
	ldr	x1, .LC1075
	mov	w3, w20
	mov	w0, 22
	bl	dprint_vfmw
	cmp	w20, 256
	beq	.L4326
	ldr	x1, .LC1077
	mov	w0, 1
	bl	dprint_vfmw
.L4326:
	ldr	x1, [x19, 240]
	cbz	x1, .L4327
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4327:
	ldr	x0, .LC1041
	ldr	x4, [x0]
	cbz	x4, .L4442
.L4446:
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L4442:
	mov	w0, 0
.L4311:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4459:
	ldr	x1, .LC1036
	ldrh	w0, [x1,w0,uxtw #1]
	adr	x1, .Lrtx4286
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx4286:
	.section	.rodata
	.align	0
	.align	2
.L4286:
	.2byte	(.L4285 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4285 - .Lrtx4286) / 4
	.2byte	(.L4287 - .Lrtx4286) / 4
	.2byte	(.L4288 - .Lrtx4286) / 4
	.2byte	(.L4289 - .Lrtx4286) / 4
	.2byte	(.L4290 - .Lrtx4286) / 4
	.2byte	(.L4291 - .Lrtx4286) / 4
	.2byte	(.L4292 - .Lrtx4286) / 4
	.2byte	(.L4293 - .Lrtx4286) / 4
	.2byte	(.L4294 - .Lrtx4286) / 4
	.2byte	(.L4295 - .Lrtx4286) / 4
	.2byte	(.L4296 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4297 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4284 - .Lrtx4286) / 4
	.2byte	(.L4298 - .Lrtx4286) / 4
	.text
	.p2align 3
.L4457:
	mov	w1, 24
	mov	x0, x22
	bl	BsGet
	mov	w20, w0
	ldr	x0, [x19, 240]
	ubfx	x1, x20, 23, 1
	strb	w1, [x0, 5]
	ldr	x1, [x19, 240]
	ldrsb	w0, [x1, 5]
	cbnz	w0, .L4281
	add	x0, x19, 12288
	ubfx	x4, x20, 16, 6
	ubfx	x2, x20, 6, 10
	mov	w5, 1
	ubfx	x3, x20, 22, 1
	strb	w4, [x0, 2386]
	ubfx	x4, x20, 3, 3
	strb	w5, [x0, 2384]
	strb	w3, [x0, 2385]
	str	w2, [x19, 14680]
	ubfx	x2, x20, 2, 1
	strb	w4, [x0, 2387]
	ubfx	x4, x20, 1, 1
	strb	w2, [x0, 2388]
	and	w2, w20, 1
	strb	w4, [x0, 2389]
	strb	w2, [x0, 2390]
	ldrb	w0, [x1, 2]
	cmp	w0, 20
	beq	.L4460
.L4281:
	ldr	w0, [x1, 72]
	add	w0, w0, 24
	str	w0, [x1, 72]
	ldr	x1, .LC1033
	ldr	x0, [x19, 240]
	ldr	w2, [x19, 68]
	ldrb	w3, [x0, 2]
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x19, 68]
	cmp	w0, 371
	bne	.L4283
.L4458:
	ldr	x1, .LC1035
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x19, 68]
	b	.L4283
.L4285:
	ldr	x1, .LC1038
	mov	w0, 22
	ldr	w3, [x19, 80]
	bl	dprint_vfmw
	ldr	x1, [x19, 240]
	add	x2, x19, 11116544
	add	x5, x19, 11120640
	add	x0, x19, 12288
	mov	w3, -1
	ldrb	w6, [x1, 2]
	strb	w6, [x2, 2971]
	ldrb	w4, [x1, 4]
	strb	w4, [x2, 2976]
	ldrsb	w1, [x1, 5]
	strb	w1, [x2, 2980]
	strb	wzr, [x2, 2979]
	str	w3, [x5, 512]
	ldrb	w3, [x0, 2384]
	cmp	w3, 1
	beq	.L4461
	cmn	w1, #1
	beq	.L4462
.L4300:
	ldr	x1, .LC1040
	mov	w0, 21
	ldr	w2, [x19, 88]
	bl	dprint_vfmw
	mov	x0, x19
	bl	MVC_SliceCheck
	cbnz	w0, .L4463
	mov	x0, x19
	bl	MVC_DecSlice
	cmn	w0, #2
	beq	.L4311
	cbz	w0, .L4442
	ldr	x0, .LC1041
	ldr	x4, [x0]
	cbnz	x4, .L4443
.L4441:
	mov	w0, -1
.L4467:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L4287:
	ldr	x1, .LC1051
	mov	w2, 6
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x19
	bl	MVC_DecSEI
	mov	w20, w0
	ldr	x1, [x19, 240]
	cbz	x1, .L4318
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4318:
	cbz	w20, .L4442
	ldr	x1, .LC1053
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC1041
	ldr	x4, [x0]
	cbnz	x4, .L4446
	b	.L4442
.L4288:
	ldr	x1, .LC1047
	mov	w2, 7
	ldr	w3, [x19, 72]
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x19
	bl	MVC_DecSPS
	mov	w20, w0
	ldr	x1, [x19, 240]
	cbz	x1, .L4316
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4316:
	cbnz	w20, .L4464
	ldr	w1, [x19, 72]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 72]
	b	.L4311
.L4289:
	ldr	x1, .LC1043
	mov	w2, 8
	ldr	w3, [x19, 76]
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x19
	bl	MVC_DecPPS
	mov	w20, w0
	ldr	x1, [x19, 240]
	cbz	x1, .L4314
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4314:
	cbnz	w20, .L4465
	ldr	w1, [x19, 76]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 76]
	b	.L4311
.L4290:
	ldr	x1, .LC1055
	mov	w2, 9
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x19, 240]
	cbz	x1, .L4442
.L4445:
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L4291:
	ldr	x1, .LC1057
	mov	w2, 10
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x19, 240]
	cbnz	x1, .L4445
	b	.L4442
.L4292:
	ldr	x1, .LC1061
	mov	w2, 11
	mov	w0, 22
	bl	dprint_vfmw
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w20, w0
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w20, w2
	ccmp	w0, w1, 0, eq
	bne	.L4451
	ldr	x20, .LC1041
	mov	w0, 1
	strb	w0, [x19, 1]
	ldr	x4, [x20]
	cbz	x4, .L4321
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L4321:
	strb	wzr, [x19]
	mov	x0, x19
	bl	MVC_DecVDM
	cbz	w0, .L4451
	b	.L4453
.L4293:
	ldr	x1, .LC1059
	mov	w2, 12
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x19, 240]
	cbnz	x1, .L4445
	b	.L4442
.L4294:
	ldr	x1, .LC1063
	mov	w2, 13
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x19, 240]
	cbnz	x1, .L4445
	b	.L4442
.L4295:
	ldr	x1, .LC1065
	mov	w2, 14
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x19, 240]
	cbnz	x1, .L4445
	b	.L4442
.L4296:
	ldr	x1, .LC1067
	mov	w2, 15
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x19
	bl	MVC_DecSubSPS
	mov	w20, w0
	ldr	x1, [x19, 240]
	cbz	x1, .L4322
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4322:
	cbnz	w20, .L4466
	ldr	w1, [x19, 20]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 20]
	b	.L4311
.L4297:
	ldr	x1, .LC1070
	mov	w2, 19
	mov	w0, 22
	bl	dprint_vfmw
.L4451:
	ldr	x1, [x19, 240]
	cbnz	x1, .L4445
	b	.L4442
.L4298:
	ldr	x1, .LC1072
	mov	w2, 30
	mov	w0, 22
	bl	dprint_vfmw
	cbnz	w21, .L4324
	ldr	x1, [x19, 240]
	cbz	x1, .L4324
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
.L4324:
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w20, w0
	mov	w1, 32
	mov	x0, x22
	rev	w20, w20
	bl	BsGet
	rev	w0, w0
	ldr	x1, .LC1073
	add	x1, x1, 432
	ldr	w2, [x1, 4]
	ldr	w1, [x1, 8]
	cmp	w2, w20
	ccmp	w1, w0, 0, eq
	bne	.L4442
	ldr	x20, .LC1041
	ldr	x4, [x20]
	cbz	x4, .L4325
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L4325:
	strb	wzr, [x19]
	mov	x0, x19
	bl	MVC_DecVDM
	cbz	w0, .L4442
.L4453:
	ldr	x4, [x20]
	cbz	x4, .L4441
.L4443:
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	mov	w0, -1
	b	.L4467
.L4460:
	mov	w0, 5
	cmp	w3, wzr
	csinc	w0, w0, wzr, eq
	strb	w0, [x1, 2]
	ldr	x1, [x19, 240]
	b	.L4281
.L4463:
	mov	x0, x19
	bl	MVC_ClearCurrSlice
	ldr	x0, .LC1041
	ldr	x4, [x0]
	cbnz	x4, .L4443
	mov	w0, -1
	b	.L4467
.L4466:
	ldr	x1, .LC1068
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC1041
	ldr	x4, [x0]
	cbz	x4, .L4441
	add	x2, x29, 64
	ldr	w0, [x19, 120]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 100
	str	w20, [x2, -8]!
	blr	x4
	mov	w0, w20
	b	.L4311
.L4465:
	ldr	x1, .LC1045
.L4455:
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, .LC1041
	ldr	x4, [x21]
	cbz	x4, .L4441
	add	x2, x29, 64
	ldr	w0, [x19, 120]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 100
	str	w20, [x2, -8]!
	blr	x4
	ldr	x4, [x21]
	cbz	x4, .L4441
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	mov	w0, w20
	b	.L4311
.L4464:
	ldr	x1, .LC1049
	b	.L4455
.L4462:
	ldr	w1, [x19, 20]
	cbz	w1, .L4300
	add	x1, x19, 10768384
	ldr	w3, [x1, 4064]
	cbz	w3, .L4303
	ldrb	w3, [x1, 4060]
	cmp	w3, 1
	beq	.L4304
.L4303:
	add	x0, x0, 2400
	mov	x1, 0
	.p2align 2
.L4307:
	ldr	w4, [x0]
	add	x3, x0, 335872
	cbz	w4, .L4305
	ldrb	w0, [x0, -4]
	cbnz	w0, .L4468
.L4305:
	add	w1, w1, 1
	add	x0, x3, 308
	cmp	w1, 32
	bne	.L4307
	mov	w0, -1
.L4440:
	cmn	w0, #1
	str	w0, [x5, 512]
	beq	.L4300
	cmp	w6, 5
	mov	w0, 1
	cset	w1, eq
	strb	w0, [x2, 2979]
	strb	w0, [x2, 2978]
	strb	w1, [x2, 2977]
	b	.L4300
.L4461:
	strb	w3, [x2, 2979]
	ldr	w1, [x19, 14680]
	str	w1, [x5, 512]
	ldrb	w1, [x0, 2388]
	strb	w1, [x2, 2977]
	ldrb	w1, [x0, 2389]
	strb	w1, [x2, 2978]
	strb	wzr, [x0, 2384]
	b	.L4300
.L4468:
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 2
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x1, x0, x1
	lsl	x0, x1, 2
	sub	x1, x0, x1
	lsl	x0, x1, 6
	add	x0, x1, x0
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 14692]
	b	.L4440
.L4304:
	ldr	w0, [x1, 4068]
	b	.L4440
	.size	MVC_DecOneNal, .-MVC_DecOneNal
	.align	3
.LC1033:
	.xword	.LC1032
	.align	3
.LC1035:
	.xword	.LC1034
	.align	3
.LC1036:
	.xword	.L4286
	.align	3
.LC1038:
	.xword	.LC1037
	.align	3
.LC1040:
	.xword	.LC1039
	.align	3
.LC1041:
	.xword	g_event_report
	.align	3
.LC1043:
	.xword	.LC1042
	.align	3
.LC1045:
	.xword	.LC1044
	.align	3
.LC1047:
	.xword	.LC1046
	.align	3
.LC1049:
	.xword	.LC1048
	.align	3
.LC1051:
	.xword	.LC1050
	.align	3
.LC1053:
	.xword	.LC1052
	.align	3
.LC1055:
	.xword	.LC1054
	.align	3
.LC1057:
	.xword	.LC1056
	.align	3
.LC1059:
	.xword	.LC1058
	.align	3
.LC1061:
	.xword	.LC1060
	.align	3
.LC1063:
	.xword	.LC1062
	.align	3
.LC1065:
	.xword	.LC1064
	.align	3
.LC1067:
	.xword	.LC1066
	.align	3
.LC1068:
	.xword	.LC751
	.align	3
.LC1070:
	.xword	.LC1069
	.align	3
.LC1072:
	.xword	.LC1071
	.align	3
.LC1073:
	.xword	.LANCHOR1
	.align	3
.LC1075:
	.xword	.LC1074
	.align	3
.LC1077:
	.xword	.LC1076
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_DecodePacket
	.type	MVC_DEC_DecodePacket, %function
MVC_DEC_DecodePacket:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	str	wzr, [x29, 68]
	stp	wzr, wzr, [x29, 60]
	cbz	x20, .L4531
	ldr	x0, [x19, 224]
	ldrb	w1, [x19, 5]
	ldr	w2, [x0, 8]
	cmp	w1, 1
	ubfiz	w2, w2, 16, 2
	str	w2, [x19, 108]
	ldr	w1, [x0]
	str	w1, [x19, 112]
	ldr	w1, [x0, 4]
	str	w1, [x19, 116]
	strb	wzr, [x19, 10]
	beq	.L4472
	ldr	w1, [x0, 872]
	add	x21, x19, 11161600
	cmp	w1, 1
	beq	.L4532
.L4473:
	mov	x1, x20
	mov	x0, x19
	bl	MVC_ReceivePacket
	ldr	x1, [x19, 240]
	str	x1, [x21, 3640]
.L4475:
	strb	wzr, [x19, 5]
	cbz	w0, .L4476
.L4495:
	mov	w0, 0
.L4524:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4476:
	ldr	x0, [x19, 240]
.L4474:
	str	wzr, [x0, 72]
	add	x21, x19, 872
	mov	x0, x21
	ldr	x1, [x19, 240]
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	mov	w1, 32
	mov	x0, x21
	bl	BsGet
	mov	w20, w0
	and	w3, w0, 31
	ldr	x0, [x19, 240]
	ubfx	x2, x20, 5, 2
	mov	w1, -1
	strb	w3, [x0, 2]
	ldr	x0, [x19, 240]
	strb	w2, [x0, 4]
	ldr	x0, [x19, 240]
	strb	w1, [x0, 5]
	ldr	x0, [x19, 240]
	ldrb	w0, [x0, 2]
	cmp	w0, 20
	beq	.L4533
.L4525:
	mov	w0, 27
	strb	wzr, [x19, 10]
	and	w20, w20, w0
	cmp	w20, 1
	beq	.L4481
.L4482:
	mov	x0, x19
	bl	MVC_FindTrailZeros
	cbnz	w0, .L4534
.L4494:
	ldr	x1, [x19, 240]
	mov	x0, x21
	str	wzr, [x1, 72]
	ldr	x1, [x19, 240]
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	mov	w1, 0
	mov	x0, x19
	bl	MVC_DecOneNal
	cmn	w0, #2
	beq	.L4524
	cbz	w0, .L4495
.L4529:
	ldr	x0, .LC1085
	ldr	x4, [x0]
	cbz	x4, .L4527
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L4527:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4532:
	ldr	w0, [x0, 912]
	cmp	w0, 1
	bne	.L4473
	ldr	w0, [x21, 3632]
	cmp	w0, 1
	bne	.L4473
	ldr	x0, [x21, 3640]
	str	x0, [x19, 240]
	str	wzr, [x21, 3632]
	strb	wzr, [x19, 5]
	b	.L4474
	.p2align 3
.L4472:
	ldr	x0, [x19, 240]
	cmp	x0, xzr
	csetm	w0, eq
	b	.L4475
	.p2align 3
.L4533:
	mov	w1, 24
	mov	x0, x21
	bl	BsGet
	ubfx	x2, x0, 23, 1
	ldr	x1, [x19, 240]
	strb	w2, [x1, 5]
	ldr	x2, [x19, 240]
	ldrsb	w1, [x2, 5]
	cbnz	w1, .L4525
	add	x1, x19, 12288
	ubfx	x4, x0, 22, 1
	mov	w6, 1
	ubfx	x3, x0, 6, 10
	ubfx	x5, x0, 2, 1
	cmp	w4, wzr
	strb	w6, [x1, 2384]
	ubfx	x0, x0, 1, 1
	strb	w4, [x1, 2385]
	str	w3, [x19, 14680]
	mov	w3, 5
	strb	w0, [x1, 2389]
	csinc	w0, w3, wzr, eq
	strb	w5, [x1, 2388]
	strb	w0, [x2, 2]
	strb	wzr, [x19, 10]
	.p2align 2
.L4481:
	add	x2, x29, 76
	add	x1, x29, 72
	mov	x0, x19
	bl	MVC_InquireSliceProperty
	cbnz	w0, .L4483
	ldr	w1, [x29, 72]
	ldr	w0, [x19, 128]
	cmp	w1, 1
	csinc	w0, w0, w0, ne
	str	w0, [x19, 128]
	beq	.L4535
.L4484:
	ldr	w0, [x29, 76]
	cmp	w0, 1
	bne	.L4482
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbnz	w0, .L4536
.L4491:
	ldr	w0, [x19, 120]
	bl	FSP_GetFspType
	cbnz	w0, .L4482
	ldr	w0, [x19, 120]
	add	x2, x29, 64
	add	x3, x29, 68
	add	x1, x29, 60
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19, 224]
	ldr	w2, [x0, 748]
	cmp	w2, 1
	bne	.L4482
	ldr	w0, [x29, 68]
	cmp	w0, wzr
	ble	.L4537
.L4488:
	mov	w1, 1
	mov	w0, -2
	strb	w1, [x19, 5]
	b	.L4524
	.p2align 3
.L4483:
	ldr	x1, [x19, 240]
	cbz	x1, .L4529
	ldr	w0, [x19, 120]
	bl	MVC_ReleaseNAL
	str	xzr, [x19, 240]
	b	.L4529
	.p2align 3
.L4534:
	ldr	x1, .LC1087
	mov	w0, 22
	bl	dprint_vfmw
	b	.L4494
	.p2align 3
.L4535:
	add	x20, x19, 11116544
	ldrb	w0, [x20, 2969]
	cmp	w0, 1
	ldr	w0, [x19, 132]
	beq	.L4538
	add	w0, w0, 2
	str	w0, [x19, 132]
.L4486:
	ldr	w0, [x19, 64]
	cbz	w0, .L4484
	ldr	x3, [x19, 240]
	mov	w2, 12
	ldr	x1, .LC1081
	mov	x0, x21
	add	x1, x1, 432
	str	wzr, [x3, 72]
	bl	BsInit
	mov	w1, 1
	mov	x0, x19
	bl	MVC_DecOneNal
	ldrb	w0, [x20, 2969]
	cmp	w0, 1
	ldr	w0, [x19, 132]
	beq	.L4539
	sub	w0, w0, #2
	str	w0, [x19, 132]
	b	.L4488
.L4538:
	add	w0, w0, 1
	str	w0, [x19, 132]
	b	.L4486
.L4536:
	ldr	x1, .LC1082
	mov	w3, 0
	mov	w2, 14160
	mov	w0, 22
	bl	dprint_vfmw
	b	.L4491
.L4531:
	ldr	x2, .LC1079
	mov	w3, 14043
	ldr	x1, .LC1080
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4524
.L4539:
	sub	w0, w0, #1
	str	w0, [x19, 132]
	b	.L4488
.L4537:
	ldr	w0, [x29, 64]
	cmp	w0, 32
	bgt	.L4488
	ldr	x0, [x19, 232]
	cbnz	x0, .L4488
	ldr	w3, [x19, 88]
	cbz	w3, .L4482
	ldr	w6, [x19, 12]
	cbz	w6, .L4482
	add	x20, x19, 11161600
	ldr	w7, [x19, 16]
	ldr	w5, [x20, 3648]
	cmp	w7, w5
	beq	.L4482
	ldr	w4, [x20, 3652]
	cmp	w6, w4
	beq	.L4482
	ldr	x1, .LC1084
	mov	w0, w2
	bl	dprint_vfmw
	ldr	w0, [x19, 16]
	ldr	x1, .LC1085
	str	w0, [x20, 3648]
	ldr	x4, [x1]
	ldr	w0, [x19, 12]
	str	w0, [x20, 3652]
	cbz	x4, .L4482
	ldr	w0, [x19, 120]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	b	.L4482
	.size	MVC_DEC_DecodePacket, .-MVC_DEC_DecodePacket
	.align	3
.LC1079:
	.xword	.LC36
	.align	3
.LC1080:
	.xword	.LC38
	.align	3
.LC1081:
	.xword	.LANCHOR1
	.align	3
.LC1082:
	.xword	.LC989
	.align	3
.LC1084:
	.xword	.LC1083
	.align	3
.LC1085:
	.xword	g_event_report
	.align	3
.LC1087:
	.xword	.LC1086
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_VDMPostProc
	.type	MVC_DEC_VDMPostProc, %function
MVC_DEC_VDMPostProc:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldrb	w0, [x19]
	cbnz	w0, .L4541
	add	x21, x19, 11161600
	mov	x0, x19
	str	w20, [x21, 364]
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_StorePicInDpb
	mov	w22, w0
	cbnz	w0, .L4552
	mov	w1, 1
	strb	w1, [x19, 4]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4541:
	add	x2, x19, 11161600
	mov	x0, x19
	str	w20, [x2, 364]
	bl	MVC_ClearAllSlice
	mov	x0, x19
	bl	MVC_StorePicInDpb
	cbnz	w0, .L4553
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbnz	w0, .L4554
.L4545:
	add	x0, x19, 11120640
	strb	wzr, [x19, 4]
	mov	w4, 32
	ldr	w8, [x19, 40]
	mov	w7, 23352
	mov	w6, 2
	strb	w4, [x0, 530]
	add	x4, x0, 512
	strb	wzr, [x0, 528]
	movk	w7, 0x1, lsl 16
	strb	w6, [x0, 529]
	mov	w5, 7
	str	w8, [x0, 540]
	mov	w3, 3
	strb	w5, [x0, 531]
	mov	w2, -1
	str	w7, [x0, 544]
	mov	w1, 262144
	stp	w3, w2, [x4, 40]
	stp	wzr, wzr, [x4, 48]
	str	w1, [x0, 568]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4552:
	ldr	x1, [x21, 304]
	mov	w2, 1
	ldr	w0, [x19, 120]
	mov	w20, -1
	ldrsb	w1, [x1, 6]
	bl	FSP_ClearLogicFs
	ldr	x1, .LC1089
	mov	w2, w22
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	MVC_ClearAllSlice
	add	x0, x19, 11120640
	ldr	w4, [x19, 40]
	add	x5, x0, 512
	mov	w2, 2
	mov	w3, 23352
	mov	w1, 7
	strb	w2, [x0, 529]
	movk	w3, 0x1, lsl 16
	strb	w1, [x0, 531]
	mov	w2, 32
	str	w4, [x0, 540]
	mov	w1, 3
	strb	w2, [x0, 530]
	mov	w2, 262144
	str	w3, [x0, 544]
	strb	wzr, [x0, 528]
	stp	w1, w20, [x5, 40]
	stp	wzr, wzr, [x5, 48]
	str	w2, [x0, 568]
	mov	w1, w20
	mov	x0, x19
	bl	MVC_ClearDPB
	str	xzr, [x21, 304]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L4554:
	ldr	x1, .LC1093
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4545
	.p2align 3
.L4553:
	ldr	x1, .LC1091
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w1, -1
	mov	x0, x19
	bl	MVC_FlushDPB
	cbz	w0, .L4545
	b	.L4554
	.size	MVC_DEC_VDMPostProc, .-MVC_DEC_VDMPostProc
	.align	3
.LC1089:
	.xword	.LC1088
	.align	3
.LC1091:
	.xword	.LC1090
	.align	3
.LC1093:
	.xword	.LC1092
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MVC_DEC_GetImageBuffer
	.type	MVC_DEC_GetImageBuffer, %function
MVC_DEC_GetImageBuffer:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 48]
	cbz	w0, .L4572
	mov	x1, 51320
	sub	w0, w0, #1
	mov	w4, 880
	movk	x1, 0xa9, lsl 16
	add	x21, x20, 11124736
	umaddl	x4, w0, w4, x1
	add	x2, x21, 1288
	add	x4, x20, x4
	.p2align 2
.L4563:
	ldrb	w0, [x2, 2]
	cbnz	w0, .L4558
	cbz	x2, .L4559
	ldr	w0, [x21, 920]
	cbz	w0, .L4559
	ldr	x1, [x21, 536]
	cmp	x1, x2
	ccmp	x1, xzr, 4, eq
	bne	.L4558
	sub	w3, w0, #1
	add	x0, x21, 544
	add	x3, x3, 1388544
	add	x3, x3, 2116
	add	x3, x20, x3, lsl 3
	b	.L4560
	.p2align 3
.L4561:
	ldr	x1, [x0], 8
	cmp	x1, xzr
	ccmp	x1, x2, 0, ne
	beq	.L4558
.L4560:
	cmp	x0, x3
	bne	.L4561
.L4559:
	ldr	w0, [x20, 120]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L4572
	ldr	w0, [x20, 120]
	bl	FSP_IsNewFsAvalible
	cmn	w0, #1
	beq	.L4593
.L4591:
	mov	w0, 0
.L4594:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4558:
	add	x2, x2, 880
	cmp	x2, x4
	bne	.L4563
	add	x2, x29, 60
	add	x1, x29, 56
	add	x0, x20, 912
	bl	GetQueueImgNum
	ldr	x1, .LC1095
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, .LC1097
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x20, 48]
	cbz	w0, .L4571
	ldr	x19, .LC1101
	mov	w22, 0
	.p2align 2
.L4570:
	uxtw	x2, w22
	lsl	x0, x2, 3
	sub	x0, x0, x2
	lsl	x0, x0, 3
	sub	x2, x0, x2
	lsl	x2, x2, 4
	add	x0, x20, x2
	add	x2, x2, 11124736
	add	x0, x0, 11124736
	add	x2, x20, x2
	adds	x2, x2, 1288
	ldrb	w3, [x0, 1290]
	ldrb	w4, [x0, 1293]
	beq	.L4575
	ldr	w0, [x21, 920]
	cbz	w0, .L4575
	ldr	x1, [x21, 536]
	cmp	x2, x1
	ccmp	x1, xzr, 4, eq
	bne	.L4577
	sub	w5, w0, #1
	add	x0, x21, 544
	add	x5, x5, 1388544
	add	x5, x5, 2116
	add	x5, x20, x5, lsl 3
	b	.L4568
	.p2align 3
.L4569:
	ldr	x1, [x0], 8
	cmp	x2, x1
	ccmp	x1, xzr, 4, eq
	bne	.L4577
.L4568:
	cmp	x5, x0
	bne	.L4569
.L4575:
	mov	w5, 1
.L4567:
	mov	w2, w22
	mov	x1, x19
	mov	w0, 0
	add	w22, w22, 1
	bl	dprint_vfmw
	ldr	w0, [x20, 48]
	cmp	w0, w22
	bhi	.L4570
.L4571:
	ldp	w2, w3, [x29, 56]
	ldr	x1, .LC1099
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x20, 48]
	ldr	w2, [x21, 924]
	ldp	w3, w1, [x29, 56]
	sub	w0, w0, #2
	sub	w0, w0, w2
	add	w1, w3, w1
	cmp	w1, w0
	bge	.L4591
	ldr	x1, .LC1103
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x20
	bl	MVC_ClearAll
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4572:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 1
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4577:
	mov	w5, 0
	b	.L4567
.L4593:
	ldr	w0, [x20, 120]
	add	x1, x20, 912
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	b	.L4594
	.size	MVC_DEC_GetImageBuffer, .-MVC_DEC_GetImageBuffer
	.align	3
.LC1095:
	.xword	.LC1094
	.align	3
.LC1097:
	.xword	.LC1096
	.align	3
.LC1099:
	.xword	.LC1098
	.align	3
.LC1101:
	.xword	.LC1100
	.align	3
.LC1103:
	.xword	.LC1102
	.global	MvcTmpBuf
	.global	MVC_quant8_org
	.global	MVC_quant_org
	.global	MVC_quant8_inter_default
	.global	MVC_quant8_intra_default
	.global	MVC_quant_inter_default
	.global	MVC_quant_intra_default
	.global	MVC_g_ZZ_SCAN8
	.global	MVC_g_ZZ_SCAN
	.global	MVC_CalcZeroNum
	.global	MVC_g_AspecRatioIdc
	.global	MVC_g_NalTypeEOPIC
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	MVC_g_ZZ_SCAN, %object
	.size	MVC_g_ZZ_SCAN, 16
MVC_g_ZZ_SCAN:
	.byte	0
	.byte	1
	.byte	4
	.byte	8
	.byte	5
	.byte	2
	.byte	3
	.byte	6
	.byte	9
	.byte	12
	.byte	13
	.byte	10
	.byte	7
	.byte	11
	.byte	14
	.byte	15
	.type	MVC_g_ZZ_SCAN8, %object
	.size	MVC_g_ZZ_SCAN8, 64
MVC_g_ZZ_SCAN8:
	.byte	0
	.byte	1
	.byte	8
	.byte	16
	.byte	9
	.byte	2
	.byte	3
	.byte	10
	.byte	17
	.byte	24
	.byte	32
	.byte	25
	.byte	18
	.byte	11
	.byte	4
	.byte	5
	.byte	12
	.byte	19
	.byte	26
	.byte	33
	.byte	40
	.byte	48
	.byte	41
	.byte	34
	.byte	27
	.byte	20
	.byte	13
	.byte	6
	.byte	7
	.byte	14
	.byte	21
	.byte	28
	.byte	35
	.byte	42
	.byte	49
	.byte	56
	.byte	57
	.byte	50
	.byte	43
	.byte	36
	.byte	29
	.byte	22
	.byte	15
	.byte	23
	.byte	30
	.byte	37
	.byte	44
	.byte	51
	.byte	58
	.byte	59
	.byte	52
	.byte	45
	.byte	38
	.byte	31
	.byte	39
	.byte	46
	.byte	53
	.byte	60
	.byte	61
	.byte	54
	.byte	47
	.byte	55
	.byte	62
	.byte	63
	.type	__FUNCTION__.12919, %object
	.size	__FUNCTION__.12919, 18
__FUNCTION__.12919:
	.string	"MVC_WriteSliceMsg"
	.zero	6
	.type	MVC_SarTable.13212, %object
	.size	MVC_SarTable.13212, 136
MVC_SarTable.13212:
	.word	1
	.word	1
	.word	1
	.word	1
	.word	12
	.word	11
	.word	10
	.word	11
	.word	16
	.word	11
	.word	40
	.word	33
	.word	24
	.word	11
	.word	20
	.word	11
	.word	32
	.word	11
	.word	80
	.word	33
	.word	18
	.word	11
	.word	15
	.word	11
	.word	64
	.word	33
	.word	160
	.word	99
	.word	4
	.word	3
	.word	3
	.word	2
	.word	2
	.word	1
	.type	__func__.13446, %object
	.size	__func__.13446, 11
__func__.13446:
	.string	"MVC_DecSEI"
	.zero	5
	.type	__func__.12099, %object
	.size	__func__.12099, 17
__func__.12099:
	.string	"MVC_DirectOutput"
	.zero	7
	.type	__func__.12679, %object
	.size	__func__.12679, 12
__func__.12679:
	.string	"MVC_InitDPB"
	.zero	4
	.type	__FUNCTION__.11819, %object
	.size	__FUNCTION__.11819, 13
__FUNCTION__.11819:
	.string	"MVC_ClearDPB"
	.zero	3
	.type	__func__.13557, %object
	.size	__func__.13557, 17
__func__.13557:
	.string	"MVC_FlushDecoder"
	.zero	7
	.type	__FUNCTION__.11827, %object
	.size	__FUNCTION__.11827, 13
__FUNCTION__.11827:
	.string	"MVC_ClearAll"
	.zero	3
	.type	__FUNCTION__.13684, %object
	.size	__FUNCTION__.13684, 13
__FUNCTION__.13684:
	.string	"MVC_DEC_Init"
	.zero	3
	.type	__func__.12249, %object
	.size	__func__.12249, 18
__func__.12249:
	.string	"MVC_StorePicInDpb"
	.data
	.align	3
.LANCHOR1 = . + 0
	.type	MVC_quant_intra_default, %object
	.size	MVC_quant_intra_default, 16
MVC_quant_intra_default:
	.word	471076102
	.word	538711053
	.word	622861332
	.word	707076124
	.type	MVC_quant_inter_default, %object
	.size	MVC_quant_inter_default, 16
MVC_quant_inter_default:
	.word	403967498
	.word	454562830
	.word	505092116
	.word	572398360
	.type	MVC_quant8_intra_default, %object
	.size	MVC_quant8_intra_default, 64
MVC_quant8_intra_default:
	.word	269289990
	.word	454629138
	.word	303041290
	.word	488315159
	.word	387059725
	.word	522001177
	.word	420942352
	.word	555687195
	.word	454629138
	.word	606150429
	.word	488315159
	.word	639901983
	.word	522001177
	.word	673588257
	.word	555687195
	.word	707274276
	.type	MVC_quant8_inter_default, %object
	.size	MVC_quant8_inter_default, 256
MVC_quant8_inter_default:
	.word	286199049
	.word	404100371
	.word	319884557
	.word	421008917
	.word	353571087
	.word	454629398
	.word	370479889
	.word	471537944
	.word	404100371
	.word	505158425
	.word	421008917
	.word	538844187
	.word	454629398
	.word	555752988
	.word	471537944
	.word	589373470
	.zero	192
	.type	MVC_quant_org, %object
	.size	MVC_quant_org, 16
MVC_quant_org:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	MVC_quant8_org, %object
	.size	MVC_quant8_org, 64
MVC_quant8_org:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	MVC_g_NalTypeEOPIC, %object
	.size	MVC_g_NalTypeEOPIC, 12
MVC_g_NalTypeEOPIC:
	.byte	0
	.byte	0
	.byte	1
	.byte	30
	.byte	72
	.byte	83
	.byte	80
	.byte	73
	.byte	67
	.byte	69
	.byte	78
	.byte	68
	.zero	4
	.type	MVC_CalcZeroNum, %object
	.size	MVC_CalcZeroNum, 256
MVC_CalcZeroNum:
	.byte	8
	.byte	7
	.byte	6
	.byte	6
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.type	MVC_g_AspecRatioIdc, %object
	.size	MVC_g_AspecRatioIdc, 112
MVC_g_AspecRatioIdc:
	.word	1
	.word	1
	.word	1
	.word	1
	.word	12
	.word	11
	.word	10
	.word	11
	.word	16
	.word	11
	.word	40
	.word	33
	.word	24
	.word	11
	.word	20
	.word	11
	.word	32
	.word	11
	.word	80
	.word	33
	.word	18
	.word	11
	.word	15
	.word	11
	.word	64
	.word	33
	.word	160
	.word	99
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"\n\nEND of the bit buffer, copy the first packet!\n\n" )
	.zero	6
.LC2:
	ASCII(.string	"0:phy:0x%x, 1:phy:0x%x; len0:%d len1:%d\n" )
	.zero	7
.LC5:
	ASCII(.string	"0:phy:0x%x, len0:%d\n" )
	.zero	3
.LC7:
	ASCII(.string	"%-50s%50d\n" )
	.zero	5
.LC14:
	ASCII(.string	"MVC_FRAME %d, state=%d, is already output\n" )
	.zero	5
.LC16:
	ASCII(.string	"plfs(fs=%p, eFoState=%d) is null, logic_fs_id = %d\n" )
	.zero	4
.LC18:
	ASCII(.string	"not used MVC_FRAME: (%d,%d)\n" )
	.zero	3
.LC20:
	ASCII(.string	"MVC_FRAME skip: is_used=%d,skip=%d\n" )
	.zero	4
.LC22:
	ASCII(.string	"topfield skip\n" )
	.zero	1
.LC24:
	ASCII(.string	"bottom field skip\n" )
	.zero	5
.LC26:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC28:
	ASCII(.string	"exg_pts: %lld <-> %lld\n" )
.LC31:
	ASCII(.string	"stream MVC_FRAME packing type is %d! what can we do?\n" )
	.zero	2
.LC36:
	ASCII(.string	"firmware/common/syntax/mvc.c" )
	.zero	3
.LC38:
	ASCII(.string	"NULL pointer: %s, L%d\n" )
	.zero	1
.LC40:
	ASCII(.string	"framestore %d allocate apc %d\n" )
	.zero	1
.LC42:
	ASCII(.string	"find APC, but logic_fs_id %d abnormal(ref=%d,plfs=%p, pdfs=%p)\n" )
.LC45:
	ASCII(.string	"\n" )
	.zero	6
.LC47:
	ASCII(.string	"pMvcCtx->DPB.fs[%d]: frame_num=%d poc=%d is_reference=%d\n" )
	.zero	6
.LC49:
	ASCII(.string	"pMvcCtx->DPB.fs_ref[%d]: frame_num=%d poc=%d is_reference=%d\n" )
	.zero	2
.LC51:
	ASCII(.string	"pMvcCtx->DPB.fs_ref[%d]: MVC_FRAME.poc=%d \n" )
	.zero	4
.LC57:
	ASCII(.string	"\n VFMW ** release streambuff=%p   bitstream_length=%d\n" )
	.zero	1
.LC59:
	ASCII(.string	"clear curr slice.\n" )
	.zero	5
.LC62:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC64:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC66:
	ASCII(.string	"ERROR: FSP_ConfigInstance fail!\n" )
	.zero	7
.LC75:
	ASCII(.string	"for P slice size of list equal 0(1st).\n" )
.LC81:
	ASCII(.string	"for P slice size of list equal 0(2nd).\n" )
.LC83:
	ASCII(.string	"for B slice size of two list all equal 0.\n" )
	.zero	5
.LC86:
	ASCII(.string	"list[%d][%d]: frame_num=%d, poc=%d\n" )
	.zero	4
.LC88:
	ASCII(.string	"init list error.\n" )
	.zero	6
.LC90:
	ASCII(.string	"In one access unit,all non-base view should have the same subsps!\n" )
	.zero	5
.LC92:
	ASCII(.string	"sps but mvc flag %d is wrong\n" )
	.zero	2
.LC104:
	ASCII(.string	"save pic yuv :  structure = %d;  idc = %d\n" )
	.zero	5
.LC106:
	ASCII(.string	"structure = %d pMvcCtx->CurrPic.pic_width_in_mb = %d pMvcCtx->CurrPic.pic_height_in_mb = %d\n" )
	.zero	3
.LC108:
	ASCII(.string	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=%d\n" )
	.zero	1
.LC110:
	ASCII(.string	"logic MVC_FRAME id(=%d): get LogicFs error!\n" )
	.zero	3
.LC112:
	ASCII(.string	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p\n" )
	.zero	3
.LC118:
	ASCII(.string	"fuction return value is null,%s %d unknow error!!\n" )
	.zero	5
.LC120:
	ASCII(.string	"SH: first_mb_in_slice" )
	.zero	2
.LC122:
	ASCII(.string	"MVC_SliceCheck first_mb_in_slice >= MAX_MB_NUM_IN_PIC error.\n" )
	.zero	2
.LC124:
	ASCII(.string	"SH: slice_type" )
	.zero	1
.LC126:
	ASCII(.string	"slice type = %d\n" )
	.zero	7
.LC129:
	ASCII(.string	"slice type = %d, err\n" )
	.zero	2
.LC131:
	ASCII(.string	"slice  pps id = %d\n" )
	.zero	4
.LC133:
	ASCII(.string	"pps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	1
.LC135:
	ASCII(.string	"sps with this pic_parameter_set_id havn't decode\n" )
	.zero	6
.LC137:
	ASCII(.string	"subsps with this seq_parameter_set_id = %d havn't decoded\n" )
	.zero	5
.LC140:
	ASCII(.string	"tmp slice  pps id = %d\n" )
.LC142:
	ASCII(.string	"MVC_PPSSPSCheckTmpId: pps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	3
.LC144:
	ASCII(.string	"MVC_PPSSPSCheckTmpId: seq_parameter_set_id out of range.\n" )
	.zero	6
.LC146:
	ASCII(.string	"MVC_PPSSPSCheckTmpId: sps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	3
.LC148:
	ASCII(.string	"new pic flag = %d\n" )
	.zero	5
.LC150:
	ASCII(.string	"SH: ref_pic_list_reordering_flag_l0" )
	.zero	4
.LC152:
	ASCII(.string	"SH: reordering_of_pic_nums_idc_l0" )
	.zero	6
.LC154:
	ASCII(.string	"reorder idc l0 = %d, g_SeErrFlag=%d\n" )
	.zero	3
.LC156:
	ASCII(.string	"SH: abs_diff_pic_num_minus1_l0" )
	.zero	1
.LC158:
	ASCII(.string	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\n" )
	.zero	7
.LC160:
	ASCII(.string	"SH: long_term_pic_idx_l0" )
	.zero	7
.LC162:
	ASCII(.string	"SH: abs_diff_view_idx_minus1_l0" )
.LC164:
	ASCII(.string	"num of idc l0 exceed\n" )
	.zero	2
.LC166:
	ASCII(.string	"SH: ref_pic_list_reordering_flag_l1" )
	.zero	4
.LC168:
	ASCII(.string	"SH: reordering_of_pic_nums_idc_l1" )
	.zero	6
.LC170:
	ASCII(.string	"reorder idc l1 = %d, g_SeErrFlag=%d\n" )
	.zero	3
.LC172:
	ASCII(.string	"SH: abs_diff_pic_num_minus1_l1" )
	.zero	1
.LC174:
	ASCII(.string	"abs_diff_pic_num_minus1_l1 = %d, g_SeErrFlag=%d\n" )
	.zero	7
.LC176:
	ASCII(.string	"SH: long_term_pic_idx_l1" )
	.zero	7
.LC178:
	ASCII(.string	"SH: abs_diff_view_idx_minus1_l1" )
.LC180:
	ASCII(.string	"num of idc l1 exceed\n" )
	.zero	2
.LC182:
	ASCII(.string	"SH: luma_log2_weight_denom" )
	.zero	5
.LC184:
	ASCII(.string	"SH: chroma_log2_weight_denom" )
	.zero	3
.LC186:
	ASCII(.string	"WP log2 exceed  and err flag = %d\n" )
	.zero	5
.LC188:
	ASCII(.string	"SH: luma_weight_flag_l0" )
.LC190:
	ASCII(.string	"SH: luma_weight_l0" )
	.zero	5
.LC192:
	ASCII(.string	"SH: luma_offset_l0" )
	.zero	5
.LC194:
	ASCII(.string	"SH: chroma_weight_flag_l0" )
	.zero	6
.LC196:
	ASCII(.string	"SH: chroma_weight_l0" )
	.zero	3
.LC198:
	ASCII(.string	"SH: chroma_offset_l0" )
	.zero	3
.LC200:
	ASCII(.string	"SH: luma_weight_flag_l1" )
.LC202:
	ASCII(.string	"SH: luma_weight_l1" )
	.zero	5
.LC204:
	ASCII(.string	"SH: luma_offset_l1" )
	.zero	5
.LC206:
	ASCII(.string	"SH: chroma_weight_flag_l1" )
	.zero	6
.LC208:
	ASCII(.string	"SH: chroma_weight_l1" )
	.zero	3
.LC210:
	ASCII(.string	"SH: chroma_offset_l1" )
	.zero	3
.LC212:
	ASCII(.string	"overflow MVC_MAX_MMCO_LEN\n" )
	.zero	5
.LC214:
	ASCII(.string	"SH: memory_management_control_operation" )
.LC216:
	ASCII(.string	"SH: difference_of_pic_nums_minus1" )
	.zero	6
.LC218:
	ASCII(.string	"SH: long_term_pic_num" )
	.zero	2
.LC220:
	ASCII(.string	"SH: long_term_frame_idx" )
.LC222:
	ASCII(.string	"SH: max_long_term_frame_idx_plus1" )
	.zero	6
.LC224:
	ASCII(.string	"mmco exceed 6\n" )
	.zero	1
.LC226:
	ASCII(.string	"SH: no_output_of_prior_pics_flag" )
	.zero	7
.LC228:
	ASCII(.string	"SH: long_term_reference_flag" )
	.zero	3
.LC230:
	ASCII(.string	"IDR and no_output_of_prior_pics_flag = %d\n" )
	.zero	5
.LC232:
	ASCII(.string	"SH: adaptive_ref_pic_marking_mode_flag" )
	.zero	1
.LC234:
	ASCII(.string	"adaptive_ref_pic_marking_mode_flag = %d\n" )
	.zero	7
.LC236:
	ASCII(.string	"MMCO para would save dec err\n" )
	.zero	2
.LC238:
	ASCII(.string	"mulitislice diff no_out_of_prior_pics_flag, used first.\n" )
	.zero	7
.LC240:
	ASCII(.string	"mulitislice diff long_term_reference_flag, used first.\n" )
.LC242:
	ASCII(.string	"mulitislice diff adaptive_ref_pic_marking_mode_flag, used first.\n" )
	.zero	6
.LC244:
	ASCII(.string	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\n" )
	.zero	1
.LC246:
	ASCII(.string	"SH: pic_parameter_set_id" )
	.zero	7
.LC248:
	ASCII(.string	"pps id:%d in sliceheader err\n" )
	.zero	2
.LC250:
	ASCII(.string	"PPS or SPS of this slice not valid\n" )
	.zero	4
.LC252:
	ASCII(.string	"MVC_PPSSPSCheck failed, PPS or SPS of this slice not valid\n" )
	.zero	4
.LC254:
	ASCII(.string	"SH: frame_num" )
	.zero	2
.LC256:
	ASCII(.string	"IDR NAL but frame_num!=0.\n" )
	.zero	5
.LC258:
	ASCII(.string	"SH: field_pic_flag" )
	.zero	5
.LC260:
	ASCII(.string	"SH: bottom_field_flag" )
	.zero	2
.LC262:
	ASCII(.string	"field first_mb_in_slice bigger than pic size\n" )
	.zero	2
.LC264:
	ASCII(.string	"MVC_FRAME first_mb_in_slice bigger than pic size\n" )
	.zero	6
.LC266:
	ASCII(.string	"SH: idr_pic_id" )
	.zero	1
.LC268:
	ASCII(.string	"idr_pic_id bigger than 65535\n" )
	.zero	2
.LC270:
	ASCII(.string	"SH: pic_order_cnt_lsb" )
	.zero	2
.LC272:
	ASCII(.string	"SH: delta_pic_order_cnt_bottom" )
	.zero	1
.LC274:
	ASCII(.string	"SH: delta_pic_order_cnt[0]" )
	.zero	5
.LC276:
	ASCII(.string	"SH: delta_pic_order_cnt[1]" )
	.zero	5
.LC278:
	ASCII(.string	"SH: redundant_pic_cnt" )
	.zero	2
.LC280:
	ASCII(.string	"redundant pic not support.\n" )
	.zero	4
.LC283:
	ASCII(.string	"first_mb_in_slice in currslice small than prevslice in same pic\n" )
	.zero	7
.LC287:
	ASCII(.string	"SH: direct_spatial_mv_pred_flag" )
.LC289:
	ASCII(.string	"SH: num_ref_idx_override_flag" )
	.zero	2
.LC291:
	ASCII(.string	"SH: num_ref_idx_l0_active_minus1" )
	.zero	7
.LC293:
	ASCII(.string	"SH: num_ref_idx_l1_active_minus1" )
	.zero	7
.LC295:
	ASCII(.string	"MVC_FRAME num_ref_idx_lx_active_minus1 exceed\n" )
	.zero	1
.LC297:
	ASCII(.string	"field num_ref_idx_lx_active_minus1 exceed\n" )
	.zero	5
.LC299:
	ASCII(.string	"reordering para dec err\n" )
	.zero	7
.LC301:
	ASCII(.string	"apply_weights_flag=%d\n" )
	.zero	1
.LC303:
	ASCII(.string	"wpt dec err\n" )
	.zero	3
.LC305:
	ASCII(.string	"mark para dec err\n" )
	.zero	5
.LC307:
	ASCII(.string	"SH: cabac_init_idc" )
	.zero	5
.LC309:
	ASCII(.string	"cabac_init_idc bigger than 3\n" )
	.zero	2
.LC311:
	ASCII(.string	"SH: slice_qp_delta" )
	.zero	5
.LC313:
	ASCII(.string	"SH: disable_deblocking_filter_idc" )
	.zero	6
.LC315:
	ASCII(.string	"disable_deblocking_filter_idc dec err\n" )
	.zero	1
.LC317:
	ASCII(.string	"SH: slice_alpha_c0_offset_div2" )
	.zero	1
.LC319:
	ASCII(.string	"slice_alpha_c0_offset_div2 dec err\n" )
	.zero	4
.LC321:
	ASCII(.string	"SH: slice_beta_offset_div2" )
	.zero	5
.LC323:
	ASCII(.string	"slice_beta_offset_div2 dec err\n" )
.LC325:
	ASCII(.string	"pMvcCtx->pCurrNal->nal_bitoffset = %d; code_len_byte = %d; bitstream_length = %d; pMvcCtx->pCurrNal->nal_trail_zero_bit_num = %d\n" )
	.zero	6
.LC327:
	ASCII(.string	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; bytespos = %x\n" )
	.zero	1
.LC329:
	ASCII(.string	"nal_segment = %d is not expected value\n" )
.LC331:
	ASCII(.string	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\n" )
.LC334:
	ASCII(.string	"   : delta_sl   " )
	.zero	7
.LC338:
	ASCII(.string	"PPS: entropy_coding_mode_flag" )
	.zero	2
.LC340:
	ASCII(.string	"PPS: pic_order_present_flag" )
	.zero	4
.LC342:
	ASCII(.string	"PPS: num_slice_groups_minus1" )
	.zero	3
.LC344:
	ASCII(.string	"MVC_BASELINE stream with FMO, not support.\n" )
	.zero	4
.LC347:
	ASCII(.string	"PPS: num_ref_idx_l0_active_minus1" )
	.zero	6
.LC349:
	ASCII(.string	"num_ref_idx_l0_active_minus1 out of range.\n" )
	.zero	4
.LC351:
	ASCII(.string	"PPS: num_ref_idx_l1_active_minus1" )
	.zero	6
.LC353:
	ASCII(.string	"num_ref_idx_l1_active_minus1 out of range.\n" )
	.zero	4
.LC355:
	ASCII(.string	"PPS: weighted prediction flag" )
	.zero	2
.LC357:
	ASCII(.string	"PPS: weighted_bipred_idc" )
	.zero	7
.LC359:
	ASCII(.string	"weighted_bipred_idc out of range\n" )
	.zero	6
.LC361:
	ASCII(.string	"PPS: pic_init_qp_minus26" )
	.zero	7
.LC363:
	ASCII(.string	"PPS: pic_init_qs_minus26" )
	.zero	7
.LC365:
	ASCII(.string	"PPS: chroma_qp_index_offset" )
	.zero	4
.LC367:
	ASCII(.string	"PPS: deblocking_filter_control_present_flag" )
	.zero	4
.LC369:
	ASCII(.string	"PPS: constrained_intra_pred_flag" )
	.zero	7
.LC371:
	ASCII(.string	"PPS: redundant_pic_cnt_present_flag" )
	.zero	4
.LC373:
	ASCII(.string	"redundant pic not support when find redundant slice later, exit\n" )
	.zero	7
.LC375:
	ASCII(.string	"PPS: transform_8x8_mode_flag" )
	.zero	3
.LC377:
	ASCII(.string	"PPS: pic_scaling_matrix_present_flag" )
	.zero	3
.LC379:
	ASCII(.string	"PPS: second_chroma_qp_index_offset" )
	.zero	5
.LC381:
	ASCII(.string	"SPS: seq_scaling_list_present_flag" )
	.zero	5
.LC384:
	ASCII(.string	"PPS: pic_scaling_list_present_flag" )
	.zero	5
.LC386:
	ASCII(.string	"second_chroma_qp_index_offset out of range.\n" )
	.zero	3
.LC390:
	ASCII(.string	"PPS: pic_parameter_set_id" )
	.zero	6
.LC392:
	ASCII(.string	"pic_parameter_set_id(%d) out of range.\n" )
.LC395:
	ASCII(.string	"PPS: seq_parameter_set_id" )
	.zero	6
.LC397:
	ASCII(.string	"seq_parameter_set_id out of range.\n" )
	.zero	4
.LC400:
	ASCII(.string	"PPS decode error line: %d.\n" )
	.zero	4
.LC403:
	ASCII(.string	"VUI: aspect_ratio_info_present_flag" )
	.zero	4
.LC405:
	ASCII(.string	"VUI: aspect_ratio_idc" )
	.zero	2
.LC407:
	ASCII(.string	"VUI: sar_width" )
	.zero	1
.LC409:
	ASCII(.string	"VUI: sar_height" )
.LC411:
	ASCII(.string	"VUI: overscan_info_present_flag" )
.LC413:
	ASCII(.string	"VUI: overscan_appropriate_flag" )
	.zero	1
.LC415:
	ASCII(.string	"VUI: video_signal_type_present_flag" )
	.zero	4
.LC417:
	ASCII(.string	"VUI: video_format" )
	.zero	6
.LC419:
	ASCII(.string	"VUI: video_full_range_flag" )
	.zero	5
.LC421:
	ASCII(.string	"VUI: color_description_present_flag" )
	.zero	4
.LC423:
	ASCII(.string	"VUI: colour_primaries" )
	.zero	2
.LC425:
	ASCII(.string	"VUI: transfer_characteristics" )
	.zero	2
.LC427:
	ASCII(.string	"VUI: matrix_coefficients" )
	.zero	7
.LC429:
	ASCII(.string	"VUI: chroma_loc_info_present_flag" )
	.zero	6
.LC431:
	ASCII(.string	"VUI: chroma_sample_loc_type_top_field" )
	.zero	2
.LC433:
	ASCII(.string	"VUI: chroma_sample_loc_type_bottom_field" )
	.zero	7
.LC435:
	ASCII(.string	"VUI: timing_info_present_flag" )
	.zero	2
.LC437:
	ASCII(.string	"VUI: num_units_in_tick" )
	.zero	1
.LC439:
	ASCII(.string	"VUI: time_scale" )
.LC441:
	ASCII(.string	"VUI: fixed_frame_rate_flag" )
	.zero	5
.LC443:
	ASCII(.string	"VUI: nal_hrd_parameters_present_flag" )
	.zero	3
.LC445:
	ASCII(.string	"VUI: cpb_cnt_minus1" )
	.zero	4
.LC447:
	ASCII(.string	"VUI: bit_rate_scale" )
	.zero	4
.LC449:
	ASCII(.string	"VUI: cpb_size_scale" )
	.zero	4
.LC451:
	ASCII(.string	"hrd->cpb_cnt_minus1 out of range\n" )
	.zero	6
.LC453:
	ASCII(.string	"VUI: bit_rate_value_minus1" )
	.zero	5
.LC455:
	ASCII(.string	"VUI: cpb_size_value_minus1" )
	.zero	5
.LC457:
	ASCII(.string	"VUI: cbr_flag" )
	.zero	2
.LC459:
	ASCII(.string	"VUI: initial_cpb_removal_delay_length_minus1" )
	.zero	3
.LC461:
	ASCII(.string	"VUI: cpb_removal_delay_length_minus1" )
	.zero	3
.LC463:
	ASCII(.string	"VUI: dpb_output_delay_length_minus1" )
	.zero	4
.LC465:
	ASCII(.string	"VUI: time_offset_length" )
.LC467:
	ASCII(.string	"VUI: vcl_hrd_parameters_present_flag" )
	.zero	3
.LC469:
	ASCII(.string	"VUI: low_delay_hrd_flag" )
.LC471:
	ASCII(.string	"VUI: pic_struct_present_flag" )
	.zero	3
.LC473:
	ASCII(.string	"VUI: bitstream_restriction_flag" )
.LC475:
	ASCII(.string	"VUI: motion_vectors_over_pic_boundaries_flag" )
	.zero	3
.LC477:
	ASCII(.string	"VUI: max_bytes_per_pic_denom" )
	.zero	3
.LC479:
	ASCII(.string	"VUI: max_bits_per_mb_denom" )
	.zero	5
.LC481:
	ASCII(.string	"VUI: log2_max_mv_length_horizontal" )
	.zero	5
.LC483:
	ASCII(.string	"VUI: log2_max_mv_length_vertical" )
	.zero	7
.LC485:
	ASCII(.string	"VUI: num_reorder_frames" )
.LC487:
	ASCII(.string	"VUI: max_dec_frame_buffering" )
	.zero	3
.LC492:
	ASCII(.string	"dar=%d, final_dar=%d\n" )
	.zero	2
.LC498:
	ASCII(.string	"SPS: chroma_format_idc" )
	.zero	1
.LC500:
	ASCII(.string	"pSPS->chroma_format_idc out of range.\n" )
	.zero	1
.LC502:
	ASCII(.string	"SPS: bit_depth_luma_minus8" )
	.zero	5
.LC504:
	ASCII(.string	"bit_depth_luma_minus8 not equal 0.\n" )
	.zero	4
.LC506:
	ASCII(.string	"SPS: bit_depth_chroma_minus8" )
	.zero	3
.LC508:
	ASCII(.string	"bit_depth_chroma_minus8 not equal 0.\n" )
	.zero	2
.LC510:
	ASCII(.string	"SPS: qpprime_y_zero_trans_bypass_flag" )
	.zero	2
.LC512:
	ASCII(.string	"qpprime_y_zero_trans_bypass_flag not equal 0.\n" )
	.zero	1
.LC514:
	ASCII(.string	"SPS: seq_scaling_matrix_present_flag" )
	.zero	3
.LC518:
	ASCII(.string	"SPS: log2_max_frame_num_minus4" )
	.zero	1
.LC520:
	ASCII(.string	"pSPS->log2_max_frame_num_minus4 out of range.\n" )
	.zero	1
.LC522:
	ASCII(.string	"SPS: pic_order_cnt_type" )
.LC524:
	ASCII(.string	"pSPS->pic_order_cnt_type out of range.\n" )
.LC526:
	ASCII(.string	"SPS: log2_max_pic_order_cnt_lsb_minus4" )
	.zero	1
.LC528:
	ASCII(.string	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of range.\n" )
	.zero	1
.LC530:
	ASCII(.string	"SPS: delta_pic_order_always_zero_flag" )
	.zero	2
.LC532:
	ASCII(.string	"SPS: offset_for_non_ref_pic" )
	.zero	4
.LC534:
	ASCII(.string	"SPS: offset_for_top_to_bottom_field" )
	.zero	4
.LC536:
	ASCII(.string	"SPS: num_ref_frames_in_pic_order_cnt_cycle" )
	.zero	5
.LC538:
	ASCII(.string	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of range.\n" )
	.zero	5
.LC540:
	ASCII(.string	"SPS: offset_for_ref_frame[i]" )
	.zero	3
.LC542:
	ASCII(.string	"SPS: gaps_in_frame_num_value_allowed_flag" )
	.zero	6
.LC544:
	ASCII(.string	"SPS: pic_width_in_mbs_minus1" )
	.zero	3
.LC546:
	ASCII(.string	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\n" )
	.zero	6
.LC548:
	ASCII(.string	"SPS: pic_height_in_map_units_minus1" )
	.zero	4
.LC550:
	ASCII(.string	"SPS: frame_mbs_only_flag" )
	.zero	7
.LC552:
	ASCII(.string	"pSPS->pic_height_in_map_units_minus1 out of range.\n" )
	.zero	4
.LC554:
	ASCII(.string	"pic size too large.\n" )
	.zero	3
.LC557:
	ASCII(.string	"level_idc %d not support.\n" )
	.zero	5
.LC559:
	ASCII(.string	"dpb size according level : %d\n" )
	.zero	1
.LC561:
	ASCII(.string	"pSPS->num_ref_frames(%d) > DPB size(%d), try to select the reasonable one.\n" )
	.zero	4
.LC563:
	ASCII(.string	"SPS: direct_8x8_inference_flag" )
	.zero	1
.LC565:
	ASCII(.string	"SPS: frame_cropping_flag" )
	.zero	7
.LC567:
	ASCII(.string	"SPS: frame_cropping_rect_left_offset" )
	.zero	3
.LC569:
	ASCII(.string	"SPS: frame_cropping_rect_right_offset" )
	.zero	2
.LC571:
	ASCII(.string	"SPS: frame_cropping_rect_top_offset" )
	.zero	4
.LC573:
	ASCII(.string	"SPS: frame_cropping_rect_bottom_offset" )
	.zero	1
.LC575:
	ASCII(.string	"SPS: vui_parameters_present_flag" )
	.zero	7
.LC577:
	ASCII(.string	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\n" )
	.zero	2
.LC580:
	ASCII(.string	"SPS: num_ref_frames" )
	.zero	4
.LC582:
	ASCII(.string	"SPS: mb_adaptive_frame_field_flag" )
	.zero	6
.LC584:
	ASCII(.string	"SPS: profile_idc" )
	.zero	7
.LC586:
	ASCII(.string	"SPS: constrained_set0_flag" )
	.zero	5
.LC588:
	ASCII(.string	"SPS: constrained_set1_flag" )
	.zero	5
.LC590:
	ASCII(.string	"SPS: constrained_set2_flag" )
	.zero	5
.LC592:
	ASCII(.string	"SPS: constrained_set3_flag" )
	.zero	5
.LC594:
	ASCII(.string	"SPS: constrained_set4_flag" )
	.zero	5
.LC596:
	ASCII(.string	"SPS: constrained_set5_flag" )
	.zero	5
.LC598:
	ASCII(.string	"SPS: reserved_zero_2bits" )
	.zero	7
.LC600:
	ASCII(.string	"SPS: level_idc" )
	.zero	1
.LC602:
	ASCII(.string	"SPS: seq_parameter_set_id" )
	.zero	6
.LC606:
	ASCII(.string	"MVC_BASELINE stream, try to decode, exit when FMO occurred.\n" )
	.zero	3
.LC608:
	ASCII(.string	"MVC_EXTENDED stream, try to decode, exit when datapartition occurred.\n" )
	.zero	1
.LC610:
	ASCII(.string	"others High profile stream, try to decode, exit when high profile not support occurred.\n" )
	.zero	7
.LC612:
	ASCII(.string	"profile_idc = %5d error, try to decode as main profile.\n" )
	.zero	7
.LC614:
	ASCII(.string	"level_idc = %5d error, try to decode as level_idc %d.\n" )
	.zero	1
.LC617:
	ASCII(.string	"Line %d: SPS[%d] decode error.\n" )
.LC623:
	ASCII(.string	"SUBSPS: num_views_minus1" )
	.zero	7
.LC625:
	ASCII(.string	"pSubsps->num_views_minus1(%d) out of range.\n" )
	.zero	3
.LC627:
	ASCII(.string	"SUBSPS: view_id[]" )
	.zero	6
.LC629:
	ASCII(.string	"SUBSPS: num_anchor_refs_l0[]" )
	.zero	3
.LC631:
	ASCII(.string	"SUBSPS: num_anchor_refs_l1[]" )
	.zero	3
.LC633:
	ASCII(.string	"pSubsps->num_anchor_refs_l0(%d) out of range.\n" )
	.zero	1
.LC635:
	ASCII(.string	"SUBSPS: anchor_ref_l0[][]" )
	.zero	6
.LC637:
	ASCII(.string	"pSubsps->num_anchor_refs_l1(%d) out of range.\n" )
	.zero	1
.LC639:
	ASCII(.string	"SUBSPS: anchor_ref_l1[][]" )
	.zero	6
.LC641:
	ASCII(.string	"SUBSPS: num_level_values_signalled_minus1" )
	.zero	6
.LC643:
	ASCII(.string	"SUBSPS: num_non_anchor_refs_l0[]" )
	.zero	7
.LC645:
	ASCII(.string	"SUBSPS: num_non_anchor_refs_l1[]" )
	.zero	7
.LC647:
	ASCII(.string	"pSubsps->num_non_anchor_refs_l0(%d) out of range.\n" )
	.zero	5
.LC649:
	ASCII(.string	"SUBSPS: non_anchor_ref_l0[][]" )
	.zero	2
.LC651:
	ASCII(.string	"pSubsps->num_non_anchor_refs_l1(%d) out of range.\n" )
	.zero	5
.LC653:
	ASCII(.string	"SUBSPS: non_anchor_ref_l1[][]" )
	.zero	2
.LC655:
	ASCII(.string	"num_level(%d) out of range.\n" )
	.zero	3
.LC657:
	ASCII(.string	"SUBSPS: level_idc[]" )
	.zero	4
.LC659:
	ASCII(.string	"SUBSPS: num_applicable_ops_minus1" )
	.zero	6
.LC661:
	ASCII(.string	"num_ops(%d) out of range.\n" )
	.zero	5
.LC663:
	ASCII(.string	"SUBSPS: applicable_op_temporal_id[][]" )
	.zero	2
.LC665:
	ASCII(.string	"SUBSPS: applicable_op_num_target_views_minus1[][]" )
	.zero	6
.LC667:
	ASCII(.string	"SUBSPS: applicable_op_num_views_minus1" )
	.zero	1
.LC669:
	ASCII(.string	"applicable_op_num_target_views(%d) out of range.\n" )
	.zero	6
.LC671:
	ASCII(.string	"SUBSPS: applicable_op_target_view_id[][][]" )
	.zero	5
.LC673:
	ASCII(.string	"pSubsps->applicable_op_num_views_minus1(%d) out of range.\n" )
	.zero	5
.LC675:
	ASCII(.string	"MVC VUI: vui_mvc_num_ops_minus1" )
.LC677:
	ASCII(.string	"vui_mvc_num_ops_minus1 %d out of range\n" )
.LC679:
	ASCII(.string	"MVC VUI: vui_mvc_temporal_id[]" )
	.zero	1
.LC681:
	ASCII(.string	"SUBSPS VUI: vui_mvc_num_target_output_views_minus1[]" )
	.zero	3
.LC683:
	ASCII(.string	"MVC VUI: vui_mvc_timing_info_present_flag" )
	.zero	6
.LC685:
	ASCII(.string	"MVC VUI: vui_mvc_view_id[][]" )
	.zero	3
.LC687:
	ASCII(.string	"MVC VUI: vui_mvc_num_units_in_tick" )
	.zero	5
.LC689:
	ASCII(.string	"MVC VUI: vui_mvc_time_scale[]" )
	.zero	2
.LC691:
	ASCII(.string	"MVC VUI: vui_mvc_fixed_frame_rate_flag" )
	.zero	1
.LC693:
	ASCII(.string	"MVC VUI: vui_mvc_nal_hrd_parameters_present_flag[]" )
	.zero	5
.LC695:
	ASCII(.string	"MVC VUI: cpb_cnt_minus1" )
.LC697:
	ASCII(.string	"MVC VUI: bit_rate_scale" )
.LC699:
	ASCII(.string	"MVC VUI: cpb_size_scale" )
.LC702:
	ASCII(.string	"MVC VUI: bit_rate_value_minus1" )
	.zero	1
.LC704:
	ASCII(.string	"MVC VUI: cpb_size_value_minus1" )
	.zero	1
.LC706:
	ASCII(.string	"MVC VUI: cbr_flag" )
	.zero	6
.LC708:
	ASCII(.string	"MVC VUI: initial_cpb_removal_delay_length_minus1" )
	.zero	7
.LC710:
	ASCII(.string	"MVC VUI: cpb_removal_delay_length_minus1" )
	.zero	7
.LC712:
	ASCII(.string	"MVC VUI: dpb_output_delay_length_minus1" )
.LC714:
	ASCII(.string	"MVC VUI: time_offset_length" )
	.zero	4
.LC716:
	ASCII(.string	"MVC VUI: vui_mvc_vcl_hrd_parameters_present_flag[]" )
	.zero	5
.LC718:
	ASCII(.string	"MVC VUI: vui_mvc_low_delay_hrd_flag[]" )
	.zero	2
.LC720:
	ASCII(.string	"MVC VUI: vui_mvc_pic_struct_present_flag[]" )
	.zero	5
.LC722:
	ASCII(.string	"SUBSPS: profile_idc" )
	.zero	4
.LC724:
	ASCII(.string	"SUBSPS: constrained_set0_flag" )
	.zero	2
.LC726:
	ASCII(.string	"SUBSPS: constrained_set1_flag" )
	.zero	2
.LC728:
	ASCII(.string	"SUBSPS: constrained_set2_flag" )
	.zero	2
.LC730:
	ASCII(.string	"SUBSPS: constrained_set3_flag" )
	.zero	2
.LC732:
	ASCII(.string	"SUBSPS: constrained_set4_flag" )
	.zero	2
.LC734:
	ASCII(.string	"SUBSPS: constrained_set5_flag" )
	.zero	2
.LC736:
	ASCII(.string	"SUBSPS: reserved_zero_2bits" )
	.zero	4
.LC738:
	ASCII(.string	"SUBSPS: level_idc" )
	.zero	6
.LC740:
	ASCII(.string	"SUBSPS: seq_parameter_set_id" )
	.zero	3
.LC747:
	ASCII(.string	"profile_idc = %5d error\n" )
	.zero	7
.LC749:
	ASCII(.string	"level_idc = %5d error, try to decode as level_idc 41.\n" )
	.zero	1
.LC751:
	ASCII(.string	"SUBSPS decode error.\n" )
	.zero	2
.LC753:
	ASCII(.string	"SUBSPS: bit_equal_to_one" )
	.zero	7
.LC755:
	ASCII(.string	"SUBSPS Mvc Ext decode error.\n" )
	.zero	2
.LC757:
	ASCII(.string	"SUBSPS: mvc_vui_parameters_present_flag" )
.LC759:
	ASCII(.string	"SUBSPS Mvc Vui Ext decode error.\n" )
	.zero	6
.LC761:
	ASCII(.string	"SEI: frame_packing_arrangement_id" )
	.zero	6
.LC763:
	ASCII(.string	"SEI: frame_packing_arrangement_cancel_flag" )
	.zero	5
.LC765:
	ASCII(.string	"SEI: frame_packing_arrangement_type" )
	.zero	4
.LC767:
	ASCII(.string	"SEI: quincunx_sampling_flag" )
	.zero	4
.LC769:
	ASCII(.string	"SEI: content_interpretation_type" )
	.zero	7
.LC771:
	ASCII(.string	"SEI: spatial_flipping_flag" )
	.zero	5
.LC773:
	ASCII(.string	"SEI: frame0_flipped_flag" )
	.zero	7
.LC775:
	ASCII(.string	"SEI: field_views_flag" )
	.zero	2
.LC777:
	ASCII(.string	"SEI: current_frame_is_frame0_flag" )
	.zero	6
.LC779:
	ASCII(.string	"SEI: frame0_self_contained_flag" )
.LC781:
	ASCII(.string	"SEI: frame1_self_contained_flag" )
.LC783:
	ASCII(.string	"SEI: frame0_grid_position_x" )
	.zero	4
.LC785:
	ASCII(.string	"SEI: frame0_grid_position_y" )
	.zero	4
.LC787:
	ASCII(.string	"SEI: frame1_grid_position_x" )
	.zero	4
.LC789:
	ASCII(.string	"SEI: frame1_grid_position_y" )
	.zero	4
.LC791:
	ASCII(.string	"SEI: frame_packing_arrangement_reserved_byte" )
	.zero	3
.LC793:
	ASCII(.string	"SEI: frame_packing_arrangement_repetition_period" )
	.zero	7
.LC795:
	ASCII(.string	"SEI: frame_packing_arrangement_extension_flag" )
	.zero	2
.LC797:
	ASCII(.string	"DecPicTimingSEI but SPS is invalid.\n" )
	.zero	3
.LC799:
	ASCII(.string	"SEI: cpb_removal_delay" )
	.zero	1
.LC801:
	ASCII(.string	"SEI: dpb_output_delay" )
	.zero	2
.LC803:
	ASCII(.string	"pic_struct" )
	.zero	5
.LC805:
	ASCII(.string	"SEI nal dec payload type err\n" )
	.zero	2
.LC807:
	ASCII(.string	"SEI nal dec payloadSize err\n" )
	.zero	3
.LC810:
	ASCII(.string	"MVC_SEI_BUFFERING_PERIOD,offset = %d,payload_size = %d \n" )
	.zero	7
.LC813:
	ASCII(.string	"MVC_PassBytes err [%s][%d]\n" )
	.zero	4
.LC815:
	ASCII(.string	"MVC_SEI_PIC_TIMING,offset = %d,payload_size = %d \n" )
	.zero	5
.LC817:
	ASCII(.string	"MVC_SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d \n" )
	.zero	2
.LC819:
	ASCII(.string	"MVC_SEI_FILLER_PAYLOAD,offset = %d,payload_size = %d \n" )
	.zero	1
.LC821:
	ASCII(.string	"MVC_SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d, payload_size = %d \n" )
	.zero	7
.LC823:
	ASCII(.string	"MVC_SEI_USER_DATA_UNREGISTERED, offset = %d, payload_size = %d \n" )
	.zero	7
.LC825:
	ASCII(.string	"SEI: itu_t_t35_country_code" )
	.zero	4
.LC827:
	ASCII(.string	"SEI: itu_t_t35_country_code_extension_byte" )
	.zero	5
.LC829:
	ASCII(.string	"SEI: itu_t_t35_provider_code" )
	.zero	3
.LC832:
	ASCII(.string	"cann't dec usrdata\n" )
	.zero	4
.LC834:
	ASCII(.string	"MVC_SEI_RECOVERY_POINT,offset = %d,payload_size = %d \n" )
	.zero	1
.LC836:
	ASCII(.string	"MVC_SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d,payload_size = %d \n" )
	.zero	1
.LC838:
	ASCII(.string	"MVC_SEI_SPARE_PIC,offset = %d,payload_size = %d \n" )
	.zero	6
.LC840:
	ASCII(.string	"MVC_SEI_SCENE_INFO,offset = %d,payload_size = %d \n" )
	.zero	5
.LC842:
	ASCII(.string	"MVC_SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d \n" )
	.zero	3
.LC844:
	ASCII(.string	"MVC_SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	2
.LC846:
	ASCII(.string	"MVC_SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
.LC848:
	ASCII(.string	"MVC_SEI_FULL_FRAME_FREEZE,offset = %d,payload_size = %d \n" )
	.zero	6
.LC850:
	ASCII(.string	"MVC_SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,payload_size = %d \n" )
	.zero	6
.LC852:
	ASCII(.string	"MVC_SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_size = %d \n" )
	.zero	4
.LC854:
	ASCII(.string	"MVC_SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset = %d,payload_size = %d \n" )
	.zero	3
.LC856:
	ASCII(.string	"MVC_SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset = %d,payload_size = %d \n" )
	.zero	5
.LC858:
	ASCII(.string	"MVC_SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset = %d,payload_size = %d \n" )
	.zero	5
.LC860:
	ASCII(.string	"MVC_SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	5
.LC862:
	ASCII(.string	"MVC_SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset = %d,payload_size = %d \n" )
	.zero	3
.LC864:
	ASCII(.string	"MVC_SEI_STEREO_VIDEO_INFO,offset = %d,payload_size = %d \n" )
	.zero	6
.LC866:
	ASCII(.string	"too much usrdat, cann't dec SEI\n" )
	.zero	7
.LC870:
	ASCII(.string	"\n mvc the stream is error,len:%d\n" )
	.zero	6
.LC875:
	ASCII(.string	"\nSlice nal or IDR nal = %d\n" )
	.zero	4
.LC877:
	ASCII(.string	"sliceheader dec err\n" )
	.zero	3
.LC880:
	ASCII(.string	"MVC_InquireSliceProperty mvc flag %d is wrong\n" )
	.zero	1
.LC882:
	ASCII(.string	"MvcDec destroy\n" )
.LC884:
	ASCII(.string	"MVC recycle image\n" )
	.zero	5
.LC886:
	ASCII(.string	"pH264Ctx is %#x, pFrameStore is %#x\n" )
	.zero	3
.LC888:
	ASCII(.string	"line: %d, pstLogicFsImage is NULL\n" )
	.zero	5
.LC890:
	ASCII(.string	"InsertVO err:%d, MVC_ClearAll\n" )
	.zero	1
.LC892:
	ASCII(.string	"mvc.c line %d: MVC_FRAME para err(ret=%d), recycle image self\n" )
	.zero	1
.LC896:
	ASCII(.string	"[%s][%d] MVC_OutputFrmToVO return %d !\n" )
.LC899:
	ASCII(.string	"[%s][%d] MVC_OutputFrmToVO return %d\n" )
	.zero	2
.LC903:
	ASCII(.string	"%s %d MVC_OK != MVC_FlushDPB!!\n" )
.LC905:
	ASCII(.string	"%s %d MVC_OK != MVC_InitDPB!!\n" )
	.zero	1
.LC907:
	ASCII(.string	"----------------- MVC_IMODE -> %d ------------------\n" )
	.zero	2
.LC909:
	ASCII(.string	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\n" )
.LC911:
	ASCII(.string	"***** VDM start, TotalPicNum=%d, pMvcCtx->CurrPic.structure=%d.\n" )
	.zero	7
.LC915:
	ASCII(.string	"MVC_DecVDM fail [%s][%d]\n" )
	.zero	6
.LC917:
	ASCII(.string	"\n receive streambuff=%p; phy_addr=0x%x; bitstream_length=%d\n" )
	.zero	3
.LC919:
	ASCII(.string	"nal_releaMVC_SE_ERR\n" )
	.zero	3
.LC921:
	ASCII(.string	"cann't find slot for current nal\n" )
	.zero	6
.LC924:
	ASCII(.string	"receive a zero packet\n" )
	.zero	1
.LC926:
	ASCII(.string	"clear all dec para\n" )
	.zero	4
.LC932:
	ASCII(.string	"line %d, get APC error, ret %d\n" )
.LC934:
	ASCII(.string	"InserFrmInDPB: cur pic struct = %d!\n" )
	.zero	3
.LC936:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC938:
	ASCII(.string	"FS_ALLOC_ERR, MVC_ClearAll\n" )
	.zero	4
.LC941:
	ASCII(.string	"Can not new logic fs! MVC_ClearAll\n" )
	.zero	4
.LC945:
	ASCII(.string	"%s %d NULL== pMvcCtx->SPS || NULL == pMvcCtx->PPS || NULL == pMvcCtx->DecSlicePara!!\n" )
	.zero	2
.LC947:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC949:
	ASCII(.string	"CurrPic.state is 'MVC_EMPTY'\n" )
	.zero	2
.LC951:
	ASCII(.string	"MVC_StorePicInDpb return(%d) from L%d\n" )
	.zero	1
.LC953:
	ASCII(.string	"Is IDR, but init DPB failed!\n" )
	.zero	2
.LC955:
	ASCII(.string	"Is IDR, but FlushDPB failed!\n" )
	.zero	2
.LC957:
	ASCII(.string	"MVC_DirectOutput mode\n" )
	.zero	1
.LC959:
	ASCII(.string	"line %d, REPORT_IFRAME_ERR\n" )
	.zero	4
.LC962:
	ASCII(.string	"line %d, return %d\n" )
	.zero	4
.LC964:
	ASCII(.string	"err(%d) > ref_thr(%d)\n" )
	.zero	1
.LC966:
	ASCII(.string	"MVC_Marking return %d\n" )
	.zero	1
.LC968:
	ASCII(.string	"line %d: pMvcCtx->DPB.size = %d, ref %d, ltref %d\n" )
	.zero	5
.LC970:
	ASCII(.string	"line %d, MVC_GetMinPOC failed\n" )
	.zero	1
.LC973:
	ASCII(.string	"%s: pos(%d) = pre_pos, force return.\n" )
	.zero	2
.LC975:
	ASCII(.string	"GAP found while DPB is MVC_EMPTY!\n" )
	.zero	5
.LC977:
	ASCII(.string	"MVC_FRAME num gap try to fill it \n" )
	.zero	5
.LC979:
	ASCII(.string	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\n" )
	.zero	7
.LC981:
	ASCII(.string	"cann't allocate MVC_FRAME store when gap find\n" )
	.zero	1
.LC983:
	ASCII(.string	"allocate MVC_FRAME store when gap find\n" )
.LC985:
	ASCII(.string	"line %d: store gap pic err, ret=%d\n" )
	.zero	4
.LC989:
	ASCII(.string	"line %d: flush dpb return %d\n" )
	.zero	2
.LC991:
	ASCII(.string	"line %d: init dpb return %d\n" )
	.zero	3
.LC993:
	ASCII(.string	"resolution error, the CAP_LEVEL_USER_DEFINE_WITH_OPTION channel with s32ReRangeEn == 0 can't support such bitstream.\n" )
	.zero	2
.LC995:
	ASCII(.string	"s32MaxRefFrameNum < pMvcCtx->DPB.size, the CAP_LEVEL_USER_DEFINE_WITH_OPTION channel can't support such bitstream.\n" )
	.zero	4
.LC997:
	ASCII(.string	"mem arrange err, MVC_ClearAll\n" )
	.zero	1
.LC999:
	ASCII(.string	"get back frm\n" )
	.zero	2
.LC1001:
	ASCII(.string	"line %d: MVC_FRAME gap(=%d) > dpb size(=%d)\n" )
	.zero	3
.LC1003:
	ASCII(.string	"MVC_FRAME num gap don't allowed but gap find\n" )
	.zero	2
.LC1005:
	ASCII(.string	"line %d: frame num(%d/%d) find gap in NON-I slice but here gap is not allowed\n" )
	.zero	1
.LC1007:
	ASCII(.string	"line %d: dec gap failed\n" )
	.zero	7
.LC1009:
	ASCII(.string	"line %d: alloc framestore failed\n" )
	.zero	6
.LC1011:
	ASCII(.string	"dec_pts: %lld\n" )
	.zero	1
.LC1013:
	ASCII(.string	"dec_usertag: %lld\n" )
	.zero	5
.LC1015:
	ASCII(.string	"line %d: CurrPic.frame_store is NULL\n" )
	.zero	2
.LC1020:
	ASCII(.string	"Start Reason: SliceParaNum, MaxBytesReceived = %d, %d(thr=%d)\n" )
	.zero	1
.LC1022:
	ASCII(.string	"Too many slice or bitstream, err!\n" )
	.zero	5
.LC1024:
	ASCII(.string	"Start Reason: new_pic_flag\n" )
	.zero	4
.LC1026:
	ASCII(.string	"init pic err, find next recover point or next valid sps, pps, or exit\n" )
	.zero	1
.LC1028:
	ASCII(.string	"MVC_DecList error, ret=%d\n" )
	.zero	5
.LC1030:
	ASCII(.string	"dec list err.\n" )
	.zero	1
.LC1032:
	ASCII(.string	"pMvcCtx->TotalNal = %d, type:%d\n" )
	.zero	7
.LC1034:
	ASCII(.string	"stop i want\n" )
	.zero	3
.LC1037:
	ASCII(.string	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=%d\n" )
	.zero	1
.LC1039:
	ASCII(.string	"*******TotalPicNum=%d********\n" )
	.zero	1
.LC1042:
	ASCII(.string	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\n" )
	.zero	1
.LC1044:
	ASCII(.string	"PPS decode error.\n" )
	.zero	5
.LC1046:
	ASCII(.string	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\n" )
	.zero	1
.LC1048:
	ASCII(.string	"SPS decode error.\n" )
	.zero	5
.LC1050:
	ASCII(.string	"***** NAL: SEI, nal_unit_type=%d\n" )
	.zero	6
.LC1052:
	ASCII(.string	"SEI decode error.\n" )
	.zero	5
.LC1054:
	ASCII(.string	"***** NAL: AUD, nal_unit_type=%d\n" )
	.zero	6
.LC1056:
	ASCII(.string	"***** NAL: EOSEQ, nal_unit_type=%d\n" )
	.zero	4
.LC1058:
	ASCII(.string	"***** NAL: FILL, nal_unit_type=%d\n" )
	.zero	5
.LC1060:
	ASCII(.string	"***** NAL: EOSTREAM, nal_unit_type=%d\n" )
	.zero	1
.LC1062:
	ASCII(.string	"***** NAL: SPSEXT, nal_unit_type=%d\n" )
	.zero	3
.LC1064:
	ASCII(.string	"***** NAL: PREFIX, nal_unit_type=%d\n" )
	.zero	3
.LC1066:
	ASCII(.string	"***** NAL: SUBSPS, nal_unit_type=%d\n" )
	.zero	3
.LC1069:
	ASCII(.string	"***** NAL: AUX, nal_unit_type=%d\n" )
	.zero	6
.LC1071:
	ASCII(.string	"***** NAL: EOPIC, nal_unit_type=%d\n" )
	.zero	4
.LC1074:
	ASCII(.string	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:%x\n" )
	.zero	1
.LC1076:
	ASCII(.string	"nal_header != 0x00000100 not support.\n" )
	.zero	1
.LC1083:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC1086:
	ASCII(.string	"MVC_FindTrailZeros ERR\n" )
.LC1088:
	ASCII(.string	"store pic err, ret = %d\n" )
	.zero	7
.LC1090:
	ASCII(.string	"MVC_IMODE nal store pic err, ret = %d\n" )
	.zero	1
.LC1092:
	ASCII(.string	"MVC_IMODE nal flush dpb err, ret = %d\n" )
	.zero	1
.LC1094:
	ASCII(.string	"cann't find FrameStore\n" )
.LC1096:
	ASCII(.string	"========== MVC FrameStore state(is_used, is_in_dpb, MVC_IsOutDPB) ========\n" )
	.zero	4
.LC1098:
	ASCII(.string	"ReadImgNum = %d, NewImgNum = %d\n" )
	.zero	7
.LC1100:
	ASCII(.string	"%02d: %d %d %d\n" )
.LC1102:
	ASCII(.string	"FrameStore leak, MVC_ClearAll\n" )
	.bss
	.align	3
.LANCHOR2 = . + 0
.LANCHOR3 = . + 4352
	.type	pps_tmp.13132, %object
	.size	pps_tmp.13132, 2240
pps_tmp.13132:
	.zero	2240
	.type	sps_tmp.13268, %object
	.size	sps_tmp.13268, 3992
sps_tmp.13268:
	.zero	3992
	.type	MvcTmpBuf, %object
	.size	MvcTmpBuf, 68
MvcTmpBuf:
	.zero	68
	.type	cnt.12085, %object
	.size	cnt.12085, 4
cnt.12085:
	.zero	4
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
