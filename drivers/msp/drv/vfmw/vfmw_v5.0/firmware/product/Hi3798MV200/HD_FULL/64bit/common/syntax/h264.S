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
	ldr	w2, [x3, 2868]
	ldr	w1, [x19, 3712]
	ldr	w0, [x3, 2864]
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
	ldr	w0, [x3, 2868]
	add	w0, w0, 4
	str	w0, [x3, 2868]
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
	ldr	w0, [x3, 2868]
	add	w0, w0, 2
	str	w0, [x3, 2868]
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
	add	x3, x22, 20480
	mov	w2, 2208
	ldrb	w0, [x19, 133]
	ldr	x7, [x22, 14968]
	ldr	w4, [x3, 1596]
	and	w5, w0, -4
	ldrb	w1, [x19, 132]
	mov	w3, 4000
	ldr	x6, [x22, 14960]
	umull	x0, w4, w2
	and	w1, w1, -4
	add	x2, x7, x0
	mov	w0, w5
	ldr	w2, [x2, 28]
	strb	w5, [x19, 133]
	strb	w1, [x19, 132]
	umull	x2, w2, w3
	ldr	w3, [x20, 1356]
	str	w3, [x19, 168]
	add	x3, x6, x2
	ldrb	w2, [x3, 18]
	cbz	w2, .L475
	add	x2, x22, 61440
	ldr	w2, [x2, 3408]
	lsl	w2, w2, 4
	cmp	w2, 1920
	bhi	.L476
.L475:
	ldrb	w2, [x19, 134]
	orr	w2, w2, 2
	strb	w2, [x19, 134]
	ldr	x4, [x22]
	ldr	w4, [x4, 632]
	cmp	w4, 1
	beq	.L524
.L478:
	and	w2, w2, -5
	strb	w2, [x19, 134]
.L479:
	ldrb	w2, [x19, 1]
	add	x21, x22, 24576
	cmp	w2, 3
	bhi	.L480
	ldr	x4, .LC46
	ldrh	w4, [x4,w2,uxtw #1]
	adr	x5, .Lrtx482
	add	x4, x5, w4, sxth #2
	br	x4
.Lrtx482:
	.section	.rodata
	.align	0
	.align	2
.L482:
	.2byte	(.L481 - .Lrtx482) / 4
	.2byte	(.L483 - .Lrtx482) / 4
	.2byte	(.L484 - .Lrtx482) / 4
	.2byte	(.L481 - .Lrtx482) / 4
	.text
	.p2align 3
.L481:
	ldrb	w4, [x19, 720]
	cbnz	w4, .L485
	ldr	w5, [x19, 704]
	ldr	w4, [x19, 696]
	str	w5, [x19, 192]
	ldr	w9, [x19, 700]
	ldr	w6, [x19, 788]
	ldr	w5, [x19, 836]
	cbnz	w4, .L486
	mov	w10, 2
	mov	w7, 3
.L487:
	ldr	w8, [x19, 780]
	ldr	w4, [x19, 828]
	cmp	w8, w4
	beq	.L525
	cset	w4, le
.L497:
	add	x21, x22, 24576
	ldrb	w8, [x21, 3228]
	cmp	w8, 3
	beq	.L507
	cmp	w8, 4
	mov	w8, 0
	csel	w4, w4, w8, ne
.L498:
	bfi	w0, w4, 4, 2
	bfi	w1, w9, 0, 2
	bfi	w0, w7, 2, 2
	strb	w1, [x19, 132]
	bfi	w0, w10, 0, 2
	strb	w0, [x19, 133]
	stp	w6, w5, [x19, 124]
.L480:
	ldrb	w1, [x3, 18]
	mov	w4, 0
	str	w1, [x19, 520]
	str	w1, [x19, 524]
	ldrb	w1, [x3, 22]
	cbz	w1, .L499
	ldr	w4, [x3, 3332]
.L499:
	mov	w1, 1
	str	w4, [x19, 532]
	str	w1, [x19, 528]
	ldr	x1, [x22]
	ldr	w1, [x1, 12]
	cmp	w1, wzr
	ble	.L500
	ldrb	w1, [x19, 720]
	cbz	w1, .L526
.L500:
	mov	x0, x22
	mov	x1, x19
	bl	ExchangePts
	ldrsb	w0, [x21, 3192]
	cbz	w0, .L501
	ldr	w0, [x21, 3208]
	cmp	w0, 3
	beq	.L527
	cmp	w0, 4
	beq	.L528
	cmp	w0, 5
	beq	.L529
	str	wzr, [x19, 400]
	mov	w0, 0
	ldr	x1, .LC48
	ldr	w2, [x21, 3208]
	bl	dprint_vfmw
	.p2align 2
.L501:
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
.L526:
	cmp	w2, 3
	bne	.L500
	and	w0, w0, -4
	strb	w0, [x19, 133]
	b	.L500
	.p2align 3
.L476:
	ldrb	w2, [x19, 134]
	and	w2, w2, -3
	strb	w2, [x19, 134]
	ldr	x4, [x22]
	ldr	w4, [x4, 632]
	cmp	w4, 1
	bne	.L478
.L524:
	ldrb	w4, [x19, 134]
	tbnz	x4, 1, .L478
	orr	w4, w4, 4
	strb	w4, [x19, 134]
	b	.L479
	.p2align 3
.L484:
	ldr	w6, [x19, 700]
	mov	w4, 2
	bfi	w0, w4, 2, 2
	ldr	w5, [x19, 836]
	bfi	w1, w6, 0, 2
	ldr	w4, [x19, 704]
	strb	w1, [x19, 132]
	orr	w0, w0, 3
	ldr	x1, [x19, 856]
	add	x21, x22, 24576
	str	w4, [x19, 192]
	mov	w4, 3
	strb	w0, [x19, 133]
	str	w5, [x19, 128]
	str	w4, [x19, 124]
	ldr	w1, [x1, 716]
	str	w1, [x19, 752]
	b	.L480
	.p2align 3
.L483:
	ldr	w6, [x19, 700]
	mov	w4, 1
	bfi	w0, w4, 2, 2
	ldr	w5, [x19, 704]
	bfi	w1, w6, 0, 2
	ldr	w4, [x19, 788]
	strb	w1, [x19, 132]
	orr	w0, w0, 3
	ldr	x1, [x19, 808]
	add	x21, x22, 24576
	str	w4, [x19, 124]
	mov	w4, 3
	strb	w0, [x19, 133]
	str	w5, [x19, 192]
	str	w4, [x19, 128]
	ldr	w1, [x1, 716]
	str	w1, [x19, 752]
	b	.L480
	.p2align 3
.L527:
	mov	w0, 1
	str	w0, [x19, 400]
	b	.L501
	.p2align 3
.L529:
	mov	w0, 3
	str	w0, [x19, 400]
	b	.L501
	.p2align 3
.L485:
	ldr	w8, [x19, 784]
	ldr	w4, [x20, 2816]
	ldr	w10, [x19, 832]
	cmp	w8, w4
	bhi	.L530
	cmp	w4, w10
	bcc	.L491
.L489:
	ldr	w4, [x19, 704]
	mov	w7, 3
	ldr	w9, [x19, 700]
	ldr	w6, [x19, 788]
	ldr	w5, [x19, 836]
	str	w4, [x19, 192]
.L492:
	ldrb	w4, [x19, 3]
	cmp	w4, 1
	beq	.L531
	cmp	w4, 2
	beq	.L532
.L494:
	ldr	w8, [x19, 800]
	mov	w10, 3
	ldr	w4, [x19, 848]
	stp	w6, w5, [x19, 124]
	add	w4, w8, w4
	add	w4, w4, w4, lsr 31
	asr	w4, w4, 1
	str	w4, [x19, 364]
	b	.L487
	.p2align 3
.L491:
	ldr	w9, [x19, 788]
	mov	w7, 1
	ldr	w5, [x19, 836]
	mov	w6, w9
	str	w8, [x19, 192]
	b	.L492
	.p2align 3
.L528:
	mov	w0, 2
	str	w0, [x19, 400]
	b	.L501
	.p2align 3
.L507:
	mov	w4, 1
	b	.L498
	.p2align 3
.L525:
	mov	x4, 720
	ldr	x8, [x19, 136]
	movk	x4, 0x1e0, lsl 32
	cmp	x8, x4
	cset	w4, ne
	b	.L497
	.p2align 3
.L530:
	cmp	w4, w10
	bcc	.L489
	ldr	w9, [x19, 836]
	mov	w7, 2
	ldr	w6, [x19, 788]
	mov	w5, w9
	str	w10, [x19, 192]
	b	.L492
	.p2align 3
.L486:
	mov	w10, 3
	mov	w7, w10
	b	.L487
	.p2align 3
.L531:
	mov	w9, w5
	mov	w7, 2
	str	w10, [x19, 192]
	b	.L494
	.p2align 3
.L532:
	mov	w9, w6
	mov	w7, 1
	str	w8, [x19, 192]
	b	.L494
	.size	GetImagePara, .-GetImagePara
	.align	3
.LC46:
	.xword	.L482
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
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bls	.L534
	mov	x1, x20
	mov	x0, x19
	bl	SetFrmRepeatCount.part.1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L534:
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
	cbz	w3, .L538
	ldrb	w1, [x19, 769]
	cbz	w1, .L538
	mov	w1, 1
	strb	w1, [x19, 721]
.L540:
	mov	w2, 0
.L541:
	ldr	w1, [x19, 788]
	strb	w2, [x19, 722]
	cbz	w1, .L542
	ldr	w2, [x19, 836]
	cbz	w2, .L544
	cmp	w1, w2
	csel	w1, w1, w2, cs
.L542:
	str	w1, [x19, 700]
	str	w0, [x19, 704]
	str	w1, [x19, 740]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L538:
	ldr	w1, [x19, 816]
	strb	wzr, [x19, 721]
	tst	w1, 16776960
	beq	.L540
	ldr	w1, [x19, 768]
	mov	w2, 1
	tst	w1, 16776960
	bne	.L541
	b	.L540
	.p2align 3
.L544:
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
	cbz	x22, .L579
	cmp	w19, 1
	beq	.L559
	cmp	w19, 2
	beq	.L560
	ldr	w23, [x22, 780]
	ldr	w24, [x22, 828]
.L561:
	add	x21, x20, 24576
	ldr	w2, [x21, 3992]
	cbz	w2, .L570
	ldr	w0, [x21, 3736]
	cbz	w0, .L580
	add	x0, x21, 3740
	mov	w19, 0
	b	.L564
	.p2align 3
.L568:
	ldr	w1, [x0], 4
	cbz	w1, .L562
.L564:
	add	w19, w19, 1
	cmp	w19, w2
	bne	.L568
.L570:
	mov	w0, -1
.L574:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L560:
	ldr	w23, [x22, 828]
	mov	w24, w23
	b	.L561
.L580:
	mov	w19, 0
	.p2align 2
.L562:
	add	x0, x20, 65536
	ldr	w1, [x22, 672]
	ldr	w0, [x0, 2820]
	bl	FSP_GetLogicFs
	cbz	x0, .L565
	ldr	x1, [x0, 680]
	cbz	x1, .L565
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
.L559:
	ldr	w23, [x22, 780]
	mov	w24, w23
	b	.L561
.L565:
	ldrb	w3, [x22, 2]
	mov	x4, x0
	ldr	x1, .LC57
	mov	x5, 0
	ldr	w2, [x22, 672]
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L574
.L579:
	ldr	x2, .LC51
	mov	w3, 2250
	ldr	x1, .LC53
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L574
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
	bne	.L581
	mov	x0, x19
	bl	SlidingWinMark.part.2
.L581:
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
	tbz	x0, 14, .L583
	add	x21, x22, 24576
	ldr	w0, [x21, 3716]
	cbz	w0, .L589
	ldr	x20, .LC61
	mov	w19, 0
	.p2align 2
.L588:
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
	bhi	.L588
.L589:
	ldr	x25, .LC59
	mov	w0, 14
	mov	x1, x25
	bl	dprint_vfmw
	ldr	w0, [x21, 3720]
	cbz	w0, .L587
	ldr	x24, .LC63
	mov	w19, 0
	ldr	x23, .LC65
	.p2align 2
.L590:
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
	bhi	.L590
.L587:
	mov	x1, x25
	mov	w0, 14
	bl	dprint_vfmw
.L583:
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
	cbnz	w3, .L597
	ldrb	w2, [x1, 2677]
	mov	w0, 3
	cmp	w2, wzr
	csel	w2, w2, w0, eq
.L597:
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
	beq	.L600
	cbz	w4, .L601
	cmp	w4, 2
	bne	.L596
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
	cbz	w7, .L623
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
	beq	.L609
	ldr	x2, [x19, 648]
	cmn	x2, #1
	beq	.L624
.L609:
	ldr	w2, [x19, 788]
.L627:
	cmp	w2, w6
	mov	x0, x19
	csel	w6, w2, w6, cs
	str	w6, [x19, 700]
	ldr	w1, [x1, 3380]
	str	w1, [x19, 688]
	bl	CombineFldsToFrm
.L596:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L601:
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
.L600:
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
	cbz	w7, .L625
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
	beq	.L605
	ldr	x2, [x19, 648]
	cmn	x2, #1
	beq	.L626
.L605:
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
.L623:
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
.L625:
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
	b	.L596
	.p2align 3
.L626:
	str	x0, [x19, 648]
	b	.L605
	.p2align 3
.L624:
	str	x0, [x19, 648]
	ldr	w2, [x19, 788]
	b	.L627
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
	bcs	.L634
.L629:
	add	x19, x19, 61440
	ldr	w0, [x19, 3376]
	strb	wzr, [x19, 2676]
	cbz	w0, .L628
	mov	w0, 1
	strb	w0, [x19, 2677]
.L628:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L634:
	ldr	x1, [x19, 27904]
	mov	x0, x19
	bl	UnMarkFrameStoreRef
	mov	w1, 0
	mov	x0, x19
	bl	RemoveFrameStoreOutDPB
	b	.L629
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
	cbz	x20, .L644
	ldr	x23, .LC69
	add	x19, x20, 8
	strb	wzr, [x20, 1]
	add	x22, x20, 72
	strb	wzr, [x20, 4]
.L639:
	ldr	x1, [x19]
	mov	w0, w21
	cbz	x1, .L638
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
.L638:
	add	x19, x19, 32
	cmp	x19, x22
	bne	.L639
	strb	wzr, [x20]
	str	wzr, [x20, 76]
.L635:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L644:
	ldr	x2, .LC66
	mov	w3, 4252
	ldr	x1, .LC67
	mov	w0, 0
	bl	dprint_vfmw
	b	.L635
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
	cbz	x1, .L646
	add	x0, x19, 65536
	ldr	w0, [x0, 2820]
	bl	ReleaseNAL
	str	xzr, [x19, 632]
.L646:
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
	cbz	x1, .L651
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L651:
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
	b	.L657
	.p2align 3
.L656:
	add	x19, x19, 104
	cmp	x19, x20
	beq	.L659
.L657:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L656
	ldr	w0, [x21, 2820]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x19, x20
	bne	.L657
.L659:
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
.L662:
	ldr	x0, [x19]
	mov	x1, x0
	cbz	x0, .L661
	ldr	w0, [x21, 2820]
	bl	ReleaseNAL
	str	xzr, [x19]
.L661:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L662
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
	bhi	.L669
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
	beq	.L684
	add	x0, x21, 24576
	mov	w1, 5
	strb	wzr, [x29, 68]
	sxtb	w4, w22
	strb	w1, [x29, 69]
	ldr	w0, [x0, 3712]
	add	w0, w0, 1
	strb	w0, [x29, 67]
.L678:
	mov	w0, 63
	strb	w4, [x29, 70]
	cmp	w19, w0
	strb	wzr, [x29, 66]
	ccmp	w20, w0, 0, hi
	bls	.L685
	add	x19, x21, 65536
	add	x1, x29, 64
	ldr	w0, [x19, 2820]
	bl	FSP_ConfigInstance
	cbnz	w0, .L674
	ldr	x1, [x21]
	add	x3, x29, 60
	ldr	w0, [x19, 2820]
	ldr	w2, [x1, 24]
	ldr	w1, [x1, 20]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	mov	w1, w0
	beq	.L686
	mov	w0, 1
	cbnz	w1, .L676
.L679:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L684:
	mov	w1, 1
	mov	w0, 5
	strb	w1, [x29, 67]
	mov	w4, 1
	strb	wzr, [x29, 68]
	strb	w0, [x29, 69]
	b	.L678
	.p2align 3
.L686:
	add	x0, x21, 8
	bl	ResetVoQueue
.L676:
	ldr	x1, .LC80
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L679
	.p2align 3
.L669:
	ldr	x1, .LC76
.L682:
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
.L685:
	ldr	x1, .LC78
	b	.L682
	.p2align 3
.L674:
	ldr	x1, .LC82
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L679
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
	beq	.L706
	cbz	w2, .L690
	cmp	w2, 2
	mov	w0, 0
	bne	.L718
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L718:
	ldr	x1, .LC84
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	ldr	x19, [sp, 16]
	mov	w0, -1
	ldp	x29, x30, [sp], 32
	ret
.L690:
	mov	w11, 1
.L689:
	add	x6, x19, 28672
	add	x7, x7, 1628
	add	x6, x6, 32
	mov	x8, 0
	mov	x9, 0
	mov	w2, 0
	mov	w13, 1
	add	x12, x19, 61440
	.p2align 2
.L702:
	ldr	w0, [x7]
	cbz	w0, .L692
	ldr	x1, [x6]
	cbnz	x1, .L719
	sub	w3, w0, #1
	add	x10, x8, 3589
	add	x0, x6, 8
	add	x5, x10, x3, uxtw
	add	x5, x19, x5, lsl 3
	b	.L695
	.p2align 3
.L696:
	ldr	x4, [x0], 8
	cbnz	x4, .L693
.L695:
	cmp	x0, x5
	bne	.L696
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L720
	ldr	x9, [x12, 3352]
	add	x9, x9, 720
.L703:
	add	x3, x10, x3, uxtw
	mov	x0, x6
	add	x3, x19, x3, lsl 3
	cbz	x1, .L721
	.p2align 2
.L698:
	add	x0, x0, 8
	cmp	x0, x3
	beq	.L699
.L722:
	ldr	x1, [x0]
	cbnz	x1, .L698
.L721:
	str	x9, [x0]
	add	x0, x0, 8
	cmp	x0, x3
	bne	.L722
	.p2align 2
.L699:
	add	w2, w2, 1
	add	x7, x7, 4
	cmp	w2, w11
	add	x6, x6, 264
	add	x8, x8, 33
	bcc	.L702
.L724:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L692:
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L723
	str	w13, [x7]
	add	w2, w2, 1
	cmp	w2, w11
	add	x7, x7, 4
	ldr	x0, [x12, 3352]
	add	x8, x8, 33
	add	x0, x0, 720
	str	x0, [x6]
	add	x6, x6, 264
	bcc	.L702
	b	.L724
.L719:
	sub	w3, w0, #1
	mov	x4, x1
	add	x10, x8, 3589
	.p2align 2
.L693:
	mov	x9, x4
	b	.L703
.L706:
	mov	w11, 2
	b	.L689
.L723:
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
.L720:
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
	cbz	w1, .L726
	ldrb	w0, [x0, 1586]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L726:
	add	x0, x20, 24576
	ldr	w2, [x0, 3720]
	cbz	w2, .L734
	sub	w2, w2, #1
	add	x0, x0, 3456
	add	x2, x2, 3505
	add	x4, x20, x2, lsl 3
	b	.L731
	.p2align 3
.L744:
	cmp	w3, 3
	beq	.L743
.L729:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L734
.L731:
	ldr	x2, [x0]
	ldrb	w3, [x2, 2]
	cbz	w5, .L744
	tbz	x3, 0, .L730
	ldr	w6, [x2, 768]
	and	w6, w6, 16776960
	cmp	w6, 65536
	beq	.L745
.L730:
	tbz	x3, 1, .L729
	ldr	w3, [x2, 816]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L729
	ldr	w1, [x2, 824]
	cmp	w19, w1
	bne	.L729
	add	x0, x2, 816
	b	.L727
	.p2align 3
.L745:
	ldr	w1, [x2, 776]
	cmp	w1, w19
	bne	.L730
	add	x0, x2, 768
	b	.L727
	.p2align 3
.L743:
	ldr	w3, [x2, 720]
	and	w3, w3, 16776960
	cmp	w3, 65536
	bne	.L729
	ldr	w1, [x2, 728]
	cmp	w19, w1
	bne	.L729
	add	x0, x2, 720
	b	.L727
	.p2align 3
.L734:
	mov	x0, 0
.L727:
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
	cbz	w1, .L747
	ldrb	w0, [x0, 1586]
	mov	w5, 2
	cmp	w0, wzr
	csinc	w5, w5, wzr, ne
.L747:
	add	x0, x20, 24576
	ldr	w2, [x0, 3724]
	cbz	w2, .L755
	sub	w2, w2, #1
	add	x0, x0, 3584
	add	x2, x2, 3521
	add	x4, x20, x2, lsl 3
	b	.L752
	.p2align 3
.L765:
	cmp	w3, 3
	beq	.L764
.L750:
	add	x0, x0, 8
	cmp	x0, x4
	beq	.L755
.L752:
	ldr	x2, [x0]
	ldrb	w3, [x2, 2]
	cbz	w5, .L765
	tbz	x3, 0, .L751
	ldr	w6, [x2, 768]
	and	w6, w6, 16776960
	cmp	w6, 256
	beq	.L766
.L751:
	tbz	x3, 1, .L750
	ldr	w3, [x2, 816]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L750
	ldr	w1, [x2, 820]
	cmp	w19, w1
	bne	.L750
	add	x0, x2, 816
	b	.L748
	.p2align 3
.L766:
	ldr	w1, [x2, 772]
	cmp	w1, w19
	bne	.L751
	add	x0, x2, 768
	b	.L748
	.p2align 3
.L764:
	ldr	w3, [x2, 720]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L750
	ldr	w1, [x2, 724]
	cmp	w19, w1
	bne	.L750
	add	x0, x2, 720
	b	.L748
	.p2align 3
.L755:
	mov	x0, 0
.L748:
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
	ble	.L768
	mov	w1, w2
	.p2align 2
.L769:
	add	x5, x19, x1, sxtw 3
	ldr	x5, [x5, -8]
	str	x5, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w5, [x21]
	cmp	w5, w1
	blt	.L769
.L768:
	add	w1, w5, 1
	str	w1, [x21]
	str	x0, [x19, w5, sxtw 3]
	ldr	w0, [x21]
	cmp	w2, w0
	mov	w4, w0
	blt	.L767
	.p2align 2
.L777:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L771
	ldrb	w5, [x1, 1]
	cbnz	w5, .L772
	ldr	w5, [x1, 8]
	cmp	w22, w5
	beq	.L771
.L772:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L771:
	cmp	w2, w0
	bge	.L777
.L767:
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
	ble	.L782
	mov	w1, w2
	.p2align 2
.L783:
	add	x5, x19, x1, sxtw 3
	ldr	x5, [x5, -8]
	str	x5, [x19, w1, sxtw 3]
	sub	w1, w1, #1
	ldr	w5, [x21]
	cmp	w5, w1
	blt	.L783
.L782:
	add	w1, w5, 1
	str	w1, [x21]
	str	x0, [x19, w5, sxtw 3]
	ldr	w0, [x21]
	cmp	w2, w0
	mov	w4, w0
	blt	.L781
	.p2align 2
.L793:
	ldr	x1, [x19, w0, sxtw 3]
	add	w0, w0, 1
	cbz	x1, .L785
	ldrb	w5, [x1, 1]
	cbz	w5, .L786
	ldr	w5, [x1, 4]
	cmp	w22, w5
	beq	.L785
.L786:
	str	x1, [x19, w4, sxtw 3]
	add	w4, w4, 1
.L785:
	cmp	w2, w0
	bge	.L793
.L781:
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
	cbz	w1, .L799
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
.L809:
	cmn	w21, #2
	beq	.L798
	ldr	w3, [x25]
	cmp	w3, 3
	beq	.L798
	add	w24, w21, 1
	mov	w27, w26
	lsl	x24, x24, 2
	mov	x19, 0
	b	.L802
	.p2align 3
.L803:
	ldr	x3, [x29, 104]
	ldr	w3, [x3, x19]
	bl	ReorderLTList
	cmp	x24, x19
	add	x19, x19, 4
	beq	.L798
.L808:
	ldr	w3, [x25, x19]
	cmp	w3, 3
	beq	.L798
.L802:
	cmp	w3, 1
	add	x4, x29, 124
	mov	w2, w21
	mov	x1, x22
	mov	x0, x20
	bhi	.L803
	ldr	w0, [x28, x19]
	cbnz	w3, .L804
	mvn	w0, w0
	add	w27, w27, w0
	add	w0, w27, w23
	cmp	w27, wzr
	csel	w27, w0, w27, lt
.L805:
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
	bne	.L808
.L798:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L804:
	add	w0, w0, 1
	add	w27, w27, w0
	cmp	w23, w27
	sub	w0, w27, w23
	csel	w27, w0, w27, le
	b	.L805
	.p2align 3
.L799:
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
	b	.L809
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
	beq	.L817
	ldrb	w1, [x19, 796]
	cbnz	w1, .L829
.L820:
	ldr	w1, [x19, 1640]
	cmp	w0, 1
	add	w0, w1, 1
	str	w0, [x19, 1628]
	bne	.L817
	ldrb	w0, [x19, 797]
	cbnz	w0, .L830
.L822:
	ldr	w0, [x19, 1644]
	add	w0, w0, 1
	str	w0, [x19, 1632]
.L817:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L829:
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
	b	.L820
	.p2align 3
.L830:
	add	x1, x20, 28672
	ldr	w3, [x19, 1644]
	add	x6, x19, 1456
	add	x5, x19, 1196
	add	x4, x19, 932
	add	x2, x19, 1632
	add	x1, x1, 296
	mov	x0, x20
	bl	ReorderRefPiclist
	b	.L822
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
	cbnz	w23, .L853
	cmp	w21, 1
	ldr	x23, .LC90
	beq	.L893
.L833:
	cmp	w21, 2
	bne	.L842
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L844:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L842
.L894:
	cmp	w21, w22
	bcc	.L877
	b	.L849
	.p2align 3
.L845:
	add	w21, w21, 1
	cmp	w22, w21
	bls	.L849
.L877:
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 1, .L845
	add	x0, x0, 816
	blr	x23
	cbz	w0, .L845
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 816
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
.L849:
	cmp	w20, w22
	bcc	.L876
	b	.L844
	.p2align 3
.L850:
	add	w20, w20, 1
	cmp	w22, w20
	bls	.L844
.L876:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 0, .L850
	add	x0, x0, 768
	blr	x23
	cbz	w0, .L850
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
	bcc	.L894
.L842:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.L853:
	cmp	w21, 1
	ldr	x23, .LC89
	bne	.L833
.L893:
	mov	w21, 0
	mov	w20, 0
	.p2align 2
.L834:
	cmp	w20, w22
	ccmp	w21, w22, 0, cs
	bcs	.L842
	cmp	w20, w22
	bcc	.L875
	b	.L892
	.p2align 3
.L835:
	add	w20, w20, 1
	cmp	w20, w22
	bcs	.L892
.L875:
	ldr	x0, [x19, w20, uxtw 3]
	add	x26, x19, x20, uxtw 3
	ldrb	w1, [x0, 1]
	tbz	x1, 0, .L835
	add	x0, x0, 768
	blr	x23
	cbz	w0, .L835
	ldr	w1, [x24]
	add	w20, w20, 1
	ldr	x0, [x26]
	add	x0, x0, 768
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	.p2align 2
.L892:
	cmp	w21, w22
	bcs	.L834
	ldr	x0, [x19, w21, uxtw 3]
	add	x26, x19, x21, uxtw 3
	ldrb	w1, [x0, 1]
	tbnz	x1, 1, .L895
.L840:
	add	w21, w21, 1
	b	.L892
	.p2align 3
.L895:
	add	x0, x0, 816
	blr	x23
	cbz	w0, .L840
	ldr	w1, [x24]
	add	w21, w21, 1
	ldr	x0, [x26]
	add	x0, x0, 816
	str	x0, [x25, w1, uxtw 3]
	ldr	w0, [x24]
	add	w0, w0, 1
	str	w0, [x24]
	b	.L834
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
	cbnz	w0, .L897
	ldrb	w0, [x22, 2675]
	add	x21, x19, 24576
	cbnz	w0, .L1017
	ldr	w0, [x21, 3720]
	cbz	w0, .L964
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3505
	add	x0, x21, 3456
	add	x3, x19, x3, lsl 3
	b	.L903
	.p2align 3
.L902:
	cmp	x3, x0
	beq	.L901
.L903:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L902
	ldr	w2, [x1, 720]
	and	w2, w2, 16776960
	cmp	w2, 65536
	bne	.L902
	add	x2, x19, x23, uxtw 3
	add	x1, x1, 720
	cmp	x3, x0
	add	w23, w23, 1
	str	x1, [x2, 28704]
	bne	.L903
	.p2align 2
.L901:
	add	x0, x19, 28672
	ldr	x3, .LC91
	mov	w1, w23
	mov	w2, 8
	add	x0, x0, 32
	bl	qsort
	str	w23, [x20, 1628]
	ldr	w1, [x21, 3724]
	cbz	w1, .L965
	sub	w3, w1, #1
	add	x0, x21, 3584
	add	x3, x3, 3521
	mov	w21, w23
	add	x3, x19, x3, lsl 3
	b	.L906
	.p2align 3
.L905:
	cmp	x0, x3
	beq	.L1018
.L906:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L905
	ldr	w2, [x1, 720]
	and	w2, w2, 16776960
	cmp	w2, 256
	bne	.L905
	add	x2, x19, x21, uxtw 3
	add	x1, x1, 720
	cmp	x0, x3
	add	w21, w21, 1
	str	x1, [x2, 28704]
	bne	.L906
	.p2align 2
.L1018:
	sub	w1, w21, w23
.L904:
	uxtw	x0, w23
	ldr	x3, .LC92
	add	x0, x0, 3588
	mov	w2, 8
	add	x0, x19, x0, lsl 3
	bl	qsort
	str	w21, [x20, 1628]
	mov	w2, w21
	str	wzr, [x20, 1632]
	cbz	w2, .L1019
.L912:
	ldr	w0, [x20, 1640]
	mov	w1, 0
	str	wzr, [x20, 1632]
	add	w0, w0, 1
	cmp	w0, w2
	csel	w0, w0, w2, ls
	str	w0, [x20, 1628]
	cmp	w0, 32
	bhi	.L959
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w0, 33
	str	xzr, [x2, 28704]
	bne	.L957
	.p2align 2
.L958:
	cmp	w1, 32
	bhi	.L956
	.p2align 2
.L959:
	add	x0, x19, x1, uxtw 3
	add	w1, w1, 1
	cmp	w1, 33
	str	xzr, [x0, 28968]
	bne	.L959
.L956:
	mov	w0, 0
.L1008:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 480
	ret
	.p2align 3
.L897:
	ldrb	w0, [x22, 2675]
	add	x21, x19, 24576
	cbz	w0, .L918
	ldr	w0, [x21, 3720]
	cbz	w0, .L1020
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3505
	add	x0, x21, 3456
	add	x3, x19, x3, lsl 3
	.p2align 2
.L937:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldrb	w1, [x2, 1]
	cbz	w1, .L936
	ldr	w4, [x2, 688]
	add	x1, x29, 480
	ldr	w5, [x22, 3380]
	add	x1, x1, x23, uxtw 3
	sub	x1, x1, #4096
	cmp	w5, w4
	blt	.L936
	add	w23, w23, 1
	str	x2, [x1, 3712]
.L936:
	cmp	x0, x3
	bne	.L937
	add	x26, x29, 96
	ldr	x3, .LC99
	mov	w2, 8
	mov	w1, w23
	mov	x0, x26
	bl	qsort
	ldr	w24, [x21, 3720]
	cbz	w24, .L938
.L962:
	sub	w1, w24, #1
	add	x0, x21, 3456
	add	x1, x1, 3505
	mov	w25, w23
	add	x1, x19, x1, lsl 3
	.p2align 2
.L940:
	ldr	x3, [x0]
	add	x0, x0, 8
	ldrb	w2, [x3, 1]
	cbz	w2, .L939
	ldr	w4, [x3, 688]
	add	x2, x29, 480
	ldr	w5, [x22, 3380]
	add	x2, x2, x25, uxtw 3
	sub	x2, x2, #4096
	cmp	w5, w4
	bge	.L939
	add	w25, w25, 1
	str	x3, [x2, 3712]
.L939:
	cmp	x0, x1
	bne	.L940
	sub	w24, w25, w23
	ldr	x3, .LC100
	mov	w2, 8
	mov	w1, w24
	add	x0, x26, x23, uxtw 3
	bl	qsort
	cbz	w23, .L941
.L961:
	mov	x0, 0
	.p2align 2
.L942:
	add	w1, w24, w0
	add	x3, x29, 480
	ldr	x2, [x26, x0, lsl 3]
	add	x0, x0, 1
	add	x1, x3, x1, lsl 3
	cmp	w23, w0
	str	x2, [x1, -256]
	bhi	.L942
.L941:
	cmp	w25, w23
	bls	.L943
	mov	w0, w23
	.p2align 2
.L944:
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
	bne	.L944
.L943:
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
	cbz	w28, .L945
	add	x21, x21, 3584
	mov	x0, 0
	add	x25, x29, 352
	.p2align 2
.L946:
	ldr	x1, [x21], 8
	str	x1, [x25, x0, lsl 3]
	add	x0, x0, 1
	cmp	w28, w0
	bhi	.L946
.L945:
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
.L935:
	cmp	w3, 1
	cset	w0, hi
	tst	w1, w0
	beq	.L947
	cbz	w3, .L948
	ldr	x6, [x19, 28704]
	ldr	x0, [x19, 28968]
	cmp	x6, x0
	bne	.L947
	sub	w0, w3, #1
	mov	x2, x19
	add	x0, x19, x0, lsl 3
.L950:
	cmp	x0, x2
	beq	.L952
	ldr	x5, [x2, 28712]
	add	x2, x2, 8
	ldr	x1, [x2, 28968]
	cmp	x5, x1
	beq	.L950
	.p2align 2
.L947:
	orr	w0, w3, w4
	cbz	w0, .L1021
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
	bhi	.L958
	.p2align 2
.L957:
	add	x2, x19, x0, uxtw 3
	add	w0, w0, 1
	cmp	w0, 33
	str	xzr, [x2, 28704]
	bne	.L957
	b	.L958
	.p2align 3
.L918:
	ldr	w0, [x21, 3720]
	cbz	w0, .L966
	sub	w3, w0, #1
	mov	w23, 0
	add	x3, x3, 3505
	add	x0, x21, 3456
	add	x3, x19, x3, lsl 3
	b	.L923
	.p2align 3
.L922:
	cmp	x0, x3
	beq	.L921
.L923:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 2]
	cmp	w2, 3
	bne	.L922
	ldr	w2, [x1, 732]
	add	x5, x19, x23, uxtw 3
	ldr	w4, [x22, 3384]
	add	x1, x1, 720
	cmp	w4, w2
	blt	.L922
	str	x1, [x5, 28704]
	cmp	x0, x3
	add	w23, w23, 1
	bne	.L923
	.p2align 2
.L921:
	add	x25, x19, 28672
	ldr	x3, .LC97
	mov	w2, 8
	mov	w1, w23
	add	x0, x25, 32
	bl	qsort
	ldr	w24, [x21, 3720]
	cbz	w24, .L924
	sub	w2, w24, #1
	add	x0, x21, 3456
	add	x2, x2, 3505
	mov	w26, w23
	add	x2, x19, x2, lsl 3
	b	.L926
	.p2align 3
.L925:
	cmp	x0, x2
	beq	.L1022
.L926:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w3, [x1, 2]
	cmp	w3, 3
	bne	.L925
	ldr	w3, [x1, 732]
	add	x5, x19, x26, uxtw 3
	ldr	w4, [x22, 3384]
	add	x1, x1, 720
	cmp	w4, w3
	bge	.L925
	str	x1, [x5, 28704]
	cmp	x0, x2
	add	w26, w26, 1
	bne	.L926
	.p2align 2
.L1022:
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
	cbz	w23, .L928
.L960:
	add	x25, x25, 32
	mov	w0, 0
	.p2align 2
.L929:
	add	w1, w24, w0
	ldr	x2, [x25], 8
	add	x1, x1, 3621
	add	w0, w0, 1
	cmp	w0, w23
	str	x2, [x19, x1, lsl 3]
	bcc	.L929
.L928:
	cmp	w26, w23
	bls	.L930
	mov	w0, w23
	.p2align 2
.L931:
	sub	w1, w0, w23
	add	x2, x19, x0, uxtw 3
	add	x1, x1, 3621
	add	w0, w0, 1
	cmp	w0, w26
	ldr	x2, [x2, 28704]
	str	x2, [x19, x1, lsl 3]
	bne	.L931
.L930:
	str	w26, [x20, 1628]
	str	w26, [x20, 1632]
	ldr	w1, [x21, 3724]
	cbz	w1, .L967
	sub	w3, w1, #1
	add	x0, x21, 3584
	add	x3, x3, 3521
	mov	w21, w26
	add	x3, x19, x3, lsl 3
	b	.L934
	.p2align 3
.L933:
	cmp	x3, x0
	beq	.L1023
.L934:
	ldr	x1, [x0]
	add	x0, x0, 8
	ldrb	w2, [x1, 1]
	cmp	w2, 3
	bne	.L933
	ldrb	w2, [x1, 721]
	cmp	w2, 1
	bne	.L933
	add	x2, x19, x21, uxtw 3
	add	x1, x1, 720
	cmp	x3, x0
	add	w21, w21, 1
	str	x1, [x2, 28704]
	str	x1, [x2, 28968]
	bne	.L934
	.p2align 2
.L1023:
	sub	w1, w21, w26
.L932:
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
	b	.L935
	.p2align 3
.L1017:
	ldr	w0, [x21, 3720]
	mov	w23, 0
	cbz	w0, .L900
	sub	w4, w0, #1
	mov	w23, 0
	add	x4, x4, 3505
	add	x0, x21, 3456
	add	x4, x19, x4, lsl 3
	.p2align 2
.L909:
	ldr	x2, [x0]
	add	x1, x29, 480
	add	x1, x1, x23, uxtw 3
	add	x0, x0, 8
	sub	x1, x1, #4096
	cmp	x4, x0
	ldrb	w3, [x2, 2]
	cbz	w3, .L908
	add	w23, w23, 1
	str	x2, [x1, 3712]
.L908:
	bne	.L909
.L900:
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
	cbz	w23, .L910
	add	x21, x21, 3584
	mov	x0, 0
	add	x25, x29, 352
	.p2align 2
.L911:
	ldr	x1, [x21], 8
	str	x1, [x25, x0, lsl 3]
	add	x0, x0, 1
	cmp	w23, w0
	bhi	.L911
.L910:
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
	cbnz	w2, .L912
.L1019:
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, 2
	bne	.L913
	ldrb	w0, [x22, 2675]
	cbz	w0, .L1024
	cmp	w0, 1
	ldr	x0, [x22, 3352]
	beq	.L1025
	add	x0, x0, 816
	mov	w2, 1
	str	x0, [x19, 28704]
	b	.L912
	.p2align 3
.L1024:
	ldr	x0, [x22, 3352]
	mov	w2, 1
	add	x0, x0, 720
	str	x0, [x19, 28704]
	b	.L912
.L948:
	ldr	x6, [x19, 28968]
.L952:
	ldr	x0, [x19, 28976]
	str	x0, [x19, 28968]
	str	x6, [x19, 28976]
	b	.L947
.L1025:
	add	x0, x0, 768
	mov	w2, 1
	str	x0, [x19, 28704]
	b	.L912
.L1020:
	add	x26, x29, 96
	ldr	x3, .LC99
	mov	w2, 8
	mov	w1, 0
	mov	x0, x26
	mov	w23, 0
	bl	qsort
	ldr	w24, [x21, 3720]
	cbnz	w24, .L962
	ldr	x3, .LC100
	mov	w2, 8
	mov	w1, 0
	mov	x0, x26
	mov	w25, 0
	bl	qsort
	b	.L943
	.p2align 3
.L966:
	mov	w23, 0
	b	.L921
.L924:
	uxtw	x22, w23
	ldr	x3, .LC98
	add	x22, x22, 3588
	mov	w2, 8
	mov	w1, 0
	mov	w26, w23
	add	x22, x19, x22, lsl 3
	mov	x0, x22
	bl	qsort
	cbnz	w23, .L960
	b	.L930
	.p2align 3
.L967:
	mov	w21, w26
	b	.L932
.L965:
	mov	w21, w23
	b	.L904
.L964:
	mov	w23, 0
	b	.L901
.L938:
	ldr	x3, .LC100
	mov	w2, 8
	mov	w1, 0
	add	x0, x26, x23, uxtw 3
	mov	w25, w23
	bl	qsort
	cbnz	w23, .L961
	b	.L943
	.p2align 3
.L913:
	ldr	x1, .LC96
.L1013:
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearCurrSlice
	mov	w0, -1
	b	.L1008
.L1021:
	ldr	x1, .LC102
	b	.L1013
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
	tbz	x0, 13, .L1026
	mov	x0, x19
	bl	DumpList.part.5
.L1026:
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
	cbz	w0, .L1035
	add	x1, x19, 61440
	ldr	x3, [x19, 27904]
	cmp	w0, 1
	ldr	w7, [x1, 3380]
	ldr	w1, [x3, 688]
	sub	w1, w7, w1
	sxtw	x1, w1
	eor	x6, x1, x1, asr 63
	sub	x6, x6, x1, asr 63
	bls	.L1036
	sub	w0, w0, #2
	add	x2, x2, 3336
	add	x1, x0, 3490
	mov	w0, 0
	add	x5, x19, x1, lsl 3
	.p2align 2
.L1034:
	ldr	x4, [x2]
	add	x2, x2, 8
	ldr	w1, [x4, 688]
	sub	w1, w7, w1
	sxtw	x1, w1
	eor	x3, x1, x1, asr 63
	sub	x3, x3, x1, asr 63
	cmp	w3, w6
	bge	.L1033
	ldr	w0, [x4, 188]
	mov	w6, w3
.L1033:
	cmp	x2, x5
	bne	.L1034
.L1032:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1036:
	mov	w0, 0
	b	.L1032
.L1035:
	mov	w0, -1
	b	.L1032
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
	beq	.L1038
	add	x1, x19, 61440
	ldrb	w1, [x1, 2675]
	cbnz	w1, .L1068
	add	x6, x19, 24576
	ldr	w5, [x0, 1628]
	add	x6, x6, 4000
	mov	w4, 0
	add	x7, x19, 28672
	.p2align 2
.L1042:
	cbz	w5, .L1046
	add	x1, x7, 32
	mov	w3, 32
	mov	w0, 0
	b	.L1044
	.p2align 3
.L1043:
	add	w0, w0, 1
	cmp	w0, w5
	beq	.L1069
.L1044:
	ldr	x2, [x1]
	add	x1, x1, 8
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 712]
	cmp	w2, w4
	bne	.L1043
	cmp	w3, w0
	csel	w3, w3, w0, ls
	add	w0, w0, 1
	stp	w3, w3, [x6]
	cmp	w0, w5
	bne	.L1044
.L1069:
	cmp	w3, 31
	bhi	.L1046
.L1045:
	add	w4, w4, 1
	add	x6, x6, 8
	cmp	w4, 16
	bne	.L1042
.L1038:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L1068:
	ldr	w6, [x0, 1628]
	add	x7, x19, 24576
	add	x7, x7, 4000
	mov	w4, 0
	add	x8, x19, 28672
	cbz	w6, .L1050
	.p2align 2
.L1071:
	add	x2, x8, 32
	mov	w5, 32
	mov	w1, 0
	b	.L1048
	.p2align 3
.L1047:
	add	w1, w1, 1
	cmp	w1, w6
	beq	.L1070
.L1048:
	ldr	x0, [x2]
	add	x2, x2, 8
	ldr	x3, [x0, 40]
	ldrb	w0, [x0]
	cmp	w0, 2
	ldr	w0, [x3, 712]
	cset	w3, eq
	orr	w0, w3, w0, lsl 1
	cmp	w0, w4
	bne	.L1047
	cmp	w5, w1
	csel	w5, w5, w1, ls
	add	w1, w1, 1
	str	w5, [x7]
	cmp	w1, w6
	bne	.L1048
.L1070:
	cmp	w5, 31
	bhi	.L1050
.L1049:
	add	w4, w4, 1
	add	x7, x7, 4
	cmp	w4, 32
	beq	.L1038
	cbnz	w6, .L1071
	.p2align 2
.L1050:
	str	wzr, [x7]
	b	.L1049
	.p2align 3
.L1046:
	stp	wzr, wzr, [x6]
	b	.L1045
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
	cbz	w0, .L1073
	add	x2, x19, 61440
	ldr	x3, [x19, 27904]
	cmp	w0, 1
	ldr	w6, [x2, 3380]
	ldr	w2, [x3, 688]
	sub	w2, w6, w2
	sxtw	x2, w2
	eor	x5, x2, x2, asr 63
	sub	x5, x5, x2, asr 63
	bls	.L1082
	sub	w4, w0, #2
	add	x1, x1, 3336
	add	x4, x4, 3490
	mov	w7, 0
	add	x4, x19, x4, lsl 3
	.p2align 2
.L1075:
	ldr	x3, [x1]
	add	x1, x1, 8
	ldr	w0, [x3, 688]
	sub	w0, w6, w0
	sxtw	x0, w0
	eor	x2, x0, x0, asr 63
	sub	x2, x2, x0, asr 63
	cmp	w2, w5
	bge	.L1074
	ldr	w7, [x3, 188]
	mov	w5, w2
.L1074:
	cmp	x1, x4
	bne	.L1075
.L1073:
	add	x20, x19, 20480
	mov	w21, -1
	ldrb	w0, [x20, 1584]
	str	w21, [x20, 3212]
	cmp	w0, 2
	str	w7, [x20, 3216]
	beq	.L1092
	mov	x0, x19
	bl	InitListX
	cbnz	w0, .L1093
	ldr	x1, .LC107
	mov	w0, 13
	bl	dprint_vfmw
	ldr	x22, .LC108
	ldr	w0, [x22]
	tbnz	x0, 13, .L1094
.L1079:
	mov	x0, x19
	bl	ReorderListX
	mov	x0, x19
	bl	RepairList
	cbnz	w0, .L1083
	mov	x0, x19
	bl	FindMinRefIdx
	ldr	x0, [x19, 28704]
	cbz	x0, .L1084
	ldr	x0, [x0, 40]
	ldr	w0, [x0, 188]
.L1080:
	ldr	x1, .LC110
	mov	w21, 0
	str	w0, [x20, 3212]
	mov	w0, 13
	bl	dprint_vfmw
	ldr	w0, [x22]
	tbz	x0, 13, .L1077
	mov	x0, x19
	bl	DumpList.part.5
.L1077:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1092:
	str	wzr, [x20, 1628]
	mov	w21, 0
	str	wzr, [x20, 1632]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1094:
	mov	x0, x19
	bl	DumpList.part.5
	b	.L1079
	.p2align 3
.L1084:
	mov	w0, -1
	b	.L1080
	.p2align 3
.L1083:
	mov	w21, -1
	b	.L1077
.L1082:
	mov	w7, 0
	b	.L1073
.L1093:
	ldr	x1, .LC105
	mov	w0, 13
	bl	dprint_vfmw
	b	.L1077
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
	cbz	w0, .L1102
	sub	w2, w0, #1
	mov	w4, 872
	mov	x3, 30108
	add	x0, x19, 28672
	add	x0, x0, 564
	umaddl	x3, w2, w4, x3
	add	x3, x19, x3
	b	.L1101
	.p2align 3
.L1109:
	ldrb	w2, [x0]
	cmp	w2, 1
	beq	.L1099
	add	x0, x0, 872
	cmp	x0, x3
	beq	.L1102
.L1101:
	ldr	w2, [x0, 688]
	cmp	w2, 1
	bne	.L1109
.L1099:
	strb	wzr, [x0, -3]
	strb	wzr, [x0, -2]
	add	x0, x0, 872
	cmp	x0, x3
	bne	.L1101
.L1102:
	ldr	w0, [x1, 1336]
	cbz	w0, .L1095
	sub	w0, w0, #1
	add	x1, x1, 1264
	add	x0, x0, 16384
	add	x0, x0, 317
	add	x0, x19, x0, lsl 2
	.p2align 2
.L1103:
	str	wzr, [x1], 4
	cmp	x1, x0
	bne	.L1103
.L1095:
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
	cbz	w0, .L1127
.L1111:
	ldr	w0, [x22, 1332]
	mov	w23, 0
	mov	w20, 872
	cbz	w0, .L1118
	.p2align 2
.L1122:
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
.L1116:
	ldr	x1, [x19]
	cbnz	x1, .L1128
.L1115:
	add	x19, x19, 8
	cmp	x19, x21
	bne	.L1116
	ldr	w0, [x22, 1332]
	add	w23, w23, 1
	cmp	w0, w23
	bhi	.L1122
.L1118:
	ldr	w0, [x22, 1336]
	cbz	w0, .L1110
	sub	w1, w0, #1
	add	x0, x22, 1264
	add	x1, x1, 16384
	add	x1, x1, 317
	add	x24, x24, x1, lsl 2
	.p2align 2
.L1119:
	str	wzr, [x0], 4
	cmp	x0, x24
	bne	.L1119
.L1110:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1128:
	ldr	w0, [x22, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L1115
.L1127:
	add	x0, x24, 8
	bl	ResetVoQueue
	b	.L1111
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
	bne	.L1131
	add	x6, x21, 24576
	ldr	w5, [x19, 3272]
	mov	w2, 0
	ldr	w6, [x6, 3712]
	add	w6, w6, 1
	cmp	w5, w6
	bls	.L1132
.L1131:
	ldr	x2, .LC111
	ldr	x6, [x2]
	cbz	x6, .L1135
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
.L1135:
	ldr	w5, [x19, 3272]
	mov	w2, 1
.L1132:
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
	beq	.L1138
	cbz	w3, .L1139
	cmp	w3, 2
	bne	.L1136
	cmp	w7, 5
	beq	.L1193
	ldr	w1, [x0, 728]
	cbz	w1, .L1172
	ldr	w1, [x0, 768]
	mov	w3, 0
	mov	w2, 0
	str	wzr, [x0, 764]
	str	wzr, [x0, 776]
.L1173:
	str	w2, [x0, 772]
.L1175:
	ldr	w4, [x0, 1616]
	add	w2, w1, w2
	str	w2, [x0, 760]
	lsl	w1, w2, 1
	cbnz	w4, .L1176
	sub	w1, w1, #1
	str	w1, [x0, 748]
.L1177:
	ldrb	w2, [x0, 1585]
	cbnz	w2, .L1178
	str	w1, [x0, 736]
	str	w1, [x0, 740]
	str	w1, [x0, 744]
.L1171:
	ldr	w1, [x0, 768]
	str	w1, [x0, 764]
	str	w3, [x0, 776]
.L1136:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1139:
	ldr	w1, [x1, 2204]
	cmp	w7, 5
	add	w1, w1, 4
	lsl	w4, w4, w1
	beq	.L1145
	ldr	w1, [x0, 728]
	cbnz	w1, .L1143
	ldr	w5, [x0, 712]
	ldr	w3, [x0, 716]
	mov	w2, w5
.L1144:
	ldr	w1, [x0, 704]
	cmp	w1, w3
	bcs	.L1142
	sub	w6, w3, w1
	cmp	w6, w4, lsr 1
	bcc	.L1142
	add	w2, w2, w4
	str	w2, [x0, 720]
.L1146:
	ldrb	w3, [x0, 1585]
	cbnz	w3, .L1148
.L1196:
	ldr	w3, [x0, 708]
	add	w1, w1, w2
	str	w1, [x0, 736]
	add	w2, w1, w3
	str	w2, [x0, 740]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 748]
.L1149:
	ldr	w3, [x0, 764]
	ldr	w2, [x0, 768]
	str	w1, [x0, 744]
	cmp	w2, w3
	beq	.L1151
	str	w2, [x0, 764]
.L1151:
	ldr	w1, [x0, 1616]
	cbz	w1, .L1136
	ldr	w2, [x0, 704]
	ldr	w1, [x0, 720]
	str	w1, [x0, 712]
	str	w2, [x0, 716]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1138:
	cmp	w7, 5
	beq	.L1194
	ldr	w3, [x0, 728]
	cbz	w3, .L1154
	mov	w2, 0
	str	wzr, [x0, 764]
	str	wzr, [x0, 776]
.L1155:
	str	w2, [x0, 772]
.L1153:
	ldr	w2, [x1, 2216]
	cbz	w2, .L1157
	ldr	w2, [x0, 768]
	ldr	w5, [x0, 772]
	ldr	w6, [x0, 1616]
	add	w5, w5, w2
	str	w5, [x0, 760]
	cbnz	w6, .L1159
	cbz	w5, .L1160
	sub	w5, w5, #1
	str	w5, [x0, 760]
.L1159:
	str	wzr, [x0, 792]
	ldr	w2, [x1, 2216]
	cmp	w2, wzr
	ble	.L1161
.L1180:
	mov	w4, 0
	mov	w3, 0
	.p2align 2
.L1162:
	add	x2, x1, x3, sxtw 2
	add	w3, w3, 1
	ldr	w2, [x2, 2220]
	add	w4, w4, w2
	str	w4, [x0, 792]
	ldr	w2, [x1, 2216]
	cmp	w2, w3
	bgt	.L1162
.L1161:
	cbz	w5, .L1163
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
	tbnz	w5, #31, .L1164
	mov	w3, 0
	.p2align 2
.L1165:
	add	x4, x1, x3, sxtw 2
	add	w3, w3, 1
	cmp	w5, w3
	ldr	w4, [x4, 2220]
	add	w2, w2, w4
	str	w2, [x0, 788]
	bge	.L1165
.L1164:
	cbnz	w6, .L1166
	ldr	w3, [x1, 2208]
	add	w2, w2, w3
	str	w2, [x0, 788]
.L1166:
	ldrb	w3, [x0, 1585]
	cbnz	w3, .L1167
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
.L1168:
	ldr	w3, [x0, 768]
	ldr	w1, [x0, 772]
	str	w2, [x0, 744]
	str	w3, [x0, 764]
	str	w1, [x0, 776]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1143:
	ldr	w5, [x0, 732]
	cbz	w5, .L1195
.L1145:
	ldr	w1, [x0, 704]
	mov	w2, 0
	mov	w5, 0
	str	wzr, [x0, 712]
	str	wzr, [x0, 716]
.L1142:
	cmp	w1, w3
	bls	.L1147
	sub	w3, w1, w3
	cmp	w3, w4, lsr 1
	bls	.L1147
	sub	w2, w2, w4
	str	w2, [x0, 720]
	b	.L1146
	.p2align 3
.L1193:
	add	x1, x0, 512
	mov	w3, 0
	stp	wzr, wzr, [x1, 224]
	stp	wzr, wzr, [x1, 232]
	str	wzr, [x0, 772]
	b	.L1171
	.p2align 3
.L1194:
	str	wzr, [x0, 772]
	b	.L1153
	.p2align 3
.L1147:
	ldrb	w3, [x0, 1585]
	str	w5, [x0, 720]
	cbz	w3, .L1196
.L1148:
	ldrb	w3, [x0, 1586]
	add	w1, w1, w2
	cbnz	w3, .L1150
	str	w1, [x0, 736]
	str	w1, [x0, 748]
	b	.L1149
	.p2align 3
.L1157:
	ldr	w6, [x0, 1616]
	str	wzr, [x0, 760]
.L1160:
	str	wzr, [x0, 792]
	mov	w5, 0
	ldr	w2, [x1, 2216]
	cmp	w2, wzr
	bgt	.L1180
	.p2align 2
.L1163:
	mov	w2, 0
	str	wzr, [x0, 788]
	b	.L1164
	.p2align 3
.L1167:
	ldrb	w3, [x0, 1586]
	cbnz	w3, .L1169
	ldr	w1, [x0, 752]
	add	w2, w2, w1
	str	w2, [x0, 736]
	str	w2, [x0, 748]
	b	.L1168
	.p2align 3
.L1172:
	ldr	w3, [x0, 764]
	ldr	w1, [x0, 768]
	cmp	w1, w3
	ldr	w3, [x0, 776]
	bcs	.L1174
	add	w2, w2, w3
	str	w2, [x0, 772]
	mov	w3, w2
	b	.L1175
	.p2align 3
.L1154:
	ldr	w3, [x0, 764]
	ldr	w4, [x0, 768]
	cmp	w4, w3
	bcs	.L1156
	ldr	w3, [x0, 776]
	add	w2, w3, w2
	str	w2, [x0, 772]
	b	.L1153
	.p2align 3
.L1178:
	ldrb	w2, [x0, 1586]
	str	w1, [x0, 744]
	cbnz	w2, .L1179
	str	w1, [x0, 736]
	b	.L1171
	.p2align 3
.L1176:
	str	w1, [x0, 748]
	b	.L1177
	.p2align 3
.L1150:
	str	w1, [x0, 740]
	str	w1, [x0, 748]
	b	.L1149
	.p2align 3
.L1169:
	ldr	w3, [x1, 2212]
	ldr	w1, [x0, 752]
	add	w2, w2, w3
	add	w2, w2, w1
	str	w2, [x0, 740]
	str	w2, [x0, 748]
	b	.L1168
	.p2align 3
.L1195:
	ldr	w3, [x0, 736]
	mov	w2, 0
	str	wzr, [x0, 712]
	str	w3, [x0, 716]
	b	.L1144
	.p2align 3
.L1179:
	str	w1, [x0, 740]
	b	.L1171
.L1156:
	ldr	w2, [x0, 776]
	b	.L1155
.L1174:
	mov	w2, w3
	b	.L1173
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
	cbz	w2, .L1198
	cmp	w2, 1
	mov	w1, 0
	cset	w8, eq
	cmp	w2, 2
	ldr	w2, [x0, 3720]
	cset	w9, eq
	cbz	w2, .L1218
	.p2align 2
.L1235:
	add	x3, x19, x1, uxtw 3
	ldr	x2, [x3, 28032]
	ldrb	w4, [x2, 2]
	cbz	w4, .L1212
	ldr	w4, [x2, 676]
	ldr	w5, [x6, 3368]
	cmp	w4, w5
	bls	.L1213
	sub	w4, w4, w7
	str	w4, [x2, 680]
.L1214:
	ldr	x2, [x3, 28032]
	ldrb	w4, [x2, 2]
	tbz	x4, 0, .L1215
	ldr	w5, [x2, 768]
	and	w5, w5, 16776960
	cmp	w5, 65536
	beq	.L1245
.L1215:
	tbz	x4, 1, .L1212
	ldr	w3, [x2, 816]
	and	w3, w3, 16776960
	cmp	w3, 65536
	beq	.L1246
	.p2align 2
.L1212:
	ldr	w2, [x0, 3720]
	add	w1, w1, 1
	cmp	w2, w1
	bhi	.L1235
.L1218:
	ldr	w2, [x0, 3724]
	mov	w1, 0
	cbz	w2, .L1197
	.p2align 2
.L1234:
	add	x4, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x3, [x4, 28160]
	ldrb	w2, [x3, 2]
	cbz	w2, .L1220
	tbz	x2, 0, .L1221
	ldr	w5, [x3, 768]
	and	w5, w5, 16776960
	cmp	w5, 256
	beq	.L1247
.L1221:
	tbz	x2, 1, .L1220
	ldr	w2, [x3, 816]
	and	w2, w2, 16776960
	cmp	w2, 256
	beq	.L1248
	.p2align 2
.L1220:
	ldr	w2, [x0, 3724]
	cmp	w2, w1
	bhi	.L1234
.L1197:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1213:
	str	w4, [x2, 680]
	b	.L1214
	.p2align 3
.L1198:
	ldr	w2, [x0, 3720]
	mov	w1, 0
	cbnz	w2, .L1233
	.p2align 2
.L1208:
	ldr	w2, [x0, 3724]
	mov	w1, 0
	cbz	w2, .L1197
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x2, [x2, 28160]
	ldrb	w3, [x2, 2]
	cmp	w3, 3
	beq	.L1249
	.p2align 2
.L1209:
	ldr	w2, [x0, 3724]
	cmp	w2, w1
	bls	.L1197
	add	x2, x19, x1, uxtw 3
	add	w1, w1, 1
	ldr	x2, [x2, 28160]
	ldrb	w3, [x2, 2]
	cmp	w3, 3
	bne	.L1209
.L1249:
	ldr	w3, [x2, 720]
	and	w3, w3, 16776960
	cmp	w3, 256
	bne	.L1209
	ldr	w3, [x2, 684]
	str	w3, [x2, 724]
	b	.L1209
	.p2align 3
.L1251:
	ldr	w4, [x2, 720]
	and	w4, w4, 16776960
	cmp	w4, 65536
	bne	.L1204
	ldr	w4, [x2, 676]
	ldr	w5, [x6, 3368]
	cmp	w4, w5
	sub	w5, w4, w7
	bhi	.L1250
	str	w4, [x2, 680]
.L1206:
	ldr	x2, [x3, 28032]
	ldr	w3, [x2, 680]
	str	w3, [x2, 728]
	.p2align 2
.L1204:
	ldr	w2, [x0, 3720]
	add	w1, w1, 1
	cmp	w2, w1
	bls	.L1208
.L1233:
	add	x3, x19, x1, uxtw 3
	ldr	x2, [x3, 28032]
	ldrb	w4, [x2, 2]
	cmp	w4, 3
	bne	.L1204
	b	.L1251
	.p2align 3
.L1247:
	ldr	w2, [x3, 684]
	add	w2, w8, w2, lsl 1
	str	w2, [x3, 772]
	ldr	x3, [x4, 28160]
	ldrb	w2, [x3, 2]
	b	.L1221
	.p2align 3
.L1245:
	ldr	w4, [x2, 680]
	add	w4, w8, w4, lsl 1
	str	w4, [x2, 776]
	ldr	x2, [x3, 28032]
	ldrb	w4, [x2, 2]
	b	.L1215
	.p2align 3
.L1248:
	ldr	w2, [x3, 684]
	add	w2, w9, w2, lsl 1
	str	w2, [x3, 820]
	b	.L1220
	.p2align 3
.L1246:
	ldr	w3, [x2, 680]
	add	w3, w9, w3, lsl 1
	str	w3, [x2, 824]
	b	.L1212
	.p2align 3
.L1250:
	str	w5, [x2, 680]
	b	.L1206
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
	cbz	x20, .L1257
	add	x0, x19, 24576
	ldr	w3, [x0, 3716]
	cbz	w3, .L1257
	ldr	x0, [x19, 27904]
	cmp	x20, x0
	beq	.L1259
	sub	w3, w3, #1
	mov	x0, x19
	add	x3, x19, x3, lsl 3
	b	.L1254
	.p2align 3
.L1255:
	ldr	x2, [x0, 27904]
	cmp	x20, x2
	beq	.L1259
.L1254:
	cmp	x0, x3
	add	x0, x0, 8
	bne	.L1255
.L1257:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1259:
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
	mov	x20, x0
	mov	x0, x30
	add	x21, x20, 61440
	add	x19, x20, 65536
	bl	_mcount
	ldr	x1, .LC117
	mov	w0, 2
	ldr	w4, [x21, 2868]
	ldrb	w3, [x21, 2675]
	ldr	w2, [x21, 3376]
	ldr	w5, [x21, 3428]
	bl	dprint_vfmw
	str	wzr, [x19, 2744]
	ldr	w4, [x19, 2832]
	str	wzr, [x19, 2844]
	cmp	w4, 1
	beq	.L1264
	add	x2, x20, 16384
	add	x0, x20, 12288
	add	x2, x2, 2592
	add	x0, x0, 2688
	add	x3, x20, 20480
.L1265:
	ldr	x5, [x21, 3328]
	cmp	w4, 1
	ldr	x1, [x19, 2736]
	str	x5, [x19, 1408]
	str	x1, [x19, 2456]
	ldr	w1, [x21, 2852]
	str	w1, [x19, 2236]
	ldr	w1, [x21, 2856]
	str	w1, [x19, 2240]
	ldr	w1, [x21, 2860]
	str	w1, [x19, 2244]
	ldr	w1, [x21, 3376]
	str	w1, [x19, 1416]
	ldrb	w1, [x21, 2675]
	strb	w1, [x19, 1400]
	ldrb	w1, [x0, 19]
	str	w1, [x19, 1432]
	ldr	w1, [x21, 3412]
	str	w1, [x19, 1420]
	ldr	w1, [x21, 3416]
	str	w1, [x19, 1424]
	ldr	w1, [x0, 3248]
	add	w1, w1, 1
	str	w1, [x19, 1428]
	ldrb	w1, [x0, 18]
	strb	w1, [x19, 1403]
	ldr	w1, [x2, 60]
	str	w1, [x19, 1436]
	ldrb	w1, [x2]
	str	w1, [x19, 1440]
	ldr	w0, [x0, 40]
	strb	w0, [x19, 1401]
	ldrb	w0, [x2, 4]
	str	w0, [x19, 1444]
	ldr	w0, [x3, 748]
	str	w0, [x19, 1448]
	ldr	w0, [x3, 736]
	str	w0, [x19, 1452]
	ldr	w0, [x3, 740]
	str	w0, [x19, 1456]
	beq	.L1281
	ldr	x1, [x21, 3352]
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	mov	x23, x0
	cbz	x0, .L1300
	ldr	x2, [x0, 680]
	ldr	x3, [x0, 688]
	cbz	x2, .L1270
	cbz	x3, .L1270
	ldr	w0, [x19, 2820]
	add	x3, x19, 1836
	add	x2, x19, 1708
	add	x1, x19, 2096
	add	x22, x20, 24576
	bl	FSP_GetDecFsAddrTab
	ldr	x3, [x23, 680]
	add	x2, x19, 2100
	ldr	w0, [x19, 2820]
	add	x1, x19, 2228
	ldr	w3, [x3, 8]
	str	w3, [x19, 1692]
	bl	FSP_GetPmvAddrTab
	ldr	w0, [x21, 3428]
	str	w0, [x19, 1700]
	ldr	w0, [x23, 708]
	str	w0, [x19, 2232]
	ldr	x0, [x23, 688]
	ldr	w0, [x0, 16]
	str	w0, [x19, 1696]
	ldr	x0, [x23, 688]
	ldr	w0, [x0, 76]
	str	w0, [x19, 1704]
	ldr	w4, [x22, 3992]
	str	w4, [x19, 2448]
	cbz	w4, .L1276
	sub	w3, w4, #1
	add	x0, x22, 3800
	add	x3, x3, 4096
	add	x1, x19, 2256
	add	x3, x3, 2999
	add	x3, x20, x3, lsl 2
	.p2align 2
.L1275:
	ldr	w2, [x0]
	add	x0, x0, 4
	str	w2, [x1]
	add	x1, x1, 4
	cmp	x3, x0
	ldr	w2, [x0, 60]
	str	w2, [x1, 60]
	ldr	w2, [x0, 124]
	str	w2, [x1, 124]
	bne	.L1275
.L1276:
	add	x0, x20, 12288
	ldrb	w0, [x0, 2713]
	cbz	w0, .L1273
	add	x0, x20, 16384
	ldrb	w0, [x0, 2610]
.L1277:
	cmp	w0, 1
	add	x5, x19, 1460
	mov	w1, 0
	beq	.L1283
	.p2align 2
.L1286:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 4096
	cmp	w1, 24
	add	x0, x20, x0, lsl 2
	ldr	w0, [x0, 564]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1286
	add	x6, x19, 1556
	mov	w10, 1
	mov	w5, 0
	.p2align 2
.L1287:
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
	add	x0, x20, x0, lsl 2
	add	x1, x20, x1, lsl 2
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
	bne	.L1287
.L1285:
	mov	w23, 0
	cbz	w4, .L1281
	.p2align 2
.L1289:
	add	x21, x20, x23, uxtw 2
	ldr	w0, [x19, 2820]
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
	bhi	.L1289
.L1281:
	mov	w0, 0
.L1267:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1283:
	uxtw	x0, w1
	add	w1, w1, 1
	add	x0, x0, 4096
	cmp	w1, 24
	add	x0, x0, 1144
	ldr	w0, [x20, x0, lsl 2]
	ubfx	x3, x0, 8, 8
	lsr	w2, w0, 16
	ubfiz	w2, w2, 8, 8
	and	w0, w0, -16776961
	orr	w2, w2, w3, lsl 16
	orr	w0, w2, w0
	str	w0, [x5], 4
	bne	.L1283
	add	x6, x19, 1556
	mov	w10, 1
	mov	w5, 0
	.p2align 2
.L1284:
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
	ldr	w0, [x20, x0, lsl 2]
	ldr	w1, [x20, x1, lsl 2]
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
	bne	.L1284
	b	.L1285
	.p2align 3
.L1273:
	add	x0, x20, 16384
	ldrb	w0, [x0, 2610]
	cbnz	w0, .L1277
	ldr	x10, .LC122
	add	x5, x19, 1460
	mov	w1, 0
	.p2align 2
.L1278:
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
	bne	.L1278
	add	x6, x19, 1556
	mov	w5, 0
	.p2align 2
.L1279:
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
	bne	.L1279
	b	.L1285
	.p2align 3
.L1264:
	add	x3, x20, 20480
	mov	w2, 2208
	ldr	x6, [x20, 14968]
	mov	w0, 4000
	ldr	x5, [x20, 14960]
	ldr	w1, [x3, 1596]
	umull	x1, w1, w2
	add	x2, x6, x1
	ldr	w1, [x2, 28]
	umull	x0, w1, w0
	add	x0, x5, x0
	b	.L1265
.L1270:
	ldr	x1, .LC121
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1267
.L1300:
	ldr	x2, [x21, 3352]
	mov	w0, 0
	ldr	x1, .LC119
	ldr	w2, [x2, 672]
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1267
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
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x26, x21, 65536
	bl	_mcount
	ldr	w0, [x26, 2832]
	ldr	w7, [x26, 2744]
	cmp	w0, 1
	beq	.L1303
	add	x4, x21, 16384
	add	x6, x21, 12288
	add	x4, x4, 2592
	add	x6, x6, 2688
	add	x25, x21, 20480
.L1304:
	add	w0, w7, 1
	str	w0, [x26, 2744]
	uxtw	x20, w7
	ldr	x8, [x26, 2736]
	ldr	w1, [x21, 14940]
	lsl	x5, x20, 7
	sub	x5, x5, x20
	sub	w1, w1, #1
	lsl	x5, x5, 5
	cmp	w7, w1
	add	x19, x8, x5
	bcs	.L1305
	lsl	x1, x0, 7
	sub	x0, x1, x0
	add	x0, x8, x0, lsl 5
	str	x0, [x19, 4056]
.L1306:
	ldr	x3, [x21, 632]
	ldrb	w2, [x3]
	ldr	w0, [x3, 76]
	cmp	w2, 1
	ccmp	w2, w0, 2, ls
	bcs	.L1307
	.p2align 2
.L1308:
	uxtw	x0, w2
	add	w2, w2, 1
	lsl	x1, x0, 5
	add	x3, x3, x1
	add	x0, x19, x0, lsl 2
	ldr	w3, [x3, 28]
	str	w3, [x0, 16]
	ldr	x3, [x21, 632]
	add	x3, x3, x1
	ldr	w3, [x3, 24]
	str	w3, [x0, 8]
	ldr	x3, [x21, 632]
	add	x1, x3, x1
	ldr	w1, [x1, 32]
	str	w1, [x0, 24]
	ldr	x3, [x21, 632]
	ldr	w0, [x3, 76]
	cmp	w0, w2
	ccmp	w2, 1, 2, hi
	bls	.L1308
.L1307:
	cmp	w0, 1
	bhi	.L1313
	.p2align 2
.L1389:
	add	x1, x19, x0, uxtw 2
	add	w0, w0, 1
	cmp	w0, 2
	str	wzr, [x1, 8]
	str	wzr, [x1, 16]
	str	wzr, [x1, 24]
	bne	.L1389
.L1313:
	add	x22, x21, 61440
	ldrb	w0, [x22, 2681]
	strb	w0, [x19, 1]
	ldr	w0, [x4, 48]
	ldr	w1, [x25, 3196]
	add	w0, w0, 26
	add	w0, w0, w1
	str	w0, [x19, 32]
	ldr	w1, [x25, 3192]
	str	w1, [x19, 36]
	ldr	w1, [x25, 1644]
	str	w1, [x19, 40]
	ldr	w1, [x25, 1640]
	str	w1, [x19, 44]
	ldrb	w1, [x25, 1584]
	strb	w1, [x8, x5]
	ldr	w1, [x25, 1636]
	str	w1, [x19, 48]
	ldrb	w1, [x25, 1590]
	strb	w1, [x19, 2]
	ldrb	w1, [x6, 20]
	strb	w1, [x19, 3]
	ldr	w1, [x25, 1628]
	str	w1, [x19, 52]
	ldr	w1, [x25, 1632]
	str	w1, [x19, 56]
	ldrb	w1, [x25, 1584]
	cmp	w1, 1
	beq	.L1415
	cbz	w1, .L1416
	strb	wzr, [x19, 4]
.L1314:
	ldr	w1, [x4, 52]
	str	w1, [x19, 60]
	ldr	w1, [x4, 56]
	str	w1, [x19, 64]
	ldr	w1, [x25, 3204]
	str	w1, [x19, 68]
	ldr	w1, [x25, 3208]
	str	w1, [x19, 72]
	ldr	w1, [x25, 3200]
	str	w1, [x19, 76]
	ldr	w1, [x26, 2832]
	cmp	w1, 1
	beq	.L1302
	ldrb	w1, [x25, 1585]
	cbnz	w1, .L1317
	ldr	x2, [x22, 3352]
	ldr	w1, [x2, 716]
	madd	w0, w7, w1, w0
	ldr	w1, [x26, 2744]
	udiv	w0, w0, w1
	str	w0, [x2, 752]
.L1318:
	ldr	x0, [x22, 3352]
	cbnz	w7, .L1320
	ldr	w1, [x19, 32]
	str	w1, [x0, 744]
	ldr	x0, [x22, 3352]
	ldr	w1, [x19, 32]
	str	w1, [x0, 748]
.L1321:
	ldrb	w0, [x25, 1584]
	cmp	w0, 2
	beq	.L1358
	ldr	w0, [x25, 1628]
	cbz	w0, .L1361
	ldr	x1, [x21, 28704]
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1324
	sub	w3, w0, #1
	mov	x0, x21
	add	x3, x21, x3, lsl 3
	b	.L1326
	.p2align 3
.L1328:
	ldr	x1, [x0, 28712]
	add	x0, x0, 8
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1324
.L1326:
	cmp	x3, x0
	bne	.L1328
.L1361:
	mov	w23, 0
.L1323:
	ldr	w0, [x25, 1632]
	cbz	w0, .L1362
	ldr	x1, [x21, 28968]
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1330
	sub	w3, w0, #1
	mov	x0, x21
	add	x3, x21, x3, lsl 3
	b	.L1332
	.p2align 3
.L1334:
	ldr	x1, [x0, 28976]
	add	x0, x0, 8
	ldr	x1, [x1, 40]
	ldrb	w2, [x1]
	cbz	w2, .L1330
.L1332:
	cmp	x3, x0
	bne	.L1334
.L1362:
	mov	w24, 0
.L1329:
	ldrb	w0, [x22, 2675]
	cbz	w0, .L1335
	ldr	w0, [x25, 1628]
	mov	w28, 0
	cbnz	w0, .L1388
	b	.L1351
	.p2align 3
.L1418:
	cbz	x0, .L1368
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1347:
	lsl	x0, x22, 5
	add	x0, x0, x22, lsl 2
	add	x0, x19, x0
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
	beq	.L1417
	strb	w1, [x0, 1630]
	ldr	x1, [x27, 28704]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1631]
	ldr	x1, [x27, 28704]
	ldr	w1, [x1, 12]
	str	w1, [x0, 1656]
.L1349:
	ldr	w0, [x25, 1628]
	add	w28, w28, 1
	cmp	w0, w28
	bls	.L1351
.L1388:
	uxtw	x22, w28
	ldr	w0, [x26, 2820]
	add	x27, x21, x22, lsl 3
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	ldr	x2, [x27, 28704]
	lsl	x1, x22, 5
	add	x1, x1, x22, lsl 2
	add	x1, x19, x1
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 708]
	str	w2, [x1, 1636]
	ldr	x2, [x27, 28704]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 1625]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1418
	mov	w1, w23
	b	.L1347
	.p2align 3
.L1305:
	str	xzr, [x19, 4056]
	b	.L1306
	.p2align 3
.L1416:
	ldrb	w1, [x4, 2]
	strb	w1, [x19, 4]
	b	.L1314
	.p2align 3
.L1351:
	ldrb	w0, [x25, 1584]
	cmp	w0, 1
	beq	.L1419
.L1338:
	add	x1, x21, 24576
	add	x0, x19, 3928
	add	x1, x1, 4000
	add	x3, x19, 4056
	.p2align 2
.L1344:
	ldr	w2, [x1], 4
	str	w2, [x0], 4
	cmp	x3, x0
	bne	.L1344
	add	x1, x21, 16384
	ldrb	w0, [x1, 2594]
	str	w0, [x26, 1684]
	ldr	w1, [x1, 2636]
	str	w1, [x26, 1688]
	cbz	w0, .L1356
	ldrb	w0, [x25, 1584]
	cbz	w0, .L1357
.L1356:
	cmp	w1, 1
	beq	.L1420
.L1358:
	add	x20, x20, 8192
	ldr	x0, [x21, 632]
	add	x20, x20, 22
	str	x0, [x21, x20, lsl 3]
	str	xzr, [x21, 632]
.L1302:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1417:
	strb	w1, [x0, 1628]
	ldr	x1, [x27, 28704]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 1629]
	ldr	x1, [x27, 28704]
	ldr	w1, [x1, 12]
	str	w1, [x0, 1652]
	b	.L1349
	.p2align 3
.L1320:
	ldr	w2, [x19, 32]
	ldr	w1, [x0, 744]
	cmp	w1, w2
	csel	w1, w1, w2, ge
	str	w1, [x0, 744]
	ldr	w1, [x0, 748]
	cmp	w1, w2
	csel	w1, w1, w2, le
	str	w1, [x0, 748]
	b	.L1321
	.p2align 3
.L1317:
	ldrb	w1, [x25, 1586]
	ldr	x2, [x22, 3352]
	cbnz	w1, .L1319
	ldr	w1, [x2, 716]
	madd	w0, w7, w1, w0
	ldr	w1, [x26, 2744]
	udiv	w0, w0, w1
	str	w0, [x2, 800]
	b	.L1318
	.p2align 3
.L1368:
	mov	w1, 0
	b	.L1347
	.p2align 3
.L1324:
	ldr	w1, [x1, 672]
	ldr	w0, [x26, 2820]
	bl	FSP_GetLogicFs
	cbz	x0, .L1421
	ldr	x0, [x0, 680]
	ldr	w23, [x0, 8]
	b	.L1323
	.p2align 3
.L1415:
	ldr	w1, [x4, 44]
	strb	w1, [x19, 4]
	b	.L1314
	.p2align 3
.L1303:
	add	x25, x21, 20480
	mov	w4, 2208
	ldr	x0, [x21, 14968]
	mov	w6, 4000
	ldr	x2, [x21, 14960]
	ldr	w1, [x25, 1596]
	umull	x1, w1, w4
	add	x4, x0, x1
	ldr	w0, [x4, 28]
	umull	x0, w0, w6
	add	x6, x2, x0
	b	.L1304
	.p2align 3
.L1335:
	ldr	w0, [x25, 1628]
	mov	w28, 0
	cbnz	w0, .L1387
	b	.L1343
	.p2align 3
.L1422:
	cbz	x0, .L1364
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1341:
	lsl	x0, x22, 5
	add	w28, w28, 1
	add	x0, x0, x22, lsl 2
	add	x0, x19, x0
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
	ldr	w0, [x25, 1628]
	cmp	w0, w28
	bls	.L1343
.L1387:
	uxtw	x22, w28
	ldr	w0, [x26, 2820]
	add	x27, x21, x22, lsl 3
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	ldr	x2, [x27, 28704]
	lsl	x1, x22, 5
	add	x1, x1, x22, lsl 2
	add	x1, x19, x1
	ldr	x2, [x2, 40]
	ldr	w2, [x2, 708]
	str	w2, [x1, 1636]
	ldr	x2, [x27, 28704]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 1625]
	ldr	x1, [x27, 28704]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1422
	mov	w1, w23
	b	.L1341
	.p2align 3
.L1364:
	mov	w1, 0
	b	.L1341
	.p2align 3
.L1343:
	ldrb	w0, [x25, 1584]
	cmp	w0, 1
	bne	.L1338
	ldr	w0, [x25, 1632]
	cbz	w0, .L1338
	mov	w27, 0
	b	.L1346
	.p2align 3
.L1423:
	cbz	x0, .L1366
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1345:
	lsl	x0, x22, 5
	add	w27, w27, 1
	add	x0, x0, x22, lsl 2
	add	x0, x19, x0
	str	w1, [x0, 1640]
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 712]
	str	w1, [x0, 2796]
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 688]
	str	w1, [x0, 2784]
	ldr	x1, [x23, 28968]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2779]
	ldr	x1, [x23, 28968]
	ldrb	w1, [x1]
	strb	w1, [x0, 2778]
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 732]
	str	w1, [x0, 2800]
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 780]
	str	w1, [x0, 2804]
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 828]
	str	w1, [x0, 2808]
	strb	wzr, [x0, 2776]
	ldr	w0, [x25, 1632]
	cmp	w0, w27
	bls	.L1338
.L1346:
	uxtw	x22, w27
	ldr	w0, [x26, 2820]
	add	x23, x21, x22, lsl 3
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w2, [x1, 708]
	lsl	x1, x22, 5
	add	x1, x1, x22, lsl 2
	add	x1, x19, x1
	str	w2, [x1, 2788]
	ldr	x2, [x23, 28968]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 2777]
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1423
	mov	w1, w24
	b	.L1345
	.p2align 3
.L1330:
	ldr	w1, [x1, 672]
	ldr	w0, [x26, 2820]
	bl	FSP_GetLogicFs
	cbz	x0, .L1424
	ldr	x0, [x0, 680]
	ldr	w24, [x0, 8]
	b	.L1329
	.p2align 3
.L1319:
	ldr	w1, [x2, 716]
	madd	w0, w7, w1, w0
	ldr	w1, [x26, 2744]
	udiv	w0, w0, w1
	str	w0, [x2, 848]
	b	.L1318
.L1420:
	ldrb	w0, [x25, 1584]
	cmp	w0, 1
	bne	.L1358
.L1357:
	ldr	w0, [x25, 1648]
	mov	w2, 0
	str	w0, [x19, 80]
	ldr	w0, [x25, 1652]
	str	w0, [x19, 84]
	.p2align 2
.L1359:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x21, x0
	add	x0, x19, x0
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
	ldr	w0, [x25, 1640]
	cmp	w0, w2
	bcs	.L1359
	ldrb	w0, [x25, 1584]
	cmp	w0, 1
	bne	.L1358
	mov	w2, 0
	.p2align 2
.L1360:
	ubfiz	x0, x2, 2, 32
	add	w2, w2, 1
	add	x1, x21, x0
	add	x0, x19, x0
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
	ldr	w0, [x25, 1644]
	cmp	w0, w2
	bcs	.L1360
	b	.L1358
.L1366:
	mov	w1, 0
	b	.L1345
.L1419:
	ldr	w0, [x25, 1632]
	cbz	w0, .L1338
	mov	w27, 0
	b	.L1355
	.p2align 3
.L1426:
	cbz	x0, .L1370
	ldr	x0, [x0, 680]
	ldr	w1, [x0, 8]
.L1352:
	lsl	x0, x22, 5
	add	x0, x0, x22, lsl 2
	add	x0, x19, x0
	str	w1, [x0, 2792]
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 712]
	str	w1, [x0, 2796]
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 688]
	str	w1, [x0, 2784]
	ldr	x1, [x23, 28968]
	ldrb	w1, [x1]
	strb	w1, [x0, 2776]
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1, 720]
	strb	w1, [x0, 2778]
	ldr	x1, [x23, 28968]
	ldrb	w1, [x1]
	cmp	w1, 1
	beq	.L1425
	strb	w1, [x0, 2782]
	ldr	x1, [x23, 28968]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2783]
	ldr	x1, [x23, 28968]
	ldr	w1, [x1, 12]
	str	w1, [x0, 2808]
.L1354:
	ldr	w0, [x25, 1632]
	add	w27, w27, 1
	cmp	w0, w27
	bls	.L1338
.L1355:
	uxtw	x22, w27
	ldr	w0, [x26, 2820]
	add	x23, x21, x22, lsl 3
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldr	w2, [x1, 708]
	lsl	x1, x22, 5
	add	x1, x1, x22, lsl 2
	add	x1, x19, x1
	str	w2, [x1, 2788]
	ldr	x2, [x23, 28968]
	ldr	x2, [x2, 40]
	ldrb	w2, [x2, 1]
	strb	w2, [x1, 2777]
	ldr	x1, [x23, 28968]
	ldr	x1, [x1, 40]
	ldrb	w1, [x1]
	cmp	w1, 1
	bne	.L1426
	mov	w1, w24
	b	.L1352
	.p2align 3
.L1425:
	strb	w1, [x0, 2780]
	ldr	x1, [x23, 28968]
	ldrb	w1, [x1, 1]
	strb	w1, [x0, 2781]
	ldr	x1, [x23, 28968]
	ldr	w1, [x1, 12]
	str	w1, [x0, 2804]
	b	.L1354
.L1370:
	mov	w1, 0
	b	.L1352
.L1424:
	ldr	x1, .LC125
	mov	w2, 7615
	bl	dprint_vfmw
	b	.L1302
.L1421:
	ldr	x1, .LC125
	mov	w2, 7594
	bl	dprint_vfmw
	b	.L1302
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
	cbz	x2, .L1429
	.p2align 2
.L1430:
	ldp	w3, w1, [x2, 8]
	ldr	x2, [x2, 4056]
	add	w1, w3, w1
	add	w1, w1, 7
	add	w0, w0, w1, lsr 3
	cbnz	x2, .L1430
.L1429:
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
	cbnz	w1, .L1443
	mov	w1, 262143
	cmp	w0, w1
	bhi	.L1444
	ldr	w1, [x19, 14932]
	ldr	w2, [x19, 14936]
	mul	w1, w1, w2
	sub	w1, w1, #1
	cmp	w0, w1
	bhi	.L1443
	ldr	x1, .LC131
	mov	x0, x19
	bl	ue_v
	mov	w2, w0
	ldr	x1, .LC133
	mov	w19, w0
	mov	w0, 19
	bl	dprint_vfmw
	ldr	w0, [x20, 2760]
	cbnz	w0, .L1443
	cmp	w19, 9
	bls	.L1445
	ldr	x1, .LC136
	mov	w2, w19
	mov	w0, 1
	bl	dprint_vfmw
.L1443:
	mov	w0, -1
.L1435:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1445:
	ldr	x0, .LC134
	ldrb	w0, [x0,w19,uxtw]
	adr	x1, .Lrtx1440
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx1440:
	.section	.rodata
	.align	0
	.align	2
.L1440:
	.byte	(.L1439 - .Lrtx1440) / 4
	.byte	(.L1441 - .Lrtx1440) / 4
	.byte	(.L1442 - .Lrtx1440) / 4
	.byte	(.L1439 - .Lrtx1440) / 4
	.byte	(.L1442 - .Lrtx1440) / 4
	.byte	(.L1439 - .Lrtx1440) / 4
	.byte	(.L1441 - .Lrtx1440) / 4
	.byte	(.L1442 - .Lrtx1440) / 4
	.byte	(.L1439 - .Lrtx1440) / 4
	.byte	(.L1442 - .Lrtx1440) / 4
	.text
	.p2align 3
.L1439:
	strb	wzr, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1442:
	mov	w1, 2
	strb	w1, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1441:
	mov	w1, 1
	strb	w1, [x21, 1584]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1444:
	ldr	x1, .LC129
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1435
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
	.xword	.L1440
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
	cbz	w1, .L1450
	ldr	w2, [x0, 28]
	mov	w1, 4000
	ldr	x3, [x19, 14960]
	mov	w0, 0
	umull	x1, w2, w1
	add	x1, x3, x1
	ldrb	w1, [x1, 23]
	cbz	w1, .L1451
.L1448:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1450:
	ldr	x1, .LC140
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1448
	.p2align 3
.L1451:
	ldr	x1, .LC142
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1448
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
	cbz	w1, .L1457
	ldr	w1, [x19, 14944]
	ldr	w2, [x0, 28]
	sub	w0, w1, #1
	cmp	w2, w0
	bhi	.L1458
	mov	w1, 4000
	ldr	x3, [x19, 14960]
	mov	w0, 0
	umull	x1, w2, w1
	add	x1, x3, x1
	ldrb	w1, [x1, 23]
	cbz	w1, .L1459
.L1454:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1457:
	ldr	x1, .LC146
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1454
	.p2align 3
.L1458:
	ldr	x1, .LC148
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1454
	.p2align 3
.L1459:
	ldr	x1, .LC150
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1454
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
	beq	.L1462
	ldrb	w0, [x1, 1586]
	ldrb	w3, [x1, 3233]
	cmp	w3, w0
	cset	w0, ne
	orr	w2, w2, w0
.L1462:
	ldr	w3, [x1, 1616]
	ldr	w0, [x1, 3244]
	cmp	w0, w3
	beq	.L1467
	cmp	w3, wzr
	ccmp	w0, wzr, 4, ne
	cset	w0, eq
.L1463:
	ldrb	w4, [x1, 3234]
	ldrb	w3, [x1, 1587]
	cmp	w4, w3
	cset	w5, ne
	cmp	w4, 5
	ccmp	w3, 5, 0, eq
	orr	w2, w5, w2
	orr	w2, w2, w0
	beq	.L1471
.L1464:
	add	x19, x19, 16384
	ldr	w0, [x19, 792]
	cbnz	w0, .L1465
	ldr	w4, [x1, 704]
	ldr	w5, [x1, 3256]
	ldr	w0, [x1, 708]
	ldr	w3, [x1, 3260]
	cmp	w5, w4
	ccmp	w3, w0, 0, eq
	cset	w0, ne
	orr	w2, w2, w0
.L1466:
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
.L1465:
	cmp	w0, 1
	bne	.L1466
	ldr	w4, [x1, 752]
	ldr	w5, [x1, 3264]
	ldr	w0, [x1, 756]
	ldr	w3, [x1, 3268]
	cmp	w5, w4
	ccmp	w3, w0, 0, eq
	cset	w0, ne
	orr	w2, w2, w0
	b	.L1466
	.p2align 3
.L1467:
	mov	w0, 0
	b	.L1463
	.p2align 3
.L1471:
	ldr	w0, [x1, 1624]
	ldr	w3, [x1, 3252]
	cmp	w3, w0
	cset	w0, ne
	orr	w2, w2, w0
	b	.L1464
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
	cbz	w3, .L1473
	add	w0, w0, 5
	add	x22, x19, 65536
	lsl	w23, w23, w0
	ldrb	w0, [x20, 1584]
	cmp	w0, 1
	bls	.L1524
.L1523:
	ldr	w3, [x22, 2760]
.L1491:
	cmp	w3, wzr
	csetm	w0, ne
.L1522:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1473:
	add	w0, w0, 4
	add	x22, x19, 65536
	lsl	w23, w23, w0
	ldrb	w0, [x20, 1584]
	cmp	w0, 1
	bhi	.L1523
.L1524:
	ldr	x1, .LC154
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 796]
	cbz	w0, .L1482
	ldr	w0, [x20, 1640]
	cmn	w0, #2
	beq	.L1505
	ldr	x24, .LC156
	mov	w27, 0
	ldr	x26, .LC164
	ldr	x25, .LC160
	b	.L1488
	.p2align 3
.L1483:
	cmp	w0, 2
	beq	.L1525
.L1486:
	ldr	w0, [x20, 1640]
	add	w0, w0, 2
	cmp	w0, w27
	bls	.L1526
.L1488:
	add	x21, x19, x27, uxtw 2
	mov	x1, x24
	add	x21, x21, 20480
	mov	x0, x19
	add	w27, w27, 1
	bl	ue_v
	cmp	w0, 3
	str	w0, [x21, 800]
	ldr	w3, [x22, 2760]
	bhi	.L1479
	cbnz	w3, .L1479
	beq	.L1482
	cmp	w0, 1
	bhi	.L1483
	mov	x1, x25
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1064]
	cmp	w23, w0
	ldr	w3, [x22, 2760]
	bls	.L1485
	cbz	w3, .L1486
.L1485:
	ldr	x1, .LC162
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1522
	.p2align 3
.L1482:
	ldrb	w0, [x20, 1584]
.L1475:
	cmp	w0, 1
	bne	.L1523
	ldr	x1, .LC168
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 797]
	cbz	w0, .L1523
	ldr	w0, [x20, 1644]
	cmn	w0, #2
	beq	.L1523
	ldr	x24, .LC170
	mov	w27, 0
	ldr	x26, .LC178
	ldr	x25, .LC174
	b	.L1503
	.p2align 3
.L1497:
	cmp	w0, 2
	beq	.L1527
	ldr	w0, [x20, 1644]
	add	w0, w0, 2
	cmp	w27, w0
	beq	.L1504
.L1502:
	add	w27, w27, 1
	cmp	w27, w0
	bcs	.L1523
.L1503:
	add	x21, x19, x27, uxtw 2
	mov	x1, x24
	add	x21, x21, 20480
	mov	x0, x19
	bl	ue_v
	cmp	w0, 3
	str	w0, [x21, 932]
	ldr	w3, [x22, 2760]
	bhi	.L1495
	cbnz	w3, .L1495
	beq	.L1491
	cmp	w0, 1
	bhi	.L1497
	mov	x1, x25
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1196]
	cmp	w23, w0
	ldr	w3, [x22, 2760]
	bls	.L1499
	cbnz	w3, .L1499
.L1500:
	ldr	w0, [x20, 1644]
	add	w0, w0, 2
	cmp	w0, w27
	bne	.L1502
	ldr	w1, [x21, 932]
	cmp	w1, 3
	beq	.L1502
.L1504:
	ldr	x1, .LC180
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1522
	.p2align 3
.L1525:
	mov	x1, x26
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1328]
	b	.L1486
	.p2align 3
.L1527:
	mov	x1, x26
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 1456]
	b	.L1500
	.p2align 3
.L1479:
	ldr	x1, .LC158
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1522
	.p2align 3
.L1495:
	ldr	x1, .LC172
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1522
	.p2align 3
.L1526:
	bne	.L1482
.L1477:
	uxtw	x0, w27
	add	x0, x0, 4096
	add	x0, x19, x0, lsl 2
	ldr	w0, [x0, 4896]
	cmp	w0, 3
	bne	.L1489
	ldrb	w0, [x20, 1584]
	add	x22, x19, 65536
	b	.L1475
.L1499:
	ldr	x1, .LC176
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1522
.L1505:
	mov	w27, 0
	b	.L1477
.L1489:
	ldr	x1, .LC166
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1522
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
	cbnz	w1, .L1553
.L1529:
	cmp	w0, 7
	bhi	.L1532
	ldr	w0, [x21, 1652]
	cmp	w0, 7
	bhi	.L1532
	add	x0, x26, 65536
	str	x0, [x29, 104]
	ldr	w2, [x0, 2760]
	cbnz	w2, .L1531
	ldr	x22, .LC188
	mov	w27, 0
	b	.L1540
	.p2align 3
.L1535:
	str	w23, [x1, 1656]
	add	x0, x26, x19, lsl 2
	str	wzr, [x1, 2424]
	add	x0, x0, 20480
	ldr	w1, [x20, 40]
	cbnz	w1, .L1554
.L1537:
	str	wzr, [x0, 1784]
	str	wzr, [x0, 1912]
	str	wzr, [x0, 2552]
	str	wzr, [x0, 2680]
.L1539:
	ldr	w0, [x21, 1640]
	add	w27, w27, 1
	cmp	w0, w27
	bcc	.L1555
.L1540:
	mov	x1, x22
	mov	x0, x26
	uxtw	x19, w27
	bl	u_1
	add	x1, x26, x19, lsl 2
	add	x1, x1, 20480
	cbz	w0, .L1535
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
	cbz	w1, .L1537
.L1554:
	ldr	x1, .LC194
	mov	x0, x26
	bl	u_1
	add	x1, x26, x19, lsl 2
	add	x1, x1, 20480
	cbnz	w0, .L1556
	str	w25, [x1, 1784]
	add	w27, w27, 1
	str	w25, [x1, 1912]
	str	wzr, [x1, 2552]
	str	wzr, [x1, 2680]
	ldr	w0, [x21, 1640]
	cmp	w0, w27
	bcs	.L1540
.L1555:
	ldr	w0, [x24, 44]
	cmp	w0, 1
	beq	.L1541
.L1542:
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 2760]
	cmp	w0, wzr
	csetm	w0, ne
.L1534:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L1556:
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
	b	.L1539
	.p2align 3
.L1553:
	ldr	x1, .LC184
	mov	x0, x26
	bl	ue_v
	mov	w25, w0
	ldr	w0, [x21, 1648]
	str	w25, [x21, 1652]
	lsl	w25, w19, w25
	b	.L1529
	.p2align 3
.L1541:
	ldrb	w0, [x21, 1584]
	cmp	w0, 1
	bne	.L1542
	ldr	x22, .LC200
	mov	w28, 0
	ldr	x27, .LC202
	b	.L1548
	.p2align 3
.L1543:
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	str	w23, [x0, 2040]
	str	wzr, [x0, 2808]
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	ldr	w1, [x20, 40]
	cbnz	w1, .L1557
.L1545:
	str	wzr, [x0, 2168]
	str	wzr, [x0, 2296]
	str	wzr, [x0, 2936]
	str	wzr, [x0, 3064]
.L1547:
	ldr	w0, [x21, 1644]
	add	w28, w28, 1
	cmp	w0, w28
	bcc	.L1542
.L1548:
	mov	x1, x22
	mov	x0, x26
	uxtw	x19, w28
	bl	u_1
	cbz	w0, .L1543
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
	cbz	w1, .L1545
.L1557:
	ldr	x1, .LC206
	mov	x0, x26
	bl	u_1
	cbnz	w0, .L1558
	add	x0, x26, x19, lsl 2
	add	x0, x0, 20480
	str	w25, [x0, 2168]
	str	w25, [x0, 2296]
	str	wzr, [x0, 2936]
	str	wzr, [x0, 3064]
	b	.L1547
.L1532:
	add	x3, x26, 65536
	ldr	w2, [x3, 2760]
.L1531:
	ldr	x1, .LC186
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1534
.L1558:
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
	b	.L1547
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
	cbnz	w19, .L1560
	mov	w22, 100
	ldr	x21, .LC214
	ldr	x25, .LC216
	add	x23, x20, 65536
	ldr	x27, .LC222
	ldr	x24, .LC220
	ldr	x26, .LC218
	b	.L1571
	.p2align 3
.L1572:
	cmp	w19, 2
	beq	.L1585
.L1573:
	cmp	w19, 6
	cset	w0, eq
	orr	w0, w28, w0
	cbnz	w0, .L1576
	cmp	w19, 4
	beq	.L1586
.L1577:
	cmp	w19, 6
	bhi	.L1569
	ldr	w0, [x23, 2760]
	cbnz	w0, .L1569
.L1587:
	cbz	w19, .L1579
.L1578:
	subs	w22, w22, #1
	beq	.L1580
.L1571:
	mov	x1, x21
	mov	x0, x20
	bl	ue_v
	cmp	w0, 3
	mov	w19, w0
	and	w0, w0, -3
	cset	w28, eq
	cmp	w0, 1
	bne	.L1572
	mov	x1, x25
	mov	x0, x20
	bl	ue_v
	cmp	w19, 2
	bne	.L1573
.L1585:
	mov	x1, x26
	mov	x0, x20
	bl	ue_v
	ldr	w0, [x23, 2760]
	cbz	w0, .L1587
	.p2align 2
.L1569:
	ldr	x1, .LC224
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L1563:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1576:
	mov	x1, x24
	mov	x0, x20
	bl	ue_v
	cmp	w19, 4
	bne	.L1577
.L1586:
	mov	x1, x27
	mov	x0, x20
	bl	ue_v
	ldr	w0, [x23, 2760]
	cbz	w0, .L1578
	b	.L1569
	.p2align 3
.L1560:
	ldr	x21, .LC214
	mov	w26, 0
	ldr	x25, .LC216
	add	x22, x20, 24576
	ldr	x24, .LC220
	add	x23, x20, 65536
	b	.L1562
	.p2align 3
.L1564:
	cmp	w1, 2
	beq	.L1588
.L1565:
	cmp	w1, 3
	ccmp	w1, 6, 4, ne
	beq	.L1589
.L1566:
	cmp	w1, 4
	beq	.L1590
.L1567:
	cmp	w1, 6
	bhi	.L1569
	ldr	w0, [x23, 2760]
	cbnz	w0, .L1569
	add	w26, w26, 1
	cbz	w1, .L1579
	cmp	w26, 100
	beq	.L1591
.L1562:
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
	bne	.L1564
	mov	x1, x25
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3284]
	ldr	w1, [x19, 3280]
	cmp	w1, 2
	bne	.L1565
.L1588:
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
	bne	.L1566
	.p2align 2
.L1589:
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
	bne	.L1567
.L1590:
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
	b	.L1567
	.p2align 3
.L1579:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
.L1591:
	ldr	x1, .LC212
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1563
.L1580:
	mov	w0, -1
	b	.L1563
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
	cbz	w0, .L1593
	cmp	w23, wzr
	cset	w19, eq
	str	w19, [x20, 3188]
	ldrb	w0, [x1, 1587]
	cmp	w0, 5
	beq	.L1611
.L1594:
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
	cbnz	w0, .L1596
.L1600:
	mov	w22, 0
.L1608:
	mov	w0, w22
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1593:
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
	cbnz	w0, .L1612
	ldrb	w0, [x1, 1587]
	uxtw	x19, w23
	cmp	w0, 5
	bne	.L1594
.L1611:
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
.L1612:
	ldrb	w0, [x1, 1587]
	cmp	w0, 5
	beq	.L1613
	ldr	x1, .LC232
	mov	x0, x21
	ldrb	w20, [x19, 3279]
	bl	u_1
	cmp	w20, w0
	bne	.L1614
	ldrb	w0, [x19, 3279]
	cbz	w0, .L1600
	mov	w1, 0
	mov	x0, x21
	bl	DecMMCO
	mov	w22, w0
	b	.L1608
	.p2align 3
.L1596:
	mov	w1, 1
	mov	x0, x21
	bl	DecMMCO
	cmn	w0, #1
	mov	w22, w0
	beq	.L1615
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
.L1613:
	ldr	x1, .LC226
	mov	x0, x21
	ldrb	w20, [x19, 3277]
	bl	u_1
	cmp	w20, w0
	bne	.L1616
	ldr	x1, .LC228
	mov	x0, x21
	ldrb	w19, [x19, 3278]
	bl	u_1
	cmp	w19, w0
	beq	.L1600
	ldr	x1, .LC240
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1608
.L1614:
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
	b	.L1608
.L1616:
	ldr	x1, .LC238
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1608
.L1615:
	strb	wzr, [x19, 3276]
	mov	w0, 1
	ldr	x1, .LC236
	str	w23, [x20, 3188]
	bl	dprint_vfmw
	b	.L1608
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
	bhi	.L1618
	add	x24, x23, 65536
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1618
	mov	w1, w21
	mov	x0, x23
	bl	PPSSPSCheckTmpId
	mov	w22, w0
	cbnz	w0, .L1681
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
	beq	.L1622
	ldr	w0, [x20, 3244]
	cbz	w0, .L1622
.L1623:
	ldr	w1, [x20, 2196]
	mov	x0, x23
	ldr	x2, .LC254
	add	w1, w1, 4
	bl	u_v
	str	w0, [x19, 1604]
	ldr	w1, [x24, 2760]
	cbnz	w1, .L1647
	ldrb	w1, [x19, 1587]
	cmp	w1, 5
	beq	.L1682
.L1626:
	strb	wzr, [x19, 1585]
	strb	wzr, [x19, 1586]
	ldrb	w0, [x20, 18]
	cbz	w0, .L1683
	ldr	w1, [x20, 3252]
	ldr	w2, [x20, 3248]
	add	w0, w1, 1
	madd	w0, w2, w0, w0
.L1650:
	ldrb	w1, [x20, 19]
	cbnz	w1, .L1633
	strb	wzr, [x19, 1588]
.L1635:
	ldr	w1, [x19, 1636]
	cmp	w1, w0
	bcs	.L1684
.L1636:
	ldrb	w0, [x19, 1587]
	cmp	w0, 5
	beq	.L1685
.L1638:
	str	wzr, [x19, 704]
	str	wzr, [x19, 708]
	ldr	w0, [x20, 2200]
	cbz	w0, .L1686
.L1642:
	str	wzr, [x19, 752]
	str	wzr, [x19, 756]
	ldr	w0, [x20, 2200]
	cmp	w0, 1
	beq	.L1687
.L1645:
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1647
	ldrb	w0, [x21, 17]
	cbz	w0, .L1648
	ldr	x1, .LC278
	mov	x0, x23
	bl	ue_v
	cbnz	w0, .L1649
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1649
.L1648:
	mov	x0, x23
	bl	IsNewPic
	uxtb	w0, w0
	strb	w0, [x19, 1589]
	cbnz	w0, .L1661
	ldr	w1, [x19, 1636]
	ldr	w0, [x19, 3272]
	cmp	w1, w0
	bls	.L1688
.L1661:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1622:
	ldrb	w0, [x19, 1584]
	cmp	w0, 2
	beq	.L1623
	ldr	x1, .LC252
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1661
	.p2align 3
.L1633:
	mov	w1, 1
	strb	w1, [x19, 1588]
.L1652:
	ldr	w1, [x19, 1636]
	cmp	w1, w0, lsr 1
	bcc	.L1636
	ldr	x1, .LC262
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1661
	.p2align 3
.L1649:
	ldr	x1, .LC280
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC281
	ldr	x4, [x0]
	cbz	x4, .L1647
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
.L1683:
	ldr	x1, .LC258
	mov	x0, x23
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 1585]
	cbnz	w0, .L1689
	ldr	w2, [x20, 3252]
	ldr	w1, [x20, 3248]
	add	w0, w2, 1
	ldrb	w3, [x20, 18]
	madd	w1, w1, w0, w0
	lsl	w0, w1, 1
	cbz	w3, .L1650
.L1630:
	ldrb	w2, [x19, 1585]
	mov	w0, 1
	b	.L1631
	.p2align 3
.L1686:
	ldr	w1, [x20, 2204]
	mov	x0, x23
	ldr	x2, .LC270
	add	w1, w1, 4
	bl	u_v
	str	w0, [x19, 704]
	ldrb	w0, [x21, 1]
	cbz	w0, .L1642
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1642
	ldr	x1, .LC272
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 708]
	b	.L1642
	.p2align 3
.L1682:
	str	w0, [x19, 1600]
	cbz	w0, .L1626
	ldr	x1, .LC256
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1626
	.p2align 3
.L1687:
	ldrb	w0, [x20, 16]
	cbnz	w0, .L1645
	ldr	x1, .LC274
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 752]
	ldrb	w0, [x21, 1]
	cmp	w0, 1
	bne	.L1645
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1645
	ldr	x1, .LC276
	mov	x0, x23
	bl	se_v
	str	w0, [x19, 756]
	b	.L1645
	.p2align 3
.L1647:
	mov	w22, -1
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1689:
	ldr	x1, .LC260
	mov	x0, x23
	bl	u_1
	strb	w0, [x19, 1586]
	ldr	w0, [x20, 3252]
	ldr	w1, [x20, 3248]
	ldrb	w2, [x20, 18]
	add	w0, w0, 1
	madd	w1, w1, w0, w0
	cbnz	w2, .L1630
	ldrb	w2, [x19, 1585]
	mov	w0, 2
.L1631:
	mul	w0, w0, w1
	cbz	w2, .L1650
	strb	wzr, [x19, 1588]
	cmp	w2, 1
	bne	.L1635
	b	.L1652
	.p2align 3
.L1685:
	ldr	x1, .LC266
	mov	x0, x23
	bl	ue_v
	str	w0, [x19, 1624]
	mov	w1, 65535
	cmp	w0, w1
	bhi	.L1639
	ldr	w0, [x24, 2760]
	cbz	w0, .L1638
.L1639:
	ldr	x1, .LC268
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1638
	.p2align 3
.L1618:
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
.L1681:
	ldr	x1, .LC250
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1661
.L1684:
	ldr	x1, .LC264
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1661
.L1688:
	ldr	x1, .LC283
	mov	w0, 1
	mov	w22, -1
	bl	dprint_vfmw
	b	.L1661
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
	bcc	.L1691
	add	x24, x20, 65536
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1691
	mov	x0, x20
	bl	PPSSPSCheck
	cbnz	w0, .L1774
	ldr	w22, [x19, 1596]
	mov	w0, 2208
	ldrb	w1, [x19, 1584]
	ldr	x25, [x20, 14968]
	umull	x22, w22, w0
	cmp	w1, 1
	add	x21, x25, x22
	beq	.L1775
	ldr	w0, [x21, 36]
	cmp	w1, 1
	str	w0, [x19, 1640]
	ldr	w0, [x21, 40]
	str	w0, [x19, 1644]
	bls	.L1776
.L1696:
	cmp	w1, 2
	beq	.L1722
.L1706:
	mov	w0, 32
	str	w0, [x19, 1644]
.L1707:
	mov	x0, x20
	bl	ref_pic_list_reordering
	mov	w23, w0
	cbnz	w0, .L1777
	ldrb	w0, [x21, 2]
	cbz	w0, .L1709
	ldrb	w0, [x19, 1584]
	cbnz	w0, .L1709
	mov	w0, 1
	mov	w2, w0
.L1783:
	ldr	x1, .LC301
	strb	w0, [x19, 1591]
	mov	w0, 19
	bl	dprint_vfmw
	str	wzr, [x19, 1648]
	ldrb	w0, [x19, 1591]
	str	wzr, [x19, 1652]
	cbz	w0, .L1711
.L1779:
	mov	x0, x20
	bl	pred_weight_table
	cbz	w0, .L1711
	ldr	x1, .LC303
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1742
	.p2align 3
.L1709:
	ldr	w0, [x21, 44]
	cmp	w0, 1
	beq	.L1778
.L1726:
	mov	w0, 0
	ldr	x1, .LC301
	strb	w0, [x19, 1591]
	mov	w2, 0
	mov	w0, 19
	bl	dprint_vfmw
	str	wzr, [x19, 1648]
	ldrb	w0, [x19, 1591]
	str	wzr, [x19, 1652]
	cbnz	w0, .L1779
.L1711:
	ldr	w0, [x19, 1616]
	cbnz	w0, .L1780
.L1712:
	str	wzr, [x19, 3192]
	ldrb	w0, [x25, x22]
	cbz	w0, .L1713
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bls	.L1781
.L1713:
	ldr	x1, .LC311
	mov	x0, x20
	bl	se_v
	add	x1, x19, 3072
	stp	w0, wzr, [x1, 124]
	stp	wzr, wzr, [x1, 132]
	ldrb	w0, [x21, 3]
	cbnz	w0, .L1782
.L1742:
	mov	w0, w23
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L1782:
	ldr	x1, .LC313
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 3200]
	bhi	.L1716
	ldr	w1, [x24, 2760]
	cbnz	w1, .L1716
	cmp	w0, 1
	beq	.L1742
	ldr	x1, .LC317
	mov	x0, x20
	bl	se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 3204]
	bhi	.L1719
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1719
	ldr	x1, .LC321
	mov	x0, x20
	bl	se_v
	add	w1, w0, 6
	cmp	w1, 12
	str	w0, [x19, 3208]
	bhi	.L1721
	ldr	w0, [x24, 2760]
	cbz	w0, .L1742
.L1721:
	ldr	x1, .LC323
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1742
	.p2align 3
.L1780:
	mov	x0, x20
	bl	dec_ref_pic_marking
	cbz	w0, .L1712
	ldr	x1, .LC305
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1742
	.p2align 3
.L1722:
	mov	w0, 32
	str	w0, [x19, 1640]
	b	.L1706
	.p2align 3
.L1778:
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1726
	mov	w2, w0
	b	.L1783
	.p2align 3
.L1775:
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
	bhi	.L1696
	.p2align 2
.L1776:
	ldr	x1, .LC289
	mov	x0, x20
	bl	u_1
	cbnz	w0, .L1697
	ldr	w1, [x19, 1640]
.L1698:
	ldrb	w0, [x19, 1585]
	cbnz	w0, .L1699
	cmp	w1, 15
	bhi	.L1700
	ldr	w0, [x19, 1644]
	cmp	w0, 15
	bhi	.L1784
.L1701:
	ldr	w0, [x24, 2760]
	cbnz	w0, .L1700
.L1702:
	ldrb	w0, [x19, 1584]
	cmp	w0, 2
	beq	.L1722
	cmp	w0, 1
	beq	.L1707
	b	.L1706
	.p2align 3
.L1691:
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
.L1781:
	ldr	x1, .LC307
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 3192]
	bhi	.L1714
	ldr	w0, [x24, 2760]
	cbz	w0, .L1713
.L1714:
	ldr	x1, .LC309
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1742
	.p2align 3
.L1699:
	cmp	w1, 31
	bhi	.L1703
	ldr	w0, [x19, 1644]
	cmp	w0, 31
	bls	.L1704
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1704
.L1703:
	ldr	x1, .LC297
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1742
	.p2align 3
.L1704:
	ldr	w0, [x24, 2760]
	cbz	w0, .L1702
	b	.L1703
	.p2align 3
.L1784:
	ldrb	w0, [x19, 1584]
	cmp	w0, 1
	bne	.L1701
.L1700:
	ldr	x1, .LC295
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1742
	.p2align 3
.L1697:
	ldr	x1, .LC291
	mov	x0, x20
	bl	ue_v
	mov	w1, w0
	ldrb	w0, [x19, 1584]
	str	w1, [x19, 1640]
	cmp	w0, 1
	bne	.L1698
	ldr	x1, .LC293
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 1644]
	ldr	w1, [x19, 1640]
	b	.L1698
	.p2align 3
.L1719:
	ldr	x1, .LC319
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1742
	.p2align 3
.L1716:
	ldr	x1, .LC315
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1742
	.p2align 3
.L1774:
	ldr	x1, .LC285
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1742
	.p2align 3
.L1777:
	ldr	x1, .LC299
	mov	w0, 1
	mov	w23, -1
	bl	dprint_vfmw
	b	.L1742
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
	cbz	w3, .L1786
	ldrb	w2, [x0, 1586]
	strb	w2, [x0, 3233]
.L1786:
	ldrb	w2, [x0, 1587]
	ldr	w3, [x0, 1616]
	strb	w2, [x0, 3234]
	cmp	w2, 5
	str	w3, [x0, 3244]
	beq	.L1793
.L1787:
	ldr	w2, [x1, 2200]
	cbnz	w2, .L1788
	ldr	w2, [x0, 708]
	ldr	w3, [x0, 704]
	str	w3, [x0, 3256]
	str	w2, [x0, 3260]
	ldr	w2, [x1, 2200]
.L1788:
	cmp	w2, 1
	bne	.L1789
	ldr	w2, [x0, 752]
	ldr	w1, [x0, 756]
	str	w2, [x0, 3264]
	str	w1, [x0, 3268]
.L1789:
	add	x19, x19, 65536
	ldr	w0, [x19, 2776]
	add	w0, w0, 1
	str	w0, [x19, 2776]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1793:
	ldr	w2, [x0, 1624]
	str	w2, [x0, 3252]
	b	.L1787
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
	beq	.L1796
	cbz	w0, .L1797
	cmp	w0, 2
	bne	.L1794
	ldrb	w0, [x1, 1587]
	add	x19, x19, 61440
	cmp	w0, 5
	beq	.L1804
.L1799:
	str	wzr, [x19, 3400]
.L1794:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1797:
	add	x19, x19, 61440
	ldr	w0, [x19, 3396]
	cmp	w0, 2
	beq	.L1799
	mov	w0, 1
	str	wzr, [x19, 3400]
	str	w0, [x19, 3396]
	b	.L1794
	.p2align 3
.L1796:
	add	x19, x19, 61440
	mov	w0, 2
	str	wzr, [x19, 3400]
	str	w0, [x19, 3396]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1804:
	mov	w0, 1
	str	w0, [x19, 3400]
	b	.L1794
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
	cbz	w0, .L1806
	ldr	x1, [x19, 632]
	ldr	w0, [x1, 72]
	add	w0, w0, 7
	and	w0, w0, -8
	str	w0, [x1, 72]
	ldr	x1, [x19, 632]
	ldr	w0, [x1, 80]
	sub	w0, w0, #1
	str	w0, [x1, 80]
.L1806:
	ldr	x3, [x19, 632]
	ldrb	w21, [x3]
	cbz	w21, .L1817
	sub	w1, w21, #1
	mov	w4, 32
	mov	x2, 48
	add	x0, x3, 16
	mov	w20, 0
	umaddl	x2, w1, w4, x2
	add	x2, x3, x2
	.p2align 2
.L1808:
	ldr	w1, [x0], 32
	cmp	x0, x2
	add	w20, w20, w1
	bne	.L1808
.L1807:
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
	bhi	.L1828
	ldrb	w20, [x0]
	add	w3, w20, 1
	cmp	w3, 1
	ccmp	w2, w3, 0, ls
	bls	.L1811
	ldr	x21, .LC331
	add	w20, w20, 2
	.p2align 2
.L1812:
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
	bne	.L1812
	sub	w1, w1, #1
.L1811:
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
	bcs	.L1805
	.p2align 2
.L1822:
	ubfiz	x1, x0, 5, 32
	ldr	w2, [x5, 3424]
	add	x1, x3, x1
	add	w0, w0, 1
	ldr	w1, [x1, 32]
	cmp	w1, w2
	bcs	.L1814
	str	w1, [x5, 3424]
	ldr	w4, [x3, 76]
.L1814:
	cmp	w4, w0
	bhi	.L1822
.L1805:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L1828:
	ldr	x1, .LC329
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
.L1817:
	mov	w20, 0
	b	.L1807
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
	ble	.L1829
	sub	w26, w27, #1
	mov	w0, 8
	ldr	x21, .LC334
	add	x26, x26, 1
	mov	x20, 0
	mov	w24, w0
	mov	w23, 255
	b	.L1834
	.p2align 3
.L1833:
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
	beq	.L1829
.L1834:
	cmp	w27, 16
	add	x1, x21, 16
	beq	.L1842
	ldrb	w19, [x20, x1]
.L1832:
	add	x20, x20, 1
	cbz	w0, .L1833
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
	b	.L1833
	.p2align 3
.L1842:
	ldrb	w19, [x21, x20]
	b	.L1832
	.p2align 3
.L1829:
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
	cbnz	w0, .L1894
	ldr	x1, .LC342
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 1]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L1894
	ldr	x1, .LC344
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 32]
	cbnz	w0, .L1847
	ldr	w0, [x21, 2760]
	cbz	w0, .L1848
.L1847:
	ldr	x1, .LC346
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC347
	ldr	x4, [x0]
	cbz	x4, .L1894
	ldr	w0, [x21, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
	mov	w0, -1
.L1845:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1848:
	ldr	x1, .LC349
	mov	x0, x19
	bl	ue_v
	cmp	w0, 31
	str	w0, [x20, 36]
	bhi	.L1849
	ldr	w0, [x21, 2760]
	cbnz	w0, .L1849
	ldr	x1, .LC353
	mov	x0, x19
	bl	ue_v
	cmp	w0, 31
	str	w0, [x20, 40]
	bhi	.L1851
	ldr	w0, [x21, 2760]
	cbnz	w0, .L1851
	ldr	x1, .LC357
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 2]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L1894
	ldr	x2, .LC359
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	cmp	w0, 2
	str	w0, [x20, 44]
	bhi	.L1895
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
	cbnz	w0, .L1896
.L1854:
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
	bcc	.L1875
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
	beq	.L1856
.L1874:
	ldr	x1, .LC381
	mov	x0, x19
	bl	se_v
	add	w1, w0, 12
	cmp	w1, 24
	str	w0, [x20, 56]
	bhi	.L1857
	ldr	w0, [x21, 2760]
	cbz	w0, .L1875
.L1857:
	ldr	x1, .LC388
	mov	w0, 1
	bl	dprint_vfmw
.L1894:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1875:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	w0, 0
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L1896:
	ldr	x1, .LC375
	mov	w0, 1
	bl	dprint_vfmw
	b	.L1854
	.p2align 3
.L1849:
	ldr	x1, .LC351
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1845
	.p2align 3
.L1851:
	ldr	x1, .LC355
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1845
	.p2align 3
.L1856:
	ldr	x28, .LC384
	add	x22, x29, 120
	ldr	x26, .LC383
	add	x24, x20, 5
	add	x23, x20, 1984
	add	x25, x20, 64
	mov	w27, 0
	b	.L1865
	.p2align 3
.L1901:
	ldr	w0, [x20, 28]
	mov	w1, 4000
	umull	x0, w0, w1
	ldr	x1, [x19, 14960]
	add	x0, x1, x0
	ldrb	w1, [x0, 25]
	cmp	w1, 1
	beq	.L1897
	ldr	x0, .LC384
	ldr	x3, [x0, 104]
	ldr	x0, .LC338
	add	x1, x0, 96
	cbz	w27, .L1898
.L1893:
	mov	x2, 16
	mov	x0, x23
	blr	x3
.L1860:
	add	w27, w27, 1
	add	x22, x22, 4
	cmp	w27, 6
	add	x24, x24, 1
	add	x23, x23, 16
	add	x25, x25, 64
	beq	.L1899
.L1865:
	mov	x1, x26
	mov	x0, x19
	bl	u_1
	cmp	w0, 1
	strb	w0, [x24]
	str	w0, [x22]
	beq	.L1900
	cmp	w27, wzr
	ccmp	w27, 3, 4, ne
	beq	.L1901
	sub	w1, w27, #1
	ldr	x3, [x28, 104]
	add	x1, x1, 124
	add	x1, x20, x1, lsl 4
	b	.L1893
	.p2align 3
.L1899:
	ldr	x22, .LC384
	add	x26, x20, 2080
	ldr	x24, .LC338
	add	x27, x20, 448
	mov	x28, 0
	add	x23, x29, 112
	mov	w25, 4000
.L1873:
	ldr	w0, [x20, 60]
	mov	w8, w28
	cmp	w0, 1
	beq	.L1902
	add	x0, x20, x28
	str	wzr, [x23, x28, lsl 2]
	strb	wzr, [x0, 11]
.L1868:
	ldr	w0, [x20, 28]
	ldr	x1, [x19, 14960]
	umull	x0, w0, w25
	add	x0, x1, x0
	ldrb	w1, [x0, 25]
	cmp	w1, 1
	beq	.L1903
	add	x1, x24, 176
	ldr	x3, [x22, 104]
	cbz	w8, .L1904
.L1872:
	mov	x2, 64
	mov	x0, x26
	blr	x3
.L1869:
	add	x28, x28, 1
	add	x26, x26, 64
	cmp	x28, 2
	add	x27, x27, 256
	bne	.L1873
	b	.L1874
	.p2align 3
.L1900:
	mov	x0, x19
	mov	x4, x22
	mov	w3, 16
	mov	x2, x23
	mov	x1, x25
	bl	Scaling_List
	ldr	w0, [x22]
	cmp	w0, 1
	bne	.L1860
	ldr	x0, .LC338
	cmp	w27, 2
	add	x1, x0, 80
	add	x0, x0, 96
	csel	x1, x0, x1, hi
.L1892:
	ldr	x0, .LC384
	mov	x2, 16
	ldr	x3, [x0, 104]
	mov	x0, x23
	blr	x3
	b	.L1860
.L1897:
	uxtw	x1, w27
	add	x1, x0, x1, lsl 4
	add	x1, x1, 1972
	b	.L1892
.L1895:
	ldr	x1, .LC361
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1845
.L1902:
	ldr	x1, .LC386
	mov	x0, x19
	str	w28, [x29, 108]
	bl	u_1
	cmp	w0, 1
	add	x1, x20, x28
	str	w0, [x23, x28, lsl 2]
	ldr	w8, [x29, 108]
	strb	w0, [x1, 11]
	bne	.L1868
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
	bne	.L1869
	ldr	x0, .LC384
	ldr	x3, [x0, 104]
	ldr	x0, .LC338
	add	x1, x0, 176
	cbnz	w8, .L1872
	add	x1, x0, 112
	b	.L1872
	.p2align 3
.L1903:
	ubfiz	x8, x8, 6, 32
	mov	x2, 64
	add	x1, x0, x8
	ldr	x0, .LC384
	add	x1, x1, 2068
	ldr	x3, [x0, 104]
	mov	x0, x26
	blr	x3
	b	.L1869
.L1898:
	add	x1, x0, 80
	b	.L1893
.L1904:
	ldr	x1, .LC338
	add	x1, x1, 112
	b	.L1872
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
	cbz	x19, .L1927
	cbz	x20, .L1928
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
	cbz	w3, .L1909
	lsl	w10, w10, 1
	cmn	w10, #6
	beq	.L1909
	mov	x1, x20
	add	x7, x19, 64
	mov	w9, -6
	mov	x8, 0
	.p2align 2
.L1914:
	add	x3, x19, x8
	add	x0, x20, x8
	ldrsb	w3, [x3, 5]
	ldrsb	w0, [x0, 5]
	cmp	w0, w3
	cset	w0, eq
	and	w2, w2, w0
	cbz	w3, .L1910
	cmp	w8, 5
	bhi	.L1911
	sub	x0, x7, #64
	mov	x3, x1
	.p2align 2
.L1912:
	ldr	w5, [x0, 64]
	add	x0, x0, 4
	ldr	w4, [x3, 64]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x7, x0
	and	w2, w2, w4
	bne	.L1912
.L1910:
	add	w9, w9, 1
	add	x8, x8, 1
	cmp	w9, w10
	add	x1, x1, 64
	add	x7, x7, 64
	bne	.L1914
.L1909:
	ldr	w0, [x20, 56]
	ldr	w1, [x19, 56]
	cmp	w1, w0
	cset	w0, eq
	tst	w0, w2
	csetm	w0, eq
.L1907:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L1911:
	ubfiz	x0, x9, 8, 32
	add	x3, x0, 448
	add	x6, x0, 704
	add	x6, x19, x6
	add	x0, x19, x3
	add	x3, x20, x3
	.p2align 2
.L1913:
	ldr	w5, [x0], 4
	ldr	w4, [x3], 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x6, x0
	and	w2, w2, w4
	bne	.L1913
	add	w9, w9, 1
	add	x8, x8, 1
	cmp	w9, w10
	add	x1, x1, 64
	add	x7, x7, 64
	bne	.L1914
	b	.L1909
.L1928:
	ldr	x2, .LC389
	mov	w3, 9810
	ldr	x1, .LC390
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1907
.L1927:
	ldr	x2, .LC389
	mov	w3, 9809
	ldr	x1, .LC390
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1907
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
	bls	.L1930
	ldr	x1, .LC394
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 14948]
	sub	w1, w0, #1
	cmp	w20, w1
	bls	.L1938
	ldr	x1, .LC395
	ldr	x4, [x1]
	cbz	x4, .L1938
	add	x19, x19, 65536
	mov	w3, 8
	stp	w20, w0, [x29, 56]
	add	x2, x29, 56
	mov	w1, 110
	ldr	w0, [x19, 2820]
	blr	x4
	mov	w0, -1
.L1931:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L1930:
	ldr	x1, .LC397
	mov	x0, x19
	bl	ue_v
	mov	w2, w0
	ldr	w0, [x19, 14944]
	sub	w0, w0, #1
	cmp	w2, w0
	bhi	.L1942
	mov	w0, 4000
	ldr	x1, [x19, 14960]
	umull	x0, w2, w0
	add	x0, x1, x0
	ldrb	w0, [x0, 23]
	cbz	w0, .L1943
	mov	w21, 2208
	ldr	x0, [x19, 14968]
	umull	x21, w20, w21
	add	x0, x0, x21
	ldrb	w1, [x0, 19]
	cbz	w1, .L1934
	ldr	x22, .LC402
	mov	x0, x19
	mov	x1, x22
	stp	w20, w2, [x22, 24]
	bl	ProcessPPS
	cbnz	w0, .L1944
	ldr	x1, [x19, 14968]
	mov	x0, x22
	add	x1, x1, x21
	bl	PPSEqual
	cbz	w0, .L1931
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
	b	.L1931
	.p2align 3
.L1934:
	str	w20, [x0, 24]
	mov	x0, x19
	ldr	x1, [x19, 14968]
	add	x1, x1, x21
	str	w2, [x1, 28]
	ldr	x1, [x19, 14968]
	add	x1, x1, x21
	bl	ProcessPPS
	cbnz	w0, .L1945
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
.L1938:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	w0, -1
	ldp	x29, x30, [sp], 64
	ret
.L1942:
	ldr	x1, .LC399
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1931
.L1944:
	ldr	x1, .LC404
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1931
.L1943:
	ldr	x1, .LC401
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1931
.L1945:
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
	b	.L1931
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
	cbnz	w0, .L1989
	strb	wzr, [x20, 15]
.L1948:
	ldr	x1, .LC415
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 1]
	cbnz	w0, .L1990
.L1949:
	ldr	x1, .LC419
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 3]
	cbnz	w0, .L1991
	mov	w0, 5
	str	w0, [x20, 28]
.L1951:
	ldr	x1, .LC433
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 6]
	cbnz	w0, .L1992
.L1952:
	ldr	x1, .LC439
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 8]
	cbnz	w0, .L1993
.L1954:
	ldr	x1, .LC447
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 7]
	cbz	w0, .L1956
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
	bhi	.L1959
	add	x28, x19, 65536
	ldr	w0, [x28, 2760]
	cbnz	w0, .L1959
	ldr	x27, .LC457
	mov	w21, 0
	ldr	x26, .LC459
	ldr	x25, .LC461
	.p2align 2
.L1960:
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
	bcs	.L1960
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
.L1956:
	ldr	x1, .LC471
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 10]
	cbnz	w0, .L1994
	ldrb	w0, [x20, 7]
	add	x28, x19, 65536
	cbz	w0, .L1964
.L1965:
	ldr	x1, .LC473
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 14]
.L1964:
	ldr	x1, .LC475
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 11]
	ldr	x1, .LC477
	mov	x0, x19
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x20, 12]
	cbnz	w0, .L1966
	ldr	w0, [x28, 2760]
.L1967:
	cmp	w0, wzr
	csetm	w0, ne
.L1988:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L1993:
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
	bne	.L1954
	ldr	w2, [x20, 52]
	cbz	w2, .L1954
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
	b	.L1954
	.p2align 3
.L1992:
	ldr	x1, .LC435
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 44]
	ldr	x1, .LC437
	mov	x0, x19
	bl	ue_v
	str	w0, [x20, 48]
	b	.L1952
	.p2align 3
.L1991:
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
	cbz	w0, .L1951
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
	b	.L1951
	.p2align 3
.L1990:
	ldr	x1, .LC417
	mov	x0, x19
	bl	u_1
	strb	w0, [x20, 2]
	b	.L1949
	.p2align 3
.L1989:
	ldr	x2, .LC409
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	uxtb	w0, w0
	cmp	w0, 255
	strb	w0, [x20, 15]
	bne	.L1948
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
	b	.L1948
	.p2align 3
.L1994:
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
	bhi	.L1959
	add	x28, x19, 65536
	ldr	w0, [x28, 2760]
	cbnz	w0, .L1959
	ldr	x27, .LC457
	mov	w21, 0
	ldr	x26, .LC459
	ldr	x25, .LC461
	.p2align 2
.L1962:
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
	bcs	.L1962
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
	cbnz	w0, .L1965
	ldrb	w0, [x20, 10]
	cbnz	w0, .L1965
	b	.L1964
	.p2align 3
.L1966:
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
	cbz	w0, .L1967
	mov	w0, -1
	b	.L1988
.L1959:
	ldr	x1, .LC455
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1988
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
	cbz	x19, .L2027
	cbz	x20, .L2028
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
	cbz	w1, .L1999
	mov	x2, x19
	mov	x8, x20
	mov	w9, -6
	mov	x1, 0
	.p2align 2
.L2004:
	add	x4, x19, x1
	add	x3, x20, x1
	add	x6, x2, 64
	ldrsb	w3, [x3, 4]
	ldrsb	w4, [x4, 4]
	cmp	w3, w4
	cset	w3, eq
	and	w0, w0, w3
	cbz	w4, .L2000
	cmp	w1, 5
	bhi	.L2001
	mov	x3, x8
	.p2align 2
.L2002:
	ldr	w5, [x2, 52]
	add	x2, x2, 4
	ldr	w4, [x3, 52]
	add	x3, x3, 4
	cmp	w5, w4
	cset	w4, eq
	cmp	x6, x2
	and	w0, w0, w4
	bne	.L2002
.L2000:
	add	x1, x1, 1
	add	w9, w9, 1
	cmp	x1, 8
	mov	x2, x6
	add	x8, x8, 64
	bne	.L2004
.L1999:
	ldr	w4, [x19, 2196]
	ldr	w3, [x20, 2196]
	ldr	w2, [x20, 2200]
	ldr	w1, [x19, 2200]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbz	w1, .L2006
	cmp	w1, 1
	bne	.L2005
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
	cbz	w1, .L2005
	sub	w5, w1, #1
	add	x2, x20, 2220
	add	x5, x5, 556
	add	x1, x19, 2220
	add	x5, x19, x5, lsl 2
	.p2align 2
.L2008:
	ldr	w4, [x1], 4
	ldr	w3, [x2], 4
	cmp	w4, w3
	cset	w3, eq
	cmp	x1, x5
	and	w0, w0, w3
	bne	.L2008
.L2005:
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
	cbnz	w3, .L2009
	ldrb	w1, [x20, 19]
	ldrb	w2, [x19, 19]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
.L2009:
	ldrb	w4, [x19, 20]
	ldrb	w3, [x20, 20]
	ldrb	w2, [x20, 21]
	ldrb	w1, [x19, 21]
	cmp	w4, w3
	ccmp	w2, w1, 0, eq
	cset	w2, eq
	and	w0, w2, w0
	cbnz	w1, .L2029
.L2010:
	ldrb	w1, [x20, 22]
	ldrb	w2, [x19, 22]
	cmp	w2, w1
	cset	w1, eq
	tst	w1, w0
	csetm	w0, eq
.L1997:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2029:
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
	b	.L2010
	.p2align 3
.L2001:
	ubfiz	x3, x9, 8, 32
	add	x4, x3, 436
	add	x7, x3, 692
	add	x7, x19, x7
	add	x3, x19, x4
	add	x4, x20, x4
	.p2align 2
.L2003:
	ldr	w6, [x3], 4
	ldr	w5, [x4], 4
	cmp	w6, w5
	cset	w5, eq
	cmp	x3, x7
	and	w0, w0, w5
	bne	.L2003
	add	x1, x1, 1
	add	x6, x2, 64
	cmp	x1, 8
	add	w9, w9, 1
	mov	x2, x6
	add	x8, x8, 64
	bne	.L2004
	b	.L1999
	.p2align 3
.L2006:
	ldr	w1, [x20, 2204]
	ldr	w2, [x19, 2204]
	cmp	w2, w1
	cset	w1, eq
	and	w0, w0, w1
	b	.L2005
.L2028:
	ldr	x2, .LC492
	mov	w3, 10043
	ldr	x1, .LC493
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1997
.L2027:
	ldr	x2, .LC492
	mov	w3, 10042
	ldr	x1, .LC493
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L1997
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
	cbz	w19, .L2041
	mov	w0, 255
	cmp	w19, 16
	ccmp	w19, w0, 4, gt
	bne	.L2041
	cmp	w20, wzr
	ccmp	w22, wzr, 4, ne
	ccmp	w19, w0, 0, eq
	beq	.L2041
	cmp	w19, 1
	beq	.L2042
	cmp	w19, w0
	beq	.L2032
	ldr	x0, .LC494
	sbfiz	x19, x19, 3, 32
	add	x0, x0, 80
	add	x1, x0, x19
	ldr	w20, [x0, x19]
	ldr	w22, [x1, 4]
.L2032:
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
	bmi	.L2052
.L2033:
	subs	w0, w2, #2263
	bmi	.L2053
	cmp	w1, w0
	mov	w19, 4
	blt	.L2031
.L2037:
	subs	w1, w2, #1820
	bmi	.L2054
	cmp	w0, w1
	mov	w19, 3
	blt	.L2031
.L2038:
	subs	w0, w2, #1365
	bmi	.L2055
.L2036:
	mov	w19, 2
	cmp	w1, w0
	csinc	w19, w19, wzr, lt
	b	.L2031
	.p2align 3
.L2041:
	mov	w19, 0
	mov	w2, 0
.L2031:
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
.L2042:
	mov	w19, 5
	mov	w2, 0
	b	.L2031
	.p2align 3
.L2053:
	mov	w0, 2263
	mov	w19, 4
	sub	w0, w0, w2
	cmp	w1, w0
	blt	.L2031
	b	.L2037
	.p2align 3
.L2052:
	mov	w1, 2406
	sub	w1, w1, w2
	b	.L2033
	.p2align 3
.L2054:
	mov	w1, 1820
	mov	w19, 3
	sub	w1, w1, w2
	cmp	w0, w1
	blt	.L2031
	b	.L2038
.L2055:
	mov	w0, 1365
	sub	w0, w0, w2
	b	.L2036
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
	cbz	x19, .L2176
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
	cbnz	w0, .L2177
	mov	w0, 1
	strb	wzr, [x19, 25]
	str	w0, [x19, 40]
.L2071:
	ldr	x1, .LC523
	mov	x0, x20
	bl	ue_v
	cmp	w0, 12
	str	w0, [x19, 2196]
	bhi	.L2084
	add	x21, x20, 65536
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2084
	ldr	x1, .LC527
	mov	x0, x20
	bl	ue_v
	cmp	w0, 2
	str	w0, [x19, 2200]
	bhi	.L2086
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2086
	cbz	w0, .L2178
	cmp	w0, 1
	beq	.L2179
.L2090:
	ldr	x1, .LC584
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3244]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2174
	ldr	x1, .LC547
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 17]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2174
	ldr	x1, .LC549
	mov	x0, x20
	bl	ue_v
	sub	w1, w0, #1
	cmp	w1, 509
	str	w0, [x19, 3248]
	bhi	.L2097
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2097
	ldr	x1, .LC553
	mov	x0, x20
	bl	ue_v
	str	w0, [x19, 3252]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2174
	ldr	x1, .LC555
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 18]
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2174
	cbnz	w0, .L2180
	ldr	x1, .LC586
	mov	x0, x20
	bl	u_1
	ldr	w23, [x19, 3252]
	strb	w0, [x19, 19]
	add	w23, w23, 1
	cmp	w23, 255
	bhi	.L2130
	ldr	w3, [x19, 3248]
	cmp	w23, 1
	mov	w24, 2
	add	w3, w3, 1
	ccmp	w3, 3, 0, hi
	cset	w0, ls
	cbz	w0, .L2101
.L2130:
	ldr	x1, .LC557
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2166
	.p2align 3
.L2177:
	ldr	x1, .LC502
	mov	x0, x20
	bl	ue_v
	cmp	w0, 1
	str	w0, [x19, 40]
	bhi	.L2060
	add	x21, x20, 65536
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2060
	ldr	x1, .LC506
	mov	x0, x20
	bl	ue_v
	uxth	w0, w0
	add	w2, w0, 8
	str	w2, [x19, 44]
	cmp	w2, 8
	beq	.L2181
	ldr	x1, .LC508
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbz	x4, .L2063
.L2189:
	ldr	w1, [x19, 44]
	mov	w3, 8
	ldr	w0, [x21, 2820]
	add	x2, x29, 120
	stp	wzr, w1, [x29, 120]
	mov	w1, 119
	blr	x4
.L2063:
	ldr	x1, .LC511
	mov	x0, x20
	bl	ue_v
	uxth	w0, w0
	add	w2, w0, 8
	str	w2, [x19, 48]
	cmp	w2, 8
	beq	.L2182
	ldr	x1, .LC513
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbz	x4, .L2066
.L2188:
	ldr	w1, [x19, 48]
	mov	w3, 8
	ldr	w0, [x21, 2820]
	add	x2, x29, 120
	stp	wzr, w1, [x29, 120]
	mov	w1, 119
	blr	x4
.L2066:
	ldr	x1, .LC515
	mov	x0, x20
	bl	u_1
	cbnz	w0, .L2068
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2068
	ldr	x1, .LC519
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 25]
	bne	.L2071
	ldr	x26, .LC498
	add	x21, x29, 120
	ldr	x25, .LC520
	add	x23, x19, 4
	add	x22, x19, 1972
	add	x24, x19, 52
	mov	w27, 0
	ldr	x28, .LC521
	b	.L2077
	.p2align 3
.L2185:
	add	x0, x26, 96
	cmp	w27, wzr
	ldr	x3, [x28, 104]
	csel	x1, x0, x1, ne
	mov	x2, 16
	mov	x0, x22
	blr	x3
.L2073:
	add	w27, w27, 1
	add	x21, x21, 4
	cmp	w27, 6
	add	x23, x23, 1
	add	x22, x22, 16
	add	x24, x24, 64
	beq	.L2183
.L2077:
	mov	x1, x25
	mov	x0, x20
	bl	u_1
	strb	w0, [x23]
	ldr	x1, .LC498
	cmp	w0, 1
	str	w0, [x21]
	add	x1, x1, 80
	beq	.L2184
	cmp	w27, wzr
	ccmp	w27, 3, 4, ne
	beq	.L2185
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
	bne	.L2077
.L2183:
	ldr	x24, .LC521
	add	x21, x19, 2068
	ldr	x23, .LC498
	add	x22, x19, 436
	mov	x27, 0
	add	x26, x29, 104
	mov	x28, x24
.L2082:
	mov	x1, x25
	mov	x0, x20
	bl	u_1
	cmp	w0, 1
	add	x2, x19, x27
	str	w0, [x26, x27, lsl 2]
	add	x1, x23, 176
	strb	w0, [x2, 10]
	beq	.L2186
	ldr	x3, [x24, 104]
	cbz	w27, .L2187
.L2081:
	mov	x0, x21
	mov	x2, 64
.L2170:
	blr	x3
.L2079:
	add	x27, x27, 1
	add	x21, x21, 64
	cmp	x27, 2
	add	x22, x22, 256
	bne	.L2082
	b	.L2071
	.p2align 3
.L2182:
	ldr	w0, [x21, 2760]
	cbz	w0, .L2066
	ldr	x1, .LC513
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbnz	x4, .L2188
	b	.L2066
	.p2align 3
.L2181:
	ldr	w0, [x21, 2760]
	cbz	w0, .L2063
	ldr	x1, .LC508
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbnz	x4, .L2189
	b	.L2063
	.p2align 3
.L2128:
	ldr	w2, [x0, 708]
	ldr	w1, [x0, 712]
	cmp	w25, w2
	ccmp	w23, w1, 2, ls
	bls	.L2127
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbz	x4, .L2174
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
.L2174:
	mov	w0, -1
.L2166:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 144
	ret
	.p2align 3
.L2180:
	ldr	w23, [x19, 3252]
	strb	wzr, [x19, 19]
	sub	w0, w23, #1
	cmp	w0, 509
	bhi	.L2130
	ldr	w3, [x19, 3248]
	mov	w24, 1
	add	w23, w23, 1
	add	w3, w3, w24
.L2101:
	mul	w23, w24, w23
	lsl	w25, w3, 4
	mov	w1, 100663296
	lsl	w23, w23, 4
	mul	w0, w25, w23
	lsr	w0, w0, 1
	lsl	w22, w0, 2
	sub	w0, w22, w0
	cmp	w0, w1
	bhi	.L2190
	ldr	w2, [x19, 32]
	sub	w1, w2, #10
	cmp	w1, 31
	bls	.L2191
.L2103:
	ldr	x1, .LC562
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2166
	.p2align 3
.L2178:
	ldr	x1, .LC531
	mov	x0, x20
	bl	ue_v
	cmp	w0, 12
	str	w0, [x19, 2204]
	bhi	.L2089
	ldr	w0, [x21, 2760]
	cbz	w0, .L2090
.L2089:
	ldr	x1, .LC533
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2166
	.p2align 3
.L2191:
	ldr	x3, .LC560
	ldrh	w1, [x3,w1,uxtw #1]
	adr	x3, .Lrtx2105
	add	x1, x3, w1, sxth #2
	br	x1
.Lrtx2105:
	.section	.rodata
	.align	0
	.align	2
.L2105:
	.2byte	(.L2104 - .Lrtx2105) / 4
	.2byte	(.L2137 - .Lrtx2105) / 4
	.2byte	(.L2107 - .Lrtx2105) / 4
	.2byte	(.L2107 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2107 - .Lrtx2105) / 4
	.2byte	(.L2108 - .Lrtx2105) / 4
	.2byte	(.L2110 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2110 - .Lrtx2105) / 4
	.2byte	(.L2111 - .Lrtx2105) / 4
	.2byte	(.L2112 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2103 - .Lrtx2105) / 4
	.2byte	(.L2114 - .Lrtx2105) / 4
	.2byte	(.L2114 - .Lrtx2105) / 4
	.text
	.p2align 3
.L2107:
	mov	w22, 60416
	movk	w22, 0xd, lsl 16
.L2106:
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
	bhi	.L2115
	ldr	w0, [x21, 2760]
	cbz	w0, .L2116
.L2115:
	ldr	x1, .LC566
	mov	w3, w22
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 3244]
	cmp	w0, 16
	bhi	.L2171
	cmp	w22, w0
	csel	w22, w22, w0, cs
.L2171:
	str	w22, [x19, 3244]
.L2116:
	ldr	x1, .LC568
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 20]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2174
	ldr	x1, .LC570
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 21]
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2174
	cbnz	w0, .L2192
.L2118:
	add	x2, x19, 3072
	lsr	w1, w25, 1
	lsr	w0, w23, 1
	stp	w25, w23, [x2, 204]
	stp	w1, w0, [x2, 212]
.L2120:
	ldr	x1, .LC580
	mov	x0, x20
	bl	u_1
	uxtb	w0, w0
	strb	w0, [x19, 22]
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2174
	mov	w1, 2
	str	w1, [x19, 3332]
	cbnz	w0, .L2193
	mov	w0, 5
	strb	wzr, [x19, 3307]
	str	w0, [x19, 3320]
	mov	w0, 0
.L2123:
	ldr	w1, [x19, 3308]
	mov	w4, w23
	ldr	w2, [x19, 3312]
	mov	w3, w25
	bl	H264GetDar
	str	w0, [x19, 3316]
	ldr	w1, [x19, 3244]
	cbz	w1, .L2126
	cmp	w22, w1
	csel	w22, w22, w1, ls
.L2126:
	cmp	w22, 16
	mov	w1, 16
	ldr	x0, [x20]
	csel	w22, w22, w1, ls
	str	w22, [x20, 14952]
	ldr	w1, [x0, 28]
	cmp	w1, 25
	beq	.L2194
.L2127:
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
.L2114:
	mov	w22, 12582912
	b	.L2106
	.p2align 3
.L2110:
	mov	w22, 30208
	movk	w22, 0x2f, lsl 16
	b	.L2106
	.p2align 3
.L2184:
	mov	x0, x20
	mov	x4, x21
	mov	x2, x22
	mov	x1, x24
	mov	w3, 16
	bl	Scaling_List
	ldr	w0, [x21]
	cmp	w0, 1
	bne	.L2073
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
	b	.L2073
	.p2align 3
.L2060:
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
.L2084:
	ldr	x1, .LC525
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2166
	.p2align 3
.L2192:
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
	ble	.L2118
	add	x4, x19, 3072
	add	w2, w2, w3, lsr 1
	add	w1, w1, w0, lsr 1
	stp	w3, w0, [x4, 204]
	stp	w2, w1, [x4, 212]
	b	.L2120
	.p2align 3
.L2193:
	add	x1, x19, 3292
	mov	x0, x20
	bl	vui_parameters
	cbnz	w0, .L2173
	ldrb	w0, [x19, 3304]
	cbz	w0, .L2173
	ldr	w2, [x19, 3372]
	cmp	w2, wzr
	ccmp	w22, w2, 0, ne
	bcc	.L2195
	ldr	w22, [x19, 3244]
	ldrb	w0, [x19, 3307]
	cmp	w22, w2
	csel	w22, w22, w2, cs
	b	.L2123
.L2195:
	ldr	x1, .LC582
	mov	w3, w22
	mov	w0, 1
	bl	dprint_vfmw
	.p2align 2
.L2173:
	ldrb	w0, [x19, 3307]
	b	.L2123
	.p2align 3
.L2194:
	ldr	w1, [x0, 748]
	cbnz	w1, .L2127
	ldr	w1, [x0, 732]
	cmp	w22, w1
	bls	.L2128
	ldr	x0, .LC509
	ldr	x4, [x0]
	cbz	x4, .L2174
	ldr	w0, [x21, 2820]
	mov	w3, 8
	stp	w22, w1, [x29, 112]
	add	x2, x29, 112
	mov	w1, 106
	blr	x4
	mov	w0, -1
	b	.L2166
	.p2align 3
.L2068:
	ldr	x1, .LC517
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2166
	.p2align 3
.L2179:
	ldr	x1, .LC535
	mov	x0, x20
	bl	u_1
	strb	w0, [x19, 16]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2174
	ldr	x1, .LC537
	mov	x0, x20
	bl	se_v
	str	w0, [x19, 2208]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2174
	ldr	x1, .LC539
	mov	x0, x20
	bl	se_v
	str	w0, [x19, 2212]
	ldr	w0, [x21, 2760]
	cbnz	w0, .L2174
	ldr	x1, .LC541
	mov	x0, x20
	bl	ue_v
	cmp	w0, 255
	str	w0, [x19, 2216]
	bhi	.L2093
	ldr	w1, [x21, 2760]
	cbnz	w1, .L2093
	cbz	w0, .L2090
	ldr	x23, .LC545
	mov	w22, 0
	b	.L2096
	.p2align 3
.L2196:
	ldr	w0, [x19, 2216]
	cmp	w0, w22
	bls	.L2090
.L2096:
	mov	x1, x23
	mov	x0, x20
	bl	se_v
	add	x1, x19, x22, uxtw 2
	add	w22, w22, 1
	str	w0, [x1, 2220]
	ldr	w0, [x21, 2760]
	cbz	w0, .L2196
	b	.L2174
	.p2align 3
.L2097:
	ldr	x1, .LC551
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2166
	.p2align 3
.L2137:
	mov	w22, 17920
	movk	w22, 0x5, lsl 16
	b	.L2106
	.p2align 3
.L2111:
	mov	w22, 30720
	movk	w22, 0x69, lsl 16
	b	.L2106
	.p2align 3
.L2108:
	mov	w22, 55296
	movk	w22, 0x1b, lsl 16
	b	.L2106
	.p2align 3
.L2104:
	mov	w22, 20992
	movk	w22, 0x2, lsl 16
	b	.L2106
	.p2align 3
.L2112:
	mov	w22, 7864320
	b	.L2106
.L2093:
	ldr	x1, .LC543
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2166
	.p2align 3
.L2186:
	mov	x0, x20
	add	x4, x26, x27, lsl 2
	mov	x2, x21
	mov	x1, x22
	mov	w3, 64
	bl	Scaling_List
	ldr	w0, [x26, x27, lsl 2]
	cmp	w0, 1
	bne	.L2079
	ldr	x1, .LC498
	mov	x2, 64
	mov	x0, x21
	ldr	x3, [x28, 104]
	add	x1, x1, 176
	cbnz	w27, .L2170
	ldr	x1, .LC498
	add	x1, x1, 112
	b	.L2170
	.p2align 3
.L2086:
	ldr	x1, .LC529
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2166
.L2190:
	ldr	x1, .LC559
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2166
.L2176:
	ldr	x2, .LC499
	mov	w3, 10233
	ldr	x1, .LC500
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2166
.L2187:
	ldr	x1, .LC498
	add	x1, x1, 112
	b	.L2081
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
	.xword	.L2105
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
	beq	.L2208
	ldr	w0, [x20, 40]
	sub	w1, w0, #1
	cmp	w1, 1
	bls	.L2209
.L2200:
	cmp	w0, 1
	beq	.L2210
.L2201:
	ldr	x1, .LC604
	mov	x0, x19
	bl	u_1
	cbnz	w0, .L2211
.L2202:
	ldr	x1, .LC610
	mov	x0, x19
	mov	w19, 0
	bl	u_1
	cmp	w0, 1
	beq	.L2199
	ldr	x1, .LC612
	mov	w2, w0
	ldr	w4, [x20, 40]
	mov	w3, w21
	mov	w0, 1
	bl	dprint_vfmw
.L2199:
	mov	w0, w19
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2211:
	ldr	x1, .LC606
	mov	x0, x19
	bl	u_1
	mov	w2, w0
	ldr	x1, .LC608
	mov	w0, 17
	bl	dprint_vfmw
	b	.L2202
	.p2align 3
.L2210:
	ldr	x2, .LC600
	mov	w1, 2
	mov	x0, x19
	bl	u_v
	mov	w2, w0
	ldr	x1, .LC602
	mov	w0, 17
	bl	dprint_vfmw
	b	.L2201
	.p2align 3
.L2209:
	ldr	x1, .LC596
	mov	x0, x19
	bl	u_1
	mov	w2, w0
	ldr	x1, .LC598
	mov	w0, 17
	bl	dprint_vfmw
	ldr	w0, [x20, 40]
	b	.L2200
.L2208:
	ldr	x1, .LC594
	mov	w19, -1
	bl	dprint_vfmw
	b	.L2199
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
	cbnz	w0, .L2241
	ldr	w0, [x19, 14944]
	sub	w0, w0, #1
	cmp	w27, w0
	bhi	.L2242
	sub	w0, w21, #66
	mov	w22, w21
	cmp	w0, 78
	bls	.L2243
.L2217:
	ldr	x1, .LC639
	mov	w2, w21
	mov	w0, 1
	mov	w22, 100
	bl	dprint_vfmw
.L2220:
	cmp	w20, 9
	mov	w2, w20
	bls	.L2240
	cmp	w20, 41
	bhi	.L2240
	mov	w20, 4000
	ldr	x0, [x19, 14960]
	umull	x20, w27, w20
	add	x0, x0, x20
	ldrb	w1, [x0, 23]
	cbz	w1, .L2225
.L2246:
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
	cbnz	w0, .L2244
	ldr	x1, [x19, 14960]
	mov	x0, x21
	add	x1, x1, x20
	bl	SPSEqual
	cbnz	w0, .L2245
.L2227:
	mov	w0, 86
	cmp	w22, 83
	ccmp	w22, w0, 4, ne
	beq	.L2229
.L2230:
	mov	w0, 0
.L2214:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2243:
	ldr	x1, .LC631
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2219
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2219:
	.section	.rodata
	.align	0
	.align	2
.L2219:
	.byte	(.L2218 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2220 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2220 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2220 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2221 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2220 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2222 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2222 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2217 - .Lrtx2219) / 4
	.byte	(.L2222 - .Lrtx2219) / 4
	.text
	.p2align 3
.L2229:
	mov	x0, x19
	bl	Sps_SvcExt
	cbz	w0, .L2230
	ldr	x1, .LC647
	mov	w0, 1
	bl	dprint_vfmw
.L2241:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	mov	w0, -1
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L2240:
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
	cbnz	w1, .L2246
.L2225:
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
	cbnz	w0, .L2247
	ldr	x0, [x19, 14960]
	mov	w1, 1
	add	x0, x0, x20
	strb	w1, [x0, 24]
	ldr	x0, [x19, 14960]
	add	x20, x0, x20
	strb	w1, [x20, 23]
	b	.L2227
	.p2align 3
.L2242:
	ldr	x1, .LC629
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 14944]
	sub	w0, w1, #1
	cmp	w27, w0
	bls	.L2241
	ldr	x0, .LC630
	ldr	x4, [x0]
	cbz	x4, .L2241
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
.L2221:
	ldr	x1, .LC635
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2220
	.p2align 3
.L2222:
	ldr	x1, .LC637
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2220
	.p2align 3
.L2218:
	ldr	x1, .LC633
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2220
	.p2align 3
.L2245:
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
	b	.L2227
	.p2align 3
.L2244:
	ldr	x1, .LC644
	mov	w3, w27
	mov	w2, 10859
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2214
.L2247:
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
	b	.L2214
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
	.xword	.L2219
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
	beq	.L2257
	ldrb	w2, [x0]
	sbfiz	x1, x2, 5, 32
	add	x1, x0, x1
	ldr	x1, [x1, 8]
	cbz	x1, .L2257
	ldr	w1, [x0, 76]
	cmp	w2, 1
	ccmp	w1, 2, 2, ls
	bhi	.L2257
	cmp	w1, w2
	bls	.L2257
	uxtw	x5, w2
	add	x3, x0, x5, lsl 5
	ldr	w1, [x3, 28]
	ldr	w3, [x3, 16]
	add	w1, w1, w19, lsl 3
	lsl	w3, w3, 3
	cmp	w1, w3
	bhi	.L2252
	b	.L2250
	.p2align 3
.L2253:
	ldr	w4, [x6, 28]
	ldr	w6, [x6, 16]
	sub	w4, w4, w3
	add	w1, w1, w4
	lsl	w3, w6, 3
	cmp	w1, w3
	bls	.L2250
.L2252:
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
	bhi	.L2253
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2250:
	add	x5, x0, x5, lsl 5
	mov	w0, 1
	str	w1, [x5, 28]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2257:
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
	cbz	x19, .L2273
	ldr	x1, [x21, 632]
	cmp	x1, xzr
	ccmp	w20, wzr, 4, ne
	ble	.L2273
	ldrb	w2, [x1]
	sbfiz	x0, x2, 5, 32
	add	x0, x1, x0
	ldr	x0, [x0, 8]
	cbz	x0, .L2273
	ldr	w0, [x1, 76]
	cmp	w2, 1
	ccmp	w0, 2, 2, ls
	bhi	.L2273
	cmp	w0, w2
	bls	.L2273
	mov	w6, 0
.L2268:
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
	bcs	.L2263
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
	bcc	.L2266
	b	.L2265
	.p2align 3
.L2267:
	ldrb	w1, [x5], 1
	add	w6, w6, 1
	strb	w1, [x19], 1
	cmp	w6, w20
	ldr	x3, [x21, 632]
	add	x3, x3, x7
	ldr	w4, [x3, 28]
	add	w4, w4, 8
	str	w4, [x3, 28]
	bcs	.L2265
.L2266:
	cmp	x8, x5
	bne	.L2267
	ldr	x1, [x21, 632]
.L2263:
	ldrb	w0, [x1]
	add	w2, w2, 1
	add	w0, w0, 1
	strb	w0, [x1]
	ldr	x1, [x21, 632]
	ldr	w0, [x1, 76]
	cmp	w0, w2
	bhi	.L2268
	mov	w0, w6
	b	.L2262
	.p2align 3
.L2265:
	mov	w0, w20
.L2262:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2273:
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
	cbz	w0, .L2281
.L2276:
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
.L2281:
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
	cbnz	w1, .L2277
	ldr	w0, [x20, 16]
	cmp	w0, 5
	beq	.L2277
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
.L2277:
	ldr	x2, .LC680
	mov	w1, 8
	mov	x0, x19
	bl	u_v
	str	w0, [x21, 3220]
	ldr	x1, .LC682
	mov	x0, x19
	bl	ue_v
	str	w0, [x21, 3224]
	b	.L2276
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
	bne	.L2283
	ldr	w5, [x3, 3256]
	add	w5, w5, 2
	str	w5, [x3, 3252]
.L2283:
	cmp	w6, 1
	add	x4, x3, 3240
	beq	.L2290
	ldrb	w1, [x4, 81]
	cmp	w1, 1
	ldr	x1, [x4, 48]
	add	x1, x1, x5, uxtw
	str	x1, [x4, 40]
	beq	.L2291
.L2285:
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
.L2290:
	mov	x1, 0
	str	xzr, [x3, 3280]
	str	xzr, [x3, 3288]
	b	.L2285
	.p2align 3
.L2291:
	str	x1, [x4, 48]
	b	.L2285
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
	beq	.L2297
.L2292:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2297:
	ldr	x0, [x19]
	ldr	x0, [x0, 56]
	cmn	x0, #1
	beq	.L2292
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
	cbz	w4, .L2301
	mov	w1, w4
	mov	w2, w5
	b	.L2300
	.p2align 3
.L2302:
	mov	w1, w0
.L2300:
	udiv	w0, w2, w1
	msub	w0, w0, w1, w2
	mov	w2, w1
	cbnz	w0, .L2302
.L2299:
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
.L2301:
	mov	w1, w5
	b	.L2299
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
	cbnz	w0, .L2304
	ldr	w1, [x20, 14944]
	cmp	w1, wzr
	ble	.L2305
	ldrb	w0, [x3, 23]
	cbnz	w0, .L2322
	sub	w1, w1, #1
	add	x0, x3, 4000
	add	x2, x1, 1
	lsl	x1, x2, 6
	sub	x1, x1, x2
	lsl	x1, x1, 1
	sub	x1, x1, x2
	add	x2, x3, x1, lsl 5
	b	.L2308
	.p2align 3
.L2309:
	ldrb	w1, [x1]
	cbnz	w1, .L2306
.L2308:
	cmp	x0, x2
	mov	x19, x0
	add	x0, x0, 4000
	sub	x1, x0, #3977
	bne	.L2309
.L2305:
	ldr	x1, .LC686
	mov	w0, 1
	mov	w19, -1
	bl	dprint_vfmw
.L2310:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2322:
	mov	x19, x3
	.p2align 2
.L2306:
	cbz	x19, .L2305
.L2304:
	ldrb	w0, [x19, 22]
	cbz	w0, .L2312
	ldrb	w0, [x19, 3299]
	cbz	w0, .L2323
	ldr	w1, [x19, 3676]
	ldr	w22, [x19, 3680]
	add	w1, w1, 1
	add	w22, w22, 1
.L2316:
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
	beq	.L2324
.L2312:
	ldrb	w0, [x19, 3303]
	mov	w19, 0
	cbz	w0, .L2310
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
.L2323:
	ldrb	w0, [x19, 3302]
	cbz	w0, .L2312
	ldr	w1, [x19, 3988]
	ldr	w22, [x19, 3992]
	add	w1, w1, 1
	add	w22, w22, 1
	b	.L2316
	.p2align 3
.L2324:
	ldr	x1, [x0, 176]
	mov	x0, 4294967296
	cmp	x1, x0
	bne	.L2312
	mov	x0, x20
	bl	H264_Sei_Get_Dpb_Output_Time
	b	.L2312
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
	beq	.L2559
.L2326:
	ldr	x0, [x27, 632]
	mov	w1, 32
	str	w1, [x0, 28]
.L2327:
	add	x20, x27, 12288
	mov	w23, 0
	add	x19, x20, 2600
	b	.L2330
	.p2align 3
.L2561:
	mov	w1, 8
	mov	x0, x19
	bl	BsSkip
	cmp	w22, wzr
	ble	.L2329
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2560
.L2330:
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
	bls	.L2561
.L2329:
	ldr	x1, .LC696
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2332
	.p2align 3
.L2560:
	ldr	x26, .LC702
	mov	w24, 0
	ldr	x22, .LC699
	add	x0, x26, 216
	str	x0, [x29, 104]
	.p2align 2
.L2511:
	mov	w19, 0
	add	x25, x20, 2600
	b	.L2336
	.p2align 3
.L2563:
	mov	w1, 8
	mov	x0, x25
	bl	BsSkip
	cmp	w28, wzr
	ble	.L2334
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2562
.L2336:
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
	bls	.L2563
.L2334:
	ldr	x1, .LC698
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
.L2332:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2562:
	cmp	w19, 409600
	bgt	.L2334
	ldr	x0, [x27, 632]
	ldr	w1, [x0, 76]
	ldr	w2, [x0, 28]
	cmp	w1, 2
	beq	.L2564
.L2338:
	cmp	w23, 45
	bls	.L2565
.L2339:
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2566
.L2501:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2504
	.p2align 3
.L2505:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2504:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2505
	.p2align 2
.L2554:
	ldr	w0, [x21, 1360]
.L2366:
	cmp	w0, 3
	bhi	.L2567
.L2506:
	mov	w23, 0
	add	x19, x20, 2600
	b	.L2510
	.p2align 3
.L2508:
	mov	w1, 8
	mov	x0, x19
	bl	BsSkip
	cmp	w25, wzr
	ble	.L2509
	ldrb	w0, [x29, 127]
	cmp	w0, 255
	bne	.L2568
.L2510:
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
	bls	.L2508
.L2509:
	mov	w0, 0
.L2569:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L2568:
	cmp	w0, 128
	bne	.L2511
	mov	w0, 0
	b	.L2569
	.p2align 3
.L2565:
	ldrh	w0, [x22,w23,uxtw #1]
	adr	x1, .Lrtx2341
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx2341:
	.section	.rodata
	.align	0
	.align	2
.L2341:
	.2byte	(.L2340 - .Lrtx2341) / 4
	.2byte	(.L2342 - .Lrtx2341) / 4
	.2byte	(.L2343 - .Lrtx2341) / 4
	.2byte	(.L2344 - .Lrtx2341) / 4
	.2byte	(.L2345 - .Lrtx2341) / 4
	.2byte	(.L2346 - .Lrtx2341) / 4
	.2byte	(.L2347 - .Lrtx2341) / 4
	.2byte	(.L2348 - .Lrtx2341) / 4
	.2byte	(.L2349 - .Lrtx2341) / 4
	.2byte	(.L2350 - .Lrtx2341) / 4
	.2byte	(.L2351 - .Lrtx2341) / 4
	.2byte	(.L2352 - .Lrtx2341) / 4
	.2byte	(.L2353 - .Lrtx2341) / 4
	.2byte	(.L2354 - .Lrtx2341) / 4
	.2byte	(.L2355 - .Lrtx2341) / 4
	.2byte	(.L2356 - .Lrtx2341) / 4
	.2byte	(.L2357 - .Lrtx2341) / 4
	.2byte	(.L2358 - .Lrtx2341) / 4
	.2byte	(.L2359 - .Lrtx2341) / 4
	.2byte	(.L2360 - .Lrtx2341) / 4
	.2byte	(.L2361 - .Lrtx2341) / 4
	.2byte	(.L2362 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2339 - .Lrtx2341) / 4
	.2byte	(.L2363 - .Lrtx2341) / 4
	.text
.L2363:
	mov	w1, w19
	mov	x0, x27
	ldr	w25, [x27, 14920]
	bl	H264_DecFramePackingSEI
	ldr	w3, [x27, 14920]
	sub	w0, w3, w25
	lsl	w25, w19, 3
	cmp	w0, w25
	bge	.L2494
	sub	w26, w25, w0
	ldr	w0, [x27, 14912]
	cmp	w26, wzr
	add	w23, w26, 7
	csel	w23, w23, w26, lt
	lsl	w0, w0, 3
	asr	w23, w23, 3
	cmp	w23, wzr
	ble	.L2496
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2496
	add	x28, x20, 2600
	mov	w25, 0
	b	.L2497
	.p2align 3
.L2498:
	ldr	w0, [x27, 14912]
	ldr	w3, [x27, 14920]
	lsl	w0, w0, 3
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2496
.L2497:
	mov	w1, 8
	mov	x0, x28
	add	w25, w25, 1
	bl	BsSkip
	cmp	w25, w23
	bne	.L2498
	ldr	w0, [x27, 14912]
	ldr	w3, [x27, 14920]
	lsl	w0, w0, 3
.L2496:
	asr	w1, w26, 31
	lsr	w2, w1, 29
	add	w1, w26, w2
	and	w1, w1, 7
	sub	w1, w1, w2
	add	w3, w1, w3
	cmp	w3, w0
	bls	.L2570
.L2494:
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbz	w0, #31, .L2554
	ldr	x1, .LC704
	mov	w3, 12148
	ldr	x2, .LC760
	mov	w0, 20
	bl	dprint_vfmw
	ldr	w0, [x21, 1360]
	b	.L2366
.L2362:
	ldr	x1, .LC757
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2571
.L2488:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2491
	.p2align 3
.L2492:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2491:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2492
	b	.L2554
.L2361:
	ldr	x1, .LC755
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2572
.L2483:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2486
	.p2align 3
.L2487:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2486:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2487
	b	.L2554
.L2360:
	ldr	x1, .LC753
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2573
.L2478:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2481
	.p2align 3
.L2482:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2481:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2482
	b	.L2554
.L2359:
	ldr	x1, .LC751
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2574
.L2473:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2476
	.p2align 3
.L2477:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2476:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2477
	b	.L2554
.L2358:
	ldr	x1, .LC749
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2575
.L2468:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2471
	.p2align 3
.L2472:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2471:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2472
	b	.L2554
.L2357:
	ldr	x1, .LC747
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2576
.L2463:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2466
	.p2align 3
.L2467:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2466:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2467
	b	.L2554
.L2356:
	ldr	x1, .LC745
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2577
.L2458:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2461
	.p2align 3
.L2462:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2461:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2462
	b	.L2554
.L2355:
	ldr	x1, .LC743
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2578
.L2453:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2456
	.p2align 3
.L2457:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2456:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2457
	b	.L2554
.L2354:
	ldr	x1, .LC741
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2579
.L2448:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2451
	.p2align 3
.L2452:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2451:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2452
	b	.L2554
.L2353:
	ldr	x1, .LC739
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2580
.L2443:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2446
	.p2align 3
.L2447:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2446:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2447
	b	.L2554
.L2352:
	ldr	x1, .LC737
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2581
.L2438:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2441
	.p2align 3
.L2442:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2441:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2442
	b	.L2554
.L2351:
	ldr	x1, .LC735
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2582
.L2433:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2436
	.p2align 3
.L2437:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2436:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2437
	b	.L2554
.L2350:
	ldr	x1, .LC733
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2583
.L2428:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2431
	.p2align 3
.L2432:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2431:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2432
	b	.L2554
.L2349:
	ldr	x1, .LC731
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2584
.L2423:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2426
	.p2align 3
.L2427:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2426:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2427
	b	.L2554
.L2348:
	ldr	x1, .LC729
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2585
.L2418:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2421
	.p2align 3
.L2422:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2421:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2422
	b	.L2554
.L2347:
	ldr	x1, .LC727
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	cmp	w19, wzr
	ble	.L2415
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2415
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2416
	.p2align 3
.L2417:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2415
.L2416:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2417
.L2415:
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbz	w0, #31, .L2554
	ldr	x2, .LC702
	mov	w3, 11720
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	ldr	w0, [x21, 1360]
	b	.L2366
.L2346:
	cbnz	w24, .L2345
	ldr	x1, .LC714
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	ldr	w23, [x21, 1360]
	cmp	w23, 3
	bhi	.L2586
.L2390:
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
	cbz	x6, .L2514
	ldr	x3, [x27, 632]
	cmp	w19, 1024
	mov	w28, 1024
	csel	w28, w19, w28, le
	ldrb	w2, [x3]
	ldr	w5, [x3, 76]
	cmp	w2, w5
	bcs	.L2515
	mov	w25, 0
	.p2align 2
.L2392:
	ubfiz	x1, x2, 5, 32
	add	w2, w2, 1
	add	x1, x3, x1
	cmp	w2, w5
	ldr	w0, [x1, 28]
	ldr	w1, [x1, 16]
	add	w0, w0, 7
	sub	w0, w1, w0, lsr 3
	add	w25, w25, w0
	bne	.L2392
	mov	w0, w25
.L2391:
	cmp	w28, w0
	csel	w25, w25, w28, gt
	cbnz	w24, .L2587
	mov	w23, 0
	mov	w26, 0
.L2394:
	sub	w2, w25, w23
	cmp	w2, wzr
	ble	.L2588
	ldr	w0, [x21, 1360]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x1, [x0, 1368]
	mov	x0, x27
	bl	GetBytes
	cmp	w0, wzr
	mov	w25, w0
	ble	.L2589
	sub	w0, w28, w26
	cmp	w25, w0
	bge	.L2400
	ldr	w0, [x21, 1360]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x0, [x0, 1368]
	str	w25, [x0, 1052]
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2401
	add	x19, x20, 2600
	mov	w23, 0
	b	.L2402
	.p2align 3
.L2405:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2401
.L2402:
	mov	w1, 8
	mov	x0, x19
	add	w23, w23, 1
	bl	BsSkip
	cmp	w25, w23
	bne	.L2405
.L2401:
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
.L2557:
	ldr	w0, [x21, 1360]
	ldr	w1, [x21, 2780]
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x0, [x0, 1368]
	str	w1, [x0, 1044]
	cbz	x5, .L2411
	ldr	w0, [x21, 1360]
	mov	w3, 1064
	mov	w1, 6
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x2, [x0, 1368]
	ldr	w0, [x21, 2820]
	blr	x5
.L2411:
	ldr	w0, [x21, 1360]
	add	w0, w0, 1
	str	w0, [x21, 1360]
	cmp	w0, 3
	bls	.L2506
.L2567:
	ldr	x1, .LC759
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2332
.L2344:
	ldr	x1, .LC710
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2590
.L2383:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2386
	.p2align 3
.L2387:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2386:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2387
	b	.L2554
.L2340:
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
	tbnz	w0, #31, .L2591
.L2364:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2368
	.p2align 3
.L2369:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2368:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2369
	b	.L2554
.L2343:
	ldr	x1, .LC708
	mov	w3, w19
	mov	w0, 20
	bl	dprint_vfmw
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbnz	w0, #31, .L2592
.L2378:
	cmp	w19, wzr
	ble	.L2554
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
	add	x23, x20, 2600
	mov	w25, 0
	b	.L2381
	.p2align 3
.L2382:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2554
.L2381:
	mov	w1, 8
	mov	x0, x23
	add	w25, w25, 1
	bl	BsSkip
	cmp	w19, w25
	bne	.L2382
	b	.L2554
.L2342:
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
	bge	.L2371
	sub	w25, w25, w0
	ldr	w0, [x27, 14912]
	cmp	w25, wzr
	add	w23, w25, 7
	csel	w23, w23, w25, lt
	lsl	w0, w0, 3
	asr	w23, w23, 3
	cmp	w23, wzr
	ble	.L2373
	add	w1, w3, 8
	cmp	w0, w1
	bcc	.L2373
	add	x28, x20, 2600
	mov	w26, 0
	b	.L2374
	.p2align 3
.L2375:
	ldr	w0, [x27, 14912]
	ldr	w3, [x27, 14920]
	lsl	w0, w0, 3
	add	w1, w3, 8
	cmp	w1, w0
	bhi	.L2373
.L2374:
	mov	w1, 8
	mov	x0, x28
	add	w26, w26, 1
	bl	BsSkip
	cmp	w23, w26
	bne	.L2375
	ldr	w0, [x27, 14912]
	ldr	w3, [x27, 14920]
	lsl	w0, w0, 3
.L2373:
	asr	w1, w25, 31
	lsr	w2, w1, 29
	add	w1, w25, w2
	and	w1, w1, 7
	sub	w1, w1, w2
	add	w3, w1, w3
	cmp	w3, w0
	bls	.L2593
.L2371:
	mov	w1, w19
	mov	x0, x27
	bl	PassBytes
	tbz	w0, #31, .L2554
	ldr	x2, .LC702
	mov	w3, 11468
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	ldr	w0, [x21, 1360]
	b	.L2366
.L2345:
	ldr	x1, .LC712
	mov	w3, w19
	mov	w0, 20
	mov	w24, 1
	bl	dprint_vfmw
	ldr	w23, [x21, 1360]
	cmp	w23, 3
	bls	.L2390
.L2586:
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
	b	.L2390
	.p2align 3
.L2564:
	ldr	w0, [x0, 60]
	add	w2, w2, w0
	lsr	w2, w2, 3
	b	.L2338
.L2400:
	ldr	w0, [x21, 1360]
	sub	w23, w19, w26
	cmp	w28, w19
	add	x0, x0, 8192
	add	x0, x27, x0, lsl 3
	ldr	x0, [x0, 1368]
	str	w23, [x0, 1052]
	bcc	.L2594
.L2407:
	cmp	w23, wzr
	ble	.L2401
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2401
	add	x19, x20, 2600
	mov	w25, 0
	b	.L2409
	.p2align 3
.L2410:
	ldr	w1, [x27, 14912]
	ldr	w0, [x27, 14920]
	add	w0, w0, 8
	cmp	w0, w1, lsl 3
	bhi	.L2401
.L2409:
	mov	w1, 8
	mov	x0, x19
	add	w25, w25, 1
	bl	BsSkip
	cmp	w23, w25
	bne	.L2410
	b	.L2401
.L2559:
	ldr	x2, [x0, 176]
	mov	x1, 4294967296
	cmp	x2, x1
	bne	.L2326
	ldr	w0, [x0, 172]
	cmp	w0, 1
	bne	.L2326
	ldr	x0, [x27, 632]
	mov	w1, 48
	str	w1, [x0, 28]
	b	.L2327
.L2593:
	add	x0, x20, 2600
	bl	BsSkip
	b	.L2371
.L2570:
	add	x0, x20, 2600
	bl	BsSkip
	b	.L2494
.L2587:
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
	beq	.L2395
	strb	wzr, [x23, 1028]
	mov	w23, 3
	mov	w26, w23
.L2396:
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
	bne	.L2394
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
	b	.L2557
.L2594:
	sub	w1, w19, w28
	mov	x0, x27
	bl	PassBytes
	tbz	w0, #31, .L2407
	ldr	x2, .LC702
	mov	w3, 11667
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2407
.L2515:
	mov	w0, 0
	mov	w25, 0
	b	.L2391
.L2572:
	ldr	x2, .LC702
	mov	w3, 12070
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2483
.L2571:
	ldr	x1, .LC704
	mov	w3, 12096
	ldr	x2, .LC760
	mov	w0, 20
	bl	dprint_vfmw
	b	.L2488
.L2576:
	ldr	x2, .LC702
	mov	w3, 11966
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2463
.L2575:
	ldr	x2, .LC702
	mov	w3, 11992
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2468
.L2574:
	ldr	x2, .LC702
	mov	w3, 12018
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2473
.L2573:
	ldr	x2, .LC702
	mov	w3, 12044
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2478
.L2566:
	ldr	x1, .LC704
	mov	w3, 12160
	ldr	x2, [x29, 104]
	mov	w0, 20
	bl	dprint_vfmw
	b	.L2501
.L2592:
	ldr	x2, .LC702
	mov	w3, 11480
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2378
.L2585:
	ldr	x2, .LC702
	mov	w3, 11732
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2418
.L2591:
	ldr	x2, .LC702
	mov	w3, 11415
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2364
.L2590:
	ldr	x2, .LC702
	mov	w3, 11506
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2383
.L2584:
	ldr	x2, .LC702
	mov	w3, 11758
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2423
.L2583:
	ldr	x2, .LC702
	mov	w3, 11784
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2428
.L2582:
	ldr	x2, .LC702
	mov	w3, 11810
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2433
.L2581:
	ldr	x2, .LC702
	mov	w3, 11836
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2438
.L2580:
	ldr	x2, .LC702
	mov	w3, 11862
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2443
.L2579:
	ldr	x2, .LC702
	mov	w3, 11888
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2448
.L2578:
	ldr	x2, .LC702
	mov	w3, 11914
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2453
.L2577:
	ldr	x2, .LC702
	mov	w3, 11940
	ldr	x1, .LC704
	mov	w0, 20
	add	x2, x2, 216
	bl	dprint_vfmw
	b	.L2458
.L2395:
	ldr	x2, .LC718
	mov	w1, 8
	mov	x0, x27
	bl	u_v
	strb	w0, [x23, 1028]
	mov	w23, 4
	mov	w26, w23
	b	.L2396
.L2514:
	mov	w0, -1
	b	.L2332
.L2588:
	ldr	x1, .LC723
	mov	w0, 1
	bl	dprint_vfmw
.L2555:
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
	b	.L2332
.L2589:
	ldr	x1, .LC725
	mov	w0, 1
	bl	dprint_vfmw
	b	.L2555
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
	.xword	.L2341
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
	bls	.L2605
.L2604:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2605:
	ldr	x1, .LC761
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx2599
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2599:
	.section	.rodata
	.align	0
	.align	2
.L2599:
	.byte	(.L2598 - .Lrtx2599) / 4
	.byte	(.L2604 - .Lrtx2599) / 4
	.byte	(.L2604 - .Lrtx2599) / 4
	.byte	(.L2604 - .Lrtx2599) / 4
	.byte	(.L2598 - .Lrtx2599) / 4
	.byte	(.L2604 - .Lrtx2599) / 4
	.byte	(.L2600 - .Lrtx2599) / 4
	.byte	(.L2600 - .Lrtx2599) / 4
	.text
	.p2align 3
.L2600:
	ldr	w0, [x19]
	mov	w1, 1
	str	w1, [x19]
	cmp	w0, wzr
	csetm	w0, ne
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2598:
	ldr	w0, [x19]
	cbz	w0, .L2601
.L2603:
	mov	w0, -1
	str	wzr, [x19]
.L2606:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2601:
	ldr	w20, [x20, 4]
	rev	w20, w20
	mov	w0, w20
	bl	ZerosMS_32
	cmp	w0, 15
	bhi	.L2603
	mov	w1, 31
	str	wzr, [x19]
	sub	w0, w1, w0, lsl 1
	lsr	w20, w20, w0
	cmp	w20, 1
	csetm	w0, ne
	b	.L2606
	.size	H264_IsNewPicNal, .-H264_IsNewPicNal
	.align	3
.LC761:
	.xword	.L2599
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
	ble	.L2627
	and	w1, w23, 63
	add	w0, w23, 63
	cmp	w1, wzr
	cset	w26, ne
	cmp	w23, wzr
	csel	w0, w0, w23, lt
	add	w26, w26, w0, asr 6
	cmp	w26, wzr
	ble	.L2620
	ldr	x20, .LC765
	mov	w25, w23
	ldr	x27, .LC764
	mov	w19, 0
	mov	w24, 64
	add	x20, x20, 1856
	.p2align 2
.L2619:
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
	cbnz	w1, .L2611
	cmp	x0, x20
	add	w19, w19, 1
	bne	.L2614
	b	.L2612
	.p2align 3
.L2615:
	add	w19, w19, 1
	beq	.L2612
.L2614:
	ldrb	w1, [x0, -1]!
	cmp	x0, x20
	cbz	w1, .L2615
.L2611:
	lsl	w0, w19, 3
.L2610:
	cmp	w19, w23
	mov	w1, 0
	bge	.L2616
	sxtw	x2, w23
	sub	x2, x2, #1
	sub	x19, x2, x19, sxtw
	ldrb	w2, [x22, x19]
	tbnz	x2, 0, .L2616
	lsr	w2, w2, 1
	mov	w1, 1
	.p2align 2
.L2618:
	tbnz	x2, 0, .L2616
	add	w1, w1, 1
	lsr	w2, w2, 1
	cmp	w1, 8
	bne	.L2618
.L2616:
	add	w0, w1, w0
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2612:
	subs	w26, w26, #1
	sub	w25, w25, #64
	bne	.L2619
	b	.L2611
.L2627:
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
.L2620:
	mov	w0, 0
	mov	w19, 0
	b	.L2610
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
	cbz	x19, .L2634
	ldr	x2, [x19, 632]
	ldr	w0, [x2, 76]
	cmp	w0, 1
	bls	.L2633
	ldr	w1, [x2, 48]
	ldr	x0, [x2, 40]
	bl	FindZeroBitsInSeg
	ldr	x2, [x19, 632]
	ldr	w1, [x2, 48]
	cmp	w0, w1, lsl 3
	bcs	.L2637
	cmn	w0, #1
	beq	.L2633
	add	w0, w0, 1
	str	w0, [x2, 80]
	ldr	x0, [x19, 632]
	ldr	w1, [x0, 76]
	cmp	w1, 1
	bls	.L2635
.L2638:
	ldr	w2, [x0, 48]
	mov	w20, 0
	ldr	w1, [x0, 80]
	cmp	w1, w2, lsl 3
	bcc	.L2629
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
.L2629:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2637:
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
.L2633:
	ldr	w1, [x2, 16]
	ldr	x0, [x2, 8]
	bl	FindZeroBitsInSeg
	add	w0, w0, 1
	ldr	x2, [x19, 632]
	str	w0, [x2, 80]
	ldr	x0, [x19, 632]
	ldr	w1, [x0, 76]
	cmp	w1, 1
	bhi	.L2638
.L2635:
	mov	w20, 0
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2634:
	mov	w20, -1
	b	.L2629
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
	bhi	.L2639
	mov	x0, x19
	bl	CombinePacket.part.11
.L2639:
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
	cbz	w0, .L2646
	add	x0, x19, 745
	mov	x1, 1
	b	.L2644
	.p2align 3
.L2643:
	add	w1, w1, 1
	cmp	w1, 137
	beq	.L2649
.L2644:
	ldrb	w2, [x0]
	add	x0, x0, 104
	cbnz	w2, .L2643
	mov	w0, w1
.L2642:
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
.L2649:
	mov	w0, -1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.L2646:
	mov	w0, 0
	mov	x1, 0
	b	.L2642
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
	cbnz	w1, .L2651
	add	x1, x19, 65536
	ldrb	w2, [x1, 160]
.L2652:
	cmp	w2, 1
	bne	.L2653
	mov	w0, 5
	strb	w0, [x3, 2]
.L2653:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2651:
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
	b	.L2652
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
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x22, x19, 65536
	mov	x23, x1
	mov	x21, x2
	bl	_mcount
	ldr	x1, .LC768
	mov	w0, 22
	ldr	w2, [x22, 2764]
	add	x20, x19, 20480
	sub	w2, w2, #1
	bl	dprint_vfmw
	str	wzr, [x21]
	str	wzr, [x23]
	mov	x0, x19
	ldr	x1, [x19, 632]
	ldrb	w2, [x1, 2]
	strb	w2, [x20, 1587]
	ldr	w1, [x1, 84]
	str	w1, [x20, 1616]
	bl	SliceCheck
	mov	w24, w0
	cbnz	w0, .L2659
	mov	x0, x19
	bl	ProcessSliceHeaderFirstPart
	cbnz	w0, .L2663
	ldrb	w2, [x20, 1589]
	mov	w1, 2208
	mov	w0, 4000
	cmp	w2, 1
	cset	w2, eq
	str	w2, [x23]
	ldr	w2, [x20, 1596]
	ldr	x4, [x19, 14968]
	ldr	x3, [x19, 14960]
	umull	x1, w2, w1
	ldr	w2, [x22, 2832]
	add	x1, x4, x1
	ldr	w5, [x19, 14932]
	cmp	w2, 1
	ldr	w4, [x19, 14936]
	ldr	w1, [x1, 28]
	umull	x0, w1, w0
	add	x0, x3, x0
	ldr	w2, [x0, 3248]
	ldrb	w1, [x0, 18]
	ldr	w20, [x0, 3252]
	add	w23, w2, 1
	mov	w2, 2
	sub	w1, w2, w1
	madd	w20, w20, w1, w1
	beq	.L2664
	cmp	w5, w23
	ccmp	w4, w20, 0, eq
	beq	.L2658
	mov	w1, 1
	str	w1, [x21]
.L2658:
	add	x19, x19, 24576
	ldr	w1, [x0, 3272]
	ldr	w0, [x19, 3712]
	add	w0, w0, 1
	cmp	w1, w0
	bls	.L2655
	mov	w0, 1
	str	w0, [x21]
.L2655:
	mov	w0, w24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2664:
	add	x0, x19, 12288
	add	x0, x0, 2600
	bl	BsResidBits
	ldr	w1, [x22, 2744]
	mul	w2, w23, w20
	add	w1, w1, 1
	ldp	x19, x20, [sp, 16]
	udiv	w1, w2, w1
	ldp	x21, x22, [sp, 32]
	cmp	w0, w1
	ccmp	w0, wzr, 1, ge
	csetm	w24, lt
	mov	w0, w24
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2659:
	mov	w24, -1
	b	.L2655
	.p2align 3
.L2663:
	ldr	x1, .LC770
	mov	w0, 1
	mov	w24, -1
	bl	dprint_vfmw
	b	.L2655
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
	cbz	w0, .L2667
	mov	w19, 0
	add	x22, x20, 65536
	b	.L2671
	.p2align 3
.L2668:
	ldr	x0, [x0, 680]
	cbz	x0, .L2670
	ldr	w0, [x21, 1628]
	cmp	w0, w19
	bls	.L2695
.L2671:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x22, 2820]
	add	w19, w19, 1
	ldr	x1, [x1, 28704]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	cbnz	x0, .L2668
.L2670:
	mov	w0, -1
.L2697:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2667:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2695:
	cbz	w0, .L2667
	ldr	w0, [x21, 1632]
	mov	w19, 0
	cbnz	w0, .L2684
	b	.L2667
	.p2align 3
.L2696:
	ldr	x0, [x0, 680]
	cbz	x0, .L2670
	ldr	w0, [x21, 1632]
	cmp	w0, w19
	bls	.L2667
.L2684:
	add	x1, x20, x19, sxtw 3
	ldr	w0, [x22, 2820]
	add	w19, w19, 1
	ldr	x1, [x1, 28968]
	ldr	x1, [x1, 40]
	ldr	w1, [x1, 672]
	bl	FSP_GetLogicFs
	cbnz	x0, .L2696
	mov	w0, -1
	b	.L2697
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
	b	.L2700
	.p2align 3
.L2699:
	add	x19, x19, 104
	cmp	x20, x19
	beq	.L2720
.L2700:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L2699
	ldr	w0, [x21, 2820]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x20, x19
	bne	.L2700
.L2720:
	ldr	w0, [x21, 2756]
	cmp	w0, 1
	beq	.L2721
.L2701:
	ldr	w0, [x21, 1360]
	mov	w20, 0
	cbz	w0, .L2706
	.p2align 2
.L2714:
	add	x19, x22, x20, uxtw 3
	add	w20, w20, 1
	add	x19, x19, 65536
	ldr	x0, [x19, 1368]
	mov	x1, x0
	cbz	x0, .L2704
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19, 1368]
.L2704:
	ldr	w0, [x21, 1360]
	cmp	w0, w20
	bhi	.L2714
.L2706:
	add	x20, x22, 28672
	add	x22, x22, 61440
	add	x20, x20, 1200
	add	x22, x22, 3312
	.p2align 2
.L2703:
	sub	x19, x20, #32
.L2708:
	ldr	x1, [x19]
	cbnz	x1, .L2722
.L2707:
	add	x19, x19, 8
	cmp	x20, x19
	bne	.L2708
	add	x20, x20, 872
	cmp	x20, x22
	bne	.L2703
	ldr	x1, .LC772
	mov	w0, 2
	bl	dprint_vfmw
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2722:
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L2707
.L2721:
	str	wzr, [x21, 2756]
	b	.L2701
	.size	H264DEC_Destroy, .-H264DEC_Destroy
	.align	3
.LC772:
	.xword	.LC771
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_IsNeedSedOnly
	.type	H264DEC_IsNeedSedOnly, %function
H264DEC_IsNeedSedOnly:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 65536
	bl	_mcount
	ldr	w0, [x20, 2744]
	cbz	w0, .L2726
	ldr	x1, [x19, 616]
	cbz	x1, .L2731
.L2726:
	mov	w0, 0
.L2725:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2731:
	ldr	w1, [x20, 2844]
	cmp	w0, w1
	beq	.L2726
	ldr	w0, [x20, 2832]
	cmp	w0, 1
	beq	.L2732
	cbnz	w0, .L2726
	ldr	w0, [x20, 2820]
	bl	VCTRL_CheckFreshRaw
	cbz	w0, .L2726
	ldr	w0, [x20, 2820]
	bl	VCTRL_CheckFreshSeg
	cmp	w0, wzr
	cset	w0, ne
	b	.L2725
	.p2align 3
.L2732:
	ldr	x0, [x19, 632]
	cmp	x0, xzr
	cset	w0, ne
	b	.L2725
	.size	H264DEC_IsNeedSedOnly, .-H264DEC_IsNeedSedOnly
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_IsSliceUnit
	.type	H264DEC_IsSliceUnit, %function
H264DEC_IsSliceUnit:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	and	w0, w19, -5
	cmp	w0, 1
	ccmp	w19, 20, 4, ne
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.size	H264DEC_IsSliceUnit, .-H264DEC_IsSliceUnit
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_IsFrameEndNal
	.type	H264DEC_IsFrameEndNal, %function
H264DEC_IsFrameEndNal:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	w19, w0
	mov	x0, x30
	bl	_mcount
	sub	w0, w19, #7
	cmp	w0, 1
	bls	.L2736
	and	w0, w19, -5
	cmp	w0, 11
	ccmp	w19, 30, 4, ne
	ldr	x19, [sp, 16]
	cset	w0, eq
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2736:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264DEC_IsFrameEndNal, .-H264DEC_IsFrameEndNal
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
	cbz	x0, .L2742
	ldrsb	w1, [x0, 1]
	cbz	w1, .L2742
	add	x19, x0, 608
	add	x20, x0, 640
.L2740:
	ldr	x1, [x19]
	cbnz	x1, .L2747
.L2739:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L2740
	ldr	w0, [x21, 2820]
	mov	w2, 0
	mov	w1, w22
	bl	FSP_SetDisplay
	mov	w0, 0
.L2738:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L2747:
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L2739
	.p2align 3
.L2742:
	mov	w0, -1
	b	.L2738
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
	beq	.L2787
	ldr	x0, [x19]
	ldr	w0, [x0, 12]
	cmp	w0, wzr
	ble	.L2751
	add	x1, x19, 65536
	ldr	w0, [x1, 2748]
	cmp	w0, 2
	beq	.L2751
	ldr	x0, [x1, 144]
	cbz	x0, .L2753
	strb	wzr, [x0, 1]
	mov	w0, 1
	str	xzr, [x1, 144]
.L2750:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2751:
	mov	x1, x20
	mov	x0, x19
	bl	CheckFrameStore
	cmn	w0, #3
	beq	.L2753
	add	x21, x19, 65536
	ldr	x1, [x21, 144]
	cbz	x1, .L2754
	mov	x0, x19
	bl	GetImagePara
	ldr	x1, [x21, 144]
	mov	x0, x19
	bl	CheckFrameStore
	cbz	w0, .L2788
	cmn	w0, #3
	beq	.L2761
	ldr	x1, .LC782
	mov	w3, w0
	mov	w2, 2080
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x21, 144]
	mov	x0, x19
	ldr	w1, [x1, 188]
	bl	H264DEC_RecycleImage
.L2761:
	ldr	x0, [x21, 144]
	strb	wzr, [x0, 1]
	ldr	x0, [x21, 144]
	str	xzr, [x21, 144]
	cmp	x20, x0
	beq	.L2789
.L2754:
	mov	x1, x20
	mov	x0, x19
	bl	GetImagePara
	mov	x1, x20
	mov	x0, x19
	bl	CheckFrameStore
	cbz	w0, .L2790
	cmn	w0, #3
	beq	.L2753
	ldr	x1, .LC782
	mov	w3, w0
	mov	w2, 2138
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x20, 188]
	mov	x0, x19
	bl	H264DEC_RecycleImage
	mov	w0, 2
	b	.L2750
	.p2align 3
.L2787:
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
.L2753:
	mov	w0, 1
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L2790:
	ldr	w1, [x20, 672]
	mov	w2, 1
	ldr	w0, [x21, 2820]
	bl	FSP_SetDisplay
	ldr	w1, [x20, 672]
	ldr	w0, [x21, 2820]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L2791
	cmp	w22, 1
	beq	.L2792
.L2765:
	ldr	w0, [x21, 2820]
	mov	x4, x23
	add	x3, x19, 8
	mov	x2, x19
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L2793
	ldr	x0, [x19]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L2794
	str	wzr, [x23, 24]
.L2768:
	ldr	w1, [x21, 2868]
	mov	w0, 0
	ldr	w2, [x21, 2876]
	add	w1, w1, 2
	str	w1, [x21, 2868]
	add	w2, w2, 1
	str	w2, [x21, 2876]
	b	.L2750
	.p2align 3
.L2788:
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
	cbz	x0, .L2795
	ldr	x0, [x21, 144]
	cmp	x0, x20
	ccmp	w22, 1, 0, eq
	beq	.L2796
.L2757:
	ldr	w0, [x21, 2820]
	mov	x4, x23
	add	x3, x19, 8
	mov	x2, x19
	mov	w1, 0
	bl	InsertImgToVoQueue
	cmp	w0, 1
	bne	.L2797
	ldr	x0, [x19]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L2798
	str	wzr, [x23, 24]
.L2760:
	ldr	w0, [x21, 2868]
	ldr	w1, [x21, 2876]
	add	w0, w0, 2
	str	w0, [x21, 2868]
	add	w1, w1, 1
	str	w1, [x21, 2876]
	b	.L2761
	.p2align 3
.L2789:
	mov	w0, 0
	b	.L2750
	.p2align 3
.L2792:
	str	w22, [x0, 212]
	b	.L2765
	.p2align 3
.L2794:
	mov	x1, x23
	mov	x0, x19
	bl	SetFrmRepeatCount.part.1
	b	.L2768
	.p2align 3
.L2798:
	mov	x1, x23
	mov	x0, x19
	bl	SetFrmRepeatCount.part.1
	b	.L2760
.L2793:
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
	b	.L2750
.L2797:
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
	b	.L2750
	.p2align 3
.L2796:
	mov	w0, 1
	str	w0, [x23, 212]
	b	.L2757
.L2791:
	ldr	x1, .LC784
	mov	w2, 2108
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2750
.L2795:
	ldr	x1, .LC778
	mov	w2, 2051
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L2750
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
	cbnz	w0, .L2800
	mov	w1, w21
	mov	x0, x20
	bl	RemoveFrameStoreOutDPB
.L2800:
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
	cbnz	w0, .L2819
	b	.L2803
	.p2align 3
.L2804:
	ldr	w0, [x19, 3716]
	cmp	w0, w21
	bls	.L2803
.L2819:
	add	x0, x20, x21, uxtw 3
	add	w21, w21, 1
	ldr	x1, [x0, 27904]
	ldrb	w0, [x1, 2]
	cbz	w0, .L2804
	mov	x0, x20
	bl	UnMarkFrameStoreRef
	ldr	w0, [x19, 3716]
	cmp	w0, w21
	bhi	.L2819
	.p2align 2
.L2803:
	mov	x0, x20
	bl	RemoveUnUsedFrameStore
	cbnz	w0, .L2803
	.p2align 2
.L2807:
	ldr	w6, [x19, 3716]
	cbz	w6, .L2824
	ldr	w0, [x19, 3712]
	cmp	w6, w0
	bls	.L2808
	str	w0, [x19, 3716]
	cbz	w0, .L2814
	mov	w6, w0
.L2808:
	add	x2, x19, 3328
	mov	w5, 2147483647
	mov	w0, 0
	mov	w1, 0
	.p2align 2
.L2811:
	ldr	x4, [x2]
	add	x2, x2, 8
	ldr	w3, [x4, 688]
	cmp	w3, w5
	bge	.L2810
	ldrb	w4, [x4, 4]
	cmp	w4, wzr
	csel	w5, w5, w3, eq
	csel	w1, w1, w0, eq
.L2810:
	add	w0, w0, 1
	cmp	w6, w0
	bhi	.L2811
	mov	x0, x20
	bl	OutputFrmFromDPB
	cmn	w0, #1
	bne	.L2807
.L2812:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L2814:
	mov	w1, 0
	mov	x0, x20
	bl	OutputFrmFromDPB
	cmn	w0, #1
	bne	.L2807
	b	.L2812
	.p2align 3
.L2824:
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
.L2838:
	ldr	w0, [x20, -4]
	cmp	w0, 6
	bhi	.L2826
	ldrb	w0, [x24,w0,uxtw]
	adr	x1, .Lrtx2828
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx2828:
	.section	.rodata
	.align	0
	.align	2
.L2828:
	.byte	(.L2827 - .Lrtx2828) / 4
	.byte	(.L2829 - .Lrtx2828) / 4
	.byte	(.L2830 - .Lrtx2828) / 4
	.byte	(.L2831 - .Lrtx2828) / 4
	.byte	(.L2832 - .Lrtx2828) / 4
	.byte	(.L2833 - .Lrtx2828) / 4
	.byte	(.L2834 - .Lrtx2828) / 4
	.text
	.p2align 3
.L2833:
	add	x28, x21, 24576
	mov	w19, 0
	ldr	w0, [x28, 3720]
	cbz	w0, .L2837
	.p2align 2
.L2845:
	add	x1, x21, x19, uxtw 3
	mov	x0, x21
	add	w19, w19, 1
	ldr	x1, [x1, 28032]
	bl	UnMarkFrameStoreRef
	ldr	w0, [x28, 3720]
	cmp	w19, w0
	bcc	.L2845
.L2837:
	mov	x0, x21
	bl	UpdateReflist
	mov	w1, 0
	mov	x0, x21
	bl	UpdateMaxLTFrmIdx
	mov	x0, x21
	bl	UpdateLTReflist
	str	w27, [x25, 728]
	.p2align 2
.L2826:
	add	x20, x20, 20
	cmp	x20, x22
	bne	.L2838
	.p2align 2
.L2827:
	ldr	w1, [x25, 728]
	mov	w0, 0
	cmp	w1, 1
	beq	.L2848
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2832:
	ldr	w1, [x20, 12]
	mov	x0, x21
	bl	UpdateMaxLTFrmIdx
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2826
	.p2align 3
.L2831:
	ldr	w2, [x20]
	mov	x1, x23
	ldr	w3, [x20, 8]
	mov	x0, x21
	bl	MarkSTToLTRef
	mov	x0, x21
	bl	UpdateReflist
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2826
	.p2align 3
.L2830:
	ldr	w2, [x20, 4]
	mov	x0, x21
	mov	x1, x23
	bl	UnMarkLTRef
	mov	x0, x21
	bl	UpdateLTReflist
	b	.L2826
	.p2align 3
.L2829:
	ldr	w2, [x20]
	mov	x0, x21
	mov	x1, x23
	bl	UnMarkSTRef
	mov	x0, x21
	bl	UpdateReflist
	b	.L2826
	.p2align 3
.L2834:
	ldr	w2, [x20, 8]
	mov	x1, x23
	mov	x0, x21
	bl	MarkCurrPicLT
	b	.L2826
	.p2align 3
.L2848:
	ldrb	w0, [x26, 2675]
	str	wzr, [x26, 3368]
	cmp	w0, 1
	beq	.L2841
	cbz	w0, .L2842
	cmp	w0, 2
	bne	.L2840
	str	wzr, [x26, 3380]
	str	wzr, [x26, 3392]
	str	wzr, [x25, 740]
	str	wzr, [x25, 748]
.L2840:
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
.L2842:
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
	b	.L2840
.L2841:
	str	wzr, [x26, 3380]
	str	wzr, [x26, 3388]
	str	wzr, [x25, 736]
	str	wzr, [x25, 748]
	b	.L2840
	.size	AdaptiveMemMark, .-AdaptiveMemMark
	.align	3
.LC785:
	.xword	.L2828
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
	cbz	w0, .L2850
	add	x23, x22, 24576
	mov	w21, 0
	add	x20, x22, 65536
	mov	w25, 1
	ldr	w0, [x23, 3716]
	cbnz	w0, .L2865
	b	.L2857
	.p2align 3
.L2854:
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
	beq	.L2855
	ldr	x1, [x19, 27904]
	ldr	w0, [x20, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
.L2855:
	str	xzr, [x19, 27904]
	str	xzr, [x19, 28032]
	str	xzr, [x19, 28160]
	ldr	w0, [x23, 3716]
	cmp	w0, w21
	bls	.L2857
.L2865:
	add	x19, x22, x21, uxtw 3
	mov	w2, 0
	add	w21, w21, 1
	ldr	x0, [x19, 27904]
	ldr	w1, [x0, 864]
	cmp	w1, 1
	bne	.L2854
	str	w1, [x20, 1348]
	b	.L2854
	.p2align 3
.L2857:
	str	wzr, [x23, 3716]
	ldr	w0, [x20, 1336]
	cbz	w0, .L2853
	sub	w1, w0, #1
	add	x0, x20, 1264
	add	x1, x1, 16384
	add	x1, x1, 317
	add	x1, x22, x1, lsl 2
	.p2align 2
.L2860:
	str	wzr, [x0], 4
	cmp	x0, x1
	bne	.L2860
.L2853:
	mov	x0, x22
	bl	UpdateReflist
	mov	x0, x22
	bl	UpdateLTReflist
	ldr	x0, [x24, 3360]
	ldrb	w0, [x0, 2]
	cbnz	w0, .L2871
	mov	w0, 1
	str	wzr, [x23, 3728]
	strb	w0, [x24, 2677]
	mov	w0, 0
	strb	wzr, [x24, 2676]
.L2861:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L2871:
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
.L2850:
	mov	x0, x22
	bl	FlushDPB
	cbnz	w0, .L2862
	add	x23, x22, 24576
	b	.L2853
.L2862:
	mov	w0, -1
	b	.L2861
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
	beq	.L2873
	ldr	w0, [x19, 3396]
	cbnz	w0, .L2874
	ldr	x0, [x20]
	ldr	w1, [x0, 680]
	cmp	w1, 1
	beq	.L2898
.L2874:
	ldr	x0, [x19, 3360]
	ldrb	w0, [x0, 3]
	cbz	w0, .L2899
	ldr	w0, [x19, 3376]
	cbnz	w0, .L2900
.L2881:
	mov	w0, 0
.L2878:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2899:
	ldr	w0, [x19, 3376]
	cbz	w0, .L2881
.L2880:
	ldrb	w1, [x19, 2673]
	cbnz	w1, .L2885
	add	x1, x20, 24576
	add	x2, x20, 16384
	ldr	w4, [x1, 3724]
	ldr	w2, [x2, 1836]
	ldr	w3, [x1, 3720]
	sub	w1, w2, w4
	cmp	w3, w1
	beq	.L2901
	strb	wzr, [x19, 2676]
.L2883:
	cbz	w0, .L2881
.L2885:
	ldrb	w1, [x19, 2676]
	mov	w0, 0
	cmp	w1, wzr
	cset	w1, eq
	strb	w1, [x19, 2677]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L2900:
	mov	x0, x20
	bl	AdaptiveMemMark
	cbnz	w0, .L2875
.L2882:
	ldrb	w0, [x19, 2678]
	cmp	w0, 5
	bne	.L2902
	ldr	w0, [x19, 3376]
	b	.L2883
	.p2align 3
.L2898:
	ldr	w1, [x0, 676]
	cbnz	w1, .L2874
	ldr	w1, [x0, 684]
	cbnz	w1, .L2874
	ldr	w0, [x0, 644]
	add	w0, w0, 1024
	cmp	w0, 2048
	bls	.L2874
	.p2align 2
.L2873:
	mov	x0, x20
	bl	IDRMemMarking
	cbz	w0, .L2882
.L2875:
	mov	w0, -1
	b	.L2878
	.p2align 3
.L2901:
	mov	x0, x20
	bl	SlidingWinMark.part.2
	strb	wzr, [x19, 2676]
	ldr	w0, [x19, 3376]
	b	.L2883
.L2902:
	ldr	w0, [x19, 3376]
	cbz	w0, .L2881
	ldr	x1, [x19, 3360]
	ldrb	w1, [x1, 3]
	cbnz	w1, .L2885
	b	.L2880
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
	beq	.L2905
	cbz	w0, .L2906
	cmp	w0, 2
	beq	.L2907
	mov	w22, 0
.L2904:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2907:
	ldr	x0, [x20, 3352]
	mov	w1, 3
	add	x19, x21, 65536
	strb	w1, [x0, 720]
	ldrb	w0, [x20, 2673]
	cbnz	w0, .L2923
	ldr	x1, [x19, 144]
	cbz	x1, .L2924
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	mov	w22, w0
	cbnz	w0, .L2988
.L2925:
	ldr	x0, [x20, 3352]
	str	x0, [x19, 144]
	str	x0, [x0, 856]
.L2926:
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
	bne	.L2904
.L2982:
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
	cbz	x0, .L2934
	ldr	x1, [x20, 3352]
	mov	w2, w23
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
.L2934:
	str	xzr, [x19, 144]
.L2990:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2906:
	ldr	x0, [x20, 3352]
	add	x19, x21, 65536
	strb	wzr, [x0, 720]
	ldr	x1, [x19, 144]
	cbz	x1, .L2908
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	cbnz	w0, .L2989
.L2909:
	ldr	x0, [x19, 144]
	cbz	x0, .L2908
	ldr	x1, [x20, 3352]
	mov	w2, 1
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
.L2908:
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
.L2985:
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
	cbz	x0, .L2934
	ldr	x1, [x20, 3352]
	mov	w2, 1
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
	str	xzr, [x19, 144]
	b	.L2990
	.p2align 3
.L2905:
	ldr	x0, [x20, 3352]
	mov	w1, 3
	add	x19, x21, 65536
	strb	w1, [x0, 720]
	ldrb	w0, [x20, 2673]
	cbnz	w0, .L2912
	ldr	x1, [x19, 144]
	cbz	x1, .L2913
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	mov	w22, w0
	cbnz	w0, .L2991
.L2914:
	ldr	x0, [x20, 3352]
	str	x0, [x19, 144]
	str	x0, [x0, 808]
.L2915:
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
	beq	.L2982
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L2923:
	ldr	x3, [x19, 144]
	cbz	x3, .L2992
.L2929:
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
	beq	.L2930
	ldr	x0, [x19, 144]
	str	x28, [x0, 648]
.L2930:
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
	cbz	w0, .L2931
	ldrb	w0, [x20, 2674]
.L2931:
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
	beq	.L2993
.L2932:
	ldrb	w0, [x1, 3]
.L2933:
	strb	w0, [x1, 3]
	mov	w2, 0
	b	.L2985
	.p2align 3
.L2912:
	ldr	x3, [x19, 144]
	cbz	x3, .L2994
.L2917:
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
	beq	.L2918
	ldr	x0, [x19, 144]
	str	x28, [x0, 648]
.L2918:
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
	cbz	w0, .L2919
	ldrb	w0, [x20, 2674]
.L2919:
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
	bne	.L2932
	ldrb	w0, [x1, 3]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L2933
	.p2align 3
.L2989:
	ldr	x2, .LC786
	mov	w4, w0
	ldr	x1, .LC788
	mov	w3, 2742
	add	x2, x2, 232
	mov	w0, 22
	bl	dprint_vfmw
	b	.L2909
	.p2align 3
.L2993:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L2933
	.p2align 3
.L2913:
	ldr	x0, [x20, 3352]
	mov	w22, 0
	str	x0, [x19, 144]
	str	x0, [x0, 808]
	b	.L2915
	.p2align 3
.L2924:
	ldr	x0, [x20, 3352]
	mov	w22, 0
	str	x0, [x19, 144]
	str	x0, [x0, 856]
	b	.L2926
	.p2align 3
.L2991:
	ldr	x2, .LC786
	mov	w4, w0
	ldr	x1, .LC788
	mov	w3, 2794
	add	x2, x2, 232
	mov	w0, 22
	bl	dprint_vfmw
	b	.L2914
	.p2align 3
.L2988:
	ldr	x2, .LC786
	mov	w4, w0
	ldr	x1, .LC788
	mov	w3, 2936
	add	x2, x2, 232
	mov	w0, 22
	bl	dprint_vfmw
	b	.L2925
	.p2align 3
.L2994:
	ldr	x0, [x20, 3352]
	str	x0, [x19, 144]
	str	x0, [x0, 808]
	ldr	x3, [x19, 144]
	b	.L2917
	.p2align 3
.L2992:
	ldr	x0, [x20, 3352]
	str	x0, [x19, 144]
	str	x0, [x0, 856]
	ldr	x3, [x19, 144]
	b	.L2929
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
	cbnz	w0, .L3015
	b	.L2997
	.p2align 3
.L2998:
	ldr	w0, [x20, 3716]
	cmp	w0, w19
	bls	.L2997
.L3015:
	add	x0, x21, x19, uxtw 3
	add	w19, w19, 1
	ldr	x1, [x0, 27904]
	ldrb	w0, [x1, 2]
	cbz	w0, .L2998
	mov	x0, x21
	bl	UnMarkFrameStoreRef
	ldr	w0, [x20, 3716]
	cmp	w0, w19
	bhi	.L3015
	.p2align 2
.L2997:
	mov	x0, x21
	bl	RemoveUnUsedFrameStore
	cbnz	w0, .L2997
	mov	w23, -1
	.p2align 2
.L3001:
	ldr	w5, [x20, 3716]
	cbz	w5, .L3021
.L3007:
	ldr	w0, [x20, 3712]
	cmp	w5, w0
	bls	.L3002
	str	w0, [x20, 3716]
	cbz	w0, .L3009
	mov	w5, w0
.L3002:
	add	x1, x20, 3328
	mov	w4, 2147483647
	mov	w0, 0
	mov	w19, 0
	.p2align 2
.L3005:
	ldr	x3, [x1]
	add	x1, x1, 8
	ldr	w2, [x3, 688]
	cmp	w2, w4
	bge	.L3004
	ldrb	w3, [x3, 4]
	cmp	w3, wzr
	csel	w4, w4, w2, eq
	csel	w19, w19, w0, eq
.L3004:
	add	w0, w0, 1
	cmp	w5, w0
	bhi	.L3005
.L3003:
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
	cbnz	w0, .L3001
	mov	w1, w19
	mov	x0, x21
	bl	RemoveFrameStoreOutDPB
	ldr	w5, [x20, 3716]
	cbnz	w5, .L3007
.L3021:
	cbz	w23, .L3008
	add	x0, x21, 8
	bl	GetVoLastImageID
	mov	w23, w0
.L3008:
	mov	w0, w23
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
.L3009:
	mov	w19, 0
	b	.L3003
	.size	H264DEC_GetRemainImg, .-H264DEC_GetRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	InitDPB.part.15, %function
InitDPB.part.15:
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
.L3026:
	ldr	x0, [x19]
	mov	w2, 1
	cbz	x0, .L3023
	ldr	w1, [x0, 672]
	ldr	w0, [x20, 2820]
	bl	FSP_ClearLogicFs
.L3023:
	ldr	x0, [x19, 128]
	mov	w2, 1
	cbz	x0, .L3024
	ldr	w1, [x0, 672]
	ldr	w0, [x20, 2820]
	bl	FSP_ClearLogicFs
.L3024:
	ldr	x0, [x19, 256]
	mov	w2, 1
	cbz	x0, .L3025
	ldr	w1, [x0, 672]
	ldr	w0, [x20, 2820]
	bl	FSP_ClearLogicFs
.L3025:
	str	xzr, [x19, 128]
	str	xzr, [x19, 256]
	str	xzr, [x19], 8
	cmp	x19, x22
	bne	.L3026
	add	x0, x21, 16384
	add	x1, x23, 3584
	ldr	w0, [x0, 1864]
	stp	wzr, wzr, [x1, 136]
	sub	w0, w0, #1
	stp	w0, wzr, [x1, 128]
	str	wzr, [x23, 3728]
	ldr	x1, [x20, 144]
	cbz	x1, .L3028
	ldr	w0, [x20, 2748]
	cmp	w0, 2
	beq	.L3058
.L3029:
	ldr	w0, [x20, 2820]
	mov	w2, 1
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
	add	x0, x21, 61440
	ldr	x0, [x0, 3352]
	cbz	x0, .L3032
	ldr	x2, [x20, 144]
	ldr	w1, [x0, 672]
	ldr	w0, [x2, 672]
	cmp	w0, w1
	beq	.L3032
	ldr	w0, [x20, 2820]
	mov	w2, 1
	bl	FSP_ClearLogicFs
.L3032:
	str	xzr, [x20, 144]
.L3028:
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
.L3033:
	str	wzr, [x0], 4
	cmp	x0, x20
	bne	.L3033
	add	x2, x21, 28672
	add	x1, x2, 32
	add	x0, x2, 296
	.p2align 2
.L3034:
	str	xzr, [x1], 8
	cmp	x1, x0
	bne	.L3034
	add	x21, x21, 20480
	add	x1, x2, 560
	str	wzr, [x21, 1628]
	.p2align 2
.L3035:
	str	xzr, [x0], 8
	cmp	x1, x0
	bne	.L3035
	str	wzr, [x21, 1632]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L3058:
	mov	w2, 0
	mov	x0, x21
	bl	OutputFrmToVO
	cbnz	w0, .L3059
.L3030:
	ldr	x1, [x20, 144]
	cbz	x1, .L3028
	b	.L3029
	.p2align 3
.L3059:
	ldr	x2, .LC789
	mov	w4, w0
	ldr	x1, .LC790
	mov	w3, 5730
	add	x2, x2, 248
	mov	w0, 22
	bl	dprint_vfmw
	b	.L3030
	.size	InitDPB.part.15, .-InitDPB.part.15
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
	cbz	x19, .L3062
	mov	x0, x19
	bl	ClearAllSlice
	mov	x0, x19
	bl	InitDPB.part.15
.L3061:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3062:
	mov	w0, -1
	b	.L3061
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
	cbz	w0, .L3064
	ldr	x1, .LC793
	mov	w3, w0
	mov	w2, 496
	mov	w0, 0
	bl	dprint_vfmw
.L3064:
	mov	x0, x19
	add	x19, x19, 65536
	bl	InitDPB
	str	wzr, [x19, 1348]
	mov	w0, 0
	str	wzr, [x19, 2852]
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
	cbz	w0, .L3069
	ldrb	w0, [x21, 2673]
	add	x19, x22, 65536
	cmp	w0, 1
	beq	.L3069
.L3070:
	ldr	w20, [x19, 2808]
	ldr	w0, [x19, 2748]
	ubfx	x20, x20, 16, 3
	cmp	w20, w0
	beq	.L3071
	sub	w0, w0, #2
	cmp	w0, 1
	ccmp	w20, 2, 4, ls
	beq	.L3071
	cmp	w20, 1
	ccmp	w20, 4, 4, hi
	beq	.L3154
.L3071:
	cmp	w20, 2
	str	w20, [x19, 2748]
	beq	.L3074
	cmp	w20, 3
	beq	.L3075
	cmp	w20, 1
	beq	.L3155
	ldr	w0, [x19, 2744]
	cbz	w0, .L3078
	cmp	w20, 4
	ldr	w20, [x21, 3396]
	bne	.L3084
	cbnz	w20, .L3084
	ldr	w0, [x19, 1352]
	cbnz	w0, .L3085
	mov	w0, 2
	str	w0, [x19, 1352]
	b	.L3098
	.p2align 3
.L3069:
	add	x19, x22, 65536
	ldr	w0, [x19, 2872]
	ldr	w1, [x19, 2876]
	add	w0, w0, 1
	cmp	w0, w1
	csel	w0, w0, w1, ge
	str	w0, [x19, 2872]
	sub	w0, w0, w1
	ldr	x1, [x22]
	str	w0, [x1, 616]
	b	.L3070
	.p2align 3
.L3075:
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
.L3147:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3155:
	ldr	w20, [x21, 3396]
	cmp	w20, 2
	bne	.L3080
	ldr	w0, [x21, 3376]
	cbz	w0, .L3081
.L3080:
	ldr	w0, [x19, 2744]
	cbz	w0, .L3078
.L3084:
	cmp	w20, 2
	beq	.L3156
	cmp	w20, 1
	bne	.L3098
	str	w20, [x19, 1352]
.L3098:
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
	cbnz	w0, .L3088
	ldr	x1, [x22]
.L3089:
	ldr	w2, [x1, 632]
	mov	w0, 0
	str	w2, [x19, 2720]
	ldr	w1, [x1, 672]
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
.L3074:
	ldr	w0, [x21, 3396]
	cbnz	w0, .L3081
	ldr	w0, [x19, 2744]
	cbz	w0, .L3078
	ldr	x0, [x19, 2736]
	ldr	w0, [x0, 48]
	cbz	w0, .L3098
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
	b	.L3147
	.p2align 3
.L3078:
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
	cbz	x4, .L3150
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
.L3156:
	ldr	w0, [x19, 1352]
	cmp	w0, 2
	bne	.L3098
	ldr	x0, [x22]
	ldr	w0, [x0, 12]
	cbnz	w0, .L3098
	ldr	x0, .LC799
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L3098
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
	cbz	x4, .L3087
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3087:
	ldr	x1, [x21, 3352]
	mov	w2, 0
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
	.p2align 2
.L3150:
	mov	w0, -1
	b	.L3147
	.p2align 3
.L3088:
	ldr	w4, [x21, 3396]
	cbnz	w4, .L3090
	ldr	x0, .LC798
	ldr	x5, [x0]
	cbz	x5, .L3091
	ldr	x1, [x19, 2456]
	cbz	x1, .L3092
	mov	w2, 0
	.p2align 2
.L3093:
	ldp	w3, w0, [x1, 8]
	ldr	x1, [x1, 4056]
	add	w0, w3, w0
	add	w0, w0, 7
	add	w2, w2, w0, lsr 3
	mov	w4, w2
	cbnz	x1, .L3093
.L3092:
	add	x2, x29, 64
	ldr	w0, [x19, 2820]
	mov	w1, 20
	mov	w3, 4
	str	w4, [x2, -8]!
	blr	x5
	ldr	x1, [x22]
.L3094:
	add	x2, x19, 1400
	str	x2, [x22, 616]
	ldr	w0, [x1, 904]
	cmp	w0, 1
	beq	.L3157
	cmp	w0, 2
	beq	.L3158
.L3097:
	str	wzr, [x19, 2732]
	b	.L3089
	.p2align 3
.L3158:
	ldr	w0, [x1, 908]
	cmp	w0, wzr
	ccmp	x2, xzr, 4, gt
	beq	.L3097
	ldr	w20, [x21, 3396]
	cmp	w20, 2
	bne	.L3097
	str	xzr, [x22, 616]
	mov	w2, 0
	ldr	x1, [x21, 3352]
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
	ldr	x2, [x22]
	mov	x0, x22
	ldr	w1, [x2, 908]
	sub	w1, w1, #1
	str	w1, [x2, 908]
.L3151:
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
.L3149:
	strb	w4, [x1, 3234]
	add	x4, x1, 3072
	str	w5, [x1, 3244]
	stp	w3, w0, [x4, 184]
	stp	wzr, wzr, [x4, 192]
	str	w2, [x1, 3272]
	b	.L3147
	.p2align 3
.L3090:
	add	x0, x22, 24576
	ldr	w0, [x0, 3716]
	cbnz	w0, .L3091
	ldr	x1, [x22]
	ldr	w0, [x1, 12]
	cmp	w0, 2
	beq	.L3094
	ldr	x0, .LC798
	ldr	x4, [x0]
	cbz	x4, .L3095
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 127
	blr	x4
.L3095:
	mov	x0, x22
.L3152:
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
	b	.L3149
	.p2align 3
.L3091:
	ldr	x1, [x22]
	b	.L3094
	.p2align 3
.L3157:
	cbz	x2, .L3097
	ldr	w20, [x21, 3396]
	cmp	w20, 2
	bne	.L3097
	str	xzr, [x22, 616]
	mov	w2, 0
	ldr	x1, [x21, 3352]
	ldr	w0, [x19, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetDisplay
	mov	x0, x22
	b	.L3151
	.p2align 3
.L3085:
	mov	w0, 1
	str	w0, [x19, 1352]
	b	.L3098
.L3154:
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
	b	.L3147
.L3081:
	mov	w1, 1
	mov	x0, x22
	strb	w1, [x21, 2679]
	b	.L3152
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
	cbz	w0, .L3159
	ldr	x1, .LC805
	mov	w0, w20
	bl	dprint_vfmw
.L3159:
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
	cbz	w20, .L3166
	cmp	w20, 1
	beq	.L3167
	ldr	x1, .LC819
	mov	w2, w20
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, 0
.L3251:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3167:
	mov	w1, 16
	mov	x0, x19
	cbnz	w23, .L3180
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w1, 31745
	cmp	w20, w1
	bne	.L3271
	and	w0, w0, 31
	cmp	w0, 25
	ccmp	w24, 1, 0, eq
	bne	.L3264
	ldr	x19, .LC806
	ldr	x4, [x19]
	cbz	x4, .L3184
	add	x0, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	ldr	w0, [x0, 2820]
	blr	x4
.L3184:
	mov	x0, x21
	bl	DecVDM
	cbz	w0, .L3264
	b	.L3261
	.p2align 3
.L3166:
	cbnz	w23, .L3168
	mov	w1, 16
	mov	x0, x19
	mov	w23, 31745
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	cmp	w20, w23
	beq	.L3169
	mov	w1, 24
	mov	x0, x19
	and	w20, w20, -513
	bl	BsBack
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	cmp	w20, w23
	bne	.L3254
.L3264:
	ldr	x1, [x21, 632]
	cbz	x1, .L3255
	add	x0, x21, 65536
	ldr	w0, [x0, 2820]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
.L3255:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	w0, -1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3180:
	bl	BsGet
	mov	w20, w0
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	mov	w1, 31745
	cmp	w20, w1
	beq	.L3188
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w0, 32257
	cmp	w20, w0
	beq	.L3272
.L3254:
	mov	w0, 0
.L3274:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L3169:
	and	w0, w0, 31
	cmp	w0, 25
	bne	.L3264
	ldr	x19, .LC806
	ldr	x4, [x19]
	cbz	x4, .L3172
	add	x0, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	ldr	w0, [x0, 2820]
	blr	x4
.L3172:
	mov	x0, x21
	bl	DecVDM
	cbz	w0, .L3273
.L3261:
	ldr	x4, [x19]
	cbz	x4, .L3255
	add	x21, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	ldr	w0, [x21, 2820]
	blr	x4
	mov	w0, -1
	b	.L3251
	.p2align 3
.L3168:
	mov	w1, 24
	mov	x0, x19
	bl	BsBack
	mov	w0, 0
	b	.L3274
	.p2align 3
.L3271:
	mov	w1, 32
	mov	x0, x19
	bl	BsBack
	ldr	x0, [x21, 632]
	mov	w2, 32257
	mov	w1, 16
	cmp	w20, w2
	str	w1, [x0, 72]
	beq	.L3275
	mov	w1, 8
	mov	x0, x19
	bl	BsSkip
	mov	w1, 8
	mov	x0, x19
	bl	BsGet
	and	w0, w0, 31
	cmp	w0, 11
	bne	.L3264
	mov	x0, x21
	bl	H264_IsEosNal
	uxtb	w0, w0
	cmp	w0, 1
	bne	.L3264
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
	b	.L3251
	.p2align 3
.L3188:
	and	w0, w0, 31
	cmp	w0, 25
	bne	.L3254
	ldr	x19, .LC806
	ldr	x4, [x19]
	cbz	x4, .L3190
	add	x0, x21, 65536
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	ldr	w0, [x0, 2820]
	blr	x4
.L3190:
	mov	x0, x21
	bl	DecVDM
	cbnz	w0, .L3261
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
	cbnz	w0, .L3276
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
	cbnz	w2, .L3277
.L3193:
	ldr	x23, .LC812
	ldr	w0, [x20, 2820]
	ldr	x1, [x23, w0, sxtw 3]
	cbz	x1, .L3194
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
.L3194:
	ldr	x1, [x29, 72]
	bl	MetadataUnMapToSec
	cbnz	w0, .L3278
.L3195:
	ldr	x1, [x21, 632]
	cbz	x1, .L3255
	ldr	w0, [x20, 2820]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
	mov	w0, -1
	b	.L3251
	.p2align 3
.L3272:
	ldr	x2, .LC807
	mov	w3, 13544
	ldr	x1, .LC817
	mov	w0, 0
	add	x2, x2, 256
	bl	dprint_vfmw
	b	.L3264
	.p2align 3
.L3275:
	add	x22, x21, 65536
	ldr	x20, .LC815
	ldrsw	x0, [x22, 2820]
	ldr	x0, [x20, x0, lsl 3]
	cbz	x0, .L3254
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
	b	.L3251
	.p2align 3
.L3273:
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
	cbnz	w0, .L3279
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
	cbnz	w2, .L3280
.L3176:
	ldr	x23, .LC812
	ldr	w0, [x20, 2820]
	ldr	x1, [x23, w0, sxtw 3]
	cbz	x1, .L3177
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
.L3177:
	ldr	x1, [x29, 72]
	bl	MetadataUnMapToSec
	cbz	w0, .L3195
	ldr	x2, .LC807
	mov	w3, 13376
	ldr	x1, .LC814
	mov	w0, 0
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3251
	.p2align 3
.L3280:
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
	b	.L3176
.L3277:
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
	b	.L3193
.L3279:
	ldr	x2, .LC807
	mov	w3, 13342
	ldr	x1, .LC809
	mov	w0, 0
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3251
.L3276:
	ldr	x2, .LC807
	mov	w3, 13504
	ldr	x1, .LC809
	mov	w0, 0
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3251
.L3278:
	ldr	x2, .LC807
	mov	w3, 13532
	ldr	x1, .LC814
	mov	w0, 0
	add	x2, x2, 256
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3251
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
	.global	H264DEC_SetDecParam
	.type	H264DEC_SetDecParam, %function
H264DEC_SetDecParam:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 65536
	bl	_mcount
	ldr	w0, [x19, 2836]
	cmp	w0, 1
	beq	.L3299
.L3282:
	mov	x0, x20
	bl	H264DEC_IsNeedSedOnly
	cmp	w0, 1
	beq	.L3300
	ldr	w0, [x19, 2832]
	cmp	w0, 1
	beq	.L3301
.L3281:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3301:
	ldr	w0, [x19, 2744]
	sub	w0, w0, #1
	str	w0, [x19, 2744]
.L3298:
	ldr	x1, [x20, 632]
	cbz	x1, .L3281
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L3299:
	ldr	w0, [x19, 2744]
	cbz	w0, .L3282
	ldr	x0, [x20, 616]
	cbnz	x0, .L3282
	mov	x0, x20
	bl	DecVDM
	ldr	x0, [x20, 616]
	cbnz	x0, .L3281
	b	.L3298
	.p2align 3
.L3300:
	ldr	w1, [x19, 2744]
	add	x2, x20, 61440
	str	w0, [x19, 2732]
	add	x0, x19, 1400
	str	w1, [x19, 2844]
	ldr	w2, [x2, 3420]
	str	w2, [x19, 2252]
	str	w1, [x19, 2452]
	ldr	x1, [x20]
	ldr	w1, [x1, 672]
	str	w1, [x19, 2724]
	str	x0, [x20, 616]
	str	wzr, [x19, 2836]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	H264DEC_SetDecParam, .-H264DEC_SetDecParam
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_CheckSedOnly
	.type	H264DEC_CheckSedOnly, %function
H264DEC_CheckSedOnly:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 65536
	bl	_mcount
	ldr	w0, [x19, 2828]
	str	wzr, [x19, 2832]
	cmp	w0, 2
	beq	.L3336
	cmp	w0, 1
	mov	w0, 0
	beq	.L3337
.L3330:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3337:
	ldr	w1, [x19, 2836]
	cmp	w1, 1
	bne	.L3330
	mov	w0, -1
	str	wzr, [x19, 2836]
	b	.L3330
	.p2align 3
.L3336:
	ldr	w0, [x19, 2824]
	cbz	w0, .L3335
	ldr	w1, [x19, 2836]
	mov	w0, 0
	cmp	w1, 1
	beq	.L3330
	ldr	w0, [x19, 2820]
	bl	VCTRL_CheckFreshSeg
	cbz	w0, .L3335
	ldr	w0, [x19, 2820]
	bl	VCTRL_CheckFreshRaw
	cbz	w0, .L3335
	ldr	x0, [x20, 632]
	ldr	w2, [x0, 16]
	ldr	x1, [x0, 8]
	cmp	w2, 3
	bls	.L3335
	add	x21, x20, 12288
	add	x21, x21, 2600
	mov	x0, x21
	bl	BsInit
	mov	w1, 24
	mov	x0, x21
	bl	BsSkip
	mov	x0, x21
	bl	BsResidBits
	cmp	w0, 7
	ble	.L3335
	mov	w1, 3
	mov	x0, x21
	bl	BsSkip
	mov	w1, 5
	mov	x0, x21
	bl	BsGet
	cmp	w0, 20
	mov	w22, w0
	beq	.L3338
	and	w0, w0, -5
	cmp	w0, 1
	cset	w23, eq
	beq	.L3308
	ldr	w1, [x19, 2744]
	mov	w0, 0
	cbz	w1, .L3335
.L3315:
	and	w1, w22, -9
	cmp	w1, 7
	beq	.L3313
	cmp	w22, 8
	ccmp	w22, 30, 4, ne
	ccmp	w22, 11, 4, ne
	ccmp	w0, wzr, 0, ne
	bne	.L3313
	cbz	w23, .L3335
.L3316:
	add	x20, x20, 61440
	str	wzr, [x19, 2836]
	mov	w0, 1
	str	w0, [x19, 2832]
	mov	w0, 0
	ldrb	w1, [x20, 2672]
	str	w1, [x19, 2840]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3313:
	mov	x0, x20
	bl	DecVDM
	.p2align 2
.L3335:
	mov	w0, -1
	b	.L3330
	.p2align 3
.L3338:
	mov	x0, x21
	bl	BsResidBits
	cmp	w0, 23
	ble	.L3335
	mov	w1, 24
	mov	x0, x21
	mov	w23, 1
	bl	BsGet
	tbnz	x0, 23, .L3339
.L3308:
	mov	x0, x21
	bl	BsResidBits
	cmp	w0, wzr
	mov	w0, 0
	ble	.L3312
	mov	w1, 1
	mov	x0, x21
	bl	BsGet
.L3312:
	ldr	w1, [x19, 2744]
	cbz	w1, .L3316
	b	.L3315
	.p2align 3
.L3339:
	ubfx	x0, x0, 22, 1
	mov	w1, 5
	cmp	w0, w23
	csel	w22, w22, w1, ne
	b	.L3308
	.size	H264DEC_CheckSedOnly, .-H264DEC_CheckSedOnly
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
	str	wzr, [x21, 2880]
	ldr	x0, [x20]
	ldr	w1, [x0, 872]
	cmp	w1, 1
	beq	.L3410
.L3341:
	ldr	x0, [x20, 632]
	cbz	x0, .L3346
	ldrb	w1, [x19]
	cmp	w1, 1
	beq	.L3411
.L3344:
	ldr	x1, .LC823
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbz	x1, .L3346
	ldr	w0, [x21, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L3346:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L3348
	ldr	x0, [x19, 8]
	cbz	x0, .L3348
	ldr	w0, [x19, 16]
	cbz	w0, .L3348
	ldrb	w0, [x20, 641]
	cbz	w0, .L3368
	add	x1, x20, 745
	mov	x0, 1
	b	.L3351
	.p2align 3
.L3350:
	add	w0, w0, 1
	cmp	w0, 137
	beq	.L3366
.L3351:
	ldrb	w2, [x1]
	add	x1, x1, 104
	cbnz	w2, .L3350
	mov	w2, w0
.L3349:
	lsl	x1, x0, 3
	mov	w3, 1
	sub	x1, x1, x0
	cmn	w2, #1
	lsl	x1, x1, x3
	sub	x0, x1, x0
	add	x0, x20, x0, lsl 3
	strb	w3, [x0, 641]
	beq	.L3366
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
	ldr	w0, [x19, 28]
	str	w0, [x21, 2828]
	ldr	x0, [x20]
	ldrb	w0, [x0, 940]
	cmp	w0, w2
	beq	.L3407
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
	b	.L3357
	.p2align 3
.L3411:
	ldr	w2, [x0, 76]
	cmp	w2, 1
	bhi	.L3344
	ldrb	w2, [x0, 4]
	cmp	w2, 1
	bne	.L3345
	b	.L3344
	.p2align 3
.L3410:
	ldr	w0, [x0, 912]
	cbz	w0, .L3341
	ldr	x0, [x20, 632]
	cbz	x0, .L3346
	ldrb	w1, [x19]
.L3345:
	strb	w1, [x0, 4]
	ldr	x0, [x20]
	ldr	w1, [x0, 872]
	cmp	w1, 1
	beq	.L3412
.L3359:
	ldr	w0, [x19, 20]
	cmp	w0, wzr
	ble	.L3360
	ldr	x1, [x19, 8]
	cbz	x1, .L3360
	ldr	w0, [x19, 16]
	cbz	w0, .L3360
	ldr	x0, [x20, 632]
	ldr	w2, [x0, 76]
	cmp	w2, 1
	bls	.L3413
.L3361:
	mov	w1, 1
	strb	w1, [x0, 4]
	ldr	w1, [x19, 24]
	ldr	w0, [x21, 2820]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC826
	ldr	x4, [x0]
	cbz	x4, .L3407
	ldr	w0, [x21, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3407:
	ldr	x0, [x20, 632]
.L3357:
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
.L3348:
	ldr	x1, .LC828
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x19, 24]
	ldr	w0, [x21, 2820]
	bl	SM_ReleaseStreamSeg
	ldr	x0, .LC826
	ldr	x4, [x0]
	cbz	x4, .L3409
.L3408:
	ldr	w0, [x21, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L3409:
	mov	w0, -1
.L3416:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L3360:
	ldr	x0, [x20, 632]
	b	.L3361
	.p2align 3
.L3412:
	ldr	w0, [x0, 912]
	cbnz	w0, .L3407
	b	.L3359
	.p2align 3
.L3413:
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
	ldrb	w0, [x0, 940]
	cmp	w0, 1
	beq	.L3362
	add	x0, x20, 61440
	ldr	w2, [x19, 20]
	ldr	w1, [x0, 3432]
	ldr	w3, [x0, 3436]
	add	w2, w1, w2
	str	w2, [x0, 3432]
	ldr	w1, [x19, 20]
	add	w1, w3, w1
	str	w1, [x0, 3436]
.L3362:
	ldr	x0, [x20, 632]
	ldr	w1, [x0, 16]
	cmp	w1, 4095
	bls	.L3414
.L3363:
	mov	w1, 1
	str	w1, [x21, 2880]
	b	.L3357
	.p2align 3
.L3414:
	mov	x0, x20
	bl	CombinePacket.part.11
	ldr	x0, [x20, 632]
	b	.L3363
.L3366:
	ldr	x1, .LC825
	mov	w0, 0
	add	x22, x20, 12288
	add	x19, x20, 640
	add	x22, x22, 2600
	bl	dprint_vfmw
	b	.L3353
	.p2align 3
.L3352:
	add	x19, x19, 104
	cmp	x19, x22
	beq	.L3415
.L3353:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L3352
	ldr	w0, [x21, 2820]
	mov	x1, x19
	bl	ReleaseNAL
	b	.L3352
.L3415:
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
	cbnz	x4, .L3408
	mov	w0, -1
	b	.L3416
.L3368:
	mov	w2, 0
	mov	x0, 0
	b	.L3349
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
	b	.L3419
	.p2align 3
.L3418:
	add	x19, x19, 104
	cmp	x19, x20
	beq	.L3447
.L3419:
	ldrb	w0, [x19, 1]
	cmp	w0, 1
	bne	.L3418
	ldr	w0, [x21, 2820]
	mov	x1, x19
	add	x19, x19, 104
	bl	ReleaseNAL
	cmp	x19, x20
	bne	.L3419
.L3447:
	ldr	x19, [x29, 104]
	mov	x0, x19
	bl	InitDPB
	cbz	w22, .L3420
	ldr	w0, [x21, 2820]
	add	x1, x19, 8
	bl	FSP_ClearNotInVoQueue
.L3421:
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
.L3424:
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
.L3423:
	ldr	x1, [x20]
	cbnz	x1, .L3448
.L3422:
	add	x20, x20, 8
	cmp	x20, x24
	bne	.L3423
	add	w25, w25, 1
	add	x19, x19, 872
	cmp	w25, 40
	bne	.L3424
	ldr	x0, [x29, 104]
	add	x22, x0, 61440
	add	x19, x22, 3288
	add	x20, x22, 3320
.L3426:
	ldr	x1, [x19]
	cbnz	x1, .L3449
.L3425:
	add	x19, x19, 8
	cmp	x19, x20
	bne	.L3426
	ldr	w0, [x21, 1360]
	mov	w20, 0
	cbz	w0, .L3430
	.p2align 2
.L3437:
	ldr	x0, [x29, 104]
	add	x19, x0, x20, uxtw 3
	add	w20, w20, 1
	add	x19, x19, 65536
	ldr	x0, [x19, 1368]
	mov	x1, x0
	cbz	x0, .L3428
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19, 1368]
.L3428:
	ldr	w0, [x21, 1360]
	cmp	w0, w20
	bhi	.L3437
.L3430:
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
	str	wzr, [x21, 2852]
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
.L3448:
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x20]
	b	.L3422
.L3449:
	ldr	w0, [x21, 2820]
	bl	FreeUsdByDec
	str	xzr, [x19]
	b	.L3425
.L3420:
	ldr	x0, [x29, 104]
	add	x0, x0, 8
	bl	ResetVoQueue
	ldr	w0, [x21, 2820]
	bl	FSP_EmptyInstance
	b	.L3421
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
	bhi	.L3545
	ldrb	w21, [x19, 3]
	cmp	w21, 1
	beq	.L3454
	cbz	w21, .L3455
	cmp	w21, 2
	bne	.L3546
	ldr	x0, [x19, 680]
	mov	w1, 3
	uxtw	x22, w20
	strb	w1, [x0, 720]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3473
	add	x20, x23, x22, lsl 3
	ldr	x0, [x20, 27904]
	cbz	x0, .L3473
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
	cbz	w0, .L3479
	ldrb	w0, [x19, 2]
.L3479:
	strb	w0, [x1]
	ldr	x1, [x20, 27904]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 2
	strb	w0, [x1, 1]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 27904]
	cmp	w0, 1
	beq	.L3547
	ldrb	w0, [x1, 3]
.L3481:
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
	beq	.L3482
	ldr	x0, [x20, 27904]
	str	x4, [x0, 648]
.L3482:
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
	beq	.L3483
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3483
.L3484:
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
	b	.L3472
	.p2align 3
.L3455:
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
	cbz	w2, .L3548
.L3457:
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
	cbnz	w0, .L3549
.L3472:
	add	x3, x22, 3488
	add	x0, x23, 65536
	mov	w2, 1
	ldr	x1, [x23, x3, lsl 3]
	ldr	w0, [x0, 2820]
	ldr	w1, [x1, 672]
	bl	FSP_SetRef
	mov	w0, 0
.L3452:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L3546:
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
.L3454:
	ldr	x0, [x19, 680]
	mov	w1, 3
	uxtw	x22, w20
	strb	w1, [x0, 720]
	ldrb	w0, [x19, 1]
	cbz	w0, .L3460
	add	x20, x23, x22, lsl 3
	ldr	x0, [x20, 27904]
	cbz	x0, .L3460
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
	cbz	w0, .L3465
	ldrb	w0, [x19, 2]
.L3465:
	strb	w0, [x1]
	ldr	x1, [x20, 27904]
	ldrb	w0, [x1, 1]
	orr	w0, w0, 1
	strb	w0, [x1, 1]
	ldrb	w0, [x19, 7]
	ldr	x1, [x20, 27904]
	cmp	w0, 1
	beq	.L3550
	ldrb	w0, [x1, 3]
.L3467:
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
	beq	.L3468
	ldr	x0, [x20, 27904]
	str	x4, [x0, 648]
.L3468:
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
	beq	.L3469
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3469
.L3470:
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
	b	.L3472
	.p2align 3
.L3460:
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
	beq	.L3462
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3462
.L3463:
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
	cbz	w0, .L3472
	ldr	x1, .LC835
	mov	w3, w0
	mov	w2, 2428
	b	.L3543
	.p2align 3
.L3473:
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
	beq	.L3475
	ldrb	w0, [x19, 5]
	cmp	w0, 1
	beq	.L3475
.L3476:
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
	cbz	w0, .L3472
	ldr	x1, .LC835
	mov	w3, w0
	mov	w2, 2575
.L3543:
	mov	w0, 0
	bl	dprint_vfmw
	mov	x0, x23
	bl	ClearDPB
	mov	w0, -1
	b	.L3452
	.p2align 3
.L3548:
	ldrb	w0, [x19, 5]
	mov	w2, 3
	cmp	w0, wzr
	csel	w0, w0, w2, eq
	b	.L3457
	.p2align 3
.L3475:
	ldr	x0, [x20, 27904]
	mov	w1, 2
	strb	w1, [x0, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3476
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 700]
	str	w1, [x0, 684]
	b	.L3476
	.p2align 3
.L3462:
	ldr	x0, [x20, 27904]
	mov	w1, 1
	strb	w1, [x0, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3463
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 700]
	str	w1, [x0, 684]
	b	.L3463
	.p2align 3
.L3483:
	ldr	x1, [x20, 27904]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 2
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3484
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 700]
	str	w1, [x0, 684]
	b	.L3484
	.p2align 3
.L3469:
	ldr	x1, [x20, 27904]
	ldrb	w0, [x1, 2]
	orr	w0, w0, 1
	strb	w0, [x1, 2]
	ldrb	w0, [x19, 4]
	cmp	w0, 1
	bne	.L3470
	ldr	x0, [x20, 27904]
	ldr	w1, [x19, 700]
	str	w1, [x0, 684]
	b	.L3470
	.p2align 3
.L3547:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 2
	uxtb	w0, w0
	b	.L3481
	.p2align 3
.L3550:
	ldrb	w0, [x1, 3]
	orr	w0, w0, 1
	uxtb	w0, w0
	b	.L3467
	.p2align 3
.L3545:
	ldr	x1, .LC833
	mov	w3, w20
	mov	w2, 2333
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3452
.L3549:
	ldr	x1, .LC835
	mov	w3, w0
	mov	w2, 2373
	b	.L3543
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
	ldr	w0, [x0, 636]
	cmp	w0, 1
	beq	.L3741
	add	x22, x24, 61440
	str	wzr, [x22, 2784]
	str	wzr, [x22, 2788]
.L3554:
	add	x19, x24, 20480
	str	wzr, [x19, 728]
	ldrb	w1, [x22, 2675]
	cmp	w1, 2
	cset	w0, eq
	str	w0, [x19, 732]
	ldrb	w0, [x22, 2672]
	cbz	w0, .L3742
	add	x21, x24, 65536
	ldr	x0, .LC843
	ldrsw	x2, [x21, 2820]
	ldr	w3, [x21, 2860]
	str	w3, [x21, 2856]
	ldr	x0, [x0, x2, lsl 3]
	ldrsb	w2, [x0, 44]
	cmp	w2, 1
	beq	.L3743
.L3557:
	ldr	w0, [x21, 2748]
	cmp	w0, 2
	beq	.L3744
	ldr	x20, [x24]
	ldr	w0, [x20, 12]
	cmp	w0, wzr
	ble	.L3745
	ldrb	w2, [x22, 2674]
	cbnz	w2, .L3565
.L3750:
	sub	w2, w1, #1
	ldr	x25, [x22, 3352]
	uxtb	w2, w2
	cbnz	w1, .L3746
.L3566:
	cmp	w2, 1
	bls	.L3747
.L3723:
	cbz	w1, .L3571
	ldrb	w2, [x25, 1]
	cbnz	w2, .L3571
	.p2align 2
.L3565:
	cmp	w0, 2
	beq	.L3748
.L3593:
	ldr	w6, [x22, 3376]
	cbz	w6, .L3602
	ldr	w3, [x21, 2812]
	ldr	w2, [x22, 3404]
	cmp	w3, w2
	bcs	.L3603
	ldrb	w0, [x22, 2674]
	cbz	w0, .L3749
.L3603:
	mov	x0, x24
	bl	Marking
	cbz	w0, .L3605
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
	b	.L3647
.L3742:
	ldr	x1, .LC840
	add	x21, x24, 65536
	bl	dprint_vfmw
	ldr	x1, .LC842
	mov	w3, 3704
	mov	w2, -1
	mov	w0, 14
	bl	dprint_vfmw
	ldr	x20, .LC852
.L3647:
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
.L3645:
	strb	wzr, [x22, 2672]
	mov	w0, w19
.L3730:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
.L3741:
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
	b	.L3554
.L3743:
	ldr	x2, [x0, 176]
	mov	x0, 4294967296
	cmp	x2, x0
	bne	.L3557
	add	x23, x24, 24576
	ldr	x6, [x24, 27848]
	ldr	x7, [x24, 27880]
	ldr	x8, [x24, 27888]
	ldr	w5, [x23, 3296]
	ldr	w4, [x23, 3300]
	cbz	w5, .L3650
	mov	w2, w5
	mov	w3, w4
	b	.L3559
	.p2align 3
.L3651:
	mov	w2, w0
.L3559:
	udiv	w0, w3, w2
	msub	w0, w0, w2, w3
	mov	w3, w2
	cbnz	w0, .L3651
.L3558:
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
	b	.L3557
.L3745:
	ldr	w2, [x21, 2852]
	cmp	w2, 2
	beq	.L3565
	ldrb	w2, [x22, 2674]
	cbnz	w2, .L3565
	b	.L3750
.L3748:
	ldr	w0, [x22, 3376]
	cbz	w0, .L3595
	ldrb	w0, [x22, 2678]
	cmp	w0, 5
	beq	.L3596
.L3600:
	mov	x0, x24
	add	x19, x24, 24576
	bl	SimpleSlideDPB
	ldr	w1, [x19, 3716]
	add	x2, x22, 2672
	mov	x0, x24
	bl	InsertFrmInDPB
	cbz	w0, .L3751
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
	b	.L3647
.L3746:
	ldrb	w3, [x25, 1]
	cmp	w3, wzr
	ccmp	w2, 1, 0, eq
	bls	.L3566
	cmp	w0, 2
	bne	.L3593
	b	.L3748
.L3747:
	ldr	w2, [x21, 2852]
	cbnz	w2, .L3568
	mov	w0, 1
	mov	x2, 768
	str	w0, [x21, 2852]
	add	x1, x22, 2672
	add	x0, x22, 3440
	bl	memcpy
	ldr	w0, [x20, 12]
	b	.L3565
.L3571:
	add	x23, x22, 2672
.L3574:
	cbz	w1, .L3575
	ldrb	w0, [x23, 1]
	cmp	w0, 1
	beq	.L3752
.L3575:
	ldr	w0, [x23, 732]
	str	w0, [x25, 704]
.L3576:
	mov	x1, x25
	mov	x0, x24
	bl	GetImagePara
	ldr	w0, [x21, 2820]
	ldr	w1, [x25, 672]
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L3753
	ldrb	w0, [x23, 3]
	cbz	w0, .L3578
	ldrb	w0, [x23, 1]
	cmp	w0, 1
	beq	.L3754
.L3578:
	ldr	x0, [x23, 656]
.L3732:
	str	x0, [x20, 640]
.L3579:
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
	cbz	w1, .L3585
	ldrb	w0, [x20, 124]
	and	w0, w0, 3
	cbz	w0, .L3755
.L3583:
	ldr	x0, [x24]
	ldr	w2, [x0, 4]
	cmp	w2, w1
	bcs	.L3585
	ldr	x0, .LC850
	ldr	x4, [x0]
	cbz	x4, .L3592
	ldr	w0, [x21, 2820]
	mov	w3, 8
	stp	w1, w2, [x29, 88]
	add	x2, x29, 88
	mov	w1, 104
	blr	x4
.L3592:
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
	b	.L3647
.L3568:
	cmp	w2, 1
	bne	.L3723
	cmp	w1, 1
	add	x23, x22, 2672
	ldr	x25, [x21, 24]
	beq	.L3756
	cmp	w1, 2
	bne	.L3574
	ldr	w0, [x22, 3392]
	str	w0, [x25, 828]
	ldrb	w1, [x23, 3]
	b	.L3574
	.p2align 3
.L3605:
	mov	x0, x24
	bl	UpdateReflist
	mov	x0, x24
	bl	UpdateLTReflist
	mov	x0, x24
	bl	RemoveUnUsedFrameStore
	cbz	w0, .L3595
	ldr	x1, .LC858
	mov	w0, 22
	bl	dprint_vfmw
.L3595:
	ldrb	w0, [x22, 2673]
	cmp	w0, 1
	beq	.L3607
	add	x23, x24, 24576
.L3611:
	ldr	w6, [x22, 3376]
	cbz	w6, .L3757
	ldr	w4, [x23, 3720]
	ldr	w5, [x23, 3724]
	ldr	w3, [x23, 3712]
	add	w0, w4, w5
	cmp	w3, w0
	bhi	.L3619
	ldr	x0, [x24]
	ldr	w0, [x0, 12]
	cmp	w0, 3
	beq	.L3620
	ldr	x0, .LC859
	ldrb	w0, [x0]
	cmp	w0, 1
	beq	.L3620
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
	b	.L3647
.L3602:
	ldrb	w0, [x22, 2673]
	cmp	w0, 1
	beq	.L3607
	add	x23, x24, 24576
	ldr	w3, [x23, 3712]
.L3619:
	mov	w7, -1
	mov	w8, w7
	.p2align 2
.L3636:
	ldr	w1, [x23, 3716]
	cmp	w1, w3
	bcc	.L3758
	cmp	w1, w3
	mov	w19, w1
	bls	.L3626
	mov	w19, w3
	str	w3, [x23, 3716]
.L3626:
	cbz	w19, .L3657
	add	x1, x23, 3328
	mov	w5, 2147483647
	mov	w20, 0
	mov	w0, 0
	.p2align 2
.L3629:
	ldr	x4, [x1]
	add	x1, x1, 8
	ldr	w2, [x4, 688]
	cmp	w2, w5
	bge	.L3628
	ldrb	w4, [x4, 4]
	cmp	w4, wzr
	csel	w20, w20, w0, eq
	csel	w5, w5, w2, eq
.L3628:
	add	w0, w0, 1
	cmp	w0, w19
	bne	.L3629
.L3627:
	cbnz	w6, .L3630
	ldr	w0, [x22, 3380]
	cmp	w0, w5
	blt	.L3759
.L3630:
	cmp	w8, w20
	ccmp	w7, w19, 0, eq
	beq	.L3760
	mov	w1, w20
	mov	x0, x24
	bl	OutputFrmFromDPB
	cmn	w0, #1
	mov	w25, w0
	beq	.L3635
	mov	w7, w19
	mov	w8, w20
	ldr	w6, [x22, 3376]
	ldr	w3, [x23, 3712]
	b	.L3636
.L3657:
	mov	w5, 2147483647
	mov	w20, 0
	b	.L3627
.L3755:
	ldr	x1, .LC849
	mov	w2, 3899
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC850
	ldr	x4, [x0]
	cbz	x4, .L3584
	ldr	w0, [x21, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 111
	blr	x4
.L3584:
	ldr	w1, [x20, 184]
	cbnz	w1, .L3583
.L3585:
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
	beq	.L3761
	ldr	w0, [x21, 2820]
	mov	w2, 0
	ldr	w1, [x25, 672]
	bl	FSP_SetDisplay
.L3587:
	ldr	x0, [x24]
	ldr	w0, [x0, 644]
	add	w0, w0, 2047
	cmp	w0, 4095
	bhi	.L3762
	str	wzr, [x20, 24]
.L3589:
	ldr	w0, [x21, 2868]
	ldr	w1, [x21, 2852]
	add	w0, w0, 2
	str	w0, [x21, 2868]
	cmp	w1, 2
	beq	.L3591
	mov	w0, 1
	str	w0, [x25, 864]
.L3591:
	mov	w0, 2
	str	w0, [x21, 2852]
	ldr	x0, [x24]
	ldr	w0, [x0, 12]
	b	.L3565
.L3744:
	ldr	x1, .LC845
	bl	dprint_vfmw
	mov	x0, x24
	bl	DirectOutput
	mov	w19, w0
	ldr	w1, [x21, 1336]
	ldr	w0, [x22, 3428]
	cmp	w0, w1
	beq	.L3561
	uxtw	x0, w0
	add	x0, x0, 16384
	add	x0, x0, 316
	str	wzr, [x24, x0, lsl 2]
	str	w1, [x22, 3428]
.L3561:
	cmp	w19, 1
	beq	.L3763
.L3562:
	ldr	x1, .LC842
	mov	w3, 3765
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
.L3563:
	cmn	w19, #1
	bne	.L3645
	ldr	x20, .LC852
	b	.L3647
	.p2align 3
.L3607:
	ldr	x0, [x21, 144]
	ldr	x3, [x22, 3352]
	cmp	x3, x0
	ccmp	x0, xzr, 4, eq
	beq	.L3764
	mov	x0, x24
	bl	DirectOutput
	cmn	w0, #1
	mov	w19, w0
	beq	.L3765
	cmp	w0, 1
	bne	.L3615
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 4]
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 1]
.L3615:
	ldr	x1, .LC842
	mov	w3, 4045
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3563
	.p2align 3
.L3758:
	cbz	w6, .L3638
	ldrb	w0, [x22, 2676]
	cbnz	w0, .L3638
	ldr	w0, [x23, 3720]
	cbz	w0, .L3638
	mov	w0, 0
	b	.L3643
	.p2align 3
.L3640:
	ldr	w1, [x23, 3720]
	cmp	w1, w0
	bls	.L3766
.L3643:
	add	x1, x24, x0, uxtw 3
	ldr	w3, [x22, 3368]
	add	w0, w0, 1
	ldr	x2, [x1, 28032]
	ldr	w4, [x2, 676]
	cmp	w4, w3
	bne	.L3640
	strb	wzr, [x2, 2]
	ldr	x2, [x1, 28032]
	ldrb	w3, [x2, 4]
	cmp	w3, 1
	beq	.L3767
.L3641:
	ldr	w1, [x2, 708]
	ldr	w3, [x21, 1336]
	cmp	w1, w3
	uxtw	x1, w1
	add	x1, x1, 16384
	beq	.L3640
	add	x1, x1, 316
	str	wzr, [x24, x1, lsl 2]
	str	w3, [x2, 708]
	b	.L3640
.L3766:
	ldr	w1, [x23, 3716]
.L3638:
	add	x2, x22, 2672
	mov	x0, x24
	bl	InsertFrmInDPB
	ldr	w1, [x23, 3716]
	str	w1, [x21, 136]
	cbz	w0, .L3644
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
	b	.L3647
.L3635:
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
	b	.L3647
.L3749:
	ldr	x1, .LC854
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC850
	ldr	x4, [x0]
	cbz	x4, .L3604
	ldr	w1, [x21, 2812]
	mov	w3, 8
	ldr	w2, [x22, 3404]
	ldr	w0, [x21, 2820]
	stp	w2, w1, [x29, 88]
	add	x2, x29, 88
	mov	w1, 104
	blr	x4
.L3604:
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
	b	.L3647
.L3761:
	ldr	w0, [x21, 2876]
	add	w0, w0, 1
	str	w0, [x21, 2876]
	b	.L3587
.L3751:
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
	b	.L3645
.L3620:
	ldr	w6, [x23, 3716]
	cmp	w6, w3
	bls	.L3622
	mov	w6, w3
	str	w3, [x23, 3716]
.L3622:
	cbz	w6, .L3654
	add	x2, x23, 3328
	mov	w1, 0
	mov	w0, 0
	mov	w5, 2147483647
	.p2align 2
.L3625:
	ldr	x4, [x2]
	add	x2, x2, 8
	ldr	w3, [x4, 688]
	cmp	w3, w5
	bge	.L3624
	ldrb	w4, [x4, 4]
	cmp	w4, wzr
	csel	w1, w1, w0, eq
	csel	w5, w5, w3, eq
.L3624:
	add	w0, w0, 1
	cmp	w0, w6
	bne	.L3625
.L3623:
	mov	x0, x24
	bl	RemoveFrameStoreOutDPB
	mov	x0, x24
	bl	UpdateReflist
	mov	x0, x24
	bl	UpdateLTReflist
	ldr	w6, [x22, 3376]
	ldr	w3, [x23, 3712]
	b	.L3619
.L3754:
	ldr	x0, [x23, 656]
	cmn	x0, #1
	bne	.L3579
	ldr	x0, [x21]
	cmn	x0, #1
	bne	.L3732
	b	.L3579
	.p2align 3
.L3644:
	add	w1, w1, 1
	mov	x0, x24
	str	w1, [x23, 3716]
	mov	w19, 0
	bl	UpdateReflist
	mov	x0, x24
	bl	UpdateLTReflist
	b	.L3645
.L3760:
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
	b	.L3647
.L3759:
	ldr	w0, [x21, 2748]
	cmp	w0, 2
	beq	.L3768
.L3631:
	mov	x0, x24
	bl	DirectOutput
	cmn	w0, #1
	mov	w19, w0
	beq	.L3769
	cmp	w0, 1
	bne	.L3633
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 4]
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 1]
.L3633:
	ldr	x1, .LC842
	mov	w3, 4144
	mov	w2, w19
	mov	w0, 14
	bl	dprint_vfmw
	b	.L3563
.L3764:
	add	x23, x24, 24576
	ldr	w4, [x23, 3716]
	cbz	w4, .L3611
	ldr	x0, [x24, 27904]
	cmp	x3, x0
	beq	.L3770
	add	x0, x23, 3336
	mov	w1, 0
	.p2align 2
.L3616:
	add	w1, w1, 1
	cmp	w1, w4
	beq	.L3611
	ldr	x2, [x0], 8
	cmp	x3, x2
	bne	.L3616
.L3612:
	add	x2, x22, 2672
	mov	x0, x24
	bl	InsertFrmInDPB
	cmn	w0, #1
	mov	w19, w0
	beq	.L3771
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
	b	.L3645
.L3757:
	ldr	w3, [x23, 3712]
	b	.L3619
.L3762:
	mov	x1, x20
	mov	x0, x24
	bl	SetFrmRepeatCount.part.1
	b	.L3589
.L3763:
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 4]
	ldr	x0, [x22, 3352]
	strb	wzr, [x0, 1]
	b	.L3562
.L3596:
	mov	x0, x24
	bl	IDRMemMarking
	cbz	w0, .L3600
	mov	w0, -1
	b	.L3730
	.p2align 3
.L3752:
	mov	w0, 3
	strb	w0, [x25, 1]
	ldr	w1, [x25, 704]
	ldr	w0, [x23, 732]
	add	w0, w1, w0
	str	w0, [x25, 704]
	b	.L3576
.L3767:
	str	w3, [x2, 692]
	ldr	x2, [x1, 28032]
	strb	wzr, [x2, 4]
	ldr	x2, [x1, 28032]
	b	.L3641
.L3771:
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
	b	.L3647
.L3768:
	ldrb	w0, [x22, 2675]
	cbz	w0, .L3631
	ldr	x0, [x22, 3352]
	str	x0, [x21, 152]
	b	.L3631
.L3753:
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
	b	.L3647
.L3654:
	mov	w1, 0
	b	.L3623
.L3650:
	mov	w2, w4
	b	.L3558
.L3756:
	ldr	w0, [x22, 3388]
	str	w0, [x25, 780]
	ldrb	w1, [x23, 3]
	b	.L3574
.L3769:
	ldr	x1, .LC852
	mov	w3, w0
	mov	w2, 4135
	mov	w0, 1
	bl	dprint_vfmw
	b	.L3633
.L3765:
	ldr	x1, .LC852
	mov	w3, w0
	mov	w2, 4035
	mov	w0, 1
	bl	dprint_vfmw
	b	.L3615
.L3770:
	mov	w1, 0
	b	.L3612
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
	cbz	w0, .L3773
	ldrb	w1, [x21, 1586]
	cbz	w1, .L3841
	add	x26, x25, 65536
	ldr	w22, [x26, 2748]
	cmp	w22, 2
	beq	.L3799
	add	x24, x25, 61440
	mov	w22, 2
	strb	wzr, [x24, 2673]
	ldrb	w1, [x26, 112]
	cmp	w1, 1
	bne	.L3801
	b	.L3798
	.p2align 3
.L3773:
	add	x26, x25, 65536
	ldr	w0, [x26, 2748]
	cmp	w0, 2
	beq	.L3842
	add	x24, x25, 61440
	mov	w22, 0
	strb	wzr, [x24, 2673]
.L3801:
	strb	wzr, [x24, 2672]
	ldr	w3, [x26, 1332]
	cbz	w3, .L3792
	add	x19, x25, 28672
	mov	x20, 0
	add	x19, x19, 560
	.p2align 2
.L3791:
	ldrb	w0, [x19, 1]
	cbnz	w0, .L3786
	cbz	x19, .L3787
	add	x0, x25, 24576
	ldr	w2, [x0, 3716]
	cbz	w2, .L3787
	ldr	x0, [x25, 27904]
	cmp	x0, x19
	beq	.L3786
	sub	w2, w2, #1
	mov	x0, x25
	add	x2, x25, x2, lsl 3
	b	.L3789
	.p2align 3
.L3790:
	ldr	x1, [x0, 27904]
	cmp	x1, x19
	beq	.L3786
.L3789:
	cmp	x0, x2
	add	x0, x0, 8
	bne	.L3790
.L3787:
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
	bne	.L3792
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
	beq	.L3793
	add	x1, x0, 8
	ldr	x0, [x25]
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L3843
.L3794:
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
.L3783:
	cmp	w0, wzr
	uxtb	w1, w22
	mov	w2, 3
	strb	w1, [x24, 2675]
	csel	w0, w0, w2, eq
	strb	w0, [x3, 720]
	ldrb	w0, [x24, 2673]
	cmp	w0, 1
	beq	.L3844
	strb	w1, [x26, 112]
	ldr	w1, [x26, 2860]
	ldr	w0, [x21, 1604]
	str	w0, [x26, 120]
	ldr	w0, [x21, 1616]
	str	w0, [x26, 116]
	stp	w1, w4, [x26, 128]
	cbnz	w22, .L3845
	strb	wzr, [x26, 113]
	mov	w0, 0
.L3833:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3841:
	add	x26, x25, 65536
	ldr	w1, [x26, 2748]
	cmp	w1, 2
	beq	.L3846
	add	x24, x25, 61440
	mov	w22, 1
	strb	wzr, [x24, 2673]
	ldrb	w1, [x26, 112]
	cmp	w1, 2
	bne	.L3801
.L3798:
	ldr	w1, [x21, 1604]
	ldr	w2, [x26, 120]
	cmp	w2, w1
	bne	.L3801
	ldr	w1, [x21, 1616]
	cbnz	w1, .L3777
	ldr	w1, [x26, 116]
	cbnz	w1, .L3801
.L3778:
	ldr	w2, [x26, 2856]
	ldr	w1, [x26, 2860]
	sub	w1, w1, w2
	cmp	w1, 2
	bhi	.L3801
	ldr	x3, [x24, 3352]
	mov	w1, 1
	strb	w1, [x24, 2673]
	cbz	x3, .L3780
	cmp	w22, 2
	beq	.L3847
	cmp	w22, 1
	mov	w4, 0
	bne	.L3783
	ldrb	w1, [x3, 1]
	cmp	w1, 2
	beq	.L3783
.L3780:
	strb	wzr, [x24, 2673]
	b	.L3801
	.p2align 3
.L3842:
	mov	w22, 0
.L3799:
	add	x24, x25, 61440
	strb	wzr, [x24, 2673]
	b	.L3801
	.p2align 3
.L3786:
	add	w20, w20, 1
	add	x19, x19, 872
	cmp	w20, w3
	bne	.L3791
.L3792:
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
.L3845:
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
.L3846:
	mov	w22, 1
	b	.L3799
.L3844:
	strb	wzr, [x26, 112]
	mov	w0, 0
	ldr	w2, [x26, 2860]
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
.L3843:
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
	b	.L3794
.L3777:
	ldr	w1, [x26, 116]
	cbz	w1, .L3801
	b	.L3778
.L3793:
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
	b	.L3833
.L3847:
	ldrb	w0, [x3, 1]
	cmp	w0, 1
	bne	.L3780
	ldrb	w0, [x21, 1585]
	mov	w4, 0
	b	.L3783
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
	cbz	w0, .L3872
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
	bhi	.L3873
.L3852:
	cbz	w0, .L3863
	sub	w3, w0, #1
	mov	w22, 0
	add	x3, x3, 3489
	add	x0, x25, 3328
	add	x3, x19, x3, lsl 3
	.p2align 2
.L3855:
	ldr	x2, [x0]
	add	x0, x0, 8
	ldr	w1, [x2, 688]
	cmp	w22, w1
	bge	.L3854
	ldrb	w2, [x2, 4]
	cmp	w2, wzr
	csel	w22, w22, w1, eq
.L3854:
	cmp	x0, x3
	bne	.L3855
.L3853:
	ldr	w0, [x29, 120]
	mov	w23, 1
	str	wzr, [x29, 124]
	mov	w24, w23
	cmp	w0, w26
	bne	.L3868
	b	.L3860
	.p2align 3
.L3858:
	mov	x1, 0
	mov	x0, x19
	strb	wzr, [x27, 2676]
	bl	StorePicInDPB
	add	w1, w26, 1
	cbnz	w0, .L3874
.L3859:
	sdiv	w0, w1, w21
	str	w26, [x20, 1600]
	msub	w26, w0, w21, w1
	ldr	w0, [x29, 120]
	cmp	w0, w26
	beq	.L3860
	ldr	w0, [x25, 3716]
	ldr	w1, [x29, 124]
	cmp	w1, w0
	bhi	.L3860
.L3868:
	mov	w1, 1
	mov	x0, x19
	bl	AllocFrameStore
	cbnz	w0, .L3875
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
	cbz	w0, .L3858
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
	bls	.L3858
	cmp	w0, w22
	ldr	w0, [x29, 124]
	mov	x1, 0
	strb	wzr, [x27, 2676]
	csinc	w0, w0, w0, ls
	str	w0, [x29, 124]
	mov	x0, x19
	bl	StorePicInDPB
	add	w1, w26, 1
	cbz	w0, .L3859
.L3874:
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
.L3873:
	mov	w0, w1
	str	w1, [x25, 3716]
	b	.L3852
	.p2align 3
.L3872:
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
.L3860:
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
.L3875:
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
.L3863:
	mov	w22, 0
	b	.L3853
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
	mov	x2, 2912
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
	beq	.L3886
	mov	w2, 32
	mov	w1, 256
	mov	w0, 136
	str	w2, [x20, 14944]
	str	w0, [x20, 14940]
	str	w1, [x20, 14948]
.L3878:
	ldr	w0, [x21, 624]
	mov	w23, 2208
	add	x19, x20, 65536
	bl	MEM_Phy2Vir
	ldr	x1, [x20]
	mov	w2, 4000
	ldr	w4, [x20, 14944]
	ldr	w5, [x20, 14948]
	ldrsw	x3, [x1, 620]
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
	beq	.L3887
	ldr	w6, [x21, 648]
	cmp	w6, wzr
	ccmp	x3, xzr, 4, eq
	ccmp	x1, xzr, 4, ne
	beq	.L3881
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
.L3881:
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
	str	wzr, [x19, 2852]
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x19, 2820]
	beq	.L3888
	mov	w1, 0
	mov	x0, x20
	bl	ClearAll
	str	wzr, [x19, 2848]
	mov	w0, 1
	ldr	x1, [x20]
	ldr	w1, [x1, 664]
	str	w1, [x19, 2824]
.L3880:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L3886:
	ldr	w0, [x21, 724]
	str	w0, [x20, 14944]
	ldr	w0, [x21, 728]
	str	w0, [x20, 14948]
	ldr	w0, [x21, 716]
	str	w0, [x20, 14940]
	b	.L3878
.L3887:
	ldr	x2, .LC883
	mov	w3, 13185
	ldr	x1, .LC885
	mov	w0, 0
	add	x2, x2, 296
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3880
	.p2align 3
.L3888:
	ldr	x1, .LC887
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L3880
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
	add	x22, x21, 65536
	bl	_mcount
	mov	w20, 4000
	mov	w1, 2208
	ldr	x4, [x21, 14968]
	ldr	w0, [x23, 1596]
	ldr	w3, [x22, 2832]
	ldr	x2, [x21, 14960]
	umull	x0, w0, w1
	cmp	w3, 1
	add	x25, x4, x0
	ldr	w1, [x25, 28]
	umull	x1, w1, w20
	add	x20, x2, x1
	beq	.L4023
	add	x19, x21, 61440
	ldrb	w0, [x19, 2672]
	cbz	w0, .L3893
	ldr	x0, [x19, 3352]
	cbz	x0, .L3894
	ldrb	w1, [x0, 1]
	cbz	w1, .L4024
	strb	wzr, [x19, 2672]
.L3893:
	add	x1, x29, 108
	mov	x0, x21
	bl	GetReRangeFlag
	mov	w26, w0
	ldr	w1, [x21, 15012]
	ldr	w0, [x20, 36]
	cmp	w1, w0
	beq	.L4025
.L3896:
	ldr	x1, .LC891
	add	x0, x21, 12288
	strb	wzr, [x20, 24]
	mov	x2, 4000
	add	x0, x0, 2688
	ldr	x3, [x1, 112]
	mov	x1, x20
	blr	x3
.L3897:
	ldr	w0, [x29, 108]
	cbnz	w0, .L4026
	ldr	x0, [x21]
	ldr	w0, [x0, 912]
	cmp	w0, 1
	beq	.L3899
	add	x24, x21, 16384
.L3909:
	ldr	w1, [x24, 2616]
	ldr	w0, [x25, 24]
	cmp	w1, w0
	bne	.L3920
	ldrb	w0, [x25, 20]
	cbnz	w0, .L3920
.L3921:
	ldr	w0, [x23, 728]
	ldr	w3, [x24, 788]
	cbz	w0, .L3922
	str	wzr, [x23, 1600]
	str	wzr, [x22, 120]
.L3922:
	ldr	w0, [x22, 2748]
	cmp	w0, 2
	beq	.L3923
	ldr	x2, [x21]
	ldr	w0, [x2, 12]
	sub	w0, w0, #2
	cmp	w0, 1
	bls	.L3923
	ldr	w1, [x23, 1600]
	ldr	w4, [x23, 1604]
	cmp	w4, w1
	beq	.L3924
	mov	w0, 1
	add	w3, w3, 4
	lsl	w3, w0, w3
	add	w5, w1, w0
	udiv	w0, w5, w3
	msub	w0, w0, w3, w5
	cmp	w4, w0
	beq	.L3961
	ldr	w0, [x2, 640]
	cbnz	w0, .L3925
	ldr	w0, [x2, 680]
	cmp	w0, 1
	beq	.L4027
.L3926:
	cmp	w4, w1
	bls	.L3927
	ldr	w0, [x24, 1864]
	sub	w1, w4, w1
	cmp	w0, w1
	bcs	.L3925
	ldrb	w0, [x23, 1584]
	cmp	w0, 2
	beq	.L3928
.L3933:
	ldr	w0, [x22, 2816]
	cbnz	w0, .L3925
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
	cbnz	w0, .L3934
	mov	x0, x21
	bl	ClearDPB
.L3934:
	ldr	w0, [x23, 1600]
	mov	w2, 6957
	ldr	w3, [x23, 1604]
	ldr	x1, .LC905
	ldr	w4, [x24, 1864]
	sub	w3, w3, w0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
	.p2align 3
.L4026:
	ldr	x0, [x21]
	ldr	w1, [x0, 748]
	cbnz	w1, .L3899
	ldr	w0, [x0, 28]
	cmp	w0, 25
	bne	.L3899
	ldr	w0, [x22, 2780]
	add	w0, w0, 1
	str	w0, [x22, 2780]
	cbnz	w26, .L4028
.L3900:
	cbz	x21, .L3959
	mov	x0, x21
	bl	ClearAllSlice
	mov	x0, x21
	bl	InitDPB.part.15
	mov	w3, w0
	cbnz	w0, .L3901
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
	cbz	w26, .L3903
	ldr	w1, [x21, 14932]
	cbnz	w1, .L3903
	ldr	w4, [x24, 1864]
	str	w4, [x22, 1336]
	ldr	x3, [x21]
	ldr	w1, [x3, 708]
	cmp	w28, w1
	bhi	.L3904
	ldr	w2, [x3, 712]
	cmp	w27, w2
	bhi	.L3904
	add	x5, x21, 24576
	ldr	w6, [x3, 732]
	ldr	w5, [x5, 3712]
	cmp	w6, w5
	bcc	.L4029
	ldr	w0, [x3, 736]
	cbnz	w0, .L3907
	mov	w4, 1
	str	w4, [x22, 1336]
	ldr	w1, [x3, 708]
	ldr	w2, [x3, 712]
.L3907:
	add	x3, x22, 1332
	mov	x0, x21
	bl	H264_ArrangeVahbMem
	cmp	w0, 1
	bne	.L4020
.L3903:
	lsr	w28, w28, 4
	lsr	w27, w27, 4
	str	w28, [x21, 14932]
	str	w27, [x21, 14936]
	b	.L3909
	.p2align 3
.L4025:
	ldrb	w0, [x20, 24]
	cbz	w0, .L3897
	b	.L3896
	.p2align 3
.L3899:
	ldr	w0, [x22, 2780]
	add	w0, w0, 1
	str	w0, [x22, 2780]
	cbnz	w26, .L3910
	ldr	x0, [x21]
	ldr	w0, [x0, 912]
	cmp	w0, 1
	beq	.L3910
	mov	x0, x21
	bl	FlushDPB
	cbnz	w0, .L4030
.L3913:
	cbz	x21, .L3960
.L4032:
	mov	x0, x21
	bl	ClearAllSlice
	mov	x0, x21
	bl	InitDPB.part.15
	cbnz	w0, .L3914
	cbnz	w26, .L3916
	ldr	x0, [x21]
	add	x24, x21, 16384
	ldr	w0, [x0, 912]
	cmp	w0, 1
	bne	.L3909
.L3916:
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
	beq	.L4031
.L4020:
	ldr	x0, [x21]
	ldr	w0, [x0, 912]
	cmp	w0, 1
	bne	.L3908
	mov	w0, -2
	b	.L3892
	.p2align 3
.L3910:
	ldr	x1, .LC902
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x22, 2896]
	cmp	w0, 1
	bne	.L3913
	mov	x0, x21
	bl	GetBackPicFromVOQueue
	cbnz	x21, .L4032
	.p2align 2
.L3960:
	mov	w0, -1
.L3914:
	ldr	x1, .LC894
	mov	w3, w0
	mov	w2, 6860
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
	.p2align 3
.L3920:
	ldr	x0, .LC891
	mov	x2, 2208
	strb	wzr, [x25, 20]
	mov	x1, x25
	ldr	x3, [x0, 112]
	add	x0, x24, 2592
	blr	x3
	b	.L3921
.L3961:
	mov	w1, w4
	.p2align 2
.L3924:
	ldr	w0, [x23, 1616]
	cbz	w0, .L3943
	str	w1, [x23, 1600]
.L3943:
	mov	x0, x21
	str	w1, [x23, 768]
	bl	DecPOC
	mov	w1, 0
	mov	x0, x21
	bl	AllocFrameStore
	cbnz	w0, .L4033
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
	cbz	w2, .L3945
	strb	w4, [x23, 1585]
	mov	w2, w4
	mov	w4, 2
.L3945:
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
	cbnz	w2, .L3963
	ldrb	w0, [x25, 2707]
	mov	w1, 0
	cbnz	w0, .L4034
.L3946:
	strb	w0, [x19, 2681]
	str	w1, [x22, 2728]
	cbz	w3, .L3947
	str	w5, [x23, 1600]
.L3947:
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
	cbz	x0, .L4035
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
	cbz	x0, .L3949
	ldr	w3, [x19, 2800]
	mov	w1, 0
	ldr	w2, [x0, 8]
	cmp	w3, wzr
	ldr	w0, [x22, 2820]
	cset	w3, ne
	bl	FSP_SetStoreType
.L3949:
	ldr	w1, [x22, 1360]
	add	x4, x19, 3288
	add	x5, x19, 3320
.L3953:
	ldr	x0, [x4]
	cbnz	x0, .L3950
	cbz	w1, .L3950
	ldr	x0, [x22, 1368]
	subs	w1, w1, #1
	str	x0, [x4]
	beq	.L3951
	add	x3, x22, 1368
	mov	w2, 0
	.p2align 2
.L3952:
	add	w0, w2, 1
	mov	x2, x0
	cmp	w0, w1
	add	x0, x0, 8192
	add	x0, x21, x0, lsl 3
	ldr	x0, [x0, 1368]
	str	x0, [x3], 8
	bne	.L3952
.L3951:
	uxtw	x0, w1
	add	x0, x0, 8192
	add	x0, x21, x0, lsl 3
	str	xzr, [x0, 1368]
	str	w1, [x22, 1360]
.L3950:
	add	x4, x4, 8
	cmp	x5, x4
	bne	.L3953
	cbz	w1, .L3955
	cmp	w1, wzr
	ble	.L3955
	.p2align 2
.L3956:
	add	x23, x21, x1, sxtw 3
	sub	w20, w1, #1
	add	x23, x23, 65536
	ldr	w0, [x22, 2820]
	ldr	x1, [x23, 1360]
	bl	FreeUsdByDec
	str	xzr, [x23, 1360]
	mov	w1, w20
	cbnz	w20, .L3956
.L3955:
	str	wzr, [x22, 1360]
	mov	x0, x21
	str	wzr, [x19, 3396]
	bl	CalcPicNum
	mov	w0, 0
.L3892:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
.L3928:
	cbnz	w4, .L3930
	sub	w4, w3, #1
.L3931:
	mov	x0, x21
	str	w4, [x23, 1600]
	bl	FlushDPB
	cbnz	w0, .L4036
	ldrb	w0, [x23, 1584]
	cmp	w0, 2
	bne	.L3933
	.p2align 2
.L3925:
	mov	x0, x21
	bl	DecGap
	cbnz	w0, .L4037
.L3923:
	ldr	w1, [x23, 1604]
	b	.L3924
	.p2align 3
.L4023:
	ldrb	w2, [x20, 18]
	mov	w5, 2
	ldr	w7, [x20, 3252]
	add	x19, x21, 61440
	sub	w1, w5, w2
	ldrb	w6, [x23, 1585]
	madd	w1, w7, w1, w1
	add	w2, w6, 1
	udiv	w1, w1, w2
	str	w1, [x19, 3412]
	ldrb	w2, [x20, 18]
	ldr	w7, [x20, 3252]
	sub	w2, w5, w2
	madd	w2, w7, w2, w2
	str	w2, [x19, 3416]
	ldr	w2, [x20, 3248]
	add	w2, w2, 1
	str	w2, [x19, 3408]
	mul	w1, w1, w2
	str	w1, [x19, 3420]
	ldrb	w0, [x4, x0]
	strb	w0, [x19, 2680]
	cbnz	w6, .L3957
	ldrb	w0, [x20, 19]
	cbnz	w0, .L4038
	mov	w3, 0
	b	.L3891
	.p2align 3
.L3963:
	mov	w1, 0
	mov	w0, 0
	b	.L3946
	.p2align 3
.L3957:
	mov	w3, 0
	mov	w0, 0
.L3891:
	strb	w0, [x19, 2681]
	mov	w0, 0
	str	w3, [x22, 2728]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4034:
	mov	w1, 1
	mov	w0, w1
	b	.L3946
	.p2align 3
.L4024:
	ldr	w1, [x0, 672]
	mov	w2, 1
	ldr	w0, [x22, 2820]
	bl	FSP_ClearLogicFs
	ldr	x0, [x19, 3352]
	strb	wzr, [x0, 1]
	ldr	x0, [x19, 3352]
	strb	wzr, [x0, 4]
	strb	wzr, [x19, 2672]
	b	.L3893
	.p2align 3
.L4031:
	lsr	w27, w27, 4
	lsr	w26, w26, 4
	str	w27, [x21, 14932]
	str	w26, [x21, 14936]
	b	.L3909
	.p2align 3
.L3908:
	ldr	x1, .LC900
	mov	w0, 0
	str	wzr, [x21, 14932]
	str	wzr, [x21, 14936]
	bl	dprint_vfmw
	mov	w1, 0
	mov	x0, x21
	bl	ClearAll
	mov	w0, -1
	b	.L3892
	.p2align 3
.L4038:
	mov	w0, w3
	b	.L3891
.L3927:
	sub	w0, w4, w1
	ldr	w1, [x24, 1864]
	add	w0, w0, w3
	cmp	w1, w0
	bcs	.L3925
	ldrb	w0, [x23, 1584]
	cmp	w0, 2
	beq	.L3935
.L3940:
	ldr	w0, [x22, 2816]
	cbnz	w0, .L3925
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
	cbnz	w0, .L3941
	mov	x0, x21
	bl	ClearDPB
.L3941:
	ldr	w0, [x23, 1600]
	mov	w2, 6990
	ldr	w3, [x23, 1604]
	ldr	x1, .LC905
	ldr	w4, [x24, 1864]
	sub	w3, w3, w0
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
	.p2align 3
.L3959:
	mov	w3, -1
.L3901:
	ldr	x1, .LC894
	mov	w2, 6734
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
	.p2align 3
.L4028:
	mov	x0, x21
	bl	FlushDPB
	cbz	w0, .L3900
	ldr	x1, .LC892
	mov	w3, w0
	mov	w2, 6725
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
	.p2align 3
.L4030:
	ldr	x1, .LC892
	mov	w3, w0
	mov	w2, 6851
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
.L4037:
	ldr	x1, .LC907
	mov	w2, 7002
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
	.p2align 3
.L3894:
	ldr	x2, .LC888
	mov	w3, 6691
	ldr	x1, .LC890
	mov	w0, 22
	add	x2, x2, 312
	bl	dprint_vfmw
	strb	wzr, [x19, 2672]
	b	.L3893
.L4027:
	ldr	w0, [x2, 676]
	cbnz	w0, .L3926
	ldr	w0, [x2, 684]
	cbnz	w0, .L3926
	ldr	w0, [x2, 644]
	add	w0, w0, 1024
	cmp	w0, 2048
	bhi	.L3925
	b	.L3926
.L4033:
	ldr	x1, .LC909
	mov	w2, 7026
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
.L3935:
	cbnz	w4, .L3937
	sub	w4, w3, #1
.L3938:
	mov	x0, x21
	str	w4, [x23, 1600]
	bl	FlushDPB
	cbnz	w0, .L4039
	ldrb	w0, [x23, 1584]
	cmp	w0, 2
	beq	.L3925
	b	.L3940
	.p2align 3
.L4035:
	ldr	x2, .LC888
	mov	w3, 7109
	ldr	x1, .LC915
	mov	w0, 22
	add	x2, x2, 312
	bl	dprint_vfmw
	mov	w0, w23
	b	.L3892
.L3937:
	sub	w4, w4, #1
	b	.L3938
.L3930:
	sub	w4, w4, #1
	b	.L3931
.L3904:
	ldr	x1, .LC896
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
.L4029:
	ldr	x1, .LC898
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
.L4039:
	ldr	x1, .LC892
	mov	w3, w0
	mov	w2, 6974
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
.L4036:
	ldr	x1, .LC892
	mov	w3, w0
	mov	w2, 6941
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -1
	b	.L3892
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
	beq	.L4097
.L4041:
	mov	x0, x19
	bl	ProcessSliceHeaderFirstPart
	cbnz	w0, .L4096
	mov	x0, x19
	bl	ProcessSliceHeaderSecondPart
	cbnz	w0, .L4096
	ldr	w2, [x20, 2744]
	mov	w3, 0
	cbz	w2, .L4048
	sub	w9, w2, #1
	add	x4, x20, 176
	add	x9, x9, 8192
	mov	w10, 0
	add	x9, x9, 23
	mov	w3, 0
	mov	x0, 0
	add	x9, x19, x9, lsl 3
	.p2align 2
.L4056:
	ldr	x1, [x4]
	ldr	x6, [x1, 8]
	cbz	x6, .L4071
	ldr	x5, [x1, 40]
	ldr	w7, [x1, 16]
	cbz	x5, .L4072
.L4103:
	ldr	w1, [x1, 48]
.L4051:
	cbz	x0, .L4052
	cmp	x6, x0
	mov	w8, w7
	bls	.L4053
	sub	x0, x6, x0
	sub	w0, w0, w10
	add	w8, w0, w7
.L4053:
	add	w3, w1, w3
	add	w3, w8, w3
.L4054:
	cbz	x5, .L4074
	mov	x0, x5
	mov	w10, w1
.L4055:
	add	x4, x4, 8
	cmp	x9, x4
	bne	.L4056
.L4048:
	add	x22, x19, 61440
	str	w3, [x20, 2804]
	ldr	w0, [x22, 3408]
	ldr	w4, [x22, 3412]
	mul	w4, w0, w4
	cmp	w4, 1620
	bgt	.L4098
	lsl	w0, w4, 2
	mov	w1, 32769
	sub	w4, w0, w4
	mov	w0, 16384
	lsl	w4, w4, 8
	cmp	w4, w1
	asr	w4, w4, 1
	csel	w4, w4, w0, gt
.L4058:
	ldr	w0, [x19, 14940]
	cmp	w0, w2
	bls	.L4059
	cmp	w4, w3
	bcc	.L4059
	ldrb	w0, [x21, 1589]
	cbz	w0, .L4062
	ldr	x1, .LC925
	mov	w0, 2
	bl	dprint_vfmw
	ldrb	w0, [x21, 1587]
	cmp	w0, 5
	ldr	w0, [x20, 2784]
	beq	.L4099
.L4064:
	add	w0, w0, 1
	str	wzr, [x20, 2800]
	str	w0, [x20, 2784]
	ldrb	w0, [x22, 2675]
	cbnz	w0, .L4065
	ldr	w0, [x20, 2788]
	add	w0, w0, 1
	str	w0, [x20, 2788]
.L4066:
	mov	x0, x19
	bl	InitPic
	cmn	w0, #2
	beq	.L4045
	cbnz	w0, .L4100
	mov	x0, x19
	bl	WritePicMsg
.L4062:
	mov	x0, x19
	bl	PicTypeStatistic
	ldr	w0, [x20, 2832]
	cbnz	w0, .L4068
	mov	x0, x19
	bl	DecList
	cbnz	w0, .L4101
	mov	x0, x19
	bl	IsRefListWrong
	cbnz	w0, .L4102
	mov	x0, x19
	bl	ExitSlice
.L4068:
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
.L4045:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4074:
	mov	x0, x6
	mov	w10, w7
	b	.L4055
	.p2align 3
.L4052:
	add	w3, w7, w3
	add	w3, w3, w1
	b	.L4054
	.p2align 3
.L4071:
	ldr	x5, [x1, 40]
	mov	w7, 0
	cbnz	x5, .L4103
	.p2align 2
.L4072:
	mov	w1, 0
	b	.L4051
	.p2align 3
.L4098:
	lsl	w4, w4, 8
	b	.L4058
	.p2align 3
.L4097:
	ldr	x2, [x0, 176]
	mov	x0, 4294967296
	cmp	x2, x0
	ccmp	w1, 5, 0, eq
	bne	.L4041
	ldr	x0, [x19]
	ldr	x0, [x0, 56]
	cmn	x0, #1
	beq	.L4041
	ldr	x1, [x19, 27848]
	str	x0, [x19, 27880]
	str	x1, [x19, 27888]
	b	.L4041
	.p2align 3
.L4065:
	ldr	w0, [x20, 2792]
	add	w0, w0, 1
	str	w0, [x20, 2792]
	b	.L4066
	.p2align 3
.L4099:
	str	w0, [x20, 2796]
	b	.L4064
.L4096:
	ldr	x1, .LC918
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC919
	ldr	x4, [x0]
	cbz	x4, .L4094
	add	x2, x29, 64
	ldr	w0, [x20, 2820]
	mov	w5, -1
	mov	w3, 4
	mov	w1, 100
	str	w5, [x2, -8]!
	blr	x4
.L4094:
	mov	x0, x19
	bl	ClearCurrSlice
	mov	w0, -1
	b	.L4045
.L4059:
	ldr	x1, .LC921
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w1, [x19, 14940]
	ldr	w2, [x20, 2744]
	cmp	w2, w1
	bcc	.L4061
	ldr	x0, .LC919
	ldr	x4, [x0]
	cbz	x4, .L4061
	ldr	w0, [x20, 2820]
	mov	w3, 8
	stp	w2, w1, [x29, 56]
	add	x2, x29, 56
	mov	w1, 108
	blr	x4
.L4061:
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
	b	.L4045
.L4101:
	ldr	x1, .LC929
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4045
.L4102:
	ldr	x1, .LC931
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4094
.L4100:
	ldr	x1, .LC927
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, -1
	b	.L4045
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
	cbz	w0, .L4109
	ldr	w2, [x19, 2804]
	mov	w0, 0
	.p2align 2
.L4108:
	ubfiz	x1, x0, 5, 32
	add	w0, w0, 1
	add	x1, x3, x1
	ldr	w1, [x1, 16]
	add	w2, w2, w1
	str	w2, [x19, 2804]
	ldr	w1, [x3, 76]
	cmp	w1, w0
	bhi	.L4108
.L4109:
	strb	wzr, [x3]
	ldr	x0, .LC932
	ldrsw	x1, [x19, 2820]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w1, [x0, 44]
	cmp	w1, 1
	beq	.L4270
.L4107:
	add	x23, x20, 12288
	mov	w1, 32
	add	x0, x23, 2600
	bl	BsGet
	mov	w22, w0
	ldr	x1, [x20, 632]
	ldr	w0, [x1, 72]
	add	w0, w0, 32
	str	w0, [x1, 72]
.L4110:
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
	beq	.L4271
	add	w0, w0, 1
	str	w0, [x19, 2764]
	ldr	x0, [x20, 632]
	ldrb	w2, [x0, 2]
	cmp	w2, 20
	beq	.L4272
.L4112:
	sub	w0, w2, #1
	cmp	w0, 29
	bls	.L4273
.L4118:
	ldr	x1, .LC975
	mov	w3, w22
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x21, .LC948
	cmp	w22, 256
	beq	.L4148
	ldr	x4, [x21]
	cbz	x4, .L4149
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 102
	blr	x4
.L4148:
	ldr	x1, [x20, 632]
	cbz	x1, .L4150
.L4151:
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4150:
	ldr	x4, [x21]
	cbz	x4, .L4258
.L4257:
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L4258:
	mov	w0, 0
.L4274:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4273:
	ldr	x1, .LC943
	ldrh	w0, [x1,w0,uxtw #1]
	adr	x1, .Lrtx4120
	add	x0, x1, w0, sxth #2
	br	x0
.Lrtx4120:
	.section	.rodata
	.align	0
	.align	2
.L4120:
	.2byte	(.L4119 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4119 - .Lrtx4120) / 4
	.2byte	(.L4121 - .Lrtx4120) / 4
	.2byte	(.L4122 - .Lrtx4120) / 4
	.2byte	(.L4123 - .Lrtx4120) / 4
	.2byte	(.L4124 - .Lrtx4120) / 4
	.2byte	(.L4125 - .Lrtx4120) / 4
	.2byte	(.L4126 - .Lrtx4120) / 4
	.2byte	(.L4127 - .Lrtx4120) / 4
	.2byte	(.L4128 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4122 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4129 - .Lrtx4120) / 4
	.2byte	(.L4119 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4118 - .Lrtx4120) / 4
	.2byte	(.L4130 - .Lrtx4120) / 4
	.text
	.p2align 3
.L4270:
	ldr	x2, [x0, 176]
	mov	x1, 4294967296
	cmp	x2, x1
	bne	.L4107
	ldr	w0, [x0, 172]
	cmp	w0, 1
	ccmp	w21, wzr, 0, eq
	bne	.L4107
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
	b	.L4110
.L4130:
	ldr	x1, .LC973
	mov	w2, 30
	mov	w0, 22
	bl	dprint_vfmw
	cbnz	w21, .L4146
	ldr	x1, [x20, 632]
	cbz	x1, .L4146
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4146:
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
	bne	.L4258
	ldr	x21, .LC948
	ldr	x4, [x21]
	cbz	x4, .L4147
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L4147:
	mov	x0, x20
	str	wzr, [x20, 624]
	bl	DecVDM
	cbz	w0, .L4258
.L4265:
	ldr	x4, [x21]
	cbz	x4, .L4254
.L4255:
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L4254:
	mov	w0, -1
.L4278:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L4129:
	ldr	x1, .LC971
	mov	w2, 19
	mov	w0, 22
	bl	dprint_vfmw
.L4263:
	ldr	x1, [x20, 632]
	cbz	x1, .L4258
.L4256:
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	mov	w0, 0
.L4252:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L4128:
	ldr	x1, .LC969
	mov	w2, 13
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4256
	mov	w0, 0
	b	.L4274
.L4126:
	ldr	x1, .LC967
	mov	w2, 11
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_IsEosNal
	uxtb	w1, w0
	cmp	w1, 1
	bne	.L4263
	ldr	x21, .LC948
	strb	w0, [x23, 2640]
	ldr	x4, [x21]
	cbz	x4, .L4144
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 117
	blr	x4
.L4144:
	mov	x0, x20
	str	wzr, [x20, 624]
	bl	DecVDM
	cbz	w0, .L4263
	ldr	x1, [x20, 632]
	cbz	x1, .L4265
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	b	.L4265
.L4125:
	ldr	x1, .LC963
	mov	w2, 10
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4256
	mov	w0, 0
	b	.L4274
.L4127:
	ldr	x1, .LC965
	mov	w2, 12
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4256
	mov	w0, 0
	b	.L4274
.L4124:
	ldr	x1, .LC961
	mov	w2, 9
	mov	w0, 22
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbnz	x1, .L4256
	mov	w0, 0
	b	.L4274
.L4123:
	ldr	x1, .LC950
	mov	w2, 8
	ldr	w3, [x19, 2772]
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_DecPPS
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L4137
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4137:
	cbnz	w21, .L4275
	ldr	w1, [x19, 2772]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 2772]
	b	.L4252
.L4122:
	ldr	x1, .LC953
	mov	w0, 22
	ldr	w3, [x19, 2768]
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_DecSPS
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L4139
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4139:
	cbnz	w21, .L4276
	ldr	w1, [x19, 2768]
	mov	w0, 0
	add	w1, w1, 1
	str	w1, [x19, 2768]
	b	.L4252
.L4121:
	ldr	x1, .LC957
	mov	w2, 6
	mov	w0, 22
	bl	dprint_vfmw
	mov	x0, x20
	bl	H264_DecSEI
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	x1, .L4141
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4141:
	cbz	w21, .L4258
	ldr	x1, .LC959
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x0, .LC948
	ldr	x4, [x0]
	cbnz	x4, .L4257
	mov	w0, 0
	b	.L4274
.L4119:
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
	cbnz	w0, .L4277
	mov	x0, x20
	bl	H264_DecSlice
	cmn	w0, #2
	beq	.L4252
	cbz	w0, .L4133
	ldr	x0, .LC948
	ldr	x4, [x0]
	cbnz	x4, .L4255
	mov	w0, -1
	b	.L4278
	.p2align 3
.L4271:
	ldr	x1, .LC936
	mov	w0, 22
	bl	dprint_vfmw
	ldr	w0, [x19, 2764]
	add	w0, w0, 1
	str	w0, [x19, 2764]
	ldr	x0, [x20, 632]
	ldrb	w2, [x0, 2]
	cmp	w2, 20
	bne	.L4112
	.p2align 2
.L4272:
	mov	w1, 24
	add	x0, x23, 2600
	bl	BsGet
	mov	w22, w0
	ldr	x0, [x20, 632]
	ubfx	x1, x22, 23, 1
	strb	w1, [x0, 3]
	ldr	x1, [x20, 632]
	ldrb	w0, [x1, 3]
	cbz	w0, .L4113
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
.L4113:
	mov	x0, 16711680
	ldr	x2, [x19, 160]
	movk	x0, 0xff, lsl 32
	and	x0, x2, x0
	cmp	x0, 65536
	beq	.L4114
	ldr	x1, .LC938
	mov	w0, 1
	ldrb	w3, [x19, 162]
	ldrb	w2, [x19, 164]
	bl	dprint_vfmw
	ldr	x1, [x20, 632]
	cbz	x1, .L4254
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	mov	w0, -1
	b	.L4252
.L4114:
	ldrb	w0, [x19, 160]
	cmp	w0, 1
	beq	.L4279
.L4117:
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
	b	.L4112
.L4277:
	ldr	x1, .LC947
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x20
	bl	ClearCurrSlice
	ldr	x0, .LC948
	ldr	x4, [x0]
	cbnz	x4, .L4255
	mov	w0, -1
	b	.L4278
.L4276:
	ldr	x1, .LC955
.L4268:
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x21, .LC948
	ldr	x4, [x21]
	cbz	x4, .L4254
	add	x2, x29, 80
	ldr	w0, [x19, 2820]
	mov	w20, -1
	mov	w3, 4
	mov	w1, 100
	str	w20, [x2, -8]!
	blr	x4
	ldr	x4, [x21]
	cbz	x4, .L4254
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
	mov	w0, w20
	b	.L4252
.L4275:
	ldr	x1, .LC951
	b	.L4268
.L4279:
	mov	w0, 5
	strb	w0, [x1, 2]
	b	.L4117
.L4149:
	ldr	x1, [x20, 632]
	cbnz	x1, .L4151
	mov	w0, 0
	b	.L4274
.L4133:
	ldrb	w0, [x21, 1592]
	cmp	w0, 1
	bne	.L4258
	ldr	x21, .LC948
	ldr	x4, [x21]
	cbz	x4, .L4135
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 112
	blr	x4
.L4135:
	mov	x0, x20
	str	wzr, [x20, 624]
	bl	DecVDM
	cbnz	w0, .L4265
	mov	w1, 1
	mov	w0, 0
	strb	w1, [x23, 2641]
	b	.L4252
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
	.xword	.L4120
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
	stp	x29, x30, [sp, -112]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	str	wzr, [x29, 100]
	stp	wzr, wzr, [x29, 92]
	cbz	x21, .L4350
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
	beq	.L4283
	ldr	w1, [x0, 872]
	cmp	w1, 1
	beq	.L4351
.L4284:
	mov	x1, x21
	mov	x0, x20
	bl	ReceivePacket
	ldr	x1, [x20, 632]
	str	x1, [x19, 2888]
.L4286:
	str	wzr, [x19, 1344]
	cbz	w0, .L4285
.L4310:
	mov	w21, 0
.L4348:
	mov	w0, w21
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4351:
	ldr	w0, [x0, 912]
	cmp	w0, 1
	bne	.L4284
	ldr	w0, [x19, 2880]
	cmp	w0, 1
	bne	.L4284
	ldr	x0, [x19, 2888]
	str	x0, [x20, 632]
	str	wzr, [x19, 1344]
	str	wzr, [x19, 2880]
	.p2align 2
.L4285:
	mov	x0, x20
	bl	H264DEC_CheckSedOnly
	mov	w21, w0
	ldr	x1, [x20, 632]
	cbz	w0, .L4287
	cbz	x1, .L4313
	ldr	w0, [x19, 2820]
	mov	w21, -1
	bl	ReleaseNAL
	str	xzr, [x20, 632]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 112
	ret
	.p2align 3
.L4283:
	ldr	x0, [x20, 632]
	cmp	x0, xzr
	csetm	w0, eq
	b	.L4286
	.p2align 3
.L4313:
	mov	w21, -1
	b	.L4348
	.p2align 3
.L4287:
	str	wzr, [x1, 72]
	add	x23, x20, 12288
	add	x22, x23, 2600
	ldr	x1, [x20, 632]
	mov	x0, x22
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	ldr	x0, .LC978
	ldrsw	x1, [x19, 2820]
	ldr	x0, [x0, x1, lsl 3]
	ldrsb	w24, [x0, 44]
	cmp	w24, 1
	beq	.L4288
.L4290:
	mov	w24, 0
.L4289:
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	uxtb	w0, w0
	ldr	x1, [x20, 632]
	and	w2, w0, 31
	ubfx	x3, x0, 5, 2
	strb	w2, [x1, 2]
	ldr	x1, [x20, 632]
	str	w3, [x1, 84]
	mov	w1, 27
	and	w0, w0, w1
	cmp	w0, 1
	ccmp	w2, 20, 4, ne
	beq	.L4352
.L4291:
	mov	x0, x20
	bl	FindTrailZeros
	cbnz	w0, .L4353
	ldr	x1, [x20, 632]
	mov	x0, x22
	str	wzr, [x1, 72]
	ldr	x1, [x20, 632]
	ldr	w2, [x1, 16]
	ldr	x1, [x1, 8]
	bl	BsInit
	mov	w1, w24
	mov	x0, x20
	bl	H264_DecOneNal
	cmn	w0, #2
	beq	.L4317
	cbnz	w0, .L4354
	add	x0, x20, 61440
	str	wzr, [x0, 3436]
	ldr	w0, [x19, 2824]
	cmp	w0, 1
	bne	.L4310
	mov	x0, x20
	bl	H264DEC_SetDecParam
	b	.L4348
	.p2align 3
.L4352:
	cmp	w2, 20
	beq	.L4355
.L4292:
	add	x2, x29, 108
	add	x1, x29, 104
	mov	x0, x20
	bl	InquireSliceProperty
	cbnz	w0, .L4293
	ldr	w1, [x29, 104]
	ldr	w0, [x19, 2860]
	cmp	w1, 1
	csinc	w0, w0, w0, ne
	str	w0, [x19, 2860]
	beq	.L4356
	ldrb	w0, [x23, 2641]
	cmp	w0, 1
	beq	.L4311
.L4297:
	ldr	w0, [x29, 108]
	cmp	w0, 1
	bne	.L4291
	mov	x0, x20
	bl	FlushDPB
	cbnz	w0, .L4357
.L4303:
	ldr	w0, [x19, 2820]
	bl	FSP_GetFspType
	cbnz	w0, .L4291
	ldr	w0, [x19, 2820]
	add	x3, x29, 100
	add	x2, x29, 96
	add	x1, x29, 92
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x20]
	ldr	w0, [x0, 748]
	cmp	w0, 1
	bne	.L4291
	ldr	w1, [x29, 100]
	cmp	w1, wzr
	ble	.L4358
.L4304:
	mov	w0, 1
	mov	w21, -2
	str	w0, [x19, 1344]
	str	wzr, [x19, 2896]
	b	.L4348
	.p2align 3
.L4293:
	ldr	x1, [x20, 632]
	cbz	x1, .L4307
	ldr	w0, [x19, 2820]
	bl	ReleaseNAL
	str	xzr, [x20, 632]
.L4307:
	ldr	x0, .LC983
	ldr	x4, [x0]
	cbz	x4, .L4313
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	mov	w21, -1
	blr	x4
	b	.L4348
	.p2align 3
.L4288:
	ldp	w1, w2, [x0, 172]
	ldr	w3, [x0, 180]
	mov	x0, x20
	bl	H264_VES_Splitter
	cmp	w0, 3
	beq	.L4289
	cbz	w0, .L4290
.L4317:
	mov	w21, w0
	b	.L4348
.L4311:
	strb	wzr, [x23, 2641]
	b	.L4297
.L4356:
	add	x25, x20, 20480
	ldrb	w0, [x25, 1585]
	cmp	w0, 1
	ldr	w0, [x19, 2864]
	beq	.L4359
	add	w0, w0, 2
	str	w0, [x19, 2864]
.L4296:
	ldrb	w0, [x23, 2641]
	cmp	w0, 1
	beq	.L4311
	ldr	w0, [x19, 2744]
	cbz	w0, .L4297
	ldr	x3, [x20, 632]
	mov	w2, 12
	ldr	x1, .LC979
	mov	x0, x22
	add	x1, x1, 432
	str	wzr, [x3, 72]
	bl	BsInit
	mov	w1, 1
	mov	x0, x20
	bl	H264_DecOneNal
	ldrb	w0, [x25, 1585]
	cmp	w0, 1
	ldr	w0, [x19, 2864]
	beq	.L4360
	sub	w0, w0, #2
	str	w0, [x19, 2864]
.L4300:
	mov	w0, 1
	mov	w21, -2
	str	w0, [x19, 1344]
	b	.L4348
.L4355:
	mov	x0, x20
	bl	InquireSliceExtProperty
	b	.L4292
.L4350:
	ldr	x2, .LC976
	mov	w3, 13779
	ldr	x1, .LC977
	mov	w0, 0
	mov	w21, -1
	bl	dprint_vfmw
	b	.L4348
.L4353:
	ldr	x1, .LC985
	mov	w0, 22
	mov	w21, -1
	bl	dprint_vfmw
	b	.L4348
.L4359:
	add	w0, w0, 1
	str	w0, [x19, 2864]
	b	.L4296
.L4357:
	ldr	x1, .LC980
	mov	w3, w0
	mov	w2, 13915
	mov	w0, 0
	bl	dprint_vfmw
	b	.L4303
.L4354:
	ldr	x1, .LC987
	mov	w0, 22
	mov	w21, -1
	bl	dprint_vfmw
	b	.L4348
.L4360:
	sub	w0, w0, #1
	str	w0, [x19, 2864]
	b	.L4300
.L4358:
	ldr	w1, [x29, 96]
	cmp	w1, 32
	bgt	.L4304
	ldr	x1, [x20, 616]
	cbnz	x1, .L4304
	ldr	w3, [x19, 2784]
	cbz	w3, .L4291
	ldr	w6, [x20, 14932]
	cbz	w6, .L4291
	ldr	w5, [x19, 2900]
	ldr	w7, [x20, 14936]
	cmp	w7, w5
	beq	.L4291
	ldr	w4, [x19, 2904]
	cmp	w6, w4
	beq	.L4291
	ldr	x1, .LC982
	ldr	w2, [x29, 108]
	bl	dprint_vfmw
	str	wzr, [x19, 2896]
	ldr	x0, .LC983
	ldr	w1, [x20, 14936]
	str	w1, [x19, 2900]
	ldr	x4, [x0]
	ldr	w0, [x20, 14932]
	str	w0, [x19, 2904]
	cbz	x4, .L4291
	ldr	w0, [x19, 2820]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	b	.L4291
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
	stp	x25, x26, [sp, 64]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 65536
	mov	w26, w1
	mov	x24, x3
	mov	w25, w4
	mov	w23, w5
	bl	_mcount
	ldr	w0, [x20, 2848]
	cmp	w0, 1
	bls	.L4362
.L4365:
	ldr	x0, [x19]
	add	x22, x19, 61440
	ldr	w1, [x0, 8]
	cmp	w1, 2
	beq	.L4363
	ldr	w2, [x22, 3408]
	lsl	w2, w2, 4
	cmp	w2, 1920
	bhi	.L4366
.L4363:
	ldr	w0, [x0, 664]
	str	w0, [x20, 2824]
	ldr	w21, [x19, 624]
	str	w26, [x22, 3404]
	cbnz	w21, .L4368
.L4389:
	cbz	w25, .L4369
	ldr	x5, .LC988
	sbfiz	x23, x23, 6, 32
	add	x23, x5, x23
	ldr	w0, [x23, 44]
	cmp	w0, 3
	beq	.L4386
	cmp	w0, 1
	beq	.L4387
.L4372:
	ldrb	w0, [x20, 1401]
	cbz	w0, .L4388
.L4373:
	mov	x1, x24
	mov	x0, x19
	bl	StorePicInDPB
	cmp	w0, 1
	mov	w23, w0
	bls	.L4374
.L4392:
	ldr	x1, [x22, 3352]
	mov	w2, 1
	ldr	w0, [x20, 2820]
	mov	w20, -1
	mov	w21, w20
	ldr	w1, [x1, 672]
	bl	FSP_ClearLogicFs
	ldr	x1, .LC992
	mov	w2, w23
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
	stp	w20, wzr, [x5, 188]
	stp	wzr, w2, [x5, 196]
	str	w0, [x1, 3256]
	mov	x0, x19
	bl	ClearDPB
	str	xzr, [x22, 3352]
.L4371:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4366:
	str	wzr, [x20, 2824]
	ldr	w21, [x19, 624]
	str	w26, [x22, 3404]
	cbz	w21, .L4389
.L4368:
	mov	x0, x19
	bl	ClearAllSlice
	mov	x1, x24
	mov	x0, x19
	bl	StorePicInDPB
	cbnz	w0, .L4390
.L4375:
	mov	x0, x19
	bl	FlushDPB
	cbnz	w0, .L4391
.L4376:
	add	x0, x19, 20480
	str	wzr, [x20, 1340]
	mov	w4, 32
	mov	w7, 23352
	ldr	w8, [x19, 14948]
	movk	w7, 0x1, lsl 16
	strb	w4, [x0, 3234]
	add	x4, x0, 3072
	strb	wzr, [x0, 3232]
	mov	w6, 2
	str	w8, [x0, 3240]
	mov	w5, 7
	strb	w6, [x0, 3233]
	mov	w3, 3
	str	w5, [x0, 3244]
	mov	w2, -1
	str	w7, [x0, 3248]
	mov	w1, 262144
	stp	w3, w2, [x4, 184]
	stp	wzr, wzr, [x4, 192]
	str	w1, [x0, 3272]
	mov	w21, 0
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4362:
	add	w0, w0, 1
	str	w0, [x20, 2848]
	cmp	w0, 1
	bhi	.L4365
	add	x22, x19, 61440
	ldr	x0, [x19]
	b	.L4363
	.p2align 3
.L4369:
	mov	x0, x19
	bl	ClearAllSlice
	mov	x1, x24
	mov	x0, x19
	bl	StorePicInDPB
	cmp	w0, 1
	mov	w23, w0
	bhi	.L4392
.L4374:
	mov	w0, 1
	str	w0, [x20, 1340]
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4388:
	ldr	x2, [x22, 3352]
	mov	w0, 1
	ldr	x1, .LC990
	str	wzr, [x2, 252]
	ldr	x2, [x22, 3352]
	str	xzr, [x2, 584]
	bl	dprint_vfmw
	b	.L4373
	.p2align 3
.L4391:
	ldr	x1, .LC996
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4376
	.p2align 3
.L4390:
	ldr	x1, .LC994
	mov	w2, w0
	mov	w0, 1
	bl	dprint_vfmw
	b	.L4375
	.p2align 3
.L4387:
	mov	x0, x19
	bl	ClearAllSlice
	b	.L4372
	.p2align 3
.L4386:
	mov	x0, x19
	bl	ClearAllSlice
	b	.L4371
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
	.align	3
.LC996:
	.xword	.LC995
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	H264DEC_VDMProcSedOnly
	.type	H264DEC_VDMProcSedOnly, %function
H264DEC_VDMProcSedOnly:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	w20, w1
	add	x22, x21, 65536
	bl	_mcount
	sxtw	x3, w20
	ldr	x1, [x21, 616]
	lsl	x0, x3, 2
	ldr	x20, .LC998
	sub	x3, x0, x3
	ldr	x4, .LC997
	lsl	x0, x3, 4
	ldr	w2, [x1, 28]
	sub	x3, x0, x3
	ldr	w19, [x1, 20]
	ldrsw	x5, [x22, 2820]
	mov	w0, 22
	add	x20, x20, x3, lsl 2
	ldr	x1, .LC1000
	mul	w19, w2, w19
	ldr	x23, [x4, x5, lsl 3]
	sub	w19, w19, #1
	ldr	w3, [x20, 20]
	mov	w2, w19
	bl	dprint_vfmw
	ldr	w0, [x20, 20]
	cmp	w19, w0
	ldr	w0, [x22, 2832]
	beq	.L4407
	cmp	w0, 1
	beq	.L4408
.L4406:
	str	xzr, [x21, 616]
.L4396:
	mov	w0, 0
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L4408:
	ldr	w0, [x22, 2744]
	str	wzr, [x22, 2836]
	sub	w0, w0, #1
	str	w0, [x22, 2744]
	ldr	x1, [x21, 632]
	cbz	x1, .L4406
	ldr	w0, [x22, 2820]
	bl	ReleaseNAL
	str	xzr, [x21, 632]
	b	.L4406
	.p2align 3
.L4407:
	cmp	w0, 1
	beq	.L4395
	mov	x0, x21
	bl	DecVDM
	cbz	w0, .L4396
	b	.L4406
	.p2align 3
.L4395:
	ldr	w1, [x22, 2744]
	str	w0, [x22, 2836]
	sub	w1, w1, #1
	str	w1, [x22, 2744]
	strb	w0, [x23, 753]
	str	w0, [x22, 1344]
	b	.L4406
	.size	H264DEC_VDMProcSedOnly, .-H264DEC_VDMProcSedOnly
	.align	3
.LC997:
	.xword	s_pstVfmwChan
	.align	3
.LC998:
	.xword	g_BackUp
	.align	3
.LC1000:
	.xword	.LC999
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
	cbz	w0, .L4426
	sub	w0, w0, #1
	mov	w4, 872
	mov	x2, 30104
	add	x1, x21, 28672
	add	x1, x1, 560
	umaddl	x4, w0, w4, x2
	add	x4, x21, x4
	.p2align 2
.L4417:
	ldrb	w0, [x1, 1]
	cbnz	w0, .L4412
	cbz	x1, .L4413
	add	x23, x21, 24576
	ldr	w3, [x23, 3716]
	cbz	w3, .L4413
	ldr	x0, [x21, 27904]
	cmp	x0, x1
	beq	.L4412
	sub	w3, w3, #1
	mov	x0, x21
	add	x3, x21, x3, lsl 3
	b	.L4414
	.p2align 3
.L4415:
	ldr	x2, [x0, 27904]
	cmp	x2, x1
	beq	.L4412
.L4414:
	cmp	x3, x0
	add	x0, x0, 8
	bne	.L4415
.L4413:
	ldr	w0, [x19, 2820]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	beq	.L4426
	cmn	w0, #1
	beq	.L4447
.L4445:
	mov	w0, 0
.L4449:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4412:
	add	x1, x1, 872
	cmp	x1, x4
	bne	.L4417
	add	x2, x29, 76
	add	x1, x29, 72
	add	x0, x21, 8
	bl	GetQueueImgNum
	ldr	x1, .LC1002
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, .LC1004
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 1332]
	cbz	w0, .L4448
	ldr	x20, .LC1008
	mov	w22, 0
	add	x23, x21, 24576
	.p2align 2
.L4424:
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
	beq	.L4429
	ldr	w5, [x23, 3716]
	cbz	w5, .L4429
	ldr	x0, [x21, 27904]
	cmp	x1, x0
	beq	.L4431
	sub	w5, w5, #1
	mov	x0, x21
	add	x5, x21, x5, lsl 3
	b	.L4422
	.p2align 3
.L4423:
	ldr	x2, [x0, 27904]
	cmp	x1, x2
	beq	.L4431
.L4422:
	cmp	x5, x0
	add	x0, x0, 8
	bne	.L4423
.L4429:
	mov	w5, 1
.L4421:
	mov	w2, w22
	mov	x1, x20
	mov	w0, 0
	add	w22, w22, 1
	bl	dprint_vfmw
	ldr	w0, [x19, 1332]
	cmp	w0, w22
	bhi	.L4424
.L4425:
	ldp	w2, w3, [x29, 72]
	ldr	x1, .LC1006
	mov	w0, 0
	bl	dprint_vfmw
	ldr	w0, [x19, 1332]
	ldr	w2, [x23, 3716]
	ldp	w3, w1, [x29, 72]
	sub	w0, w0, #2
	sub	w0, w0, w2
	add	w1, w3, w1
	cmp	w1, w0
	bge	.L4445
	ldr	x1, .LC1010
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
.L4426:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	mov	w0, 1
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L4431:
	mov	w5, 0
	b	.L4421
.L4447:
	ldr	w0, [x19, 2820]
	add	x1, x21, 8
	bl	FSP_ClearNotInVoQueue
	mov	w0, 0
	b	.L4449
.L4448:
	add	x23, x21, 24576
	b	.L4425
	.size	H264DEC_GetImageBuffer, .-H264DEC_GetImageBuffer
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
	.type	SarTable.13086, %object
	.size	SarTable.13086, 136
SarTable.13086:
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
	.type	__func__.13267, %object
	.size	__func__.13267, 12
__func__.13267:
	.string	"H264_DecSEI"
	.zero	4
	.type	__func__.12119, %object
	.size	__func__.12119, 13
__func__.12119:
	.string	"DirectOutput"
	.zero	3
	.type	__func__.12584, %object
	.size	__func__.12584, 8
__func__.12584:
	.string	"InitDPB"
	.type	__func__.13537, %object
	.size	__func__.13537, 18
__func__.13537:
	.string	"H264_VES_Splitter"
	.zero	6
	.type	__func__.12237, %object
	.size	__func__.12237, 14
__func__.12237:
	.string	"StorePicInDPB"
	.zero	2
	.type	__FUNCTION__.13506, %object
	.size	__FUNCTION__.13506, 13
__FUNCTION__.13506:
	.string	"H264DEC_Init"
	.zero	3
	.type	__FUNCTION__.12721, %object
	.size	__FUNCTION__.12721, 8
__FUNCTION__.12721:
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
	ASCII(.string	"if h264 no chroma and no lowdelay line num!\n" )
	.zero	3
.LC991:
	ASCII(.string	"store pic err, ret = %d\n" )
	.zero	7
.LC993:
	ASCII(.string	"imode nal store pic err, ret = %d\n" )
	.zero	5
.LC995:
	ASCII(.string	"imode nal flush dpb err, ret = %d\n" )
	.zero	5
.LC999:
	ASCII(.string	"CtbNumOneFrame=%d, SedEnd0=%d\n" )
	.zero	1
.LC1001:
	ASCII(.string	"cann't find FrameStore\n" )
.LC1003:
	ASCII(.string	"========== H264 FrameStore state(is_used, is_in_dpb, IsOutDPB) ========\n" )
	.zero	7
.LC1005:
	ASCII(.string	"ReadImgNum = %d, NewImgNum = %d\n" )
	.zero	7
.LC1007:
	ASCII(.string	"%02d: %d %d %d\n" )
.LC1009:
	ASCII(.string	"FrameStore leak, ClearAll\n" )
	.bss
	.align	3
.LANCHOR2 = . + 0
.LANCHOR3 = . + 4352
	.type	pps_tmp.13006, %object
	.size	pps_tmp.13006, 2208
pps_tmp.13006:
	.zero	2208
	.type	sps_tmp.13155, %object
	.size	sps_tmp.13155, 4000
sps_tmp.13155:
	.zero	4000
	.type	TmpBuf, %object
	.size	TmpBuf, 68
TmpBuf:
	.zero	68
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
