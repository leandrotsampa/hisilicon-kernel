#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"h264.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	IsSTRefFlg
	.type	IsSTRefFlg, %function
IsSTRefFlg:
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
	.size	IsSTRefFlg, .-IsSTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsLTRefFlg
	.type	IsLTRefFlg, %function
IsLTRefFlg:
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
	.size	IsLTRefFlg, .-IsLTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_pic_by_pic_num_desc
	.type	compare_pic_by_pic_num_desc, %function
compare_pic_by_pic_num_desc:
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
	ldr	w1, [x0, 8]
	ldr	w2, [x2, 8]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_pic_by_pic_num_desc, .-compare_pic_by_pic_num_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_pic_by_lt_pic_num_asc
	.type	compare_pic_by_lt_pic_num_asc, %function
compare_pic_by_lt_pic_num_asc:
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
	ldr	w1, [x0, 4]
	ldr	w2, [x2, 4]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_pic_by_lt_pic_num_asc, .-compare_pic_by_lt_pic_num_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_fs_by_frame_num_desc
	.type	compare_fs_by_frame_num_desc, %function
compare_fs_by_frame_num_desc:
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
	ldr	w1, [x0, 680]
	ldr	w2, [x2, 680]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_fs_by_frame_num_desc, .-compare_fs_by_frame_num_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_fs_by_lt_pic_idx_asc
	.type	compare_fs_by_lt_pic_idx_asc, %function
compare_fs_by_lt_pic_idx_asc:
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
	ldr	w1, [x0, 684]
	ldr	w2, [x2, 684]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, hi
	csel	w0, w0, w3, cs
	ret
	.size	compare_fs_by_lt_pic_idx_asc, .-compare_fs_by_lt_pic_idx_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_pic_by_poc_asc
	.type	compare_pic_by_poc_asc, %function
compare_pic_by_poc_asc:
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
	ldr	w1, [x0, 12]
	ldr	w2, [x2, 12]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_pic_by_poc_asc, .-compare_pic_by_poc_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_pic_by_poc_desc
	.type	compare_pic_by_poc_desc, %function
compare_pic_by_poc_desc:
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
	ldr	w1, [x0, 12]
	ldr	w2, [x2, 12]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_pic_by_poc_desc, .-compare_pic_by_poc_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_fs_by_poc_asc
	.type	compare_fs_by_poc_asc, %function
compare_fs_by_poc_asc:
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
	ldr	w1, [x0, 688]
	ldr	w2, [x2, 688]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	cset	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_fs_by_poc_asc, .-compare_fs_by_poc_asc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	compare_fs_by_poc_desc
	.type	compare_fs_by_poc_desc, %function
compare_fs_by_poc_desc:
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
	ldr	w1, [x0, 688]
	ldr	w2, [x2, 688]
	ldp	x29, x30, [sp], 32
	cmp	w2, w1
	csetm	w0, gt
	csel	w0, w0, w3, ge
	ret
	.size	compare_fs_by_poc_desc, .-compare_fs_by_poc_desc
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	SetFrmRepeatCount.part.1, %function
SetFrmRepeatCount.part.1:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	add	x3, x19, 65536
	add	x19, x19, 24576
	ldr	w2, [x3, 2840]
	ldr	w1, [x19, 3712]
	ldr	w0, [x3, 2836]
	add	w2, w1, w2, lsr 1
	lsr	w0, w0, 1
	add	w4, w2, 1
	cmp	w0, w4
	bcc	.L28
	sub	w0, w0, #1
	sub	w0, w0, w2
	cmp	w0, 1
	bls	.L29
	mov	w0, 2
	str	w0, [x20, 24]
	ldr	w0, [x3, 2840]
	add	w0, w0, 4
	str	w0, [x3, 2840]
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
	ldr	w0, [x3, 2840]
	add	w0, w0, 2
	str	w0, [x3, 2840]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SetFrmRepeatCount.part.1, .-SetFrmRepeatCount.part.1
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	DumpList.part.5, %function
DumpList.part.5:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x24, x20, 20480
	mov	w21, 0
	bl	_mcount
	ldr	x23, .LC3
	add	x25, x24, 1628
.L33:
	ldr	w0, [x25]
	cbz	w0, .L37
	uxtw	x0, w21
	mov	w19, 0
	lsl	x22, x0, 5
	add	x22, x22, x0
	.p2align 2
.L34:
	add	x4, x22, x19, uxtw
	mov	w3, w19
	add	x4, x4, 3588
	mov	w2, w21
	mov	x1, x23
	mov	w0, 13
	add	w19, w19, 1
	ldr	x4, [x20, x4, lsl 3]
	ldr	x4, [x4, 40]
	ldr	w5, [x4, 688]
	ldr	w4, [x4, 676]
	bl	dprint_vfmw
	ldr	w0, [x25]
	cmp	w19, w0
	bcc	.L34
.L37:
	add	w21, w21, 1
	add	x25, x25, 4
	cmp	w21, 2
	bne	.L33
	ldr	w0, [x24, 1628]
	cbnz	w0, .L65
.L38:
	ldr	w0, [x24, 1632]
	cbnz	w0, .L66
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L66:
	ldr	x1, .LC15
	mov	w0, 13
	mov	w19, 0
	bl	dprint_vfmw
	ldr	w0, [x24, 1632]
	cbz	w0, .L53
	ldr	x23, .LC9
	ldr	x21, .LC13
	ldr	x22, .LC11
	b	.L58
	.p2align 3
.L67:
	cmp	w0, 2
	cbz	w0, .L50
	mov	x1, x21
	mov	w0, 13
	bne	.L48
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 688]
	bl	dprint_vfmw
.L48:
	ldr	w0, [x24, 1632]
	add	w19, w19, 1
	cmp	w19, w0
	bcs	.L53
.L58:
	add	x0, x20, x19, uxtw 3
	ldr	x2, [x0, 28968]
	ldrb	w0, [x2]
	cmp	w0, 1
	bne	.L67
	ldr	x2, [x2, 40]
	mov	x1, x22
	mov	w0, 13
	add	w19, w19, 1
	ldr	w2, [x2, 688]
	bl	dprint_vfmw
	ldr	w0, [x24, 1632]
	cmp	w19, w0
	bcc	.L58
.L53:
	ldr	x1, .LC7
	mov	w0, 13
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L50:
	ldr	x2, [x2, 40]
	mov	x1, x23
	mov	w0, 13
	ldr	w2, [x2, 688]
	bl	dprint_vfmw
	b	.L48
	.p2align 3
.L65:
	ldr	x1, .LC5
	mov	w0, 13
	mov	w19, 0
	bl	dprint_vfmw
	ldr	w0, [x24, 1628]
	cbz	w0, .L45
	ldr	x23, .LC9
	ldr	x21, .LC13
	ldr	x22, .LC11
	b	.L59
	.p2align 3
.L68:
	cmp	w0, 2
	cbz	w0, .L42
	mov	x1, x21
	mov	w0, 13
	bne	.L40
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 688]
	bl	dprint_vfmw
.L40:
	ldr	w0, [x24, 1628]
	add	w19, w19, 1
	cmp	w19, w0
	bcs	.L45
.L59:
	add	x0, x20, x19, uxtw 3
	ldr	x2, [x0, 28704]
	ldrb	w0, [x2]
	cmp	w0, 1
	bne	.L68
	ldr	x2, [x2, 40]
	mov	x1, x22
	mov	w0, 13
	add	w19, w19, 1
	ldr	w2, [x2, 688]
	bl	dprint_vfmw
	ldr	w0, [x24, 1628]
	cmp	w19, w0
	bcc	.L59
.L45:
	ldr	x1, .LC7
	mov	w0, 13
	bl	dprint_vfmw
	b	.L38
	.p2align 3
.L42:
	ldr	x2, [x2, 40]
	mov	x1, x23
	mov	w0, 13
	ldr	w2, [x2, 688]
	bl	dprint_vfmw
	b	.L40
	.size	DumpList.part.5, .-DumpList.part.5
	.align	3
.LC3:
	.xword	.LC2
	.align	3
.LC5:
	.xword	.LC4
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
.LC15:
	.xword	.LC14
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	CombinePacket.part.11, %function
CombinePacket.part.11:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC17
	mov	w0, 7
	bl	dprint_vfmw
	ldr	x2, [x19, 632]
	mov	w0, 7
	ldr	x1, .LC19
	ldp	w5, w3, [x2, 48]
	ldr	w4, [x2, 16]
	ldr	w2, [x2, 20]
	bl	dprint_vfmw
	ldr	x1, [x19, 632]
	ldr	x3, .LC20
	ldr	w2, [x1, 16]
	ldr	x0, [x1, 40]
	ldr	x3, [x3, 104]
	ldr	x1, [x1, 8]
	sub	x0, x0, x2
	blr	x3
	ldr	x2, [x19, 632]
	mov	w4, 1
	ldr	x1, .LC22
	mov	w0, 7
	ldr	w3, [x2, 68]
	ldr	w20, [x2, 36]
	str	w3, [x2, 36]
	ldr	x2, [x19, 632]
	str	wzr, [x2, 28]
	ldr	x2, [x19, 632]
	ldr	w5, [x2, 16]
	ldr	x3, [x2, 40]
	sub	x3, x3, x5
	str	x3, [x2, 8]
	ldr	x2, [x19, 632]
	ldr	w5, [x2, 16]
	ldr	w3, [x2, 52]
	sub	w3, w3, w5
	str	w3, [x2, 20]
	ldr	x2, [x19, 632]
	ldr	w5, [x2, 16]
	ldr	w3, [x2, 48]
	add	w3, w5, w3
	str	w3, [x2, 16]
	ldr	x2, [x19, 632]
	str	w4, [x2, 76]
	ldr	x2, [x19, 632]
	ldp	w3, w2, [x2, 16]
	bl	dprint_vfmw
	add	x0, x19, 65536
	mov	w1, w20
	ldr	w0, [x0, 2820]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 632]
	str	xzr, [x0, 40]
	ldr	x0, [x19, 632]
	str	wzr, [x0, 60]
	ldr	x0, [x19, 632]
	str	wzr, [x0, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CombinePacket.part.11, .-CombinePacket.part.11
	.align	3
.LC17:
	.xword	.LC16
	.align	3
.LC19:
	.xword	.LC18
	.align	3
.LC20:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC22:
	.xword	.LC21
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ue_v
	.type	ue_v, %function
ue_v:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 12288
	mov	x23, x1
	add	x21, x21, 2600
	bl	_mcount
	mov	w1, 32
	mov	x0, x21
	bl	BsShow
	mov	w20, w0
	bl	ZerosMS_32
	cmp	w0, 15
	mov	w19, w0
	bls	.L74
	cmp	w0, 31
	bls	.L75
	add	x0, x22, 65536
	mov	w1, 1
	mov	w20, -1
	mov	w19, 32
	str	w1, [x0, 2760]
.L72:
	ldr	x4, [x22, 632]
	mov	w3, w20
	ldr	x1, .LC24
	mov	x2, x23
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
.L74:
	lsl	w19, w0, 1
	mov	w2, 32
	add	w19, w19, 1
	mov	x0, x21
	sub	w2, w2, w19
	mov	w1, w19
	lsr	w20, w20, w2
	sub	w20, w20, #1
	bl	BsSkip
	b	.L72
	.p2align 3
.L75:
	mov	w1, w0
	mov	x0, x21
	add	w24, w19, 1
	lsl	w19, w19, 1
	bl	BsSkip
	add	w19, w19, 1
	mov	w1, w24
	mov	x0, x21
	bl	BsShow
	sub	w20, w0, #1
	mov	w1, w24
	mov	x0, x21
	bl	BsSkip
	b	.L72
	.size	ue_v, .-ue_v
	.align	3
.LC24:
	.xword	.LC23
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	se_v
	.type	se_v, %function
se_v:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 12288
	mov	x23, x1
	add	x21, x21, 2600
	bl	_mcount
	mov	w1, 32
	mov	x0, x21
	bl	BsShow
	mov	w20, w0
	bl	ZerosMS_32
	cmp	w0, 15
	mov	w19, w0
	bhi	.L77
	lsl	w19, w0, 1
	mov	w2, 32
	add	w19, w19, 1
	mov	x0, x21
	sub	w2, w2, w19
	mov	w1, w19
	lsr	w20, w20, w2
	and	w2, w20, 1
	lsr	w20, w20, 1
	cmp	w2, wzr
	csneg	w20, w20, w20, eq
	bl	BsSkip
.L79:
	ldr	x4, [x22, 632]
	mov	w3, w20
	ldr	x1, .LC25
	mov	x2, x23
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
.L77:
	cmp	w0, 31
	bls	.L86
	add	x0, x22, 65536
	mov	w1, 1
	mov	w20, 2147483647
	mov	w19, 32
	str	w1, [x0, 2760]
	b	.L79
	.p2align 3
.L86:
	mov	w1, w0
	mov	x0, x21
	bl	BsSkip
	mov	w1, w19
	mov	x0, x21
	lsl	w19, w19, 1
	bl	BsGet
	mov	w20, w0
	mov	w1, 1
	mov	x0, x21
	add	w19, w19, 1
	bl	BsGet
	and	w0, w0, 1
	cmp	w0, wzr
	csneg	w20, w20, w20, eq
	b	.L79
	.size	se_v, .-se_v
	.align	3
.LC25:
	.xword	.LC23
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	u_v
	.type	u_v, %function
u_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x2
	mov	w19, w1
	bl	_mcount
	add	x0, x21, 12288
	mov	w1, w19
	add	x0, x0, 2600
	bl	BsGet
	mov	w20, w0
	ldr	x4, [x21, 632]
	mov	w3, w0
	ldr	x1, .LC26
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
	.size	u_v, .-u_v
	.align	3
.LC26:
	.xword	.LC23
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	u_1
	.type	u_1, %function
u_1:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	add	x0, x20, 12288
	mov	w1, 1
	add	x0, x0, 2600
	bl	BsGet
	mov	w19, w0
	ldr	x5, [x20, 632]
	mov	w3, w0
	ldr	x1, .LC27
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
	.size	u_1, .-u_1
	.align	3
.LC27:
	.xword	.LC23
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_IsEosNal
	.type	H264_IsEosNal, %function
H264_IsEosNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 12288
	bl	_mcount
	add	x19, x19, 2600
	mov	w1, 32
	mov	x0, x19
	bl	BsGet
	mov	w20, w0
	mov	w1, 32
	mov	x0, x19
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w20, w2
	ccmp	w0, w1, 0, eq
	cset	w0, eq
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_IsEosNal, .-H264_IsEosNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetMinPOC
	.type	GetMinPOC, %function
GetMinPOC:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x2
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	str	wzr, [x21]
	add	x1, x20, 24576
	mov	w0, 2147483647
	str	w0, [x19]
	ldr	w0, [x1, 3712]
	ldr	w2, [x1, 3716]
	cmp	w2, w0
	bls	.L91
	mov	w2, w0
	str	w0, [x1, 3716]
.L91:
	mov	w0, 0
	cbz	w2, .L90
	.p2align 2
.L98:
	add	x3, x20, x0, uxtw 3
	ldr	w5, [x19]
	ldr	x3, [x3, 27904]
	ldr	w4, [x3, 688]
	cmp	w5, w4
	ble	.L93
	ldrb	w3, [x3, 4]
	cbz	w3, .L93
	str	w4, [x19]
	str	w0, [x21]
.L93:
	ldr	w3, [x1, 3716]
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L98
.L90:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetMinPOC, .-GetMinPOC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetMaxPOC
	.type	GetMaxPOC, %function
GetMaxPOC:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x2
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	str	wzr, [x21]
	add	x1, x20, 24576
	str	wzr, [x19]
	ldr	w0, [x1, 3712]
	ldr	w2, [x1, 3716]
	cmp	w2, w0
	bls	.L102
	mov	w2, w0
	str	w0, [x1, 3716]
.L102:
	mov	w0, 0
	cbz	w2, .L101
	.p2align 2
.L109:
	add	x3, x20, x0, uxtw 3
	ldr	w5, [x19]
	ldr	x3, [x3, 27904]
	ldr	w4, [x3, 688]
	cmp	w5, w4
	bge	.L104
	ldrb	w3, [x3, 4]
	cbz	w3, .L104
	str	w4, [x19]
	str	w0, [x21]
.L104:
	ldr	w3, [x1, 3716]
	add	w0, w0, 1
	cmp	w3, w0
	bhi	.L109
.L101:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetMaxPOC, .-GetMaxPOC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FrameStoreRefFlg
	.type	FrameStoreRefFlg, %function
FrameStoreRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 2]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	FrameStoreRefFlg, .-FrameStoreRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ShortTermRefFlg
	.type	ShortTermRefFlg, %function
ShortTermRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 2]
	cmp	w1, 3
	beq	.L129
	tbnz	x1, 0, .L130
.L117:
	mov	w0, 0
	tbnz	x1, 1, .L118
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L130:
	ldr	w0, [x19, 768]
	and	w0, w0, 16776960
	cmp	w0, 65536
	bne	.L117
.L122:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L129:
	ldr	w0, [x19, 720]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L122
	ldr	w0, [x19, 768]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L122
.L118:
	ldr	w0, [x19, 816]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 65536
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	ShortTermRefFlg, .-ShortTermRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	LongTermRefFlg
	.type	LongTermRefFlg, %function
LongTermRefFlg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w1, [x19, 2]
	cmp	w1, 3
	beq	.L147
	tbnz	x1, 0, .L148
.L135:
	mov	w0, 0
	tbnz	x1, 1, .L136
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L148:
	ldr	w0, [x19, 768]
	and	w0, w0, 16776960
	cmp	w0, 256
	bne	.L135
.L140:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L147:
	ldr	w0, [x19, 720]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L140
	ldr	w0, [x19, 768]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L140
.L136:
	ldr	w0, [x19, 816]
	ldr	x19, [sp, 16]
	and	w0, w0, 16776960
	cmp	w0, 256
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	LongTermRefFlg, .-LongTermRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UpdateLTReflist
	.type	UpdateLTReflist, %function
UpdateLTReflist:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x24, x22, 24576
	bl	_mcount
	ldr	w0, [x24, 3716]
	cbz	w0, .L156
	sub	w23, w0, #1
	add	x20, x24, 3328
	add	x23, x23, 3489
	mov	w19, 0
	add	x23, x22, x23, lsl 3
	.p2align 2
.L152:
	ldr	x21, [x20]
	add	x20, x20, 8
	mov	x0, x21
	bl	LongTermRefFlg
	add	x1, x22, x19, uxtw 3
	cmp	x20, x23
	cbz	w0, .L151
	add	w19, w19, 1
	str	x21, [x1, 28160]
.L151:
	bne	.L152
.L150:
	ldr	w1, [x24, 3712]
	str	w19, [x24, 3724]
	cmp	w1, w19
	bls	.L149
	.p2align 2
.L159:
	add	x0, x22, x19, uxtw 3
	add	w19, w19, 1
	cmp	w19, w1
	str	xzr, [x0, 28160]
	bne	.L159
.L149:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L156:
	mov	w19, 0
	b	.L150
	.size	UpdateLTReflist, .-UpdateLTReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UpdateReflist
	.type	UpdateReflist, %function
UpdateReflist:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x22, x0
	mov	x0, x30
	add	x24, x22, 24576
	bl	_mcount
	ldr	w0, [x24, 3716]
	cbz	w0, .L170
	sub	w23, w0, #1
	add	x20, x24, 3328
	add	x23, x23, 3489
	mov	w19, 0
	add	x23, x22, x23, lsl 3
	.p2align 2
.L166:
	ldr	x21, [x20]
	add	x20, x20, 8
	mov	x0, x21
	bl	ShortTermRefFlg
	add	x1, x22, x19, uxtw 3
	cmp	x20, x23
	cbz	w0, .L165
	add	w19, w19, 1
	str	x21, [x1, 28032]
.L165:
	bne	.L166
.L164:
	ldr	w1, [x24, 3712]
	str	w19, [x24, 3720]
	cmp	w1, w19
	bls	.L163
	.p2align 2
.L173:
	add	x0, x22, x19, uxtw 3
	add	w19, w19, 1
	cmp	w19, w1
	str	xzr, [x0, 28032]
	bne	.L173
.L163:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L170:
	mov	w19, 0
	b	.L164
	.size	UpdateReflist, .-UpdateReflist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetPicNumX
	.type	GetPicNumX, %function
GetPicNumX:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldrb	w0, [x20, 3]
	ldr	w2, [x20, 696]
	cbz	w0, .L179
	lsl	w2, w2, 1
	add	w2, w2, 1
.L179:
	mvn	w0, w19
	add	w0, w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetPicNumX, .-GetPicNumX
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkFrameStoreRef
	.type	UnMarkFrameStoreRef, %function
UnMarkFrameStoreRef:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 1]
	tbz	x0, 0, .L181
	ldrb	w1, [x19, 2]
	strb	wzr, [x19, 769]
	and	w1, w1, 2
	strb	wzr, [x19, 770]
	strb	w1, [x19, 2]
.L181:
	tbz	x0, 1, .L182
	ldrb	w1, [x19, 2]
	strb	wzr, [x19, 817]
	and	w1, w1, 1
	strb	wzr, [x19, 818]
	strb	w1, [x19, 2]
.L182:
	cmp	w0, 3
	bne	.L183
	strb	wzr, [x19, 722]
	strb	wzr, [x19, 721]
.L183:
	add	x20, x20, 65536
	strb	wzr, [x19, 2]
	ldr	w1, [x19, 672]
	mov	w2, 0
	ldr	w0, [x20, 2820]
	bl	FSP_SetRef
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	UnMarkFrameStoreRef, .-UnMarkFrameStoreRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	SlidingWinMark.part.2, %function
SlidingWinMark.part.2:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x19, x22, 24576
	bl	_mcount
	ldr	w0, [x19, 3716]
	cbz	w0, .L190
	sub	w21, w0, #1
	add	x19, x19, 3328
	add	x21, x21, 3489
	add	x21, x22, x21, lsl 3
	.p2align 2
.L193:
	ldr	x20, [x19]
	add	x19, x19, 8
	mov	x0, x20
	ldrb	w1, [x20, 2]
	cbz	w1, .L192
	bl	ShortTermRefFlg
	cbnz	w0, .L204
.L192:
	cmp	x19, x21
	bne	.L193
.L190:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L204:
	mov	x1, x20
	mov	x0, x22
	bl	UnMarkFrameStoreRef
	mov	x0, x22
	bl	UpdateReflist
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	SlidingWinMark.part.2, .-SlidingWinMark.part.2
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkLTFrmByFrmIdx
	.type	UnMarkLTFrmByFrmIdx, %function
UnMarkLTFrmByFrmIdx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 24576
	ldr	w4, [x0, 3724]
	cbz	w4, .L205
	ldr	x1, [x20, 28160]
	ldr	w0, [x1, 684]
	cmp	w19, w0
	beq	.L207
	sub	w4, w4, #1
	mov	x0, x20
	add	x4, x20, x4, lsl 3
	b	.L209
	.p2align 3
.L210:
	ldr	x1, [x0, 28168]
	add	x0, x0, 8
	ldr	w3, [x1, 684]
	cmp	w3, w19
	beq	.L207
.L209:
	cmp	x0, x4
	bne	.L210
.L205:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L207:
	mov	x0, x20
	bl	UnMarkFrameStoreRef
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	UnMarkLTFrmByFrmIdx, .-UnMarkLTFrmByFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkLTFldByFrmIdx
	.type	UnMarkLTFldByFrmIdx, %function
UnMarkLTFldByFrmIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	x21, x1
	mov	w20, w2
	mov	w19, w3
	bl	_mcount
	add	x0, x22, 24576
	ldr	w4, [x0, 3724]
	cbz	w4, .L216
	sub	w6, w4, #1
	add	x0, x0, 3584
	add	x6, x6, 3521
	add	x6, x22, x6, lsl 3
	b	.L220
	.p2align 3
.L218:
	cmp	x0, x6
	beq	.L216
.L220:
	ldr	x4, [x0]
	add	x0, x0, 8
	ldr	w5, [x4, 684]
	cmp	w5, w19
	bne	.L218
	cmp	w20, 1
	beq	.L232
	cmp	w20, 2
	bne	.L218
	ldrb	w1, [x4, 769]
	cmp	w1, wzr
	ccmp	x4, x21, 0, ne
	beq	.L218
.L231:
	mov	x1, x4
	mov	x0, x22
	bl	UnMarkFrameStoreRef
.L216:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L232:
	ldrb	w1, [x4, 817]
	cmp	w1, wzr
	ccmp	x4, x21, 0, ne
	beq	.L218
	b	.L231
	.size	UnMarkLTFldByFrmIdx, .-UnMarkLTFldByFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkSTRef
	.type	UnMarkSTRef, %function
UnMarkSTRef:
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
	cbnz	w0, .L234
	add	x0, x19, 24576
	ldr	w3, [x20, 696]
	sub	w3, w3, #1
	ldr	w1, [x0, 3720]
	sub	w2, w3, w21
	cbz	w1, .L233
	sub	w4, w1, #1
	add	x0, x0, 3456
	add	x4, x4, 3505
	add	x4, x19, x4, lsl 3
	b	.L240
	.p2align 3
.L239:
	cmp	x0, x4
	beq	.L233
.L240:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 728]
	cmp	w3, w2
	bne	.L239
	ldrb	w3, [x1, 2]
	cmp	w3, 3
	bne	.L239
	ldr	w3, [x1, 720]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L239
	mov	x0, x19
	bl	UnMarkFrameStoreRef
.L233:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L234:
	add	x1, x19, 24576
	ldr	w0, [x20, 696]
	add	x4, x1, 3456
	mov	w3, 0
	lsl	w0, w0, 1
	ldr	w6, [x1, 3720]
	sub	w2, w0, w21
	cbz	w6, .L233
	.p2align 2
.L254:
	ldr	x1, [x4]
	add	x4, x4, 8
	ldrb	w0, [x1, 2]
	and	w7, w0, 1
	tbz	x0, 0, .L241
	ldr	w5, [x1, 768]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L266
.L241:
	tbz	x0, 1, .L243
	ldr	w0, [x1, 816]
	and	w0, w0, 16776960
	cmp	w0, 65536
	beq	.L267
.L243:
	add	w3, w3, 1
	cmp	w3, w6
	bne	.L254
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L266:
	ldr	w5, [x1, 776]
	cmp	w5, w2
	bne	.L241
	add	x3, x19, x3, uxtw 3
	and	w0, w0, 2
	strb	w0, [x1, 2]
	ldr	x0, [x3, 28032]
	strb	wzr, [x0, 770]
	b	.L265
	.p2align 3
.L267:
	ldr	w0, [x1, 824]
	cmp	w0, w2
	bne	.L243
	add	x3, x19, x3, uxtw 3
	strb	w7, [x1, 2]
	ldr	x0, [x3, 28032]
	strb	wzr, [x0, 818]
.L265:
	ldr	x0, [x3, 28032]
	ldrb	w1, [x0, 720]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L244
	strb	wzr, [x0, 722]
	ldr	x0, [x3, 28032]
	strb	wzr, [x0, 721]
	ldr	x0, [x3, 28032]
.L244:
	ldrb	w1, [x0, 2]
	cbnz	w1, .L233
	ldr	w1, [x0, 708]
	add	x3, x19, 65536
	mov	w2, 0
	add	x1, x1, 16384
	add	x1, x1, 316
	str	wzr, [x19, x1, lsl 2]
	ldr	w1, [x0, 672]
	ldr	w0, [x3, 2820]
	bl	FSP_SetRef
	b	.L233
	.size	UnMarkSTRef, .-UnMarkSTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkLTRef
	.type	UnMarkLTRef, %function
UnMarkLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x1
	mov	x20, x0
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	ldrb	w0, [x21, 3]
	cbz	w0, .L269
	add	x0, x20, 24576
	mov	w3, 0
	add	x4, x0, 3584
	ldr	w2, [x0, 3724]
	cbz	w2, .L268
	.p2align 2
.L289:
	ldr	x1, [x4]
	add	x4, x4, 8
	ldrb	w0, [x1, 2]
	and	w6, w0, 1
	tbz	x0, 0, .L274
	ldr	w5, [x1, 768]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L301
.L274:
	tbz	x0, 1, .L276
	ldr	w0, [x1, 816]
	and	w0, w0, 16776960
	cmp	w0, 256
	beq	.L302
.L276:
	add	w3, w3, 1
	cmp	w3, w2
	bne	.L289
.L268:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L301:
	ldr	w5, [x1, 772]
	cmp	w19, w5
	bne	.L274
	add	x3, x20, x3, uxtw 3
	and	w0, w0, 2
	strb	w0, [x1, 2]
	ldr	x0, [x3, 28160]
	strb	wzr, [x0, 769]
	b	.L300
	.p2align 3
.L302:
	ldr	w0, [x1, 820]
	cmp	w19, w0
	bne	.L276
	add	x3, x20, x3, uxtw 3
	strb	w6, [x1, 2]
	ldr	x0, [x3, 28160]
	strb	wzr, [x0, 817]
.L300:
	ldr	x0, [x3, 28160]
	ldrb	w1, [x0, 720]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L277
	strb	wzr, [x0, 722]
	ldr	x0, [x3, 28160]
	strb	wzr, [x0, 721]
	ldr	x0, [x3, 28160]
.L277:
	ldrb	w1, [x0, 2]
	cbnz	w1, .L268
	ldr	w0, [x0, 708]
	add	x0, x0, 16384
	add	x0, x0, 316
	str	wzr, [x20, x0, lsl 2]
	b	.L268
	.p2align 3
.L269:
	add	x0, x20, 24576
	ldr	w1, [x0, 3724]
	cbz	w1, .L268
	sub	w2, w1, #1
	add	x0, x0, 3584
	add	x2, x2, 3521
	add	x2, x20, x2, lsl 3
	b	.L280
	.p2align 3
.L279:
	cmp	x0, x2
	beq	.L268
.L280:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldr	w3, [x1, 724]
	cmp	w3, w19
	bne	.L279
	ldrb	w3, [x1, 2]
	cmp	w3, 3
	bne	.L279
	ldr	w3, [x1, 720]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L279
	mov	x0, x20
	bl	UnMarkFrameStoreRef
	b	.L268
	.size	UnMarkLTRef, .-UnMarkLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MarkPicLTRef
	.type	MarkPicLTRef, %function
MarkPicLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x3
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	w20, w1
	bl	_mcount
	ldrb	w2, [x22, 3]
	add	x0, x21, 24576
	cbz	w2, .L304
	ldr	w7, [x0, 3720]
	mov	w3, 0
	add	x4, x0, 3456
	cbz	w7, .L303
	.p2align 2
.L325:
	ldr	x0, [x4]
	ldrb	w5, [x0, 2]
	tbz	x5, 0, .L310
	ldr	w6, [x0, 768]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L331
.L310:
	tbz	x5, 1, .L313
	ldr	w5, [x0, 816]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L332
.L313:
	add	w3, w3, 1
	add	x4, x4, 8
	cmp	w3, w7
	bne	.L325
.L303:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L331:
	ldr	w1, [x0, 776]
	cmp	w19, w1
	bne	.L310
	ldrb	w1, [x0, 817]
	cmp	w1, 1
	bne	.L314
	ldr	w1, [x0, 684]
	cmp	w20, w1
	bne	.L313
.L314:
	add	x3, x21, x3, uxtw 3
	str	w20, [x0, 684]
	cmp	w2, 1
	lsl	w0, w20, 1
	csinc	w0, w0, w0, ne
	mov	w1, 1
	ldr	x2, [x3, 28032]
	str	w0, [x2, 772]
	ldr	x0, [x3, 28032]
	strb	w1, [x0, 769]
	ldr	x0, [x3, 28032]
	strb	wzr, [x0, 770]
	ldr	x0, [x3, 28032]
	ldrb	w1, [x0, 720]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L303
	ldrb	w2, [x0, 769]
	ldrb	w1, [x0, 817]
	cmp	w1, w2
	bne	.L303
	strb	w1, [x0, 721]
	ldr	x0, [x3, 28032]
	ldrb	w1, [x0, 770]
	strb	w1, [x0, 722]
	b	.L303
	.p2align 3
.L332:
	ldr	w1, [x0, 824]
	cmp	w1, w19
	bne	.L313
	ldrb	w1, [x0, 769]
	cmp	w1, 1
	bne	.L317
	ldr	w1, [x0, 684]
	cmp	w1, w20
	bne	.L313
.L317:
	add	x3, x21, x3, uxtw 3
	str	w20, [x0, 684]
	cmp	w2, 2
	lsl	w0, w20, 1
	csinc	w0, w0, w0, ne
	mov	w1, 1
	ldr	x2, [x3, 28032]
	str	w0, [x2, 820]
	ldr	x0, [x3, 28032]
	strb	w1, [x0, 817]
	ldr	x0, [x3, 28032]
	strb	wzr, [x0, 818]
	ldr	x0, [x3, 28032]
	ldrb	w1, [x0, 720]
	cmp	w1, 3
	ccmp	w1, wzr, 4, ne
	bne	.L303
	ldrb	w2, [x0, 769]
	ldrb	w1, [x0, 817]
	cmp	w1, w2
	bne	.L303
	strb	w1, [x0, 721]
	ldr	x0, [x3, 28032]
	ldrb	w1, [x0, 818]
	strb	w1, [x0, 722]
	b	.L303
	.p2align 3
.L304:
	ldr	w7, [x0, 3720]
	cbz	w7, .L303
	add	x0, x0, 3456
	mov	w4, 0
	b	.L309
	.p2align 3
.L308:
	add	w4, w4, 1
	cmp	w4, w7
	beq	.L303
.L309:
	ldr	x5, [x0]
	add	x0, x0, 8
	ldrb	w6, [x5, 2]
	cmp	w6, 3
	bne	.L308
	ldr	w6, [x5, 720]
	and	w6, w6, 16776960
	cmp	w6, 65536
	bne	.L308
	ldr	w1, [x5, 728]
	cmp	w19, w1
	bne	.L308
	add	x4, x21, x4, uxtw 3
	str	w20, [x5, 684]
	mov	w0, 1
	ldr	x1, [x4, 28032]
	str	w20, [x1, 724]
	ldr	x1, [x4, 28032]
	strb	w0, [x1, 721]
	ldr	x1, [x4, 28032]
	strb	w0, [x1, 769]
	ldr	x1, [x4, 28032]
	strb	w0, [x1, 817]
	ldr	x0, [x4, 28032]
	strb	wzr, [x0, 722]
	ldr	x0, [x4, 28032]
	strb	wzr, [x0, 770]
	ldr	x0, [x4, 28032]
	strb	wzr, [x0, 818]
	b	.L303
	.size	MarkPicLTRef, .-MarkPicLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MarkSTToLTRef
	.type	MarkSTToLTRef, %function
MarkSTToLTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x1
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	mov	w20, w3
	bl	_mcount
	ldrb	w0, [x22, 3]
	cbnz	w0, .L334
	add	x0, x21, 24576
	ldr	w2, [x22, 696]
	sub	w2, w2, #1
	ldr	w4, [x0, 3724]
	sub	w19, w2, w19
	cbz	w4, .L336
	ldr	x1, [x21, 28160]
	ldr	w0, [x1, 684]
	cmp	w20, w0
	beq	.L338
	sub	w4, w4, #1
	mov	x0, x21
	add	x4, x21, x4, lsl 3
	b	.L340
	.p2align 3
.L341:
	ldr	x1, [x0, 28168]
	add	x0, x0, 8
	ldr	w3, [x1, 684]
	cmp	w20, w3
	beq	.L338
.L340:
	cmp	x4, x0
	bne	.L341
.L336:
	mov	x3, x22
	mov	w2, w19
	mov	w1, w20
	mov	x0, x21
	bl	MarkPicLTRef
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L334:
	add	x0, x21, 24576
	ldr	w2, [x22, 696]
	lsl	w2, w2, 1
	ldr	w1, [x0, 3720]
	sub	w19, w2, w19
	cbz	w1, .L336
	sub	w5, w1, #1
	add	x0, x0, 3456
	add	x5, x5, 3505
	add	x5, x21, x5, lsl 3
	.p2align 2
.L344:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 2]
	tbz	x3, 0, .L342
	ldr	w4, [x1, 768]
	and	w4, w4, 16776960
	cmp	w4, 65536
	beq	.L354
.L342:
	tbz	x3, 1, .L343
	ldr	w3, [x1, 816]
	and	w3, w3, 16776960
	cmp	w3, 65536
	beq	.L355
.L343:
	cmp	x0, x5
	bne	.L344
	b	.L336
	.p2align 3
.L354:
	ldr	w2, [x1, 776]
	cmp	w2, w19
	bne	.L342
	mov	w3, w20
	mov	w2, 1
	mov	x0, x21
	bl	UnMarkLTFldByFrmIdx
	b	.L336
	.p2align 3
.L355:
	ldr	w2, [x1, 824]
	cmp	w2, w19
	bne	.L343
	mov	w3, w20
	mov	w2, 2
	mov	x0, x21
	bl	UnMarkLTFldByFrmIdx
	b	.L336
	.p2align 3
.L338:
	mov	x0, x21
	bl	UnMarkFrameStoreRef
	b	.L336
	.size	MarkSTToLTRef, .-MarkSTToLTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UpdateMaxLTFrmIdx
	.type	UpdateMaxLTFrmIdx, %function
UpdateMaxLTFrmIdx:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 24576
	mov	w20, w1
	bl	_mcount
	ldr	w0, [x21, 3724]
	str	w20, [x21, 3728]
	cbz	w0, .L356
	mov	w19, 0
	mov	w2, w20
	b	.L358
	.p2align 3
.L359:
	ldr	w0, [x21, 3724]
	cmp	w0, w19
	bls	.L356
.L363:
	ldr	w2, [x21, 3728]
.L358:
	add	x0, x22, x19, uxtw 3
	add	w19, w19, 1
	ldr	x1, [x0, 28160]
	ldr	w0, [x1, 684]
	cmp	w0, w2
	bcc	.L359
	mov	x0, x22
	bl	UnMarkFrameStoreRef
	ldr	w0, [x21, 3724]
	cmp	w0, w19
	bhi	.L363
.L356:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	UpdateMaxLTFrmIdx, .-UpdateMaxLTFrmIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UnMarkAllSTRef
	.type	UnMarkAllSTRef, %function
UnMarkAllSTRef:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 24576
	mov	w19, 0
	bl	_mcount
	ldr	w0, [x21, 3720]
	cbz	w0, .L364
	.p2align 2
.L368:
	add	x1, x20, x19, uxtw 3
	mov	x0, x20
	add	w19, w19, 1
	ldr	x1, [x1, 28032]
	bl	UnMarkFrameStoreRef
	ldr	w0, [x21, 3720]
	cmp	w0, w19
	bhi	.L368
.L364:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	UnMarkAllSTRef, .-UnMarkAllSTRef
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	MarkCurrPicLT
	.type	MarkCurrPicLT, %function
MarkCurrPicLT:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x1
	mov	x21, x0
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	ldrb	w2, [x20, 3]
	cbnz	w2, .L371
	add	x0, x21, 24576
	ldr	w3, [x0, 3724]
	cbz	w3, .L372
	ldr	x1, [x21, 28160]
	ldr	w0, [x1, 684]
	cmp	w19, w0
	beq	.L373
	sub	w3, w3, #1
	mov	x0, x21
	add	x3, x21, x3, lsl 3
	b	.L375
	.p2align 3
.L376:
	ldr	x1, [x0, 28168]
	add	x0, x0, 8
	ldr	w2, [x1, 684]
	cmp	w19, w2
	beq	.L373
.L375:
	cmp	x0, x3
	bne	.L376
.L372:
	strb	wzr, [x20, 5]
	mov	w0, 1
	str	w19, [x20, 700]
	strb	w0, [x20, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L373:
	mov	x0, x21
	bl	UnMarkFrameStoreRef
	strb	wzr, [x20, 5]
	str	w19, [x20, 700]
	mov	w0, 1
	strb	w0, [x20, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L371:
	ldr	x1, [x20, 680]
	mov	w3, w19
	mov	x0, x21
	bl	UnMarkLTFldByFrmIdx
	strb	wzr, [x20, 5]
	str	w19, [x20, 700]
	mov	w0, 1
	strb	w0, [x20, 4]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	MarkCurrPicLT, .-MarkCurrPicLT
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	RemoveFrameStoreOutDPB
	.type	RemoveFrameStoreOutDPB, %function
RemoveFrameStoreOutDPB:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	uxtw	x21, w1
	mov	x20, x0
	mov	x0, x30
	mov	x19, x21
	add	x22, x20, x21, lsl 3
	bl	_mcount
	ldr	x1, [x22, 27904]
	cbz	x1, .L382
	ldr	w0, [x1, 712]
	add	x23, x20, 24576
	add	x24, x20, 65536
	add	x0, x0, 4096
	add	x0, x20, x0, lsl 2
	str	wzr, [x0, 11928]
	ldr	w0, [x23, 3996]
	cmp	w0, wzr
	cset	w2, ne
	sub	w0, w0, w2
	str	w0, [x23, 3996]
	ldr	w1, [x1, 672]
	ldr	w0, [x24, 2820]
	bl	FSP_GetLogicFs
	cbz	x0, .L385
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	beq	.L386
	ldr	x1, [x22, 27904]
	mov	w2, 0
	ldr	w0, [x24, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
.L386:
	ldr	x1, [x22, 27904]
	mov	w2, 0
	ldr	w0, [x24, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetRef
.L385:
	ldr	x0, [x22, 27904]
	strb	wzr, [x0, 1]
	ldr	x0, [x22, 27904]
	strb	wzr, [x0, 4]
	ldr	x0, [x22, 27904]
	strb	wzr, [x0, 2]
	ldr	w3, [x23, 3716]
	sub	w3, w3, #1
	cmp	w19, w3
	bcs	.L388
	.p2align 2
.L398:
	add	w0, w19, 1
	add	x1, x21, 3488
	add	x2, x0, 3488
	mov	w19, w0
	cmp	w0, w3
	mov	x21, x0
	ldr	x0, [x20, x2, lsl 3]
	str	x0, [x20, x1, lsl 3]
	bne	.L398
.L388:
	add	x20, x20, x3, uxtw 3
	str	xzr, [x20, 27904]
	str	w3, [x23, 3716]
.L382:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	RemoveFrameStoreOutDPB, .-RemoveFrameStoreOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	RemoveUnUsedFrameStore
	.type	RemoveUnUsedFrameStore, %function
RemoveUnUsedFrameStore:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	cbz	x22, .L412
	add	x0, x22, 24576
	ldr	w23, [x0, 3716]
	cbz	w23, .L411
	mov	w21, 0
	mov	w20, 0
	add	x24, x22, 65536
	mov	w25, -1
	b	.L410
	.p2align 3
.L421:
	ldrb	w1, [x0, 4]
	cbnz	w1, .L408
	ldr	w1, [x0, 864]
	cmp	w1, 1
	beq	.L408
	strb	wzr, [x0, 1]
	mov	w1, w21
	mov	x0, x22
	add	w20, w20, 1
	bl	RemoveFrameStoreOutDPB
	cmp	w23, w20
	beq	.L411
	.p2align 2
.L410:
	add	x19, x22, x21, uxtw 3
	ldr	w0, [x24, 2820]
	ldr	x1, [x19, 27904]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	cbz	x0, .L405
	ldrsh	w1, [x0]
	cbnz	w1, .L406
	ldr	x1, [x19, 27904]
	ldrb	w2, [x1, 2]
	cbnz	w2, .L407
	ldrsb	w0, [x0]
	cbnz	w0, .L420
.L407:
	str	w25, [x1, 672]
	ldr	x0, [x19, 27904]
	strb	wzr, [x0, 2]
.L405:
	ldr	x0, [x19, 27904]
	ldr	w1, [x0, 864]
	cmp	w1, 1
	cset	w1, eq
	strb	w1, [x0, 4]
.L406:
	ldr	x0, [x19, 27904]
	ldrb	w1, [x0, 2]
	cbz	w1, .L421
.L408:
	add	w20, w20, 1
	add	w21, w21, 1
	cmp	w23, w20
	bne	.L410
.L411:
	mov	w0, 0
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L420:
	ldr	w1, [x1, 672]
	ldr	w0, [x24, 2820]
	bl	FSP_SetRef
	ldr	x1, [x19, 27904]
	b	.L407
	.p2align 3
.L412:
	mov	w0, -1
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.size	RemoveUnUsedFrameStore, .-RemoveUnUsedFrameStore
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CheckFrameStore
	.type	CheckFrameStore, %function
CheckFrameStore:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	add	x0, x20, 65536
	ldr	w1, [x0, 1348]
	cbnz	w1, .L423
	ldr	w1, [x19, 864]
	cmp	w1, 1
	beq	.L424
	ldr	w1, [x0, 2748]
	cbz	w1, .L448
.L424:
	mov	w1, 1
	str	w1, [x0, 1348]
.L423:
	ldr	w0, [x0, 2820]
	ldr	w1, [x19, 672]
	bl	FSP_GetLogicFs
	cbz	x0, .L426
	ldrsb	w3, [x0, 1]
	cmp	w3, 3
	ccmp	w3, wzr, 4, ne
	beq	.L449
	ldrb	w2, [x19, 1]
	ldrb	w3, [x19]
	cbz	w2, .L434
	cmp	w3, 1
	beq	.L434
	ldr	w1, [x19]
	mov	w3, 50332416
	and	w1, w1, -16711936
	cmp	w1, w3
	beq	.L450
	cmp	w2, 1
	beq	.L451
	cmp	w2, 2
	beq	.L452
.L432:
	ldr	x1, [x20]
	ldr	w2, [x0, 192]
	mov	w0, 0
	ldr	w3, [x1, 4]
	cmp	w2, w3
	bhi	.L453
.L444:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L448:
	ldr	x1, [x20]
	ldr	w1, [x1, 12]
	cbnz	w1, .L424
	mov	w0, -1
	b	.L444
	.p2align 3
.L449:
	ldr	x1, .LC31
	mov	w0, 1
	ldr	w2, [x19, 672]
	bl	dprint_vfmw
.L428:
	ldr	w0, [x19, 864]
	cmp	w0, 1
	beq	.L435
	mov	w0, -3
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L451:
	ldrb	w3, [x19, 3]
	tbz	x3, 0, .L432
	ldr	x1, .LC39
	mov	w0, w2
	bl	dprint_vfmw
	mov	w0, -1
	b	.L444
	.p2align 3
.L452:
	ldrb	w3, [x19, 3]
	tbz	x3, 1, .L432
	ldr	x1, .LC41
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L444
	.p2align 3
.L435:
	mov	w1, 2
	mov	w0, -3
	str	w1, [x19, 864]
	b	.L444
	.p2align 3
.L426:
	ldr	x1, .LC33
	mov	x2, x19
	ldr	w4, [x19, 672]
	mov	w0, 1
	ldr	w3, [x19, 864]
	bl	dprint_vfmw
	b	.L428
	.p2align 3
.L434:
	ldr	x1, .LC35
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L444
	.p2align 3
.L453:
	ldr	x1, .LC43
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L444
.L450:
	ldrb	w3, [x19, 3]
	mov	w0, 1
	ldr	x1, .LC37
	bl	dprint_vfmw
	mov	w0, -1
	b	.L444
	.size	CheckFrameStore, .-CheckFrameStore
	.align	3
.LC31:
	.xword	.LC30
	.align	3
.LC33:
	.xword	.LC32
	.align	3
.LC35:
	.xword	.LC34
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
	.global	ExchangePts
	.type	ExchangePts, %function
ExchangePts:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x25, x1
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x25, 648]
	cmn	x0, #1
	beq	.L454
	add	x26, x21, 24576
	ldr	w0, [x26, 3716]
	cbz	w0, .L454
	mov	w24, -1
	mov	w19, 0
	mov	x23, -2
	add	x22, x21, 65536
	.p2align 2
.L459:
	add	x20, x21, x19, sxtw 3
	ldr	x0, [x20, 27904]
	cbz	x0, .L458
	ldr	w1, [x0, 672]
	ldr	w0, [x22, 2820]
	bl	FSP_GetLogicFs
	cbz	x0, .L458
	ldrsb	w0, [x0, 1]
	cmp	w0, 3
	ccmp	w0, wzr, 4, ne
	beq	.L458
	ldr	x0, [x20, 27904]
	ldr	x0, [x0, 648]
	cmp	x0, x23
	bcs	.L458
	mov	w24, w19
	mov	x23, x0
	.p2align 2
.L458:
	ldr	w0, [x26, 3716]
	add	w19, w19, 1
	cmp	w0, w19
	bhi	.L459
	cmn	w24, #1
	beq	.L454
	ldr	x2, [x25, 648]
	cmp	x23, x2
	bcc	.L473
.L454:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L473:
	ldr	x1, .LC45
	mov	x3, x23
	add	x21, x21, x24, sxtw 3
	mov	w0, 29
	bl	dprint_vfmw
	ldr	x0, [x21, 27904]
	ldr	x1, [x25, 648]
	str	x1, [x0, 648]
	str	x23, [x25, 648]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	ExchangePts, .-ExchangePts
	.align	3
.LC45:
	.xword	.LC44
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetImagePara
	.type	GetImagePara, %function
GetImagePara:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	mov	x19, x1
	add	x20, x22, 65536
	bl	_mcount
	add	x21, x22, 24576
	add	x2, x22, 20480
	mov	w4, 2208
	ldr	x7, [x22, 14968]
	mov	w3, 4000
	ldrb	w0, [x19, 133]
	ldr	w2, [x2, 1596]
	ldrb	w1, [x19, 132]
	and	w5, w0, -4
	ldr	x6, [x22, 14960]
	mov	w0, w5
	umull	x4, w2, w4
	and	w1, w1, -4
	ldrb	w2, [x19, 134]
	add	x4, x7, x4
	and	w2, w2, -3
	ldr	w4, [x4, 28]
	strb	w5, [x19, 133]
	strb	w1, [x19, 132]
	umull	x3, w4, w3
	ldr	w4, [x20, 1356]
	str	w4, [x19, 168]
	add	x3, x6, x3
	strb	w2, [x19, 134]
	ldrb	w4, [x19, 1]
	ldr	x5, [x22]
	ldr	w5, [x5, 592]
	cmp	w5, 1
	cset	w5, eq
	cmp	w4, 3
	bfi	w2, w5, 2, 1
	strb	w2, [x19, 134]
	bhi	.L475
	ldr	x2, .LC46
	ldrb	w2, [x2,w4,uxtw]
	adr	x5, .Lrtx477
	add	x2, x5, w2, sxtb #2
	br	x2
.Lrtx477:
	.section	.rodata
	.align	0
	.align	2
.L477:
	.byte	(.L476 - .Lrtx477) / 4
	.byte	(.L478 - .Lrtx477) / 4
	.byte	(.L479 - .Lrtx477) / 4
	.byte	(.L476 - .Lrtx477) / 4
	.text
	.p2align 3
.L476:
	ldrb	w2, [x19, 720]
	cbnz	w2, .L480
	ldr	w5, [x19, 704]
	ldr	w2, [x19, 696]
	str	w5, [x19, 192]
	ldr	w9, [x19, 700]
	ldr	w6, [x19, 788]
	ldr	w5, [x19, 836]
	cbnz	w2, .L481
	mov	w10, 2
	mov	w7, 3
.L482:
	ldr	w8, [x19, 780]
	ldr	w2, [x19, 828]
	cmp	w8, w2
	beq	.L516
	cset	w2, le
.L492:
	add	x21, x22, 24576
	ldrb	w8, [x21, 3228]
	cmp	w8, 3
	beq	.L502
	cmp	w8, 4
	mov	w8, 0
	csel	w2, w2, w8, ne
.L493:
	bfi	w0, w2, 4, 2
	bfi	w1, w9, 0, 2
	bfi	w0, w7, 2, 2
	strb	w1, [x19, 132]
	bfi	w0, w10, 0, 2
	strb	w0, [x19, 133]
	stp	w6, w5, [x19, 124]
.L475:
	ldrb	w1, [x3, 18]
	mov	w2, 0
	str	w1, [x19, 520]
	str	w1, [x19, 524]
	ldrb	w1, [x3, 22]
	cbz	w1, .L494
	ldr	w2, [x3, 3332]
.L494:
	mov	w1, 1
	str	w2, [x19, 532]
	str	w1, [x19, 528]
	ldr	x1, [x22]
	ldr	w1, [x1, 12]
	cmp	w1, wzr
	ble	.L495
	ldrb	w1, [x19, 720]
	cbz	w1, .L517
.L495:
	mov	x0, x22
	mov	x1, x19
	bl	ExchangePts
	ldrsb	w0, [x21, 3192]
	cbz	w0, .L496
	ldr	w0, [x21, 3208]
	cmp	w0, 3
	beq	.L518
	cmp	w0, 4
	beq	.L519
	cmp	w0, 5
	beq	.L520
	str	wzr, [x19, 400]
	mov	w0, 0
	ldr	x1, .LC48
	ldr	w2, [x21, 3208]
	bl	dprint_vfmw
	.p2align 2
.L496:
	ldr	w0, [x20, 2820]
	ldr	w1, [x19, 672]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L474
	ldr	x3, .LC49
	mov	x2, 664
	add	x1, x19, 8
	ldr	x3, [x3, 104]
	blr	x3
	str	wzr, [x20, 412]
	mov	w2, 4
	mov	w1, 1
	ldrb	w0, [x19, 720]
	strb	w1, [x20, 407]
	cmp	w0, wzr
	csel	w0, w0, w2, eq
	strb	w0, [x20, 400]
	ldr	w0, [x19, 744]
	str	w0, [x20, 416]
	strb	w1, [x20, 405]
	str	w0, [x20, 420]
	str	w0, [x20, 424]
	ldr	w0, [x19, 752]
	str	w0, [x20, 356]
.L474:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L517:
	cmp	w4, 3
	bne	.L495
	and	w0, w0, -4
	strb	w0, [x19, 133]
	b	.L495
	.p2align 3
.L478:
	ldr	w6, [x19, 700]
	mov	w2, 1
	bfi	w0, w2, 2, 2
	ldr	w5, [x19, 704]
	bfi	w1, w6, 0, 2
	ldr	w2, [x19, 788]
	strb	w1, [x19, 132]
	orr	w0, w0, 3
	ldr	x1, [x19, 808]
	add	x21, x22, 24576
	str	w2, [x19, 124]
	mov	w2, 3
	strb	w0, [x19, 133]
	str	w5, [x19, 192]
	str	w2, [x19, 128]
	ldr	w1, [x1, 716]
	str	w1, [x19, 752]
	b	.L475
	.p2align 3
.L479:
	ldr	w6, [x19, 700]
	mov	w2, 2
	bfi	w0, w2, 2, 2
	ldr	w5, [x19, 836]
	bfi	w1, w6, 0, 2
	ldr	w2, [x19, 704]
	strb	w1, [x19, 132]
	orr	w0, w0, 3
	ldr	x1, [x19, 856]
	add	x21, x22, 24576
	str	w2, [x19, 192]
	mov	w2, 3
	strb	w0, [x19, 133]
	str	w5, [x19, 128]
	str	w2, [x19, 124]
	ldr	w1, [x1, 716]
	str	w1, [x19, 752]
	b	.L475
	.p2align 3
.L518:
	mov	w0, 1
	str	w0, [x19, 400]
	b	.L496
	.p2align 3
.L520:
	mov	w0, 3
	str	w0, [x19, 400]
	b	.L496
	.p2align 3
.L480:
	ldr	w8, [x19, 784]
	ldr	w2, [x20, 2816]
	ldr	w10, [x19, 832]
	cmp	w8, w2
	bhi	.L521
	cmp	w2, w10
	bcc	.L486
.L484:
	ldr	w2, [x19, 704]
	mov	w7, 3
	ldr	w9, [x19, 700]
	ldr	w6, [x19, 788]
	ldr	w5, [x19, 836]
	str	w2, [x19, 192]
.L487:
	ldrb	w2, [x19, 3]
	cmp	w2, 1
	beq	.L522
	cmp	w2, 2
	beq	.L523
.L489:
	ldr	w8, [x19, 800]
	mov	w10, 3
	ldr	w2, [x19, 848]
	stp	w6, w5, [x19, 124]
	add	w2, w8, w2
	add	w2, w2, w2, lsr 31
	asr	w2, w2, 1
	str	w2, [x19, 364]
	b	.L482
	.p2align 3
.L486:
	ldr	w9, [x19, 788]
	mov	w7, 1
	ldr	w5, [x19, 836]
	mov	w6, w9
	str	w8, [x19, 192]
	b	.L487
	.p2align 3
.L519:
	mov	w0, 2
	str	w0, [x19, 400]
	b	.L496
	.p2align 3
.L502:
	mov	w2, 1
	b	.L493
	.p2align 3
.L516:
	mov	x2, 720
	ldr	x8, [x19, 136]
	movk	x2, 0x1e0, lsl 32
	cmp	x8, x2
	cset	w2, ne
	b	.L492
	.p2align 3
.L521:
	cmp	w2, w10
	bcc	.L484
	ldr	w9, [x19, 836]
	mov	w7, 2
	ldr	w6, [x19, 788]
	mov	w5, w9
	str	w10, [x19, 192]
	b	.L487
	.p2align 3
.L481:
	mov	w10, 3
	mov	w7, w10
	b	.L482
	.p2align 3
.L522:
	mov	w9, w5
	mov	w7, 2
	str	w10, [x19, 192]
	b	.L489
	.p2align 3
.L523:
	mov	w9, w6
	mov	w7, 1
	str	w8, [x19, 192]
	b	.L489
	.size	GetImagePara, .-GetImagePara
	.align	3
.LC46:
	.xword	.L477
	.align	3
.LC48:
	.xword	.LC47
	.align	3
.LC49:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SetFrmRepeatCount
	.type	SetFrmRepeatCount, %function
SetFrmRepeatCount:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x0, [x19]
	ldr	w0, [x0, 604]
	add	w0, w0, 2047
	cmp	w0, 4095
	bls	.L525
	mov	x1, x20
	mov	x0, x19
	bl	SetFrmRepeatCount.part.1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L525:
	str	wzr, [x20, 24]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SetFrmRepeatCount, .-SetFrmRepeatCount
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SplitFrmToFlds
	.type	SplitFrmToFlds, %function
SplitFrmToFlds:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w4, [x19, 721]
	mov	w6, 1
	ldrb	w3, [x19, 722]
	mov	w5, 2
	ldr	w2, [x19, 736]
	ldr	w1, [x19, 740]
	ldr	x0, [x19, 760]
	strb	w4, [x19, 769]
	strb	w3, [x19, 770]
	strb	w6, [x19, 768]
	strb	w4, [x19, 817]
	strb	w3, [x19, 818]
	strb	w5, [x19, 816]
	str	w2, [x19, 784]
	str	w1, [x19, 788]
	str	x0, [x19, 808]
	str	w2, [x19, 832]
	str	w1, [x19, 836]
	str	x0, [x19, 856]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SplitFrmToFlds, .-SplitFrmToFlds
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CombineFldsToFrm
	.type	CombineFldsToFrm, %function
CombineFldsToFrm:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x19, 780]
	mov	w5, 3
	ldr	w3, [x19, 784]
	ldr	w2, [x19, 828]
	ldr	w0, [x19, 832]
	cmp	w1, w2
	ldr	x4, [x19, 808]
	add	w0, w3, w0
	ldrb	w3, [x19, 817]
	csel	w1, w1, w2, le
	lsr	w0, w0, 1
	strb	w5, [x19, 720]
	str	w1, [x19, 688]
	str	w1, [x19, 732]
	str	w0, [x19, 736]
	str	x4, [x19, 760]
	cbz	w3, .L529
	ldrb	w1, [x19, 769]
	cbz	w1, .L529
	mov	w1, 1
	strb	w1, [x19, 721]
.L531:
	mov	w2, 0
.L532:
	ldr	w1, [x19, 788]
	strb	w2, [x19, 722]
	cbz	w1, .L533
	ldr	w2, [x19, 836]
	cbz	w2, .L535
	cmp	w1, w2
	csel	w1, w1, w2, cs
.L533:
	str	w1, [x19, 700]
	str	w0, [x19, 704]
	str	w1, [x19, 740]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L529:
	ldr	w1, [x19, 816]
	strb	wzr, [x19, 721]
	tst	w1, 16776960
	beq	.L531
	ldr	w1, [x19, 768]
	mov	w2, 1
	tst	w1, 16776960
	bne	.L532
	b	.L531
	.p2align 3
.L535:
	mov	w1, 0
	str	w0, [x19, 704]
	str	w1, [x19, 700]
	str	w1, [x19, 740]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CombineFldsToFrm, .-CombineFldsToFrm
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetAPC
	.type	GetAPC, %function
GetAPC:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x22, x1
	mov	x0, x30
	mov	w19, w2
	bl	_mcount
	cbz	x22, .L570
	cmp	w19, 1
	beq	.L550
	cmp	w19, 2
	beq	.L551
	ldr	w23, [x22, 780]
	ldr	w24, [x22, 828]
.L552:
	add	x21, x20, 24576
	ldr	w2, [x21, 3992]
	cbz	w2, .L561
	ldr	w0, [x21, 3736]
	cbz	w0, .L571
	add	x0, x21, 3740
	mov	w19, 0
	b	.L555
	.p2align 3
.L559:
	ldr	w1, [x0], 4
	cbz	w1, .L553
.L555:
	add	w19, w19, 1
	cmp	w19, w2
	bne	.L559
.L561:
	mov	w0, -1
.L565:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L551:
	ldr	w23, [x22, 828]
	mov	w24, w23
	b	.L552
.L571:
	mov	w19, 0
	.p2align 2
.L553:
	add	x0, x20, 65536
	ldr	w1, [x22, 672]
	ldr	w0, [x0, 2820]
	bl	FSP_GetLogicFs
	cbz	x0, .L556
	ldr	x1, [x0, 680]
	cbz	x1, .L556
	add	x20, x20, x19, uxtw 2
	mov	w1, 1
	add	x20, x20, 24576
	mov	w4, 16
	mov	w3, w19
	str	w1, [x20, 3736]
	ldr	x1, .LC55
	ldr	x0, [x0, 680]
	ldr	w0, [x0, 8]
	str	w0, [x20, 3800]
	mov	w0, 13
	str	w23, [x20, 3864]
	str	w24, [x20, 3928]
	ldr	w2, [x21, 3996]
	cmp	w2, 15
	csinc	w2, w4, w2, hi
	str	w2, [x21, 3996]
	ldr	w2, [x22, 188]
	bl	dprint_vfmw
	str	w19, [x22, 712]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L550:
	ldr	w23, [x22, 780]
	mov	w24, w23
	b	.L552
.L556:
	ldrb	w3, [x22, 2]
	mov	x4, x0
	ldr	x1, .LC57
	mov	x5, 0
	ldr	w2, [x22, 672]
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L565
.L570:
	ldr	x2, .LC51
	mov	w3, 2250
	ldr	x1, .LC53
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L565
	.size	GetAPC, .-GetAPC
	.align	3
.LC51:
	.xword	.LC50
	.align	3
.LC53:
	.xword	.LC52
	.align	3
.LC55:
	.xword	.LC54
	.align	3
.LC57:
	.xword	.LC56
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SlidingWinMark
	.type	SlidingWinMark, %function
SlidingWinMark:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 24576
	add	x0, x19, 16384
	ldr	w2, [x1, 3724]
	ldr	w0, [x0, 1836]
	ldr	w1, [x1, 3720]
	sub	w0, w0, w2
	cmp	w1, w0
	bne	.L572
	mov	x0, x19
	bl	SlidingWinMark.part.2
.L572:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	SlidingWinMark, .-SlidingWinMark
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DumpDPB
	.type	DumpDPB, %function
DumpDPB:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC58
	ldr	w0, [x0]
	tbz	x0, 14, .L574
	add	x21, x22, 24576
	ldr	w0, [x21, 3716]
	cbz	w0, .L580
	ldr	x20, .LC61
	mov	w19, 0
	.p2align 2
.L579:
	add	x3, x22, x19, uxtw 3
	mov	w2, w19
	mov	x1, x20
	mov	w0, 14
	add	w19, w19, 1
	ldr	x3, [x3, 27904]
	ldrb	w5, [x3, 2]
	ldr	w4, [x3, 688]
	ldr	w3, [x3, 676]
	bl	dprint_vfmw
	ldr	w0, [x21, 3716]
	cmp	w0, w19
	bhi	.L579
.L580:
	ldr	x25, .LC59
	mov	w0, 14
	mov	x1, x25
	bl	dprint_vfmw
	ldr	w0, [x21, 3720]
	cbz	w0, .L578
	ldr	x24, .LC63
	mov	w19, 0
	ldr	x23, .LC65
	.p2align 2
.L581:
	add	x20, x22, x19, uxtw 3
	mov	w2, w19
	mov	x1, x24
	mov	w0, 14
	ldr	x3, [x20, 28032]
	ldrb	w5, [x3, 2]
	ldr	w4, [x3, 688]
	ldr	w3, [x3, 676]
	bl	dprint_vfmw
	ldr	x3, [x20, 28032]
	mov	w2, w19
	mov	x1, x23
	mov	w0, 14
	add	w19, w19, 1
	ldr	w3, [x3, 732]
	bl	dprint_vfmw
	ldr	w0, [x21, 3720]
	cmp	w0, w19
	bhi	.L581
.L578:
	mov	x1, x25
	mov	w0, 14
	bl	dprint_vfmw
.L574:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	DumpDPB, .-DumpDPB
	.align	3
.LC58:
	.xword	g_PrintEnable
	.align	3
.LC59:
	.xword	.LC6
	.align	3
.LC61:
	.xword	.LC60
	.align	3
.LC63:
	.xword	.LC62
	.align	3
.LC65:
	.xword	.LC64
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UpdateCurrFrameInfo
	.type	UpdateCurrFrameInfo, %function
UpdateCurrFrameInfo:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 61440
	mov	w2, 3
	ldr	x19, [x1, 3352]
	ldrb	w3, [x1, 2674]
	strb	w3, [x19]
	ldrb	w3, [x1, 2676]
	cbnz	w3, .L588
	ldrb	w2, [x1, 2677]
	mov	w0, 3
	cmp	w2, wzr
	csel	w2, w2, w0, eq
.L588:
	add	x3, x1, 2672
	strb	w2, [x19, 2]
	mov	w2, 3
	ldr	w0, [x3, 696]
	str	w0, [x19, 676]
	ldr	w0, [x3, 732]
	str	w0, [x19, 704]
	ldr	w0, [x3, 724]
	str	w0, [x19, 700]
	ldr	w0, [x3, 708]
	str	w0, [x19, 688]
	ldr	w0, [x3, 756]
	str	w0, [x19, 708]
	ldr	w0, [x3, 700]
	str	w0, [x19, 684]
	ldrb	w0, [x3, 9]
	str	w0, [x19, 696]
	ldrb	w0, [x3, 7]
	cmp	w0, 1
	csel	w0, w2, wzr, eq
	strb	w0, [x19, 3]
	ldrb	w4, [x3, 3]
	cmp	w4, 1
	beq	.L591
	cbz	w4, .L592
	cmp	w4, 2
	bne	.L587
	str	x19, [x19, 856]
	mov	w5, 1
	strb	w5, [x19, 816]
	ldrb	w5, [x3, 4]
	strb	w5, [x19, 817]
	ldrb	w5, [x3, 5]
	strb	w5, [x19, 818]
	ldr	w5, [x3, 716]
	str	w5, [x19, 828]
	ldr	w6, [x3, 724]
	str	w6, [x19, 836]
	ldr	w5, [x3, 732]
	str	w5, [x19, 832]
	str	wzr, [x19, 696]
	ldrb	w7, [x3, 1]
	cbz	w7, .L614
	ldr	w4, [x19, 784]
	orr	w0, w0, 2
	strb	w2, [x19, 1]
	mov	w2, 0
	add	w5, w5, w4
	str	w5, [x19, 704]
	str	w5, [x19, 736]
	ldrb	w3, [x3, 7]
	cmp	w3, 1
	csel	w0, w0, w2, eq
	strb	w0, [x19, 3]
	ldr	x0, [x1, 3328]
	cmn	x0, #1
	beq	.L600
	ldr	x2, [x19, 648]
	cmn	x2, #1
	beq	.L615
.L600:
	ldr	w2, [x19, 788]
.L618:
	cmp	w2, w6
	mov	x0, x19
	csel	w6, w2, w6, cs
	str	w6, [x19, 700]
	ldr	w1, [x1, 3380]
	str	w1, [x19, 688]
	bl	CombineFldsToFrm
.L587:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L592:
	strb	w2, [x19, 1]
	add	x1, x1, 2688
	strb	wzr, [x19, 720]
	mov	x2, 664
	str	x19, [x19, 760]
	add	x0, x19, 8
	ldrb	w23, [x3, 4]
	strb	w23, [x19, 721]
	ldrb	w22, [x3, 5]
	strb	w22, [x19, 722]
	ldr	w4, [x3, 712]
	str	w4, [x19, 732]
	ldr	w20, [x3, 724]
	str	w20, [x19, 740]
	ldr	w21, [x3, 732]
	str	w21, [x19, 736]
	ldr	w4, [x3, 716]
	str	w4, [x19, 780]
	ldr	w3, [x3, 720]
	str	w3, [x19, 828]
	bl	memcpy
	strb	w23, [x19, 769]
	strb	w22, [x19, 770]
	mov	w1, 1
	strb	w23, [x19, 817]
	mov	w0, 2
	strb	w1, [x19, 768]
	strb	w22, [x19, 818]
	strb	w0, [x19, 816]
	str	w21, [x19, 784]
	str	w20, [x19, 788]
	str	x19, [x19, 808]
	str	w21, [x19, 832]
	str	w20, [x19, 836]
	str	x19, [x19, 856]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L591:
	strb	w4, [x19, 768]
	str	x19, [x19, 808]
	ldrb	w5, [x3, 4]
	strb	w5, [x19, 769]
	ldrb	w5, [x3, 5]
	strb	w5, [x19, 770]
	ldr	w5, [x3, 716]
	str	w5, [x19, 780]
	ldr	w6, [x3, 724]
	str	w6, [x19, 788]
	ldr	w5, [x3, 732]
	str	w5, [x19, 784]
	str	wzr, [x19, 696]
	ldrb	w7, [x3, 1]
	cbz	w7, .L616
	ldr	w4, [x19, 832]
	orr	w0, w0, 1
	strb	w2, [x19, 1]
	mov	w2, 0
	add	w5, w5, w4
	str	w5, [x19, 704]
	str	w5, [x19, 736]
	ldrb	w3, [x3, 7]
	cmp	w3, 1
	csel	w0, w0, w2, eq
	strb	w0, [x19, 3]
	ldr	x0, [x1, 3328]
	cmn	x0, #1
	beq	.L596
	ldr	x2, [x19, 648]
	cmn	x2, #1
	beq	.L617
.L596:
	ldr	w2, [x19, 836]
	mov	x0, x19
	cmp	w2, w6
	csel	w6, w2, w6, cs
	str	w6, [x19, 700]
	ldr	w1, [x1, 3380]
	str	w1, [x19, 688]
	bl	CombineFldsToFrm
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L614:
	strb	w4, [x19, 1]
	mov	x2, 664
	str	w5, [x19, 704]
	add	x1, x1, 2688
	str	w5, [x19, 736]
	add	x0, x19, 8
	ldrb	w3, [x3, 7]
	cmp	w3, 1
	csel	w7, wzr, w4, ne
	strb	w7, [x19, 3]
	bl	memcpy
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L616:
	strb	w4, [x19, 1]
	mov	x2, 664
	str	w5, [x19, 704]
	add	x1, x1, 2688
	str	w5, [x19, 736]
	add	x0, x19, 8
	ldrb	w3, [x3, 7]
	cmp	w3, 1
	cset	w3, eq
	strb	w3, [x19, 3]
	bl	memcpy
	b	.L587
	.p2align 3
.L617:
	str	x0, [x19, 648]
	b	.L596
	.p2align 3
.L615:
	str	x0, [x19, 648]
	ldr	w2, [x19, 788]
	b	.L618
	.size	UpdateCurrFrameInfo, .-UpdateCurrFrameInfo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SimpleSlideDPB
	.type	SimpleSlideDPB, %function
SimpleSlideDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 24576
	ldr	w1, [x0, 3716]
	ldr	w0, [x0, 3712]
	cmp	w1, w0
	bcs	.L625
.L620:
	add	x19, x19, 61440
	ldr	w0, [x19, 3376]
	strb	wzr, [x19, 2676]
	cbz	w0, .L619
	mov	w0, 1
	strb	w0, [x19, 2677]
.L619:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L625:
	ldr	x1, [x19, 27904]
	mov	x0, x19
	bl	UnMarkFrameStoreRef
	mov	w1, 0
	mov	x0, x19
	bl	RemoveFrameStoreOutDPB
	b	.L620
	.size	SimpleSlideDPB, .-SimpleSlideDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReleaseNAL
	.type	ReleaseNAL, %function
ReleaseNAL:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w21, w0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L635
	ldr	x23, .LC69
	add	x19, x20, 8
	strb	wzr, [x20, 1]
	add	x22, x20, 72
	strb	wzr, [x20, 4]
.L630:
	ldr	x1, [x19]
	mov	w0, w21
	cbz	x1, .L629
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
.L629:
	add	x19, x19, 32
	cmp	x19, x22
	bne	.L630
	strb	wzr, [x20]
	str	wzr, [x20, 76]
.L626:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L635:
	ldr	x2, .LC66
	mov	w3, 4252
	ldr	x1, .LC67
	mov	w0, 0
	bl	dprint_vfmw
	b	.L626
	.size	ReleaseNAL, .-ReleaseNAL
	.align	3
.LC66:
	.xword	.LC50
	.align	3
.LC67:
	.xword	.LC52
	.align	3
.LC69:
	.xword	.LC68
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearCurrNal
	.type	ClearCurrNal, %function
ClearCurrNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 632]
	cbz	x1, .L637
	add	x0, x19, 65536
	ldr	w0, [x0, 2820]
	bl	ReleaseNAL
	str	xzr, [x19, 632]
.L637:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ClearCurrNal, .-ClearCurrNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearCurrSlice
	.type	ClearCurrSlice, %function
ClearCurrSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 65536
	bl	_mcount
	ldr	x1, .LC71
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbz	x1, .L642
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L642:
	ldr	w1, [x19, 2776]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 2776]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ClearCurrSlice, .-ClearCurrSlice
	.align	3
.LC71:
	.xword	.LC70
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearAllNal
	.type	ClearAllNal, %function
ClearAllNal:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 640
	add	x21, x20, 65536
	add	x20, x20, 12288
	bl	_mcount
	add	x20, x20, 2600
	b	.L648
	.p2align 3
.L647:
	add	x19, x19, 104
	cmp	x19, x20
	beq	.L650
.L648:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L647
	ldr	w0, [x21, 2820]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x19, x20
	bne	.L648
.L650:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	ClearAllNal, .-ClearAllNal
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearAllSlice
	.type	ClearAllSlice, %function
ClearAllSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x21, x21, 65536
	add	x19, x21, 176
	add	x20, x21, 1264
	bl	_mcount
	.p2align 2
.L653:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L652
	ldr	w0, [x21, 2820]
	bl	ReleaseNAL
	str	xzr, [x19]
.L652:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L653
	str	wzr, [x21, 2744]
	mov	w0, 0
	str	wzr, [x21, 2804]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	ClearAllSlice, .-ClearAllSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_ClearCurrPic
	.type	H264_ClearCurrPic, %function
H264_ClearCurrPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	ClearAllSlice
	add	x0, x19, 20480
	mov	w4, 32
	ldr	w8, [x19, 14948]
	mov	w7, 23352
	movk	w7, 0x1, lsl 16
	mov	w6, 2
	strb	w4, [x0, 3234]
	add	x4, x0, 3072
	strb	wzr, [x0, 3232]
	mov	w5, 7
	strb	w6, [x0, 3233]
	mov	w3, 3
	str	w8, [x0, 3240]
	mov	w2, -1
	str	w5, [x0, 3244]
	mov	w1, 262144
	str	w7, [x0, 3248]
	stp	w3, w2, [x4, 184]
	stp	wzr, wzr, [x4, 192]
	str	w1, [x0, 3272]
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_ClearCurrPic, .-H264_ClearCurrPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_ArrangeVahbMem
	.type	H264_ArrangeVahbMem, %function
H264_ArrangeVahbMem:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w2
	mov	w19, w1
	mov	w22, w4
	bl	_mcount
	mov	w0, 8160
	sub	w2, w20, #32
	sub	w1, w19, #32
	cmp	w2, w0
	ccmp	w1, w0, 2, ls
	bhi	.L660
	ldr	x3, .LC74
	mov	x2, 32
	mov	w1, 0
	add	x0, x29, 64
	ldr	x3, [x3, 96]
	blr	x3
	strb	wzr, [x29, 64]
	ldr	x0, [x21]
	stp	w19, w20, [x29, 88]
	strb	wzr, [x29, 65]
	ldr	w0, [x0, 28]
	stp	w19, w20, [x29, 72]
	stp	w19, w20, [x29, 80]
	cmp	w0, 24
	beq	.L675
	add	x0, x21, 24576
	mov	w1, 5
	strb	wzr, [x29, 68]
	sxtb	w4, w22
	strb	w1, [x29, 69]
	ldr	w0, [x0, 3712]
	add	w0, w0, 1
	strb	w0, [x29, 67]
.L669:
	mov	w0, 63
	strb	w4, [x29, 70]
	cmp	w19, w0
	strb	wzr, [x29, 66]
	ccmp	w20, w0, 0, hi
	bls	.L676
	add	x19, x21, 65536
	add	x1, x29, 64
	ldr	w0, [x19, 2820]
	bl	FSP_ConfigInstance
	cbnz	w0, .L665
	ldr	x1, [x21]
	add	x3, x29, 60
	ldr	w0, [x19, 2820]
	ldr	w2, [x1, 24]
	ldr	w1, [x1, 20]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	mov	w1, w0
	beq	.L677
	mov	w0, 1
	cbnz	w1, .L667
.L670:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L675:
	mov	w1, 1
	mov	w0, 5
	strb	w1, [x29, 67]
	mov	w4, 1
	strb	wzr, [x29, 68]
	strb	w0, [x29, 69]
	b	.L669
	.p2align 3
.L677:
	add	x0, x21, 8
	bl	ResetVoQueue
.L667:
	ldr	x1, .LC80
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L670
	.p2align 3
.L660:
	ldr	x1, .LC76
.L673:
	mov	w3, w20
	mov	w2, w19
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L676:
	ldr	x1, .LC78
	b	.L673
	.p2align 3
.L665:
	ldr	x1, .LC82
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L670
	.size	H264_ArrangeVahbMem, .-H264_ArrangeVahbMem
	.align	3
.LC74:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC76:
	.xword	.LC75
	.align	3
.LC78:
	.xword	.LC77
	.align	3
.LC80:
	.xword	.LC79
	.align	3
.LC82:
	.xword	.LC81
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	RepairList
	.type	RepairList, %function
RepairList:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x7, x19, 20480
	ldrb	w2, [x7, 1584]
	cmp	w2, 1
	beq	.L697
	cbz	w2, .L681
	cmp	w2, 2
	mov	w0, 0
	bne	.L709
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L709:
	ldr	x1, .LC84
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L681:
	mov	w11, 1
.L680:
	add	x6, x19, 28672
	add	x7, x7, 1628
	add	x6, x6, 32
	mov	x8, 0
	mov	x9, 0
	mov	w2, 0
	mov	w13, 1
	add	x12, x19, 61440
	.p2align 2
.L693:
	ldr	w0, [x7]
	cbz	w0, .L683
	ldr	x1, [x6]
	cbnz	x1, .L710
	sub	w3, w0, #1
	add	x10, x8, 3589
	add	x0, x6, 8
	add	x5, x10, x3, uxtw
	add	x5, x19, x5, lsl 3
	b	.L686
	.p2align 3
.L687:
	ldr	x4, [x0], 8
	cbnz	x4, .L684
.L686:
	cmp	x0, x5
	bne	.L687
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L711
	ldr	x9, [x12, 3352]
	add	x9, x9, 720
.L694:
	add	x3, x10, x3, uxtw
	mov	x0, x6
	add	x3, x19, x3, lsl 3
	cbz	x1, .L712
	.p2align 2
.L689:
	add	x0, x0, 8
	cmp	x0, x3
	beq	.L690
.L713:
	ldr	x1, [x0]
	cbnz	x1, .L689
.L712:
	str	x9, [x0]
	add	x0, x0, 8
	cmp	x0, x3
	bne	.L713
	.p2align 2
.L690:
	add	w2, w2, 1
	add	x7, x7, 4
	cmp	w2, w11
	add	x6, x6, 264
	add	x8, x8, 33
	bcc	.L693
.L715:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L683:
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L714
	str	w13, [x7]
	add	w2, w2, 1
	cmp	w2, w11
	add	x7, x7, 4
	ldr	x0, [x12, 3352]
	add	x8, x8, 33
	add	x0, x0, 720
	str	x0, [x6]
	add	x6, x6, 264
	bcc	.L693
	b	.L715
.L710:
	sub	w3, w0, #1
	mov	x4, x1
	add	x10, x8, 3589
	.p2align 2
.L684:
	mov	x9, x4
	b	.L694
.L697:
	mov	w11, 2
	b	.L680
.L714:
	ldr	x1, .LC88
	mov	w3, 0
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L711:
	ldr	x1, .LC86
	mov	w3, 0
	mov	x2, x9
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
	.size	RepairList, .-RepairList
	.align	3
.LC84:
	.xword	.LC83
	.align	3
.LC86:
	.xword	.LC85
	.align	3
.LC88:
	.xword	.LC87
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetShortTermPicPoint
	.type	GetShortTermPicPoint, %function
GetShortTermPicPoint:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 20480
	mov	w5, 0
	ldrb	w1, [x0, 1585]
	cbz	w1, .L717
	ldrb	w0, [x0, 1586]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L717:
	add	x0, x20, 24576
	ldr	w2, [x0, 3720]
	cbz	w2, .L725
	sub	w2, w2, #1
	add	x0, x0, 3456
	add	x2, x2, 3505
	add	x4, x20, x2, lsl 3
	b	.L722
	.p2align 3
.L735:
	cmp	w3, 3
	beq	.L734
.L720:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L725
.L722:
	ldr	x2, [x0]
	ldrb	w3, [x2, 2]
	cbz	w5, .L735
	tbz	x3, 0, .L721
	ldr	w6, [x2, 768]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L736
.L721:
	tbz	x3, 1, .L720
	ldr	w3, [x2, 816]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L720
	ldr	w1, [x2, 824]
	cmp	w19, w1
	bne	.L720
	add	x0, x2, 816
	b	.L718
	.p2align 3
.L736:
	ldr	w1, [x2, 776]
	cmp	w1, w19
	bne	.L721
	add	x0, x2, 768
	b	.L718
	.p2align 3
.L734:
	ldr	w3, [x2, 720]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L720
	ldr	w1, [x2, 728]
	cmp	w19, w1
	bne	.L720
	add	x0, x2, 720
	b	.L718
	.p2align 3
.L725:
	mov	x0, 0
.L718:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetShortTermPicPoint, .-GetShortTermPicPoint
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetLongTermPicPoint
	.type	GetLongTermPicPoint, %function
GetLongTermPicPoint:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	add	x0, x20, 20480
	mov	w5, 0
	ldrb	w1, [x0, 1585]
	cbz	w1, .L738
	ldrb	w0, [x0, 1586]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L738:
	add	x0, x20, 24576
	ldr	w2, [x0, 3724]
	cbz	w2, .L746
	sub	w2, w2, #1
	add	x0, x0, 3584
	add	x2, x2, 3521
	add	x4, x20, x2, lsl 3
	b	.L743
	.p2align 3
.L756:
	cmp	w3, 3
	beq	.L755
.L741:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L746
.L743:
	ldr	x2, [x0]
	ldrb	w3, [x2, 2]
	cbz	w5, .L756
	tbz	x3, 0, .L742
	ldr	w6, [x2, 768]
	and	w6, w6, 16776960
	cmp	w6, 256
	beq	.L757
.L742:
	tbz	x3, 1, .L741
	ldr	w3, [x2, 816]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L741
	ldr	w1, [x2, 820]
	cmp	w19, w1
	bne	.L741
	add	x0, x2, 816
	b	.L739
	.p2align 3
.L757:
	ldr	w1, [x2, 772]
	cmp	w1, w19
	bne	.L742
	add	x0, x2, 768
	b	.L739
	.p2align 3
.L755:
	ldr	w3, [x2, 720]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L741
	ldr	w1, [x2, 724]
	cmp	w19, w1
	bne	.L741
	add	x0, x2, 720
	b	.L739
	.p2align 3
.L746:
	mov	x0, 0
.L739:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	GetLongTermPicPoint, .-GetLongTermPicPoint
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReorderSTList
	.type	ReorderSTList, %function
ReorderSTList:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	mov	w22, w3
	mov	x21, x4
	mov	w20, w2
	mov	x19, x1
	bl	_mcount
	mov	w1, w22
	mov	x0, x23
	bl	GetShortTermPicPoint
	ldr	w5, [x21]
	add	w2, w20, 1
	cmp	w2, w5
	ble	.L759
	mov	w1, w2
	.p2align 2
.L760:
	add	x5, x19, x1, sxtw 3
	ldr	x5, [x5, -8]
	str	x5, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w5, [x21]
	cmp	w5, w1
	blt	.L760
.L759:
	add	w1, w5, 1
	str	w1, [x21]
	str	x0, [x19, w5, sxtw 3]
	ldr	w0, [x21]
	cmp	w2, w0
	mov	w4, w0
	blt	.L758
	.p2align 2
.L768:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L762
	ldrb	w5, [x1, 1]
	cbnz	w5, .L763
	ldr	w5, [x1, 8]
	cmp	w22, w5
	beq	.L762
.L763:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L762:
	cmp	w2, w0
	bge	.L768
.L758:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	ReorderSTList, .-ReorderSTList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReorderLTList
	.type	ReorderLTList, %function
ReorderLTList:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	mov	w22, w3
	mov	x21, x4
	mov	w20, w2
	mov	x19, x1
	bl	_mcount
	mov	w1, w22
	mov	x0, x23
	bl	GetLongTermPicPoint
	ldr	w5, [x21]
	add	w2, w20, 1
	cmp	w2, w5
	ble	.L773
	mov	w1, w2
	.p2align 2
.L774:
	add	x5, x19, x1, sxtw 3
	ldr	x5, [x5, -8]
	str	x5, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w5, [x21]
	cmp	w5, w1
	blt	.L774
.L773:
	add	w1, w5, 1
	str	w1, [x21]
	str	x0, [x19, w5, sxtw 3]
	ldr	w0, [x21]
	cmp	w2, w0
	mov	w4, w0
	blt	.L772
	.p2align 2
.L784:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L776
	ldrb	w5, [x1, 1]
	cbz	w5, .L777
	ldr	w5, [x1, 4]
	cmp	w22, w5
	beq	.L776
.L777:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L776:
	cmp	w2, w0
	bge	.L784
.L772:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	ReorderLTList, .-ReorderLTList
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReorderRefPiclist
	.type	ReorderRefPiclist, %function
ReorderRefPiclist:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	x0, x30
	mov	x22, x1
	mov	w21, w3
	mov	x25, x4
	mov	x28, x5
	str	x6, [x29, 104]
	bl	_mcount
	add	x0, x20, 20480
	str	wzr, [x29, 124]
	ldrb	w1, [x0, 1585]
	ldr	w2, [x0, 1596]
	cbz	w1, .L790
	mov	w1, 2208
	ldr	w26, [x0, 1604]
	ldr	x3, [x20, 14968]
	mov	w23, 2
	umull	x0, w2, w1
	ldr	x2, [x20, 14960]
	lsl	w26, w26, 1
	add	x1, x3, x0
	mov	w0, 4000
	add	w26, w26, 1
	ldr	w1, [x1, 28]
	umull	x0, w1, w0
	add	x0, x2, x0
	ldr	w0, [x0, 2196]
	add	w0, w0, 4
	lsl	w23, w23, w0
.L800:
	cmn	w21, #2
	beq	.L789
	ldr	w3, [x25]
	cmp	w3, 3
	beq	.L789
	add	w24, w21, 1
	mov	w27, w26
	lsl	x24, x24, 2
	mov	x19, 0
	b	.L793
	.p2align 3
.L794:
	ldr	x3, [x29, 104]
	ldr	w3, [x3, x19]
	bl	ReorderLTList
	cmp	x24, x19
	add	x19, x19, 4
	beq	.L789
.L799:
	ldr	w3, [x25, x19]
	cmp	w3, 3
	beq	.L789
.L793:
	cmp	w3, 1
	add	x4, x29, 124
	mov	w2, w21
	mov	x1, x22
	mov	x0, x20
	bhi	.L794
	ldr	w0, [x28, x19]
	cbnz	w3, .L795
	mvn	w0, w0
	add	w27, w27, w0
	add	w0, w27, w23
	cmp	w27, wzr
	csel	w27, w0, w27, lt
.L796:
	cmp	w26, w27
	sub	w3, w27, w23
	csel	w3, w3, w27, lt
	add	x4, x29, 124
	mov	w2, w21
	mov	x1, x22
	mov	x0, x20
	bl	ReorderSTList
	cmp	x24, x19
	add	x19, x19, 4
	bne	.L799
.L789:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L795:
	add	w0, w0, 1
	add	w27, w27, w0
	cmp	w23, w27
	sub	w0, w27, w23
	csel	w27, w0, w27, le
	b	.L796
	.p2align 3
.L790:
	mov	w1, 2208
	ldr	w26, [x0, 1604]
	ldr	x3, [x20, 14968]
	mov	w23, 1
	umull	x0, w2, w1
	ldr	x2, [x20, 14960]
	add	x1, x3, x0
	mov	w0, 4000
	ldr	w1, [x1, 28]
	umull	x0, w1, w0
	add	x0, x2, x0
	ldr	w0, [x0, 2196]
	add	w0, w0, 4
	lsl	w23, w23, w0
	b	.L800
	.size	ReorderRefPiclist, .-ReorderRefPiclist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReorderListX
	.type	ReorderListX, %function
ReorderListX:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 20480
	bl	_mcount
	ldrb	w0, [x19, 1584]
	cmp	w0, 2
	beq	.L808
	ldrb	w1, [x19, 796]
	cbnz	w1, .L820
.L811:
	ldr	w1, [x19, 1640]
	cmp	w0, 1
	add	w0, w1, 1
	str	w0, [x19, 1628]
	bne	.L808
	ldrb	w0, [x19, 797]
	cbnz	w0, .L821
.L813:
	ldr	w0, [x19, 1644]
	add	w0, w0, 1
	str	w0, [x19, 1632]
.L808:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L820:
	add	x1, x20, 28672
	ldr	w3, [x19, 1640]
	mov	x0, x20
	add	x6, x19, 1328
	add	x5, x19, 1064
	add	x4, x19, 800
	add	x2, x19, 1628
	add	x1, x1, 32
	bl	ReorderRefPiclist
	ldrb	w0, [x19, 1584]
	b	.L811
	.p2align 3
.L821:
	add	x1, x20, 28672
	ldr	w3, [x19, 1644]
	add	x6, x19, 1456
	add	x5, x19, 1196
	add	x4, x19, 932
	add	x2, x19, 1632
	add	x1, x1, 296
	mov	x0, x20
	bl	ReorderRefPiclist
	b	.L813
	.size	ReorderListX, .-ReorderListX
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GenPiclistfromFrmlist
	.type	GenPiclistfromFrmlist, %function
GenPiclistfromFrmlist:
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
	cbnz	w23, .L844
	cmp	w21, 1
	ldr	x23, .LC90
	beq	.L884
.L824:
	cmp	w21, 2
	bne	.L833
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L835:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L833
.L885:
	cmp	w21, w22
	bcc	.L868
	b	.L840
	.p2align 3
.L836:
	add	w21, w21, 1
	cmp	w22, w21
	bls	.L840
.L868:
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 1, .L836
	add	x0, x0, 816
	blr	x23
	cbz	w0, .L836
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 816
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
.L840:
	cmp	w20, w22
	bcc	.L867
	b	.L835
	.p2align 3
.L841:
	add	w20, w20, 1
	cmp	w22, w20
	bls	.L835
.L867:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 0, .L841
	add	x0, x0, 768
	blr	x23
	cbz	w0, .L841
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	add	x0, x0, 768
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	bcc	.L885
.L833:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L844:
	cmp	w21, 1
	ldr	x23, .LC89
	bne	.L824
.L884:
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L825:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L833
	cmp	w20, w22
	bcc	.L866
	b	.L883
	.p2align 3
.L826:
	add	w20, w20, 1
	cmp	w20, w22
	bcs	.L883
.L866:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 0, .L826
	add	x0, x0, 768
	blr	x23
	cbz	w0, .L826
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	add	x0, x0, 768
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	.p2align 2
.L883:
	cmp	w21, w22
	bcs	.L825
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 1]
	tbnz	x1, 1, .L886
.L831:
	add	w21, w21, 1
	b	.L883
	.p2align 3
.L886:
	add	x0, x0, 816
	blr	x23
	cbz	w0, .L831
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 816
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	b	.L825
	.size	GenPiclistfromFrmlist, .-GenPiclistfromFrmlist
	.align	3
.LC89:
	.xword	IsLTRefFlg
	.align	3
.LC90:
	.xword	IsSTRefFlg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitListX
	.type	InitListX, %function
InitListX:
	stp	x29, x30, [sp, -480]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 20480
	add	x22, x19, 61440
	bl	_mcount
	ldrb	w0, [x20, 1584]
	cbnz	w0, .L888
	ldrb	w0, [x22, 2675]
	add	x21, x19, 24576
	cbnz	w0, .L1008
	ldr	w0, [x21, 3720]
	cbz	w0, .L955
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3505
	add	x0, x21, 3456
	add	x3, x19, x3, lsl 3
	b	.L894
	.p2align 3
.L893:
	cmp	x3, x0
	beq	.L892
.L894:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L893
	ldr	w2, [x1, 720]
	and	w2, w2, 16776960
	cmp	w2, 65536
	bne	.L893
	add	x2, x19, x23, uxtw 3
	add	x1, x1, 720
	cmp	x3, x0
	add	w23, w23, 1
	str	x1, [x2, 28704]
	bne	.L894
	.p2align 2
.L892:
	add	x0, x19, 28672
	ldr	x3, .LC91
	mov	w1, w23
	mov	w2, 8
	add	x0, x0, 32
	bl	qsort
	str	w23, [x20, 1628]
	ldr	w1, [x21, 3724]
	cbz	w1, .L956
	sub	w3, w1, #1
	add	x0, x21, 3584
	add	x3, x3, 3521
	mov	w21, w23
	add	x3, x19, x3, lsl 3
	b	.L897
	.p2align 3
.L896:
	cmp	x0, x3
	beq	.L1009
.L897:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L896
	ldr	w2, [x1, 720]
	and	w2, w2, 16776960
	cmp	w2, 256
	bne	.L896
	add	x2, x19, x21, uxtw 3
	add	x1, x1, 720
	cmp	x0, x3
	add	w21, w21, 1
	str	x1, [x2, 28704]
	bne	.L897
	.p2align 2
.L1009:
	sub	w1, w21, w23
.L895:
	uxtw	x0, w23
	ldr	x3, .LC92
	add	x0, x0, 3588
	mov	w2, 8
	add	x0, x19, x0, lsl 3
	bl	qsort
	str	w21, [x20, 1628]
	mov	w2, w21
	str	wzr, [x20, 1632]
	cbz	w2, .L1010
.L903:
	ldr	w0, [x20, 1640]
	mov	w1, 0
	str	wzr, [x20, 1632]
	add	w0, w0, 1
	cmp	w0, w2
	csel	w0, w0, w2, ls
	str	w0, [x20, 1628]
	cmp	w0, 32
	bhi	.L950
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w0, 33
	str	xzr, [x2, 28704]
	bne	.L948
	.p2align 2
.L949:
	cmp	w1, 32
	bhi	.L947
	.p2align 2
.L950:
	add	x0, x19, x1, uxtw 3
	add	w1, w1, 1
	cmp	w1, 33
	str	xzr, [x0, 28968]
	bne	.L950
.L947:
	mov	w0, 0
.L999:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 480
	ret
	.p2align 3
.L888:
	ldrb	w0, [x22, 2675]
	add	x21, x19, 24576
	cbz	w0, .L909
	ldr	w0, [x21, 3720]
	cbz	w0, .L1011
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3505
	add	x0, x21, 3456
	add	x3, x19, x3, lsl 3
	.p2align 2
.L928:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldrb	w1, [x2, 1]
	cbz	w1, .L927
	ldr	w4, [x2, 688]
	add	x1, x29, 480
	ldr	w5, [x22, 3380]
	add	x1, x1, x23, uxtw 3
	sub	x1, x1, #4096
	cmp	w5, w4
	blt	.L927
	add	w23, w23, 1
	str	x2, [x1, 3712]
.L927:
	cmp	x0, x3
	bne	.L928
	add	x26, x29, 96
	ldr	x3, .LC99
	mov	w2, 8
	mov	w1, w23
	mov	x0, x26
	bl	qsort
	ldr	w24, [x21, 3720]
	cbz	w24, .L929
.L953:
	sub	w1, w24, #1
	add	x0, x21, 3456
	add	x1, x1, 3505
	mov	w25, w23
	add	x1, x19, x1, lsl 3
	.p2align 2
.L931:
	ldr	x3, [x0]
	add	x0, x0, 8
	ldrb	w2, [x3, 1]
	cbz	w2, .L930
	ldr	w4, [x3, 688]
	add	x2, x29, 480
	ldr	w5, [x22, 3380]
	add	x2, x2, x25, uxtw 3
	sub	x2, x2, #4096
	cmp	w5, w4
	bge	.L930
	add	w25, w25, 1
	str	x3, [x2, 3712]
.L930:
	cmp	x0, x1
	bne	.L931
	sub	w24, w25, w23
	ldr	x3, .LC100
	mov	w2, 8
	mov	w1, w24
	add	x0, x26, x23, uxtw 3
	bl	qsort
	cbz	w23, .L932
.L952:
	mov	x0, 0
	.p2align 2
.L933:
	add	w1, w24, w0
	add	x3, x29, 480
	ldr	x2, [x26, x0, lsl 3]
	add	x0, x0, 1
	add	x1, x3, x1, lsl 3
	cmp	w23, w0
	str	x2, [x1, -256]
	bhi	.L933
.L932:
	cmp	w25, w23
	bls	.L934
	mov	w0, w23
	.p2align 2
.L935:
	add	x2, x29, 480
	sub	w1, w0, w23
	add	x2, x2, x0, uxtw 3
	add	x3, x29, 480
	sub	x2, x2, #4096
	add	x1, x3, x1, lsl 3
	add	w0, w0, 1
	cmp	w25, w0
	ldr	x2, [x2, 3712]
	str	x2, [x1, -256]
	bne	.L935
.L934:
	str	wzr, [x20, 1628]
	add	x23, x19, 28672
	str	wzr, [x20, 1632]
	add	x24, x23, 32
	add	x27, x20, 1628
	mov	x1, x26
	ldrb	w0, [x22, 2675]
	mov	w2, w25
	mov	w5, 0
	mov	x4, x27
	mov	x3, x24
	add	x23, x23, 296
	add	x26, x20, 1632
	bl	GenPiclistfromFrmlist
	ldrb	w0, [x22, 2675]
	mov	w2, w25
	mov	w5, 0
	mov	x4, x26
	mov	x3, x23
	add	x1, x29, 224
	add	x25, x29, 352
	bl	GenPiclistfromFrmlist
	ldr	w28, [x21, 3724]
	cbz	w28, .L936
	add	x21, x21, 3584
	mov	x0, 0
	add	x25, x29, 352
	.p2align 2
.L937:
	ldr	x1, [x21], 8
	str	x1, [x25, x0, lsl 3]
	add	x0, x0, 1
	cmp	w28, w0
	bhi	.L937
.L936:
	ldr	x3, .LC94
	mov	w2, 8
	mov	w1, w28
	mov	x0, x25
	bl	qsort
	ldrb	w0, [x22, 2675]
	mov	w5, 1
	mov	x4, x27
	mov	x3, x24
	mov	w2, w28
	mov	x1, x25
	bl	GenPiclistfromFrmlist
	ldrb	w0, [x22, 2675]
	mov	x4, x26
	mov	x3, x23
	mov	x1, x25
	mov	w5, 1
	mov	w2, w28
	bl	GenPiclistfromFrmlist
	ldr	w3, [x20, 1628]
	ldr	w4, [x20, 1632]
	cmp	w4, w3
	cset	w1, eq
.L926:
	cmp	w3, 1
	cset	w0, hi
	tst	w1, w0
	beq	.L938
	cbz	w3, .L939
	ldr	x6, [x19, 28704]
	ldr	x0, [x19, 28968]
	cmp	x6, x0
	bne	.L938
	sub	w0, w3, #1
	mov	x2, x19
	add	x0, x19, x0, lsl 3
.L941:
	cmp	x0, x2
	beq	.L943
	ldr	x5, [x2, 28712]
	add	x2, x2, 8
	ldr	x1, [x2, 28968]
	cmp	x5, x1
	beq	.L941
	.p2align 2
.L938:
	orr	w0, w3, w4
	cbz	w0, .L1012
	ldr	w0, [x20, 1640]
	ldr	w1, [x20, 1644]
	add	w0, w0, 1
	add	w1, w1, 1
	cmp	w0, w3
	csel	w0, w0, w3, ls
	cmp	w1, w4
	csel	w1, w1, w4, ls
	str	w0, [x20, 1628]
	cmp	w0, 32
	str	w1, [x20, 1632]
	bhi	.L949
	.p2align 2
.L948:
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w0, 33
	str	xzr, [x2, 28704]
	bne	.L948
	b	.L949
	.p2align 3
.L909:
	ldr	w0, [x21, 3720]
	cbz	w0, .L957
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3505
	add	x0, x21, 3456
	add	x3, x19, x3, lsl 3
	b	.L914
	.p2align 3
.L913:
	cmp	x0, x3
	beq	.L912
.L914:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L913
	ldr	w2, [x1, 732]
	add	x5, x19, x23, uxtw 3
	ldr	w4, [x22, 3384]
	add	x1, x1, 720
	cmp	w4, w2
	blt	.L913
	str	x1, [x5, 28704]
	cmp	x0, x3
	add	w23, w23, 1
	bne	.L914
	.p2align 2
.L912:
	add	x25, x19, 28672
	ldr	x3, .LC97
	mov	w2, 8
	mov	w1, w23
	add	x0, x25, 32
	bl	qsort
	ldr	w24, [x21, 3720]
	cbz	w24, .L915
	sub	w2, w24, #1
	add	x0, x21, 3456
	add	x2, x2, 3505
	mov	w26, w23
	add	x2, x19, x2, lsl 3
	b	.L917
	.p2align 3
.L916:
	cmp	x0, x2
	beq	.L1013
.L917:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 2]
	cmp	w3, 3
	bne	.L916
	ldr	w3, [x1, 732]
	add	x5, x19, x26, uxtw 3
	ldr	w4, [x22, 3384]
	add	x1, x1, 720
	cmp	w4, w3
	bge	.L916
	str	x1, [x5, 28704]
	cmp	x0, x2
	add	w26, w26, 1
	bne	.L917
	.p2align 2
.L1013:
	uxtw	x0, w23
	sub	w24, w26, w23
	add	x0, x0, 3588
	ldr	x3, .LC98
	uxtw	x22, w26
	mov	w2, 8
	add	x0, x19, x0, lsl 3
	mov	w1, w24
	add	x22, x22, 3588
	bl	qsort
	add	x22, x19, x22, lsl 3
	cbz	w23, .L919
.L951:
	add	x25, x25, 32
	mov	w0, 0
	.p2align 2
.L920:
	add	w1, w24, w0
	ldr	x2, [x25], 8
	add	x1, x1, 3621
	add	w0, w0, 1
	cmp	w0, w23
	str	x2, [x19, x1, lsl 3]
	bcc	.L920
.L919:
	cmp	w26, w23
	bls	.L921
	mov	w0, w23
	.p2align 2
.L922:
	sub	w1, w0, w23
	add	x2, x19, x0, uxtw 3
	add	x1, x1, 3621
	add	w0, w0, 1
	cmp	w0, w26
	ldr	x2, [x2, 28704]
	str	x2, [x19, x1, lsl 3]
	bne	.L922
.L921:
	str	w26, [x20, 1628]
	str	w26, [x20, 1632]
	ldr	w1, [x21, 3724]
	cbz	w1, .L958
	sub	w3, w1, #1
	add	x0, x21, 3584
	add	x3, x3, 3521
	mov	w21, w26
	add	x3, x19, x3, lsl 3
	b	.L925
	.p2align 3
.L924:
	cmp	x3, x0
	beq	.L1014
.L925:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cmp	w2, 3
	bne	.L924
	ldrb	w2, [x1, 721]
	cmp	w2, 1
	bne	.L924
	add	x2, x19, x21, uxtw 3
	add	x1, x1, 720
	cmp	x3, x0
	add	w21, w21, 1
	str	x1, [x2, 28704]
	str	x1, [x2, 28968]
	bne	.L925
	.p2align 2
.L1014:
	sub	w1, w21, w26
.L923:
	ldr	x23, .LC92
	mov	w2, 8
	mov	x0, x22
	mov	x3, x23
	bl	qsort
	ldr	w0, [x20, 1628]
	mov	x3, x23
	mov	w2, 8
	sub	w1, w21, w0
	uxtw	x0, w0
	add	x0, x0, 3621
	add	x0, x19, x0, lsl 3
	bl	qsort
	str	w21, [x20, 1628]
	mov	w4, w21
	mov	w3, w21
	mov	w1, 1
	str	w21, [x20, 1632]
	b	.L926
	.p2align 3
.L1008:
	ldr	w0, [x21, 3720]
	mov	w23, 0
	cbz	w0, .L891
	sub	w4, w0, #1
	mov	w23, 0
	add	x4, x4, 3505
	add	x0, x21, 3456
	add	x4, x19, x4, lsl 3
	.p2align 2
.L900:
	ldr	x2, [x0]
	add	x1, x29, 480
	add	x1, x1, x23, uxtw 3
	add	x0, x0, 8
	sub	x1, x1, #4096
	cmp	x4, x0
	ldrb	w3, [x2, 2]
	cbz	w3, .L899
	add	w23, w23, 1
	str	x2, [x1, 3712]
.L899:
	bne	.L900
.L891:
	ldr	x3, .LC93
	mov	w1, w23
	mov	w2, 8
	add	x0, x29, 96
	add	x24, x19, 28672
	add	x26, x20, 1628
	bl	qsort
	str	wzr, [x20, 1628]
	add	x24, x24, 32
	mov	w2, w23
	ldrb	w0, [x22, 2675]
	mov	w5, 0
	mov	x4, x26
	add	x1, x29, 96
	mov	x3, x24
	add	x25, x29, 352
	bl	GenPiclistfromFrmlist
	ldr	w23, [x21, 3724]
	cbz	w23, .L901
	add	x21, x21, 3584
	mov	x0, 0
	add	x25, x29, 352
	.p2align 2
.L902:
	ldr	x1, [x21], 8
	str	x1, [x25, x0, lsl 3]
	add	x0, x0, 1
	cmp	w23, w0
	bhi	.L902
.L901:
	ldr	x3, .LC94
	mov	w2, 8
	mov	w1, w23
	mov	x0, x25
	bl	qsort
	ldrb	w0, [x22, 2675]
	mov	w2, w23
	mov	w5, 1
	mov	x4, x26
	mov	x3, x24
	mov	x1, x25
	bl	GenPiclistfromFrmlist
	str	wzr, [x20, 1632]
	ldr	w2, [x20, 1628]
	cbnz	w2, .L903
.L1010:
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L904
	ldrb	w0, [x22, 2675]
	cbz	w0, .L1015
	cmp	w0, 1
	ldr	x0, [x22, 3352]
	beq	.L1016
	add	x0, x0, 816
	mov	w2, 1
	str	x0, [x19, 28704]
	b	.L903
	.p2align 3
.L1015:
	ldr	x0, [x22, 3352]
	mov	w2, 1
	add	x0, x0, 720
	str	x0, [x19, 28704]
	b	.L903
.L939:
	ldr	x6, [x19, 28968]
.L943:
	ldr	x0, [x19, 28976]
	str	x0, [x19, 28968]
	str	x6, [x19, 28976]
	b	.L938
.L1016:
	add	x0, x0, 768
	mov	w2, 1
	str	x0, [x19, 28704]
	b	.L903
.L1011:
	add	x26, x29, 96
	ldr	x3, .LC99
	mov	w2, 8
	mov	w1, 0
	mov	x0, x26
	mov	w23, 0
	bl	qsort
	ldr	w24, [x21, 3720]
	cbnz	w24, .L953
	ldr	x3, .LC100
	mov	w2, 8
	mov	w1, 0
	mov	x0, x26
	mov	w25, 0
	bl	qsort
	b	.L934
	.p2align 3
.L957:
	mov	w23, 0
	b	.L912
.L915:
	uxtw	x22, w23
	ldr	x3, .LC98
	add	x22, x22, 3588
	mov	w2, 8
	mov	w1, 0
	mov	w26, w23
	add	x22, x19, x22, lsl 3
	mov	x0, x22
	bl	qsort
	cbnz	w23, .L951
	b	.L921
	.p2align 3
.L958:
	mov	w21, w26
	b	.L923
.L956:
	mov	w21, w23
	b	.L895
.L955:
	mov	w23, 0
	b	.L892
.L929:
	ldr	x3, .LC100
	mov	w2, 8
	mov	w1, 0
	add	x0, x26, x23, uxtw 3
	mov	w25, w23
	bl	qsort
	cbnz	w23, .L952
	b	.L934
	.p2align 3
.L904:
	ldr	x1, .LC96
.L1004:
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	mov	w0, -1
	b	.L999
.L1012:
	ldr	x1, .LC102
	b	.L1004
	.size	InitListX, .-InitListX
	.align	3
.LC91:
	.xword	compare_pic_by_pic_num_desc
	.align	3
.LC92:
	.xword	compare_pic_by_lt_pic_num_asc
	.align	3
.LC93:
	.xword	compare_fs_by_frame_num_desc
	.align	3
.LC94:
	.xword	compare_fs_by_lt_pic_idx_asc
	.align	3
.LC96:
	.xword	.LC95
	.align	3
.LC97:
	.xword	compare_pic_by_poc_desc
	.align	3
.LC98:
	.xword	compare_pic_by_poc_asc
	.align	3
.LC99:
	.xword	compare_fs_by_poc_desc
	.align	3
.LC100:
	.xword	compare_fs_by_poc_asc
	.align	3
.LC102:
	.xword	.LC101
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DumpList
	.type	DumpList, %function
DumpList:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, .LC103
	ldr	w0, [x0]
	tbz	x0, 13, .L1017
	mov	x0, x19
	bl	DumpList.part.5
.L1017:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	DumpList, .-DumpList
	.align	3
.LC103:
	.xword	g_PrintEnable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindNearestPOCPicId
	.type	FindNearestPOCPicId, %function
FindNearestPOCPicId:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 24576
	ldr	w0, [x2, 3716]
	cbz	w0, .L1026
	add	x1, x19, 61440
	ldr	x3, [x19, 27904]
	cmp	w0, 1
	ldr	w7, [x1, 3380]
	ldr	w1, [x3, 688]
	sub	w1, w7, w1
	sxtw	x1, w1
	eor	x6, x1, x1, asr 63
	sub	x6, x6, x1, asr 63
	bls	.L1027
	sub	w0, w0, #2
	add	x2, x2, 3336
	add	x1, x0, 3490
	mov	w0, 0
	add	x5, x19, x1, lsl 3
	.p2align 2
.L1025:
	ldr	x4, [x2]
	add	x2, x2, 8
	ldr	w1, [x4, 688]
	sub	w1, w7, w1
	sxtw	x1, w1
	eor	x3, x1, x1, asr 63
	sub	x3, x3, x1, asr 63
	cmp	w3, w6
	bge	.L1024
	ldr	w0, [x4, 188]
	mov	w6, w3
.L1024:
	cmp	x2, x5
	bne	.L1025
.L1023:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1027:
	mov	w0, 0
	b	.L1023
.L1026:
	mov	w0, -1
	b	.L1023
	.size	FindNearestPOCPicId, .-FindNearestPOCPicId
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindMinRefIdx
	.type	FindMinRefIdx, %function
FindMinRefIdx:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	ldrb	w1, [x0, 1584]
	cmp	w1, 2
	beq	.L1029
	add	x1, x19, 61440
	ldrb	w1, [x1, 2675]
	cbnz	w1, .L1059
	add	x6, x19, 24576
	ldr	w5, [x0, 1628]
	add	x6, x6, 4000
	mov	w4, 0
	add	x7, x19, 28672
	.p2align 2
.L1033:
	cbz	w5, .L1037
	add	x1, x7, 32
	mov	w3, 32
	mov	w0, 0
	b	.L1035
	.p2align 3
.L1034:
	add	w0, w0, 1
	cmp	w0, w5
	beq	.L1060
.L1035:
	ldr	x2, [x1]
	add	x1, x1, 8
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 712]
	cmp	w2, w4
	bne	.L1034
	cmp	w3, w0
	csel	w3, w3, w0, ls
	add	w0, w0, 1
	stp	w3, w3, [x6]
	cmp	w0, w5
	bne	.L1035
.L1060:
	cmp	w3, 31
	bhi	.L1037
.L1036:
	add	w4, w4, 1
	add	x6, x6, 8
	cmp	w4, 16
	bne	.L1033
.L1029:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1059:
	ldr	w6, [x0, 1628]
	add	x7, x19, 24576
	add	x7, x7, 4000
	mov	w4, 0
	add	x8, x19, 28672
	cbz	w6, .L1041
	.p2align 2
.L1062:
	add	x2, x8, 32
	mov	w5, 32
	mov	w1, 0
	b	.L1039
	.p2align 3
.L1038:
	add	w1, w1, 1
	cmp	w1, w6
	beq	.L1061
.L1039:
	ldr	x0, [x2]
	add	x2, x2, 8
	ldr	x3, [x0, 40]
	ldrb	w0, [x0]
	cmp	w0, 2
	ldr	w0, [x3, 712]
	cset	w3, eq
	orr	w0, w3, w0, lsl 1
	cmp	w0, w4
	bne	.L1038
	cmp	w5, w1
	csel	w5, w5, w1, ls
	add	w1, w1, 1
	str	w5, [x7]
	cmp	w1, w6
	bne	.L1039
.L1061:
	cmp	w5, 31
	bhi	.L1041
.L1040:
	add	w4, w4, 1
	add	x7, x7, 4
	cmp	w4, 32
	beq	.L1029
	cbnz	w6, .L1062
	.p2align 2
.L1041:
	str	wzr, [x7]
	b	.L1040
	.p2align 3
.L1037:
	stp	wzr, wzr, [x6]
	b	.L1036
	.size	FindMinRefIdx, .-FindMinRefIdx
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecList
	.type	DecList, %function
DecList:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 24576
	mov	w7, -1
	ldr	w0, [x1, 3716]
	cbz	w0, .L1064
	add	x2, x19, 61440
	ldr	x3, [x19, 27904]
	cmp	w0, 1
	ldr	w6, [x2, 3380]
	ldr	w2, [x3, 688]
	sub	w2, w6, w2
	sxtw	x2, w2
	eor	x5, x2, x2, asr 63
	sub	x5, x5, x2, asr 63
	bls	.L1073
	sub	w4, w0, #2
	add	x1, x1, 3336
	add	x4, x4, 3490
	mov	w7, 0
	add	x4, x19, x4, lsl 3
	.p2align 2
.L1066:
	ldr	x3, [x1]
	add	x1, x1, 8
	ldr	w0, [x3, 688]
	sub	w0, w6, w0
	sxtw	x0, w0
	eor	x2, x0, x0, asr 63
	sub	x2, x2, x0, asr 63
	cmp	w2, w5
	bge	.L1065
	ldr	w7, [x3, 188]
	mov	w5, w2
.L1065:
	cmp	x1, x4
	bne	.L1066
.L1064:
	add	x20, x19, 20480
	mov	w21, -1
	ldrb	w0, [x20, 1584]
	str	w21, [x20, 3212]
	cmp	w0, 2
	str	w7, [x20, 3216]
	beq	.L1083
	mov	x0, x19
	bl	InitListX
	cbnz	w0, .L1084
	ldr	x1, .LC107
	mov	w0, 13
	bl	dprint_vfmw
	ldr	x22, .LC108
	ldr	w0, [x22]
	tbnz	x0, 13, .L1085
.L1070:
	mov	x0, x19
	bl	ReorderListX
	mov	x0, x19
	bl	RepairList
	cbnz	w0, .L1074
	mov	x0, x19
	bl	FindMinRefIdx
	ldr	x0, [x19, 28704]
	cbz	x0, .L1075
	ldr	x0, [x0, 40]
	ldr	w0, [x0, 188]
.L1071:
	ldr	x1, .LC110
	mov	w21, 0
	str	w0, [x20, 3212]
	mov	w0, 13
	bl	dprint_vfmw
	ldr	w0, [x22]
	tbz	x0, 13, .L1068
	mov	x0, x19
	bl	DumpList.part.5
.L1068:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1083:
	str	wzr, [x20, 1628]
	mov	w21, 0
	str	wzr, [x20, 1632]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1085:
	mov	x0, x19
	bl	DumpList.part.5
	b	.L1070
	.p2align 3
.L1075:
	mov	w0, -1
	b	.L1071
	.p2align 3
.L1074:
	mov	w21, -1
	b	.L1068
.L1073:
	mov	w7, 0
	b	.L1064
.L1084:
	ldr	x1, .LC105
	mov	w0, 13
	bl	dprint_vfmw
	b	.L1068
	.size	DecList, .-DecList
	.align	3
.LC105:
	.xword	.LC104
	.align	3
.LC107:
	.xword	.LC106
	.align	3
.LC108:
	.xword	g_PrintEnable
	.align	3
.LC110:
	.xword	.LC109
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	NoPicOut
	.type	NoPicOut, %function
NoPicOut:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 65536
	ldr	w0, [x1, 1332]
	cbz	w0, .L1093
	sub	w2, w0, #1
	mov	w4, 872
	mov	x3, 30108
	add	x0, x19, 28672
	add	x0, x0, 564
	umaddl	x3, w2, w4, x3
	add	x3, x19, x3
	b	.L1092
	.p2align 3
.L1100:
	ldrb	w2, [x0]
	cmp	w2, 1
	beq	.L1090
	add	x0, x0, 872
	cmp	x0, x3
	beq	.L1093
.L1092:
	ldr	w2, [x0, 688]
	cmp	w2, 1
	bne	.L1100
.L1090:
	strb	wzr, [x0, -3]
	strb	wzr, [x0, -2]
	add	x0, x0, 872
	cmp	x0, x3
	bne	.L1092
.L1093:
	ldr	w0, [x1, 1336]
	cbz	w0, .L1086
	sub	w0, w0, #1
	add	x1, x1, 1264
	add	x0, x0, 16384
	add	x0, x0, 317
	add	x0, x19, x0, lsl 2
	.p2align 2
.L1094:
	str	wzr, [x1], 4
	cmp	x1, x0
	bne	.L1094
.L1086:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	NoPicOut, .-NoPicOut
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetBackPicFromVOQueue
	.type	GetBackPicFromVOQueue, %function
GetBackPicFromVOQueue:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x24, x0
	mov	x0, x30
	add	x22, x24, 65536
	bl	_mcount
	ldr	w0, [x22, 2820]
	bl	FSP_GetFspType
	cbz	w0, .L1118
.L1102:
	ldr	w0, [x22, 1332]
	mov	w23, 0
	mov	w20, 872
	cbz	w0, .L1109
	.p2align 2
.L1113:
	uxtw	x1, w23
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 3
	sub	x0, x0, x1
	lsl	x0, x0, 1
	sub	x0, x0, x1
	umull	x21, w23, w20
	add	x0, x24, x0, lsl 3
	add	x0, x0, 28672
	add	x21, x21, 28672
	add	x19, x21, 1168
	add	x21, x21, 1200
	add	x19, x24, x19
	add	x21, x24, x21
	strb	wzr, [x0, 561]
	strb	wzr, [x0, 562]
.L1107:
	ldr	x1, [x19]
	cbnz	x1, .L1119
.L1106:
	add	x19, x19, 8
	cmp	x19, x21
	bne	.L1107
	ldr	w0, [x22, 1332]
	add	w23, w23, 1
	cmp	w0, w23
	bhi	.L1113
.L1109:
	ldr	w0, [x22, 1336]
	cbz	w0, .L1101
	sub	w1, w0, #1
	add	x0, x22, 1264
	add	x1, x1, 16384
	add	x1, x1, 317
	add	x24, x24, x1, lsl 2
	.p2align 2
.L1110:
	str	wzr, [x0], 4
	cmp	x0, x24
	bne	.L1110
.L1101:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1119:
	ldr	w0, [x22, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L1106
.L1118:
	add	x0, x24, 8
	bl	ResetVoQueue
	b	.L1102
	.size	GetBackPicFromVOQueue, .-GetBackPicFromVOQueue
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	wait_vo
	.type	wait_vo, %function
wait_vo:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	wait_vo, .-wait_vo
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetReRangeFlag
	.type	GetReRangeFlag, %function
GetReRangeFlag:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	mov	w19, 4000
	bl	_mcount
	add	x1, x21, 20480
	mov	w0, 2208
	ldr	x5, [x21, 14968]
	ldr	x2, [x21, 14960]
	ldr	w1, [x1, 1596]
	ldr	w4, [x21, 14932]
	ldr	w3, [x21, 14936]
	umull	x0, w1, w0
	mov	w1, 2
	add	x0, x5, x0
	ldr	w0, [x0, 28]
	umull	x0, w0, w19
	add	x19, x2, x0
	ldrb	w0, [x19, 18]
	ldr	w5, [x19, 3252]
	sub	w0, w1, w0
	ldr	w2, [x19, 3248]
	madd	w0, w5, w0, w0
	add	w1, w2, 1
	cmp	w4, w1
	ccmp	w3, w0, 0, eq
	bne	.L1122
	add	x6, x21, 24576
	ldr	w5, [x19, 3272]
	mov	w2, 0
	ldr	w6, [x6, 3712]
	add	w6, w6, 1
	cmp	w5, w6
	bls	.L1123
.L1122:
	ldr	x2, .LC111
	ldr	x6, [x2]
	cbz	x6, .L1126
	add	x5, x21, 65536
	ubfiz	w2, w1, 4, 12
	ubfiz	w3, w3, 4, 12
	ubfiz	w1, w0, 4, 12
	ubfiz	w4, w4, 4, 12
	strh	w3, [x29, 58]
	ldr	w0, [x5, 2820]
	mov	w3, 8
	strh	w2, [x29, 60]
	add	x2, x29, 56
	strh	w1, [x29, 62]
	mov	w1, 2
	strh	w4, [x29, 56]
	blr	x6
.L1126:
	ldr	w5, [x19, 3272]
	mov	w2, 1
.L1123:
	add	x1, x21, 16384
	ldr	w3, [x19, 36]
	ldr	w4, [x21, 15012]
	mov	w0, w2
	ldr	w1, [x1, 1864]
	cmp	w4, w3
	ccmp	w1, w5, 0, eq
	cset	w1, ne
	orr	w1, w2, w1
	str	w1, [x20]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.size	GetReRangeFlag, .-GetReRangeFlag
	.align	3
.LC111:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecPOC
	.type	DecPOC, %function
DecPOC:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	mov	w2, 2208
	ldr	x6, [x19, 14968]
	mov	w1, 4000
	ldr	x5, [x19, 14960]
	mov	w4, 1
	ldr	w3, [x0, 1596]
	ldrb	w7, [x0, 1587]
	umull	x2, w3, w2
	add	x2, x6, x2
	ldr	w2, [x2, 28]
	umull	x1, w2, w1
	add	x1, x5, x1
	ldr	w3, [x1, 2200]
	ldr	w2, [x1, 2196]
	cmp	w3, w4
	add	w2, w2, 4
	lsl	w2, w4, w2
	beq	.L1129
	cbz	w3, .L1130
	cmp	w3, 2
	bne	.L1127
	cmp	w7, 5
	beq	.L1184
	ldr	w1, [x0, 728]
	cbz	w1, .L1163
	ldr	w1, [x0, 768]
	mov	w3, 0
	mov	w2, 0
	str	wzr, [x0, 764]
	str	wzr, [x0, 776]
.L1164:
	str	w2, [x0, 772]
.L1166:
	ldr	w4, [x0, 1616]
	add	w2, w1, w2
	str	w2, [x0, 760]
	lsl	w1, w2, 1
	cbnz	w4, .L1167
	sub	w1, w1, #1
	str	w1, [x0, 748]
.L1168:
	ldrb	w2, [x0, 1585]
	cbnz	w2, .L1169
	str	w1, [x0, 736]
	str	w1, [x0, 740]
	str	w1, [x0, 744]
.L1162:
	ldr	w1, [x0, 768]
	str	w1, [x0, 764]
	str	w3, [x0, 776]
.L1127:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1130:
	ldr	w1, [x1, 2204]
	cmp	w7, 5
	add	w1, w1, 4
	lsl	w4, w4, w1
	beq	.L1136
	ldr	w1, [x0, 728]
	cbnz	w1, .L1134
	ldr	w5, [x0, 712]
	ldr	w3, [x0, 716]
	mov	w2, w5
.L1135:
	ldr	w1, [x0, 704]
	cmp	w1, w3
	bcs	.L1133
	sub	w6, w3, w1
	cmp	w6, w4, lsr 1
	bcc	.L1133
	add	w2, w2, w4
	str	w2, [x0, 720]
.L1137:
	ldrb	w3, [x0, 1585]
	cbnz	w3, .L1139
.L1187:
	ldr	w3, [x0, 708]
	add	w1, w1, w2
	str	w1, [x0, 736]
	add	w2, w1, w3
	str	w2, [x0, 740]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 748]
.L1140:
	ldr	w3, [x0, 764]
	ldr	w2, [x0, 768]
	str	w1, [x0, 744]
	cmp	w2, w3
	beq	.L1142
	str	w2, [x0, 764]
.L1142:
	ldr	w1, [x0, 1616]
	cbz	w1, .L1127
	ldr	w2, [x0, 704]
	ldr	w1, [x0, 720]
	str	w1, [x0, 712]
	str	w2, [x0, 716]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1129:
	cmp	w7, 5
	beq	.L1185
	ldr	w3, [x0, 728]
	cbz	w3, .L1145
	mov	w2, 0
	str	wzr, [x0, 764]
	str	wzr, [x0, 776]
.L1146:
	str	w2, [x0, 772]
.L1144:
	ldr	w2, [x1, 2216]
	cbz	w2, .L1148
	ldr	w2, [x0, 768]
	ldr	w5, [x0, 772]
	ldr	w6, [x0, 1616]
	add	w5, w5, w2
	str	w5, [x0, 760]
	cbnz	w6, .L1150
	cbz	w5, .L1151
	sub	w5, w5, #1
	str	w5, [x0, 760]
.L1150:
	str	wzr, [x0, 792]
	ldr	w2, [x1, 2216]
	cmp	w2, wzr
	ble	.L1152
.L1171:
	mov	w4, 0
	mov	w3, 0
	.p2align 2
.L1153:
	add	x2, x1, x3, sxtw 2
	add	w3, w3, 1
	ldr	w2, [x2, 2220]
	add	w4, w4, w2
	str	w4, [x0, 792]
	ldr	w2, [x1, 2216]
	cmp	w2, w3
	bgt	.L1153
.L1152:
	cbz	w5, .L1154
	sub	w5, w5, #1
	ldr	w7, [x0, 792]
	udiv	w2, w5, w2
	str	w2, [x0, 784]
	ldr	w4, [x1, 2216]
	udiv	w3, w5, w4
	mul	w2, w2, w7
	str	w2, [x0, 788]
	msub	w5, w3, w4, w5
	str	w5, [x0, 780]
	tbnz	w5, #31, .L1155
	mov	w3, 0
	.p2align 2
.L1156:
	add	x4, x1, x3, sxtw 2
	add	w3, w3, 1
	cmp	w5, w3
	ldr	w4, [x4, 2220]
	add	w2, w2, w4
	str	w2, [x0, 788]
	bge	.L1156
.L1155:
	cbnz	w6, .L1157
	ldr	w3, [x1, 2208]
	add	w2, w2, w3
	str	w2, [x0, 788]
.L1157:
	ldrb	w3, [x0, 1585]
	cbnz	w3, .L1158
	ldr	w3, [x0, 752]
	ldr	w4, [x0, 756]
	add	w2, w2, w3
	str	w2, [x0, 736]
	ldr	w1, [x1, 2212]
	add	w1, w2, w1
	add	w1, w1, w4
	str	w1, [x0, 740]
	cmp	w2, w1
	csel	w2, w2, w1, le
	str	w2, [x0, 748]
.L1159:
	ldr	w3, [x0, 768]
	ldr	w1, [x0, 772]
	str	w2, [x0, 744]
	str	w3, [x0, 764]
	str	w1, [x0, 776]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1134:
	ldr	w5, [x0, 732]
	cbz	w5, .L1186
.L1136:
	ldr	w1, [x0, 704]
	mov	w2, 0
	mov	w5, 0
	str	wzr, [x0, 712]
	str	wzr, [x0, 716]
.L1133:
	cmp	w1, w3
	bls	.L1138
	sub	w3, w1, w3
	cmp	w3, w4, lsr 1
	bls	.L1138
	sub	w2, w2, w4
	str	w2, [x0, 720]
	b	.L1137
	.p2align 3
.L1184:
	add	x1, x0, 512
	mov	w3, 0
	stp	wzr, wzr, [x1, 224]
	stp	wzr, wzr, [x1, 232]
	str	wzr, [x0, 772]
	b	.L1162
	.p2align 3
.L1185:
	str	wzr, [x0, 772]
	b	.L1144
	.p2align 3
.L1138:
	ldrb	w3, [x0, 1585]
	str	w5, [x0, 720]
	cbz	w3, .L1187
.L1139:
	ldrb	w3, [x0, 1586]
	add	w1, w1, w2
	cbnz	w3, .L1141
	str	w1, [x0, 736]
	str	w1, [x0, 748]
	b	.L1140
	.p2align 3
.L1148:
	ldr	w6, [x0, 1616]
	str	wzr, [x0, 760]
.L1151:
	str	wzr, [x0, 792]
	mov	w5, 0
	ldr	w2, [x1, 2216]
	cmp	w2, wzr
	bgt	.L1171
	.p2align 2
.L1154:
	mov	w2, 0
	str	wzr, [x0, 788]
	b	.L1155
	.p2align 3
.L1158:
	ldrb	w3, [x0, 1586]
	cbnz	w3, .L1160
	ldr	w1, [x0, 752]
	add	w2, w2, w1
	str	w2, [x0, 736]
	str	w2, [x0, 748]
	b	.L1159
	.p2align 3
.L1163:
	ldr	w3, [x0, 764]
	ldr	w1, [x0, 768]
	cmp	w1, w3
	ldr	w3, [x0, 776]
	bcs	.L1165
	add	w2, w2, w3
	str	w2, [x0, 772]
	mov	w3, w2
	b	.L1166
	.p2align 3
.L1145:
	ldr	w3, [x0, 764]
	ldr	w4, [x0, 768]
	cmp	w4, w3
	bcs	.L1147
	ldr	w3, [x0, 776]
	add	w2, w3, w2
	str	w2, [x0, 772]
	b	.L1144
	.p2align 3
.L1169:
	ldrb	w2, [x0, 1586]
	str	w1, [x0, 744]
	cbnz	w2, .L1170
	str	w1, [x0, 736]
	b	.L1162
	.p2align 3
.L1167:
	str	w1, [x0, 748]
	b	.L1168
	.p2align 3
.L1141:
	str	w1, [x0, 740]
	str	w1, [x0, 748]
	b	.L1140
	.p2align 3
.L1160:
	ldr	w3, [x1, 2212]
	ldr	w1, [x0, 752]
	add	w2, w2, w3
	add	w2, w2, w1
	str	w2, [x0, 740]
	str	w2, [x0, 748]
	b	.L1159
	.p2align 3
.L1186:
	ldr	w3, [x0, 736]
	mov	w2, 0
	str	wzr, [x0, 712]
	str	w3, [x0, 716]
	b	.L1135
	.p2align 3
.L1170:
	str	w1, [x0, 740]
	b	.L1162
.L1147:
	ldr	w2, [x0, 776]
	b	.L1146
.L1165:
	mov	w2, w3
	b	.L1164
	.size	DecPOC, .-DecPOC
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CalcPicNum
	.type	CalcPicNum, %function
CalcPicNum:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x2, x19, 20480
	mov	w1, 2208
	ldr	x4, [x19, 14968]
	mov	w0, 4000
	ldr	x3, [x19, 14960]
	add	x6, x19, 61440
	ldr	w2, [x2, 1596]
	mov	w7, 1
	umull	x1, w2, w1
	ldrb	w2, [x6, 2675]
	add	x1, x4, x1
	ldr	w1, [x1, 28]
	umull	x0, w1, w0
	add	x0, x3, x0
	ldr	w0, [x0, 2196]
	add	w0, w0, 4
	lsl	w7, w7, w0
	add	x0, x19, 24576
	cbz	w2, .L1189
	cmp	w2, 1
	mov	w1, 0
	cset	w8, eq
	cmp	w2, 2
	ldr	w2, [x0, 3720]
	cset	w9, eq
	cbz	w2, .L1209
	.p2align 2
.L1226:
	add	x3, x19, x1, uxtw 3
	ldr	x2, [x3, 28032]
	ldrb	w4, [x2, 2]
	cbz	w4, .L1203
	ldr	w4, [x2, 676]
	ldr	w5, [x6, 3368]
	cmp	w4, w5
	bls	.L1204
	sub	w4, w4, w7
	str	w4, [x2, 680]
.L1205:
	ldr	x2, [x3, 28032]
	ldrb	w4, [x2, 2]
	tbz	x4, 0, .L1206
	ldr	w5, [x2, 768]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L1236
.L1206:
	tbz	x4, 1, .L1203
	ldr	w3, [x2, 816]
	and	w3, w3, 16776960
	cmp	w3, 65536
	beq	.L1237
	.p2align 2
.L1203:
	ldr	w2, [x0, 3720]
	add	w1, w1, 1
	cmp	w2, w1
	bhi	.L1226
.L1209:
	ldr	w2, [x0, 3724]
	mov	w1, 0
	cbz	w2, .L1188
	.p2align 2
.L1225:
	add	x4, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x3, [x4, 28160]
	ldrb	w2, [x3, 2]
	cbz	w2, .L1211
	tbz	x2, 0, .L1212
	ldr	w5, [x3, 768]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L1238
.L1212:
	tbz	x2, 1, .L1211
	ldr	w2, [x3, 816]
	and	w2, w2, 16776960
	cmp	w2, 256
	beq	.L1239
	.p2align 2
.L1211:
	ldr	w2, [x0, 3724]
	cmp	w2, w1
	bhi	.L1225
.L1188:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1204:
	str	w4, [x2, 680]
	b	.L1205
	.p2align 3
.L1189:
	ldr	w2, [x0, 3720]
	mov	w1, 0
	cbnz	w2, .L1224
	.p2align 2
.L1199:
	ldr	w2, [x0, 3724]
	mov	w1, 0
	cbz	w2, .L1188
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x2, [x2, 28160]
	ldrb	w3, [x2, 2]
	cmp	w3, 3
	beq	.L1240
	.p2align 2
.L1200:
	ldr	w2, [x0, 3724]
	cmp	w2, w1
	bls	.L1188
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x2, [x2, 28160]
	ldrb	w3, [x2, 2]
	cmp	w3, 3
	bne	.L1200
.L1240:
	ldr	w3, [x2, 720]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L1200
	ldr	w3, [x2, 684]
	str	w3, [x2, 724]
	b	.L1200
	.p2align 3
.L1242:
	ldr	w4, [x2, 720]
	and	w4, w4, 16776960
	cmp	w4, 65536
	bne	.L1195
	ldr	w4, [x2, 676]
	ldr	w5, [x6, 3368]
	cmp	w4, w5
	sub	w5, w4, w7
	bhi	.L1241
	str	w4, [x2, 680]
.L1197:
	ldr	x2, [x3, 28032]
	ldr	w3, [x2, 680]
	str	w3, [x2, 728]
	.p2align 2
.L1195:
	ldr	w2, [x0, 3720]
	add	w1, w1, 1
	cmp	w2, w1
	bls	.L1199
.L1224:
	add	x3, x19, x1, uxtw 3
	ldr	x2, [x3, 28032]
	ldrb	w4, [x2, 2]
	cmp	w4, 3
	bne	.L1195
	b	.L1242
	.p2align 3
.L1238:
	ldr	w2, [x3, 684]
	add	w2, w8, w2, lsl 1
	str	w2, [x3, 772]
	ldr	x3, [x4, 28160]
	ldrb	w2, [x3, 2]
	b	.L1212
	.p2align 3
.L1236:
	ldr	w4, [x2, 680]
	add	w4, w8, w4, lsl 1
	str	w4, [x2, 776]
	ldr	x2, [x3, 28032]
	ldrb	w4, [x2, 2]
	b	.L1206
	.p2align 3
.L1239:
	ldr	w2, [x3, 684]
	add	w2, w9, w2, lsl 1
	str	w2, [x3, 820]
	b	.L1211
	.p2align 3
.L1237:
	ldr	w3, [x2, 680]
	add	w3, w9, w3, lsl 1
	str	w3, [x2, 824]
	b	.L1203
	.p2align 3
.L1241:
	str	w5, [x2, 680]
	b	.L1197
	.size	CalcPicNum, .-CalcPicNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsOutDPB
	.type	IsOutDPB, %function
IsOutDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x20, x1
	mov	x0, x30
	bl	_mcount
	cbz	x20, .L1248
	add	x0, x19, 24576
	ldr	w3, [x0, 3716]
	cbz	w3, .L1248
	ldr	x0, [x19, 27904]
	cmp	x20, x0
	beq	.L1250
	sub	w3, w3, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1245
	.p2align 3
.L1246:
	ldr	x2, [x0, 27904]
	cmp	x20, x2
	beq	.L1250
.L1245:
	cmp	x0, x3
	add	x0, x0, 8
	bne	.L1246
.L1248:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1250:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	IsOutDPB, .-IsOutDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WriteCurrPicYUV
	.type	WriteCurrPicYUV, %function
WriteCurrPicYUV:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 61440
	bl	_mcount
	ldr	x1, .LC113
	mov	w0, 2
	ldr	x3, [x19, 3352]
	ldrb	w20, [x19, 2675]
	ldr	w3, [x3, 188]
	mov	w2, w20
	bl	dprint_vfmw
	cmp	w20, 3
	ldr	w3, [x19, 3408]
	ccmp	w20, wzr, 4, ne
	ldr	w4, [x19, 3412]
	cset	w0, eq
	ldr	x1, .LC115
	cmp	w0, wzr
	mov	w2, 1
	csinc	w2, w2, w20, ne
	mov	w0, 22
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	WriteCurrPicYUV, .-WriteCurrPicYUV
	.align	3
.LC113:
	.xword	.LC112
	.align	3
.LC115:
	.xword	.LC114
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WritePicMsg
	.type	WritePicMsg, %function
WritePicMsg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 61440
	add	x20, x19, 65536
	bl	_mcount
	add	x21, x19, 12288
	ldr	x1, .LC117
	mov	w0, 2
	ldrb	w3, [x22, 2675]
	add	x24, x19, 16384
	ldr	w4, [x22, 2868]
	ldr	w2, [x22, 3376]
	ldr	w5, [x22, 3428]
	bl	dprint_vfmw
	str	wzr, [x20, 2744]
	ldr	x2, [x20, 2736]
	ldr	x1, [x22, 3328]
	str	x1, [x20, 1408]
	add	x1, x19, 20480
	str	x2, [x20, 2456]
	ldr	w2, [x22, 2852]
	str	w2, [x20, 2236]
	ldr	w2, [x22, 2856]
	str	w2, [x20, 2240]
	ldr	w2, [x22, 2860]
	str	w2, [x20, 2244]
	ldr	w2, [x22, 3376]
	str	w2, [x20, 1416]
	ldrb	w2, [x22, 2675]
	strb	w2, [x20, 1400]
	ldrb	w2, [x21, 2707]
	str	w2, [x20, 1432]
	ldr	w2, [x22, 3412]
	str	w2, [x20, 1420]
	ldr	w2, [x22, 3416]
	str	w2, [x20, 1424]
	ldr	w2, [x21, 5936]
	add	w2, w2, 1
	str	w2, [x20, 1428]
	ldrb	w2, [x21, 2706]
	strb	w2, [x20, 1403]
	ldr	w2, [x24, 2652]
	str	w2, [x20, 1436]
	ldrb	w2, [x24, 2592]
	str	w2, [x20, 1440]
	ldr	w0, [x21, 2728]
	strb	w0, [x20, 1401]
	ldrb	w0, [x24, 2596]
	str	w0, [x20, 1444]
	ldr	w0, [x1, 748]
	str	w0, [x20, 1448]
	ldr	w0, [x20, 2820]
	ldr	w2, [x1, 736]
	str	w2, [x20, 1452]
	ldr	w1, [x1, 740]
	str	w1, [x20, 1456]
	ldr	x1, [x22, 3352]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cbz	x0, .L1288
	ldr	x2, [x0, 680]
	ldr	x3, [x0, 688]
	cbz	x2, .L1258
	cbz	x3, .L1258
	ldr	w0, [x20, 2820]
	add	x3, x20, 1836
	add	x2, x20, 1708
	add	x1, x20, 2096
	bl	FSP_GetDecFsAddrTab
	ldr	x3, [x23, 680]
	add	x2, x20, 2100
	ldr	w0, [x20, 2820]
	add	x1, x20, 2228
	ldr	w3, [x3, 8]
	str	w3, [x20, 1692]
	bl	FSP_GetPmvAddrTab
	ldr	w0, [x22, 3428]
	add	x22, x19, 24576
	str	w0, [x20, 1700]
	ldr	w0, [x23, 708]
	str	w0, [x20, 2232]
	ldr	x0, [x23, 688]
	ldr	w0, [x0, 16]
	str	w0, [x20, 1696]
	ldr	x0, [x23, 688]
	ldr	w0, [x0, 76]
	str	w0, [x20, 1704]
	ldr	w4, [x22, 3992]
	str	w4, [x20, 2448]
	cbz	w4, .L1264
	sub	w3, w4, #1
	add	x0, x22, 3800
	add	x3, x3, 4096
	add	x1, x20, 2256
	add	x3, x3, 2999
	add	x3, x19, x3, lsl 2
	.p2align 2
.L1263:
	ldr	w2, [x0]
	add	x0, x0, 4
	str	w2, [x1]
	add	x1, x1, 4
	cmp	x3, x0
	ldr	w2, [x0, 60]
	str	w2, [x1, 60]
	ldr	w2, [x0, 124]
	str	w2, [x1, 124]
	bne	.L1263
.L1264:
	ldrb	w0, [x21, 2713]
	cbnz	w0, .L1289
	ldrb	w0, [x24, 2610]
	cbnz	w0, .L1265
	ldr	x10, .LC122
	add	x5, x20, 1460
	mov	w1, 0
	.p2align 2
.L1266:
	and	w0, w1, 3
	add	w1, w1, 1
	cmp	w1, 24
	ldr	w0, [x10, w0, uxtw 2]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1266
	add	x6, x20, 1556
	mov	w5, 0
	.p2align 2
.L1267:
	add	w0, w5, 1
	and	w2, w5, 14
	add	x1, x10, 16
	and	w0, w0, 15
	add	x6, x6, 8
	add	w5, w5, 2
	cmp	w5, 32
	ldr	w0, [x1, w0, uxtw 2]
	ldr	w1, [x1, w2, uxtw 2]
	lsr	w8, w0, 16
	ubfx	x2, x0, 8, 8
	lsr	w3, w1, 16
	lsr	w7, w1, 24
	ubfiz	w11, w0, 16, 8
	ubfiz	w9, w3, 8, 8
	and	w0, w0, -16777216
	and	w3, w1, 255
	ubfx	x1, x1, 8, 8
	orr	w0, w0, w2, lsl 16
	orr	w8, w11, w8, lsl 24
	orr	w3, w9, w3
	orr	w1, w1, w7, lsl 8
	orr	w2, w8, w3
	orr	w0, w1, w0
	stp	w2, w0, [x6, -8]
	bne	.L1267
.L1273:
	mov	w23, 0
	cbz	w4, .L1269
	.p2align 2
.L1277:
	add	x21, x19, x23, uxtw 2
	ldr	w0, [x20, 2820]
	add	x24, x21, 24576
	mov	w1, 0
	add	x21, x21, 65536
	add	w23, w23, 1
	ldr	w2, [x24, 3800]
	bl	FSP_GetStoreType
	cmp	w0, wzr
	cset	w0, ne
	str	w0, [x21, 2592]
	ldr	w0, [x24, 3800]
	str	w0, [x21, 2656]
	ldr	w0, [x22, 3992]
	cmp	w0, w23
	bhi	.L1277
.L1269:
	mov	w0, 0
.L1256:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1289:
	ldrb	w0, [x24, 2610]
.L1265:
	cmp	w0, 1
	add	x5, x20, 1460
	mov	w1, 0
	beq	.L1271
	.p2align 2
.L1274:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 4096
	cmp	w1, 24
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 564]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1274
	add	x6, x20, 1556
	mov	w10, 1
	mov	w5, 0
	.p2align 2
.L1275:
	ubfx	x1, x5, 3, 29
	ubfiz	x0, x5, 1, 3
	and	x2, x10, 15
	lsl	x1, x1, 4
	add	x2, x1, x2
	add	x1, x1, x0
	add	x1, x1, 4096
	add	x0, x2, 4096
	add	x6, x6, 8
	add	w5, w5, 1
	add	x0, x19, x0, lsl 2
	add	x1, x19, x1, lsl 2
	cmp	w5, 16
	add	w10, w10, 2
	ldr	w0, [x0, 660]
	ldr	w1, [x1, 660]
	lsr	w3, w0, 16
	ubfx	x8, x0, 8, 8
	lsr	w9, w1, 16
	lsr	w7, w1, 24
	ubfiz	w12, w0, 16, 8
	ubfiz	w11, w9, 8, 8
	ubfx	x2, x1, 8, 8
	and	w9, w1, 255
	lsl	w7, w7, 8
	and	w1, w0, -16777216
	orr	w0, w2, w1
	orr	w3, w12, w3, lsl 24
	orr	w9, w11, w9
	orr	w7, w7, w8, lsl 16
	orr	w1, w9, w3
	orr	w0, w7, w0
	stp	w1, w0, [x6, -8]
	bne	.L1275
	b	.L1273
	.p2align 3
.L1271:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 4096
	cmp	w1, 24
	add	x0, x0, 1144
	ldr	w0, [x19, x0, lsl 2]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1271
	add	x6, x20, 1556
	mov	w10, 1
	mov	w5, 0
	.p2align 2
.L1272:
	ubfx	x1, x5, 3, 29
	ubfiz	x0, x5, 1, 3
	and	x2, x10, 15
	lsl	x1, x1, 4
	add	x2, x1, x2
	add	x1, x1, x0
	add	x1, x1, 4096
	add	x0, x2, 4096
	add	x0, x0, 1168
	add	x1, x1, 1168
	add	x6, x6, 8
	add	w5, w5, 1
	cmp	w5, 16
	add	w10, w10, 2
	ldr	w0, [x19, x0, lsl 2]
	ldr	w1, [x19, x1, lsl 2]
	lsr	w9, w0, 16
	ubfx	x8, x0, 8, 8
	lsr	w3, w1, 16
	lsr	w7, w1, 24
	ubfiz	w12, w0, 16, 8
	ubfiz	w11, w3, 8, 8
	ubfx	x2, x1, 8, 8
	and	w3, w1, 255
	lsl	w7, w7, 8
	and	w1, w0, -16777216
	orr	w0, w2, w1
	orr	w9, w12, w9, lsl 24
	orr	w3, w11, w3
	orr	w7, w7, w8, lsl 16
	orr	w1, w9, w3
	orr	w0, w7, w0
	stp	w1, w0, [x6, -8]
	bne	.L1272
	b	.L1273
.L1258:
	ldr	x1, .LC121
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1256
.L1288:
	ldr	x2, [x22, 3352]
	mov	w0, 0
	ldr	x1, .LC119
	ldr	w2, [x2, 672]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1256
	.size	WritePicMsg, .-WritePicMsg
	.align	3
.LC117:
	.xword	.LC116
	.align	3
.LC119:
	.xword	.LC118
	.align	3
.LC121:
	.xword	.LC120
	.align	3
.LC122:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	UpdatePicQpInf
	.type	UpdatePicQpInf, %function
UpdatePicQpInf:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	w20, w0
	mov	x19, x1
	mov	x0, x30
	bl	_mcount
	ldp	w1, w0, [x19, 24]
	cmp	w1, w20
	csel	w1, w1, w20, ge
	cmp	w0, w20
	csel	w0, w0, w20, le
	stp	w1, w0, [x19, 24]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	UpdatePicQpInf, .-UpdatePicQpInf
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WriteSliceMsg
	.type	WriteSliceMsg, %function
WriteSliceMsg:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x23, x0
	mov	x0, x30
	add	x21, x23, 65536
	bl	_mcount
	ldr	w5, [x21, 2744]
	ldr	x6, [x21, 2736]
	add	w0, w5, 1
	str	w0, [x21, 2744]
	uxtw	x22, w5
	ldr	w1, [x23, 14940]
	lsl	x4, x22, 7
	sub	x4, x4, x22
	sub	w1, w1, #1
	lsl	x4, x4, 5
	cmp	w5, w1
	add	x20, x6, x4
	bcs	.L1292
	lsl	x1, x0, 7
	sub	x0, x1, x0
	add	x0, x6, x0, lsl 5
	str	x0, [x20, 4056]
.L1293:
	ldr	x3, [x23, 632]
	ldrb	w2, [x3]
	ldr	w0, [x3, 76]
	cmp	w2, 1
	ccmp	w2, w0, 2, ls
	bcs	.L1294
	.p2align 2
.L1295:
	uxtw	x0, w2
	add	w2, w2, 1
	lsl	x1, x0, 5
	add	x3, x3, x1
	add	x0, x20, x0, lsl 2
	ldr	w3, [x3, 28]
	str	w3, [x0, 16]
	ldr	x3, [x23, 632]
	add	x3, x3, x1
	ldr	w3, [x3, 24]
	str	w3, [x0, 8]
	ldr	x3, [x23, 632]
	add	x1, x3, x1
	ldr	w1, [x1, 32]
	str	w1, [x0, 24]
	ldr	x3, [x23, 632]
	ldr	w0, [x3, 76]
	cmp	w0, w2
	ccmp	w2, 1, 2, hi
	bls	.L1295
.L1294:
	cmp	w0, 1
	bhi	.L1300
	.p2align 2
.L1374:
	add	x1, x20, x0, uxtw 2
	add	w0, w0, 1
	cmp	w0, 2
	str	wzr, [x1, 8]
	str	wzr, [x1, 16]
	str	wzr, [x1, 24]
	bne	.L1374
.L1300:
	add	x19, x23, 61440
	add	x24, x23, 16384
	add	x2, x24, 2592
	add	x28, x23, 20480
	add	x1, x23, 12288
	ldrb	w0, [x19, 2681]
	strb	w0, [x20, 1]
	ldr	w0, [x2, 48]
	ldr	w3, [x28, 3196]
	add	w0, w0, 26
	add	w0, w0, w3
	str	w0, [x20, 32]
	ldr	w3, [x28, 3192]
	str	w3, [x20, 36]
	ldr	w3, [x28, 1644]
	str	w3, [x20, 40]
	ldr	w3, [x28, 1640]
	str	w3, [x20, 44]
	ldrb	w3, [x28, 1584]
	strb	w3, [x6, x4]
	ldr	w3, [x28, 1636]
	str	w3, [x20, 48]
	ldrb	w3, [x28, 1590]
	strb	w3, [x20, 2]
	ldrb	w1, [x1, 2708]
	strb	w1, [x20, 3]
	ldr	w1, [x28, 1628]
	str	w1, [x20, 52]
	ldr	w1, [x28, 1632]
	str	w1, [x20, 56]
	ldrb	w1, [x28, 1584]
	cmp	w1, 1
	beq	.L1399
	cbz	w1, .L1400
	strb	wzr, [x20, 4]
.L1301:
	ldr	w2, [x24, 2644]
	str	w2, [x20, 60]
	ldr	w1, [x24, 2648]
	str	w1, [x20, 64]
	ldr	w1, [x28, 3204]
	str	w1, [x20, 68]
	ldr	w1, [x28, 3208]
	str	w1, [x20, 72]
	ldr	w1, [x28, 3200]
	str	w1, [x20, 76]
	ldrb	w1, [x28, 1585]
	cbnz	w1, .L1303
	ldr	x2, [x19, 3352]
	ldr	w3, [x21, 2744]
	ldr	w1, [x2, 716]
	madd	w0, w5, w1, w0
	udiv	w0, w0, w3
	str	w0, [x2, 752]
.L1304:
	ldr	x0, [x19, 3352]
	cbnz	w5, .L1306
	ldr	w1, [x20, 32]
	str	w1, [x0, 744]
	ldr	x0, [x19, 3352]
	ldr	w1, [x20, 32]
	str	w1, [x0, 748]
.L1307:
	ldrb	w0, [x28, 1584]
	cmp	w0, 2
	beq	.L1345
	ldr	w0, [x28, 1628]
	cbz	w0, .L1348
	ldr	x1, [x23, 28704]
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1311
	sub	w3, w0, #1
	mov	x0, x23
	add	x3, x23, x3, lsl 3
	b	.L1313
	.p2align 3
.L1315:
	ldr	x1, [x0, 28712]
	add	x0, x0, 8
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1311
.L1313:
	cmp	x3, x0
	bne	.L1315
.L1348:
	mov	w25, 0
.L1310:
	ldr	w0, [x28, 1632]
	cbz	w0, .L1349
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1317
	sub	w3, w0, #1
	mov	x0, x23
	add	x3, x23, x3, lsl 3
	b	.L1319
	.p2align 3
.L1321:
	ldr	x1, [x0, 28976]
	add	x0, x0, 8
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1317
.L1319:
	cmp	x3, x0
	bne	.L1321
.L1349:
	str	wzr, [x29, 108]
.L1316:
	ldrb	w0, [x19, 2675]
	cbz	w0, .L1322
	ldr	w0, [x28, 1628]
	mov	w26, 0
	cbnz	w0, .L1373
	b	.L1338
	.p2align 3
.L1402:
	cbz	x0, .L1355
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1334:
	lsl	x0, x19, 5
	add	x0, x0, x19, lsl 2
	add	x0, x20, x0
	str	w1, [x0, 1640]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 712]
	str	w1, [x0, 1644]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 688]
	str	w1, [x0, 1632]
	ldr	x1, [x27, 28704]
	ldrb	w1, [x1]
	strb	w1, [x0, 1624]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1, 720]
	strb	w1, [x0, 1626]
	ldr	x1, [x27, 28704]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1401
	strb	w1, [x0, 1630]
	add	w26, w26, 1
	ldr	x1, [x27, 28704]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1631]
	ldr	x1, [x27, 28704]
	ldr	w1, [x1, 12]
	str	w1, [x0, 1656]
	ldr	w0, [x28, 1628]
	cmp	w0, w26
	bls	.L1338
.L1373:
	uxtw	x19, w26
	ldr	w0, [x21, 2820]
	add	x27, x23, x19, lsl 3
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	ldr	x3, [x27, 28704]
	lsl	x1, x19, 5
	add	x1, x1, x19, lsl 2
	add	x1, x20, x1
	ldr	x3, [x3, 40]
	ldr	w3, [x3, 708]
	str	w3, [x1, 1636]
	ldr	x3, [x27, 28704]
	ldr	x3, [x3, 40]
	ldrb	w3, [x3, 1]
	strb	w3, [x1, 1625]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1402
	mov	w1, w25
	b	.L1334
	.p2align 3
.L1292:
	str	xzr, [x20, 4056]
	b	.L1293
	.p2align 3
.L1400:
	ldrb	w1, [x2, 2]
	strb	w1, [x20, 4]
	b	.L1301
	.p2align 3
.L1401:
	strb	w1, [x0, 1628]
	add	w26, w26, 1
	ldr	x1, [x27, 28704]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1629]
	ldr	x1, [x27, 28704]
	ldr	w1, [x1, 12]
	str	w1, [x0, 1652]
	ldr	w0, [x28, 1628]
	cmp	w0, w26
	bhi	.L1373
.L1338:
	ldrb	w0, [x28, 1584]
	cmp	w0, 1
	beq	.L1403
.L1325:
	add	x1, x23, 24576
	add	x0, x20, 3928
	add	x1, x1, 4000
	add	x3, x20, 4056
	.p2align 2
.L1331:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L1331
	ldrb	w0, [x24, 2594]
	str	w0, [x21, 1684]
	ldr	w1, [x24, 2636]
	str	w1, [x21, 1688]
	cbz	w0, .L1343
	ldrb	w0, [x28, 1584]
	cbnz	w0, .L1343
.L1344:
	ldr	w0, [x28, 1648]
	mov	w2, 0
	str	w0, [x20, 80]
	ldr	w0, [x28, 1652]
	str	w0, [x20, 84]
	.p2align 2
.L1346:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x23, x0
	add	x0, x20, x0
	add	x1, x1, 20480
	ldr	w3, [x1, 1656]
	str	w3, [x0, 88]
	ldr	w3, [x1, 1784]
	str	w3, [x0, 216]
	ldr	w3, [x1, 1912]
	str	w3, [x0, 344]
	ldr	w3, [x1, 2424]
	str	w3, [x0, 856]
	ldr	w3, [x1, 2552]
	str	w3, [x0, 984]
	ldr	w1, [x1, 2680]
	str	w1, [x0, 1112]
	ldr	w0, [x28, 1640]
	cmp	w0, w2
	bcs	.L1346
	ldrb	w0, [x28, 1584]
	cmp	w0, 1
	beq	.L1404
	.p2align 2
.L1345:
	add	x22, x22, 8192
	ldr	x0, [x23, 632]
	add	x22, x22, 22
	str	x0, [x23, x22, lsl 3]
	str	xzr, [x23, 632]
.L1291:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1306:
	ldr	w2, [x20, 32]
	ldr	w1, [x0, 744]
	cmp	w1, w2
	csel	w1, w1, w2, ge
	str	w1, [x0, 744]
	ldr	w1, [x0, 748]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 748]
	b	.L1307
	.p2align 3
.L1303:
	ldrb	w1, [x28, 1586]
	ldr	w3, [x21, 2744]
	ldr	x2, [x19, 3352]
	cbnz	w1, .L1305
	ldr	w1, [x2, 716]
	madd	w0, w5, w1, w0
	udiv	w0, w0, w3
	str	w0, [x2, 800]
	b	.L1304
	.p2align 3
.L1355:
	mov	w1, 0
	b	.L1334
	.p2align 3
.L1311:
	ldr	w1, [x1, 672]
	ldr	w0, [x21, 2820]
	bl	FSP_GetLogicFs
	cbz	x0, .L1405
	ldr	x0, [x0, 680]
	ldr	w25, [x0, 8]
	b	.L1310
	.p2align 3
.L1343:
	cmp	w1, 1
	bne	.L1345
	ldrb	w0, [x28, 1584]
	cmp	w0, 1
	bne	.L1345
	b	.L1344
	.p2align 3
.L1322:
	ldr	w0, [x28, 1628]
	mov	w26, 0
	cbnz	w0, .L1372
	b	.L1330
	.p2align 3
.L1406:
	cbz	x0, .L1351
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1328:
	lsl	x0, x19, 5
	add	w26, w26, 1
	add	x0, x0, x19, lsl 2
	add	x0, x20, x0
	str	w1, [x0, 1640]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 712]
	str	w1, [x0, 1644]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 688]
	str	w1, [x0, 1632]
	ldr	x1, [x27, 28704]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1627]
	ldr	x1, [x27, 28704]
	ldrb	w1, [x1]
	strb	w1, [x0, 1626]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 732]
	str	w1, [x0, 1648]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 780]
	str	w1, [x0, 1652]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 828]
	str	w1, [x0, 1656]
	strb	wzr, [x0, 1624]
	ldr	w0, [x28, 1628]
	cmp	w0, w26
	bls	.L1330
.L1372:
	uxtw	x19, w26
	ldr	w0, [x21, 2820]
	add	x27, x23, x19, lsl 3
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	ldr	x3, [x27, 28704]
	lsl	x1, x19, 5
	add	x1, x1, x19, lsl 2
	add	x1, x20, x1
	ldr	x3, [x3, 40]
	ldr	w3, [x3, 708]
	str	w3, [x1, 1636]
	ldr	x3, [x27, 28704]
	ldr	x3, [x3, 40]
	ldrb	w3, [x3, 1]
	strb	w3, [x1, 1625]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1406
	mov	w1, w25
	b	.L1328
	.p2align 3
.L1351:
	mov	w1, 0
	b	.L1328
	.p2align 3
.L1330:
	ldrb	w0, [x28, 1584]
	cmp	w0, 1
	bne	.L1325
	ldr	w0, [x28, 1632]
	cbz	w0, .L1325
	mov	w27, 0
	b	.L1333
	.p2align 3
.L1407:
	cbz	x0, .L1353
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1332:
	lsl	x0, x19, 5
	add	w27, w27, 1
	add	x0, x0, x19, lsl 2
	add	x0, x20, x0
	str	w1, [x0, 1640]
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 712]
	str	w1, [x0, 2796]
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 688]
	str	w1, [x0, 2784]
	ldr	x1, [x25, 28968]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2779]
	ldr	x1, [x25, 28968]
	ldrb	w1, [x1]
	strb	w1, [x0, 2778]
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 732]
	str	w1, [x0, 2800]
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 780]
	str	w1, [x0, 2804]
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 828]
	str	w1, [x0, 2808]
	strb	wzr, [x0, 2776]
	ldr	w0, [x28, 1632]
	cmp	w0, w27
	bls	.L1325
.L1333:
	uxtw	x19, w27
	ldr	w0, [x21, 2820]
	add	x25, x23, x19, lsl 3
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w2, [x1, 708]
	lsl	x1, x19, 5
	add	x1, x1, x19, lsl 2
	add	x1, x20, x1
	str	w2, [x1, 2788]
	ldr	x2, [x25, 28968]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 2777]
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1407
	ldr	w1, [x29, 108]
	b	.L1332
	.p2align 3
.L1317:
	ldr	w1, [x1, 672]
	ldr	w0, [x21, 2820]
	bl	FSP_GetLogicFs
	cbz	x0, .L1408
	ldr	x0, [x0, 680]
	ldr	w0, [x0, 8]
	str	w0, [x29, 108]
	b	.L1316
	.p2align 3
.L1399:
	ldr	w1, [x2, 44]
	strb	w1, [x20, 4]
	b	.L1301
	.p2align 3
.L1305:
	ldr	w1, [x2, 716]
	madd	w0, w5, w1, w0
	udiv	w0, w0, w3
	str	w0, [x2, 848]
	b	.L1304
.L1404:
	mov	w2, 0
	.p2align 2
.L1347:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x23, x0
	add	x0, x20, x0
	add	x1, x1, 20480
	ldr	w3, [x1, 2040]
	str	w3, [x0, 472]
	ldr	w3, [x1, 2168]
	str	w3, [x0, 600]
	ldr	w3, [x1, 2296]
	str	w3, [x0, 728]
	ldr	w3, [x1, 2808]
	str	w3, [x0, 1240]
	ldr	w3, [x1, 2936]
	str	w3, [x0, 1368]
	ldr	w1, [x1, 3064]
	str	w1, [x0, 1496]
	ldr	w0, [x28, 1644]
	cmp	w0, w2
	bcs	.L1347
	b	.L1345
.L1353:
	mov	w1, 0
	b	.L1332
.L1403:
	ldr	w0, [x28, 1632]
	cbz	w0, .L1325
	mov	w27, 0
	b	.L1342
	.p2align 3
.L1410:
	cbz	x0, .L1357
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1339:
	lsl	x0, x19, 5
	add	x0, x0, x19, lsl 2
	add	x0, x20, x0
	str	w1, [x0, 2792]
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 712]
	str	w1, [x0, 2796]
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 688]
	str	w1, [x0, 2784]
	ldr	x1, [x25, 28968]
	ldrb	w1, [x1]
	strb	w1, [x0, 2776]
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1, 720]
	strb	w1, [x0, 2778]
	ldr	x1, [x25, 28968]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1409
	strb	w1, [x0, 2782]
	ldr	x1, [x25, 28968]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2783]
	ldr	x1, [x25, 28968]
	ldr	w1, [x1, 12]
	str	w1, [x0, 2808]
.L1341:
	ldr	w0, [x28, 1632]
	add	w27, w27, 1
	cmp	w0, w27
	bls	.L1325
.L1342:
	uxtw	x19, w27
	ldr	w0, [x21, 2820]
	add	x25, x23, x19, lsl 3
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldr	w2, [x1, 708]
	lsl	x1, x19, 5
	add	x1, x1, x19, lsl 2
	add	x1, x20, x1
	str	w2, [x1, 2788]
	ldr	x2, [x25, 28968]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 2777]
	ldr	x1, [x25, 28968]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1410
	ldr	w1, [x29, 108]
	b	.L1339
	.p2align 3
.L1409:
	strb	w1, [x0, 2780]
	ldr	x1, [x25, 28968]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2781]
	ldr	x1, [x25, 28968]
	ldr	w1, [x1, 12]
	str	w1, [x0, 2804]
	b	.L1341
.L1357:
	mov	w1, 0
	b	.L1339
.L1405:
	ldr	x1, .LC125
	mov	w2, 7594
	bl	dprint_vfmw
	b	.L1291
.L1408:
	ldr	x1, .LC125
	mov	w2, 7615
	bl	dprint_vfmw
	b	.L1291
	.size	WriteSliceMsg, .-WriteSliceMsg
	.align	3
.LC125:
	.xword	.LC124
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	StopPicNum
	.type	StopPicNum, %function
StopPicNum:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	ldp	x29, x30, [sp], 16
	ret
	.size	StopPicNum, .-StopPicNum
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_GetPicStreamSize
	.type	H264_GetPicStreamSize, %function
H264_GetPicStreamSize:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 65536
	bl	_mcount
	mov	w0, 0
	ldr	x2, [x19, 2456]
	cbz	x2, .L1413
	.p2align 2
.L1414:
	ldp	w3, w1, [x2, 8]
	ldr	x2, [x2, 4056]
	add	w1, w3, w1
	add	w1, w1, 7
	add	w0, w0, w1, lsr 3
	cbnz	x2, .L1414
.L1413:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_GetPicStreamSize, .-H264_GetPicStreamSize
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SliceCheck
	.type	SliceCheck, %function
SliceCheck:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 20480
	add	x20, x19, 65536
	bl	_mcount
	ldr	x1, .LC127
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1636]
	ldr	w1, [x20, 2760]
	cbnz	w1, .L1427
	mov	w1, 262143
	cmp	w0, w1
	bhi	.L1428
	ldr	w1, [x19, 14932]
	ldr	w2, [x19, 14936]
	mul	w1, w1, w2
	sub	w1, w1, #1
	cmp	w0, w1
	bhi	.L1427
	ldr	x1, .LC131
	mov	x0, x19
	bl	ue_v
	mov	w2, w0
	ldr	x1, .LC133
	mov	w19, w0
	mov	w0, 19
	bl	dprint_vfmw
	ldr	w0, [x20, 2760]
	cbnz	w0, .L1427
	cmp	w19, 9
	bls	.L1429
	ldr	x1, .LC136
	mov	w2, w19
	mov	w0, 1
	bl	dprint_vfmw
.L1427:
	mov	w0, -1
.L1419:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1429:
	ldr	x0, .LC134
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1424
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1424:
	.section	.rodata
	.align	0
	.align	2
.L1424:
	.byte	(.L1423 - .Lrtx1424) / 4
	.byte	(.L1425 - .Lrtx1424) / 4
	.byte	(.L1426 - .Lrtx1424) / 4
	.byte	(.L1423 - .Lrtx1424) / 4
	.byte	(.L1426 - .Lrtx1424) / 4
	.byte	(.L1423 - .Lrtx1424) / 4
	.byte	(.L1425 - .Lrtx1424) / 4
	.byte	(.L1426 - .Lrtx1424) / 4
	.byte	(.L1423 - .Lrtx1424) / 4
	.byte	(.L1426 - .Lrtx1424) / 4
	.text
	.p2align 3
.L1423:
	strb	wzr, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1426:
	mov	w1, 2
	strb	w1, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1425:
	mov	w1, 1
	strb	w1, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1428:
	ldr	x1, .LC129
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1419
	.size	SliceCheck, .-SliceCheck
	.align	3
.LC127:
	.xword	.LC126
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
.LC134:
	.xword	.L1424
	.align	3
.LC136:
	.xword	.LC135
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PPSSPSCheck
	.type	PPSSPSCheck, %function
PPSSPSCheck:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 20480
	bl	_mcount
	ldr	x1, .LC138
	mov	w0, 19
	ldr	w2, [x20, 1596]
	bl	dprint_vfmw
	ldr	w2, [x20, 1596]
	mov	w0, 2208
	ldr	x1, [x19, 14968]
	umull	x0, w2, w0
	add	x0, x1, x0
	ldrb	w1, [x0, 19]
	cbz	w1, .L1434
	ldr	w2, [x0, 28]
	mov	w1, 4000
	ldr	x3, [x19, 14960]
	mov	w0, 0
	umull	x1, w2, w1
	add	x1, x3, x1
	ldrb	w1, [x1, 23]
	cbz	w1, .L1435
.L1432:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1434:
	ldr	x1, .LC140
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1432
	.p2align 3
.L1435:
	ldr	x1, .LC142
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1432
	.size	PPSSPSCheck, .-PPSSPSCheck
	.align	3
.LC138:
	.xword	.LC137
	.align	3
.LC140:
	.xword	.LC139
	.align	3
.LC142:
	.xword	.LC141
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PPSSPSCheckTmpId
	.type	PPSSPSCheckTmpId, %function
PPSSPSCheckTmpId:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	ldr	x1, .LC144
	mov	w2, w20
	mov	w0, 19
	bl	dprint_vfmw
	mov	w0, 2208
	ldr	x1, [x19, 14968]
	umull	x0, w20, w0
	add	x0, x1, x0
	ldrb	w1, [x0, 19]
	cbz	w1, .L1441
	ldr	w1, [x19, 14944]
	ldr	w2, [x0, 28]
	sub	w0, w1, #1
	cmp	w2, w0
	bhi	.L1442
	mov	w1, 4000
	ldr	x3, [x19, 14960]
	mov	w0, 0
	umull	x1, w2, w1
	add	x1, x3, x1
	ldrb	w1, [x1, 23]
	cbz	w1, .L1443
.L1438:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1441:
	ldr	x1, .LC146
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1438
	.p2align 3
.L1442:
	ldr	x1, .LC148
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1438
	.p2align 3
.L1443:
	ldr	x1, .LC150
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1438
	.size	PPSSPSCheckTmpId, .-PPSSPSCheckTmpId
	.align	3
.LC144:
	.xword	.LC143
	.align	3
.LC146:
	.xword	.LC145
	.align	3
.LC148:
	.xword	.LC147
	.align	3
.LC150:
	.xword	.LC149
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsNewPic
	.type	IsNewPic, %function
IsNewPic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 20480
	ldr	w2, [x19, 15012]
	ldr	w0, [x1, 1596]
	ldr	w3, [x1, 3240]
	ldr	w6, [x1, 3236]
	cmp	w3, w0
	ldr	w5, [x1, 3248]
	ldr	w0, [x1, 1604]
	ccmp	w6, w2, 0, eq
	ldrb	w4, [x1, 1585]
	cset	w2, ne
	ldrb	w3, [x1, 3232]
	cmp	w5, w0
	ccmp	w3, w4, 0, eq
	cset	w0, ne
	cmp	w4, wzr
	ccmp	w3, wzr, 4, ne
	orr	w2, w2, w0
	beq	.L1446
	ldrb	w0, [x1, 1586]
	ldrb	w3, [x1, 3233]
	cmp	w3, w0
	cset	w0, ne
	orr	w2, w2, w0
.L1446:
	ldr	w3, [x1, 1616]
	ldr	w0, [x1, 3244]
	cmp	w0, w3
	beq	.L1451
	cmp	w3, wzr
	ccmp	w0, wzr, 4, ne
	cset	w0, eq
.L1447:
	ldrb	w4, [x1, 3234]
	ldrb	w3, [x1, 1587]
	cmp	w4, w3
	cset	w5, ne
	cmp	w4, 5
	ccmp	w3, 5, 0, eq
	orr	w2, w5, w2
	orr	w2, w2, w0
	beq	.L1455
.L1448:
	add	x19, x19, 16384
	ldr	w0, [x19, 792]
	cbnz	w0, .L1449
	ldr	w4, [x1, 704]
	ldr	w5, [x1, 3256]
	ldr	w0, [x1, 708]
	ldr	w3, [x1, 3260]
	cmp	w5, w4
	ccmp	w3, w0, 0, eq
	cset	w0, ne
	orr	w2, w2, w0
.L1450:
	ldr	w3, [x1, 1636]
	mov	w0, 19
	ldr	x1, .LC152
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
.L1449:
	cmp	w0, 1
	bne	.L1450
	ldr	w4, [x1, 752]
	ldr	w5, [x1, 3264]
	ldr	w0, [x1, 756]
	ldr	w3, [x1, 3268]
	cmp	w5, w4
	ccmp	w3, w0, 0, eq
	cset	w0, ne
	orr	w2, w2, w0
	b	.L1450
	.p2align 3
.L1451:
	mov	w0, 0
	b	.L1447
	.p2align 3
.L1455:
	ldr	w0, [x1, 1624]
	ldr	w3, [x1, 3252]
	cmp	w3, w0
	cset	w0, ne
	orr	w2, w2, w0
	b	.L1448
	.size	IsNewPic, .-IsNewPic
	.align	3
.LC152:
	.xword	.LC151
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ref_pic_list_reordering
	.type	ref_pic_list_reordering, %function
ref_pic_list_reordering:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 20480
	mov	w23, 1
	bl	_mcount
	mov	w1, 2208
	ldr	x5, [x19, 14968]
	ldr	w2, [x20, 1596]
	mov	w0, 4000
	ldr	x4, [x19, 14960]
	ldrb	w3, [x20, 1585]
	umull	x1, w2, w1
	add	x1, x5, x1
	ldr	w1, [x1, 28]
	strb	wzr, [x20, 796]
	strb	wzr, [x20, 797]
	umull	x0, w1, w0
	add	x0, x4, x0
	ldr	w0, [x0, 2196]
	cbz	w3, .L1457
	add	w0, w0, 5
	add	x22, x19, 65536
	lsl	w23, w23, w0
	ldrb	w0, [x20, 1584]
	cmp	w0, 1
	bls	.L1508
.L1507:
	ldr	w3, [x22, 2760]
.L1475:
	cmp	w3, wzr
	csetm	w0, ne
.L1506:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1457:
	add	w0, w0, 4
	add	x22, x19, 65536
	lsl	w23, w23, w0
	ldrb	w0, [x20, 1584]
	cmp	w0, 1
	bhi	.L1507
.L1508:
	ldr	x1, .LC154
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 796]
	cbz	w0, .L1466
	ldr	w0, [x20, 1640]
	cmn	w0, #2
	beq	.L1489
	ldr	x24, .LC156
	mov	w27, 0
	ldr	x26, .LC164
	ldr	x25, .LC160
	b	.L1472
	.p2align 3
.L1467:
	cmp	w0, 2
	beq	.L1509
.L1470:
	ldr	w0, [x20, 1640]
	add	w0, w0, 2
	cmp	w0, w27
	bls	.L1510
.L1472:
	add	x21, x19, x27, uxtw 2
	mov	x1, x24
	add	x21, x21, 20480
	mov	x0, x19
	add	w27, w27, 1
	bl	ue_v
	cmp	w0, 3
	str	w0, [x21, 800]
	ldr	w3, [x22, 2760]
	bhi	.L1463
	cbnz	w3, .L1463
	beq	.L1466
	cmp	w0, 1
	bhi	.L1467
	mov	x1, x25
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1064]
	cmp	w23, w0
	ldr	w3, [x22, 2760]
	bls	.L1469
	cbz	w3, .L1470
.L1469:
	ldr	x1, .LC162
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1506
	.p2align 3
.L1466:
	ldrb	w0, [x20, 1584]
.L1459:
	cmp	w0, 1
	bne	.L1507
	ldr	x1, .LC168
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 797]
	cbz	w0, .L1507
	ldr	w0, [x20, 1644]
	cmn	w0, #2
	beq	.L1507
	ldr	x24, .LC170
	mov	w27, 0
	ldr	x26, .LC178
	ldr	x25, .LC174
	b	.L1487
	.p2align 3
.L1481:
	cmp	w0, 2
	beq	.L1511
	ldr	w0, [x20, 1644]
	add	w0, w0, 2
	cmp	w27, w0
	beq	.L1488
.L1486:
	add	w27, w27, 1
	cmp	w27, w0
	bcs	.L1507
.L1487:
	add	x21, x19, x27, uxtw 2
	mov	x1, x24
	add	x21, x21, 20480
	mov	x0, x19
	bl	ue_v
	cmp	w0, 3
	str	w0, [x21, 932]
	ldr	w3, [x22, 2760]
	bhi	.L1479
	cbnz	w3, .L1479
	beq	.L1475
	cmp	w0, 1
	bhi	.L1481
	mov	x1, x25
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1196]
	cmp	w23, w0
	ldr	w3, [x22, 2760]
	bls	.L1483
	cbnz	w3, .L1483
.L1484:
	ldr	w0, [x20, 1644]
	add	w0, w0, 2
	cmp	w0, w27
	bne	.L1486
	ldr	w1, [x21, 932]
	cmp	w1, 3
	beq	.L1486
.L1488:
	ldr	x1, .LC180
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1506
	.p2align 3
.L1509:
	mov	x1, x26
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1328]
	b	.L1470
	.p2align 3
.L1511:
	mov	x1, x26
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1456]
	b	.L1484
	.p2align 3
.L1463:
	ldr	x1, .LC158
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1506
	.p2align 3
.L1479:
	ldr	x1, .LC172
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1506
	.p2align 3
.L1510:
	bne	.L1466
.L1461:
	uxtw	x0, w27
	add	x0, x0, 4096
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 4896]
	cmp	w0, 3
	bne	.L1473
	ldrb	w0, [x20, 1584]
	add	x22, x19, 65536
	b	.L1459
.L1483:
	ldr	x1, .LC176
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1506
.L1489:
	mov	w27, 0
	b	.L1461
.L1473:
	ldr	x1, .LC166
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1506
	.size	ref_pic_list_reordering, .-ref_pic_list_reordering
	.align	3
.LC154:
	.xword	.LC153
	.align	3
.LC156:
	.xword	.LC155
	.align	3
.LC158:
	.xword	.LC157
	.align	3
.LC160:
	.xword	.LC159
	.align	3
.LC162:
	.xword	.LC161
	.align	3
.LC164:
	.xword	.LC163
	.align	3
.LC166:
	.xword	.LC165
	.align	3
.LC168:
	.xword	.LC167
	.align	3
.LC170:
	.xword	.LC169
	.align	3
.LC172:
	.xword	.LC171
	.align	3
.LC174:
	.xword	.LC173
	.align	3
.LC176:
	.xword	.LC175
	.align	3
.LC178:
	.xword	.LC177
	.align	3
.LC180:
	.xword	.LC179
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	pred_weight_table
	.type	pred_weight_table, %function
pred_weight_table:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x26, x0
	mov	x0, x30
	add	x21, x26, 20480
	mov	w24, 2208
	bl	_mcount
	mov	w20, 4000
	ldr	x2, [x26, 14968]
	mov	x0, x26
	ldr	w4, [x21, 1596]
	mov	w19, 1
	ldr	x1, .LC182
	mov	w25, 0
	ldr	x5, [x26, 14960]
	umull	x4, w4, w24
	add	x24, x2, x4
	ldr	w2, [x24, 28]
	umull	x2, w2, w20
	add	x20, x5, x2
	bl	ue_v
	str	w0, [x21, 1648]
	lsl	w23, w19, w0
	ldr	w1, [x20, 40]
	cbnz	w1, .L1537
.L1513:
	cmp	w0, 7
	bhi	.L1516
	ldr	w0, [x21, 1652]
	cmp	w0, 7
	bhi	.L1516
	add	x0, x26, 65536
	str	x0, [x29, 104]
	ldr	w2, [x0, 2760]
	cbnz	w2, .L1515
	ldr	x22, .LC188
	mov	w27, 0
	b	.L1524
	.p2align 3
.L1519:
	str	w23, [x1, 1656]
	add	x0, x26, x19, lsl 2
	str	wzr, [x1, 2424]
	add	x0, x0, 20480
	ldr	w1, [x20, 40]
	cbnz	w1, .L1538
.L1521:
	str	wzr, [x0, 1784]
	str	wzr, [x0, 1912]
	str	wzr, [x0, 2552]
	str	wzr, [x0, 2680]
.L1523:
	ldr	w0, [x21, 1640]
	add	w27, w27, 1
	cmp	w0, w27
	bcc	.L1539
.L1524:
	mov	x1, x22
	mov	x0, x26
	uxtw	x19, w27
	bl	u_1
	add	x1, x26, x19, lsl 2
	add	x1, x1, 20480
	cbz	w0, .L1519
	ldr	x1, .LC190
	mov	x0, x26
	bl	se_v
	add	x4, x26, x19, lsl 2
	ldr	x1, .LC192
	add	x28, x4, 20480
	str	w0, [x28, 1656]
	mov	x0, x26
	bl	se_v
	str	w0, [x28, 2424]
	add	x0, x26, x19, lsl 2
	ldr	w1, [x20, 40]
	add	x0, x0, 20480
	cbz	w1, .L1521
.L1538:
	ldr	x1, .LC194
	mov	x0, x26
	bl	u_1
	add	x1, x26, x19, lsl 2
	add	x1, x1, 20480
	cbnz	w0, .L1540
	str	w25, [x1, 1784]
	add	w27, w27, 1
	str	w25, [x1, 1912]
	str	wzr, [x1, 2552]
	str	wzr, [x1, 2680]
	ldr	w0, [x21, 1640]
	cmp	w0, w27
	bcs	.L1524
.L1539:
	ldr	w0, [x24, 44]
	cmp	w0, 1
	beq	.L1525
.L1526:
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 2760]
	cmp	w0, wzr
	csetm	w0, ne
.L1518:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1540:
	ldr	x1, .LC196
	mov	x0, x26
	add	x19, x26, x19, lsl 2
	add	x19, x19, 20480
	bl	se_v
	ldr	x1, .LC198
	str	w0, [x19, 1784]
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2552]
	ldr	x1, .LC196
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 1912]
	ldr	x1, .LC198
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2680]
	b	.L1523
	.p2align 3
.L1537:
	ldr	x1, .LC184
	mov	x0, x26
	bl	ue_v
	mov	w25, w0
	ldr	w0, [x21, 1648]
	str	w25, [x21, 1652]
	lsl	w25, w19, w25
	b	.L1513
	.p2align 3
.L1525:
	ldrb	w0, [x21, 1584]
	cmp	w0, 1
	bne	.L1526
	ldr	x22, .LC200
	mov	w28, 0
	ldr	x27, .LC202
	b	.L1532
	.p2align 3
.L1527:
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	str	w23, [x0, 2040]
	str	wzr, [x0, 2808]
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	ldr	w1, [x20, 40]
	cbnz	w1, .L1541
.L1529:
	str	wzr, [x0, 2168]
	str	wzr, [x0, 2296]
	str	wzr, [x0, 2936]
	str	wzr, [x0, 3064]
.L1531:
	ldr	w0, [x21, 1644]
	add	w28, w28, 1
	cmp	w0, w28
	bcc	.L1526
.L1532:
	mov	x1, x22
	mov	x0, x26
	uxtw	x19, w28
	bl	u_1
	cbz	w0, .L1527
	mov	x1, x27
	mov	x0, x26
	bl	se_v
	add	x4, x26, x19, lsl 2
	ldr	x1, .LC204
	add	x24, x4, 20480
	str	w0, [x24, 2040]
	mov	x0, x26
	bl	se_v
	str	w0, [x24, 2808]
	add	x0, x26, x19, lsl 2
	ldr	w1, [x20, 40]
	add	x0, x0, 20480
	cbz	w1, .L1529
.L1541:
	ldr	x1, .LC206
	mov	x0, x26
	bl	u_1
	cbnz	w0, .L1542
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	str	w25, [x0, 2168]
	str	w25, [x0, 2296]
	str	wzr, [x0, 2936]
	str	wzr, [x0, 3064]
	b	.L1531
.L1516:
	add	x3, x26, 65536
	ldr	w2, [x3, 2760]
.L1515:
	ldr	x1, .LC186
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1518
.L1542:
	ldr	x1, .LC208
	mov	x0, x26
	add	x19, x26, x19, lsl 2
	add	x19, x19, 20480
	bl	se_v
	ldr	x1, .LC210
	str	w0, [x19, 2168]
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2936]
	ldr	x1, .LC208
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 2296]
	ldr	x1, .LC210
	mov	x0, x26
	bl	se_v
	str	w0, [x19, 3064]
	b	.L1531
	.size	pred_weight_table, .-pred_weight_table
	.align	3
.LC182:
	.xword	.LC181
	.align	3
.LC184:
	.xword	.LC183
	.align	3
.LC186:
	.xword	.LC185
	.align	3
.LC188:
	.xword	.LC187
	.align	3
.LC190:
	.xword	.LC189
	.align	3
.LC192:
	.xword	.LC191
	.align	3
.LC194:
	.xword	.LC193
	.align	3
.LC196:
	.xword	.LC195
	.align	3
.LC198:
	.xword	.LC197
	.align	3
.LC200:
	.xword	.LC199
	.align	3
.LC202:
	.xword	.LC201
	.align	3
.LC204:
	.xword	.LC203
	.align	3
.LC206:
	.xword	.LC205
	.align	3
.LC208:
	.xword	.LC207
	.align	3
.LC210:
	.xword	.LC209
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecMMCO
	.type	DecMMCO, %function
DecMMCO:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x20, x0
	mov	w19, w1
	mov	x0, x30
	bl	_mcount
	cbnz	w19, .L1544
	mov	w22, 100
	ldr	x21, .LC214
	ldr	x25, .LC216
	add	x23, x20, 65536
	ldr	x27, .LC222
	ldr	x24, .LC220
	ldr	x26, .LC218
	b	.L1555
	.p2align 3
.L1556:
	cmp	w19, 2
	beq	.L1569
.L1557:
	cmp	w19, 6
	cset	w0, eq
	orr	w0, w28, w0
	cbnz	w0, .L1560
	cmp	w19, 4
	beq	.L1570
.L1561:
	cmp	w19, 6
	bhi	.L1553
	ldr	w0, [x23, 2760]
	cbnz	w0, .L1553
.L1571:
	cbz	w19, .L1563
.L1562:
	subs	w22, w22, #1
	beq	.L1564
.L1555:
	mov	x1, x21
	mov	x0, x20
	bl	ue_v
	cmp	w0, 3
	mov	w19, w0
	and	w0, w0, -3
	cset	w28, eq
	cmp	w0, 1
	bne	.L1556
	mov	x1, x25
	mov	x0, x20
	bl	ue_v
	cmp	w19, 2
	bne	.L1557
.L1569:
	mov	x1, x26
	mov	x0, x20
	bl	ue_v
	ldr	w0, [x23, 2760]
	cbz	w0, .L1571
	.p2align 2
.L1553:
	ldr	x1, .LC224
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L1547:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1560:
	mov	x1, x24
	mov	x0, x20
	bl	ue_v
	cmp	w19, 4
	bne	.L1561
.L1570:
	mov	x1, x27
	mov	x0, x20
	bl	ue_v
	ldr	w0, [x23, 2760]
	cbz	w0, .L1562
	b	.L1553
	.p2align 3
.L1544:
	ldr	x21, .LC214
	mov	w26, 0
	ldr	x25, .LC216
	add	x22, x20, 24576
	ldr	x24, .LC220
	add	x23, x20, 65536
	b	.L1546
	.p2align 3
.L1548:
	cmp	w1, 2
	beq	.L1572
.L1549:
	cmp	w1, 3
	ccmp	w1, 6, 4, ne
	beq	.L1573
.L1550:
	cmp	w1, 4
	beq	.L1574
.L1551:
	cmp	w1, 6
	bhi	.L1553
	ldr	w0, [x23, 2760]
	cbnz	w0, .L1553
	add	w26, w26, 1
	cbz	w1, .L1563
	cmp	w26, 100
	beq	.L1575
.L1546:
	ldr	w28, [x22, 3188]
	mov	x1, x21
	mov	x0, x20
	uxtw	x27, w26
	lsl	x19, x27, 4
	bl	ue_v
	uxtw	x28, w28
	mov	w1, w0
	lsl	x0, x28, 6
	sub	x0, x0, x28
	add	x19, x19, x27, lsl 2
	lsl	x0, x0, 2
	and	w2, w1, -3
	sub	x0, x0, x28
	cmp	w2, 1
	lsl	x0, x0, 1
	sub	x0, x0, x28
	add	x19, x19, x0, lsl 2
	add	x19, x20, x19
	add	x19, x19, 20480
	str	w1, [x19, 3280]
	bne	.L1548
	mov	x1, x25
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3284]
	ldr	w1, [x19, 3280]
	cmp	w1, 2
	bne	.L1549
.L1572:
	ldr	x1, .LC218
	mov	x0, x20
	bl	ue_v
	lsl	x1, x28, 6
	sub	x1, x1, x28
	lsl	x1, x1, 2
	sub	x1, x1, x28
	lsl	x1, x1, 1
	sub	x2, x1, x28
	lsl	x1, x27, 4
	add	x1, x1, x27, lsl 2
	add	x1, x1, x2, lsl 2
	add	x1, x20, x1
	add	x1, x1, 20480
	str	w0, [x1, 3288]
	ldr	w1, [x1, 3280]
	cmp	w1, 3
	ccmp	w1, 6, 4, ne
	bne	.L1550
	.p2align 2
.L1573:
	mov	x1, x24
	mov	x0, x20
	bl	ue_v
	lsl	x1, x28, 6
	lsl	x2, x27, 4
	sub	x1, x1, x28
	add	x2, x2, x27, lsl 2
	lsl	x1, x1, 2
	sub	x1, x1, x28
	lsl	x1, x1, 1
	sub	x1, x1, x28
	add	x2, x2, x1, lsl 2
	add	x2, x20, x2
	add	x2, x2, 20480
	ldr	w1, [x2, 3280]
	str	w0, [x2, 3292]
	cmp	w1, 4
	bne	.L1551
.L1574:
	ldr	x1, .LC222
	mov	x0, x20
	bl	ue_v
	lsl	x1, x28, 6
	sub	x1, x1, x28
	lsl	x1, x1, 2
	sub	x1, x1, x28
	lsl	x1, x1, 1
	sub	x28, x1, x28
	lsl	x1, x27, 4
	add	x3, x1, x27, lsl 2
	add	x3, x3, x28, lsl 2
	add	x3, x20, x3
	add	x3, x3, 20480
	ldr	w1, [x3, 3280]
	str	w0, [x3, 3296]
	b	.L1551
	.p2align 3
.L1563:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1575:
	ldr	x1, .LC212
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1547
.L1564:
	mov	w0, -1
	b	.L1547
	.size	DecMMCO, .-DecMMCO
	.align	3
.LC212:
	.xword	.LC211
	.align	3
.LC214:
	.xword	.LC213
	.align	3
.LC216:
	.xword	.LC215
	.align	3
.LC218:
	.xword	.LC217
	.align	3
.LC220:
	.xword	.LC219
	.align	3
.LC222:
	.xword	.LC221
	.align	3
.LC224:
	.xword	.LC223
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	dec_ref_pic_marking
	.type	dec_ref_pic_marking, %function
dec_ref_pic_marking:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 24576
	bl	_mcount
	add	x1, x21, 20480
	ldr	w23, [x20, 3188]
	ldrb	w0, [x1, 1589]
	cbz	w0, .L1577
	cmp	w23, wzr
	cset	w19, eq
	str	w19, [x20, 3188]
	ldrb	w0, [x1, 1587]
	cmp	w0, 5
	beq	.L1595
.L1578:
	ldr	x1, .LC232
	mov	x0, x21
	bl	u_1
	mov	w4, w0
	lsl	x3, x19, 6
	ldr	x1, .LC234
	sub	x3, x3, x19
	uxtb	w2, w0
	lsl	x3, x3, 2
	mov	w0, 16
	sub	x3, x3, x19
	lsl	x3, x3, 1
	sub	x19, x3, x19
	add	x19, x21, x19, lsl 2
	add	x19, x19, 20480
	strb	w4, [x19, 3279]
	bl	dprint_vfmw
	ldrb	w0, [x19, 3279]
	cbnz	w0, .L1580
.L1584:
	mov	w22, 0
.L1592:
	mov	w0, w22
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1577:
	uxtw	x19, w23
	lsl	x0, x19, 6
	sub	x0, x0, x19
	lsl	x0, x0, 2
	sub	x0, x0, x19
	lsl	x0, x0, 1
	sub	x19, x0, x19
	add	x19, x21, x19, lsl 2
	add	x19, x19, 20480
	ldrb	w0, [x19, 3276]
	cbnz	w0, .L1596
	ldrb	w0, [x1, 1587]
	uxtw	x19, w23
	cmp	w0, 5
	bne	.L1578
.L1595:
	ldr	x1, .LC226
	mov	x0, x21
	mov	w22, 0
	bl	u_1
	lsl	x2, x19, 6
	ldr	x1, .LC228
	sub	x2, x2, x19
	lsl	x2, x2, 2
	sub	x2, x2, x19
	lsl	x2, x2, 1
	sub	x19, x2, x19
	add	x19, x21, x19, lsl 2
	add	x19, x19, 20480
	strb	w0, [x19, 3277]
	mov	x0, x21
	bl	u_1
	strb	w0, [x19, 3278]
	ldrb	w2, [x19, 3277]
	mov	w0, 16
	ldr	x1, .LC230
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1596:
	ldrb	w0, [x1, 1587]
	cmp	w0, 5
	beq	.L1597
	ldr	x1, .LC232
	mov	x0, x21
	ldrb	w20, [x19, 3279]
	bl	u_1
	cmp	w20, w0
	bne	.L1598
	ldrb	w0, [x19, 3279]
	cbz	w0, .L1584
	mov	w1, 0
	mov	x0, x21
	bl	DecMMCO
	mov	w22, w0
	b	.L1592
	.p2align 3
.L1580:
	mov	w1, 1
	mov	x0, x21
	bl	DecMMCO
	cmn	w0, #1
	mov	w22, w0
	beq	.L1599
	mov	w0, 1
	strb	w0, [x19, 3276]
	mov	w22, 0
	mov	w0, w22
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1597:
	ldr	x1, .LC226
	mov	x0, x21
	ldrb	w20, [x19, 3277]
	bl	u_1
	cmp	w20, w0
	bne	.L1600
	ldr	x1, .LC228
	mov	x0, x21
	ldrb	w19, [x19, 3278]
	bl	u_1
	cmp	w19, w0
	beq	.L1584
	ldr	x1, .LC240
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1592
.L1598:
	ldr	x1, .LC242
	add	x21, x21, 65536
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	ldr	x1, .LC244
	mov	w0, 1
	ldr	w4, [x21, 2764]
	ldr	w2, [x21, 2784]
	ldr	w3, [x21, 2800]
	bl	dprint_vfmw
	b	.L1592
.L1600:
	ldr	x1, .LC238
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1592
.L1599:
	strb	wzr, [x19, 3276]
	mov	w0, 1
	ldr	x1, .LC236
	str	w23, [x20, 3188]
	bl	dprint_vfmw
	b	.L1592
	.size	dec_ref_pic_marking, .-dec_ref_pic_marking
	.align	3
.LC226:
	.xword	.LC225
	.align	3
.LC228:
	.xword	.LC227
	.align	3
.LC230:
	.xword	.LC229
	.align	3
.LC232:
	.xword	.LC231
	.align	3
.LC234:
	.xword	.LC233
	.align	3
.LC236:
	.xword	.LC235
	.align	3
.LC238:
	.xword	.LC237
	.align	3
.LC240:
	.xword	.LC239
	.align	3
.LC242:
	.xword	.LC241
	.align	3
.LC244:
	.xword	.LC243
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessSliceHeaderFirstPart
	.type	ProcessSliceHeaderFirstPart, %function
ProcessSliceHeaderFirstPart:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC246
	mov	x0, x23
	bl	ue_v
	mov	w21, w0
	ldr	w0, [x23, 14948]
	sub	w0, w0, #1
	cmp	w21, w0
	bhi	.L1602
	add	x24, x23, 65536
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1602
	mov	w1, w21
	mov	x0, x23
	bl	PPSSPSCheckTmpId
	mov	w22, w0
	cbnz	w0, .L1665
	add	x19, x23, 20480
	mov	w1, 2208
	mov	w20, 4000
	umull	x1, w21, w1
	str	w21, [x19, 1596]
	ldrb	w0, [x19, 1587]
	ldr	x21, [x23, 14968]
	cmp	w0, 5
	ldr	x2, [x23, 14960]
	add	x21, x21, x1
	ldr	w0, [x21, 28]
	umull	x0, w0, w20
	add	x20, x2, x0
	beq	.L1606
	ldr	w0, [x20, 3244]
	cbz	w0, .L1606
.L1607:
	ldr	w1, [x20, 2196]
	mov	x0, x23
	ldr	x2, .LC254
	add	w1, w1, 4
	bl	u_v
	str	w0, [x19, 1604]
	ldr	w1, [x24, 2760]
	cbnz	w1, .L1631
	ldrb	w1, [x19, 1587]
	cmp	w1, 5
	beq	.L1666
.L1610:
	strb	wzr, [x19, 1585]
	strb	wzr, [x19, 1586]
	ldrb	w0, [x20, 18]
	cbz	w0, .L1667
	ldr	w1, [x20, 3252]
	ldr	w2, [x20, 3248]
	add	w0, w1, 1
	madd	w0, w2, w0, w0
.L1634:
	ldrb	w1, [x20, 19]
	cbnz	w1, .L1617
	strb	wzr, [x19, 1588]
.L1619:
	ldr	w1, [x19, 1636]
	cmp	w1, w0
	bcs	.L1668
.L1620:
	ldrb	w0, [x19, 1587]
	cmp	w0, 5
	beq	.L1669
.L1622:
	str	wzr, [x19, 704]
	str	wzr, [x19, 708]
	ldr	w0, [x20, 2200]
	cbz	w0, .L1670
.L1626:
	str	wzr, [x19, 752]
	str	wzr, [x19, 756]
	ldr	w0, [x20, 2200]
	cmp	w0, 1
	beq	.L1671
.L1629:
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1631
	ldrb	w0, [x21, 17]
	cbz	w0, .L1632
	ldr	x1, .LC278
	mov	x0, x23
	bl	ue_v
	cbnz	w0, .L1633
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1633
.L1632:
	mov	x0, x23
	bl	IsNewPic
	uxtb	w0, w0
	strb	w0, [x19, 1589]
	cbnz	w0, .L1645
	ldr	w1, [x19, 1636]
	ldr	w0, [x19, 3272]
	cmp	w1, w0
	bls	.L1672
.L1645:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1606:
	ldrb	w0, [x19, 1584]
	cmp	w0, 2
	beq	.L1607
	ldr	x1, .LC252
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1645
	.p2align 3
.L1617:
	mov	w1, 1
	strb	w1, [x19, 1588]
.L1636:
	ldr	w1, [x19, 1636]
	cmp	w1, w0, lsr 1
	bcc	.L1620
	ldr	x1, .LC262
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1645
	.p2align 3
.L1633:
	ldr	x1, .LC280
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC281
	ldr	x4, [x0]
	cbz	x4, .L1631
	ldr	w0, [x24, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	mov	w22, -1
	blr	x4
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1667:
	ldr	x1, .LC258
	mov	x0, x23
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 1585]
	cbnz	w0, .L1673
	ldr	w2, [x20, 3252]
	ldr	w1, [x20, 3248]
	add	w0, w2, 1
	ldrb	w3, [x20, 18]
	madd	w1, w1, w0, w0
	lsl	w0, w1, 1
	cbz	w3, .L1634
.L1614:
	ldrb	w2, [x19, 1585]
	mov	w0, 1
	b	.L1615
	.p2align 3
.L1670:
	ldr	w1, [x20, 2204]
	mov	x0, x23
	ldr	x2, .LC270
	add	w1, w1, 4
	bl	u_v
	str	w0, [x19, 704]
	ldrb	w0, [x21, 1]
	cbz	w0, .L1626
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1626
	ldr	x1, .LC272
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 708]
	b	.L1626
	.p2align 3
.L1666:
	str	w0, [x19, 1600]
	cbz	w0, .L1610
	ldr	x1, .LC256
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1610
	.p2align 3
.L1671:
	ldrb	w0, [x20, 16]
	cbnz	w0, .L1629
	ldr	x1, .LC274
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 752]
	ldrb	w0, [x21, 1]
	cmp	w0, 1
	bne	.L1629
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1629
	ldr	x1, .LC276
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 756]
	b	.L1629
	.p2align 3
.L1631:
	mov	w22, -1
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1673:
	ldr	x1, .LC260
	mov	x0, x23
	bl	u_1
	strb	w0, [x19, 1586]
	ldr	w0, [x20, 3252]
	ldr	w1, [x20, 3248]
	ldrb	w2, [x20, 18]
	add	w0, w0, 1
	madd	w1, w1, w0, w0
	cbnz	w2, .L1614
	ldrb	w2, [x19, 1585]
	mov	w0, 2
.L1615:
	mul	w0, w0, w1
	cbz	w2, .L1634
	strb	wzr, [x19, 1588]
	cmp	w2, 1
	bne	.L1619
	b	.L1636
	.p2align 3
.L1669:
	ldr	x1, .LC266
	mov	x0, x23
	bl	ue_v
	str	w0, [x19, 1624]
	mov	w1, 65535
	cmp	w0, w1
	bhi	.L1623
	ldr	w0, [x24, 2760]
	cbz	w0, .L1622
.L1623:
	ldr	x1, .LC268
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1622
	.p2align 3
.L1602:
	ldr	x1, .LC248
	mov	w2, w21
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1665:
	ldr	x1, .LC250
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1645
.L1668:
	ldr	x1, .LC264
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1645
.L1672:
	ldr	x1, .LC283
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1645
	.size	ProcessSliceHeaderFirstPart, .-ProcessSliceHeaderFirstPart
	.align	3
.LC246:
	.xword	.LC245
	.align	3
.LC248:
	.xword	.LC247
	.align	3
.LC250:
	.xword	.LC249
	.align	3
.LC252:
	.xword	.LC251
	.align	3
.LC254:
	.xword	.LC253
	.align	3
.LC256:
	.xword	.LC255
	.align	3
.LC258:
	.xword	.LC257
	.align	3
.LC260:
	.xword	.LC259
	.align	3
.LC262:
	.xword	.LC261
	.align	3
.LC264:
	.xword	.LC263
	.align	3
.LC266:
	.xword	.LC265
	.align	3
.LC268:
	.xword	.LC267
	.align	3
.LC270:
	.xword	.LC269
	.align	3
.LC272:
	.xword	.LC271
	.align	3
.LC274:
	.xword	.LC273
	.align	3
.LC276:
	.xword	.LC275
	.align	3
.LC278:
	.xword	.LC277
	.align	3
.LC280:
	.xword	.LC279
	.align	3
.LC281:
	.xword	g_event_report
	.align	3
.LC283:
	.xword	.LC282
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessSliceHeaderSecondPart
	.type	ProcessSliceHeaderSecondPart, %function
ProcessSliceHeaderSecondPart:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 20480
	bl	_mcount
	ldr	w0, [x20, 14948]
	ldr	w2, [x19, 1596]
	sub	w0, w0, #1
	cmp	w0, w2
	bcc	.L1675
	add	x24, x20, 65536
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1675
	mov	x0, x20
	bl	PPSSPSCheck
	cbnz	w0, .L1758
	ldr	w22, [x19, 1596]
	mov	w0, 2208
	ldrb	w1, [x19, 1584]
	ldr	x25, [x20, 14968]
	umull	x22, w22, w0
	cmp	w1, 1
	add	x21, x25, x22
	beq	.L1759
	ldr	w0, [x21, 36]
	cmp	w1, 1
	str	w0, [x19, 1640]
	ldr	w0, [x21, 40]
	str	w0, [x19, 1644]
	bls	.L1760
.L1680:
	cmp	w1, 2
	beq	.L1706
.L1690:
	mov	w0, 32
	str	w0, [x19, 1644]
.L1691:
	mov	x0, x20
	bl	ref_pic_list_reordering
	mov	w23, w0
	cbnz	w0, .L1761
	ldrb	w0, [x21, 2]
	cbz	w0, .L1693
	ldrb	w0, [x19, 1584]
	cbnz	w0, .L1693
	mov	w0, 1
	mov	w2, w0
.L1767:
	ldr	x1, .LC301
	strb	w0, [x19, 1591]
	mov	w0, 19
	bl	dprint_vfmw
	str	wzr, [x19, 1648]
	ldrb	w0, [x19, 1591]
	str	wzr, [x19, 1652]
	cbz	w0, .L1695
.L1763:
	mov	x0, x20
	bl	pred_weight_table
	cbz	w0, .L1695
	ldr	x1, .LC303
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1726
	.p2align 3
.L1693:
	ldr	w0, [x21, 44]
	cmp	w0, 1
	beq	.L1762
.L1710:
	mov	w0, 0
	ldr	x1, .LC301
	strb	w0, [x19, 1591]
	mov	w2, 0
	mov	w0, 19
	bl	dprint_vfmw
	str	wzr, [x19, 1648]
	ldrb	w0, [x19, 1591]
	str	wzr, [x19, 1652]
	cbnz	w0, .L1763
.L1695:
	ldr	w0, [x19, 1616]
	cbnz	w0, .L1764
.L1696:
	str	wzr, [x19, 3192]
	ldrb	w0, [x25, x22]
	cbz	w0, .L1697
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bls	.L1765
.L1697:
	ldr	x1, .LC311
	mov	x0, x20
	bl	se_v
	add	x1, x19, 3072
	stp	w0, wzr, [x1, 124]
	stp	wzr, wzr, [x1, 132]
	ldrb	w0, [x21, 3]
	cbnz	w0, .L1766
.L1726:
	mov	w0, w23
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1766:
	ldr	x1, .LC313
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 3200]
	bhi	.L1700
	ldr	w1, [x24, 2760]
	cbnz	w1, .L1700
	cmp	w0, 1
	beq	.L1726
	ldr	x1, .LC317
	mov	x0, x20
	bl	se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 3204]
	bhi	.L1703
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1703
	ldr	x1, .LC321
	mov	x0, x20
	bl	se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 3208]
	bhi	.L1705
	ldr	w0, [x24, 2760]
	cbz	w0, .L1726
.L1705:
	ldr	x1, .LC323
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1726
	.p2align 3
.L1764:
	mov	x0, x20
	bl	dec_ref_pic_marking
	cbz	w0, .L1696
	ldr	x1, .LC305
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1726
	.p2align 3
.L1706:
	mov	w0, 32
	str	w0, [x19, 1640]
	b	.L1690
	.p2align 3
.L1762:
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1710
	mov	w2, w0
	b	.L1767
	.p2align 3
.L1759:
	ldr	x1, .LC287
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 1590]
	ldrb	w1, [x19, 1584]
	ldr	w0, [x21, 36]
	str	w0, [x19, 1640]
	cmp	w1, 1
	ldr	w0, [x21, 40]
	str	w0, [x19, 1644]
	bhi	.L1680
	.p2align 2
.L1760:
	ldr	x1, .LC289
	mov	x0, x20
	bl	u_1
	cbnz	w0, .L1681
	ldr	w1, [x19, 1640]
.L1682:
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1683
	cmp	w1, 15
	bhi	.L1684
	ldr	w0, [x19, 1644]
	cmp	w0, 15
	bhi	.L1768
.L1685:
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1684
.L1686:
	ldrb	w0, [x19, 1584]
	cmp	w0, 2
	beq	.L1706
	cmp	w0, 1
	beq	.L1691
	b	.L1690
	.p2align 3
.L1675:
	ldr	x1, .LC284
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	ldr	x25, [sp, 64]
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1765:
	ldr	x1, .LC307
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 3192]
	bhi	.L1698
	ldr	w0, [x24, 2760]
	cbz	w0, .L1697
.L1698:
	ldr	x1, .LC309
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1726
	.p2align 3
.L1683:
	cmp	w1, 31
	bhi	.L1687
	ldr	w0, [x19, 1644]
	cmp	w0, 31
	bls	.L1688
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1688
.L1687:
	ldr	x1, .LC297
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1726
	.p2align 3
.L1688:
	ldr	w0, [x24, 2760]
	cbz	w0, .L1686
	b	.L1687
	.p2align 3
.L1768:
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1685
.L1684:
	ldr	x1, .LC295
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1726
	.p2align 3
.L1681:
	ldr	x1, .LC291
	mov	x0, x20
	bl	ue_v
	mov	w1, w0
	ldrb	w0, [x19, 1584]
	str	w1, [x19, 1640]
	cmp	w0, 1
	bne	.L1682
	ldr	x1, .LC293
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 1644]
	ldr	w1, [x19, 1640]
	b	.L1682
	.p2align 3
.L1703:
	ldr	x1, .LC319
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1726
	.p2align 3
.L1700:
	ldr	x1, .LC315
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1726
	.p2align 3
.L1758:
	ldr	x1, .LC285
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1726
	.p2align 3
.L1761:
	ldr	x1, .LC299
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1726
	.size	ProcessSliceHeaderSecondPart, .-ProcessSliceHeaderSecondPart
	.align	3
.LC284:
	.xword	.LC247
	.align	3
.LC285:
	.xword	.LC249
	.align	3
.LC287:
	.xword	.LC286
	.align	3
.LC289:
	.xword	.LC288
	.align	3
.LC291:
	.xword	.LC290
	.align	3
.LC293:
	.xword	.LC292
	.align	3
.LC295:
	.xword	.LC294
	.align	3
.LC297:
	.xword	.LC296
	.align	3
.LC299:
	.xword	.LC298
	.align	3
.LC301:
	.xword	.LC300
	.align	3
.LC303:
	.xword	.LC302
	.align	3
.LC305:
	.xword	.LC304
	.align	3
.LC307:
	.xword	.LC306
	.align	3
.LC309:
	.xword	.LC308
	.align	3
.LC311:
	.xword	.LC310
	.align	3
.LC313:
	.xword	.LC312
	.align	3
.LC315:
	.xword	.LC314
	.align	3
.LC317:
	.xword	.LC316
	.align	3
.LC319:
	.xword	.LC318
	.align	3
.LC321:
	.xword	.LC320
	.align	3
.LC323:
	.xword	.LC322
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ExitSlice
	.type	ExitSlice, %function
ExitSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	mov	w2, 2208
	ldr	x8, [x19, 14968]
	mov	w1, 4000
	ldr	x7, [x19, 14960]
	ldr	w4, [x0, 1596]
	ldrb	w3, [x0, 1585]
	ldr	w5, [x0, 1604]
	umull	x2, w4, w2
	ldr	w6, [x0, 1636]
	add	x2, x8, x2
	ldr	w2, [x2, 28]
	str	w4, [x0, 3240]
	umull	x1, w2, w1
	add	x1, x7, x1
	ldr	w2, [x1, 36]
	str	w2, [x0, 3236]
	strb	w3, [x0, 3232]
	str	w5, [x0, 3248]
	str	w6, [x0, 3272]
	cbz	w3, .L1770
	ldrb	w2, [x0, 1586]
	strb	w2, [x0, 3233]
.L1770:
	ldrb	w2, [x0, 1587]
	ldr	w3, [x0, 1616]
	strb	w2, [x0, 3234]
	cmp	w2, 5
	str	w3, [x0, 3244]
	beq	.L1777
.L1771:
	ldr	w2, [x1, 2200]
	cbnz	w2, .L1772
	ldr	w2, [x0, 708]
	ldr	w3, [x0, 704]
	str	w3, [x0, 3256]
	str	w2, [x0, 3260]
	ldr	w2, [x1, 2200]
.L1772:
	cmp	w2, 1
	bne	.L1773
	ldr	w2, [x0, 752]
	ldr	w1, [x0, 756]
	str	w2, [x0, 3264]
	str	w1, [x0, 3268]
.L1773:
	add	x19, x19, 65536
	ldr	w0, [x19, 2776]
	add	w0, w0, 1
	str	w0, [x19, 2776]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1777:
	ldr	w2, [x0, 1624]
	str	w2, [x0, 3252]
	b	.L1771
	.size	ExitSlice, .-ExitSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PicTypeStatistic
	.type	PicTypeStatistic, %function
PicTypeStatistic:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 20480
	ldrb	w0, [x1, 1584]
	cmp	w0, 1
	beq	.L1780
	cbz	w0, .L1781
	cmp	w0, 2
	bne	.L1778
	ldrb	w0, [x1, 1587]
	add	x19, x19, 61440
	cmp	w0, 5
	beq	.L1788
.L1783:
	str	wzr, [x19, 3400]
.L1778:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1781:
	add	x19, x19, 61440
	ldr	w0, [x19, 3396]
	cmp	w0, 2
	beq	.L1783
	mov	w0, 1
	str	wzr, [x19, 3400]
	str	w0, [x19, 3396]
	b	.L1778
	.p2align 3
.L1780:
	add	x19, x19, 61440
	mov	w0, 2
	str	wzr, [x19, 3400]
	str	w0, [x19, 3396]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1788:
	mov	w0, 1
	str	w0, [x19, 3400]
	b	.L1778
	.size	PicTypeStatistic, .-PicTypeStatistic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CalcStreamBits
	.type	CalcStreamBits, %function
CalcStreamBits:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 16384
	ldrb	w0, [x0, 2592]
	cbz	w0, .L1790
	ldr	x1, [x19, 632]
	ldr	w0, [x1, 72]
	add	w0, w0, 7
	and	w0, w0, -8
	str	w0, [x1, 72]
	ldr	x1, [x19, 632]
	ldr	w0, [x1, 80]
	sub	w0, w0, #1
	str	w0, [x1, 80]
.L1790:
	ldr	x3, [x19, 632]
	ldrb	w21, [x3]
	cbz	w21, .L1801
	sub	w1, w21, #1
	mov	w4, 32
	mov	x2, 48
	add	x0, x3, 16
	mov	w20, 0
	umaddl	x2, w1, w4, x2
	add	x2, x3, x2
	.p2align 2
.L1792:
	ldr	w1, [x0], 32
	cmp	x0, x2
	add	w20, w20, w1
	bne	.L1792
.L1791:
	sbfiz	x4, x21, 5, 32
	ldr	w2, [x3, 72]
	add	x4, x3, x4
	ldr	w5, [x3, 80]
	ldr	x1, .LC325
	mov	w3, w20
	mov	w0, 7
	ldr	w4, [x4, 16]
	bl	dprint_vfmw
	ldr	x2, [x19, 632]
	ubfiz	x3, x21, 5, 8
	ldrb	w0, [x2]
	ldr	w1, [x2, 72]
	add	x0, x2, x0, lsl 5
	and	w1, w1, 7
	str	w1, [x0, 28]
	ldr	x2, [x19, 632]
	ldrb	w1, [x2]
	ldr	w0, [x2, 72]
	add	x1, x2, x1, lsl 5
	ldr	w2, [x1, 20]
	add	w0, w2, w0, lsr 3
	mov	w2, w21
	sub	w0, w0, w20
	str	w0, [x1, 32]
	ldr	x4, [x19, 632]
	ldrb	w1, [x4]
	ldr	w0, [x4, 72]
	add	x4, x4, x1, lsl 5
	ldr	w1, [x4, 16]
	add	w20, w20, w1
	lsl	w20, w20, 3
	sub	w0, w20, w0
	str	w0, [x4, 24]
	ldr	x1, [x19, 632]
	ldrb	w0, [x1]
	add	x0, x1, x0, lsl 5
	ldp	w4, w1, [x0, 28]
	ubfiz	w1, w1, 3, 2
	add	w1, w1, w4
	str	w1, [x0, 28]
	ldr	x1, .LC327
	ldr	x4, [x19, 632]
	ldrb	w0, [x4]
	add	x4, x4, x0, lsl 5
	mov	w0, 7
	ldr	w5, [x4, 32]
	and	w5, w5, -4
	str	w5, [x4, 32]
	ldr	x6, [x19, 632]
	add	x3, x6, x3
	ldrb	w5, [x6]
	ldp	w4, w3, [x3, 24]
	add	x5, x6, x5, lsl 5
	ldr	w5, [x5, 32]
	bl	dprint_vfmw
	ldr	x0, [x19, 632]
	ldr	w2, [x0, 76]
	sub	w1, w2, #1
	cmp	w1, 1
	bhi	.L1812
	ldrb	w20, [x0]
	add	w3, w20, 1
	cmp	w3, 1
	ccmp	w2, w3, 0, ls
	bls	.L1795
	ldr	x21, .LC331
	add	w20, w20, 2
	.p2align 2
.L1796:
	sub	w2, w20, #1
	mov	x1, x21
	ubfiz	x3, x2, 5, 32
	add	x4, x0, x3
	mov	w0, 7
	str	wzr, [x4, 28]
	ldr	x4, [x19, 632]
	add	x4, x4, x3
	ldr	w5, [x4, 20]
	str	w5, [x4, 32]
	ldr	x4, [x19, 632]
	add	x4, x4, x3
	ldr	w5, [x4, 16]
	lsl	w5, w5, 3
	str	w5, [x4, 24]
	ldr	x4, [x19, 632]
	add	x4, x4, x3
	ldp	w6, w5, [x4, 28]
	ubfiz	w5, w5, 3, 2
	add	w5, w5, w6
	str	w5, [x4, 28]
	ldr	x4, [x19, 632]
	add	x4, x4, x3
	ldr	w5, [x4, 32]
	and	w5, w5, -4
	str	w5, [x4, 32]
	ldr	x4, [x19, 632]
	add	x3, x4, x3
	ldp	w4, w3, [x3, 24]
	bl	dprint_vfmw
	ldr	x0, [x19, 632]
	cmp	w20, 1
	cset	w3, ls
	ldr	w1, [x0, 76]
	cmp	w1, w20
	add	w20, w20, 1
	cset	w2, hi
	tst	w3, w2
	bne	.L1796
	sub	w1, w1, #1
.L1795:
	ubfiz	x1, x1, 5, 32
	ldr	w2, [x0, 80]
	add	x0, x0, x1
	add	x5, x19, 61440
	ldr	w1, [x0, 24]
	sub	w1, w1, w2
	str	w1, [x0, 24]
	ldr	x3, [x19, 632]
	ldrb	w0, [x3]
	ldr	w4, [x3, 76]
	cmp	w0, w4
	bcs	.L1789
	.p2align 2
.L1806:
	ubfiz	x1, x0, 5, 32
	ldr	w2, [x5, 3424]
	add	x1, x3, x1
	add	w0, w0, 1
	ldr	w1, [x1, 32]
	cmp	w1, w2
	bcs	.L1798
	str	w1, [x5, 3424]
	ldr	w4, [x3, 76]
.L1798:
	cmp	w4, w0
	bhi	.L1806
.L1789:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1812:
	ldr	x1, .LC329
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1801:
	mov	w20, 0
	b	.L1791
	.size	CalcStreamBits, .-CalcStreamBits
	.align	3
.LC325:
	.xword	.LC324
	.align	3
.LC327:
	.xword	.LC326
	.align	3
.LC329:
	.xword	.LC328
	.align	3
.LC331:
	.xword	.LC330
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Scaling_List
	.type	Scaling_List, %function
Scaling_List:
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
	ble	.L1813
	sub	w26, w27, #1
	mov	w0, 8
	ldr	x21, .LC334
	add	x26, x26, 1
	mov	x20, 0
	mov	w24, w0
	mov	w23, 255
	b	.L1818
	.p2align 3
.L1817:
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
	beq	.L1813
.L1818:
	cmp	w27, 16
	add	x1, x21, 16
	beq	.L1826
	ldrb	w19, [x20, x1]
.L1816:
	add	x20, x20, 1
	cbz	w0, .L1817
	ldr	x1, .LC336
	ldr	x0, [x29, 104]
	bl	se_v
	add	w0, w0, w24
	and	w0, w0, 255
	cmp	w19, wzr
	ccmp	w0, wzr, 0, eq
	cset	w1, eq
	cmp	w0, wzr
	csel	w24, w24, w0, eq
	str	w1, [x22]
	b	.L1817
	.p2align 3
.L1826:
	ldrb	w19, [x21, x20]
	b	.L1816
	.p2align 3
.L1813:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.size	Scaling_List, .-Scaling_List
	.align	3
.LC334:
	.xword	.LANCHOR1
	.align	3
.LC336:
	.xword	.LC335
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessPPS
	.type	ProcessPPS, %function
ProcessPPS:
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
	add	x21, x19, 65536
	bl	_mcount
	ldr	x1, .LC340
	mov	x0, x19
	bl	u_1
	strb	w0, [x20]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L1878
	ldr	x1, .LC342
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 1]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L1878
	ldr	x1, .LC344
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 32]
	cbnz	w0, .L1831
	ldr	w0, [x21, 2760]
	cbz	w0, .L1832
.L1831:
	ldr	x1, .LC346
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC347
	ldr	x4, [x0]
	cbz	x4, .L1878
	ldr	w0, [x21, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, -1
.L1829:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1832:
	ldr	x1, .LC349
	mov	x0, x19
	bl	ue_v
	cmp	w0, 31
	str	w0, [x20, 36]
	bhi	.L1833
	ldr	w0, [x21, 2760]
	cbnz	w0, .L1833
	ldr	x1, .LC353
	mov	x0, x19
	bl	ue_v
	cmp	w0, 31
	str	w0, [x20, 40]
	bhi	.L1835
	ldr	w0, [x21, 2760]
	cbnz	w0, .L1835
	ldr	x1, .LC357
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 2]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L1878
	ldr	x2, .LC359
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	cmp	w0, 2
	str	w0, [x20, 44]
	bhi	.L1879
	ldr	x1, .LC363
	mov	x0, x19
	bl	se_v
	str	w0, [x20, 48]
	ldr	x1, .LC365
	mov	x0, x19
	bl	se_v
	ldr	x1, .LC367
	mov	x0, x19
	bl	se_v
	str	w0, [x20, 52]
	ldr	x1, .LC369
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 3]
	ldr	x1, .LC371
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 4]
	ldr	x1, .LC373
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 17]
	cbnz	w0, .L1880
.L1838:
	ldr	w1, [x20, 52]
	add	x0, x19, 12288
	stp	w1, wzr, [x20, 56]
	strb	wzr, [x20, 18]
	add	x0, x0, 2600
	bl	BsResidBits
	ldr	x1, [x19, 632]
	ldr	w1, [x1, 80]
	add	w1, w1, 3
	cmp	w0, w1
	bcc	.L1859
	ldr	x1, .LC377
	mov	x0, x19
	bl	u_1
	str	w0, [x20, 60]
	ldr	x1, .LC379
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 18]
	beq	.L1840
.L1858:
	ldr	x1, .LC381
	mov	x0, x19
	bl	se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x20, 56]
	bhi	.L1841
	ldr	w0, [x21, 2760]
	cbz	w0, .L1859
.L1841:
	ldr	x1, .LC388
	mov	w0, 1
	bl	dprint_vfmw
.L1878:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1859:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1880:
	ldr	x1, .LC375
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1838
	.p2align 3
.L1833:
	ldr	x1, .LC351
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1829
	.p2align 3
.L1835:
	ldr	x1, .LC355
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1829
	.p2align 3
.L1840:
	ldr	x28, .LC384
	add	x22, x29, 120
	ldr	x26, .LC383
	add	x24, x20, 5
	add	x23, x20, 1984
	add	x25, x20, 64
	mov	w27, 0
	b	.L1849
	.p2align 3
.L1885:
	ldr	w0, [x20, 28]
	mov	w1, 4000
	umull	x0, w0, w1
	ldr	x1, [x19, 14960]
	add	x0, x1, x0
	ldrb	w1, [x0, 25]
	cmp	w1, 1
	beq	.L1881
	ldr	x0, .LC384
	ldr	x3, [x0, 104]
	ldr	x0, .LC338
	add	x1, x0, 96
	cbz	w27, .L1882
.L1877:
	mov	x2, 16
	mov	x0, x23
	blr	x3
.L1844:
	add	w27, w27, 1
	add	x22, x22, 4
	cmp	w27, 6
	add	x24, x24, 1
	add	x23, x23, 16
	add	x25, x25, 64
	beq	.L1883
.L1849:
	mov	x1, x26
	mov	x0, x19
	bl	u_1
	cmp	w0, 1
	strb	w0, [x24]
	str	w0, [x22]
	beq	.L1884
	cmp	w27, wzr
	ccmp	w27, 3, 4, ne
	beq	.L1885
	sub	w1, w27, #1
	ldr	x3, [x28, 104]
	add	x1, x1, 124
	add	x1, x20, x1, lsl 4
	b	.L1877
	.p2align 3
.L1883:
	ldr	x22, .LC384
	add	x26, x20, 2080
	ldr	x24, .LC338
	add	x27, x20, 448
	mov	x28, 0
	add	x23, x29, 112
	mov	w25, 4000
.L1857:
	ldr	w0, [x20, 60]
	mov	w8, w28
	cmp	w0, 1
	beq	.L1886
	add	x0, x20, x28
	str	wzr, [x23, x28, lsl 2]
	strb	wzr, [x0, 11]
.L1852:
	ldr	w0, [x20, 28]
	ldr	x1, [x19, 14960]
	umull	x0, w0, w25
	add	x0, x1, x0
	ldrb	w1, [x0, 25]
	cmp	w1, 1
	beq	.L1887
	add	x1, x24, 176
	ldr	x3, [x22, 104]
	cbz	w8, .L1888
.L1856:
	mov	x2, 64
	mov	x0, x26
	blr	x3
.L1853:
	add	x28, x28, 1
	add	x26, x26, 64
	cmp	x28, 2
	add	x27, x27, 256
	bne	.L1857
	b	.L1858
	.p2align 3
.L1884:
	mov	x0, x19
	mov	x4, x22
	mov	w3, 16
	mov	x2, x23
	mov	x1, x25
	bl	Scaling_List
	ldr	w0, [x22]
	cmp	w0, 1
	bne	.L1844
	ldr	x0, .LC338
	cmp	w27, 2
	add	x1, x0, 80
	add	x0, x0, 96
	csel	x1, x0, x1, hi
.L1876:
	ldr	x0, .LC384
	mov	x2, 16
	ldr	x3, [x0, 104]
	mov	x0, x23
	blr	x3
	b	.L1844
.L1881:
	uxtw	x1, w27
	add	x1, x0, x1, lsl 4
	add	x1, x1, 1972
	b	.L1876
.L1879:
	ldr	x1, .LC361
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1829
.L1886:
	ldr	x1, .LC386
	mov	x0, x19
	str	w28, [x29, 108]
	bl	u_1
	cmp	w0, 1
	add	x1, x20, x28
	str	w0, [x23, x28, lsl 2]
	ldr	w8, [x29, 108]
	strb	w0, [x1, 11]
	bne	.L1852
	mov	x0, x19
	add	x4, x23, x28, lsl 2
	mov	w3, 64
	mov	x2, x26
	mov	x1, x27
	str	w8, [x29, 108]
	bl	Scaling_List
	ldr	w0, [x23, x28, lsl 2]
	ldr	w8, [x29, 108]
	cmp	w0, 1
	bne	.L1853
	ldr	x0, .LC384
	ldr	x3, [x0, 104]
	ldr	x0, .LC338
	add	x1, x0, 176
	cbnz	w8, .L1856
	add	x1, x0, 112
	b	.L1856
	.p2align 3
.L1887:
	ubfiz	x8, x8, 6, 32
	mov	x2, 64
	add	x1, x0, x8
	ldr	x0, .LC384
	add	x1, x1, 2068
	ldr	x3, [x0, 104]
	mov	x0, x26
	blr	x3
	b	.L1853
.L1882:
	add	x1, x0, 80
	b	.L1877
.L1888:
	ldr	x1, .LC338
	add	x1, x1, 112
	b	.L1856
	.size	ProcessPPS, .-ProcessPPS
	.align	3
.LC338:
	.xword	.LANCHOR0
	.align	3
.LC340:
	.xword	.LC339
	.align	3
.LC342:
	.xword	.LC341
	.align	3
.LC344:
	.xword	.LC343
	.align	3
.LC346:
	.xword	.LC345
	.align	3
.LC347:
	.xword	g_event_report
	.align	3
.LC349:
	.xword	.LC348
	.align	3
.LC351:
	.xword	.LC350
	.align	3
.LC353:
	.xword	.LC352
	.align	3
.LC355:
	.xword	.LC354
	.align	3
.LC357:
	.xword	.LC356
	.align	3
.LC359:
	.xword	.LC358
	.align	3
.LC361:
	.xword	.LC360
	.align	3
.LC363:
	.xword	.LC362
	.align	3
.LC365:
	.xword	.LC364
	.align	3
.LC367:
	.xword	.LC366
	.align	3
.LC369:
	.xword	.LC368
	.align	3
.LC371:
	.xword	.LC370
	.align	3
.LC373:
	.xword	.LC372
	.align	3
.LC375:
	.xword	.LC374
	.align	3
.LC377:
	.xword	.LC376
	.align	3
.LC379:
	.xword	.LC378
	.align	3
.LC381:
	.xword	.LC380
	.align	3
.LC383:
	.xword	.LC382
	.align	3
.LC384:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC386:
	.xword	.LC385
	.align	3
.LC388:
	.xword	.LC387
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PPSEqual
	.type	PPSEqual, %function
PPSEqual:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L1911
	cbz	x20, .L1912
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
	ldr	w10, [x19, 60]
	cmp	w5, w4
	ldrb	w5, [x20, 2]
	ccmp	w3, w0, 0, eq
	ldr	w4, [x19, 44]
	cset	w3, eq
	cmp	w7, w5
	ldp	w0, w5, [x20, 44]
	ldr	w7, [x19, 52]
	and	w1, w1, w2
	ccmp	w4, w0, 0, eq
	ldr	w4, [x20, 52]
	cset	w0, eq
	cmp	w6, w5
	ldrb	w5, [x20, 3]
	and	w1, w3, w1
	ldrb	w6, [x19, 3]
	ccmp	w7, w4, 0, eq
	cset	w4, eq
	ldrb	w2, [x20, 4]
	and	w0, w0, w1
	cmp	w6, w5
	ldrb	w5, [x19, 4]
	and	w0, w4, w0
	ldr	w4, [x20, 60]
	ccmp	w5, w2, 0, eq
	ldrb	w3, [x19, 18]
	ldrb	w1, [x20, 18]
	cset	w2, eq
	cmp	w4, w10
	and	w0, w2, w0
	ccmp	w1, w3, 0, eq
	cset	w2, eq
	and	w2, w2, w0
	cbz	w3, .L1893
	lsl	w10, w10, 1
	cmn	w10, #6
	beq	.L1893
	mov	x1, x20
	add	x7, x19, 64
	mov	w9, -6
	mov	x8, 0
	.p2align 2
.L1898:
	add	x3, x19, x8
	add	x0, x20, x8
	ldrsb	w3, [x3, 5]
	ldrsb	w0, [x0, 5]
	cmp	w0, w3
	cset	w0, eq
	and	w2, w2, w0
	cbz	w3, .L1894
	cmp	w8, 5
	bhi	.L1895
	sub	x0, x7, #64
	mov	x3, x1
	.p2align 2
.L1896:
	ldr	w5, [x0, 64]
	add	x0, x0, 4
	ldr	w4, [x3, 64]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x7, x0
	and	w2, w2, w4
	bne	.L1896
.L1894:
	add	w9, w9, 1
	add	x8, x8, 1
	cmp	w9, w10
	add	x1, x1, 64
	add	x7, x7, 64
	bne	.L1898
.L1893:
	ldr	w0, [x20, 56]
	ldr	w1, [x19, 56]
	cmp	w1, w0
	cset	w0, eq
	tst	w0, w2
	csetm	w0, eq
.L1891:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1895:
	ubfiz	x0, x9, 8, 32
	add	x3, x0, 448
	add	x6, x0, 704
	add	x6, x19, x6
	add	x0, x19, x3
	add	x3, x20, x3
	.p2align 2
.L1897:
	ldr	w5, [x0], 4
	ldr	w4, [x3], 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x6, x0
	and	w2, w2, w4
	bne	.L1897
	add	w9, w9, 1
	add	x8, x8, 1
	cmp	w9, w10
	add	x1, x1, 64
	add	x7, x7, 64
	bne	.L1898
	b	.L1893
.L1912:
	ldr	x2, .LC389
	mov	w3, 9810
	ldr	x1, .LC390
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1891
.L1911:
	ldr	x2, .LC389
	mov	w3, 9809
	ldr	x1, .LC390
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1891
	.size	PPSEqual, .-PPSEqual
	.align	3
.LC389:
	.xword	.LC50
	.align	3
.LC390:
	.xword	.LC52
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecPPS
	.type	H264_DecPPS, %function
H264_DecPPS:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, .LC392
	mov	x0, x19
	bl	ue_v
	mov	w20, w0
	ldr	w0, [x19, 14948]
	sub	w0, w0, #1
	cmp	w20, w0
	bls	.L1914
	ldr	x1, .LC394
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 14948]
	sub	w1, w0, #1
	cmp	w20, w1
	bls	.L1922
	ldr	x1, .LC395
	ldr	x4, [x1]
	cbz	x4, .L1922
	add	x19, x19, 65536
	mov	w3, 8
	stp	w20, w0, [x29, 56]
	add	x2, x29, 56
	mov	w1, 110
	ldr	w0, [x19, 2820]
	blr	x4
	mov	w0, -1
.L1915:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1914:
	ldr	x1, .LC397
	mov	x0, x19
	bl	ue_v
	mov	w2, w0
	ldr	w0, [x19, 14944]
	sub	w0, w0, #1
	cmp	w2, w0
	bhi	.L1926
	mov	w0, 4000
	ldr	x1, [x19, 14960]
	umull	x0, w2, w0
	add	x0, x1, x0
	ldrb	w0, [x0, 23]
	cbz	w0, .L1927
	mov	w21, 2208
	ldr	x0, [x19, 14968]
	umull	x21, w20, w21
	add	x0, x0, x21
	ldrb	w1, [x0, 19]
	cbz	w1, .L1918
	ldr	x22, .LC402
	mov	x0, x19
	mov	x1, x22
	stp	w20, w2, [x22, 24]
	bl	ProcessPPS
	cbnz	w0, .L1928
	ldr	x1, [x19, 14968]
	mov	x0, x22
	add	x1, x1, x21
	bl	PPSEqual
	cbz	w0, .L1915
	ldr	x3, .LC405
	mov	w1, 1
	ldr	x0, [x19, 14968]
	mov	x2, 2208
	strb	w1, [x22, 20]
	ldr	x3, [x3, 112]
	add	x0, x0, x21
	strb	w1, [x22, 19]
	mov	x1, x22
	blr	x3
	mov	w0, 0
	b	.L1915
	.p2align 3
.L1918:
	str	w20, [x0, 24]
	mov	x0, x19
	ldr	x1, [x19, 14968]
	add	x1, x1, x21
	str	w2, [x1, 28]
	ldr	x1, [x19, 14968]
	add	x1, x1, x21
	bl	ProcessPPS
	cbnz	w0, .L1929
	ldr	x1, [x19, 14968]
	mov	w2, 1
	add	x1, x1, x21
	strb	w2, [x1, 20]
	ldr	x1, [x19, 14968]
	add	x21, x1, x21
	strb	w2, [x21, 19]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1922:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 64
	ret
.L1926:
	ldr	x1, .LC399
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1915
.L1928:
	ldr	x1, .LC404
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1915
.L1927:
	ldr	x1, .LC401
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1915
.L1929:
	ldr	x1, .LC404
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 14968]
	mov	w2, 1
	mov	w0, -1
	add	x1, x1, x21
	strb	w2, [x1, 20]
	ldr	x1, [x19, 14968]
	add	x21, x1, x21
	strb	wzr, [x21, 19]
	b	.L1915
	.size	H264_DecPPS, .-H264_DecPPS
	.align	3
.LC392:
	.xword	.LC391
	.align	3
.LC394:
	.xword	.LC393
	.align	3
.LC395:
	.xword	g_event_report
	.align	3
.LC397:
	.xword	.LC396
	.align	3
.LC399:
	.xword	.LC398
	.align	3
.LC401:
	.xword	.LC400
	.align	3
.LC402:
	.xword	.LANCHOR2
	.align	3
.LC404:
	.xword	.LC403
	.align	3
.LC405:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	vui_parameters
	.type	vui_parameters, %function
vui_parameters:
	stp	x29, x30, [sp, -96]!
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
	ldr	x1, .LC407
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20]
	cbnz	w0, .L1973
	strb	wzr, [x20, 15]
.L1932:
	ldr	x1, .LC415
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 1]
	cbnz	w0, .L1974
.L1933:
	ldr	x1, .LC419
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 3]
	cbnz	w0, .L1975
	mov	w0, 5
	str	w0, [x20, 28]
.L1935:
	ldr	x1, .LC433
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 6]
	cbnz	w0, .L1976
.L1936:
	ldr	x1, .LC439
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 8]
	cbnz	w0, .L1977
.L1938:
	ldr	x1, .LC447
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 7]
	cbz	w0, .L1940
	ldr	x1, .LC449
	mov	x0, x19
	add	x24, x20, 84
	bl	ue_v
	ldr	x2, .LC451
	mov	w1, 4
	str	w0, [x24, 36]
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 32]
	ldr	x2, .LC453
	mov	w1, 4
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 33]
	ldr	w1, [x24, 36]
	cmp	w1, 31
	bhi	.L1943
	add	x28, x19, 65536
	ldr	w0, [x28, 2760]
	cbnz	w0, .L1943
	ldr	x27, .LC457
	mov	w21, 0
	ldr	x26, .LC459
	ldr	x25, .LC461
	.p2align 2
.L1944:
	uxtw	x22, w21
	mov	x1, x27
	mov	x0, x19
	add	w21, w21, 1
	add	x23, x20, x22, lsl 2
	bl	ue_v
	mov	x1, x26
	str	w0, [x23, 124]
	mov	x0, x19
	bl	ue_v
	str	w0, [x23, 252]
	mov	x1, x25
	mov	x0, x19
	bl	u_1
	strb	w0, [x24, x22]
	ldr	w0, [x24, 36]
	cmp	w0, w21
	bcs	.L1944
	ldr	x2, .LC463
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 296]
	ldr	x2, .LC465
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 300]
	ldr	x2, .LC467
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 304]
	ldr	x2, .LC469
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 308]
.L1940:
	ldr	x1, .LC471
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 10]
	cbnz	w0, .L1978
	ldrb	w0, [x20, 7]
	add	x28, x19, 65536
	cbz	w0, .L1948
.L1949:
	ldr	x1, .LC473
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 14]
.L1948:
	ldr	x1, .LC475
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 11]
	ldr	x1, .LC477
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 12]
	cbnz	w0, .L1950
	ldr	w0, [x28, 2760]
.L1951:
	cmp	w0, wzr
	csetm	w0, ne
.L1972:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1977:
	ldr	x2, .LC441
	mov	w1, 32
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 52]
	ldr	x2, .LC443
	mov	w1, 32
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 56]
	ldr	x1, .LC445
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 9]
	bne	.L1938
	ldr	w2, [x20, 52]
	cbz	w2, .L1938
	ldr	w0, [x20, 56]
	add	x28, x19, 65536
	lsl	w1, w0, 6
	sub	w1, w1, w0
	lsl	w1, w1, 1
	sub	w0, w1, w0
	lsl	w0, w0, 3
	udiv	w0, w0, w2
	lsr	w0, w0, 1
	str	w0, [x28, 1356]
	b	.L1938
	.p2align 3
.L1976:
	ldr	x1, .LC435
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 44]
	ldr	x1, .LC437
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 48]
	b	.L1936
	.p2align 3
.L1975:
	ldr	x2, .LC421
	mov	w1, 3
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 28]
	ldr	x1, .LC423
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 4]
	ldr	x1, .LC425
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 5]
	cbz	w0, .L1935
	ldr	x2, .LC427
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 32]
	ldr	x2, .LC429
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 36]
	ldr	x2, .LC431
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 40]
	b	.L1935
	.p2align 3
.L1974:
	ldr	x1, .LC417
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 2]
	b	.L1933
	.p2align 3
.L1973:
	ldr	x2, .LC409
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	uxtb	w0, w0
	cmp	w0, 255
	strb	w0, [x20, 15]
	bne	.L1932
	ldr	x2, .LC411
	mov	w1, 16
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 16]
	ldr	x2, .LC413
	mov	w1, 16
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 20]
	b	.L1932
	.p2align 3
.L1978:
	ldr	x1, .LC449
	mov	x0, x19
	add	x24, x20, 396
	bl	ue_v
	ldr	x2, .LC451
	mov	w1, 4
	str	w0, [x24, 36]
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 32]
	ldr	x2, .LC453
	mov	w1, 4
	mov	x0, x19
	bl	u_v
	strb	w0, [x24, 33]
	ldr	w1, [x24, 36]
	cmp	w1, 31
	bhi	.L1943
	add	x28, x19, 65536
	ldr	w0, [x28, 2760]
	cbnz	w0, .L1943
	ldr	x27, .LC457
	mov	w21, 0
	ldr	x26, .LC459
	ldr	x25, .LC461
	.p2align 2
.L1946:
	uxtw	x22, w21
	mov	x1, x27
	mov	x0, x19
	add	w21, w21, 1
	add	x23, x20, x22, lsl 2
	bl	ue_v
	mov	x1, x26
	str	w0, [x23, 436]
	mov	x0, x19
	bl	ue_v
	str	w0, [x23, 564]
	mov	x1, x25
	mov	x0, x19
	bl	u_1
	strb	w0, [x24, x22]
	ldr	w0, [x24, 36]
	cmp	w0, w21
	bcs	.L1946
	ldr	x2, .LC463
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 296]
	ldr	x2, .LC465
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 300]
	ldr	x2, .LC467
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 304]
	ldr	x2, .LC469
	mov	w1, 5
	mov	x0, x19
	bl	u_v
	str	w0, [x24, 308]
	ldrb	w0, [x20, 7]
	cbnz	w0, .L1949
	ldrb	w0, [x20, 10]
	cbnz	w0, .L1949
	b	.L1948
	.p2align 3
.L1950:
	ldr	x1, .LC479
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 13]
	ldr	x1, .LC481
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 60]
	ldr	x1, .LC483
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 64]
	ldr	x1, .LC485
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 72]
	ldr	x1, .LC487
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 68]
	ldr	x1, .LC489
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 76]
	ldr	x1, .LC491
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 80]
	ldr	w0, [x28, 2760]
	cbz	w0, .L1951
	mov	w0, -1
	b	.L1972
.L1943:
	ldr	x1, .LC455
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1972
	.size	vui_parameters, .-vui_parameters
	.align	3
.LC407:
	.xword	.LC406
	.align	3
.LC409:
	.xword	.LC408
	.align	3
.LC411:
	.xword	.LC410
	.align	3
.LC413:
	.xword	.LC412
	.align	3
.LC415:
	.xword	.LC414
	.align	3
.LC417:
	.xword	.LC416
	.align	3
.LC419:
	.xword	.LC418
	.align	3
.LC421:
	.xword	.LC420
	.align	3
.LC423:
	.xword	.LC422
	.align	3
.LC425:
	.xword	.LC424
	.align	3
.LC427:
	.xword	.LC426
	.align	3
.LC429:
	.xword	.LC428
	.align	3
.LC431:
	.xword	.LC430
	.align	3
.LC433:
	.xword	.LC432
	.align	3
.LC435:
	.xword	.LC434
	.align	3
.LC437:
	.xword	.LC436
	.align	3
.LC439:
	.xword	.LC438
	.align	3
.LC441:
	.xword	.LC440
	.align	3
.LC443:
	.xword	.LC442
	.align	3
.LC445:
	.xword	.LC444
	.align	3
.LC447:
	.xword	.LC446
	.align	3
.LC449:
	.xword	.LC448
	.align	3
.LC451:
	.xword	.LC450
	.align	3
.LC453:
	.xword	.LC452
	.align	3
.LC455:
	.xword	.LC454
	.align	3
.LC457:
	.xword	.LC456
	.align	3
.LC459:
	.xword	.LC458
	.align	3
.LC461:
	.xword	.LC460
	.align	3
.LC463:
	.xword	.LC462
	.align	3
.LC465:
	.xword	.LC464
	.align	3
.LC467:
	.xword	.LC466
	.align	3
.LC469:
	.xword	.LC468
	.align	3
.LC471:
	.xword	.LC470
	.align	3
.LC473:
	.xword	.LC472
	.align	3
.LC475:
	.xword	.LC474
	.align	3
.LC477:
	.xword	.LC476
	.align	3
.LC479:
	.xword	.LC478
	.align	3
.LC481:
	.xword	.LC480
	.align	3
.LC483:
	.xword	.LC482
	.align	3
.LC485:
	.xword	.LC484
	.align	3
.LC487:
	.xword	.LC486
	.align	3
.LC489:
	.xword	.LC488
	.align	3
.LC491:
	.xword	.LC490
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	SPSEqual
	.type	SPSEqual, %function
SPSEqual:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	cbz	x19, .L2011
	cbz	x20, .L2012
	ldp	w3, w6, [x19, 28]
	ldp	w2, w5, [x20, 28]
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
	ldr	w2, [x20, 36]
	ccmp	w1, w0, 0, eq
	ldr	w4, [x19, 36]
	cset	w0, eq
	ldrb	w1, [x19, 25]
	and	w0, w3, w0
	cmp	w6, w5
	ldrb	w3, [x20, 25]
	ccmp	w4, w2, 0, eq
	cset	w2, eq
	cmp	w3, w1
	and	w0, w2, w0
	cset	w2, eq
	and	w0, w2, w0
	cbz	w1, .L1983
	mov	x2, x19
	mov	x8, x20
	mov	w9, -6
	mov	x1, 0
	.p2align 2
.L1988:
	add	x4, x19, x1
	add	x3, x20, x1
	add	x6, x2, 64
	ldrsb	w3, [x3, 4]
	ldrsb	w4, [x4, 4]
	cmp	w3, w4
	cset	w3, eq
	and	w0, w0, w3
	cbz	w4, .L1984
	cmp	w1, 5
	bhi	.L1985
	mov	x3, x8
	.p2align 2
.L1986:
	ldr	w5, [x2, 52]
	add	x2, x2, 4
	ldr	w4, [x3, 52]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x6, x2
	and	w0, w0, w4
	bne	.L1986
.L1984:
	add	x1, x1, 1
	add	w9, w9, 1
	cmp	x1, 8
	mov	x2, x6
	add	x8, x8, 64
	bne	.L1988
.L1983:
	ldr	w4, [x19, 2196]
	ldr	w3, [x20, 2196]
	ldr	w2, [x20, 2200]
	ldr	w1, [x19, 2200]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbz	w1, .L1990
	cmp	w1, 1
	bne	.L1989
	ldrb	w4, [x19, 16]
	ldrb	w3, [x20, 16]
	ldr	w2, [x19, 2208]
	ldr	w1, [x20, 2208]
	cmp	w4, w3
	ldr	w5, [x19, 2212]
	ldr	w4, [x20, 2212]
	ccmp	w2, w1, 0, eq
	ldr	w2, [x20, 2216]
	cset	w3, eq
	ldr	w1, [x19, 2216]
	cmp	w5, w4
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w2, w3, w2
	and	w0, w0, w2
	cbz	w1, .L1989
	sub	w5, w1, #1
	add	x2, x20, 2220
	add	x5, x5, 556
	add	x1, x19, 2220
	add	x5, x19, x5, lsl 2
	.p2align 2
.L1992:
	ldr	w4, [x1], 4
	ldr	w3, [x2], 4
	cmp	w4, w3
	cset	w3, eq
	cmp	x1, x5
	and	w0, w0, w3
	bne	.L1992
.L1989:
	ldr	w4, [x19, 3244]
	ldr	w3, [x20, 3244]
	ldrb	w2, [x19, 17]
	ldrb	w1, [x20, 17]
	cmp	w4, w3
	ldr	w6, [x19, 3248]
	ldr	w4, [x20, 3248]
	ccmp	w2, w1, 0, eq
	ldr	w5, [x19, 3252]
	cset	w2, eq
	ldr	w1, [x20, 3252]
	cmp	w6, w4
	ldrb	w3, [x19, 18]
	ldrb	w4, [x20, 18]
	ccmp	w5, w1, 0, eq
	cset	w1, eq
	cmp	w4, w3
	and	w2, w2, w1
	cset	w1, eq
	and	w1, w2, w1
	and	w0, w1, w0
	cbnz	w3, .L1993
	ldrb	w1, [x20, 19]
	ldrb	w2, [x19, 19]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
.L1993:
	ldrb	w4, [x19, 20]
	ldrb	w3, [x20, 20]
	ldrb	w2, [x20, 21]
	ldrb	w1, [x19, 21]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbnz	w1, .L2013
.L1994:
	ldrb	w1, [x20, 22]
	ldrb	w2, [x19, 22]
	cmp	w2, w1
	cset	w1, eq
	tst	w1, w0
	csetm	w0, eq
.L1981:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2013:
	ldr	w4, [x19, 3256]
	ldr	w3, [x20, 3256]
	ldr	w2, [x19, 3260]
	ldr	w1, [x20, 3260]
	cmp	w4, w3
	ldr	w5, [x19, 3264]
	ldr	w4, [x20, 3264]
	ccmp	w2, w1, 0, eq
	ldr	w3, [x19, 3268]
	cset	w2, eq
	ldr	w1, [x20, 3268]
	cmp	w5, w4
	ccmp	w3, w1, 0, eq
	cset	w1, eq
	and	w1, w2, w1
	and	w0, w0, w1
	b	.L1994
	.p2align 3
.L1985:
	ubfiz	x3, x9, 8, 32
	add	x4, x3, 436
	add	x7, x3, 692
	add	x7, x19, x7
	add	x3, x19, x4
	add	x4, x20, x4
	.p2align 2
.L1987:
	ldr	w6, [x3], 4
	ldr	w5, [x4], 4
	cmp	w6, w5
	cset	w5, eq
	cmp	x3, x7
	and	w0, w0, w5
	bne	.L1987
	add	x1, x1, 1
	add	x6, x2, 64
	cmp	x1, 8
	add	w9, w9, 1
	mov	x2, x6
	add	x8, x8, 64
	bne	.L1988
	b	.L1983
	.p2align 3
.L1990:
	ldr	w1, [x20, 2204]
	ldr	w2, [x19, 2204]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
	b	.L1989
.L2012:
	ldr	x2, .LC492
	mov	w3, 10043
	ldr	x1, .LC493
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1981
.L2011:
	ldr	x2, .LC492
	mov	w3, 10042
	ldr	x1, .LC493
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1981
	.size	SPSEqual, .-SPSEqual
	.align	3
.LC492:
	.xword	.LC50
	.align	3
.LC493:
	.xword	.LC52
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264GetDar
	.type	H264GetDar, %function
H264GetDar:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	w19, w0
	mov	x0, x30
	mov	w20, w1
	mov	w22, w2
	mov	w21, w3
	mov	w23, w4
	bl	_mcount
	cbz	w19, .L2025
	mov	w0, 255
	cmp	w19, 16
	ccmp	w19, w0, 4, gt
	bne	.L2025
	cmp	w20, wzr
	ccmp	w22, wzr, 4, ne
	ccmp	w19, w0, 0, eq
	beq	.L2025
	cmp	w19, 1
	beq	.L2026
	cmp	w19, w0
	beq	.L2016
	ldr	x0, .LC494
	sbfiz	x19, x19, 3, 32
	add	x0, x0, 80
	add	x1, x0, x19
	ldr	w20, [x0, x19]
	ldr	w22, [x1, 4]
.L2016:
	lsl	w20, w20, 10
	lsl	w21, w21, 10
	sdiv	w20, w20, w22
	sdiv	w2, w21, w23
	mul	w2, w20, w2
	cmp	w2, wzr
	add	w0, w2, 1023
	csel	w2, w0, w2, lt
	asr	w2, w2, 10
	subs	w1, w2, #2406
	bmi	.L2036
.L2017:
	subs	w0, w2, #2263
	bmi	.L2037
	cmp	w1, w0
	mov	w19, 4
	blt	.L2015
.L2021:
	subs	w1, w2, #1820
	bmi	.L2038
	cmp	w0, w1
	mov	w19, 3
	blt	.L2015
.L2022:
	subs	w0, w2, #1365
	bmi	.L2039
.L2020:
	mov	w19, 2
	cmp	w1, w0
	csinc	w19, w19, wzr, lt
	b	.L2015
	.p2align 3
.L2025:
	mov	w19, 0
	mov	w2, 0
.L2015:
	ldr	x1, .LC496
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
.L2026:
	mov	w19, 5
	mov	w2, 0
	b	.L2015
	.p2align 3
.L2037:
	mov	w0, 2263
	mov	w19, 4
	sub	w0, w0, w2
	cmp	w1, w0
	blt	.L2015
	b	.L2021
	.p2align 3
.L2036:
	mov	w1, 2406
	sub	w1, w1, w2
	b	.L2017
	.p2align 3
.L2038:
	mov	w1, 1820
	mov	w19, 3
	sub	w1, w1, w2
	cmp	w0, w1
	blt	.L2015
	b	.L2022
.L2039:
	mov	w0, 1365
	sub	w0, w0, w2
	b	.L2020
	.size	H264GetDar, .-H264GetDar
	.align	3
.LC494:
	.xword	.LANCHOR1
	.align	3
.LC496:
	.xword	.LC495
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ProcessSPS
	.type	ProcessSPS, %function
ProcessSPS:
	stp	x29, x30, [sp, -144]!
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
	cbz	x19, .L2160
	ldr	w0, [x19, 28]
	mov	w2, 144
	mov	w1, 110
	mov	w3, 86
	cmp	w0, 122
	ccmp	w0, w2, 4, ne
	cset	w2, eq
	cmp	w0, 100
	ccmp	w0, w1, 4, ne
	cset	w1, eq
	cmp	w0, 83
	ccmp	w0, w3, 4, ne
	orr	w0, w2, w1
	cset	w1, eq
	orr	w0, w1, w0
	cbnz	w0, .L2161
	mov	w0, 1
	strb	wzr, [x19, 25]
	str	w0, [x19, 40]
.L2055:
	ldr	x1, .LC523
	mov	x0, x20
	bl	ue_v
	cmp	w0, 12
	str	w0, [x19, 2196]
	bhi	.L2068
	add	x21, x20, 65536
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2068
	ldr	x1, .LC527
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 2200]
	bhi	.L2070
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2070
	cbz	w0, .L2162
	cmp	w0, 1
	beq	.L2163
.L2074:
	ldr	x1, .LC584
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3244]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2158
	ldr	x1, .LC547
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 17]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2158
	ldr	x1, .LC549
	mov	x0, x20
	bl	ue_v
	sub	w1, w0, #1
	cmp	w1, 509
	str	w0, [x19, 3248]
	bhi	.L2081
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2081
	ldr	x1, .LC553
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3252]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2158
	ldr	x1, .LC555
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 18]
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2158
	cbnz	w0, .L2164
	ldr	x1, .LC586
	mov	x0, x20
	bl	u_1
	ldr	w23, [x19, 3252]
	strb	w0, [x19, 19]
	add	w23, w23, 1
	cmp	w23, 255
	bhi	.L2114
	ldr	w3, [x19, 3248]
	cmp	w23, 1
	mov	w24, 2
	add	w3, w3, 1
	ccmp	w3, 3, 0, hi
	cset	w0, ls
	cbz	w0, .L2085
.L2114:
	ldr	x1, .LC557
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2150
	.p2align 3
.L2161:
	ldr	x1, .LC502
	mov	x0, x20
	bl	ue_v
	cmp	w0, 1
	str	w0, [x19, 40]
	bhi	.L2044
	add	x21, x20, 65536
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2044
	ldr	x1, .LC506
	mov	x0, x20
	bl	ue_v
	uxth	w0, w0
	add	w2, w0, 8
	str	w2, [x19, 44]
	cmp	w2, 8
	beq	.L2165
	ldr	x1, .LC508
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbz	x4, .L2047
.L2173:
	ldr	w1, [x19, 44]
	mov	w3, 8
	ldr	w0, [x21, 2820]
	add	x2, x29, 120
	stp	wzr, w1, [x29, 120]
	mov	w1, 119
	blr	x4
.L2047:
	ldr	x1, .LC511
	mov	x0, x20
	bl	ue_v
	uxth	w0, w0
	add	w2, w0, 8
	str	w2, [x19, 48]
	cmp	w2, 8
	beq	.L2166
	ldr	x1, .LC513
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbz	x4, .L2050
.L2172:
	ldr	w1, [x19, 48]
	mov	w3, 8
	ldr	w0, [x21, 2820]
	add	x2, x29, 120
	stp	wzr, w1, [x29, 120]
	mov	w1, 119
	blr	x4
.L2050:
	ldr	x1, .LC515
	mov	x0, x20
	bl	u_1
	cbnz	w0, .L2052
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2052
	ldr	x1, .LC519
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 25]
	bne	.L2055
	ldr	x26, .LC498
	add	x21, x29, 120
	ldr	x25, .LC520
	add	x23, x19, 4
	add	x22, x19, 1972
	add	x24, x19, 52
	mov	w27, 0
	ldr	x28, .LC521
	b	.L2061
	.p2align 3
.L2169:
	add	x0, x26, 96
	cmp	w27, wzr
	ldr	x3, [x28, 104]
	csel	x1, x0, x1, ne
	mov	x2, 16
	mov	x0, x22
	blr	x3
.L2057:
	add	w27, w27, 1
	add	x21, x21, 4
	cmp	w27, 6
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	beq	.L2167
.L2061:
	mov	x1, x25
	mov	x0, x20
	bl	u_1
	strb	w0, [x23]
	ldr	x1, .LC498
	cmp	w0, 1
	str	w0, [x21]
	add	x1, x1, 80
	beq	.L2168
	cmp	w27, wzr
	ccmp	w27, 3, 4, ne
	beq	.L2169
	ldr	x0, .LC521
	sub	w1, w27, #1
	mov	x2, 16
	add	w27, w27, 1
	add	x1, x19, x1, lsl 4
	add	x21, x21, 4
	ldr	x3, [x0, 104]
	add	x1, x1, 1972
	mov	x0, x22
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	blr	x3
	cmp	w27, 6
	bne	.L2061
.L2167:
	ldr	x24, .LC521
	add	x21, x19, 2068
	ldr	x23, .LC498
	add	x22, x19, 436
	mov	x27, 0
	add	x26, x29, 104
	mov	x28, x24
.L2066:
	mov	x1, x25
	mov	x0, x20
	bl	u_1
	cmp	w0, 1
	add	x2, x19, x27
	str	w0, [x26, x27, lsl 2]
	add	x1, x23, 176
	strb	w0, [x2, 10]
	beq	.L2170
	ldr	x3, [x24, 104]
	cbz	w27, .L2171
.L2065:
	mov	x0, x21
	mov	x2, 64
.L2154:
	blr	x3
.L2063:
	add	x27, x27, 1
	add	x21, x21, 64
	cmp	x27, 2
	add	x22, x22, 256
	bne	.L2066
	b	.L2055
	.p2align 3
.L2166:
	ldr	w0, [x21, 2760]
	cbz	w0, .L2050
	ldr	x1, .LC513
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbnz	x4, .L2172
	b	.L2050
	.p2align 3
.L2165:
	ldr	w0, [x21, 2760]
	cbz	w0, .L2047
	ldr	x1, .LC508
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbnz	x4, .L2173
	b	.L2047
	.p2align 3
.L2112:
	ldr	w2, [x0, 668]
	ldr	w1, [x0, 672]
	cmp	w25, w2
	ccmp	w23, w1, 2, ls
	bls	.L2111
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbz	x4, .L2158
	ldr	w0, [x21, 2820]
	mov	w3, 8
	strh	w2, [x29, 116]
	add	x2, x29, 112
	strh	w1, [x29, 118]
	mov	w1, 107
	strh	w25, [x29, 112]
	strh	w23, [x29, 114]
	blr	x4
	.p2align 2
.L2158:
	mov	w0, -1
.L2150:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2164:
	ldr	w23, [x19, 3252]
	strb	wzr, [x19, 19]
	sub	w0, w23, #1
	cmp	w0, 509
	bhi	.L2114
	ldr	w3, [x19, 3248]
	mov	w24, 1
	add	w23, w23, 1
	add	w3, w3, w24
.L2085:
	mul	w23, w24, w23
	lsl	w25, w3, 4
	mov	w1, 100663296
	lsl	w23, w23, 4
	mul	w0, w25, w23
	lsr	w0, w0, 1
	lsl	w22, w0, 2
	sub	w0, w22, w0
	cmp	w0, w1
	bhi	.L2174
	ldr	w2, [x19, 32]
	sub	w1, w2, #10
	cmp	w1, 31
	bls	.L2175
.L2087:
	ldr	x1, .LC562
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2150
	.p2align 3
.L2162:
	ldr	x1, .LC531
	mov	x0, x20
	bl	ue_v
	cmp	w0, 12
	str	w0, [x19, 2204]
	bhi	.L2073
	ldr	w0, [x21, 2760]
	cbz	w0, .L2074
.L2073:
	ldr	x1, .LC533
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2150
	.p2align 3
.L2175:
	ldr	x3, .LC560
	ldrh	w1, [x3,w1,uxtw #1]
	adr	x3, .Lrtx2089
	add	x1, x3, w1, sxth #2
	br	x1
.Lrtx2089:
	.section	.rodata
	.align	0
	.align	2
.L2089:
	.2byte	(.L2088 - .Lrtx2089) / 4
	.2byte	(.L2121 - .Lrtx2089) / 4
	.2byte	(.L2091 - .Lrtx2089) / 4
	.2byte	(.L2091 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2091 - .Lrtx2089) / 4
	.2byte	(.L2092 - .Lrtx2089) / 4
	.2byte	(.L2094 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2094 - .Lrtx2089) / 4
	.2byte	(.L2095 - .Lrtx2089) / 4
	.2byte	(.L2096 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2087 - .Lrtx2089) / 4
	.2byte	(.L2098 - .Lrtx2089) / 4
	.2byte	(.L2098 - .Lrtx2089) / 4
	.text
	.p2align 3
.L2091:
	mov	w22, 60416
	movk	w22, 0xd, lsl 16
.L2090:
	udiv	w22, w22, w0
	mov	w2, 16
	ldr	x1, .LC564
	mov	w0, 21
	cmp	w22, w2
	csel	w22, w22, w2, ls
	mov	w2, w22
	bl	dprint_vfmw
	ldr	w2, [x19, 3244]
	cmp	w2, w22
	bhi	.L2099
	ldr	w0, [x21, 2760]
	cbz	w0, .L2100
.L2099:
	ldr	x1, .LC566
	mov	w3, w22
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 3244]
	cmp	w0, 16
	bhi	.L2155
	cmp	w22, w0
	csel	w22, w22, w0, cs
.L2155:
	str	w22, [x19, 3244]
.L2100:
	ldr	x1, .LC568
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 20]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2158
	ldr	x1, .LC570
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 21]
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2158
	cbnz	w0, .L2176
.L2102:
	add	x2, x19, 3072
	lsr	w1, w25, 1
	lsr	w0, w23, 1
	stp	w25, w23, [x2, 204]
	stp	w1, w0, [x2, 212]
.L2104:
	ldr	x1, .LC580
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 22]
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2158
	mov	w1, 2
	str	w1, [x19, 3332]
	cbnz	w0, .L2177
	mov	w0, 5
	strb	wzr, [x19, 3307]
	str	w0, [x19, 3320]
	mov	w0, 0
.L2107:
	ldr	w1, [x19, 3308]
	mov	w4, w23
	ldr	w2, [x19, 3312]
	mov	w3, w25
	bl	H264GetDar
	str	w0, [x19, 3316]
	ldr	w1, [x19, 3244]
	cbz	w1, .L2110
	cmp	w22, w1
	csel	w22, w22, w1, ls
.L2110:
	cmp	w22, 16
	mov	w1, 16
	ldr	x0, [x20]
	csel	w22, w22, w1, ls
	str	w22, [x20, 14952]
	ldr	w1, [x0, 28]
	cmp	w1, 25
	beq	.L2178
.L2111:
	add	w22, w22, 1
	str	w22, [x19, 3272]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2098:
	mov	w22, 12582912
	b	.L2090
	.p2align 3
.L2094:
	mov	w22, 30208
	movk	w22, 0x2f, lsl 16
	b	.L2090
	.p2align 3
.L2168:
	mov	x0, x20
	mov	x4, x21
	mov	x2, x22
	mov	x1, x24
	mov	w3, 16
	bl	Scaling_List
	ldr	w0, [x21]
	cmp	w0, 1
	bne	.L2057
	ldr	x0, .LC498
	cmp	w27, 2
	mov	x2, 16
	add	x1, x0, 80
	add	x0, x0, 96
	csel	x1, x0, x1, hi
	ldr	x0, .LC521
	ldr	x3, [x0, 104]
	mov	x0, x22
	blr	x3
	b	.L2057
	.p2align 3
.L2044:
	ldr	x1, .LC504
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
.L2068:
	ldr	x1, .LC525
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2150
	.p2align 3
.L2176:
	ldr	x1, .LC572
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3256]
	ldr	x1, .LC574
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3260]
	ldr	x1, .LC576
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3264]
	ldr	x1, .LC578
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3268]
	ldr	w1, [x19, 3264]
	ldr	w2, [x19, 3256]
	lsl	w1, w1, 1
	ldr	w3, [x19, 3260]
	lsl	w2, w2, 1
	mul	w1, w1, w24
	sub	w4, w25, w2
	lsl	w24, w24, 1
	sub	w3, w4, w3, lsl 1
	sub	w4, w23, w1
	cmp	w3, wzr
	msub	w0, w24, w0, w4
	ccmp	w0, wzr, 4, gt
	ble	.L2102
	add	x4, x19, 3072
	add	w2, w2, w3, lsr 1
	add	w1, w1, w0, lsr 1
	stp	w3, w0, [x4, 204]
	stp	w2, w1, [x4, 212]
	b	.L2104
	.p2align 3
.L2177:
	add	x1, x19, 3292
	mov	x0, x20
	bl	vui_parameters
	cbnz	w0, .L2157
	ldrb	w0, [x19, 3304]
	cbz	w0, .L2157
	ldr	w2, [x19, 3372]
	cmp	w2, wzr
	ccmp	w22, w2, 0, ne
	bcc	.L2179
	ldr	w22, [x19, 3244]
	ldrb	w0, [x19, 3307]
	cmp	w22, w2
	csel	w22, w22, w2, cs
	b	.L2107
.L2179:
	ldr	x1, .LC582
	mov	w3, w22
	mov	w0, 1
	bl	dprint_vfmw
	.p2align 2
.L2157:
	ldrb	w0, [x19, 3307]
	b	.L2107
	.p2align 3
.L2178:
	ldr	w1, [x0, 708]
	cbnz	w1, .L2111
	ldr	w1, [x0, 692]
	cmp	w22, w1
	bls	.L2112
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbz	x4, .L2158
	ldr	w0, [x21, 2820]
	mov	w3, 8
	stp	w22, w1, [x29, 112]
	add	x2, x29, 112
	mov	w1, 106
	blr	x4
	mov	w0, -1
	b	.L2150
	.p2align 3
.L2052:
	ldr	x1, .LC517
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2150
	.p2align 3
.L2163:
	ldr	x1, .LC535
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 16]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2158
	ldr	x1, .LC537
	mov	x0, x20
	bl	se_v
	str	w0, [x19, 2208]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2158
	ldr	x1, .LC539
	mov	x0, x20
	bl	se_v
	str	w0, [x19, 2212]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2158
	ldr	x1, .LC541
	mov	x0, x20
	bl	ue_v
	cmp	w0, 255
	str	w0, [x19, 2216]
	bhi	.L2077
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2077
	cbz	w0, .L2074
	ldr	x23, .LC545
	mov	w22, 0
	b	.L2080
	.p2align 3
.L2180:
	ldr	w0, [x19, 2216]
	cmp	w0, w22
	bls	.L2074
.L2080:
	mov	x1, x23
	mov	x0, x20
	bl	se_v
	add	x1, x19, x22, uxtw 2
	add	w22, w22, 1
	str	w0, [x1, 2220]
	ldr	w0, [x21, 2760]
	cbz	w0, .L2180
	b	.L2158
	.p2align 3
.L2081:
	ldr	x1, .LC551
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2150
	.p2align 3
.L2121:
	mov	w22, 17920
	movk	w22, 0x5, lsl 16
	b	.L2090
	.p2align 3
.L2095:
	mov	w22, 30720
	movk	w22, 0x69, lsl 16
	b	.L2090
	.p2align 3
.L2092:
	mov	w22, 55296
	movk	w22, 0x1b, lsl 16
	b	.L2090
	.p2align 3
.L2088:
	mov	w22, 20992
	movk	w22, 0x2, lsl 16
	b	.L2090
	.p2align 3
.L2096:
	mov	w22, 7864320
	b	.L2090
.L2077:
	ldr	x1, .LC543
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2150
	.p2align 3
.L2170:
	mov	x0, x20
	add	x4, x26, x27, lsl 2
	mov	x2, x21
	mov	x1, x22
	mov	w3, 64
	bl	Scaling_List
	ldr	w0, [x26, x27, lsl 2]
	cmp	w0, 1
	bne	.L2063
	ldr	x1, .LC498
	mov	x2, 64
	mov	x0, x21
	ldr	x3, [x28, 104]
	add	x1, x1, 176
	cbnz	w27, .L2154
	ldr	x1, .LC498
	add	x1, x1, 112
	b	.L2154
	.p2align 3
.L2070:
	ldr	x1, .LC529
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2150
.L2174:
	ldr	x1, .LC559
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2150
.L2160:
	ldr	x2, .LC499
	mov	w3, 10233
	ldr	x1, .LC500
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2150
.L2171:
	ldr	x1, .LC498
	add	x1, x1, 112
	b	.L2065
	.size	ProcessSPS, .-ProcessSPS
	.align	3
.LC498:
	.xword	.LANCHOR0
	.align	3
.LC499:
	.xword	.LC50
	.align	3
.LC500:
	.xword	.LC52
	.align	3
.LC502:
	.xword	.LC501
	.align	3
.LC504:
	.xword	.LC503
	.align	3
.LC506:
	.xword	.LC505
	.align	3
.LC508:
	.xword	.LC507
	.align	3
.LC509:
	.xword	g_event_report
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
.LC517:
	.xword	.LC516
	.align	3
.LC519:
	.xword	.LC518
	.align	3
.LC520:
	.xword	.LC382
	.align	3
.LC521:
	.xword	vfmw_Osal_Func_Ptr_S
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
.LC557:
	.xword	.LC556
	.align	3
.LC559:
	.xword	.LC558
	.align	3
.LC560:
	.xword	.L2089
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
.LC580:
	.xword	.LC579
	.align	3
.LC582:
	.xword	.LC581
	.align	3
.LC584:
	.xword	.LC583
	.align	3
.LC586:
	.xword	.LC585
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Sps_SvcExt
	.type	Sps_SvcExt, %function
Sps_SvcExt:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, 4000
	bl	_mcount
	add	x1, x19, 20480
	mov	w3, 2208
	ldr	x2, [x19, 14968]
	add	x0, x19, 12288
	ldr	x5, [x19, 14960]
	add	x0, x0, 2600
	ldr	w4, [x1, 1596]
	mov	w1, 32
	umull	x3, w4, w3
	add	x3, x2, x3
	ldr	w2, [x3, 28]
	umull	x2, w2, w20
	add	x20, x5, x2
	bl	BsGet
	mov	w21, w0
	ldr	x1, .LC588
	mov	x0, x19
	bl	u_1
	mov	w2, w0
	ldr	x1, .LC590
	mov	w0, 17
	bl	dprint_vfmw
	ldr	x2, .LC592
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	cmp	w0, 1
	beq	.L2192
	ldr	w0, [x20, 40]
	sub	w1, w0, #1
	cmp	w1, 1
	bls	.L2193
.L2184:
	cmp	w0, 1
	beq	.L2194
.L2185:
	ldr	x1, .LC604
	mov	x0, x19
	bl	u_1
	cbnz	w0, .L2195
.L2186:
	ldr	x1, .LC610
	mov	x0, x19
	mov	w19, 0
	bl	u_1
	cmp	w0, 1
	beq	.L2183
	ldr	x1, .LC612
	mov	w2, w0
	ldr	w4, [x20, 40]
	mov	w3, w21
	mov	w0, 1
	bl	dprint_vfmw
.L2183:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2195:
	ldr	x1, .LC606
	mov	x0, x19
	bl	u_1
	mov	w2, w0
	ldr	x1, .LC608
	mov	w0, 17
	bl	dprint_vfmw
	b	.L2186
	.p2align 3
.L2194:
	ldr	x2, .LC600
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	mov	w2, w0
	ldr	x1, .LC602
	mov	w0, 17
	bl	dprint_vfmw
	b	.L2185
	.p2align 3
.L2193:
	ldr	x1, .LC596
	mov	x0, x19
	bl	u_1
	mov	w2, w0
	ldr	x1, .LC598
	mov	w0, 17
	bl	dprint_vfmw
	ldr	w0, [x20, 40]
	b	.L2184
.L2192:
	ldr	x1, .LC594
	mov	w19, -1
	bl	dprint_vfmw
	b	.L2183
	.size	Sps_SvcExt, .-Sps_SvcExt
	.align	3
.LC588:
	.xword	.LC587
	.align	3
.LC590:
	.xword	.LC589
	.align	3
.LC592:
	.xword	.LC591
	.align	3
.LC594:
	.xword	.LC593
	.align	3
.LC596:
	.xword	.LC595
	.align	3
.LC598:
	.xword	.LC597
	.align	3
.LC600:
	.xword	.LC599
	.align	3
.LC602:
	.xword	.LC601
	.align	3
.LC604:
	.xword	.LC603
	.align	3
.LC606:
	.xword	.LC605
	.align	3
.LC608:
	.xword	.LC607
	.align	3
.LC610:
	.xword	.LC609
	.align	3
.LC612:
	.xword	.LC611
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecSPS
	.type	H264_DecSPS, %function
H264_DecSPS:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 65536
	bl	_mcount
	ldr	x2, .LC614
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	mov	w21, w0
	ldr	x1, .LC616
	mov	x0, x19
	bl	u_1
	mov	w26, w0
	ldr	x1, .LC618
	mov	x0, x19
	bl	u_1
	mov	w25, w0
	ldr	x1, .LC620
	mov	x0, x19
	bl	u_1
	mov	w24, w0
	ldr	x1, .LC622
	mov	x0, x19
	bl	u_1
	mov	w23, w0
	ldr	x2, .LC624
	mov	w1, 4
	mov	x0, x19
	bl	u_v
	ldr	x2, .LC626
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	mov	w20, w0
	ldr	x1, .LC628
	mov	x0, x19
	bl	ue_v
	mov	w27, w0
	ldr	w0, [x22, 2760]
	cbnz	w0, .L2225
	ldr	w0, [x19, 14944]
	sub	w0, w0, #1
	cmp	w27, w0
	bhi	.L2226
	sub	w0, w21, #66
	mov	w22, w21
	cmp	w0, 78
	bls	.L2227
.L2201:
	ldr	x1, .LC639
	mov	w2, w21
	mov	w0, 1
	mov	w22, 100
	bl	dprint_vfmw
.L2204:
	cmp	w20, 9
	mov	w2, w20
	bls	.L2224
	cmp	w20, 41
	bhi	.L2224
	mov	w20, 4000
	ldr	x0, [x19, 14960]
	umull	x20, w27, w20
	add	x0, x0, x20
	ldrb	w1, [x0, 23]
	cbz	w1, .L2209
.L2230:
	ldr	x21, .LC642
	mov	x0, x19
	add	x21, x21, 2208
	strb	w26, [x21]
	mov	x1, x21
	strb	w25, [x21, 1]
	strb	w24, [x21, 2]
	strb	w23, [x21, 3]
	stp	w22, w2, [x21, 28]
	str	w27, [x21, 36]
	bl	ProcessSPS
	cbnz	w0, .L2228
	ldr	x1, [x19, 14960]
	mov	x0, x21
	add	x1, x1, x20
	bl	SPSEqual
	cbnz	w0, .L2229
.L2211:
	mov	w0, 86
	cmp	w22, 83
	ccmp	w22, w0, 4, ne
	beq	.L2213
.L2214:
	mov	w0, 0
.L2198:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2227:
	ldr	x1, .LC631
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2203
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2203:
	.section	.rodata
	.align	0
	.align	2
.L2203:
	.byte	(.L2202 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2204 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2204 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2204 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2205 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2204 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2206 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2206 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2201 - .Lrtx2203) / 4
	.byte	(.L2206 - .Lrtx2203) / 4
	.text
	.p2align 3
.L2213:
	mov	x0, x19
	bl	Sps_SvcExt
	cbz	w0, .L2214
	ldr	x1, .LC647
	mov	w0, 1
	bl	dprint_vfmw
.L2225:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2224:
	ldr	x1, .LC641
	mov	w3, 41
	mov	w0, 1
	mov	w20, 4000
	bl	dprint_vfmw
	umull	x20, w27, w20
	ldr	x0, [x19, 14960]
	mov	w2, 41
	add	x0, x0, x20
	ldrb	w1, [x0, 23]
	cbnz	w1, .L2230
.L2209:
	str	w22, [x0, 28]
	ldr	x0, [x19, 14960]
	strb	w26, [x0, x20]
	mov	x0, x19
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	strb	w25, [x1, 1]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	strb	w24, [x1, 2]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	strb	w23, [x1, 3]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	str	w2, [x1, 32]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	str	w27, [x1, 36]
	ldr	x1, [x19, 14960]
	add	x1, x1, x20
	bl	ProcessSPS
	cbnz	w0, .L2231
	ldr	x0, [x19, 14960]
	mov	w1, 1
	add	x0, x0, x20
	strb	w1, [x0, 24]
	ldr	x0, [x19, 14960]
	add	x20, x0, x20
	strb	w1, [x20, 23]
	b	.L2211
	.p2align 3
.L2226:
	ldr	x1, .LC629
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 14944]
	sub	w0, w1, #1
	cmp	w27, w0
	bls	.L2225
	ldr	x0, .LC630
	ldr	x4, [x0]
	cbz	x4, .L2225
	ldr	w0, [x22, 2820]
	add	x2, x29, 104
	stp	w27, w1, [x29, 104]
	mov	w3, 8
	mov	w1, 109
	blr	x4
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	mov	w0, -1
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2205:
	ldr	x1, .LC635
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2204
	.p2align 3
.L2206:
	ldr	x1, .LC637
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2204
	.p2align 3
.L2202:
	ldr	x1, .LC633
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2204
	.p2align 3
.L2229:
	ldr	x3, .LC645
	mov	w1, 1
	ldr	x0, [x19, 14960]
	mov	x2, 4000
	strb	w1, [x21, 24]
	ldr	x3, [x3, 112]
	add	x0, x0, x20
	strb	w1, [x21, 23]
	mov	x1, x21
	blr	x3
	b	.L2211
	.p2align 3
.L2228:
	ldr	x1, .LC644
	mov	w3, w27
	mov	w2, 10859
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2198
.L2231:
	ldr	x1, .LC644
	mov	w2, 10884
	mov	w3, w27
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x19, 14960]
	mov	w2, 1
	mov	w0, -1
	add	x1, x1, x20
	strb	w2, [x1, 24]
	ldr	x1, [x19, 14960]
	add	x20, x1, x20
	strb	wzr, [x20, 23]
	b	.L2198
	.size	H264_DecSPS, .-H264_DecSPS
	.align	3
.LC614:
	.xword	.LC613
	.align	3
.LC616:
	.xword	.LC615
	.align	3
.LC618:
	.xword	.LC617
	.align	3
.LC620:
	.xword	.LC619
	.align	3
.LC622:
	.xword	.LC621
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
.LC629:
	.xword	.LC398
	.align	3
.LC630:
	.xword	g_event_report
	.align	3
.LC631:
	.xword	.L2203
	.align	3
.LC633:
	.xword	.LC632
	.align	3
.LC635:
	.xword	.LC634
	.align	3
.LC637:
	.xword	.LC636
	.align	3
.LC639:
	.xword	.LC638
	.align	3
.LC641:
	.xword	.LC640
	.align	3
.LC642:
	.xword	.LANCHOR2
	.align	3
.LC644:
	.xword	.LC643
	.align	3
.LC645:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC647:
	.xword	.LC646
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	PassBytes
	.type	PassBytes, %function
PassBytes:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	mov	w19, w1
	bl	_mcount
	ldr	x0, [x20, 632]
	cmp	w19, wzr
	ccmp	x0, xzr, 4, ne
	beq	.L2241
	ldrb	w2, [x0]
	sbfiz	x1, x2, 5, 32
	add	x1, x0, x1
	ldr	x1, [x1, 8]
	cbz	x1, .L2241
	ldr	w1, [x0, 76]
	cmp	w2, 1
	ccmp	w1, 2, 2, ls
	bhi	.L2241
	cmp	w1, w2
	bls	.L2241
	uxtw	x5, w2
	add	x3, x0, x5, lsl 5
	ldr	w1, [x3, 28]
	ldr	w3, [x3, 16]
	add	w1, w1, w19, lsl 3
	lsl	w3, w3, 3
	cmp	w1, w3
	bhi	.L2236
	b	.L2234
	.p2align 3
.L2237:
	ldr	w4, [x6, 28]
	ldr	w6, [x6, 16]
	sub	w4, w4, w3
	add	w1, w1, w4
	lsl	w3, w6, 3
	cmp	w1, w3
	bls	.L2234
.L2236:
	add	x0, x0, x5, lsl 5
	add	w5, w2, 1
	mov	x2, x5
	str	w3, [x0, 28]
	ldr	x0, [x20, 632]
	ldrb	w4, [x0]
	add	w4, w4, 1
	strb	w4, [x0]
	ldr	x0, [x20, 632]
	add	x6, x0, x5, lsl 5
	ldr	w4, [x0, 76]
	cmp	w4, w5
	bhi	.L2237
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2234:
	add	x5, x0, x5, lsl 5
	mov	w0, 1
	str	w1, [x5, 28]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2241:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	PassBytes, .-PassBytes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	GetBytes
	.type	GetBytes, %function
GetBytes:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x19, x1
	mov	x0, x30
	mov	w20, w2
	bl	_mcount
	cbz	x19, .L2257
	ldr	x1, [x21, 632]
	cmp	x1, xzr
	ccmp	w20, wzr, 4, ne
	ble	.L2257
	ldrb	w2, [x1]
	sbfiz	x0, x2, 5, 32
	add	x0, x1, x0
	ldr	x0, [x0, 8]
	cbz	x0, .L2257
	ldr	w0, [x1, 76]
	cmp	w2, 1
	ccmp	w0, 2, 2, ls
	bhi	.L2257
	cmp	w0, w2
	bls	.L2257
	mov	w6, 0
.L2252:
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
	bcs	.L2247
	ldrb	w0, [x4, x0]
	add	w6, w6, 1
	strb	w0, [x19]
	cmp	w6, w20
	add	x19, x19, 1
	add	x5, x5, 1
	ldr	x0, [x21, 632]
	add	x0, x0, x7
	ldr	w3, [x0, 28]
	add	w3, w3, 8
	str	w3, [x0, 28]
	bcc	.L2250
	b	.L2249
	.p2align 3
.L2251:
	ldrb	w1, [x5], 1
	add	w6, w6, 1
	strb	w1, [x19], 1
	cmp	w6, w20
	ldr	x3, [x21, 632]
	add	x3, x3, x7
	ldr	w4, [x3, 28]
	add	w4, w4, 8
	str	w4, [x3, 28]
	bcs	.L2249
.L2250:
	cmp	x8, x5
	bne	.L2251
	ldr	x1, [x21, 632]
.L2247:
	ldrb	w0, [x1]
	add	w2, w2, 1
	add	w0, w0, 1
	strb	w0, [x1]
	ldr	x1, [x21, 632]
	ldr	w0, [x1, 76]
	cmp	w0, w2
	bhi	.L2252
	mov	w0, w6
	b	.L2246
	.p2align 3
.L2249:
	mov	w0, w20
.L2246:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2257:
	mov	w0, -1
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	GetBytes, .-GetBytes
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecFramePackingSEI
	.type	H264_DecFramePackingSEI, %function
H264_DecFramePackingSEI:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 24576
	bl	_mcount
	add	x20, x21, 3192
	ldr	x1, .LC650
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 24]
	ldr	x2, .LC652
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	sxtb	w0, w0
	strb	w0, [x20, 1]
	cbz	w0, .L2265
.L2260:
	ldr	x2, .LC684
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x21, 3194]
	mov	w1, 1
	strb	w1, [x21, 3192]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2265:
	ldr	x2, .LC654
	mov	w1, 7
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 16]
	ldr	x2, .LC656
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 3]
	ldr	x2, .LC658
	mov	w1, 6
	mov	x0, x19
	bl	u_v
	str	w0, [x20, 20]
	ldr	x2, .LC660
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 4]
	ldr	x2, .LC662
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 5]
	ldr	x2, .LC664
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 6]
	ldr	x2, .LC666
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 7]
	ldr	x2, .LC668
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 8]
	ldr	x2, .LC670
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 9]
	ldrsb	w1, [x20, 3]
	cbnz	w1, .L2261
	ldr	w0, [x20, 16]
	cmp	w0, 5
	beq	.L2261
	ldr	x2, .LC672
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 10]
	ldr	x2, .LC674
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 11]
	ldr	x2, .LC676
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 12]
	ldr	x2, .LC678
	mov	w1, 1
	mov	x0, x19
	bl	u_v
	strb	w0, [x20, 13]
.L2261:
	ldr	x2, .LC680
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x21, 3220]
	ldr	x1, .LC682
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 3224]
	b	.L2260
	.size	H264_DecFramePackingSEI, .-H264_DecFramePackingSEI
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_Sei_Get_Dpb_Output_Time
	.type	H264_Sei_Get_Dpb_Output_Time, %function
H264_Sei_Get_Dpb_Output_Time:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	mov	w1, 2208
	ldr	x9, [x19, 14968]
	add	x3, x19, 24576
	ldr	x8, [x19, 14960]
	ldr	w2, [x0, 1596]
	mov	w0, 4000
	ldr	w5, [x3, 3248]
	ldr	w6, [x3, 3244]
	umull	x1, w2, w1
	add	w2, w5, 1
	ldr	w5, [x3, 3232]
	add	x1, x9, x1
	add	w6, w6, 1
	cmp	w6, 1
	ccmp	w5, wzr, 0, ne
	ldr	w1, [x1, 28]
	str	w2, [x3, 3248]
	ldr	w2, [x3, 3236]
	umull	x0, w1, w0
	str	w6, [x3, 3244]
	add	x0, x8, x0
	str	w5, [x3, 3252]
	add	x0, x0, 3292
	str	w2, [x3, 3260]
	ldr	w1, [x0, 52]
	str	w1, [x3, 3296]
	ldr	w1, [x0, 56]
	str	w1, [x3, 3300]
	bne	.L2267
	ldr	w5, [x3, 3256]
	add	w5, w5, 2
	str	w5, [x3, 3252]
.L2267:
	cmp	w6, 1
	add	x4, x3, 3240
	beq	.L2274
	ldrb	w1, [x4, 81]
	cmp	w1, 1
	ldr	x1, [x4, 48]
	add	x1, x1, x5, uxtw
	str	x1, [x4, 40]
	beq	.L2275
.L2269:
	strb	wzr, [x3, 3321]
	add	x1, x1, x2, uxtw
	lsr	x1, x1, 1
	ldr	w2, [x0, 76]
	ldr	w4, [x0, 52]
	sub	x2, x1, x2
	mul	x2, x2, x4
	str	x2, [x3, 3264]
	ldr	w0, [x0, 76]
	str	w5, [x3, 3256]
	sub	x1, x1, x0
	str	x1, [x3, 3272]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2274:
	mov	x1, 0
	str	xzr, [x3, 3280]
	str	xzr, [x3, 3288]
	b	.L2269
	.p2align 3
.L2275:
	str	x1, [x4, 48]
	b	.L2269
	.size	H264_Sei_Get_Dpb_Output_Time, .-H264_Sei_Get_Dpb_Output_Time
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_Get_Last_IDR_Frame_Info
	.type	H264_Get_Last_IDR_Frame_Info, %function
H264_Get_Last_IDR_Frame_Info:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cmp	w20, 5
	beq	.L2281
.L2276:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2281:
	ldr	x0, [x19]
	ldr	x0, [x0, 56]
	cmn	x0, #1
	beq	.L2276
	ldr	x1, [x19, 27848]
	str	x0, [x19, 27880]
	str	x1, [x19, 27888]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_Get_Last_IDR_Frame_Info, .-H264_Get_Last_IDR_Frame_Info
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_Sei_Get_Frame_Pts
	.type	H264_Sei_Get_Frame_Pts, %function
H264_Sei_Get_Frame_Pts:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 24576
	ldr	x3, [x19, 27848]
	ldr	x6, [x19, 27880]
	ldr	x7, [x19, 27888]
	ldr	w4, [x1, 3296]
	ldr	w5, [x1, 3300]
	cbz	w4, .L2285
	mov	w1, w4
	mov	w2, w5
	b	.L2284
	.p2align 3
.L2286:
	mov	w1, w0
.L2284:
	udiv	w0, w2, w1
	msub	w0, w0, w1, w2
	mov	w2, w1
	cbnz	w0, .L2286
.L2283:
	udiv	w4, w4, w1
	sub	x0, x3, x7
	lsl	w2, w0, 6
	add	x19, x19, 61440
	sub	w2, w2, w0
	lsl	w2, w2, 1
	sub	w0, w2, w0
	lsl	w0, w0, 3
	udiv	w1, w5, w1
	mul	w0, w0, w4
	udiv	w1, w0, w1
	add	x1, x1, x6
	str	x1, [x19, 3328]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2285:
	mov	w1, w5
	b	.L2283
	.size	H264_Sei_Get_Frame_Pts, .-H264_Sei_Get_Frame_Pts
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecPicTimingSEI
	.type	H264_DecPicTimingSEI, %function
H264_DecPicTimingSEI:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	w19, 4000
	bl	_mcount
	ldr	w0, [x20, 15012]
	ldr	x3, [x20, 14960]
	umull	x19, w0, w19
	add	x19, x3, x19
	ldrb	w0, [x19, 23]
	cbnz	w0, .L2288
	ldr	w1, [x20, 14944]
	cmp	w1, wzr
	ble	.L2289
	ldrb	w0, [x3, 23]
	cbnz	w0, .L2306
	sub	w1, w1, #1
	add	x0, x3, 4000
	add	x2, x1, 1
	lsl	x1, x2, 6
	sub	x1, x1, x2
	lsl	x1, x1, 1
	sub	x1, x1, x2
	add	x2, x3, x1, lsl 5
	b	.L2292
	.p2align 3
.L2293:
	ldrb	w1, [x1]
	cbnz	w1, .L2290
.L2292:
	cmp	x0, x2
	mov	x19, x0
	add	x0, x0, 4000
	sub	x1, x0, #3977
	bne	.L2293
.L2289:
	ldr	x1, .LC686
	mov	w0, 1
	mov	w19, -1
	bl	dprint_vfmw
.L2294:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2306:
	mov	x19, x3
	.p2align 2
.L2290:
	cbz	x19, .L2289
.L2288:
	ldrb	w0, [x19, 22]
	cbz	w0, .L2296
	ldrb	w0, [x19, 3299]
	cbz	w0, .L2307
	ldr	w1, [x19, 3676]
	ldr	w22, [x19, 3680]
	add	w1, w1, 1
	add	w22, w22, 1
.L2300:
	ldr	x2, .LC688
	mov	x0, x20
	add	x21, x20, 24576
	bl	u_v
	ldr	x2, .LC690
	mov	w1, w22
	str	w0, [x21, 3232]
	mov	x0, x20
	bl	u_v
	str	w0, [x21, 3236]
	add	x1, x20, 65536
	ldr	x0, .LC691
	ldrsw	x1, [x1, 2820]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L2308
.L2296:
	ldrb	w0, [x19, 3303]
	mov	w19, 0
	cbz	w0, .L2294
	ldr	x2, .LC693
	mov	w1, 4
	mov	x0, x20
	bl	u_v
	add	x1, x20, 24576
	strb	w0, [x1, 3228]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2307:
	ldrb	w0, [x19, 3302]
	cbz	w0, .L2296
	ldr	w1, [x19, 3988]
	ldr	w22, [x19, 3992]
	add	w1, w1, 1
	add	w22, w22, 1
	b	.L2300
	.p2align 3
.L2308:
	ldr	x1, [x0, 176]
	mov	x0, 4294967296
	cmp	x1, x0
	bne	.L2296
	mov	x0, x20
	bl	H264_Sei_Get_Dpb_Output_Time
	b	.L2296
	.size	H264_DecPicTimingSEI, .-H264_DecPicTimingSEI
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
.LC691:
	.xword	s_pstVfmwChan
	.align	3
.LC693:
	.xword	.LC692
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecSEI
	.type	H264_DecSEI, %function
H264_DecSEI:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x27, x0
	mov	x0, x30
	add	x21, x27, 65536
	bl	_mcount
	strb	wzr, [x29, 127]
	ldr	x0, .LC694
	ldrsw	x1, [x21, 2820]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L2543
.L2310:
	ldr	x0, [x27, 632]
	mov	w1, 32
	str	w1, [x0, 28]
.L2311:
	add	x20, x27, 12288
	mov	w23, 0
	add	x19, x20, 2600
	b	.L2314
	.p2align 3
.L2545:
	mov	w1, 8
	mov	x0, x19
	bl	BsSkip
	cmp	w22, wzr
	ble	.L2313
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2544
.L2314:
	mov	w2, 1
	add	x1, x29, 127
	mov	x0, x27
	bl	GetBytes
	mov	w22, w0
	ldr	w2, [x27, 14912]
	ldr	w0, [x27, 14920]
	ldrb	w1, [x29, 127]
	add	w0, w0, 8
	cmp	w0, w2, lsl 3
	add	w23, w23, w1
	bls	.L2545
.L2313:
	ldr	x1, .LC696
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2316
	.p2align 3
.L2544:
	ldr	x26, .LC702
	mov	w24, 0
	ldr	x22, .LC699
	add	x0, x26, 216
	str	x0, [x29, 104]
	.p2align 2
.L2495:
	mov	w19, 0
	add	x25, x20, 2600
	b	.L2320
	.p2align 3
.L2547:
	mov	w1, 8
	mov	x0, x25
	bl	BsSkip
	cmp	w28, wzr
	ble	.L2318
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2546
.L2320:
	mov	w2, 1
	add	x1, x29, 127
	mov	x0, x27
	bl	GetBytes
	mov	w28, w0
	ldr	w2, [x27, 14912]
	ldr	w0, [x27, 14920]
	ldrb	w1, [x29, 127]
	add	w0, w0, 8
	cmp	w0, w2, lsl 3
	add	w19, w19, w1
	bls	.L2547
.L2318:
	ldr	x1, .LC698
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L2316:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2546:
	cmp	w19, 409600
	bgt	.L2318
	ldr	x0, [x27, 632]
	ldr	w1, [x0, 76]
	ldr	w2, [x0, 28]
	cmp	w1, 2
	beq	.L2548
.L2322:
	cmp	w23, 45
	bls	.L2549
.L2323:
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2550
.L2485:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2488
	.p2align 3
.L2489:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2488:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2489
	.p2align 2
.L2538:
	ldr	w0, [x21, 1360]
.L2350:
	cmp	w0, 3
	bhi	.L2551
.L2490:
	mov	w23, 0
	add	x19, x20, 2600
	b	.L2494
	.p2align 3
.L2492:
	mov	w1, 8
	mov	x0, x19
	bl	BsSkip
	cmp	w25, wzr
	ble	.L2493
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2552
.L2494:
	mov	w2, 1
	add	x1, x29, 127
	mov	x0, x27
	bl	GetBytes
	mov	w25, w0
	ldr	w2, [x27, 14912]
	ldr	w0, [x27, 14920]
	ldrb	w1, [x29, 127]
	add	w0, w0, 8
	cmp	w0, w2, lsl 3
	add	w23, w23, w1
	bls	.L2492
.L2493:
	mov	w0, 0
.L2553:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2552:
	cmp	w0, 128
	bne	.L2495
	mov	w0, 0
	b	.L2553
	.p2align 3
.L2549:
	ldrh	w0, [x22,w23,uxtw #1]
	adr	x1, .Lrtx2325
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx2325:
	.section	.rodata
	.align	0
	.align	2
.L2325:
	.2byte	(.L2324 - .Lrtx2325) / 4
	.2byte	(.L2326 - .Lrtx2325) / 4
	.2byte	(.L2327 - .Lrtx2325) / 4
	.2byte	(.L2328 - .Lrtx2325) / 4
	.2byte	(.L2329 - .Lrtx2325) / 4
	.2byte	(.L2330 - .Lrtx2325) / 4
	.2byte	(.L2331 - .Lrtx2325) / 4
	.2byte	(.L2332 - .Lrtx2325) / 4
	.2byte	(.L2333 - .Lrtx2325) / 4
	.2byte	(.L2334 - .Lrtx2325) / 4
	.2byte	(.L2335 - .Lrtx2325) / 4
	.2byte	(.L2336 - .Lrtx2325) / 4
	.2byte	(.L2337 - .Lrtx2325) / 4
	.2byte	(.L2338 - .Lrtx2325) / 4
	.2byte	(.L2339 - .Lrtx2325) / 4
	.2byte	(.L2340 - .Lrtx2325) / 4
	.2byte	(.L2341 - .Lrtx2325) / 4
	.2byte	(.L2342 - .Lrtx2325) / 4
	.2byte	(.L2343 - .Lrtx2325) / 4
	.2byte	(.L2344 - .Lrtx2325) / 4
	.2byte	(.L2345 - .Lrtx2325) / 4
	.2byte	(.L2346 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2323 - .Lrtx2325) / 4
	.2byte	(.L2347 - .Lrtx2325) / 4
	.text
.L2347:
	mov	w1, w19
	mov	x0, x27
	ldr	w25, [x27, 14920]
	bl	H264_DecFramePackingSEI
	ldr	w3, [x27, 14920]
	sub	w0, w3, w25
	lsl	w25, w19, 3
	cmp	w0, w25
	bge	.L2478
	sub	w26, w25, w0
	ldr	w0, [x27, 14912]
	cmp	w26, wzr
	add	w23, w26, 7
	csel	w23, w23, w26, lt
	lsl	w0, w0, 3
	asr	w23, w23, 3
	cmp	w23, wzr
	ble	.L2480
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2480
	add	x28, x20, 2600
	mov	w25, 0
	b	.L2481
	.p2align 3
.L2482:
	ldr	w0, [x27, 14912]
	ldr	w3, [x27, 14920]
	lsl	w0, w0, 3
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2480
.L2481:
	mov	w1, 8
	mov	x0, x28
	add	w25, w25, 1
	bl	BsSkip
	cmp	w25, w23
	bne	.L2482
	ldr	w0, [x27, 14912]
	ldr	w3, [x27, 14920]
	lsl	w0, w0, 3
.L2480:
	asr	w1, w26, 31
	lsr	w2, w1, 29
	add	w1, w26, w2
	and	w1, w1, 7
	sub	w1, w1, w2
	add	w3, w1, w3
	cmp	w3, w0
	bls	.L2554
.L2478:
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbz	w0, #31, .L2538
	ldr	x1, .LC704
	mov	w3, 12148
	ldr	x2, .LC760
	mov	w0, 20
	bl	dprint_vfmw
	ldr	w0, [x21, 1360]
	b	.L2350
.L2346:
	ldr	x1, .LC757
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2555
.L2472:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2475
	.p2align 3
.L2476:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2475:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2476
	b	.L2538
.L2345:
	ldr	x1, .LC755
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2556
.L2467:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2470
	.p2align 3
.L2471:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2470:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2471
	b	.L2538
.L2344:
	ldr	x1, .LC753
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2557
.L2462:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2465
	.p2align 3
.L2466:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2465:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2466
	b	.L2538
.L2343:
	ldr	x1, .LC751
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2558
.L2457:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2460
	.p2align 3
.L2461:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2460:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2461
	b	.L2538
.L2342:
	ldr	x1, .LC749
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2559
.L2452:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2455
	.p2align 3
.L2456:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2455:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2456
	b	.L2538
.L2341:
	ldr	x1, .LC747
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2560
.L2447:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2450
	.p2align 3
.L2451:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2450:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2451
	b	.L2538
.L2340:
	ldr	x1, .LC745
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2561
.L2442:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2445
	.p2align 3
.L2446:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2445:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2446
	b	.L2538
.L2339:
	ldr	x1, .LC743
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2562
.L2437:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2440
	.p2align 3
.L2441:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2440:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2441
	b	.L2538
.L2338:
	ldr	x1, .LC741
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2563
.L2432:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2435
	.p2align 3
.L2436:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2435:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2436
	b	.L2538
.L2337:
	ldr	x1, .LC739
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2564
.L2427:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2430
	.p2align 3
.L2431:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2430:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2431
	b	.L2538
.L2336:
	ldr	x1, .LC737
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2565
.L2422:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2425
	.p2align 3
.L2426:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2425:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2426
	b	.L2538
.L2335:
	ldr	x1, .LC735
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2566
.L2417:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2420
	.p2align 3
.L2421:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2420:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2421
	b	.L2538
.L2334:
	ldr	x1, .LC733
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2567
.L2412:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2415
	.p2align 3
.L2416:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2415:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2416
	b	.L2538
.L2333:
	ldr	x1, .LC731
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2568
.L2407:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2410
	.p2align 3
.L2411:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2410:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2411
	b	.L2538
.L2332:
	ldr	x1, .LC729
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2569
.L2402:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2405
	.p2align 3
.L2406:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2405:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2406
	b	.L2538
.L2331:
	ldr	x1, .LC727
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	cmp	w19, wzr
	ble	.L2399
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2399
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2400
	.p2align 3
.L2401:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2399
.L2400:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2401
.L2399:
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbz	w0, #31, .L2538
	ldr	x2, .LC702
	mov	w3, 11720
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	ldr	w0, [x21, 1360]
	b	.L2350
.L2330:
	cbnz	w24, .L2329
	ldr	x1, .LC714
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	ldr	w23, [x21, 1360]
	cmp	w23, 3
	bhi	.L2570
.L2374:
	ldr	w0, [x21, 2820]
	bl	GetUsd
	uxtw	x1, w23
	add	x1, x1, 8192
	add	x1, x27, x1, lsl 3
	str	x0, [x1, 1368]
	ldr	w0, [x21, 1360]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x6, [x0, 1368]
	cbz	x6, .L2498
	ldr	x3, [x27, 632]
	cmp	w19, 1024
	mov	w28, 1024
	csel	w28, w19, w28, le
	ldrb	w2, [x3]
	ldr	w5, [x3, 76]
	cmp	w2, w5
	bcs	.L2499
	mov	w25, 0
	.p2align 2
.L2376:
	ubfiz	x1, x2, 5, 32
	add	w2, w2, 1
	add	x1, x3, x1
	cmp	w2, w5
	ldr	w0, [x1, 28]
	ldr	w1, [x1, 16]
	add	w0, w0, 7
	sub	w0, w1, w0, lsr 3
	add	w25, w25, w0
	bne	.L2376
	mov	w0, w25
.L2375:
	cmp	w28, w0
	csel	w25, w25, w28, gt
	cbnz	w24, .L2571
	mov	w23, 0
	mov	w26, 0
.L2378:
	sub	w2, w25, w23
	cmp	w2, wzr
	ble	.L2572
	ldr	w0, [x21, 1360]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x1, [x0, 1368]
	mov	x0, x27
	bl	GetBytes
	cmp	w0, wzr
	mov	w25, w0
	ble	.L2573
	sub	w0, w28, w26
	cmp	w25, w0
	bge	.L2384
	ldr	w0, [x21, 1360]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x0, [x0, 1368]
	str	w25, [x0, 1052]
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2385
	add	x19, x20, 2600
	mov	w23, 0
	b	.L2386
	.p2align 3
.L2389:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2385
.L2386:
	mov	w1, 8
	mov	x0, x19
	add	w23, w23, 1
	bl	BsSkip
	cmp	w25, w23
	bne	.L2389
.L2385:
	ldr	w0, [x21, 1360]
	cmp	w24, 1
	ldr	x1, [x27]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x1, [x1, 56]
	ldr	x0, [x0, 1368]
	str	x1, [x0, 1056]
	mov	w0, 8
	mov	w1, 9
	csel	w1, w0, w1, eq
	ldr	w0, [x21, 1360]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x0, [x0, 1368]
	str	w1, [x0, 1040]
	ldr	x0, .LC721
	ldr	x5, [x0]
.L2541:
	ldr	w0, [x21, 1360]
	ldr	w1, [x21, 2780]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x0, [x0, 1368]
	str	w1, [x0, 1044]
	cbz	x5, .L2395
	ldr	w0, [x21, 1360]
	mov	w3, 1064
	mov	w1, 6
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x2, [x0, 1368]
	ldr	w0, [x21, 2820]
	blr	x5
.L2395:
	ldr	w0, [x21, 1360]
	add	w0, w0, 1
	str	w0, [x21, 1360]
	cmp	w0, 3
	bls	.L2490
.L2551:
	ldr	x1, .LC759
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2316
.L2328:
	ldr	x1, .LC710
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2574
.L2367:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2370
	.p2align 3
.L2371:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2370:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2371
	b	.L2538
.L2324:
	add	x0, x27, 24576
	mov	w3, 1
	ldr	w1, [x0, 3240]
	strb	w3, [x0, 3321]
	mov	w3, w19
	add	w1, w1, 1
	str	w1, [x0, 3240]
	ldr	x1, .LC701
	str	wzr, [x0, 3248]
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2575
.L2348:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2352
	.p2align 3
.L2353:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2352:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2353
	b	.L2538
.L2327:
	ldr	x1, .LC708
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2576
.L2362:
	cmp	w19, wzr
	ble	.L2538
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2365
	.p2align 3
.L2366:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2538
.L2365:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2366
	b	.L2538
.L2326:
	ldr	x1, .LC706
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	ldr	w25, [x27, 14920]
	mov	w1, w19
	mov	x0, x27
	bl	H264_DecPicTimingSEI
	ldr	w3, [x27, 14920]
	sub	w0, w3, w25
	lsl	w25, w19, 3
	cmp	w0, w25
	bge	.L2355
	sub	w25, w25, w0
	ldr	w0, [x27, 14912]
	cmp	w25, wzr
	add	w23, w25, 7
	csel	w23, w23, w25, lt
	lsl	w0, w0, 3
	asr	w23, w23, 3
	cmp	w23, wzr
	ble	.L2357
	add	w1, w3, 8
	cmp	w0, w1
	bcc	.L2357
	add	x28, x20, 2600
	mov	w26, 0
	b	.L2358
	.p2align 3
.L2359:
	ldr	w0, [x27, 14912]
	ldr	w3, [x27, 14920]
	lsl	w0, w0, 3
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2357
.L2358:
	mov	w1, 8
	mov	x0, x28
	add	w26, w26, 1
	bl	BsSkip
	cmp	w23, w26
	bne	.L2359
	ldr	w0, [x27, 14912]
	ldr	w3, [x27, 14920]
	lsl	w0, w0, 3
.L2357:
	asr	w1, w25, 31
	lsr	w2, w1, 29
	add	w1, w25, w2
	and	w1, w1, 7
	sub	w1, w1, w2
	add	w3, w1, w3
	cmp	w3, w0
	bls	.L2577
.L2355:
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbz	w0, #31, .L2538
	ldr	x2, .LC702
	mov	w3, 11468
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	ldr	w0, [x21, 1360]
	b	.L2350
.L2329:
	ldr	x1, .LC712
	mov	w3, w19
	mov	w0, 20
	mov	w24, 1
	bl	dprint_vfmw
	ldr	w23, [x21, 1360]
	cmp	w23, 3
	bls	.L2374
.L2570:
	ldr	w0, [x21, 2820]
	mov	w23, 0
	ldr	x1, [x21, 1368]
	bl	FreeUsdByDec
	ldr	w0, [x21, 2820]
	ldr	x1, [x21, 1376]
	bl	FreeUsdByDec
	ldr	w0, [x21, 2820]
	ldr	x1, [x21, 1384]
	bl	FreeUsdByDec
	ldr	w0, [x21, 2820]
	ldr	x1, [x21, 1392]
	bl	FreeUsdByDec
	str	wzr, [x21, 1360]
	add	x0, x21, 1024
	stp	xzr, xzr, [x0, 344]
	stp	xzr, xzr, [x0, 360]
	b	.L2374
	.p2align 3
.L2548:
	ldr	w0, [x0, 60]
	add	w2, w2, w0
	lsr	w2, w2, 3
	b	.L2322
.L2384:
	ldr	w0, [x21, 1360]
	sub	w23, w19, w26
	cmp	w28, w19
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x0, [x0, 1368]
	str	w23, [x0, 1052]
	bcc	.L2578
.L2391:
	cmp	w23, wzr
	ble	.L2385
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2385
	add	x19, x20, 2600
	mov	w25, 0
	b	.L2393
	.p2align 3
.L2394:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2385
.L2393:
	mov	w1, 8
	mov	x0, x19
	add	w25, w25, 1
	bl	BsSkip
	cmp	w23, w25
	bne	.L2394
	b	.L2385
.L2543:
	ldr	x2, [x0, 176]
	mov	x1, 4294967296
	cmp	x2, x1
	bne	.L2310
	ldr	w0, [x0, 172]
	cmp	w0, 1
	bne	.L2310
	ldr	x0, [x27, 632]
	mov	w1, 48
	str	w1, [x0, 28]
	b	.L2311
.L2577:
	add	x0, x20, 2600
	bl	BsSkip
	b	.L2355
.L2554:
	add	x0, x20, 2600
	bl	BsSkip
	b	.L2478
.L2571:
	strb	w24, [x6, 1026]
	mov	w1, 8
	ldr	x2, .LC716
	mov	x0, x27
	ldr	w3, [x21, 1360]
	add	x3, x3, 8192
	add	x3, x27, x3, lsl 3
	ldr	x23, [x3, 1368]
	bl	u_v
	strb	w0, [x23, 1027]
	ldr	w0, [x21, 1360]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x23, [x0, 1368]
	ldrb	w0, [x23, 1027]
	cmp	w0, 255
	beq	.L2379
	strb	wzr, [x23, 1028]
	mov	w23, 3
	mov	w26, w23
.L2380:
	ldr	w0, [x21, 1360]
	mov	w1, 16
	ldr	x2, .LC720
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x5, [x0, 1368]
	mov	x0, x27
	str	x5, [x29, 96]
	bl	u_v
	ldr	x5, [x29, 96]
	mov	w1, w23
	strh	w0, [x5, 1030]
	mov	x0, x27
	bl	PassBytes
	cmp	w25, w23
	bne	.L2378
	ldr	w0, [x21, 1360]
	ldr	x1, [x27]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x1, [x1, 56]
	ldr	x0, [x0, 1368]
	str	x1, [x0, 1056]
	mov	w1, 8
	ldr	x0, .LC721
	ldr	x5, [x0]
	ldr	w0, [x21, 1360]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x0, [x0, 1368]
	str	w1, [x0, 1040]
	b	.L2541
.L2578:
	sub	w1, w19, w28
	mov	x0, x27
	bl	PassBytes
	tbz	w0, #31, .L2391
	ldr	x2, .LC702
	mov	w3, 11667
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2391
.L2499:
	mov	w0, 0
	mov	w25, 0
	b	.L2375
.L2556:
	ldr	x2, .LC702
	mov	w3, 12070
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2467
.L2555:
	ldr	x1, .LC704
	mov	w3, 12096
	ldr	x2, .LC760
	mov	w0, 20
	bl	dprint_vfmw
	b	.L2472
.L2560:
	ldr	x2, .LC702
	mov	w3, 11966
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2447
.L2559:
	ldr	x2, .LC702
	mov	w3, 11992
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2452
.L2558:
	ldr	x2, .LC702
	mov	w3, 12018
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2457
.L2557:
	ldr	x2, .LC702
	mov	w3, 12044
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2462
.L2550:
	ldr	x1, .LC704
	mov	w3, 12160
	ldr	x2, [x29, 104]
	mov	w0, 20
	bl	dprint_vfmw
	b	.L2485
.L2576:
	ldr	x2, .LC702
	mov	w3, 11480
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2362
.L2569:
	ldr	x2, .LC702
	mov	w3, 11732
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2402
.L2575:
	ldr	x2, .LC702
	mov	w3, 11415
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2348
.L2574:
	ldr	x2, .LC702
	mov	w3, 11506
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2367
.L2568:
	ldr	x2, .LC702
	mov	w3, 11758
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2407
.L2567:
	ldr	x2, .LC702
	mov	w3, 11784
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2412
.L2566:
	ldr	x2, .LC702
	mov	w3, 11810
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2417
.L2565:
	ldr	x2, .LC702
	mov	w3, 11836
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2422
.L2564:
	ldr	x2, .LC702
	mov	w3, 11862
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2427
.L2563:
	ldr	x2, .LC702
	mov	w3, 11888
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2432
.L2562:
	ldr	x2, .LC702
	mov	w3, 11914
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2437
.L2561:
	ldr	x2, .LC702
	mov	w3, 11940
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2442
.L2379:
	ldr	x2, .LC718
	mov	w1, 8
	mov	x0, x27
	bl	u_v
	strb	w0, [x23, 1028]
	mov	w23, 4
	mov	w26, w23
	b	.L2380
.L2498:
	mov	w0, -1
	b	.L2316
.L2572:
	ldr	x1, .LC723
	mov	w0, 1
	bl	dprint_vfmw
.L2539:
	ldr	w1, [x21, 1360]
	ldr	w0, [x21, 2820]
	add	x1, x1, 8192
	add	x1, x27, x1, lsl 3
	ldr	x1, [x1, 1368]
	bl	FreeUsdByDec
	ldr	w1, [x21, 1360]
	mov	w0, -1
	add	x1, x1, 8192
	add	x4, x27, x1, lsl 3
	str	xzr, [x4, 1368]
	b	.L2316
.L2573:
	ldr	x1, .LC725
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2539
	.size	H264_DecSEI, .-H264_DecSEI
	.align	3
.LC694:
	.xword	s_pstVfmwChan
	.align	3
.LC696:
	.xword	.LC695
	.align	3
.LC698:
	.xword	.LC697
	.align	3
.LC699:
	.xword	.L2325
	.align	3
.LC701:
	.xword	.LC700
	.align	3
.LC702:
	.xword	.LANCHOR1
	.align	3
.LC704:
	.xword	.LC703
	.align	3
.LC706:
	.xword	.LC705
	.align	3
.LC708:
	.xword	.LC707
	.align	3
.LC710:
	.xword	.LC709
	.align	3
.LC712:
	.xword	.LC711
	.align	3
.LC714:
	.xword	.LC713
	.align	3
.LC716:
	.xword	.LC715
	.align	3
.LC718:
	.xword	.LC717
	.align	3
.LC720:
	.xword	.LC719
	.align	3
.LC721:
	.xword	g_event_report
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
.LC743:
	.xword	.LC742
	.align	3
.LC745:
	.xword	.LC744
	.align	3
.LC747:
	.xword	.LC746
	.align	3
.LC749:
	.xword	.LC748
	.align	3
.LC751:
	.xword	.LC750
	.align	3
.LC753:
	.xword	.LC752
	.align	3
.LC755:
	.xword	.LC754
	.align	3
.LC757:
	.xword	.LC756
	.align	3
.LC759:
	.xword	.LC758
	.align	3
.LC760:
	.xword	.LANCHOR1+216
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitOldSlice
	.type	InitOldSlice, %function
InitOldSlice:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 20480
	mov	w4, 32
	ldr	w8, [x19, 14948]
	mov	w7, 23352
	movk	w7, 0x1, lsl 16
	mov	w6, 2
	strb	w4, [x0, 3234]
	add	x4, x0, 3072
	strb	wzr, [x0, 3232]
	mov	w5, 7
	strb	w6, [x0, 3233]
	mov	w3, 3
	str	w8, [x0, 3240]
	mov	w2, -1
	str	w5, [x0, 3244]
	mov	w1, 262144
	str	w7, [x0, 3248]
	stp	w3, w2, [x4, 184]
	stp	wzr, wzr, [x4, 192]
	str	w1, [x0, 3272]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	InitOldSlice, .-InitOldSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_IsNewPicNal
	.type	H264_IsNewPicNal, %function
H264_IsNewPicNal:
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
	bls	.L2589
.L2588:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2589:
	ldr	x1, .LC761
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2583
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2583:
	.section	.rodata
	.align	0
	.align	2
.L2583:
	.byte	(.L2582 - .Lrtx2583) / 4
	.byte	(.L2588 - .Lrtx2583) / 4
	.byte	(.L2588 - .Lrtx2583) / 4
	.byte	(.L2588 - .Lrtx2583) / 4
	.byte	(.L2582 - .Lrtx2583) / 4
	.byte	(.L2588 - .Lrtx2583) / 4
	.byte	(.L2584 - .Lrtx2583) / 4
	.byte	(.L2584 - .Lrtx2583) / 4
	.text
	.p2align 3
.L2584:
	ldr	w0, [x19]
	mov	w1, 1
	str	w1, [x19]
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2582:
	ldr	w0, [x19]
	cbz	w0, .L2585
.L2587:
	mov	w0, -1
	str	wzr, [x19]
.L2590:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2585:
	ldr	w20, [x20, 4]
	rev	w20, w20
	mov	w0, w20
	bl	ZerosMS_32
	cmp	w0, 15
	bhi	.L2587
	mov	w1, 31
	str	wzr, [x19]
	sub	w0, w1, w0, lsl 1
	lsr	w20, w20, w0
	cmp	w20, 1
	csetm	w0, ne
	b	.L2590
	.size	H264_IsNewPicNal, .-H264_IsNewPicNal
	.align	3
.LC761:
	.xword	.L2583
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindZeroBitsInSeg
	.type	FindZeroBitsInSeg, %function
FindZeroBitsInSeg:
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
	ble	.L2611
	and	w1, w23, 63
	add	w0, w23, 63
	cmp	w1, wzr
	cset	w26, ne
	cmp	w23, wzr
	csel	w0, w0, w23, lt
	add	w26, w26, w0, asr 6
	cmp	w26, wzr
	ble	.L2604
	ldr	x20, .LC765
	mov	w25, w23
	ldr	x27, .LC764
	mov	w19, 0
	mov	w24, 64
	add	x20, x20, 1856
	.p2align 2
.L2603:
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
	cbnz	w1, .L2595
	cmp	x0, x20
	add	w19, w19, 1
	bne	.L2598
	b	.L2596
	.p2align 3
.L2599:
	add	w19, w19, 1
	beq	.L2596
.L2598:
	ldrb	w1, [x0, -1]!
	cmp	x0, x20
	cbz	w1, .L2599
.L2595:
	lsl	w0, w19, 3
.L2594:
	cmp	w19, w23
	mov	w1, 0
	bge	.L2600
	sxtw	x2, w23
	sub	x2, x2, #1
	sub	x19, x2, x19, sxtw
	ldrb	w2, [x22, x19]
	tbnz	x2, 0, .L2600
	lsr	w2, w2, 1
	mov	w1, 1
	.p2align 2
.L2602:
	tbnz	x2, 0, .L2600
	add	w1, w1, 1
	lsr	w2, w2, 1
	cmp	w1, 8
	bne	.L2602
.L2600:
	add	w0, w1, w0
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2596:
	subs	w26, w26, #1
	sub	w25, w25, #64
	bne	.L2603
	b	.L2595
.L2611:
	ldr	x1, .LC763
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
.L2604:
	mov	w0, 0
	mov	w19, 0
	b	.L2594
	.size	FindZeroBitsInSeg, .-FindZeroBitsInSeg
	.align	3
.LC763:
	.xword	.LC762
	.align	3
.LC764:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC765:
	.xword	.LANCHOR3
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindTrailZeros
	.type	FindTrailZeros, %function
FindTrailZeros:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L2618
	ldr	x2, [x19, 632]
	ldr	w0, [x2, 76]
	cmp	w0, 1
	bls	.L2617
	ldr	w1, [x2, 48]
	ldr	x0, [x2, 40]
	bl	FindZeroBitsInSeg
	ldr	x2, [x19, 632]
	ldr	w1, [x2, 48]
	cmp	w0, w1, lsl 3
	bcs	.L2621
	cmn	w0, #1
	beq	.L2617
	add	w0, w0, 1
	str	w0, [x2, 80]
	ldr	x0, [x19, 632]
	ldr	w1, [x0, 76]
	cmp	w1, 1
	bls	.L2619
.L2622:
	ldr	w2, [x0, 48]
	mov	w20, 0
	ldr	w1, [x0, 80]
	cmp	w1, w2, lsl 3
	bcc	.L2613
	add	x2, x19, 65536
	ldr	w1, [x0, 68]
	ldr	w0, [x2, 2820]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 632]
	mov	w1, 1
	str	xzr, [x0, 40]
	ldr	x0, [x19, 632]
	str	w1, [x0, 76]
	ldr	x0, [x19, 632]
	str	wzr, [x0, 80]
.L2613:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2621:
	add	x0, x19, 65536
	ldr	w1, [x2, 68]
	ldr	w0, [x0, 2820]
	bl	SM_ReleaseStreamSeg
	ldr	x0, [x19, 632]
	mov	w1, 1
	str	xzr, [x0, 40]
	ldr	x0, [x19, 632]
	str	w1, [x0, 76]
	ldr	x2, [x19, 632]
.L2617:
	ldr	w1, [x2, 16]
	ldr	x0, [x2, 8]
	bl	FindZeroBitsInSeg
	add	w0, w0, 1
	ldr	x2, [x19, 632]
	str	w0, [x2, 80]
	ldr	x0, [x19, 632]
	ldr	w1, [x0, 76]
	cmp	w1, 1
	bhi	.L2622
.L2619:
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2618:
	mov	w20, -1
	b	.L2613
	.size	FindTrailZeros, .-FindTrailZeros
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	CombinePacket
	.type	CombinePacket, %function
CombinePacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x19, 632]
	ldr	w0, [x0, 16]
	cmp	w0, 4095
	bhi	.L2623
	mov	x0, x19
	bl	CombinePacket.part.11
.L2623:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	CombinePacket, .-CombinePacket
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FindNaluArraySlot
	.type	FindNaluArraySlot, %function
FindNaluArraySlot:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 641]
	cbz	w0, .L2630
	add	x0, x19, 745
	mov	x1, 1
	b	.L2628
	.p2align 3
.L2627:
	add	w1, w1, 1
	cmp	w1, 137
	beq	.L2633
.L2628:
	ldrb	w2, [x0]
	add	x0, x0, 104
	cbnz	w2, .L2627
	mov	w0, w1
.L2626:
	lsl	x2, x1, 3
	mov	w3, 1
	sub	x2, x2, x1
	lsl	x2, x2, x3
	sub	x1, x2, x1
	add	x1, x19, x1, lsl 3
	strb	w3, [x1, 641]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2633:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2630:
	mov	w0, 0
	mov	x1, 0
	b	.L2626
	.size	FindNaluArraySlot, .-FindNaluArraySlot
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InquireSliceExtProperty
	.type	InquireSliceExtProperty, %function
InquireSliceExtProperty:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x0, x19, 12288
	mov	w1, 24
	add	x0, x0, 2600
	bl	BsGet
	ubfx	x2, x0, 23, 1
	ldr	x1, [x19, 632]
	strb	w2, [x1, 3]
	ldr	x3, [x19, 632]
	ldrb	w1, [x3, 3]
	cbnz	w1, .L2635
	add	x1, x19, 65536
	ldrb	w2, [x1, 160]
.L2636:
	cmp	w2, 1
	bne	.L2637
	mov	w0, 5
	strb	w0, [x3, 2]
.L2637:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2635:
	add	x1, x19, 65536
	ubfx	x5, x0, 16, 6
	ubfx	x4, x0, 15, 1
	ubfx	x2, x0, 22, 1
	ubfx	x9, x0, 12, 3
	ubfx	x8, x0, 8, 4
	ubfx	x7, x0, 5, 3
	ubfx	x6, x0, 4, 1
	strb	w5, [x1, 161]
	ubfx	x5, x0, 3, 1
	strb	w4, [x1, 162]
	ubfx	x4, x0, 2, 1
	strb	w2, [x1, 160]
	and	w0, w0, 3
	strb	w9, [x1, 163]
	strb	w8, [x1, 164]
	strb	w7, [x1, 165]
	strb	w6, [x1, 166]
	strb	w5, [x1, 167]
	strb	w4, [x1, 168]
	strb	w0, [x1, 169]
	b	.L2636
	.size	InquireSliceExtProperty, .-InquireSliceExtProperty
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InquireSliceProperty
	.type	InquireSliceProperty, %function
InquireSliceProperty:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	mov	x23, x1
	mov	x20, x2
	bl	_mcount
	add	x21, x19, 20480
	add	x2, x19, 65536
	ldr	x1, .LC768
	mov	w0, 22
	ldr	w2, [x2, 2764]
	sub	w2, w2, #1
	bl	dprint_vfmw
	str	wzr, [x20]
	str	wzr, [x23]
	mov	x0, x19
	ldr	x1, [x19, 632]
	ldrb	w2, [x1, 2]
	strb	w2, [x21, 1587]
	ldr	w1, [x1, 84]
	str	w1, [x21, 1616]
	bl	SliceCheck
	mov	w22, w0
	cbnz	w0, .L2642
	mov	x0, x19
	bl	ProcessSliceHeaderFirstPart
	cbnz	w0, .L2646
	ldrb	w3, [x21, 1589]
	mov	w1, 2208
	mov	w0, 4000
	mov	w2, 2
	cmp	w3, 1
	cset	w3, eq
	str	w3, [x23]
	ldr	w3, [x21, 1596]
	ldr	x4, [x19, 14968]
	ldr	x6, [x19, 14960]
	umull	x1, w3, w1
	ldr	w5, [x19, 14936]
	add	x1, x4, x1
	ldr	w4, [x19, 14932]
	ldr	w1, [x1, 28]
	umull	x0, w1, w0
	add	x0, x6, x0
	ldrb	w1, [x0, 18]
	ldr	w6, [x0, 3252]
	sub	w1, w2, w1
	ldr	w3, [x0, 3248]
	madd	w1, w6, w1, w1
	add	w2, w3, 1
	cmp	w1, w5
	ccmp	w2, w4, 0, eq
	bne	.L2647
.L2641:
	add	x19, x19, 24576
	ldr	w1, [x0, 3272]
	ldr	w0, [x19, 3712]
	add	w0, w0, 1
	cmp	w1, w0
	bls	.L2639
	mov	w0, 1
	str	w0, [x20]
.L2639:
	mov	w0, w22
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2647:
	mov	w1, 1
	str	w1, [x20]
	b	.L2641
	.p2align 3
.L2642:
	mov	w22, -1
	b	.L2639
	.p2align 3
.L2646:
	ldr	x1, .LC770
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L2639
	.size	InquireSliceProperty, .-InquireSliceProperty
	.align	3
.LC768:
	.xword	.LC767
	.align	3
.LC770:
	.xword	.LC769
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	HaveSliceToDec
	.type	HaveSliceToDec, %function
HaveSliceToDec:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 65536
	bl	_mcount
	ldr	w0, [x19, 2744]
	ldr	x19, [sp, 16]
	cmp	w0, wzr
	csetm	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	HaveSliceToDec, .-HaveSliceToDec
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IsRefListWrong
	.type	IsRefListWrong, %function
IsRefListWrong:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 20480
	bl	_mcount
	ldr	w0, [x21, 1628]
	cbz	w0, .L2650
	mov	w19, 0
	add	x22, x20, 65536
	b	.L2654
	.p2align 3
.L2651:
	ldr	x0, [x0, 680]
	cbz	x0, .L2653
	ldr	w0, [x21, 1628]
	cmp	w0, w19
	bls	.L2678
.L2654:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x22, 2820]
	add	w19, w19, 1
	ldr	x1, [x1, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	cbnz	x0, .L2651
.L2653:
	mov	w0, -1
.L2680:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2650:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2678:
	cbz	w0, .L2650
	ldr	w0, [x21, 1632]
	mov	w19, 0
	cbnz	w0, .L2667
	b	.L2650
	.p2align 3
.L2679:
	ldr	x0, [x0, 680]
	cbz	x0, .L2653
	ldr	w0, [x21, 1632]
	cmp	w0, w19
	bls	.L2650
.L2667:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x22, 2820]
	add	w19, w19, 1
	ldr	x1, [x1, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	cbnz	x0, .L2679
	mov	w0, -1
	b	.L2680
	.size	IsRefListWrong, .-IsRefListWrong
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_Destroy
	.type	H264DEC_Destroy, %function
H264DEC_Destroy:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x20, x22, 12288
	add	x19, x22, 640
	bl	_mcount
	add	x21, x22, 65536
	mov	x0, x22
	add	x20, x20, 2600
	bl	ClearAllSlice
	add	x0, x22, 20480
	mov	w2, 23352
	ldr	w3, [x22, 14948]
	movk	w2, 0x1, lsl 16
	mov	w1, 7
	mov	w5, 2
	mov	w4, 32
	str	w3, [x0, 3240]
	str	w1, [x0, 3244]
	mov	w3, 3
	str	w2, [x0, 3248]
	mov	w1, 262144
	mov	w2, -1
	strb	wzr, [x0, 3232]
	strb	w5, [x0, 3233]
	strb	w4, [x0, 3234]
	str	wzr, [x0, 3264]
	str	wzr, [x0, 3268]
	str	w3, [x0, 3256]
	str	w2, [x0, 3260]
	str	w1, [x0, 3272]
	b	.L2683
	.p2align 3
.L2682:
	add	x19, x19, 104
	cmp	x20, x19
	beq	.L2703
.L2683:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L2682
	ldr	w0, [x21, 2820]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x20, x19
	bne	.L2683
.L2703:
	ldr	w0, [x21, 2756]
	cmp	w0, 1
	beq	.L2704
.L2684:
	ldr	w0, [x21, 1360]
	mov	w20, 0
	cbz	w0, .L2689
	.p2align 2
.L2697:
	add	x19, x22, x20, uxtw 3
	add	w20, w20, 1
	add	x19, x19, 65536
	ldr	x0, [x19, 1368]
	mov	x1, x0
	cbz	x0, .L2687
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19, 1368]
.L2687:
	ldr	w0, [x21, 1360]
	cmp	w0, w20
	bhi	.L2697
.L2689:
	add	x20, x22, 28672
	add	x22, x22, 61440
	add	x20, x20, 1200
	add	x22, x22, 3312
	.p2align 2
.L2686:
	sub	x19, x20, #32
.L2691:
	ldr	x1, [x19]
	cbnz	x1, .L2705
.L2690:
	add	x19, x19, 8
	cmp	x20, x19
	bne	.L2691
	add	x20, x20, 872
	cmp	x20, x22
	bne	.L2686
	ldr	x1, .LC772
	mov	w0, 2
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2705:
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L2690
.L2704:
	str	wzr, [x21, 2756]
	b	.L2684
	.size	H264DEC_Destroy, .-H264DEC_Destroy
	.align	3
.LC772:
	.xword	.LC771
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_RecycleImage
	.type	H264DEC_RecycleImage, %function
H264DEC_RecycleImage:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	w22, w1
	add	x21, x21, 65536
	bl	_mcount
	ldr	x1, .LC774
	mov	w0, 2
	bl	dprint_vfmw
	ldr	w0, [x21, 2820]
	mov	w1, w22
	bl	FSP_GetLogicFs
	cbz	x0, .L2711
	ldrsb	w1, [x0, 1]
	cbz	w1, .L2711
	add	x19, x0, 608
	add	x20, x0, 640
.L2709:
	ldr	x1, [x19]
	cbnz	x1, .L2716
.L2708:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L2709
	ldr	w0, [x21, 2820]
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, 0
.L2707:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2716:
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L2708
	.p2align 3
.L2711:
	mov	w0, -1
	b	.L2707
	.size	H264DEC_RecycleImage, .-H264DEC_RecycleImage
	.align	3
.LC774:
	.xword	.LC773
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	OutputFrmToVO
	.type	OutputFrmToVO, %function
OutputFrmToVO:
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
	cmp	x19, xzr
	ccmp	x20, xzr, 4, ne
	beq	.L2756
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, wzr
	ble	.L2720
	add	x1, x19, 65536
	ldr	w0, [x1, 2748]
	cmp	w0, 2
	beq	.L2720
	ldr	x0, [x1, 144]
	cbz	x0, .L2722
	strb	wzr, [x0, 1]
	mov	w0, 1
	str	xzr, [x1, 144]
.L2719:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2720:
	mov	x1, x20
	mov	x0, x19
	bl	CheckFrameStore
	cmn	w0, #3
	beq	.L2722
	add	x21, x19, 65536
	ldr	x1, [x21, 144]
	cbz	x1, .L2723
	mov	x0, x19
	bl	GetImagePara
	ldr	x1, [x21, 144]
	mov	x0, x19
	bl	CheckFrameStore
	cbz	w0, .L2757
	cmn	w0, #3
	beq	.L2730
	ldr	x1, .LC782
	mov	w3, w0
	mov	w2, 2080
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x21, 144]
	mov	x0, x19
	ldr	w1, [x1, 188]
	bl	H264DEC_RecycleImage
.L2730:
	ldr	x0, [x21, 144]
	strb	wzr, [x0, 1]
	ldr	x0, [x21, 144]
	str	xzr, [x21, 144]
	cmp	x20, x0
	beq	.L2758
.L2723:
	mov	x1, x20
	mov	x0, x19
	bl	GetImagePara
	mov	x1, x20
	mov	x0, x19
	bl	CheckFrameStore
	cbz	w0, .L2759
	cmn	w0, #3
	beq	.L2722
	ldr	x1, .LC782
	mov	w3, w0
	mov	w2, 2138
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x20, 188]
	mov	x0, x19
	bl	H264DEC_RecycleImage
	mov	w0, 2
	b	.L2719
	.p2align 3
.L2756:
	ldr	x1, .LC776
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
.L2722:
	mov	w0, 1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2759:
	ldr	w1, [x20, 672]
	mov	w2, 1
	ldr	w0, [x21, 2820]
	bl	FSP_SetDisplay
	ldr	w1, [x20, 672]
	ldr	w0, [x21, 2820]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L2760
	cmp	w22, 1
	beq	.L2761
.L2734:
	ldr	w0, [x21, 2820]
	mov	x4, x23
	add	x3, x19, 8
	mov	x2, x19
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L2762
	ldr	x0, [x19]
	ldr	w0, [x0, 604]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L2763
	str	wzr, [x23, 24]
.L2737:
	ldr	w1, [x21, 2840]
	mov	w0, 0
	ldr	w2, [x21, 2848]
	add	w1, w1, 2
	str	w1, [x21, 2840]
	add	w2, w2, 1
	str	w2, [x21, 2848]
	b	.L2719
	.p2align 3
.L2757:
	ldr	x1, [x21, 144]
	mov	w2, 1
	ldr	w0, [x21, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
	ldr	x1, [x21, 144]
	ldr	w0, [x21, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L2764
	ldr	x0, [x21, 144]
	cmp	x0, x20
	ccmp	w22, 1, 0, eq
	beq	.L2765
.L2726:
	ldr	w0, [x21, 2820]
	mov	x4, x23
	add	x3, x19, 8
	mov	x2, x19
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L2766
	ldr	x0, [x19]
	ldr	w0, [x0, 604]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L2767
	str	wzr, [x23, 24]
.L2729:
	ldr	w0, [x21, 2840]
	ldr	w1, [x21, 2848]
	add	w0, w0, 2
	str	w0, [x21, 2840]
	add	w1, w1, 1
	str	w1, [x21, 2848]
	b	.L2730
	.p2align 3
.L2758:
	mov	w0, 0
	b	.L2719
	.p2align 3
.L2761:
	str	w22, [x0, 212]
	b	.L2734
	.p2align 3
.L2763:
	mov	x1, x23
	mov	x0, x19
	bl	SetFrmRepeatCount.part.1
	b	.L2737
	.p2align 3
.L2767:
	mov	x1, x23
	mov	x0, x19
	bl	SetFrmRepeatCount.part.1
	b	.L2729
.L2762:
	ldr	x1, .LC780
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x20, 672]
	mov	w2, 0
	ldr	w0, [x21, 2820]
	bl	FSP_SetDisplay
	mov	w1, 1
	mov	x0, x19
	bl	ClearAll
	mov	w0, -1
	b	.L2719
.L2766:
	ldr	x1, .LC780
	mov	w2, w0
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x0, [x21, 144]
	mov	w2, 0
	strb	wzr, [x0, 1]
	ldr	x1, [x21, 144]
	ldr	w0, [x21, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
	str	xzr, [x21, 144]
	mov	w1, 1
	mov	x0, x19
	bl	ClearAll
	mov	w0, -1
	b	.L2719
	.p2align 3
.L2765:
	mov	w0, 1
	str	w0, [x23, 212]
	b	.L2726
.L2760:
	ldr	x1, .LC784
	mov	w2, 2108
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2719
.L2764:
	ldr	x1, .LC778
	mov	w2, 2051
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2719
	.size	OutputFrmToVO, .-OutputFrmToVO
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	OutputFrmFromDPB
	.type	OutputFrmFromDPB, %function
OutputFrmFromDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w21, w1
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, x21, uxtw 3
	bl	_mcount
	mov	w2, 0
	mov	x0, x20
	ldr	x1, [x19, 27904]
	strb	wzr, [x1, 4]
	ldr	x1, [x19, 27904]
	bl	OutputFrmToVO
	mov	w22, w0
	ldr	x0, [x19, 27904]
	ldrb	w0, [x0, 2]
	cbnz	w0, .L2769
	mov	w1, w21
	mov	x0, x20
	bl	RemoveFrameStoreOutDPB
.L2769:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	OutputFrmFromDPB, .-OutputFrmFromDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	FlushDPB
	.type	FlushDPB, %function
FlushDPB:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 24576
	mov	w21, 0
	bl	_mcount
	ldr	w0, [x19, 3716]
	cbnz	w0, .L2788
	b	.L2772
	.p2align 3
.L2773:
	ldr	w0, [x19, 3716]
	cmp	w0, w21
	bls	.L2772
.L2788:
	add	x0, x20, x21, uxtw 3
	add	w21, w21, 1
	ldr	x1, [x0, 27904]
	ldrb	w0, [x1, 2]
	cbz	w0, .L2773
	mov	x0, x20
	bl	UnMarkFrameStoreRef
	ldr	w0, [x19, 3716]
	cmp	w0, w21
	bhi	.L2788
	.p2align 2
.L2772:
	mov	x0, x20
	bl	RemoveUnUsedFrameStore
	cbnz	w0, .L2772
	.p2align 2
.L2776:
	ldr	w6, [x19, 3716]
	cbz	w6, .L2793
	ldr	w0, [x19, 3712]
	cmp	w6, w0
	bls	.L2777
	str	w0, [x19, 3716]
	cbz	w0, .L2783
	mov	w6, w0
.L2777:
	add	x2, x19, 3328
	mov	w5, 2147483647
	mov	w0, 0
	mov	w1, 0
	.p2align 2
.L2780:
	ldr	x4, [x2]
	add	x2, x2, 8
	ldr	w3, [x4, 688]
	cmp	w3, w5
	bge	.L2779
	ldrb	w4, [x4, 4]
	cmp	w4, wzr
	csel	w5, w5, w3, eq
	csel	w1, w1, w0, eq
.L2779:
	add	w0, w0, 1
	cmp	w6, w0
	bhi	.L2780
	mov	x0, x20
	bl	OutputFrmFromDPB
	cmn	w0, #1
	bne	.L2776
.L2781:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2783:
	mov	w1, 0
	mov	x0, x20
	bl	OutputFrmFromDPB
	cmn	w0, #1
	bne	.L2776
	b	.L2781
	.p2align 3
.L2793:
	mov	w0, 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	FlushDPB, .-FlushDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AdaptiveMemMark
	.type	AdaptiveMemMark, %function
AdaptiveMemMark:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x26, x21, 61440
	add	x25, x21, 20480
	bl	_mcount
	ldr	x24, .LC785
	add	x23, x26, 2672
	mov	w27, 1
	ldr	x22, [x26, 3360]
	add	x20, x22, 8
	add	x22, x22, 2008
	.p2align 2
.L2807:
	ldr	w0, [x20, -4]
	cmp	w0, 6
	bhi	.L2795
	ldrb	w0, [x24,w0,uxtw]
	adr	x1, .Lrtx2797
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2797:
	.section	.rodata
	.align	0
	.align	2
.L2797:
	.byte	(.L2796 - .Lrtx2797) / 4
	.byte	(.L2798 - .Lrtx2797) / 4
	.byte	(.L2799 - .Lrtx2797) / 4
	.byte	(.L2800 - .Lrtx2797) / 4
	.byte	(.L2801 - .Lrtx2797) / 4
	.byte	(.L2802 - .Lrtx2797) / 4
	.byte	(.L2803 - .Lrtx2797) / 4
	.text
	.p2align 3
.L2802:
	add	x28, x21, 24576
	mov	w19, 0
	ldr	w0, [x28, 3720]
	cbz	w0, .L2806
	.p2align 2
.L2814:
	add	x1, x21, x19, uxtw 3
	mov	x0, x21
	add	w19, w19, 1
	ldr	x1, [x1, 28032]
	bl	UnMarkFrameStoreRef
	ldr	w0, [x28, 3720]
	cmp	w19, w0
	bcc	.L2814
.L2806:
	mov	x0, x21
	bl	UpdateReflist
	mov	w1, 0
	mov	x0, x21
	bl	UpdateMaxLTFrmIdx
	mov	x0, x21
	bl	UpdateLTReflist
	str	w27, [x25, 728]
	.p2align 2
.L2795:
	add	x20, x20, 20
	cmp	x20, x22
	bne	.L2807
	.p2align 2
.L2796:
	ldr	w1, [x25, 728]
	mov	w0, 0
	cmp	w1, 1
	beq	.L2817
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2801:
	ldr	w1, [x20, 12]
	mov	x0, x21
	bl	UpdateMaxLTFrmIdx
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2795
	.p2align 3
.L2800:
	ldr	w2, [x20]
	mov	x1, x23
	ldr	w3, [x20, 8]
	mov	x0, x21
	bl	MarkSTToLTRef
	mov	x0, x21
	bl	UpdateReflist
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2795
	.p2align 3
.L2799:
	ldr	w2, [x20, 4]
	mov	x0, x21
	mov	x1, x23
	bl	UnMarkLTRef
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2795
	.p2align 3
.L2798:
	ldr	w2, [x20]
	mov	x0, x21
	mov	x1, x23
	bl	UnMarkSTRef
	mov	x0, x21
	bl	UpdateReflist
	b	.L2795
	.p2align 3
.L2803:
	ldr	w2, [x20, 8]
	mov	x1, x23
	mov	x0, x21
	bl	MarkCurrPicLT
	b	.L2795
	.p2align 3
.L2817:
	ldrb	w0, [x26, 2675]
	str	wzr, [x26, 3368]
	cmp	w0, 1
	beq	.L2810
	cbz	w0, .L2811
	cmp	w0, 2
	bne	.L2809
	str	wzr, [x26, 3380]
	str	wzr, [x26, 3392]
	str	wzr, [x25, 740]
	str	wzr, [x25, 748]
.L2809:
	mov	x0, x21
	bl	FlushDPB
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L2811:
	ldr	w2, [x26, 3380]
	ldr	w0, [x26, 3388]
	ldr	w1, [x26, 3392]
	sub	w0, w0, w2
	str	w0, [x26, 3388]
	sub	w1, w1, w2
	str	w1, [x26, 3392]
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x26, 3380]
	str	w0, [x26, 3384]
	ldr	w2, [x25, 748]
	ldr	w0, [x25, 736]
	ldr	w1, [x25, 740]
	sub	w0, w0, w2
	str	w0, [x25, 736]
	sub	w1, w1, w2
	str	w1, [x25, 740]
	cmp	w0, w1
	csel	w0, w0, w1, le
	str	w0, [x25, 744]
	str	w0, [x25, 748]
	b	.L2809
.L2810:
	str	wzr, [x26, 3380]
	str	wzr, [x26, 3388]
	str	wzr, [x25, 736]
	str	wzr, [x25, 748]
	b	.L2809
	.size	AdaptiveMemMark, .-AdaptiveMemMark
	.align	3
.LC785:
	.xword	.L2797
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	IDRMemMarking
	.type	IDRMemMarking, %function
IDRMemMarking:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x22, x0
	mov	x0, x30
	add	x24, x22, 61440
	bl	_mcount
	ldr	x0, [x24, 3360]
	ldrb	w0, [x0, 1]
	cbz	w0, .L2819
	add	x23, x22, 24576
	mov	w21, 0
	add	x20, x22, 65536
	mov	w25, 1
	ldr	w0, [x23, 3716]
	cbnz	w0, .L2834
	b	.L2826
	.p2align 3
.L2823:
	strb	wzr, [x0, 722]
	strb	wzr, [x0, 721]
	ldr	x0, [x19, 27904]
	strb	wzr, [x0, 770]
	strb	wzr, [x0, 769]
	ldr	x0, [x19, 27904]
	strb	wzr, [x0, 818]
	strb	wzr, [x0, 817]
	ldr	x0, [x19, 27904]
	strb	wzr, [x0, 2]
	ldr	x1, [x19, 27904]
	ldr	w0, [x20, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetRef
	ldr	x0, [x19, 27904]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 27904]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 27904]
	str	w25, [x0, 692]
	ldr	x1, [x19, 27904]
	ldr	w0, [x1, 712]
	add	x0, x0, 4096
	add	x0, x22, x0, lsl 2
	str	wzr, [x0, 11928]
	ldr	w1, [x1, 672]
	ldr	w0, [x20, 2820]
	bl	FSP_GetDisplay
	cmp	w0, 3
	mov	w2, 0
	beq	.L2824
	ldr	x1, [x19, 27904]
	ldr	w0, [x20, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
.L2824:
	str	xzr, [x19, 27904]
	str	xzr, [x19, 28032]
	str	xzr, [x19, 28160]
	ldr	w0, [x23, 3716]
	cmp	w0, w21
	bls	.L2826
.L2834:
	add	x19, x22, x21, uxtw 3
	mov	w2, 0
	add	w21, w21, 1
	ldr	x0, [x19, 27904]
	ldr	w1, [x0, 864]
	cmp	w1, 1
	bne	.L2823
	str	w1, [x20, 1348]
	b	.L2823
	.p2align 3
.L2826:
	str	wzr, [x23, 3716]
	ldr	w0, [x20, 1336]
	cbz	w0, .L2822
	sub	w1, w0, #1
	add	x0, x20, 1264
	add	x1, x1, 16384
	add	x1, x1, 317
	add	x1, x22, x1, lsl 2
	.p2align 2
.L2829:
	str	wzr, [x0], 4
	cmp	x0, x1
	bne	.L2829
.L2822:
	mov	x0, x22
	bl	UpdateReflist
	mov	x0, x22
	bl	UpdateLTReflist
	ldr	x0, [x24, 3360]
	ldrb	w0, [x0, 2]
	cbnz	w0, .L2840
	mov	w0, 1
	str	wzr, [x23, 3728]
	strb	w0, [x24, 2677]
	mov	w0, 0
	strb	wzr, [x24, 2676]
.L2830:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2840:
	mov	w0, 1
	str	w0, [x23, 3728]
	strb	w0, [x24, 2676]
	mov	w0, 0
	strb	wzr, [x24, 2677]
	str	wzr, [x24, 3372]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2819:
	mov	x0, x22
	bl	FlushDPB
	cbnz	w0, .L2831
	add	x23, x22, 24576
	b	.L2822
.L2831:
	mov	w0, -1
	b	.L2830
	.size	IDRMemMarking, .-IDRMemMarking
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Marking
	.type	Marking, %function
Marking:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 61440
	bl	_mcount
	add	x0, x20, 20480
	str	wzr, [x0, 728]
	ldrb	w1, [x19, 2675]
	cmp	w1, 2
	cset	w1, eq
	str	w1, [x0, 732]
	ldrb	w0, [x19, 2678]
	cmp	w0, 5
	beq	.L2842
	ldr	w0, [x19, 3396]
	cbnz	w0, .L2843
	ldr	x0, [x20]
	ldr	w1, [x0, 640]
	cmp	w1, 1
	beq	.L2867
.L2843:
	ldr	x0, [x19, 3360]
	ldrb	w0, [x0, 3]
	cbz	w0, .L2868
	ldr	w0, [x19, 3376]
	cbnz	w0, .L2869
.L2850:
	mov	w0, 0
.L2847:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2868:
	ldr	w0, [x19, 3376]
	cbz	w0, .L2850
.L2849:
	ldrb	w1, [x19, 2673]
	cbnz	w1, .L2854
	add	x1, x20, 24576
	add	x2, x20, 16384
	ldr	w4, [x1, 3724]
	ldr	w2, [x2, 1836]
	ldr	w3, [x1, 3720]
	sub	w1, w2, w4
	cmp	w3, w1
	beq	.L2870
	strb	wzr, [x19, 2676]
.L2852:
	cbz	w0, .L2850
.L2854:
	ldrb	w1, [x19, 2676]
	mov	w0, 0
	cmp	w1, wzr
	cset	w1, eq
	strb	w1, [x19, 2677]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2869:
	mov	x0, x20
	bl	AdaptiveMemMark
	cbnz	w0, .L2844
.L2851:
	ldrb	w0, [x19, 2678]
	cmp	w0, 5
	bne	.L2871
	ldr	w0, [x19, 3376]
	b	.L2852
	.p2align 3
.L2867:
	ldr	w1, [x0, 636]
	cbnz	w1, .L2843
	ldr	w1, [x0, 644]
	cbnz	w1, .L2843
	ldr	w0, [x0, 604]
	add	w0, w0, 1024
	cmp	w0, 2048
	bls	.L2843
	.p2align 2
.L2842:
	mov	x0, x20
	bl	IDRMemMarking
	cbz	w0, .L2851
.L2844:
	mov	w0, -1
	b	.L2847
	.p2align 3
.L2870:
	mov	x0, x20
	bl	SlidingWinMark.part.2
	strb	wzr, [x19, 2676]
	ldr	w0, [x19, 3376]
	b	.L2852
.L2871:
	ldr	w0, [x19, 3376]
	cbz	w0, .L2850
	ldr	x1, [x19, 3360]
	ldrb	w1, [x1, 3]
	cbnz	w1, .L2854
	b	.L2849
	.size	Marking, .-Marking
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DirectOutput
	.type	DirectOutput, %function
DirectOutput:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 61440
	bl	_mcount
	ldrb	w0, [x20, 2675]
	cmp	w0, 1
	beq	.L2874
	cbz	w0, .L2875
	cmp	w0, 2
	beq	.L2876
	mov	w22, 0
.L2873:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2876:
	ldr	x0, [x20, 3352]
	mov	w1, 3
	add	x19, x21, 65536
	strb	w1, [x0, 720]
	ldrb	w0, [x20, 2673]
	cbnz	w0, .L2892
	ldr	x1, [x19, 144]
	cbz	x1, .L2893
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	mov	w22, w0
	cbnz	w0, .L2957
.L2894:
	ldr	x0, [x20, 3352]
	str	x0, [x19, 144]
	str	x0, [x0, 856]
.L2895:
	ldr	x0, [x19, 144]
	mov	w23, 2
	ldrb	w3, [x20, 2674]
	mov	x2, 664
	add	x1, x20, 2688
	strb	w3, [x0]
	ldr	x0, [x19, 144]
	strb	w23, [x0, 1]
	ldr	x0, [x19, 144]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 144]
	str	wzr, [x0, 692]
	ldr	x0, [x19, 144]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 144]
	ldr	w3, [x20, 3396]
	str	w3, [x0, 700]
	ldr	x0, [x19, 144]
	str	wzr, [x0, 696]
	ldr	x0, [x19, 144]
	add	x0, x0, 8
	bl	memcpy
	ldr	x1, [x19, 144]
	mov	w0, 2
	ldr	w2, [x20, 3404]
	str	w2, [x1, 832]
	ldr	x1, [x19, 144]
	ldr	w2, [x1, 832]
	str	w2, [x1, 704]
	str	w2, [x1, 736]
	ldr	x1, [x19, 144]
	strb	w23, [x1, 816]
	ldrb	w2, [x20, 2679]
	ldr	x1, [x19, 144]
	cmp	w2, 1
	csel	w0, wzr, w0, ne
	strb	w0, [x1, 3]
	ldr	w23, [x19, 2752]
	cmp	w23, 1
	bne	.L2873
.L2951:
	ldr	x1, [x19, 144]
	mov	w2, 0
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetRef
	ldr	x1, [x19, 144]
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	mov	w22, w0
	ldr	x0, [x19, 144]
	cbz	x0, .L2903
	ldr	x1, [x20, 3352]
	mov	w2, w23
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
.L2903:
	str	xzr, [x19, 144]
.L2959:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2875:
	ldr	x0, [x20, 3352]
	add	x19, x21, 65536
	strb	wzr, [x0, 720]
	ldr	x1, [x19, 144]
	cbz	x1, .L2877
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	cbnz	w0, .L2958
.L2878:
	ldr	x0, [x19, 144]
	cbz	x0, .L2877
	ldr	x1, [x20, 3352]
	mov	w2, 1
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
.L2877:
	ldr	x0, [x20, 3352]
	mov	w3, 3
	str	x0, [x19, 144]
	mov	x2, 664
	add	x1, x20, 2688
	str	x0, [x0, 760]
	ldr	x0, [x19, 144]
	ldr	x4, [x20, 3352]
	str	x4, [x0, 808]
	ldr	x0, [x19, 144]
	ldr	x4, [x20, 3352]
	str	x4, [x0, 856]
	ldr	x0, [x19, 144]
	ldrb	w4, [x20, 2674]
	strb	w4, [x0]
	ldr	x0, [x19, 144]
	strb	w3, [x0, 1]
	ldr	x0, [x19, 144]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 144]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 144]
	str	wzr, [x0, 692]
	ldr	x0, [x19, 144]
	add	x0, x0, 8
	bl	memcpy
	ldr	x1, [x19, 144]
	mov	w0, 3
	ldr	w3, [x20, 3404]
	mov	w2, 0
	str	w3, [x1, 704]
	str	w3, [x1, 736]
	ldr	x1, [x19, 144]
	strb	wzr, [x1, 720]
	ldr	x1, [x19, 144]
	ldr	w3, [x20, 3396]
	str	w3, [x1, 700]
	ldr	x1, [x19, 144]
	ldrb	w3, [x20, 2681]
	str	w3, [x1, 696]
	ldrb	w3, [x20, 2679]
	ldr	x1, [x19, 144]
	cmp	w3, 1
	csel	w0, wzr, w0, ne
	strb	w0, [x1, 3]
.L2954:
	ldr	x1, [x19, 144]
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetRef
	ldr	x1, [x19, 144]
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	mov	w22, w0
	ldr	x0, [x19, 144]
	cbz	x0, .L2903
	ldr	x1, [x20, 3352]
	mov	w2, 1
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
	str	xzr, [x19, 144]
	b	.L2959
	.p2align 3
.L2874:
	ldr	x0, [x20, 3352]
	mov	w1, 3
	add	x19, x21, 65536
	strb	w1, [x0, 720]
	ldrb	w0, [x20, 2673]
	cbnz	w0, .L2881
	ldr	x1, [x19, 144]
	cbz	x1, .L2882
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	mov	w22, w0
	cbnz	w0, .L2960
.L2883:
	ldr	x0, [x20, 3352]
	str	x0, [x19, 144]
	str	x0, [x0, 808]
.L2884:
	ldr	x0, [x19, 144]
	mov	w23, 1
	ldrb	w3, [x20, 2674]
	add	x1, x20, 2688
	mov	x2, 664
	strb	w3, [x0]
	ldr	x0, [x19, 144]
	strb	w23, [x0, 1]
	ldr	x0, [x19, 144]
	strb	wzr, [x0, 4]
	ldr	x0, [x19, 144]
	str	wzr, [x0, 692]
	ldr	x0, [x19, 144]
	strb	wzr, [x0, 2]
	ldr	x0, [x19, 144]
	ldr	w3, [x20, 3396]
	str	w3, [x0, 700]
	ldr	x0, [x19, 144]
	str	wzr, [x0, 696]
	ldr	x0, [x19, 144]
	add	x0, x0, 8
	bl	memcpy
	ldr	x0, [x19, 144]
	ldr	w1, [x20, 3404]
	str	w1, [x0, 784]
	ldr	x0, [x19, 144]
	ldr	w1, [x0, 784]
	str	w1, [x0, 704]
	str	w1, [x0, 736]
	ldr	x0, [x19, 144]
	strb	w23, [x0, 768]
	ldrb	w1, [x20, 2679]
	ldr	x0, [x19, 144]
	cmp	w1, 1
	cset	w1, eq
	strb	w1, [x0, 3]
	ldr	w23, [x19, 2752]
	cmp	w23, 1
	beq	.L2951
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2892:
	ldr	x3, [x19, 144]
	cbz	x3, .L2961
.L2898:
	mov	x2, 664
	add	x1, x20, 2688
	add	x0, x3, 8
	ldr	x28, [x3, 648]
	ldp	w25, w24, [x3, 16]
	ldp	w23, w22, [x3, 24]
	ldr	x27, [x3, 656]
	ldr	x26, [x3, 664]
	bl	memcpy
	ldr	x0, [x20, 3328]
	cmn	x0, #1
	ccmn	x28, #1, 4, eq
	beq	.L2899
	ldr	x0, [x19, 144]
	str	x28, [x0, 648]
.L2899:
	ldr	x0, [x20, 3336]
	ldr	x1, [x19, 144]
	cmp	x0, x27
	csel	x0, x0, x27, ls
	str	x0, [x1, 656]
	ldr	x0, [x20, 3344]
	ldr	x1, [x19, 144]
	cmp	x0, x26
	csel	x0, x0, x26, ls
	str	x0, [x1, 664]
	ldr	w0, [x20, 2696]
	ldr	x1, [x19, 144]
	cmp	w0, w25
	csel	w0, w0, w25, ls
	str	w0, [x1, 16]
	ldr	w0, [x20, 2700]
	ldr	x1, [x19, 144]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 20]
	ldr	w0, [x20, 2704]
	ldr	x1, [x19, 144]
	cmp	w0, w23
	csel	w0, w0, w23, ls
	str	w0, [x1, 24]
	ldr	w0, [x20, 2708]
	ldr	x1, [x19, 144]
	cmp	w0, w22
	csel	w0, w0, w22, ls
	str	w0, [x1, 28]
	ldr	x1, [x19, 144]
	ldrb	w0, [x1]
	cbz	w0, .L2900
	ldrb	w0, [x20, 2674]
.L2900:
	strb	w0, [x1]
	mov	w4, 2
	mov	w3, 3
	ldr	x1, [x19, 144]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 2
	strb	w0, [x1, 1]
	ldr	x1, [x19, 144]
	ldr	w0, [x20, 3396]
	ldr	w2, [x1, 700]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 700]
	ldr	x0, [x19, 144]
	strb	w4, [x0, 816]
	ldr	x0, [x19, 144]
	strb	w3, [x0, 720]
	ldr	x0, [x19, 144]
	ldr	w1, [x20, 3404]
	str	w1, [x0, 832]
	ldr	x1, [x19, 144]
	ldr	w2, [x1, 784]
	ldr	w0, [x1, 832]
	add	w0, w2, w0
	lsr	w0, w0, 1
	str	w0, [x1, 736]
	ldr	x0, [x19, 144]
	ldr	w1, [x0, 736]
	str	w1, [x0, 704]
	ldr	x0, [x19, 144]
	ldr	x1, [x0, 856]
	str	x1, [x0, 760]
	ldrb	w0, [x20, 2679]
	ldr	x1, [x19, 144]
	cmp	w0, 1
	beq	.L2962
.L2901:
	ldrb	w0, [x1, 3]
.L2902:
	strb	w0, [x1, 3]
	mov	w2, 0
	b	.L2954
	.p2align 3
.L2881:
	ldr	x3, [x19, 144]
	cbz	x3, .L2963
.L2886:
	mov	x2, 664
	add	x1, x20, 2688
	add	x0, x3, 8
	ldr	x28, [x3, 648]
	ldp	w25, w24, [x3, 16]
	ldp	w23, w22, [x3, 24]
	ldr	x27, [x3, 656]
	ldr	x26, [x3, 664]
	bl	memcpy
	ldr	x0, [x20, 3328]
	cmn	x0, #1
	ccmn	x28, #1, 4, eq
	beq	.L2887
	ldr	x0, [x19, 144]
	str	x28, [x0, 648]
.L2887:
	ldr	x0, [x20, 3336]
	ldr	x1, [x19, 144]
	cmp	x0, x27
	csel	x0, x0, x27, ls
	str	x0, [x1, 656]
	ldr	x0, [x20, 3344]
	ldr	x1, [x19, 144]
	cmp	x0, x26
	csel	x0, x0, x26, ls
	str	x0, [x1, 664]
	ldr	w0, [x20, 2696]
	ldr	x1, [x19, 144]
	cmp	w0, w25
	csel	w0, w0, w25, ls
	str	w0, [x1, 16]
	ldr	w0, [x20, 2700]
	ldr	x1, [x19, 144]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 20]
	ldr	w0, [x20, 2704]
	ldr	x1, [x19, 144]
	cmp	w0, w23
	csel	w0, w0, w23, ls
	str	w0, [x1, 24]
	ldr	w0, [x20, 2708]
	ldr	x1, [x19, 144]
	cmp	w0, w22
	csel	w0, w0, w22, ls
	str	w0, [x1, 28]
	ldr	x1, [x19, 144]
	ldrb	w0, [x1]
	cbz	w0, .L2888
	ldrb	w0, [x20, 2674]
.L2888:
	strb	w0, [x1]
	mov	w4, 1
	mov	w3, 3
	ldr	x1, [x19, 144]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 1
	strb	w0, [x1, 1]
	ldr	x1, [x19, 144]
	ldr	w0, [x20, 3396]
	ldr	w2, [x1, 700]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 700]
	ldr	x0, [x19, 144]
	strb	w4, [x0, 768]
	ldr	x0, [x19, 144]
	strb	w3, [x0, 720]
	ldr	x0, [x19, 144]
	ldr	w1, [x20, 3404]
	str	w1, [x0, 784]
	ldr	x1, [x19, 144]
	ldr	w2, [x1, 784]
	ldr	w0, [x1, 832]
	add	w0, w2, w0
	lsr	w0, w0, w4
	str	w0, [x1, 736]
	ldr	x0, [x19, 144]
	ldr	w1, [x0, 736]
	str	w1, [x0, 704]
	ldr	x0, [x19, 144]
	ldr	x1, [x0, 808]
	str	x1, [x0, 760]
	ldrb	w0, [x20, 2679]
	ldr	x1, [x19, 144]
	cmp	w0, 1
	bne	.L2901
	ldrb	w0, [x1, 3]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L2902
	.p2align 3
.L2958:
	ldr	x2, .LC786
	mov	w4, w0
	ldr	x1, .LC788
	mov	w3, 2742
	add	x2, x2, 232
	mov	w0, 22
	bl	dprint_vfmw
	b	.L2878
	.p2align 3
.L2962:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L2902
	.p2align 3
.L2882:
	ldr	x0, [x20, 3352]
	mov	w22, 0
	str	x0, [x19, 144]
	str	x0, [x0, 808]
	b	.L2884
	.p2align 3
.L2893:
	ldr	x0, [x20, 3352]
	mov	w22, 0
	str	x0, [x19, 144]
	str	x0, [x0, 856]
	b	.L2895
	.p2align 3
.L2960:
	ldr	x2, .LC786
	mov	w4, w0
	ldr	x1, .LC788
	mov	w3, 2794
	add	x2, x2, 232
	mov	w0, 22
	bl	dprint_vfmw
	b	.L2883
	.p2align 3
.L2957:
	ldr	x2, .LC786
	mov	w4, w0
	ldr	x1, .LC788
	mov	w3, 2936
	add	x2, x2, 232
	mov	w0, 22
	bl	dprint_vfmw
	b	.L2894
	.p2align 3
.L2963:
	ldr	x0, [x20, 3352]
	str	x0, [x19, 144]
	str	x0, [x0, 808]
	ldr	x3, [x19, 144]
	b	.L2886
	.p2align 3
.L2961:
	ldr	x0, [x20, 3352]
	str	x0, [x19, 144]
	str	x0, [x0, 856]
	ldr	x3, [x19, 144]
	b	.L2898
	.size	DirectOutput, .-DirectOutput
	.align	3
.LC786:
	.xword	.LANCHOR1
	.align	3
.LC788:
	.xword	.LC787
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_GetRemainImg
	.type	H264DEC_GetRemainImg, %function
H264DEC_GetRemainImg:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 24576
	mov	w19, 0
	bl	_mcount
	ldr	w0, [x20, 3716]
	cbnz	w0, .L2984
	b	.L2966
	.p2align 3
.L2967:
	ldr	w0, [x20, 3716]
	cmp	w0, w19
	bls	.L2966
.L2984:
	add	x0, x21, x19, uxtw 3
	add	w19, w19, 1
	ldr	x1, [x0, 27904]
	ldrb	w0, [x1, 2]
	cbz	w0, .L2967
	mov	x0, x21
	bl	UnMarkFrameStoreRef
	ldr	w0, [x20, 3716]
	cmp	w0, w19
	bhi	.L2984
	.p2align 2
.L2966:
	mov	x0, x21
	bl	RemoveUnUsedFrameStore
	cbnz	w0, .L2966
	mov	w23, -1
	.p2align 2
.L2970:
	ldr	w5, [x20, 3716]
	cbz	w5, .L2990
.L2976:
	ldr	w0, [x20, 3712]
	cmp	w5, w0
	bls	.L2971
	str	w0, [x20, 3716]
	cbz	w0, .L2978
	mov	w5, w0
.L2971:
	add	x1, x20, 3328
	mov	w4, 2147483647
	mov	w0, 0
	mov	w19, 0
	.p2align 2
.L2974:
	ldr	x3, [x1]
	add	x1, x1, 8
	ldr	w2, [x3, 688]
	cmp	w2, w4
	bge	.L2973
	ldrb	w3, [x3, 4]
	cmp	w3, wzr
	csel	w4, w4, w2, eq
	csel	w19, w19, w0, eq
.L2973:
	add	w0, w0, 1
	cmp	w5, w0
	bhi	.L2974
.L2972:
	add	x22, x21, x19, uxtw 3
	mov	x0, x21
	ldr	x1, [x22, 27904]
	strb	wzr, [x1, 4]
	ldr	w2, [x20, 3716]
	ldr	x1, [x22, 27904]
	bl	OutputFrmToVO
	mov	w23, w0
	ldr	x0, [x22, 27904]
	ldrb	w0, [x0, 2]
	cbnz	w0, .L2970
	mov	w1, w19
	mov	x0, x21
	bl	RemoveFrameStoreOutDPB
	ldr	w5, [x20, 3716]
	cbnz	w5, .L2976
.L2990:
	cbz	w23, .L2977
	add	x0, x21, 8
	bl	GetVoLastImageID
	mov	w23, w0
.L2977:
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L2978:
	mov	w19, 0
	b	.L2972
	.size	H264DEC_GetRemainImg, .-H264DEC_GetRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	InitDPB.part.13, %function
InitDPB.part.13:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x23, x21, 24576
	add	x20, x21, 65536
	add	x19, x23, 3328
	add	x22, x23, 3456
	bl	_mcount
	.p2align 2
.L2995:
	ldr	x0, [x19]
	mov	w2, 1
	cbz	x0, .L2992
	ldr	w1, [x0, 672]
	ldr	w0, [x20, 2820]
	bl	FSP_ClearLogicFs
.L2992:
	ldr	x0, [x19, 128]
	mov	w2, 1
	cbz	x0, .L2993
	ldr	w1, [x0, 672]
	ldr	w0, [x20, 2820]
	bl	FSP_ClearLogicFs
.L2993:
	ldr	x0, [x19, 256]
	mov	w2, 1
	cbz	x0, .L2994
	ldr	w1, [x0, 672]
	ldr	w0, [x20, 2820]
	bl	FSP_ClearLogicFs
.L2994:
	str	xzr, [x19, 128]
	str	xzr, [x19, 256]
	str	xzr, [x19], 8
	cmp	x19, x22
	bne	.L2995
	add	x0, x21, 16384
	add	x1, x23, 3584
	ldr	w0, [x0, 1864]
	stp	wzr, wzr, [x1, 136]
	sub	w0, w0, #1
	stp	w0, wzr, [x1, 128]
	str	wzr, [x23, 3728]
	ldr	x1, [x20, 144]
	cbz	x1, .L2997
	ldr	w0, [x20, 2748]
	cmp	w0, 2
	beq	.L3027
.L2998:
	ldr	w0, [x20, 2820]
	mov	w2, 1
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
	add	x0, x21, 61440
	ldr	x0, [x0, 3352]
	cbz	x0, .L3001
	ldr	x2, [x20, 144]
	ldr	w1, [x0, 672]
	ldr	w0, [x2, 672]
	cmp	w0, w1
	beq	.L3001
	ldr	w0, [x20, 2820]
	mov	w2, 1
	bl	FSP_ClearLogicFs
.L3001:
	str	xzr, [x20, 144]
.L2997:
	ldr	x3, .LC791
	mov	x2, 392
	mov	w1, 0
	add	x0, x23, 3736
	ldr	x3, [x3, 96]
	blr	x3
	str	wzr, [x23, 3996]
	ldr	w0, [x23, 3712]
	str	w0, [x23, 3992]
	add	x0, x20, 1264
	add	x20, x20, 1332
	.p2align 2
.L3002:
	str	wzr, [x0], 4
	cmp	x0, x20
	bne	.L3002
	add	x2, x21, 28672
	add	x1, x2, 32
	add	x0, x2, 296
	.p2align 2
.L3003:
	str	xzr, [x1], 8
	cmp	x1, x0
	bne	.L3003
	add	x21, x21, 20480
	add	x1, x2, 560
	str	wzr, [x21, 1628]
	.p2align 2
.L3004:
	str	xzr, [x0], 8
	cmp	x1, x0
	bne	.L3004
	str	wzr, [x21, 1632]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L3027:
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	cbnz	w0, .L3028
.L2999:
	ldr	x1, [x20, 144]
	cbz	x1, .L2997
	b	.L2998
	.p2align 3
.L3028:
	ldr	x2, .LC789
	mov	w4, w0
	ldr	x1, .LC790
	mov	w3, 5730
	add	x2, x2, 248
	mov	w0, 22
	bl	dprint_vfmw
	b	.L2999
	.size	InitDPB.part.13, .-InitDPB.part.13
	.align	3
.LC789:
	.xword	.LANCHOR1
	.align	3
.LC790:
	.xword	.LC787
	.align	3
.LC791:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitDPB
	.type	InitDPB, %function
InitDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	cbz	x19, .L3031
	mov	x0, x19
	bl	ClearAllSlice
	mov	x0, x19
	bl	InitDPB.part.13
.L3030:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3031:
	mov	w0, -1
	b	.L3030
	.size	InitDPB, .-InitDPB
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearDPB
	.type	ClearDPB, %function
ClearDPB:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	FlushDPB
	cbz	w0, .L3033
	ldr	x1, .LC793
	mov	w3, w0
	mov	w2, 496
	mov	w0, 0
	bl	dprint_vfmw
.L3033:
	mov	x0, x19
	add	x19, x19, 65536
	bl	InitDPB
	str	wzr, [x19, 1348]
	mov	w0, 0
	str	wzr, [x19, 2824]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	ClearDPB, .-ClearDPB
	.align	3
.LC793:
	.xword	.LC792
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecVDM
	.type	DecVDM, %function
DecVDM:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x22, x0
	mov	x0, x30
	add	x21, x22, 61440
	bl	_mcount
	ldrb	w0, [x21, 2675]
	cbz	w0, .L3038
	ldrb	w0, [x21, 2673]
	add	x19, x22, 65536
	cmp	w0, 1
	beq	.L3038
.L3039:
	ldr	w20, [x19, 2808]
	ldr	w0, [x19, 2748]
	ubfx	x20, x20, 16, 3
	cmp	w20, w0
	beq	.L3040
	sub	w0, w0, #2
	cmp	w0, 1
	ccmp	w20, 2, 4, ls
	beq	.L3040
	cmp	w20, 1
	ccmp	w20, 4, 4, hi
	beq	.L3122
.L3040:
	cmp	w20, 2
	str	w20, [x19, 2748]
	beq	.L3043
	cmp	w20, 3
	beq	.L3044
	cmp	w20, 1
	beq	.L3123
	ldr	w0, [x19, 2744]
	cbz	w0, .L3047
	cmp	w20, 4
	ldr	w20, [x21, 3396]
	bne	.L3053
	cbnz	w20, .L3053
	ldr	w0, [x19, 1352]
	cbnz	w0, .L3054
	mov	w0, 2
	str	w0, [x19, 1352]
	b	.L3066
	.p2align 3
.L3038:
	add	x19, x22, 65536
	ldr	w0, [x19, 2844]
	ldr	w1, [x19, 2848]
	add	w0, w0, 1
	cmp	w0, w1
	csel	w0, w0, w1, ge
	str	w0, [x19, 2844]
	sub	w0, w0, w1
	ldr	x1, [x22]
	str	w0, [x1, 576]
	b	.L3039
	.p2align 3
.L3044:
	mov	x0, x22
	mov	w19, -1
	bl	ClearAllSlice
	add	x1, x22, 20480
	ldr	w4, [x22, 14948]
	add	x6, x1, 3072
	mov	w3, 23352
	movk	w3, 0x1, lsl 16
	mov	w2, 2
	strb	wzr, [x1, 3232]
	mov	w0, 7
	strb	w2, [x1, 3233]
	mov	w2, 262144
	str	w0, [x1, 3244]
	mov	w0, 32
	str	w4, [x1, 3240]
	str	w3, [x1, 3248]
	stp	w20, w19, [x6, 184]
	stp	wzr, wzr, [x6, 192]
	strb	w0, [x1, 3234]
	mov	x0, x22
	str	w2, [x1, 3272]
	bl	ClearDPB
	mov	w0, w19
.L3115:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3123:
	ldr	w20, [x21, 3396]
	cmp	w20, 2
	bne	.L3049
	ldr	w0, [x21, 3376]
	cbz	w0, .L3050
.L3049:
	ldr	w0, [x19, 2744]
	cbz	w0, .L3047
.L3053:
	cmp	w20, 2
	beq	.L3124
	cmp	w20, 1
	bne	.L3066
	str	w20, [x19, 1352]
.L3066:
	ldr	w2, [x19, 2784]
	mov	w0, 2
	ldr	x1, .LC803
	ldrb	w3, [x21, 2675]
	sub	w2, w2, #1
	bl	dprint_vfmw
	ldr	w0, [x21, 3420]
	str	w0, [x19, 2252]
	mov	w0, 1
	strb	w0, [x19, 1402]
	ldr	w2, [x19, 2744]
	ldr	w1, [x21, 3424]
	ldr	w0, [x19, 2784]
	str	w1, [x19, 2248]
	str	w2, [x19, 2452]
	cbz	w0, .L3057
	ldr	w4, [x21, 3396]
	cbnz	w4, .L3058
	ldr	x0, .LC798
	ldr	x5, [x0]
	cbz	x5, .L3059
	ldr	x1, [x19, 2456]
	cbz	x1, .L3060
	mov	w2, 0
	.p2align 2
.L3061:
	ldp	w3, w0, [x1, 8]
	ldr	x1, [x1, 4056]
	add	w0, w3, w0
	add	w0, w0, 7
	add	w2, w2, w0, lsr 3
	mov	w4, w2
	cbnz	x1, .L3061
.L3060:
	add	x2, x29, 64
	ldr	w0, [x19, 2820]
	mov	w1, 20
	mov	w3, 4
	str	w4, [x2, -8]!
	blr	x5
	ldr	x1, [x22]
.L3062:
	add	x2, x19, 1400
	str	x2, [x22, 616]
	ldr	w0, [x1, 864]
	cmp	w0, 1
	beq	.L3125
	cmp	w0, 2
	beq	.L3126
.L3065:
	ldr	w2, [x1, 592]
	mov	w0, 0
	str	w2, [x19, 2720]
	ldr	w1, [x1, 632]
	str	w1, [x19, 2724]
	ldr	w4, [x21, 3436]
	ldr	x3, [x21, 3352]
	ldr	w1, [x21, 3432]
	str	w4, [x21, 3432]
	sub	w1, w1, w4
	ldr	w2, [x3, 368]
	add	w2, w2, w1
	str	w2, [x3, 368]
	ldr	w2, [x21, 3048]
	add	w1, w2, w1
	str	w1, [x21, 3048]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3043:
	ldr	w0, [x21, 3396]
	cbnz	w0, .L3050
	ldr	w0, [x19, 2744]
	cbz	w0, .L3047
	ldr	x0, [x19, 2736]
	ldr	w0, [x0, 48]
	cbz	w0, .L3066
	mov	w1, 1
	mov	x0, x22
	strb	w1, [x21, 2679]
	mov	w19, -1
	bl	ClearAllSlice
	add	x2, x22, 20480
	mov	w3, 23352
	movk	w3, 0x1, lsl 16
	mov	w0, 7
	ldr	w4, [x22, 14948]
	ldr	x1, .LC797
	str	w0, [x2, 3244]
	mov	w0, 3
	str	w3, [x2, 3248]
	mov	w3, 32
	str	w0, [x2, 3256]
	mov	w0, 0
	strb	w3, [x2, 3234]
	mov	w3, 262144
	strb	wzr, [x2, 3232]
	strb	w20, [x2, 3233]
	str	w4, [x2, 3240]
	str	w19, [x2, 3260]
	str	wzr, [x2, 3264]
	str	wzr, [x2, 3268]
	str	w3, [x2, 3272]
	bl	dprint_vfmw
	mov	w0, w19
	b	.L3115
	.p2align 3
.L3047:
	mov	x0, x22
	mov	w20, -1
	bl	ClearAllSlice
	add	x0, x22, 20480
	mov	w5, 7
	ldr	w7, [x22, 14948]
	mov	w1, 23352
	ldr	x2, .LC798
	movk	w1, 0x1, lsl 16
	str	w5, [x0, 3244]
	add	x5, x0, 3072
	str	w1, [x0, 3248]
	mov	w6, 2
	strb	wzr, [x0, 3232]
	mov	w3, 32
	strb	w6, [x0, 3233]
	mov	w1, 262144
	strb	w3, [x0, 3234]
	str	w7, [x0, 3240]
	ldr	x4, [x2]
	mov	w2, 3
	stp	wzr, wzr, [x5, 192]
	stp	w2, w20, [x5, 184]
	str	w1, [x0, 3272]
	cbz	x4, .L3118
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3124:
	ldr	w0, [x19, 1352]
	cmp	w0, 2
	bne	.L3066
	ldr	x0, [x22]
	ldr	w0, [x0, 12]
	cbnz	w0, .L3066
	ldr	x0, .LC799
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L3066
	ldr	x1, .LC801
	mov	w0, 1
	ldr	w3, [x21, 3376]
	ldr	w2, [x21, 3380]
	bl	dprint_vfmw
	mov	x0, x22
	bl	ClearAllSlice
	ldr	x3, .LC798
	add	x0, x22, 20480
	mov	w1, 23352
	ldr	w2, [x22, 14948]
	movk	w1, 0x1, lsl 16
	mov	w6, 7
	ldr	x4, [x3]
	mov	w5, 32
	mov	w3, 3
	str	w2, [x0, 3240]
	str	w1, [x0, 3248]
	mov	w2, -1
	mov	w1, 262144
	strb	wzr, [x0, 3232]
	strb	w20, [x0, 3233]
	strb	w5, [x0, 3234]
	str	w6, [x0, 3244]
	str	w3, [x0, 3256]
	str	wzr, [x0, 3264]
	str	wzr, [x0, 3268]
	str	w2, [x0, 3260]
	str	w1, [x0, 3272]
	cbz	x4, .L3056
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3056:
	ldr	x1, [x21, 3352]
	mov	w2, 0
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
	.p2align 2
.L3118:
	mov	w0, -1
	b	.L3115
	.p2align 3
.L3057:
	ldr	x1, [x22]
	b	.L3065
	.p2align 3
.L3058:
	add	x0, x22, 24576
	ldr	w0, [x0, 3716]
	cbnz	w0, .L3059
	ldr	x1, [x22]
	ldr	w0, [x1, 12]
	cmp	w0, 2
	beq	.L3062
	ldr	x0, .LC798
	ldr	x4, [x0]
	cbz	x4, .L3063
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3063:
	mov	x0, x22
.L3120:
	bl	ClearAllSlice
	add	x1, x22, 20480
	ldr	w8, [x22, 14948]
	mov	w7, 23352
	mov	w6, 2
	movk	w7, 0x1, lsl 16
	mov	w0, -1
	mov	w5, 7
	mov	w4, 32
	mov	w3, 3
	mov	w2, 262144
	strb	wzr, [x1, 3232]
	strb	w6, [x1, 3233]
	str	w8, [x1, 3240]
	str	w7, [x1, 3248]
	b	.L3117
	.p2align 3
.L3059:
	ldr	x1, [x22]
	b	.L3062
	.p2align 3
.L3125:
	cbz	x2, .L3065
	ldr	w20, [x21, 3396]
	cmp	w20, 2
	bne	.L3065
	str	xzr, [x22, 616]
	mov	w2, 0
	ldr	x1, [x21, 3352]
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
	mov	x0, x22
	b	.L3119
	.p2align 3
.L3126:
	ldr	w0, [x1, 868]
	cmp	w0, wzr
	ccmp	x2, xzr, 4, gt
	beq	.L3065
	ldr	w20, [x21, 3396]
	cmp	w20, 2
	bne	.L3065
	str	xzr, [x22, 616]
	mov	w2, 0
	ldr	x1, [x21, 3352]
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
	ldr	x2, [x22]
	mov	x0, x22
	ldr	w1, [x2, 868]
	sub	w1, w1, #1
	str	w1, [x2, 868]
.L3119:
	bl	ClearAllSlice
	add	x1, x22, 20480
	ldr	w7, [x22, 14948]
	mov	w6, 23352
	mov	w0, -1
	movk	w6, 0x1, lsl 16
	mov	w5, 7
	mov	w4, 32
	mov	w3, 3
	mov	w2, 262144
	strb	wzr, [x1, 3232]
	strb	w20, [x1, 3233]
	str	w7, [x1, 3240]
	str	w6, [x1, 3248]
	.p2align 2
.L3117:
	strb	w4, [x1, 3234]
	add	x4, x1, 3072
	str	w5, [x1, 3244]
	stp	w3, w0, [x4, 184]
	stp	wzr, wzr, [x4, 192]
	str	w2, [x1, 3272]
	b	.L3115
	.p2align 3
.L3054:
	mov	w0, 1
	str	w0, [x19, 1352]
	b	.L3066
.L3122:
	ldr	x1, .LC795
	mov	w2, w20
	mov	w0, 2
	mov	w21, -1
	bl	dprint_vfmw
	str	w20, [x19, 2748]
	mov	x0, x22
	bl	ClearAllSlice
	add	x1, x22, 20480
	ldr	w4, [x22, 14948]
	add	x7, x1, 3072
	mov	w2, 2
	mov	w3, 23352
	mov	w0, 7
	strb	w2, [x1, 3233]
	movk	w3, 0x1, lsl 16
	str	w0, [x1, 3244]
	mov	w2, 32
	strb	wzr, [x1, 3232]
	mov	w0, 3
	strb	w2, [x1, 3234]
	mov	w2, 262144
	str	w4, [x1, 3240]
	str	w3, [x1, 3248]
	stp	w21, wzr, [x7, 188]
	stp	wzr, w2, [x7, 196]
	str	w0, [x1, 3256]
	mov	x0, x22
	bl	ClearDPB
	mov	w0, w21
	b	.L3115
.L3050:
	mov	w1, 1
	mov	x0, x22
	strb	w1, [x21, 2679]
	b	.L3120
	.size	DecVDM, .-DecVDM
	.align	3
.LC795:
	.xword	.LC794
	.align	3
.LC797:
	.xword	.LC796
	.align	3
.LC798:
	.xword	g_event_report
	.align	3
.LC799:
	.xword	g_allow_B_before_P
	.align	3
.LC801:
	.xword	.LC800
	.align	3
.LC803:
	.xword	.LC802
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_FlushDecoder
	.type	H264_FlushDecoder, %function
H264_FlushDecoder:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, 1
	bl	_mcount
	add	x1, x19, 20480
	mov	w2, 1
	mov	x0, x19
	strb	w2, [x1, 1589]
	str	wzr, [x1, 1636]
	str	w20, [x19, 624]
	bl	DecVDM
	cbz	w0, .L3127
	ldr	x1, .LC805
	mov	w0, w20
	bl	dprint_vfmw
.L3127:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264_FlushDecoder, .-H264_FlushDecoder
	.align	3
.LC805:
	.xword	.LC804
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_VES_Splitter
	.type	H264_VES_Splitter, %function
H264_VES_Splitter:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 12288
	mov	w20, w1
	mov	w23, w2
	mov	w24, w3
	add	x19, x19, 2600
	bl	_mcount
	add	x22, x21, 61440
	mov	w1, 24
	mov	x0, x19
	str	xzr, [x29, 72]
	bl	BsSkip
	ldr	x0, [x22, 2952]
	str	x0, [x29, 72]
	cbz	w20, .L3134
	cmp	w20, 1
	beq	.L3135
	ldr	x1, .LC819
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
.L3219:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3135:
	mov	w1, 16
	mov	x0, x19
	cbnz	w23, .L3148
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w1, 31745
	cmp	w20, w1
	bne	.L3239
	and	w0, w0, 31
	cmp	w0, 25
	ccmp	w24, 1, 0, eq
	bne	.L3232
	ldr	x19, .LC806
	ldr	x4, [x19]
	cbz	x4, .L3152
	add	x0, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	ldr	w0, [x0, 2820]
	blr	x4
.L3152:
	mov	x0, x21
	bl	DecVDM
	cbz	w0, .L3232
	b	.L3229
	.p2align 3
.L3134:
	cbnz	w23, .L3136
	mov	w1, 16
	mov	x0, x19
	mov	w23, 31745
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	cmp	w20, w23
	beq	.L3137
	mov	w1, 24
	mov	x0, x19
	and	w20, w20, -513
	bl	BsBack
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	cmp	w20, w23
	bne	.L3222
.L3232:
	ldr	x1, [x21, 632]
	cbz	x1, .L3223
	add	x0, x21, 65536
	ldr	w0, [x0, 2820]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
.L3223:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3148:
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w1, 31745
	cmp	w20, w1
	beq	.L3156
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w0, 32257
	cmp	w20, w0
	beq	.L3240
.L3222:
	mov	w0, 0
.L3242:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3137:
	and	w0, w0, 31
	cmp	w0, 25
	bne	.L3232
	ldr	x19, .LC806
	ldr	x4, [x19]
	cbz	x4, .L3140
	add	x0, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	ldr	w0, [x0, 2820]
	blr	x4
.L3140:
	mov	x0, x21
	bl	DecVDM
	cbz	w0, .L3241
.L3229:
	ldr	x4, [x19]
	cbz	x4, .L3223
	add	x21, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	ldr	w0, [x21, 2820]
	blr	x4
	mov	w0, -1
	b	.L3219
	.p2align 3
.L3136:
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w0, 0
	b	.L3242
	.p2align 3
.L3239:
	mov	w1, 32
	mov	x0, x19
	bl	BsBack
	ldr	x0, [x21, 632]
	mov	w2, 32257
	mov	w1, 16
	cmp	w20, w2
	str	w1, [x0, 72]
	beq	.L3243
	mov	w1, 8
	mov	x0, x19
	bl	BsSkip
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	and	w0, w0, 31
	cmp	w0, 11
	bne	.L3232
	mov	x0, x21
	bl	H264_IsEosNal
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L3232
	mov	w1, 32
	mov	x0, x19
	bl	BsBack
	mov	w1, 32
	mov	x0, x19
	bl	BsBack
	mov	w1, 32
	mov	x0, x19
	bl	BsBack
	mov	w0, 3
	b	.L3219
	.p2align 3
.L3156:
	and	w0, w0, 31
	cmp	w0, 25
	bne	.L3222
	ldr	x19, .LC806
	ldr	x4, [x19]
	cbz	x4, .L3158
	add	x0, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	ldr	w0, [x0, 2820]
	blr	x4
.L3158:
	mov	x0, x21
	bl	DecVDM
	cbnz	w0, .L3229
	ldr	x0, [x21, 632]
	add	x23, x22, 2936
	add	x20, x21, 65536
	ldr	w1, [x23, 8]
	add	x2, x29, 72
	ldr	w4, [x0, 16]
	ldr	w3, [x0, 48]
	ldr	w0, [x20, 2820]
	add	w3, w4, w3
	sub	w3, w3, #2
	bl	MetadataMapToSec
	cbnz	w0, .L3244
	ldr	x19, .LC810
	mov	x2, 4
	ldr	x1, .LC811
	ldr	x0, [x29, 72]
	ldr	x3, [x19, 104]
	blr	x3
	ldr	x1, [x21, 632]
	ldr	x0, [x29, 72]
	ldr	x3, [x19, 104]
	ldr	w2, [x1, 16]
	add	x0, x0, 4
	sub	w2, w2, #6
	str	w2, [x23, 4]
	ldr	x1, [x1, 8]
	add	x1, x1, 6
	blr	x3
	ldr	w0, [x23, 4]
	add	w0, w0, 4
	str	w0, [x23, 4]
	ldr	x1, [x21, 632]
	ldr	w2, [x1, 48]
	cbnz	w2, .L3245
.L3161:
	ldr	x23, .LC812
	ldr	w0, [x20, 2820]
	ldr	x1, [x23, w0, sxtw 3]
	cbz	x1, .L3162
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldrsw	x2, [x20, 2820]
	ldr	w1, [x22, 2940]
	ldr	x3, [x19, 88]
	ldr	x2, [x23, x2, lsl 3]
	ldr	x0, [x29, 72]
	blr	x3
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	ldr	w0, [x20, 2820]
.L3162:
	ldr	x1, [x29, 72]
	bl	MetadataUnMapToSec
	cbnz	w0, .L3246
.L3163:
	ldr	x1, [x21, 632]
	cbz	x1, .L3223
	ldr	w0, [x20, 2820]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
	mov	w0, -1
	b	.L3219
	.p2align 3
.L3240:
	ldr	x2, .LC807
	mov	w3, 13544
	ldr	x1, .LC817
	mov	w0, 0
	add	x2, x2, 256
	bl	dprint_vfmw
	b	.L3232
	.p2align 3
.L3243:
	add	x22, x21, 65536
	ldr	x20, .LC815
	ldrsw	x0, [x22, 2820]
	ldr	x0, [x20, x0, lsl 3]
	cbz	x0, .L3222
	ldr	x19, .LC810
	mov	w0, 0
	ldr	x1, [x19, 32]
	blr	x1
	ldr	x0, [x21, 632]
	ldrsw	x2, [x22, 2820]
	ldr	x3, [x19, 88]
	ldr	w1, [x0, 16]
	ldr	x2, [x20, x2, lsl 3]
	ldr	x0, [x0, 8]
	blr	x3
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	mov	w0, 0
	b	.L3219
	.p2align 3
.L3241:
	ldr	x0, [x21, 632]
	add	x23, x22, 2936
	add	x20, x21, 65536
	ldr	w1, [x23, 8]
	add	x2, x29, 72
	ldr	w4, [x0, 16]
	ldr	w3, [x0, 48]
	ldr	w0, [x20, 2820]
	add	w3, w4, w3
	sub	w3, w3, #2
	bl	MetadataMapToSec
	cbnz	w0, .L3247
	ldr	x19, .LC810
	mov	x2, 4
	ldr	x1, .LC811
	ldr	x0, [x29, 72]
	ldr	x3, [x19, 104]
	blr	x3
	ldr	x1, [x21, 632]
	ldr	x0, [x29, 72]
	ldr	x3, [x19, 104]
	ldr	w2, [x1, 16]
	add	x0, x0, 4
	sub	w2, w2, #6
	str	w2, [x23, 4]
	ldr	x1, [x1, 8]
	add	x1, x1, 6
	blr	x3
	ldr	w0, [x23, 4]
	add	w0, w0, 4
	str	w0, [x23, 4]
	ldr	x1, [x21, 632]
	ldr	w2, [x1, 48]
	cbnz	w2, .L3248
.L3144:
	ldr	x23, .LC812
	ldr	w0, [x20, 2820]
	ldr	x1, [x23, w0, sxtw 3]
	cbz	x1, .L3145
	ldr	x1, [x19, 32]
	mov	w0, 0
	blr	x1
	ldrsw	x2, [x20, 2820]
	ldr	w1, [x22, 2940]
	ldr	x3, [x19, 88]
	ldr	x2, [x23, x2, lsl 3]
	ldr	x0, [x29, 72]
	blr	x3
	ldr	x1, [x19, 24]
	mov	w0, 0
	blr	x1
	ldr	w0, [x20, 2820]
.L3145:
	ldr	x1, [x29, 72]
	bl	MetadataUnMapToSec
	cbz	w0, .L3163
	ldr	x2, .LC807
	mov	w3, 13376
	ldr	x1, .LC814
	mov	w0, 0
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3219
	.p2align 3
.L3248:
	ldr	x4, [x29, 72]
	uxtw	x2, w2
	ldr	x1, [x1, 40]
	ldr	x3, [x19, 104]
	add	x0, x4, x0, uxtw
	blr	x3
	ldr	x1, [x21, 632]
	ldr	w0, [x23, 4]
	ldr	w1, [x1, 48]
	add	w0, w1, w0
	str	w0, [x23, 4]
	b	.L3144
.L3245:
	ldr	x4, [x29, 72]
	uxtw	x2, w2
	ldr	x1, [x1, 40]
	ldr	x3, [x19, 104]
	add	x0, x4, x0, uxtw
	blr	x3
	ldr	x1, [x21, 632]
	ldr	w0, [x23, 4]
	ldr	w1, [x1, 48]
	add	w0, w1, w0
	str	w0, [x23, 4]
	b	.L3161
.L3247:
	ldr	x2, .LC807
	mov	w3, 13342
	ldr	x1, .LC809
	mov	w0, 0
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3219
.L3244:
	ldr	x2, .LC807
	mov	w3, 13504
	ldr	x1, .LC809
	mov	w0, 0
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3219
.L3246:
	ldr	x2, .LC807
	mov	w3, 13532
	ldr	x1, .LC814
	mov	w0, 0
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3219
	.size	H264_VES_Splitter, .-H264_VES_Splitter
	.align	3
.LC806:
	.xword	g_event_report
	.align	3
.LC807:
	.xword	.LANCHOR1
	.align	3
.LC809:
	.xword	.LC808
	.align	3
.LC810:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC811:
	.xword	RPU_START_CODE
	.align	3
.LC812:
	.xword	vfmw_save_metadata_file
	.align	3
.LC814:
	.xword	.LC813
	.align	3
.LC815:
	.xword	vfmw_save_el_file
	.align	3
.LC817:
	.xword	.LC816
	.align	3
.LC819:
	.xword	.LC818
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ReceivePacket
	.type	ReceivePacket, %function
ReceivePacket:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 65536
	bl	_mcount
	ldr	x1, .LC821
	mov	w0, 7
	ldp	w3, w4, [x19, 16]
	ldr	x2, [x19, 8]
	bl	dprint_vfmw
	str	wzr, [x21, 2852]
	ldr	x0, [x20]
	ldr	w1, [x0, 832]
	cmp	w1, 1
	beq	.L3319
.L3250:
	ldr	x0, [x20, 632]
	cbz	x0, .L3255
	ldrb	w1, [x19]
	cmp	w1, 1
	beq	.L3320
.L3253:
	ldr	x1, .LC823
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbz	x1, .L3255
	ldr	w0, [x21, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L3255:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L3257
	ldr	x0, [x19, 8]
	cbz	x0, .L3257
	ldr	w0, [x19, 16]
	cbz	w0, .L3257
	ldrb	w0, [x20, 641]
	cbz	w0, .L3277
	add	x1, x20, 745
	mov	x0, 1
	b	.L3260
	.p2align 3
.L3259:
	add	w0, w0, 1
	cmp	w0, 137
	beq	.L3275
.L3260:
	ldrb	w2, [x1]
	add	x1, x1, 104
	cbnz	w2, .L3259
	mov	w2, w0
.L3258:
	lsl	x1, x0, 3
	mov	w3, 1
	sub	x1, x1, x0
	cmn	w2, #1
	lsl	x1, x1, x3
	sub	x0, x1, x0
	add	x0, x20, x0, lsl 3
	strb	w3, [x0, 641]
	beq	.L3275
	sxtw	x1, w2
	mov	w2, 1
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 1
	sub	x0, x0, x1
	lsl	x0, x0, 3
	add	x1, x0, 640
	add	x0, x20, x0
	add	x1, x20, x1
	str	x1, [x20, 632]
	ldr	x1, [x19, 8]
	str	x1, [x0, 648]
	ldr	w1, [x19, 20]
	str	w1, [x0, 656]
	ldr	w1, [x19, 16]
	str	w1, [x0, 660]
	ldr	x0, [x20, 632]
	str	wzr, [x0, 28]
	ldr	x0, [x20, 632]
	ldr	w1, [x19, 24]
	str	w1, [x0, 36]
	ldr	x0, [x20, 632]
	ldr	x1, [x19, 32]
	str	x1, [x0, 96]
	ldr	x0, [x20, 632]
	str	w2, [x0, 76]
	ldr	x0, [x20, 632]
	strb	wzr, [x0]
	ldr	x0, [x20, 632]
	ldrb	w1, [x19]
	strb	w1, [x0, 4]
	ldr	x0, [x20]
	ldrb	w0, [x0, 900]
	cmp	w0, w2
	beq	.L3316
	add	x0, x20, 61440
	ldr	w2, [x19, 20]
	ldr	w1, [x0, 3432]
	ldr	w3, [x0, 3436]
	add	w2, w1, w2
	str	w2, [x0, 3432]
	ldr	w1, [x19, 20]
	add	w1, w3, w1
	str	w1, [x0, 3436]
	ldr	x0, [x20, 632]
	b	.L3266
	.p2align 3
.L3320:
	ldr	w2, [x0, 76]
	cmp	w2, 1
	bhi	.L3253
	ldrb	w2, [x0, 4]
	cmp	w2, 1
	bne	.L3254
	b	.L3253
	.p2align 3
.L3319:
	ldr	w0, [x0, 872]
	cbz	w0, .L3250
	ldr	x0, [x20, 632]
	cbz	x0, .L3255
	ldrb	w1, [x19]
.L3254:
	strb	w1, [x0, 4]
	ldr	x0, [x20]
	ldr	w1, [x0, 832]
	cmp	w1, 1
	beq	.L3321
.L3268:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L3269
	ldr	x1, [x19, 8]
	cbz	x1, .L3269
	ldr	w0, [x19, 16]
	cbz	w0, .L3269
	ldr	x0, [x20, 632]
	ldr	w2, [x0, 76]
	cmp	w2, 1
	bls	.L3322
.L3270:
	mov	w1, 1
	strb	w1, [x0, 4]
	ldr	w1, [x19, 24]
	ldr	w0, [x21, 2820]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC826
	ldr	x4, [x0]
	cbz	x4, .L3316
	ldr	w0, [x21, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3316:
	ldr	x0, [x20, 632]
.L3266:
	ldrb	w1, [x19, 1]
	strb	w1, [x0, 5]
	ldr	x0, [x20, 632]
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldrb	w0, [x0, 4]
	ldp	x29, x30, [sp], 48
	cmp	w0, wzr
	csetm	w0, eq
	ret
	.p2align 3
.L3257:
	ldr	x1, .LC828
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 24]
	ldr	w0, [x21, 2820]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC826
	ldr	x4, [x0]
	cbz	x4, .L3318
.L3317:
	ldr	w0, [x21, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3318:
	mov	w0, -1
.L3325:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3269:
	ldr	x0, [x20, 632]
	b	.L3270
	.p2align 3
.L3321:
	ldr	w0, [x0, 872]
	cbnz	w0, .L3316
	b	.L3268
	.p2align 3
.L3322:
	ubfiz	x2, x2, 5, 32
	add	x0, x0, x2
	str	x1, [x0, 8]
	ldr	x1, [x20, 632]
	ldr	w2, [x19, 20]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 16]
	ldr	x1, [x20, 632]
	ldr	w2, [x19, 16]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 20]
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	wzr, [x0, 28]
	ldr	x1, [x20, 632]
	ldr	w2, [x19, 24]
	ldr	w0, [x1, 76]
	add	x0, x1, x0, lsl 5
	str	w2, [x0, 36]
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 76]
	add	w0, w0, 1
	str	w0, [x1, 76]
	ldr	x0, [x20]
	ldrb	w0, [x0, 900]
	cmp	w0, 1
	beq	.L3271
	add	x0, x20, 61440
	ldr	w2, [x19, 20]
	ldr	w1, [x0, 3432]
	ldr	w3, [x0, 3436]
	add	w2, w1, w2
	str	w2, [x0, 3432]
	ldr	w1, [x19, 20]
	add	w1, w3, w1
	str	w1, [x0, 3436]
.L3271:
	ldr	x0, [x20, 632]
	ldr	w1, [x0, 16]
	cmp	w1, 4095
	bls	.L3323
.L3272:
	mov	w1, 1
	str	w1, [x21, 2852]
	b	.L3266
	.p2align 3
.L3323:
	mov	x0, x20
	bl	CombinePacket.part.11
	ldr	x0, [x20, 632]
	b	.L3272
.L3275:
	ldr	x1, .LC825
	mov	w0, 0
	add	x22, x20, 12288
	add	x19, x20, 640
	add	x22, x22, 2600
	bl	dprint_vfmw
	b	.L3262
	.p2align 3
.L3261:
	add	x19, x19, 104
	cmp	x19, x22
	beq	.L3324
.L3262:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L3261
	ldr	w0, [x21, 2820]
	mov	x1, x19
	bl	ReleaseNAL
	b	.L3261
.L3324:
	mov	x0, x20
	mov	w19, -1
	bl	ClearAllSlice
	add	x1, x20, 20480
	mov	w0, 7
	ldr	w4, [x20, 14948]
	mov	w2, 2
	mov	w3, 23352
	str	w0, [x1, 3244]
	add	x0, x1, 3072
	strb	w2, [x1, 3233]
	movk	w3, 0x1, lsl 16
	str	w4, [x1, 3240]
	mov	w2, 32
	strb	wzr, [x1, 3232]
	strb	w2, [x1, 3234]
	mov	w2, 262144
	str	w3, [x1, 3248]
	stp	w19, wzr, [x0, 188]
	stp	wzr, w2, [x0, 196]
	mov	w0, 3
	str	w0, [x1, 3256]
	mov	x0, x20
	bl	ClearDPB
	ldr	x0, .LC826
	ldr	x4, [x0]
	cbnz	x4, .L3317
	mov	w0, -1
	b	.L3325
.L3277:
	mov	w2, 0
	mov	x0, 0
	b	.L3258
	.size	ReceivePacket, .-ReceivePacket
	.align	3
.LC821:
	.xword	.LC820
	.align	3
.LC823:
	.xword	.LC822
	.align	3
.LC825:
	.xword	.LC824
	.align	3
.LC826:
	.xword	g_event_report
	.align	3
.LC828:
	.xword	.LC827
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearAll
	.type	ClearAll, %function
ClearAll:
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
	add	x1, x20, 20480
	mov	x23, x1
	add	x19, x20, 640
	stp	x1, x20, [x29, 96]
	bl	_mcount
	add	x21, x20, 65536
	ldr	x1, .LC830
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	ClearAllSlice
	mov	x1, x20
	mov	w2, 23352
	movk	w2, 0x1, lsl 16
	mov	w0, 7
	add	x20, x20, 12288
	ldr	w3, [x1, 14948]
	mov	w1, 2
	str	w3, [x23, 3240]
	add	x20, x20, 2600
	strb	w1, [x23, 3233]
	mov	w3, 32
	mov	w1, -1
	str	w0, [x23, 3244]
	str	w2, [x23, 3248]
	mov	w0, 262144
	mov	w2, 3
	strb	wzr, [x23, 3232]
	str	w1, [x23, 3260]
	str	wzr, [x23, 3264]
	str	wzr, [x23, 3268]
	strb	w3, [x23, 3234]
	str	w2, [x23, 3256]
	str	w0, [x23, 3272]
	b	.L3328
	.p2align 3
.L3327:
	add	x19, x19, 104
	cmp	x19, x20
	beq	.L3356
.L3328:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L3327
	ldr	w0, [x21, 2820]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x19, x20
	bne	.L3328
.L3356:
	ldr	x19, [x29, 104]
	mov	x0, x19
	bl	InitDPB
	cbz	w22, .L3329
	ldr	w0, [x21, 2820]
	add	x1, x19, 8
	bl	FSP_ClearNotInVoQueue
.L3330:
	ldr	x0, [x29, 104]
	mov	w25, 0
	mov	w28, -1
	mov	w22, 1
	add	x19, x0, 28672
	mov	w27, 17
	mov	w26, 16
	mov	w23, 2
	add	x19, x19, 560
	.p2align 2
.L3333:
	add	x0, x19, 512
	strb	wzr, [x19]
	strb	wzr, [x19, 1]
	add	x20, x19, 608
	strb	wzr, [x19, 2]
	add	x24, x19, 640
	strb	wzr, [x19, 4]
	strb	wzr, [x19, 720]
	strb	w22, [x19, 768]
	strb	w23, [x19, 816]
	str	w25, [x19, 188]
	stp	wzr, w28, [x0, 164]
	stp	wzr, wzr, [x0, 172]
	str	w22, [x19, 692]
	str	w27, [x19, 708]
	str	w26, [x19, 712]
	str	x19, [x19, 760]
	str	x19, [x19, 808]
	str	x19, [x19, 856]
.L3332:
	ldr	x1, [x20]
	cbnz	x1, .L3357
.L3331:
	add	x20, x20, 8
	cmp	x20, x24
	bne	.L3332
	add	w25, w25, 1
	add	x19, x19, 872
	cmp	w25, 40
	bne	.L3333
	ldr	x0, [x29, 104]
	add	x22, x0, 61440
	add	x19, x22, 3288
	add	x20, x22, 3320
.L3335:
	ldr	x1, [x19]
	cbnz	x1, .L3358
.L3334:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L3335
	ldr	w0, [x21, 1360]
	mov	w20, 0
	cbz	w0, .L3339
	.p2align 2
.L3346:
	ldr	x0, [x29, 104]
	add	x19, x0, x20, uxtw 3
	add	w20, w20, 1
	add	x19, x19, 65536
	ldr	x0, [x19, 1368]
	mov	x1, x0
	cbz	x0, .L3337
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19, 1368]
.L3337:
	ldr	w0, [x21, 1360]
	cmp	w0, w20
	bhi	.L3346
.L3339:
	ldp	x19, x1, [x29, 96]
	str	wzr, [x21, 1340]
	mov	x2, 1648
	add	x0, x1, 24576
	str	wzr, [x21, 1348]
	str	wzr, [x21, 1352]
	str	wzr, [x21, 1360]
	str	wzr, [x21, 2744]
	str	wzr, [x21, 2752]
	str	wzr, [x21, 2796]
	str	wzr, [x21, 2804]
	str	wzr, [x21, 2824]
	str	xzr, [x1, 632]
	ldr	x1, .LC831
	strb	wzr, [x0, 1184]
	str	wzr, [x0, 3188]
	strb	wzr, [x19, 3276]
	ldr	x3, [x1, 96]
	mov	w1, 0
	strb	wzr, [x0, 1185]
	add	x0, x19, 1584
	strb	wzr, [x19, 3277]
	blr	x3
	mov	w1, 2
	mov	w0, 1
	strb	w1, [x19, 1584]
	strb	w0, [x19, 1589]
	mov	w0, 256
	strb	wzr, [x22, 2672]
	stp	wzr, w0, [x21, 116]
	strb	wzr, [x21, 112]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3357:
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x20]
	b	.L3331
.L3358:
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L3334
.L3329:
	ldr	x0, [x29, 104]
	add	x0, x0, 8
	bl	ResetVoQueue
	ldr	w0, [x21, 2820]
	bl	FSP_EmptyInstance
	b	.L3330
	.size	ClearAll, .-ClearAll
	.align	3
.LC830:
	.xword	.LC829
	.align	3
.LC831:
	.xword	vfmw_Osal_Func_Ptr_S
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InsertFrmInDPB
	.type	InsertFrmInDPB, %function
InsertFrmInDPB:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x23, x0
	mov	x0, x30
	mov	w20, w1
	mov	x19, x2
	bl	_mcount
	cmp	w20, 15
	bhi	.L3454
	ldrb	w21, [x19, 3]
	cmp	w21, 1
	beq	.L3363
	cbz	w21, .L3364
	cmp	w21, 2
	bne	.L3455
	ldr	x0, [x19, 680]
	mov	w1, 3
	uxtw	x22, w20
	strb	w1, [x0, 720]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3382
	add	x20, x23, x22, lsl 3
	ldr	x0, [x20, 27904]
	cbz	x0, .L3382
	strb	w21, [x0, 816]
	ldr	x0, [x20, 27904]
	ldr	x1, [x19, 680]
	str	x1, [x0, 856]
	ldr	x0, [x20, 27904]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 817]
	ldr	x0, [x20, 27904]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 818]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 720]
	str	w1, [x0, 828]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 724]
	str	w1, [x0, 836]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 27904]
	ldr	w1, [x1, 848]
	str	w1, [x0, 848]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 732]
	str	w1, [x0, 832]
	ldr	x0, [x20, 27904]
	ldr	w2, [x0, 784]
	ldr	w1, [x0, 832]
	add	w1, w2, w1
	str	w1, [x0, 704]
	str	w1, [x0, 736]
	ldr	x1, [x20, 27904]
	ldrb	w0, [x1]
	cbz	w0, .L3388
	ldrb	w0, [x19, 2]
.L3388:
	strb	w0, [x1]
	ldr	x1, [x20, 27904]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 2
	strb	w0, [x1, 1]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 27904]
	cmp	w0, 1
	beq	.L3456
	ldrb	w0, [x1, 3]
.L3390:
	strb	w0, [x1, 3]
	mov	x2, 664
	add	x1, x19, 16
	ldr	x3, [x20, 27904]
	add	x0, x3, 8
	ldr	x4, [x3, 648]
	str	x4, [x29, 104]
	ldp	w26, w25, [x3, 16]
	ldp	w24, w21, [x3, 24]
	ldr	x28, [x3, 656]
	ldr	x27, [x3, 664]
	bl	memcpy
	ldr	x0, [x19, 656]
	ldr	x4, [x29, 104]
	cmn	x0, #1
	ccmn	x4, #1, 4, eq
	beq	.L3391
	ldr	x0, [x20, 27904]
	str	x4, [x0, 648]
.L3391:
	ldr	x0, [x19, 664]
	ldr	x1, [x20, 27904]
	cmp	x0, x28
	csel	x0, x0, x28, ls
	str	x0, [x1, 656]
	ldr	x0, [x19, 672]
	ldr	x1, [x20, 27904]
	cmp	x0, x27
	csel	x0, x0, x27, ls
	str	x0, [x1, 664]
	ldr	w0, [x19, 24]
	ldr	x1, [x20, 27904]
	cmp	w0, w26
	csel	w0, w0, w26, ls
	str	w0, [x1, 16]
	ldr	w0, [x19, 28]
	ldr	x1, [x20, 27904]
	cmp	w0, w25
	csel	w0, w0, w25, ls
	str	w0, [x1, 20]
	ldr	w0, [x19, 32]
	ldr	x1, [x20, 27904]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 24]
	ldr	w0, [x19, 36]
	ldr	x1, [x20, 27904]
	cmp	w0, w21
	csel	w0, w0, w21, ls
	str	w0, [x1, 28]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3392
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3392
.L3393:
	ldr	x1, [x20, 27904]
	ldr	w0, [x1, 788]
	ldr	w2, [x1, 836]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 700]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 708]
	str	w1, [x0, 688]
	ldr	x0, [x20, 27904]
	bl	CombineFldsToFrm
	ldr	x1, [x20, 27904]
	ldr	w0, [x1, 712]
	ldr	w1, [x1, 828]
	add	x0, x0, 4096
	add	x0, x23, x0, lsl 2
	str	w1, [x0, 12120]
	b	.L3381
	.p2align 3
.L3364:
	uxtw	x22, w20
	ldr	x1, [x19, 680]
	mov	w2, 3
	mov	w0, 3
	add	x20, x23, x22, lsl 3
	str	x1, [x20, 27904]
	ldrb	w3, [x19, 2]
	strb	w3, [x1]
	ldr	x1, [x20, 27904]
	strb	w2, [x1, 1]
	ldr	x2, [x19, 680]
	ldr	x1, [x20, 27904]
	ldrb	w2, [x2, 4]
	strb	w2, [x1, 4]
	ldr	x2, [x19, 680]
	ldr	x1, [x20, 27904]
	ldr	w2, [x2, 692]
	str	w2, [x1, 692]
	ldrb	w2, [x19, 4]
	ldr	x1, [x20, 27904]
	cbz	w2, .L3457
.L3366:
	strb	w0, [x1, 2]
	mov	x2, 664
	add	x1, x19, 16
	mov	w21, 3
	ldr	x0, [x20, 27904]
	ldr	w3, [x19, 756]
	str	w3, [x0, 708]
	ldr	x0, [x20, 27904]
	add	x0, x0, 8
	bl	memcpy
	ldr	x0, [x20, 27904]
	mov	w3, 2
	ldr	w1, [x19, 732]
	mov	w6, 1
	str	w1, [x0, 704]
	str	w1, [x0, 736]
	ldr	x0, [x20, 27904]
	ldr	x1, [x19, 680]
	str	x1, [x0, 760]
	str	x1, [x0, 808]
	str	x1, [x0, 856]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 700]
	str	w1, [x0, 684]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 696]
	str	w1, [x0, 676]
	ldr	x0, [x20, 27904]
	strb	wzr, [x0, 720]
	ldr	x0, [x20, 27904]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 721]
	ldr	x0, [x20, 27904]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 722]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 724]
	str	w1, [x0, 700]
	str	w1, [x0, 740]
	ldr	x0, [x20, 27904]
	ldrb	w1, [x19, 9]
	str	w1, [x0, 696]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 708]
	str	w1, [x0, 688]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 712]
	str	w1, [x0, 732]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 716]
	str	w1, [x0, 780]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 720]
	str	w1, [x0, 828]
	ldrb	w1, [x19, 7]
	ldr	x0, [x20, 27904]
	cmp	w1, 1
	csel	w21, wzr, w21, ne
	strb	w21, [x0, 3]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 27904]
	ldr	w1, [x1, 752]
	str	w1, [x0, 752]
	ldr	x0, [x20, 27904]
	ldr	w2, [x0, 736]
	ldr	x1, [x0, 760]
	ldrb	w5, [x0, 721]
	ldrb	w4, [x0, 722]
	strb	w3, [x0, 816]
	ldr	w3, [x0, 740]
	str	w2, [x0, 784]
	str	x1, [x0, 808]
	str	w2, [x0, 832]
	mov	w2, 0
	strb	w5, [x0, 769]
	strb	w4, [x0, 770]
	strb	w6, [x0, 768]
	strb	w5, [x0, 817]
	strb	w4, [x0, 818]
	str	w3, [x0, 788]
	str	w3, [x0, 836]
	str	x1, [x0, 856]
	mov	x0, x23
	ldr	x1, [x19, 680]
	bl	GetAPC
	cbnz	w0, .L3458
.L3381:
	add	x3, x22, 3488
	add	x0, x23, 65536
	mov	w2, 1
	ldr	x1, [x23, x3, lsl 3]
	ldr	w0, [x0, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetRef
	mov	w0, 0
.L3361:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3455:
	ldr	x1, .LC837
	mov	w2, w21
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x23
	bl	ClearAll
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3363:
	ldr	x0, [x19, 680]
	mov	w1, 3
	uxtw	x22, w20
	strb	w1, [x0, 720]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3369
	add	x20, x23, x22, lsl 3
	ldr	x0, [x20, 27904]
	cbz	x0, .L3369
	strb	w21, [x0, 768]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 724]
	str	w1, [x0, 788]
	ldr	x0, [x20, 27904]
	ldrb	w1, [x19, 4]
	strb	w1, [x0, 769]
	ldr	x0, [x20, 27904]
	ldrb	w1, [x19, 5]
	strb	w1, [x0, 770]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 716]
	str	w1, [x0, 780]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 27904]
	ldr	w1, [x1, 800]
	str	w1, [x0, 800]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 732]
	str	w1, [x0, 784]
	ldr	x0, [x20, 27904]
	ldr	w2, [x0, 784]
	ldr	w1, [x0, 832]
	add	w1, w2, w1
	str	w1, [x0, 704]
	str	w1, [x0, 736]
	ldr	x1, [x20, 27904]
	ldrb	w0, [x1]
	cbz	w0, .L3374
	ldrb	w0, [x19, 2]
.L3374:
	strb	w0, [x1]
	ldr	x1, [x20, 27904]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 1
	strb	w0, [x1, 1]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 27904]
	cmp	w0, 1
	beq	.L3459
	ldrb	w0, [x1, 3]
.L3376:
	strb	w0, [x1, 3]
	mov	x2, 664
	add	x1, x19, 16
	ldr	x3, [x20, 27904]
	add	x0, x3, 8
	ldr	x4, [x3, 648]
	str	x4, [x29, 104]
	ldp	w26, w25, [x3, 16]
	ldp	w24, w21, [x3, 24]
	ldr	x28, [x3, 656]
	ldr	x27, [x3, 664]
	bl	memcpy
	ldr	x0, [x19, 656]
	ldr	x4, [x29, 104]
	cmn	x0, #1
	ccmn	x4, #1, 4, eq
	beq	.L3377
	ldr	x0, [x20, 27904]
	str	x4, [x0, 648]
.L3377:
	ldr	x0, [x19, 664]
	ldr	x1, [x20, 27904]
	cmp	x0, x28
	csel	x0, x0, x28, ls
	str	x0, [x1, 656]
	ldr	x0, [x19, 672]
	ldr	x1, [x20, 27904]
	cmp	x0, x27
	csel	x0, x0, x27, ls
	str	x0, [x1, 664]
	ldr	w0, [x19, 24]
	ldr	x1, [x20, 27904]
	cmp	w0, w26
	csel	w0, w0, w26, ls
	str	w0, [x1, 16]
	ldr	w0, [x19, 28]
	ldr	x1, [x20, 27904]
	cmp	w0, w25
	csel	w0, w0, w25, ls
	str	w0, [x1, 20]
	ldr	w0, [x19, 32]
	ldr	x1, [x20, 27904]
	cmp	w0, w24
	csel	w0, w0, w24, ls
	str	w0, [x1, 24]
	ldr	w0, [x19, 36]
	ldr	x1, [x20, 27904]
	cmp	w0, w21
	csel	w0, w0, w21, ls
	str	w0, [x1, 28]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3378
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3378
.L3379:
	ldr	x1, [x20, 27904]
	ldr	w0, [x1, 788]
	ldr	w2, [x1, 836]
	cmp	w0, w2
	csel	w0, w0, w2, cs
	str	w0, [x1, 700]
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 708]
	str	w1, [x0, 688]
	ldr	x0, [x20, 27904]
	bl	CombineFldsToFrm
	ldr	x1, [x20, 27904]
	ldr	w0, [x1, 712]
	ldr	w1, [x1, 780]
	add	x0, x0, 4096
	add	x0, x23, x0, lsl 2
	str	w1, [x0, 12056]
	b	.L3381
	.p2align 3
.L3369:
	add	x20, x23, x22, lsl 3
	ldr	x0, [x19, 680]
	mov	w1, 1
	str	x0, [x20, 27904]
	strb	w1, [x0, 768]
	ldr	x0, [x20, 27904]
	ldr	x2, [x19, 680]
	str	x2, [x0, 808]
	ldr	x0, [x20, 27904]
	ldrb	w2, [x19, 4]
	strb	w2, [x0, 769]
	ldr	x0, [x20, 27904]
	ldrb	w2, [x19, 5]
	strb	w2, [x0, 770]
	ldr	x0, [x20, 27904]
	ldr	w2, [x19, 716]
	str	w2, [x0, 780]
	ldr	x0, [x20, 27904]
	ldr	w2, [x19, 724]
	str	w2, [x0, 788]
	ldr	x2, [x19, 680]
	ldr	x0, [x20, 27904]
	ldr	w2, [x2, 800]
	str	w2, [x0, 800]
	ldr	x0, [x20, 27904]
	ldr	w2, [x19, 732]
	str	w2, [x0, 784]
	ldr	x0, [x20, 27904]
	ldr	w2, [x0, 784]
	str	w2, [x0, 704]
	str	w2, [x0, 736]
	ldr	x0, [x20, 27904]
	ldrb	w2, [x19, 2]
	strb	w2, [x0]
	ldr	x0, [x20, 27904]
	strb	w1, [x0, 1]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 27904]
	ldrb	w1, [x1, 4]
	strb	w1, [x0, 4]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 27904]
	ldr	w1, [x1, 692]
	str	w1, [x0, 692]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3371
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3371
.L3372:
	ldr	x0, [x20, 27904]
	mov	x2, 664
	add	x1, x19, 16
	str	wzr, [x0, 696]
	ldr	x0, [x20, 27904]
	add	x0, x0, 8
	bl	memcpy
	ldr	x1, [x20, 27904]
	mov	w2, 1
	ldr	w3, [x19, 756]
	mov	x0, x23
	str	w3, [x1, 708]
	ldr	x1, [x20, 27904]
	ldr	w3, [x19, 696]
	str	w3, [x1, 676]
	ldr	x1, [x20, 27904]
	ldr	w3, [x19, 708]
	str	w3, [x1, 688]
	ldr	x1, [x20, 27904]
	ldr	w3, [x19, 724]
	str	w3, [x1, 700]
	ldrb	w3, [x19, 7]
	ldr	x1, [x20, 27904]
	cmp	w3, w2
	cset	w3, eq
	strb	w3, [x1, 3]
	ldr	x1, [x19, 680]
	bl	GetAPC
	cbz	w0, .L3381
	ldr	x1, .LC835
	mov	w3, w0
	mov	w2, 2428
	b	.L3452
	.p2align 3
.L3382:
	add	x20, x23, x22, lsl 3
	ldr	x0, [x19, 680]
	mov	w1, 2
	str	x0, [x20, 27904]
	strb	w1, [x0, 816]
	ldr	x0, [x20, 27904]
	ldr	x2, [x19, 680]
	str	x2, [x0, 856]
	ldr	x0, [x20, 27904]
	ldrb	w2, [x19, 4]
	strb	w2, [x0, 817]
	ldr	x0, [x20, 27904]
	ldrb	w2, [x19, 5]
	strb	w2, [x0, 818]
	ldr	x0, [x20, 27904]
	ldr	w2, [x19, 720]
	str	w2, [x0, 828]
	ldr	x0, [x20, 27904]
	ldr	w2, [x19, 724]
	str	w2, [x0, 836]
	ldr	x2, [x19, 680]
	ldr	x0, [x20, 27904]
	ldr	w2, [x2, 848]
	str	w2, [x0, 848]
	ldr	x0, [x20, 27904]
	ldr	w2, [x19, 732]
	str	w2, [x0, 832]
	ldr	x0, [x20, 27904]
	ldr	w2, [x0, 784]
	str	w2, [x0, 704]
	str	w2, [x0, 736]
	ldr	x0, [x20, 27904]
	ldrb	w2, [x19, 2]
	strb	w2, [x0]
	ldr	x0, [x20, 27904]
	strb	w1, [x0, 1]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 27904]
	ldrb	w1, [x1, 4]
	strb	w1, [x0, 4]
	ldr	x1, [x19, 680]
	ldr	x0, [x20, 27904]
	ldr	w1, [x1, 692]
	str	w1, [x0, 692]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	beq	.L3384
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3384
.L3385:
	ldr	x0, [x20, 27904]
	mov	x2, 664
	add	x1, x19, 16
	str	wzr, [x0, 696]
	ldr	x0, [x20, 27904]
	add	x0, x0, 8
	bl	memcpy
	ldr	x1, [x20, 27904]
	mov	w2, 2
	ldr	w3, [x19, 756]
	mov	x0, x23
	str	w3, [x1, 708]
	ldr	x1, [x20, 27904]
	ldr	w3, [x19, 696]
	str	w3, [x1, 676]
	ldr	x1, [x20, 27904]
	ldr	w3, [x19, 708]
	str	w3, [x1, 688]
	ldr	x1, [x20, 27904]
	ldr	w3, [x19, 724]
	str	w3, [x1, 700]
	str	w3, [x1, 836]
	ldrb	w3, [x19, 7]
	ldr	x1, [x20, 27904]
	cmp	w3, 1
	csel	w21, w21, wzr, eq
	strb	w21, [x1, 3]
	ldr	x1, [x19, 680]
	bl	GetAPC
	cbz	w0, .L3381
	ldr	x1, .LC835
	mov	w3, w0
	mov	w2, 2575
.L3452:
	mov	w0, 0
	bl	dprint_vfmw
	mov	x0, x23
	bl	ClearDPB
	mov	w0, -1
	b	.L3361
	.p2align 3
.L3457:
	ldrb	w0, [x19, 5]
	mov	w2, 3
	cmp	w0, wzr
	csel	w0, w0, w2, eq
	b	.L3366
	.p2align 3
.L3384:
	ldr	x0, [x20, 27904]
	mov	w1, 2
	strb	w1, [x0, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3385
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 700]
	str	w1, [x0, 684]
	b	.L3385
	.p2align 3
.L3371:
	ldr	x0, [x20, 27904]
	mov	w1, 1
	strb	w1, [x0, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3372
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 700]
	str	w1, [x0, 684]
	b	.L3372
	.p2align 3
.L3392:
	ldr	x1, [x20, 27904]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 2
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3393
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 700]
	str	w1, [x0, 684]
	b	.L3393
	.p2align 3
.L3378:
	ldr	x1, [x20, 27904]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 1
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3379
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 700]
	str	w1, [x0, 684]
	b	.L3379
	.p2align 3
.L3456:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L3390
	.p2align 3
.L3459:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L3376
	.p2align 3
.L3454:
	ldr	x1, .LC833
	mov	w3, w20
	mov	w2, 2333
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3361
.L3458:
	ldr	x1, .LC835
	mov	w3, w0
	mov	w2, 2373
	b	.L3452
	.size	InsertFrmInDPB, .-InsertFrmInDPB
	.align	3
.LC833:
	.xword	.LC832
	.align	3
.LC835:
	.xword	.LC834
	.align	3
.LC837:
	.xword	.LC836
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	StorePicInDPB
	.type	StorePicInDPB, %function
StorePicInDPB:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x24, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x24]
	ldr	w0, [x0, 596]
	cmp	w0, 1
	beq	.L3650
	add	x22, x24, 61440
	str	wzr, [x22, 2784]
	str	wzr, [x22, 2788]
.L3463:
	add	x19, x24, 20480
	str	wzr, [x19, 728]
	ldrb	w1, [x22, 2675]
	cmp	w1, 2
	cset	w0, eq
	str	w0, [x19, 732]
	ldrb	w0, [x22, 2672]
	cbz	w0, .L3651
	add	x21, x24, 65536
	ldr	x0, .LC843
	ldrsw	x2, [x21, 2820]
	ldr	w3, [x21, 2832]
	str	w3, [x21, 2828]
	ldr	x0, [x0, x2, lsl 3]
	ldrsb	w2, [x0, 44]
	cmp	w2, 1
	beq	.L3652
.L3466:
	ldr	w0, [x21, 2748]
	cmp	w0, 2
	beq	.L3653
	ldr	x20, [x24]
	ldr	w0, [x20, 12]
	cmp	w0, wzr
	ble	.L3654
	ldrb	w2, [x22, 2674]
	cbnz	w2, .L3474
.L3659:
	sub	w2, w1, #1
	ldr	x25, [x22, 3352]
	uxtb	w2, w2
	cbnz	w1, .L3655
.L3475:
	cmp	w2, 1
	bls	.L3656
.L3632:
	cbz	w1, .L3480
	ldrb	w2, [x25, 1]
	cbnz	w2, .L3480
	.p2align 2
.L3474:
	cmp	w0, 2
	beq	.L3657
.L3502:
	ldr	w6, [x22, 3376]
	cbz	w6, .L3511
	ldr	w3, [x21, 2812]
	ldr	w2, [x22, 3404]
	cmp	w3, w2
	bcs	.L3512
	ldrb	w0, [x22, 2674]
	cbz	w0, .L3658
.L3512:
	mov	x0, x24
	bl	Marking
	cbz	w0, .L3514
	ldr	x1, .LC856
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, .LC842
	mov	w3, 4009
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC852
	b	.L3556
.L3651:
	ldr	x1, .LC840
	add	x21, x24, 65536
	bl	dprint_vfmw
	ldr	x1, .LC842
	mov	w3, 3704
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC852
.L3556:
	ldr	x1, [x22, 3352]
	mov	w2, 1
	ldr	w0, [x21, 2820]
	mov	w19, -1
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
	mov	w3, w19
	mov	w2, 4228
	mov	x1, x20
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 4]
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 1]
.L3554:
	strb	wzr, [x22, 2672]
	mov	w0, w19
.L3639:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L3650:
	ldr	x1, .LC838
	add	x22, x24, 61440
	ldr	x1, [x1]
	ldr	w2, [x1, 4180]
	ldr	w1, [x1, 4184]
	str	w0, [x22, 2784]
	cmp	w1, wzr
	csinc	w1, w1, wzr, ne
	udiv	w1, w2, w1
	str	w1, [x22, 2788]
	b	.L3463
.L3652:
	ldr	x2, [x0, 176]
	mov	x0, 4294967296
	cmp	x2, x0
	bne	.L3466
	add	x23, x24, 24576
	ldr	x6, [x24, 27848]
	ldr	x7, [x24, 27880]
	ldr	x8, [x24, 27888]
	ldr	w5, [x23, 3296]
	ldr	w4, [x23, 3300]
	cbz	w5, .L3559
	mov	w2, w5
	mov	w3, w4
	b	.L3468
	.p2align 3
.L3560:
	mov	w2, w0
.L3468:
	udiv	w0, w3, w2
	msub	w0, w0, w2, w3
	mov	w3, w2
	cbnz	w0, .L3560
.L3467:
	udiv	w0, w5, w2
	sub	x6, x6, x8
	lsl	w3, w6, 6
	sub	w3, w3, w6
	lsl	w3, w3, 1
	sub	w3, w3, w6
	lsl	w3, w3, 3
	udiv	w2, w4, w2
	mul	w0, w3, w0
	udiv	w0, w0, w2
	add	x0, x0, x7
	str	x0, [x22, 3328]
	b	.L3466
.L3654:
	ldr	w2, [x21, 2824]
	cmp	w2, 2
	beq	.L3474
	ldrb	w2, [x22, 2674]
	cbnz	w2, .L3474
	b	.L3659
.L3657:
	ldr	w0, [x22, 3376]
	cbz	w0, .L3504
	ldrb	w0, [x22, 2678]
	cmp	w0, 5
	beq	.L3505
.L3509:
	mov	x0, x24
	add	x19, x24, 24576
	bl	SimpleSlideDPB
	ldr	w1, [x19, 3716]
	add	x2, x22, 2672
	mov	x0, x24
	bl	InsertFrmInDPB
	cbz	w0, .L3660
	ldr	x20, .LC852
	mov	w3, w0
	mov	w2, 3975
	mov	w0, 0
	mov	x1, x20
	bl	dprint_vfmw
	ldr	x1, .LC842
	mov	w3, 3976
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3556
.L3655:
	ldrb	w3, [x25, 1]
	cmp	w3, wzr
	ccmp	w2, 1, 0, eq
	bls	.L3475
	cmp	w0, 2
	bne	.L3502
	b	.L3657
.L3656:
	ldr	w2, [x21, 2824]
	cbnz	w2, .L3477
	mov	w0, 1
	mov	x2, 768
	str	w0, [x21, 2824]
	add	x1, x22, 2672
	add	x0, x22, 3440
	bl	memcpy
	ldr	w0, [x20, 12]
	b	.L3474
.L3480:
	add	x23, x22, 2672
.L3483:
	cbz	w1, .L3484
	ldrb	w0, [x23, 1]
	cmp	w0, 1
	beq	.L3661
.L3484:
	ldr	w0, [x23, 732]
	str	w0, [x25, 704]
.L3485:
	mov	x1, x25
	mov	x0, x24
	bl	GetImagePara
	ldr	w0, [x21, 2820]
	ldr	w1, [x25, 672]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L3662
	ldrb	w0, [x23, 3]
	cbz	w0, .L3487
	ldrb	w0, [x23, 1]
	cmp	w0, 1
	beq	.L3663
.L3487:
	ldr	x0, [x23, 656]
.L3641:
	str	x0, [x20, 640]
.L3488:
	ldr	x0, [x23, 664]
	str	x0, [x20, 648]
	ldr	x0, [x23, 672]
	str	x0, [x20, 656]
	ldr	w0, [x23, 24]
	str	w0, [x20, 8]
	ldr	w0, [x23, 28]
	str	w0, [x20, 12]
	ldr	w0, [x23, 32]
	str	w0, [x20, 16]
	ldr	w0, [x23, 36]
	str	w0, [x20, 20]
	ldr	w1, [x25, 704]
	str	w1, [x20, 184]
	ldr	w0, [x23, 272]
	str	w0, [x20, 256]
	ldr	w0, [x23, 268]
	str	w0, [x20, 252]
	ldr	x0, [x23, 280]
	str	x0, [x20, 264]
	cbz	w1, .L3494
	ldrb	w0, [x20, 124]
	and	w0, w0, 3
	cbz	w0, .L3664
.L3492:
	ldr	x0, [x24]
	ldr	w2, [x0, 4]
	cmp	w2, w1
	bcs	.L3494
	ldr	x0, .LC850
	ldr	x4, [x0]
	cbz	x4, .L3501
	ldr	w0, [x21, 2820]
	mov	w3, 8
	stp	w1, w2, [x29, 88]
	add	x2, x29, 88
	mov	w1, 104
	blr	x4
.L3501:
	ldr	w0, [x21, 2820]
	mov	w2, 0
	ldr	w1, [x25, 672]
	bl	FSP_SetDisplay
	ldr	x1, .LC842
	mov	w3, 3932
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC852
	b	.L3556
.L3477:
	cmp	w2, 1
	bne	.L3632
	cmp	w1, 1
	add	x23, x22, 2672
	ldr	x25, [x21, 24]
	beq	.L3665
	cmp	w1, 2
	bne	.L3483
	ldr	w0, [x22, 3392]
	str	w0, [x25, 828]
	ldrb	w1, [x23, 3]
	b	.L3483
	.p2align 3
.L3514:
	mov	x0, x24
	bl	UpdateReflist
	mov	x0, x24
	bl	UpdateLTReflist
	mov	x0, x24
	bl	RemoveUnUsedFrameStore
	cbz	w0, .L3504
	ldr	x1, .LC858
	mov	w0, 22
	bl	dprint_vfmw
.L3504:
	ldrb	w0, [x22, 2673]
	cmp	w0, 1
	beq	.L3516
	add	x23, x24, 24576
.L3520:
	ldr	w6, [x22, 3376]
	cbz	w6, .L3666
	ldr	w4, [x23, 3720]
	ldr	w5, [x23, 3724]
	ldr	w3, [x23, 3712]
	add	w0, w4, w5
	cmp	w3, w0
	bhi	.L3528
	ldr	x0, [x24]
	ldr	w0, [x0, 12]
	cmp	w0, 3
	beq	.L3529
	ldr	x0, .LC859
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L3529
	ldr	x1, .LC861
	mov	w2, 4088
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x24
	bl	ClearDPB
	ldr	x1, .LC842
	mov	w3, 4114
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC852
	b	.L3556
.L3511:
	ldrb	w0, [x22, 2673]
	cmp	w0, 1
	beq	.L3516
	add	x23, x24, 24576
	ldr	w3, [x23, 3712]
.L3528:
	mov	w7, -1
	mov	w8, w7
	.p2align 2
.L3545:
	ldr	w1, [x23, 3716]
	cmp	w1, w3
	bcc	.L3667
	cmp	w1, w3
	mov	w19, w1
	bls	.L3535
	mov	w19, w3
	str	w3, [x23, 3716]
.L3535:
	cbz	w19, .L3566
	add	x1, x23, 3328
	mov	w5, 2147483647
	mov	w20, 0
	mov	w0, 0
	.p2align 2
.L3538:
	ldr	x4, [x1]
	add	x1, x1, 8
	ldr	w2, [x4, 688]
	cmp	w2, w5
	bge	.L3537
	ldrb	w4, [x4, 4]
	cmp	w4, wzr
	csel	w20, w20, w0, eq
	csel	w5, w5, w2, eq
.L3537:
	add	w0, w0, 1
	cmp	w0, w19
	bne	.L3538
.L3536:
	cbnz	w6, .L3539
	ldr	w0, [x22, 3380]
	cmp	w0, w5
	blt	.L3668
.L3539:
	cmp	w8, w20
	ccmp	w7, w19, 0, eq
	beq	.L3669
	mov	w1, w20
	mov	x0, x24
	bl	OutputFrmFromDPB
	cmn	w0, #1
	mov	w25, w0
	beq	.L3544
	mov	w7, w19
	mov	w8, w20
	ldr	w6, [x22, 3376]
	ldr	w3, [x23, 3712]
	b	.L3545
.L3566:
	mov	w5, 2147483647
	mov	w20, 0
	b	.L3536
.L3664:
	ldr	x1, .LC849
	mov	w2, 3899
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC850
	ldr	x4, [x0]
	cbz	x4, .L3493
	ldr	w0, [x21, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 111
	blr	x4
.L3493:
	ldr	w1, [x20, 184]
	cbnz	w1, .L3492
.L3494:
	ldr	w0, [x21, 2820]
	mov	w2, 1
	ldr	w1, [x25, 672]
	bl	FSP_SetDisplay
	ldr	w0, [x21, 2820]
	mov	x4, x20
	add	x3, x24, 8
	mov	x2, x24
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L3670
	ldr	w0, [x21, 2820]
	mov	w2, 0
	ldr	w1, [x25, 672]
	bl	FSP_SetDisplay
.L3496:
	ldr	x0, [x24]
	ldr	w0, [x0, 604]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L3671
	str	wzr, [x20, 24]
.L3498:
	ldr	w0, [x21, 2840]
	ldr	w1, [x21, 2824]
	add	w0, w0, 2
	str	w0, [x21, 2840]
	cmp	w1, 2
	beq	.L3500
	mov	w0, 1
	str	w0, [x25, 864]
.L3500:
	mov	w0, 2
	str	w0, [x21, 2824]
	ldr	x0, [x24]
	ldr	w0, [x0, 12]
	b	.L3474
.L3653:
	ldr	x1, .LC845
	bl	dprint_vfmw
	mov	x0, x24
	bl	DirectOutput
	mov	w19, w0
	ldr	w1, [x21, 1336]
	ldr	w0, [x22, 3428]
	cmp	w0, w1
	beq	.L3470
	uxtw	x0, w0
	add	x0, x0, 16384
	add	x0, x0, 316
	str	wzr, [x24, x0, lsl 2]
	str	w1, [x22, 3428]
.L3470:
	cmp	w19, 1
	beq	.L3672
.L3471:
	ldr	x1, .LC842
	mov	w3, 3765
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
.L3472:
	cmn	w19, #1
	bne	.L3554
	ldr	x20, .LC852
	b	.L3556
	.p2align 3
.L3516:
	ldr	x0, [x21, 144]
	ldr	x3, [x22, 3352]
	cmp	x3, x0
	ccmp	x0, xzr, 4, eq
	beq	.L3673
	mov	x0, x24
	bl	DirectOutput
	cmn	w0, #1
	mov	w19, w0
	beq	.L3674
	cmp	w0, 1
	bne	.L3524
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 4]
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 1]
.L3524:
	ldr	x1, .LC842
	mov	w3, 4045
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3472
	.p2align 3
.L3667:
	cbz	w6, .L3547
	ldrb	w0, [x22, 2676]
	cbnz	w0, .L3547
	ldr	w0, [x23, 3720]
	cbz	w0, .L3547
	mov	w0, 0
	b	.L3552
	.p2align 3
.L3549:
	ldr	w1, [x23, 3720]
	cmp	w1, w0
	bls	.L3675
.L3552:
	add	x1, x24, x0, uxtw 3
	ldr	w3, [x22, 3368]
	add	w0, w0, 1
	ldr	x2, [x1, 28032]
	ldr	w4, [x2, 676]
	cmp	w4, w3
	bne	.L3549
	strb	wzr, [x2, 2]
	ldr	x2, [x1, 28032]
	ldrb	w3, [x2, 4]
	cmp	w3, 1
	beq	.L3676
.L3550:
	ldr	w1, [x2, 708]
	ldr	w3, [x21, 1336]
	cmp	w1, w3
	uxtw	x1, w1
	add	x1, x1, 16384
	beq	.L3549
	add	x1, x1, 316
	str	wzr, [x24, x1, lsl 2]
	str	w3, [x2, 708]
	b	.L3549
.L3675:
	ldr	w1, [x23, 3716]
.L3547:
	add	x2, x22, 2672
	mov	x0, x24
	bl	InsertFrmInDPB
	ldr	w1, [x23, 3716]
	str	w1, [x21, 136]
	cbz	w0, .L3553
	ldr	x20, .LC852
	mov	w3, w0
	mov	w2, 4201
	mov	w0, 1
	mov	x1, x20
	bl	dprint_vfmw
	ldr	x1, .LC842
	mov	w3, 4202
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3556
.L3544:
	ldr	x20, .LC852
	mov	w3, w0
	mov	w2, 4164
	mov	w0, 1
	mov	x1, x20
	bl	dprint_vfmw
	ldr	x1, .LC842
	mov	w3, 4165
	mov	w2, w25
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3556
.L3658:
	ldr	x1, .LC854
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC850
	ldr	x4, [x0]
	cbz	x4, .L3513
	ldr	w1, [x21, 2812]
	mov	w3, 8
	ldr	w2, [x22, 3404]
	ldr	w0, [x21, 2820]
	stp	w2, w1, [x29, 88]
	add	x2, x29, 88
	mov	w1, 104
	blr	x4
.L3513:
	mov	x0, x24
	mov	w20, -1
	bl	ClearAllSlice
	ldr	w0, [x24, 14948]
	mov	w1, 2
	str	w0, [x19, 3240]
	add	x0, x19, 3072
	strb	w1, [x19, 3233]
	mov	w1, 32
	strb	wzr, [x19, 3232]
	strb	w1, [x19, 3234]
	mov	w1, 262144
	stp	w20, wzr, [x0, 188]
	stp	wzr, w1, [x0, 196]
	mov	w0, 23352
	movk	w0, 0x1, lsl 16
	str	w0, [x19, 3248]
	mov	w0, 7
	str	w0, [x19, 3244]
	mov	w0, 3
	str	w0, [x19, 3256]
	mov	x0, x24
	bl	ClearDPB
	ldr	x1, .LC842
	mov	w2, w20
	mov	w3, 4000
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC852
	b	.L3556
.L3670:
	ldr	w0, [x21, 2848]
	add	w0, w0, 1
	str	w0, [x21, 2848]
	b	.L3496
.L3660:
	ldr	w1, [x19, 3716]
	mov	x0, x24
	add	w1, w1, 1
	str	w1, [x19, 3716]
	mov	w19, 0
	bl	UpdateReflist
	mov	x0, x24
	bl	UpdateLTReflist
	ldr	x1, .LC842
	mov	w3, 3984
	mov	w2, 0
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3554
.L3529:
	ldr	w6, [x23, 3716]
	cmp	w6, w3
	bls	.L3531
	mov	w6, w3
	str	w3, [x23, 3716]
.L3531:
	cbz	w6, .L3563
	add	x2, x23, 3328
	mov	w1, 0
	mov	w0, 0
	mov	w5, 2147483647
	.p2align 2
.L3534:
	ldr	x4, [x2]
	add	x2, x2, 8
	ldr	w3, [x4, 688]
	cmp	w3, w5
	bge	.L3533
	ldrb	w4, [x4, 4]
	cmp	w4, wzr
	csel	w1, w1, w0, eq
	csel	w5, w5, w3, eq
.L3533:
	add	w0, w0, 1
	cmp	w0, w6
	bne	.L3534
.L3532:
	mov	x0, x24
	bl	RemoveFrameStoreOutDPB
	mov	x0, x24
	bl	UpdateReflist
	mov	x0, x24
	bl	UpdateLTReflist
	ldr	w6, [x22, 3376]
	ldr	w3, [x23, 3712]
	b	.L3528
.L3663:
	ldr	x0, [x23, 656]
	cmn	x0, #1
	bne	.L3488
	ldr	x0, [x21]
	cmn	x0, #1
	bne	.L3641
	b	.L3488
	.p2align 3
.L3553:
	add	w1, w1, 1
	mov	x0, x24
	str	w1, [x23, 3716]
	mov	w19, 0
	bl	UpdateReflist
	mov	x0, x24
	bl	UpdateLTReflist
	b	.L3554
.L3669:
	ldr	x2, .LC862
	mov	w3, w20
	ldr	x1, .LC864
	mov	w0, 1
	add	x2, x2, 280
	bl	dprint_vfmw
	ldr	x1, .LC842
	mov	w3, 4151
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC852
	b	.L3556
.L3668:
	ldr	w0, [x21, 2748]
	cmp	w0, 2
	beq	.L3677
.L3540:
	mov	x0, x24
	bl	DirectOutput
	cmn	w0, #1
	mov	w19, w0
	beq	.L3678
	cmp	w0, 1
	bne	.L3542
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 4]
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 1]
.L3542:
	ldr	x1, .LC842
	mov	w3, 4144
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3472
.L3673:
	add	x23, x24, 24576
	ldr	w4, [x23, 3716]
	cbz	w4, .L3520
	ldr	x0, [x24, 27904]
	cmp	x3, x0
	beq	.L3679
	add	x0, x23, 3336
	mov	w1, 0
	.p2align 2
.L3525:
	add	w1, w1, 1
	cmp	w1, w4
	beq	.L3520
	ldr	x2, [x0], 8
	cmp	x3, x2
	bne	.L3525
.L3521:
	add	x2, x22, 2672
	mov	x0, x24
	bl	InsertFrmInDPB
	cmn	w0, #1
	mov	w19, w0
	beq	.L3680
	mov	x0, x24
	mov	w19, 0
	bl	UpdateReflist
	mov	x0, x24
	bl	UpdateLTReflist
	ldr	x1, .LC842
	mov	w3, 4065
	mov	w2, 0
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3554
.L3666:
	ldr	w3, [x23, 3712]
	b	.L3528
.L3671:
	mov	x1, x20
	mov	x0, x24
	bl	SetFrmRepeatCount.part.1
	b	.L3498
.L3672:
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 4]
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 1]
	b	.L3471
.L3505:
	mov	x0, x24
	bl	IDRMemMarking
	cbz	w0, .L3509
	mov	w0, -1
	b	.L3639
	.p2align 3
.L3661:
	mov	w0, 3
	strb	w0, [x25, 1]
	ldr	w1, [x25, 704]
	ldr	w0, [x23, 732]
	add	w0, w1, w0
	str	w0, [x25, 704]
	b	.L3485
.L3676:
	str	w3, [x2, 692]
	ldr	x2, [x1, 28032]
	strb	wzr, [x2, 4]
	ldr	x2, [x1, 28032]
	b	.L3550
.L3680:
	ldr	x20, .LC852
	mov	w3, w0
	mov	w2, 4058
	mov	w0, 1
	mov	x1, x20
	bl	dprint_vfmw
	ldr	x1, .LC842
	mov	w3, 4059
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3556
.L3677:
	ldrb	w0, [x22, 2675]
	cbz	w0, .L3540
	ldr	x0, [x22, 3352]
	str	x0, [x21, 152]
	b	.L3540
.L3662:
	ldr	x1, .LC847
	mov	w2, 3867
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, .LC842
	mov	w3, 3868
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC852
	b	.L3556
.L3563:
	mov	w1, 0
	b	.L3532
.L3559:
	mov	w2, w4
	b	.L3467
.L3665:
	ldr	w0, [x22, 3388]
	str	w0, [x25, 780]
	ldrb	w1, [x23, 3]
	b	.L3483
.L3678:
	ldr	x1, .LC852
	mov	w3, w0
	mov	w2, 4135
	mov	w0, 1
	bl	dprint_vfmw
	b	.L3542
.L3674:
	ldr	x1, .LC852
	mov	w3, w0
	mov	w2, 4035
	mov	w0, 1
	bl	dprint_vfmw
	b	.L3524
.L3679:
	mov	w1, 0
	b	.L3521
	.size	StorePicInDPB, .-StorePicInDPB
	.align	3
.LC838:
	.xword	g_HwMem
	.align	3
.LC840:
	.xword	.LC839
	.align	3
.LC842:
	.xword	.LC841
	.align	3
.LC843:
	.xword	s_pstVfmwChan
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
.LC850:
	.xword	g_event_report
	.align	3
.LC852:
	.xword	.LC851
	.align	3
.LC854:
	.xword	.LC853
	.align	3
.LC856:
	.xword	.LC855
	.align	3
.LC858:
	.xword	.LC857
	.align	3
.LC859:
	.xword	g_apple_airplay_mirrorinig_flag
	.align	3
.LC861:
	.xword	.LC860
	.align	3
.LC862:
	.xword	.LANCHOR1
	.align	3
.LC864:
	.xword	.LC863
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AllocFrameStore
	.type	AllocFrameStore, %function
AllocFrameStore:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x25, x0
	mov	x0, x30
	add	x21, x25, 20480
	mov	w23, w1
	bl	_mcount
	ldrb	w0, [x21, 1585]
	cbz	w0, .L3682
	ldrb	w1, [x21, 1586]
	cbz	w1, .L3750
	add	x26, x25, 65536
	ldr	w22, [x26, 2748]
	cmp	w22, 2
	beq	.L3708
	add	x24, x25, 61440
	mov	w22, 2
	strb	wzr, [x24, 2673]
	ldrb	w1, [x26, 112]
	cmp	w1, 1
	bne	.L3710
	b	.L3707
	.p2align 3
.L3682:
	add	x26, x25, 65536
	ldr	w0, [x26, 2748]
	cmp	w0, 2
	beq	.L3751
	add	x24, x25, 61440
	mov	w22, 0
	strb	wzr, [x24, 2673]
.L3710:
	strb	wzr, [x24, 2672]
	ldr	w3, [x26, 1332]
	cbz	w3, .L3701
	add	x19, x25, 28672
	mov	x20, 0
	add	x19, x19, 560
	.p2align 2
.L3700:
	ldrb	w0, [x19, 1]
	cbnz	w0, .L3695
	cbz	x19, .L3696
	add	x0, x25, 24576
	ldr	w2, [x0, 3716]
	cbz	w2, .L3696
	ldr	x0, [x25, 27904]
	cmp	x0, x19
	beq	.L3695
	sub	w2, w2, #1
	mov	x0, x25
	add	x2, x25, x2, lsl 3
	b	.L3698
	.p2align 3
.L3699:
	ldr	x1, [x0, 27904]
	cmp	x1, x19
	beq	.L3695
.L3698:
	cmp	x0, x2
	add	x0, x0, 8
	bne	.L3699
.L3696:
	lsl	x1, x20, 3
	mov	w27, 1
	sub	x1, x1, x20
	str	x19, [x24, 3352]
	lsl	x1, x1, 3
	strb	w27, [x24, 2672]
	sub	x1, x1, x20
	mov	w3, 101
	lsl	x1, x1, x27
	mov	x2, 664
	sub	x20, x1, x20
	add	x0, x24, 2688
	add	x20, x25, x20, lsl 3
	add	x20, x20, 28672
	add	x1, x20, 568
	str	wzr, [x20, 1264]
	str	w3, [x24, 3404]
	bl	memcpy
	str	wzr, [x24, 2872]
	strb	wzr, [x20, 563]
	str	wzr, [x19, 692]
	ldr	x0, [x24, 3352]
	strb	wzr, [x0, 2]
	ldr	x0, [x24, 3352]
	strb	w27, [x0, 4]
	ldr	x0, [x24, 3352]
	str	wzr, [x0, 864]
	ldrb	w19, [x24, 2672]
	cmp	w19, 1
	bne	.L3701
	cmp	w23, wzr
	ldr	w0, [x26, 2820]
	cset	w1, eq
	bl	FSP_NewLogicFs
	mov	w20, w0
	mov	w1, w0
	ldr	w0, [x26, 2820]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cmp	w20, wzr
	ccmp	x0, xzr, 4, ge
	beq	.L3702
	add	x1, x0, 8
	ldr	x0, [x25]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L3752
.L3703:
	ldr	x19, .LC867
	mov	x2, 664
	ldr	x0, [x24, 3352]
	ldr	x3, [x19, 104]
	add	x0, x0, 8
	blr	x3
	ldr	x1, [x24, 3352]
	mov	x2, 664
	ldr	x3, [x19, 104]
	add	x0, x24, 2688
	add	x1, x1, 8
	blr	x3
	ldr	x0, [x24, 3352]
	mov	w4, w20
	str	w20, [x0, 672]
	ldrsb	w0, [x23, 4]
	str	w0, [x24, 3428]
	ldr	x3, [x24, 3352]
	ldrb	w0, [x21, 1585]
.L3692:
	cmp	w0, wzr
	uxtb	w1, w22
	mov	w2, 3
	strb	w1, [x24, 2675]
	csel	w0, w0, w2, eq
	strb	w0, [x3, 720]
	ldrb	w0, [x24, 2673]
	cmp	w0, 1
	beq	.L3753
	strb	w1, [x26, 112]
	ldr	w1, [x26, 2832]
	ldr	w0, [x21, 1604]
	str	w0, [x26, 120]
	ldr	w0, [x21, 1616]
	str	w0, [x26, 116]
	stp	w1, w4, [x26, 128]
	cbnz	w22, .L3754
	strb	wzr, [x26, 113]
	mov	w0, 0
.L3742:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3750:
	add	x26, x25, 65536
	ldr	w1, [x26, 2748]
	cmp	w1, 2
	beq	.L3755
	add	x24, x25, 61440
	mov	w22, 1
	strb	wzr, [x24, 2673]
	ldrb	w1, [x26, 112]
	cmp	w1, 2
	bne	.L3710
.L3707:
	ldr	w1, [x21, 1604]
	ldr	w2, [x26, 120]
	cmp	w2, w1
	bne	.L3710
	ldr	w1, [x21, 1616]
	cbnz	w1, .L3686
	ldr	w1, [x26, 116]
	cbnz	w1, .L3710
.L3687:
	ldr	w2, [x26, 2828]
	ldr	w1, [x26, 2832]
	sub	w1, w1, w2
	cmp	w1, 2
	bhi	.L3710
	ldr	x3, [x24, 3352]
	mov	w1, 1
	strb	w1, [x24, 2673]
	cbz	x3, .L3689
	cmp	w22, 2
	beq	.L3756
	cmp	w22, 1
	mov	w4, 0
	bne	.L3692
	ldrb	w1, [x3, 1]
	cmp	w1, 2
	beq	.L3692
.L3689:
	strb	wzr, [x24, 2673]
	b	.L3710
	.p2align 3
.L3751:
	mov	w22, 0
.L3708:
	add	x24, x25, 61440
	strb	wzr, [x24, 2673]
	b	.L3710
	.p2align 3
.L3695:
	add	w20, w20, 1
	add	x19, x19, 872
	cmp	w20, w3
	bne	.L3700
.L3701:
	ldr	x1, .LC866
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x25
	bl	ClearAll
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	mov	w0, -1
	ldp	x29, x30, [sp], 112
	ret
.L3754:
	mov	w1, 1
	strb	w1, [x26, 113]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3755:
	mov	w22, 1
	b	.L3708
.L3753:
	strb	wzr, [x26, 112]
	mov	w0, 0
	ldr	w2, [x26, 2832]
	ldr	w1, [x21, 1604]
	str	w1, [x26, 120]
	ldr	w1, [x21, 1616]
	str	w1, [x26, 116]
	strb	wzr, [x26, 113]
	stp	w2, w4, [x26, 128]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3752:
	ldr	w0, [x25, 14932]
	ldr	w2, [x25, 14936]
	lsl	w0, w0, 4
	ldr	w19, [x1, 164]
	lsl	w2, w2, 4
	stp	w0, w2, [x1, 128]
	add	x0, x1, 256
	mul	w19, w2, w19
	stp	wzr, wzr, [x0, 104]
	stp	wzr, wzr, [x0, 112]
	str	wzr, [x1, 376]
	ldr	w0, [x1, 44]
	str	x1, [x29, 104]
	add	w0, w19, w0
	str	w0, [x1, 48]
	bl	MEM_Phy2Vir
	ldr	x1, [x29, 104]
	ldr	w2, [x1, 28]
	ldr	w3, [x1, 164]
	str	x0, [x1, 552]
	add	w0, w19, w2
	ldr	w2, [x1, 60]
	str	w0, [x1, 32]
	add	w0, w3, w0
	str	w0, [x1, 40]
	add	w0, w19, w2
	str	w0, [x1, 64]
	bl	MEM_Phy2Vir
	ldr	x1, [x29, 104]
	str	x0, [x1, 568]
	b	.L3703
.L3686:
	ldr	w1, [x26, 116]
	cbz	w1, .L3710
	b	.L3687
.L3702:
	ldr	x2, [x24, 3352]
	mov	w0, 0
	strb	wzr, [x24, 2672]
	ldr	x1, .LC869
	strb	wzr, [x2, 4]
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x25
	bl	ClearAll
	mov	w0, -1
	b	.L3742
.L3756:
	ldrb	w0, [x3, 1]
	cmp	w0, 1
	bne	.L3689
	ldrb	w0, [x21, 1585]
	mov	w4, 0
	b	.L3692
	.size	AllocFrameStore, .-AllocFrameStore
	.align	3
.LC866:
	.xword	.LC865
	.align	3
.LC867:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC869:
	.xword	.LC868
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	DecGap
	.type	DecGap, %function
DecGap:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x19, x0
	mov	x0, x30
	add	x25, x19, 24576
	add	x20, x19, 20480
	bl	_mcount
	add	x28, x19, 16384
	add	x0, x19, 12288
	add	x27, x19, 61440
	ldr	w1, [x25, 3188]
	mov	w22, 2
	ldr	w2, [x20, 1604]
	ldrb	w0, [x0, 2705]
	ldr	w5, [x20, 1600]
	cmp	w0, 1
	lsl	x0, x1, 6
	sub	x0, x0, x1
	ldr	w21, [x28, 788]
	lsl	x0, x0, 2
	str	w2, [x29, 120]
	sub	x0, x0, x1
	lsl	x0, x0, 1
	sub	x0, x0, x1
	lsl	x0, x0, 2
	add	x1, x19, x0
	add	x0, x0, 20480
	add	x1, x1, 20480
	add	x0, x19, x0
	add	x0, x0, 3276
	ldrb	w1, [x1, 3279]
	str	w1, [x29, 104]
	ldr	w1, [x20, 752]
	str	w1, [x29, 112]
	ldr	w1, [x20, 756]
	str	x0, [x27, 3360]
	str	w1, [x29, 108]
	csel	w1, wzr, w22, ne
	ldr	w0, [x25, 3716]
	str	w1, [x29, 116]
	cbz	w0, .L3781
	mov	w0, 1
	add	w21, w21, 4
	add	w2, w5, 1
	lsl	w21, w0, w21
	ldr	x1, .LC873
	mov	w0, w22
	udiv	w5, w2, w21
	str	wzr, [x20, 752]
	str	wzr, [x20, 756]
	msub	w26, w5, w21, w2
	bl	dprint_vfmw
	ldr	x1, .LC875
	mov	w3, w26
	ldr	w2, [x29, 120]
	mov	w0, w22
	bl	dprint_vfmw
	ldr	w1, [x25, 3712]
	ldr	w0, [x25, 3716]
	cmp	w0, w1
	bhi	.L3782
.L3761:
	cbz	w0, .L3772
	sub	w3, w0, #1
	mov	w22, 0
	add	x3, x3, 3489
	add	x0, x25, 3328
	add	x3, x19, x3, lsl 3
	.p2align 2
.L3764:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldr	w1, [x2, 688]
	cmp	w22, w1
	bge	.L3763
	ldrb	w2, [x2, 4]
	cmp	w2, wzr
	csel	w22, w22, w1, eq
.L3763:
	cmp	x0, x3
	bne	.L3764
.L3762:
	ldr	w0, [x29, 120]
	mov	w23, 1
	str	wzr, [x29, 124]
	mov	w24, w23
	cmp	w0, w26
	bne	.L3777
	b	.L3769
	.p2align 3
.L3767:
	mov	x1, 0
	mov	x0, x19
	strb	wzr, [x27, 2676]
	bl	StorePicInDPB
	add	w1, w26, 1
	cbnz	w0, .L3783
.L3768:
	sdiv	w0, w1, w21
	str	w26, [x20, 1600]
	msub	w26, w0, w21, w1
	ldr	w0, [x29, 120]
	cmp	w0, w26
	beq	.L3769
	ldr	w0, [x25, 3716]
	ldr	w1, [x29, 124]
	cmp	w1, w0
	bhi	.L3769
.L3777:
	mov	w1, 1
	mov	x0, x19
	bl	AllocFrameStore
	cbnz	w0, .L3784
	ldr	x1, .LC879
	mov	w0, 2
	bl	dprint_vfmw
	strb	w24, [x27, 2678]
	ldr	x0, [x27, 3352]
	str	w26, [x0, 676]
	str	w26, [x27, 3368]
	ldr	x0, [x27, 3352]
	str	w26, [x0, 728]
	ldr	w0, [x29, 116]
	str	w0, [x27, 3376]
	ldr	x0, [x27, 3352]
	str	wzr, [x0, 724]
	ldr	x0, [x27, 3352]
	str	w23, [x0, 692]
	ldr	x0, [x27, 3352]
	strb	wzr, [x0, 4]
	ldr	x0, [x27, 3352]
	strb	w23, [x0]
	strb	w24, [x27, 2674]
	ldr	x0, [x27, 3360]
	strb	wzr, [x0, 3]
	ldr	w0, [x28, 792]
	cbz	w0, .L3767
	mov	x0, x19
	str	w26, [x20, 768]
	bl	DecPOC
	ldr	w0, [x20, 748]
	str	w0, [x27, 3380]
	ldr	w0, [x20, 744]
	str	w0, [x27, 3384]
	ldr	w0, [x20, 736]
	str	w0, [x27, 3388]
	cmp	w0, w22
	ldr	w0, [x20, 740]
	str	w0, [x27, 3392]
	bls	.L3767
	cmp	w0, w22
	ldr	w0, [x29, 124]
	mov	x1, 0
	strb	wzr, [x27, 2676]
	csinc	w0, w0, w0, ls
	str	w0, [x29, 124]
	mov	x0, x19
	bl	StorePicInDPB
	add	w1, w26, 1
	cbz	w0, .L3768
.L3783:
	ldr	w1, [x29, 112]
	mov	w3, w0
	str	w1, [x20, 752]
	mov	w2, 6613
	ldr	w1, [x29, 108]
	mov	w0, 0
	str	w1, [x20, 756]
	ldrb	w5, [x29, 104]
	ldr	x4, [x27, 3360]
	ldr	x1, .LC881
	strb	w5, [x4, 3]
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
.L3782:
	mov	w0, w1
	str	w1, [x25, 3716]
	b	.L3761
	.p2align 3
.L3781:
	ldr	x1, .LC871
	bl	dprint_vfmw
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L3769:
	ldr	w0, [x29, 112]
	str	w0, [x20, 752]
	ldr	w0, [x29, 108]
	str	w0, [x20, 756]
	mov	w0, 0
	ldrb	w2, [x29, 104]
	ldr	x1, [x27, 3360]
	strb	w2, [x1, 3]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L3784:
	ldr	w0, [x29, 112]
	str	w0, [x20, 752]
	ldr	w0, [x29, 108]
	str	w0, [x20, 756]
	mov	w0, 0
	ldrb	w3, [x29, 104]
	ldr	x2, [x27, 3360]
	ldr	x1, .LC877
	strb	w3, [x2, 3]
	bl	dprint_vfmw
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
.L3772:
	mov	w22, 0
	b	.L3762
	.size	DecGap, .-DecGap
	.align	3
.LC871:
	.xword	.LC870
	.align	3
.LC873:
	.xword	.LC872
	.align	3
.LC875:
	.xword	.LC874
	.align	3
.LC877:
	.xword	.LC876
	.align	3
.LC879:
	.xword	.LC878
	.align	3
.LC881:
	.xword	.LC880
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_Init
	.type	H264DEC_Init, %function
H264DEC_Init:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x22, .LC882
	mov	x2, 2880
	mov	w1, 0
	movk	x2, 0x1, lsl 16
	mov	x0, x20
	ldr	x3, [x22, 96]
	ldr	w19, [x20, 608]
	blr	x3
	str	w19, [x20, 608]
	add	x0, x20, 8
	bl	ResetVoQueue
	str	x21, [x20]
	str	xzr, [x20, 616]
	str	wzr, [x20, 624]
	ldr	w0, [x21, 28]
	cmp	w0, 25
	beq	.L3795
	mov	w2, 32
	mov	w1, 256
	mov	w0, 136
	str	w2, [x20, 14944]
	str	w0, [x20, 14940]
	str	w1, [x20, 14948]
.L3787:
	ldr	w0, [x21, 584]
	mov	w23, 2208
	add	x19, x20, 65536
	bl	MEM_Phy2Vir
	ldr	x1, [x20]
	mov	w2, 4000
	ldr	w4, [x20, 14944]
	ldr	w5, [x20, 14948]
	ldrsw	x3, [x1, 580]
	smull	x2, w4, w2
	add	x3, x0, x3
	str	x3, [x20, 14960]
	add	x1, x3, x2
	str	x1, [x20, 14968]
	cmp	x1, xzr
	smaddl	x0, w5, w23, x1
	ccmp	x3, xzr, 4, ne
	str	x0, [x19, 2736]
	ccmp	x0, xzr, 4, ne
	beq	.L3796
	ldr	w6, [x21, 608]
	cmp	w6, wzr
	ccmp	x3, xzr, 4, eq
	ccmp	x1, xzr, 4, ne
	beq	.L3790
	ldr	x4, [x22, 96]
	mov	w1, 0
	mov	x0, x3
	blr	x4
	ldr	w2, [x20, 14948]
	mov	w1, 0
	ldr	x0, [x20, 14968]
	ldr	x3, [x22, 96]
	smull	x2, w2, w23
	blr	x3
	ldr	w4, [x20, 14944]
	ldr	w5, [x20, 14948]
	ldr	x0, [x19, 2736]
.L3790:
	add	x2, x20, 16384
	ldr	x6, [x22, 96]
	mov	w1, 0
	str	w5, [x2, 2616]
	str	w4, [x20, 15012]
	ldrsw	x3, [x20, 14940]
	lsl	x2, x3, 7
	sub	x2, x2, x3
	lsl	x2, x2, 5
	blr	x6
	str	wzr, [x19, 1340]
	mov	w0, 17
	mov	w1, 40
	str	w0, [x19, 1336]
	add	x0, x19, 1280
	str	w1, [x19, 1332]
	add	x1, x19, 1024
	add	x2, x19, 2560
	add	x3, x19, 2560
	stp	wzr, wzr, [x0, 68]
	stp	wzr, wzr, [x0, 76]
	stp	xzr, xzr, [x1, 344]
	stp	xzr, xzr, [x1, 360]
	str	wzr, [x19, 2756]
	mov	x0, x20
	stp	wzr, wzr, [x2, 204]
	stp	wzr, wzr, [x2, 212]
	stp	wzr, wzr, [x3, 220]
	stp	wzr, wzr, [x3, 228]
	str	wzr, [x19, 2824]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 2820]
	beq	.L3797
	mov	w1, 0
	mov	x0, x20
	bl	ClearAll
	mov	w0, 1
.L3789:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3795:
	ldr	w0, [x21, 684]
	str	w0, [x20, 14944]
	ldr	w0, [x21, 688]
	str	w0, [x20, 14948]
	ldr	w0, [x21, 676]
	str	w0, [x20, 14940]
	b	.L3787
.L3796:
	ldr	x2, .LC883
	mov	w3, 13185
	ldr	x1, .LC885
	mov	w0, 0
	add	x2, x2, 296
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3789
	.p2align 3
.L3797:
	ldr	x1, .LC887
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3789
	.size	H264DEC_Init, .-H264DEC_Init
	.align	3
.LC882:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC883:
	.xword	.LANCHOR1
	.align	3
.LC885:
	.xword	.LC884
	.align	3
.LC887:
	.xword	.LC886
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	InitPic
	.type	InitPic, %function
InitPic:
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x23, x21, 20480
	mov	w25, 2208
	bl	_mcount
	add	x19, x21, 61440
	ldr	x0, [x21, 14968]
	mov	w20, 4000
	ldr	w1, [x23, 1596]
	add	x22, x21, 65536
	ldrb	w2, [x19, 2672]
	ldr	x3, [x21, 14960]
	umull	x1, w1, w25
	add	x25, x0, x1
	ldr	w0, [x25, 28]
	umull	x0, w0, w20
	add	x20, x3, x0
	cbz	w2, .L3799
	ldr	x0, [x19, 3352]
	cbz	x0, .L3800
	ldrb	w1, [x0, 1]
	cbz	w1, .L3930
	strb	wzr, [x19, 2672]
.L3799:
	add	x1, x29, 108
	mov	x0, x21
	bl	GetReRangeFlag
	mov	w26, w0
	ldr	w1, [x21, 15012]
	ldr	w0, [x20, 36]
	cmp	w1, w0
	beq	.L3931
.L3802:
	ldr	x1, .LC891
	add	x0, x21, 12288
	strb	wzr, [x20, 24]
	mov	x2, 4000
	add	x0, x0, 2688
	ldr	x3, [x1, 112]
	mov	x1, x20
	blr	x3
	ldr	w0, [x29, 108]
	cbz	w0, .L3804
.L3941:
	ldr	x0, [x21]
	ldr	w1, [x0, 708]
	cbnz	w1, .L3805
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L3932
.L3805:
	ldr	w0, [x22, 2780]
	add	w0, w0, 1
	str	w0, [x22, 2780]
	cbnz	w26, .L3817
	ldr	x0, [x21]
	ldr	w0, [x0, 872]
	cmp	w0, 1
	beq	.L3817
	mov	x0, x21
	bl	FlushDPB
	cbnz	w0, .L3933
.L3820:
	cbz	x21, .L3865
.L3935:
	mov	x0, x21
	bl	ClearAllSlice
	mov	x0, x21
	bl	InitDPB.part.13
	cbnz	w0, .L3821
	cbnz	w26, .L3823
	ldr	x0, [x21]
	add	x24, x21, 16384
	ldr	w0, [x0, 872]
	cmp	w0, 1
	beq	.L3823
.L3816:
	ldr	w1, [x24, 2616]
	ldr	w0, [x25, 24]
	cmp	w1, w0
	bne	.L3827
	ldrb	w0, [x25, 20]
	cbnz	w0, .L3827
.L3828:
	ldr	w0, [x23, 728]
	ldr	w3, [x24, 788]
	cbz	w0, .L3829
	str	wzr, [x23, 1600]
	str	wzr, [x22, 120]
.L3829:
	ldr	w0, [x22, 2748]
	cmp	w0, 2
	beq	.L3830
	ldr	x2, [x21]
	ldr	w0, [x2, 12]
	sub	w0, w0, #2
	cmp	w0, 1
	bls	.L3830
	ldr	w1, [x23, 1600]
	ldr	w4, [x23, 1604]
	cmp	w4, w1
	beq	.L3831
	mov	w0, 1
	add	w3, w3, 4
	lsl	w3, w0, w3
	add	w5, w1, w0
	udiv	w0, w5, w3
	msub	w0, w0, w3, w5
	cmp	w4, w0
	beq	.L3866
	ldr	w0, [x2, 600]
	cbnz	w0, .L3832
	ldr	w0, [x2, 640]
	cmp	w0, 1
	beq	.L3934
.L3833:
	cmp	w4, w1
	bls	.L3834
	ldr	w0, [x24, 1864]
	sub	w1, w4, w1
	cmp	w0, w1
	bcs	.L3832
	ldrb	w0, [x23, 1584]
	cmp	w0, 2
	beq	.L3835
.L3840:
	ldr	w0, [x22, 2816]
	cbnz	w0, .L3832
	mov	x0, x21
	bl	ClearAllSlice
	ldr	x0, .LC903
	mov	w1, 23352
	ldr	w2, [x21, 14948]
	movk	w1, 0x1, lsl 16
	mov	w6, 2
	mov	w5, 7
	ldrb	w0, [x0]
	mov	w4, 32
	mov	w3, 3
	str	w2, [x23, 3240]
	str	w1, [x23, 3248]
	mov	w2, -1
	mov	w1, 262144
	strb	wzr, [x23, 3232]
	strb	w6, [x23, 3233]
	strb	w4, [x23, 3234]
	str	w5, [x23, 3244]
	str	w3, [x23, 3256]
	str	wzr, [x23, 3264]
	str	wzr, [x23, 3268]
	str	w2, [x23, 3260]
	str	w1, [x23, 3272]
	cbnz	w0, .L3841
	mov	x0, x21
	bl	ClearDPB
.L3841:
	ldr	w0, [x23, 1600]
	mov	w2, 6957
	ldr	w3, [x23, 1604]
	ldr	x1, .LC905
	ldr	w4, [x24, 1864]
	sub	w3, w3, w0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
	.p2align 3
.L3827:
	ldr	x0, .LC891
	mov	x2, 2208
	strb	wzr, [x25, 20]
	mov	x1, x25
	ldr	x3, [x0, 112]
	add	x0, x24, 2592
	blr	x3
	b	.L3828
	.p2align 3
.L3817:
	ldr	x1, .LC902
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x22, 2864]
	cmp	w0, 1
	bne	.L3820
	mov	x0, x21
	bl	GetBackPicFromVOQueue
	cbnz	x21, .L3935
	.p2align 2
.L3865:
	mov	w0, -1
.L3821:
	ldr	x1, .LC894
	mov	w3, w0
	mov	w2, 6860
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
.L3866:
	mov	w1, w4
	.p2align 2
.L3831:
	ldr	w0, [x23, 1616]
	cbz	w0, .L3850
	str	w1, [x23, 1600]
.L3850:
	mov	x0, x21
	str	w1, [x23, 768]
	bl	DecPOC
	mov	w1, 0
	mov	x0, x21
	bl	AllocFrameStore
	cbnz	w0, .L3936
	strb	wzr, [x19, 2679]
	mov	w0, 1
	strb	w0, [x19, 2672]
	mov	w1, -1
	mov	w4, 1
	ldrb	w0, [x23, 1587]
	strb	w0, [x19, 2678]
	ldr	w5, [x23, 1604]
	str	w5, [x19, 3368]
	ldr	w3, [x23, 1616]
	str	w3, [x19, 3376]
	ldr	w0, [x23, 748]
	str	w0, [x19, 3380]
	ldr	w0, [x23, 744]
	str	w0, [x19, 3384]
	ldr	w0, [x23, 736]
	str	w0, [x19, 3388]
	ldr	w0, [x23, 740]
	str	w0, [x19, 3392]
	strb	wzr, [x19, 2674]
	strb	wzr, [x19, 2677]
	strb	wzr, [x19, 2676]
	str	w1, [x19, 3424]
	ldrb	w2, [x23, 1585]
	cbz	w2, .L3852
	strb	w4, [x23, 1585]
	mov	w2, w4
	mov	w4, 2
.L3852:
	add	x25, x21, 12288
	ldr	w6, [x24, 1844]
	mov	w1, 2
	ldrb	w0, [x25, 2706]
	sub	w0, w1, w0
	madd	w0, w6, w0, w0
	str	w0, [x19, 3416]
	udiv	w0, w0, w4
	str	w0, [x19, 3412]
	ldr	w1, [x24, 1840]
	add	w1, w1, 1
	str	w1, [x19, 3408]
	mul	w0, w0, w1
	str	w0, [x19, 3420]
	ldrb	w0, [x24, 2592]
	strb	w0, [x19, 2680]
	cbnz	w2, .L3868
	ldrb	w0, [x25, 2707]
	mov	w1, 0
	cbnz	w0, .L3937
.L3853:
	strb	w0, [x19, 2681]
	str	w1, [x22, 2728]
	cbz	w3, .L3854
	str	w5, [x23, 1600]
.L3854:
	add	x2, x21, 24576
	mov	x23, -1
	ldr	x1, .LC911
	mov	w0, 29
	mov	w26, 2
	ldr	w3, [x2, 3188]
	lsl	x2, x3, 6
	sub	x2, x2, x3
	lsl	x2, x2, 2
	sub	x2, x2, x3
	lsl	x2, x2, 1
	sub	x2, x2, x3
	add	x2, x21, x2, lsl 2
	add	x2, x2, 20480
	add	x2, x2, 3276
	str	x2, [x19, 3360]
	ldr	x2, [x21]
	ldr	x3, [x2, 56]
	str	x3, [x19, 3328]
	ldr	x3, [x2, 72]
	str	x3, [x19, 3336]
	ldr	x3, [x2, 88]
	str	x3, [x19, 3344]
	ldr	w3, [x2, 104]
	str	w3, [x19, 2696]
	ldr	w3, [x2, 108]
	str	w3, [x19, 2700]
	ldr	w3, [x2, 112]
	str	w3, [x19, 2704]
	ldr	w3, [x2, 128]
	str	w3, [x19, 2708]
	ldr	w3, [x20, 44]
	str	w3, [x19, 2888]
	ldr	w3, [x20, 48]
	str	w3, [x19, 2892]
	str	x23, [x2, 56]
	ldr	x2, [x19, 3328]
	bl	dprint_vfmw
	ldr	x1, .LC913
	mov	w0, 29
	ldr	x2, [x19, 3336]
	bl	dprint_vfmw
	ldr	w0, [x24, 1840]
	ldr	x1, .LC891
	add	w0, w0, 1
	lsl	w0, w0, 4
	str	w0, [x19, 2816]
	ldr	x3, [x1, 96]
	ldrb	w1, [x25, 2706]
	ldr	w2, [x24, 1844]
	sub	w0, w26, w1
	mov	w1, 0
	madd	w0, w2, w0, w0
	mov	x2, 4
	lsl	w0, w0, 4
	str	w0, [x19, 2820]
	ldr	w0, [x21, 15016]
	ldr	w25, [x24, 1908]
	cmp	w0, 1
	add	x0, x19, 2812
	cset	w27, ne
	and	w25, w25, 7
	blr	x3
	ldrb	w0, [x19, 2812]
	ldrb	w2, [x19, 2813]
	and	w0, w0, 252
	bfi	w0, w27, 2, 3
	strb	w0, [x19, 2812]
	bfi	w2, w26, 0, 2
	ldr	w1, [x24, 1912]
	and	w2, w2, -13
	bfi	w2, w26, 4, 2
	strb	w2, [x19, 2813]
	bfi	w0, w1, 5, 3
	strb	w0, [x19, 2812]
	mov	w1, w25
	add	x0, x19, 2688
	ldr	w2, [x19, 2812]
	bfi	w2, w25, 14, 3
	str	w2, [x19, 2812]
	bl	SetAspectRatio
	ldrb	w2, [x19, 2675]
	ldr	w1, [x22, 2780]
	cmp	w2, wzr
	ldr	x0, [x19, 3352]
	str	w1, [x19, 2876]
	cset	w1, ne
	str	w1, [x19, 2800]
	cbz	x0, .L3938
	ldr	w1, [x19, 2812]
	str	w1, [x0, 132]
	ldr	x0, [x19, 3352]
	ldr	w1, [x19, 2800]
	str	w1, [x0, 120]
	ldr	x0, [x19, 3352]
	ldr	w1, [x19, 2692]
	str	w1, [x0, 12]
	ldr	x0, [x19, 3352]
	ldr	w1, [x19, 2688]
	str	w1, [x0, 8]
	ldr	x0, [x19, 3352]
	ldr	w1, [x19, 2816]
	str	w1, [x0, 136]
	ldr	x0, [x19, 3352]
	ldr	w1, [x19, 2820]
	str	w1, [x0, 140]
	ldr	x1, [x19, 3352]
	ldr	w0, [x20, 3284]
	str	w0, [x1, 152]
	str	w0, [x19, 2832]
	ldr	x1, [x19, 3352]
	ldr	w0, [x20, 3288]
	str	w0, [x1, 156]
	str	w0, [x19, 2836]
	ldr	x1, [x19, 3352]
	ldr	w0, [x20, 3276]
	str	w0, [x1, 144]
	str	w0, [x19, 2824]
	ldr	x1, [x19, 3352]
	ldr	w0, [x20, 3280]
	str	w0, [x1, 148]
	str	w0, [x19, 2828]
	ldr	x1, [x19, 3352]
	ldr	w0, [x22, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_GetDispPhyFs
	cbz	x0, .L3856
	ldr	w3, [x19, 2800]
	mov	w1, 0
	ldr	w2, [x0, 8]
	cmp	w3, wzr
	ldr	w0, [x22, 2820]
	cset	w3, ne
	bl	FSP_SetStoreType
.L3856:
	ldr	w1, [x22, 1360]
	add	x4, x19, 3288
	add	x5, x19, 3320
.L3860:
	ldr	x0, [x4]
	cbnz	x0, .L3857
	cbz	w1, .L3857
	ldr	x0, [x22, 1368]
	subs	w1, w1, #1
	str	x0, [x4]
	beq	.L3858
	add	x3, x22, 1368
	mov	w2, 0
	.p2align 2
.L3859:
	add	w0, w2, 1
	mov	x2, x0
	cmp	w0, w1
	add	x0, x0, 8192
	add	x0, x21, x0, lsl 3
	ldr	x0, [x0, 1368]
	str	x0, [x3], 8
	bne	.L3859
.L3858:
	uxtw	x0, w1
	add	x0, x0, 8192
	add	x0, x21, x0, lsl 3
	str	xzr, [x0, 1368]
	str	w1, [x22, 1360]
.L3857:
	add	x4, x4, 8
	cmp	x5, x4
	bne	.L3860
	cbz	w1, .L3862
	cmp	w1, wzr
	ble	.L3862
	.p2align 2
.L3863:
	add	x23, x21, x1, sxtw 3
	sub	w20, w1, #1
	add	x23, x23, 65536
	ldr	w0, [x22, 2820]
	ldr	x1, [x23, 1360]
	bl	FreeUsdByDec
	str	xzr, [x23, 1360]
	mov	w1, w20
	cbnz	w20, .L3863
.L3862:
	str	wzr, [x22, 1360]
	mov	x0, x21
	str	wzr, [x19, 3396]
	bl	CalcPicNum
	mov	w0, 0
.L3807:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3835:
	cbnz	w4, .L3837
	sub	w4, w3, #1
.L3838:
	mov	x0, x21
	str	w4, [x23, 1600]
	bl	FlushDPB
	cbnz	w0, .L3939
	ldrb	w0, [x23, 1584]
	cmp	w0, 2
	bne	.L3840
	.p2align 2
.L3832:
	mov	x0, x21
	bl	DecGap
	cbnz	w0, .L3940
.L3830:
	ldr	w1, [x23, 1604]
	b	.L3831
	.p2align 3
.L3931:
	ldrb	w0, [x20, 24]
	cbnz	w0, .L3802
	ldr	w0, [x29, 108]
	cbnz	w0, .L3941
.L3804:
	ldr	x0, [x21]
	ldr	w0, [x0, 872]
	cmp	w0, 1
	beq	.L3805
	add	x24, x21, 16384
	b	.L3816
	.p2align 3
.L3868:
	mov	w1, 0
	mov	w0, 0
	b	.L3853
	.p2align 3
.L3823:
	add	x24, x21, 16384
	add	x1, x21, 12288
	add	x3, x22, 1332
	ldr	w4, [x24, 1864]
	str	w4, [x22, 1336]
	ldr	w0, [x24, 1844]
	ldrb	w26, [x1, 2706]
	mov	w1, 2
	add	w0, w0, 1
	ldr	w27, [x24, 1840]
	sub	w26, w1, w26
	lsl	w0, w0, 4
	add	w27, w27, 1
	mul	w26, w0, w26
	lsl	w27, w27, 4
	mov	x0, x21
	mov	w1, w27
	mov	w2, w26
	bl	H264_ArrangeVahbMem
	cmp	w0, 1
	beq	.L3942
.L3926:
	ldr	x0, [x21]
	ldr	w0, [x0, 872]
	cmp	w0, 1
	beq	.L3943
	ldr	x1, .LC900
	mov	w0, 0
	str	wzr, [x21, 14932]
	str	wzr, [x21, 14936]
	bl	dprint_vfmw
	mov	w1, 0
	mov	x0, x21
	bl	ClearAll
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3937:
	mov	w1, 1
	mov	w0, w1
	b	.L3853
	.p2align 3
.L3930:
	ldr	w1, [x0, 672]
	mov	w2, 1
	ldr	w0, [x22, 2820]
	bl	FSP_ClearLogicFs
	ldr	x0, [x19, 3352]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 3352]
	strb	wzr, [x0, 4]
	strb	wzr, [x19, 2672]
	b	.L3799
	.p2align 3
.L3943:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -2
	ldp	x29, x30, [sp], 112
	ret
.L3932:
	ldr	w0, [x22, 2780]
	add	w0, w0, 1
	str	w0, [x22, 2780]
	cbnz	w26, .L3944
.L3806:
	cbz	x21, .L3864
	mov	x0, x21
	bl	ClearAllSlice
	mov	x0, x21
	bl	InitDPB.part.13
	mov	w3, w0
	cbnz	w0, .L3808
	add	x24, x21, 16384
	add	x1, x21, 12288
	mov	w2, 2
	ldrb	w27, [x1, 2706]
	ldr	w1, [x24, 1844]
	ldr	w28, [x24, 1840]
	sub	w27, w2, w27
	add	w1, w1, 1
	lsl	w1, w1, 4
	add	w28, w28, 1
	lsl	w28, w28, 4
	mul	w27, w1, w27
	cbz	w26, .L3810
	ldr	w1, [x21, 14932]
	cbnz	w1, .L3810
	ldr	w4, [x24, 1864]
	str	w4, [x22, 1336]
	ldr	x3, [x21]
	ldr	w1, [x3, 668]
	cmp	w28, w1
	bhi	.L3811
	ldr	w2, [x3, 672]
	cmp	w27, w2
	bhi	.L3811
	add	x5, x21, 24576
	ldr	w6, [x3, 692]
	ldr	w5, [x5, 3712]
	cmp	w6, w5
	bcc	.L3945
	ldr	w0, [x3, 696]
	cbnz	w0, .L3814
	mov	w4, 1
	str	w4, [x22, 1336]
	ldr	w1, [x3, 668]
	ldr	w2, [x3, 672]
.L3814:
	add	x3, x22, 1332
	mov	x0, x21
	bl	H264_ArrangeVahbMem
	cmp	w0, 1
	bne	.L3926
.L3810:
	lsr	w28, w28, 4
	lsr	w27, w27, 4
	str	w28, [x21, 14932]
	str	w27, [x21, 14936]
	b	.L3816
	.p2align 3
.L3942:
	lsr	w27, w27, 4
	lsr	w26, w26, 4
	str	w27, [x21, 14932]
	str	w26, [x21, 14936]
	b	.L3816
.L3834:
	sub	w0, w4, w1
	ldr	w1, [x24, 1864]
	add	w0, w0, w3
	cmp	w1, w0
	bcs	.L3832
	ldrb	w0, [x23, 1584]
	cmp	w0, 2
	beq	.L3842
.L3847:
	ldr	w0, [x22, 2816]
	cbnz	w0, .L3832
	mov	x0, x21
	bl	ClearAllSlice
	ldr	x0, .LC903
	mov	w1, 23352
	ldr	w2, [x21, 14948]
	movk	w1, 0x1, lsl 16
	mov	w6, 2
	mov	w5, 7
	ldrb	w0, [x0]
	mov	w4, 32
	mov	w3, 3
	str	w2, [x23, 3240]
	str	w1, [x23, 3248]
	mov	w2, -1
	mov	w1, 262144
	strb	wzr, [x23, 3232]
	strb	w6, [x23, 3233]
	strb	w4, [x23, 3234]
	str	w5, [x23, 3244]
	str	w3, [x23, 3256]
	str	wzr, [x23, 3264]
	str	wzr, [x23, 3268]
	str	w2, [x23, 3260]
	str	w1, [x23, 3272]
	cbnz	w0, .L3848
	mov	x0, x21
	bl	ClearDPB
.L3848:
	ldr	w0, [x23, 1600]
	mov	w2, 6990
	ldr	w3, [x23, 1604]
	ldr	x1, .LC905
	ldr	w4, [x24, 1864]
	sub	w3, w3, w0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
	.p2align 3
.L3800:
	ldr	x2, .LC888
	mov	w3, 6691
	ldr	x1, .LC890
	mov	w0, 22
	add	x2, x2, 312
	bl	dprint_vfmw
	strb	wzr, [x19, 2672]
	b	.L3799
.L3864:
	mov	w3, -1
.L3808:
	ldr	x1, .LC894
	mov	w2, 6734
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
	.p2align 3
.L3944:
	mov	x0, x21
	bl	FlushDPB
	cbz	w0, .L3806
	ldr	x1, .LC892
	mov	w3, w0
	mov	w2, 6725
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
	.p2align 3
.L3933:
	ldr	x1, .LC892
	mov	w3, w0
	mov	w2, 6851
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
.L3940:
	ldr	x1, .LC907
	mov	w2, 7002
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
	.p2align 3
.L3934:
	ldr	w0, [x2, 636]
	cbnz	w0, .L3833
	ldr	w0, [x2, 644]
	cbnz	w0, .L3833
	ldr	w0, [x2, 604]
	add	w0, w0, 1024
	cmp	w0, 2048
	bhi	.L3832
	b	.L3833
.L3936:
	ldr	x1, .LC909
	mov	w2, 7026
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
.L3842:
	cbnz	w4, .L3844
	sub	w4, w3, #1
.L3845:
	mov	x0, x21
	str	w4, [x23, 1600]
	bl	FlushDPB
	cbnz	w0, .L3946
	ldrb	w0, [x23, 1584]
	cmp	w0, 2
	beq	.L3832
	b	.L3847
	.p2align 3
.L3938:
	ldr	x2, .LC888
	mov	w3, 7109
	ldr	x1, .LC915
	mov	w0, 22
	add	x2, x2, 312
	bl	dprint_vfmw
	mov	w0, w23
	b	.L3807
.L3837:
	sub	w4, w4, #1
	b	.L3838
.L3844:
	sub	w4, w4, #1
	b	.L3845
.L3811:
	ldr	x1, .LC896
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
.L3945:
	ldr	x1, .LC898
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
.L3939:
	ldr	x1, .LC892
	mov	w3, w0
	mov	w2, 6941
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
.L3946:
	ldr	x1, .LC892
	mov	w3, w0
	mov	w2, 6974
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3807
	.size	InitPic, .-InitPic
	.align	3
.LC888:
	.xword	.LANCHOR1
	.align	3
.LC890:
	.xword	.LC889
	.align	3
.LC891:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC892:
	.xword	.LC792
	.align	3
.LC894:
	.xword	.LC893
	.align	3
.LC896:
	.xword	.LC895
	.align	3
.LC898:
	.xword	.LC897
	.align	3
.LC900:
	.xword	.LC899
	.align	3
.LC902:
	.xword	.LC901
	.align	3
.LC903:
	.xword	g_apple_airplay_mirrorinig_flag
	.align	3
.LC905:
	.xword	.LC904
	.align	3
.LC907:
	.xword	.LC906
	.align	3
.LC909:
	.xword	.LC908
	.align	3
.LC911:
	.xword	.LC910
	.align	3
.LC913:
	.xword	.LC912
	.align	3
.LC915:
	.xword	.LC914
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecSlice
	.type	H264_DecSlice, %function
H264_DecSlice:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 65536
	add	x21, x19, 20480
	bl	_mcount
	ldr	x1, .LC916
	mov	w0, 22
	ldr	w2, [x20, 2764]
	sub	w2, w2, #1
	bl	dprint_vfmw
	ldr	x0, [x19, 632]
	ldr	x2, .LC917
	ldrb	w1, [x0, 2]
	strb	w1, [x21, 1587]
	ldr	w0, [x0, 84]
	str	w0, [x21, 1616]
	ldrsw	x0, [x20, 2820]
	ldr	x0, [x2, x0, lsl 3]
	ldrsb	w2, [x0, 44]
	cmp	w2, 1
	beq	.L4003
.L3948:
	mov	x0, x19
	bl	ProcessSliceHeaderFirstPart
	cbnz	w0, .L4002
	mov	x0, x19
	bl	ProcessSliceHeaderSecondPart
	cbnz	w0, .L4002
	ldr	w2, [x20, 2744]
	mov	w3, 0
	cbz	w2, .L3955
	sub	w9, w2, #1
	add	x4, x20, 176
	add	x9, x9, 8192
	mov	w10, 0
	add	x9, x9, 23
	mov	w3, 0
	mov	x0, 0
	add	x9, x19, x9, lsl 3
	.p2align 2
.L3963:
	ldr	x1, [x4]
	ldr	x6, [x1, 8]
	cbz	x6, .L3977
	ldr	x5, [x1, 40]
	ldr	w7, [x1, 16]
	cbz	x5, .L3978
.L4009:
	ldr	w1, [x1, 48]
.L3958:
	cbz	x0, .L3959
	cmp	x6, x0
	mov	w8, w7
	bls	.L3960
	sub	x0, x6, x0
	sub	w0, w0, w10
	add	w8, w0, w7
.L3960:
	add	w3, w1, w3
	add	w3, w8, w3
.L3961:
	cbz	x5, .L3980
	mov	x0, x5
	mov	w10, w1
.L3962:
	add	x4, x4, 8
	cmp	x9, x4
	bne	.L3963
.L3955:
	add	x22, x19, 61440
	str	w3, [x20, 2804]
	ldr	w0, [x22, 3408]
	ldr	w4, [x22, 3412]
	mul	w4, w0, w4
	cmp	w4, 1620
	bgt	.L4004
	lsl	w0, w4, 2
	mov	w1, 32769
	sub	w4, w0, w4
	mov	w0, 16384
	lsl	w4, w4, 8
	cmp	w4, w1
	asr	w4, w4, 1
	csel	w4, w4, w0, gt
.L3965:
	ldr	w0, [x19, 14940]
	cmp	w0, w2
	bls	.L3966
	cmp	w4, w3
	bcc	.L3966
	ldrb	w0, [x21, 1589]
	cbz	w0, .L3969
	ldr	x1, .LC925
	mov	w0, 2
	bl	dprint_vfmw
	ldrb	w0, [x21, 1587]
	cmp	w0, 5
	ldr	w0, [x20, 2784]
	beq	.L4005
.L3971:
	add	w0, w0, 1
	str	wzr, [x20, 2800]
	str	w0, [x20, 2784]
	ldrb	w0, [x22, 2675]
	cbnz	w0, .L3972
	ldr	w0, [x20, 2788]
	add	w0, w0, 1
	str	w0, [x20, 2788]
.L3973:
	mov	x0, x19
	bl	InitPic
	cmn	w0, #2
	beq	.L3952
	cbnz	w0, .L4006
	mov	x0, x19
	bl	WritePicMsg
.L3969:
	mov	x0, x19
	bl	PicTypeStatistic
	mov	x0, x19
	bl	DecList
	cbnz	w0, .L4007
	mov	x0, x19
	bl	IsRefListWrong
	cbnz	w0, .L4008
	mov	x0, x19
	bl	ExitSlice
	mov	x0, x19
	bl	CalcStreamBits
	mov	x0, x19
	bl	WriteSliceMsg
	ldr	w1, [x20, 2800]
	mov	w2, 1
	mov	w0, 0
	str	w2, [x20, 1340]
	add	w1, w1, w2
	str	w1, [x20, 2800]
.L3952:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3980:
	mov	x0, x6
	mov	w10, w7
	b	.L3962
	.p2align 3
.L3959:
	add	w3, w7, w3
	add	w3, w3, w1
	b	.L3961
	.p2align 3
.L3977:
	ldr	x5, [x1, 40]
	mov	w7, 0
	cbnz	x5, .L4009
	.p2align 2
.L3978:
	mov	w1, 0
	b	.L3958
	.p2align 3
.L4004:
	lsl	w4, w4, 8
	b	.L3965
	.p2align 3
.L4003:
	ldr	x2, [x0, 176]
	mov	x0, 4294967296
	cmp	x2, x0
	ccmp	w1, 5, 0, eq
	bne	.L3948
	ldr	x0, [x19]
	ldr	x0, [x0, 56]
	cmn	x0, #1
	beq	.L3948
	ldr	x1, [x19, 27848]
	str	x0, [x19, 27880]
	str	x1, [x19, 27888]
	b	.L3948
	.p2align 3
.L3972:
	ldr	w0, [x20, 2792]
	add	w0, w0, 1
	str	w0, [x20, 2792]
	b	.L3973
	.p2align 3
.L4005:
	str	w0, [x20, 2796]
	b	.L3971
.L4002:
	ldr	x1, .LC918
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC919
	ldr	x4, [x0]
	cbz	x4, .L4000
	add	x2, x29, 64
	ldr	w0, [x20, 2820]
	mov	w5, -1
	mov	w3, 4
	mov	w1, 100
	str	w5, [x2, -8]!
	blr	x4
.L4000:
	mov	x0, x19
	bl	ClearCurrSlice
	mov	w0, -1
	b	.L3952
.L3966:
	ldr	x1, .LC921
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x19, 14940]
	ldr	w2, [x20, 2744]
	cmp	w2, w1
	bcc	.L3968
	ldr	x0, .LC919
	ldr	x4, [x0]
	cbz	x4, .L3968
	ldr	w0, [x20, 2820]
	mov	w3, 8
	stp	w2, w1, [x29, 56]
	add	x2, x29, 56
	mov	w1, 108
	blr	x4
.L3968:
	ldr	x1, .LC923
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearAllSlice
	mov	w3, 32
	ldr	w7, [x19, 14948]
	strb	w3, [x21, 3234]
	add	x3, x21, 3072
	mov	w6, 23352
	strb	wzr, [x21, 3232]
	str	w7, [x21, 3240]
	movk	w6, 0x1, lsl 16
	mov	w5, 2
	str	w6, [x21, 3248]
	strb	w5, [x21, 3233]
	mov	w4, 7
	str	w4, [x21, 3244]
	mov	w0, -1
	mov	w2, 3
	mov	w1, 262144
	stp	w2, w0, [x3, 184]
	stp	wzr, wzr, [x3, 192]
	str	w1, [x21, 3272]
	b	.L3952
.L4007:
	ldr	x1, .LC929
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3952
.L4008:
	ldr	x1, .LC931
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4000
.L4006:
	ldr	x1, .LC927
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3952
	.size	H264_DecSlice, .-H264_DecSlice
	.align	3
.LC916:
	.xword	.LC767
	.align	3
.LC917:
	.xword	s_pstVfmwChan
	.align	3
.LC918:
	.xword	.LC769
	.align	3
.LC919:
	.xword	g_event_report
	.align	3
.LC921:
	.xword	.LC920
	.align	3
.LC923:
	.xword	.LC922
	.align	3
.LC925:
	.xword	.LC924
	.align	3
.LC927:
	.xword	.LC926
	.align	3
.LC929:
	.xword	.LC928
	.align	3
.LC931:
	.xword	.LC930
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264_DecOneNal
	.type	H264_DecOneNal, %function
H264_DecOneNal:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	w21, w1
	add	x19, x20, 65536
	bl	_mcount
	ldr	x3, [x20, 632]
	ldr	w0, [x3, 76]
	cbz	w0, .L4015
	ldr	w2, [x19, 2804]
	mov	w0, 0
	.p2align 2
.L4014:
	ubfiz	x1, x0, 5, 32
	add	w0, w0, 1
	add	x1, x3, x1
	ldr	w1, [x1, 16]
	add	w2, w2, w1
	str	w2, [x19, 2804]
	ldr	w1, [x3, 76]
	cmp	w1, w0
	bhi	.L4014
.L4015:
	strb	wzr, [x3]
	ldr	x0, .LC932
	ldrsw	x1, [x19, 2820]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L4176
.L4013:
	add	x23, x20, 12288
	mov	w1, 32
	add	x0, x23, 2600
	bl	BsGet
	mov	w22, w0
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 72]
	add	w0, w0, 32
	str	w0, [x1, 72]
.L4016:
	ldr	x4, [x20, 632]
	and	w0, w22, 31
	ubfx	x2, x22, 5, 2
	ubfx	x3, x22, 7, 1
	ldr	x1, .LC934
	strb	w0, [x4, 2]
	ldr	x0, [x20, 632]
	str	w2, [x0, 84]
	mov	w0, 22
	ldr	x2, [x20, 632]
	str	w3, [x2, 88]
	str	wzr, [x19, 2760]
	ldr	w2, [x19, 2764]
	ldr	x3, [x20, 632]
	ldrb	w3, [x3, 2]
	bl	dprint_vfmw
	ldr	w0, [x19, 2764]
	cmp	w0, 371
	beq	.L4177
	add	w0, w0, 1
	str	w0, [x19, 2764]
	ldr	x0, [x20, 632]
	ldrb	w2, [x0, 2]
	cmp	w2, 20
	beq	.L4178
.L4018:
	sub	w0, w2, #1
	cmp	w0, 29
	bls	.L4179
.L4024:
	ldr	x1, .LC975
	mov	w3, w22
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x21, .LC948
	cmp	w22, 256
	beq	.L4054
	ldr	x4, [x21]
	cbz	x4, .L4055
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
.L4054:
	ldr	x1, [x20, 632]
	cbz	x1, .L4056
.L4057:
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4056:
	ldr	x4, [x21]
	cbz	x4, .L4164
.L4163:
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L4164:
	mov	w0, 0
.L4180:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4179:
	ldr	x1, .LC943
	ldrh	w0, [x1,w0,uxtw #1]
	adr	x1, .Lrtx4026
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx4026:
	.section	.rodata
	.align	0
	.align	2
.L4026:
	.2byte	(.L4025 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4025 - .Lrtx4026) / 4
	.2byte	(.L4027 - .Lrtx4026) / 4
	.2byte	(.L4028 - .Lrtx4026) / 4
	.2byte	(.L4029 - .Lrtx4026) / 4
	.2byte	(.L4030 - .Lrtx4026) / 4
	.2byte	(.L4031 - .Lrtx4026) / 4
	.2byte	(.L4032 - .Lrtx4026) / 4
	.2byte	(.L4033 - .Lrtx4026) / 4
	.2byte	(.L4034 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4028 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4035 - .Lrtx4026) / 4
	.2byte	(.L4025 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4024 - .Lrtx4026) / 4
	.2byte	(.L4036 - .Lrtx4026) / 4
	.text
	.p2align 3
.L4176:
	ldr	x2, [x0, 176]
	mov	x1, 4294967296
	cmp	x2, x1
	bne	.L4013
	ldr	w0, [x0, 172]
	cmp	w0, 1
	ccmp	w21, wzr, 0, eq
	bne	.L4013
	add	x23, x20, 12288
	mov	w1, 40
	add	x22, x23, 2600
	mov	x0, x22
	bl	BsSkip
	mov	w1, 8
	mov	x0, x22
	bl	BsGet
	mov	w22, w0
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 72]
	add	w0, w0, 48
	str	w0, [x1, 72]
	b	.L4016
.L4036:
	ldr	x1, .LC973
	mov	w2, 30
	mov	w0, 22
	bl	dprint_vfmw
	cbnz	w21, .L4052
	ldr	x1, [x20, 632]
	cbz	x1, .L4052
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4052:
	add	x23, x23, 2600
	mov	w1, 32
	mov	x0, x23
	bl	BsGet
	mov	w21, w0
	mov	w1, 32
	mov	x0, x23
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w21, w2
	ccmp	w0, w1, 0, eq
	bne	.L4164
	ldr	x21, .LC948
	ldr	x4, [x21]
	cbz	x4, .L4053
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L4053:
	mov	x0, x20
	str	wzr, [x20, 624]
	bl	DecVDM
	cbz	w0, .L4164
.L4171:
	ldr	x4, [x21]
	cbz	x4, .L4160
.L4161:
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L4160:
	mov	w0, -1
.L4184:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L4035:
	ldr	x1, .LC971
	mov	w2, 19
	mov	w0, 22
	bl	dprint_vfmw
.L4169:
	ldr	x1, [x20, 632]
	cbz	x1, .L4164
.L4162:
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	mov	w0, 0
.L4158:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L4034:
	ldr	x1, .LC969
	mov	w2, 13
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4162
	mov	w0, 0
	b	.L4180
.L4032:
	ldr	x1, .LC967
	mov	w2, 11
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_IsEosNal
	uxtb	w1, w0
	cmp	w1, 1
	bne	.L4169
	ldr	x21, .LC948
	strb	w0, [x23, 2640]
	ldr	x4, [x21]
	cbz	x4, .L4050
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 117
	blr	x4
.L4050:
	mov	x0, x20
	str	wzr, [x20, 624]
	bl	DecVDM
	cbz	w0, .L4169
	ldr	x1, [x20, 632]
	cbz	x1, .L4171
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	b	.L4171
.L4031:
	ldr	x1, .LC963
	mov	w2, 10
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4162
	mov	w0, 0
	b	.L4180
.L4033:
	ldr	x1, .LC965
	mov	w2, 12
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4162
	mov	w0, 0
	b	.L4180
.L4030:
	ldr	x1, .LC961
	mov	w2, 9
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4162
	mov	w0, 0
	b	.L4180
.L4029:
	ldr	x1, .LC950
	mov	w2, 8
	ldr	w3, [x19, 2772]
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_DecPPS
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L4043
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4043:
	cbnz	w21, .L4181
	ldr	w1, [x19, 2772]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 2772]
	b	.L4158
.L4028:
	ldr	x1, .LC953
	mov	w0, 22
	ldr	w3, [x19, 2768]
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_DecSPS
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L4045
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4045:
	cbnz	w21, .L4182
	ldr	w1, [x19, 2768]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 2768]
	b	.L4158
.L4027:
	ldr	x1, .LC957
	mov	w2, 6
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_DecSEI
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L4047
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4047:
	cbz	w21, .L4164
	ldr	x1, .LC959
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC948
	ldr	x4, [x0]
	cbnz	x4, .L4163
	mov	w0, 0
	b	.L4180
.L4025:
	ldr	x1, .LC945
	mov	w0, 22
	ldr	w3, [x19, 2776]
	add	x21, x20, 20480
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	mov	x0, x20
	ldrb	w2, [x1, 2]
	strb	w2, [x21, 1587]
	ldr	w2, [x1, 84]
	str	w2, [x21, 1616]
	ldrb	w1, [x1, 5]
	strb	w1, [x21, 1592]
	bl	SliceCheck
	cbnz	w0, .L4183
	mov	x0, x20
	bl	H264_DecSlice
	cmn	w0, #2
	beq	.L4158
	cbz	w0, .L4039
	ldr	x0, .LC948
	ldr	x4, [x0]
	cbnz	x4, .L4161
	mov	w0, -1
	b	.L4184
	.p2align 3
.L4177:
	ldr	x1, .LC936
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x19, 2764]
	add	w0, w0, 1
	str	w0, [x19, 2764]
	ldr	x0, [x20, 632]
	ldrb	w2, [x0, 2]
	cmp	w2, 20
	bne	.L4018
	.p2align 2
.L4178:
	mov	w1, 24
	add	x0, x23, 2600
	bl	BsGet
	mov	w22, w0
	ldr	x0, [x20, 632]
	ubfx	x1, x22, 23, 1
	strb	w1, [x0, 3]
	ldr	x1, [x20, 632]
	ldrb	w0, [x1, 3]
	cbz	w0, .L4019
	ubfx	x2, x22, 22, 1
	ubfx	x0, x22, 16, 6
	ubfx	x4, x22, 15, 1
	ubfx	x3, x22, 12, 3
	strb	w2, [x19, 160]
	ubfx	x2, x22, 8, 4
	strb	w0, [x19, 161]
	ubfx	x0, x22, 5, 3
	strb	w4, [x19, 162]
	ubfx	x4, x22, 4, 1
	strb	w3, [x19, 163]
	ubfx	x3, x22, 3, 1
	strb	w2, [x19, 164]
	ubfx	x2, x22, 2, 1
	strb	w0, [x19, 165]
	and	w0, w22, 3
	strb	w4, [x19, 166]
	strb	w3, [x19, 167]
	strb	w2, [x19, 168]
	strb	w0, [x19, 169]
.L4019:
	mov	x0, 16711680
	ldr	x2, [x19, 160]
	movk	x0, 0xff, lsl 32
	and	x0, x2, x0
	cmp	x0, 65536
	beq	.L4020
	ldr	x1, .LC938
	mov	w0, 1
	ldrb	w3, [x19, 162]
	ldrb	w2, [x19, 164]
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbz	x1, .L4160
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	mov	w0, -1
	b	.L4158
.L4020:
	ldrb	w0, [x19, 160]
	cmp	w0, 1
	beq	.L4185
.L4023:
	ldrb	w4, [x19, 165]
	mov	w0, 22
	ldrb	w3, [x19, 163]
	ldr	x1, .LC940
	ldrb	w2, [x19, 164]
	bl	dprint_vfmw
	ldr	x1, .LC942
	mov	w2, w22
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 72]
	add	w0, w0, 24
	str	w0, [x1, 72]
	ldr	x0, [x20, 632]
	ldrb	w2, [x0, 2]
	b	.L4018
.L4183:
	ldr	x1, .LC947
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x20
	bl	ClearCurrSlice
	ldr	x0, .LC948
	ldr	x4, [x0]
	cbnz	x4, .L4161
	mov	w0, -1
	b	.L4184
.L4182:
	ldr	x1, .LC955
.L4174:
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, .LC948
	ldr	x4, [x21]
	cbz	x4, .L4160
	add	x2, x29, 80
	ldr	w0, [x19, 2820]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 100
	str	w20, [x2, -8]!
	blr	x4
	ldr	x4, [x21]
	cbz	x4, .L4160
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	mov	w0, w20
	b	.L4158
.L4181:
	ldr	x1, .LC951
	b	.L4174
.L4185:
	mov	w0, 5
	strb	w0, [x1, 2]
	b	.L4023
.L4055:
	ldr	x1, [x20, 632]
	cbnz	x1, .L4057
	mov	w0, 0
	b	.L4180
.L4039:
	ldrb	w0, [x21, 1592]
	cmp	w0, 1
	bne	.L4164
	ldr	x21, .LC948
	ldr	x4, [x21]
	cbz	x4, .L4041
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L4041:
	mov	x0, x20
	str	wzr, [x20, 624]
	bl	DecVDM
	cbnz	w0, .L4171
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x23, 2641]
	b	.L4158
	.size	H264_DecOneNal, .-H264_DecOneNal
	.align	3
.LC932:
	.xword	s_pstVfmwChan
	.align	3
.LC934:
	.xword	.LC933
	.align	3
.LC936:
	.xword	.LC935
	.align	3
.LC938:
	.xword	.LC937
	.align	3
.LC940:
	.xword	.LC939
	.align	3
.LC942:
	.xword	.LC941
	.align	3
.LC943:
	.xword	.L4026
	.align	3
.LC945:
	.xword	.LC944
	.align	3
.LC947:
	.xword	.LC946
	.align	3
.LC948:
	.xword	g_event_report
	.align	3
.LC950:
	.xword	.LC949
	.align	3
.LC951:
	.xword	.LC403
	.align	3
.LC953:
	.xword	.LC952
	.align	3
.LC955:
	.xword	.LC954
	.align	3
.LC957:
	.xword	.LC956
	.align	3
.LC959:
	.xword	.LC958
	.align	3
.LC961:
	.xword	.LC960
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
.LC973:
	.xword	.LC972
	.align	3
.LC975:
	.xword	.LC974
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_DecodePacket
	.type	H264DEC_DecodePacket, %function
H264DEC_DecodePacket:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	str	wzr, [x29, 84]
	stp	wzr, wzr, [x29, 76]
	cbz	x21, .L4252
	ldr	x0, [x20]
	add	x19, x20, 65536
	ldr	w2, [x0, 8]
	ldr	w1, [x19, 1344]
	ubfiz	w2, w2, 16, 3
	str	w2, [x19, 2808]
	cmp	w1, 1
	ldr	w1, [x0]
	str	w1, [x19, 2812]
	ldr	w1, [x0, 4]
	str	w1, [x19, 2816]
	str	wzr, [x19, 2760]
	beq	.L4189
	ldr	w1, [x0, 832]
	cmp	w1, 1
	beq	.L4253
.L4190:
	mov	x1, x21
	mov	x0, x20
	bl	ReceivePacket
	mov	w1, w0
	ldr	x0, [x20, 632]
	str	x0, [x19, 2856]
.L4192:
	str	wzr, [x19, 1344]
	mov	w0, 0
	cbz	w1, .L4254
.L4240:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4253:
	ldr	w0, [x0, 872]
	cmp	w0, 1
	bne	.L4190
	ldr	w0, [x19, 2852]
	cmp	w0, 1
	bne	.L4190
	ldr	x0, [x19, 2856]
	str	x0, [x20, 632]
	str	wzr, [x19, 1344]
	str	wzr, [x19, 2852]
	b	.L4191
	.p2align 3
.L4254:
	ldr	x0, [x20, 632]
.L4191:
	str	wzr, [x0, 72]
	add	x22, x20, 12288
	add	x21, x22, 2600
	ldr	x1, [x20, 632]
	mov	x0, x21
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	ldr	x0, .LC978
	ldrsw	x1, [x19, 2820]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w23, [x0, 44]
	cmp	w23, 1
	beq	.L4193
.L4195:
	mov	w23, 0
.L4194:
	mov	w1, 32
	mov	x0, x21
	bl	BsGet
	uxtb	w0, w0
	ldr	x3, [x20, 632]
	and	w2, w0, 31
	mov	w1, 27
	and	w1, w0, w1
	ubfx	x0, x0, 5, 2
	strb	w2, [x3, 2]
	cmp	w1, 1
	ccmp	w2, 20, 4, ne
	ldr	x1, [x20, 632]
	str	w0, [x1, 84]
	beq	.L4255
.L4196:
	mov	x0, x20
	bl	FindTrailZeros
	cbnz	w0, .L4256
	ldr	x1, [x20, 632]
	mov	x0, x21
	str	wzr, [x1, 72]
	ldr	x1, [x20, 632]
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	mov	w1, w23
	mov	x0, x20
	bl	H264_DecOneNal
	cmn	w0, #2
	beq	.L4240
	cbnz	w0, .L4257
	add	x20, x20, 61440
	mov	w0, 0
	str	wzr, [x20, 3436]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L4189:
	ldr	x0, [x20, 632]
	cmp	x0, xzr
	csetm	w1, eq
	b	.L4192
	.p2align 3
.L4255:
	cmp	w2, 20
	beq	.L4258
.L4197:
	add	x2, x29, 92
	add	x1, x29, 88
	mov	x0, x20
	bl	InquireSliceProperty
	cbz	w0, .L4259
	ldr	x1, [x20, 632]
	cbz	x1, .L4212
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4212:
	ldr	x0, .LC983
	ldr	x4, [x0]
	cbz	x4, .L4251
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	mov	w0, -1
	b	.L4240
	.p2align 3
.L4259:
	ldr	w1, [x29, 88]
	ldr	w0, [x19, 2832]
	cmp	w1, 1
	csinc	w0, w0, w0, ne
	str	w0, [x19, 2832]
	beq	.L4260
	ldrb	w0, [x22, 2641]
	cmp	w0, 1
	beq	.L4215
.L4202:
	ldr	w0, [x29, 92]
	cmp	w0, 1
	bne	.L4196
	mov	x0, x20
	bl	FlushDPB
	cbnz	w0, .L4261
.L4208:
	ldr	w0, [x19, 2820]
	bl	FSP_GetFspType
	cbnz	w0, .L4196
	ldr	w0, [x19, 2820]
	add	x3, x29, 84
	add	x2, x29, 80
	add	x1, x29, 76
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x20]
	ldr	w0, [x0, 708]
	cmp	w0, 1
	bne	.L4196
	ldr	w1, [x29, 84]
	cmp	w1, wzr
	ble	.L4262
.L4209:
	mov	w0, 1
	str	wzr, [x19, 2864]
	str	w0, [x19, 1344]
	mov	w0, -2
	b	.L4240
	.p2align 3
.L4193:
	ldp	w1, w2, [x0, 172]
	ldr	w3, [x0, 180]
	mov	x0, x20
	bl	H264_VES_Splitter
	cmp	w0, 3
	beq	.L4194
	cbnz	w0, .L4240
	b	.L4195
	.p2align 3
.L4258:
	mov	x0, x20
	bl	InquireSliceExtProperty
	b	.L4197
.L4256:
	ldr	x1, .LC985
	mov	w0, 22
	bl	dprint_vfmw
.L4251:
	mov	w0, -1
	b	.L4240
	.p2align 3
.L4215:
	strb	wzr, [x22, 2641]
	b	.L4202
	.p2align 3
.L4260:
	add	x24, x20, 20480
	ldrb	w0, [x24, 1585]
	cmp	w0, 1
	ldr	w0, [x19, 2836]
	beq	.L4263
	add	w0, w0, 2
	str	w0, [x19, 2836]
.L4201:
	ldrb	w0, [x22, 2641]
	cmp	w0, 1
	beq	.L4215
	ldr	w0, [x19, 2744]
	cbz	w0, .L4202
	ldr	x3, [x20, 632]
	mov	w2, 12
	ldr	x1, .LC979
	mov	x0, x21
	add	x1, x1, 432
	str	wzr, [x3, 72]
	bl	BsInit
	mov	w1, 1
	mov	x0, x20
	bl	H264_DecOneNal
	ldrb	w0, [x24, 1585]
	cmp	w0, 1
	ldr	w0, [x19, 2836]
	beq	.L4264
	sub	w0, w0, #2
	str	w0, [x19, 2836]
.L4205:
	mov	w1, 1
	mov	w0, -2
	str	w1, [x19, 1344]
	b	.L4240
.L4263:
	add	w0, w0, 1
	str	w0, [x19, 2836]
	b	.L4201
.L4261:
	ldr	x1, .LC980
	mov	w3, w0
	mov	w2, 13915
	mov	w0, 0
	bl	dprint_vfmw
	b	.L4208
.L4252:
	ldr	x2, .LC976
	mov	w3, 13779
	ldr	x1, .LC977
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4240
.L4257:
	ldr	x1, .LC987
	mov	w0, 22
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4240
.L4264:
	sub	w0, w0, #1
	str	w0, [x19, 2836]
	b	.L4205
.L4262:
	ldr	w1, [x29, 80]
	cmp	w1, 32
	bgt	.L4209
	ldr	x1, [x20, 616]
	cbnz	x1, .L4209
	ldr	w3, [x19, 2784]
	cbz	w3, .L4196
	ldr	w6, [x20, 14932]
	cbz	w6, .L4196
	ldr	w5, [x19, 2868]
	ldr	w7, [x20, 14936]
	cmp	w7, w5
	beq	.L4196
	ldr	w4, [x19, 2872]
	cmp	w6, w4
	beq	.L4196
	ldr	x1, .LC982
	ldr	w2, [x29, 92]
	bl	dprint_vfmw
	str	wzr, [x19, 2864]
	ldr	x0, .LC983
	ldr	w1, [x20, 14936]
	str	w1, [x19, 2868]
	ldr	x4, [x0]
	ldr	w0, [x20, 14932]
	str	w0, [x19, 2872]
	cbz	x4, .L4196
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	b	.L4196
	.size	H264DEC_DecodePacket, .-H264DEC_DecodePacket
	.align	3
.LC976:
	.xword	.LC50
	.align	3
.LC977:
	.xword	.LC52
	.align	3
.LC978:
	.xword	s_pstVfmwChan
	.align	3
.LC979:
	.xword	.LANCHOR0
	.align	3
.LC980:
	.xword	.LC792
	.align	3
.LC982:
	.xword	.LC981
	.align	3
.LC983:
	.xword	g_event_report
	.align	3
.LC985:
	.xword	.LC984
	.align	3
.LC987:
	.xword	.LC986
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_VDMPostProc
	.type	H264DEC_VDMPostProc, %function
H264DEC_VDMPostProc:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	mov	w23, w1
	mov	x24, x3
	mov	w25, w4
	mov	w21, w5
	bl	_mcount
	ldr	w20, [x19, 624]
	cbnz	w20, .L4266
	add	x22, x19, 61440
	str	w23, [x22, 3404]
	cbz	w25, .L4267
	ldr	x5, .LC988
	sbfiz	x21, x21, 6, 32
	add	x21, x5, x21
	ldr	w0, [x21, 44]
	cmp	w0, 3
	beq	.L4283
	cmp	w0, 1
	beq	.L4267
	mov	x1, x24
	mov	x0, x19
	bl	StorePicInDPB
	cmp	w0, 1
	mov	w21, w0
	bls	.L4271
.L4286:
	ldr	x1, [x22, 3352]
	add	x0, x19, 65536
	mov	w2, 1
	mov	w23, -1
	mov	w20, w23
	ldr	w0, [x0, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
	ldr	x1, .LC990
	mov	w2, w21
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearAllSlice
	add	x1, x19, 20480
	ldr	w4, [x19, 14948]
	add	x5, x1, 3072
	mov	w2, 2
	mov	w3, 23352
	mov	w0, 7
	strb	w2, [x1, 3233]
	movk	w3, 0x1, lsl 16
	str	w0, [x1, 3244]
	mov	w2, 32
	strb	wzr, [x1, 3232]
	mov	w0, 3
	strb	w2, [x1, 3234]
	mov	w2, 262144
	str	w4, [x1, 3240]
	str	w3, [x1, 3248]
	stp	w23, wzr, [x5, 188]
	stp	wzr, w2, [x5, 196]
	str	w0, [x1, 3256]
	mov	x0, x19
	bl	ClearDPB
	str	xzr, [x22, 3352]
.L4269:
	mov	w0, w20
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4266:
	add	x1, x19, 61440
	mov	x0, x19
	str	w23, [x1, 3404]
	bl	ClearAllSlice
	mov	x1, x24
	mov	x0, x19
	bl	StorePicInDPB
	cbnz	w0, .L4284
.L4272:
	mov	x0, x19
	bl	FlushDPB
	cbnz	w0, .L4285
.L4273:
	add	x1, x19, 65536
	add	x0, x19, 20480
	mov	w4, 32
	mov	w7, 23352
	movk	w7, 0x1, lsl 16
	mov	w6, 2
	str	wzr, [x1, 1340]
	mov	w5, 7
	mov	w3, 3
	mov	w2, -1
	ldr	w8, [x19, 14948]
	mov	w1, 262144
	strb	w4, [x0, 3234]
	add	x4, x0, 3072
	strb	wzr, [x0, 3232]
	mov	w20, 0
	strb	w6, [x0, 3233]
	str	w8, [x0, 3240]
	str	w5, [x0, 3244]
	str	w7, [x0, 3248]
	stp	w3, w2, [x4, 184]
	stp	wzr, wzr, [x4, 192]
	str	w1, [x0, 3272]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4267:
	mov	x0, x19
	bl	ClearAllSlice
	mov	x1, x24
	mov	x0, x19
	bl	StorePicInDPB
	cmp	w0, 1
	mov	w21, w0
	bhi	.L4286
.L4271:
	add	x19, x19, 65536
	mov	w0, 1
	str	w0, [x19, 1340]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4285:
	ldr	x1, .LC994
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4273
	.p2align 3
.L4284:
	ldr	x1, .LC992
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4272
	.p2align 3
.L4283:
	mov	x0, x19
	bl	ClearAllSlice
	b	.L4269
	.size	H264DEC_VDMPostProc, .-H264DEC_VDMPostProc
	.align	3
.LC988:
	.xword	g_VdmDrvParam
	.align	3
.LC990:
	.xword	.LC989
	.align	3
.LC992:
	.xword	.LC991
	.align	3
.LC994:
	.xword	.LC993
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_GetImageBuffer
	.type	H264DEC_GetImageBuffer, %function
H264DEC_GetImageBuffer:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x19, x21, 65536
	bl	_mcount
	ldr	w0, [x19, 1332]
	cbz	w0, .L4304
	sub	w0, w0, #1
	mov	w4, 872
	mov	x2, 30104
	add	x1, x21, 28672
	add	x1, x1, 560
	umaddl	x4, w0, w4, x2
	add	x4, x21, x4
	.p2align 2
.L4295:
	ldrb	w0, [x1, 1]
	cbnz	w0, .L4290
	cbz	x1, .L4291
	add	x23, x21, 24576
	ldr	w3, [x23, 3716]
	cbz	w3, .L4291
	ldr	x0, [x21, 27904]
	cmp	x0, x1
	beq	.L4290
	sub	w3, w3, #1
	mov	x0, x21
	add	x3, x21, x3, lsl 3
	b	.L4292
	.p2align 3
.L4293:
	ldr	x2, [x0, 27904]
	cmp	x2, x1
	beq	.L4290
.L4292:
	cmp	x3, x0
	add	x0, x0, 8
	bne	.L4293
.L4291:
	ldr	w0, [x19, 2820]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L4304
	cmn	w0, #1
	beq	.L4325
.L4323:
	mov	w0, 0
.L4327:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4290:
	add	x1, x1, 872
	cmp	x1, x4
	bne	.L4295
	add	x2, x29, 76
	add	x1, x29, 72
	add	x0, x21, 8
	bl	GetQueueImgNum
	ldr	x1, .LC996
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, .LC998
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 1332]
	cbz	w0, .L4326
	ldr	x20, .LC1002
	mov	w22, 0
	add	x23, x21, 24576
	.p2align 2
.L4302:
	uxtw	x1, w22
	lsl	x0, x1, 3
	sub	x0, x0, x1
	lsl	x0, x0, 3
	sub	x0, x0, x1
	lsl	x0, x0, 1
	sub	x1, x0, x1
	lsl	x1, x1, 3
	add	x0, x21, x1
	add	x1, x1, 28672
	add	x0, x0, 28672
	add	x1, x1, 560
	adds	x1, x21, x1
	ldrb	w3, [x0, 561]
	ldrb	w4, [x0, 564]
	beq	.L4307
	ldr	w5, [x23, 3716]
	cbz	w5, .L4307
	ldr	x0, [x21, 27904]
	cmp	x1, x0
	beq	.L4309
	sub	w5, w5, #1
	mov	x0, x21
	add	x5, x21, x5, lsl 3
	b	.L4300
	.p2align 3
.L4301:
	ldr	x2, [x0, 27904]
	cmp	x1, x2
	beq	.L4309
.L4300:
	cmp	x5, x0
	add	x0, x0, 8
	bne	.L4301
.L4307:
	mov	w5, 1
.L4299:
	mov	w2, w22
	mov	x1, x20
	mov	w0, 0
	add	w22, w22, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 1332]
	cmp	w0, w22
	bhi	.L4302
.L4303:
	ldp	w2, w3, [x29, 72]
	ldr	x1, .LC1000
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 1332]
	ldr	w2, [x23, 3716]
	ldp	w3, w1, [x29, 72]
	sub	w0, w0, #2
	sub	w0, w0, w2
	add	w1, w3, w1
	cmp	w1, w0
	bge	.L4323
	ldr	x1, .LC1004
	mov	w0, 0
	bl	dprint_vfmw
	mov	w1, 1
	mov	x0, x21
	bl	ClearAll
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4304:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	mov	w0, 1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4309:
	mov	w5, 0
	b	.L4299
.L4325:
	ldr	w0, [x19, 2820]
	add	x1, x21, 8
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	b	.L4327
.L4326:
	add	x23, x21, 24576
	b	.L4303
	.size	H264DEC_GetImageBuffer, .-H264DEC_GetImageBuffer
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_GetImageWidth
	.type	H264DEC_GetImageWidth, %function
H264DEC_GetImageWidth:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 16384
	bl	_mcount
	ldr	w0, [x19, 1840]
	ldr	x19, [sp, 16]
	add	w0, w0, 1
	lsl	w0, w0, 4
	ldp	x29, x30, [sp], 32
	ret
	.size	H264DEC_GetImageWidth, .-H264DEC_GetImageWidth
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_GetImageHeight
	.type	H264DEC_GetImageHeight, %function
H264DEC_GetImageHeight:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x1, x19, 16384
	add	x19, x19, 12288
	mov	w0, 2
	ldr	w1, [x1, 1844]
	ldrb	w2, [x19, 2706]
	add	w1, w1, 1
	ldr	x19, [sp, 16]
	sub	w0, w0, w2
	lsl	w1, w1, 4
	ldp	x29, x30, [sp], 32
	mul	w0, w1, w0
	ret
	.size	H264DEC_GetImageHeight, .-H264DEC_GetImageHeight
	.global	TmpBuf
	.global	g_CabacMN
	.global	quant8_org
	.global	quant_org
	.global	quant8_inter_default
	.global	quant8_intra_default
	.global	quant_inter_default
	.global	quant_intra_default
	.global	g_ZZ_SCAN8
	.global	g_ZZ_SCAN
	.global	CalcZeroNum
	.global	g_AspecRatioIdc
	.global	g_NalTypeEOPIC
	.section	.rodata
	.align	3
.LANCHOR1 = . + 0
	.type	g_ZZ_SCAN, %object
	.size	g_ZZ_SCAN, 16
g_ZZ_SCAN:
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
	.type	g_ZZ_SCAN8, %object
	.size	g_ZZ_SCAN8, 64
g_ZZ_SCAN8:
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
	.type	SarTable.13066, %object
	.size	SarTable.13066, 136
SarTable.13066:
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
	.type	__func__.13247, %object
	.size	__func__.13247, 12
__func__.13247:
	.string	"H264_DecSEI"
	.zero	4
	.type	__func__.12099, %object
	.size	__func__.12099, 13
__func__.12099:
	.string	"DirectOutput"
	.zero	3
	.type	__func__.12564, %object
	.size	__func__.12564, 8
__func__.12564:
	.string	"InitDPB"
	.type	__func__.13515, %object
	.size	__func__.13515, 18
__func__.13515:
	.string	"H264_VES_Splitter"
	.zero	6
	.type	__func__.12217, %object
	.size	__func__.12217, 14
__func__.12217:
	.string	"StorePicInDPB"
	.zero	2
	.type	__FUNCTION__.13484, %object
	.size	__FUNCTION__.13484, 13
__FUNCTION__.13484:
	.string	"H264DEC_Init"
	.zero	3
	.type	__FUNCTION__.12701, %object
	.size	__FUNCTION__.12701, 8
__FUNCTION__.12701:
	.string	"InitPic"
	.data
	.align	3
.LANCHOR0 = . + 0
	.type	quant_org, %object
	.size	quant_org, 16
quant_org:
	.word	269488144
	.word	269488144
	.word	269488144
	.word	269488144
	.type	quant8_org, %object
	.size	quant8_org, 64
quant8_org:
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
	.type	quant_intra_default, %object
	.size	quant_intra_default, 16
quant_intra_default:
	.word	471076102
	.word	538711053
	.word	622861332
	.word	707076124
	.type	quant_inter_default, %object
	.size	quant_inter_default, 16
quant_inter_default:
	.word	403967498
	.word	454562830
	.word	505092116
	.word	572398360
	.type	quant8_intra_default, %object
	.size	quant8_intra_default, 64
quant8_intra_default:
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
	.type	quant8_inter_default, %object
	.size	quant8_inter_default, 256
quant8_inter_default:
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
	.type	g_NalTypeEOPIC, %object
	.size	g_NalTypeEOPIC, 12
g_NalTypeEOPIC:
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
	.type	g_CabacMN, %object
	.size	g_CabacMN, 5120
g_CabacMN:
	.word	388044546
	.word	352326208
	.word	153820416
	.word	721207
	.word	4522025
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	521477919
	.word	422707200
	.word	0
	.word	0
	.word	87683918
	.word	-180289218
	.word	17367089
	.word	-613020375
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	21230414
	.word	-180289218
	.word	440602714
	.word	157864575
	.word	-328728576
	.word	0
	.word	0
	.word	0
	.word	204602441
	.word	288553558
	.word	-278922691
	.word	154007875
	.word	-78971830
	.word	-78579384
	.word	20578304
	.word	0
	.word	-45745583
	.word	-178256329
	.word	121895766
	.word	39321658
	.word	-45287842
	.word	87426117
	.word	-45023144
	.word	0
	.word	370745856
	.word	268442146
	.word	320219136
	.word	721207
	.word	4522025
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	521477919
	.word	422707200
	.word	0
	.word	0
	.word	37878343
	.word	-212925132
	.word	-32963543
	.word	-478802647
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-62064057
	.word	-212925132
	.word	956442916
	.word	440783743
	.word	-245039104
	.word	0
	.word	0
	.word	0
	.word	154336582
	.word	171312709
	.word	-212205516
	.word	137101122
	.word	-11730618
	.word	-27854008
	.word	3997696
	.word	0
	.word	-28968110
	.word	-161480133
	.word	38534487
	.word	-43777736
	.word	-45417899
	.word	3931473
	.word	-111740065
	.word	0
	.word	487594240
	.word	234886184
	.word	336207104
	.word	721207
	.word	4522025
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	521477919
	.word	422707200
	.word	0
	.word	0
	.word	437320789
	.word	-395967175
	.word	-164364994
	.word	-446493399
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-28640171
	.word	-395967175
	.word	905979178
	.word	207741055
	.word	-361431040
	.word	0
	.word	0
	.word	0
	.word	104460105
	.word	238680669
	.word	-229049812
	.word	70714167
	.word	-61866421
	.word	-194905806
	.word	20709376
	.word	0
	.word	-178654873
	.word	-344714439
	.word	339346516
	.word	106955071
	.word	-78253206
	.word	88016459
	.word	-44368027
	.word	0
	.word	388044546
	.word	352326208
	.word	153820416
	.word	3013710
	.word	-44040151
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	203950899
	.word	238747648
	.word	0
	.word	0
	.word	87683918
	.word	-180289218
	.word	17367089
	.word	-613020375
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	21230414
	.word	-180289218
	.word	440602714
	.word	157864575
	.word	-328728576
	.word	0
	.word	0
	.word	0
	.word	204602441
	.word	288553558
	.word	-278922691
	.word	154007875
	.word	-78971830
	.word	-78579384
	.word	20578304
	.word	0
	.word	-45745583
	.word	-178256329
	.word	121895766
	.word	39321658
	.word	-45287842
	.word	87426117
	.word	-45023144
	.word	0
	.word	370745856
	.word	268442146
	.word	320219136
	.word	219088691
	.word	38797353
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	421532977
	.word	355860480
	.word	0
	.word	0
	.word	37878343
	.word	-212925132
	.word	-32963543
	.word	-478802647
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-62064057
	.word	-212925132
	.word	956442916
	.word	440783743
	.word	-245039104
	.word	0
	.word	0
	.word	0
	.word	154336582
	.word	171312709
	.word	-212205516
	.word	137101122
	.word	-11730618
	.word	-27854008
	.word	3997696
	.word	0
	.word	-28968110
	.word	-161480133
	.word	38534487
	.word	-43777736
	.word	-45417899
	.word	3931473
	.word	-111740065
	.word	0
	.word	487594240
	.word	234886184
	.word	336207104
	.word	119732056
	.word	-327221207
	.word	4128831
	.word	4128768
	.word	0
	.word	351339062
	.word	55239807
	.word	-378996171
	.word	-13236429
	.word	354489138
	.word	289210368
	.word	0
	.word	0
	.word	437320789
	.word	-395967175
	.word	-164364994
	.word	-446493399
	.word	54458195
	.word	72745057
	.word	-112721920
	.word	0
	.word	-28640171
	.word	-395967175
	.word	905979178
	.word	207741055
	.word	-361431040
	.word	0
	.word	0
	.word	0
	.word	104460105
	.word	238680669
	.word	-229049812
	.word	70714167
	.word	-61866421
	.word	-194905806
	.word	20709376
	.word	0
	.word	-178654873
	.word	-344714439
	.word	339346516
	.word	106955071
	.word	-78253206
	.word	88016459
	.word	-44368027
	.word	0
	.word	-276827290
	.word	5437770
	.word	-345250433
	.word	-511711105
	.word	-295705217
	.word	-344792449
	.word	0
	.word	0
	.word	-277089165
	.word	-260377229
	.word	-45614550
	.word	-80544458
	.word	-29491142
	.word	20971080
	.word	-11864229
	.word	0
	.word	-111282857
	.word	-45221049
	.word	-62915516
	.word	-195757762
	.word	-113178563
	.word	87621186
	.word	20971581
	.word	-28442624
	.word	402657033
	.word	135859474
	.word	252251411
	.word	170200082
	.word	102568993
	.word	253625389
	.word	20578366
	.word	121438208
	.word	-94504364
	.word	-129040318
	.word	-12124098
	.word	-29557189
	.word	-78906050
	.word	-63244478
	.word	-11599801
	.word	54788096
	.word	252053011
	.word	118492174
	.word	302845195
	.word	219090704
	.word	202837271
	.word	252972570
	.word	237769000
	.word	288292864
	.word	-197132732
	.word	-246090904
	.word	-79430885
	.word	-47710676
	.word	3076160
	.word	-129698226
	.word	-95553962
	.word	0
	.word	20055860
	.word	170065964
	.word	187040045
	.word	3015980
	.word	521208115
	.word	120724499
	.word	270601790
	.word	0
	.word	203819821
	.word	254217002
	.word	220991533
	.word	204016177
	.word	505549354
	.word	171381043
	.word	288227417
	.word	0
	.word	170719550
	.word	254021160
	.word	270208029
	.word	19665956
	.word	304088362
	.word	19925566
	.word	288229696
	.word	0
	.word	403772693
	.word	420880155
	.word	371004195
	.word	238160441
	.word	121634381
	.word	-61670050
	.word	155579501
	.word	0
	.word	-45680547
	.word	-161815937
	.word	-195235529
	.word	-163775938
	.word	-62786487
	.word	-129173168
	.word	-145166482
	.word	0
	.word	-210964124
	.word	-211422373
	.word	-195103144
	.word	-262867370
	.word	-111938729
	.word	-312606394
	.word	4782922
	.word	305856512
	.word	451745519
	.word	451878631
	.word	485237225
	.word	635773417
	.word	686040815
	.word	569714929
	.word	704259585
	.word	688979968
	.word	-194448031
	.word	-262080168
	.word	-128583339
	.word	-145362088
	.word	71499085
	.word	-45286836
	.word	171638604
	.word	-11337728
	.word	618472670
	.word	551953890
	.word	752886510
	.word	586230001
	.word	569975803
	.word	553657858
	.word	554506019
	.word	221904896
	.word	-11863455
	.word	-111416193
	.word	-178131884
	.word	-179307959
	.word	-62196906
	.word	-211749535
	.word	-311099392
	.word	0
	.word	-127471260
	.word	6225920
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	519707395
	.word	437649408
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-110890401
	.word	39780352
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	503126528
	.word	371064832
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-63374510
	.word	-112399747
	.word	-129041631
	.word	-63898059
	.word	-46206137
	.word	-162532266
	.word	-212143519
	.word	0
	.word	-62193080
	.word	-179569337
	.word	254735173
	.word	4063297
	.word	354808136
	.word	154734646
	.word	4066376
	.word	0
	.word	636494844
	.word	653797117
	.word	620963333
	.word	704652048
	.word	655756848
	.word	455415100
	.word	205783649
	.word	0
	.word	5045066
	.word	4650315
	.word	21233729
	.word	-230096066
	.word	71237444
	.word	-213185737
	.word	88083526
	.word	0
	.word	536421361
	.word	587014659
	.word	620700165
	.word	537600773
	.word	571221771
	.word	505225754
	.word	489100098
	.word	0
	.word	0
	.word	0
	.word	-45351145
	.word	19005739
	.word	3604023
	.word	3998016
	.word	4519772
	.word	0
	.word	-277287824
	.word	-294455979
	.word	-245566887
	.word	-431492783
	.word	-229638076
	.word	-230234056
	.word	-381360078
	.word	-179699712
	.word	401808115
	.word	686895602
	.word	738405638
	.word	740434230
	.word	324141056
	.word	0
	.word	0
	.word	0
	.word	-227871903
	.word	-245697446
	.word	-296159671
	.word	-145755562
	.word	-162924986
	.word	-163185854
	.word	-146736326
	.word	37421056
	.word	368449781
	.word	486022399
	.word	486743305
	.word	588520740
	.word	239271936
	.word	0
	.word	0
	.word	0
	.word	-444668830
	.word	-412751549
	.word	-464327586
	.word	-262935954
	.word	-346296730
	.word	-211950721
	.word	0
	.word	0
	.word	-111346855
	.word	-111086740
	.word	-95617492
	.word	2949172
	.word	-46072261
	.word	-62456757
	.word	-128782490
	.word	0
	.word	-27919794
	.word	-11798195
	.word	37094706
	.word	-45874894
	.word	103480401
	.word	20970566
	.word	4391481
	.word	-28573696
	.word	186384936
	.word	53215281
	.word	3015212
	.word	36896815
	.word	69665342
	.word	103678006
	.word	53871162
	.word	71237632
	.word	-211095446
	.word	-162010254
	.word	-294718878
	.word	-361829526
	.word	-295179413
	.word	-378739088
	.word	-161418145
	.word	-77922304
	.word	235604750
	.word	151720459
	.word	352917502
	.word	552673521
	.word	585836521
	.word	719268321
	.word	786704116
	.word	354222080
	.word	-47251647
	.word	-12978339
	.word	-145947880
	.word	2752560
	.word	3668539
	.word	-112724909
	.word	-178789769
	.word	0
	.word	186844224
	.word	20777763
	.word	303631384
	.word	220007716
	.word	-161613495
	.word	-28766930
	.word	154270052
	.word	0
	.word	104007225
	.word	120915508
	.word	104270637
	.word	237242421
	.word	-11401417
	.word	-45215954
	.word	371195732
	.word	0
	.word	-144840098
	.word	-78247613
	.word	-61802923
	.word	-12187844
	.word	154797373
	.word	204607282
	.word	305205558
	.word	0
	.word	770192851
	.word	820396501
	.word	736962550
	.word	503910938
	.word	337313849
	.word	-229442741
	.word	-312353411
	.word	0
	.word	-45418660
	.word	-128456322
	.word	20643101
	.word	-14417626
	.word	36436535
	.word	3801152
	.word	-45418918
	.word	0
	.word	154468917
	.word	87424573
	.word	3670072
	.word	-213910724
	.word	-12712903
	.word	-96140231
	.word	237438003
	.word	222560256
	.word	419897081
	.word	469965828
	.word	536879871
	.word	503717382
	.word	537468691
	.word	437983774
	.word	622074914
	.word	289800192
	.word	170460974
	.word	-13433039
	.word	137627945
	.word	103744055
	.word	220793388
	.word	103941429
	.word	221316159
	.word	104857600
	.word	452992000
	.word	536615686
	.word	570957322
	.word	404103443
	.word	371202591
	.word	355015212
	.word	388960321
	.word	239534080
	.word	87426620
	.word	104531525
	.word	4652061
	.word	85919530
	.word	20708922
	.word	-45548207
	.word	-178192384
	.word	0
	.word	54526269
	.word	155123712
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	21169467
	.word	155385856
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-28967365
	.word	105250816
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	138151487
	.word	289472512
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-13631420
	.word	-62523304
	.word	3803141
	.word	168693266
	.word	219873832
	.word	3865926
	.word	-95422379
	.word	0
	.word	120721447
	.word	86770740
	.word	187759420
	.word	-12910533
	.word	371262764
	.word	237764430
	.word	3934533
	.word	0
	.word	270406176
	.word	304289309
	.word	404690726
	.word	304813097
	.word	188680507
	.word	155254622
	.word	-27658388
	.word	0
	.word	170658079
	.word	204145461
	.word	237111846
	.word	-46920408
	.word	287311660
	.word	119934258
	.word	171514411
	.word	0
	.word	353900308
	.word	437721888
	.word	471276568
	.word	388503584
	.word	471668522
	.word	322508341
	.word	373099350
	.word	0
	.word	0
	.word	0
	.word	-96274141
	.word	-114624467
	.word	-80677832
	.word	-96666818
	.word	-129828788
	.word	0
	.word	-61867705
	.word	-79300794
	.word	-129829308
	.word	-313920443
	.word	-263786173
	.word	-331420346
	.word	-264050111
	.word	-331415552
	.word	167647991
	.word	569845753
	.word	704523523
	.word	822684955
	.word	607846400
	.word	0
	.word	0
	.word	0
	.word	-78251439
	.word	-162662063
	.word	-279908791
	.word	-62196141
	.word	-146278589
	.word	-12715966
	.word	-230555589
	.word	37421056
	.word	368255474
	.word	670641918
	.word	855784454
	.word	1024538402
	.word	708706304
	.word	0
	.word	0
	.word	0
	.word	-645927333
	.word	-278862255
	.word	-580720538
	.word	-379460233
	.word	-396104850
	.word	-295248769
	.word	0
	.word	0
	.word	5307225
	.word	-111215524
	.word	-378474169
	.word	-113442763
	.word	-79497907
	.word	-145688748
	.word	-162013569
	.word	0
	.word	-211291301
	.word	-145100196
	.word	-129174441
	.word	-378607511
	.word	-162599824
	.word	-278678913
	.word	-1166029185
	.word	-763428864
	.word	70060572
	.word	169812469
	.word	886379023
	.word	469771242
	.word	652681728
	.word	669917428
	.word	1721892864
	.word	955318272
	.word	-344004228
	.word	-328276354
	.word	-411242647
	.word	-444996235
	.word	-278469003
	.word	-445325446
	.word	-161484188
	.word	-127991808
	.word	335155962
	.word	234887924
	.word	535831015
	.word	568993252
	.word	669133538
	.word	802565596
	.word	836643311
	.word	537460736
	.word	2555969
	.word	-246096513
	.word	-345637593
	.word	-80348867
	.word	-179572403
	.word	-279189653
	.word	-412097414
	.word	0
	.word	-62719154
	.word	-62392248
	.word	37486391
	.word	-112788917
	.word	-128328073
	.word	-45408236
	.word	504812671
	.word	0
	.word	570170634
	.word	637219811
	.word	670512350
	.word	1170621377
	.word	754655239
	.word	937631745
	.word	6948
	.word	0
	.word	-277879694
	.word	-94765488
	.word	-61671595
	.word	-128843960
	.word	88080707
	.word	154665029
	.word	21301061
	.word	0
	.word	1169768385
	.word	1119899062
	.word	920204509
	.word	703996928
	.word	687808014
	.word	471471909
	.word	204933953
	.word	0
	.word	-28707736
	.word	-144973441
	.word	-179505620
	.word	-164301255
	.word	-147132344
	.word	-112853947
	.word	-78973098
	.word	0
	.word	3603261
	.word	3866428
	.word	-46270397
	.word	-413863350
	.word	-79624908
	.word	37290045
	.word	-146410170
	.word	305594368
	.word	568795874
	.word	618931940
	.word	652550894
	.word	602940146
	.word	553133562
	.word	587210250
	.word	470948377
	.word	489226240
	.word	-112854461
	.word	-263324096
	.word	37616195
	.word	-46136775
	.word	-46006974
	.word	4065587
	.word	-12386745
	.word	-28639232
	.word	635381724
	.word	685450978
	.word	786377442
	.word	686305763
	.word	653535478
	.word	654126843
	.word	521411870
	.word	422313984
	.word	53937976
	.word	121047101
	.word	37943074
	.word	18877215
	.word	87359031
	.word	-29163447
	.word	-128385024
	.word	0
	.word	-62455750
	.word	121438208
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	4915784
	.word	139264000
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-12126392
	.word	238813184
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	204475185
	.word	439156736
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-46858172
	.word	-112527528
	.word	53741316
	.word	168300808
	.word	269681445
	.word	-12715191
	.word	-12125106
	.word	0
	.word	153686553
	.word	153093419
	.word	154075180
	.word	3342894
	.word	321322050
	.word	254151722
	.word	153223257
	.word	0
	.word	237179423
	.word	287511838
	.word	288166954
	.word	304945946
	.word	271976258
	.word	272108361
	.word	172226164
	.word	0
	.word	270860335
	.word	304286501
	.word	204016169
	.word	36703273
	.word	220790843
	.word	53613352
	.word	54661682
	.word	0
	.word	370546454
	.word	454369556
	.word	438050328
	.word	455217706
	.word	421990962
	.word	205919542
	.word	239536979
	.word	0
	.word	0
	.word	0
	.word	-79233000
	.word	-14352854
	.word	-30083271
	.word	-96469951
	.word	-62654126
	.word	0
	.word	-78251439
	.word	-162662063
	.word	-279908791
	.word	-62196141
	.word	-146278589
	.word	-12715966
	.word	-230555589
	.word	37421056
	.word	301342963
	.word	720843259
	.word	889208835
	.word	1141522971
	.word	792264704
	.word	0
	.word	0
	.word	0
	.word	-44958388
	.word	-112657842
	.word	-196545980
	.word	-45680052
	.word	-79496386
	.word	3800125
	.word	-147062474
	.word	37355520
	.word	301342963
	.word	720843259
	.word	889208835
	.word	1141522971
	.word	792264704
	.word	0
	.word	0
	.word	0
	.word	-595595429
	.word	-228595884
	.word	-413731751
	.word	-279191169
	.word	-229839257
	.word	-212149377
	.word	0
	.word	0
	.word	189793612
	.word	39060814
	.word	-395056558
	.word	-146931659
	.word	3928661
	.word	-212208802
	.word	-178461825
	.word	0
	.word	-61410216
	.word	-78447288
	.word	-62654392
	.word	-262539451
	.word	-12909246
	.word	70908999
	.word	-28900806
	.word	-11927552
	.word	69664810
	.word	119671581
	.word	136250917
	.word	120193832
	.word	136383787
	.word	220464175
	.word	53936698
	.word	104595456
	.word	-360716417
	.word	-411507329
	.word	-311236235
	.word	-411638155
	.word	-395189130
	.word	-512173188
	.word	-161549978
	.word	-161284096
	.word	301142263
	.word	301210603
	.word	635578840
	.word	718745809
	.word	669003480
	.word	885862103
	.word	886647789
	.word	537591808
	.word	-97057731
	.word	-229385345
	.word	-345705927
	.word	-196872889
	.word	-162665643
	.word	-262608536
	.word	-245179521
	.word	0
	.word	-64159931
	.word	4127027
	.word	-63964630
	.word	-47580619
	.word	139261774
	.word	-179107532
	.word	4455258
	.word	0
	.word	137104172
	.word	237635376
	.word	70779956
	.word	220530993
	.word	322570800
	.word	204275781
	.word	337709119
	.word	0
	.word	-211104129
	.word	-77852359
	.word	-78187682
	.word	-195297715
	.word	4718409
	.word	71366993
	.word	88084281
	.word	0
	.word	1036597458
	.word	1053708733
	.word	770450430
	.word	470753793
	.word	654384657
	.word	338039341
	.word	255197263
	.word	0
	.word	-78645912
	.word	-178527617
	.word	-162334672
	.word	-130156478
	.word	-112790965
	.word	-162531501
	.word	-195236244
	.word	0
	.word	21229896
	.word	-78907312
	.word	-346821824
	.word	-216012992
	.word	-480376501
	.word	289405002
	.word	-81527269
	.word	224067584
	.word	602808807
	.word	486348810
	.word	452993778
	.word	886319080
	.word	319889177
	.word	605886497
	.word	571416084
	.word	373882880
	.word	21168196
	.word	-163380924
	.word	5046848
	.word	4520782
	.word	121046331
	.word	37817910
	.word	254543164
	.word	38141952
	.word	619718130
	.word	636428289
	.word	571415823
	.word	404300310
	.word	521151250
	.word	521937193
	.word	605821743
	.word	356384768
	.word	4324943
	.word	4783196
	.word	-61871547
	.word	-263455174
	.word	20640590
	.word	-145490863
	.word	-211615744
	.word	0
	.word	54655301
	.word	139264000
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	337777439
	.word	455868416
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-28512682
	.word	205914112
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	304026394
	.word	605552640
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-96992444
	.word	-129502366
	.word	-212731354
	.word	-213976518
	.word	-29626295
	.word	-162729130
	.word	-145492393
	.word	0
	.word	-163445954
	.word	-45814703
	.word	1966343
	.word	-48764086
	.word	272820604
	.word	287649006
	.word	853469823
	.word	0
	.word	319819556
	.word	254022940
	.word	420814356
	.word	520887056
	.word	405405789
	.word	238554937
	.word	438757503
	.word	0
	.word	88142918
	.word	188155192
	.word	4522561
	.word	-95812298
	.word	121043532
	.word	-179110323
	.word	-28501718
	.word	0
	.word	404167440
	.word	404627229
	.word	371791402
	.word	272371508
	.word	238814030
	.word	-260369099
	.word	372775229
	.word	0
	.word	0
	.word	0
	.word	-146278107
	.word	-131271375
	.word	-164039621
	.word	-130025661
	.word	-96143793
	.word	0
	.word	-45156278
	.word	-146213304
	.word	-297012153
	.word	-180356282
	.word	-280235448
	.word	-263981003
	.word	-230951116
	.word	-180092928
	.word	167649014
	.word	536617471
	.word	554114828
	.word	622272294
	.word	339738624
	.word	0
	.word	0
	.word	0
	.word	-45156278
	.word	-146213304
	.word	-297012153
	.word	-180356282
	.word	-280235448
	.word	-263981003
	.word	-230951116
	.word	-180092928
	.word	167649014
	.word	536617471
	.word	554114828
	.word	622272294
	.word	339738624
	.word	0
	.word	0
	.word	0
	.type	CalcZeroNum, %object
	.size	CalcZeroNum, 256
CalcZeroNum:
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
	.type	g_AspecRatioIdc, %object
	.size	g_AspecRatioIdc, 112
g_AspecRatioIdc:
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
.LC2:
	ASCII(.string	"list[%d][%d]: frame_num=%d, poc=%d\n" )
	.zero	4
.LC4:
	ASCII(.string	"L0: " )
	.zero	3
.LC6:
	ASCII(.string	"\n" )
	.zero	6
.LC8:
	ASCII(.string	"%d " )
	.zero	4
.LC10:
	ASCII(.string	"%dt " )
	.zero	3
.LC12:
	ASCII(.string	"%db " )
	.zero	3
.LC14:
	ASCII(.string	"L1:" )
	.zero	4
.LC16:
	ASCII(.string	"\n\nEND of the bit buffer, copy the first packet!\n\n" )
	.zero	6
.LC18:
	ASCII(.string	"0:phy:0x%x, 1:phy:0x%x; len0:%d len1:%d\n" )
	.zero	7
.LC21:
	ASCII(.string	"0:phy:0x%x, len0:%d\n" )
	.zero	3
.LC23:
	ASCII(.string	"%-50s%50d\n" )
	.zero	5
.LC30:
	ASCII(.string	"frame %d, state=%d, is already output\n" )
	.zero	1
.LC32:
	ASCII(.string	"plfs(fs=%p, eFoState=%d) is null, logic_fs_id = %d\n" )
	.zero	4
.LC34:
	ASCII(.string	"not used frame: (%d,%d)\n" )
	.zero	7
.LC36:
	ASCII(.string	"frame skip: is_used=%d,skip=%d\n" )
.LC38:
	ASCII(.string	"topfield skip: is_used=%d,skip=%d\n" )
	.zero	5
.LC40:
	ASCII(.string	"bottom field skip: is_used=%d,skip=%d\n" )
	.zero	1
.LC42:
	ASCII(.string	"err(%d) > out_thr(%d)\n" )
	.zero	1
.LC44:
	ASCII(.string	"exg_pts: %lld <-> %lld\n" )
.LC47:
	ASCII(.string	"stream frame packing type is %d! what can we do?\n" )
	.zero	6
.LC50:
	ASCII(.string	"firmware/common/syntax/h264.c" )
	.zero	2
.LC52:
	ASCII(.string	"NULL pointer: %s, L%d\n" )
	.zero	1
.LC54:
	ASCII(.string	"framestore %d allocate apc %d\n" )
	.zero	1
.LC56:
	ASCII(.string	"find APC, but logic_fs_id %d abnormal(ref=%d,plfs=%p, pdfs=%p)\n" )
.LC60:
	ASCII(.string	"pH264Ctx->DPB.fs[%d]: frame_num=%d poc=%d is_reference=%d\n" )
	.zero	5
.LC62:
	ASCII(.string	"pH264Ctx->DPB.fs_ref[%d]: frame_num=%d poc=%d is_reference=%d\n" )
	.zero	1
.LC64:
	ASCII(.string	"pH264Ctx->DPB.fs_ref[%d]: frame.poc=%d \n" )
	.zero	7
.LC68:
	ASCII(.string	"\n VFMW ** release streambuff=%p   bitstream_length=%d\n" )
	.zero	1
.LC70:
	ASCII(.string	"clear curr slice.\n" )
	.zero	5
.LC75:
	ASCII(.string	"image size abnormal(%dx%d)\n" )
	.zero	4
.LC77:
	ASCII(.string	"resolution error, ImageWidth=%d, ImageHeight=%d\n" )
	.zero	7
.LC79:
	ASCII(.string	"partition fs memory fail!\n" )
	.zero	5
.LC81:
	ASCII(.string	"ERROR: FSP_ConfigInstance fail!\n" )
	.zero	7
.LC83:
	ASCII(.string	"slice_type %d invalid, clear current slice.\n" )
	.zero	3
.LC85:
	ASCII(.string	"pRepairPic(%p)/found(%d) = 0, clear current slice.\n" )
	.zero	4
.LC87:
	ASCII(.string	"listXsize[%d] = %d, clear current slice.\n" )
	.zero	6
.LC95:
	ASCII(.string	"for P slice size of list equal 0.\n" )
	.zero	5
.LC101:
	ASCII(.string	"for B slice size of two list all equal 0.\n" )
	.zero	5
.LC104:
	ASCII(.string	"init list error.\n" )
	.zero	6
.LC106:
	ASCII(.string	"L0: list after init.\n" )
	.zero	2
.LC109:
	ASCII(.string	"L0: list after reorder.\n" )
	.zero	7
.LC112:
	ASCII(.string	"save pic yuv :  structure = %d;  idc = %d\n" )
	.zero	5
.LC114:
	ASCII(.string	"structure = %d pH264Ctx->CurrPic.pic_width_in_mb = %d pH264Ctx->CurrPic.pic_height_in_mb = %d\n" )
	.zero	1
.LC116:
	ASCII(.string	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=%d\n" )
	.zero	1
.LC118:
	ASCII(.string	"logic frame id(=%d): get LogicFs error!\n" )
	.zero	7
.LC120:
	ASCII(.string	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p\n" )
	.zero	3
.LC124:
	ASCII(.string	"line: %d pstLogicFs is null\n" )
	.zero	3
.LC126:
	ASCII(.string	"SH: first_mb_in_slice" )
	.zero	2
.LC128:
	ASCII(.string	"slicecheck first_mb_in_slice >= MAX_MB_NUM_IN_PIC error.\n" )
	.zero	6
.LC130:
	ASCII(.string	"SH: slice_type" )
	.zero	1
.LC132:
	ASCII(.string	"slice type = %d\n" )
	.zero	7
.LC135:
	ASCII(.string	"slice type = %d, err\n" )
	.zero	2
.LC137:
	ASCII(.string	"slice  pps id = %d\n" )
	.zero	4
.LC139:
	ASCII(.string	"pps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	1
.LC141:
	ASCII(.string	"sps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	1
.LC143:
	ASCII(.string	"tmp slice  pps id = %d\n" )
.LC145:
	ASCII(.string	"PPSSPSCheckTmpId: pps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	7
.LC147:
	ASCII(.string	"PPSSPSCheckTmpId: seq_parameter_set_id out of range.\n" )
	.zero	2
.LC149:
	ASCII(.string	"PPSSPSCheckTmpId: sps with this pic_parameter_set_id = %d havn't decode\n" )
	.zero	7
.LC151:
	ASCII(.string	"new pic flag = %d\n" )
	.zero	5
.LC153:
	ASCII(.string	"SH: ref_pic_list_reordering_flag_l0" )
	.zero	4
.LC155:
	ASCII(.string	"SH: reordering_of_pic_nums_idc_l0" )
	.zero	6
.LC157:
	ASCII(.string	"reorder idc l0 = %d, g_SeErrFlag=%d\n" )
	.zero	3
.LC159:
	ASCII(.string	"SH: abs_diff_pic_num_minus1_l0" )
	.zero	1
.LC161:
	ASCII(.string	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\n" )
	.zero	7
.LC163:
	ASCII(.string	"SH: long_term_pic_idx_l0" )
	.zero	7
.LC165:
	ASCII(.string	"num of idc l0 exceed\n" )
	.zero	2
.LC167:
	ASCII(.string	"SH: ref_pic_list_reordering_flag_l1" )
	.zero	4
.LC169:
	ASCII(.string	"SH: reordering_of_pic_nums_idc_l1" )
	.zero	6
.LC171:
	ASCII(.string	"reorder idc l1 = %d, g_SeErrFlag=%d\n" )
	.zero	3
.LC173:
	ASCII(.string	"SH: abs_diff_pic_num_minus1_l1" )
	.zero	1
.LC175:
	ASCII(.string	"abs_diff_pic_num_minus1_l1 = %d, g_SeErrFlag=%d\n" )
	.zero	7
.LC177:
	ASCII(.string	"SH: long_term_pic_idx_l1" )
	.zero	7
.LC179:
	ASCII(.string	"num of idc l1 exceed\n" )
	.zero	2
.LC181:
	ASCII(.string	"SH: luma_log2_weight_denom" )
	.zero	5
.LC183:
	ASCII(.string	"SH: chroma_log2_weight_denom" )
	.zero	3
.LC185:
	ASCII(.string	"WP log2 exceed  and err flag = %d\n" )
	.zero	5
.LC187:
	ASCII(.string	"SH: luma_weight_flag_l0" )
.LC189:
	ASCII(.string	"SH: luma_weight_l0" )
	.zero	5
.LC191:
	ASCII(.string	"SH: luma_offset_l0" )
	.zero	5
.LC193:
	ASCII(.string	"SH: chroma_weight_flag_l0" )
	.zero	6
.LC195:
	ASCII(.string	"SH: chroma_weight_l0" )
	.zero	3
.LC197:
	ASCII(.string	"SH: chroma_offset_l0" )
	.zero	3
.LC199:
	ASCII(.string	"SH: luma_weight_flag_l1" )
.LC201:
	ASCII(.string	"SH: luma_weight_l1" )
	.zero	5
.LC203:
	ASCII(.string	"SH: luma_offset_l1" )
	.zero	5
.LC205:
	ASCII(.string	"SH: chroma_weight_flag_l1" )
	.zero	6
.LC207:
	ASCII(.string	"SH: chroma_weight_l1" )
	.zero	3
.LC209:
	ASCII(.string	"SH: chroma_offset_l1" )
	.zero	3
.LC211:
	ASCII(.string	"overflow MAX_MMCO_LEN\n" )
	.zero	1
.LC213:
	ASCII(.string	"SH: memory_management_control_operation" )
.LC215:
	ASCII(.string	"SH: difference_of_pic_nums_minus1" )
	.zero	6
.LC217:
	ASCII(.string	"SH: long_term_pic_num" )
	.zero	2
.LC219:
	ASCII(.string	"SH: long_term_frame_idx" )
.LC221:
	ASCII(.string	"SH: max_long_term_frame_idx_plus1" )
	.zero	6
.LC223:
	ASCII(.string	"mmco exceed 6\n" )
	.zero	1
.LC225:
	ASCII(.string	"SH: no_output_of_prior_pics_flag" )
	.zero	7
.LC227:
	ASCII(.string	"SH: long_term_reference_flag" )
	.zero	3
.LC229:
	ASCII(.string	"IDR and no_output_of_prior_pics_flag = %d\n" )
	.zero	5
.LC231:
	ASCII(.string	"SH: adaptive_ref_pic_marking_mode_flag" )
	.zero	1
.LC233:
	ASCII(.string	"adaptive_ref_pic_marking_mode_flag = %d\n" )
	.zero	7
.LC235:
	ASCII(.string	"MMCO para would save dec err\n" )
	.zero	2
.LC237:
	ASCII(.string	"mulitislice diff no_out_of_prior_pics_flag, used first.\n" )
	.zero	7
.LC239:
	ASCII(.string	"mulitislice diff long_term_reference_flag, used first.\n" )
.LC241:
	ASCII(.string	"mulitislice diff adaptive_ref_pic_marking_mode_flag, used first.\n" )
	.zero	6
.LC243:
	ASCII(.string	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\n" )
	.zero	1
.LC245:
	ASCII(.string	"SH: pic_parameter_set_id" )
	.zero	7
.LC247:
	ASCII(.string	"pps id:%d in sliceheader err\n" )
	.zero	2
.LC249:
	ASCII(.string	"PPS or SPS of this slice not valid\n" )
	.zero	4
.LC251:
	ASCII(.string	"recover point but isn't I_SLICE.\n" )
	.zero	6
.LC253:
	ASCII(.string	"SH: frame_num" )
	.zero	2
.LC255:
	ASCII(.string	"IDR NAL but frame_num!=0.\n" )
	.zero	5
.LC257:
	ASCII(.string	"SH: field_pic_flag" )
	.zero	5
.LC259:
	ASCII(.string	"SH: bottom_field_flag" )
	.zero	2
.LC261:
	ASCII(.string	"field first_mb_in_slice bigger than pic size\n" )
	.zero	2
.LC263:
	ASCII(.string	"frame first_mb_in_slice bigger than pic size\n" )
	.zero	2
.LC265:
	ASCII(.string	"SH: idr_pic_id" )
	.zero	1
.LC267:
	ASCII(.string	"idr_pic_id bigger than 65535\n" )
	.zero	2
.LC269:
	ASCII(.string	"SH: pic_order_cnt_lsb" )
	.zero	2
.LC271:
	ASCII(.string	"SH: delta_pic_order_cnt_bottom" )
	.zero	1
.LC273:
	ASCII(.string	"SH: delta_pic_order_cnt[0]" )
	.zero	5
.LC275:
	ASCII(.string	"SH: delta_pic_order_cnt[1]" )
	.zero	5
.LC277:
	ASCII(.string	"SH: redundant_pic_cnt" )
	.zero	2
.LC279:
	ASCII(.string	"redundant pic not support.\n" )
	.zero	4
.LC282:
	ASCII(.string	"first_mb_in_slice in currslice small than prevslice in same pic\n" )
	.zero	7
.LC286:
	ASCII(.string	"SH: direct_spatial_mv_pred_flag" )
.LC288:
	ASCII(.string	"SH: num_ref_idx_override_flag" )
	.zero	2
.LC290:
	ASCII(.string	"SH: num_ref_idx_l0_active_minus1" )
	.zero	7
.LC292:
	ASCII(.string	"SH: num_ref_idx_l1_active_minus1" )
	.zero	7
.LC294:
	ASCII(.string	"frame num_ref_idx_lx_active_minus1 exceed\n" )
	.zero	5
.LC296:
	ASCII(.string	"field num_ref_idx_lx_active_minus1 exceed\n" )
	.zero	5
.LC298:
	ASCII(.string	"reordering para dec err\n" )
	.zero	7
.LC300:
	ASCII(.string	"apply_weights_flag=%d\n" )
	.zero	1
.LC302:
	ASCII(.string	"wpt dec err\n" )
	.zero	3
.LC304:
	ASCII(.string	"mark para dec err\n" )
	.zero	5
.LC306:
	ASCII(.string	"SH: cabac_init_idc" )
	.zero	5
.LC308:
	ASCII(.string	"cabac_init_idc bigger than 3\n" )
	.zero	2
.LC310:
	ASCII(.string	"SH: slice_qp_delta" )
	.zero	5
.LC312:
	ASCII(.string	"SH: disable_deblocking_filter_idc" )
	.zero	6
.LC314:
	ASCII(.string	"disable_deblocking_filter_idc dec err\n" )
	.zero	1
.LC316:
	ASCII(.string	"SH: slice_alpha_c0_offset_div2" )
	.zero	1
.LC318:
	ASCII(.string	"slice_alpha_c0_offset_div2 dec err\n" )
	.zero	4
.LC320:
	ASCII(.string	"SH: slice_beta_offset_div2" )
	.zero	5
.LC322:
	ASCII(.string	"slice_beta_offset_div2 dec err\n" )
.LC324:
	ASCII(.string	"pH264Ctx->pCurrNal->nal_bitoffset = %d; code_len_byte = %d; bitstream_length = %d; pH264Ctx->pCurrNal->nal_trail_zero_bit_num = %d\n" )
	.zero	4
.LC326:
	ASCII(.string	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; bytespos = %x\n" )
	.zero	1
.LC328:
	ASCII(.string	"nal_segment = %d is not expected value\n" )
.LC330:
	ASCII(.string	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\n" )
.LC335:
	ASCII(.string	"   : delta_sl   " )
	.zero	7
.LC339:
	ASCII(.string	"PPS: entropy_coding_mode_flag" )
	.zero	2
.LC341:
	ASCII(.string	"PPS: pic_order_present_flag" )
	.zero	4
.LC343:
	ASCII(.string	"PPS: num_slice_groups_minus1" )
	.zero	3
.LC345:
	ASCII(.string	"Baseline stream with FMO, not support.\n" )
.LC348:
	ASCII(.string	"PPS: num_ref_idx_l0_active_minus1" )
	.zero	6
.LC350:
	ASCII(.string	"num_ref_idx_l0_active_minus1 out of range.\n" )
	.zero	4
.LC352:
	ASCII(.string	"PPS: num_ref_idx_l1_active_minus1" )
	.zero	6
.LC354:
	ASCII(.string	"num_ref_idx_l1_active_minus1 out of range.\n" )
	.zero	4
.LC356:
	ASCII(.string	"PPS: weighted prediction flag" )
	.zero	2
.LC358:
	ASCII(.string	"PPS: weighted_bipred_idc" )
	.zero	7
.LC360:
	ASCII(.string	"weighted_bipred_idc out of range\n" )
	.zero	6
.LC362:
	ASCII(.string	"PPS: pic_init_qp_minus26" )
	.zero	7
.LC364:
	ASCII(.string	"PPS: pic_init_qs_minus26" )
	.zero	7
.LC366:
	ASCII(.string	"PPS: chroma_qp_index_offset" )
	.zero	4
.LC368:
	ASCII(.string	"PPS: deblocking_filter_control_present_flag" )
	.zero	4
.LC370:
	ASCII(.string	"PPS: constrained_intra_pred_flag" )
	.zero	7
.LC372:
	ASCII(.string	"PPS: redundant_pic_cnt_present_flag" )
	.zero	4
.LC374:
	ASCII(.string	"redundant pic not support when find redundant slice later, exit\n" )
	.zero	7
.LC376:
	ASCII(.string	"PPS: transform_8x8_mode_flag" )
	.zero	3
.LC378:
	ASCII(.string	"PPS: pic_scaling_matrix_present_flag" )
	.zero	3
.LC380:
	ASCII(.string	"PPS: second_chroma_qp_index_offset" )
	.zero	5
.LC382:
	ASCII(.string	"SPS: seq_scaling_list_present_flag" )
	.zero	5
.LC385:
	ASCII(.string	"PPS: pic_scaling_list_present_flag" )
	.zero	5
.LC387:
	ASCII(.string	"second_chroma_qp_index_offset out of range.\n" )
	.zero	3
.LC391:
	ASCII(.string	"PPS: pic_parameter_set_id" )
	.zero	6
.LC393:
	ASCII(.string	"pic_parameter_set_id out of range.\n" )
	.zero	4
.LC396:
	ASCII(.string	"PPS: seq_parameter_set_id" )
	.zero	6
.LC398:
	ASCII(.string	"seq_parameter_set_id out of range.\n" )
	.zero	4
.LC400:
	ASCII(.string	"SPS haven't decode.\n" )
	.zero	3
.LC403:
	ASCII(.string	"PPS decode error.\n" )
	.zero	5
.LC406:
	ASCII(.string	"VUI: aspect_ratio_info_present_flag" )
	.zero	4
.LC408:
	ASCII(.string	"VUI: aspect_ratio_idc" )
	.zero	2
.LC410:
	ASCII(.string	"VUI: sar_width" )
	.zero	1
.LC412:
	ASCII(.string	"VUI: sar_height" )
.LC414:
	ASCII(.string	"VUI: overscan_info_present_flag" )
.LC416:
	ASCII(.string	"VUI: overscan_appropriate_flag" )
	.zero	1
.LC418:
	ASCII(.string	"VUI: video_signal_type_present_flag" )
	.zero	4
.LC420:
	ASCII(.string	"VUI: video_format" )
	.zero	6
.LC422:
	ASCII(.string	"VUI: video_full_range_flag" )
	.zero	5
.LC424:
	ASCII(.string	"VUI: color_description_present_flag" )
	.zero	4
.LC426:
	ASCII(.string	"VUI: colour_primaries" )
	.zero	2
.LC428:
	ASCII(.string	"VUI: transfer_characteristics" )
	.zero	2
.LC430:
	ASCII(.string	"VUI: matrix_coefficients" )
	.zero	7
.LC432:
	ASCII(.string	"VUI: chroma_loc_info_present_flag" )
	.zero	6
.LC434:
	ASCII(.string	"VUI: chroma_sample_loc_type_top_field" )
	.zero	2
.LC436:
	ASCII(.string	"VUI: chroma_sample_loc_type_bottom_field" )
	.zero	7
.LC438:
	ASCII(.string	"VUI: timing_info_present_flag" )
	.zero	2
.LC440:
	ASCII(.string	"VUI: num_units_in_tick" )
	.zero	1
.LC442:
	ASCII(.string	"VUI: time_scale" )
.LC444:
	ASCII(.string	"VUI: fixed_frame_rate_flag" )
	.zero	5
.LC446:
	ASCII(.string	"VUI: nal_hrd_parameters_present_flag" )
	.zero	3
.LC448:
	ASCII(.string	"VUI: cpb_cnt_minus1" )
	.zero	4
.LC450:
	ASCII(.string	"VUI: bit_rate_scale" )
	.zero	4
.LC452:
	ASCII(.string	"VUI: cpb_size_scale" )
	.zero	4
.LC454:
	ASCII(.string	"hrd->cpb_cnt_minus1 out of range\n" )
	.zero	6
.LC456:
	ASCII(.string	"VUI: bit_rate_value_minus1" )
	.zero	5
.LC458:
	ASCII(.string	"VUI: cpb_size_value_minus1" )
	.zero	5
.LC460:
	ASCII(.string	"VUI: cbr_flag" )
	.zero	2
.LC462:
	ASCII(.string	"VUI: initial_cpb_removal_delay_length_minus1" )
	.zero	3
.LC464:
	ASCII(.string	"VUI: cpb_removal_delay_length_minus1" )
	.zero	3
.LC466:
	ASCII(.string	"VUI: dpb_output_delay_length_minus1" )
	.zero	4
.LC468:
	ASCII(.string	"VUI: time_offset_length" )
.LC470:
	ASCII(.string	"VUI: vcl_hrd_parameters_present_flag" )
	.zero	3
.LC472:
	ASCII(.string	"VUI: low_delay_hrd_flag" )
.LC474:
	ASCII(.string	"VUI: pic_struct_present_flag" )
	.zero	3
.LC476:
	ASCII(.string	"VUI: bitstream_restriction_flag" )
.LC478:
	ASCII(.string	"VUI: motion_vectors_over_pic_boundaries_flag" )
	.zero	3
.LC480:
	ASCII(.string	"VUI: max_bytes_per_pic_denom" )
	.zero	3
.LC482:
	ASCII(.string	"VUI: max_bits_per_mb_denom" )
	.zero	5
.LC484:
	ASCII(.string	"VUI: log2_max_mv_length_horizontal" )
	.zero	5
.LC486:
	ASCII(.string	"VUI: log2_max_mv_length_vertical" )
	.zero	7
.LC488:
	ASCII(.string	"VUI: num_reorder_frames" )
.LC490:
	ASCII(.string	"VUI: max_dec_frame_buffering" )
	.zero	3
.LC495:
	ASCII(.string	"dar=%d, final_dar=%d\n" )
	.zero	2
.LC501:
	ASCII(.string	"SPS: chroma_format_idc" )
	.zero	1
.LC503:
	ASCII(.string	"pSPS->chroma_format_idc out of range.\n" )
	.zero	1
.LC505:
	ASCII(.string	"SPS: bit_depth_luma_minus8" )
	.zero	5
.LC507:
	ASCII(.string	"bit_depth_luma(%d) not equal 8.\n" )
	.zero	7
.LC510:
	ASCII(.string	"SPS: bit_depth_chroma_minus8" )
	.zero	3
.LC512:
	ASCII(.string	"bit_depth_chroma(%d) not equal 8.\n" )
	.zero	5
.LC514:
	ASCII(.string	"SPS: qpprime_y_zero_trans_bypass_flag" )
	.zero	2
.LC516:
	ASCII(.string	"qpprime_y_zero_trans_bypass_flag not equal 0.\n" )
	.zero	1
.LC518:
	ASCII(.string	"SPS: seq_scaling_matrix_present_flag" )
	.zero	3
.LC522:
	ASCII(.string	"SPS: log2_max_frame_num_minus4" )
	.zero	1
.LC524:
	ASCII(.string	"pSPS->log2_max_frame_num_minus4 out of range.\n" )
	.zero	1
.LC526:
	ASCII(.string	"SPS: pic_order_cnt_type" )
.LC528:
	ASCII(.string	"pSPS->pic_order_cnt_type out of range.\n" )
.LC530:
	ASCII(.string	"SPS: log2_max_pic_order_cnt_lsb_minus4" )
	.zero	1
.LC532:
	ASCII(.string	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of range.\n" )
	.zero	1
.LC534:
	ASCII(.string	"SPS: delta_pic_order_always_zero_flag" )
	.zero	2
.LC536:
	ASCII(.string	"SPS: offset_for_non_ref_pic" )
	.zero	4
.LC538:
	ASCII(.string	"SPS: offset_for_top_to_bottom_field" )
	.zero	4
.LC540:
	ASCII(.string	"SPS: num_ref_frames_in_pic_order_cnt_cycle" )
	.zero	5
.LC542:
	ASCII(.string	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of range.\n" )
	.zero	5
.LC544:
	ASCII(.string	"SPS: offset_for_ref_frame[i]" )
	.zero	3
.LC546:
	ASCII(.string	"SPS: gaps_in_frame_num_value_allowed_flag" )
	.zero	6
.LC548:
	ASCII(.string	"SPS: pic_width_in_mbs_minus1" )
	.zero	3
.LC550:
	ASCII(.string	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\n" )
	.zero	6
.LC552:
	ASCII(.string	"SPS: pic_height_in_map_units_minus1" )
	.zero	4
.LC554:
	ASCII(.string	"SPS: frame_mbs_only_flag" )
	.zero	7
.LC556:
	ASCII(.string	"pSPS->pic_height_in_map_units_minus1 out of range.\n" )
	.zero	4
.LC558:
	ASCII(.string	"pic size too large.\n" )
	.zero	3
.LC561:
	ASCII(.string	"level_idc %d not support.\n" )
	.zero	5
.LC563:
	ASCII(.string	"dpb size according level : %d\n" )
	.zero	1
.LC565:
	ASCII(.string	"pSPS->num_ref_frames(%d) > DPB size(%d), try to select the reasonable one.\n" )
	.zero	4
.LC567:
	ASCII(.string	"SPS: direct_8x8_inference_flag" )
	.zero	1
.LC569:
	ASCII(.string	"SPS: frame_cropping_flag" )
	.zero	7
.LC571:
	ASCII(.string	"SPS: frame_cropping_rect_left_offset" )
	.zero	3
.LC573:
	ASCII(.string	"SPS: frame_cropping_rect_right_offset" )
	.zero	2
.LC575:
	ASCII(.string	"SPS: frame_cropping_rect_top_offset" )
	.zero	4
.LC577:
	ASCII(.string	"SPS: frame_cropping_rect_bottom_offset" )
	.zero	1
.LC579:
	ASCII(.string	"SPS: vui_parameters_present_flag" )
	.zero	7
.LC581:
	ASCII(.string	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\n" )
	.zero	2
.LC583:
	ASCII(.string	"SPS: num_ref_frames" )
	.zero	4
.LC585:
	ASCII(.string	"SPS: mb_adaptive_frame_field_flag" )
	.zero	6
.LC587:
	ASCII(.string	"SPS_SVC_EXT: inter_layer_deblocking_filter_control_present_flag" )
.LC589:
	ASCII(.string	"inter_layer_present_flag:%d!\n" )
	.zero	2
.LC591:
	ASCII(.string	"SPS_SVC_EXT: extended_spatial_scalability_idc" )
	.zero	2
.LC593:
	ASCII(.string	"spatial scalability not support!!\n" )
	.zero	5
.LC595:
	ASCII(.string	"SPS_SVC_EXT: chroma_phase_x_plus1_flag" )
	.zero	1
.LC597:
	ASCII(.string	"chroma_phase_x_plus1_flag:%d!!\n" )
.LC599:
	ASCII(.string	"SPS_SVC_EXT: chroma_phase_y_plus1" )
	.zero	6
.LC601:
	ASCII(.string	"chroma_phase_y_plus1:%d!\n" )
	.zero	6
.LC603:
	ASCII(.string	"SPS_SVC_EXT: seq_tcoeff_level_prediction_flag" )
	.zero	2
.LC605:
	ASCII(.string	"SPS_SVC_EXT: adaptive_tcoeff_level_prediction_flag" )
	.zero	5
.LC607:
	ASCII(.string	"adaptive_tcoeff_level_prediction_flag:%d!\n" )
	.zero	5
.LC609:
	ASCII(.string	"SPS_SVC_EXT: slice_header_restriction_flag" )
	.zero	5
.LC611:
	ASCII(.string	"slice_header_restriction_flag error:%d,%x,%d\n" )
	.zero	2
.LC613:
	ASCII(.string	"SPS: profile_idc" )
	.zero	7
.LC615:
	ASCII(.string	"SPS: constrained_set0_flag" )
	.zero	5
.LC617:
	ASCII(.string	"SPS: constrained_set1_flag" )
	.zero	5
.LC619:
	ASCII(.string	"SPS: constrained_set2_flag" )
	.zero	5
.LC621:
	ASCII(.string	"SPS: constrained_set3_flag" )
	.zero	5
.LC623:
	ASCII(.string	"SPS: reserved_zero_4bits" )
	.zero	7
.LC625:
	ASCII(.string	"SPS: level_idc" )
	.zero	1
.LC627:
	ASCII(.string	"SPS: seq_parameter_set_id" )
	.zero	6
.LC632:
	ASCII(.string	"Baseline stream, try to decode, exit when FMO occurred.\n" )
	.zero	7
.LC634:
	ASCII(.string	"EXTENDED stream, try to decode, exit when datapartition occurred.\n" )
	.zero	5
.LC636:
	ASCII(.string	"others High profile stream, try to decode, exit when high profile not support occurred.\n" )
	.zero	7
.LC638:
	ASCII(.string	"profile_idc = %5d error, try to decode as main profile.\n" )
	.zero	7
.LC640:
	ASCII(.string	"level_idc = %5d error, try to decode as level_idc %d.\n" )
	.zero	1
.LC643:
	ASCII(.string	"Line %d: SPS[%d] decode error.\n" )
.LC646:
	ASCII(.string	"svc ext error:\n" )
.LC649:
	ASCII(.string	"SEI: frame_packing_arrangement_id" )
	.zero	6
.LC651:
	ASCII(.string	"SEI: frame_packing_arrangement_cancel_flag" )
	.zero	5
.LC653:
	ASCII(.string	"SEI: frame_packing_arrangement_type" )
	.zero	4
.LC655:
	ASCII(.string	"SEI: quincunx_sampling_flag" )
	.zero	4
.LC657:
	ASCII(.string	"SEI: content_interpretation_type" )
	.zero	7
.LC659:
	ASCII(.string	"SEI: spatial_flipping_flag" )
	.zero	5
.LC661:
	ASCII(.string	"SEI: frame0_flipped_flag" )
	.zero	7
.LC663:
	ASCII(.string	"SEI: field_views_flag" )
	.zero	2
.LC665:
	ASCII(.string	"SEI: current_frame_is_frame0_flag" )
	.zero	6
.LC667:
	ASCII(.string	"SEI: frame0_self_contained_flag" )
.LC669:
	ASCII(.string	"SEI: frame1_self_contained_flag" )
.LC671:
	ASCII(.string	"SEI: frame0_grid_position_x" )
	.zero	4
.LC673:
	ASCII(.string	"SEI: frame0_grid_position_y" )
	.zero	4
.LC675:
	ASCII(.string	"SEI: frame1_grid_position_x" )
	.zero	4
.LC677:
	ASCII(.string	"SEI: frame1_grid_position_y" )
	.zero	4
.LC679:
	ASCII(.string	"SEI: frame_packing_arrangement_reserved_byte" )
	.zero	3
.LC681:
	ASCII(.string	"SEI: frame_packing_arrangement_repetition_period" )
	.zero	7
.LC683:
	ASCII(.string	"SEI: frame_packing_arrangement_extension_flag" )
	.zero	2
.LC685:
	ASCII(.string	"DecPicTimingSEI but SPS is invalid.\n" )
	.zero	3
.LC687:
	ASCII(.string	"SEI: cpb_removal_delay" )
	.zero	1
.LC689:
	ASCII(.string	"SEI: dpb_output_delay" )
	.zero	2
.LC692:
	ASCII(.string	"pic_struct" )
	.zero	5
.LC695:
	ASCII(.string	"SEI nal dec payload type err\n" )
	.zero	2
.LC697:
	ASCII(.string	"SEI nal dec payloadSize err\n" )
	.zero	3
.LC700:
	ASCII(.string	"SEI_BUFFERING_PERIOD,offset = %d,payload_size = %d \n" )
	.zero	3
.LC703:
	ASCII(.string	"PassBytes err [%s][%d]\n" )
.LC705:
	ASCII(.string	"SEI_PIC_TIMING,offset = %d,payload_size = %d \n" )
	.zero	1
.LC707:
	ASCII(.string	"SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d \n" )
	.zero	6
.LC709:
	ASCII(.string	"SEI_FILLER_PAYLOAD,offset = %d,payload_size = %d \n" )
	.zero	5
.LC711:
	ASCII(.string	"SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d, payload_size = %d \n" )
	.zero	3
.LC713:
	ASCII(.string	"SEI_USER_DATA_UNREGISTERED, offset = %d, payload_size = %d \n" )
	.zero	3
.LC715:
	ASCII(.string	"SEI: itu_t_t35_country_code" )
	.zero	4
.LC717:
	ASCII(.string	"SEI: itu_t_t35_country_code_extension_byte" )
	.zero	5
.LC719:
	ASCII(.string	"SEI: itu_t_t35_provider_code" )
	.zero	3
.LC722:
	ASCII(.string	"len_tmp = %d cann't dec usrdata\n" )
	.zero	7
.LC724:
	ASCII(.string	"cann't dec usrdata\n" )
	.zero	4
.LC726:
	ASCII(.string	"SEI_RECOVERY_POINT,offset = %d,payload_size = %d \n" )
	.zero	5
.LC728:
	ASCII(.string	"SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d,payload_size = %d \n" )
	.zero	5
.LC730:
	ASCII(.string	"SEI_SPARE_PIC,offset = %d,payload_size = %d \n" )
	.zero	2
.LC732:
	ASCII(.string	"SEI_SCENE_INFO,offset = %d,payload_size = %d \n" )
	.zero	1
.LC734:
	ASCII(.string	"SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d \n" )
	.zero	7
.LC736:
	ASCII(.string	"SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	6
.LC738:
	ASCII(.string	"SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	4
.LC740:
	ASCII(.string	"SEI_FULL_FRAME_FREEZE,offset = %d,payload_size = %d \n" )
	.zero	2
.LC742:
	ASCII(.string	"SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,payload_size = %d \n" )
	.zero	2
.LC744:
	ASCII(.string	"SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_size = %d \n" )
.LC746:
	ASCII(.string	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset = %d,payload_size = %d \n" )
	.zero	7
.LC748:
	ASCII(.string	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset = %d,payload_size = %d \n" )
	.zero	1
.LC750:
	ASCII(.string	"SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset = %d,payload_size = %d \n" )
	.zero	1
.LC752:
	ASCII(.string	"SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payload_size = %d \n" )
	.zero	1
.LC754:
	ASCII(.string	"SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset = %d,payload_size = %d \n" )
	.zero	7
.LC756:
	ASCII(.string	"SEI_STEREO_VIDEO_INFO,offset = %d,payload_size = %d \n" )
	.zero	2
.LC758:
	ASCII(.string	"too much usrdat, cann't dec SEI\n" )
	.zero	7
.LC762:
	ASCII(.string	"\nthe stream is error,len:%d\n" )
	.zero	3
.LC767:
	ASCII(.string	"\nSlice nal or IDR nal = %d\n" )
	.zero	4
.LC769:
	ASCII(.string	"sliceheader dec err\n" )
	.zero	3
.LC771:
	ASCII(.string	"H264Dec destroy\n" )
	.zero	7
.LC773:
	ASCII(.string	"H264 recycle image\n" )
	.zero	4
.LC775:
	ASCII(.string	"pH264Ctx is %p, pFrameStore is %p\n" )
	.zero	5
.LC777:
	ASCII(.string	"line; %d pstLogicFsImage is NULL!\n" )
	.zero	5
.LC779:
	ASCII(.string	"InsertVO err:%d, ClearAll\n" )
	.zero	5
.LC781:
	ASCII(.string	"H264.c line %d: frame para err(ret=%d), recycle image self\n" )
	.zero	4
.LC783:
	ASCII(.string	"line: %d pstLogicFsImage is NULL!\n" )
	.zero	5
.LC787:
	ASCII(.string	"[%s][%d] OutputFrmToVO return %d\n" )
	.zero	6
.LC792:
	ASCII(.string	"line %d: flush dpb return %d\n" )
	.zero	2
.LC794:
	ASCII(.string	"----------------- Imode -> %d ------------------\n" )
	.zero	6
.LC796:
	ASCII(.string	"I_MODE but first_mb_in_slice != 0\n" )
	.zero	5
.LC800:
	ASCII(.string	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\n" )
.LC802:
	ASCII(.string	"***** VDM start, TotalPicNum=%d, pH264Ctx->CurrPic.structure=%d.\n" )
	.zero	6
.LC804:
	ASCII(.string	"DecVDM ERR\n" )
	.zero	4
.LC808:
	ASCII(.string	"%s:%d Metadata map failed\n" )
	.zero	5
.LC813:
	ASCII(.string	"%s:%d Metadata unmap failed\n" )
	.zero	3
.LC816:
	ASCII(.string	"*****[%s][%d],EL Codec can only dec EL stream in DV_DUAL_VES_IMP stream!!*****\n" )
.LC818:
	ASCII(.string	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****\n" )
	.zero	3
.LC820:
	ASCII(.string	"\n receive streambuff=%p; phy_addr=0x%x; bitstream_length=%d\n" )
	.zero	3
.LC822:
	ASCII(.string	"nal_release_err\n" )
	.zero	7
.LC824:
	ASCII(.string	"cann't find slot for current nal\n" )
	.zero	6
.LC827:
	ASCII(.string	"receive a zero packet\n" )
	.zero	1
.LC829:
	ASCII(.string	"clear all dec para\n" )
	.zero	4
.LC832:
	ASCII(.string	"[%s %d], pos is %d out of range\n" )
	.zero	7
.LC834:
	ASCII(.string	"line %d, get APC error, ret %d\n" )
.LC836:
	ASCII(.string	"InserFrmInDPB: cur pic struct = %d!\n" )
	.zero	3
.LC839:
	ASCII(.string	"CurrPic.state is 'EMPTY'\n" )
	.zero	6
.LC841:
	ASCII(.string	"StorePicInDPB return(%d) from L%d\n" )
	.zero	5
.LC844:
	ASCII(.string	"directoutput mode\n" )
	.zero	5
.LC846:
	ASCII(.string	"line: %d pImg is NULL!\n" )
.LC848:
	ASCII(.string	"line %d, REPORT_IFRAME_ERR\n" )
	.zero	4
.LC851:
	ASCII(.string	"line %d, return %d\n" )
	.zero	4
.LC853:
	ASCII(.string	"err(%d) > ref_thr(%d)\n" )
	.zero	1
.LC855:
	ASCII(.string	"marking return %d\n" )
	.zero	5
.LC857:
	ASCII(.string	"return value is unexpeced!\n" )
	.zero	4
.LC860:
	ASCII(.string	"line %d: pH264Ctx->DPB.size = %d, ref %d, ltref %d\n" )
	.zero	4
.LC863:
	ASCII(.string	"%s: pos(%d) = pre_pos, force return.\n" )
	.zero	2
.LC865:
	ASCII(.string	"FS_ALLOC_ERR, ClearAll\n" )
.LC868:
	ASCII(.string	"Can not new logic fs! ClearAll\n" )
.LC870:
	ASCII(.string	"GAP found while DPB is empty!\n" )
	.zero	1
.LC872:
	ASCII(.string	"frame num gap try to fill it \n" )
	.zero	1
.LC874:
	ASCII(.string	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\n" )
	.zero	7
.LC876:
	ASCII(.string	"cann't allocate frame store when gap find\n" )
	.zero	5
.LC878:
	ASCII(.string	"allocate frame store when gap find\n" )
	.zero	4
.LC880:
	ASCII(.string	"line %d: store gap pic err, ret=%d\n" )
	.zero	4
.LC884:
	ASCII(.string	"%s %d unknow error!!\n" )
	.zero	2
.LC886:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC889:
	ASCII(.string	"%s %d frame_store is null!!\n" )
	.zero	3
.LC893:
	ASCII(.string	"line %d: init dpb return %d\n" )
	.zero	3
.LC895:
	ASCII(.string	"resolution error, the CAP_LEVEL_USER_DEFINE_WITH_OPTION channel with s32ReRangeEn == 0 can't support such bitstream.\n" )
	.zero	2
.LC897:
	ASCII(.string	"s32MaxRefFrameNum < pH264Ctx->DPB.size, the CAP_LEVEL_USER_DEFINE_WITH_OPTION channel can't support such bitstream.\n" )
	.zero	3
.LC899:
	ASCII(.string	"mem arrange err, ClearAll\n" )
	.zero	5
.LC901:
	ASCII(.string	"get back frm\n" )
	.zero	2
.LC904:
	ASCII(.string	"line %d: frame gap(=%d) > dpb size(=%d)\n" )
	.zero	7
.LC906:
	ASCII(.string	"line %d: dec gap failed\n" )
	.zero	7
.LC908:
	ASCII(.string	"line %d: alloc framestore failed\n" )
	.zero	6
.LC910:
	ASCII(.string	"dec_pts: %lld\n" )
	.zero	1
.LC912:
	ASCII(.string	"dec_usertag: %lld\n" )
	.zero	5
.LC914:
	ASCII(.string	"%s %d NULL == pH264Ctx->CurrPic.frame_store!!\n" )
	.zero	1
.LC920:
	ASCII(.string	"Start Reason: SliceParaNum, MaxBytesReceived = %d, %d(thr=%d)\n" )
	.zero	1
.LC922:
	ASCII(.string	"Too many slice or bitstream, err!\n" )
	.zero	5
.LC924:
	ASCII(.string	"Start Reason: new_pic_flag\n" )
	.zero	4
.LC926:
	ASCII(.string	"init pic err, find next recover point or next valid sps, pps, or exit\n" )
	.zero	1
.LC928:
	ASCII(.string	"DecList error, ret=%d\n" )
	.zero	1
.LC930:
	ASCII(.string	"dec list err.\n" )
	.zero	1
.LC933:
	ASCII(.string	"pH264Ctx->TotalNal = %d, type:%d\n" )
	.zero	6
.LC935:
	ASCII(.string	"stop i want\n" )
	.zero	3
.LC937:
	ASCII(.string	"svc_extension_flag error:priority_id:%d, pred_flag%d\n" )
	.zero	2
.LC939:
	ASCII(.string	"%d,%d,%d\n" )
	.zero	6
.LC941:
	ASCII(.string	"svc stream,nal_header:%x\n" )
	.zero	6
.LC944:
	ASCII(.string	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=%d\n" )
	.zero	1
.LC946:
	ASCII(.string	"SliceCheck failed, clear current slice.\n" )
	.zero	7
.LC949:
	ASCII(.string	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\n" )
	.zero	1
.LC952:
	ASCII(.string	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\n" )
	.zero	1
.LC954:
	ASCII(.string	"SPS decode error.\n" )
	.zero	5
.LC956:
	ASCII(.string	"***** NAL: SEI, nal_unit_type=%d\n" )
	.zero	6
.LC958:
	ASCII(.string	"SEI decode error.\n" )
	.zero	5
.LC960:
	ASCII(.string	"***** NAL: AUD, nal_unit_type=%d\n" )
	.zero	6
.LC962:
	ASCII(.string	"***** NAL: EOSEQ, nal_unit_type=%d\n" )
	.zero	4
.LC964:
	ASCII(.string	"***** NAL: FILL, nal_unit_type=%d\n" )
	.zero	5
.LC966:
	ASCII(.string	"***** NAL: EOSTREAM, nal_unit_type=%d\n" )
	.zero	1
.LC968:
	ASCII(.string	"***** NAL: SPSEXT, nal_unit_type=%d\n" )
	.zero	3
.LC970:
	ASCII(.string	"***** NAL: AUX, nal_unit_type=%d\n" )
	.zero	6
.LC972:
	ASCII(.string	"***** NAL: EOPIC, nal_unit_type=%d\n" )
	.zero	4
.LC974:
	ASCII(.string	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:%x\n" )
	.zero	1
.LC981:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC984:
	ASCII(.string	"FindTrailZeros ERR\n" )
	.zero	4
.LC986:
	ASCII(.string	"H264_DecOneNal ERR\n" )
	.zero	4
.LC989:
	ASCII(.string	"store pic err, ret = %d\n" )
	.zero	7
.LC991:
	ASCII(.string	"imode nal store pic err, ret = %d\n" )
	.zero	5
.LC993:
	ASCII(.string	"imode nal flush dpb err, ret = %d\n" )
	.zero	5
.LC995:
	ASCII(.string	"cann't find FrameStore\n" )
.LC997:
	ASCII(.string	"========== H264 FrameStore state(is_used, is_in_dpb, IsOutDPB) ========\n" )
	.zero	7
.LC999:
	ASCII(.string	"ReadImgNum = %d, NewImgNum = %d\n" )
	.zero	7
.LC1001:
	ASCII(.string	"%02d: %d %d %d\n" )
.LC1003:
	ASCII(.string	"FrameStore leak, ClearAll\n" )
	.bss
	.align	3
.LANCHOR2 = . + 0
.LANCHOR3 = . + 4352
	.type	pps_tmp.12986, %object
	.size	pps_tmp.12986, 2208
pps_tmp.12986:
	.zero	2208
	.type	sps_tmp.13135, %object
	.size	sps_tmp.13135, 4000
sps_tmp.13135:
	.zero	4000
	.type	TmpBuf, %object
	.size	TmpBuf, 68
TmpBuf:
	.zero	68
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
