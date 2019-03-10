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
	.file	"h264.c"
	.text
	.align	2
	.global	IsSTRefFlg
	.type	IsSTRefFlg, %function
IsSTRefFlg:
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
	ldr	r0, [r0]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #65536
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	IsSTRefFlg, .-IsSTRefFlg
	.align	2
	.global	IsLTRefFlg
	.type	IsLTRefFlg, %function
IsLTRefFlg:
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
	ldr	r0, [r0]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #256
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	IsLTRefFlg, .-IsLTRefFlg
	.align	2
	.global	compare_pic_by_pic_num_desc
	.type	compare_pic_by_pic_num_desc, %function
compare_pic_by_pic_num_desc:
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	ldr	r2, [r2, #8]
	ldr	r3, [r3, #8]
	cmp	r2, r3
	blt	.L5
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L5:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_pic_by_pic_num_desc, .-compare_pic_by_pic_num_desc
	.align	2
	.global	compare_pic_by_lt_pic_num_asc
	.type	compare_pic_by_lt_pic_num_asc, %function
compare_pic_by_lt_pic_num_asc:
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	ldr	r2, [r2, #4]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	blt	.L9
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L9:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_pic_by_lt_pic_num_asc, .-compare_pic_by_lt_pic_num_asc
	.align	2
	.global	compare_fs_by_frame_num_desc
	.type	compare_fs_by_frame_num_desc, %function
compare_fs_by_frame_num_desc:
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	ldr	r2, [r2, #680]
	ldr	r3, [r3, #680]
	cmp	r2, r3
	blt	.L12
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L12:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_fs_by_frame_num_desc, .-compare_fs_by_frame_num_desc
	.align	2
	.global	compare_fs_by_lt_pic_idx_asc
	.type	compare_fs_by_lt_pic_idx_asc, %function
compare_fs_by_lt_pic_idx_asc:
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	ldr	r2, [r2, #684]
	ldr	r3, [r3, #684]
	cmp	r2, r3
	bcc	.L15
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L15:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_fs_by_lt_pic_idx_asc, .-compare_fs_by_lt_pic_idx_asc
	.align	2
	.global	compare_pic_by_poc_asc
	.type	compare_pic_by_poc_asc, %function
compare_pic_by_poc_asc:
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	ldr	r2, [r2, #12]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	blt	.L18
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L18:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_pic_by_poc_asc, .-compare_pic_by_poc_asc
	.align	2
	.global	compare_pic_by_poc_desc
	.type	compare_pic_by_poc_desc, %function
compare_pic_by_poc_desc:
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	ldr	r2, [r2, #12]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	blt	.L21
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L21:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_pic_by_poc_desc, .-compare_pic_by_poc_desc
	.align	2
	.global	compare_fs_by_poc_asc
	.type	compare_fs_by_poc_asc, %function
compare_fs_by_poc_asc:
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	ldr	r2, [r2, #688]
	ldr	r3, [r3, #688]
	cmp	r2, r3
	blt	.L24
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L24:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_fs_by_poc_asc, .-compare_fs_by_poc_asc
	.align	2
	.global	compare_fs_by_poc_desc
	.type	compare_fs_by_poc_desc, %function
compare_fs_by_poc_desc:
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	ldr	r2, [r2, #688]
	ldr	r3, [r3, #688]
	cmp	r2, r3
	blt	.L27
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L27:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	compare_fs_by_poc_desc, .-compare_fs_by_poc_desc
	.align	2
	.type	SetFrmRepeatCount.part.1, %function
SetFrmRepeatCount.part.1:
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
	add	ip, r0, #61440
	add	r0, r0, #24576
	ldr	lr, [ip, #3540]
	ldr	r2, [r0, #2144]
	ldr	r3, [ip, #3536]
	add	r2, r2, lr, lsr #1
	add	r0, r2, #1
	mov	r3, r3, lsr #1
	cmp	r3, r0
	movcc	r3, #0
	strcc	r3, [r1, #24]
	ldmccfd	sp, {fp, sp, pc}
	sub	r3, r3, #1
	rsb	r3, r2, r3
	cmp	r3, #1
	movhi	r3, #2
	movls	r3, #1
	strhi	r3, [r1, #24]
	strls	r3, [r1, #24]
	ldrhi	r3, [ip, #3540]
	ldrls	r3, [ip, #3540]
	addhi	r3, r3, #4
	addls	r3, r3, #2
	str	r3, [ip, #3540]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SetFrmRepeatCount.part.1, .-SetFrmRepeatCount.part.1
	.align	2
	.type	DumpList.part.5, %function
DumpList.part.5:
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
	add	r8, r0, #26880
	add	r8, r8, #248
	add	r10, r0, #20480
	add	r10, r10, #248
	mov	r7, r0
	mov	r6, #0
	mov	r9, r8
.L33:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	movne	r5, r9
	movne	r4, #0
	beq	.L36
.L34:
	ldr	ip, [r5, #4]!
	mov	r3, r4
	mov	r2, r6
	ldr	r1, .L64
	mov	r0, #13
	add	r4, r4, #1
	ldr	ip, [ip, #36]
	ldr	lr, [ip, #688]
	str	lr, [sp, #4]
	ldr	ip, [ip, #676]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r10]
	cmp	r4, r3
	bcc	.L34
.L36:
	add	r6, r6, #1
	add	r9, r9, #132
	cmp	r6, #2
	bne	.L33
	add	r5, r7, #20480
	ldr	r3, [r5, #252]
	cmp	r3, #0
	bne	.L60
.L37:
	ldr	r3, [r5, #256]
	cmp	r3, #0
	bne	.L61
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L61:
	ldr	r1, .L64+4
	mov	r0, #13
	bl	dprint_vfmw
	ldr	r3, [r5, #256]
	cmp	r3, #0
	addne	r7, r7, #27136
	movne	r4, #0
	addne	r7, r7, #124
	bne	.L50
	b	.L51
.L62:
	bcc	.L48
	cmp	r2, #2
	ldr	r1, .L64+8
	mov	r0, #13
	bne	.L46
	ldr	r3, [r3, #36]
	ldr	r2, [r3, #688]
	bl	dprint_vfmw
.L46:
	ldr	r3, [r5, #256]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L51
.L50:
	ldr	r3, [r7, #4]!
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L62
	ldr	r3, [r3, #36]
	mov	r0, #13
	ldr	r1, .L64+12
	add	r4, r4, #1
	ldr	r2, [r3, #688]
	bl	dprint_vfmw
	ldr	r3, [r5, #256]
	cmp	r4, r3
	bcc	.L50
.L51:
	ldr	r1, .L64+16
	mov	r0, #13
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L48:
	ldr	r3, [r3, #36]
	mov	r0, #13
	ldr	r1, .L64+20
	ldr	r2, [r3, #688]
	bl	dprint_vfmw
	b	.L46
.L60:
	ldr	r1, .L64+24
	mov	r0, #13
	bl	dprint_vfmw
	ldr	r3, [r5, #252]
	cmp	r3, #0
	movne	r4, #0
	bne	.L38
	b	.L43
.L63:
	bcc	.L41
	cmp	r2, #2
	ldr	r1, .L64+8
	mov	r0, #13
	bne	.L39
	ldr	r3, [r3, #36]
	ldr	r2, [r3, #688]
	bl	dprint_vfmw
.L39:
	ldr	r3, [r5, #252]
	add	r4, r4, #1
	cmp	r4, r3
	bcs	.L43
.L38:
	ldr	r3, [r8, #4]!
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L63
	ldr	r3, [r3, #36]
	mov	r0, #13
	ldr	r1, .L64+12
	add	r4, r4, #1
	ldr	r2, [r3, #688]
	bl	dprint_vfmw
	ldr	r3, [r5, #252]
	cmp	r4, r3
	bcc	.L38
.L43:
	ldr	r1, .L64+16
	mov	r0, #13
	bl	dprint_vfmw
	b	.L37
.L41:
	ldr	r3, [r3, #36]
	mov	r0, #13
	ldr	r1, .L64+20
	ldr	r2, [r3, #688]
	bl	dprint_vfmw
	b	.L39
.L65:
	.align	2
.L64:
	.word	.LC0
	.word	.LC6
	.word	.LC5
	.word	.LC4
	.word	.LC2
	.word	.LC3
	.word	.LC1
	UNWIND(.fnend)
	.size	DumpList.part.5, .-DumpList.part.5
	.align	2
	.type	CombinePacket.part.11, %function
CombinePacket.part.11:
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
	ldr	r1, .L67
	mov	r4, r0
	mov	r0, #7
	bl	dprint_vfmw
	ldr	ip, [r4, #368]
	ldr	r1, .L67+4
	mov	r0, #7
	mov	r5, #0
	ldr	lr, [ip, #40]
	ldr	r3, [ip, #44]
	ldr	r2, [ip, #16]
	str	lr, [sp, #4]
	ldr	ip, [ip, #12]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #368]
	ldr	ip, .L67+8
	ldr	r2, [r3, #12]
	ldr	r0, [r3, #36]
	ldr	r1, [r3, #8]
	rsb	r0, r2, r0
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #368]
	mov	ip, #1
	ldr	r1, .L67+12
	mov	r0, #7
	ldr	r2, [r3, #60]
	ldr	r6, [r3, #32]
	str	r2, [r3, #32]
	ldr	r3, [r4, #368]
	str	r5, [r3, #24]
	ldr	r3, [r4, #368]
	ldr	lr, [r3, #12]
	ldr	r2, [r3, #36]
	rsb	r2, lr, r2
	str	r2, [r3, #8]
	ldr	r3, [r4, #368]
	ldr	lr, [r3, #12]
	ldr	r2, [r3, #44]
	rsb	r2, lr, r2
	str	r2, [r3, #16]
	ldr	r3, [r4, #368]
	ldr	lr, [r3, #40]
	ldr	r2, [r3, #12]
	add	r2, r2, lr
	str	r2, [r3, #12]
	ldr	r3, [r4, #368]
	str	ip, [r3, #68]
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #12]
	ldr	r2, [r2, #16]
	bl	dprint_vfmw
	add	r3, r4, #61440
	mov	r1, r6
	ldr	r0, [r3, #3520]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #368]
	str	r5, [r3, #36]
	ldr	r3, [r4, #368]
	str	r5, [r3, #52]
	ldr	r3, [r4, #368]
	str	r5, [r3, #40]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L68:
	.align	2
.L67:
	.word	.LC7
	.word	.LC8
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC9
	UNWIND(.fnend)
	.size	CombinePacket.part.11, .-CombinePacket.part.11
	.align	2
	.global	ue_v
	.type	ue_v, %function
ue_v:
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
	add	r7, r0, #13504
	mov	r8, r0
	add	r7, r7, #24
	mov	r6, r1
	mov	r1, #32
	mov	r0, r7
	bl	BsShow
	mov	r5, r0
	bl	ZerosMS_32
	cmp	r0, #15
	mov	r4, r0
	bls	.L73
	cmp	r0, #31
	bls	.L74
	add	r3, r8, #61440
	mvn	r5, #0
	mov	r7, #32
	mov	r2, #1
	str	r2, [r3, #3460]
.L71:
	ldr	ip, [r8, #368]
	mov	r2, r6
	mov	r3, r5
	ldr	r1, .L75
	mov	r0, #21
	ldr	lr, [ip, #64]
	add	r4, lr, r7
	str	r4, [ip, #64]
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L73:
	mov	r4, r0, asl #1
	mov	r0, r7
	add	r7, r4, #1
	rsb	r4, r4, #31
	mov	r4, r5, lsr r4
	mov	r1, r7
	sub	r5, r4, #1
	bl	BsSkip
	b	.L71
.L74:
	add	r5, r0, #1
	mov	r1, r0
	mov	r0, r7
	bl	BsSkip
	mov	r1, r5
	mov	r0, r7
	bl	BsShow
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r7
	bl	BsSkip
	mov	ip, r4, asl #1
	add	r7, ip, #1
	b	.L71
.L76:
	.align	2
.L75:
	.word	.LC10
	UNWIND(.fnend)
	.size	ue_v, .-ue_v
	.align	2
	.global	se_v
	.type	se_v, %function
se_v:
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
	add	r6, r0, #13504
	mov	r8, r0
	add	r6, r6, #24
	mov	r7, r1
	mov	r1, #32
	mov	r0, r6
	bl	BsShow
	mov	r4, r0
	bl	ZerosMS_32
	cmp	r0, #15
	mov	r5, r0
	bhi	.L78
	mov	r5, r0, asl #1
	mov	r0, r6
	rsb	r3, r5, #31
	add	r5, r5, #1
	mov	r3, r4, lsr r3
	and	r2, r3, #1
	mov	r1, r5
	rsb	r4, r2, #0
	eor	r4, r4, r3, lsr #1
	add	r4, r4, r2
	bl	BsSkip
.L79:
	ldr	lr, [r8, #368]
	mov	r2, r7
	mov	r3, r4
	ldr	r1, .L82
	mov	r0, #21
	ldr	ip, [lr, #64]
	add	r5, ip, r5
	str	r5, [lr, #64]
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L78:
	cmp	r0, #31
	bls	.L81
	add	r3, r8, #61440
	mov	r2, #1
	mvn	r4, #-2147483648
	mov	r5, #32
	str	r2, [r3, #3460]
	b	.L79
.L81:
	mov	r1, r0
	mov	r0, r6
	bl	BsSkip
	mov	r1, r5
	mov	r0, r6
	mov	r5, r5, asl #1
	bl	BsGet
	mov	r1, #1
	add	r5, r5, #1
	mov	r9, r0
	mov	r0, r6
	bl	BsGet
	and	r0, r0, #1
	rsb	r4, r0, #0
	eor	r9, r9, r4
	add	r4, r9, r0
	b	.L79
.L83:
	.align	2
.L82:
	.word	.LC10
	UNWIND(.fnend)
	.size	se_v, .-se_v
	.align	2
	.global	u_v
	.type	u_v, %function
u_v:
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
	mov	r5, r0
	add	r0, r0, #13504
	add	r0, r0, #24
	mov	r6, r1
	mov	r7, r2
	bl	BsGet
	ldr	lr, [r5, #368]
	mov	r2, r7
	ldr	r1, .L85
	ldr	ip, [lr, #64]
	add	ip, ip, r6
	str	ip, [lr, #64]
	mov	r4, r0
	mov	r0, #21
	mov	r3, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L86:
	.align	2
.L85:
	.word	.LC10
	UNWIND(.fnend)
	.size	u_v, .-u_v
	.align	2
	.global	u_1
	.type	u_1, %function
u_1:
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
	mov	r5, r0
	add	r0, r0, #13504
	mov	r6, r1
	add	r0, r0, #24
	mov	r1, #1
	bl	BsGet
	ldr	lr, [r5, #368]
	mov	r2, r6
	ldr	r1, .L88
	ldr	ip, [lr, #64]
	add	ip, ip, #1
	str	ip, [lr, #64]
	mov	r4, r0
	mov	r3, r0
	mov	r0, #21
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L89:
	.align	2
.L88:
	.word	.LC10
	UNWIND(.fnend)
	.size	u_1, .-u_1
	.align	2
	.global	H264_IsEosNal
	.type	H264_IsEosNal, %function
H264_IsEosNal:
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
	add	r4, r0, #13504
	mov	r1, #32
	add	r4, r4, #24
	mov	r0, r4
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	mov	r0, r4
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r5, r3
	moveq	r0, #1
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	H264_IsEosNal, .-H264_IsEosNal
	.align	2
	.global	GetMinPOC
	.type	GetMinPOC, %function
GetMinPOC:
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
	add	r5, r0, #24576
	mov	ip, #0
	mvn	r3, #-2147483648
	str	ip, [r2]
	str	r3, [r1]
	ldr	r3, [r5, #2148]
	ldr	ip, [r5, #2144]
	cmp	r3, ip
	strhi	ip, [r5, #2148]
	movhi	r3, ip
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r0, r0, #26368
	mov	r3, #0
	add	r0, r0, #156
.L95:
	ldr	ip, [r0, #4]!
	ldr	r4, [r1]
	ldr	lr, [ip, #688]
	cmp	r4, lr
	ble	.L94
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	strne	lr, [r1]
	strne	r3, [r2]
.L94:
	ldr	ip, [r5, #2148]
	add	r3, r3, #1
	cmp	ip, r3
	bhi	.L95
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetMinPOC, .-GetMinPOC
	.align	2
	.global	GetMaxPOC
	.type	GetMaxPOC, %function
GetMaxPOC:
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
	add	r5, r0, #24576
	mov	r3, #0
	str	r3, [r2]
	str	r3, [r1]
	ldr	r3, [r5, #2148]
	ldr	ip, [r5, #2144]
	cmp	r3, ip
	strhi	ip, [r5, #2148]
	movhi	r3, ip
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r0, r0, #26368
	mov	r3, #0
	add	r0, r0, #156
.L105:
	ldr	ip, [r0, #4]!
	ldr	r4, [r1]
	ldr	lr, [ip, #688]
	cmp	r4, lr
	bge	.L104
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	strne	lr, [r1]
	strne	r3, [r2]
.L104:
	ldr	ip, [r5, #2148]
	add	r3, r3, #1
	cmp	ip, r3
	bhi	.L105
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetMaxPOC, .-GetMaxPOC
	.align	2
	.global	FrameStoreRefFlg
	.type	FrameStoreRefFlg, %function
FrameStoreRefFlg:
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
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FrameStoreRefFlg, .-FrameStoreRefFlg
	.align	2
	.global	ShortTermRefFlg
	.type	ShortTermRefFlg, %function
ShortTermRefFlg:
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
	ldrb	r3, [r0, #2]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L127
	tst	r3, #1
	bne	.L128
.L116:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L120
.L117:
	ldr	r0, [r0, #800]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #65536
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L120:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L128:
	ldr	r2, [r0, #760]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	bne	.L116
.L121:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L127:
	ldr	r3, [r0, #720]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L121
	ldr	r3, [r0, #760]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	bne	.L117
	b	.L121
	UNWIND(.fnend)
	.size	ShortTermRefFlg, .-ShortTermRefFlg
	.align	2
	.global	LongTermRefFlg
	.type	LongTermRefFlg, %function
LongTermRefFlg:
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
	ldrb	r3, [r0, #2]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L144
	tst	r3, #1
	bne	.L145
.L133:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L137
.L134:
	ldr	r0, [r0, #800]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #256
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L137:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L145:
	ldr	r2, [r0, #760]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #256
	bne	.L133
.L138:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L144:
	ldr	r3, [r0, #720]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L138
	ldr	r3, [r0, #760]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	bne	.L134
	b	.L138
	UNWIND(.fnend)
	.size	LongTermRefFlg, .-LongTermRefFlg
	.align	2
	.global	UpdateLTReflist
	.type	UpdateLTReflist, %function
UpdateLTReflist:
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
	add	r9, r0, #24576
	mov	r6, r0
	ldr	r8, [r9, #2148]
	cmp	r8, #0
	beq	.L153
	add	r10, r0, #26368
	mov	r4, #0
	add	r10, r10, #156
	mov	r5, r4
.L149:
	ldr	r7, [r10, #4]!
	add	r5, r5, #1
	mov	r0, r7
	bl	LongTermRefFlg
	add	r3, r4, #6656
	add	r3, r3, #8
	cmp	r0, #0
	strne	r7, [r6, r3, asl #2]
	addne	r4, r4, #1
	cmp	r5, r8
	bne	.L149
.L147:
	ldr	r3, [r9, #2144]
	str	r4, [r9, #2156]
	cmp	r3, r4
	ldmlsfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	add	r0, r4, #6656
	mov	r2, #0
	add	r0, r0, #7
	add	r0, r6, r0, lsl #2
.L151:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r3
	bne	.L151
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L153:
	mov	r4, r8
	b	.L147
	UNWIND(.fnend)
	.size	UpdateLTReflist, .-UpdateLTReflist
	.align	2
	.global	UpdateReflist
	.type	UpdateReflist, %function
UpdateReflist:
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
	add	r9, r0, #24576
	mov	r6, r0
	ldr	r8, [r9, #2148]
	cmp	r8, #0
	beq	.L166
	add	r10, r0, #26368
	mov	r4, #0
	add	r10, r10, #156
	mov	r5, r4
.L162:
	ldr	r7, [r10, #4]!
	add	r5, r5, #1
	mov	r0, r7
	bl	ShortTermRefFlg
	add	r3, r4, #6592
	add	r3, r3, #56
	cmp	r0, #0
	strne	r7, [r6, r3, asl #2]
	addne	r4, r4, #1
	cmp	r5, r8
	bne	.L162
.L160:
	ldr	r3, [r9, #2144]
	str	r4, [r9, #2152]
	cmp	r3, r4
	ldmlsfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	add	r0, r4, #6592
	mov	r2, #0
	add	r0, r0, #55
	add	r0, r6, r0, lsl #2
.L164:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r3
	bne	.L164
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L166:
	mov	r4, r8
	b	.L160
	UNWIND(.fnend)
	.size	UpdateReflist, .-UpdateReflist
	.align	2
	.global	GetPicNumX
	.type	GetPicNumX, %function
GetPicNumX:
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
	ldrb	r3, [r0, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r0, #688]
	mvn	r0, r1
	movne	r3, r3, asl #1
	addne	r3, r3, #1
	add	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetPicNumX, .-GetPicNumX
	.align	2
	.global	UnMarkFrameStoreRef
	.type	UnMarkFrameStoreRef, %function
UnMarkFrameStoreRef:
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
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L176
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r1, #761]
	and	r2, r2, #2
	strb	ip, [r1, #762]
	strb	r2, [r1, #2]
.L176:
	tst	r3, #2
	beq	.L177
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r1, #801]
	and	r2, r2, #1
	strb	ip, [r1, #802]
	strb	r2, [r1, #2]
.L177:
	cmp	r3, #3
	add	r0, r0, #61440
	moveq	r3, #0
	streqb	r3, [r1, #722]
	streqb	r3, [r1, #721]
	mov	r3, #0
	mov	r2, r3
	strb	r3, [r1, #2]
	ldr	r1, [r1, #672]
	ldr	r0, [r0, #3520]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_SetRef
	UNWIND(.fnend)
	.size	UnMarkFrameStoreRef, .-UnMarkFrameStoreRef
	.align	2
	.type	SlidingWinMark.part.2, %function
SlidingWinMark.part.2:
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
	add	r3, r0, #24576
	mov	r8, r0
	ldr	r7, [r3, #2148]
	cmp	r7, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r6, r0, #26368
	mov	r4, #0
	add	r6, r6, #156
.L188:
	ldr	r5, [r6, #4]!
	add	r4, r4, #1
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	mov	r0, r5
	cmp	r3, #0
	beq	.L187
	bl	ShortTermRefFlg
	cmp	r0, #0
	bne	.L199
.L187:
	cmp	r4, r7
	bne	.L188
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L199:
	mov	r0, r8
	mov	r1, r5
	bl	UnMarkFrameStoreRef
	mov	r0, r8
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	UpdateReflist
	UNWIND(.fnend)
	.size	SlidingWinMark.part.2, .-SlidingWinMark.part.2
	.align	2
	.global	UnMarkLTFrmByFrmIdx
	.type	UnMarkLTFrmByFrmIdx, %function
UnMarkLTFrmByFrmIdx:
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
	add	r3, r0, #24576
	ldr	r4, [r3, #2156]
	cmp	r4, #0
	ldmeqfd	sp, {r4, fp, sp, pc}
	ldr	ip, [r3, #2080]
	ldr	r3, [ip, #684]
	cmp	r3, r1
	addne	r2, r0, #26624
	movne	r3, #0
	addne	r2, r2, #32
	bne	.L204
	b	.L202
.L205:
	ldr	ip, [r2, #4]!
	ldr	lr, [ip, #684]
	cmp	lr, r1
	beq	.L202
.L204:
	add	r3, r3, #1
	cmp	r3, r4
	bne	.L205
	ldmfd	sp, {r4, fp, sp, pc}
.L202:
	mov	r1, ip
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	UnMarkFrameStoreRef
	UNWIND(.fnend)
	.size	UnMarkLTFrmByFrmIdx, .-UnMarkLTFrmByFrmIdx
	.align	2
	.global	UnMarkLTFldByFrmIdx
	.type	UnMarkLTFldByFrmIdx, %function
UnMarkLTFldByFrmIdx:
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
	add	ip, r0, #24576
	ldr	r6, [ip, #2156]
	cmp	r6, #0
	ldmeqfd	sp, {r4, r5, r6, fp, sp, pc}
	add	r4, r0, #26624
	mov	ip, #0
	add	r4, r4, #28
	b	.L215
.L213:
	cmp	ip, r6
	beq	.L229
.L215:
	ldr	lr, [r4, #4]!
	add	ip, ip, #1
	ldr	r5, [lr, #684]
	cmp	r5, r3
	bne	.L213
	cmp	r2, #1
	ldreqb	r5, [lr, #801]	@ zero_extendqisi2
	beq	.L228
	cmp	r2, #2
	bne	.L213
	ldrb	r5, [lr, #761]	@ zero_extendqisi2
.L228:
	clz	r5, r5
	mov	r5, r5, lsr #5
	cmp	lr, r1
	orrne	r5, r5, #1
	cmp	r5, #0
	beq	.L213
	mov	r1, lr
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L229:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	UnMarkLTFldByFrmIdx, .-UnMarkLTFldByFrmIdx
	.align	2
	.global	UnMarkSTRef
	.type	UnMarkSTRef, %function
UnMarkSTRef:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L231
	add	ip, r0, #24576
	ldr	r1, [r1, #688]
	ldr	r4, [ip, #2152]
	sub	r1, r1, #1
	rsb	r2, r2, r1
	cmp	r4, #0
	beq	.L260
	add	ip, r0, #26368
	add	ip, ip, #220
	b	.L237
.L236:
	cmp	r3, r4
	beq	.L261
.L237:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #728]
	cmp	lr, r2
	bne	.L236
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L236
	ldr	lr, [r1, #720]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L236
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L231:
	add	r3, r0, #24576
	ldr	r1, [r1, #688]
	ldr	r5, [r3, #2152]
	rsb	r2, r2, r1, lsl #1
	cmp	r5, #0
	beq	.L262
	add	r4, r0, #26368
	mov	ip, #0
	add	r4, r4, #220
	b	.L242
.L238:
	tst	r3, #2
	beq	.L240
	ldr	r3, [r1, #800]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L263
.L240:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L264
.L242:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L238
	ldr	lr, [r1, #760]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L238
	ldr	lr, [r1, #768]
	cmp	lr, r2
	bne	.L238
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #24576
	strb	r3, [r1, #2]
	mov	r1, #0
	ldr	r3, [r2, #2016]
	strb	r1, [r3, #762]
	ldr	r3, [r2, #2016]
	ldrb	ip, [r3, #720]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #722]
	ldreq	r3, [r2, #2016]
	streqb	r1, [r3, #721]
	ldreq	r3, [r2, #2016]
	ldrb	r1, [r3, #2]	@ zero_extendqisi2
	cmp	r1, #0
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	ldr	ip, [r3, #708]
	mov	r2, r1
	add	lr, r0, #61440
	add	ip, ip, #15808
	add	ip, ip, #50
	str	r1, [r0, ip, asl #2]
	ldr	r1, [r3, #672]
.L257:
	ldr	r0, [lr, #3520]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	FSP_SetRef
.L263:
	ldr	r3, [r1, #808]
	cmp	r3, r2
	bne	.L240
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #2]
	add	r3, r3, #24576
	mov	r2, #0
	ldr	r1, [r3, #2016]
	strb	r2, [r1, #802]
	ldr	r1, [r3, #2016]
	ldrb	ip, [r1, #720]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r2
	streqb	r2, [r1, #722]
	ldreq	r1, [r3, #2016]
	streqb	r2, [r1, #721]
	ldreq	r1, [r3, #2016]
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, r6, fp, sp, pc}
	ldr	ip, [r1, #708]
	add	lr, r0, #61440
	mov	r2, r3
	add	ip, ip, #15808
	add	ip, ip, #50
	str	r3, [r0, ip, asl #2]
	ldr	r1, [r1, #672]
	b	.L257
.L264:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L261:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L260:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L262:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	UnMarkSTRef, .-UnMarkSTRef
	.align	2
	.global	UnMarkLTRef
	.type	UnMarkLTRef, %function
UnMarkLTRef:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L266
	add	r3, r0, #24576
	ldr	r5, [r3, #2156]
	cmp	r5, #0
	beq	.L294
	add	r4, r0, #26624
	mov	ip, #0
	add	r4, r4, #28
	b	.L275
.L271:
	tst	r3, #2
	beq	.L273
	ldr	r3, [r1, #800]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L295
.L273:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L296
.L275:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L271
	ldr	lr, [r1, #760]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L271
	ldr	lr, [r1, #764]
	cmp	r2, lr
	bne	.L271
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #24576
	strb	r3, [r1, #2]
	mov	r1, #0
	ldr	r3, [r2, #2080]
	strb	r1, [r3, #761]
	ldr	r3, [r2, #2080]
	ldrb	ip, [r3, #720]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #722]
	ldreq	r3, [r2, #2080]
	streqb	r1, [r3, #721]
	ldreq	r3, [r2, #2080]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #0
	ldreq	r3, [r3, #708]
	addeq	r3, r3, #15808
	addeq	r3, r3, #50
	streq	r2, [r0, r3, asl #2]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L266:
	add	r1, r0, #24576
	ldr	r4, [r1, #2156]
	cmp	r4, #0
	beq	.L297
	add	ip, r0, #26624
	add	ip, ip, #28
	b	.L277
.L276:
	cmp	r3, r4
	beq	.L298
.L277:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #724]
	cmp	lr, r2
	bne	.L276
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L276
	ldr	lr, [r1, #720]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L276
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	UnMarkFrameStoreRef
.L295:
	ldr	r3, [r1, #804]
	cmp	r2, r3
	bne	.L273
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #2]
	add	r3, r3, #24576
	mov	r1, #0
	ldr	r2, [r3, #2080]
	strb	r1, [r2, #801]
	ldr	r2, [r3, #2080]
	ldrb	ip, [r2, #720]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r2, #722]
	ldreq	r2, [r3, #2080]
	streqb	r1, [r2, #721]
	ldreq	r2, [r3, #2080]
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #0
	ldreq	r3, [r2, #708]
	addeq	r3, r3, #15808
	addeq	r3, r3, #50
	streq	r1, [r0, r3, asl #2]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L298:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L296:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L297:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L294:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	UnMarkLTRef, .-UnMarkLTRef
	.align	2
	.global	MarkPicLTRef
	.type	MarkPicLTRef, %function
MarkPicLTRef:
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
	ldrb	r5, [r3, #3]	@ zero_extendqisi2
	add	r3, r0, #24576
	cmp	r5, #0
	beq	.L300
	ldr	r7, [r3, #2152]
	cmp	r7, #0
	beq	.L329
	add	r6, r0, #26368
	mov	ip, #0
	add	r6, r6, #220
	b	.L314
.L306:
	tst	r4, #2
	beq	.L309
	ldr	lr, [r3, #800]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	beq	.L330
.L309:
	add	ip, ip, #1
	cmp	ip, r7
	beq	.L331
.L314:
	ldr	r3, [r6, #4]!
	ldrb	r4, [r3, #2]	@ zero_extendqisi2
	tst	r4, #1
	beq	.L306
	ldr	lr, [r3, #760]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L306
	ldr	lr, [r3, #768]
	cmp	lr, r2
	bne	.L306
	ldrb	lr, [r3, #801]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L310
	ldr	lr, [r3, #684]
	cmp	lr, r1
	bne	.L309
.L310:
	str	r1, [r3, #684]
	sub	r3, r5, #1
	add	r2, r0, ip, lsl #2
	clz	r3, r3
	add	r2, r2, #24576
	mov	ip, #1
	mov	r3, r3, lsr #5
	mov	r0, #0
	add	r1, r3, r1, lsl #1
	ldr	r3, [r2, #2016]
	str	r1, [r3, #764]
	ldr	r3, [r2, #2016]
	strb	ip, [r3, #761]
	ldr	r3, [r2, #2016]
	strb	r0, [r3, #762]
	ldr	r3, [r2, #2016]
	ldrb	r1, [r3, #720]	@ zero_extendqisi2
	cmp	r1, #3
	cmpne	r1, r0
	bne	.L332
	ldrb	r1, [r3, #801]	@ zero_extendqisi2
	ldrb	r0, [r3, #761]	@ zero_extendqisi2
	cmp	r1, r0
	streqb	r1, [r3, #721]
	ldreq	r3, [r2, #2016]
	ldreqb	r2, [r3, #762]	@ zero_extendqisi2
	streqb	r2, [r3, #722]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L300:
	ldr	r6, [r3, #2152]
	cmp	r6, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	lr, r0, #26368
	mov	r3, r5
	add	lr, lr, #220
	b	.L305
.L304:
	add	r3, r3, #1
	cmp	r3, r6
	beq	.L333
.L305:
	ldr	ip, [lr, #4]!
	ldrb	r4, [ip, #2]	@ zero_extendqisi2
	cmp	r4, #3
	bne	.L304
	ldr	r4, [ip, #720]
	bic	r4, r4, #-16777216
	bic	r4, r4, #255
	cmp	r4, #65536
	bne	.L304
	ldr	r4, [ip, #728]
	cmp	r4, r2
	bne	.L304
	add	r3, r0, r3, lsl #2
	str	r1, [ip, #684]
	add	r3, r3, #24576
	mov	r0, #1
	mov	r2, #0
	ldr	ip, [r3, #2016]
	str	r1, [ip, #724]
	ldr	r1, [r3, #2016]
	strb	r0, [r1, #721]
	ldr	r1, [r3, #2016]
	strb	r0, [r1, #761]
	ldr	r1, [r3, #2016]
	strb	r0, [r1, #801]
	ldr	r1, [r3, #2016]
	strb	r2, [r1, #722]
	ldr	r1, [r3, #2016]
	strb	r2, [r1, #762]
	ldr	r3, [r3, #2016]
	strb	r2, [r3, #802]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L330:
	ldr	lr, [r3, #808]
	cmp	lr, r2
	bne	.L309
	ldrb	lr, [r3, #761]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L313
	ldr	lr, [r3, #684]
	cmp	lr, r1
	bne	.L309
.L313:
	str	r1, [r3, #684]
	sub	r3, r5, #2
	add	r0, r0, ip, lsl #2
	clz	r3, r3
	add	r0, r0, #24576
	mov	ip, #1
	mov	r3, r3, lsr #5
	mov	r2, #0
	add	r1, r3, r1, lsl #1
	ldr	r3, [r0, #2016]
	str	r1, [r3, #804]
	ldr	r3, [r0, #2016]
	strb	ip, [r3, #801]
	ldr	r3, [r0, #2016]
	strb	r2, [r3, #802]
	ldr	r3, [r0, #2016]
	ldrb	r2, [r3, #720]	@ zero_extendqisi2
	cmp	r2, #3
	cmpne	r2, #0
	bne	.L334
	ldrb	r2, [r3, #801]	@ zero_extendqisi2
	ldrb	r1, [r3, #761]	@ zero_extendqisi2
	cmp	r2, r1
	streqb	r2, [r3, #721]
	ldreq	r3, [r0, #2016]
	ldreqb	r2, [r3, #802]	@ zero_extendqisi2
	streqb	r2, [r3, #722]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L331:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L333:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L332:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L334:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L329:
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MarkPicLTRef, .-MarkPicLTRef
	.align	2
	.global	MarkSTToLTRef
	.type	MarkSTToLTRef, %function
MarkSTToLTRef:
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
	mov	r6, r1
	ldrb	r1, [r1, #3]	@ zero_extendqisi2
	mov	r8, r3
	mov	r7, r0
	cmp	r1, #0
	bne	.L336
	ldr	r5, [r6, #688]
	mov	r1, r3
	sub	r5, r5, #1
	rsb	r5, r2, r5
	bl	UnMarkLTFrmByFrmIdx
.L337:
	mov	r3, r6
	mov	r2, r5
	mov	r1, r8
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	MarkPicLTRef
.L336:
	add	r3, r0, #24576
	ldr	r5, [r6, #688]
	ldr	r1, [r3, #2152]
	rsb	r5, r2, r5, lsl #1
	cmp	r1, #0
	beq	.L337
	add	r2, r0, #26368
	mov	lr, #0
	add	r2, r2, #220
	b	.L340
.L338:
	tst	r3, #2
	beq	.L339
	ldr	r3, [ip, #800]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L351
.L339:
	cmp	lr, r1
	beq	.L337
.L340:
	ldr	ip, [r2, #4]!
	add	lr, lr, #1
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L338
	ldr	r4, [ip, #760]
	bic	r4, r4, #-16777216
	bic	r4, r4, #255
	cmp	r4, #65536
	bne	.L338
	ldr	r0, [ip, #768]
	cmp	r0, r5
	bne	.L338
	mov	r1, ip
	mov	r3, r8
	mov	r2, #1
	mov	r0, r7
	bl	UnMarkLTFldByFrmIdx
	b	.L337
.L351:
	ldr	r3, [ip, #808]
	cmp	r3, r5
	bne	.L339
	mov	r1, ip
	mov	r3, r8
	mov	r2, #2
	mov	r0, r7
	bl	UnMarkLTFldByFrmIdx
	b	.L337
	UNWIND(.fnend)
	.size	MarkSTToLTRef, .-MarkSTToLTRef
	.align	2
	.global	UpdateMaxLTFrmIdx
	.type	UpdateMaxLTFrmIdx, %function
UpdateMaxLTFrmIdx:
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
	add	r6, r0, #24576
	mov	r7, r0
	ldr	r3, [r6, #2156]
	str	r1, [r6, #2160]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r0, #26624
	mov	r3, r1
	add	r5, r5, #28
	mov	r4, #0
	b	.L356
.L354:
	ldr	r3, [r6, #2156]
	cmp	r3, r4
	ldmlsfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r3, [r6, #2160]
.L356:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	ldr	r2, [r1, #684]
	cmp	r2, r3
	bcc	.L354
	mov	r0, r7
	bl	UnMarkFrameStoreRef
	b	.L354
	UNWIND(.fnend)
	.size	UpdateMaxLTFrmIdx, .-UpdateMaxLTFrmIdx
	.align	2
	.global	UnMarkAllSTRef
	.type	UnMarkAllSTRef, %function
UnMarkAllSTRef:
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
	add	r7, r0, #24576
	mov	r6, r0
	ldr	r3, [r7, #2152]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r5, r0, #26368
	mov	r4, #0
	add	r5, r5, #220
.L359:
	ldr	r1, [r5, #4]!
	mov	r0, r6
	bl	UnMarkFrameStoreRef
	ldr	r3, [r7, #2152]
	add	r4, r4, #1
	cmp	r3, r4
	bhi	.L359
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	UnMarkAllSTRef, .-UnMarkAllSTRef
	.align	2
	.global	MarkCurrPicLT
	.type	MarkCurrPicLT, %function
MarkCurrPicLT:
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
	mov	r5, r2
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	mov	r4, r1
	cmp	r2, #0
	beq	.L365
	mov	r3, r5
	ldr	r1, [r1, #680]
	bl	UnMarkLTFldByFrmIdx
.L364:
	mov	r2, #1
	mov	r3, #0
	str	r5, [r4, #692]
	strb	r2, [r4, #4]
	strb	r3, [r4, #5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L365:
	mov	r1, r5
	bl	UnMarkLTFrmByFrmIdx
	b	.L364
	UNWIND(.fnend)
	.size	MarkCurrPicLT, .-MarkCurrPicLT
	.align	2
	.global	RemoveFrameStoreOutDPB
	.type	RemoveFrameStoreOutDPB, %function
RemoveFrameStoreOutDPB:
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
	add	r5, r0, r1, lsl #2
	mov	r4, r1
	add	r5, r5, #24576
	mov	r6, r0
	ldr	r2, [r5, #1952]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, [r2, #712]
	add	r7, r0, #24576
	mov	r1, #0
	add	r8, r0, #61440
	add	r3, r3, #6656
	add	r3, r3, #28
	add	r3, r0, r3, lsl #2
	str	r1, [r3, #4]
	ldr	r3, [r7, #2424]
	cmp	r3, r1
	subne	r3, r3, #1
	str	r3, [r7, #2424]
	ldr	r1, [r2, #672]
	ldr	r0, [r8, #3520]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L369
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L370
	ldr	r3, [r5, #1952]
	mov	r2, #0
	ldr	r0, [r8, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_SetDisplay
.L370:
	ldr	r3, [r5, #1952]
	mov	r2, #0
	ldr	r0, [r8, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_SetRef
.L369:
	ldr	r2, [r5, #1952]
	mov	r3, #0
	strb	r3, [r2, #1]
	ldr	r2, [r5, #1952]
	strb	r3, [r2, #4]
	ldr	r2, [r5, #1952]
	strb	r3, [r2, #2]
	ldr	r1, [r7, #2148]
	sub	r1, r1, #1
	cmp	r4, r1
	addcc	r3, r4, #6592
	addcc	r3, r3, #40
	addcc	r3, r6, r3, lsl #2
	bcs	.L373
.L372:
	add	r4, r4, #1
	ldr	r2, [r3, #4]!
	cmp	r4, r1
	str	r2, [r3, #-4]
	bne	.L372
.L373:
	add	r3, r1, #6592
	mov	r2, #0
	add	r3, r3, #40
	str	r2, [r6, r3, asl #2]
	str	r1, [r7, #2148]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	RemoveFrameStoreOutDPB, .-RemoveFrameStoreOutDPB
	.align	2
	.global	RemoveUnUsedFrameStore
	.type	RemoveUnUsedFrameStore, %function
RemoveUnUsedFrameStore:
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
	subs	r5, r0, #0
	beq	.L397
	add	r3, r5, #24576
	ldr	r6, [r3, #2148]
	cmp	r6, #0
	addne	r7, r5, #61440
	movne	r10, #0
	movne	r8, r10
	movne	r9, r10
	bne	.L395
	b	.L396
.L406:
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L393
	ldr	r0, [r2, #840]
	cmp	r0, #1
	beq	.L393
	strb	r1, [r2, #1]
	mov	r0, r5
	mov	r1, r10
	add	r8, r8, #1
	bl	RemoveFrameStoreOutDPB
	cmp	r8, r6
	beq	.L396
.L395:
	add	r4, r5, r10, lsl #2
	ldr	r0, [r7, #3520]
	add	r4, r4, #24576
	ldr	r2, [r4, #1952]
	ldr	r1, [r2, #672]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L390
	ldrsh	r2, [r0]
	cmp	r2, #0
	bne	.L391
	ldr	r1, [r4, #1952]
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L392
	ldrsb	r0, [r0]
	cmp	r0, #0
	bne	.L405
.L392:
	mvn	r3, #0
	str	r3, [r1, #672]
	ldr	r2, [r4, #1952]
	strb	r9, [r2, #2]
.L390:
	ldr	r1, [r4, #1952]
	ldr	r2, [r1, #840]
	sub	r2, r2, #1
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r1, #4]
.L391:
	ldr	r2, [r4, #1952]
	ldrb	r1, [r2, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L406
.L393:
	add	r8, r8, #1
	add	r10, r10, #1
	cmp	r8, r6
	bne	.L395
.L396:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L405:
	ldr	r1, [r1, #672]
	ldr	r0, [r7, #3520]
	bl	FSP_SetRef
	ldr	r1, [r4, #1952]
	b	.L392
.L397:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	RemoveUnUsedFrameStore, .-RemoveUnUsedFrameStore
	.align	2
	.global	CheckFrameStore
	.type	CheckFrameStore, %function
CheckFrameStore:
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
	add	r3, r0, #61440
	mov	r5, r0
	mov	r4, r1
	ldr	r2, [r3, #2076]
	cmp	r2, #0
	bne	.L408
	ldr	r2, [r1, #840]
	cmp	r2, #1
	beq	.L409
	ldr	r2, [r3, #3448]
	cmp	r2, #0
	beq	.L433
.L409:
	mov	r2, #1
	str	r2, [r3, #2076]
.L408:
	ldr	r0, [r3, #3520]
	ldr	r1, [r4, #672]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L411
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	cmpne	r3, #0
	beq	.L434
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L419
	cmp	r3, #1
	beq	.L419
	ldr	r3, [r4]
	mov	r1, #768
	movt	r1, 768
	bic	r3, r3, #16711680
	bic	r3, r3, #255
	cmp	r3, r1
	beq	.L435
	cmp	r2, #1
	beq	.L436
	cmp	r2, #2
	beq	.L437
.L417:
	ldr	r3, [r5]
	ldr	r2, [r0, #192]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	movls	r0, #0
	bhi	.L438
.L432:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L433:
	ldr	r2, [r0]
	ldr	r2, [r2, #12]
	cmp	r2, #0
	bne	.L409
	mvn	r0, #0
	b	.L432
.L434:
	ldr	r2, [r4, #672]
	mov	r0, #1
	ldr	r1, .L439
	bl	dprint_vfmw
.L413:
	ldr	r3, [r4, #840]
	cmp	r3, #1
	beq	.L420
	mvn	r0, #2
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L436:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L417
	mov	r0, r2
	ldr	r1, .L439+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L432
.L437:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	tst	r3, #2
	beq	.L417
	ldr	r1, .L439+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L432
.L420:
	mov	r3, #2
	mvn	r0, #2
	str	r3, [r4, #840]
	b	.L432
.L411:
	ldr	ip, [r4, #672]
	mov	r2, r4
	ldr	r3, [r4, #840]
	mov	r0, #1
	ldr	r1, .L439+12
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L413
.L419:
	ldr	r1, .L439+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L432
.L438:
	ldr	r1, .L439+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L432
.L435:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r1, .L439+24
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L432
.L440:
	.align	2
.L439:
	.word	.LC11
	.word	.LC15
	.word	.LC16
	.word	.LC12
	.word	.LC13
	.word	.LC17
	.word	.LC14
	UNWIND(.fnend)
	.size	CheckFrameStore, .-CheckFrameStore
	.align	2
	.global	ExchangePts
	.type	ExchangePts, %function
ExchangePts:
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
	add	r10, r1, #656
	mvn	r5, #0
	mvn	r4, #0
	ldrd	r2, [r10, #-8]
	str	r0, [fp, #-52]
	cmp	r3, r5
	cmpeq	r2, r4
	beq	.L441
	add	r9, r0, #24576
	ldr	r3, [r9, #2148]
	cmp	r3, #0
	beq	.L441
	add	r8, r0, #26368
	add	r5, r0, #61440
	add	r8, r8, #156
	mvn	r6, #1
	mvn	r7, #0
	mov	r4, #0
	mvn	r3, #0
	str	r3, [fp, #-48]
.L446:
	ldr	r3, [r8, #4]!
	cmp	r3, #0
	beq	.L445
	ldr	r1, [r3, #672]
	ldr	r0, [r5, #3520]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L445
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	cmpne	r3, #0
	beq	.L445
	ldr	r3, [r8]
	add	r3, r3, #656
	ldrd	r0, [r3, #-8]
	cmp	r1, r7
	cmpeq	r0, r6
	strcc	r4, [fp, #-48]
	movcc	r6, r0
	movcc	r7, r1
.L445:
	ldr	r3, [r9, #2148]
	add	r4, r4, #1
	cmp	r4, r3
	bcc	.L446
	ldr	r3, [fp, #-48]
	cmn	r3, #1
	beq	.L441
	ldrd	r2, [r10, #-8]
	cmp	r3, r7
	cmpeq	r2, r6
	bhi	.L460
.L441:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L460:
	strd	r6, [sp]
	mov	r0, #29
	ldr	r1, .L461
	bl	dprint_vfmw
	ldr	r3, [fp, #-48]
	ldr	r1, [fp, #-52]
	add	r8, r3, #6592
	ldrd	r2, [r10, #-8]
	add	r8, r8, #40
	ldr	r1, [r1, r8, asl #2]
	add	r1, r1, #656
	strd	r2, [r1, #-8]
	strd	r6, [r10, #-8]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L462:
	.align	2
.L461:
	.word	.LC18
	UNWIND(.fnend)
	.size	ExchangePts, .-ExchangePts
	.align	2
	.global	GetImagePara
	.type	GetImagePara, %function
GetImagePara:
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
	add	ip, r0, #12288
	add	lr, r0, #20480
	mov	r4, r1
	mov	r2, #2208
	ldr	r3, [ip, #1304]
	add	r5, r0, #61440
	ldr	r1, [lr, #220]
	mov	r7, #4000
	ldrb	r6, [r4, #133]	@ zero_extendqisi2
	ldrb	lr, [r4, #132]	@ zero_extendqisi2
	mla	r2, r2, r1, r3
	bfc	r6, #0, #2
	ldr	r3, [ip, #1300]
	bfc	lr, #0, #2
	ldrb	ip, [r4, #134]	@ zero_extendqisi2
	ldrb	r1, [r4, #1]	@ zero_extendqisi2
	bfc	ip, #1, #1
	ldr	r8, [r2, #28]
	strb	r6, [r4, #133]
	strb	lr, [r4, #132]
	ldr	r2, [r5, #2084]
	strb	ip, [r4, #134]
	uxtb	ip, ip
	mla	r3, r7, r8, r3
	str	r2, [r4, #168]
	ldr	r2, [r0]
	ldr	r2, [r2, #592]
	sub	r2, r2, #1
	clz	r2, r2
	mov	r2, r2, lsr #5
	bfi	ip, r2, #2, #1
	strb	ip, [r4, #134]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L499
.L466:
	.word	.L465
	.word	.L467
	.word	.L468
	.word	.L465
.L468:
	ldrb	r2, [r4, #133]	@ zero_extendqisi2
	mov	lr, #3
	ldr	r8, [r4, #704]
	add	r6, r0, #24576
	ldr	r7, [r4, #820]
	and	r2, r2, #240
	ldr	ip, [r4, #836]
	orr	r2, r2, #11
	ldrb	r1, [r4, #132]	@ zero_extendqisi2
	ldr	r9, [r4, #700]
	strb	r2, [r4, #133]
	bfi	r1, r9, #0, #2
	str	r8, [r4, #192]
	strb	r1, [r4, #132]
	str	r7, [r4, #128]
	str	lr, [r4, #124]
	ldr	r2, [ip, #716]
	str	r2, [r4, #752]
.L464:
	ldrb	r2, [r3, #18]	@ zero_extendqisi2
	str	r2, [r4, #520]
	str	r2, [r4, #524]
	ldrb	r2, [r3, #22]	@ zero_extendqisi2
	cmp	r2, #0
	ldrne	r2, [r3, #3332]
	mov	r3, #1
	str	r3, [r4, #528]
	str	r2, [r4, #532]
	ldr	r3, [r0]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	ble	.L485
	ldrb	r3, [r4, #720]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L485
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #3
	ldreqb	r2, [r4, #133]	@ zero_extendqisi2
	bfieq	r2, r3, #0, #2
	streqb	r2, [r4, #133]
.L485:
	mov	r1, r4
	bl	ExchangePts
	ldrb	r3, [r6, #1816]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L486
	ldr	r3, [r6, #1832]
	cmp	r3, #3
	moveq	r3, #1
	streq	r3, [r4, #400]
	beq	.L486
	cmp	r3, #4
	moveq	r3, #2
	streq	r3, [r4, #400]
	beq	.L486
	cmp	r3, #5
	moveq	r3, #3
	streq	r3, [r4, #400]
	beq	.L486
	mov	r0, #0
	ldr	r1, .L510
	str	r0, [r4, #400]
	ldr	r2, [r6, #1832]
	bl	dprint_vfmw
.L486:
	ldr	r0, [r5, #3520]
	ldr	r1, [r4, #672]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	ldmeqfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	ldr	r3, .L510+4
	mov	r2, #664
	add	r1, r4, #8
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #0
	str	r3, [r5, #412]
	mov	r2, #1
	ldrb	r3, [r4, #720]	@ zero_extendqisi2
	strb	r2, [r5, #407]
	cmp	r3, #0
	movne	r3, #4
	strb	r3, [r5, #400]
	ldr	r3, [r4, #744]
	strb	r2, [r5, #405]
	str	r3, [r5, #416]
	str	r3, [r5, #424]
	str	r3, [r5, #420]
	ldr	r3, [r4, #752]
	str	r3, [r5, #356]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L467:
	ldrb	r2, [r4, #133]	@ zero_extendqisi2
	mov	lr, #3
	ldr	r8, [r4, #704]
	add	r6, r0, #24576
	ldr	r7, [r4, #780]
	and	r2, r2, #240
	ldr	ip, [r4, #796]
	orr	r2, r2, #7
	ldrb	r1, [r4, #132]	@ zero_extendqisi2
	ldr	r9, [r4, #700]
	strb	r2, [r4, #133]
	bfi	r1, r9, #0, #2
	str	r8, [r4, #192]
	strb	r1, [r4, #132]
	str	r7, [r4, #124]
	str	lr, [r4, #128]
	ldr	r2, [ip, #716]
	str	r2, [r4, #752]
	b	.L464
.L465:
	ldrb	r2, [r4, #720]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L469
	ldr	r1, [r4, #696]
	ldr	r2, [r4, #704]
	cmp	r1, #0
	ldr	ip, [r4, #700]
	ldreq	r8, [r4, #780]
	movne	lr, #3
	ldreq	r7, [r4, #820]
	moveq	lr, #2
	ldrne	r8, [r4, #780]
	moveq	r1, #3
	ldrne	r7, [r4, #820]
	movne	r1, lr
	str	r2, [r4, #192]
.L471:
	ldr	r6, [r4, #772]
	ldr	r2, [r4, #812]
	cmp	r6, r2
	beq	.L507
	movle	r10, #1
	movgt	r10, #0
.L482:
	add	r6, r0, #24576
	ldrb	r2, [r6, #1852]	@ zero_extendqisi2
	cmp	r2, #3
	moveq	r10, #1
	beq	.L483
	cmp	r2, #4
	moveq	r10, #0
.L483:
	ldrb	r2, [r4, #133]	@ zero_extendqisi2
	ldrb	r9, [r4, #132]	@ zero_extendqisi2
	bfi	r2, r10, #4, #2
	str	r8, [r4, #124]
	bfi	r2, r1, #2, #2
	bfi	r9, ip, #0, #2
	bfi	r2, lr, #0, #2
	str	r7, [r4, #128]
	strb	r9, [r4, #132]
	strb	r2, [r4, #133]
	b	.L464
.L469:
	ldr	lr, [r4, #776]
	ldr	r2, [r5, #3516]
	cmp	lr, r2
	bhi	.L508
	ldr	r1, [r4, #816]
	cmp	r2, r1
	bcc	.L475
.L473:
	ldr	r2, [r4, #704]
	mov	r1, #3
	ldr	ip, [r4, #700]
	ldr	r9, [r4, #780]
	ldr	r6, [r4, #820]
	str	r2, [r4, #192]
.L476:
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L509
	cmp	r2, #2
	streq	lr, [r4, #192]
	moveq	ip, r9
	moveq	r1, #1
.L478:
	ldr	r2, [r4, #792]
	mov	r8, r9
	ldr	r10, [r4, #832]
	mov	r7, r6
	mov	lr, #3
	str	r9, [r4, #124]
	add	r2, r2, r10
	str	r6, [r4, #128]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	str	r2, [r4, #364]
	b	.L471
.L475:
	ldr	ip, [r4, #780]
	mov	r1, #1
	ldr	r6, [r4, #820]
	str	lr, [r4, #192]
	mov	r9, ip
	b	.L476
.L507:
	ldr	r2, [r4, #136]
	cmp	r2, #720
	movne	r10, #1
	bne	.L482
	ldr	r10, [r4, #140]
	subs	r10, r10, #480
	movne	r10, #1
	b	.L482
.L508:
	ldr	r6, [r4, #816]
	cmp	r2, r6
	bcc	.L473
	ldr	ip, [r4, #820]
	mov	r1, #2
	str	r6, [r4, #192]
	ldr	r9, [r4, #780]
	mov	r6, ip
	b	.L476
.L509:
	ldr	r2, [r4, #816]
	mov	ip, r6
	mov	r1, #2
	str	r2, [r4, #192]
	b	.L478
.L499:
	add	r6, r0, #24576
	b	.L464
.L511:
	.align	2
.L510:
	.word	.LC19
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	GetImagePara, .-GetImagePara
	.align	2
	.global	SetFrmRepeatCount
	.type	SetFrmRepeatCount, %function
SetFrmRepeatCount:
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
	ldr	r3, [r0]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #24]
	ldmccfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SetFrmRepeatCount.part.1
	UNWIND(.fnend)
	.size	SetFrmRepeatCount, .-SetFrmRepeatCount
	.align	2
	.global	SplitFrmToFlds
	.type	SplitFrmToFlds, %function
SplitFrmToFlds:
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
	ldrb	lr, [r0, #721]	@ zero_extendqisi2
	mov	r5, #1
	ldrb	ip, [r0, #722]	@ zero_extendqisi2
	mov	r4, #2
	ldr	r1, [r0, #736]
	ldr	r2, [r0, #740]
	ldr	r3, [r0, #756]
	strb	r5, [r0, #760]
	strb	r4, [r0, #800]
	strb	lr, [r0, #761]
	strb	lr, [r0, #801]
	strb	ip, [r0, #762]
	strb	ip, [r0, #802]
	str	r1, [r0, #776]
	str	r1, [r0, #816]
	str	r2, [r0, #780]
	str	r2, [r0, #820]
	str	r3, [r0, #796]
	str	r3, [r0, #836]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	SplitFrmToFlds, .-SplitFrmToFlds
	.align	2
	.global	CombineFldsToFrm
	.type	CombineFldsToFrm, %function
CombineFldsToFrm:
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
	ldr	r2, [r0, #812]
	mov	lr, #3
	ldr	r1, [r0, #772]
	ldr	r3, [r0, #816]
	cmp	r2, r1
	ldr	r5, [r0, #776]
	ldrb	r4, [r0, #801]	@ zero_extendqisi2
	ldr	ip, [r0, #796]
	movge	r2, r1
	add	r3, r3, r5
	cmp	r4, #0
	strb	lr, [r0, #720]
	mov	r3, r3, lsr #1
	str	ip, [r0, #756]
	str	r2, [r0, #732]
	str	r2, [r0, #688]
	str	r3, [r0, #736]
	beq	.L516
	ldrb	r2, [r0, #761]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L517
.L516:
	ldr	r2, [r0, #800]
	mov	r1, #0
	strb	r1, [r0, #721]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, r1
	beq	.L523
	ldr	r2, [r0, #760]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	movne	r1, #1
	beq	.L523
.L519:
	ldr	r2, [r0, #780]
	strb	r1, [r0, #722]
	cmp	r2, #0
	beq	.L521
	ldr	r1, [r0, #820]
	cmp	r1, #0
	moveq	r2, r1
	beq	.L521
	cmp	r2, r1
	movcc	r2, r1
.L521:
	str	r2, [r0, #740]
	str	r2, [r0, #700]
	str	r3, [r0, #704]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L517:
	mov	r1, #1
	strb	r1, [r0, #721]
.L523:
	mov	r1, #0
	b	.L519
	UNWIND(.fnend)
	.size	CombineFldsToFrm, .-CombineFldsToFrm
	.align	2
	.global	GetAPC
	.type	GetAPC, %function
GetAPC:
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
	subs	r7, r1, #0
	mov	r5, r0
	beq	.L557
	cmp	r2, #1
	beq	.L538
	cmp	r2, #2
	beq	.L539
	ldr	r8, [r7, #772]
	ldr	r9, [r7, #812]
.L540:
	add	r6, r5, #24576
	ldr	ip, [r6, #2420]
	cmp	ip, #0
	beq	.L549
	ldr	r4, [r6, #2164]
	cmp	r4, #0
	addne	r3, r5, #26624
	movne	r4, #0
	addne	r3, r3, #116
	bne	.L543
	b	.L541
.L547:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	beq	.L541
.L543:
	add	r4, r4, #1
	cmp	r4, ip
	bne	.L547
.L549:
	mvn	r0, #0
.L553:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L539:
	ldr	r8, [r7, #812]
	mov	r9, r8
	b	.L540
.L541:
	add	r3, r5, #61440
	ldr	r1, [r7, #672]
	ldr	r0, [r3, #3520]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L544
	ldr	r3, [r0, #680]
	cmp	r3, #0
	beq	.L544
	add	r5, r5, r4, lsl #2
	mov	r3, #1
	add	r5, r5, #24576
	ldr	r1, .L558
	str	r3, [r5, #2164]
	ldr	r3, [r0, #680]
	mov	r0, #13
	ldr	r3, [r3, #8]
	str	r8, [r5, #2292]
	str	r9, [r5, #2356]
	str	r3, [r5, #2228]
	ldr	r3, [r6, #2424]
	cmp	r3, #15
	addls	r3, r3, #1
	movhi	r3, #16
	str	r3, [r6, #2424]
	mov	r3, r4
	ldr	r2, [r7, #188]
	bl	dprint_vfmw
	mov	r0, #0
	str	r4, [r7, #712]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L538:
	ldr	r8, [r7, #772]
	mov	r9, r8
	b	.L540
.L544:
	mov	r1, #0
	ldr	r2, [r7, #672]
	ldrb	r3, [r7, #2]	@ zero_extendqisi2
	stmia	sp, {r0, r1}
	mov	r0, r1
	ldr	r1, .L558+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L553
.L557:
	mov	r0, r7
	movw	r3, #2250
	ldr	r2, .L558+8
	ldr	r1, .L558+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L553
.L559:
	.align	2
.L558:
	.word	.LC22
	.word	.LC23
	.word	.LC20
	.word	.LC21
	UNWIND(.fnend)
	.size	GetAPC, .-GetAPC
	.align	2
	.global	SlidingWinMark
	.type	SlidingWinMark, %function
SlidingWinMark:
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
	add	r2, r0, #24576
	add	r3, r0, #16384
	ldr	r1, [r2, #2156]
	ldr	r3, [r3, #456]
	ldr	r2, [r2, #2152]
	rsb	r3, r1, r3
	cmp	r2, r3
	ldmnefd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	SlidingWinMark.part.2
	UNWIND(.fnend)
	.size	SlidingWinMark, .-SlidingWinMark
	.align	2
	.global	DumpDPB
	.type	DumpDPB, %function
DumpDPB:
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
	ldr	r3, .L572
	mov	r5, r0
	ldr	r3, [r3]
	tst	r3, #16384
	beq	.L562
	add	r6, r0, #24576
	ldr	r3, [r6, #2148]
	cmp	r3, #0
	addne	r7, r0, #26368
	movne	r4, #0
	addne	r7, r7, #156
	beq	.L568
.L567:
	ldr	ip, [r7, #4]!
	mov	r2, r4
	ldr	r1, .L572+4
	mov	r0, #14
	add	r4, r4, #1
	ldrb	lr, [ip, #2]	@ zero_extendqisi2
	ldr	r3, [ip, #676]
	str	lr, [sp, #4]
	ldr	ip, [ip, #688]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r6, #2148]
	cmp	r3, r4
	bhi	.L567
.L568:
	ldr	r1, .L572+8
	mov	r0, #14
	bl	dprint_vfmw
	ldr	r3, [r6, #2152]
	cmp	r3, #0
	addne	r5, r5, #26368
	movne	r4, #0
	addne	r5, r5, #220
	beq	.L566
.L569:
	ldr	ip, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L572+12
	mov	r0, #14
	ldrb	lr, [ip, #2]	@ zero_extendqisi2
	ldr	r3, [ip, #676]
	str	lr, [sp, #4]
	ldr	ip, [ip, #688]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r5]
	mov	r2, r4
	ldr	r1, .L572+16
	mov	r0, #14
	add	r4, r4, #1
	ldr	r3, [r3, #732]
	bl	dprint_vfmw
	ldr	r3, [r6, #2152]
	cmp	r3, r4
	bhi	.L569
.L566:
	ldr	r1, .L572+8
	mov	r0, #14
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L562:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L573:
	.align	2
.L572:
	.word	g_PrintEnable
	.word	.LC24
	.word	.LC2
	.word	.LC25
	.word	.LC26
	UNWIND(.fnend)
	.size	DumpDPB, .-DumpDPB
	.align	2
	.global	UpdateCurrFrameInfo
	.type	UpdateCurrFrameInfo, %function
UpdateCurrFrameInfo:
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
	add	ip, r0, #57344
	add	r3, r0, #61440
	ldrb	r2, [ip, #3978]	@ zero_extendqisi2
	ldr	r4, [r3, #560]
	strb	r2, [r4]
	ldrb	r2, [ip, #3980]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
	bne	.L575
	ldrb	r2, [ip, #3981]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
.L575:
	strb	r2, [r4, #2]
	ldr	r2, [r3, #568]
	str	r2, [r4, #676]
	ldr	r2, [r3, #604]
	str	r2, [r4, #704]
	ldr	r2, [r3, #596]
	str	r2, [r4, #700]
	ldr	r2, [r3, #580]
	str	r2, [r4, #688]
	ldr	r2, [r3, #628]
	str	r2, [r4, #708]
	ldr	r2, [r3, #572]
	str	r2, [r4, #684]
	ldrb	r2, [ip, #3985]	@ zero_extendqisi2
	str	r2, [r4, #696]
	ldrb	r2, [ip, #3983]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r1, #3
	movne	r1, #0
	strb	r1, [r4, #3]
	ldrb	r2, [ip, #3979]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L578
	bcc	.L579
	cmp	r2, #2
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	str	r4, [r4, #836]
	mov	r0, #1
	strb	r0, [r4, #800]
	mov	r6, #0
	ldrb	r0, [ip, #3980]	@ zero_extendqisi2
	strb	r0, [r4, #801]
	ldrb	r0, [ip, #3981]	@ zero_extendqisi2
	strb	r0, [r4, #802]
	ldr	r0, [r3, #588]
	str	r0, [r4, #812]
	ldr	lr, [r3, #596]
	str	lr, [r4, #820]
	ldr	r0, [r3, #604]
	str	r6, [r4, #696]
	str	r0, [r4, #816]
	ldrb	r5, [ip, #3977]	@ zero_extendqisi2
	cmp	r5, r6
	beq	.L596
	ldr	r2, [r4, #776]
	add	ip, ip, #4608
	mov	r5, #3
	strb	r5, [r4, #1]
	add	r0, r0, r2
	str	r0, [r4, #704]
	str	r0, [r4, #736]
	mvn	r7, #0
	ldrb	r2, [ip, #-625]	@ zero_extendqisi2
	add	ip, ip, #32
	cmp	r2, #1
	orreq	r6, r1, #2
	strb	r6, [r4, #3]
	ldrd	r8, [ip, #-8]
	mvn	r6, #0
	cmp	r9, r7
	cmpeq	r8, r6
	beq	.L587
	add	r2, r4, #656
	ldrd	r0, [r2, #-8]
	cmp	r1, r7
	cmpeq	r0, r6
	beq	.L597
.L587:
	ldr	r2, [r4, #780]
.L594:
	cmp	r2, lr
	mov	r0, r4
	movcc	r2, lr
	str	r2, [r4, #700]
	ldr	r3, [r3, #580]
	str	r3, [r4, #688]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	CombineFldsToFrm
.L579:
	str	r4, [r4, #756]
	mov	r1, #3
	mov	r2, #0
	strb	r1, [r4, #1]
	strb	r2, [r4, #720]
	add	r1, ip, #3984
	ldrb	r5, [ip, #3980]	@ zero_extendqisi2
	mov	r2, #664
	add	r1, r1, #8
	add	r0, r4, #8
	strb	r5, [r4, #721]
	ldrb	r6, [ip, #3981]	@ zero_extendqisi2
	strb	r6, [r4, #722]
	ldr	ip, [r3, #584]
	str	ip, [r4, #732]
	ldr	r7, [r3, #596]
	str	r7, [r4, #740]
	ldr	r8, [r3, #604]
	str	r8, [r4, #736]
	ldr	ip, [r3, #588]
	str	ip, [r4, #772]
	ldr	r3, [r3, #592]
	str	r3, [r4, #812]
	bl	memcpy
	mov	r2, #1
	mov	r3, #2
	str	r8, [r4, #776]
	str	r8, [r4, #816]
	str	r7, [r4, #780]
	str	r7, [r4, #820]
	strb	r6, [r4, #762]
	strb	r6, [r4, #802]
	strb	r5, [r4, #761]
	strb	r5, [r4, #801]
	str	r4, [r4, #796]
	str	r4, [r4, #836]
	strb	r2, [r4, #760]
	strb	r3, [r4, #800]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L578:
	strb	r2, [r4, #760]
	mov	r5, #0
	str	r4, [r4, #796]
	ldrb	r0, [ip, #3980]	@ zero_extendqisi2
	strb	r0, [r4, #761]
	ldrb	r0, [ip, #3981]	@ zero_extendqisi2
	strb	r0, [r4, #762]
	ldr	r0, [r3, #588]
	str	r0, [r4, #772]
	ldr	lr, [r3, #596]
	str	lr, [r4, #780]
	ldr	r0, [r3, #604]
	str	r5, [r4, #696]
	str	r0, [r4, #776]
	ldrb	r6, [ip, #3977]	@ zero_extendqisi2
	cmp	r6, r5
	beq	.L598
	ldr	r2, [r4, #816]
	mov	r6, #3
	add	ip, ip, #4608
	strb	r6, [r4, #1]
	add	r0, r0, r2
	str	r0, [r4, #704]
	str	r0, [r4, #736]
	mvn	r7, #0
	ldrb	r2, [ip, #-625]	@ zero_extendqisi2
	add	ip, ip, #32
	mvn	r6, #0
	cmp	r2, #1
	orreq	r5, r1, #1
	strb	r5, [r4, #3]
	ldrd	r8, [ip, #-8]
	cmp	r9, r7
	cmpeq	r8, r6
	beq	.L583
	add	r2, r4, #656
	ldrd	r0, [r2, #-8]
	cmp	r1, r7
	cmpeq	r0, r6
	streqd	r8, [r2, #-8]
.L583:
	ldr	r2, [r4, #820]
	b	.L594
.L596:
	strb	r2, [r4, #1]
	add	r1, ip, #3984
	str	r0, [r4, #704]
	add	r1, r1, #8
	str	r0, [r4, #736]
	mov	r2, #664
	ldrb	r3, [ip, #3983]	@ zero_extendqisi2
	add	r0, r4, #8
	cmp	r3, #1
	moveq	r5, #2
	strb	r5, [r4, #3]
	bl	memcpy
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L598:
	strb	r2, [r4, #1]
	add	r1, ip, #3984
	str	r0, [r4, #704]
	add	r1, r1, #8
	str	r0, [r4, #736]
	mov	r2, #664
	ldrb	r3, [ip, #3983]	@ zero_extendqisi2
	add	r0, r4, #8
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r4, #3]
	bl	memcpy
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L597:
	strd	r8, [r2, #-8]
	b	.L587
	UNWIND(.fnend)
	.size	UpdateCurrFrameInfo, .-UpdateCurrFrameInfo
	.align	2
	.global	SimpleSlideDPB
	.type	SimpleSlideDPB, %function
SimpleSlideDPB:
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
	add	r3, r0, #24576
	mov	r4, r0
	ldr	r1, [r3, #2148]
	ldr	r2, [r3, #2144]
	cmp	r1, r2
	bcs	.L605
.L600:
	add	r3, r4, #57344
	add	r4, r4, #61440
	mov	r2, #0
	strb	r2, [r3, #3980]
	ldr	r2, [r4, #576]
	cmp	r2, #0
	movne	r2, #1
	strneb	r2, [r3, #3981]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L605:
	ldr	r1, [r3, #1952]
	bl	UnMarkFrameStoreRef
	mov	r1, #0
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB
	b	.L600
	UNWIND(.fnend)
	.size	SimpleSlideDPB, .-SimpleSlideDPB
	.align	2
	.global	ReleaseNAL
	.type	ReleaseNAL, %function
ReleaseNAL:
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
	subs	r5, r1, #0
	mov	r6, r0
	beq	.L614
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	strb	r3, [r5, #1]
	strb	r3, [r5, #4]
.L609:
	ldr	r3, [r4, #8]
	mov	r0, r6
	cmp	r3, #0
	beq	.L608
	ldr	r1, [r4, #32]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	mov	r0, #7
	ldr	r1, .L615
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #8]
	str	r3, [r4, #24]
	str	r3, [r4, #12]
.L608:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L609
	mov	r3, #0
	strb	r3, [r5]
	str	r3, [r5, #68]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L614:
	mov	r0, r5
	movw	r3, #4252
	ldr	r2, .L615+4
	ldr	r1, .L615+8
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L616:
	.align	2
.L615:
	.word	.LC27
	.word	.LC20
	.word	.LC21
	UNWIND(.fnend)
	.size	ReleaseNAL, .-ReleaseNAL
	.align	2
	.global	ClearCurrNal
	.type	ClearCurrNal, %function
ClearCurrNal:
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
	ldr	r1, [r0, #368]
	mov	r4, r0
	cmp	r1, #0
	beq	.L618
	add	r3, r0, #61440
	ldr	r0, [r3, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #368]
.L618:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	ClearCurrNal, .-ClearCurrNal
	.align	2
	.global	ClearCurrSlice
	.type	ClearCurrSlice, %function
ClearCurrSlice:
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
	ldr	r1, .L627
	mov	r5, r0
	mov	r0, #1
	add	r4, r5, #61440
	bl	dprint_vfmw
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L623
	ldr	r0, [r4, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L623:
	ldr	r3, [r4, #3476]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #3476]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L628:
	.align	2
.L627:
	.word	.LC28
	UNWIND(.fnend)
	.size	ClearCurrSlice, .-ClearCurrSlice
	.align	2
	.global	ClearAllNal
	.type	ClearAllNal, %function
ClearAllNal:
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
	add	r5, r0, #13504
	add	r4, r0, #376
	add	r5, r5, #24
	add	r6, r0, #61440
	b	.L631
.L630:
	add	r4, r4, #96
	cmp	r4, r5
	beq	.L633
.L631:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L630
	mov	r1, r4
	ldr	r0, [r6, #3520]
	add	r4, r4, #96
	bl	ReleaseNAL
	cmp	r4, r5
	bne	.L631
.L633:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	ClearAllNal, .-ClearAllNal
	.align	2
	.global	ClearAllSlice
	.type	ClearAllSlice, %function
ClearAllSlice:
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
	add	r4, r0, #62720
	add	r5, r0, #63232
	add	r4, r4, #164
	add	r5, r5, #196
	add	r6, r0, #61440
	mov	r7, #0
.L636:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L635
	ldr	r0, [r6, #3520]
	bl	ReleaseNAL
	str	r7, [r4]
.L635:
	cmp	r4, r5
	bne	.L636
	mov	r0, #0
	str	r0, [r6, #3444]
	str	r0, [r6, #3504]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	ClearAllSlice, .-ClearAllSlice
	.align	2
	.global	H264_ClearCurrPic
	.type	H264_ClearCurrPic, %function
H264_ClearCurrPic:
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
	mov	r4, r0
	bl	ClearAllSlice
	add	r0, r4, #12288
	add	r3, r4, #20480
	mov	r2, #0
	movw	r1, #23352
	ldr	r0, [r0, #1292]
	movt	r1, 1
	mov	ip, #2
	str	r1, [r3, #1872]
	strb	ip, [r3, #1857]
	mov	r1, #7
	str	r0, [r3, #1864]
	mov	r0, #32
	str	r1, [r3, #1868]
	mov	r1, #3
	strb	r0, [r3, #1858]
	mvn	r0, #0
	str	r1, [r3, #1880]
	mov	r1, #262144
	str	r0, [r3, #1884]
	mov	r0, r2
	str	r1, [r3, #1896]
	strb	r2, [r3, #1856]
	str	r2, [r3, #1888]
	str	r2, [r3, #1892]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	H264_ClearCurrPic, .-H264_ClearCurrPic
	.align	2
	.global	H264_ArrangeVahbMem
	.type	H264_ArrangeVahbMem, %function
H264_ArrangeVahbMem:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	sub	r4, r1, #32
	sub	r3, r2, #32
	movw	ip, #8160
	cmp	r3, ip
	cmpls	r4, ip
	mov	r5, r1
	mov	r6, r2
	mov	r7, r0
	movhi	r4, #1
	movls	r4, #0
	bhi	.L653
	ldr	r3, .L656
	mov	r2, #32
	mov	r1, r4
	sub	r0, fp, #68
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r7]
	str	r6, [fp, #-40]
	strb	r4, [fp, #-68]
	ldr	r3, [r3, #28]
	strb	r4, [fp, #-67]
	cmp	r3, #24
	str	r5, [fp, #-60]
	str	r6, [fp, #-56]
	str	r5, [fp, #-52]
	str	r6, [fp, #-48]
	str	r5, [fp, #-44]
	beq	.L645
	add	r2, r7, #24576
	ldrb	r3, [fp, #4]	@ zero_extendqisi2
	mov	r1, #5
	strb	r4, [fp, #-64]
	ldr	r2, [r2, #2144]
	strb	r1, [fp, #-63]
	add	r2, r2, #1
	strb	r2, [fp, #-65]
.L651:
	cmp	r6, #63
	cmphi	r5, #63
	mov	r0, #0
	strb	r3, [fp, #-62]
	movls	r8, #1
	movhi	r8, #0
	strb	r0, [fp, #-66]
	bls	.L654
	add	r4, r7, #61440
	sub	r1, fp, #68
	ldr	r0, [r4, #3520]
	bl	FSP_ConfigInstance
	cmp	r0, #0
	bne	.L647
	ldr	r1, [r7]
	sub	r3, fp, #72
	ldr	r0, [r4, #3520]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L655
	cmp	r0, #0
	moveq	r0, #1
	bne	.L649
.L652:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L645:
	mov	r3, #1
	mov	r2, #5
	strb	r4, [fp, #-64]
	strb	r3, [fp, #-65]
	strb	r2, [fp, #-63]
	b	.L651
.L655:
	add	r0, r7, #8
	bl	ResetVoQueue
.L649:
	ldr	r1, .L656+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L652
.L653:
	mov	r3, r2
	mov	r0, #0
	mov	r2, r1
	ldr	r1, .L656+8
	bl	dprint_vfmw
	mvn	r0, #19
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L654:
	mov	r3, r6
	mov	r2, r5
	ldr	r1, .L656+12
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L652
.L647:
	mov	r0, r8
	ldr	r1, .L656+16
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L652
.L657:
	.align	2
.L656:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC31
	.word	.LC29
	.word	.LC30
	.word	.LC32
	UNWIND(.fnend)
	.size	H264_ArrangeVahbMem, .-H264_ArrangeVahbMem
	.align	2
	.global	RepairList
	.type	RepairList, %function
RepairList:
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
	add	r3, r0, #20480
	mov	r4, r0
	ldrb	r2, [r3, #208]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L660
	bcc	.L675
	cmp	r2, #2
	bne	.L684
.L676:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L684:
	ldr	r1, .L688
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L675:
	mov	r6, #1
.L661:
	add	r0, r4, #20480
	add	lr, r4, #26880
	add	r0, r0, #248
	mov	r5, #0
	add	lr, lr, #252
	add	r7, r4, #61440
	ldr	r3, [r0, #4]!
	mov	r2, r5
	mov	r8, #1
	cmp	r3, #0
	beq	.L663
.L686:
	ldr	r10, [lr]
	cmp	r10, #0
	bne	.L677
	mov	ip, lr
	mov	r1, r10
	b	.L665
.L666:
	ldr	r9, [ip, #4]!
	cmp	r9, #0
	bne	.L664
.L665:
	add	r1, r1, #1
	cmp	r1, r3
	bne	.L666
	ldr	r1, [r4]
	ldr	r1, [r1, #12]
	cmp	r1, #2
	bne	.L685
	ldr	r5, [r7, #560]
	add	r5, r5, #720
.L668:
	mov	r9, r10
	mov	ip, lr
	mov	r1, #0
	b	.L674
.L670:
	ldr	r9, [ip, #4]!
.L674:
	add	r1, r1, #1
	cmp	r9, #0
	streq	r5, [ip]
	cmp	r1, r3
	bne	.L670
	add	r2, r2, #1
	add	lr, lr, #132
	cmp	r6, r2
	bls	.L676
.L683:
	ldr	r3, [r0, #4]!
	cmp	r3, #0
	bne	.L686
.L663:
	ldr	r1, [r4]
	ldr	r1, [r1, #12]
	cmp	r1, #2
	bne	.L687
	add	r2, r2, #1
	str	r8, [r0]
	cmp	r6, r2
	ldr	r3, [r7, #560]
	add	lr, lr, #132
	add	r3, r3, #720
	str	r3, [lr, #-132]
	bhi	.L683
	b	.L676
.L677:
	mov	r9, r10
.L664:
	mov	r5, r9
	b	.L668
.L660:
	mov	r6, #2
	b	.L661
.L687:
	ldr	r1, .L688+4
.L681:
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L685:
	mov	r2, r5
	mov	r3, #0
	ldr	r1, .L688+8
	b	.L681
.L689:
	.align	2
.L688:
	.word	.LC33
	.word	.LC35
	.word	.LC34
	UNWIND(.fnend)
	.size	RepairList, .-RepairList
	.align	2
	.global	GetShortTermPicPoint
	.type	GetShortTermPicPoint, %function
GetShortTermPicPoint:
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
	add	r3, r0, #20480
	ldrb	r4, [r3, #209]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L691
	ldrb	r3, [r3, #210]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r4, #2
	moveq	r4, #1
.L691:
	add	r3, r0, #24576
	ldr	r5, [r3, #2152]
	cmp	r5, #0
	beq	.L699
	add	r3, r0, #26368
	mov	r2, #0
	add	r3, r3, #224
	b	.L696
.L709:
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L707
.L694:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L708
.L696:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L709
	ldrb	lr, [r0, #2]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L695
	ldr	ip, [r0, #760]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	beq	.L710
.L695:
	tst	lr, #2
	beq	.L694
	ldr	ip, [r0, #800]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L694
	ldr	ip, [r0, #808]
	cmp	ip, r1
	bne	.L694
	add	r0, r0, #800
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L707:
	ldr	ip, [r0, #720]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L694
	ldr	ip, [r0, #728]
	cmp	ip, r1
	bne	.L694
	add	r0, r0, #720
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L710:
	ldr	ip, [r0, #768]
	cmp	ip, r1
	bne	.L695
	add	r0, r0, #760
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L708:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L699:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetShortTermPicPoint, .-GetShortTermPicPoint
	.align	2
	.global	GetLongTermPicPoint
	.type	GetLongTermPicPoint, %function
GetLongTermPicPoint:
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
	add	r3, r0, #20480
	ldrb	r4, [r3, #209]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L712
	ldrb	r3, [r3, #210]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r4, #2
	moveq	r4, #1
.L712:
	add	r3, r0, #24576
	ldr	r5, [r3, #2156]
	cmp	r5, #0
	beq	.L720
	add	r3, r0, #26624
	mov	r2, #0
	add	r3, r3, #32
	b	.L717
.L730:
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L728
.L715:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L729
.L717:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L730
	ldrb	lr, [r0, #2]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L716
	ldr	ip, [r0, #760]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	beq	.L731
.L716:
	tst	lr, #2
	beq	.L715
	ldr	ip, [r0, #800]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L715
	ldr	ip, [r0, #804]
	cmp	ip, r1
	bne	.L715
	add	r0, r0, #800
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L728:
	ldr	ip, [r0, #720]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L715
	ldr	ip, [r0, #724]
	cmp	ip, r1
	bne	.L715
	add	r0, r0, #720
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L731:
	ldr	ip, [r0, #764]
	cmp	ip, r1
	bne	.L716
	add	r0, r0, #760
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L729:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L720:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetLongTermPicPoint, .-GetLongTermPicPoint
	.align	2
	.global	ReorderSTList
	.type	ReorderSTList, %function
ReorderSTList:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r7, [fp, #4]
	mov	r5, r1
	mov	r1, r3
	mov	r8, r2
	mov	r6, r3
	bl	GetShortTermPicPoint
	ldr	r4, [r7]
	add	r2, r8, #1
	cmp	r2, r4
	ble	.L733
	add	lr, r5, r2, lsl #2
	mov	ip, r2
.L734:
	ldr	r3, [lr, #-4]!
	sub	ip, ip, #1
	str	r3, [lr, #4]
	ldr	r4, [r7]
	cmp	r4, ip
	blt	.L734
.L733:
	add	r3, r4, #1
	str	r3, [r7]
	str	r0, [r5, r4, asl #2]
	ldr	ip, [r7]
	cmp	r2, ip
	ldmltfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r2, r8, #2
	add	r4, r5, ip, lsl #2
	mov	lr, ip
.L738:
	ldr	r0, [r4], #4
	add	ip, ip, #1
	cmp	r0, #0
	beq	.L736
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L737
	ldr	r3, [r0, #8]
	cmp	r3, r6
	beq	.L736
.L737:
	str	r0, [r5, lr, asl #2]
	add	lr, lr, #1
.L736:
	cmp	ip, r2
	bne	.L738
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	ReorderSTList, .-ReorderSTList
	.align	2
	.global	ReorderLTList
	.type	ReorderLTList, %function
ReorderLTList:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r7, [fp, #4]
	mov	r5, r1
	mov	r1, r3
	mov	r8, r2
	mov	r6, r3
	bl	GetLongTermPicPoint
	ldr	r4, [r7]
	add	r2, r8, #1
	cmp	r2, r4
	ble	.L746
	add	lr, r5, r2, lsl #2
	mov	ip, r2
.L747:
	ldr	r3, [lr, #-4]!
	sub	ip, ip, #1
	str	r3, [lr, #4]
	ldr	r4, [r7]
	cmp	r4, ip
	blt	.L747
.L746:
	add	r3, r4, #1
	str	r3, [r7]
	str	r0, [r5, r4, asl #2]
	ldr	ip, [r7]
	cmp	r2, ip
	ldmltfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r2, r8, #2
	add	r4, r5, ip, lsl #2
	mov	lr, ip
.L751:
	ldr	r0, [r4], #4
	add	ip, ip, #1
	cmp	r0, #0
	beq	.L749
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L750
	ldr	r3, [r0, #4]
	cmp	r3, r6
	beq	.L749
.L750:
	str	r0, [r5, lr, asl #2]
	add	lr, lr, #1
.L749:
	cmp	ip, r2
	bne	.L751
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	ReorderLTList, .-ReorderLTList
	.align	2
	.global	ReorderRefPiclist
	.type	ReorderRefPiclist, %function
ReorderRefPiclist:
	UNWIND(.fnstart)
	@ args = 12, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	add	r2, r0, #20480
	str	r1, [fp, #-56]
	mov	r8, r3
	ldrb	r1, [r2, #209]	@ zero_extendqisi2
	mov	r3, #0
	mov	r7, r0
	str	r3, [fp, #-48]
	cmp	r1, r3
	ldr	ip, [fp, #4]
	add	r3, r0, #12288
	beq	.L762
	ldr	lr, [r2, #220]
	mov	r4, #2208
	ldr	r5, [r3, #1304]
	mov	r0, #4000
	ldr	r6, [r2, #228]
	mov	r1, #2
	ldr	r3, [r3, #1300]
	mla	r2, r4, lr, r5
	mov	lr, r6, asl #1
	add	lr, lr, #1
	str	lr, [fp, #-64]
	ldr	r2, [r2, #28]
	mla	r3, r0, r2, r3
	ldr	r3, [r3, #2196]
	add	r3, r3, #4
	mov	r3, r1, asl r3
	str	r3, [fp, #-60]
.L772:
	adds	r9, r8, #2
	beq	.L761
	ldr	r3, [ip]
	cmp	r3, #3
	beq	.L761
	mov	r2, r8
	ldr	r6, [fp, #8]
	ldr	r5, [fp, #-64]
	mov	r4, #0
	mov	r8, ip
	mov	r10, r2
	b	.L765
.L766:
	ldr	r3, [fp, #12]
	sub	r1, fp, #48
	mov	r2, r10
	mov	r0, r7
	ldr	r3, [r3, r4, asl #2]
	add	r4, r4, #1
	str	r1, [sp]
	ldr	r1, [fp, #-56]
	bl	ReorderLTList
	cmp	r4, r9
	beq	.L761
.L771:
	ldr	r3, [r8, #4]!
	add	r6, r6, #4
	cmp	r3, #3
	beq	.L761
.L765:
	cmp	r3, #1
	bhi	.L766
	cmp	r3, #0
	ldr	r3, [r6]
	bne	.L767
	mvn	r3, r3
	adds	r5, r5, r3
	ldrmi	r3, [fp, #-60]
	addmi	r5, r5, r3
.L768:
	ldr	r3, [fp, #-64]
	sub	r2, fp, #48
	ldr	r1, [fp, #-56]
	mov	r0, r7
	cmp	r3, r5
	str	r2, [sp]
	add	r4, r4, #1
	mov	r2, r10
	ldrlt	r3, [fp, #-60]
	movge	r3, r5
	rsblt	r3, r3, r5
	bl	ReorderSTList
	cmp	r4, r9
	bne	.L771
.L761:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L767:
	add	r3, r3, #1
	add	r5, r5, r3
	ldr	r3, [fp, #-60]
	cmp	r3, r5
	rsble	r5, r3, r5
	b	.L768
.L762:
	ldr	r1, [r2, #220]
	mov	r4, #2208
	ldr	r5, [r3, #1304]
	mov	lr, #4000
	ldr	r2, [r2, #228]
	mov	r0, #1
	ldr	r3, [r3, #1300]
	mla	r1, r4, r1, r5
	str	r2, [fp, #-64]
	ldr	r2, [r1, #28]
	mla	r3, lr, r2, r3
	ldr	r3, [r3, #2196]
	add	r3, r3, #4
	mov	r3, r0, asl r3
	str	r3, [fp, #-60]
	b	.L772
	UNWIND(.fnend)
	.size	ReorderRefPiclist, .-ReorderRefPiclist
	.align	2
	.global	ReorderListX
	.type	ReorderListX, %function
ReorderListX:
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
	UNWIND(.pad #16)
	sub	sp, sp, #16
	add	r4, r0, #20480
	mov	r5, r0
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L780
	add	r6, r0, #16384
	ldrb	r2, [r6, #3512]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L792
.L783:
	cmp	r3, #1
	ldr	r3, [r4, #264]
	add	r3, r3, #1
	str	r3, [r4, #252]
	bne	.L780
	ldrb	r3, [r6, #3513]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L793
.L785:
	ldr	r3, [r4, #268]
	add	r3, r3, #1
	str	r3, [r4, #256]
.L780:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L792:
	add	r7, r0, #20224
	add	lr, r0, #19968
	add	ip, r0, #19712
	add	r1, r0, #26880
	ldr	r3, [r4, #264]
	add	lr, lr, #196
	add	ip, ip, #188
	add	r7, r7, #204
	stmia	sp, {ip, lr}
	add	r2, r4, #252
	str	r7, [sp, #8]
	add	r1, r1, #252
	bl	ReorderRefPiclist
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	b	.L783
.L793:
	add	ip, r5, #20480
	add	r0, r5, #20224
	add	r2, r5, #19968
	add	r1, r5, #27136
	ldr	r3, [r4, #268]
	add	ip, ip, #76
	add	r0, r0, #72
	add	r2, r2, #64
	stmib	sp, {r0, ip}
	add	r1, r1, #128
	str	r2, [sp]
	mov	r0, r5
	add	r2, r5, #20736
	bl	ReorderRefPiclist
	b	.L785
	UNWIND(.fnend)
	.size	ReorderListX, .-ReorderListX
	.align	2
	.global	GenPiclistfromFrmlist
	.type	GenPiclistfromFrmlist, %function
GenPiclistfromFrmlist:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 8
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
	cmp	r2, #31
	ldr	r6, [fp, #8]
	mov	r7, r1
	ldr	lr, .L857
	movcc	r4, r2
	ldr	ip, .L857+4
	movcs	r4, #31
	cmp	r6, #0
	str	r3, [fp, #-52]
	movne	r6, lr
	moveq	r6, ip
	cmp	r0, #1
	moveq	r5, #0
	moveq	r10, r5
	beq	.L797
	cmp	r0, #2
	moveq	r5, #0
	moveq	r10, r5
	bne	.L805
.L806:
	cmp	r10, r4
	movcs	r3, #0
	movcc	r3, #1
	cmp	r5, r4
	str	r3, [fp, #-48]
	movcs	r2, #0
	movcc	r2, #1
	orrs	r3, r2, r3
	beq	.L805
	cmp	r2, #0
	beq	.L811
	add	r8, r7, r5, lsl #2
	b	.L810
.L807:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L811
.L810:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	tst	ip, #2
	beq	.L807
	add	r0, r0, #800
	blx	r6
	cmp	r0, #0
	beq	.L807
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r0, [r3]
	add	r2, r2, #800
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L811:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r10, lsl #2
	bne	.L813
	b	.L806
.L812:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L806
.L813:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r2, [r0, #1]	@ zero_extendqisi2
	tst	r2, #1
	beq	.L812
	add	r0, r0, #760
	blx	r6
	cmp	r0, #0
	beq	.L812
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r9]
	ldr	r0, [r3]
	add	r2, r2, #760
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	b	.L806
.L856:
	add	r0, r0, #760
	blx	r6
	cmp	r0, #0
	beq	.L798
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r8]
	ldr	r0, [r3]
	add	r2, r2, #760
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L802:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r5, lsl #2
	bne	.L804
	b	.L797
.L803:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L797
.L804:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r2, [r0, #1]	@ zero_extendqisi2
	tst	r2, #2
	beq	.L803
	add	r0, r0, #800
	blx	r6
	cmp	r0, #0
	beq	.L803
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r0, [r3]
	add	r2, r2, #800
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L797:
	cmp	r10, r4
	movcs	r2, #0
	movcc	r2, #1
	cmp	r5, r4
	movcs	r3, #0
	movcc	r3, #1
	str	r3, [fp, #-48]
	orrs	r3, r3, r2
	beq	.L805
	cmp	r2, #0
	beq	.L802
	add	r9, r7, r10, lsl #2
	b	.L801
.L798:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L802
.L801:
	mov	r8, r9
	ldr	r0, [r9], #4
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L798
	b	.L856
.L805:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L858:
	.align	2
.L857:
	.word	IsLTRefFlg
	.word	IsSTRefFlg
	UNWIND(.fnend)
	.size	GenPiclistfromFrmlist, .-GenPiclistfromFrmlist
	.align	2
	.global	InitListX
	.type	InitListX, %function
InitListX:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #220)
	sub	sp, sp, #220
	add	r6, r0, #20480
	mov	r4, r0
	ldrb	r3, [r6, #208]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L860
	add	r2, r0, #57344
	str	r2, [fp, #-244]
	ldrb	r7, [r2, #3979]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L984
	add	r3, r0, #24576
	str	r3, [fp, #-240]
	ldr	ip, [r3, #2152]
	cmp	ip, #0
	beq	.L927
	add	r1, r0, #26368
	mov	r3, r7
	add	r1, r1, #220
	b	.L866
.L865:
	cmp	r3, ip
	beq	.L864
.L866:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L865
	ldr	r0, [r2, #720]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	bne	.L865
	add	r0, r7, #6720
	cmp	r3, ip
	add	r0, r0, #62
	add	r2, r2, #720
	add	r7, r7, #1
	add	r0, r4, r0, lsl #2
	str	r2, [r0, #4]
	bne	.L866
.L864:
	add	r0, r4, #26880
	ldr	r3, .L992
	mov	r1, r7
	add	r0, r0, #252
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	str	r7, [r6, #252]
	ldr	r1, [r3, #2156]
	cmp	r1, #0
	beq	.L928
	add	r0, r4, #26624
	mov	r5, r7
	add	r0, r0, #28
	mov	r3, #0
	b	.L869
.L868:
	cmp	r3, r1
	beq	.L985
.L869:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L868
	ldr	ip, [r2, #720]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L868
	add	ip, r5, #6720
	cmp	r3, r1
	add	ip, ip, #62
	add	r2, r2, #720
	add	r5, r5, #1
	add	ip, r4, ip, lsl #2
	str	r2, [ip, #4]
	bne	.L869
.L985:
	rsb	r1, r7, r5
.L867:
	add	r0, r4, r7, lsl #2
	ldr	r3, .L992+4
	add	r0, r0, #26880
	mov	r2, #4
	add	r0, r0, #252
	bl	qsort
	mov	r2, r5
	cmp	r2, #0
	mov	r3, #0
	str	r5, [r6, #252]
	str	r3, [r6, #256]
	beq	.L986
.L875:
	ldr	r0, [r6, #264]
	ldr	r1, [r6, #268]
	add	r0, r0, #1
	cmp	r2, r0
	add	r1, r1, #1
	movcs	r2, r0
	cmp	r3, r1
	str	r2, [r6, #252]
	movcs	r3, r1
	cmp	r2, #32
	str	r3, [r6, #256]
	bhi	.L919
	add	r2, r2, #6720
	add	r1, r4, #27136
	add	r2, r2, #62
	add	r1, r1, #124
	mov	r0, #0
	add	r2, r4, r2, lsl #2
.L918:
	str	r0, [r2, #4]!
	cmp	r2, r1
	bne	.L918
.L919:
	cmp	r3, #32
	bhi	.L917
	add	r3, r3, #6784
	add	r1, r4, #27392
	add	r3, r3, #31
	mov	r2, #0
	add	r4, r4, r3, lsl #2
.L920:
	str	r2, [r4, #4]!
	cmp	r4, r1
	bne	.L920
.L917:
	mov	r0, #0
.L970:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L860:
	add	r3, r0, #57344
	str	r3, [fp, #-244]
	ldrb	r5, [r3, #3979]	@ zero_extendqisi2
	add	r3, r0, #24576
	str	r3, [fp, #-240]
	cmp	r5, #0
	beq	.L881
	ldr	r10, [r3, #2152]
	cmp	r10, #0
	beq	.L987
	add	r8, r0, #26368
	mov	r5, #0
	add	r8, r8, #220
	add	r7, r0, #61440
	mov	r3, r5
	mov	r1, r8
.L900:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L899
	sub	r0, fp, #44
	ldr	ip, [r7, #580]
	add	lr, r0, r5, lsl #2
	ldr	r0, [r2, #688]
	cmp	ip, r0
	strge	r2, [lr, #-192]
	addge	r5, r5, #1
.L899:
	cmp	r3, r10
	bne	.L900
	sub	r9, fp, #236
	ldr	r3, .L992+8
	mov	r2, #4
	mov	r1, r5
	mov	r0, r9
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r7, [r3, #2152]
	cmp	r7, #0
	beq	.L981
.L925:
	add	r10, r4, #61440
	mov	r3, r8
	mov	ip, #0
	mov	r8, r5
.L903:
	ldr	r2, [r3, #4]!
	add	ip, ip, #1
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L902
	sub	r1, fp, #44
	ldr	r0, [r10, #580]
	add	lr, r1, r8, lsl #2
	ldr	r1, [r2, #688]
	cmp	r0, r1
	strlt	r2, [lr, #-192]
	addlt	r8, r8, #1
.L902:
	cmp	ip, r7
	bne	.L903
	rsb	r7, r5, r8
	mov	r10, r5, asl #2
	add	r0, r9, r10
	ldr	r3, .L992+12
	mov	r1, r7
	mov	r2, #4
	bl	qsort
	cmp	r5, #0
	subeq	ip, fp, #172
	beq	.L904
.L922:
	sub	ip, fp, #172
	mov	r2, r9
	add	r7, ip, r7, lsl #2
	mov	r3, #0
.L905:
	add	r3, r3, #1
	ldr	r1, [r2], #4
	cmp	r3, r5
	str	r1, [r7], #4
	bcc	.L905
.L904:
	cmp	r8, r5
	bls	.L906
	add	r10, r9, r10
	mov	r3, ip
.L907:
	add	r5, r5, #1
	ldr	r2, [r10], #4
	cmp	r5, r8
	str	r2, [r3], #4
	bne	.L907
.L906:
	ldr	r7, [fp, #-244]
	add	r3, r4, #26880
	add	r10, r4, #20480
	mov	r5, #0
	add	r3, r3, #252
	str	r5, [r6, #252]
	str	r5, [r6, #256]
	mov	r1, r9
	ldrb	r0, [r7, #3979]	@ zero_extendqisi2
	mov	r2, r8
	str	r5, [sp, #4]
	add	r10, r10, #252
	str	r10, [sp]
	add	r9, r4, #27136
	str	ip, [fp, #-252]
	add	r9, r9, #128
	str	r3, [fp, #-248]
	bl	GenPiclistfromFrmlist
	ldr	ip, [fp, #-252]
	mov	r2, r8
	ldrb	r0, [r7, #3979]	@ zero_extendqisi2
	mov	r3, r9
	str	r5, [sp, #4]
	mov	r1, ip
	add	ip, r4, #20736
	str	ip, [sp]
	str	ip, [fp, #-252]
	bl	GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	r7, [r3, #2156]
	cmp	r7, r5
	subeq	r8, fp, #108
	beq	.L908
	add	r3, r4, #26624
	sub	r8, fp, #108
	add	r3, r3, #28
	mov	r2, r8
.L909:
	add	r5, r5, #1
	ldr	r1, [r3, #4]!
	cmp	r5, r7
	str	r1, [r2], #4
	bne	.L909
.L908:
	ldr	r3, .L992+16
	mov	r2, #4
	mov	r1, r7
	mov	r0, r8
	bl	qsort
	ldr	r3, [fp, #-244]
	mov	r5, #1
	mov	r2, r7
	mov	r1, r8
	ldrb	r0, [r3, #3979]	@ zero_extendqisi2
	ldr	r3, [fp, #-248]
	str	r10, [sp]
	str	r5, [sp, #4]
	bl	GenPiclistfromFrmlist
	ldr	r3, [fp, #-244]
	ldr	r2, [fp, #-252]
	mov	r1, r8
	ldrb	r0, [r3, #3979]	@ zero_extendqisi2
	mov	r3, r9
	str	r2, [sp]
	mov	r2, r7
	str	r5, [sp, #4]
	bl	GenPiclistfromFrmlist
	ldr	r2, [r6, #252]
	ldr	r3, [r6, #256]
	rsb	r1, r3, r2
	clz	r1, r1
	mov	r1, r1, lsr #5
.L898:
	cmp	r2, #1
	movls	r1, #0
	andhi	r1, r1, #1
	cmp	r1, #0
	beq	.L910
	cmp	r2, #0
	ldr	r1, [fp, #-240]
	beq	.L911
	ldr	r7, [r1, #2556]
	ldr	r1, [r1, #2688]
	cmp	r7, r1
	bne	.L910
	add	r0, r4, #27136
	ldr	ip, [fp, #-248]
	add	r0, r0, #128
	mov	r1, #0
	b	.L912
.L913:
	ldr	r5, [ip, #4]!
	ldr	lr, [r0, #4]!
	cmp	r5, lr
	bne	.L910
.L912:
	add	r1, r1, #1
	cmp	r1, r2
	bne	.L913
.L914:
	ldr	r0, [fp, #-240]
	ldr	r1, [r0, #2692]
	str	r7, [r0, #2692]
	str	r1, [r0, #2688]
.L910:
	orrs	r1, r2, r3
	bne	.L875
	ldr	r1, .L992+20
.L976:
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearCurrSlice
	mvn	r0, #0
	b	.L970
.L881:
	ldr	r9, [r3, #2152]
	cmp	r9, #0
	beq	.L884
	add	r8, r0, #26368
	add	lr, r0, #61440
	add	r8, r8, #220
	mov	r3, r5
	mov	r1, r8
	b	.L886
.L885:
	cmp	r3, r9
	beq	.L988
.L886:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L885
	add	r0, r5, #6720
	ldr	ip, [r2, #732]
	add	r0, r0, #62
	ldr	r7, [lr, #584]
	add	r2, r2, #720
	add	r0, r4, r0, lsl #2
	cmp	r7, ip
	addge	r5, r5, #1
	strge	r2, [r0, #4]
	cmp	r3, r9
	bne	.L886
.L988:
	add	r3, r4, #26880
	mov	r1, r5
	mov	r2, r3
	add	r2, r2, #252
	ldr	r3, .L992+24
	mov	r0, r2
	str	r2, [fp, #-248]
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r7, [r3, #2152]
	cmp	r7, #0
	beq	.L980
.L923:
	add	ip, r4, #61440
	mov	r3, r8
	mov	r9, r5
	mov	r2, #0
	b	.L889
.L888:
	cmp	r2, r7
	beq	.L989
.L889:
	ldr	r1, [r3, #4]!
	add	r2, r2, #1
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L888
	add	r0, r9, #6720
	ldr	lr, [r1, #732]
	add	r0, r0, #62
	ldr	r8, [ip, #584]
	add	r1, r1, #720
	add	r0, r4, r0, lsl #2
	cmp	r8, lr
	addlt	r9, r9, #1
	strlt	r1, [r0, #4]
	cmp	r2, r7
	bne	.L889
.L989:
	add	r8, r5, #6720
	rsb	r7, r5, r9
	add	r8, r8, #62
	mov	r2, #4
	ldr	r3, .L992+28
	mov	r1, r7
	add	r0, r4, r8, lsl #2
	add	r10, r4, r9, lsl #2
	add	r0, r0, r2
	add	r10, r10, #26880
	bl	qsort
	cmp	r5, #0
	add	r10, r10, #252
	beq	.L891
.L921:
	add	r7, r7, #6784
	add	r2, r4, #26880
	add	r7, r7, #31
	add	r2, r2, #248
	mov	r3, #0
	add	r7, r4, r7, lsl #2
.L892:
	add	r3, r3, #1
	ldr	r1, [r2, #4]!
	cmp	r3, r5
	str	r1, [r7, #4]!
	bcc	.L892
.L891:
	cmp	r9, r5
	bls	.L893
	add	r3, r4, #27136
	add	r8, r4, r8, lsl #2
	add	r3, r3, #124
.L894:
	add	r5, r5, #1
	ldr	r2, [r8, #4]!
	cmp	r5, r9
	str	r2, [r3, #4]!
	bne	.L894
.L893:
	ldr	r3, [fp, #-240]
	str	r9, [r6, #256]
	str	r9, [r6, #252]
	ldr	r1, [r3, #2156]
	cmp	r1, #0
	beq	.L930
	add	r0, r4, #26624
	mov	r5, r9
	add	r0, r0, #28
	mov	r3, #0
	b	.L897
.L896:
	cmp	r3, r1
	beq	.L990
.L897:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L896
	ldrb	ip, [r2, #721]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L896
	add	ip, r4, r5, lsl #2
	cmp	r3, r1
	add	ip, ip, #24576
	add	r2, r2, #720
	add	r5, r5, #1
	str	r2, [ip, #2556]
	str	r2, [ip, #2688]
	bne	.L897
.L990:
	rsb	r1, r9, r5
.L895:
	mov	r0, r10
	ldr	r3, .L992+4
	mov	r2, #4
	bl	qsort
	ldr	r0, [r6, #252]
	ldr	r3, .L992+4
	mov	r2, #4
	rsb	r1, r0, r5
	add	r0, r4, r0, lsl #2
	add	r0, r0, #27136
	add	r0, r0, #128
	bl	qsort
	mov	r3, r5
	str	r5, [r6, #256]
	mov	r2, r5
	str	r5, [r6, #252]
	mov	r1, #1
	b	.L898
.L984:
	add	r2, r0, #24576
	str	r2, [fp, #-240]
	ldr	lr, [r2, #2152]
	cmp	lr, #0
	moveq	r7, lr
	beq	.L863
	add	r1, r0, #26368
	mov	r7, r3
	add	r1, r1, #220
.L872:
	ldr	r2, [r1, #4]!
	sub	r0, fp, #44
	add	ip, r0, r7, lsl #2
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	strne	r2, [ip, #-192]
	addne	r7, r7, #1
	cmp	r3, lr
	bne	.L872
.L863:
	mov	r1, r7
	ldr	r3, .L992+32
	mov	r2, #4
	sub	r0, fp, #236
	bl	qsort
	add	r9, r4, #26880
	ldr	r3, [fp, #-244]
	add	r9, r9, #252
	add	r10, r4, #20480
	mov	r5, #0
	mov	r2, r7
	str	r5, [r6, #252]
	sub	r1, fp, #236
	ldrb	r0, [r3, #3979]	@ zero_extendqisi2
	add	r10, r10, #252
	mov	r3, r9
	str	r5, [sp, #4]
	str	r10, [sp]
	bl	GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	r7, [r3, #2156]
	cmp	r7, r5
	subeq	r8, fp, #108
	beq	.L873
	add	r3, r4, #26624
	sub	r8, fp, #108
	add	r3, r3, #28
	mov	r2, r8
.L874:
	add	r5, r5, #1
	ldr	r1, [r3, #4]!
	cmp	r5, r7
	str	r1, [r2], #4
	bne	.L874
.L873:
	ldr	r3, .L992+16
	mov	r2, #4
	mov	r1, r7
	mov	r0, r8
	bl	qsort
	ldr	r3, [fp, #-244]
	mov	r2, r7
	mov	ip, #1
	mov	r1, r8
	ldrb	r0, [r3, #3979]	@ zero_extendqisi2
	mov	r3, r9
	str	r10, [sp]
	str	ip, [sp, #4]
	bl	GenPiclistfromFrmlist
	ldr	r2, [r6, #252]
	mov	r3, #0
	str	r3, [r6, #256]
	cmp	r2, #0
	bne	.L875
.L986:
	ldr	r3, [r4]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L876
	ldr	r3, [fp, #-244]
	ldrb	r3, [r3, #3979]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L991
	cmp	r3, #1
	add	r3, r4, #61440
	ldr	r2, [fp, #-240]
	ldr	r3, [r3, #560]
	addeq	r3, r3, #760
	addne	r3, r3, #800
	str	r3, [r2, #2556]
.L878:
	mov	r3, #0
	mov	r2, #1
	b	.L875
.L991:
	add	r3, r4, #61440
	ldr	r2, [fp, #-240]
	ldr	r3, [r3, #560]
	add	r3, r3, #720
	str	r3, [r2, #2556]
	b	.L878
.L911:
	ldr	r7, [r1, #2688]
	b	.L914
.L980:
	add	r8, r5, #6720
	mov	r2, #4
	add	r8, r8, #62
	ldr	r3, .L992+28
	mov	r1, r7
	add	r10, r4, r8, lsl #2
	add	r10, r10, r2
	mov	r0, r10
	bl	qsort
	subs	r9, r5, #0
	bne	.L921
	b	.L893
.L981:
	mov	r10, r5, asl #2
	ldr	r3, .L992+12
	add	r0, r9, r10
	mov	r2, #4
	mov	r1, r7
	bl	qsort
	subs	r8, r5, #0
	bne	.L922
.L977:
	sub	ip, fp, #172
	b	.L906
.L927:
	mov	r7, ip
	b	.L864
.L987:
	sub	r9, fp, #236
	ldr	r3, .L992+8
	mov	r2, #4
	mov	r1, r10
	mov	r0, r9
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r7, [r3, #2152]
	cmp	r7, #0
	addne	r8, r4, #26368
	movne	r5, r10
	addne	r8, r8, #220
	bne	.L925
	ldr	r3, .L992+12
	mov	r2, #4
	mov	r1, r7
	mov	r0, r9
	mov	r8, r7
	bl	qsort
	b	.L977
.L884:
	add	r3, r0, #26880
	mov	r1, r9
	mov	r2, r3
	add	r2, r2, #252
	ldr	r3, .L992+24
	mov	r0, r2
	str	r2, [fp, #-248]
	mov	r2, #4
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r7, [r3, #2152]
	cmp	r7, #0
	addne	r8, r4, #26368
	movne	r5, r9
	addne	r8, r8, #220
	bne	.L923
	ldr	r10, [fp, #-248]
	mov	r2, #4
	ldr	r3, .L992+28
	mov	r1, r7
	mov	r9, r7
	mov	r0, r10
	bl	qsort
	b	.L893
.L928:
	mov	r5, r7
	b	.L867
.L930:
	mov	r5, r9
	b	.L895
.L876:
	ldr	r1, .L992+36
	b	.L976
.L993:
	.align	2
.L992:
	.word	compare_pic_by_pic_num_desc
	.word	compare_pic_by_lt_pic_num_asc
	.word	compare_fs_by_poc_desc
	.word	compare_fs_by_poc_asc
	.word	compare_fs_by_lt_pic_idx_asc
	.word	.LC37
	.word	compare_pic_by_poc_desc
	.word	compare_pic_by_poc_asc
	.word	compare_fs_by_frame_num_desc
	.word	.LC36
	UNWIND(.fnend)
	.size	InitListX, .-InitListX
	.align	2
	.global	DumpList
	.type	DumpList, %function
DumpList:
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
	ldr	r3, .L996
	ldr	r3, [r3]
	tst	r3, #8192
	ldmeqfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DumpList.part.5
.L997:
	.align	2
.L996:
	.word	g_PrintEnable
	UNWIND(.fnend)
	.size	DumpList, .-DumpList
	.align	2
	.global	FindNearestPOCPicId
	.type	FindNearestPOCPicId, %function
FindNearestPOCPicId:
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
	add	r3, r0, #24576
	ldr	r4, [r3, #2148]
	cmp	r4, #0
	beq	.L1003
	ldr	r3, [r3, #1952]
	add	r2, r0, #61440
	ldr	r5, [r2, #580]
	ldr	lr, [r3, #688]
	rsb	lr, lr, r5
	cmp	lr, #0
	rsblt	lr, lr, #0
	cmp	r4, #1
	bls	.L1004
	add	r1, r0, #26368
	mov	r2, #1
	add	r1, r1, #160
	mov	r0, #0
.L1002:
	ldr	ip, [r1, #4]!
	add	r2, r2, #1
	ldr	r3, [ip, #688]
	rsb	r3, r3, r5
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, lr
	ldrlt	r0, [ip, #188]
	movlt	lr, r3
	cmp	r2, r4
	bne	.L1002
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1004:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1003:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	FindNearestPOCPicId, .-FindNearestPOCPicId
	.align	2
	.global	FindMinRefIdx
	.type	FindMinRefIdx, %function
FindMinRefIdx:
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
	add	r3, r0, #20480
	ldrb	r2, [r3, #208]	@ zero_extendqisi2
	cmp	r2, #2
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	add	r2, r0, #57344
	add	r5, r0, #26880
	ldrb	ip, [r2, #3979]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L1036
	ldr	lr, [r3, #252]
	mov	r4, r5
	mov	r6, r5
	mov	r7, ip
	cmp	lr, #0
	add	r5, r5, #124
	add	r4, r4, #128
	add	r6, r6, #248
	beq	.L1014
.L1038:
	mov	r2, r6
	mov	r0, #32
	mov	r3, #0
	b	.L1012
.L1011:
	add	r3, r3, #1
	cmp	r3, lr
	beq	.L1037
.L1012:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #712]
	cmp	r1, ip
	bne	.L1011
	cmp	r0, r3
	movcs	r0, r3
	add	r3, r3, #1
	cmp	r3, lr
	str	r0, [r4, #-4]
	str	r0, [r5, #4]
	bne	.L1012
.L1037:
	cmp	r0, #31
	bhi	.L1014
.L1013:
	add	ip, ip, #1
	add	r5, r5, #8
	cmp	ip, #16
	add	r4, r4, #8
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	lr, #0
	bne	.L1038
.L1014:
	str	r7, [r4, #-4]
	str	r7, [r5, #4]
	b	.L1013
.L1036:
	ldr	r4, [r3, #252]
	mov	ip, #0
	mov	r6, r5
	mov	r7, ip
	cmp	r4, #0
	add	r5, r5, #124
	add	r6, r6, #248
	beq	.L1018
.L1040:
	mov	r1, r6
	mov	lr, #32
	mov	r2, #0
	b	.L1016
.L1015:
	add	r2, r2, #1
	cmp	r2, r4
	beq	.L1039
.L1016:
	ldr	r3, [r1, #4]!
	ldr	r8, [r3, #36]
	ldrb	r0, [r3]	@ zero_extendqisi2
	ldr	r3, [r8, #712]
	mov	r3, r3, asl #1
	cmp	r0, #2
	orreq	r3, r3, #1
	cmp	r3, ip
	bne	.L1015
	cmp	lr, r2
	movcs	lr, r2
	add	r2, r2, #1
	cmp	r2, r4
	str	lr, [r5]
	bne	.L1016
.L1039:
	cmp	lr, #31
	bhi	.L1018
.L1017:
	add	ip, ip, #1
	add	r5, r5, #4
	cmp	ip, #32
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	r4, #0
	bne	.L1040
.L1018:
	str	r7, [r5]
	b	.L1017
	UNWIND(.fnend)
	.size	FindMinRefIdx, .-FindMinRefIdx
	.align	2
	.global	DecList
	.type	DecList, %function
DecList:
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
	mov	r6, r0
	bl	FindNearestPOCPicId
	add	r5, r6, #20480
	mvn	r4, #0
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	str	r4, [r5, #1836]
	cmp	r3, #2
	str	r0, [r5, #1840]
	beq	.L1054
	mov	r0, r6
	bl	InitListX
	cmp	r0, #0
	bne	.L1055
	ldr	r4, .L1058
	mov	r0, #13
	ldr	r1, .L1058+4
	bl	dprint_vfmw
	ldr	r3, [r4]
	tst	r3, #8192
	bne	.L1056
.L1045:
	mov	r0, r6
	bl	ReorderListX
	mov	r0, r6
	bl	RepairList
	cmp	r0, #0
	bne	.L1047
	mov	r0, r6
	bl	FindMinRefIdx
	add	r3, r6, #24576
	mov	r0, #13
	ldr	r1, .L1058+8
	ldr	r3, [r3, #2556]
	cmp	r3, #0
	ldrne	r3, [r3, #36]
	mvneq	r3, #0
	ldrne	r3, [r3, #188]
	str	r3, [r5, #1836]
	bl	dprint_vfmw
	ldr	r4, [r4]
	ands	r4, r4, #8192
	bne	.L1057
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1057:
	mov	r0, r6
	bl	DumpList.part.5
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1054:
	mov	r0, #0
	str	r0, [r5, #252]
	str	r0, [r5, #256]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1056:
	mov	r0, r6
	bl	DumpList.part.5
	b	.L1045
.L1047:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1055:
	ldr	r1, .L1058+12
	mov	r0, #13
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1059:
	.align	2
.L1058:
	.word	g_PrintEnable
	.word	.LC39
	.word	.LC40
	.word	.LC38
	UNWIND(.fnend)
	.size	DecList, .-DecList
	.align	2
	.global	NoPicOut
	.type	NoPicOut, %function
NoPicOut:
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
	add	r4, r0, #61440
	ldr	ip, [r4, #2060]
	cmp	ip, #0
	addne	r3, r0, #27904
	movne	r2, #0
	addne	r3, r3, #188
	movne	lr, r2
	bne	.L1066
	b	.L1067
.L1075:
	ldrb	r1, [r3, #-688]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1064
	cmp	r2, ip
	add	r3, r3, #848
	beq	.L1067
.L1066:
	ldr	r1, [r3]
	add	r2, r2, #1
	cmp	r1, #1
	bne	.L1075
.L1064:
	cmp	r2, ip
	strb	lr, [r3, #-691]
	strb	lr, [r3, #-690]
	add	r3, r3, #848
	bne	.L1066
.L1067:
	ldr	r2, [r4, #2064]
	cmp	r2, #0
	beq	.L1076
	add	r0, r0, #63232
	mov	r3, #0
	add	r0, r0, #196
	mov	r1, r3
.L1068:
	add	r3, r3, #1
	str	r1, [r0, #4]!
	cmp	r3, r2
	bne	.L1068
	ldmfd	sp, {r4, fp, sp, pc}
.L1076:
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	NoPicOut, .-NoPicOut
	.align	2
	.global	GetBackPicFromVOQueue
	.type	GetBackPicFromVOQueue, %function
GetBackPicFromVOQueue:
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
	add	r10, r0, #61440
	mov	r8, r0
	ldr	r0, [r10, #3520]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L1094
.L1078:
	ldr	r3, [r10, #2060]
	cmp	r3, #0
	beq	.L1085
	add	r5, r8, #27904
	mov	r6, #0
	add	r5, r5, #128
	mov	r7, #0
	mov	r9, #0
.L1084:
	sub	r4, r5, #32
	mov	r3, #0
	strb	r3, [r5, #-631]
	strb	r3, [r5, #-630]
.L1083:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L1095
.L1082:
	cmp	r4, r5
	bne	.L1083
	ldr	r3, [r10, #2060]
	add	r9, r9, #1
	add	r5, r5, #848
	cmp	r3, r9
	bhi	.L1084
.L1085:
	ldr	r2, [r10, #2064]
	cmp	r2, #0
	beq	.L1096
	add	r8, r8, #63232
	mov	r3, #0
	add	r8, r8, #196
	mov	r1, r3
.L1086:
	add	r3, r3, #1
	str	r1, [r8, #4]!
	cmp	r3, r2
	bne	.L1086
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1095:
	mov	r1, r2
	ldr	r0, [r10, #3520]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L1082
.L1094:
	add	r0, r8, #8
	bl	ResetVoQueue
	b	.L1078
.L1096:
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetBackPicFromVOQueue, .-GetBackPicFromVOQueue
	.align	2
	.global	wait_vo
	.type	wait_vo, %function
wait_vo:
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
	.size	wait_vo, .-wait_vo
	.align	2
	.global	GetReRangeFlag
	.type	GetReRangeFlag, %function
GetReRangeFlag:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	add	r7, r0, #12288
	add	r3, r0, #20480
	mov	r5, r0
	ldr	r0, [r7, #1304]
	mov	ip, #2208
	ldr	r3, [r3, #220]
	mov	r4, #4000
	ldr	r2, [r7, #1300]
	mov	r6, r1
	ldr	lr, [r7, #1276]
	mla	r3, ip, r3, r0
	ldr	r0, [r7, #1280]
	ldr	r3, [r3, #28]
	mla	r4, r4, r3, r2
	ldrb	r3, [r4, #18]	@ zero_extendqisi2
	ldr	r1, [r4, #3252]
	rsb	r3, r3, #2
	ldr	r2, [r4, #3248]
	mla	r3, r1, r3, r3
	add	r2, r2, #1
	cmp	r2, lr
	cmpeq	r3, r0
	movne	r1, #1
	moveq	r1, #0
	bne	.L1099
	add	r8, r5, #24576
	ldr	ip, [r4, #3272]
	ldr	r8, [r8, #2144]
	add	r8, r8, #1
	cmp	ip, r8
	movls	r3, r1
	bls	.L1100
.L1099:
	ldr	r1, .L1104
	ldr	ip, [r1]
	cmp	ip, #0
	beq	.L1103
	add	r1, r5, #61440
	mov	r0, r0, asl #4
	mov	r2, r2, asl #4
	mov	r3, r3, asl #4
	mov	lr, lr, asl #4
	strh	r0, [fp, #-42]	@ movhi
	strh	r2, [fp, #-40]	@ movhi
	sub	r2, fp, #44
	strh	r3, [fp, #-38]	@ movhi
	mov	r3, #8
	ldr	r0, [r1, #3520]
	mov	r1, #2
	strh	lr, [fp, #-44]	@ movhi
	blx	ip
.L1103:
	ldr	ip, [r4, #3272]
	mov	r3, #1
.L1100:
	add	r5, r5, #16384
	ldr	r2, [r4, #36]
	ldr	lr, [r7, #1344]
	mov	r0, r3
	ldr	r1, [r5, #484]
	cmp	lr, r2
	cmpeq	r1, ip
	movne	r2, #1
	moveq	r2, #0
	orr	r3, r2, r3
	str	r3, [r6]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1105:
	.align	2
.L1104:
	.word	g_event_report
	UNWIND(.fnend)
	.size	GetReRangeFlag, .-GetReRangeFlag
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	2
	.global	DecPOC
	.type	DecPOC, %function
DecPOC:
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
	add	r2, r0, #12288
	add	r6, r0, #20480
	mov	r4, #2208
	mov	r5, #4000
	ldr	r1, [r6, #220]
	mov	ip, #1
	ldr	r3, [r2, #1304]
	ldr	lr, [r2, #1300]
	ldrb	r2, [r6, #211]	@ zero_extendqisi2
	mla	r3, r4, r1, r3
	sub	r2, r2, #5
	clz	r2, r2
	mov	r2, r2, lsr #5
	ldr	r3, [r3, #28]
	mla	r5, r5, r3, lr
	ldr	r1, [r5, #2200]
	ldr	r3, [r5, #2196]
	cmp	r1, ip
	ldr	lr, [r5, #2204]
	add	r3, r3, #4
	mov	r3, ip, asl r3
	beq	.L1108
	bcc	.L1109
	cmp	r1, #2
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r2, #0
	add	r4, r0, #16384
	bne	.L1164
	ldr	r1, [r4, #3444]
	cmp	r1, #0
	bne	.L1142
	ldr	r2, [r4, #3484]
	ldr	r0, [r4, #3480]
	ldr	r1, [r4, #3492]
	cmp	r2, r0
	addcc	r1, r1, r3
	strcc	r1, [r4, #3488]
	bcs	.L1144
.L1145:
	add	r3, r1, r2
	str	r3, [r4, #3476]
	ldr	r0, [r6, #240]
	mov	r3, r3, asl #1
	cmp	r0, #0
	subeq	r3, r3, #1
	str	r3, [r4, #3464]
	ldrb	r0, [r6, #209]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1148
	str	r3, [r4, #3460]
	str	r3, [r4, #3456]
	str	r3, [r4, #3452]
.L1141:
	str	r2, [r4, #3480]
	str	r1, [r4, #3492]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1109:
	cmp	r2, #0
	add	lr, lr, #4
	add	r4, r0, #16384
	mov	ip, ip, asl lr
	bne	.L1115
	ldr	r3, [r4, #3444]
	cmp	r3, #0
	bne	.L1113
	ldr	lr, [r4, #3428]
	ldr	r1, [r4, #3432]
	mov	r2, lr
.L1114:
	ldr	r0, [r4, #3420]
	cmp	r0, r1
	bcs	.L1112
	rsb	r3, r0, r1
	cmp	r3, ip, lsr #1
	addcs	r2, r2, ip
	strcs	r2, [r4, #3436]
	bcc	.L1112
.L1116:
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1118
.L1166:
	ldr	r3, [r4, #3424]
	add	r2, r2, r0
	str	r2, [r4, #3452]
	add	r3, r2, r3
	str	r3, [r4, #3456]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r4, #3464]
.L1119:
	ldr	r2, [r4, #3484]
	ldr	r1, [r4, #3480]
	str	r3, [r4, #3460]
	cmp	r2, r1
	strne	r2, [r4, #3480]
	ldr	r3, [r6, #240]
	cmp	r3, #0
	ldrne	r2, [r4, #3420]
	ldrne	r3, [r4, #3436]
	strne	r2, [r4, #3432]
	strne	r3, [r4, #3428]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1108:
	cmp	r2, #0
	add	r4, r0, #16384
	movne	r3, #0
	strne	r3, [r4, #3488]
	bne	.L1123
	ldr	r1, [r4, #3444]
	cmp	r1, #0
	beq	.L1124
	mov	r3, r2
	str	r2, [r4, #3492]
	str	r2, [r4, #3480]
.L1125:
	str	r3, [r4, #3488]
.L1123:
	ldr	r3, [r5, #2216]
	cmp	r3, #0
	beq	.L1127
	ldr	r3, [r4, #3484]
	ldr	r0, [r4, #3488]
	add	r0, r3, r0
	str	r0, [r4, #3476]
	ldr	r7, [r6, #240]
	cmp	r7, #0
	bne	.L1129
	cmp	r0, #0
	beq	.L1130
	sub	r0, r0, #1
	str	r0, [r4, #3476]
.L1129:
	mov	r3, #0
	str	r3, [r4, #3508]
	ldr	r1, [r5, #2216]
	cmp	r1, r3
	bgt	.L1150
	cmp	r0, #0
	beq	.L1133
.L1167:
	sub	r8, r0, #1
	mov	r0, r8
	bl	__aeabi_uidiv
	mov	r9, r0
	mov	r0, r8
	str	r9, [r4, #3500]
	ldr	r1, [r5, #2216]
	bl	__aeabi_uidivmod
	ldr	r0, [r4, #3508]
	mul	r0, r0, r9
	str	r0, [r4, #3504]
	cmp	r1, #0
	str	r1, [r4, #3496]
	blt	.L1134
	add	r2, r5, #2208
	add	r1, r1, #1
	add	r2, r2, #8
	mov	r3, #0
.L1135:
	add	r3, r3, #1
	ldr	ip, [r2, #4]!
	cmp	r3, r1
	add	r0, r0, ip
	str	r0, [r4, #3504]
	bne	.L1135
.L1134:
	cmp	r7, #0
	ldreq	r3, [r5, #2208]
	addeq	r0, r0, r3
	streq	r0, [r4, #3504]
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1137
	ldr	r2, [r4, #3468]
	ldr	r1, [r4, #3472]
	add	r2, r0, r2
	str	r2, [r4, #3452]
	ldr	r3, [r5, #2212]
	add	r3, r2, r3
	add	r0, r3, r1
	str	r0, [r4, #3456]
	cmp	r0, r2
	movge	r0, r2
	str	r0, [r4, #3464]
.L1138:
	ldr	r2, [r4, #3484]
	ldr	r3, [r4, #3488]
	str	r0, [r4, #3460]
	str	r2, [r4, #3480]
	str	r3, [r4, #3492]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1113:
	ldr	lr, [r4, #3448]
	cmp	lr, #0
	beq	.L1165
.L1115:
	ldr	r0, [r4, #3420]
	mov	r3, #0
	mov	lr, r3
	mov	r2, r1
	str	r3, [r4, #3428]
	str	r3, [r4, #3432]
.L1112:
	cmp	r0, r1
	bls	.L1117
	rsb	r1, r1, r0
	cmp	r1, ip, lsr #1
	rsbhi	r2, ip, r2
	strhi	r2, [r4, #3436]
	bhi	.L1116
.L1117:
	str	lr, [r4, #3436]
	ldrb	r3, [r6, #209]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1166
.L1118:
	ldrb	r3, [r6, #210]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r2, r0
	streq	r3, [r4, #3452]
	strne	r3, [r4, #3456]
	str	r3, [r4, #3464]
	b	.L1119
.L1164:
	mov	r3, #0
	ldr	r2, [r4, #3484]
	mov	r1, r3
	str	r3, [r4, #3488]
	str	r3, [r4, #3456]
	str	r3, [r4, #3452]
	str	r3, [r4, #3460]
	str	r3, [r4, #3464]
	b	.L1141
.L1127:
	str	r3, [r4, #3476]
	ldr	r7, [r6, #240]
.L1130:
	mov	r0, #0
	str	r0, [r4, #3508]
	ldr	r3, [r5, #2216]
	cmp	r3, r0
	ble	.L1133
.L1150:
	add	ip, r5, #2208
	mov	r3, #0
	add	ip, ip, #8
	mov	r2, r3
.L1132:
	ldr	r1, [ip, #4]!
	add	r2, r2, #1
	add	r3, r3, r1
	str	r3, [r4, #3508]
	ldr	r1, [r5, #2216]
	cmp	r1, r2
	bgt	.L1132
	cmp	r0, #0
	bne	.L1167
.L1133:
	mov	r0, #0
	str	r0, [r4, #3504]
	b	.L1134
.L1137:
	ldrb	r3, [r6, #210]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r2, [r5, #2212]
	ldreq	r3, [r4, #3468]
	ldrne	r3, [r4, #3468]
	addne	r0, r0, r2
	addeq	r0, r0, r3
	streq	r0, [r4, #3452]
	addne	r0, r0, r3
	strne	r0, [r4, #3456]
	str	r0, [r4, #3464]
	b	.L1138
.L1124:
	ldr	r1, [r4, #3484]
	ldr	r2, [r4, #3480]
	cmp	r1, r2
	bcs	.L1126
	ldr	r2, [r4, #3492]
	add	r3, r3, r2
	str	r3, [r4, #3488]
	b	.L1123
.L1148:
	ldrb	r0, [r6, #210]	@ zero_extendqisi2
	str	r3, [r4, #3460]
	cmp	r0, #0
	streq	r3, [r4, #3452]
	strne	r3, [r4, #3456]
	b	.L1141
.L1142:
	str	r2, [r4, #3480]
	mov	r1, r2
	str	r2, [r4, #3492]
	ldr	r2, [r4, #3484]
.L1144:
	str	r1, [r4, #3488]
	b	.L1145
.L1165:
	ldr	r3, [r4, #3452]
	mov	r2, r1
	str	lr, [r4, #3428]
	mov	r1, r3
	str	r3, [r4, #3432]
	b	.L1114
.L1126:
	ldr	r3, [r4, #3492]
	b	.L1125
	UNWIND(.fnend)
	.size	DecPOC, .-DecPOC
	.align	2
	.global	CalcPicNum
	.type	CalcPicNum, %function
CalcPicNum:
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
	add	r2, r0, #12288
	add	r3, r0, #20480
	mov	r4, #2208
	mov	lr, #4000
	ldr	ip, [r3, #220]
	add	r5, r0, #57344
	ldr	r1, [r2, #1304]
	mov	r6, #1
	ldr	r3, [r2, #1300]
	ldrb	r2, [r5, #3979]	@ zero_extendqisi2
	mla	r1, r4, ip, r1
	cmp	r2, #0
	ldr	r1, [r1, #28]
	mla	r3, lr, r1, r3
	ldr	r3, [r3, #2196]
	add	r3, r3, #4
	mov	r6, r6, asl r3
	add	r3, r0, #24576
	beq	.L1169
	sub	r5, r2, #1
	sub	r4, r2, #2
	ldr	r2, [r3, #2152]
	clz	r5, r5
	clz	r4, r4
	cmp	r2, #0
	mov	r5, r5, lsr #5
	addne	lr, r0, #26368
	mov	r4, r4, lsr #5
	addne	r7, r0, #61440
	addne	lr, lr, #220
	movne	r1, #0
	beq	.L1189
.L1188:
	ldr	ip, [lr, #4]!
	ldrb	r2, [ip, #2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1183
	ldr	r2, [ip, #676]
	ldr	r8, [r7, #568]
	cmp	r2, r8
	rsbhi	r2, r6, r2
	str	r2, [ip, #680]
	ldr	r2, [lr]
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L1186
	ldr	r8, [r2, #760]
	bic	r8, r8, #-16777216
	bic	r8, r8, #255
	cmp	r8, #65536
	ldreq	ip, [r2, #680]
	addeq	ip, r5, ip, lsl #1
	streq	ip, [r2, #768]
	ldreq	r2, [lr]
	ldreqb	ip, [r2, #2]	@ zero_extendqisi2
.L1186:
	tst	ip, #2
	beq	.L1183
	ldr	ip, [r2, #800]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	ldreq	ip, [r2, #680]
	addeq	ip, r4, ip, lsl #1
	streq	ip, [r2, #808]
.L1183:
	ldr	r2, [r3, #2152]
	add	r1, r1, #1
	cmp	r2, r1
	bhi	.L1188
.L1189:
	ldr	r2, [r3, #2156]
	cmp	r2, #0
	beq	.L1213
	add	r0, r0, #26624
	mov	r2, #0
	add	r0, r0, #28
.L1194:
	ldr	ip, [r0, #4]!
	add	r2, r2, #1
	ldrb	r1, [ip, #2]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1191
	tst	r1, #1
	beq	.L1192
	ldr	lr, [ip, #760]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	ldreq	r1, [ip, #684]
	addeq	r1, r5, r1, lsl #1
	streq	r1, [ip, #764]
	ldreq	ip, [r0]
	ldreqb	r1, [ip, #2]	@ zero_extendqisi2
.L1192:
	tst	r1, #2
	beq	.L1191
	ldr	r1, [ip, #800]
	bic	r1, r1, #-16777216
	bic	r1, r1, #255
	cmp	r1, #256
	ldreq	r1, [ip, #684]
	addeq	r1, r4, r1, lsl #1
	streq	r1, [ip, #804]
.L1191:
	ldr	r1, [r3, #2156]
	cmp	r1, r2
	bhi	.L1194
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1169:
	ldr	r1, [r3, #2152]
	cmp	r1, #0
	addne	ip, r0, #26368
	addne	r4, r0, #61440
	addne	ip, ip, #220
	bne	.L1178
.L1179:
	ldr	r2, [r3, #2156]
	cmp	r2, #0
	beq	.L1214
	add	r0, r0, #26624
	mov	r2, #0
	add	r0, r0, #28
	b	.L1181
.L1180:
	ldr	r1, [r3, #2156]
	cmp	r1, r2
	bls	.L1215
.L1181:
	ldr	r1, [r0, #4]!
	add	r2, r2, #1
	ldrb	ip, [r1, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1180
	ldr	ip, [r1, #720]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	ldreq	ip, [r1, #684]
	streq	ip, [r1, #724]
	ldr	r1, [r3, #2156]
	cmp	r1, r2
	bhi	.L1181
.L1215:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1216:
	ldr	lr, [r1, #720]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L1175
	ldr	lr, [r1, #676]
	ldr	r5, [r4, #568]
	rsb	r7, r6, lr
	cmp	lr, r5
	strhi	r7, [r1, #680]
	strls	lr, [r1, #680]
	ldr	r1, [ip]
	ldr	lr, [r1, #680]
	str	lr, [r1, #728]
.L1175:
	ldr	r1, [r3, #2152]
	add	r2, r2, #1
	cmp	r1, r2
	bls	.L1179
.L1178:
	ldr	r1, [ip, #4]!
	ldrb	lr, [r1, #2]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L1175
	b	.L1216
.L1214:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1213:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	CalcPicNum, .-CalcPicNum
	.align	2
	.global	IsOutDPB
	.type	IsOutDPB, %function
IsOutDPB:
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
	cmp	r1, #0
	beq	.L1222
	add	r3, r0, #24576
	ldr	ip, [r3, #2148]
	cmp	ip, #0
	beq	.L1222
	ldr	r3, [r3, #1952]
	cmp	r3, r1
	beq	.L1224
	add	r0, r0, #26368
	mov	r3, #0
	add	r0, r0, #160
	b	.L1219
.L1220:
	ldr	r2, [r0, #4]!
	cmp	r2, r1
	beq	.L1224
.L1219:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1220
.L1222:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1224:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	IsOutDPB, .-IsOutDPB
	.align	2
	.global	WriteCurrPicYUV
	.type	WriteCurrPicYUV, %function
WriteCurrPicYUV:
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
	add	r4, r0, #61440
	add	r3, r0, #57344
	ldr	r1, .L1228
	mov	r0, #2
	ldrb	r5, [r3, #3979]	@ zero_extendqisi2
	ldr	r3, [r4, #560]
	mov	r2, r5
	ldr	r3, [r3, #188]
	bl	dprint_vfmw
	ldr	ip, [r4, #612]
	cmp	r5, #3
	cmpne	r5, #0
	ldr	r3, [r4, #608]
	addne	r2, r5, #1
	ldr	r1, .L1228+4
	moveq	r2, #1
	str	ip, [sp]
	mov	r0, #22
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1229:
	.align	2
.L1228:
	.word	.LC41
	.word	.LC42
	UNWIND(.fnend)
	.size	WriteCurrPicYUV, .-WriteCurrPicYUV
	.align	2
	.global	WritePicMsg
	.type	WritePicMsg, %function
WritePicMsg:
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
	add	r5, r0, #61440
	add	r6, r0, #57344
	mov	r4, r0
	ldr	lr, [r5, #628]
	mov	r0, #2
	ldr	ip, [r5, #76]
	mov	r7, #0
	ldrb	r3, [r6, #3979]	@ zero_extendqisi2
	add	r9, r4, #12288
	ldr	r2, [r5, #576]
	add	r8, r4, #16384
	stmia	sp, {ip, lr}
	ldr	r1, .L1266
	bl	dprint_vfmw
	add	r2, r4, #61952
	str	r7, [r5, #3444]
	add	r3, r4, #63488
	ldrd	r0, [r2, #24]
	strd	r0, [r3, #72]
	add	r0, r5, #60
	ldr	ip, [r5, #3440]
	ldmia	r0, {r0, r1, r2}
	ldr	r3, [r5, #576]
	str	ip, [r5, #3168]
	str	r0, [r5, #2948]
	str	r1, [r5, #2952]
	str	r2, [r5, #2956]
	str	r3, [r5, #2128]
	ldrb	r3, [r6, #3979]	@ zero_extendqisi2
	ldr	r1, [r5, #612]
	ldr	r2, [r5, #616]
	strb	r3, [r5, #2112]
	ldrb	r3, [r9, #1327]	@ zero_extendqisi2
	str	r1, [r5, #2132]
	str	r2, [r5, #2136]
	str	r3, [r5, #2144]
	ldr	r3, [r8, #460]
	add	r3, r3, #1
	str	r3, [r5, #2140]
	ldrb	r3, [r9, #1326]	@ zero_extendqisi2
	strb	r3, [r5, #2115]
	ldr	r3, [r8, #1272]
	str	r3, [r5, #2148]
	ldrb	r3, [r8, #1212]	@ zero_extendqisi2
	str	r3, [r5, #2152]
	ldr	r3, [r9, #1348]
	strb	r3, [r5, #2113]
	ldrb	r3, [r8, #1216]	@ zero_extendqisi2
	str	r3, [r5, #2156]
	ldr	r2, [r8, #3464]
	ldr	r3, [r5, #560]
	ldr	r0, [r5, #3520]
	str	r2, [r5, #2160]
	ldr	r2, [r8, #3452]
	str	r2, [r5, #2164]
	ldr	r2, [r8, #3456]
	str	r2, [r5, #2168]
	ldr	r1, [r3, #672]
	bl	FSP_GetLogicFs
	subs	r10, r0, #0
	beq	.L1264
	ldr	r2, [r10, #680]
	ldr	r3, [r10, #684]
	cmp	r2, #0
	beq	.L1234
	cmp	r3, #0
	beq	.L1234
	add	r3, r4, #63744
	add	r1, r4, #64000
	add	r1, r1, #248
	ldr	r0, [r5, #3520]
	mov	r2, r3
	add	r3, r3, #244
	add	r2, r2, #116
	add	r6, r4, #24576
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r10, #680]
	add	r2, r4, #64000
	add	r1, r4, #64256
	add	r2, r2, #252
	add	r1, r1, #124
	ldr	r3, [r3, #8]
	ldr	r0, [r5, #3520]
	str	r3, [r5, #2404]
	bl	FSP_GetPmvAddrTab
	ldr	r3, [r5, #628]
	str	r3, [r5, #2412]
	ldr	r3, [r10, #696]
	str	r3, [r5, #2944]
	ldr	r3, [r10, #684]
	ldr	r3, [r3, #16]
	str	r3, [r5, #2408]
	ldr	r3, [r10, #684]
	ldr	r3, [r3, #76]
	str	r3, [r5, #2416]
	ldr	r3, [r6, #2420]
	cmp	r3, #0
	str	r3, [fp, #-48]
	str	r3, [r5, #3160]
	beq	.L1240
	add	r10, r4, #26624
	add	lr, r4, #64256
	add	r1, r4, #26880
	add	r2, r4, #64512
	mov	r3, r7
	ldr	r7, [fp, #-48]
	mov	ip, r10
	mov	r0, lr
	add	r10, r10, #176
	add	lr, lr, #148
	add	ip, ip, #240
	add	r0, r0, #212
	add	r1, r1, #48
	add	r2, r2, #20
	str	r4, [fp, #-52]
.L1239:
	ldr	r4, [r10, #4]!
	add	r3, r3, #1
	cmp	r3, r7
	str	r4, [lr, #4]!
	ldr	r4, [ip, #4]!
	str	r4, [r0, #4]!
	ldr	r4, [r1, #4]!
	str	r4, [r2, #4]!
	bne	.L1239
	ldr	r4, [fp, #-52]
.L1240:
	ldrb	r3, [r9, #1333]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1265
	ldrb	r1, [r8, #1230]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1241
	add	r0, r4, #63488
	ldr	r9, .L1266+4
	add	r0, r0, #120
.L1242:
	and	r3, r1, #3
	add	r1, r1, #1
	cmp	r1, #24
	ldr	r3, [r9, r3, asl #2]
	bic	r2, r3, #16711680
	ubfx	ip, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, ip, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [r0, #4]!
	bne	.L1242
	add	r8, r4, #63488
	mov	r7, #0
	add	r8, r8, #220
.L1243:
	add	r3, r7, #1
	and	r2, r7, #14
	and	r3, r3, #15
	add	r7, r7, #2
	add	r2, r9, r2, lsl #2
	cmp	r7, #32
	add	r3, r9, r3, lsl #2
	ldr	r2, [r2, #16]
	ldr	r1, [r3, #16]
	ubfx	r3, r2, #8, #8
	mov	r0, r2, lsr #24
	uxtb	r10, r2
	uxtb	lr, r1
	mov	ip, r1, lsr #16
	orr	r3, r3, r0, asl #8
	mov	r2, r2, lsr #8
	mov	lr, lr, asl #16
	and	r0, r1, #-16777216
	orr	ip, lr, ip, asl #24
	ubfx	r1, r1, #8, #8
	orr	ip, ip, r10
	and	r2, r2, #65280
	orr	r3, r3, r0
	orr	r2, ip, r2
	orr	r3, r3, r1, asl #16
	stmia	r8, {r2, r3}
	add	r8, r8, #8
	bne	.L1243
.L1248:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1245
	add	r7, r4, #26624
	add	r9, r4, #64512
	add	r4, r4, #64768
	add	r7, r7, #180
	add	r9, r9, #224
	add	r4, r4, #32
	mov	r8, #0
.L1251:
	ldr	r2, [r7]
	mov	r1, #0
	ldr	r0, [r5, #3520]
	add	r8, r8, #1
	bl	FSP_GetStoreType
	adds	r0, r0, #0
	movne	r0, #1
	str	r0, [r9, #4]!
	ldr	r3, [r7], #4
	str	r3, [r4, #4]!
	ldr	r3, [r6, #2420]
	cmp	r3, r8
	bhi	.L1251
.L1245:
	mov	r0, #0
.L1261:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1265:
	ldrb	r1, [r8, #1230]	@ zero_extendqisi2
.L1241:
	cmp	r1, #1
	add	ip, r4, #63488
	mov	r0, #0
	add	ip, ip, #120
	beq	.L1246
.L1249:
	add	r3, r0, #3888
	add	r0, r0, #1
	add	r3, r3, #2
	cmp	r0, #24
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #8]
	bic	r2, r3, #16711680
	ubfx	r1, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r1, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1249
	add	r9, r4, #63488
	mov	r10, #1
	add	r9, r9, #220
	mov	r8, #0
.L1250:
	mov	r2, r8, lsr #3
	mov	r3, r8, asl #1
	and	r1, r10, #15
	and	r0, r3, #14
	mov	r3, r2, asl #4
	add	r8, r8, #1
	add	r2, r3, r1
	add	r3, r3, r0
	add	r2, r2, #3904
	add	r3, r3, #3904
	add	r2, r2, #10
	add	r3, r3, #10
	cmp	r8, #16
	add	r10, r10, #2
	add	r2, r4, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r1, [r2, #8]
	ldr	r3, [r3, #8]
	ubfx	r7, r1, #8, #8
	and	r0, r1, #-16777216
	mov	r2, r1, lsr #16
	uxtb	r1, r1
	mov	ip, r3, lsr #24
	uxtb	lr, r3
	mov	r2, r2, asl #24
	mov	ip, ip, asl #8
	orr	r2, r2, r1, asl #16
	orr	ip, ip, r7, asl #16
	mov	r1, r3, lsr #8
	orr	r2, r2, lr
	and	r1, r1, #65280
	ubfx	r3, r3, #8, #8
	orr	r0, ip, r0
	orr	r2, r2, r1
	orr	r3, r0, r3
	stmia	r9, {r2, r3}
	add	r9, r9, #8
	bne	.L1250
	b	.L1248
.L1246:
	add	r3, r0, #4864
	add	r0, r0, #1
	add	r3, r3, #30
	cmp	r0, #24
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	bic	r2, r3, #16711680
	ubfx	r1, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r1, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1246
	add	r9, r4, #63488
	mov	r10, #1
	add	r9, r9, #220
	mov	r8, #0
.L1247:
	mov	r2, r8, lsr #3
	mov	r3, r8, asl #1
	and	r1, r10, #15
	and	r0, r3, #14
	mov	r3, r2, asl #4
	add	r8, r8, #1
	add	r2, r3, r1
	add	r3, r3, r0
	add	r2, r2, #4864
	add	r3, r3, #4864
	add	r2, r2, #54
	add	r3, r3, #54
	cmp	r8, #16
	add	r10, r10, #2
	add	r2, r4, r2, lsl #2
	add	r3, r4, r3, lsl #2
	ldr	r1, [r2, #4]
	ldr	r3, [r3, #4]
	ubfx	r7, r1, #8, #8
	and	r0, r1, #-16777216
	mov	r2, r1, lsr #16
	uxtb	r1, r1
	mov	ip, r3, lsr #24
	uxtb	lr, r3
	mov	r2, r2, asl #24
	mov	ip, ip, asl #8
	orr	r2, r2, r1, asl #16
	orr	ip, ip, r7, asl #16
	mov	r1, r3, lsr #8
	orr	r2, r2, lr
	and	r1, r1, #65280
	ubfx	r3, r3, #8, #8
	orr	r0, ip, r0
	orr	r2, r2, r1
	orr	r3, r0, r3
	stmia	r9, {r2, r3}
	add	r9, r9, #8
	bne	.L1247
	b	.L1248
.L1234:
	ldr	r1, .L1266+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1261
.L1264:
	ldr	r3, [r5, #560]
	ldr	r1, .L1266+12
	ldr	r2, [r3, #672]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1261
.L1267:
	.align	2
.L1266:
	.word	.LC43
	.word	.LANCHOR0
	.word	.LC45
	.word	.LC44
	UNWIND(.fnend)
	.size	WritePicMsg, .-WritePicMsg
	.align	2
	.global	UpdatePicQpInf
	.type	UpdatePicQpInf, %function
UpdatePicQpInf:
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
	ldr	r2, [r1, #24]
	ldr	r3, [r1, #28]
	cmp	r2, r0
	movlt	r2, r0
	cmp	r3, r0
	str	r2, [r1, #24]
	movge	r3, r0
	str	r3, [r1, #28]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	UpdatePicQpInf, .-UpdatePicQpInf
	.align	2
	.global	WriteSliceMsg
	.type	WriteSliceMsg, %function
WriteSliceMsg:
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
	add	r7, r0, #61440
	add	lr, r0, #12288
	movw	r1, #4060
	ldr	r3, [r7, #3444]
	mov	r4, r0
	ldr	ip, [r7, #3440]
	mov	r2, r3
	str	r3, [fp, #-48]
	mul	r1, r1, r2
	add	r3, r3, #1
	str	r3, [r7, #3444]
	ldr	r3, [lr, #1284]
	add	r6, ip, r1
	sub	r3, r3, #1
	cmp	r2, r3
	addcc	r3, r1, #4048
	addcc	r3, r3, #12
	movcs	r3, #0
	addcc	r3, ip, r3
	str	r3, [r6, #4056]
	ldr	r2, [r0, #368]
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	r3, [r2, #68]
	cmp	r0, #1
	cmpls	r0, r3
	bcs	.L1272
	add	r5, r0, #3
	add	r5, r6, r5, lsl #2
.L1273:
	mov	r3, r0, asl #5
	sub	r3, r3, r0, asl #2
	add	r0, r0, #1
	add	r2, r2, r3
	ldr	r2, [r2, #24]
	str	r2, [r5, #4]!
	ldr	r2, [r4, #368]
	add	r2, r2, r3
	ldr	r2, [r2, #20]
	str	r2, [r5, #-8]
	ldr	r2, [r4, #368]
	add	r3, r2, r3
	ldr	r3, [r3, #28]
	str	r3, [r5, #8]
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #68]
	cmp	r3, r0
	movhi	r8, #1
	movls	r8, #0
	cmp	r0, #1
	movhi	r8, #0
	cmp	r8, #0
	bne	.L1273
.L1272:
	cmp	r3, #1
	bhi	.L1278
	add	r3, r3, #3
	add	r0, r6, #20
	mov	r2, #0
	add	r3, r6, r3, lsl #2
.L1277:
	str	r2, [r3, #4]!
	cmp	r3, r0
	str	r2, [r3, #-8]
	str	r2, [r3, #8]
	bne	.L1277
.L1278:
	add	r9, r4, #57344
	add	r8, r4, #16384
	add	r5, r4, #20480
	ldrb	r3, [r9, #3985]	@ zero_extendqisi2
	strb	r3, [r6, #1]
	ldr	r3, [r8, #1260]
	ldr	r0, [r5, #1820]
	add	r3, r3, #26
	add	r3, r3, r0
	str	r3, [r6, #32]
	ldr	r2, [r5, #1816]
	str	r2, [r6, #36]
	ldr	r2, [r5, #268]
	str	r2, [r6, #40]
	ldr	r2, [r5, #264]
	str	r2, [r6, #44]
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	strb	r2, [ip, r1]
	ldr	r2, [r5, #260]
	str	r2, [r6, #48]
	ldrb	r2, [r5, #214]	@ zero_extendqisi2
	strb	r2, [r6, #2]
	ldrb	r2, [lr, #1328]	@ zero_extendqisi2
	strb	r2, [r6, #3]
	ldr	r2, [r5, #252]
	str	r2, [r6, #52]
	ldr	r2, [r5, #256]
	str	r2, [r6, #56]
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L1377
	cmp	r2, #0
	ldreqb	r2, [r8, #1214]	@ zero_extendqisi2
	movne	r2, #0
	strb	r2, [r6, #4]
.L1279:
	ldr	r2, [r8, #1264]
	str	r2, [r6, #60]
	ldr	r2, [r8, #1268]
	str	r2, [r6, #64]
	ldr	r2, [r5, #1828]
	str	r2, [r6, #68]
	ldr	r2, [r5, #1832]
	str	r2, [r6, #72]
	ldr	r2, [r5, #1824]
	str	r2, [r6, #76]
	ldrb	r2, [r5, #209]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1281
	ldr	r10, [r7, #560]
	ldr	r2, [fp, #-48]
	ldr	r1, [r7, #3444]
	ldr	r0, [r10, #716]
	mla	r0, r0, r2, r3
	bl	__aeabi_uidiv
	str	r0, [r10, #752]
.L1282:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ldr	r3, [r7, #560]
	bne	.L1284
	ldr	r2, [r6, #32]
	str	r2, [r3, #744]
	ldr	r3, [r7, #560]
	ldr	r2, [r6, #32]
	str	r2, [r3, #748]
.L1285:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1323
	ldr	ip, [r5, #252]
	cmp	ip, #0
	beq	.L1326
	add	r3, r4, #24576
	ldr	r3, [r3, #2556]
	ldr	r1, [r3, #36]
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r2, r4, #26880
	movne	r3, #0
	addne	r2, r2, #252
	bne	.L1291
	b	.L1289
.L1293:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #36]
	ldrb	r0, [r1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1289
.L1291:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1293
	mov	r3, #0
	str	r3, [fp, #-52]
.L1288:
	ldr	ip, [r5, #256]
	cmp	ip, #0
	beq	.L1327
	add	r3, r4, #24576
	ldr	r3, [r3, #2688]
	ldr	r1, [r3, #36]
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r2, r4, #27136
	movne	r3, #0
	addne	r2, r2, #128
	bne	.L1297
	b	.L1295
.L1299:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #36]
	ldrb	r0, [r1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1295
.L1297:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1299
	mov	r3, #0
	str	r3, [fp, #-56]
.L1294:
	ldrb	r2, [r9, #3979]	@ zero_extendqisi2
	ldr	r3, [r5, #252]
	cmp	r2, #0
	beq	.L1300
	cmp	r3, #0
	beq	.L1315
	add	r9, r4, #26880
	mov	r3, #0
	mov	r10, r6
	str	r6, [fp, #-60]
	str	r4, [fp, #-64]
	mov	r6, r5
	add	r9, r9, #252
	ldr	r4, [fp, #-52]
	mov	r5, r3
	b	.L1314
.L1312:
	strb	r1, [r10, #1630]
	ldr	r1, [r9]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #1631]
	ldr	r1, [r9]
	ldr	r1, [r1, #12]
	str	r1, [r10, #1656]
.L1313:
	ldr	r1, [r6, #252]
	add	r5, r5, #1
	add	r9, r9, #4
	add	r10, r10, #36
	cmp	r1, r5
	bls	.L1378
.L1314:
	ldr	r1, [r9]
	ldr	r0, [r7, #3520]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #672]
	bl	FSP_GetLogicFs
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #708]
	str	r1, [r10, #1636]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #1625]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r4
	beq	.L1311
	cmp	r0, #0
	ldrne	r1, [r0, #680]
	ldrne	r0, [r1, #8]
.L1311:
	str	r0, [r10, #1640]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #712]
	str	r1, [r10, #1644]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #688]
	str	r1, [r10, #1632]
	ldr	r1, [r9]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r10, #1624]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #720]	@ zero_extendqisi2
	strb	r1, [r10, #1626]
	ldr	r1, [r9]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L1312
	strb	r1, [r10, #1628]
	ldr	r1, [r9]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #1629]
	ldr	r1, [r9]
	ldr	r1, [r1, #12]
	str	r1, [r10, #1652]
	b	.L1313
.L1378:
	mov	r5, r6
	ldr	r4, [fp, #-64]
	ldr	r6, [fp, #-60]
.L1315:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1379
.L1303:
	add	r2, r4, #26880
	add	r3, r6, #3920
	add	r0, r6, #4048
	add	r2, r2, #120
	add	r3, r3, #4
	add	r0, r0, #4
.L1320:
	ldr	r1, [r2, #4]!
	str	r1, [r3, #4]!
	cmp	r3, r0
	bne	.L1320
	ldrb	r3, [r8, #1214]	@ zero_extendqisi2
	cmp	r3, #0
	str	r3, [r7, #2396]
	ldr	r3, [r8, #1256]
	str	r3, [r7, #2400]
	beq	.L1321
	ldrb	r2, [r5, #208]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1322
.L1321:
	cmp	r3, #1
	beq	.L1380
.L1323:
	ldr	r3, [fp, #-48]
	mov	r2, #0
	ldr	r1, [r4, #368]
	add	r3, r3, #15680
	add	r3, r3, #42
	str	r1, [r4, r3, asl #2]
	str	r2, [r4, #368]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1284:
	ldr	r1, [r6, #32]
	ldr	r0, [r3, #744]
	ldr	r2, [r3, #748]
	cmp	r0, r1
	movlt	r0, r1
	cmp	r2, r1
	str	r0, [r3, #744]
	movge	r2, r1
	str	r2, [r3, #748]
	b	.L1285
.L1281:
	ldr	r10, [r7, #560]
	ldrb	r2, [r5, #210]	@ zero_extendqisi2
	ldr	r1, [r7, #3444]
	ldr	r0, [r10, #716]
	cmp	r2, #0
	ldr	r2, [fp, #-48]
	mla	r0, r0, r2, r3
	bne	.L1283
	bl	__aeabi_uidiv
	str	r0, [r10, #792]
	b	.L1282
.L1283:
	bl	__aeabi_uidiv
	str	r0, [r10, #832]
	b	.L1282
.L1289:
	ldr	r1, [r1, #672]
	ldr	r0, [r7, #3520]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	movweq	r2, #7594
	beq	.L1373
	ldr	r3, [r3, #680]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-52]
	b	.L1288
.L1380:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1323
.L1322:
	ldr	r3, [r5, #272]
	add	r9, r4, #20736
	add	lr, r4, #21504
	add	r7, r4, #20992
	add	r0, r4, #21760
	mov	r8, r9
	str	r3, [r6, #80]
	mov	ip, lr
	ldr	r10, [r5, #276]
	add	r9, r9, #20
	add	r8, r8, #148
	add	r7, r7, #20
	add	lr, lr, #20
	add	ip, ip, #148
	add	r0, r0, #20
	mov	r1, r6
	mov	r3, r6
	mov	r2, #0
	str	r6, [fp, #-52]
	str	r10, [r1, #84]!
.L1324:
	ldr	r10, [r9, #4]!
	add	r2, r2, #1
	add	r3, r3, #4
	str	r10, [r1, #4]!
	ldr	r10, [r8, #4]!
	str	r10, [r3, #212]
	ldr	r10, [r7, #4]!
	str	r10, [r3, #340]
	ldr	r10, [lr, #4]!
	str	r10, [r3, #852]
	ldr	r10, [ip, #4]!
	str	r10, [r3, #980]
	ldr	r10, [r0, #4]!
	str	r10, [r3, #1108]
	ldr	r10, [r5, #264]
	cmp	r10, r2
	bcs	.L1324
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1323
	add	lr, r4, #21248
	add	r1, r4, #22016
	add	r7, r4, #20992
	add	r0, r4, #21760
	ldr	r8, [fp, #-52]
	mov	ip, lr
	mov	r2, r1
	add	r6, r6, #468
	add	r7, r7, #148
	add	lr, lr, #20
	add	ip, ip, #148
	add	r0, r0, #148
	add	r1, r1, #20
	add	r2, r2, #148
	mov	r3, #0
.L1325:
	ldr	r9, [r7, #4]!
	add	r3, r3, #1
	add	r8, r8, #4
	str	r9, [r6, #4]!
	ldr	r9, [lr, #4]!
	str	r9, [r8, #596]
	ldr	r9, [ip, #4]!
	str	r9, [r8, #724]
	ldr	r9, [r0, #4]!
	str	r9, [r8, #1236]
	ldr	r9, [r1, #4]!
	str	r9, [r8, #1364]
	ldr	r9, [r2, #4]!
	str	r9, [r8, #1492]
	ldr	r9, [r5, #268]
	cmp	r9, r3
	bcs	.L1325
	b	.L1323
.L1300:
	cmp	r3, #0
	beq	.L1308
	add	r3, r4, #26880
	str	r4, [fp, #-64]
	add	r3, r3, #252
	ldr	r4, [fp, #-52]
	mov	r10, r6
	str	r6, [fp, #-60]
	mov	r9, r3
	mov	r6, r5
	mov	r5, r2
.L1307:
	ldr	r1, [r9]
	ldr	r0, [r7, #3520]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #672]
	bl	FSP_GetLogicFs
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #708]
	str	r1, [r10, #1636]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #1625]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r4
	beq	.L1306
	cmp	r0, #0
	ldrne	r1, [r0, #680]
	ldrne	r0, [r1, #8]
.L1306:
	str	r0, [r10, #1640]
	mov	r3, #0
	ldr	r1, [r9]
	add	r5, r5, #1
	add	r10, r10, #36
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #712]
	str	r1, [r10, #1608]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #688]
	str	r1, [r10, #1596]
	ldr	r1, [r9]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #1591]
	ldr	r1, [r9]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r10, #1590]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #732]
	str	r1, [r10, #1612]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #772]
	str	r1, [r10, #1616]
	ldr	r1, [r9], #4
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #812]
	strb	r3, [r10, #1588]
	str	r1, [r10, #1620]
	ldr	r1, [r6, #252]
	cmp	r1, r5
	bhi	.L1307
	mov	r5, r6
	ldr	r4, [fp, #-64]
	ldr	r6, [fp, #-60]
.L1308:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1303
	ldr	r3, [r5, #256]
	cmp	r3, #0
	beq	.L1303
	add	r3, r4, #27136
	str	r4, [fp, #-60]
	add	r3, r3, #128
	ldr	r4, [fp, #-56]
	mov	r9, #0
	mov	r10, r6
	str	r6, [fp, #-52]
	mov	r6, r5
	mov	r5, r9
	mov	r9, r3
.L1310:
	ldr	r1, [r9]
	ldr	r0, [r7, #3520]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #672]
	bl	FSP_GetLogicFs
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #708]
	str	r1, [r10, #2788]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2777]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r4
	beq	.L1309
	cmp	r0, #0
	ldrne	r1, [r0, #680]
	ldrne	r0, [r1, #8]
.L1309:
	str	r0, [r10, #1640]
	mov	r3, #0
	ldr	r1, [r9]
	add	r5, r5, #1
	add	r10, r10, #36
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #712]
	str	r1, [r10, #2760]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #688]
	str	r1, [r10, #2748]
	ldr	r1, [r9]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2743]
	ldr	r1, [r9]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r10, #2742]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #732]
	str	r1, [r10, #2764]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #772]
	str	r1, [r10, #2768]
	ldr	r1, [r9], #4
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #812]
	strb	r3, [r10, #2740]
	str	r1, [r10, #2772]
	ldr	r1, [r6, #256]
	cmp	r1, r5
	bhi	.L1310
.L1372:
	mov	r5, r6
	ldr	r4, [fp, #-60]
	ldr	r6, [fp, #-52]
	b	.L1303
.L1295:
	ldr	r1, [r1, #672]
	ldr	r0, [r7, #3520]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	beq	.L1381
	ldr	r3, [r3, #680]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-56]
	b	.L1294
.L1377:
	ldr	r2, [r8, #1256]
	strb	r2, [r6, #4]
	b	.L1279
.L1379:
	ldr	r3, [r5, #256]
	cmp	r3, #0
	beq	.L1303
	add	r9, r4, #27136
	mov	r3, #0
	mov	r10, r6
	str	r6, [fp, #-52]
	str	r4, [fp, #-60]
	mov	r6, r5
	add	r9, r9, #128
	ldr	r4, [fp, #-56]
	mov	r5, r3
	b	.L1319
.L1317:
	strb	r1, [r10, #2782]
	ldr	r1, [r9]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2783]
	ldr	r1, [r9]
	ldr	r1, [r1, #12]
	str	r1, [r10, #2808]
.L1318:
	ldr	r1, [r6, #256]
	add	r5, r5, #1
	add	r9, r9, #4
	add	r10, r10, #36
	cmp	r1, r5
	bls	.L1372
.L1319:
	ldr	r1, [r9]
	ldr	r0, [r7, #3520]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #672]
	bl	FSP_GetLogicFs
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #708]
	str	r1, [r10, #2788]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2777]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r4
	beq	.L1316
	cmp	r0, #0
	ldrne	r1, [r0, #680]
	ldrne	r0, [r1, #8]
.L1316:
	str	r0, [r10, #2792]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #712]
	str	r1, [r10, #2796]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldr	r1, [r1, #688]
	str	r1, [r10, #2784]
	ldr	r1, [r9]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r10, #2776]
	ldr	r1, [r9]
	ldr	r1, [r1, #36]
	ldrb	r1, [r1, #720]	@ zero_extendqisi2
	strb	r1, [r10, #2778]
	ldr	r1, [r9]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L1317
	strb	r1, [r10, #2780]
	ldr	r1, [r9]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2781]
	ldr	r1, [r9]
	ldr	r1, [r1, #12]
	str	r1, [r10, #2804]
	b	.L1318
.L1381:
	movw	r2, #7615
.L1373:
	ldr	r1, .L1382
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L1326:
	str	ip, [fp, #-52]
	b	.L1288
.L1327:
	str	ip, [fp, #-56]
	b	.L1294
.L1383:
	.align	2
.L1382:
	.word	.LC46
	UNWIND(.fnend)
	.size	WriteSliceMsg, .-WriteSliceMsg
	.align	2
	.global	StopPicNum
	.type	StopPicNum, %function
StopPicNum:
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
	.size	StopPicNum, .-StopPicNum
	.align	2
	.global	H264_GetPicStreamSize
	.type	H264_GetPicStreamSize, %function
H264_GetPicStreamSize:
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
	add	r0, r0, #61440
	ldr	r2, [r0, #3168]
	cmp	r2, #0
	beq	.L1388
	mov	r0, #0
.L1387:
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L1387
	ldmfd	sp, {fp, sp, pc}
.L1388:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264_GetPicStreamSize, .-H264_GetPicStreamSize
	.align	2
	.global	SliceCheck
	.type	SliceCheck, %function
SliceCheck:
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
	ldr	r1, .L1401
	add	r4, r0, #20480
	add	r6, r0, #61440
	mov	r5, r0
	bl	ue_v
	str	r0, [r4, #260]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L1399
	cmp	r0, #262144
	bcs	.L1400
	add	r2, r5, #12288
	ldr	r1, [r2, #1276]
	ldr	r3, [r2, #1280]
	mul	r3, r3, r1
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L1399
	mov	r0, r5
	ldr	r1, .L1401+4
	bl	ue_v
	ldr	r1, .L1401+8
	mov	r2, r0
	mov	r5, r0
	mov	r0, #19
	bl	dprint_vfmw
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L1399
	cmp	r5, #9
	bhi	.L1395
	mov	r1, #1
	movw	r0, #297
	mov	r2, r1, asl r5
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L1396
	ands	r3, r2, #660
	bne	.L1397
	tst	r2, #66
	beq	.L1395
	strb	r1, [r4, #208]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1396:
	strb	r3, [r4, #208]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1395:
	mov	r2, r5
	ldr	r1, .L1401+12
	mov	r0, #1
	bl	dprint_vfmw
.L1399:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1397:
	mov	r3, #2
	strb	r3, [r4, #208]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1400:
	ldr	r1, .L1401+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1402:
	.align	2
.L1401:
	.word	.LC47
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC48
	UNWIND(.fnend)
	.size	SliceCheck, .-SliceCheck
	.align	2
	.global	PPSSPSCheck
	.type	PPSSPSCheck, %function
PPSSPSCheck:
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
	add	r5, r0, #20480
	mov	r4, r0
	add	r4, r4, #12288
	ldr	r1, .L1409
	ldr	r2, [r5, #220]
	mov	r0, #19
	bl	dprint_vfmw
	ldr	r1, [r4, #1304]
	ldr	r2, [r5, #220]
	mov	r3, #2208
	mla	r3, r3, r2, r1
	ldrb	r1, [r3, #19]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1407
	ldr	r2, [r3, #28]
	mov	r3, #4000
	ldr	r1, [r4, #1300]
	mla	r3, r3, r2, r1
	ldrb	r3, [r3, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1408
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1407:
	ldr	r1, .L1409+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1408:
	ldr	r1, .L1409+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1410:
	.align	2
.L1409:
	.word	.LC52
	.word	.LC53
	.word	.LC54
	UNWIND(.fnend)
	.size	PPSSPSCheck, .-PPSSPSCheck
	.align	2
	.global	PPSSPSCheckTmpId
	.type	PPSSPSCheckTmpId, %function
PPSSPSCheckTmpId:
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
	mov	r2, r1
	mov	r5, r1
	mov	r4, r0
	ldr	r1, .L1419
	mov	r0, #19
	bl	dprint_vfmw
	add	r0, r4, #12288
	mov	r3, #2208
	ldr	r2, [r0, #1304]
	mla	r3, r3, r5, r2
	ldrb	r2, [r3, #19]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1416
	ldr	r1, [r0, #1288]
	ldr	r2, [r3, #28]
	sub	r3, r1, #1
	cmp	r2, r3
	bhi	.L1417
	ldr	r1, [r0, #1300]
	mov	r3, #4000
	mla	r3, r3, r2, r1
	ldrb	r3, [r3, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1418
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1416:
	mov	r2, r5
	ldr	r1, .L1419+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1417:
	ldr	r1, .L1419+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1418:
	ldr	r1, .L1419+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1420:
	.align	2
.L1419:
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	UNWIND(.fnend)
	.size	PPSSPSCheckTmpId, .-PPSSPSCheckTmpId
	.align	2
	.global	IsNewPic
	.type	IsNewPic, %function
IsNewPic:
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
	add	r3, r0, #20480
	add	lr, r0, #12288
	ldr	ip, [r3, #1860]
	ldr	r1, [lr, #1344]
	ldr	r2, [r3, #1864]
	ldr	r4, [r3, #220]
	ldr	r6, [r3, #1872]
	cmp	r2, r4
	cmpeq	ip, r1
	ldr	r5, [r3, #228]
	ldrb	r4, [r3, #1856]	@ zero_extendqisi2
	ldrb	ip, [r3, #209]	@ zero_extendqisi2
	movne	r1, #1
	moveq	r1, #0
	cmp	r6, r5
	moveq	r2, r1
	orrne	r2, r1, #1
	cmp	r4, ip
	orrne	r2, r2, #1
	cmp	r4, #0
	cmpne	ip, #0
	beq	.L1423
	ldrb	ip, [r3, #1857]	@ zero_extendqisi2
	ldrb	r1, [r3, #210]	@ zero_extendqisi2
	cmp	ip, r1
	orrne	r2, r2, #1
.L1423:
	ldr	r1, [r3, #1868]
	ldr	ip, [r3, #240]
	cmp	r1, ip
	moveq	r1, #0
	beq	.L1424
	cmp	ip, #0
	cmpne	r1, #0
	moveq	r1, #1
	movne	r1, #0
.L1424:
	ldrb	ip, [r3, #1858]	@ zero_extendqisi2
	ldrb	r4, [r3, #211]	@ zero_extendqisi2
	cmp	ip, r4
	orrne	r2, r2, #1
	cmp	r4, #5
	cmpeq	ip, #5
	orr	r2, r2, r1
	beq	.L1432
.L1425:
	ldr	r1, [lr, #3508]
	cmp	r1, #0
	bne	.L1426
	add	r0, r0, #16384
	ldr	r1, [r3, #1880]
	ldr	ip, [r3, #1884]
	ldr	lr, [r0, #3424]
	ldr	r0, [r0, #3420]
	cmp	r1, r0
	cmpeq	ip, lr
	movne	r1, #1
	moveq	r1, #0
	orr	r2, r2, r1
.L1427:
	ldr	r4, [r3, #260]
	mov	r0, #19
	ldr	r1, .L1433
	cmp	r4, #0
	movne	r4, r2
	orreq	r4, r2, #1
	mov	r2, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1426:
	cmp	r1, #1
	bne	.L1427
	add	r0, r0, #16384
	ldr	r1, [r3, #1888]
	ldr	ip, [r3, #1892]
	ldr	lr, [r0, #3472]
	ldr	r0, [r0, #3468]
	cmp	r1, r0
	cmpeq	ip, lr
	movne	r1, #1
	moveq	r1, #0
	orr	r2, r2, r1
	b	.L1427
.L1432:
	ldr	ip, [r3, #1876]
	ldr	r1, [r3, #248]
	cmp	ip, r1
	orrne	r2, r2, #1
	b	.L1425
.L1434:
	.align	2
.L1433:
	.word	.LC59
	UNWIND(.fnend)
	.size	IsNewPic, .-IsNewPic
	.align	2
	.global	ref_pic_list_reordering
	.type	ref_pic_list_reordering, %function
ref_pic_list_reordering:
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
	add	r5, r0, #20480
	add	r3, r0, #12288
	mov	lr, #2208
	mov	ip, #4000
	ldr	r2, [r3, #1304]
	add	r8, r0, #16384
	ldr	r1, [r5, #220]
	mov	r4, r0
	ldr	r3, [r3, #1300]
	mov	r0, #0
	mov	r7, #1
	mla	r2, lr, r1, r2
	ldr	r2, [r2, #28]
	strb	r0, [r8, #3512]
	strb	r0, [r8, #3513]
	mla	r3, ip, r2, r3
	ldrb	r1, [r5, #209]	@ zero_extendqisi2
	cmp	r1, r0
	ldr	r3, [r3, #2196]
	addne	r3, r3, #5
	addeq	r3, r3, #4
	mov	r7, r7, asl r3
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	cmp	r3, #1
	addhi	r6, r4, #61440
	bls	.L1489
.L1488:
	ldr	r3, [r6, #3460]
.L1454:
	adds	r3, r3, #0
	movne	r3, #1
	rsb	r0, r3, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1489:
	ldr	r1, .L1494
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r8, #3512]
	cmp	r0, #0
	beq	.L1487
	ldr	r3, [r5, #264]
	cmn	r3, #2
	beq	.L1468
	add	r10, r4, #19712
	add	r6, r4, #61440
	add	r10, r10, #184
	mov	r9, #0
	b	.L1451
.L1446:
	cmp	r0, #2
	beq	.L1490
.L1449:
	ldr	r3, [r5, #264]
	add	r3, r3, #2
	cmp	r3, r9
	bls	.L1491
.L1451:
	ldr	r1, .L1494+4
	mov	r0, r4
	bl	ue_v
	add	r9, r9, #1
	cmp	r0, #3
	str	r0, [r10, #4]!
	ldr	r3, [r6, #3460]
	bhi	.L1442
	cmp	r3, #0
	bne	.L1442
	cmp	r0, #3
	beq	.L1445
	cmp	r0, #1
	bhi	.L1446
	ldr	r1, .L1494+8
	mov	r0, r4
	bl	ue_v
	cmp	r7, r0
	str	r0, [r10, #264]
	ldr	r3, [r6, #3460]
	bls	.L1448
	cmp	r3, #0
	beq	.L1449
.L1448:
	mov	r2, r0
	ldr	r1, .L1494+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1490:
	ldr	r1, .L1494+16
	mov	r0, r4
	bl	ue_v
	str	r0, [r10, #528]
	b	.L1449
.L1487:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	add	r6, r4, #61440
.L1438:
	cmp	r3, #1
	bne	.L1488
	ldr	r1, .L1494+20
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r8, #3513]
	cmp	r0, #0
	beq	.L1488
	ldr	r3, [r5, #268]
	cmn	r3, #2
	beq	.L1488
	add	r9, r4, #19968
	mov	r8, #0
	add	r9, r9, #60
	b	.L1466
.L1465:
	add	r8, r8, #1
	cmp	r8, r3
	bcs	.L1488
.L1466:
	ldr	r1, .L1494+24
	mov	r0, r4
	bl	ue_v
	cmp	r0, #3
	str	r0, [r9, #4]!
	ldr	r3, [r6, #3460]
	bhi	.L1458
	cmp	r3, #0
	bne	.L1458
	cmp	r0, #3
	beq	.L1454
	cmp	r0, #1
	bls	.L1492
	cmp	r0, #2
	beq	.L1493
	ldr	r3, [r5, #268]
	add	r3, r3, #2
	cmp	r3, r8
	bne	.L1465
.L1467:
	ldr	r1, .L1494+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1492:
	ldr	r1, .L1494+32
	mov	r0, r4
	bl	ue_v
	cmp	r7, r0
	str	r0, [r9, #264]
	ldr	r3, [r6, #3460]
	bls	.L1462
	cmp	r3, #0
	bne	.L1462
.L1463:
	ldr	r2, [r5, #268]
	add	r3, r2, #2
	cmp	r3, r8
	bne	.L1465
	add	r2, r2, #4992
	add	r2, r2, #18
	ldr	r2, [r4, r2, asl #2]
	cmp	r2, #3
	beq	.L1465
	b	.L1467
.L1493:
	ldr	r1, .L1494+36
	mov	r0, r4
	bl	ue_v
	str	r0, [r9, #524]
	b	.L1463
.L1445:
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	b	.L1438
.L1442:
	mov	r2, r0
	ldr	r1, .L1494+40
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1458:
	mov	r2, r0
	ldr	r1, .L1494+44
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1491:
	cmp	r9, r3
	bne	.L1445
.L1440:
	add	r3, r3, #4928
	add	r3, r3, #46
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #3
	beq	.L1487
	ldr	r1, .L1494+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1462:
	mov	r2, r0
	ldr	r1, .L1494+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1468:
	mov	r3, #0
	b	.L1440
.L1495:
	.align	2
.L1494:
	.word	.LC60
	.word	.LC61
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC67
	.word	.LC68
	.word	.LC73
	.word	.LC70
	.word	.LC72
	.word	.LC62
	.word	.LC69
	.word	.LC66
	.word	.LC71
	UNWIND(.fnend)
	.size	ref_pic_list_reordering, .-ref_pic_list_reordering
	.align	2
	.global	pred_weight_table
	.type	pred_weight_table, %function
pred_weight_table:
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
	add	r3, r0, #12288
	add	r6, r0, #20480
	mov	r10, #2208
	ldr	r2, [r3, #1304]
	mov	r7, #4000
	ldr	ip, [r6, #220]
	mov	r5, r0
	ldr	r3, [r3, #1300]
	mov	r4, #1
	ldr	r1, .L1526
	mla	r2, r10, ip, r2
	str	r2, [fp, #-48]
	ldr	r2, [r2, #28]
	mla	r7, r7, r2, r3
	bl	ue_v
	str	r0, [r6, #272]
	mov	r8, r4, asl r0
	ldr	r9, [r7, #40]
	cmp	r9, #0
	bne	.L1520
.L1497:
	cmp	r0, #7
	bhi	.L1500
	ldr	r3, [r6, #276]
	cmp	r3, #7
	bhi	.L1500
	add	r3, r5, #61440
	str	r3, [fp, #-52]
	ldr	r2, [r3, #3460]
	cmp	r2, #0
	addeq	r10, r5, #20736
	moveq	r4, r2
	addeq	r10, r10, #152
	beq	.L1508
	b	.L1499
.L1504:
	ldr	r2, [r7, #40]
	cmp	r2, #0
	bne	.L1521
.L1505:
	str	r2, [r10]
	str	r2, [r10, #768]
	str	r2, [r10, #128]
	str	r2, [r10, #896]
.L1507:
	ldr	r2, [r6, #264]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r2, r4
	bcc	.L1522
.L1508:
	ldr	r1, .L1526+4
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1504
	ldr	r1, .L1526+8
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1526+12
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #640]
	ldr	r2, [r7, #40]
	cmp	r2, #0
	beq	.L1505
.L1521:
	ldr	r1, .L1526+16
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1523
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1507
.L1522:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #44]
	cmp	r3, #1
	beq	.L1509
.L1510:
	ldr	r3, [fp, #-52]
	ldr	r0, [r3, #3460]
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1502:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1523:
	ldr	r1, .L1526+20
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1526+24
	str	r0, [r10]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1526+20
	str	r0, [r10, #768]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1526+24
	str	r0, [r10, #128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #896]
	b	.L1507
.L1520:
	ldr	r1, .L1526+28
	mov	r0, r5
	bl	ue_v
	mov	r3, r0
	ldr	r0, [r6, #272]
	mov	r9, r4, asl r3
	str	r3, [r6, #276]
	b	.L1497
.L1509:
	ldrb	r3, [r6, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1510
	add	r10, r5, #21248
	mov	r4, #0
	add	r10, r10, #24
	b	.L1516
.L1512:
	ldr	r3, [r7, #40]
	cmp	r3, #0
	bne	.L1524
.L1513:
	str	r3, [r10]
	str	r3, [r10, #768]
	str	r3, [r10, #128]
	str	r3, [r10, #896]
.L1515:
	ldr	r3, [r6, #268]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r3, r4
	bcc	.L1510
.L1516:
	ldr	r1, .L1526+32
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1512
	ldr	r1, .L1526+36
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1526+40
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #640]
	ldr	r3, [r7, #40]
	cmp	r3, #0
	beq	.L1513
.L1524:
	ldr	r1, .L1526+44
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1525
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1515
.L1500:
	add	r5, r5, #61440
	ldr	r2, [r5, #3460]
.L1499:
	ldr	r1, .L1526+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1502
.L1525:
	ldr	r1, .L1526+52
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1526+56
	str	r0, [r10]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1526+52
	str	r0, [r10, #768]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1526+56
	str	r0, [r10, #128]
	mov	r0, r5
	bl	se_v
	str	r0, [r10, #896]
	b	.L1515
.L1527:
	.align	2
.L1526:
	.word	.LC74
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC82
	.word	.LC75
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC76
	.word	.LC87
	.word	.LC88
	UNWIND(.fnend)
	.size	pred_weight_table, .-pred_weight_table
	.align	2
	.global	DecMMCO
	.type	DecMMCO, %function
DecMMCO:
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
	cmp	r1, #0
	mov	r9, r0
	moveq	r6, #100
	beq	.L1540
	add	r8, r0, #24576
	mov	r10, #0
	b	.L1531
.L1562:
	ldr	r1, .L1568
	mov	r0, r9
	bl	ue_v
	cmp	r4, #2
	beq	.L1560
.L1542:
	cmp	r4, #6
	orreq	r5, r5, #1
	cmp	r5, #0
	bne	.L1545
	cmp	r4, #4
	beq	.L1561
.L1546:
	cmp	r4, #6
	bhi	.L1538
.L1543:
	add	r3, r9, #61440
	ldr	r3, [r3, #3460]
	cmp	r3, #0
	bne	.L1538
	cmp	r4, #0
	beq	.L1548
.L1547:
	subs	r6, r6, #1
	beq	.L1549
.L1540:
	ldr	r1, .L1568+4
	mov	r0, r9
	bl	ue_v
	bic	r3, r0, #2
	sub	r5, r0, #3
	clz	r5, r5
	cmp	r3, #1
	mov	r4, r0
	mov	r5, r5, lsr #5
	beq	.L1562
	cmp	r4, #2
	bne	.L1542
.L1560:
	ldr	r1, .L1568+8
	mov	r0, r9
	bl	ue_v
	cmp	r5, #0
	beq	.L1543
.L1545:
	ldr	r1, .L1568+12
	mov	r0, r9
	bl	ue_v
	cmp	r4, #4
	bne	.L1546
.L1561:
	ldr	r1, .L1568+16
	mov	r0, r9
	bl	ue_v
	add	r3, r9, #61440
	ldr	r3, [r3, #3460]
	cmp	r3, #0
	beq	.L1547
.L1538:
	ldr	r1, .L1568+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1567:
	ldr	r1, .L1568
	mov	r0, r9
	bl	ue_v
	ldr	r2, [r4, #8]
	cmp	r2, #2
	str	r0, [r4, #12]
	beq	.L1563
.L1534:
	cmp	r2, #3
	cmpne	r2, #6
	beq	.L1564
.L1535:
	cmp	r2, #4
	beq	.L1565
.L1536:
	cmp	r2, #6
	bhi	.L1538
	add	r3, r9, #61440
	ldr	r3, [r3, #3460]
	cmp	r3, #0
	bne	.L1538
	cmp	r2, #0
	add	r10, r10, #1
	beq	.L1548
	cmp	r10, #100
	beq	.L1566
.L1531:
	ldr	r1, .L1568+4
	mov	r0, r9
	ldr	r5, [r8, #1812]
	bl	ue_v
	mov	r6, r10, asl #2
	mov	r7, r10, asl #4
	add	r4, r6, r7
	movw	r3, #2004
	mla	r4, r3, r5, r4
	add	r4, r9, r4
	add	r4, r4, #22272
	add	r4, r4, #104
	bic	r1, r0, #2
	str	r0, [r4, #8]
	cmp	r1, #1
	mov	r2, r0
	beq	.L1567
	cmp	r2, #2
	bne	.L1534
.L1563:
	ldr	r1, .L1568+8
	mov	r0, r9
	bl	ue_v
	add	r3, r6, r7
	movw	r2, #2004
	mla	r3, r2, r5, r3
	add	r3, r9, r3
	add	r2, r3, #22272
	str	r0, [r2, #120]
	ldr	r2, [r2, #112]
	cmp	r2, #3
	cmpne	r2, #6
	bne	.L1535
.L1564:
	ldr	r1, .L1568+12
	mov	r0, r9
	bl	ue_v
	add	r3, r6, r7
	movw	r2, #2004
	mla	r3, r2, r5, r3
	add	r3, r9, r3
	add	r2, r3, #22272
	str	r0, [r2, #124]
	ldr	r2, [r2, #112]
	cmp	r2, #4
	bne	.L1536
.L1565:
	ldr	r1, .L1568+16
	mov	r0, r9
	bl	ue_v
	add	r6, r6, r7
	movw	r7, #2004
	mla	r5, r7, r5, r6
	add	r5, r9, r5
	add	r3, r5, #22272
	add	r5, r3, #104
	ldr	r2, [r3, #112]
	str	r0, [r3, #128]
	b	.L1536
.L1548:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1566:
	ldr	r1, .L1568+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1549:
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1569:
	.align	2
.L1568:
	.word	.LC91
	.word	.LC90
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC89
	UNWIND(.fnend)
	.size	DecMMCO, .-DecMMCO
	.align	2
	.global	dec_ref_pic_marking
	.type	dec_ref_pic_marking, %function
dec_ref_pic_marking:
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
	add	r3, r0, #20480
	add	r6, r0, #24576
	mov	r5, r0
	ldrb	r8, [r3, #213]	@ zero_extendqisi2
	ldr	r7, [r6, #1812]
	cmp	r8, #0
	beq	.L1571
	clz	r4, r7
	mov	r4, r4, lsr #5
	str	r4, [r6, #1812]
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1589
.L1572:
	ldr	r1, .L1594
	mov	r0, r5
	bl	u_1
	movw	r1, #2004
	mla	r4, r1, r4, r5
	ldr	r1, .L1594+4
	add	r4, r4, #22272
	add	r4, r4, #104
	mov	r3, r0
	uxtb	r2, r0
	strb	r3, [r4, #7]
	mov	r0, #16
	bl	dprint_vfmw
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1574
.L1578:
	mov	r8, #0
.L1586:
	mov	r0, r8
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1571:
	movw	r4, #2004
	mla	r4, r4, r7, r0
	add	r4, r4, #22272
	add	r4, r4, #104
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1590
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	mov	r4, r7
	cmp	r3, #5
	bne	.L1572
.L1589:
	ldr	r1, .L1594+8
	mov	r0, r5
	bl	u_1
	movw	r3, #2004
	mla	r4, r3, r4, r5
	ldr	r1, .L1594+12
	mov	r8, #0
	add	r4, r4, #22272
	strb	r0, [r4, #109]
	mov	r0, r5
	bl	u_1
	ldrb	r2, [r4, #109]	@ zero_extendqisi2
	ldr	r1, .L1594+16
	strb	r0, [r4, #110]
	mov	r0, #16
	bl	dprint_vfmw
	mov	r0, r8
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1590:
	ldrb	r3, [r3, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1591
	ldr	r1, .L1594
	ldrb	r6, [r4, #7]	@ zero_extendqisi2
	bl	u_1
	cmp	r6, r0
	bne	.L1592
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1578
	mov	r1, r8
	mov	r0, r5
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	DecMMCO
.L1574:
	mov	r0, r5
	mov	r1, #1
	bl	DecMMCO
	cmn	r0, #1
	mov	r8, r0
	movne	r3, #1
	movne	r8, #0
	strneb	r3, [r4, #4]
	bne	.L1586
	mov	r3, #0
	ldr	r1, .L1594+20
	strb	r3, [r4, #4]
	mov	r0, #1
	str	r7, [r6, #1812]
	bl	dprint_vfmw
	b	.L1586
.L1591:
	ldr	r1, .L1594+8
	ldrb	r6, [r4, #5]	@ zero_extendqisi2
	bl	u_1
	cmp	r6, r0
	bne	.L1593
	mov	r0, r5
	ldr	r1, .L1594+12
	ldrb	r4, [r4, #6]	@ zero_extendqisi2
	bl	u_1
	cmp	r4, r0
	beq	.L1578
	ldr	r1, .L1594+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1586
.L1592:
	add	r5, r5, #61440
	ldr	r1, .L1594+28
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	ldr	ip, [r5, #3464]
	ldr	r3, [r5, #3500]
	mov	r0, #1
	ldr	r2, [r5, #3484]
	ldr	r1, .L1594+32
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1586
.L1593:
	ldr	r1, .L1594+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1586
.L1595:
	.align	2
.L1594:
	.word	.LC99
	.word	.LC100
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC101
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC102
	UNWIND(.fnend)
	.size	dec_ref_pic_marking, .-dec_ref_pic_marking
	.align	2
	.global	ProcessSliceHeaderFirstPart
	.type	ProcessSliceHeaderFirstPart, %function
ProcessSliceHeaderFirstPart:
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
	ldr	r1, .L1670
	add	r5, r0, #12288
	mov	r6, r0
	bl	ue_v
	ldr	r3, [r5, #1292]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r10, r0
	bhi	.L1597
	add	r9, r6, #61440
	ldr	r3, [r9, #3460]
	cmp	r3, #0
	bne	.L1597
	mov	r1, r0
	mov	r0, r6
	bl	PPSSPSCheckTmpId
	subs	r8, r0, #0
	bne	.L1661
	add	r4, r6, #20480
	mov	r7, #2208
	mov	r1, #4000
	str	r10, [r4, #220]
	ldr	r2, [r5, #1304]
	ldrb	r0, [r4, #211]	@ zero_extendqisi2
	ldr	r3, [r5, #1300]
	mla	r7, r7, r10, r2
	cmp	r0, #5
	ldr	r2, [r7, #28]
	mla	r5, r1, r2, r3
	beq	.L1601
	ldr	r3, [r5, #3244]
	cmp	r3, #0
	beq	.L1601
.L1602:
	ldr	r1, [r5, #2196]
	mov	r0, r6
	ldr	r2, .L1670+4
	add	r1, r1, #4
	bl	u_v
	str	r0, [r4, #228]
	ldr	r3, [r9, #3460]
	cmp	r3, #0
	bne	.L1659
	ldrb	r3, [r4, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1662
.L1605:
	mov	r3, #0
	strb	r3, [r4, #209]
	strb	r3, [r4, #210]
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1663
	ldr	r2, [r5, #3248]
	ldr	r1, [r5, #3252]
	add	r3, r2, #1
	mla	r3, r1, r3, r3
.L1629:
	ldrb	r2, [r5, #19]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1612
	strb	r2, [r4, #212]
.L1614:
	ldr	r2, [r4, #260]
	cmp	r2, r3
	bcs	.L1664
.L1615:
	ldrb	r3, [r4, #211]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1665
.L1617:
	add	r10, r6, #16384
	mov	r3, #0
	str	r3, [r10, #3420]
	str	r3, [r10, #3424]
	ldr	r3, [r5, #2200]
	cmp	r3, #0
	beq	.L1666
.L1621:
	mov	r3, #0
	str	r3, [r10, #3468]
	str	r3, [r10, #3472]
	ldr	r3, [r5, #2200]
	cmp	r3, #1
	beq	.L1667
.L1624:
	ldr	r3, [r9, #3460]
	cmp	r3, #0
	bne	.L1659
	ldrb	r3, [r7, #17]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1627
	ldr	r1, .L1670+8
	mov	r0, r6
	bl	ue_v
	cmp	r0, #0
	bne	.L1628
	ldr	r3, [r9, #3460]
	cmp	r3, #0
	bne	.L1628
.L1627:
	mov	r0, r6
	bl	IsNewPic
	uxtb	r0, r0
	strb	r0, [r4, #213]
	cmp	r0, #0
	bne	.L1641
	ldr	r2, [r4, #260]
	ldr	r3, [r4, #1896]
	cmp	r2, r3
	bls	.L1668
.L1641:
	mov	r0, r8
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1601:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1602
	ldr	r1, .L1670+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1641
.L1612:
	mov	r2, #1
	strb	r2, [r4, #212]
.L1632:
	ldr	r2, [r4, #260]
	cmp	r2, r3, lsr #1
	bcc	.L1615
	ldr	r1, .L1670+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1641
.L1628:
	ldr	r1, .L1670+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L1670+24
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L1659
	mov	r3, #0
	ldr	r0, [r9, #3520]
	mov	r2, r3
	mov	r1, #102
	blx	ip
.L1659:
	mvn	r8, #0
	mov	r0, r8
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1663:
	ldr	r1, .L1670+28
	mov	r0, r6
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #209]
	cmp	r0, #0
	bne	.L1669
	ldr	r2, [r5, #3248]
	ldrb	ip, [r5, #18]	@ zero_extendqisi2
	ldr	r1, [r5, #3252]
	add	r3, r2, #1
	cmp	ip, #0
	mla	r3, r1, r3, r3
	bne	.L1631
	mov	r3, r3, asl #1
	b	.L1629
.L1666:
	ldr	r1, [r5, #2204]
	mov	r0, r6
	ldr	r2, .L1670+32
	add	r1, r1, #4
	bl	u_v
	str	r0, [r10, #3420]
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1621
	ldrb	r3, [r4, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1621
	ldr	r1, .L1670+36
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3424]
	b	.L1621
.L1662:
	cmp	r0, #0
	str	r0, [r4, #224]
	beq	.L1605
	ldr	r1, .L1670+40
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1605
.L1667:
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1624
	ldr	r1, .L1670+44
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3468]
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1624
	ldrb	r3, [r4, #209]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1624
	ldr	r1, .L1670+48
	mov	r0, r6
	bl	se_v
	str	r0, [r10, #3472]
	b	.L1624
.L1669:
	ldr	r1, .L1670+52
	mov	r0, r6
	bl	u_1
	strb	r0, [r4, #210]
	ldr	r2, [r5, #3248]
	ldrb	r0, [r5, #18]	@ zero_extendqisi2
	ldr	r1, [r5, #3252]
	add	r3, r2, #1
	cmp	r0, #0
	ldrb	r0, [r4, #209]	@ zero_extendqisi2
	mla	r3, r1, r3, r3
	moveq	r2, #2
	beq	.L1610
.L1631:
	mov	r2, #1
.L1610:
	cmp	r0, #0
	mul	r3, r2, r3
	beq	.L1629
	cmp	r0, #1
	mov	r2, #0
	strb	r2, [r4, #212]
	bne	.L1614
	b	.L1632
.L1665:
	ldr	r1, .L1670+56
	mov	r0, r6
	bl	ue_v
	cmp	r0, #65536
	str	r0, [r4, #248]
	bcs	.L1618
	ldr	r3, [r9, #3460]
	cmp	r3, #0
	beq	.L1617
.L1618:
	ldr	r1, .L1670+60
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1617
.L1597:
	mov	r2, r10
	ldr	r1, .L1670+64
	mvn	r8, #0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r8
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1661:
	ldr	r1, .L1670+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1641
.L1664:
	ldr	r1, .L1670+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1641
.L1668:
	ldr	r1, .L1670+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1641
.L1671:
	.align	2
.L1670:
	.word	.LC106
	.word	.LC110
	.word	.LC122
	.word	.LC109
	.word	.LC114
	.word	.LC123
	.word	g_event_report
	.word	.LC112
	.word	.LC118
	.word	.LC119
	.word	.LC111
	.word	.LC120
	.word	.LC121
	.word	.LC113
	.word	.LC116
	.word	.LC117
	.word	.LC107
	.word	.LC108
	.word	.LC115
	.word	.LC124
	UNWIND(.fnend)
	.size	ProcessSliceHeaderFirstPart, .-ProcessSliceHeaderFirstPart
	.align	2
	.global	ProcessSliceHeaderSecondPart
	.type	ProcessSliceHeaderSecondPart, %function
ProcessSliceHeaderSecondPart:
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
	add	r6, r0, #12288
	add	r4, r0, #20480
	mov	r5, r0
	ldr	r3, [r6, #1292]
	ldr	r2, [r4, #220]
	sub	r3, r3, #1
	cmp	r3, r2
	bcc	.L1673
	add	r8, r0, #61440
	ldr	r3, [r8, #3460]
	cmp	r3, #0
	bne	.L1673
	bl	PPSSPSCheck
	cmp	r0, #0
	bne	.L1755
	ldr	r2, [r4, #220]
	mov	r7, #2208
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	ldr	r9, [r6, #1304]
	mul	r7, r7, r2
	cmp	r3, #1
	add	r6, r9, r7
	beq	.L1756
.L1677:
	ldr	r2, [r6, #36]
	cmp	r3, #1
	str	r2, [r4, #264]
	ldr	r2, [r6, #40]
	str	r2, [r4, #268]
	bls	.L1757
	cmp	r3, #2
	beq	.L1704
.L1688:
	mov	r3, #32
	str	r3, [r4, #268]
.L1689:
	mov	r0, r5
	bl	ref_pic_list_reordering
	subs	r10, r0, #0
	bne	.L1758
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1691
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r2, #1
	moveq	r3, r2
	beq	.L1692
.L1691:
	ldr	r3, [r6, #44]
	cmp	r3, #1
	beq	.L1759
.L1708:
	mov	r2, #0
	mov	r3, r2
.L1692:
	strb	r3, [r4, #215]
	mov	r0, #19
	ldr	r1, .L1765
	bl	dprint_vfmw
	ldrb	r2, [r4, #215]	@ zero_extendqisi2
	mov	r3, #0
	str	r3, [r4, #272]
	cmp	r2, r3
	str	r3, [r4, #276]
	bne	.L1760
.L1693:
	ldr	r3, [r4, #240]
	cmp	r3, #0
	bne	.L1761
.L1694:
	mov	r3, #0
	str	r3, [r4, #1816]
	ldrb	r3, [r9, r7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1695
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L1762
.L1695:
	ldr	r1, .L1765+4
	mov	r0, r5
	bl	se_v
	mov	r3, #0
	str	r3, [r4, #1824]
	str	r3, [r4, #1828]
	str	r3, [r4, #1832]
	str	r0, [r4, #1820]
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1763
.L1724:
	mov	r0, r10
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1704:
	mov	r3, #32
	str	r3, [r4, #264]
	b	.L1688
.L1763:
	ldr	r1, .L1765+8
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #1824]
	bhi	.L1698
	ldr	r3, [r8, #3460]
	cmp	r3, #0
	bne	.L1698
	cmp	r0, #1
	beq	.L1724
	ldr	r1, .L1765+12
	mov	r0, r5
	bl	se_v
	add	r3, r0, #6
	str	r0, [r4, #1828]
	cmp	r3, #12
	bhi	.L1701
	ldr	r3, [r8, #3460]
	cmp	r3, #0
	bne	.L1701
	mov	r0, r5
	ldr	r1, .L1765+16
	bl	se_v
	add	r3, r0, #6
	str	r0, [r4, #1832]
	cmp	r3, #12
	bhi	.L1703
	ldr	r3, [r8, #3460]
	cmp	r3, #0
	beq	.L1724
.L1703:
	ldr	r1, .L1765+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1724
.L1760:
	mov	r0, r5
	bl	pred_weight_table
	cmp	r0, #0
	beq	.L1693
	ldr	r1, .L1765+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1724
.L1761:
	mov	r0, r5
	bl	dec_ref_pic_marking
	cmp	r0, #0
	beq	.L1694
	ldr	r1, .L1765+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1724
.L1759:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r2, r3
	bne	.L1708
	b	.L1692
.L1756:
	ldr	r1, .L1765+32
	mov	r0, r5
	bl	u_1
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	strb	r0, [r4, #214]
	b	.L1677
.L1757:
	ldr	r1, .L1765+36
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L1679
	ldr	r3, [r4, #264]
.L1680:
	ldrb	r2, [r4, #209]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1681
	cmp	r3, #15
	bhi	.L1682
	ldr	r3, [r4, #268]
	cmp	r3, #15
	bhi	.L1764
.L1683:
	ldr	r3, [r8, #3460]
	cmp	r3, #0
	bne	.L1682
.L1684:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1704
	cmp	r3, #1
	bne	.L1688
	b	.L1689
.L1673:
	ldr	r1, .L1765+40
	mvn	r10, #0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r10
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1762:
	ldr	r1, .L1765+44
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #1816]
	bhi	.L1696
	ldr	r3, [r8, #3460]
	cmp	r3, #0
	beq	.L1695
.L1696:
	ldr	r1, .L1765+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1724
.L1681:
	cmp	r3, #31
	bhi	.L1685
	ldr	r3, [r4, #268]
	cmp	r3, #31
	bls	.L1686
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1686
.L1685:
	ldr	r1, .L1765+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1724
.L1686:
	ldr	r3, [r8, #3460]
	cmp	r3, #0
	beq	.L1684
	b	.L1685
.L1764:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1683
.L1682:
	ldr	r1, .L1765+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1724
.L1679:
	ldr	r1, .L1765+60
	mov	r0, r5
	bl	ue_v
	ldrb	r2, [r4, #208]	@ zero_extendqisi2
	cmp	r2, #1
	mov	r3, r0
	str	r0, [r4, #264]
	bne	.L1680
	ldr	r1, .L1765+64
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #264]
	str	r0, [r4, #268]
	b	.L1680
.L1701:
	ldr	r1, .L1765+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1724
.L1698:
	ldr	r1, .L1765+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1724
.L1755:
	ldr	r1, .L1765+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1724
.L1758:
	ldr	r1, .L1765+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r10, #0
	b	.L1724
.L1766:
	.align	2
.L1765:
	.word	.LC132
	.word	.LC137
	.word	.LC138
	.word	.LC140
	.word	.LC142
	.word	.LC143
	.word	.LC133
	.word	.LC134
	.word	.LC125
	.word	.LC126
	.word	.LC107
	.word	.LC135
	.word	.LC136
	.word	.LC130
	.word	.LC129
	.word	.LC127
	.word	.LC128
	.word	.LC141
	.word	.LC139
	.word	.LC108
	.word	.LC131
	UNWIND(.fnend)
	.size	ProcessSliceHeaderSecondPart, .-ProcessSliceHeaderSecondPart
	.align	2
	.global	ExitSlice
	.type	ExitSlice, %function
ExitSlice:
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
	add	r3, r0, #20480
	add	lr, r0, #12288
	mov	r1, #2208
	mov	r7, #4000
	ldr	r2, [lr, #1304]
	ldr	ip, [r3, #220]
	ldr	r5, [lr, #1300]
	ldrb	r6, [r3, #209]	@ zero_extendqisi2
	mla	r1, r1, ip, r2
	cmp	r6, #0
	ldr	r4, [r3, #260]
	ldr	lr, [r3, #228]
	ldr	r2, [r1, #28]
	str	ip, [r3, #1864]
	ldr	ip, [r3, #240]
	mla	r2, r7, r2, r5
	ldr	r1, [r2, #36]
	str	r4, [r3, #1896]
	str	lr, [r3, #1872]
	str	r1, [r3, #1860]
	ldrneb	r1, [r3, #210]	@ zero_extendqisi2
	strb	r6, [r3, #1856]
	str	ip, [r3, #1868]
	strneb	r1, [r3, #1857]
	ldrb	r1, [r3, #211]	@ zero_extendqisi2
	cmp	r1, #5
	strb	r1, [r3, #1858]
	ldreq	r1, [r3, #248]
	streq	r1, [r3, #1876]
	ldr	r1, [r2, #2200]
	cmp	r1, #0
	bne	.L1770
	add	r1, r0, #16384
	ldr	ip, [r1, #3420]
	str	ip, [r3, #1880]
	ldr	r1, [r1, #3424]
	str	r1, [r3, #1884]
	ldr	r1, [r2, #2200]
.L1770:
	cmp	r1, #1
	addeq	r2, r0, #16384
	add	r0, r0, #61440
	ldreq	r1, [r2, #3468]
	streq	r1, [r3, #1888]
	ldreq	r2, [r2, #3472]
	streq	r2, [r3, #1892]
	ldr	r3, [r0, #3476]
	add	r3, r3, #1
	str	r3, [r0, #3476]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	ExitSlice, .-ExitSlice
	.align	2
	.global	PicTypeStatistic
	.type	PicTypeStatistic, %function
PicTypeStatistic:
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
	add	r2, r0, #20480
	ldrb	r3, [r2, #208]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1777
	bcc	.L1778
	cmp	r3, #2
	ldmnefd	sp, {fp, sp, pc}
	ldrb	r3, [r2, #211]	@ zero_extendqisi2
	add	r0, r0, #61440
	cmp	r3, #5
	beq	.L1787
.L1780:
	mov	r3, #0
	str	r3, [r0, #600]
	ldmfd	sp, {fp, sp, pc}
.L1778:
	add	r0, r0, #61440
	ldr	r3, [r0, #596]
	cmp	r3, #2
	movne	r3, #1
	strne	r3, [r0, #596]
	b	.L1780
.L1777:
	add	r0, r0, #61440
	mov	r2, #2
	mov	r3, #0
	str	r2, [r0, #596]
	str	r3, [r0, #600]
	ldmfd	sp, {fp, sp, pc}
.L1787:
	mov	r3, #1
	str	r3, [r0, #600]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	PicTypeStatistic, .-PicTypeStatistic
	.align	2
	.global	CalcStreamBits
	.type	CalcStreamBits, %function
CalcStreamBits:
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
	add	r3, r0, #16384
	mov	r4, r0
	ldrb	r3, [r3, #1212]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1789
	ldr	r2, [r0, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #7
	bic	r3, r3, #7
	str	r3, [r2, #64]
	ldr	r2, [r0, #368]
	ldr	r3, [r2, #72]
	sub	r3, r3, #1
	str	r3, [r2, #72]
.L1789:
	ldr	r3, [r4, #368]
	ldrb	r6, [r3]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L1800
	mov	r1, #0
	mov	r0, r3
	mov	r5, r1
.L1791:
	add	r1, r1, #1
	ldr	ip, [r0, #12]
	cmp	r1, r6
	add	r0, r0, #28
	add	r5, r5, ip
	bne	.L1791
.L1790:
	mov	r7, r6, asl #5
	ldr	r0, [r3, #72]
	sub	r7, r7, r6, asl #2
	ldr	r2, [r3, #64]
	add	r1, r3, r7
	mov	r3, r5
	str	r0, [sp, #4]
	mov	r0, #7
	ldr	ip, [r1, #12]
	ldr	r1, .L1811
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #368]
	mov	r2, r6
	mov	r0, #7
	ldr	r1, .L1811+4
	ldrb	r6, [r3]	@ zero_extendqisi2
	ldr	ip, [r3, #64]
	mov	lr, r6, asl #5
	and	ip, ip, r0
	sub	lr, lr, r6, asl #2
	add	r3, r3, lr
	str	ip, [r3, #24]
	ldr	r3, [r4, #368]
	ldrb	r6, [r3]	@ zero_extendqisi2
	ldr	r8, [r3, #64]
	mov	lr, r6, asl #5
	sub	lr, lr, r6, asl #2
	add	r3, r3, lr
	ldr	ip, [r3, #16]
	add	ip, ip, r8, lsr #3
	rsb	ip, r5, ip
	str	ip, [r3, #28]
	ldr	ip, [r4, #368]
	ldrb	r6, [ip]	@ zero_extendqisi2
	ldr	lr, [ip, #64]
	mov	r3, r6, asl #5
	sub	r3, r3, r6, asl #2
	add	ip, ip, r3
	ldr	r3, [ip, #12]
	add	r3, r5, r3
	rsb	r3, lr, r3, lsl #3
	str	r3, [ip, #20]
	ldr	ip, [r4, #368]
	ldrb	lr, [ip]	@ zero_extendqisi2
	mov	r3, lr, asl #5
	sub	r3, r3, lr, asl #2
	add	r3, ip, r3
	ldr	ip, [r3, #28]
	ldr	lr, [r3, #24]
	and	ip, ip, #3
	add	ip, lr, ip, lsl #3
	str	ip, [r3, #24]
	ldr	ip, [r4, #368]
	ldrb	lr, [ip]	@ zero_extendqisi2
	mov	r3, lr, asl #5
	sub	r3, r3, lr, asl #2
	add	r3, ip, r3
	ldr	ip, [r3, #28]
	bic	ip, ip, #3
	str	ip, [r3, #28]
	ldr	ip, [r4, #368]
	add	r7, ip, r7
	ldrb	r5, [ip]	@ zero_extendqisi2
	ldr	r3, [r7, #24]
	mov	lr, r5, asl #5
	sub	lr, lr, r5, asl #2
	add	ip, ip, lr
	ldr	ip, [ip, #28]
	str	ip, [sp, #4]
	ldr	ip, [r7, #20]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r4, #368]
	ldr	r2, [ip, #68]
	sub	r3, r2, #1
	cmp	r3, #1
	bhi	.L1810
	ldrb	r6, [ip]	@ zero_extendqisi2
	add	r1, r6, #1
	cmp	r2, r1
	movhi	r2, #1
	movls	r2, #0
	cmp	r1, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L1793
	add	r6, r6, #2
	mov	r5, #0
.L1794:
	sub	r3, r6, #1
	ldr	r1, .L1811+8
	mov	r0, #7
	mov	lr, r3, asl #5
	mov	r2, r3
	sub	r3, lr, r3, asl #2
	add	ip, ip, r3
	str	r5, [ip, #24]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	lr, [ip, #16]
	str	lr, [ip, #28]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	lr, [ip, #12]
	mov	lr, lr, asl #3
	str	lr, [ip, #20]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	lr, [ip, #28]
	ldr	r7, [ip, #24]
	and	lr, lr, #3
	add	lr, r7, lr, lsl #3
	str	lr, [ip, #24]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	lr, [ip, #28]
	bic	lr, lr, #3
	str	lr, [ip, #28]
	ldr	ip, [r4, #368]
	add	ip, ip, r3
	ldr	r3, [ip, #24]
	ldr	ip, [ip, #20]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r4, #368]
	ldr	r3, [ip, #68]
	cmp	r6, #1
	cmpls	r6, r3
	add	r6, r6, #1
	movcc	r2, #1
	movcs	r2, #0
	cmp	r2, #0
	bne	.L1794
	sub	r3, r3, #1
.L1793:
	mov	r2, r3, asl #5
	ldr	r1, [ip, #72]
	sub	r3, r2, r3, asl #2
	add	ip, ip, r3
	ldr	r3, [ip, #20]
	rsb	r3, r1, r3
	str	r3, [ip, #20]
	ldr	ip, [r4, #368]
	ldrb	r1, [ip]	@ zero_extendqisi2
	ldr	r3, [ip, #68]
	cmp	r1, r3
	bcs	.L1788
	sxth	r3, r1
	add	r4, r4, #61440
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, ip, r3
.L1798:
	ldr	r2, [r3, #28]
	add	r1, r1, #1
	ldr	r0, [r4, #624]
	add	r3, r3, #28
	cmp	r2, r0
	strcc	r2, [r4, #624]
	ldr	r2, [ip, #68]
	cmp	r2, r1
	bhi	.L1798
.L1788:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1810:
	ldr	r1, .L1811+12
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_vfmw
.L1800:
	mov	r5, r6
	b	.L1790
.L1812:
	.align	2
.L1811:
	.word	.LC144
	.word	.LC145
	.word	.LC147
	.word	.LC146
	UNWIND(.fnend)
	.size	CalcStreamBits, .-CalcStreamBits
	.align	2
	.global	Scaling_List
	.type	Scaling_List, %function
Scaling_List:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 8
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
	subs	r7, r3, #0
	str	r0, [fp, #-52]
	mov	r6, r2
	ble	.L1813
	mov	r0, #8
	mov	r4, #0
	mov	r2, r7
	mov	r9, r6
	ldr	r8, .L1824
	mov	r10, #255
	mov	r7, r1
	mov	r6, r0
	mov	r5, r4
	b	.L1818
.L1817:
	mov	lr, r4, lsr #2
	and	r3, r4, #3
	str	r6, [r7, r4, asl #2]
	uxtb	r1, r6
	mov	r4, r3, asl #3
	ldr	r3, [r9, lr, asl #2]
	cmp	r5, r2
	bic	r3, r3, r10, asl r4
	orr	r1, r3, r1, asl r4
	str	r1, [r9, lr, asl #2]
	beq	.L1813
.L1818:
	cmp	r2, #16
	ldreq	r3, .L1824+4
	ldrneb	r4, [r5, r8]	@ zero_extendqisi2
	ldreqb	r4, [r5, r3]	@ zero_extendqisi2
	cmp	r0, #0
	add	r5, r5, #1
	beq	.L1817
	ldr	r1, .L1824+8
	ldr	r0, [fp, #-52]
	str	r2, [fp, #-48]
	bl	se_v
	ldr	r2, [fp, #4]
	add	r0, r6, r0
	ands	r0, r0, #255
	moveq	r3, #1
	movne	r3, #0
	cmp	r3, #0
	moveq	r6, r0
	cmp	r4, #0
	movne	r3, #0
	andeq	r3, r3, #1
	str	r3, [r2]
	ldr	r2, [fp, #-48]
	b	.L1817
.L1813:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1825:
	.align	2
.L1824:
	.word	.LANCHOR1+16
	.word	.LANCHOR1
	.word	.LC148
	UNWIND(.fnend)
	.size	Scaling_List, .-Scaling_List
	.align	2
	.global	ProcessPPS
	.type	ProcessPPS, %function
ProcessPPS:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #52)
	sub	sp, sp, #52
	mov	r4, r1
	ldr	r1, .L1884
	mov	r5, r0
	bl	u_1
	add	r6, r5, #61440
	strb	r0, [r4]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L1875
	ldr	r1, .L1884+4
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #1]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L1875
	ldr	r1, .L1884+8
	mov	r0, r5
	bl	ue_v
	cmp	r0, #0
	str	r0, [r4, #32]
	bne	.L1830
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	beq	.L1831
.L1830:
	ldr	r1, .L1884+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L1884+16
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L1875
	mov	r3, #0
	ldr	r0, [r6, #3520]
	mov	r2, r3
	mov	r1, #102
	blx	ip
	mvn	r0, #0
.L1828:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1838:
	ldr	r1, .L1884+20
	mov	r0, r5
	bl	u_1
	ldr	r1, .L1884+24
	str	r0, [r4, #60]
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #18]
	cmp	r0, #1
	beq	.L1839
.L1857:
	mov	r0, r5
	ldr	r1, .L1884+28
	bl	se_v
	add	r3, r0, #12
	str	r0, [r4, #56]
	cmp	r3, #24
	bhi	.L1840
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	beq	.L1858
.L1840:
	ldr	r1, .L1884+32
	mov	r0, #1
	bl	dprint_vfmw
.L1875:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1831:
	ldr	r1, .L1884+36
	mov	r0, r5
	bl	ue_v
	cmp	r0, #31
	str	r0, [r4, #36]
	bhi	.L1832
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L1832
	ldr	r1, .L1884+40
	mov	r0, r5
	bl	ue_v
	cmp	r0, #31
	str	r0, [r4, #40]
	bhi	.L1834
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L1834
	ldr	r1, .L1884+44
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #2]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L1875
	ldr	r2, .L1884+48
	mov	r1, #2
	mov	r0, r5
	bl	u_v
	cmp	r0, #2
	str	r0, [r4, #44]
	bhi	.L1876
	ldr	r1, .L1884+52
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1884+56
	str	r0, [r4, #48]
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1884+60
	mov	r0, r5
	bl	se_v
	ldr	r1, .L1884+64
	str	r0, [r4, #52]
	mov	r0, r5
	bl	u_1
	ldr	r1, .L1884+68
	strb	r0, [r4, #3]
	mov	r0, r5
	bl	u_1
	ldr	r1, .L1884+72
	strb	r0, [r4, #4]
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #17]
	cmp	r0, #0
	bne	.L1877
.L1837:
	ldr	r3, [r4, #52]
	add	r0, r5, #13504
	mov	r7, #0
	add	r0, r0, #24
	str	r7, [r4, #60]
	str	r3, [r4, #56]
	strb	r7, [r4, #18]
	bl	BsResidBits
	ldr	r3, [r5, #368]
	ldr	r3, [r3, #72]
	add	r3, r3, #3
	cmp	r0, r3
	bcs	.L1838
.L1858:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1877:
	ldr	r1, .L1884+76
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1837
.L1832:
	ldr	r1, .L1884+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1828
.L1834:
	ldr	r1, .L1884+84
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1828
.L1839:
	add	r3, r4, #4
	str	r6, [fp, #-80]
	sub	r9, fp, #72
	add	r8, r4, #1984
	add	r10, r4, #64
	mov	r6, r3
	b	.L1848
.L1881:
	ldr	lr, [lr, #1300]
	ldr	r3, [r4, #28]
	mla	r3, ip, r3, lr
	ldrb	ip, [r3, #25]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L1878
	ldr	r3, .L1884+88
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L1884+92
	ldr	r3, [r3, #52]
	blx	r3
.L1843:
	add	r7, r7, #1
	add	r8, r8, #16
	cmp	r7, #6
	add	r10, r10, #64
	beq	.L1879
.L1848:
	ldr	r1, .L1884+96
	mov	r0, r5
	bl	u_1
	clz	r1, r7
	add	lr, r5, #12288
	mov	ip, #4000
	mov	r2, #16
	mov	r1, r1, lsr #5
	cmp	r0, #1
	mov	r3, r0
	mov	r0, r8
	str	r3, [r9, #4]!
	strb	r3, [r6, #1]!
	beq	.L1880
	cmp	r7, #0
	cmpne	r7, #3
	beq	.L1881
	ldr	r3, .L1884+92
	mov	r2, #16
	sub	r1, r8, #16
	mov	r0, r8
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1843
.L1879:
	ldr	r6, [fp, #-80]
	add	ip, r4, #448
	add	r3, r5, #12288
	sub	r8, fp, #76
	add	r9, r4, #2080
	add	r10, r4, #11
	str	r5, [fp, #-80]
	mov	r7, #0
	str	r6, [fp, #-84]
	mov	r5, r3
	mov	r6, r4
	mov	r4, ip
.L1856:
	ldr	r2, [r6, #60]
	mov	r3, #0
	cmp	r2, #1
	strne	r3, [r8]
	strneb	r3, [r10]
	beq	.L1882
.L1851:
	ldr	r1, [r6, #28]
	mov	lr, #4000
	ldr	r3, [r5, #1300]
	mov	r0, r9
	mov	r2, #64
	mla	r3, lr, r1, r3
	ldrb	r1, [r3, #25]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1883
	ldr	r1, .L1884+100
	cmp	r7, #0
	ldr	r3, .L1884+92
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L1852:
	add	r7, r7, #1
	add	r9, r9, #64
	cmp	r7, #2
	add	r4, r4, #256
	add	r8, r8, #4
	add	r10, r10, #1
	bne	.L1856
	mov	r4, r6
	ldr	r5, [fp, #-80]
	ldr	r6, [fp, #-84]
	b	.L1857
.L1880:
	mov	r3, r2
	str	r9, [sp]
	mov	r2, r8
	mov	r1, r10
	mov	r0, r5
	bl	Scaling_List
	ldr	r3, [r9]
	cmp	r3, #1
	bne	.L1843
	ldr	r1, .L1884+88
	mov	r2, #16
	ldr	r3, .L1884+92
	cmp	r7, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r8
	blx	r3
	b	.L1843
.L1878:
	add	r1, r3, r7, lsl #4
	ldr	r3, .L1884+92
	add	r1, r1, #1968
	mov	r2, #16
	add	r1, r1, #4
	mov	r0, r8
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1843
.L1876:
	ldr	r1, .L1884+104
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1828
.L1882:
	ldr	r1, .L1884+108
	ldr	r0, [fp, #-80]
	bl	u_1
	mov	r2, r9
	mov	r1, r4
	mov	r3, #64
	mov	lr, r0
	cmp	lr, #1
	ldr	r0, [fp, #-80]
	str	lr, [r8]
	strb	lr, [r10]
	bne	.L1851
	str	r8, [sp]
	bl	Scaling_List
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L1852
	ldr	r1, .L1884+100
	mov	r2, #64
	ldr	r3, .L1884+92
	cmp	r7, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r9
	blx	r3
	b	.L1852
.L1883:
	add	r1, r3, r7, lsl #6
	ldr	r3, .L1884+92
	add	r1, r1, #2064
	add	r1, r1, #4
	ldr	r3, [r3, #52]
	blx	r3
	b	.L1852
.L1885:
	.align	2
.L1884:
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	g_event_report
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC172
	.word	.LC153
	.word	.LC155
	.word	.LC157
	.word	.LC158
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC165
	.word	.LC166
	.word	.LC154
	.word	.LC156
	.word	.LANCHOR0+80
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC170
	.word	.LANCHOR0+112
	.word	.LC159
	.word	.LC171
	UNWIND(.fnend)
	.size	ProcessPPS, .-ProcessPPS
	.align	2
	.global	PPSEqual
	.type	PPSEqual, %function
PPSEqual:
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
	subs	r6, r0, #0
	beq	.L1909
	cmp	r1, #0
	beq	.L1910
	ldr	r2, [r6, #24]
	ldr	ip, [r6, #28]
	ldr	r0, [r1, #28]
	ldr	r4, [r1, #24]
	ldrb	lr, [r6]	@ zero_extendqisi2
	cmp	ip, r0
	cmpeq	r2, r4
	ldrb	r3, [r1]	@ zero_extendqisi2
	ldrb	r4, [r6, #1]	@ zero_extendqisi2
	ldrb	ip, [r1, #1]	@ zero_extendqisi2
	moveq	r2, #1
	movne	r2, #0
	cmp	lr, r3
	movne	r0, #0
	andeq	r0, r2, #1
	ldr	lr, [r6, #36]
	cmp	r4, ip
	movne	r3, #0
	andeq	r3, r0, #1
	ldr	r2, [r1, #36]
	ldr	r4, [r6, #40]
	ldr	r0, [r1, #40]
	cmp	lr, r2
	movne	ip, #0
	andeq	ip, r3, #1
	ldrb	lr, [r6, #2]	@ zero_extendqisi2
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r4, r0
	movne	r2, #0
	andeq	r2, ip, #1
	ldr	r4, [r6, #44]
	ldr	ip, [r1, #44]
	cmp	lr, r3
	movne	r0, #0
	andeq	r0, r2, #1
	ldr	lr, [r6, #48]
	ldr	r2, [r1, #48]
	cmp	r4, ip
	movne	r3, #0
	andeq	r3, r0, #1
	ldr	r4, [r6, #52]
	ldr	r0, [r1, #52]
	cmp	lr, r2
	movne	ip, #0
	andeq	ip, r3, #1
	ldrb	r5, [r6, #3]	@ zero_extendqisi2
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	cmp	r4, r0
	movne	r2, #0
	andeq	r2, ip, #1
	ldrb	r3, [r6, #4]	@ zero_extendqisi2
	ldrb	r4, [r1, #4]	@ zero_extendqisi2
	cmp	r5, lr
	movne	r0, #0
	andeq	r0, r2, #1
	ldr	ip, [r6, #60]
	ldr	lr, [r1, #60]
	cmp	r3, r4
	movne	r3, #0
	andeq	r3, r0, #1
	ldrb	r2, [r1, #18]	@ zero_extendqisi2
	ldrb	r0, [r6, #18]	@ zero_extendqisi2
	cmp	ip, lr
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r0
	movne	r2, #0
	andeq	r2, r3, #1
	cmp	r0, #0
	beq	.L1890
	mov	ip, ip, asl #1
	adds	r3, ip, #6
	str	r3, [fp, #-48]
	beq	.L1890
	add	r0, r1, #4
	sub	r8, r1, #1088
	add	r3, r6, #4
	sub	r8, r8, #4
	add	r9, r1, #64
	mov	r5, r0
	mov	r10, r6
	mov	r7, r6
	str	r6, [fp, #-52]
	mov	r0, #0
	mov	r6, r3
	str	r1, [fp, #-56]
.L1895:
	ldrb	r3, [r6, #1]!	@ zero_extendqisi2
	ldrsb	ip, [r5, #1]!
	sxtb	r1, r3
	cmp	ip, r1
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	r3, #0
	beq	.L1908
	cmp	r0, #5
	bhi	.L1892
	add	r4, r10, #64
	add	r10, r10, #128
	mov	r1, r9
	mov	r3, r4
.L1893:
	ldr	lr, [r3], #4
	ldr	ip, [r1], #4
	cmp	lr, ip
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	r3, r10
	bne	.L1893
.L1891:
	ldr	r3, [fp, #-48]
	add	r0, r0, #1
	add	r7, r7, #256
	add	r8, r8, #256
	cmp	r0, r3
	mov	r10, r4
	add	r9, r9, #64
	bne	.L1895
	ldr	r6, [fp, #-52]
	ldr	r1, [fp, #-56]
.L1890:
	ldr	r0, [r6, #56]
	ldr	r3, [r1, #56]
	cmp	r0, r3
	movne	r0, #0
	andeq	r0, r2, #1
	eor	r0, r0, #1
	rsb	r0, r0, #0
.L1888:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1892:
	sub	r3, r7, #1088
	sub	r4, r7, #836
	sub	r3, r3, #4
	mov	r1, r8
.L1894:
	ldr	lr, [r3, #4]!
	ldr	ip, [r1, #4]!
	cmp	lr, ip
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	r3, r4
	bne	.L1894
.L1908:
	add	r4, r10, #64
	b	.L1891
.L1910:
	mov	r0, r1
	movw	r3, #9810
	ldr	r2, .L1911
	ldr	r1, .L1911+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1888
.L1909:
	movw	r3, #9809
	ldr	r2, .L1911
	ldr	r1, .L1911+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1888
.L1912:
	.align	2
.L1911:
	.word	.LC20
	.word	.LC21
	UNWIND(.fnend)
	.size	PPSEqual, .-PPSEqual
	.align	2
	.global	H264_DecPPS
	.type	H264_DecPPS, %function
H264_DecPPS:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	ldr	r1, .L1930
	add	r4, r0, #12288
	mov	r5, r0
	bl	ue_v
	ldr	r3, [r4, #1292]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r6, r0
	bls	.L1914
	ldr	r1, .L1930+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #1292]
	sub	r2, r3, #1
	cmp	r6, r2
	bls	.L1922
	ldr	r2, .L1930+8
	ldr	ip, [r2]
	cmp	ip, #0
	beq	.L1922
	add	r5, r5, #61440
	str	r3, [fp, #-40]
	str	r6, [fp, #-44]
	mov	r3, #8
	ldr	r0, [r5, #3520]
	sub	r2, fp, #44
	mov	r1, #110
	blx	ip
	mvn	r0, #0
.L1915:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1914:
	ldr	r1, .L1930+12
	mov	r0, r5
	bl	ue_v
	ldr	r3, [r4, #1288]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	ip, r0
	bhi	.L1926
	ldr	r2, [r4, #1300]
	mov	r3, #4000
	mla	r3, r3, r0, r2
	ldrb	r3, [r3, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1927
	mov	r9, #2208
	ldr	r3, [r4, #1304]
	mul	r7, r9, r6
	add	r3, r3, r7
	ldrb	r8, [r3, #19]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L1918
	ldr	r8, .L1930+16
	mov	r0, r5
	mov	r1, r8
	str	r6, [r8, #24]
	str	ip, [r8, #28]
	bl	ProcessPPS
	subs	r5, r0, #0
	bne	.L1928
	ldr	r1, [r4, #1304]
	mov	r0, r8
	add	r1, r1, r7
	bl	PPSEqual
	cmp	r0, #0
	beq	.L1915
	ldr	ip, .L1930+20
	mov	r3, #1
	ldr	r0, [r4, #1304]
	mov	r2, r9
	mov	r1, r8
	strb	r3, [r8, #20]
	add	r0, r0, r7
	ldr	ip, [ip, #56]
	strb	r3, [r8, #19]
	blx	ip
	mov	r0, r5
	b	.L1915
.L1918:
	str	r6, [r3, #24]
	mov	r0, r5
	ldr	r3, [r4, #1304]
	add	r3, r3, r7
	str	ip, [r3, #28]
	ldr	r1, [r4, #1304]
	add	r1, r1, r7
	bl	ProcessPPS
	cmp	r0, #0
	bne	.L1929
	ldr	r3, [r4, #1304]
	mov	r2, #1
	add	r3, r3, r7
	strb	r2, [r3, #20]
	ldr	r3, [r4, #1304]
	add	r7, r3, r7
	strb	r2, [r7, #19]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1922:
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1926:
	ldr	r1, .L1930+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1915
.L1928:
	ldr	r1, .L1930+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1915
.L1927:
	ldr	r1, .L1930+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1915
.L1929:
	ldr	r1, .L1930+28
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #1304]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r7
	strb	r2, [r3, #20]
	ldr	r3, [r4, #1304]
	add	r7, r3, r7
	strb	r8, [r7, #19]
	b	.L1915
.L1931:
	.align	2
.L1930:
	.word	.LC173
	.word	.LC174
	.word	g_event_report
	.word	.LC175
	.word	.LANCHOR2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC176
	.word	.LC178
	.word	.LC177
	UNWIND(.fnend)
	.size	H264_DecPPS, .-H264_DecPPS
	.align	2
	.global	vui_parameters
	.type	vui_parameters, %function
vui_parameters:
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
	mov	r5, r1
	ldr	r1, .L1981
	mov	r4, r0
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	streqb	r0, [r5, #15]
	bne	.L1975
.L1934:
	ldr	r1, .L1981+4
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #1]
	cmp	r0, #0
	bne	.L1976
.L1935:
	ldr	r1, .L1981+8
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #3]
	cmp	r0, #0
	moveq	r3, #5
	streq	r3, [r5, #28]
	bne	.L1977
.L1937:
	ldr	r1, .L1981+12
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #6]
	cmp	r0, #0
	bne	.L1978
.L1938:
	ldr	r1, .L1981+16
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #8]
	cmp	r0, #0
	bne	.L1979
.L1940:
	ldr	r1, .L1981+20
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #7]
	cmp	r0, #0
	beq	.L1942
	ldr	r1, .L1981+24
	mov	r0, r4
	bl	ue_v
	ldr	r2, .L1981+28
	mov	r1, #4
	str	r0, [r5, #120]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+32
	mov	r1, #4
	strb	r0, [r5, #116]
	mov	r0, r4
	bl	u_v
	ldr	r3, [r5, #120]
	cmp	r3, #31
	strb	r0, [r5, #117]
	bhi	.L1945
	add	r9, r4, #61440
	ldr	r6, [r9, #3460]
	cmp	r6, #0
	bne	.L1945
	add	r7, r5, #120
	add	r8, r5, #83
.L1946:
	ldr	r1, .L1981+36
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1981+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1981+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #120]
	cmp	r3, r6
	bcs	.L1946
	ldr	r2, .L1981+48
	mov	r1, #5
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+52
	mov	r1, #5
	str	r0, [r5, #380]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+56
	mov	r1, #5
	str	r0, [r5, #384]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+60
	mov	r1, #5
	str	r0, [r5, #388]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #392]
.L1942:
	ldr	r1, .L1981+64
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #10]
	cmp	r0, #0
	bne	.L1980
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	add	r9, r4, #61440
	cmp	r3, #0
	bne	.L1951
.L1950:
	ldr	r1, .L1981+68
	mov	r0, r4
	bl	u_1
	ldr	r1, .L1981+72
	strb	r0, [r5, #11]
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #12]
	cmp	r0, #0
	bne	.L1952
	ldr	r0, [r9, #3460]
.L1953:
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1980:
	ldr	r1, .L1981+24
	mov	r0, r4
	bl	ue_v
	ldr	r2, .L1981+28
	mov	r1, #4
	str	r0, [r5, #432]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+32
	mov	r1, #4
	strb	r0, [r5, #428]
	mov	r0, r4
	bl	u_v
	ldr	r3, [r5, #432]
	cmp	r3, #31
	strb	r0, [r5, #429]
	bhi	.L1945
	add	r9, r4, #61440
	ldr	r6, [r9, #3460]
	cmp	r6, #0
	bne	.L1945
	add	r8, r5, #392
	add	r7, r5, #432
	add	r8, r8, #3
.L1948:
	ldr	r1, .L1981+36
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1981+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1981+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #432]
	cmp	r3, r6
	bcs	.L1948
	ldr	r2, .L1981+48
	mov	r1, #5
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+52
	mov	r1, #5
	str	r0, [r5, #692]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+56
	mov	r1, #5
	str	r0, [r5, #696]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+60
	mov	r1, #5
	str	r0, [r5, #700]
	mov	r0, r4
	bl	u_v
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r5, #704]
	bne	.L1951
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1950
.L1951:
	ldr	r1, .L1981+76
	mov	r0, r4
	bl	u_1
	strb	r0, [r5, #14]
	b	.L1950
.L1979:
	ldr	r2, .L1981+80
	mov	r1, #32
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+84
	mov	r1, #32
	str	r0, [r5, #52]
	mov	r0, r4
	bl	u_v
	ldr	r1, .L1981+88
	str	r0, [r5, #56]
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #9]
	cmp	r0, #1
	bne	.L1940
	ldr	r1, [r5, #52]
	cmp	r1, #0
	beq	.L1940
	ldr	r3, [r5, #56]
	mov	r0, #1000
	add	r9, r4, #61440
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	mov	r0, r0, lsr #1
	str	r0, [r9, #2084]
	b	.L1940
.L1978:
	ldr	r1, .L1981+92
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1981+96
	str	r0, [r5, #44]
	mov	r0, r4
	bl	ue_v
	str	r0, [r5, #48]
	b	.L1938
.L1977:
	ldr	r2, .L1981+100
	mov	r1, #3
	mov	r0, r4
	bl	u_v
	ldr	r1, .L1981+104
	str	r0, [r5, #28]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L1981+108
	strb	r0, [r5, #4]
	mov	r0, r4
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r5, #5]
	cmp	r0, #0
	beq	.L1937
	ldr	r2, .L1981+112
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+116
	mov	r1, #8
	str	r0, [r5, #32]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+120
	mov	r1, #8
	str	r0, [r5, #36]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #40]
	b	.L1937
.L1976:
	ldr	r1, .L1981+124
	mov	r0, r4
	bl	u_1
	strb	r0, [r5, #2]
	b	.L1935
.L1975:
	ldr	r2, .L1981+128
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	uxtb	r0, r0
	strb	r0, [r5, #15]
	cmp	r0, #255
	bne	.L1934
	ldr	r2, .L1981+132
	mov	r1, #16
	mov	r0, r4
	bl	u_v
	ldr	r2, .L1981+136
	mov	r1, #16
	str	r0, [r5, #16]
	mov	r0, r4
	bl	u_v
	str	r0, [r5, #20]
	b	.L1934
.L1952:
	ldr	r1, .L1981+140
	mov	r0, r4
	bl	u_1
	ldr	r1, .L1981+144
	strb	r0, [r5, #13]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1981+148
	str	r0, [r5, #60]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1981+152
	str	r0, [r5, #64]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1981+156
	str	r0, [r5, #72]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1981+160
	str	r0, [r5, #68]
	mov	r0, r4
	bl	ue_v
	ldr	r1, .L1981+164
	str	r0, [r5, #76]
	mov	r0, r4
	bl	ue_v
	str	r0, [r5, #80]
	ldr	r0, [r9, #3460]
	cmp	r0, #0
	beq	.L1953
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1945:
	ldr	r1, .L1981+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1982:
	.align	2
.L1981:
	.word	.LC179
	.word	.LC183
	.word	.LC185
	.word	.LC192
	.word	.LC195
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC204
	.word	.LC205
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC213
	.word	.LC214
	.word	.LC212
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.word	.LC193
	.word	.LC194
	.word	.LC186
	.word	.LC187
	.word	.LC188
	.word	.LC189
	.word	.LC190
	.word	.LC191
	.word	.LC184
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC215
	.word	.LC216
	.word	.LC217
	.word	.LC218
	.word	.LC219
	.word	.LC220
	.word	.LC221
	.word	.LC203
	UNWIND(.fnend)
	.size	vui_parameters, .-vui_parameters
	.align	2
	.global	SPSEqual
	.type	SPSEqual, %function
SPSEqual:
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
	subs	r5, r0, #0
	beq	.L2015
	cmp	r1, #0
	beq	.L2016
	ldrb	lr, [r1]	@ zero_extendqisi2
	ldrb	r3, [r5]	@ zero_extendqisi2
	ldr	ip, [r5, #28]
	ldr	r2, [r1, #28]
	ldrb	r0, [r5, #1]	@ zero_extendqisi2
	cmp	r3, lr
	cmpeq	ip, r2
	ldrb	r6, [r1, #1]	@ zero_extendqisi2
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	ldrb	r4, [r1, #2]	@ zero_extendqisi2
	moveq	lr, #1
	movne	lr, #0
	ldr	r3, [r5, #32]
	cmp	r0, r6
	movne	ip, #0
	andeq	ip, lr, #1
	ldr	r6, [r1, #32]
	cmp	r2, r4
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	lr, [r1, #36]
	ldr	r4, [r5, #36]
	cmp	r3, r6
	movne	r2, #0
	andeq	r2, r0, #1
	ldrb	ip, [r1, #25]	@ zero_extendqisi2
	ldrb	r0, [r5, #25]	@ zero_extendqisi2
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r2, #1
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r0, #0
	beq	.L1987
	add	r0, r1, #3
	add	r2, r5, #3
	sub	r9, r1, #1104
	add	r7, r1, #48
	mov	ip, r0
	mov	r8, r5
	mov	r6, r5
	str	r5, [fp, #-48]
	mov	r0, #0
	mov	r4, r2
	mov	r5, ip
	str	r1, [fp, #-52]
.L1992:
	ldrb	r2, [r4, #1]!	@ zero_extendqisi2
	ldrsb	ip, [r5, #1]!
	sxtb	r1, r2
	cmp	ip, r1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, #0
	beq	.L1988
	cmp	r0, #5
	bhi	.L1989
	add	r2, r6, #48
	add	r10, r6, #112
	mov	r1, r7
.L1990:
	ldr	lr, [r2, #4]!
	ldr	ip, [r1, #4]!
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r10
	bne	.L1990
.L1988:
	add	r0, r0, #1
	add	r8, r8, #256
	cmp	r0, #8
	add	r9, r9, #256
	add	r6, r6, #64
	add	r7, r7, #64
	bne	.L1992
	ldr	r5, [fp, #-48]
	ldr	r1, [fp, #-52]
.L1987:
	ldr	r2, [r1, #2196]
	ldr	ip, [r5, #2200]
	ldr	r0, [r1, #2200]
	ldr	lr, [r5, #2196]
	cmp	ip, r0
	cmpeq	lr, r2
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #0
	and	r3, r3, r2
	beq	.L1994
	cmp	ip, #1
	bne	.L1993
	ldr	r0, [r1, #2208]
	ldr	ip, [r5, #2208]
	ldrb	r2, [r5, #16]	@ zero_extendqisi2
	ldrb	r6, [r1, #16]	@ zero_extendqisi2
	ldr	r4, [r5, #2212]
	cmp	ip, r0
	cmpeq	r2, r6
	ldr	lr, [r1, #2212]
	ldr	r6, [r5, #2216]
	ldr	ip, [r1, #2216]
	moveq	r0, #1
	movne	r0, #0
	cmp	r4, lr
	movne	r2, #0
	andeq	r2, r0, #1
	cmp	r6, ip
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	r6, #0
	and	r3, r3, r2
	beq	.L1993
	add	ip, r5, #2208
	add	r0, r1, #2208
	add	ip, ip, #8
	add	r0, r0, #8
	mov	r2, #0
.L1996:
	ldr	r4, [ip, #4]!
	add	r2, r2, #1
	ldr	lr, [r0, #4]!
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r6
	bne	.L1996
.L1993:
	ldrb	ip, [r1, #17]	@ zero_extendqisi2
	ldrb	lr, [r5, #17]	@ zero_extendqisi2
	ldr	r0, [r5, #3244]
	ldr	r4, [r1, #3244]
	ldr	r2, [r5, #3248]
	cmp	lr, ip
	cmpeq	r0, r4
	ldr	r7, [r1, #3248]
	ldr	r6, [r5, #3252]
	ldr	r4, [r1, #3252]
	moveq	ip, #1
	movne	ip, #0
	ldrb	lr, [r1, #18]	@ zero_extendqisi2
	cmp	r2, r7
	movne	r0, #0
	andeq	r0, ip, #1
	ldrb	ip, [r5, #18]	@ zero_extendqisi2
	cmp	r6, r4
	movne	r2, #0
	andeq	r2, r0, #1
	cmp	lr, ip
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	ip, #0
	and	r3, r3, r2
	bne	.L1997
	ldrb	r0, [r5, #19]	@ zero_extendqisi2
	ldrb	r2, [r1, #19]	@ zero_extendqisi2
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L1997:
	ldrb	r2, [r1, #20]	@ zero_extendqisi2
	ldrb	ip, [r5, #21]	@ zero_extendqisi2
	ldrb	r0, [r1, #21]	@ zero_extendqisi2
	ldrb	lr, [r5, #20]	@ zero_extendqisi2
	cmp	r0, ip
	cmpeq	lr, r2
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #0
	and	r3, r3, r2
	bne	.L2017
.L1998:
	ldrb	r0, [r5, #22]	@ zero_extendqisi2
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
	cmp	r0, r2
	movne	r0, #0
	andeq	r0, r3, #1
	eor	r0, r0, #1
	rsb	r0, r0, #0
.L1985:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2017:
	ldr	ip, [r1, #3260]
	ldr	lr, [r5, #3260]
	ldr	r0, [r5, #3256]
	ldr	r4, [r1, #3256]
	ldr	r2, [r1, #3264]
	cmp	lr, ip
	cmpeq	r0, r4
	ldr	r6, [r5, #3264]
	ldr	r4, [r5, #3268]
	ldr	lr, [r1, #3268]
	moveq	ip, #1
	movne	ip, #0
	cmp	r6, r2
	movne	r0, #0
	andeq	r0, ip, #1
	cmp	r4, lr
	movne	r2, #0
	andeq	r2, r0, #1
	and	r3, r3, r2
	b	.L1998
.L1989:
	sub	r2, r8, #1104
	sub	r10, r8, #848
	mov	r1, r9
.L1991:
	ldr	lr, [r2, #4]!
	ldr	ip, [r1, #4]!
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r10
	bne	.L1991
	b	.L1988
.L1994:
	ldr	r0, [r5, #2204]
	ldr	r2, [r1, #2204]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
	b	.L1993
.L2016:
	mov	r0, r1
	movw	r3, #10043
	ldr	r2, .L2018
	ldr	r1, .L2018+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1985
.L2015:
	movw	r3, #10042
	ldr	r2, .L2018
	ldr	r1, .L2018+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1985
.L2019:
	.align	2
.L2018:
	.word	.LC20
	.word	.LC21
	UNWIND(.fnend)
	.size	SPSEqual, .-SPSEqual
	.global	__aeabi_idiv
	.align	2
	.global	H264GetDar
	.type	H264GetDar, %function
H264GetDar:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 8
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
	subs	r4, r0, #0
	mov	lr, r1
	beq	.L2043
	subs	r1, r4, #255
	movne	r1, #1
	cmp	r4, #16
	movle	r0, #0
	andgt	r0, r1, #1
	cmp	r0, #0
	bne	.L2032
	cmp	r2, #0
	cmpne	lr, #0
	moveq	ip, #1
	movne	ip, #0
	cmp	r4, #255
	movne	ip, #0
	andeq	ip, ip, #1
	cmp	ip, #0
	bne	.L2033
	cmp	r4, #1
	moveq	r2, ip
	moveq	r4, #5
	beq	.L2021
	cmp	r1, #0
	str	r3, [fp, #-24]
	ldrne	r0, .L2044
	addne	r4, r0, r4, lsl #3
	ldrne	r2, [r4, #84]
	ldrne	lr, [r4, #80]
	mov	r1, r2
	mov	r0, lr, asl #10
	bl	__aeabi_idiv
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #4]
	mov	r4, r0
	mov	r0, r3, asl #10
	bl	__aeabi_idiv
	movw	r3, #2405
	movw	r1, #2262
	mul	r0, r0, r4
	add	r2, r0, #1020
	cmp	r0, #0
	add	r2, r2, #3
	movlt	r0, r2
	mov	r2, r0, asr #10
	cmp	r2, r3
	rsble	r3, r2, #2400
	subgt	r3, r2, #2400
	addle	r3, r3, #6
	subgt	r3, r3, #6
	cmp	r2, r1
	bgt	.L2025
	rsb	r1, r2, #2256
	add	r1, r1, #7
	cmp	r3, r1
	bge	.L2026
.L2036:
	mov	r4, #4
	b	.L2021
.L2032:
	mov	r4, #0
.L2043:
	mov	r2, r4
.L2021:
	mov	r3, r4
	ldr	r1, .L2044+4
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L2025:
	sub	r1, r2, #2256
	sub	r1, r1, #7
	cmp	r3, r1
	blt	.L2036
.L2026:
	movw	r3, #1819
	cmp	r2, r3
	bgt	.L2027
	rsb	r3, r2, #1808
	add	r3, r3, #12
	cmp	r1, r3
	blt	.L2038
.L2028:
	movw	r1, #1364
	cmp	r2, r1
	rsble	r4, r2, #1360
	subgt	r4, r2, #1360
	addle	r4, r4, #5
	subgt	r4, r4, #5
	cmp	r3, r4
	movlt	r4, #2
	movge	r4, #1
	b	.L2021
.L2033:
	mov	r4, r0
	mov	r2, r0
	b	.L2021
.L2027:
	sub	r3, r2, #1808
	sub	r3, r3, #12
	cmp	r1, r3
	bge	.L2028
.L2038:
	mov	r4, #3
	b	.L2021
.L2045:
	.align	2
.L2044:
	.word	.LANCHOR1
	.word	.LC222
	UNWIND(.fnend)
	.size	H264GetDar, .-H264GetDar
	.align	2
	.global	ProcessSPS
	.type	ProcessSPS, %function
ProcessSPS:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #52)
	sub	sp, sp, #52
	subs	r4, r1, #0
	mov	r5, r0
	beq	.L2160
	ldr	r2, [r4, #28]
	cmp	r2, #100
	cmpne	r2, #110
	moveq	r3, #1
	movne	r3, #0
	cmp	r2, #122
	orreq	r3, r3, #1
	cmp	r2, #144
	orreq	r3, r3, #1
	cmp	r2, #83
	orreq	r3, r3, #1
	cmp	r2, #86
	orreq	r3, r3, #1
	cmp	r3, #0
	streqb	r3, [r4, #25]
	moveq	r3, #1
	streq	r3, [r4, #40]
	bne	.L2161
.L2061:
	ldr	r1, .L2177
	mov	r0, r5
	bl	ue_v
	cmp	r0, #12
	str	r0, [r4, #2196]
	bhi	.L2074
	add	r6, r5, #61440
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2074
	ldr	r1, .L2177+4
	mov	r0, r5
	bl	ue_v
	cmp	r0, #2
	str	r0, [r4, #2200]
	bhi	.L2076
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2076
	cmp	r0, #0
	beq	.L2162
	cmp	r0, #1
	beq	.L2163
.L2082:
	ldr	r1, .L2177+8
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #3244]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2158
	ldr	r1, .L2177+12
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #17]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2158
	ldr	r1, .L2177+16
	mov	r0, r5
	bl	ue_v
	movw	r8, #509
	sub	r3, r0, #1
	str	r0, [r4, #3248]
	cmp	r3, r8
	bhi	.L2087
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2087
	ldr	r1, .L2177+20
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #3252]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2158
	ldr	r1, .L2177+24
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #18]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2158
	cmp	r0, #0
	bne	.L2164
	ldr	r1, .L2177+28
	mov	r0, r5
	bl	u_1
	ldr	r7, [r4, #3252]
	add	r7, r7, #1
	cmp	r7, #255
	strb	r0, [r4, #19]
	bhi	.L2119
	ldr	r3, [r4, #3248]
	add	r3, r3, #1
	cmp	r7, #1
	cmphi	r3, #3
	movhi	r9, #2
	bhi	.L2091
.L2119:
	ldr	r1, .L2177+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2151
.L2161:
	ldr	r1, .L2177+36
	bl	ue_v
	cmp	r0, #1
	str	r0, [r4, #40]
	bhi	.L2050
	add	r6, r5, #61440
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2050
	ldr	r1, .L2177+40
	mov	r0, r5
	bl	ue_v
	uxth	r0, r0
	add	r2, r0, #8
	str	r2, [r4, #44]
	cmp	r2, #8
	beq	.L2165
.L2052:
	ldr	r1, .L2177+44
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2177+48
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2053
	ldr	r0, [r4, #44]
	mov	r2, #0
	mov	r3, #8
	str	r2, [fp, #-68]
	mov	r1, #119
	sub	r2, fp, #68
	str	r0, [fp, #-64]
	ldr	r0, [r6, #3520]
	blx	ip
.L2053:
	ldr	r1, .L2177+52
	mov	r0, r5
	bl	ue_v
	uxth	r0, r0
	add	r2, r0, #8
	str	r2, [r4, #48]
	cmp	r2, #8
	beq	.L2166
.L2055:
	ldr	r1, .L2177+56
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2177+48
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2056
	ldr	r0, [r4, #48]
	mov	r2, #0
	mov	r3, #8
	str	r2, [fp, #-68]
	mov	r1, #119
	sub	r2, fp, #68
	str	r0, [fp, #-64]
	ldr	r0, [r6, #3520]
	blx	ip
.L2056:
	ldr	r1, .L2177+60
	mov	r0, r5
	bl	u_1
	cmp	r0, #0
	bne	.L2058
	ldr	r6, [r6, #3460]
	cmp	r6, #0
	bne	.L2058
	ldr	r1, .L2177+64
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #25]
	cmp	r0, #1
	bne	.L2061
	add	r10, r4, #1968
	sub	r7, fp, #72
	add	r10, r10, #4
	add	r9, r4, #3
	add	r8, r4, #52
	b	.L2067
.L2169:
	ldr	r3, .L2177+68
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2177+72
	ldr	r3, [r3, #52]
	blx	r3
.L2063:
	add	r6, r6, #1
	add	r10, r10, #16
	cmp	r6, #6
	add	r8, r8, #64
	beq	.L2167
.L2067:
	ldr	r1, .L2177+76
	mov	r0, r5
	bl	u_1
	clz	r1, r6
	mov	r2, #16
	mov	r1, r1, lsr #5
	cmp	r0, #1
	mov	r3, r0
	mov	r0, r10
	str	r3, [r7, #4]!
	strb	r3, [r9, #1]!
	beq	.L2168
	cmp	r6, #0
	cmpne	r6, #3
	beq	.L2169
	ldr	r3, .L2177+72
	mov	r2, #16
	sub	r1, r10, #16
	mov	r0, r10
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2063
.L2166:
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	beq	.L2056
	b	.L2055
.L2165:
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	beq	.L2053
	b	.L2052
.L2118:
	cmp	r1, r10
	cmpcs	r0, r7
	bcs	.L2117
	ldr	r3, .L2177+48
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2158
	strh	r1, [fp, #-72]	@ movhi
	mov	r3, #8
	strh	r0, [fp, #-70]	@ movhi
	sub	r2, fp, #76
	strh	r10, [fp, #-76]	@ movhi
	mov	r1, #107
	strh	r7, [fp, #-74]	@ movhi
	ldr	r0, [r6, #3520]
	blx	ip
.L2158:
	mvn	r0, #0
.L2151:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2164:
	ldr	r7, [r4, #3252]
	strb	r3, [r4, #19]
	sub	r3, r7, #1
	cmp	r3, r8
	bhi	.L2119
	ldr	r3, [r4, #3248]
	mov	r9, #1
	add	r7, r7, #1
	add	r3, r3, r9
.L2091:
	mul	r7, r7, r9
	mov	r10, r3, asl #4
	mov	r7, r7, asl #4
	mul	r1, r10, r7
	add	r1, r1, r1, lsr #1
	cmp	r1, #100663296
	bhi	.L2170
	ldr	r2, [r4, #32]
	sub	r3, r2, #10
	cmp	r3, #31
	ldrls	pc, [pc, r3, asl #2]
	b	.L2093
.L2095:
	.word	.L2094
	.word	.L2096
	.word	.L2126
	.word	.L2126
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2126
	.word	.L2098
	.word	.L2100
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2100
	.word	.L2101
	.word	.L2102
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2093
	.word	.L2104
	.word	.L2104
.L2162:
	ldr	r1, .L2177+80
	mov	r0, r5
	bl	ue_v
	cmp	r0, #12
	str	r0, [r4, #2204]
	bhi	.L2079
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	beq	.L2082
.L2079:
	ldr	r1, .L2177+84
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2151
.L2126:
	mov	r0, #60416
	movt	r0, 13
.L2097:
	bl	__aeabi_uidiv
	ldr	r1, .L2177+88
	cmp	r0, #16
	movcc	r8, r0
	movcs	r8, #16
	mov	r2, r8
	mov	r0, #21
	bl	dprint_vfmw
	ldr	r2, [r4, #3244]
	cmp	r2, r8
	bhi	.L2105
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	beq	.L2106
.L2105:
	mov	r3, r8
	ldr	r1, .L2177+92
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #3244]
	cmp	r3, #16
	bhi	.L2155
	cmp	r8, r3
	movcc	r8, r3
.L2155:
	str	r8, [r4, #3244]
.L2106:
	ldr	r1, .L2177+96
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #20]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2158
	ldr	r1, .L2177+100
	mov	r0, r5
	bl	u_1
	uxtb	r0, r0
	strb	r0, [r4, #21]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2158
	cmp	r0, #0
	bne	.L2171
.L2108:
	mov	r2, r10, lsr #1
	mov	r3, r7, lsr #1
	str	r10, [r4, #3276]
	str	r7, [r4, #3280]
	str	r2, [r4, #3284]
	str	r3, [r4, #3288]
.L2110:
	ldr	r1, .L2177+104
	mov	r0, r5
	bl	u_1
	uxtb	r3, r0
	strb	r3, [r4, #22]
	ldr	r2, [r6, #3460]
	cmp	r2, #0
	bne	.L2158
	cmp	r3, #0
	mov	r2, #2
	str	r2, [r4, #3332]
	bne	.L2172
	mov	r0, r3
	strb	r3, [r4, #3307]
	mov	r3, #5
	str	r3, [r4, #3320]
.L2113:
	ldr	r2, [r4, #3312]
	mov	r3, r10
	ldr	r1, [r4, #3308]
	str	r7, [sp]
	bl	H264GetDar
	ldr	r3, [r4, #3244]
	cmp	r3, #0
	str	r0, [r4, #3316]
	beq	.L2116
	cmp	r8, r3
	movcs	r8, r3
.L2116:
	cmp	r8, #16
	add	r3, r5, #12288
	movcs	r8, #16
	str	r8, [r3, #1296]
	ldr	r3, [r5]
	ldr	r2, [r3, #28]
	cmp	r2, #25
	beq	.L2173
.L2117:
	add	r8, r8, #1
	mov	r0, #0
	str	r8, [r4, #3272]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2104:
	mov	r0, #12582912
	b	.L2097
.L2100:
	mov	r0, #30208
	movt	r0, 47
	b	.L2097
.L2167:
	add	r6, r4, #2064
	sub	r7, fp, #88
	add	r6, r6, #4
	add	r9, r4, #9
	add	r8, r4, #436
	mov	r10, #0
.L2072:
	ldr	r1, .L2177+76
	mov	r0, r5
	bl	u_1
	mov	r2, #64
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r6
	str	r3, [r7, #4]!
	strb	r3, [r9, #1]!
	beq	.L2174
	ldr	r1, .L2177+108
	cmp	r10, #0
	ldr	r3, .L2177+72
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L2069:
	add	r10, r10, #1
	add	r6, r6, #64
	cmp	r10, #2
	add	r8, r8, #256
	bne	.L2072
	b	.L2061
.L2168:
	mov	r3, r2
	str	r7, [sp]
	mov	r2, r10
	mov	r1, r8
	mov	r0, r5
	bl	Scaling_List
	ldr	r3, [r7]
	cmp	r3, #1
	bne	.L2063
	ldr	r1, .L2177+68
	mov	r2, #16
	ldr	r3, .L2177+72
	cmp	r6, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r10
	blx	r3
	b	.L2063
.L2050:
	ldr	r1, .L2177+112
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2074:
	ldr	r1, .L2177+116
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2151
.L2171:
	ldr	r1, .L2177+120
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2177+124
	str	r0, [r4, #3256]
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2177+128
	str	r0, [r4, #3260]
	mov	r0, r5
	bl	ue_v
	ldr	r1, .L2177+132
	str	r0, [r4, #3264]
	mov	r0, r5
	bl	ue_v
	ldr	r2, [r4, #3264]
	ldr	r1, [r4, #3256]
	mov	ip, r9, asl #1
	ldr	r3, [r4, #3260]
	mov	r2, r2, asl #1
	mov	r1, r1, asl #1
	mul	r9, r9, r2
	rsb	r2, r1, r10
	sub	r3, r2, r3, asl #1
	rsb	r2, r9, r7
	str	r0, [r4, #3268]
	mls	r0, r0, ip, r2
	cmp	r3, #0
	cmpgt	r0, #0
	ble	.L2108
	add	r1, r1, r3, lsr #1
	add	r9, r9, r0, lsr #1
	str	r1, [r4, #3284]
	str	r9, [r4, #3288]
	str	r3, [r4, #3276]
	str	r0, [r4, #3280]
	b	.L2110
.L2172:
	add	r1, r4, #3280
	mov	r0, r5
	add	r1, r1, #12
	bl	vui_parameters
	cmp	r0, #0
	bne	.L2157
	ldrb	r3, [r4, #3304]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2157
	ldr	r2, [r4, #3372]
	clz	r3, r2
	mov	r3, r3, lsr #5
	cmp	r8, r2
	orrcc	r3, r3, #1
	cmp	r3, #0
	bne	.L2175
	ldr	r3, [r4, #3244]
	ldrb	r0, [r4, #3307]	@ zero_extendqisi2
	cmp	r2, r3
	movcs	r8, r2
	movcc	r8, r3
	b	.L2113
.L2175:
	mov	r3, r8
	ldr	r1, .L2177+136
	mov	r0, #1
	bl	dprint_vfmw
.L2157:
	ldrb	r0, [r4, #3307]	@ zero_extendqisi2
	b	.L2113
.L2173:
	ldr	r2, [r3, #708]
	cmp	r2, #0
	bne	.L2117
	ldr	r2, [r3, #692]
	ldr	r1, [r3, #668]
	cmp	r8, r2
	ldr	r0, [r3, #672]
	bls	.L2118
	ldr	r3, .L2177+48
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2158
	str	r2, [fp, #-72]
	mov	r3, #8
	str	r8, [fp, #-76]
	sub	r2, fp, #76
	ldr	r0, [r6, #3520]
	mov	r1, #106
	blx	ip
	mvn	r0, #0
	b	.L2151
.L2058:
	ldr	r1, .L2177+140
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2151
.L2163:
	ldr	r1, .L2177+144
	mov	r0, r5
	bl	u_1
	strb	r0, [r4, #16]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2158
	ldr	r1, .L2177+148
	mov	r0, r5
	bl	se_v
	str	r0, [r4, #2208]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2158
	ldr	r1, .L2177+152
	mov	r0, r5
	bl	se_v
	str	r0, [r4, #2212]
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	bne	.L2158
	ldr	r1, .L2177+156
	mov	r0, r5
	bl	ue_v
	cmp	r0, #255
	str	r0, [r4, #2216]
	bhi	.L2084
	ldr	r7, [r6, #3460]
	cmp	r7, #0
	bne	.L2084
	cmp	r0, #0
	addne	r8, r4, #2208
	addne	r8, r8, #8
	bne	.L2086
	b	.L2082
.L2176:
	ldr	r3, [r4, #2216]
	cmp	r3, r7
	bls	.L2082
.L2086:
	ldr	r1, .L2177+160
	mov	r0, r5
	bl	se_v
	add	r7, r7, #1
	str	r0, [r8, #4]!
	ldr	r3, [r6, #3460]
	cmp	r3, #0
	beq	.L2176
	b	.L2158
.L2087:
	mov	r2, r0
	ldr	r1, .L2177+164
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2151
.L2101:
	mov	r0, #30720
	movt	r0, 105
	b	.L2097
.L2098:
	mov	r0, #55296
	movt	r0, 27
	b	.L2097
.L2102:
	mov	r0, #7864320
	b	.L2097
.L2096:
	mov	r0, #17920
	movt	r0, 5
	b	.L2097
.L2094:
	mov	r0, #20992
	movt	r0, 2
	b	.L2097
.L2093:
	ldr	r1, .L2177+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2151
.L2084:
	ldr	r1, .L2177+172
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2151
.L2174:
	mov	r3, r2
	str	r7, [sp]
	mov	r2, r6
	mov	r1, r8
	mov	r0, r5
	bl	Scaling_List
	ldr	r3, [r7]
	cmp	r3, #1
	bne	.L2069
	ldr	r1, .L2177+108
	mov	r2, #64
	ldr	r3, .L2177+72
	cmp	r10, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r6
	blx	r3
	b	.L2069
.L2076:
	ldr	r1, .L2177+176
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2151
.L2170:
	ldr	r1, .L2177+180
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2151
.L2160:
	mov	r0, r4
	movw	r3, #10233
	ldr	r2, .L2177+184
	ldr	r1, .L2177+188
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2151
.L2178:
	.align	2
.L2177:
	.word	.LC232
	.word	.LC234
	.word	.LC237
	.word	.LC245
	.word	.LC246
	.word	.LC248
	.word	.LC249
	.word	.LC263
	.word	.LC250
	.word	.LC223
	.word	.LC225
	.word	.LC226
	.word	g_event_report
	.word	.LC227
	.word	.LC228
	.word	.LC229
	.word	.LC231
	.word	.LANCHOR0+80
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC170
	.word	.LC236
	.word	.LC238
	.word	.LC253
	.word	.LC254
	.word	.LC255
	.word	.LC256
	.word	.LC261
	.word	.LANCHOR0+112
	.word	.LC224
	.word	.LC233
	.word	.LC257
	.word	.LC258
	.word	.LC259
	.word	.LC260
	.word	.LC262
	.word	.LC230
	.word	.LC239
	.word	.LC240
	.word	.LC241
	.word	.LC242
	.word	.LC244
	.word	.LC247
	.word	.LC252
	.word	.LC243
	.word	.LC235
	.word	.LC251
	.word	.LC20
	.word	.LC21
	UNWIND(.fnend)
	.size	ProcessSPS, .-ProcessSPS
	.align	2
	.global	Sps_SvcExt
	.type	Sps_SvcExt, %function
Sps_SvcExt:
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
	add	r1, r0, #12288
	add	r2, r0, #20480
	mov	lr, #2208
	ldr	r3, [r1, #1304]
	mov	r4, r0
	ldr	r2, [r2, #220]
	add	r0, r0, #13504
	ldr	ip, [r1, #1300]
	mov	r5, #4000
	mov	r1, #32
	add	r0, r0, #24
	mla	r3, lr, r2, r3
	ldr	r3, [r3, #28]
	mla	r5, r5, r3, ip
	bl	BsGet
	ldr	r1, .L2193
	mov	r6, r0
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2193+4
	mov	r2, r0
	mov	r0, #17
	bl	dprint_vfmw
	mov	r0, r4
	ldr	r2, .L2193+8
	mov	r1, #2
	bl	u_v
	cmp	r0, #1
	beq	.L2189
	ldr	r2, [r5, #40]
	sub	r1, r2, #1
	cmp	r1, #1
	bls	.L2190
.L2182:
	cmp	r2, #1
	beq	.L2191
.L2183:
	ldr	r1, .L2193+12
	mov	r0, r4
	bl	u_1
	cmp	r0, #0
	bne	.L2192
.L2184:
	mov	r0, r4
	ldr	r1, .L2193+16
	bl	u_1
	cmp	r0, #1
	moveq	r0, #0
	beq	.L2181
	ldr	ip, [r5, #40]
	mov	r2, r0
	mov	r3, r6
	ldr	r1, .L2193+20
	mov	r0, #1
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r0, #0
.L2181:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2192:
	ldr	r1, .L2193+24
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2193+28
	mov	r2, r0
	mov	r0, #17
	bl	dprint_vfmw
	b	.L2184
.L2191:
	ldr	r2, .L2193+32
	mov	r1, #2
	mov	r0, r4
	bl	u_v
	ldr	r1, .L2193+36
	mov	r2, r0
	mov	r0, #17
	bl	dprint_vfmw
	b	.L2183
.L2190:
	ldr	r1, .L2193+40
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2193+44
	mov	r2, r0
	mov	r0, #17
	bl	dprint_vfmw
	ldr	r2, [r5, #40]
	b	.L2182
.L2189:
	ldr	r1, .L2193+48
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2181
.L2194:
	.align	2
.L2193:
	.word	.LC264
	.word	.LC265
	.word	.LC266
	.word	.LC272
	.word	.LC275
	.word	.LC276
	.word	.LC273
	.word	.LC274
	.word	.LC270
	.word	.LC271
	.word	.LC268
	.word	.LC269
	.word	.LC267
	UNWIND(.fnend)
	.size	Sps_SvcExt, .-Sps_SvcExt
	.align	2
	.global	H264_DecSPS
	.type	H264_DecSPS, %function
H264_DecSPS:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r2, .L2230
	mov	r1, #8
	mov	r4, r0
	add	r7, r0, #61440
	bl	u_v
	ldr	r1, .L2230+4
	mov	r10, r0
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2230+8
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2230+12
	str	r0, [fp, #-60]
	mov	r0, r4
	bl	u_1
	ldr	r1, .L2230+16
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	u_1
	ldr	r2, .L2230+20
	mov	r1, #4
	str	r0, [fp, #-68]
	mov	r0, r4
	bl	u_v
	ldr	r2, .L2230+24
	mov	r1, #8
	mov	r0, r4
	bl	u_v
	ldr	r1, .L2230+28
	mov	r6, r0
	mov	r0, r4
	bl	ue_v
	ldr	r2, [r7, #3460]
	cmp	r2, #0
	mov	r9, r0
	bne	.L2224
	add	r5, r4, #12288
	ldr	r2, [r5, #1288]
	sub	r2, r2, #1
	cmp	r0, r2
	bhi	.L2225
	sub	r2, r10, #66
	mov	r8, r10
	cmp	r2, #78
	ldrls	pc, [pc, r2, asl #2]
	b	.L2200
.L2202:
	.word	.L2201
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2203
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2203
	.word	.L2200
	.word	.L2200
	.word	.L2203
	.word	.L2200
	.word	.L2204
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2203
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2205
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2205
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2200
	.word	.L2205
.L2201:
	ldr	r1, .L2230+32
	mov	r0, #1
	bl	dprint_vfmw
.L2203:
	cmp	r6, #9
	mov	r2, r6
	bls	.L2223
.L2229:
	cmp	r6, #41
	bhi	.L2223
.L2207:
	mov	r3, #4000
	ldr	r1, [r5, #1300]
	mul	r7, r3, r9
	add	r1, r1, r7
	ldrb	r6, [r1, #23]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L2208
	ldr	r6, .L2230+36
	mov	r0, r4
	str	r3, [fp, #-72]
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	add	r1, r6, #2208
	str	r8, [r6, #2236]
	str	r2, [r6, #2240]
	strb	r3, [r6, #2208]
	ldrb	r3, [fp, #-60]	@ zero_extendqisi2
	str	r9, [r6, #2244]
	strb	r3, [r6, #2209]
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	strb	r3, [r6, #2210]
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	strb	r3, [r6, #2211]
	bl	ProcessSPS
	ldr	r3, [fp, #-72]
	cmp	r0, #0
	bne	.L2226
	ldr	r1, [r5, #1300]
	add	r0, r6, #2208
	str	r3, [fp, #-56]
	add	r1, r1, r7
	bl	SPSEqual
	ldr	r3, [fp, #-56]
	cmp	r0, #0
	bne	.L2227
.L2210:
	cmp	r8, #83
	cmpne	r8, #86
	beq	.L2212
.L2213:
	mov	r0, #0
.L2197:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2223:
	mov	r3, #41
	ldr	r1, .L2230+40
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, #41
	b	.L2207
.L2208:
	str	r8, [r1, #28]
	mov	r0, r4
	ldr	r3, [r5, #1300]
	ldrb	r1, [fp, #-56]	@ zero_extendqisi2
	strb	r1, [r3, r7]
	ldr	r3, [r5, #1300]
	ldrb	r1, [fp, #-60]	@ zero_extendqisi2
	add	r3, r3, r7
	strb	r1, [r3, #1]
	ldr	r3, [r5, #1300]
	ldrb	r1, [fp, #-64]	@ zero_extendqisi2
	add	r3, r3, r7
	strb	r1, [r3, #2]
	ldr	r3, [r5, #1300]
	ldrb	r1, [fp, #-68]	@ zero_extendqisi2
	add	r3, r3, r7
	strb	r1, [r3, #3]
	ldr	r3, [r5, #1300]
	add	r3, r3, r7
	str	r2, [r3, #32]
	ldr	r3, [r5, #1300]
	add	r3, r3, r7
	str	r9, [r3, #36]
	ldr	r1, [r5, #1300]
	add	r1, r1, r7
	bl	ProcessSPS
	cmp	r0, #0
	bne	.L2228
	ldr	r3, [r5, #1300]
	mov	r2, #1
	cmp	r8, #83
	cmpne	r8, #86
	add	r3, r3, r7
	strb	r2, [r3, #24]
	ldr	r3, [r5, #1300]
	add	r7, r3, r7
	strb	r2, [r7, #23]
	bne	.L2213
.L2212:
	mov	r0, r4
	bl	Sps_SvcExt
	cmp	r0, #0
	beq	.L2213
	ldr	r1, .L2230+44
	mov	r0, #1
	bl	dprint_vfmw
.L2224:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2225:
	ldr	r1, .L2230+48
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r5, #1288]
	sub	r3, r2, #1
	cmp	r9, r3
	bls	.L2224
	ldr	r3, .L2230+52
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L2224
	str	r2, [fp, #-48]
	mov	r3, #8
	str	r9, [fp, #-52]
	sub	r2, fp, #52
	ldr	r0, [r7, #3520]
	mov	r1, #109
	blx	r4
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2205:
	ldr	r1, .L2230+56
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r6, #9
	mov	r2, r6
	bhi	.L2229
	b	.L2223
.L2204:
	ldr	r1, .L2230+60
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r6, #9
	mov	r2, r6
	bhi	.L2229
	b	.L2223
.L2200:
	mov	r2, r10
	ldr	r1, .L2230+64
	mov	r0, #1
	mov	r8, #100
	bl	dprint_vfmw
	cmp	r6, #9
	mov	r2, r6
	bhi	.L2229
	b	.L2223
.L2227:
	ldr	ip, .L2230+68
	mov	r2, r3
	ldr	r0, [r5, #1300]
	mov	r3, #1
	add	r1, r6, #2208
	strb	r3, [r6, #2232]
	add	r0, r0, r7
	ldr	ip, [ip, #56]
	strb	r3, [r6, #2231]
	blx	ip
	b	.L2210
.L2226:
	mov	r3, r9
	movw	r2, #10859
	ldr	r1, .L2230+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2197
.L2228:
	mov	r3, r9
	movw	r2, #10884
	ldr	r1, .L2230+72
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #1300]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r7
	strb	r2, [r3, #24]
	ldr	r3, [r5, #1300]
	add	r7, r3, r7
	strb	r6, [r7, #23]
	b	.L2197
.L2231:
	.align	2
.L2230:
	.word	.LC277
	.word	.LC278
	.word	.LC279
	.word	.LC280
	.word	.LC281
	.word	.LC282
	.word	.LC283
	.word	.LC284
	.word	.LC285
	.word	.LANCHOR2
	.word	.LC289
	.word	.LC291
	.word	.LC176
	.word	g_event_report
	.word	.LC287
	.word	.LC286
	.word	.LC288
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC290
	UNWIND(.fnend)
	.size	H264_DecSPS, .-H264_DecSPS
	.align	2
	.global	PassBytes
	.type	PassBytes, %function
PassBytes:
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
	ldr	ip, [r0, #368]
	cmp	ip, #0
	cmpne	r1, #0
	beq	.L2241
	ldrb	r3, [ip]	@ zero_extendqisi2
	mov	r2, r3, asl #2
	mov	r5, r3, asl #5
	rsb	r4, r2, r5
	add	r4, ip, r4
	add	r6, r4, #8
	ldr	lr, [r4, #8]
	cmp	lr, #0
	beq	.L2241
	ldr	lr, [ip, #68]
	cmp	r3, #1
	cmpls	lr, #2
	bhi	.L2241
	cmp	lr, r3
	bls	.L2241
	ldr	lr, [r4, #12]
	mov	r6, r2
	ldr	r4, [r4, #24]
	mov	lr, lr, asl #3
	add	r1, r4, r1, lsl #3
	cmp	r1, lr
	bhi	.L2236
	b	.L2234
.L2237:
	ldr	r4, [r2, #24]
	ldr	r2, [r2, #12]
	rsb	lr, lr, r4
	add	r1, r1, lr
	mov	lr, r2, asl #3
	cmp	r1, lr
	bls	.L2234
.L2236:
	rsb	r2, r6, r5
	add	r3, r3, #1
	add	ip, ip, r2
	mov	r6, r3, asl #2
	mov	r5, r3, asl #5
	str	lr, [ip, #24]
	rsb	r2, r6, r5
	ldr	ip, [r0, #368]
	ldrb	r4, [ip]	@ zero_extendqisi2
	add	r4, r4, #1
	strb	r4, [ip]
	ldr	ip, [r0, #368]
	add	r2, ip, r2
	ldr	r4, [ip, #68]
	cmp	r4, r3
	bhi	.L2237
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2234:
	rsb	r2, r6, r5
	mov	r0, #1
	add	ip, ip, r2
	str	r1, [ip, #24]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2241:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	PassBytes, .-PassBytes
	.align	2
	.global	GetBytes
	.type	GetBytes, %function
GetBytes:
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
	cmp	r1, #0
	beq	.L2256
	ldr	r3, [r0, #368]
	cmp	r3, #0
	cmpne	r2, #0
	ble	.L2256
	ldrb	r7, [r3]	@ zero_extendqisi2
	mov	ip, r7, asl #5
	sub	ip, ip, r7, asl #2
	add	ip, r3, ip
	ldr	ip, [ip, #8]
	cmp	ip, #0
	beq	.L2256
	ldr	ip, [r3, #68]
	cmp	r7, #1
	cmpls	ip, #2
	movhi	lr, #1
	movls	lr, #0
	bhi	.L2256
	cmp	ip, r7
	bls	.L2256
.L2251:
	mov	r5, r7, asl #5
	sub	r5, r5, r7, asl #2
	add	r3, r3, r5
	ldr	r4, [r3, #24]
	ldr	r8, [r3, #8]
	add	r4, r4, #7
	ldr	r6, [r3, #12]
	add	ip, r8, r4, lsr #3
	add	r6, r8, r6
	cmp	ip, r6
	bcs	.L2247
	ldrb	r3, [r8, r4, lsr #3]	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	lr, r2
	add	r4, r1, #1
	add	ip, ip, #1
	strb	r3, [r1]
	b	.L2258
.L2249:
	cmp	ip, r6
	mov	r1, r4
	beq	.L2247
	ldrb	r3, [ip], #1	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	lr, r2
	strb	r3, [r4], #1
.L2258:
	ldr	r3, [r0, #368]
	add	r3, r3, r5
	ldr	r1, [r3, #24]
	add	r1, r1, #8
	str	r1, [r3, #24]
	bcc	.L2249
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2247:
	ldr	ip, [r0, #368]
	add	r7, r7, #1
	ldrb	r3, [ip]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [ip]
	ldr	r3, [r0, #368]
	ldr	ip, [r3, #68]
	cmp	ip, r7
	bhi	.L2251
	mov	r0, lr
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2256:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	GetBytes, .-GetBytes
	.align	2
	.global	H264_DecFramePackingSEI
	.type	H264_DecFramePackingSEI, %function
H264_DecFramePackingSEI:
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
	ldr	r1, .L2266
	mov	r5, r0
	bl	ue_v
	add	r4, r5, #24576
	ldr	r2, .L2266+4
	mov	r1, #1
	str	r0, [r4, #1840]
	mov	r0, r5
	bl	u_v
	uxtb	r0, r0
	strb	r0, [r4, #1817]
	cmp	r0, #0
	beq	.L2265
.L2260:
	mov	r0, r5
	ldr	r2, .L2266+8
	mov	r1, #1
	bl	u_v
	mov	r3, #1
	strb	r3, [r4, #1816]
	strb	r0, [r4, #1818]
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2265:
	ldr	r2, .L2266+12
	mov	r1, #7
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+16
	mov	r1, #1
	str	r0, [r4, #1832]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+20
	mov	r1, #6
	strb	r0, [r4, #1819]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+24
	mov	r1, #1
	str	r0, [r4, #1836]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+28
	mov	r1, #1
	strb	r0, [r4, #1820]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+32
	mov	r1, #1
	strb	r0, [r4, #1821]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+36
	mov	r1, #1
	strb	r0, [r4, #1822]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+40
	mov	r1, #1
	strb	r0, [r4, #1823]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+44
	mov	r1, #1
	strb	r0, [r4, #1824]
	mov	r0, r5
	bl	u_v
	ldrb	r3, [r4, #1819]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r4, #1825]
	bne	.L2261
	ldr	r3, [r4, #1832]
	cmp	r3, #5
	beq	.L2261
	ldr	r2, .L2266+48
	mov	r1, #1
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+52
	mov	r1, #1
	strb	r0, [r4, #1826]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+56
	mov	r1, #1
	strb	r0, [r4, #1827]
	mov	r0, r5
	bl	u_v
	ldr	r2, .L2266+60
	mov	r1, #1
	strb	r0, [r4, #1828]
	mov	r0, r5
	bl	u_v
	strb	r0, [r4, #1829]
.L2261:
	ldr	r2, .L2266+64
	mov	r1, #8
	mov	r0, r5
	bl	u_v
	ldr	r1, .L2266+68
	str	r0, [r4, #1844]
	mov	r0, r5
	bl	ue_v
	str	r0, [r4, #1848]
	b	.L2260
.L2267:
	.align	2
.L2266:
	.word	.LC292
	.word	.LC293
	.word	.LC309
	.word	.LC294
	.word	.LC295
	.word	.LC296
	.word	.LC297
	.word	.LC298
	.word	.LC299
	.word	.LC300
	.word	.LC301
	.word	.LC302
	.word	.LC303
	.word	.LC304
	.word	.LC305
	.word	.LC306
	.word	.LC307
	.word	.LC308
	UNWIND(.fnend)
	.size	H264_DecFramePackingSEI, .-H264_DecFramePackingSEI
	.align	2
	.global	H264_Sei_Get_Dpb_Output_Time
	.type	H264_Sei_Get_Dpb_Output_Time, %function
H264_Sei_Get_Dpb_Output_Time:
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
	add	r2, r0, #12288
	add	r3, r0, #20480
	mov	r4, #2208
	add	r0, r0, #24576
	ldr	lr, [r2, #1304]
	mov	r1, #4000
	ldr	r3, [r3, #220]
	ldr	r6, [r2, #1300]
	ldr	ip, [r0, #1856]
	mla	r4, r4, r3, lr
	ldr	r3, [r0, #1868]
	ldr	lr, [r0, #1860]
	add	r3, r3, #1
	ldr	r2, [r0, #1872]
	subs	r5, r3, #1
	add	r2, r2, #1
	ldr	r4, [r4, #28]
	movne	r5, #1
	cmp	ip, #0
	str	ip, [r0, #1876]
	str	r2, [r0, #1872]
	mla	r1, r1, r4, r6
	movne	r5, #0
	cmp	r5, #0
	str	r3, [r0, #1868]
	str	lr, [r0, #1884]
	ldrne	ip, [r0, #1880]
	ldr	r2, [r1, #3344]
	addne	ip, ip, #2
	str	r2, [r0, #1920]
	ldr	r2, [r1, #3348]
	strne	ip, [r0, #1876]
	cmp	r3, #1
	str	r2, [r0, #1924]
	beq	.L2276
	ldrb	r3, [r0, #1945]	@ zero_extendqisi2
	add	r4, r0, #1872
	cmp	r3, #1
	ldrd	r2, [r4, #40]
	beq	.L2277
	adds	r2, r2, ip
	adc	r3, r3, #0
	strd	r2, [r4, #32]
.L2271:
	adds	r2, r2, lr
	mov	lr, #0
	adc	r3, r3, #0
	strb	lr, [r0, #1945]
	ldr	r4, [r1, #3368]
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	ldr	r8, [r1, #3344]
	add	lr, r0, #1872
	subs	r6, r2, r4
	sbc	r7, r3, #0
	umull	r4, r5, r6, r8
	mla	r5, r8, r7, r5
	strd	r4, [lr, #16]
	ldr	r1, [r1, #3368]
	subs	r2, r2, r1
	sbc	r3, r3, #0
	strd	r2, [lr, #24]
	str	ip, [r0, #1880]
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2276:
	mov	r6, #0
	str	r6, [r0, #1904]
	mov	r2, r6
	mov	r3, r6
	str	r6, [r0, #1912]
	str	r6, [r0, #1908]
	str	r6, [r0, #1916]
	b	.L2271
.L2277:
	adds	r2, r2, ip
	adc	r3, r3, #0
	strd	r2, [r4, #32]
	strd	r2, [r4, #40]
	b	.L2271
	UNWIND(.fnend)
	.size	H264_Sei_Get_Dpb_Output_Time, .-H264_Sei_Get_Dpb_Output_Time
	.align	2
	.global	H264_Get_Last_IDR_Frame_Info
	.type	H264_Get_Last_IDR_Frame_Info, %function
H264_Get_Last_IDR_Frame_Info:
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
	cmp	r1, #5
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r1, [r0]
	mvn	r3, #0
	mvn	r2, #0
	ldrd	r4, [r1, #56]
	cmp	r5, r3
	cmpeq	r4, r2
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	add	r2, r0, #26368
	movw	r1, #26512
	add	r3, r2, #112
	strd	r4, [r2, #136]
	ldrd	r2, [r3, #-8]
	strd	r2, [r0, r1]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	H264_Get_Last_IDR_Frame_Info, .-H264_Get_Last_IDR_Frame_Info
	.align	2
	.global	H264_Sei_Get_Frame_Pts
	.type	H264_Sei_Get_Frame_Pts, %function
H264_Sei_Get_Frame_Pts:
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
	add	r2, r0, #26368
	add	r1, r0, #24576
	mov	r4, r0
	ldrd	r6, [r2, #136]
	mov	r3, r2
	ldr	r5, [r1, #1920]
	movw	r0, #26512
	ldr	r10, [r1, #1924]
	strd	r6, [fp, #-52]
	cmp	r5, #0
	ldrd	r6, [r3, #104]
	ldrd	r2, [r4, r0]
	strd	r2, [fp, #-60]
	beq	.L2283
	mov	r9, r5
	mov	r0, r10
	b	.L2282
.L2284:
	mov	r9, r1
.L2282:
	mov	r1, r9
	bl	__aeabi_uidivmod
	mov	r0, r9
	cmp	r1, #0
	bne	.L2284
.L2281:
	ldrd	r2, [fp, #-60]
	mov	r1, r9
	mov	r0, r5
	mov	r8, #1000
	subs	r2, r6, r2
	add	r4, r4, #61952
	mul	r6, r8, r2
	bl	__aeabi_uidiv
	mov	r1, r9
	mul	r6, r0, r6
	mov	r0, r10
	bl	__aeabi_uidiv
	mov	r1, r0
	mov	r0, r6
	bl	__aeabi_uidiv
	ldrd	r2, [fp, #-52]
	adds	r2, r2, r0
	adc	r3, r3, #0
	mov	r0, r2
	mov	r1, r3
	strd	r0, [r4, #24]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2283:
	mov	r9, r10
	b	.L2281
	UNWIND(.fnend)
	.size	H264_Sei_Get_Frame_Pts, .-H264_Sei_Get_Frame_Pts
	.align	2
	.global	H264_DecPicTimingSEI
	.type	H264_DecPicTimingSEI, %function
H264_DecPicTimingSEI:
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
	add	r2, r0, #12288
	mov	r4, #4000
	mov	r5, r0
	ldr	r1, [r2, #1344]
	ldr	r3, [r2, #1300]
	mla	r4, r4, r1, r3
	ldrb	r1, [r4, #23]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2286
	ldr	ip, [r2, #1288]
	cmp	ip, #0
	ble	.L2287
	ldrb	r2, [r3, #23]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #4000
	beq	.L2290
	b	.L2308
.L2291:
	ldrb	r1, [r3, #-3977]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2288
.L2290:
	add	r2, r2, #1
	mov	r4, r3
	cmp	r2, ip
	add	r3, r3, #4000
	bne	.L2291
.L2287:
	ldr	r1, .L2311
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
.L2292:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2308:
	mov	r4, r3
.L2288:
	cmp	r4, #0
	beq	.L2287
.L2286:
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2294
	ldrb	r3, [r4, #3299]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2309
	ldr	r1, [r4, #3676]
	ldr	r7, [r4, #3680]
	add	r1, r1, #1
	add	r7, r7, #1
.L2298:
	ldr	r2, .L2311+4
	mov	r0, r5
	bl	u_v
	add	r6, r5, #24576
	ldr	r2, .L2311+8
	mov	r1, r7
	str	r0, [r6, #1856]
	mov	r0, r5
	bl	u_v
	add	r3, r5, #61440
	ldr	r2, .L2311+12
	str	r0, [r6, #1860]
	ldr	r3, [r3, #3520]
	ldr	r3, [r2, r3, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L2310
.L2294:
	ldrb	r0, [r4, #3303]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	r3, r0
	beq	.L2292
	ldr	r2, .L2311+16
	mov	r1, #4
	mov	r0, r5
	add	r5, r5, #24576
	bl	u_v
	mov	r3, #0
	strb	r0, [r5, #1852]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2309:
	ldrb	r3, [r4, #3302]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2294
	ldr	r1, [r4, #3988]
	ldr	r7, [r4, #3992]
	add	r1, r1, #1
	add	r7, r7, #1
	b	.L2298
.L2310:
	ldr	r2, [r3, #176]
	cmp	r2, #0
	bne	.L2294
	ldr	r3, [r3, #180]
	cmp	r3, #1
	bne	.L2294
	mov	r0, r5
	bl	H264_Sei_Get_Dpb_Output_Time
	b	.L2294
.L2312:
	.align	2
.L2311:
	.word	.LC310
	.word	.LC311
	.word	.LC312
	.word	s_pstVfmwChan
	.word	.LC313
	UNWIND(.fnend)
	.size	H264_DecPicTimingSEI, .-H264_DecPicTimingSEI
	.align	2
	.global	H264_DecSEI
	.type	H264_DecSEI, %function
H264_DecSEI:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	add	r10, r0, #61440
	ldr	r3, .L2587
	mov	r1, #0
	ldr	r2, [r10, #3520]
	mov	r7, r0
	strb	r1, [fp, #-45]
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L2552
.L2314:
	ldr	r3, [r7, #368]
	mov	r2, #32
	str	r2, [r3, #24]
.L2315:
	add	r6, r7, #13504
	add	r4, r7, #12288
	add	r6, r6, #24
	mov	r8, #0
	b	.L2318
.L2554:
	bl	BsSkip
	cmp	r5, #0
	ble	.L2317
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2553
.L2318:
	mov	r2, #1
	sub	r1, fp, #45
	mov	r0, r7
	bl	GetBytes
	ldr	r3, [r4, #1264]
	ldr	ip, [r4, #1256]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r8, r8, r2
	mov	r5, r0
	mov	r0, r6
	bls	.L2554
.L2317:
	ldr	r1, .L2587+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2320
.L2553:
	mov	r3, #0
	str	r3, [fp, #-60]
.L2498:
	mov	r5, #0
	b	.L2324
.L2556:
	bl	BsSkip
	cmp	r9, #0
	ble	.L2322
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2555
.L2324:
	mov	r2, #1
	sub	r1, fp, #45
	mov	r0, r7
	bl	GetBytes
	ldr	r3, [r4, #1264]
	ldr	ip, [r4, #1256]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r5, r5, r2
	mov	r9, r0
	mov	r0, r6
	bls	.L2556
.L2322:
	ldr	r1, .L2587+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L2320:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2555:
	cmp	r5, #409600
	bgt	.L2322
	ldr	r3, [r7, #368]
	ldr	r2, [r3, #68]
	cmp	r2, #2
	ldreq	r2, [r3, #52]
	ldreq	r3, [r3, #24]
	ldrne	r2, [r3, #24]
	addeq	r2, r2, r3
	moveq	r2, r2, lsr #3
	cmp	r8, #45
	ldrls	pc, [pc, r8, asl #2]
	b	.L2327
.L2329:
	.word	.L2328
	.word	.L2330
	.word	.L2331
	.word	.L2332
	.word	.L2333
	.word	.L2334
	.word	.L2335
	.word	.L2336
	.word	.L2337
	.word	.L2338
	.word	.L2339
	.word	.L2340
	.word	.L2341
	.word	.L2342
	.word	.L2343
	.word	.L2344
	.word	.L2345
	.word	.L2346
	.word	.L2347
	.word	.L2348
	.word	.L2349
	.word	.L2350
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2327
	.word	.L2351
.L2351:
	mov	r1, r5
	mov	r0, r7
	ldr	r8, [r4, #1264]
	bl	H264_DecFramePackingSEI
	ldr	r0, [r4, #1264]
	mov	r9, r5, asl #3
	rsb	r3, r8, r0
	cmp	r3, r9
	bge	.L2481
	rsb	r3, r3, r9
	str	r3, [fp, #-56]
	cmp	r3, #0
	add	r8, r3, #7
	movge	r8, r3
	ldr	r3, [r4, #1256]
	mov	r8, r8, asr #3
	cmp	r8, #0
	movle	r3, r3, asl #3
	ble	.L2483
	add	r2, r0, #8
	mov	r3, r3, asl #3
	cmp	r2, r3
	bhi	.L2483
	mov	r9, #0
	b	.L2484
.L2485:
	add	r2, r0, #8
	cmp	r2, r3
	bhi	.L2483
.L2484:
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	add	r9, r9, #1
	ldr	r3, [r4, #1256]
	cmp	r9, r8
	ldr	r0, [r4, #1264]
	mov	r3, r3, asl #3
	bne	.L2485
.L2483:
	ldr	r2, [fp, #-56]
	mov	r1, r2, asr #31
	mov	r1, r1, lsr #29
	add	r2, r2, r1
	and	r2, r2, #7
	rsb	r1, r1, r2
	add	r2, r0, r1
	cmp	r3, r2
	bcs	.L2557
.L2481:
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2558
.L2547:
	ldr	r3, [r10, #2088]
.L2354:
	cmp	r3, #3
	bhi	.L2559
.L2493:
	mov	r8, #0
	b	.L2497
.L2495:
	bl	BsSkip
	cmp	r5, #0
	ble	.L2496
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2560
.L2497:
	mov	r2, #1
	sub	r1, fp, #45
	mov	r0, r7
	bl	GetBytes
	ldr	r3, [r4, #1264]
	ldr	ip, [r4, #1256]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r8, r8, r2
	mov	r5, r0
	mov	r0, r6
	bls	.L2495
.L2496:
	mov	r0, #0
.L2585:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2350:
	mov	r3, r5
	ldr	r1, .L2587+12
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2561
.L2475:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2478
.L2479:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2478:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2479
	b	.L2547
.L2349:
	mov	r3, r5
	ldr	r1, .L2587+16
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2562
.L2470:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2473
.L2474:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2473:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2474
	b	.L2547
.L2346:
	mov	r3, r5
	ldr	r1, .L2587+20
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2563
.L2455:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2458
.L2459:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2458:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2459
	b	.L2547
.L2345:
	mov	r3, r5
	ldr	r1, .L2587+24
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2564
.L2450:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2453
.L2454:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2453:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2454
	b	.L2547
.L2344:
	mov	r3, r5
	ldr	r1, .L2587+28
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2565
.L2445:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2448
.L2449:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2448:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2449
	b	.L2547
.L2343:
	mov	r3, r5
	ldr	r1, .L2587+32
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2566
.L2440:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2443
.L2444:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2443:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2444
	b	.L2547
.L2348:
	mov	r3, r5
	ldr	r1, .L2587+36
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2567
.L2465:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2468
.L2469:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2468:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2469
	b	.L2547
.L2347:
	mov	r3, r5
	ldr	r1, .L2587+40
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2568
.L2460:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2463
.L2464:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2463:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2464
	b	.L2547
.L2342:
	mov	r3, r5
	ldr	r1, .L2587+44
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2569
.L2435:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2438
.L2439:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2438:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2439
	b	.L2547
.L2341:
	mov	r3, r5
	ldr	r1, .L2587+48
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2570
.L2430:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2433
.L2434:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2433:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2434
	b	.L2547
.L2340:
	mov	r3, r5
	ldr	r1, .L2587+52
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2571
.L2425:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2428
.L2429:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2428:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2429
	b	.L2547
.L2339:
	mov	r3, r5
	ldr	r1, .L2587+56
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2572
.L2420:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2423
.L2424:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2423:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2424
	b	.L2547
.L2338:
	mov	r3, r5
	ldr	r1, .L2587+60
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2573
.L2415:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2418
.L2419:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2418:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2419
	b	.L2547
.L2337:
	mov	r3, r5
	ldr	r1, .L2587+64
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2574
.L2410:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2413
.L2414:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2413:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2414
	b	.L2547
.L2336:
	mov	r3, r5
	ldr	r1, .L2587+68
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2575
.L2405:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2408
.L2409:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2408:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2409
	b	.L2547
.L2335:
	mov	r3, r5
	ldr	r1, .L2587+72
	mov	r0, #20
	bl	dprint_vfmw
	cmp	r5, #0
	ble	.L2402
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2402
	mov	r8, #0
	b	.L2403
.L2404:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2402
.L2403:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2404
.L2402:
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	bge	.L2547
	movw	r3, #11720
	b	.L2548
.L2334:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	bne	.L2333
	mov	r3, r5
	ldr	r1, .L2587+76
	mov	r0, #20
	bl	dprint_vfmw
	ldr	r8, [r10, #2088]
	cmp	r8, #3
	bhi	.L2576
.L2378:
	ldr	r0, [r10, #3520]
	bl	GetUsd
	add	r3, r8, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	str	r0, [r3, #4]
	ldr	r3, [r10, #2088]
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	ldr	ip, [r3, #4]
	cmp	ip, #0
	beq	.L2501
	ldr	r2, [r7, #368]
	cmp	r5, #1024
	movlt	r9, r5
	movge	r9, #1024
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	lr, [r2, #68]
	cmp	r0, lr
	bcs	.L2502
	sxth	r3, r0
	mov	r8, #0
	mov	r1, r3, asl #5
	sub	r1, r1, r3, asl #2
	add	r1, r2, r1
.L2380:
	ldr	r3, [r1, #24]
	add	r0, r0, #1
	ldr	r2, [r1, #12]
	cmp	r0, lr
	add	r3, r3, #7
	add	r1, r1, #28
	sub	r3, r2, r3, lsr #3
	add	r8, r8, r3
	bne	.L2380
	mov	r3, r8
.L2379:
	cmp	r9, r3
	ldrsb	r2, [fp, #-60]
	movle	r8, r9
	cmp	r2, #1
	str	r2, [fp, #-64]
	movne	r3, #0
	strne	r3, [fp, #-56]
	beq	.L2577
.L2382:
	rsb	r2, r3, r8
	cmp	r2, #0
	ble	.L2578
	ldr	r3, [r10, #2088]
	mov	r0, r7
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	ldr	r1, [r3, #4]
	bl	GetBytes
	subs	r8, r0, #0
	ble	.L2579
	ldr	r3, [fp, #-56]
	rsb	r3, r3, r9
	cmp	r8, r3
	ldr	r3, [r10, #2088]
	bge	.L2388
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r8, [r3, #1052]
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2389
	mov	r5, #0
	b	.L2390
.L2392:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2389
.L2390:
	add	r5, r5, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2392
.L2389:
	ldr	r2, [fp, #-64]
	ldr	r3, [r10, #2088]
	cmp	r2, #1
	ldr	r1, [r7]
	add	r3, r3, #15872
	ldr	ip, .L2587+112
	add	r3, r3, #10
	moveq	r2, #8
	movne	r2, #9
.L2550:
	add	r3, r7, r3, lsl #2
	ldrd	r0, [r1, #56]
	ldr	ip, [ip]
	ldr	r3, [r3, #4]
	cmp	ip, #0
	add	r3, r3, #1056
	strd	r0, [r3]
	ldr	r3, [r10, #2088]
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r2, [r3, #1040]
	ldr	r3, [r10, #2088]
	ldr	r2, [r10, #3480]
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r2, [r3, #1044]
	beq	.L2398
	ldr	r2, [r10, #2088]
	movw	r3, #1064
	mov	r1, #6
	ldr	r0, [r10, #3520]
	add	r2, r2, #15872
	add	r2, r2, #10
	add	r2, r7, r2, lsl #2
	ldr	r2, [r2, #4]
	blx	ip
.L2398:
	ldr	r3, [r10, #2088]
	add	r3, r3, #1
	str	r3, [r10, #2088]
	cmp	r3, #3
	bls	.L2493
.L2559:
	ldr	r1, .L2587+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2320
.L2330:
	mov	r3, r5
	ldr	r1, .L2587+84
	mov	r0, #20
	mov	r9, r5, asl #3
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	ldr	r8, [r4, #1264]
	bl	H264_DecPicTimingSEI
	ldr	r2, [r4, #1264]
	rsb	r3, r8, r2
	cmp	r3, r9
	bge	.L2359
	rsb	r3, r3, r9
	str	r3, [fp, #-56]
	cmp	r3, #0
	add	r8, r3, #7
	movge	r8, r3
	ldr	r3, [r4, #1256]
	mov	r8, r8, asr #3
	cmp	r8, #0
	movle	r3, r3, asl #3
	ble	.L2361
	add	r1, r2, #8
	mov	r3, r3, asl #3
	cmp	r1, r3
	bhi	.L2361
	mov	r9, #0
	b	.L2362
.L2363:
	add	r1, r2, #8
	cmp	r1, r3
	bhi	.L2361
.L2362:
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	add	r9, r9, #1
	ldr	r3, [r4, #1256]
	cmp	r9, r8
	ldr	r2, [r4, #1264]
	mov	r3, r3, asl #3
	bne	.L2363
.L2361:
	ldr	ip, [fp, #-56]
	mov	r1, ip, asr #31
	mov	r0, r1, lsr #29
	add	r1, ip, r0
	and	r1, r1, #7
	rsb	r1, r0, r1
	add	r2, r2, r1
	cmp	r2, r3
	bls	.L2580
.L2359:
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	bge	.L2547
	movw	r3, #11468
.L2548:
	ldr	r2, .L2587+116
	mov	r0, #20
	ldr	r1, .L2587+120
	bl	dprint_vfmw
	ldr	r3, [r10, #2088]
	b	.L2354
.L2328:
	add	r1, r7, #24576
	mov	lr, #1
	mov	r0, #0
	mov	r3, r5
	ldr	ip, [r1, #1864]
	str	r0, [r1, #1872]
	mov	r0, #20
	add	ip, ip, lr
	strb	lr, [r1, #1945]
	str	ip, [r1, #1864]
	ldr	r1, .L2587+88
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2581
.L2352:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2356
.L2357:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2356:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2357
	b	.L2547
.L2332:
	mov	r3, r5
	ldr	r1, .L2587+92
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2582
.L2371:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2374
.L2375:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2374:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2375
	b	.L2547
.L2331:
	mov	r3, r5
	ldr	r1, .L2587+96
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2583
.L2366:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2369
.L2370:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2369:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2370
	b	.L2547
.L2588:
	.align	2
.L2587:
	.word	s_pstVfmwChan
	.word	.LC314
	.word	.LC315
	.word	.LC343
	.word	.LC342
	.word	.LC339
	.word	.LC338
	.word	.LC337
	.word	.LC336
	.word	.LC341
	.word	.LC340
	.word	.LC335
	.word	.LC334
	.word	.LC333
	.word	.LC332
	.word	.LC331
	.word	.LC330
	.word	.LC329
	.word	.LC328
	.word	.LC322
	.word	.LC344
	.word	.LC318
	.word	.LC316
	.word	.LC320
	.word	.LC319
	.word	.LC321
	.word	.LC323
	.word	.LC325
	.word	g_event_report
	.word	.LANCHOR1+216
	.word	.LC317
	.word	.LC324
	.word	.LC326
	.word	.LC327
.L2333:
	mov	r3, r5
	ldr	r1, .L2587+100
	mov	r0, #20
	bl	dprint_vfmw
	ldr	r8, [r10, #2088]
	mov	r3, #1
	str	r3, [fp, #-60]
	cmp	r8, #3
	bls	.L2378
.L2576:
	ldr	r1, [r10, #2092]
	ldr	r0, [r10, #3520]
	bl	FreeUsdByDec
	ldr	r1, [r10, #2096]
	ldr	r0, [r10, #3520]
	bl	FreeUsdByDec
	ldr	r1, [r10, #2100]
	ldr	r0, [r10, #3520]
	bl	FreeUsdByDec
	ldr	r1, [r10, #2104]
	ldr	r0, [r10, #3520]
	bl	FreeUsdByDec
	mov	r3, #0
	mov	r8, r3
	str	r3, [r10, #2092]
	str	r3, [r10, #2096]
	str	r3, [r10, #2100]
	str	r3, [r10, #2104]
	str	r3, [r10, #2088]
	b	.L2378
.L2327:
	mov	r1, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	blt	.L2584
.L2488:
	cmp	r5, #0
	ble	.L2547
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
	mov	r8, #0
	b	.L2491
.L2492:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2547
.L2491:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2492
	b	.L2547
.L2560:
	cmp	r3, #128
	bne	.L2498
	mov	r0, #0
	b	.L2585
.L2388:
	add	r3, r3, #15872
	ldr	r2, [fp, #-56]
	add	r3, r3, #10
	cmp	r9, r5
	rsb	r8, r2, r5
	add	r3, r7, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r8, [r3, #1052]
	bcc	.L2586
.L2394:
	cmp	r8, #0
	ble	.L2389
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2389
	mov	r5, #0
	b	.L2396
.L2397:
	ldr	r3, [r4, #1264]
	ldr	r2, [r4, #1256]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2389
.L2396:
	add	r5, r5, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2397
	b	.L2389
.L2552:
	ldr	r2, [r3, #176]
	cmp	r2, r1
	bne	.L2314
	ldr	r2, [r3, #180]
	cmp	r2, #1
	bne	.L2314
	ldr	r3, [r3, #172]
	cmp	r3, #1
	bne	.L2314
	ldr	r3, [r0, #368]
	mov	r2, #48
	str	r2, [r3, #24]
	b	.L2315
.L2580:
	mov	r0, r6
	bl	BsSkip
	b	.L2359
.L2558:
	movw	r3, #12148
	b	.L2548
.L2557:
	mov	r0, r6
	bl	BsSkip
	b	.L2481
.L2577:
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	mov	r1, #8
	mov	r0, r7
	ldr	r2, .L2587+104
	strb	r3, [ip, #1026]
	ldr	r3, [r10, #2088]
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [fp, #-56]
	bl	u_v
	ldr	r3, [fp, #-56]
	strb	r0, [r3, #1027]
	ldr	r3, [r10, #2088]
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	ldr	ip, [r3, #4]
	ldrb	r3, [ip, #1027]	@ zero_extendqisi2
	cmp	r3, #255
	beq	.L2383
	mov	r3, #3
	mov	r2, #0
	str	r3, [fp, #-56]
	strb	r2, [ip, #1028]
.L2384:
	ldr	ip, [r10, #2088]
	mov	r1, #16
	ldr	r2, .L2587+108
	mov	r0, r7
	add	ip, ip, #15872
	str	r3, [fp, #-68]
	add	ip, ip, #10
	add	ip, r7, ip, lsl #2
	ldr	ip, [ip, #4]
	str	ip, [fp, #-72]
	bl	u_v
	ldr	ip, [fp, #-72]
	ldr	r3, [fp, #-68]
	add	ip, ip, #1024
	mov	r1, r3
	strh	r0, [ip, #6]	@ movhi
	mov	r0, r7
	bl	PassBytes
	ldr	r3, [fp, #-68]
	cmp	r8, r3
	bne	.L2382
	ldr	r3, [r10, #2088]
	mov	r2, #8
	ldr	r1, [r7]
	add	r3, r3, #15872
	ldr	ip, .L2587+112
	add	r3, r3, #10
	b	.L2550
.L2586:
	rsb	r1, r9, r5
	mov	r0, r7
	bl	PassBytes
	cmp	r0, #0
	bge	.L2394
	movw	r3, #11667
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2394
.L2502:
	mov	r3, #0
	mov	r8, r3
	b	.L2379
.L2584:
	mov	r3, #12160
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2488
.L2583:
	movw	r3, #11480
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2366
.L2582:
	movw	r3, #11506
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2371
.L2581:
	movw	r3, #11415
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2352
.L2575:
	movw	r3, #11732
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2405
.L2574:
	movw	r3, #11758
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2410
.L2573:
	movw	r3, #11784
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2415
.L2572:
	movw	r3, #11810
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2420
.L2571:
	movw	r3, #11836
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2425
.L2570:
	movw	r3, #11862
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2430
.L2569:
	movw	r3, #11888
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2435
.L2568:
	movw	r3, #12018
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2460
.L2567:
	movw	r3, #12044
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2465
.L2566:
	movw	r3, #11914
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2440
.L2565:
	movw	r3, #11940
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2445
.L2564:
	movw	r3, #11966
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2450
.L2563:
	movw	r3, #11992
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2455
.L2562:
	movw	r3, #12070
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2470
.L2561:
	mov	r3, #12096
	ldr	r2, .L2587+116
	ldr	r1, .L2587+120
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2475
.L2501:
	mvn	r0, #0
	b	.L2320
.L2383:
	ldr	r2, .L2587+124
	mov	r1, #8
	mov	r0, r7
	mov	r3, #4
	str	ip, [fp, #-68]
	str	r3, [fp, #-56]
	bl	u_v
	ldr	ip, [fp, #-68]
	ldr	r3, [fp, #-56]
	strb	r0, [ip, #1028]
	b	.L2384
.L2578:
	ldr	r1, .L2587+128
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r10, #2088]
	ldr	r0, [r10, #3520]
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	ldr	r1, [r3, #4]
	bl	FreeUsdByDec
	ldr	r3, [r10, #2088]
	mov	r2, #0
	mvn	r0, #0
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	str	r2, [r3, #4]
	b	.L2320
.L2579:
	ldr	r1, .L2587+132
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r10, #2088]
	ldr	r0, [r10, #3520]
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r3, r7, r3, lsl #2
	ldr	r1, [r3, #4]
	bl	FreeUsdByDec
	ldr	r3, [r10, #2088]
	mov	r2, #0
	mvn	r0, #0
	add	r3, r3, #15872
	add	r3, r3, #10
	add	r7, r7, r3, lsl #2
	str	r2, [r7, #4]
	b	.L2320
	UNWIND(.fnend)
	.size	H264_DecSEI, .-H264_DecSEI
	.align	2
	.global	InitOldSlice
	.type	InitOldSlice, %function
InitOldSlice:
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
	add	r2, r0, #12288
	add	r0, r0, #20480
	movw	r3, #23352
	ldr	r1, [r2, #1292]
	movt	r3, 1
	mov	r2, #2
	str	r3, [r0, #1872]
	strb	r2, [r0, #1857]
	mov	r3, #32
	mov	r2, #7
	strb	r3, [r0, #1858]
	str	r2, [r0, #1868]
	mvn	r3, #0
	mov	r2, #3
	str	r3, [r0, #1884]
	str	r2, [r0, #1880]
	mov	r3, #0
	mov	r2, #262144
	str	r1, [r0, #1864]
	str	r2, [r0, #1896]
	strb	r3, [r0, #1856]
	str	r3, [r0, #1888]
	str	r3, [r0, #1892]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	InitOldSlice, .-InitOldSlice
	.align	2
	.global	H264_IsNewPicNal
	.type	H264_IsNewPicNal, %function
H264_IsNewPicNal:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	mov	r5, r0
	and	r3, r3, #31
	sub	r3, r3, #1
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L2598
.L2593:
	.word	.L2592
	.word	.L2598
	.word	.L2598
	.word	.L2598
	.word	.L2592
	.word	.L2598
	.word	.L2594
	.word	.L2594
.L2594:
	ldr	r3, [r0]
	mov	r2, #1
	str	r2, [r0]
	adds	r3, r3, #0
	movne	r3, #1
	rsb	r0, r3, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2592:
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L2595
.L2597:
	mvn	r0, #0
.L2596:
	mov	r2, #0
	str	r2, [r5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2598:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2595:
	ldrb	ip, [r1, #5]	@ zero_extendqisi2
	ldrb	r3, [r1, #6]	@ zero_extendqisi2
	ldrb	r2, [r1, #7]	@ zero_extendqisi2
	mov	ip, ip, asl #16
	ldrb	r4, [r1, #4]	@ zero_extendqisi2
	orr	r3, ip, r3, asl #8
	orr	r3, r3, r2
	orr	r4, r3, r4, asl #24
	mov	r0, r4
	bl	ZerosMS_32
	cmp	r0, #15
	bhi	.L2597
	mov	r3, r0, asl #1
	rsb	r3, r3, #31
	mov	r3, r4, lsr r3
	subs	r0, r3, #1
	mvnne	r0, #0
	b	.L2596
	UNWIND(.fnend)
	.size	H264_IsNewPicNal, .-H264_IsNewPicNal
	.align	2
	.global	FindZeroBitsInSeg
	.type	FindZeroBitsInSeg, %function
FindZeroBitsInSeg:
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
	cmp	r0, #0
	cmpne	r1, #0
	mov	r9, r0
	str	r1, [fp, #-48]
	movle	r4, #1
	movgt	r4, #0
	ble	.L2625
	ldr	r3, [fp, #-48]
	subs	r7, r3, #0
	add	r8, r3, #63
	movge	r8, r3
	ands	r3, r3, #63
	movne	r3, #1
	add	r8, r3, r8, asr #6
	cmp	r8, #0
	ble	.L2613
	ldr	r5, .L2626
	ldr	r10, .L2626+4
.L2611:
	cmp	r7, #64
	ldr	r3, [r10, #52]
	ldr	r0, .L2626
	movcc	r6, r7
	movcs	r6, #64
	mov	r2, r6
	rsb	r1, r6, r7
	sub	r6, r6, #1
	add	r1, r9, r1
	blx	r3
	add	r3, r5, r6
	ldrb	r2, [r5, r6]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2603
	ldr	r2, .L2626
	add	r4, r4, #1
	cmp	r3, r2
	bne	.L2606
	b	.L2604
.L2607:
	cmp	r3, r5
	add	r4, r4, #1
	beq	.L2604
.L2606:
	ldrb	r2, [r3, #-1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2607
.L2603:
	mov	r0, r4, asl #3
.L2602:
	ldr	r3, [fp, #-48]
	cmp	r4, r3
	bge	.L2615
	sub	r3, r3, #1
	rsb	r4, r4, r3
	ldrb	r2, [r9, r4]	@ zero_extendqisi2
	tst	r2, #1
	moveq	r2, r2, lsr #1
	moveq	r3, #1
	bne	.L2615
.L2610:
	tst	r2, #1
	mov	r2, r2, lsr #1
	bne	.L2608
	add	r3, r3, #1
	cmp	r3, #8
	bne	.L2610
	b	.L2608
.L2604:
	subs	r8, r8, #1
	sub	r7, r7, #64
	bne	.L2611
	b	.L2603
.L2615:
	mov	r3, #0
.L2608:
	add	r0, r3, r0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2625:
	mov	r2, r1
	mov	r0, #0
	ldr	r1, .L2626+8
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2613:
	mov	r0, r4
	b	.L2602
.L2627:
	.align	2
.L2626:
	.word	.LANCHOR3-1976
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC345
	UNWIND(.fnend)
	.size	FindZeroBitsInSeg, .-FindZeroBitsInSeg
	.align	2
	.global	FindTrailZeros
	.type	FindTrailZeros, %function
FindTrailZeros:
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
	subs	r4, r0, #0
	beq	.L2634
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2633
	ldr	r1, [r3, #40]
	ldr	r0, [r3, #36]
	bl	FindZeroBitsInSeg
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #40]
	cmp	r0, r2, asl #3
	bcs	.L2637
	cmn	r0, #1
	beq	.L2633
.L2632:
	add	r0, r0, #1
	str	r0, [r3, #72]
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2636
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #72]
	cmp	r2, r1, asl #3
	bcs	.L2638
.L2636:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2638:
	add	r2, r4, #61440
	ldr	r1, [r3, #60]
	ldr	r0, [r2, #3520]
	bl	SM_ReleaseStreamSeg
	ldr	r2, [r4, #368]
	mov	r3, #0
	mov	r1, #1
	mov	r0, r3
	str	r3, [r2, #36]
	ldr	r2, [r4, #368]
	str	r1, [r2, #68]
	ldr	r2, [r4, #368]
	str	r3, [r2, #72]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2637:
	add	r2, r4, #61440
	ldr	r1, [r3, #60]
	ldr	r0, [r2, #3520]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #368]
	mov	r1, #0
	mov	r2, #1
	str	r1, [r3, #36]
	ldr	r3, [r4, #368]
	str	r2, [r3, #68]
	ldr	r3, [r4, #368]
.L2633:
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #8]
	bl	FindZeroBitsInSeg
	ldr	r3, [r4, #368]
	b	.L2632
.L2634:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	FindTrailZeros, .-FindTrailZeros
	.align	2
	.global	CombinePacket
	.type	CombinePacket, %function
CombinePacket:
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
	ldr	r3, [r0, #368]
	ldr	r3, [r3, #12]
	cmp	r3, #4096
	ldmcsfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CombinePacket.part.11
	UNWIND(.fnend)
	.size	CombinePacket, .-CombinePacket
	.align	2
	.global	FindNaluArraySlot
	.type	FindNaluArraySlot, %function
FindNaluArraySlot:
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
	mov	ip, r0
	ldrb	r0, [r0, #377]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L2646
	mov	r2, ip
	mov	r3, #1
	b	.L2644
.L2643:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L2649
.L2644:
	ldrb	r1, [r2, #473]	@ zero_extendqisi2
	add	r2, r2, #96
	cmp	r1, #0
	bne	.L2643
	mov	r0, r3
.L2642:
	mov	r2, r3, asl #7
	mov	r1, #1
	sub	r3, r2, r3, asl #5
	add	ip, ip, r3
	strb	r1, [ip, #377]
	ldmfd	sp, {fp, sp, pc}
.L2649:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L2646:
	mov	r3, r0
	b	.L2642
	UNWIND(.fnend)
	.size	FindNaluArraySlot, .-FindNaluArraySlot
	.align	2
	.global	InquireSliceExtProperty
	.type	InquireSliceExtProperty, %function
InquireSliceExtProperty:
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
	mov	r4, r0
	add	r0, r0, #13504
	add	r0, r0, #24
	mov	r1, #24
	bl	BsGet
	ldr	r3, [r4, #368]
	ubfx	r2, r0, #23, #1
	strb	r2, [r3, #3]
	ldr	r2, [r4, #368]
	ldrb	r3, [r2, #3]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, r4, #61440
	ldreqb	r0, [r3, #1436]	@ zero_extendqisi2
	beq	.L2652
	ubfx	lr, r0, #16, #6
	ubfx	ip, r0, #15, #1
	ubfx	r1, r0, #12, #3
	strb	lr, [r3, #1437]
	strb	ip, [r3, #1438]
	ubfx	lr, r0, #8, #4
	ubfx	ip, r0, #5, #3
	strb	r1, [r3, #1439]
	strb	lr, [r3, #1440]
	ubfx	r1, r0, #4, #1
	ubfx	lr, r0, #3, #1
	strb	ip, [r3, #1441]
	strb	r1, [r3, #1442]
	ubfx	ip, r0, #2, #1
	and	r1, r0, #3
	strb	lr, [r3, #1443]
	ubfx	r0, r0, #22, #1
	strb	ip, [r3, #1444]
	strb	r1, [r3, #1445]
	strb	r0, [r3, #1436]
.L2652:
	cmp	r0, #1
	mov	r0, #0
	moveq	r3, #5
	streqb	r3, [r2, #2]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	InquireSliceExtProperty, .-InquireSliceExtProperty
	.align	2
	.global	InquireSliceProperty
	.type	InquireSliceProperty, %function
InquireSliceProperty:
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
	add	r3, r0, #61440
	mov	r5, r2
	mov	r4, r0
	mov	r8, r1
	ldr	r2, [r3, #3464]
	mov	r0, #22
	ldr	r1, .L2663
	add	r6, r4, #20480
	sub	r2, r2, #1
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r5]
	mov	r0, r4
	str	r3, [r8]
	ldr	r3, [r4, #368]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r6, #211]
	ldr	r3, [r3, #76]
	str	r3, [r6, #240]
	bl	SliceCheck
	subs	r7, r0, #0
	bne	.L2658
	mov	r0, r4
	bl	ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L2662
	ldrb	r0, [r6, #213]	@ zero_extendqisi2
	add	r9, r4, #12288
	mov	r2, #2208
	mov	r3, #4000
	sub	r0, r0, #1
	add	r4, r4, #24576
	clz	r0, r0
	mov	r0, r0, lsr #5
	str	r0, [r8]
	ldr	r1, [r6, #220]
	ldr	r0, [r9, #1304]
	ldr	ip, [r9, #1300]
	ldr	lr, [r9, #1280]
	mla	r2, r2, r1, r0
	ldr	r0, [r9, #1276]
	ldr	r2, [r2, #28]
	mla	r3, r3, r2, ip
	ldrb	ip, [r3, #18]	@ zero_extendqisi2
	ldr	r6, [r3, #3252]
	rsb	r1, ip, #2
	ldr	r2, [r3, #3248]
	mla	r1, r6, r1, r1
	add	r2, r2, #1
	cmp	r0, r2
	cmpeq	lr, r1
	movne	r2, #1
	strne	r2, [r5]
	ldr	r2, [r3, #3272]
	ldr	r3, [r4, #2144]
	add	r3, r3, #1
	cmp	r2, r3
	movhi	r3, #1
	strhi	r3, [r5]
.L2655:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2658:
	mvn	r7, #0
	b	.L2655
.L2662:
	ldr	r1, .L2663+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r7, #0
	b	.L2655
.L2664:
	.align	2
.L2663:
	.word	.LC346
	.word	.LC347
	UNWIND(.fnend)
	.size	InquireSliceProperty, .-InquireSliceProperty
	.align	2
	.global	HaveSliceToDec
	.type	HaveSliceToDec, %function
HaveSliceToDec:
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
	add	r0, r0, #61440
	ldr	r0, [r0, #3444]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	HaveSliceToDec, .-HaveSliceToDec
	.align	2
	.global	IsRefListWrong
	.type	IsRefListWrong, %function
IsRefListWrong:
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
	add	r6, r0, #20480
	mov	r7, r0
	ldr	r3, [r6, #252]
	cmp	r3, #0
	beq	.L2667
	add	r5, r0, #26880
	add	r8, r0, #61440
	add	r5, r5, #248
	mov	r4, #0
	b	.L2671
.L2668:
	ldr	r3, [r0, #680]
	cmp	r3, #0
	beq	.L2670
	ldr	r3, [r6, #252]
	cmp	r4, r3
	bcs	.L2693
.L2671:
	ldr	r3, [r5, #4]!
	add	r4, r4, #1
	ldr	r0, [r8, #3520]
	ldr	r3, [r3, #36]
	ldr	r1, [r3, #672]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L2668
.L2670:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2693:
	cmp	r3, #0
	beq	.L2667
	ldr	r3, [r6, #256]
	cmp	r3, #0
	addne	r7, r7, #27136
	movne	r4, #0
	addne	r7, r7, #124
	bne	.L2674
	b	.L2667
.L2694:
	ldr	r3, [r0, #680]
	cmp	r3, #0
	beq	.L2670
	ldr	r3, [r6, #256]
	cmp	r4, r3
	bcs	.L2667
.L2674:
	ldr	r3, [r7, #4]!
	add	r4, r4, #1
	ldr	r0, [r8, #3520]
	ldr	r3, [r3, #36]
	ldr	r1, [r3, #672]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L2694
	b	.L2670
.L2667:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	IsRefListWrong, .-IsRefListWrong
	.align	2
	.global	H264DEC_Destroy
	.type	H264DEC_Destroy, %function
H264DEC_Destroy:
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
	add	r5, r0, #61440
	mov	r8, r0
	bl	H264_ClearCurrPic
	mov	r0, r8
	bl	ClearAllNal
	ldr	r3, [r5, #3456]
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [r5, #3456]
	ldr	r3, [r5, #2088]
	cmp	r3, #0
	beq	.L2697
	add	r6, r8, #63488
	mov	r4, #0
	add	r6, r6, #40
	mov	r7, r4
.L2699:
	ldr	r1, [r6, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L2698
	ldr	r0, [r5, #3520]
	bl	FreeUsdByDec
	str	r7, [r6]
.L2698:
	ldr	r3, [r5, #2088]
	cmp	r3, r4
	bhi	.L2699
.L2697:
	add	r9, r8, #27904
	add	r8, r8, #61952
	add	r9, r9, #128
	mov	r6, #0
	mov	r7, #0
.L2703:
	sub	r4, r9, #32
.L2701:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L2715
.L2700:
	cmp	r4, r9
	bne	.L2701
	add	r9, r4, #848
	cmp	r9, r8
	bne	.L2703
	ldr	r1, .L2716
	mov	r0, #2
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L2715:
	mov	r1, r2
	ldr	r0, [r5, #3520]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L2700
.L2717:
	.align	2
.L2716:
	.word	.LC348
	UNWIND(.fnend)
	.size	H264DEC_Destroy, .-H264DEC_Destroy
	.align	2
	.global	H264DEC_RecycleImage
	.type	H264DEC_RecycleImage, %function
H264DEC_RecycleImage:
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
	add	r5, r0, #61440
	mov	r8, r1
	mov	r0, #2
	ldr	r1, .L2729
	bl	dprint_vfmw
	ldr	r0, [r5, #3520]
	mov	r1, r8
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L2723
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	beq	.L2723
	add	r4, r0, #600
	add	r9, r0, #632
	mov	r6, #0
	mov	r7, #0
.L2721:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L2728
.L2720:
	cmp	r4, r9
	bne	.L2721
	ldr	r0, [r5, #3520]
	mov	r1, r8
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2728:
	mov	r1, r2
	ldr	r0, [r5, #3520]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L2720
.L2723:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2730:
	.align	2
.L2729:
	.word	.LC349
	UNWIND(.fnend)
	.size	H264DEC_RecycleImage, .-H264DEC_RecycleImage
	.align	2
	.global	OutputFrmToVO
	.type	OutputFrmToVO, %function
OutputFrmToVO:
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
	cmp	r1, #0
	cmpne	r0, #0
	mov	r7, r2
	mov	r4, r0
	moveq	ip, #1
	movne	ip, #0
	mov	r5, r1
	beq	.L2770
	ldr	r3, [r0]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	ble	.L2734
	add	r3, r0, #61440
	ldr	r2, [r3, #3448]
	cmp	r2, #2
	beq	.L2734
	ldr	r2, [r3, #1428]
	cmp	r2, #0
	strneb	ip, [r2, #1]
	movne	r0, #1
	strne	ip, [r3, #1428]
	beq	.L2736
.L2733:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2734:
	mov	r1, r5
	mov	r0, r4
	bl	CheckFrameStore
	cmn	r0, #3
	beq	.L2736
	add	r6, r4, #61440
	ldr	r1, [r6, #1428]
	cmp	r1, #0
	beq	.L2737
	mov	r0, r4
	bl	GetImagePara
	ldr	r1, [r6, #1428]
	mov	r0, r4
	bl	CheckFrameStore
	subs	r3, r0, #0
	beq	.L2771
	cmn	r3, #3
	beq	.L2744
	ldr	r1, .L2779
	mov	r2, #2080
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r6, #1428]
	mov	r0, r4
	ldr	r1, [r3, #188]
	bl	H264DEC_RecycleImage
.L2744:
	ldr	r3, [r6, #1428]
	mov	r0, #0
	strb	r0, [r3, #1]
	ldr	r3, [r6, #1428]
	str	r0, [r6, #1428]
	cmp	r5, r3
	beq	.L2733
.L2737:
	mov	r1, r5
	mov	r0, r4
	bl	GetImagePara
	mov	r1, r5
	mov	r0, r4
	bl	CheckFrameStore
	subs	r3, r0, #0
	beq	.L2772
	cmn	r3, #3
	beq	.L2736
	movw	r2, #2138
	ldr	r1, .L2779
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #188]
	mov	r0, r4
	bl	H264DEC_RecycleImage
	mov	r0, #2
	b	.L2733
.L2770:
	mov	r3, r1
	mov	r2, r0
	ldr	r1, .L2779+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #2
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2736:
	mov	r0, #1
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2772:
	mov	r2, #1
	ldr	r1, [r5, #672]
	ldr	r0, [r6, #3520]
	bl	FSP_SetDisplay
	ldr	r1, [r5, #672]
	ldr	r0, [r6, #3520]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L2773
	cmp	r7, #1
	add	r3, r4, #8
	streq	r7, [r8, #212]
	mov	r2, r4
	ldr	r0, [r6, #3520]
	mov	r1, #0
	str	r8, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L2774
	ldr	r3, [r4]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r8, #24]
	bcs	.L2775
.L2751:
	ldr	r2, [r6, #3548]
	mov	r0, #0
	ldr	r3, [r6, #3540]
	add	r2, r2, #1
	str	r2, [r6, #3548]
	add	r3, r3, #2
	str	r3, [r6, #3540]
	b	.L2733
.L2771:
	ldr	r3, [r6, #1428]
	mov	r2, #1
	ldr	r0, [r6, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_SetDisplay
	ldr	r3, [r6, #1428]
	ldr	r0, [r6, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L2776
	ldr	r3, [r6, #1428]
	mov	r2, r4
	mov	r1, #0
	cmp	r5, r3
	cmpeq	r7, #1
	moveq	r3, #1
	streq	r3, [r8, #212]
	add	r3, r4, #8
	ldr	r0, [r6, #3520]
	str	r8, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L2777
	ldr	r3, [r4]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r8, #24]
	bcs	.L2778
.L2743:
	ldr	r2, [r6, #3548]
	ldr	r3, [r6, #3540]
	add	r2, r2, #1
	str	r2, [r6, #3548]
	add	r3, r3, #2
	str	r3, [r6, #3540]
	b	.L2744
.L2775:
	mov	r1, r8
	mov	r0, r4
	bl	SetFrmRepeatCount.part.1
	b	.L2751
.L2778:
	mov	r1, r8
	mov	r0, r4
	bl	SetFrmRepeatCount.part.1
	b	.L2743
.L2774:
	mov	r2, r0
	ldr	r1, .L2779+8
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, [r5, #672]
	ldr	r0, [r6, #3520]
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, r4
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	b	.L2733
.L2777:
	mov	r2, r0
	ldr	r1, .L2779+8
	mov	r0, #0
	mov	r5, r0
	bl	dprint_vfmw
	ldr	r3, [r6, #1428]
	mov	r2, r5
	strb	r5, [r3, #1]
	ldr	r3, [r6, #1428]
	ldr	r0, [r6, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_SetDisplay
	str	r5, [r6, #1428]
	mov	r0, r4
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	b	.L2733
.L2773:
	movw	r2, #2108
	ldr	r1, .L2779+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2733
.L2776:
	movw	r2, #2051
	ldr	r1, .L2779+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2733
.L2780:
	.align	2
.L2779:
	.word	.LC353
	.word	.LC350
	.word	.LC352
	.word	.LC354
	.word	.LC351
	UNWIND(.fnend)
	.size	OutputFrmToVO, .-OutputFrmToVO
	.align	2
	.global	OutputFrmFromDPB
	.type	OutputFrmFromDPB, %function
OutputFrmFromDPB:
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
	add	r4, r0, r1, lsl #2
	mov	r6, r1
	add	r4, r4, #24576
	mov	r3, #0
	mov	r2, r3
	mov	r5, r0
	ldr	r1, [r4, #1952]
	strb	r3, [r1, #4]
	ldr	r1, [r4, #1952]
	bl	OutputFrmToVO
	ldr	r3, [r4, #1952]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r7, r0
	bne	.L2782
	mov	r1, r6
	mov	r0, r5
	bl	RemoveFrameStoreOutDPB
.L2782:
	mov	r0, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	OutputFrmFromDPB, .-OutputFrmFromDPB
	.align	2
	.global	FlushDPB
	.type	FlushDPB, %function
FlushDPB:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	add	r6, r0, #24576
	mov	r4, r0
	ldr	r3, [r6, #2148]
	cmp	r3, #0
	beq	.L2785
	add	r7, r0, #26368
	mov	r5, #0
	add	r7, r7, #156
	b	.L2787
.L2786:
	ldr	r3, [r6, #2148]
	cmp	r3, r5
	bls	.L2785
.L2787:
	ldr	r1, [r7, #4]!
	add	r5, r5, #1
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2786
	mov	r0, r4
	bl	UnMarkFrameStoreRef
	ldr	r3, [r6, #2148]
	cmp	r3, r5
	bhi	.L2787
.L2785:
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L2789
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L2785
	b	.L2789
.L2791:
	bl	GetMinPOC
	ldr	r1, [fp, #-36]
	mov	r0, r4
	bl	OutputFrmFromDPB
	cmn	r0, #1
	beq	.L2790
.L2789:
	ldr	r3, [r6, #2148]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	bne	.L2791
	mov	r0, r3
.L2790:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	FlushDPB, .-FlushDPB
	.align	2
	.global	AdaptiveMemMark
	.type	AdaptiveMemMark, %function
AdaptiveMemMark:
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
	add	r3, r0, #61440
	add	r7, r0, #61184
	add	r2, r0, #26368
	ldr	r4, [r3, #564]
	add	r7, r7, #136
	mov	r5, r0
	str	r3, [fp, #-56]
	add	r6, r4, #2000
	add	r4, r4, #4
	add	r6, r6, #4
	add	r3, r2, #220
	str	r3, [fp, #-52]
	add	r3, r0, #16384
	str	r3, [fp, #-48]
.L2812:
	ldr	r3, [r4]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L2800
.L2802:
	.word	.L2801
	.word	.L2803
	.word	.L2804
	.word	.L2805
	.word	.L2806
	.word	.L2807
	.word	.L2808
.L2808:
	ldr	r2, [r4, #12]
	mov	r1, r7
	mov	r0, r5
	bl	MarkCurrPicLT
.L2800:
	add	r4, r4, #20
	cmp	r4, r6
	bne	.L2812
.L2801:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #3444]
	cmp	r3, #1
	movne	r0, #0
	beq	.L2821
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2807:
	add	r8, r5, #24576
	ldr	r3, [r8, #2152]
	cmp	r3, #0
	ldrne	r9, [fp, #-52]
	movne	r10, #0
	beq	.L2811
.L2810:
	ldr	r1, [r9, #4]!
	mov	r0, r5
	bl	UnMarkFrameStoreRef
	ldr	r1, [r8, #2152]
	add	r10, r10, #1
	cmp	r10, r1
	bcc	.L2810
.L2811:
	mov	r0, r5
	bl	UpdateReflist
	mov	r1, #0
	mov	r0, r5
	bl	UpdateMaxLTFrmIdx
	mov	r0, r5
	bl	UpdateLTReflist
	ldr	r2, [fp, #-48]
	mov	r3, #1
	str	r3, [r2, #3444]
	b	.L2800
.L2806:
	mov	r0, r5
	ldr	r1, [r4, #16]
	bl	UpdateMaxLTFrmIdx
	mov	r0, r5
	bl	UpdateLTReflist
	b	.L2800
.L2805:
	ldr	r3, [r4, #12]
	mov	r1, r7
	ldr	r2, [r4, #4]
	mov	r0, r5
	bl	MarkSTToLTRef
	mov	r0, r5
	bl	UpdateReflist
	mov	r0, r5
	bl	UpdateLTReflist
	b	.L2800
.L2804:
	mov	r0, r5
	ldr	r2, [r4, #8]
	mov	r1, r7
	bl	UnMarkLTRef
	mov	r0, r5
	bl	UpdateLTReflist
	b	.L2800
.L2803:
	mov	r0, r5
	ldr	r2, [r4, #4]
	mov	r1, r7
	bl	UnMarkSTRef
	mov	r0, r5
	bl	UpdateReflist
	b	.L2800
.L2821:
	ldr	r1, [fp, #-56]
	add	r3, r5, #57344
	mov	r2, #0
	str	r2, [r1, #568]
	ldrb	r3, [r3, #3979]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2815
	bcc	.L2816
	cmp	r3, #2
	bne	.L2814
	ldr	r3, [fp, #-56]
	str	r2, [r3, #592]
	str	r2, [r3, #580]
	ldr	r3, [fp, #-48]
	str	r2, [r3, #3456]
	str	r2, [r3, #3464]
.L2814:
	mov	r0, r5
	bl	FlushDPB
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2816:
	ldr	r0, [fp, #-56]
	ldr	r1, [r0, #580]
	ldr	r2, [r0, #588]
	ldr	r3, [r0, #592]
	rsb	r2, r1, r2
	str	r2, [r0, #588]
	rsb	r3, r1, r3
	str	r3, [r0, #592]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r0, #584]
	str	r3, [r0, #580]
	ldr	r0, [fp, #-48]
	ldr	r1, [r0, #3464]
	ldr	r2, [r0, #3452]
	ldr	r3, [r0, #3456]
	rsb	r2, r1, r2
	str	r2, [r0, #3452]
	rsb	r3, r1, r3
	str	r3, [r0, #3456]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r0, #3460]
	str	r3, [r0, #3464]
	b	.L2814
.L2815:
	ldr	r3, [fp, #-56]
	str	r2, [r3, #588]
	str	r2, [r3, #580]
	ldr	r3, [fp, #-48]
	str	r2, [r3, #3452]
	str	r2, [r3, #3464]
	b	.L2814
	UNWIND(.fnend)
	.size	AdaptiveMemMark, .-AdaptiveMemMark
	.align	2
	.global	IDRMemMarking
	.type	IDRMemMarking, %function
IDRMemMarking:
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
	add	r5, r0, #61440
	str	r0, [fp, #-48]
	ldr	r3, [r5, #564]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2823
	add	r9, r0, #24576
	ldr	r3, [r9, #2148]
	cmp	r3, #0
	beq	.L2830
	ldr	r3, [fp, #-48]
	mov	r10, #0
	mov	r4, r10
	add	r6, r3, #26368
	add	r7, r3, #26624
	add	r7, r7, #28
	mov	r8, r6
	add	r6, r6, #160
	add	r8, r8, #220
.L2829:
	ldr	r1, [r6]
	mov	r2, #0
	add	r10, r10, #1
	ldr	r0, [r1, #840]
	cmp	r0, #1
	streq	r0, [r5, #2076]
	strb	r4, [r1, #722]
	strb	r4, [r1, #721]
	ldr	r1, [r6]
	strb	r4, [r1, #762]
	strb	r4, [r1, #761]
	ldr	r1, [r6]
	strb	r4, [r1, #802]
	strb	r4, [r1, #801]
	ldr	r1, [r6]
	strb	r4, [r1, #2]
	ldr	r1, [r6]
	ldr	r0, [r5, #3520]
	ldr	r1, [r1, #672]
	bl	FSP_SetRef
	ldr	r2, [r6]
	mov	r3, #1
	strb	r4, [r2, #1]
	ldr	r2, [r6]
	strb	r4, [r2, #4]
	ldr	r2, [r6]
	str	r3, [r2, #692]
	ldr	r1, [r6]
	ldr	r3, [fp, #-48]
	ldr	r2, [r1, #712]
	add	r2, r2, #6656
	add	r2, r2, #28
	add	r2, r3, r2, lsl #2
	str	r4, [r2, #4]
	ldr	r1, [r1, #672]
	ldr	r0, [r5, #3520]
	bl	FSP_GetDisplay
	mov	r2, #0
	cmp	r0, #3
	beq	.L2828
	ldr	r1, [r6]
	ldr	r0, [r5, #3520]
	ldr	r1, [r1, #672]
	bl	FSP_SetDisplay
.L2828:
	str	r4, [r6], #4
	str	r4, [r8, #4]!
	str	r4, [r7, #4]!
	ldr	r2, [r9, #2148]
	cmp	r2, r10
	bhi	.L2829
.L2830:
	mov	r3, #0
	str	r3, [r9, #2148]
	ldr	r1, [r5, #2064]
	cmp	r1, r3
	beq	.L2826
	ldr	r2, [fp, #-48]
	mov	r0, r3
	add	r2, r2, #63232
	add	r2, r2, #196
.L2833:
	add	r3, r3, #1
	str	r0, [r2, #4]!
	cmp	r3, r1
	bne	.L2833
.L2826:
	ldr	r4, [fp, #-48]
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	ldr	r3, [r5, #564]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2843
	ldr	r2, [fp, #-48]
	mov	r0, r3
	str	r3, [r9, #2160]
	add	r6, r2, #57344
	mov	r2, #1
	strb	r3, [r6, #3980]
	strb	r2, [r6, #3981]
.L2834:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2843:
	ldr	r3, [fp, #-48]
	mov	r2, #1
	str	r2, [r9, #2160]
	add	r6, r3, #57344
	mov	r3, #0
	mov	r0, r3
	str	r3, [r5, #572]
	strb	r2, [r6, #3980]
	strb	r3, [r6, #3981]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2823:
	bl	FlushDPB
	cmp	r0, #0
	ldreq	r3, [fp, #-48]
	addeq	r9, r3, #24576
	beq	.L2826
.L2835:
	mvn	r0, #0
	b	.L2834
	UNWIND(.fnend)
	.size	IDRMemMarking, .-IDRMemMarking
	.align	2
	.global	Marking
	.type	Marking, %function
Marking:
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
	add	r7, r0, #16384
	add	r5, r0, #57344
	mov	r3, #0
	mov	r4, r0
	str	r3, [r7, #3444]
	ldrb	r3, [r5, #3979]	@ zero_extendqisi2
	sub	r3, r3, #2
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r7, #3448]
	ldrb	r3, [r5, #3982]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L2845
	add	r6, r0, #61440
	ldr	r3, [r6, #596]
	cmp	r3, #0
	bne	.L2846
	ldr	r3, [r0]
	ldr	r2, [r3, #640]
	cmp	r2, #1
	beq	.L2870
.L2846:
	ldr	r3, [r6, #564]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r6, #576]
	beq	.L2871
	cmp	r3, #0
	bne	.L2872
.L2853:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2871:
	cmp	r3, #0
	beq	.L2853
.L2852:
	ldrb	r2, [r5, #3977]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2857
	add	r2, r4, #24576
	ldr	r1, [r7, #456]
	ldr	ip, [r2, #2156]
	ldr	r0, [r2, #2152]
	rsb	r2, ip, r1
	cmp	r0, r2
	beq	.L2873
.L2858:
	mov	r2, #0
	strb	r2, [r5, #3980]
.L2855:
	cmp	r3, #0
	beq	.L2853
.L2857:
	ldrb	r3, [r5, #3980]	@ zero_extendqisi2
	mov	r0, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r5, #3981]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2870:
	ldr	r2, [r3, #636]
	cmp	r2, #0
	bne	.L2846
	ldr	r2, [r3, #644]
	cmp	r2, #0
	bne	.L2846
	ldr	r3, [r3, #604]
	add	r3, r3, #1024
	cmp	r3, #2048
	bls	.L2846
.L2845:
	mov	r0, r4
	bl	IDRMemMarking
	cmp	r0, #0
	bne	.L2847
	add	r6, r4, #61440
.L2854:
	ldrb	r3, [r5, #3982]	@ zero_extendqisi2
	cmp	r3, #5
	ldreq	r3, [r6, #576]
	beq	.L2855
	ldr	r3, [r6, #576]
	cmp	r3, #0
	beq	.L2853
	ldr	r2, [r6, #564]
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2852
	b	.L2857
.L2872:
	mov	r0, r4
	bl	AdaptiveMemMark
	cmp	r0, #0
	beq	.L2854
.L2847:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2873:
	mov	r0, r4
	bl	SlidingWinMark.part.2
	ldr	r3, [r6, #576]
	b	.L2858
	UNWIND(.fnend)
	.size	Marking, .-Marking
	.align	2
	.global	DirectOutput
	.type	DirectOutput, %function
DirectOutput:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	add	r5, r0, #57344
	mov	r6, r0
	ldrb	r7, [r5, #3979]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L2876
	bcc	.L2877
	cmp	r7, #2
	beq	.L2878
	mov	r7, #0
.L2875:
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2878:
	add	r4, r0, #61440
	mov	r2, #3
	ldr	r3, [r4, #560]
	strb	r2, [r3, #720]
	ldrb	r2, [r5, #3977]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2897
	ldr	r1, [r4, #1428]
	cmp	r1, #0
	beq	.L2898
	bl	OutputFrmToVO
	subs	r7, r0, #0
	bne	.L2965
.L2899:
	ldr	r3, [r4, #560]
	str	r3, [r4, #1428]
	str	r3, [r3, #836]
.L2900:
	ldrb	r0, [r5, #3978]	@ zero_extendqisi2
	mov	r9, #2
	ldr	r3, [r4, #1428]
	mov	r8, #0
	add	r1, r5, #3984
	mov	r2, #664
	add	r1, r1, #8
	strb	r0, [r3]
	ldr	r3, [r4, #1428]
	strb	r9, [r3, #1]
	ldr	r3, [r4, #1428]
	strb	r8, [r3, #4]
	ldr	r3, [r4, #1428]
	str	r8, [r3, #692]
	ldr	r3, [r4, #1428]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #1428]
	ldr	r0, [r4, #596]
	str	r0, [r3, #700]
	ldr	r3, [r4, #1428]
	str	r8, [r3, #696]
	ldr	r0, [r4, #1428]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r4, #1428]
	ldr	r2, [r4, #604]
	str	r2, [r3, #816]
	ldr	r3, [r4, #1428]
	ldr	r2, [r3, #816]
	str	r2, [r3, #736]
	str	r2, [r3, #704]
	ldr	r3, [r4, #1428]
	strb	r9, [r3, #800]
	ldrb	r2, [r5, #3983]	@ zero_extendqisi2
	ldr	r3, [r4, #1428]
	cmp	r2, #1
	movne	r2, r8
	moveq	r2, r9
	strb	r2, [r3, #3]
	ldr	r5, [r4, #3452]
	cmp	r5, #1
	bne	.L2875
.L2960:
	ldr	r3, [r4, #1428]
	mov	r2, r8
	ldr	r0, [r4, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_SetRef
	mov	r2, r8
	mov	r0, r6
	ldr	r1, [r4, #1428]
	bl	OutputFrmToVO
	ldr	r3, [r4, #1428]
	cmp	r3, r8
	mov	r7, r0
	beq	.L2910
	ldr	r3, [r4, #560]
	mov	r2, r5
	ldr	r0, [r4, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_ClearLogicFs
	b	.L2910
.L2877:
	add	r4, r0, #61440
	mov	r2, #0
	ldr	r3, [r4, #560]
	strb	r2, [r3, #720]
	ldr	r1, [r4, #1428]
	cmp	r1, r2
	beq	.L2879
	bl	OutputFrmToVO
	cmp	r0, #0
	bne	.L2966
.L2880:
	ldr	r3, [r4, #1428]
	cmp	r3, #0
	beq	.L2879
	ldr	r3, [r4, #560]
	mov	r2, #1
	ldr	r0, [r4, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_ClearLogicFs
.L2879:
	ldr	r3, [r4, #560]
	mov	r0, #3
	mov	r8, #0
	add	r1, r5, #3984
	add	r1, r1, #8
	mov	r2, #664
	str	r3, [r4, #1428]
	str	r3, [r3, #756]
	ldr	r3, [r4, #1428]
	ldr	ip, [r4, #560]
	str	ip, [r3, #796]
	ldr	r3, [r4, #1428]
	ldr	ip, [r4, #560]
	str	ip, [r3, #836]
	ldrb	ip, [r5, #3978]	@ zero_extendqisi2
	ldr	r3, [r4, #1428]
	strb	ip, [r3]
	ldr	r3, [r4, #1428]
	strb	r0, [r3, #1]
	ldr	r3, [r4, #1428]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #1428]
	strb	r8, [r3, #4]
	ldr	r3, [r4, #1428]
	str	r8, [r3, #692]
	ldr	r0, [r4, #1428]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r4, #1428]
	ldr	r1, [r4, #604]
	mov	r2, r8
	str	r1, [r3, #736]
	str	r1, [r3, #704]
	ldr	r3, [r4, #1428]
	strb	r8, [r3, #720]
	ldr	r3, [r4, #1428]
	ldr	r1, [r4, #596]
	str	r1, [r3, #700]
	ldr	r3, [r4, #1428]
	ldrb	r1, [r5, #3985]	@ zero_extendqisi2
	str	r1, [r3, #696]
	ldrb	r1, [r5, #3983]	@ zero_extendqisi2
	ldr	r3, [r4, #1428]
	cmp	r1, #1
	moveq	r7, #3
	strb	r7, [r3, #3]
	ldr	r3, [r4, #1428]
	ldr	r0, [r4, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_SetRef
	mov	r2, r8
	mov	r0, r6
	ldr	r1, [r4, #1428]
	bl	OutputFrmToVO
	ldr	r3, [r4, #1428]
	cmp	r3, r8
	mov	r7, r0
	beq	.L2910
.L2958:
	ldr	r3, [r4, #560]
	mov	r2, #1
	ldr	r0, [r4, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_ClearLogicFs
.L2910:
	mov	r3, #0
	mov	r0, r7
	str	r3, [r4, #1428]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2876:
	add	r4, r0, #61440
	mov	r2, #3
	ldr	r3, [r4, #560]
	strb	r2, [r3, #720]
	ldrb	r2, [r5, #3977]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2884
	ldr	r1, [r4, #1428]
	cmp	r1, #0
	beq	.L2885
	bl	OutputFrmToVO
	subs	r7, r0, #0
	bne	.L2967
.L2886:
	ldr	r3, [r4, #560]
	str	r3, [r4, #1428]
	str	r3, [r3, #796]
.L2887:
	ldrb	r0, [r5, #3978]	@ zero_extendqisi2
	mov	r9, #1
	ldr	r3, [r4, #1428]
	mov	r8, #0
	add	r1, r5, #3984
	mov	r2, #664
	add	r1, r1, #8
	strb	r0, [r3]
	ldr	r3, [r4, #1428]
	strb	r9, [r3, #1]
	ldr	r3, [r4, #1428]
	strb	r8, [r3, #4]
	ldr	r3, [r4, #1428]
	str	r8, [r3, #692]
	ldr	r3, [r4, #1428]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #1428]
	ldr	r0, [r4, #596]
	str	r0, [r3, #700]
	ldr	r3, [r4, #1428]
	str	r8, [r3, #696]
	ldr	r0, [r4, #1428]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r4, #1428]
	ldr	r2, [r4, #604]
	str	r2, [r3, #776]
	ldr	r3, [r4, #1428]
	ldr	r2, [r3, #776]
	str	r2, [r3, #736]
	str	r2, [r3, #704]
	ldr	r3, [r4, #1428]
	strb	r9, [r3, #760]
	ldrb	r3, [r5, #3983]	@ zero_extendqisi2
	ldr	r2, [r4, #1428]
	rsb	r3, r9, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r2, #3]
	ldr	r5, [r4, #3452]
	cmp	r5, r9
	beq	.L2960
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2897:
	ldr	lr, [r4, #1428]
	add	r1, r5, #3984
	mov	r2, #664
	add	r1, r1, #8
	cmp	lr, #0
	ldreq	r3, [r4, #560]
	streq	r3, [r4, #1428]
	streq	r3, [r3, #836]
	ldreq	lr, [r4, #1428]
	add	r7, lr, #656
	add	r10, lr, #672
	ldr	ip, [lr, #648]
	add	r0, lr, #8
	ldrd	r8, [r7]
	ldr	r3, [lr, #652]
	ldr	r7, [lr, #28]
	strd	r8, [fp, #-52]
	ldrd	r8, [r10, #-8]
	str	ip, [fp, #-68]
	ldr	r10, [lr, #16]
	strd	r8, [fp, #-60]
	str	r3, [fp, #-64]
	ldr	r9, [lr, #20]
	ldr	r8, [lr, #24]
	bl	memcpy
	add	r2, r6, #61952
	ldr	r3, [fp, #-64]
	add	r2, r2, #32
	ldr	ip, [fp, #-68]
	ldr	r0, [r2, #-8]
	ldr	r2, [r2, #-4]
	and	r1, ip, r3
	and	r0, r0, r2
	adds	r2, r1, #1
	movne	r2, #1
	cmn	r0, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r4, #1428]
	strne	ip, [r2, #648]
	strne	r3, [r2, #652]
	movw	r3, #61984
	ldr	r1, [r4, #1428]
	ldrd	r2, [r3, r6]
	add	ip, r1, #656
	ldrd	r0, [fp, #-52]
	cmp	r3, r1
	cmpeq	r2, r0
	movhi	r2, r0
	movhi	r3, r1
	add	r0, r6, #61952
	strd	r2, [ip]
	ldr	r1, [r4, #1428]
	ldrd	r2, [r0, #40]
	add	ip, r1, #672
	ldrd	r0, [fp, #-60]
	cmp	r3, r1
	cmpeq	r2, r0
	movhi	r2, r0
	movhi	r3, r1
	strd	r2, [ip, #-8]
	mov	ip, #2
	ldr	r3, [r5, #4000]
	mov	r0, #3
	ldr	r2, [r4, #1428]
	cmp	r3, r10
	movcs	r3, r10
	str	r3, [r2, #16]
	ldr	r3, [r5, #4004]
	ldr	r2, [r4, #1428]
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r2, #20]
	ldr	r3, [r5, #4008]
	ldr	r2, [r4, #1428]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #24]
	ldr	r3, [r5, #4012]
	ldr	r2, [r4, #1428]
	cmp	r3, r7
	movcs	r3, r7
	str	r3, [r2, #28]
	ldr	r2, [r4, #1428]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r5, #3978]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r4, #1428]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #1]
	ldr	r2, [r4, #1428]
	ldr	r1, [r4, #596]
	ldr	r3, [r2, #700]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #700]
	ldr	r3, [r4, #1428]
	strb	ip, [r3, #800]
	ldr	r3, [r4, #1428]
	strb	r0, [r3, #720]
	ldr	r3, [r4, #1428]
	ldr	r2, [r4, #604]
	str	r2, [r3, #816]
	ldr	r2, [r4, #1428]
	ldr	r3, [r2, #816]
	ldr	r1, [r2, #776]
	add	r3, r3, r1
	mov	r3, r3, lsr #1
	str	r3, [r2, #736]
	ldr	r3, [r4, #1428]
	ldr	r2, [r3, #736]
	str	r2, [r3, #704]
	ldr	r3, [r4, #1428]
	ldr	r2, [r3, #836]
	str	r2, [r3, #756]
	ldrb	r3, [r5, #3983]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #1428]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	beq	.L2962
.L2909:
	strb	r2, [r3, #3]
	mov	r2, #0
	ldr	r3, [r4, #1428]
	ldr	r0, [r4, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_SetRef
	mov	r0, r6
	mov	r2, #0
	ldr	r1, [r4, #1428]
	bl	OutputFrmToVO
	ldr	r3, [r4, #1428]
	cmp	r3, #0
	mov	r7, r0
	bne	.L2958
	b	.L2910
.L2884:
	ldr	lr, [r4, #1428]
	add	r1, r5, #3984
	mov	r2, #664
	add	r1, r1, #8
	cmp	lr, #0
	ldreq	r3, [r4, #560]
	streq	r3, [r4, #1428]
	streq	r3, [r3, #796]
	ldreq	lr, [r4, #1428]
	add	r7, lr, #656
	add	r10, lr, #672
	ldr	ip, [lr, #648]
	add	r0, lr, #8
	ldrd	r8, [r7]
	ldr	r3, [lr, #652]
	ldr	r7, [lr, #28]
	strd	r8, [fp, #-52]
	ldrd	r8, [r10, #-8]
	str	ip, [fp, #-68]
	ldr	r10, [lr, #16]
	strd	r8, [fp, #-60]
	str	r3, [fp, #-64]
	ldr	r9, [lr, #20]
	ldr	r8, [lr, #24]
	bl	memcpy
	add	r2, r6, #61952
	ldr	r3, [fp, #-64]
	add	r2, r2, #32
	ldr	ip, [fp, #-68]
	ldr	r0, [r2, #-8]
	ldr	r2, [r2, #-4]
	and	r1, ip, r3
	and	r0, r0, r2
	adds	r2, r1, #1
	movne	r2, #1
	cmn	r0, #1
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r4, #1428]
	strne	ip, [r2, #648]
	strne	r3, [r2, #652]
	movw	r3, #61984
	ldr	r1, [r4, #1428]
	ldrd	r2, [r3, r6]
	add	ip, r1, #656
	ldrd	r0, [fp, #-52]
	cmp	r3, r1
	cmpeq	r2, r0
	movhi	r2, r0
	movhi	r3, r1
	add	r0, r6, #61952
	strd	r2, [ip]
	ldr	r1, [r4, #1428]
	ldrd	r2, [r0, #40]
	add	ip, r1, #672
	ldrd	r0, [fp, #-60]
	cmp	r3, r1
	cmpeq	r2, r0
	movhi	r2, r0
	movhi	r3, r1
	strd	r2, [ip, #-8]
	mov	ip, #1
	ldr	r3, [r5, #4000]
	mov	r0, #3
	ldr	r2, [r4, #1428]
	cmp	r3, r10
	movcs	r3, r10
	str	r3, [r2, #16]
	ldr	r3, [r5, #4004]
	ldr	r2, [r4, #1428]
	cmp	r3, r9
	movcs	r3, r9
	str	r3, [r2, #20]
	ldr	r3, [r5, #4008]
	ldr	r2, [r4, #1428]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #24]
	ldr	r3, [r5, #4012]
	ldr	r2, [r4, #1428]
	cmp	r3, r7
	movcs	r3, r7
	str	r3, [r2, #28]
	ldr	r2, [r4, #1428]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r5, #3978]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r2, [r4, #1428]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #1]
	ldr	r2, [r4, #1428]
	ldr	r1, [r4, #596]
	ldr	r3, [r2, #700]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #700]
	ldr	r3, [r4, #1428]
	strb	ip, [r3, #760]
	ldr	r3, [r4, #1428]
	strb	r0, [r3, #720]
	ldr	r3, [r4, #1428]
	ldr	r2, [r4, #604]
	str	r2, [r3, #776]
	ldr	r2, [r4, #1428]
	ldr	r3, [r2, #816]
	ldr	r1, [r2, #776]
	add	r3, r3, r1
	mov	r3, r3, lsr ip
	str	r3, [r2, #736]
	ldr	r3, [r4, #1428]
	ldr	r2, [r3, #736]
	str	r2, [r3, #704]
	ldr	r3, [r4, #1428]
	ldr	r2, [r3, #796]
	str	r2, [r3, #756]
	ldrb	r3, [r5, #3983]	@ zero_extendqisi2
	cmp	r3, ip
	ldr	r3, [r4, #1428]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	bne	.L2909
.L2962:
	orr	r2, r2, ip
	b	.L2909
.L2966:
	str	r0, [sp]
	movw	r3, #2742
	ldr	r2, .L2968
	mov	r0, #22
	ldr	r1, .L2968+4
	bl	dprint_vfmw
	b	.L2880
.L2898:
	ldr	r3, [r4, #560]
	mov	r7, r1
	str	r3, [r4, #1428]
	str	r3, [r3, #836]
	b	.L2900
.L2885:
	ldr	r3, [r4, #560]
	mov	r7, r1
	str	r3, [r4, #1428]
	str	r3, [r3, #796]
	b	.L2887
.L2965:
	str	r7, [sp]
	movw	r3, #2936
	ldr	r2, .L2968
	mov	r0, #22
	ldr	r1, .L2968+4
	bl	dprint_vfmw
	b	.L2899
.L2967:
	str	r7, [sp]
	movw	r3, #2794
	ldr	r2, .L2968
	mov	r0, #22
	ldr	r1, .L2968+4
	bl	dprint_vfmw
	b	.L2886
.L2969:
	.align	2
.L2968:
	.word	.LANCHOR1+228
	.word	.LC355
	UNWIND(.fnend)
	.size	DirectOutput, .-DirectOutput
	.align	2
	.global	H264DEC_GetRemainImg
	.type	H264DEC_GetRemainImg, %function
H264DEC_GetRemainImg:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	add	r5, r0, #24576
	mov	r4, r0
	ldr	r3, [r5, #2148]
	cmp	r3, #0
	beq	.L2972
	add	r7, r0, #26368
	mov	r6, #0
	add	r7, r7, #156
	b	.L2974
.L2973:
	ldr	r3, [r5, #2148]
	cmp	r3, r6
	bls	.L2972
.L2974:
	ldr	r1, [r7, #4]!
	add	r6, r6, #1
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2973
	mov	r0, r4
	bl	UnMarkFrameStoreRef
	ldr	r3, [r5, #2148]
	cmp	r3, r6
	bhi	.L2974
.L2972:
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	bne	.L2972
	mvn	r6, #0
.L2976:
	ldr	r3, [r5, #2148]
	sub	r2, fp, #36
	sub	r1, fp, #32
	mov	r0, r4
	cmp	r3, #0
	beq	.L2988
	bl	GetMinPOC
	ldr	r3, [fp, #-36]
	mov	r1, #0
	mov	r0, r4
	add	r3, r4, r3, lsl #2
	add	r3, r3, #24576
	ldr	r2, [r3, #1952]
	strb	r1, [r2, #4]
	ldr	r1, [r3, #1952]
	ldr	r2, [r5, #2148]
	bl	OutputFrmToVO
	ldr	r1, [fp, #-36]
	add	r3, r1, #6592
	add	r3, r3, #40
	ldr	r3, [r4, r3, asl #2]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r6, r0
	bne	.L2976
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB
	b	.L2976
.L2988:
	cmp	r6, #0
	beq	.L2979
	add	r0, r4, #8
	bl	GetVoLastImageID
	mov	r6, r0
.L2979:
	mov	r0, r6
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	H264DEC_GetRemainImg, .-H264DEC_GetRemainImg
	.align	2
	.global	InitDPB
	.type	InitDPB, %function
InitDPB:
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
	subs	r7, r0, #0
	beq	.L3004
	bl	ClearAllSlice
	add	r6, r7, #26368
	add	r5, r7, #26624
	mov	r8, #0
	mov	r4, r6
	add	r5, r5, #32
	add	r6, r6, #160
	add	r4, r4, #224
	add	r10, r7, #61440
	mov	r9, r8
.L2994:
	ldr	r3, [r6]
	mov	r2, #1
	add	r8, r8, r2
	cmp	r3, #0
	beq	.L2991
	ldr	r1, [r3, #672]
	ldr	r0, [r10, #3520]
	bl	FSP_ClearLogicFs
.L2991:
	ldr	r3, [r4]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2992
	ldr	r1, [r3, #672]
	ldr	r0, [r10, #3520]
	bl	FSP_ClearLogicFs
.L2992:
	ldr	r3, [r5]
	mov	r2, #1
	cmp	r3, #0
	beq	.L2993
	ldr	r1, [r3, #672]
	ldr	r0, [r10, #3520]
	bl	FSP_ClearLogicFs
.L2993:
	cmp	r8, #16
	str	r9, [r5], #4
	mov	r2, #0
	str	r9, [r4], #4
	str	r9, [r6], #4
	bne	.L2994
	add	r3, r7, #16384
	add	r4, r7, #24576
	ldr	r3, [r3, #484]
	str	r2, [r4, #2148]
	sub	r3, r3, #1
	str	r2, [r4, #2152]
	str	r3, [r4, #2144]
	str	r2, [r4, #2156]
	str	r2, [r4, #2160]
	ldr	r1, [r10, #1428]
	cmp	r1, r2
	beq	.L2996
	ldr	r3, [r10, #3448]
	cmp	r3, #2
	beq	.L3027
.L2997:
	ldr	r1, [r1, #672]
	mov	r2, #1
	ldr	r0, [r10, #3520]
	bl	FSP_ClearLogicFs
	ldr	r3, [r10, #560]
	cmp	r3, #0
	beq	.L3000
	ldr	r2, [r10, #1428]
	ldr	r1, [r3, #672]
	ldr	r3, [r2, #672]
	cmp	r3, r1
	beq	.L3000
	mov	r2, #1
	ldr	r0, [r10, #3520]
	bl	FSP_ClearLogicFs
.L3000:
	mov	r3, #0
	str	r3, [r10, #1428]
.L2996:
	ldr	r3, .L3029
	add	r0, r7, #26624
	mov	r2, #392
	mov	r1, #0
	add	r0, r0, #116
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r1, [r4, #2144]
	add	r3, r7, #63232
	add	r2, r7, #63488
	mov	r0, #0
	add	r3, r3, #196
	add	r2, r2, #8
	str	r1, [r4, #2420]
	mov	r1, r0
	str	r0, [r4, #2424]
.L3001:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L3001
	add	r2, r7, #26880
	add	r3, r7, #27136
	add	r2, r2, #248
	add	r3, r3, #124
	mov	r0, #0
.L3002:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L3002
	add	ip, r7, #20480
	add	r7, r7, #27392
	mov	r2, r1
	str	r1, [ip, #252]
.L3003:
	str	r2, [r3, #4]!
	cmp	r3, r7
	mov	r0, #0
	bne	.L3003
	str	r0, [ip, #256]
.L2990:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3027:
	mov	r0, r7
	bl	OutputFrmToVO
	cmp	r0, #0
	bne	.L3028
.L2998:
	ldr	r1, [r10, #1428]
	cmp	r1, #0
	beq	.L2996
	b	.L2997
.L3028:
	str	r0, [sp]
	movw	r3, #5730
	ldr	r2, .L3029+4
	mov	r0, #22
	ldr	r1, .L3029+8
	bl	dprint_vfmw
	b	.L2998
.L3004:
	mvn	r0, #0
	b	.L2990
.L3030:
	.align	2
.L3029:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+244
	.word	.LC355
	UNWIND(.fnend)
	.size	InitDPB, .-InitDPB
	.align	2
	.global	ClearDPB
	.type	ClearDPB, %function
ClearDPB:
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
	mov	r4, r0
	bl	FlushDPB
	subs	r3, r0, #0
	beq	.L3032
	mov	r2, #496
	ldr	r1, .L3036
	mov	r0, #0
	bl	dprint_vfmw
.L3032:
	mov	r0, r4
	add	r4, r4, #61440
	bl	InitDPB
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #2076]
	str	r3, [r4, #3524]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3037:
	.align	2
.L3036:
	.word	.LC356
	UNWIND(.fnend)
	.size	ClearDPB, .-ClearDPB
	.align	2
	.global	DecVDM
	.type	DecVDM, %function
DecVDM:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	add	r1, r0, #57344
	mov	r6, r0
	add	r4, r0, #61440
	ldrb	r3, [r1, #3979]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3039
	ldrb	r3, [r1, #3977]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3039
.L3040:
	ldr	r5, [r4, #3508]
	ldr	r3, [r4, #3448]
	ubfx	r5, r5, #16, #3
	cmp	r3, r5
	beq	.L3041
	subs	r2, r5, #2
	sub	r3, r3, #2
	movne	r2, #1
	cmp	r3, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L3041
	cmp	r5, #4
	cmpne	r5, #1
	bls	.L3132
.L3041:
	cmp	r5, #2
	str	r5, [r4, #3448]
	beq	.L3044
	cmp	r5, #3
	beq	.L3045
	cmp	r5, #1
	beq	.L3133
	ldr	r3, [r4, #3444]
	cmp	r3, #0
	beq	.L3048
	cmp	r5, #4
	ldr	r3, [r4, #596]
	beq	.L3134
.L3055:
	cmp	r3, #2
	beq	.L3072
.L3059:
	cmp	r3, #1
	streq	r3, [r4, #2080]
.L3061:
	ldr	r2, [r4, #3484]
	mov	r0, #2
	ldrb	r3, [r1, #3979]	@ zero_extendqisi2
	sub	r2, r2, #1
	ldr	r1, .L3139
	bl	dprint_vfmw
	ldr	r2, [r4, #3484]
	ldr	r0, [r4, #620]
	mov	r3, #1
	ldr	r1, [r4, #624]
	cmp	r2, #0
	ldr	r2, [r4, #3444]
	str	r0, [r4, #2964]
	str	r1, [r4, #2960]
	str	r2, [r4, #3164]
	strb	r3, [r4, #2114]
	beq	.L3063
	ldr	r1, [r4, #596]
	cmp	r1, #0
	beq	.L3135
	add	r3, r6, #24576
	ldr	r3, [r3, #2148]
	cmp	r3, #0
	bne	.L3065
	ldr	r2, [r6]
	ldr	r1, [r2, #12]
	cmp	r1, #2
	bne	.L3136
.L3068:
	add	r3, r6, #63488
	add	r3, r3, #64
	str	r3, [r6, #360]
	ldr	r1, [r2, #864]
	cmp	r1, #1
	beq	.L3137
	cmp	r1, #2
	bne	.L3071
	ldr	r1, [r2, #868]
	cmp	r3, #0
	cmpne	r1, #0
	ble	.L3071
	ldr	r3, [r4, #596]
	cmp	r3, #2
	bne	.L3071
	mov	r2, #0
	str	r2, [r6, #360]
	ldr	r3, [r4, #560]
	ldr	r0, [r4, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_SetDisplay
	ldr	r2, [r6]
	mov	r0, r6
	ldr	r3, [r2, #868]
	sub	r3, r3, #1
	str	r3, [r2, #868]
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3124
.L3039:
	ldr	r3, [r4, #3544]
	ldr	r2, [r4, #3548]
	add	r3, r3, #1
	cmp	r3, r2
	movlt	r3, r2
	str	r3, [r4, #3544]
	ldr	r0, [r6]
	rsb	r3, r2, r3
	str	r3, [r0, #576]
	b	.L3040
.L3132:
	mov	r2, r5
	ldr	r1, .L3139+4
	mov	r0, #2
	bl	dprint_vfmw
	str	r5, [r4, #3448]
.L3045:
	mov	r0, r6
	bl	H264_ClearCurrPic
	mov	r0, r6
	bl	ClearDPB
	mvn	r0, #0
.L3124:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3063:
	ldr	r2, [r6]
.L3071:
	ldr	r3, [r2, #592]
	mov	r0, #0
	ldr	ip, [r4, #636]
	ldr	r1, [r4, #560]
	str	r3, [r4, #3428]
	ldr	r2, [r2, #632]
	ldr	r3, [r4, #632]
	str	ip, [r4, #632]
	str	r2, [r4, #3432]
	rsb	r3, ip, r3
	ldr	r2, [r1, #368]
	add	r2, r2, r3
	str	r2, [r1, #368]
	ldr	r2, [r4, #256]
	add	r3, r3, r2
	str	r3, [r4, #256]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3044:
	ldr	r5, [r4, #596]
	cmp	r5, #0
	bne	.L3051
	ldr	r3, [r4, #3444]
	cmp	r3, #0
	beq	.L3048
	ldr	r3, [r4, #3440]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L3061
	mov	r3, #1
	mov	r0, r6
	strb	r3, [r1, #3983]
	bl	H264_ClearCurrPic
	mov	r0, r5
	ldr	r1, .L3139+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3124
.L3133:
	ldr	r3, [r4, #596]
	cmp	r3, #2
	beq	.L3138
	ldr	r2, [r4, #3444]
	cmp	r2, #0
	bne	.L3059
.L3048:
	mov	r0, r6
	bl	H264_ClearCurrPic
	ldr	r3, .L3139+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3128
	mov	r3, #0
	ldr	r0, [r4, #3520]
	mov	r2, r3
	mov	r1, #127
	blx	ip
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3135:
	ldr	r3, .L3139+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3065
	ldr	r2, [r4, #3168]
	cmp	r2, #0
	beq	.L3066
.L3067:
	ldr	r3, [r2, #8]
	ldr	r0, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L3067
.L3066:
	sub	r2, fp, #28
	mov	r3, #4
	ldr	r0, [r4, #3520]
	str	r1, [r2, #-4]!
	mov	r1, #20
	blx	ip
	ldr	r2, [r6]
	b	.L3068
.L3138:
	ldr	r3, [r4, #576]
	cmp	r3, #0
	beq	.L3051
	ldr	r3, [r4, #3444]
	cmp	r3, #0
	beq	.L3048
.L3072:
	ldr	r3, [r4, #2080]
	cmp	r3, #2
	bne	.L3061
	ldr	r3, [r6]
	ldr	r5, [r3, #12]
	cmp	r5, #0
	bne	.L3061
	ldr	r3, .L3139+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3061
	ldr	r3, [r4, #576]
	mov	r0, #1
	ldr	r2, [r4, #580]
	ldr	r1, .L3139+20
	bl	dprint_vfmw
	mov	r0, r6
	bl	H264_ClearCurrPic
	ldr	r3, .L3139+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3062
	mov	r3, r5
	mov	r2, r5
	mov	r1, #127
	ldr	r0, [r4, #3520]
	blx	ip
.L3062:
	ldr	r3, [r4, #560]
	mov	r2, #0
	ldr	r0, [r4, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L3124
.L3137:
	cmp	r3, #0
	beq	.L3071
	ldr	r3, [r4, #596]
	cmp	r3, #2
	bne	.L3071
	mov	r2, #0
	str	r2, [r6, #360]
	ldr	r3, [r4, #560]
	ldr	r0, [r4, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_SetDisplay
.L3127:
	mov	r0, r6
	bl	H264_ClearCurrPic
.L3128:
	mvn	r0, #0
	b	.L3124
.L3134:
	cmp	r3, #0
	bne	.L3055
	ldr	r3, [r4, #2080]
	cmp	r3, #0
	moveq	r3, #2
	streq	r3, [r4, #2080]
	movne	r3, #1
	strne	r3, [r4, #2080]
	b	.L3061
.L3065:
	ldr	r2, [r6]
	b	.L3068
.L3136:
	ldr	r2, .L3139+12
	ldr	ip, [r2]
	cmp	ip, #0
	beq	.L3127
	ldr	r0, [r4, #3520]
	mov	r2, r3
	mov	r1, #127
	blx	ip
	b	.L3127
.L3051:
	mov	r3, #1
	mov	r0, r6
	strb	r3, [r1, #3983]
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3124
.L3140:
	.align	2
.L3139:
	.word	.LC360
	.word	.LC357
	.word	.LC358
	.word	g_event_report
	.word	g_allow_B_before_P
	.word	.LC359
	UNWIND(.fnend)
	.size	DecVDM, .-DecVDM
	.align	2
	.global	H264_FlushDecoder
	.type	H264_FlushDecoder, %function
H264_FlushDecoder:
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
	add	r2, r0, #20480
	mov	r1, #0
	mov	r4, #1
	str	r1, [r2, #260]
	strb	r4, [r2, #213]
	str	r4, [r0, #364]
	bl	DecVDM
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	mov	r0, r4
	ldr	r1, .L3143
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L3144:
	.align	2
.L3143:
	.word	.LC361
	UNWIND(.fnend)
	.size	H264_FlushDecoder, .-H264_FlushDecoder
	.align	2
	.global	H264_VES_Splitter
	.type	H264_VES_Splitter, %function
H264_VES_Splitter:
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
	add	r4, r0, #13504
	add	r4, r4, #24
	add	r8, r0, #61440
	mov	r7, r1
	mov	r6, r0
	mov	r1, #24
	mov	r0, r4
	mov	r10, r3
	mov	r5, #0
	mov	r9, r2
	str	r5, [fp, #-48]
	bl	BsSkip
	ldr	r3, [r8, #160]
	cmp	r7, r5
	str	r3, [fp, #-48]
	beq	.L3147
	cmp	r7, #1
	beq	.L3148
	mov	r2, r7
	ldr	r1, .L3261
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
.L3232:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3148:
	cmp	r9, #0
	mov	r1, #16
	mov	r0, r4
	bne	.L3161
	bl	BsGet
	mov	r1, #8
	mov	r5, r0
	mov	r0, r4
	bl	BsGet
	movw	r2, #31745
	cmp	r5, r2
	beq	.L3162
	mov	r1, #32
	mov	r0, r4
	bl	BsBack
	ldr	r3, [r6, #368]
	movw	r2, #32257
	cmp	r5, r2
	mov	r2, #16
	str	r2, [r3, #64]
	beq	.L3251
	mov	r1, #8
	mov	r0, r4
	bl	BsSkip
	mov	r1, #8
	mov	r0, r4
	bl	BsGet
	and	r0, r0, #31
	cmp	r0, #11
	beq	.L3252
.L3168:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3238
	ldr	r0, [r8, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r6, #368]
	b	.L3232
.L3147:
	cmp	r9, #0
	bne	.L3149
	mov	r1, #16
	mov	r0, r4
	bl	BsGet
	mov	r1, #8
	movw	r7, #31745
	mov	r5, r0
	mov	r0, r4
	bl	BsGet
	cmp	r5, r7
	beq	.L3150
	mov	r1, #24
	mov	r0, r4
	bl	BsBack
	bic	r5, r5, #512
	mov	r0, r4
	mov	r1, #24
	bl	BsBack
	cmp	r5, r7
	beq	.L3168
	b	.L3167
.L3161:
	bl	BsGet
	mov	r1, #8
	mov	r7, r0
	mov	r0, r4
	bl	BsGet
	movw	r3, #31745
	cmp	r7, r3
	beq	.L3169
	mov	r1, #24
	mov	r0, r4
	bl	BsBack
	mov	r0, r4
	mov	r1, #24
	bl	BsBack
	movw	r3, #32257
	cmp	r7, r3
	beq	.L3253
.L3167:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3150:
	and	r0, r0, #31
	cmp	r0, #25
	bne	.L3168
	ldr	r4, .L3261+4
	ldr	ip, [r4]
	cmp	ip, #0
	beq	.L3153
	mov	r3, r9
	mov	r2, r9
	mov	r1, #112
	ldr	r0, [r8, #3520]
	blx	ip
.L3153:
	mov	r0, r6
	bl	DecVDM
	subs	r5, r0, #0
	beq	.L3254
.L3244:
	ldr	ip, [r4]
	cmp	ip, #0
	beq	.L3238
	mov	r3, #0
	ldr	r0, [r8, #3520]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	mvn	r0, #0
	b	.L3232
.L3149:
	mov	r0, r4
	mov	r1, #24
	bl	BsBack
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3254:
	ldr	ip, [r6, #368]
	sub	r2, fp, #48
	ldr	r1, [r8, #152]
	ldr	r0, [r8, #3520]
	ldr	r3, [ip, #12]
	ldr	ip, [ip, #40]
	add	r3, r3, ip
	sub	r3, r3, #2
	bl	MetadataMapToSec
	cmp	r0, #0
	bne	.L3255
	ldr	r4, .L3261+8
	mov	r2, #4
	ldr	r1, .L3261+12
	ldr	r0, [fp, #-48]
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r0, [fp, #-48]
	ldr	ip, [r4, #52]
	ldr	r2, [r3, #12]
	add	r0, r0, #4
	sub	r2, r2, #6
	str	r2, [r8, #148]
	ldr	r1, [r3, #8]
	add	r1, r1, #6
	blx	ip
	ldr	r3, [r8, #148]
	add	r3, r3, #4
	str	r3, [r8, #148]
	ldr	r1, [r6, #368]
	ldr	r2, [r1, #40]
	cmp	r2, #0
	bne	.L3256
.L3157:
	ldr	r0, [r8, #3520]
	ldr	r5, .L3261+16
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L3158
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	ldr	r2, [r8, #3520]
	ldr	r3, [r4, #44]
	ldr	r1, [r8, #148]
	ldr	r2, [r5, r2, asl #2]
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r4, #12]
	mov	r0, #0
	blx	r3
	ldr	r0, [r8, #3520]
.L3158:
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	subs	r4, r0, #0
	movne	r3, #13376
	beq	.L3176
.L3237:
	ldr	r2, .L3261+20
	mov	r0, #0
	ldr	r1, .L3261+24
	bl	dprint_vfmw
.L3238:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3169:
	and	r0, r0, #31
	cmp	r0, #25
	bne	.L3167
	ldr	r4, .L3261+4
	ldr	ip, [r4]
	cmp	ip, #0
	beq	.L3171
	mov	r3, r5
	mov	r2, r5
	mov	r1, #112
	ldr	r0, [r8, #3520]
	blx	ip
.L3171:
	mov	r0, r6
	bl	DecVDM
	subs	r5, r0, #0
	bne	.L3244
	ldr	ip, [r6, #368]
	sub	r2, fp, #48
	ldr	r1, [r8, #152]
	ldr	r0, [r8, #3520]
	ldr	r3, [ip, #12]
	ldr	ip, [ip, #40]
	add	r3, r3, ip
	sub	r3, r3, #2
	bl	MetadataMapToSec
	cmp	r0, #0
	bne	.L3257
	ldr	r4, .L3261+8
	mov	r2, #4
	ldr	r1, .L3261+12
	ldr	r0, [fp, #-48]
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r0, [fp, #-48]
	ldr	ip, [r4, #52]
	ldr	r2, [r3, #12]
	add	r0, r0, #4
	sub	r2, r2, #6
	str	r2, [r8, #148]
	ldr	r1, [r3, #8]
	add	r1, r1, #6
	blx	ip
	ldr	r3, [r8, #148]
	add	r3, r3, #4
	str	r3, [r8, #148]
	ldr	r1, [r6, #368]
	ldr	r2, [r1, #40]
	cmp	r2, #0
	bne	.L3258
.L3174:
	ldr	r0, [r8, #3520]
	ldr	r5, .L3261+16
	ldr	r3, [r5, r0, asl #2]
	cmp	r3, #0
	beq	.L3175
	ldr	r3, [r4, #16]
	mov	r0, #0
	blx	r3
	ldr	r2, [r8, #3520]
	ldr	r3, [r4, #44]
	ldr	r1, [r8, #148]
	ldr	r2, [r5, r2, asl #2]
	ldr	r0, [fp, #-48]
	blx	r3
	ldr	r3, [r4, #12]
	mov	r0, #0
	blx	r3
	ldr	r0, [r8, #3520]
.L3175:
	ldr	r1, [fp, #-48]
	bl	MetadataUnMapToSec
	subs	r4, r0, #0
	bne	.L3259
.L3176:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3238
	ldr	r0, [r8, #3520]
	bl	ReleaseNAL
	str	r4, [r6, #368]
	mvn	r0, #0
	b	.L3232
.L3162:
	and	r3, r0, #31
	cmp	r3, #25
	cmpeq	r10, #1
	moveq	r10, #1
	movne	r10, #0
	bne	.L3260
	ldr	r4, .L3261+4
	ldr	ip, [r4]
	cmp	ip, #0
	beq	.L3165
	mov	r3, r9
	mov	r2, r9
	mov	r1, #112
	ldr	r0, [r8, #3520]
	blx	ip
.L3165:
	mov	r0, r6
	bl	DecVDM
	subs	r5, r0, #0
	bne	.L3244
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3238
	ldr	r0, [r8, #3520]
	bl	ReleaseNAL
	str	r5, [r6, #368]
	mvn	r0, #0
	b	.L3232
.L3260:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3238
	ldr	r0, [r8, #3520]
	bl	ReleaseNAL
	str	r10, [r6, #368]
	mvn	r0, #0
	b	.L3232
.L3251:
	ldr	r5, .L3261+28
	ldr	r3, [r8, #3520]
	ldr	r3, [r5, r3, asl #2]
	cmp	r3, #0
	beq	.L3167
	ldr	r4, .L3261+8
	mov	r0, r9
	ldr	r3, [r4, #16]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r2, [r8, #3520]
	ldr	ip, [r4, #44]
	ldr	r1, [r3, #12]
	ldr	r2, [r5, r2, asl #2]
	ldr	r0, [r3, #8]
	blx	ip
	ldr	r3, [r4, #12]
	mov	r0, r9
	blx	r3
	mov	r0, r9
	b	.L3232
.L3253:
	ldr	r1, .L3261+32
	movw	r3, #13544
	ldr	r2, .L3261+20
	mov	r0, r5
	bl	dprint_vfmw
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L3238
	ldr	r0, [r8, #3520]
	bl	ReleaseNAL
	str	r5, [r6, #368]
	b	.L3238
.L3256:
	ldr	r0, [fp, #-48]
	ldr	r1, [r1, #36]
	add	r0, r0, r3
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r2, [r8, #148]
	ldr	r3, [r3, #40]
	add	r3, r3, r2
	str	r3, [r8, #148]
	b	.L3157
.L3258:
	ldr	r0, [fp, #-48]
	ldr	r1, [r1, #36]
	add	r0, r0, r3
	ldr	r3, [r4, #52]
	blx	r3
	ldr	r3, [r6, #368]
	ldr	r2, [r8, #148]
	ldr	r3, [r3, #40]
	add	r3, r3, r2
	str	r3, [r8, #148]
	b	.L3174
.L3252:
	mov	r0, r6
	bl	H264_IsEosNal
	cmp	r0, #1
	bne	.L3168
	mov	r1, #32
	mov	r0, r4
	bl	BsBack
	mov	r1, #32
	mov	r0, r4
	bl	BsBack
	mov	r0, r4
	mov	r1, #32
	bl	BsBack
	mov	r0, #3
	b	.L3232
.L3255:
	mov	r0, r5
	movw	r3, #13342
	ldr	r2, .L3261+20
	ldr	r1, .L3261+36
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3232
.L3257:
	mov	r0, r5
	mov	r3, #13504
	ldr	r2, .L3261+20
	ldr	r1, .L3261+36
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3232
.L3259:
	movw	r3, #13532
	b	.L3237
.L3262:
	.align	2
.L3261:
	.word	.LC365
	.word	g_event_report
	.word	vfmw_Osal_Func_Ptr_S
	.word	RPU_START_CODE
	.word	vfmw_save_metadata_file
	.word	.LANCHOR1+252
	.word	.LC363
	.word	vfmw_save_el_file
	.word	.LC364
	.word	.LC362
	UNWIND(.fnend)
	.size	H264_VES_Splitter, .-H264_VES_Splitter
	.align	2
	.global	ReceivePacket
	.type	ReceivePacket, %function
ReceivePacket:
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
	ldr	ip, [r1, #12]
	add	r6, r0, #61440
	ldr	r3, [r1, #8]
	ldr	r2, [r1, #4]
	mov	r4, r0
	mov	r5, r1
	mov	r0, #7
	ldr	r1, .L3331
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r6, #3552]
	ldr	r3, [r4]
	ldr	r2, [r3, #832]
	cmp	r2, #1
	beq	.L3326
.L3264:
	ldr	r3, [r4, #368]
	cmp	r3, #0
	beq	.L3286
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3327
.L3267:
	ldr	r1, .L3331+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #368]
	cmp	r1, #0
	beq	.L3286
	ldr	r0, [r6, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #368]
.L3286:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3271
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L3271
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3271
	ldrb	r3, [r4, #377]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3289
	mov	r2, r4
	mov	r3, #1
	b	.L3274
.L3273:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L3287
.L3274:
	ldrb	r1, [r2, #473]	@ zero_extendqisi2
	add	r2, r2, #96
	cmp	r1, #0
	bne	.L3273
	mov	r2, r3
.L3272:
	mov	r1, r3, asl #7
	cmn	r2, #1
	sub	r3, r1, r3, asl #5
	mov	r1, #1
	add	r3, r4, r3
	strb	r1, [r3, #377]
	beq	.L3287
	mov	r3, r2, asl #7
	mov	r0, #0
	sub	r3, r3, r2, asl #5
	add	r2, r3, #376
	add	r3, r4, r3
	add	r2, r4, r2
	str	r2, [r4, #368]
	ldr	r2, [r5, #4]
	str	r2, [r3, #384]
	ldr	r2, [r5, #12]
	str	r2, [r3, #388]
	ldr	r2, [r5, #8]
	str	r2, [r3, #392]
	ldr	r3, [r4, #368]
	str	r0, [r3, #24]
	ldr	r3, [r4, #368]
	ldr	r2, [r5, #16]
	str	r2, [r3, #32]
	ldrd	r2, [r5, #24]
	ldr	ip, [r4, #368]
	strd	r2, [ip, #88]
	ldr	r3, [r4, #368]
	str	r1, [r3, #68]
	ldr	r3, [r4, #368]
	strb	r0, [r3]
	ldr	r3, [r4, #368]
	ldrb	r2, [r5]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r3, [r4]
	ldrb	r3, [r3, #900]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3323
	ldr	r2, [r5, #12]
	ldr	r3, [r6, #632]
	ldr	r1, [r6, #636]
	add	r2, r2, r3
	str	r2, [r6, #632]
	ldr	r3, [r5, #12]
	add	r3, r3, r1
	str	r3, [r6, #636]
	ldr	r3, [r4, #368]
	b	.L3278
.L3327:
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bhi	.L3267
	ldrb	r1, [r3, #4]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L3268
	b	.L3267
.L3326:
	ldr	r3, [r3, #872]
	cmp	r3, #0
	beq	.L3264
	ldr	r3, [r4, #368]
	cmp	r3, #0
	ldrneb	r2, [r5]	@ zero_extendqisi2
	beq	.L3286
.L3268:
	strb	r2, [r3, #4]
	ldr	r3, [r4]
	ldr	r2, [r3, #832]
	cmp	r2, #1
	beq	.L3328
.L3280:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3281
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L3281
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3281
	ldr	r3, [r4, #368]
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bls	.L3329
.L3282:
	mov	r2, #1
	strb	r2, [r3, #4]
	ldr	r1, [r5, #16]
	ldr	r0, [r6, #3520]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3331+8
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3323
	mov	r3, #0
	ldr	r0, [r6, #3520]
	mov	r2, r3
	mov	r1, #113
	blx	ip
.L3323:
	ldr	r3, [r4, #368]
.L3278:
	ldrb	r2, [r5, #1]	@ zero_extendqisi2
	strb	r2, [r3, #5]
	ldr	r3, [r4, #368]
	ldrb	r0, [r3, #4]	@ zero_extendqisi2
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3271:
	ldr	r1, .L3331+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #16]
	ldr	r0, [r6, #3520]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3331+8
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3325
.L3324:
	mov	r3, #0
	ldr	r0, [r6, #3520]
	mov	r2, r3
	mov	r1, #113
	blx	ip
.L3325:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3281:
	ldr	r3, [r4, #368]
	b	.L3282
.L3328:
	ldr	r3, [r3, #872]
	cmp	r3, #0
	bne	.L3323
	b	.L3280
.L3329:
	mov	ip, r1, asl #5
	mov	r0, #0
	sub	r1, ip, r1, asl #2
	add	r3, r3, r1
	str	r2, [r3, #8]
	ldr	r3, [r4, #368]
	ldr	ip, [r5, #12]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	ip, [r3, #12]
	ldr	r3, [r4, #368]
	ldr	ip, [r5, #8]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	ip, [r3, #16]
	ldr	r3, [r4, #368]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r0, [r3, #24]
	ldr	r3, [r4, #368]
	ldr	r0, [r5, #16]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r0, [r3, #32]
	ldr	r2, [r4, #368]
	ldr	r3, [r2, #68]
	add	r3, r3, #1
	str	r3, [r2, #68]
	ldr	r3, [r4]
	ldrb	r3, [r3, #900]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3283
	ldr	r2, [r5, #12]
	ldr	r3, [r6, #632]
	ldr	r1, [r6, #636]
	add	r2, r2, r3
	str	r2, [r6, #632]
	ldr	r3, [r5, #12]
	add	r3, r3, r1
	str	r3, [r6, #636]
.L3283:
	ldr	r3, [r4, #368]
	ldr	r2, [r3, #12]
	cmp	r2, #4096
	bcc	.L3330
.L3284:
	mov	r2, #1
	str	r2, [r6, #3552]
	b	.L3278
.L3330:
	mov	r0, r4
	bl	CombinePacket.part.11
	ldr	r3, [r4, #368]
	b	.L3284
.L3287:
	ldr	r1, .L3331+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearAllNal
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	ldr	r3, .L3331+8
	ldr	ip, [r3]
	cmp	ip, #0
	bne	.L3324
	b	.L3325
.L3289:
	mov	r2, r3
	b	.L3272
.L3332:
	.align	2
.L3331:
	.word	.LC366
	.word	.LC367
	.word	g_event_report
	.word	.LC369
	.word	.LC368
	UNWIND(.fnend)
	.size	ReceivePacket, .-ReceivePacket
	.align	2
	.global	ClearAll
	.type	ClearAll, %function
ClearAll:
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
	mov	r8, r0
	mov	r4, r1
	mov	r0, #22
	ldr	r1, .L3361
	bl	dprint_vfmw
	mov	r0, r8
	bl	H264_ClearCurrPic
	mov	r0, r8
	bl	ClearAllNal
	mov	r0, r8
	bl	InitDPB
	cmp	r4, #0
	add	r7, r8, #61440
	beq	.L3334
	add	r1, r8, #8
	ldr	r0, [r7, #3520]
	bl	FSP_ClearNotInVoQueue
.L3335:
	add	r4, r8, #27904
	mov	r6, #0
	add	r4, r4, #128
.L3338:
	sub	r5, r4, #32
	mov	r3, #0
	sub	r2, r4, #632
	mov	r1, #1
	mvn	r9, #0
	mov	lr, #17
	mov	ip, #16
	mov	r0, #2
	str	r6, [r4, #-444]
	strb	r3, [r4, #-632]
	strb	r3, [r4, #-631]
	strb	r3, [r4, #-630]
	str	r3, [r4, #52]
	str	r3, [r4, #44]
	str	r3, [r4, #56]
	strb	r3, [r4, #-628]
	strb	r3, [r4, #88]
	str	r9, [r4, #48]
	str	r1, [r4, #60]
	strb	r1, [r4, #128]
	str	lr, [r4, #76]
	str	ip, [r4, #80]
	str	r2, [r4, #204]
	str	r2, [r4, #164]
	str	r2, [r4, #124]
	strb	r0, [r4, #168]
.L3337:
	ldrd	r2, [r5, #8]!
	orrs	r1, r2, r3
	bne	.L3359
.L3336:
	cmp	r5, r4
	bne	.L3337
	add	r6, r6, #1
	add	r4, r5, #848
	cmp	r6, #40
	bne	.L3338
	add	r4, r8, #61696
	add	r5, r8, #61952
	add	r4, r4, #232
	add	r5, r5, #8
.L3340:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L3360
.L3339:
	cmp	r4, r5
	bne	.L3340
	ldr	r3, [r7, #2088]
	cmp	r3, #0
	beq	.L3344
	add	r5, r8, #63488
	mov	r4, #0
	add	r5, r5, #40
	mov	r6, r4
.L3343:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3342
	ldr	r0, [r7, #3520]
	bl	FreeUsdByDec
	str	r6, [r5]
.L3342:
	ldr	r3, [r7, #2088]
	cmp	r3, r4
	bhi	.L3343
.L3344:
	ldr	r3, .L3361+4
	add	r5, r8, #20480
	add	ip, r8, #24576
	mov	r4, #0
	str	r4, [r7, #2088]
	mov	r1, r4
	str	r4, [r7, #3496]
	add	r0, r5, #208
	str	r4, [r7, #2068]
	mov	r2, #1648
	str	r4, [r7, #3444]
	str	r4, [r7, #3504]
	str	r4, [r7, #3452]
	str	r4, [r7, #2076]
	str	r4, [r7, #3524]
	str	r4, [r7, #2080]
	str	r4, [r8, #368]
	add	r8, r8, #57344
	str	r4, [ip, #1812]
	ldr	r3, [r3, #48]
	strb	r4, [r5, #3904]
	strb	r4, [r5, #1900]
	strb	r4, [r5, #3905]
	strb	r4, [r5, #1901]
	blx	r3
	mov	r3, #2
	mov	r2, #1
	strb	r3, [r5, #208]
	strb	r2, [r5, #213]
	mov	r3, #256
	strb	r4, [r8, #3976]
	mov	r0, r4
	strb	r4, [r7, #1400]
	str	r4, [r7, #1404]
	str	r3, [r7, #1408]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3359:
	mov	r1, r2
	ldr	r0, [r7, #3520]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r5]
	b	.L3336
.L3360:
	mov	r1, r2
	ldr	r0, [r7, #3520]
	bl	FreeUsdByDec
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r4]
	b	.L3339
.L3334:
	add	r0, r8, #8
	bl	ResetVoQueue
	ldr	r0, [r7, #3520]
	bl	FSP_EmptyInstance
	b	.L3335
.L3362:
	.align	2
.L3361:
	.word	.LC370
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ClearAll, .-ClearAll
	.align	2
	.global	InsertFrmInDPB
	.type	InsertFrmInDPB, %function
InsertFrmInDPB:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 40
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
	cmp	r1, #15
	mov	r9, r1
	mov	r5, r0
	mov	r4, r2
	bhi	.L3462
	ldrb	r7, [r2, #3]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L3367
	bcc	.L3368
	cmp	r7, #2
	bne	.L3463
	ldr	r3, [r2, #680]
	mov	r2, #3
	strb	r2, [r3, #720]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3388
	add	r6, r0, r3
	add	r2, r6, #24576
	str	r2, [fp, #-48]
	ldr	r2, [r2, #1952]
	cmp	r2, #0
	beq	.L3388
	ldr	r0, [fp, #-48]
	strb	r7, [r2, #800]
	ldr	r2, [r4, #680]
	ldr	r3, [r0, #1952]
	str	r2, [r3, #836]
	ldr	r3, [r0, #1952]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #801]
	ldr	r3, [r0, #1952]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #802]
	ldr	r3, [r0, #1952]
	ldr	r2, [r4, #712]
	str	r2, [r3, #812]
	ldr	r3, [r0, #1952]
	ldr	r2, [r4, #716]
	str	r2, [r3, #820]
	ldr	r2, [r4, #680]
	ldr	r3, [r0, #1952]
	ldr	r2, [r2, #832]
	str	r2, [r3, #832]
	ldr	r3, [r0, #1952]
	ldr	r2, [r4, #724]
	str	r2, [r3, #816]
	ldr	r3, [r0, #1952]
	ldr	r1, [r3, #776]
	ldr	r2, [r3, #816]
	add	r2, r2, r1
	str	r2, [r3, #736]
	str	r2, [r3, #704]
	add	r1, r4, #16
	ldr	r2, [r0, #1952]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r3, [fp, #-48]
	ldr	r2, [r3, #1952]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #1]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #1952]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	orreq	r2, r2, #2
	strb	r2, [r3, #3]
	mov	r2, #664
	ldr	r3, [fp, #-48]
	ldr	lr, [r3, #1952]
	add	r8, lr, #656
	add	ip, lr, #672
	ldr	r3, [lr, #648]
	add	r0, lr, #8
	ldrd	r6, [r8]
	ldr	r10, [lr, #16]
	str	r3, [fp, #-80]
	strd	r6, [fp, #-60]
	ldrd	r6, [ip, #-8]
	ldr	ip, [lr, #20]
	ldr	r3, [lr, #652]
	ldr	r8, [lr, #24]
	str	ip, [fp, #-76]
	ldr	ip, [lr, #28]
	str	r3, [fp, #-72]
	strd	r6, [fp, #-68]
	str	ip, [fp, #-52]
	bl	memcpy
	ldr	r3, [fp, #-80]
	ldr	lr, [fp, #-72]
	ldr	r0, [r4, #656]
	ldr	r1, [r4, #660]
	and	ip, r3, lr
	adds	r2, ip, #1
	ldrd	r6, [fp, #-60]
	and	r1, r1, r0
	ldr	ip, [fp, #-76]
	movne	r2, #1
	cmn	r1, #1
	add	r1, r4, #672
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [fp, #-48]
	ldrne	r2, [r2, #1952]
	strne	r3, [r2, #648]
	ldr	r3, [fp, #-48]
	strne	lr, [r2, #652]
	ldr	r0, [r3, #1952]
	ldrd	r2, [r1, #-8]
	add	r0, r0, #656
	cmp	r3, r7
	cmpeq	r2, r6
	movhi	r2, r6
	movhi	r3, r7
	strd	r2, [r0]
	ldrd	r2, [r1]
	ldr	r1, [fp, #-48]
	ldrd	r6, [fp, #-68]
	ldr	r1, [r1, #1952]
	cmp	r3, r7
	cmpeq	r2, r6
	add	r1, r1, #672
	movhi	r2, r6
	movhi	r3, r7
	strd	r2, [r1, #-8]
	ldr	r1, [fp, #-48]
	ldr	r3, [r4, #24]
	ldr	r2, [r1, #1952]
	cmp	r3, r10
	movcs	r3, r10
	str	r3, [r2, #16]
	ldr	r3, [r4, #28]
	ldr	r2, [r1, #1952]
	cmp	r3, ip
	movcs	r3, ip
	str	r3, [r2, #20]
	ldr	r3, [r4, #32]
	ldr	r2, [r1, #1952]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #24]
	ldr	r3, [r4, #36]
	ldr	r2, [r1, #1952]
	ldr	r1, [fp, #-52]
	cmp	r3, r1
	movcs	r3, r1
	str	r3, [r2, #28]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3400
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3400
.L3401:
	ldr	r0, [fp, #-48]
	ldr	r2, [r0, #1952]
	ldr	r3, [r2, #820]
	ldr	r1, [r2, #780]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #700]
	ldr	r2, [r4, #700]
	mov	r4, r0
	ldr	r3, [r0, #1952]
	str	r2, [r3, #688]
	ldr	r0, [r0, #1952]
	bl	CombineFldsToFrm
	ldr	r2, [r4, #1952]
	ldr	r3, [r2, #712]
	ldr	r2, [r2, #812]
	add	r3, r3, #6720
	add	r3, r3, #12
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3387
.L3368:
	ldr	r2, [r2, #680]
	add	r8, r0, r1, lsl #2
	add	r8, r8, #24576
	mov	r3, #3
	str	r2, [r8, #1952]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r2]
	ldr	r2, [r8, #1952]
	strb	r3, [r2, #1]
	ldr	r1, [r4, #680]
	ldr	r2, [r8, #1952]
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	strb	r1, [r2, #4]
	ldr	r1, [r4, #680]
	ldr	r2, [r8, #1952]
	ldr	r1, [r1, #692]
	str	r1, [r2, #692]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldr	r2, [r8, #1952]
	cmp	r1, #0
	beq	.L3464
.L3370:
	strb	r3, [r2, #2]
	add	r1, r4, #16
	ldr	r3, [r8, #1952]
	mov	r2, #664
	ldr	r0, [r4, #748]
	mov	r6, #0
	mov	r10, #1
	str	r0, [r3, #708]
	ldr	r0, [r8, #1952]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r8, #1952]
	ldr	r1, [r4, #724]
	mov	ip, #2
	mov	r2, r6
	mov	r0, r5
	str	r1, [r3, #736]
	str	r1, [r3, #704]
	ldr	r3, [r8, #1952]
	ldr	r1, [r4, #680]
	str	r1, [r3, #836]
	str	r1, [r3, #796]
	str	r1, [r3, #756]
	ldr	r3, [r8, #1952]
	ldr	r1, [r4, #692]
	str	r1, [r3, #684]
	ldr	r3, [r8, #1952]
	ldr	r1, [r4, #688]
	str	r1, [r3, #676]
	ldr	r3, [r8, #1952]
	strb	r6, [r3, #720]
	ldr	r3, [r8, #1952]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #721]
	ldr	r3, [r8, #1952]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #722]
	ldr	r3, [r8, #1952]
	ldr	r1, [r4, #716]
	str	r1, [r3, #740]
	str	r1, [r3, #700]
	ldr	r3, [r8, #1952]
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	str	r1, [r3, #696]
	ldr	r3, [r8, #1952]
	ldr	r1, [r4, #700]
	str	r1, [r3, #688]
	ldr	r3, [r8, #1952]
	ldr	r1, [r4, #704]
	str	r1, [r3, #732]
	ldr	r3, [r8, #1952]
	ldr	r1, [r4, #708]
	str	r1, [r3, #772]
	ldr	r3, [r8, #1952]
	ldr	r1, [r4, #712]
	str	r1, [r3, #812]
	ldrb	r1, [r4, #7]	@ zero_extendqisi2
	ldr	r3, [r8, #1952]
	cmp	r1, r10
	moveq	r7, #3
	strb	r7, [r3, #3]
	ldr	r1, [r4, #680]
	ldr	r3, [r8, #1952]
	ldr	r1, [r1, #752]
	str	r1, [r3, #752]
	ldr	r3, [r8, #1952]
	ldrb	r8, [r3, #721]	@ zero_extendqisi2
	ldrb	r7, [r3, #722]	@ zero_extendqisi2
	ldr	lr, [r3, #736]
	ldr	r1, [r3, #756]
	strb	ip, [r3, #800]
	ldr	ip, [r3, #740]
	str	r1, [r3, #796]
	strb	r10, [r3, #760]
	strb	r8, [r3, #761]
	strb	r8, [r3, #801]
	strb	r7, [r3, #762]
	strb	r7, [r3, #802]
	str	lr, [r3, #776]
	str	lr, [r3, #816]
	str	ip, [r3, #780]
	str	ip, [r3, #820]
	str	r1, [r3, #836]
	ldr	r1, [r4, #680]
	bl	GetAPC
	cmp	r0, #0
	movne	r3, r0
	movwne	r2, #2373
	movne	r0, r6
	bne	.L3460
.L3387:
	add	r3, r9, #6592
	add	r1, r5, #61440
	add	r3, r3, #40
	mov	r2, #1
	ldr	r0, [r1, #3520]
	ldr	r3, [r5, r3, asl #2]
	ldr	r1, [r3, #672]
	bl	FSP_SetRef
	mov	r0, #0
.L3365:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3463:
	mov	r2, r7
	ldr	r1, .L3465
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r5
	mov	r1, #1
	bl	ClearAll
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3367:
	ldr	r3, [r2, #680]
	mov	r2, #3
	strb	r2, [r3, #720]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3373
	add	r6, r0, r3
	add	r2, r6, #24576
	str	r2, [fp, #-48]
	ldr	r2, [r2, #1952]
	cmp	r2, #0
	beq	.L3373
	ldr	r0, [fp, #-48]
	strb	r7, [r2, #760]
	ldr	r2, [r4, #716]
	ldr	r3, [r0, #1952]
	str	r2, [r3, #780]
	ldr	r3, [r0, #1952]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #761]
	ldr	r3, [r0, #1952]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #762]
	ldr	r3, [r0, #1952]
	ldr	r2, [r4, #708]
	str	r2, [r3, #772]
	ldr	r2, [r4, #680]
	ldr	r3, [r0, #1952]
	ldr	r2, [r2, #792]
	str	r2, [r3, #792]
	ldr	r3, [r0, #1952]
	ldr	r2, [r4, #724]
	str	r2, [r3, #776]
	ldr	r3, [r0, #1952]
	ldr	r1, [r3, #776]
	ldr	r2, [r3, #816]
	add	r2, r2, r1
	str	r2, [r3, #736]
	str	r2, [r3, #704]
	add	r1, r4, #16
	ldr	r2, [r0, #1952]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2]
	ldr	r3, [fp, #-48]
	ldr	r2, [r3, #1952]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #1]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #1952]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	orreq	r2, r2, #1
	strb	r2, [r3, #3]
	mov	r2, #664
	ldr	r3, [fp, #-48]
	ldr	lr, [r3, #1952]
	add	r8, lr, #656
	add	ip, lr, #672
	ldr	r3, [lr, #648]
	add	r0, lr, #8
	ldrd	r6, [r8]
	ldr	r10, [lr, #16]
	str	r3, [fp, #-80]
	strd	r6, [fp, #-60]
	ldrd	r6, [ip, #-8]
	ldr	ip, [lr, #20]
	ldr	r3, [lr, #652]
	ldr	r8, [lr, #24]
	str	ip, [fp, #-76]
	ldr	ip, [lr, #28]
	str	r3, [fp, #-72]
	strd	r6, [fp, #-68]
	str	ip, [fp, #-52]
	bl	memcpy
	ldr	r3, [fp, #-80]
	ldr	lr, [fp, #-72]
	ldr	r0, [r4, #656]
	ldr	r1, [r4, #660]
	and	ip, r3, lr
	adds	r2, ip, #1
	ldrd	r6, [fp, #-60]
	and	r1, r1, r0
	ldr	ip, [fp, #-76]
	movne	r2, #1
	cmn	r1, #1
	add	r1, r4, #672
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [fp, #-48]
	ldrne	r2, [r2, #1952]
	strne	r3, [r2, #648]
	ldr	r3, [fp, #-48]
	strne	lr, [r2, #652]
	ldr	r0, [r3, #1952]
	ldrd	r2, [r1, #-8]
	add	r0, r0, #656
	cmp	r3, r7
	cmpeq	r2, r6
	movhi	r2, r6
	movhi	r3, r7
	strd	r2, [r0]
	ldrd	r2, [r1]
	ldr	r1, [fp, #-48]
	ldrd	r6, [fp, #-68]
	ldr	r1, [r1, #1952]
	cmp	r3, r7
	cmpeq	r2, r6
	add	r1, r1, #672
	movhi	r2, r6
	movhi	r3, r7
	strd	r2, [r1, #-8]
	ldr	r1, [fp, #-48]
	ldr	r3, [r4, #24]
	ldr	r2, [r1, #1952]
	cmp	r3, r10
	movcs	r3, r10
	str	r3, [r2, #16]
	ldr	r3, [r4, #28]
	ldr	r2, [r1, #1952]
	cmp	r3, ip
	movcs	r3, ip
	str	r3, [r2, #20]
	ldr	r3, [r4, #32]
	ldr	r2, [r1, #1952]
	cmp	r3, r8
	movcs	r3, r8
	str	r3, [r2, #24]
	ldr	r3, [r4, #36]
	ldr	r2, [r1, #1952]
	ldr	r1, [fp, #-52]
	cmp	r3, r1
	movcs	r3, r1
	str	r3, [r2, #28]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3384
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3384
.L3385:
	ldr	r0, [fp, #-48]
	ldr	r2, [r0, #1952]
	ldr	r3, [r2, #820]
	ldr	r1, [r2, #780]
	cmp	r3, r1
	movcc	r3, r1
	str	r3, [r2, #700]
	ldr	r2, [r4, #700]
	mov	r4, r0
	ldr	r3, [r0, #1952]
	str	r2, [r3, #688]
	ldr	r0, [r0, #1952]
	bl	CombineFldsToFrm
	ldr	r2, [r4, #1952]
	ldr	r3, [r2, #712]
	ldr	r2, [r2, #772]
	add	r3, r3, #6656
	add	r3, r3, #60
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3387
.L3373:
	add	r6, r5, r3
	ldr	r3, [r4, #680]
	add	r6, r6, #24576
	mov	r2, #1
	str	r3, [r6, #1952]
	strb	r2, [r3, #760]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #680]
	str	r1, [r3, #796]
	ldr	r3, [r6, #1952]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #761]
	ldr	r3, [r6, #1952]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #762]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #708]
	str	r1, [r3, #772]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #716]
	str	r1, [r3, #780]
	ldr	r1, [r4, #680]
	ldr	r3, [r6, #1952]
	ldr	r1, [r1, #792]
	str	r1, [r3, #792]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #724]
	str	r1, [r3, #776]
	ldr	r3, [r6, #1952]
	ldr	r1, [r3, #776]
	str	r1, [r3, #736]
	str	r1, [r3, #704]
	ldr	r3, [r6, #1952]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r6, #1952]
	strb	r2, [r3, #1]
	ldr	r2, [r4, #680]
	ldr	r3, [r6, #1952]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r2, [r4, #680]
	ldr	r3, [r6, #1952]
	ldr	r2, [r2, #692]
	str	r2, [r3, #692]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3375
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3375
.L3376:
	ldr	r3, [r6, #1952]
	mov	r7, #0
	mov	r2, #664
	add	r1, r4, #16
	str	r7, [r3, #696]
	ldr	r0, [r6, #1952]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #748]
	mov	r2, #1
	mov	r0, r5
	str	r1, [r3, #708]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #688]
	str	r1, [r3, #676]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #700]
	str	r1, [r3, #688]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #716]
	str	r1, [r3, #700]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	ldr	r1, [r6, #1952]
	rsb	r3, r2, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r1, #3]
	ldr	r1, [r4, #680]
	bl	GetAPC
	cmp	r0, #0
	beq	.L3387
	mov	r3, r0
	movw	r2, #2428
	mov	r0, r7
.L3460:
	ldr	r1, .L3465+4
	bl	dprint_vfmw
	mov	r0, r5
	bl	ClearDPB
	mvn	r0, #0
	b	.L3365
.L3388:
	add	r6, r5, r3
	ldr	r3, [r4, #680]
	add	r6, r6, #24576
	mov	r2, #2
	str	r3, [r6, #1952]
	strb	r2, [r3, #800]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #680]
	str	r1, [r3, #836]
	ldr	r3, [r6, #1952]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	strb	r1, [r3, #801]
	ldr	r3, [r6, #1952]
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	strb	r1, [r3, #802]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #712]
	str	r1, [r3, #812]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #716]
	str	r1, [r3, #820]
	ldr	r1, [r4, #680]
	ldr	r3, [r6, #1952]
	ldr	r1, [r1, #832]
	str	r1, [r3, #832]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #724]
	str	r1, [r3, #816]
	ldr	r3, [r6, #1952]
	ldr	r1, [r3, #776]
	str	r1, [r3, #736]
	str	r1, [r3, #704]
	ldr	r3, [r6, #1952]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r6, #1952]
	strb	r2, [r3, #1]
	ldr	r2, [r4, #680]
	ldr	r3, [r6, #1952]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r2, [r4, #680]
	ldr	r3, [r6, #1952]
	ldr	r2, [r2, #692]
	str	r2, [r3, #692]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3390
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3390
.L3391:
	ldr	r3, [r6, #1952]
	mov	r8, #0
	mov	r2, #664
	add	r1, r4, #16
	str	r8, [r3, #696]
	ldr	r0, [r6, #1952]
	add	r0, r0, #8
	bl	memcpy
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #748]
	mov	r2, #2
	mov	r0, r5
	str	r1, [r3, #708]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #688]
	str	r1, [r3, #676]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #700]
	str	r1, [r3, #688]
	ldr	r3, [r6, #1952]
	ldr	r1, [r4, #716]
	str	r1, [r3, #820]
	str	r1, [r3, #700]
	ldrb	r1, [r4, #7]	@ zero_extendqisi2
	ldr	r3, [r6, #1952]
	cmp	r1, #1
	moveq	r7, r2
	movne	r7, r8
	strb	r7, [r3, #3]
	ldr	r1, [r4, #680]
	bl	GetAPC
	cmp	r0, #0
	movne	r3, r0
	movwne	r2, #2575
	movne	r0, r8
	beq	.L3387
	b	.L3460
.L3464:
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	b	.L3370
.L3375:
	ldr	r3, [r6, #1952]
	mov	r2, #1
	strb	r2, [r3, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, r2
	ldreq	r3, [r6, #1952]
	ldreq	r2, [r4, #692]
	streq	r2, [r3, #684]
	b	.L3376
.L3390:
	ldr	r3, [r6, #1952]
	mov	r2, #2
	strb	r2, [r3, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r6, #1952]
	ldreq	r2, [r4, #692]
	streq	r2, [r3, #684]
	b	.L3391
.L3400:
	ldr	r1, [fp, #-48]
	ldr	r2, [r1, #1952]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r3, r1
	ldreq	r2, [r4, #692]
	ldreq	r3, [r3, #1952]
	streq	r2, [r3, #684]
	b	.L3401
.L3384:
	ldr	r1, [fp, #-48]
	ldr	r2, [r1, #1952]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r3, r1
	ldreq	r2, [r4, #692]
	ldreq	r3, [r3, #1952]
	streq	r2, [r3, #684]
	b	.L3385
.L3462:
	mov	r3, r1
	movw	r2, #2333
	ldr	r1, .L3465+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3365
.L3466:
	.align	2
.L3465:
	.word	.LC373
	.word	.LC372
	.word	.LC371
	UNWIND(.fnend)
	.size	InsertFrmInDPB, .-InsertFrmInDPB
	.align	2
	.global	StorePicInDPB
	.type	StorePicInDPB, %function
StorePicInDPB:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	ldr	r3, [r0]
	mov	r4, r0
	ldr	r3, [r3, #596]
	cmp	r3, #1
	beq	.L3630
	add	r6, r0, #57344
	mov	r3, #0
	str	r3, [r6, #4088]
	str	r3, [r6, #4092]
.L3470:
	add	r2, r4, #16384
	mov	r3, #0
	str	r3, [r2, #3444]
	ldrb	r3, [r6, #3979]	@ zero_extendqisi2
	sub	r3, r3, #2
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r2, #3448]
	ldrb	r0, [r6, #3976]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L3631
	add	r5, r4, #61440
	ldr	r3, .L3657
	ldr	r1, [r5, #3520]
	ldr	r2, [r5, #3532]
	ldr	r3, [r3, r1, asl #2]
	str	r2, [r5, #3528]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L3632
.L3473:
	ldr	r0, [r5, #3448]
	cmp	r0, #2
	beq	.L3633
	ldr	r7, [r4]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	ble	.L3634
	ldrb	r2, [r6, #3978]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3479
.L3642:
	ldrb	r1, [r6, #3979]	@ zero_extendqisi2
	ldr	r8, [r5, #560]
	sub	r2, r1, #1
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	cmp	r1, #0
	beq	.L3480
	ldrb	r0, [r8, #1]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	ip, r2
	orrne	ip, r2, #1
	cmp	ip, #0
	beq	.L3479
	cmp	r2, #0
	beq	.L3635
.L3555:
	ldr	r2, [r5, #3524]
	cmp	r2, #0
	bne	.L3483
	add	r1, r6, #3968
	mov	r3, #1
	add	r1, r1, #8
	str	r3, [r5, #3524]
	mov	r2, #760
	add	r0, r5, #640
	bl	memcpy
	ldr	r3, [r7, #12]
.L3479:
	cmp	r3, #2
	ldr	r3, [r5, #576]
	beq	.L3636
	cmp	r3, #0
	beq	.L3516
	ldr	r3, [r5, #3512]
	ldr	r2, [r5, #604]
	cmp	r3, r2
	bcs	.L3517
	ldrb	r1, [r6, #3978]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L3637
.L3517:
	mov	r0, r4
	bl	Marking
	subs	r2, r0, #0
	beq	.L3519
	ldr	r1, .L3657+4
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #4009
	mvn	r2, #0
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3554
.L3480:
	cmp	r2, #0
	bne	.L3555
.L3486:
	add	r9, r4, #61184
	add	r9, r9, #136
.L3489:
	cmp	r1, #0
	beq	.L3490
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3638
.L3490:
	ldr	r3, [r9, #724]
	str	r3, [r8, #704]
.L3491:
	mov	r1, r8
	mov	r0, r4
	bl	GetImagePara
	ldr	r1, [r8, #672]
	ldr	r0, [r5, #3520]
	bl	FSP_GetFsImagePtr
	subs	r7, r0, #0
	beq	.L3639
	ldrb	r3, [r9, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3493
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3640
.L3493:
	add	r3, r9, #656
	add	r1, r7, #640
	ldrd	r2, [r3]
	strd	r2, [r1]
.L3494:
	add	lr, r9, #672
	add	r0, r7, #656
	add	ip, r9, #288
	add	r1, r7, #272
	ldrd	r2, [lr, #-8]
	strd	r2, [r0, #-8]
	ldrd	r2, [lr]
	strd	r2, [r0]
	ldr	r3, [r9, #24]
	str	r3, [r7, #8]
	ldr	r3, [r9, #28]
	str	r3, [r7, #12]
	ldr	r3, [r9, #32]
	str	r3, [r7, #16]
	ldr	r3, [r9, #36]
	str	r3, [r7, #20]
	ldr	r0, [r8, #704]
	cmp	r0, #0
	str	r0, [r7, #184]
	ldr	r3, [r9, #272]
	str	r3, [r7, #256]
	ldr	r3, [r9, #268]
	str	r3, [r7, #252]
	ldrd	r2, [ip, #-8]
	strd	r2, [r1, #-8]
	beq	.L3495
	ldrb	r3, [r7, #124]	@ zero_extendqisi2
	ands	r9, r3, #3
	beq	.L3641
.L3496:
	ldr	r3, [r4]
	ldr	r2, [r3, #4]
	cmp	r2, r0
	bcs	.L3495
	ldr	r3, .L3657+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3506
	str	r0, [fp, #-52]
	mov	r3, #8
	str	r2, [fp, #-48]
	mov	r1, #104
	sub	r2, fp, #52
	ldr	r0, [r5, #3520]
	blx	ip
.L3506:
	ldr	r1, [r8, #672]
	mov	r2, #0
	ldr	r0, [r5, #3520]
	bl	FSP_SetDisplay
	movw	r3, #3932
	mvn	r2, #0
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3554
.L3631:
	ldr	r1, .L3657+16
	add	r5, r4, #61440
	bl	dprint_vfmw
	movw	r3, #3704
	mvn	r2, #0
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
.L3554:
	ldr	r3, [r5, #560]
	mov	r2, #1
	ldr	r0, [r5, #3520]
	mvn	r7, #0
	ldr	r1, [r3, #672]
	bl	FSP_ClearLogicFs
	mov	r3, r7
	movw	r2, #4228
	ldr	r1, .L3657+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r5, #560]
	mov	r3, #0
	strb	r3, [r2, #4]
	ldr	r2, [r5, #560]
	strb	r3, [r2, #1]
.L3552:
	mov	r0, r7
	mov	r3, #0
	strb	r3, [r6, #3976]
.L3620:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3630:
	ldr	r2, .L3657+24
	add	r6, r0, #57344
	ldr	r2, [r2]
	add	r2, r2, #4096
	ldr	r0, [r2, #84]
	ldr	r1, [r2, #88]
	str	r3, [r6, #4088]
	cmp	r1, #0
	moveq	r1, #1
	bl	__aeabi_uidiv
	str	r0, [r6, #4092]
	b	.L3470
.L3634:
	ldr	r2, [r5, #3524]
	cmp	r2, #2
	beq	.L3479
	ldrb	r2, [r6, #3978]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3479
	b	.L3642
.L3636:
	cmp	r3, #0
	beq	.L3509
	ldrb	r3, [r6, #3982]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L3510
.L3514:
	mov	r0, r4
	add	r7, r4, #24576
	bl	SimpleSlideDPB
	add	r2, r4, #61184
	ldr	r1, [r7, #2148]
	add	r2, r2, #136
	mov	r0, r4
	bl	InsertFrmInDPB
	subs	r8, r0, #0
	beq	.L3643
	mov	r3, r8
	movw	r2, #3975
	ldr	r1, .L3657+20
	mov	r0, #0
	bl	dprint_vfmw
	movw	r3, #3976
	mvn	r2, #0
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3554
.L3641:
	movw	r2, #3899
	ldr	r1, .L3657+28
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3657+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3623
	mov	r3, r9
	mov	r2, r9
	mov	r1, #111
	ldr	r0, [r5, #3520]
	blx	ip
.L3623:
	ldr	r0, [r7, #184]
	cmp	r0, #0
	bne	.L3496
.L3495:
	mov	r2, #1
	ldr	r1, [r8, #672]
	ldr	r0, [r5, #3520]
	bl	FSP_SetDisplay
	ldr	r0, [r5, #3520]
	add	r3, r4, #8
	str	r7, [sp]
	mov	r2, r4
	mov	r1, #0
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L3500
	mov	r2, #0
	ldr	r1, [r8, #672]
	ldr	r0, [r5, #3520]
	bl	FSP_SetDisplay
.L3501:
	ldr	r3, [r4]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r7, #24]
	bcs	.L3644
.L3503:
	ldr	r2, [r5, #3524]
	ldr	r3, [r5, #3540]
	cmp	r2, #2
	add	r3, r3, #2
	str	r3, [r5, #3540]
	movne	r3, #1
	strne	r3, [r8, #840]
	mov	r3, #2
	str	r3, [r5, #3524]
	ldr	r3, [r4]
	ldr	r3, [r3, #12]
	b	.L3479
.L3635:
	cmp	r0, #0
	beq	.L3479
	b	.L3486
.L3519:
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	mov	r0, r4
	bl	RemoveUnUsedFrameStore
	cmp	r0, #0
	beq	.L3509
	ldr	r1, .L3657+32
	mov	r0, #22
	bl	dprint_vfmw
.L3509:
	ldrb	r3, [r6, #3977]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3521
	add	r7, r4, #24576
.L3525:
	ldr	r3, [r5, #576]
	cmp	r3, #0
	beq	.L3645
	ldr	r2, [r7, #2152]
	ldr	r1, [r7, #2156]
	ldr	r3, [r7, #2144]
	add	r0, r1, r2
	cmp	r3, r0
	bhi	.L3533
	ldr	r0, [r4]
	ldr	r0, [r0, #12]
	cmp	r0, #3
	beq	.L3534
	ldr	r0, .L3657+36
	ldrb	r0, [r0]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L3534
	str	r1, [sp, #4]
	mov	r0, #1
	str	r2, [sp]
	movw	r2, #4088
	ldr	r1, .L3657+40
	bl	dprint_vfmw
	mov	r0, r4
	bl	ClearDPB
	movw	r3, #4114
	mvn	r2, #0
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3554
.L3516:
	ldrb	r3, [r6, #3977]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3521
	add	r7, r4, #24576
	ldr	r3, [r7, #2144]
.L3533:
	mvn	r10, #0
	mov	r9, r10
	b	.L3543
.L3544:
	bl	GetMinPOC
	ldr	r3, [r5, #576]
	cmp	r3, #0
	bne	.L3536
	ldr	r2, [r5, #580]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L3646
.L3536:
	ldr	r8, [r7, #2148]
	cmp	r8, r10
	ldrne	r9, [fp, #-52]
	bne	.L3541
	ldr	r3, [fp, #-52]
	cmp	r3, r9
	beq	.L3647
	mov	r9, r3
.L3541:
	mov	r1, r9
	mov	r0, r4
	bl	OutputFrmFromDPB
	mov	r10, r8
	cmn	r0, #1
	beq	.L3542
	ldr	r3, [r7, #2144]
.L3543:
	ldr	ip, [r7, #2148]
	sub	r2, fp, #52
	sub	r1, fp, #56
	mov	r0, r4
	cmp	ip, r3
	bcs	.L3544
	ldr	r3, [r5, #576]
	cmp	r3, #0
	beq	.L3545
	ldrb	r3, [r6, #3980]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3545
	ldr	r2, [r7, #2152]
	cmp	r2, #0
	beq	.L3545
	add	r2, r4, #26368
	mov	lr, r3
	add	r2, r2, #220
	b	.L3550
.L3547:
	ldr	r1, [r7, #2152]
	cmp	r1, r3
	bls	.L3648
.L3550:
	ldr	r1, [r2, #4]!
	add	r3, r3, #1
	ldr	r0, [r5, #568]
	ldr	ip, [r1, #676]
	cmp	ip, r0
	bne	.L3547
	strb	lr, [r1, #2]
	ldr	r1, [r2]
	ldrb	r0, [r1, #4]	@ zero_extendqisi2
	cmp	r0, #1
	streq	r0, [r1, #692]
	ldreq	r1, [r2]
	streqb	lr, [r1, #4]
	ldreq	r1, [r2]
	ldr	r8, [r5, #2064]
	ldr	ip, [r1, #708]
	add	r0, ip, #15808
	cmp	ip, r8
	add	r0, r0, #50
	strne	lr, [r4, r0, asl #2]
	strne	r8, [r1, #708]
	b	.L3547
.L3648:
	ldr	ip, [r7, #2148]
.L3545:
	add	r2, r4, #61184
	mov	r1, ip
	add	r2, r2, #136
	mov	r0, r4
	bl	InsertFrmInDPB
	ldr	r2, [r7, #2148]
	str	r2, [r5, #1424]
	subs	r3, r0, #0
	bne	.L3649
	add	r2, r2, #1
	mov	r0, r4
	str	r2, [r7, #2148]
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
.L3515:
	mov	r7, #0
	b	.L3552
.L3632:
	ldr	r2, [r3, #176]
	cmp	r2, #0
	bne	.L3473
	ldr	r3, [r3, #180]
	cmp	r3, #1
	bne	.L3473
	mov	r0, r4
	bl	H264_Sei_Get_Frame_Pts
	b	.L3473
.L3645:
	ldr	r3, [r7, #2144]
	b	.L3533
.L3521:
	ldr	r3, [r5, #1428]
	ldr	r0, [r5, #560]
	cmp	r3, #0
	rsb	r1, r3, r0
	clz	r1, r1
	mov	r1, r1, lsr #5
	moveq	r1, #0
	cmp	r1, #0
	beq	.L3650
	mov	r0, r4
	bl	DirectOutput
	cmn	r0, #1
	mov	r7, r0
	beq	.L3651
	cmp	r0, #1
	ldreq	r2, [r5, #560]
	moveq	r3, #0
	streqb	r3, [r2, #4]
	ldreq	r2, [r5, #560]
	streqb	r3, [r2, #1]
.L3529:
	movw	r3, #4045
	mov	r2, r7
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3477
.L3633:
	ldr	r1, .L3657+44
	bl	dprint_vfmw
	mov	r0, r4
	bl	DirectOutput
	ldr	r3, [r5, #628]
	ldr	r2, [r5, #2064]
	cmp	r3, r2
	addne	r3, r3, #15808
	addne	r3, r3, #50
	movne	r1, #0
	strne	r1, [r4, r3, asl #2]
	mov	r7, r0
	strne	r2, [r5, #628]
	cmp	r0, #1
	ldr	r1, .L3657+8
	ldreq	r2, [r5, #560]
	moveq	r3, #0
	streqb	r3, [r2, #4]
	ldreq	r2, [r5, #560]
	streqb	r3, [r2, #1]
	mov	r2, r0
	movw	r3, #3765
	mov	r0, #14
	bl	dprint_vfmw
.L3477:
	cmn	r7, #1
	bne	.L3552
	b	.L3554
.L3483:
	cmp	r2, #1
	beq	.L3652
	cmp	r1, #0
	beq	.L3486
	ldrb	r2, [r8, #1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3486
	b	.L3479
.L3650:
	add	r7, r4, #24576
	ldr	ip, [r7, #2148]
	cmp	ip, #0
	beq	.L3525
	ldr	r3, [r7, #1952]
	cmp	r0, r3
	addne	r3, r4, #26368
	addne	r3, r3, #160
	beq	.L3526
.L3530:
	add	r1, r1, #1
	cmp	r1, ip
	beq	.L3525
	ldr	r2, [r3, #4]!
	cmp	r0, r2
	bne	.L3530
.L3526:
	add	r2, r4, #61184
	mov	r0, r4
	add	r2, r2, #136
	bl	InsertFrmInDPB
	cmn	r0, #1
	mov	r7, r0
	beq	.L3653
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	movw	r3, #4065
	mov	r2, #0
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3515
.L3542:
	mov	r3, r0
	str	r0, [fp, #-64]
	movw	r2, #4164
	ldr	r1, .L3657+20
	mov	r0, #1
	bl	dprint_vfmw
	ldr	ip, [fp, #-64]
	movw	r3, #4165
	ldr	r1, .L3657+8
	mov	r0, #14
	mov	r2, ip
	bl	dprint_vfmw
	b	.L3554
.L3649:
	movw	r2, #4201
	ldr	r1, .L3657+20
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #4202
	mvn	r2, #0
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3554
.L3500:
	ldr	r3, [r5, #3548]
	add	r3, r3, #1
	str	r3, [r5, #3548]
	b	.L3501
.L3643:
	ldr	r3, [r7, #2148]
	mov	r0, r4
	add	r3, r3, #1
	str	r3, [r7, #2148]
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	mov	r2, r8
	mov	r3, #3984
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3515
.L3534:
	sub	r2, fp, #52
	sub	r1, fp, #56
	mov	r0, r4
	bl	GetMinPOC
	ldr	r1, [fp, #-52]
	mov	r0, r4
	bl	RemoveFrameStoreOutDPB
	mov	r0, r4
	bl	UpdateReflist
	mov	r0, r4
	bl	UpdateLTReflist
	ldr	r3, [r7, #2144]
	b	.L3533
.L3640:
	add	r3, r9, #656
	mvn	r1, #0
	mvn	r0, #0
	ldrd	r2, [r3]
	cmp	r3, r1
	cmpeq	r2, r0
	bne	.L3494
	movw	r1, #62736
	ldrd	r0, [r1, r4]
	cmp	r1, r3
	cmpeq	r0, r2
	addne	r3, r7, #640
	strned	r0, [r3]
	b	.L3494
.L3651:
	mov	r3, r0
	movw	r2, #4035
	ldr	r1, .L3657+20
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3529
.L3637:
	ldr	r1, .L3657+48
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3657+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3518
	ldr	r7, [r5, #604]
	mov	r3, #8
	ldr	lr, [r5, #3512]
	sub	r2, fp, #52
	mov	r1, #104
	ldr	r0, [r5, #3520]
	str	r7, [fp, #-52]
	str	lr, [fp, #-48]
	blx	ip
.L3518:
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	mov	r3, #4000
	mvn	r2, #0
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3554
.L3646:
	ldr	r3, [r5, #3448]
	cmp	r3, #2
	beq	.L3654
.L3537:
	mov	r0, r4
	bl	DirectOutput
	cmn	r0, #1
	mov	r7, r0
	beq	.L3655
	cmp	r0, #1
	ldreq	r2, [r5, #560]
	moveq	r3, #0
	streqb	r3, [r2, #4]
	ldreq	r2, [r5, #560]
	streqb	r3, [r2, #1]
.L3539:
	movw	r3, #4144
	mov	r2, r7
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3477
.L3647:
	mov	r3, r9
	ldr	r2, .L3657+52
	ldr	r1, .L3657+56
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #4151
	mvn	r2, #0
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3554
.L3644:
	mov	r1, r7
	mov	r0, r4
	bl	SetFrmRepeatCount.part.1
	b	.L3503
.L3510:
	mov	r0, r4
	bl	IDRMemMarking
	cmp	r0, #0
	beq	.L3514
	mvn	r0, #0
	b	.L3620
.L3638:
	mov	r2, #3
	ldr	r3, [r8, #704]
	strb	r2, [r8, #1]
	ldr	r2, [r9, #724]
	add	r3, r3, r2
	str	r3, [r8, #704]
	b	.L3491
.L3652:
	cmp	r1, #1
	add	r9, r4, #61184
	add	r9, r9, #136
	ldr	r8, [r5, #1320]
	beq	.L3656
	cmp	r1, #2
	ldreq	r3, [r5, #592]
	streq	r3, [r8, #812]
	ldreqb	r1, [r6, #3979]	@ zero_extendqisi2
	b	.L3489
.L3654:
	ldrb	r3, [r6, #3979]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r5, #560]
	strne	r3, [r5, #1432]
	b	.L3537
.L3653:
	mov	r3, r0
	movw	r2, #4058
	ldr	r1, .L3657+20
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, r7
	movw	r3, #4059
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3554
.L3639:
	movw	r2, #3867
	ldr	r1, .L3657+60
	bl	dprint_vfmw
	movw	r3, #3868
	mvn	r2, #0
	ldr	r1, .L3657+8
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3554
.L3656:
	ldr	r3, [r5, #588]
	str	r3, [r8, #772]
	ldrb	r1, [r6, #3979]	@ zero_extendqisi2
	b	.L3489
.L3655:
	mov	r3, r0
	movw	r2, #4135
	ldr	r1, .L3657+20
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3539
.L3658:
	.align	2
.L3657:
	.word	s_pstVfmwChan
	.word	.LC381
	.word	.LC375
	.word	g_event_report
	.word	.LC374
	.word	.LC379
	.word	g_HwMem
	.word	.LC378
	.word	.LC382
	.word	g_apple_airplay_mirrorinig_flag
	.word	.LC383
	.word	.LC376
	.word	.LC380
	.word	.LANCHOR1+272
	.word	.LC384
	.word	.LC377
	UNWIND(.fnend)
	.size	StorePicInDPB, .-StorePicInDPB
	.align	2
	.global	AllocFrameStore
	.type	AllocFrameStore, %function
AllocFrameStore:
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
	add	r8, r0, #20480
	mov	r7, r0
	str	r1, [fp, #-56]
	ldrb	r3, [r8, #209]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3660
	ldrb	r3, [r8, #210]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3724
	add	r5, r0, #61440
	ldr	r3, [r5, #3448]
	cmp	r3, #2
	beq	.L3719
	add	r6, r7, #57344
	mov	r3, #0
	strb	r3, [r6, #3977]
	ldrb	r3, [r5, #1400]	@ zero_extendqisi2
	cmp	r3, #1
	mov	r3, #2
	str	r3, [fp, #-52]
	bne	.L3690
.L3686:
	ldr	r2, [r5, #1408]
	ldr	r3, [r8, #228]
	cmp	r2, r3
	bne	.L3690
	ldr	r3, [r8, #240]
	cmp	r3, #0
	ldr	r3, [r5, #1404]
	beq	.L3725
	cmp	r3, #0
	beq	.L3690
.L3666:
	ldr	r3, [r5, #3532]
	ldr	r2, [r5, #3528]
	rsb	r3, r2, r3
	cmp	r3, #2
	bhi	.L3690
	mov	r3, #1
	strb	r3, [r6, #3977]
	ldr	r1, [r5, #560]
	cmp	r1, #0
	beq	.L3668
	ldr	r3, [fp, #-52]
	cmp	r3, #2
	beq	.L3726
	ldr	r3, [fp, #-52]
	cmp	r3, #1
	beq	.L3727
.L3693:
	mov	ip, #0
	b	.L3672
.L3660:
	add	r5, r0, #61440
	ldr	r2, [r5, #3448]
	cmp	r2, #2
	strne	r3, [fp, #-52]
	addne	r6, r0, #57344
	strneb	r3, [r6, #3977]
	beq	.L3719
.L3690:
	mov	lr, #0
	strb	lr, [r6, #3976]
	ldr	r4, [r5, #2060]
	cmp	r4, lr
	beq	.L3680
	add	ip, r7, #27392
	add	r10, r7, #26368
	add	ip, ip, #8
	add	r10, r10, #160
	add	r9, r7, #24576
.L3679:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3675
	cmp	ip, #0
	beq	.L3695
	ldr	r1, [r9, #2148]
	cmp	r1, #0
	beq	.L3695
	ldr	r2, [r9, #1952]
	cmp	r2, ip
	beq	.L3675
	mov	r2, r10
	b	.L3677
.L3678:
	ldr	r0, [r2, #4]!
	cmp	r0, ip
	beq	.L3675
.L3677:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L3678
.L3695:
	mov	r9, #848
	movw	r2, #28104
	mla	r9, r9, lr, r7
	add	r0, r6, #3984
	mov	r10, #0
	mov	r3, #1
	mov	r4, ip
	strb	r3, [r6, #3976]
	add	r1, r9, #27392
	str	ip, [r5, #560]
	add	r0, r0, #8
	mov	ip, #101
	str	r10, [r9, r2]
	add	r1, r1, #16
	mov	r2, #664
	str	ip, [r5, #604]
	str	r3, [fp, #-48]
	bl	memcpy
	add	lr, r9, #27392
	str	r10, [r5, #80]
	ldr	r3, [fp, #-48]
	strb	r10, [lr, #11]
	str	r10, [r4, #692]
	ldr	r2, [r5, #560]
	strb	r10, [r2, #2]
	ldr	r2, [r5, #560]
	strb	r3, [r2, #4]
	ldr	r3, [r5, #560]
	str	r10, [r3, #840]
	ldrb	r4, [r6, #3976]	@ zero_extendqisi2
	cmp	r4, #1
	bne	.L3680
	ldr	r3, [fp, #-56]
	ldr	r0, [r5, #3520]
	clz	r1, r3
	mov	r1, r1, lsr #5
	bl	FSP_NewLogicFs
	mov	r1, r0
	str	r0, [fp, #-48]
	ldr	r0, [r5, #3520]
	bl	FSP_GetLogicFs
	ldr	r3, [fp, #-48]
	mvn	r2, r3
	mov	r2, r2, lsr #31
	cmp	r0, #0
	mov	r9, r0
	moveq	r2, #0
	cmp	r2, #0
	beq	.L3681
	ldr	r2, [r7]
	ldr	r2, [r2, #28]
	cmp	r2, #25
	beq	.L3728
.L3682:
	ldr	r4, .L3731
	mov	r2, #664
	ldr	r0, [r5, #560]
	add	r1, r9, #8
	str	r3, [fp, #-48]
	ldr	ip, [r4, #52]
	add	r0, r0, #8
	blx	ip
	ldr	r1, [r5, #560]
	add	r0, r7, #61184
	ldr	ip, [r4, #52]
	add	r1, r1, #8
	mov	r2, #664
	add	r0, r0, #152
	blx	ip
	ldr	r3, [fp, #-48]
	ldr	r2, [r5, #560]
	mov	ip, r3
	str	r3, [r2, #672]
	ldrsb	r3, [r9, #4]
	ldr	r1, [r5, #560]
	str	r3, [r5, #628]
.L3672:
	ldrb	r2, [fp, #-52]	@ zero_extendqisi2
	strb	r2, [r6, #3979]
	ldrb	r3, [r8, #209]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	strb	r3, [r1, #720]
	ldrb	r3, [r6, #3977]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3729
	ldr	r3, [fp, #-52]
	strb	r2, [r5, #1400]
	cmp	r3, #0
	ldr	r3, [r8, #228]
	ldr	r2, [r5, #3532]
	ldreq	r0, [fp, #-52]
	movne	r0, #0
	str	r3, [r5, #1408]
	ldr	r3, [r8, #240]
	str	ip, [r5, #1420]
	str	r2, [r5, #1416]
	str	r3, [r5, #1404]
	movne	r3, #1
	moveq	r3, r0
	strb	r3, [r5, #1401]
.L3715:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3675:
	add	lr, lr, #1
	add	ip, ip, #848
	cmp	lr, r4
	bne	.L3679
.L3680:
	ldr	r1, .L3731+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r7
	mov	r1, #1
	bl	ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3724:
	add	r5, r0, #61440
	ldr	r2, [r5, #3448]
	cmp	r2, #2
	beq	.L3730
	add	r6, r7, #57344
	strb	r3, [r6, #3977]
	ldrb	r3, [r5, #1400]	@ zero_extendqisi2
	cmp	r3, #2
	mov	r3, #1
	str	r3, [fp, #-52]
	bne	.L3690
	b	.L3686
.L3730:
	mov	r3, #1
.L3719:
	add	r6, r7, #57344
	str	r3, [fp, #-52]
.L3721:
	mov	r3, #0
	strb	r3, [r6, #3977]
	b	.L3690
.L3728:
	add	r1, r7, #12288
	ldr	r4, [r0, #172]
	ldr	r0, [r0, #52]
	ldr	r2, [r1, #1280]
	ldr	r1, [r1, #1276]
	str	r10, [r9, #368]
	mov	r2, r2, asl #4
	str	r10, [r9, #372]
	mov	r1, r1, asl #4
	str	r2, [r9, #140]
	mul	r4, r4, r2
	str	r1, [r9, #136]
	str	r10, [r9, #376]
	str	r10, [r9, #380]
	add	r0, r4, r0
	str	r10, [r9, #384]
	str	r0, [r9, #56]
	bl	MEM_Phy2Vir
	ldr	r2, [r9, #68]
	ldr	ip, [r9, #36]
	add	r2, r4, r2
	ldr	r1, [r9, #172]
	add	r4, r4, ip
	str	r10, [r9, #564]
	str	r4, [r9, #40]
	add	r4, r4, r1
	str	r2, [r9, #72]
	str	r4, [r9, #48]
	str	r0, [r9, #560]
	mov	r0, r2
	bl	MEM_Phy2Vir
	str	r10, [r9, #580]
	ldr	r3, [fp, #-48]
	str	r0, [r9, #576]
	b	.L3682
.L3729:
	mov	r3, #0
	strb	r3, [r5, #1400]
	ldr	r1, [r8, #228]
	mov	r0, r3
	ldr	r2, [r5, #3532]
	str	r1, [r5, #1408]
	ldr	r1, [r8, #240]
	strb	r3, [r5, #1401]
	str	ip, [r5, #1420]
	str	r1, [r5, #1404]
	str	r2, [r5, #1416]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3725:
	cmp	r3, #0
	beq	.L3666
	b	.L3690
.L3681:
	strb	r2, [r6, #3976]
	mov	r0, r2
	ldr	r3, [r5, #560]
	ldr	r1, .L3731+8
	strb	r2, [r3, #4]
	bl	dprint_vfmw
	mov	r1, r4
	mov	r0, r7
	bl	ClearAll
	mvn	r0, #0
	b	.L3715
.L3727:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3721
.L3671:
	ldr	r1, [r5, #560]
	cmp	r1, #0
	bne	.L3693
	b	.L3690
.L3726:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3721
	b	.L3671
.L3668:
	strb	r1, [r6, #3977]
	b	.L3690
.L3732:
	.align	2
.L3731:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC385
	.word	.LC386
	UNWIND(.fnend)
	.size	AllocFrameStore, .-AllocFrameStore
	.global	__aeabi_idivmod
	.align	2
	.global	DecGap
	.type	DecGap, %function
DecGap:
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
	UNWIND(.pad #60)
	sub	sp, sp, #60
	add	r3, r0, #24576
	add	r2, r0, #12288
	mov	r5, r0
	mov	ip, r3
	str	r2, [fp, #-72]
	ldr	r0, [ip, #1812]
	mov	r1, r2
	add	r2, r5, #20480
	str	r3, [fp, #-80]
	movw	r3, #2004
	str	r2, [fp, #-76]
	mov	lr, r2
	mov	r2, r1
	mul	r3, r3, r0
	ldrb	r1, [r1, #1325]	@ zero_extendqisi2
	mov	r6, #0
	ldr	r0, [lr, #228]
	cmp	r1, #1
	mov	r1, lr
	add	r9, r5, #16384
	add	r4, r5, #61440
	moveq	r1, #2
	movne	r1, r6
	str	r1, [fp, #-68]
	add	r1, r5, r3
	add	r1, r1, #22272
	ldr	r2, [r2, #3504]
	str	r0, [fp, #-60]
	mov	r3, r1
	add	r1, r1, #104
	ldr	r0, [lr, #224]
	add	r3, r3, #108
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	ldr	lr, [r9, #3468]
	str	r6, [fp, #-52]
	str	r1, [fp, #-96]
	ldr	r1, [r9, #3472]
	str	r3, [r4, #564]
	ldr	r7, [ip, #2148]
	str	lr, [fp, #-88]
	cmp	r7, r6
	str	r1, [fp, #-92]
	str	r6, [fp, #-48]
	beq	.L3749
	add	r2, r2, #4
	mov	r7, #1
	mov	r3, r7, asl r2
	add	r0, r0, r7
	str	r3, [fp, #-84]
	mov	r1, r3
	bl	__aeabi_uidivmod
	str	r6, [r9, #3472]
	mov	r0, #2
	str	r6, [r9, #3468]
	mov	r10, r1
	ldr	r1, .L3752
	bl	dprint_vfmw
	ldr	r8, [fp, #-60]
	mov	r3, r10
	ldr	r1, .L3752+4
	mov	r0, #2
	mov	r2, r8
	bl	dprint_vfmw
	sub	r2, fp, #52
	sub	r1, fp, #48
	mov	r0, r5
	bl	GetMaxPOC
	cmp	r8, r10
	beq	.L3741
	mov	r3, r4
	str	r6, [fp, #-64]
	mov	r4, r10
	mov	r6, r7
	mov	r10, r3
	b	.L3742
.L3739:
	mov	r1, r8
	mov	r0, r5
	strb	r8, [r7, #3980]
	bl	StorePicInDPB
	ldr	r1, [fp, #-84]
	subs	r3, r0, #0
	add	r0, r4, #1
	bne	.L3750
	ldr	r3, [fp, #-76]
	str	r4, [r3, #224]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-60]
	cmp	r3, r1
	mov	r4, r1
	beq	.L3748
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-64]
	ldr	r3, [r3, #2148]
	cmp	r2, r3
	bhi	.L3748
.L3742:
	mov	r1, #1
	mov	r0, r5
	bl	AllocFrameStore
	mov	r8, #0
	add	r7, r5, #57344
	ldr	r1, .L3752+8
	subs	r3, r0, #0
	mov	r0, #2
	bne	.L3751
	str	r3, [fp, #-56]
	bl	dprint_vfmw
	strb	r6, [r7, #3982]
	ldr	r1, [r10, #560]
	ldr	r3, [fp, #-68]
	str	r4, [r1, #676]
	ldr	r1, [r10, #560]
	str	r4, [r10, #568]
	str	r4, [r1, #728]
	str	r3, [r10, #576]
	ldr	r1, [r10, #560]
	ldr	r3, [fp, #-56]
	str	r3, [r1, #724]
	ldr	r1, [r10, #560]
	str	r6, [r1, #692]
	ldr	r1, [r10, #560]
	strb	r3, [r1, #4]
	ldr	r1, [r10, #560]
	strb	r6, [r1]
	strb	r6, [r7, #3978]
	ldr	r1, [r10, #564]
	strb	r3, [r1, #3]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #3508]
	cmp	r3, #0
	beq	.L3739
	str	r4, [r9, #3484]
	mov	r0, r5
	bl	DecPOC
	ldr	r3, [r9, #3464]
	ldr	r1, [fp, #-48]
	str	r3, [r10, #580]
	ldr	r3, [r9, #3460]
	str	r3, [r10, #584]
	ldr	r3, [r9, #3452]
	cmp	r3, r1
	str	r3, [r10, #588]
	ldr	r3, [r9, #3456]
	str	r3, [r10, #592]
	bls	.L3739
	cmp	r1, r3
	ldrcc	r3, [fp, #-64]
	addcc	r3, r3, #1
	strcc	r3, [fp, #-64]
	b	.L3739
.L3749:
	ldr	r1, .L3752+12
	mov	r0, r7
	bl	dprint_vfmw
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3748:
	mov	r4, r10
.L3741:
	ldr	r3, [fp, #-88]
	mov	r0, #0
	ldrb	r2, [fp, #-96]	@ zero_extendqisi2
	str	r3, [r9, #3468]
	ldr	r3, [fp, #-92]
	str	r3, [r9, #3472]
	ldr	r3, [r4, #564]
	strb	r2, [r3, #3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3751:
	ldr	r3, [fp, #-88]
	mov	r0, r8
	ldrb	r2, [fp, #-96]	@ zero_extendqisi2
	ldr	r1, .L3752+16
	str	r3, [r9, #3468]
	ldr	r3, [fp, #-92]
	str	r3, [r9, #3472]
	ldr	r3, [r10, #564]
	strb	r2, [r3, #3]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3750:
	ldr	r2, [fp, #-88]
	mov	r0, r8
	ldrb	lr, [fp, #-96]	@ zero_extendqisi2
	ldr	r1, .L3752+20
	str	r2, [r9, #3468]
	ldr	r2, [fp, #-92]
	str	r2, [r9, #3472]
	movw	r2, #6613
	ldr	ip, [r10, #564]
	strb	lr, [ip, #3]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3753:
	.align	2
.L3752:
	.word	.LC388
	.word	.LC389
	.word	.LC391
	.word	.LC387
	.word	.LC390
	.word	.LC392
	UNWIND(.fnend)
	.size	DecGap, .-DecGap
	.align	2
	.global	H264DEC_Init
	.type	H264DEC_Init, %function
H264DEC_Init:
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
	ldr	r8, .L3767
	mov	r5, r0
	ldr	r4, [r0, #352]
	mov	r7, r1
	movw	r2, #65016
	mov	r1, #0
	ldr	r3, [r8, #48]
	blx	r3
	str	r4, [r5, #352]
	add	r0, r5, #8
	bl	ResetVoQueue
	mov	r3, #0
	str	r7, [r5]
	str	r3, [r5, #360]
	str	r3, [r5, #364]
	ldr	r3, [r7, #28]
	cmp	r3, #25
	beq	.L3764
	add	r6, r5, #12288
	mov	r1, #32
	mov	r2, #256
	mov	r3, #136
	str	r1, [r6, #1288]
	str	r2, [r6, #1292]
	str	r3, [r6, #1284]
.L3756:
	ldr	r0, [r7, #584]
	add	r4, r5, #61440
	bl	MEM_Phy2Vir
	ldr	lr, [r6, #1288]
	ldr	r3, [r5]
	mov	r2, #4000
	ldr	r1, [r6, #1292]
	mul	r2, r2, lr
	ldr	r3, [r3, #580]
	add	r3, r0, r3
	mov	r0, #2208
	add	ip, r3, r2
	str	r3, [r6, #1300]
	cmp	r3, #0
	cmpne	ip, #0
	str	ip, [r6, #1304]
	mla	r0, r0, r1, ip
	moveq	r9, #1
	movne	r9, #0
	cmp	r0, #0
	orreq	r9, r9, #1
	cmp	r9, #0
	str	r0, [r4, #3440]
	bne	.L3765
	ldr	r7, [r7, #608]
	mov	r10, r7
	adds	r7, r3, #0
	movne	r7, #1
	cmp	r10, #0
	movne	r7, #0
	cmp	ip, #0
	moveq	ip, #0
	andne	ip, r7, #1
	cmp	ip, #0
	beq	.L3759
	mov	r0, r3
	mov	r1, r9
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r2, [r6, #1292]
	mov	ip, #2208
	mov	r1, r9
	ldr	r3, [r8, #48]
	ldr	r0, [r6, #1304]
	mul	r2, ip, r2
	blx	r3
	ldr	r1, [r6, #1292]
	ldr	lr, [r6, #1288]
	ldr	r0, [r4, #3440]
.L3759:
	add	r3, r5, #16384
	movw	r2, #4060
	ldr	ip, [r8, #48]
	str	r1, [r3, #1236]
	mov	r1, #0
	ldr	r3, [r6, #1284]
	mov	r7, r1
	str	lr, [r6, #1344]
	mul	r2, r2, r3
	blx	ip
	mov	r2, #40
	mov	r3, #17
	str	r7, [r4, #3464]
	str	r7, [r4, #3468]
	mov	r0, r5
	str	r7, [r4, #3472]
	str	r7, [r4, #3476]
	str	r7, [r4, #3480]
	str	r7, [r4, #3484]
	str	r7, [r4, #3488]
	str	r7, [r4, #3492]
	str	r7, [r4, #3456]
	str	r7, [r4, #2088]
	str	r7, [r4, #2092]
	str	r7, [r4, #2096]
	str	r7, [r4, #2100]
	str	r7, [r4, #2104]
	str	r7, [r4, #2068]
	str	r7, [r4, #2076]
	str	r7, [r4, #3524]
	str	r7, [r4, #2080]
	str	r7, [r4, #2084]
	str	r2, [r4, #2060]
	str	r3, [r4, #2064]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r4, #3520]
	beq	.L3766
	mov	r1, r7
	mov	r0, r5
	bl	ClearAll
	mov	r0, #1
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3764:
	ldr	r3, [r7, #684]
	add	r6, r5, #12288
	str	r3, [r6, #1288]
	ldr	r3, [r7, #688]
	str	r3, [r6, #1292]
	ldr	r3, [r7, #676]
	str	r3, [r6, #1284]
	b	.L3756
.L3765:
	movw	r3, #13185
	ldr	r2, .L3767+4
	ldr	r1, .L3767+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3766:
	mov	r0, r7
	ldr	r1, .L3767+12
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3768:
	.align	2
.L3767:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1+288
	.word	.LC393
	.word	.LC394
	UNWIND(.fnend)
	.size	H264DEC_Init, .-H264DEC_Init
	.align	2
	.global	InitPic
	.type	InitPic, %function
InitPic:
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
	UNWIND(.pad #36)
	sub	sp, sp, #36
	add	r10, r0, #12288
	add	r8, r0, #20480
	mov	r5, r0
	ldr	r0, [r10, #1304]
	mov	r9, #2208
	ldr	ip, [r8, #220]
	add	r6, r5, #57344
	ldr	r3, [r10, #1300]
	mov	r1, #4000
	ldrb	r2, [r6, #3976]	@ zero_extendqisi2
	add	r4, r5, #61440
	mla	r9, r9, ip, r0
	cmp	r2, #0
	ldr	r2, [r9, #28]
	mla	r3, r1, r2, r3
	str	r3, [fp, #-56]
	beq	.L3770
	ldr	r3, [r4, #560]
	cmp	r3, #0
	beq	.L3771
	ldrb	r7, [r3, #1]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L3901
.L3772:
	mov	r3, #0
	strb	r3, [r6, #3976]
.L3770:
	sub	r1, fp, #48
	mov	r0, r5
	bl	GetReRangeFlag
	ldr	r3, [fp, #-56]
	ldr	r2, [r10, #1344]
	ldr	r3, [r3, #36]
	cmp	r2, r3
	mov	r7, r0
	beq	.L3902
.L3773:
	ldr	r1, [fp, #-56]
	add	r0, r5, #13568
	ldr	r3, .L3917
	mov	r2, #0
	add	r0, r0, #28
	strb	r2, [r1, #24]
	mov	r2, #4000
	ldr	r3, [r3, #56]
	blx	r3
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ldr	r3, [r5]
	beq	.L3775
.L3913:
	ldr	r2, [r3, #708]
	cmp	r2, #0
	bne	.L3776
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L3903
.L3776:
	ldr	r3, [r4, #3480]
	cmp	r7, #0
	add	r3, r3, #1
	str	r3, [r4, #3480]
	bne	.L3787
	ldr	r3, [r5]
	ldr	r3, [r3, #872]
	cmp	r3, #1
	beq	.L3787
	mov	r0, r5
	bl	FlushDPB
	cmp	r0, #0
	bne	.L3904
	mov	r0, r5
	bl	InitDPB
	cmp	r0, #0
	bne	.L3839
.L3792:
	ldr	r3, [r5]
	ldr	r3, [r3, #872]
	cmp	r3, #1
	beq	.L3795
.L3895:
	add	r7, r5, #16384
.L3786:
	ldr	r2, [r7, #1236]
	ldr	r3, [r9, #24]
	cmp	r2, r3
	bne	.L3798
	ldrb	r3, [r9, #20]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3798
.L3799:
	ldr	r3, [r7, #3444]
	ldr	r2, [r10, #3504]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r8, #224]
	strne	r3, [r4, #1408]
	ldr	r3, [r4, #3448]
	cmp	r3, #2
	beq	.L3801
	ldr	ip, [r5]
	ldr	r3, [ip, #12]
	str	ip, [fp, #-60]
	sub	r3, r3, #2
	cmp	r3, #1
	bls	.L3801
	ldr	r3, [r8, #228]
	ldr	r9, [r8, #224]
	cmp	r3, r9
	str	r3, [fp, #-64]
	beq	.L3802
	mov	r1, #1
	add	r2, r2, #4
	mov	r2, r1, asl r2
	add	r0, r9, r1
	str	r2, [fp, #-68]
	mov	r1, r2
	bl	__aeabi_uidivmod
	ldr	r3, [fp, #-64]
	cmp	r3, r1
	beq	.L3840
	ldr	ip, [fp, #-60]
	ldr	r1, [ip, #600]
	cmp	r1, #0
	bne	.L3803
	ldr	r1, [ip, #640]
	ldr	r2, [fp, #-68]
	cmp	r1, #1
	beq	.L3905
.L3804:
	cmp	r3, r9
	bls	.L3805
	ldr	r1, [r7, #484]
	rsb	r9, r9, r3
	cmp	r1, r9
	bcs	.L3803
	ldrb	r1, [r8, #208]	@ zero_extendqisi2
	cmp	r1, #2
	beq	.L3806
.L3811:
	ldr	r3, [r4, #3516]
	cmp	r3, #0
	bne	.L3803
	mov	r0, r5
	bl	H264_ClearCurrPic
	ldr	r3, .L3917+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3812
	mov	r0, r5
	bl	ClearDPB
.L3812:
	ldr	ip, [r7, #484]
	movw	r2, #6957
.L3896:
	ldr	r1, [r8, #228]
	mov	r0, #0
	ldr	r3, [r8, #224]
	str	ip, [sp]
	rsb	r3, r3, r1
	ldr	r1, .L3917+8
	bl	dprint_vfmw
	mvn	r0, #0
.L3889:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3798:
	ldr	r3, .L3917
	add	r0, r5, #17408
	mov	r2, #0
	mov	r1, r9
	strb	r2, [r9, #20]
	add	r0, r0, #188
	ldr	r3, [r3, #56]
	mov	r2, #2208
	blx	r3
	b	.L3799
.L3787:
	ldr	r1, .L3917+12
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r4, #3560]
	cmp	r3, #1
	beq	.L3906
.L3789:
	mov	r0, r5
	bl	InitDPB
	cmp	r0, #0
	bne	.L3839
	cmp	r7, #0
	beq	.L3792
.L3795:
	add	r7, r5, #16384
	add	r3, r5, #63488
	add	r3, r3, #12
	mov	r0, r5
	ldr	ip, [r7, #484]
	str	ip, [r4, #2064]
	ldr	r2, [r7, #464]
	ldrb	r1, [r10, #1326]	@ zero_extendqisi2
	add	r2, r2, #1
	ldr	lr, [r7, #460]
	rsb	r1, r1, #2
	str	ip, [sp]
	mov	r2, r2, asl #4
	add	ip, lr, #1
	mul	r2, r1, r2
	mov	ip, ip, asl #4
	str	ip, [fp, #-60]
	mov	r1, ip
	str	r2, [fp, #-64]
	bl	H264_ArrangeVahbMem
	ldr	ip, [fp, #-60]
	cmp	r0, #1
	beq	.L3907
.L3894:
	ldr	r3, [r5]
	ldr	r3, [r3, #872]
	cmp	r3, #1
	mvneq	r0, #1
	beq	.L3889
	mov	r4, #0
	ldr	r1, .L3917+16
	str	r4, [r10, #1276]
	mov	r0, r4
	str	r4, [r10, #1280]
	bl	dprint_vfmw
	mov	r1, r4
	mov	r0, r5
	bl	ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3840:
	mov	r9, r3
.L3802:
	ldr	r3, [r8, #240]
	mov	r0, r5
	cmp	r3, #0
	strne	r9, [r8, #224]
	str	r9, [r7, #3484]
	bl	DecPOC
	mov	r1, #0
	mov	r0, r5
	bl	AllocFrameStore
	cmp	r0, #0
	bne	.L3908
	strb	r0, [r6, #3983]
	mov	r1, #1
	strb	r1, [r6, #3976]
	mvn	ip, #0
	ldrb	r3, [r8, #211]	@ zero_extendqisi2
	strb	r3, [r6, #3982]
	ldr	r2, [r8, #228]
	str	r2, [r4, #568]
	ldr	r3, [r8, #240]
	str	r2, [fp, #-60]
	str	r3, [r4, #576]
	ldr	lr, [r7, #3464]
	str	r3, [fp, #-64]
	str	lr, [r4, #580]
	ldr	lr, [r7, #3460]
	str	lr, [r4, #584]
	ldr	lr, [r7, #3452]
	str	lr, [r4, #588]
	ldr	lr, [r7, #3456]
	str	lr, [r4, #592]
	strb	r0, [r6, #3978]
	strb	r0, [r6, #3981]
	strb	r0, [r6, #3980]
	str	ip, [r4, #624]
	ldrb	ip, [r8, #209]	@ zero_extendqisi2
	cmp	ip, #0
	strneb	r1, [r8, #209]
	ldrb	r0, [r10, #1326]	@ zero_extendqisi2
	ldr	lr, [r7, #464]
	movne	ip, r1
	rsb	r9, r0, #2
	movne	r1, #2
	str	ip, [fp, #-68]
	mla	r9, lr, r9, r9
	mov	r0, r9
	bl	__aeabi_uidiv
	str	r9, [r4, #616]
	ldr	ip, [fp, #-68]
	ldr	r2, [fp, #-60]
	cmp	ip, #0
	ldr	r3, [fp, #-64]
	str	r0, [r4, #612]
	ldr	r1, [r7, #460]
	add	r1, r1, #1
	str	r1, [r4, #608]
	mul	r1, r1, r0
	movne	r0, #0
	str	r1, [r4, #620]
	ldrb	r1, [r7, #1212]	@ zero_extendqisi2
	strb	r1, [r6, #3984]
	movne	r1, r0
	bne	.L3824
	ldrb	r1, [r10, #1327]	@ zero_extendqisi2
	cmp	r1, #0
	movne	r0, #1
	movne	r1, r0
	beq	.L3909
.L3824:
	strb	r1, [r6, #3985]
	add	r1, r5, #24576
	str	r0, [r4, #3436]
	cmp	r3, #0
	strne	r2, [r8, #224]
	movw	r3, #2004
	ldr	lr, [r1, #1812]
	add	r2, r5, #61952
	ldr	r1, .L3917+20
	mov	r0, #29
	mov	ip, r2
	add	r2, r2, #32
	mla	r3, r3, lr, r5
	movw	lr, #61984
	add	r3, r3, #22272
	add	r3, r3, #108
	str	r3, [r4, #564]
	ldr	r3, [r5]
	ldrd	r8, [r3, #56]
	strd	r8, [r2, #-8]
	ldrd	r8, [r3, #72]
	strd	r8, [r5, lr]
	ldrd	r8, [r3, #88]
	ldr	lr, [fp, #-56]
	strd	r8, [ip, #40]
	mvn	r8, #0
	ldr	ip, [r3, #104]
	mvn	r9, #0
	str	ip, [r6, #4000]
	ldr	ip, [r3, #108]
	str	ip, [r6, #4004]
	ldr	ip, [r3, #112]
	str	ip, [r6, #4008]
	ldr	ip, [r3, #128]
	str	ip, [r6, #4012]
	ldr	ip, [lr, #44]
	str	ip, [r4, #96]
	ldr	ip, [lr, #48]
	str	ip, [r4, #100]
	strd	r8, [r3, #56]
	ldrd	r2, [r2, #-8]
	bl	dprint_vfmw
	movw	r3, #61984
	ldrd	r2, [r3, r5]
	mov	r0, #29
	ldr	r1, .L3917+24
	bl	dprint_vfmw
	ldr	r3, [r7, #460]
	mov	r2, #4
	ldr	r8, .L3917
	add	r3, r3, #1
	add	r0, r5, #61440
	mov	r1, #0
	add	r0, r0, #20
	mov	r3, r3, asl r2
	str	r3, [r4, #24]
	ldrb	ip, [r10, #1326]	@ zero_extendqisi2
	ldr	lr, [r7, #464]
	rsb	r3, ip, #2
	ldr	ip, [r8, #48]
	mla	r3, lr, r3, r3
	mov	r3, r3, asl r2
	str	r3, [r4, #28]
	ldr	r9, [r10, #1348]
	ldr	r8, [r7, #528]
	subs	r9, r9, #1
	and	r8, r8, #7
	movne	r9, #1
	blx	ip
	ldrb	r2, [r4, #20]	@ zero_extendqisi2
	mov	ip, #2
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	add	r0, r5, #61184
	and	r2, r2, #252
	mov	r1, r8
	bfi	r2, r9, #2, #3
	bfi	r3, ip, #0, #2
	strb	r2, [r4, #20]
	and	r3, r3, #243
	ldr	lr, [r7, #532]
	uxtb	r2, r2
	bfi	r3, ip, #4, #2
	strb	r3, [r4, #21]
	bfi	r2, lr, #5, #3
	strb	r2, [r4, #20]
	ldr	r3, [r4, #20]
	add	r0, r0, #152
	bfi	r3, r8, #14, #3
	str	r3, [r4, #20]
	bl	SetAspectRatio
	ldr	r3, [r4, #3480]
	ldr	r2, [r4, #560]
	str	r3, [r4, #84]
	ldrb	r3, [r6, #3979]	@ zero_extendqisi2
	adds	r3, r3, #0
	movne	r3, #1
	cmp	r2, #0
	str	r3, [r4, #8]
	beq	.L3910
	ldr	r3, [r4, #20]
	ldr	r1, [fp, #-56]
	str	r3, [r2, #132]
	ldr	r3, [r4, #560]
	ldr	r2, [r4, #8]
	str	r2, [r3, #120]
	ldr	r2, [r6, #3996]
	ldr	r3, [r4, #560]
	str	r2, [r3, #12]
	ldr	r2, [r6, #3992]
	ldr	r3, [r4, #560]
	str	r2, [r3, #8]
	ldr	r3, [r4, #560]
	ldr	r2, [r4, #24]
	str	r2, [r3, #136]
	ldr	r3, [r4, #560]
	ldr	r2, [r4, #28]
	str	r2, [r3, #140]
	ldr	r3, [r1, #3284]
	ldr	r2, [r4, #560]
	str	r3, [r2, #152]
	str	r3, [r4, #40]
	ldr	r2, [r4, #560]
	ldr	r3, [r1, #3288]
	str	r3, [r2, #156]
	str	r3, [r4, #44]
	ldr	r2, [r4, #560]
	ldr	r3, [r1, #3276]
	str	r3, [r2, #144]
	str	r3, [r4, #32]
	ldr	r2, [r4, #560]
	ldr	r3, [r1, #3280]
	str	r3, [r2, #148]
	str	r3, [r4, #36]
	ldr	r3, [r4, #560]
	ldr	r0, [r4, #3520]
	ldr	r1, [r3, #672]
	bl	FSP_GetDispPhyFs
	cmp	r0, #0
	beq	.L3827
	ldr	r3, [r4, #8]
	mov	r1, #0
	ldr	r2, [r0, #8]
	subs	r3, r3, r1
	ldr	r0, [r4, #3520]
	movne	r3, #1
	bl	FSP_SetStoreType
.L3827:
	add	ip, r5, #61696
	add	lr, r5, #61952
	add	r6, r5, #63488
	ldr	r3, [r4, #2088]
	add	ip, ip, #232
	add	lr, lr, #8
	add	r6, r6, #44
	mov	r7, #0
.L3831:
	ldrd	r0, [ip, #8]!
	orrs	r2, r0, r1
	bne	.L3828
	cmp	r3, #0
	beq	.L3828
	ldr	r2, [r4, #2092]
	subs	r3, r3, #1
	stmia	ip, {r2, r7}
	beq	.L3829
	mov	r1, r6
	mov	r2, #0
.L3830:
	add	r2, r2, #1
	ldr	r0, [r1, #4]!
	cmp	r2, r3
	str	r0, [r1, #-4]
	bne	.L3830
.L3829:
	add	r2, r3, #15872
	add	r2, r2, #10
	add	r2, r5, r2, lsl #2
	str	r7, [r2, #4]
	str	r3, [r4, #2088]
.L3828:
	cmp	ip, lr
	bne	.L3831
	cmp	r3, #0
	beq	.L3833
	mov	r7, r3
	ble	.L3833
	add	r6, r3, #15872
	mov	r8, #0
	add	r6, r6, #11
	add	r6, r5, r6, lsl #2
.L3834:
	ldr	r1, [r6, #-4]!
	sub	r7, r7, #1
	ldr	r0, [r4, #3520]
	bl	FreeUsdByDec
	cmp	r7, #0
	str	r8, [r6]
	bne	.L3834
.L3833:
	mov	r0, r5
	mov	r5, #0
	str	r5, [r4, #2088]
	str	r5, [r4, #596]
	bl	CalcPicNum
	mov	r0, r5
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3806:
	cmp	r3, #0
	mov	r0, r5
	subeq	r3, r2, #1
	subne	r3, r3, #1
	str	r3, [r8, #224]
	bl	FlushDPB
	subs	r3, r0, #0
	bne	.L3911
	ldrb	r3, [r8, #208]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3811
.L3803:
	mov	r0, r5
	bl	DecGap
	cmp	r0, #0
	bne	.L3912
.L3801:
	ldr	r9, [r8, #228]
	b	.L3802
.L3902:
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3773
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ldr	r3, [r5]
	bne	.L3913
.L3775:
	ldr	r3, [r3, #872]
	cmp	r3, #1
	bne	.L3895
	b	.L3776
.L3909:
	mov	r0, ip
	b	.L3824
.L3903:
	ldr	r3, [r4, #3480]
	cmp	r7, #0
	add	r3, r3, #1
	str	r3, [r4, #3480]
	beq	.L3777
	mov	r0, r5
	str	r2, [fp, #-60]
	bl	FlushDPB
	ldr	r2, [fp, #-60]
	subs	r3, r0, #0
	bne	.L3914
	mov	r0, r5
	bl	InitDPB
	subs	r3, r0, #0
	bne	.L3835
	add	r7, r5, #16384
	ldrb	r3, [r10, #1326]	@ zero_extendqisi2
	ldr	r0, [r10, #1276]
	ldr	r1, [r7, #464]
	rsb	r2, r3, #2
	ldr	ip, [r7, #460]
	cmp	r0, #0
	add	r3, r1, #1
	add	ip, ip, #1
	mov	r3, r3, asl #4
	mov	ip, ip, asl #4
	mul	r3, r2, r3
	str	r3, [fp, #-60]
	bne	.L3784
	ldr	r0, [r7, #484]
	str	r0, [r4, #2064]
	ldr	r3, [r5]
	ldr	r1, [r3, #668]
	cmp	r1, ip
	bcc	.L3780
	ldr	r2, [r3, #672]
	ldr	lr, [fp, #-60]
	cmp	r2, lr
	str	r2, [fp, #-64]
	bcc	.L3780
	add	lr, r5, #24576
	ldr	r2, [r3, #692]
	ldr	lr, [lr, #2144]
	cmp	r2, lr
	bcc	.L3915
	ldr	lr, [r3, #696]
	str	ip, [fp, #-68]
	cmp	lr, #0
	moveq	r0, #1
	streq	r0, [r4, #2064]
	ldreq	r1, [r3, #668]
	ldreq	r3, [r3, #672]
	str	r0, [sp]
	mov	r0, r5
	streq	r3, [fp, #-64]
	add	r3, r5, #63488
	ldr	r2, [fp, #-64]
	add	r3, r3, #12
	bl	H264_ArrangeVahbMem
	ldr	ip, [fp, #-68]
	cmp	r0, #1
	bne	.L3894
	b	.L3784
.L3901:
	ldr	r1, [r3, #672]
	mov	r2, #1
	ldr	r0, [r4, #3520]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #560]
	strb	r7, [r3, #1]
	ldr	r3, [r4, #560]
	strb	r7, [r3, #4]
	b	.L3772
.L3907:
	ldr	r3, [fp, #-64]
	mov	ip, ip, lsr #4
	str	ip, [r10, #1276]
	mov	r3, r3, lsr #4
	str	r3, [r10, #1280]
	b	.L3786
.L3906:
	mov	r0, r5
	bl	GetBackPicFromVOQueue
	b	.L3789
.L3805:
	rsb	r1, r9, r3
	ldr	r0, [r7, #484]
	add	r1, r1, r2
	cmp	r0, r1
	bcs	.L3803
	ldrb	r1, [r8, #208]	@ zero_extendqisi2
	cmp	r1, #2
	beq	.L3813
.L3818:
	ldr	r3, [r4, #3516]
	cmp	r3, #0
	bne	.L3803
	mov	r0, r5
	bl	H264_ClearCurrPic
	ldr	r3, .L3917+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3819
	mov	r0, r5
	bl	ClearDPB
.L3819:
	ldr	ip, [r7, #484]
	movw	r2, #6990
	b	.L3896
.L3777:
	mov	r0, r5
	bl	InitDPB
	subs	r3, r0, #0
	bne	.L3835
	add	r7, r5, #16384
	ldrb	r3, [r10, #1326]	@ zero_extendqisi2
	ldr	r1, [r7, #464]
	rsb	r2, r3, #2
	ldr	ip, [r7, #460]
	add	r3, r1, #1
	add	ip, ip, #1
	mov	r3, r3, asl #4
	mov	ip, ip, asl #4
	mul	r3, r2, r3
	str	r3, [fp, #-60]
.L3784:
	ldr	r3, [fp, #-60]
	mov	ip, ip, lsr #4
	str	ip, [r10, #1276]
	mov	r3, r3, lsr #4
	str	r3, [r10, #1280]
	b	.L3786
.L3771:
	movw	r3, #6691
	ldr	r2, .L3917+28
	ldr	r1, .L3917+32
	mov	r0, #22
	bl	dprint_vfmw
	b	.L3772
.L3912:
	movw	r2, #7002
	ldr	r1, .L3917+36
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3905:
	ldr	r1, [ip, #636]
	cmp	r1, #0
	bne	.L3804
	ldr	r1, [ip, #644]
	cmp	r1, #0
	bne	.L3804
	ldr	r1, [ip, #604]
	add	r1, r1, #1024
	cmp	r1, #2048
	bhi	.L3803
	b	.L3804
.L3908:
	movw	r2, #7026
	ldr	r1, .L3917+40
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3839:
	mov	r3, r0
	movw	r2, #6860
	ldr	r1, .L3917+44
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3813:
	cmp	r3, #0
	mov	r0, r5
	subeq	r3, r2, #1
	subne	r3, r3, #1
	str	r3, [r8, #224]
	bl	FlushDPB
	subs	r3, r0, #0
	bne	.L3916
	ldrb	r3, [r8, #208]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3803
	b	.L3818
.L3910:
	movw	r3, #7109
	ldr	r2, .L3917+28
	ldr	r1, .L3917+48
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3904:
	mov	r3, r0
	movw	r2, #6851
	mov	r0, r7
	ldr	r1, .L3917+52
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3780:
	ldr	r1, .L3917+56
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3914:
	mov	r0, r2
	ldr	r1, .L3917+52
	movw	r2, #6725
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3835:
	movw	r2, #6734
	ldr	r1, .L3917+44
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3916:
	movw	r2, #6974
	ldr	r1, .L3917+52
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3911:
	movw	r2, #6941
	ldr	r1, .L3917+52
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3915:
	ldr	r1, .L3917+60
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3889
.L3918:
	.align	2
.L3917:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_apple_airplay_mirrorinig_flag
	.word	.LC401
	.word	.LC400
	.word	.LC399
	.word	.LC404
	.word	.LC405
	.word	.LANCHOR1+304
	.word	.LC395
	.word	.LC402
	.word	.LC403
	.word	.LC396
	.word	.LC406
	.word	.LC356
	.word	.LC397
	.word	.LC398
	UNWIND(.fnend)
	.size	InitPic, .-InitPic
	.align	2
	.global	H264_DecSlice
	.type	H264_DecSlice, %function
H264_DecSlice:
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
	add	r7, r0, #61440
	mov	r5, r0
	ldr	r1, .L3978
	ldr	r2, [r7, #3464]
	mov	r0, #22
	add	r6, r5, #20480
	sub	r2, r2, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #368]
	ldr	r1, .L3978+4
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r6, #211]
	ldr	r3, [r3, #76]
	str	r3, [r6, #240]
	ldr	r3, [r7, #3520]
	ldr	r3, [r1, r3, asl #2]
	ldrsb	r1, [r3, #44]
	cmp	r1, #1
	beq	.L3971
.L3920:
	mov	r0, r5
	bl	ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L3970
	mov	r0, r5
	bl	ProcessSliceHeaderSecondPart
	cmp	r0, #0
	bne	.L3970
	ldr	r2, [r7, #3444]
	cmp	r2, #0
	moveq	r3, r2
	beq	.L3927
	add	r9, r5, #62720
	mov	r3, r0
	add	r9, r9, #164
	mov	r1, r0
	mov	r8, r0
	b	.L3935
.L3972:
	cmp	r4, r1
	add	r3, ip, r3
	rsbhi	r0, r0, r10
	rsbhi	r1, r1, r4
	addhi	r0, r1, r0
	movls	r0, r10
	add	r3, r3, r0
.L3933:
	cmp	lr, #0
	add	r8, r8, #1
	moveq	r1, r4
	moveq	r0, r10
	movne	r1, lr
	movne	r0, ip
	cmp	r8, r2
	beq	.L3927
.L3935:
	ldr	ip, [r9, #4]!
	ldr	r4, [ip, #8]
	ldr	lr, [ip, #36]
	cmp	r4, #0
	ldrne	r10, [ip, #12]
	moveq	r10, r4
	cmp	lr, #0
	ldrne	ip, [ip, #40]
	moveq	ip, lr
	cmp	r1, #0
	bne	.L3972
	add	r3, r10, r3
	add	r3, r3, ip
	b	.L3933
.L3927:
	ldr	ip, [r7, #612]
	movw	r0, #1620
	ldr	r1, [r7, #608]
	str	r3, [r7, #3504]
	mul	r1, r1, ip
	cmp	r1, r0
	movgt	r1, r1, asl #8
	ble	.L3973
.L3937:
	add	r4, r5, #12288
	ldr	r0, [r4, #1284]
	cmp	r0, r2
	bls	.L3938
	cmp	r1, r3
	bcc	.L3938
	ldrb	r3, [r6, #213]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3974
.L3941:
	mov	r0, r5
	bl	PicTypeStatistic
	mov	r0, r5
	bl	DecList
	cmp	r0, #0
	bne	.L3975
	mov	r0, r5
	bl	IsRefListWrong
	subs	r4, r0, #0
	bne	.L3976
	mov	r0, r5
	bl	ExitSlice
	mov	r0, r5
	bl	CalcStreamBits
	mov	r0, r5
	bl	WriteSliceMsg
	ldr	r3, [r7, #3500]
	mov	r0, r4
	mov	r2, #1
	add	r3, r3, r2
	str	r2, [r7, #2068]
	str	r3, [r7, #3500]
.L3924:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3973:
	mov	r0, r1, asl #9
	sub	r1, r0, r1, asl #7
	cmp	r1, #16384
	movlt	r1, #16384
	b	.L3937
.L3974:
	ldr	r1, .L3978+8
	mov	r0, #2
	bl	dprint_vfmw
	ldrb	r3, [r6, #211]	@ zero_extendqisi2
	add	r2, r5, #57344
	mov	r1, #0
	cmp	r3, #5
	ldr	r3, [r7, #3484]
	str	r1, [r7, #3500]
	mov	r0, r5
	streq	r3, [r7, #3496]
	add	r3, r3, #1
	str	r3, [r7, #3484]
	ldrb	r3, [r2, #3979]	@ zero_extendqisi2
	cmp	r3, r1
	ldreq	r3, [r7, #3488]
	ldrne	r3, [r7, #3492]
	addeq	r3, r3, #1
	addne	r3, r3, #1
	streq	r3, [r7, #3488]
	strne	r3, [r7, #3492]
	bl	InitPic
	cmn	r0, #2
	beq	.L3924
	cmp	r0, #0
	bne	.L3977
	mov	r0, r5
	bl	WritePicMsg
	b	.L3941
.L3971:
	ldr	r1, [r3, #176]
	cmp	r1, #0
	bne	.L3920
	ldr	r3, [r3, #180]
	cmp	r3, #1
	cmpeq	r2, #5
	bne	.L3920
	ldr	r1, [r5]
	mvn	r3, #0
	mvn	r2, #0
	ldrd	r0, [r1, #56]
	cmp	r1, r3
	cmpeq	r0, r2
	beq	.L3920
	add	r2, r5, #26368
	movw	ip, #26512
	add	r3, r2, #112
	strd	r0, [r2, #136]
	ldrd	r2, [r3, #-8]
	strd	r2, [r5, ip]
	b	.L3920
.L3970:
	ldr	r1, .L3978+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L3978+16
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3968
	sub	r2, fp, #44
	mvn	r1, #0
	ldr	r0, [r7, #3520]
	mov	r3, #4
	str	r1, [r2, #-8]!
	mov	r1, #100
	blx	ip
.L3968:
	mov	r0, r5
	bl	ClearCurrSlice
	mvn	r0, #0
	b	.L3924
.L3938:
	str	r1, [sp]
	mov	r0, #0
	ldr	r1, .L3978+20
	bl	dprint_vfmw
	ldr	r2, [r4, #1284]
	ldr	r3, [r7, #3444]
	cmp	r3, r2
	bcc	.L3940
	ldr	r1, .L3978+16
	ldr	ip, [r1]
	cmp	ip, #0
	beq	.L3940
	str	r3, [fp, #-52]
	mov	r1, #108
	str	r2, [fp, #-48]
	mov	r3, #8
	sub	r2, fp, #52
	ldr	r0, [r7, #3520]
	blx	ip
.L3940:
	ldr	r1, .L3978+24
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	bl	H264_ClearCurrPic
	mvn	r0, #0
	b	.L3924
.L3975:
	mov	r2, r0
	ldr	r1, .L3978+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3924
.L3976:
	ldr	r1, .L3978+32
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3968
.L3977:
	ldr	r1, .L3978+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3924
.L3979:
	.align	2
.L3978:
	.word	.LC346
	.word	s_pstVfmwChan
	.word	.LC409
	.word	.LC347
	.word	g_event_report
	.word	.LC407
	.word	.LC408
	.word	.LC411
	.word	.LC412
	.word	.LC410
	UNWIND(.fnend)
	.size	H264_DecSlice, .-H264_DecSlice
	.align	2
	.global	H264_DecOneNal
	.type	H264_DecOneNal, %function
H264_DecOneNal:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
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
	mov	r5, r1
	ldr	r1, [r0, #368]
	add	r4, r0, #61440
	mov	r6, r0
	ldr	r3, [r1, #68]
	cmp	r3, #0
	movne	ip, r1
	movne	r2, #0
	ldrne	r3, [r4, #3504]
	beq	.L3985
.L3984:
	ldr	lr, [ip, #12]
	add	r2, r2, #1
	add	ip, ip, #28
	add	r3, r3, lr
	str	r3, [r4, #3504]
	ldr	lr, [r1, #68]
	cmp	lr, r2
	bhi	.L3984
.L3985:
	mov	r2, #0
	ldr	r3, .L4156
	strb	r2, [r1]
	ldr	r2, [r4, #3520]
	ldr	r3, [r3, r2, asl #2]
	ldrsb	r2, [r3, #44]
	cmp	r2, #1
	beq	.L4148
.L3983:
	add	r8, r6, #13504
	mov	r1, #32
	add	r8, r8, #24
	mov	r0, r8
	bl	BsGet
	ldr	r2, [r6, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #32
	str	r3, [r2, #64]
	mov	r7, r0
.L3986:
	ldr	lr, [r6, #368]
	and	r0, r7, #31
	ubfx	r2, r7, #5, #2
	ubfx	r3, r7, #7, #1
	mov	ip, #0
	ldr	r1, .L4156+4
	strb	r0, [lr, #2]
	mov	r0, #22
	ldr	lr, [r6, #368]
	str	r2, [lr, #76]
	ldr	r2, [r6, #368]
	str	r3, [r2, #80]
	str	ip, [r4, #3460]
	ldr	r3, [r6, #368]
	ldr	r2, [r4, #3464]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	bl	dprint_vfmw
	ldr	r1, [r4, #3464]
	movw	r3, #371
	cmp	r1, r3
	beq	.L4149
.L3987:
	add	r1, r1, #1
	str	r1, [r4, #3464]
	ldr	r3, [r6, #368]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #20
	beq	.L4150
.L3988:
	sub	r3, r2, #1
	cmp	r3, #29
	ldrls	pc, [pc, r3, asl #2]
	b	.L3996
.L3998:
	.word	.L3997
	.word	.L3996
	.word	.L3996
	.word	.L3996
	.word	.L3997
	.word	.L3999
	.word	.L4000
	.word	.L4001
	.word	.L4002
	.word	.L4003
	.word	.L4004
	.word	.L4005
	.word	.L4006
	.word	.L3996
	.word	.L4000
	.word	.L3996
	.word	.L3996
	.word	.L3996
	.word	.L4007
	.word	.L3997
	.word	.L3996
	.word	.L3996
	.word	.L3996
	.word	.L3996
	.word	.L3996
	.word	.L3996
	.word	.L3996
	.word	.L3996
	.word	.L3996
	.word	.L4008
.L4148:
	ldr	r2, [r3, #176]
	cmp	r2, #0
	bne	.L3983
	ldr	r2, [r3, #180]
	cmp	r2, #1
	bne	.L3983
	ldr	r3, [r3, #172]
	cmp	r5, #0
	cmpeq	r3, #1
	bne	.L3983
	add	r8, r6, #13504
	mov	r1, #40
	add	r8, r8, #24
	mov	r0, r8
	bl	BsSkip
	mov	r0, r8
	mov	r1, #8
	bl	BsGet
	ldr	r2, [r6, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #48
	str	r3, [r2, #64]
	mov	r7, r0
	b	.L3986
.L4008:
	mov	r2, #30
	ldr	r1, .L4156+8
	mov	r0, #22
	bl	dprint_vfmw
	cmp	r5, #0
	bne	.L4024
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L4024
	ldr	r0, [r4, #3520]
	bl	ReleaseNAL
	str	r5, [r6, #368]
.L4024:
	mov	r1, #32
	mov	r0, r8
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	mov	r0, r8
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r5, r3
	bne	.L4135
	ldr	r5, .L4156+12
	ldr	ip, [r5]
	cmp	ip, #0
	beq	.L4025
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #3520]
	blx	ip
.L4025:
	mov	r7, #0
	mov	r0, r6
	str	r7, [r6, #364]
	bl	DecVDM
	cmp	r0, r7
	beq	.L4135
.L4146:
	ldr	ip, [r5]
	cmp	ip, r7
	beq	.L4129
.L4133:
	ldr	r0, [r4, #3520]
	mov	r3, r7
	mov	r2, r7
	mov	r1, #113
	blx	ip
.L4129:
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3997:
	ldr	r3, [r4, #3476]
	mov	r0, #22
	ldr	r1, .L4156+16
	add	r5, r6, #20480
	bl	dprint_vfmw
	ldr	r3, [r6, #368]
	mov	r0, r6
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r5, #211]
	ldr	r2, [r3, #76]
	str	r2, [r5, #240]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	strb	r3, [r5, #216]
	bl	SliceCheck
	subs	r7, r0, #0
	bne	.L4151
	mov	r0, r6
	bl	H264_DecSlice
	cmn	r0, #2
	beq	.L4127
	cmp	r0, #0
	beq	.L4011
	ldr	r3, .L4156+12
	ldr	ip, [r3]
	cmp	ip, #0
	bne	.L4133
	b	.L4129
.L3999:
	ldr	r1, .L4156+20
	mov	r2, #6
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r6
	bl	H264_DecSEI
	ldr	r1, [r6, #368]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4019
	ldr	r0, [r4, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r6, #368]
.L4019:
	cmp	r5, #0
	bne	.L4152
.L4135:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4000:
	ldr	r1, .L4156+24
	mov	r0, #22
	ldr	r3, [r4, #3468]
	bl	dprint_vfmw
	mov	r0, r6
	bl	H264_DecSPS
	ldr	r1, [r6, #368]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4017
	ldr	r0, [r4, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r6, #368]
.L4017:
	cmp	r5, #0
	bne	.L4153
	ldr	r3, [r4, #3468]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #3468]
	b	.L4127
.L4004:
	mov	r2, #11
	ldr	r1, .L4156+28
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r6
	bl	H264_IsEosNal
	cmp	r0, #1
	beq	.L4154
.L4139:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L4135
	ldr	r0, [r4, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r6, #368]
.L4127:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4005:
	ldr	r1, .L4156+32
	mov	r2, #12
.L4141:
	mov	r0, #22
	bl	dprint_vfmw
	b	.L4139
.L4006:
	mov	r2, #13
	ldr	r1, .L4156+36
	b	.L4141
.L4007:
	mov	r2, #19
	ldr	r1, .L4156+40
	b	.L4141
.L4002:
	mov	r2, #9
	ldr	r1, .L4156+44
	b	.L4141
.L4003:
	mov	r2, #10
	ldr	r1, .L4156+48
	b	.L4141
.L4001:
	ldr	r1, .L4156+52
	mov	r2, #8
	ldr	r3, [r4, #3472]
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r6
	bl	H264_DecPPS
	ldr	r1, [r6, #368]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4015
	ldr	r0, [r4, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r6, #368]
.L4015:
	cmp	r5, #0
	bne	.L4155
	ldr	r3, [r4, #3472]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #3472]
	b	.L4127
.L3996:
	mov	r3, r7
	ldr	r1, .L4156+56
	mov	r0, #22
	ldr	r5, .L4156+12
	bl	dprint_vfmw
	cmp	r7, #256
	beq	.L4026
	ldr	ip, [r5]
	cmp	ip, #0
	beq	.L4027
	mov	r3, #0
	mov	r1, #102
	mov	r2, r3
	ldr	r0, [r4, #3520]
	blx	ip
.L4026:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L4028
.L4029:
	ldr	r0, [r4, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r6, #368]
.L4028:
	ldr	ip, [r5]
	cmp	ip, #0
	beq	.L4135
.L4134:
	mov	r3, #0
	ldr	r0, [r4, #3520]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	b	.L4135
.L4149:
	ldr	r1, .L4156+60
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r1, [r4, #3464]
	b	.L3987
.L4150:
	mov	r1, #24
	mov	r0, r8
	bl	BsGet
	ldr	r3, [r6, #368]
	ubfx	r2, r0, #23, #1
	strb	r2, [r3, #3]
	ldr	r1, [r6, #368]
	mov	r7, r0
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3989
	ldrb	r2, [r4, #1440]	@ zero_extendqisi2
	ldrb	r3, [r4, #1438]	@ zero_extendqisi2
.L3990:
	cmp	r2, #0
	bne	.L3991
	cmp	r3, #1
	beq	.L3992
.L3991:
	ldr	r1, .L4156+64
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r6, #368]
	cmp	r1, #0
	beq	.L4129
	ldr	r0, [r4, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	mvn	r0, #0
	str	r3, [r6, #368]
	b	.L4127
.L3989:
	ubfx	r3, r0, #22, #1
	ubfx	r2, r0, #16, #6
	ubfx	ip, r7, #4, #1
	strb	r3, [r4, #1436]
	strb	r2, [r4, #1437]
	ubfx	r3, r0, #15, #1
	ubfx	r2, r7, #8, #4
	ubfx	r0, r0, #12, #3
	strb	ip, [r4, #1442]
	ubfx	ip, r7, #2, #1
	strb	r0, [r4, #1439]
	ubfx	r0, r7, #5, #3
	strb	r3, [r4, #1438]
	strb	r0, [r4, #1441]
	ubfx	r0, r7, #3, #1
	strb	r2, [r4, #1440]
	strb	r0, [r4, #1443]
	and	r0, r7, #3
	strb	ip, [r4, #1444]
	strb	r0, [r4, #1445]
	b	.L3990
.L4151:
	ldr	r1, .L4156+68
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r6
	bl	ClearCurrSlice
	ldr	r3, .L4156+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L4129
.L4131:
	mov	r3, #0
	ldr	r0, [r4, #3520]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	mvn	r0, #0
	b	.L4127
.L4153:
	ldr	r5, .L4156+12
	mov	r0, #1
	ldr	r1, .L4156+72
	bl	dprint_vfmw
	ldr	ip, [r5]
	cmp	ip, #0
	beq	.L4129
.L4137:
	sub	r2, fp, #36
	mvn	r6, #0
	mov	r3, #4
	mov	r1, #100
	str	r6, [r2, #-4]!
	ldr	r0, [r4, #3520]
	blx	ip
	ldr	ip, [r5]
	cmp	ip, #0
	bne	.L4131
	b	.L4129
.L4152:
	ldr	r1, .L4156+76
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4156+12
	ldr	ip, [r3]
	cmp	ip, #0
	bne	.L4134
	b	.L4135
.L4155:
	ldr	r5, .L4156+12
	mov	r0, #1
	ldr	r1, .L4156+80
	bl	dprint_vfmw
	ldr	ip, [r5]
	cmp	ip, #0
	bne	.L4137
	b	.L4129
.L4027:
	ldr	r1, [r6, #368]
	cmp	r1, #0
	bne	.L4029
	b	.L4135
.L3992:
	ldrb	r3, [r4, #1436]	@ zero_extendqisi2
	mov	r0, #22
	cmp	r3, #1
	moveq	r3, #5
	streqb	r3, [r1, #2]
	ldrb	ip, [r4, #1441]	@ zero_extendqisi2
	ldreqb	r2, [r4, #1440]	@ zero_extendqisi2
	ldrb	r3, [r4, #1439]	@ zero_extendqisi2
	ldr	r1, .L4156+84
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r2, r7
	ldr	r1, .L4156+88
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r2, [r6, #368]
	ldr	r3, [r2, #64]
	add	r3, r3, #24
	str	r3, [r2, #64]
	ldr	r3, [r6, #368]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	b	.L3988
.L4154:
	ldr	r5, .L4156+12
	add	r3, r6, #12288
	strb	r0, [r3, #1272]
	ldr	ip, [r5]
	cmp	ip, #0
	beq	.L4022
	mov	r3, #0
	mov	r1, #117
	mov	r2, r3
	ldr	r0, [r4, #3520]
	blx	ip
.L4022:
	mov	r7, #0
	mov	r0, r6
	str	r7, [r6, #364]
	bl	DecVDM
	cmp	r0, r7
	beq	.L4139
	ldr	r1, [r6, #368]
	cmp	r1, r7
	beq	.L4023
	ldr	r0, [r4, #3520]
	bl	ReleaseNAL
	str	r7, [r6, #368]
.L4023:
	ldr	ip, [r5]
	cmp	ip, #0
	bne	.L4131
	b	.L4129
.L4011:
	ldrb	r3, [r5, #216]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L4135
	ldr	r5, .L4156+12
	ldr	ip, [r5]
	cmp	ip, #0
	beq	.L4013
	mov	r3, r0
	mov	r2, r0
	mov	r1, #112
	ldr	r0, [r4, #3520]
	blx	ip
.L4013:
	mov	r7, #0
	mov	r0, r6
	str	r7, [r6, #364]
	bl	DecVDM
	cmp	r0, #0
	bne	.L4146
	add	r6, r6, #12288
	mov	r3, #1
	strb	r3, [r6, #1273]
	b	.L4127
.L4157:
	.align	2
.L4156:
	.word	s_pstVfmwChan
	.word	.LC413
	.word	.LC431
	.word	g_event_report
	.word	.LC418
	.word	.LC423
	.word	.LC421
	.word	.LC428
	.word	.LC427
	.word	.LC429
	.word	.LC430
	.word	.LC425
	.word	.LC426
	.word	.LC420
	.word	.LC432
	.word	.LC414
	.word	.LC415
	.word	.LC419
	.word	.LC422
	.word	.LC424
	.word	.LC178
	.word	.LC416
	.word	.LC417
	UNWIND(.fnend)
	.size	H264_DecOneNal, .-H264_DecOneNal
	.align	2
	.global	H264DEC_DecodePacket
	.type	H264DEC_DecodePacket, %function
H264DEC_DecodePacket:
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
	UNWIND(.pad #40)
	sub	sp, sp, #40
	cmp	r1, #0
	mov	ip, #0
	mov	r5, r0
	str	ip, [fp, #-48]
	str	ip, [fp, #-52]
	str	ip, [fp, #-56]
	beq	.L4227
	ldr	r2, [r0]
	add	r4, r0, #61440
	ldr	lr, [r4, #2072]
	ldr	r3, [r2, #8]
	cmp	lr, #1
	mov	r3, r3, asl #16
	and	r3, r3, #458752
	str	r3, [r4, #3508]
	ldr	r3, [r2]
	str	r3, [r4, #3512]
	ldr	r3, [r2, #4]
	str	ip, [r4, #3460]
	str	r3, [r4, #3516]
	beq	.L4161
	ldr	r3, [r2, #832]
	cmp	r3, #1
	beq	.L4228
.L4162:
	mov	r0, r5
	bl	ReceivePacket
	ldr	r3, [r5, #368]
	str	r3, [r4, #3556]
.L4164:
	cmp	r0, #0
	mov	r0, #0
	str	r0, [r4, #2072]
	beq	.L4229
.L4224:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4228:
	ldr	r3, [r2, #872]
	cmp	r3, #1
	bne	.L4162
	ldr	r3, [r4, #3552]
	cmp	r3, #1
	bne	.L4162
	ldr	r3, [r4, #3556]
	str	r3, [r0, #368]
	str	ip, [r4, #3552]
	str	ip, [r4, #2072]
	b	.L4163
.L4229:
	ldr	r3, [r5, #368]
.L4163:
	mov	r2, #0
	add	r6, r5, #13504
	str	r2, [r3, #64]
	add	r6, r6, #24
	ldr	r3, [r5, #368]
	mov	r0, r6
	ldr	r2, [r3, #12]
	ldr	r1, [r3, #8]
	bl	BsInit
	ldr	r3, .L4237
	ldr	r2, [r4, #3520]
	ldr	ip, [r3, r2, asl #2]
	ldrsb	r7, [ip, #44]
	cmp	r7, #1
	beq	.L4165
.L4167:
	mov	r7, #0
.L4166:
	mov	r1, #32
	mov	r0, r6
	bl	BsGet
	ldr	r2, [r5, #368]
	uxtb	r0, r0
	and	r3, r0, #31
	and	r1, r0, #27
	strb	r3, [r2, #2]
	sub	ip, r3, #20
	ldr	r2, [r5, #368]
	clz	ip, ip
	cmp	r3, #20
	cmpne	r1, #1
	ubfx	r0, r0, #5, #2
	mov	ip, ip, lsr #5
	str	r0, [r2, #76]
	beq	.L4230
.L4168:
	mov	r0, r5
	bl	FindTrailZeros
	subs	r3, r0, #0
	bne	.L4231
	ldr	r2, [r5, #368]
	mov	r0, r6
	str	r3, [r2, #64]
	ldr	r3, [r5, #368]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #12]
	bl	BsInit
	mov	r1, r7
	mov	r0, r5
	bl	H264_DecOneNal
	cmn	r0, #2
	beq	.L4224
	cmp	r0, #0
	streq	r0, [r4, #636]
	beq	.L4224
	ldr	r1, .L4237+4
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4224
.L4161:
	ldr	r0, [r0, #368]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	b	.L4164
.L4230:
	cmp	ip, #0
	bne	.L4232
.L4169:
	sub	r2, fp, #40
	sub	r1, fp, #44
	mov	r0, r5
	bl	InquireSliceProperty
	cmp	r0, #0
	beq	.L4233
	ldr	r1, [r5, #368]
	cmp	r1, #0
	beq	.L4184
	ldr	r0, [r4, #3520]
	bl	ReleaseNAL
	mov	r3, #0
	str	r3, [r5, #368]
.L4184:
	ldr	r3, .L4237+8
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L4226
	mov	r3, #0
	ldr	r0, [r4, #3520]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	mvn	r0, #0
	b	.L4224
.L4233:
	ldr	r2, [fp, #-44]
	ldr	r1, [r4, #3532]
	sub	r3, r2, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	cmp	r3, #0
	add	r3, r3, r1
	str	r3, [r4, #3532]
	bne	.L4234
	add	r8, r5, #12288
	ldrb	r3, [r8, #1273]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4187
.L4174:
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	bne	.L4168
	mov	r0, r5
	bl	FlushDPB
	subs	r3, r0, #0
	bne	.L4235
.L4180:
	ldr	r0, [r4, #3520]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L4168
	sub	r3, fp, #48
	ldr	r0, [r4, #3520]
	sub	r2, fp, #52
	sub	r1, fp, #56
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r5]
	ldr	r0, [r3, #708]
	cmp	r0, #1
	bne	.L4168
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ble	.L4236
.L4181:
	mov	r2, #0
	mov	r3, #1
	str	r2, [r4, #3560]
	mvn	r0, #1
	str	r3, [r4, #2072]
	b	.L4224
.L4165:
	ldr	r3, [ip, #180]
	mov	r0, r5
	ldr	r2, [ip, #176]
	ldr	r1, [ip, #172]
	bl	H264_VES_Splitter
	cmp	r0, #3
	beq	.L4166
	cmp	r0, #0
	bne	.L4224
	b	.L4167
.L4232:
	mov	r0, r5
	bl	InquireSliceExtProperty
	b	.L4169
.L4231:
	ldr	r1, .L4237+12
	mov	r0, #22
	bl	dprint_vfmw
.L4226:
	mvn	r0, #0
	b	.L4224
.L4187:
	mov	r3, #0
	strb	r3, [r8, #1273]
	b	.L4174
.L4234:
	add	r9, r5, #20480
	add	r8, r5, #12288
	ldrb	r3, [r9, #209]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #3536]
	addeq	r3, r3, #1
	addne	r3, r3, #2
	str	r3, [r4, #3536]
	ldrb	r3, [r8, #1273]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4187
	ldr	r3, [r4, #3444]
	cmp	r3, #0
	beq	.L4174
	ldr	r3, [r5, #368]
	mov	ip, #0
	mov	r0, r6
	mov	r2, #12
	ldr	r1, .L4237+16
	str	ip, [r3, #64]
	bl	BsInit
	mov	r0, r5
	mov	r1, #1
	bl	H264_DecOneNal
	ldrb	r3, [r9, #209]	@ zero_extendqisi2
	mvn	r0, #1
	cmp	r3, #1
	ldr	r3, [r4, #3536]
	subeq	r3, r3, #1
	subne	r3, r3, #2
	str	r3, [r4, #3536]
	mov	r3, #1
	str	r3, [r4, #2072]
	b	.L4224
.L4235:
	movw	r2, #13915
	ldr	r1, .L4237+20
	mov	r0, #0
	bl	dprint_vfmw
	b	.L4180
.L4227:
	mov	r0, r1
	movw	r3, #13779
	ldr	r2, .L4237+24
	ldr	r1, .L4237+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4224
.L4236:
	ldr	r3, [fp, #-52]
	cmp	r3, #32
	bgt	.L4181
	ldr	r9, [r5, #360]
	cmp	r9, #0
	bne	.L4181
	ldr	r3, [r4, #3484]
	cmp	r3, #0
	beq	.L4168
	ldr	r2, [r8, #1276]
	cmp	r2, #0
	beq	.L4168
	ldr	lr, [r8, #1280]
	ldr	ip, [r4, #3564]
	cmp	lr, ip
	beq	.L4168
	ldr	r1, [r4, #3568]
	cmp	r2, r1
	beq	.L4168
	stmia	sp, {r1, ip}
	str	r2, [sp, #8]
	str	lr, [sp, #12]
	ldr	r2, [fp, #-40]
	ldr	r1, .L4237+32
	bl	dprint_vfmw
	ldr	r2, .L4237+8
	str	r9, [r4, #3560]
	ldr	r3, [r8, #1280]
	ldr	ip, [r2]
	str	r3, [r4, #3564]
	cmp	ip, #0
	ldr	r3, [r8, #1276]
	str	r3, [r4, #3568]
	beq	.L4168
	mov	r3, #0
	mov	r1, #120
	mov	r2, r3
	ldr	r0, [r4, #3520]
	blx	ip
	b	.L4168
.L4238:
	.align	2
.L4237:
	.word	s_pstVfmwChan
	.word	.LC435
	.word	g_event_report
	.word	.LC434
	.word	.LANCHOR0+432
	.word	.LC356
	.word	.LC20
	.word	.LC21
	.word	.LC433
	UNWIND(.fnend)
	.size	H264DEC_DecodePacket, .-H264DEC_DecodePacket
	.align	2
	.global	H264DEC_VDMPostProc
	.type	H264DEC_VDMPostProc, %function
H264DEC_VDMPostProc:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r6, [r0, #364]
	mov	r4, r0
	mov	r7, r3
	ldr	r2, [fp, #8]
	cmp	r6, #0
	bne	.L4240
	ldr	r3, [fp, #4]
	add	r5, r0, #61440
	cmp	r3, #0
	str	r1, [r5, #604]
	beq	.L4241
	ldr	r3, .L4260
	mov	ip, r2, asl #6
	sub	r2, ip, r2, asl #3
	add	r2, r2, r3
	ldr	r3, [r2, #4]
	cmp	r3, #3
	beq	.L4257
	cmp	r3, #1
	beq	.L4241
.L4244:
	mov	r1, r7
	mov	r0, r4
	bl	StorePicInDPB
	cmp	r0, #1
	mov	r7, r0
	bls	.L4245
	ldr	r3, [r5, #560]
	mov	r2, #1
	ldr	r0, [r5, #3520]
	mvn	r6, #0
	ldr	r1, [r3, #672]
	bl	FSP_ClearLogicFs
	mov	r2, r7
	ldr	r1, .L4260+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	H264_ClearCurrPic
	mov	r0, r4
	bl	ClearDPB
	mov	r3, #0
	str	r3, [r5, #560]
.L4243:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4240:
	add	r5, r0, #61440
	str	r1, [r5, #604]
	bl	ClearAllSlice
	mov	r1, r7
	mov	r0, r4
	bl	StorePicInDPB
	subs	r2, r0, #0
	bne	.L4258
.L4246:
	mov	r0, r4
	bl	FlushDPB
	subs	r2, r0, #0
	bne	.L4259
.L4247:
	add	r2, r4, #12288
	mov	r3, #0
	str	r3, [r5, #2068]
	add	r4, r4, #20480
	ldr	r1, [r2, #1292]
	mov	r6, r3
	movw	r2, #23352
	strb	r3, [r4, #1856]
	str	r3, [r4, #1888]
	movt	r2, 1
	str	r1, [r4, #1864]
	mov	r0, #7
	mov	r1, #2
	str	r3, [r4, #1892]
	str	r2, [r4, #1872]
	mov	r3, #32
	strb	r1, [r4, #1857]
	mvn	r2, #0
	mov	r1, #3
	str	r0, [r4, #1868]
	strb	r3, [r4, #1858]
	mov	r0, r6
	mov	r3, #262144
	str	r1, [r4, #1880]
	str	r2, [r4, #1884]
	str	r3, [r4, #1896]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4241:
	mov	r0, r4
	bl	ClearAllSlice
	b	.L4244
.L4245:
	mov	r3, #1
	mov	r0, r6
	str	r3, [r5, #2068]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4259:
	ldr	r1, .L4260+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4247
.L4258:
	ldr	r1, .L4260+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4246
.L4257:
	bl	ClearAllSlice
	b	.L4243
.L4261:
	.align	2
.L4260:
	.word	g_VdmDrvParam+40
	.word	.LC436
	.word	.LC438
	.word	.LC437
	UNWIND(.fnend)
	.size	H264DEC_VDMPostProc, .-H264DEC_VDMPostProc
	.align	2
	.global	H264DEC_GetImageBuffer
	.type	H264DEC_GetImageBuffer, %function
H264DEC_GetImageBuffer:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #16)
	sub	sp, sp, #16
	add	r4, r0, #61440
	mov	r5, r0
	ldr	r7, [r4, #2060]
	cmp	r7, #0
	beq	.L4278
	add	r6, r0, #27392
	add	r9, r0, #26368
	add	r6, r6, #8
	add	r9, r9, #160
	add	r8, r0, #24576
	mov	lr, #0
	mov	r1, r6
.L4270:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4265
	cmp	r1, #0
	beq	.L4266
	ldr	r0, [r8, #2148]
	cmp	r0, #0
	beq	.L4266
	ldr	r2, [r8, #1952]
	cmp	r2, r1
	beq	.L4265
	mov	r2, r9
	b	.L4267
.L4268:
	ldr	ip, [r2, #4]!
	cmp	ip, r1
	beq	.L4265
.L4267:
	add	r3, r3, #1
	cmp	r3, r0
	bne	.L4268
.L4266:
	ldr	r0, [r4, #3520]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L4278
	cmn	r0, #1
	bne	.L4298
	add	r1, r5, #8
	ldr	r0, [r4, #3520]
	bl	FSP_ClearNotInVoQueue
	b	.L4298
.L4265:
	add	lr, lr, #1
	add	r1, r1, #848
	cmp	lr, r7
	bne	.L4270
	sub	r2, fp, #40
	sub	r1, fp, #44
	add	r0, r5, #8
	bl	GetQueueImgNum
	ldr	r1, .L4302
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, .L4302+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r4, #2060]
	cmp	r3, #0
	addne	r8, r5, #26368
	addne	r9, r5, #24576
	addne	r8, r8, #160
	movne	r7, #0
	beq	.L4300
.L4271:
	cmp	r6, #0
	ldrb	r3, [r6, #1]	@ zero_extendqisi2
	ldrb	lr, [r6, #4]	@ zero_extendqisi2
	beq	.L4282
	ldr	r0, [r9, #2148]
	cmp	r0, #0
	beq	.L4282
	ldr	r2, [r9, #1952]
	cmp	r6, r2
	beq	.L4284
	mov	r1, r8
	mov	ip, #0
	b	.L4275
.L4276:
	ldr	r2, [r1, #4]!
	cmp	r6, r2
	beq	.L4284
.L4275:
	add	ip, ip, #1
	cmp	ip, r0
	bne	.L4276
.L4282:
	mov	r2, #1
.L4274:
	str	r2, [sp, #4]
	mov	r0, #0
	mov	r2, r7
	str	lr, [sp]
	ldr	r1, .L4302+8
	add	r7, r7, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #2060]
	add	r6, r6, #848
	cmp	r3, r7
	bhi	.L4271
.L4277:
	ldr	r3, [fp, #-40]
	mov	r0, #0
	ldr	r2, [fp, #-44]
	ldr	r1, .L4302+12
	bl	dprint_vfmw
	ldr	r3, [r4, #2060]
	ldr	r0, [r9, #2148]
	ldr	r2, [fp, #-44]
	sub	r3, r3, #2
	ldr	r1, [fp, #-40]
	rsb	r3, r0, r3
	add	r2, r2, r1
	cmp	r2, r3
	blt	.L4301
.L4298:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4278:
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4284:
	mov	r2, #0
	b	.L4274
.L4301:
	ldr	r1, .L4302+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r5
	mov	r1, #1
	bl	ClearAll
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4300:
	add	r9, r5, #24576
	b	.L4277
.L4303:
	.align	2
.L4302:
	.word	.LC439
	.word	.LC440
	.word	.LC442
	.word	.LC441
	.word	.LC443
	UNWIND(.fnend)
	.size	H264DEC_GetImageBuffer, .-H264DEC_GetImageBuffer
	.align	2
	.global	H264DEC_GetImageWidth
	.type	H264DEC_GetImageWidth, %function
H264DEC_GetImageWidth:
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
	add	r0, r0, #16384
	ldr	r0, [r0, #460]
	add	r0, r0, #1
	mov	r0, r0, asl #4
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	H264DEC_GetImageWidth, .-H264DEC_GetImageWidth
	.align	2
	.global	H264DEC_GetImageHeight
	.type	H264DEC_GetImageHeight, %function
H264DEC_GetImageHeight:
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
	add	r3, r0, #16384
	add	r0, r0, #12288
	ldr	r3, [r3, #464]
	ldrb	r0, [r0, #1326]	@ zero_extendqisi2
	add	r3, r3, #1
	rsb	r0, r0, #2
	mov	r3, r3, asl #4
	mul	r0, r0, r3
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
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
	.align	2
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
	.type	SarTable.15735, %object
	.size	SarTable.15735, 136
SarTable.15735:
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
	.type	__func__.15916, %object
	.size	__func__.15916, 12
__func__.15916:
	.ascii	"H264_DecSEI\000"
	.type	__func__.14768, %object
	.size	__func__.14768, 13
__func__.14768:
	.ascii	"DirectOutput\000"
	.space	3
	.type	__func__.15233, %object
	.size	__func__.15233, 8
__func__.15233:
	.ascii	"InitDPB\000"
	.type	__func__.16184, %object
	.size	__func__.16184, 18
__func__.16184:
	.ascii	"H264_VES_Splitter\000"
	.space	2
	.type	__func__.14886, %object
	.size	__func__.14886, 14
__func__.14886:
	.ascii	"StorePicInDPB\000"
	.space	2
	.type	__FUNCTION__.16153, %object
	.size	__FUNCTION__.16153, 13
__FUNCTION__.16153:
	.ascii	"H264DEC_Init\000"
	.space	3
	.type	__FUNCTION__.15370, %object
	.size	__FUNCTION__.15370, 8
__FUNCTION__.15370:
	.ascii	"InitPic\000"
	.data
	.align	2
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
	.space	192
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"list[%d][%d]: frame_num=%d, poc=%d\012\000" )
.LC1:
	ASCII(.ascii	"L0: \000" )
	.space	3
.LC2:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC3:
	ASCII(.ascii	"%d \000" )
.LC4:
	ASCII(.ascii	"%dt \000" )
	.space	3
.LC5:
	ASCII(.ascii	"%db \000" )
	.space	3
.LC6:
	ASCII(.ascii	"L1:\000" )
.LC7:
	ASCII(.ascii	"\012\012END of the bit buffer, copy the first packe" )
	ASCII(.ascii	"t!\012\012\000" )
	.space	2
.LC8:
	ASCII(.ascii	"0:phy:0x%x, 1:phy:0x%x; len0:%d len1:%d\012\000" )
	.space	3
.LC9:
	ASCII(.ascii	"0:phy:0x%x, len0:%d\012\000" )
	.space	3
.LC10:
	ASCII(.ascii	"%-50s%50d\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"frame %d, state=%d, is already output\012\000" )
	.space	1
.LC12:
	ASCII(.ascii	"plfs(fs=%p, eFoState=%d) is null, logic_fs_id = %d\012" )
	ASCII(.ascii	"\000" )
.LC13:
	ASCII(.ascii	"not used frame: (%d,%d)\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"frame skip: is_used=%d,skip=%d\012\000" )
.LC15:
	ASCII(.ascii	"topfield skip: is_used=%d,skip=%d\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"bottom field skip: is_used=%d,skip=%d\012\000" )
	.space	1
.LC17:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC18:
	ASCII(.ascii	"exg_pts: %lld <-> %lld\012\000" )
.LC19:
	ASCII(.ascii	"stream frame packing type is %d! what can we do?\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC20:
	ASCII(.ascii	"firmware/common/syntax/h264.c\000" )
	.space	2
.LC21:
	ASCII(.ascii	"NULL pointer: %s, L%d\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"framestore %d allocate apc %d\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"find APC, but logic_fs_id %d abnormal(ref=%d,plfs=%" )
	ASCII(.ascii	"p, pdfs=%p)\012\000" )
.LC24:
	ASCII(.ascii	"pH264Ctx->DPB.fs[%d]: frame_num=%d poc=%d is_refere" )
	ASCII(.ascii	"nce=%d\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"pH264Ctx->DPB.fs_ref[%d]: frame_num=%d poc=%d is_re" )
	ASCII(.ascii	"ference=%d\012\000" )
	.space	1
.LC26:
	ASCII(.ascii	"pH264Ctx->DPB.fs_ref[%d]: frame.poc=%d \012\000" )
	.space	3
.LC27:
	ASCII(.ascii	"\012 VFMW ** release streambuff=%p   bitstream_leng" )
	ASCII(.ascii	"th=%d\012\000" )
	.space	1
.LC28:
	ASCII(.ascii	"clear curr slice.\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC30:
	ASCII(.ascii	"resolution error, ImageWidth=%d, ImageHeight=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC31:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"ERROR: FSP_ConfigInstance fail!\012\000" )
	.space	3
.LC33:
	ASCII(.ascii	"slice_type %d invalid, clear current slice.\012\000" )
	.space	3
.LC34:
	ASCII(.ascii	"pRepairPic(%p)/found(%d) = 0, clear current slice.\012" )
	ASCII(.ascii	"\000" )
.LC35:
	ASCII(.ascii	"listXsize[%d] = %d, clear current slice.\012\000" )
	.space	2
.LC36:
	ASCII(.ascii	"for P slice size of list equal 0.\012\000" )
	.space	1
.LC37:
	ASCII(.ascii	"for B slice size of two list all equal 0.\012\000" )
	.space	1
.LC38:
	ASCII(.ascii	"init list error.\012\000" )
	.space	2
.LC39:
	ASCII(.ascii	"L0: list after init.\012\000" )
	.space	2
.LC40:
	ASCII(.ascii	"L0: list after reorder.\012\000" )
	.space	3
.LC41:
	ASCII(.ascii	"save pic yuv :  structure = %d;  idc = %d\012\000" )
	.space	1
.LC42:
	ASCII(.ascii	"structure = %d pH264Ctx->CurrPic.pic_width_in_mb = " )
	ASCII(.ascii	"%d pH264Ctx->CurrPic.pic_height_in_mb = %d\012\000" )
	.space	1
.LC43:
	ASCII(.ascii	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC44:
	ASCII(.ascii	"logic frame id(=%d): get LogicFs error!\012\000" )
	.space	3
.LC45:
	ASCII(.ascii	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC46:
	ASCII(.ascii	"line: %d pstLogicFs is null\012\000" )
	.space	3
.LC47:
	ASCII(.ascii	"SH: first_mb_in_slice\000" )
	.space	2
.LC48:
	ASCII(.ascii	"slicecheck first_mb_in_slice >= MAX_MB_NUM_IN_PIC e" )
	ASCII(.ascii	"rror.\012\000" )
	.space	2
.LC49:
	ASCII(.ascii	"SH: slice_type\000" )
	.space	1
.LC50:
	ASCII(.ascii	"slice type = %d\012\000" )
	.space	3
.LC51:
	ASCII(.ascii	"slice type = %d, err\012\000" )
	.space	2
.LC52:
	ASCII(.ascii	"slice  pps id = %d\012\000" )
.LC53:
	ASCII(.ascii	"pps with this pic_parameter_set_id = %d havn't deco" )
	ASCII(.ascii	"de\012\000" )
	.space	1
.LC54:
	ASCII(.ascii	"sps with this pic_parameter_set_id = %d havn't deco" )
	ASCII(.ascii	"de\012\000" )
	.space	1
.LC55:
	ASCII(.ascii	"tmp slice  pps id = %d\012\000" )
.LC56:
	ASCII(.ascii	"PPSSPSCheckTmpId: pps with this pic_parameter_set_i" )
	ASCII(.ascii	"d = %d havn't decode\012\000" )
	.space	3
.LC57:
	ASCII(.ascii	"PPSSPSCheckTmpId: seq_parameter_set_id out of range" )
	ASCII(.ascii	".\012\000" )
	.space	2
.LC58:
	ASCII(.ascii	"PPSSPSCheckTmpId: sps with this pic_parameter_set_i" )
	ASCII(.ascii	"d = %d havn't decode\012\000" )
	.space	3
.LC59:
	ASCII(.ascii	"new pic flag = %d\012\000" )
	.space	1
.LC60:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l0\000" )
.LC61:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l0\000" )
	.space	2
.LC62:
	ASCII(.ascii	"reorder idc l0 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC63:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l0\000" )
	.space	1
.LC64:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC65:
	ASCII(.ascii	"SH: long_term_pic_idx_l0\000" )
	.space	3
.LC66:
	ASCII(.ascii	"num of idc l0 exceed\012\000" )
	.space	2
.LC67:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l1\000" )
.LC68:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l1\000" )
	.space	2
.LC69:
	ASCII(.ascii	"reorder idc l1 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC70:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l1\000" )
	.space	1
.LC71:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l1 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC72:
	ASCII(.ascii	"SH: long_term_pic_idx_l1\000" )
	.space	3
.LC73:
	ASCII(.ascii	"num of idc l1 exceed\012\000" )
	.space	2
.LC74:
	ASCII(.ascii	"SH: luma_log2_weight_denom\000" )
	.space	1
.LC75:
	ASCII(.ascii	"SH: chroma_log2_weight_denom\000" )
	.space	3
.LC76:
	ASCII(.ascii	"WP log2 exceed  and err flag = %d\012\000" )
	.space	1
.LC77:
	ASCII(.ascii	"SH: luma_weight_flag_l0\000" )
.LC78:
	ASCII(.ascii	"SH: luma_weight_l0\000" )
	.space	1
.LC79:
	ASCII(.ascii	"SH: luma_offset_l0\000" )
	.space	1
.LC80:
	ASCII(.ascii	"SH: chroma_weight_flag_l0\000" )
	.space	2
.LC81:
	ASCII(.ascii	"SH: chroma_weight_l0\000" )
	.space	3
.LC82:
	ASCII(.ascii	"SH: chroma_offset_l0\000" )
	.space	3
.LC83:
	ASCII(.ascii	"SH: luma_weight_flag_l1\000" )
.LC84:
	ASCII(.ascii	"SH: luma_weight_l1\000" )
	.space	1
.LC85:
	ASCII(.ascii	"SH: luma_offset_l1\000" )
	.space	1
.LC86:
	ASCII(.ascii	"SH: chroma_weight_flag_l1\000" )
	.space	2
.LC87:
	ASCII(.ascii	"SH: chroma_weight_l1\000" )
	.space	3
.LC88:
	ASCII(.ascii	"SH: chroma_offset_l1\000" )
	.space	3
.LC89:
	ASCII(.ascii	"overflow MAX_MMCO_LEN\012\000" )
	.space	1
.LC90:
	ASCII(.ascii	"SH: memory_management_control_operation\000" )
.LC91:
	ASCII(.ascii	"SH: difference_of_pic_nums_minus1\000" )
	.space	2
.LC92:
	ASCII(.ascii	"SH: long_term_pic_num\000" )
	.space	2
.LC93:
	ASCII(.ascii	"SH: long_term_frame_idx\000" )
.LC94:
	ASCII(.ascii	"SH: max_long_term_frame_idx_plus1\000" )
	.space	2
.LC95:
	ASCII(.ascii	"mmco exceed 6\012\000" )
	.space	1
.LC96:
	ASCII(.ascii	"SH: no_output_of_prior_pics_flag\000" )
	.space	3
.LC97:
	ASCII(.ascii	"SH: long_term_reference_flag\000" )
	.space	3
.LC98:
	ASCII(.ascii	"IDR and no_output_of_prior_pics_flag = %d\012\000" )
	.space	1
.LC99:
	ASCII(.ascii	"SH: adaptive_ref_pic_marking_mode_flag\000" )
	.space	1
.LC100:
	ASCII(.ascii	"adaptive_ref_pic_marking_mode_flag = %d\012\000" )
	.space	3
.LC101:
	ASCII(.ascii	"MMCO para would save dec err\012\000" )
	.space	2
.LC102:
	ASCII(.ascii	"mulitislice diff no_out_of_prior_pics_flag, used fi" )
	ASCII(.ascii	"rst.\012\000" )
	.space	3
.LC103:
	ASCII(.ascii	"mulitislice diff long_term_reference_flag, used fir" )
	ASCII(.ascii	"st.\012\000" )
.LC104:
	ASCII(.ascii	"mulitislice diff adaptive_ref_pic_marking_mode_flag" )
	ASCII(.ascii	", used first.\012\000" )
	.space	2
.LC105:
	ASCII(.ascii	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\012\000" )
	.space	1
.LC106:
	ASCII(.ascii	"SH: pic_parameter_set_id\000" )
	.space	3
.LC107:
	ASCII(.ascii	"pps id:%d in sliceheader err\012\000" )
	.space	2
.LC108:
	ASCII(.ascii	"PPS or SPS of this slice not valid\012\000" )
.LC109:
	ASCII(.ascii	"recover point but isn't I_SLICE.\012\000" )
	.space	2
.LC110:
	ASCII(.ascii	"SH: frame_num\000" )
	.space	2
.LC111:
	ASCII(.ascii	"IDR NAL but frame_num!=0.\012\000" )
	.space	1
.LC112:
	ASCII(.ascii	"SH: field_pic_flag\000" )
	.space	1
.LC113:
	ASCII(.ascii	"SH: bottom_field_flag\000" )
	.space	2
.LC114:
	ASCII(.ascii	"field first_mb_in_slice bigger than pic size\012\000" )
	.space	2
.LC115:
	ASCII(.ascii	"frame first_mb_in_slice bigger than pic size\012\000" )
	.space	2
.LC116:
	ASCII(.ascii	"SH: idr_pic_id\000" )
	.space	1
.LC117:
	ASCII(.ascii	"idr_pic_id bigger than 65535\012\000" )
	.space	2
.LC118:
	ASCII(.ascii	"SH: pic_order_cnt_lsb\000" )
	.space	2
.LC119:
	ASCII(.ascii	"SH: delta_pic_order_cnt_bottom\000" )
	.space	1
.LC120:
	ASCII(.ascii	"SH: delta_pic_order_cnt[0]\000" )
	.space	1
.LC121:
	ASCII(.ascii	"SH: delta_pic_order_cnt[1]\000" )
	.space	1
.LC122:
	ASCII(.ascii	"SH: redundant_pic_cnt\000" )
	.space	2
.LC123:
	ASCII(.ascii	"redundant pic not support.\012\000" )
.LC124:
	ASCII(.ascii	"first_mb_in_slice in currslice small than prevslice" )
	ASCII(.ascii	" in same pic\012\000" )
	.space	3
.LC125:
	ASCII(.ascii	"SH: direct_spatial_mv_pred_flag\000" )
.LC126:
	ASCII(.ascii	"SH: num_ref_idx_override_flag\000" )
	.space	2
.LC127:
	ASCII(.ascii	"SH: num_ref_idx_l0_active_minus1\000" )
	.space	3
.LC128:
	ASCII(.ascii	"SH: num_ref_idx_l1_active_minus1\000" )
	.space	3
.LC129:
	ASCII(.ascii	"frame num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC130:
	ASCII(.ascii	"field num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC131:
	ASCII(.ascii	"reordering para dec err\012\000" )
	.space	3
.LC132:
	ASCII(.ascii	"apply_weights_flag=%d\012\000" )
	.space	1
.LC133:
	ASCII(.ascii	"wpt dec err\012\000" )
	.space	3
.LC134:
	ASCII(.ascii	"mark para dec err\012\000" )
	.space	1
.LC135:
	ASCII(.ascii	"SH: cabac_init_idc\000" )
	.space	1
.LC136:
	ASCII(.ascii	"cabac_init_idc bigger than 3\012\000" )
	.space	2
.LC137:
	ASCII(.ascii	"SH: slice_qp_delta\000" )
	.space	1
.LC138:
	ASCII(.ascii	"SH: disable_deblocking_filter_idc\000" )
	.space	2
.LC139:
	ASCII(.ascii	"disable_deblocking_filter_idc dec err\012\000" )
	.space	1
.LC140:
	ASCII(.ascii	"SH: slice_alpha_c0_offset_div2\000" )
	.space	1
.LC141:
	ASCII(.ascii	"slice_alpha_c0_offset_div2 dec err\012\000" )
.LC142:
	ASCII(.ascii	"SH: slice_beta_offset_div2\000" )
	.space	1
.LC143:
	ASCII(.ascii	"slice_beta_offset_div2 dec err\012\000" )
.LC144:
	ASCII(.ascii	"pH264Ctx->pCurrNal->nal_bitoffset = %d; code_len_by" )
	ASCII(.ascii	"te = %d; bitstream_length = %d; pH264Ctx->pCurrNal-" )
	ASCII(.ascii	">nal_trail_zero_bit_num = %d\012\000" )
.LC145:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; byt" )
	ASCII(.ascii	"espos = %x\012\000" )
	.space	1
.LC146:
	ASCII(.ascii	"nal_segment = %d is not expected value\012\000" )
.LC147:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\012\000" )
.LC148:
	ASCII(.ascii	"   : delta_sl   \000" )
	.space	3
.LC149:
	ASCII(.ascii	"PPS: entropy_coding_mode_flag\000" )
	.space	2
.LC150:
	ASCII(.ascii	"PPS: pic_order_present_flag\000" )
.LC151:
	ASCII(.ascii	"PPS: num_slice_groups_minus1\000" )
	.space	3
.LC152:
	ASCII(.ascii	"Baseline stream with FMO, not support.\012\000" )
.LC153:
	ASCII(.ascii	"PPS: num_ref_idx_l0_active_minus1\000" )
	.space	2
.LC154:
	ASCII(.ascii	"num_ref_idx_l0_active_minus1 out of range.\012\000" )
.LC155:
	ASCII(.ascii	"PPS: num_ref_idx_l1_active_minus1\000" )
	.space	2
.LC156:
	ASCII(.ascii	"num_ref_idx_l1_active_minus1 out of range.\012\000" )
.LC157:
	ASCII(.ascii	"PPS: weighted prediction flag\000" )
	.space	2
.LC158:
	ASCII(.ascii	"PPS: weighted_bipred_idc\000" )
	.space	3
.LC159:
	ASCII(.ascii	"weighted_bipred_idc out of range\012\000" )
	.space	2
.LC160:
	ASCII(.ascii	"PPS: pic_init_qp_minus26\000" )
	.space	3
.LC161:
	ASCII(.ascii	"PPS: pic_init_qs_minus26\000" )
	.space	3
.LC162:
	ASCII(.ascii	"PPS: chroma_qp_index_offset\000" )
.LC163:
	ASCII(.ascii	"PPS: deblocking_filter_control_present_flag\000" )
.LC164:
	ASCII(.ascii	"PPS: constrained_intra_pred_flag\000" )
	.space	3
.LC165:
	ASCII(.ascii	"PPS: redundant_pic_cnt_present_flag\000" )
.LC166:
	ASCII(.ascii	"redundant pic not support when find redundant slice" )
	ASCII(.ascii	" later, exit\012\000" )
	.space	3
.LC167:
	ASCII(.ascii	"PPS: transform_8x8_mode_flag\000" )
	.space	3
.LC168:
	ASCII(.ascii	"PPS: pic_scaling_matrix_present_flag\000" )
	.space	3
.LC169:
	ASCII(.ascii	"PPS: second_chroma_qp_index_offset\000" )
	.space	1
.LC170:
	ASCII(.ascii	"SPS: seq_scaling_list_present_flag\000" )
	.space	1
.LC171:
	ASCII(.ascii	"PPS: pic_scaling_list_present_flag\000" )
	.space	1
.LC172:
	ASCII(.ascii	"second_chroma_qp_index_offset out of range.\012\000" )
	.space	3
.LC173:
	ASCII(.ascii	"PPS: pic_parameter_set_id\000" )
	.space	2
.LC174:
	ASCII(.ascii	"pic_parameter_set_id out of range.\012\000" )
.LC175:
	ASCII(.ascii	"PPS: seq_parameter_set_id\000" )
	.space	2
.LC176:
	ASCII(.ascii	"seq_parameter_set_id out of range.\012\000" )
.LC177:
	ASCII(.ascii	"SPS haven't decode.\012\000" )
	.space	3
.LC178:
	ASCII(.ascii	"PPS decode error.\012\000" )
	.space	1
.LC179:
	ASCII(.ascii	"VUI: aspect_ratio_info_present_flag\000" )
.LC180:
	ASCII(.ascii	"VUI: aspect_ratio_idc\000" )
	.space	2
.LC181:
	ASCII(.ascii	"VUI: sar_width\000" )
	.space	1
.LC182:
	ASCII(.ascii	"VUI: sar_height\000" )
.LC183:
	ASCII(.ascii	"VUI: overscan_info_present_flag\000" )
.LC184:
	ASCII(.ascii	"VUI: overscan_appropriate_flag\000" )
	.space	1
.LC185:
	ASCII(.ascii	"VUI: video_signal_type_present_flag\000" )
.LC186:
	ASCII(.ascii	"VUI: video_format\000" )
	.space	2
.LC187:
	ASCII(.ascii	"VUI: video_full_range_flag\000" )
	.space	1
.LC188:
	ASCII(.ascii	"VUI: color_description_present_flag\000" )
.LC189:
	ASCII(.ascii	"VUI: colour_primaries\000" )
	.space	2
.LC190:
	ASCII(.ascii	"VUI: transfer_characteristics\000" )
	.space	2
.LC191:
	ASCII(.ascii	"VUI: matrix_coefficients\000" )
	.space	3
.LC192:
	ASCII(.ascii	"VUI: chroma_loc_info_present_flag\000" )
	.space	2
.LC193:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_top_field\000" )
	.space	2
.LC194:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_bottom_field\000" )
	.space	3
.LC195:
	ASCII(.ascii	"VUI: timing_info_present_flag\000" )
	.space	2
.LC196:
	ASCII(.ascii	"VUI: num_units_in_tick\000" )
	.space	1
.LC197:
	ASCII(.ascii	"VUI: time_scale\000" )
.LC198:
	ASCII(.ascii	"VUI: fixed_frame_rate_flag\000" )
	.space	1
.LC199:
	ASCII(.ascii	"VUI: nal_hrd_parameters_present_flag\000" )
	.space	3
.LC200:
	ASCII(.ascii	"VUI: cpb_cnt_minus1\000" )
.LC201:
	ASCII(.ascii	"VUI: bit_rate_scale\000" )
.LC202:
	ASCII(.ascii	"VUI: cpb_size_scale\000" )
.LC203:
	ASCII(.ascii	"hrd->cpb_cnt_minus1 out of range\012\000" )
	.space	2
.LC204:
	ASCII(.ascii	"VUI: bit_rate_value_minus1\000" )
	.space	1
.LC205:
	ASCII(.ascii	"VUI: cpb_size_value_minus1\000" )
	.space	1
.LC206:
	ASCII(.ascii	"VUI: cbr_flag\000" )
	.space	2
.LC207:
	ASCII(.ascii	"VUI: initial_cpb_removal_delay_length_minus1\000" )
	.space	3
.LC208:
	ASCII(.ascii	"VUI: cpb_removal_delay_length_minus1\000" )
	.space	3
.LC209:
	ASCII(.ascii	"VUI: dpb_output_delay_length_minus1\000" )
.LC210:
	ASCII(.ascii	"VUI: time_offset_length\000" )
.LC211:
	ASCII(.ascii	"VUI: vcl_hrd_parameters_present_flag\000" )
	.space	3
.LC212:
	ASCII(.ascii	"VUI: low_delay_hrd_flag\000" )
.LC213:
	ASCII(.ascii	"VUI: pic_struct_present_flag\000" )
	.space	3
.LC214:
	ASCII(.ascii	"VUI: bitstream_restriction_flag\000" )
.LC215:
	ASCII(.ascii	"VUI: motion_vectors_over_pic_boundaries_flag\000" )
	.space	3
.LC216:
	ASCII(.ascii	"VUI: max_bytes_per_pic_denom\000" )
	.space	3
.LC217:
	ASCII(.ascii	"VUI: max_bits_per_mb_denom\000" )
	.space	1
.LC218:
	ASCII(.ascii	"VUI: log2_max_mv_length_horizontal\000" )
	.space	1
.LC219:
	ASCII(.ascii	"VUI: log2_max_mv_length_vertical\000" )
	.space	3
.LC220:
	ASCII(.ascii	"VUI: num_reorder_frames\000" )
.LC221:
	ASCII(.ascii	"VUI: max_dec_frame_buffering\000" )
	.space	3
.LC222:
	ASCII(.ascii	"dar=%d, final_dar=%d\012\000" )
	.space	2
.LC223:
	ASCII(.ascii	"SPS: chroma_format_idc\000" )
	.space	1
.LC224:
	ASCII(.ascii	"pSPS->chroma_format_idc out of range.\012\000" )
	.space	1
.LC225:
	ASCII(.ascii	"SPS: bit_depth_luma_minus8\000" )
	.space	1
.LC226:
	ASCII(.ascii	"bit_depth_luma(%d) not equal 8.\012\000" )
	.space	3
.LC227:
	ASCII(.ascii	"SPS: bit_depth_chroma_minus8\000" )
	.space	3
.LC228:
	ASCII(.ascii	"bit_depth_chroma(%d) not equal 8.\012\000" )
	.space	1
.LC229:
	ASCII(.ascii	"SPS: qpprime_y_zero_trans_bypass_flag\000" )
	.space	2
.LC230:
	ASCII(.ascii	"qpprime_y_zero_trans_bypass_flag not equal 0.\012\000" )
	.space	1
.LC231:
	ASCII(.ascii	"SPS: seq_scaling_matrix_present_flag\000" )
	.space	3
.LC232:
	ASCII(.ascii	"SPS: log2_max_frame_num_minus4\000" )
	.space	1
.LC233:
	ASCII(.ascii	"pSPS->log2_max_frame_num_minus4 out of range.\012\000" )
	.space	1
.LC234:
	ASCII(.ascii	"SPS: pic_order_cnt_type\000" )
.LC235:
	ASCII(.ascii	"pSPS->pic_order_cnt_type out of range.\012\000" )
.LC236:
	ASCII(.ascii	"SPS: log2_max_pic_order_cnt_lsb_minus4\000" )
	.space	1
.LC237:
	ASCII(.ascii	"SPS: num_ref_frames\000" )
.LC238:
	ASCII(.ascii	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of rang" )
	ASCII(.ascii	"e.\012\000" )
	.space	1
.LC239:
	ASCII(.ascii	"SPS: delta_pic_order_always_zero_flag\000" )
	.space	2
.LC240:
	ASCII(.ascii	"SPS: offset_for_non_ref_pic\000" )
.LC241:
	ASCII(.ascii	"SPS: offset_for_top_to_bottom_field\000" )
.LC242:
	ASCII(.ascii	"SPS: num_ref_frames_in_pic_order_cnt_cycle\000" )
	.space	1
.LC243:
	ASCII(.ascii	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of " )
	ASCII(.ascii	"range.\012\000" )
	.space	1
.LC244:
	ASCII(.ascii	"SPS: offset_for_ref_frame[i]\000" )
	.space	3
.LC245:
	ASCII(.ascii	"SPS: gaps_in_frame_num_value_allowed_flag\000" )
	.space	2
.LC246:
	ASCII(.ascii	"SPS: pic_width_in_mbs_minus1\000" )
	.space	3
.LC247:
	ASCII(.ascii	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC248:
	ASCII(.ascii	"SPS: pic_height_in_map_units_minus1\000" )
.LC249:
	ASCII(.ascii	"SPS: frame_mbs_only_flag\000" )
	.space	3
.LC250:
	ASCII(.ascii	"pSPS->pic_height_in_map_units_minus1 out of range.\012" )
	ASCII(.ascii	"\000" )
.LC251:
	ASCII(.ascii	"pic size too large.\012\000" )
	.space	3
.LC252:
	ASCII(.ascii	"level_idc %d not support.\012\000" )
	.space	1
.LC253:
	ASCII(.ascii	"dpb size according level : %d\012\000" )
	.space	1
.LC254:
	ASCII(.ascii	"pSPS->num_ref_frames(%d) > DPB size(%d), try to sel" )
	ASCII(.ascii	"ect the reasonable one.\012\000" )
.LC255:
	ASCII(.ascii	"SPS: direct_8x8_inference_flag\000" )
	.space	1
.LC256:
	ASCII(.ascii	"SPS: frame_cropping_flag\000" )
	.space	3
.LC257:
	ASCII(.ascii	"SPS: frame_cropping_rect_left_offset\000" )
	.space	3
.LC258:
	ASCII(.ascii	"SPS: frame_cropping_rect_right_offset\000" )
	.space	2
.LC259:
	ASCII(.ascii	"SPS: frame_cropping_rect_top_offset\000" )
.LC260:
	ASCII(.ascii	"SPS: frame_cropping_rect_bottom_offset\000" )
	.space	1
.LC261:
	ASCII(.ascii	"SPS: vui_parameters_present_flag\000" )
	.space	3
.LC262:
	ASCII(.ascii	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\012\000" )
	.space	2
.LC263:
	ASCII(.ascii	"SPS: mb_adaptive_frame_field_flag\000" )
	.space	2
.LC264:
	ASCII(.ascii	"SPS_SVC_EXT: inter_layer_deblocking_filter_control_" )
	ASCII(.ascii	"present_flag\000" )
.LC265:
	ASCII(.ascii	"inter_layer_present_flag:%d!\012\000" )
	.space	2
.LC266:
	ASCII(.ascii	"SPS_SVC_EXT: extended_spatial_scalability_idc\000" )
	.space	2
.LC267:
	ASCII(.ascii	"spatial scalability not support!!\012\000" )
	.space	1
.LC268:
	ASCII(.ascii	"SPS_SVC_EXT: chroma_phase_x_plus1_flag\000" )
	.space	1
.LC269:
	ASCII(.ascii	"chroma_phase_x_plus1_flag:%d!!\012\000" )
.LC270:
	ASCII(.ascii	"SPS_SVC_EXT: chroma_phase_y_plus1\000" )
	.space	2
.LC271:
	ASCII(.ascii	"chroma_phase_y_plus1:%d!\012\000" )
	.space	2
.LC272:
	ASCII(.ascii	"SPS_SVC_EXT: seq_tcoeff_level_prediction_flag\000" )
	.space	2
.LC273:
	ASCII(.ascii	"SPS_SVC_EXT: adaptive_tcoeff_level_prediction_flag\000" )
	.space	1
.LC274:
	ASCII(.ascii	"adaptive_tcoeff_level_prediction_flag:%d!\012\000" )
	.space	1
.LC275:
	ASCII(.ascii	"SPS_SVC_EXT: slice_header_restriction_flag\000" )
	.space	1
.LC276:
	ASCII(.ascii	"slice_header_restriction_flag error:%d,%x,%d\012\000" )
	.space	2
.LC277:
	ASCII(.ascii	"SPS: profile_idc\000" )
	.space	3
.LC278:
	ASCII(.ascii	"SPS: constrained_set0_flag\000" )
	.space	1
.LC279:
	ASCII(.ascii	"SPS: constrained_set1_flag\000" )
	.space	1
.LC280:
	ASCII(.ascii	"SPS: constrained_set2_flag\000" )
	.space	1
.LC281:
	ASCII(.ascii	"SPS: constrained_set3_flag\000" )
	.space	1
.LC282:
	ASCII(.ascii	"SPS: reserved_zero_4bits\000" )
	.space	3
.LC283:
	ASCII(.ascii	"SPS: level_idc\000" )
	.space	1
.LC284:
	ASCII(.ascii	"SPS: seq_parameter_set_id\000" )
	.space	2
.LC285:
	ASCII(.ascii	"Baseline stream, try to decode, exit when FMO occur" )
	ASCII(.ascii	"red.\012\000" )
	.space	3
.LC286:
	ASCII(.ascii	"EXTENDED stream, try to decode, exit when dataparti" )
	ASCII(.ascii	"tion occurred.\012\000" )
	.space	1
.LC287:
	ASCII(.ascii	"others High profile stream, try to decode, exit whe" )
	ASCII(.ascii	"n high profile not support occurred.\012\000" )
	.space	3
.LC288:
	ASCII(.ascii	"profile_idc = %5d error, try to decode as main prof" )
	ASCII(.ascii	"ile.\012\000" )
	.space	3
.LC289:
	ASCII(.ascii	"level_idc = %5d error, try to decode as level_idc %" )
	ASCII(.ascii	"d.\012\000" )
	.space	1
.LC290:
	ASCII(.ascii	"Line %d: SPS[%d] decode error.\012\000" )
.LC291:
	ASCII(.ascii	"svc ext error:\012\000" )
.LC292:
	ASCII(.ascii	"SEI: frame_packing_arrangement_id\000" )
	.space	2
.LC293:
	ASCII(.ascii	"SEI: frame_packing_arrangement_cancel_flag\000" )
	.space	1
.LC294:
	ASCII(.ascii	"SEI: frame_packing_arrangement_type\000" )
.LC295:
	ASCII(.ascii	"SEI: quincunx_sampling_flag\000" )
.LC296:
	ASCII(.ascii	"SEI: content_interpretation_type\000" )
	.space	3
.LC297:
	ASCII(.ascii	"SEI: spatial_flipping_flag\000" )
	.space	1
.LC298:
	ASCII(.ascii	"SEI: frame0_flipped_flag\000" )
	.space	3
.LC299:
	ASCII(.ascii	"SEI: field_views_flag\000" )
	.space	2
.LC300:
	ASCII(.ascii	"SEI: current_frame_is_frame0_flag\000" )
	.space	2
.LC301:
	ASCII(.ascii	"SEI: frame0_self_contained_flag\000" )
.LC302:
	ASCII(.ascii	"SEI: frame1_self_contained_flag\000" )
.LC303:
	ASCII(.ascii	"SEI: frame0_grid_position_x\000" )
.LC304:
	ASCII(.ascii	"SEI: frame0_grid_position_y\000" )
.LC305:
	ASCII(.ascii	"SEI: frame1_grid_position_x\000" )
.LC306:
	ASCII(.ascii	"SEI: frame1_grid_position_y\000" )
.LC307:
	ASCII(.ascii	"SEI: frame_packing_arrangement_reserved_byte\000" )
	.space	3
.LC308:
	ASCII(.ascii	"SEI: frame_packing_arrangement_repetition_period\000" )
	.space	3
.LC309:
	ASCII(.ascii	"SEI: frame_packing_arrangement_extension_flag\000" )
	.space	2
.LC310:
	ASCII(.ascii	"DecPicTimingSEI but SPS is invalid.\012\000" )
	.space	3
.LC311:
	ASCII(.ascii	"SEI: cpb_removal_delay\000" )
	.space	1
.LC312:
	ASCII(.ascii	"SEI: dpb_output_delay\000" )
	.space	2
.LC313:
	ASCII(.ascii	"pic_struct\000" )
	.space	1
.LC314:
	ASCII(.ascii	"SEI nal dec payload type err\012\000" )
	.space	2
.LC315:
	ASCII(.ascii	"SEI nal dec payloadSize err\012\000" )
	.space	3
.LC316:
	ASCII(.ascii	"SEI_BUFFERING_PERIOD,offset = %d,payload_size = %d " )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC317:
	ASCII(.ascii	"PassBytes err [%s][%d]\012\000" )
.LC318:
	ASCII(.ascii	"SEI_PIC_TIMING,offset = %d,payload_size = %d \012\000" )
	.space	1
.LC319:
	ASCII(.ascii	"SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC320:
	ASCII(.ascii	"SEI_FILLER_PAYLOAD,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC321:
	ASCII(.ascii	"SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d, pa" )
	ASCII(.ascii	"yload_size = %d \012\000" )
	.space	3
.LC322:
	ASCII(.ascii	"SEI_USER_DATA_UNREGISTERED, offset = %d, payload_si" )
	ASCII(.ascii	"ze = %d \012\000" )
	.space	3
.LC323:
	ASCII(.ascii	"SEI: itu_t_t35_country_code\000" )
.LC324:
	ASCII(.ascii	"SEI: itu_t_t35_country_code_extension_byte\000" )
	.space	1
.LC325:
	ASCII(.ascii	"SEI: itu_t_t35_provider_code\000" )
	.space	3
.LC326:
	ASCII(.ascii	"len_tmp = %d cann't dec usrdata\012\000" )
	.space	3
.LC327:
	ASCII(.ascii	"cann't dec usrdata\012\000" )
.LC328:
	ASCII(.ascii	"SEI_RECOVERY_POINT,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC329:
	ASCII(.ascii	"SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d,payl" )
	ASCII(.ascii	"oad_size = %d \012\000" )
	.space	1
.LC330:
	ASCII(.ascii	"SEI_SPARE_PIC,offset = %d,payload_size = %d \012\000" )
	.space	2
.LC331:
	ASCII(.ascii	"SEI_SCENE_INFO,offset = %d,payload_size = %d \012\000" )
	.space	1
.LC332:
	ASCII(.ascii	"SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC333:
	ASCII(.ascii	"SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,paylo" )
	ASCII(.ascii	"ad_size = %d \012\000" )
	.space	2
.LC334:
	ASCII(.ascii	"SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload_siz" )
	ASCII(.ascii	"e = %d \012\000" )
.LC335:
	ASCII(.ascii	"SEI_FULL_FRAME_FREEZE,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC336:
	ASCII(.ascii	"SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,payload_s" )
	ASCII(.ascii	"ize = %d \012\000" )
	.space	2
.LC337:
	ASCII(.ascii	"SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_size = " )
	ASCII(.ascii	"%d \012\000" )
.LC338:
	ASCII(.ascii	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset = %" )
	ASCII(.ascii	"d,payload_size = %d \012\000" )
	.space	3
.LC339:
	ASCII(.ascii	"SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC340:
	ASCII(.ascii	"SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC341:
	ASCII(.ascii	"SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payload_" )
	ASCII(.ascii	"size = %d \012\000" )
	.space	1
.LC342:
	ASCII(.ascii	"SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset = %" )
	ASCII(.ascii	"d,payload_size = %d \012\000" )
	.space	3
.LC343:
	ASCII(.ascii	"SEI_STEREO_VIDEO_INFO,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC344:
	ASCII(.ascii	"too much usrdat, cann't dec SEI\012\000" )
	.space	3
.LC345:
	ASCII(.ascii	"\012the stream is error,len:%d\012\000" )
	.space	3
.LC346:
	ASCII(.ascii	"\012Slice nal or IDR nal = %d\012\000" )
.LC347:
	ASCII(.ascii	"sliceheader dec err\012\000" )
	.space	3
.LC348:
	ASCII(.ascii	"H264Dec destroy\012\000" )
	.space	3
.LC349:
	ASCII(.ascii	"H264 recycle image\012\000" )
.LC350:
	ASCII(.ascii	"pH264Ctx is %p, pFrameStore is %p\012\000" )
	.space	1
.LC351:
	ASCII(.ascii	"line; %d pstLogicFsImage is NULL!\012\000" )
	.space	1
.LC352:
	ASCII(.ascii	"InsertVO err:%d, ClearAll\012\000" )
	.space	1
.LC353:
	ASCII(.ascii	"H264.c line %d: frame para err(ret=%d), recycle ima" )
	ASCII(.ascii	"ge self\012\000" )
.LC354:
	ASCII(.ascii	"line: %d pstLogicFsImage is NULL!\012\000" )
	.space	1
.LC355:
	ASCII(.ascii	"[%s][%d] OutputFrmToVO return %d\012\000" )
	.space	2
.LC356:
	ASCII(.ascii	"line %d: flush dpb return %d\012\000" )
	.space	2
.LC357:
	ASCII(.ascii	"----------------- Imode -> %d ------------------\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC358:
	ASCII(.ascii	"I_MODE but first_mb_in_slice != 0\012\000" )
	.space	1
.LC359:
	ASCII(.ascii	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\012\000" )
.LC360:
	ASCII(.ascii	"***** VDM start, TotalPicNum=%d, pH264Ctx->CurrPic." )
	ASCII(.ascii	"structure=%d.\012\000" )
	.space	2
.LC361:
	ASCII(.ascii	"DecVDM ERR\012\000" )
.LC362:
	ASCII(.ascii	"%s:%d Metadata map failed\012\000" )
	.space	1
.LC363:
	ASCII(.ascii	"%s:%d Metadata unmap failed\012\000" )
	.space	3
.LC364:
	ASCII(.ascii	"*****[%s][%d],EL Codec can only dec EL stream in DV" )
	ASCII(.ascii	"_DUAL_VES_IMP stream!!*****\012\000" )
.LC365:
	ASCII(.ascii	"***** VES Splitter: UNSUPPORT, HDR_capacity=%d*****" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC366:
	ASCII(.ascii	"\012 receive streambuff=%p; phy_addr=0x%x; bitstrea" )
	ASCII(.ascii	"m_length=%d\012\000" )
	.space	3
.LC367:
	ASCII(.ascii	"nal_release_err\012\000" )
	.space	3
.LC368:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC369:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC370:
	ASCII(.ascii	"clear all dec para\012\000" )
.LC371:
	ASCII(.ascii	"[%s %d], pos is %d out of range\012\000" )
	.space	3
.LC372:
	ASCII(.ascii	"line %d, get APC error, ret %d\012\000" )
.LC373:
	ASCII(.ascii	"InserFrmInDPB: cur pic struct = %d!\012\000" )
	.space	3
.LC374:
	ASCII(.ascii	"CurrPic.state is 'EMPTY'\012\000" )
	.space	2
.LC375:
	ASCII(.ascii	"StorePicInDPB return(%d) from L%d\012\000" )
	.space	1
.LC376:
	ASCII(.ascii	"directoutput mode\012\000" )
	.space	1
.LC377:
	ASCII(.ascii	"line: %d pImg is NULL!\012\000" )
.LC378:
	ASCII(.ascii	"line %d, REPORT_IFRAME_ERR\012\000" )
.LC379:
	ASCII(.ascii	"line %d, return %d\012\000" )
.LC380:
	ASCII(.ascii	"err(%d) > ref_thr(%d)\012\000" )
	.space	1
.LC381:
	ASCII(.ascii	"marking return %d\012\000" )
	.space	1
.LC382:
	ASCII(.ascii	"return value is unexpeced!\012\000" )
.LC383:
	ASCII(.ascii	"line %d: pH264Ctx->DPB.size = %d, ref %d, ltref %d\012" )
	ASCII(.ascii	"\000" )
.LC384:
	ASCII(.ascii	"%s: pos(%d) = pre_pos, force return.\012\000" )
	.space	2
.LC385:
	ASCII(.ascii	"FS_ALLOC_ERR, ClearAll\012\000" )
.LC386:
	ASCII(.ascii	"Can not new logic fs! ClearAll\012\000" )
.LC387:
	ASCII(.ascii	"GAP found while DPB is empty!\012\000" )
	.space	1
.LC388:
	ASCII(.ascii	"frame num gap try to fill it \012\000" )
	.space	1
.LC389:
	ASCII(.ascii	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC390:
	ASCII(.ascii	"cann't allocate frame store when gap find\012\000" )
	.space	1
.LC391:
	ASCII(.ascii	"allocate frame store when gap find\012\000" )
.LC392:
	ASCII(.ascii	"line %d: store gap pic err, ret=%d\012\000" )
.LC393:
	ASCII(.ascii	"%s %d unknow error!!\012\000" )
	.space	2
.LC394:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC395:
	ASCII(.ascii	"%s %d frame_store is null!!\012\000" )
	.space	3
.LC396:
	ASCII(.ascii	"line %d: init dpb return %d\012\000" )
	.space	3
.LC397:
	ASCII(.ascii	"resolution error, the CAP_LEVEL_USER_DEFINE_WITH_OP" )
	ASCII(.ascii	"TION channel with s32ReRangeEn == 0 can't support s" )
	ASCII(.ascii	"uch bitstream.\012\000" )
	.space	2
.LC398:
	ASCII(.ascii	"s32MaxRefFrameNum < pH264Ctx->DPB.size, the CAP_LEV" )
	ASCII(.ascii	"EL_USER_DEFINE_WITH_OPTION channel can't support su" )
	ASCII(.ascii	"ch bitstream.\012\000" )
	.space	3
.LC399:
	ASCII(.ascii	"mem arrange err, ClearAll\012\000" )
	.space	1
.LC400:
	ASCII(.ascii	"get back frm\012\000" )
	.space	2
.LC401:
	ASCII(.ascii	"line %d: frame gap(=%d) > dpb size(=%d)\012\000" )
	.space	3
.LC402:
	ASCII(.ascii	"line %d: dec gap failed\012\000" )
	.space	3
.LC403:
	ASCII(.ascii	"line %d: alloc framestore failed\012\000" )
	.space	2
.LC404:
	ASCII(.ascii	"dec_pts: %lld\012\000" )
	.space	1
.LC405:
	ASCII(.ascii	"dec_usertag: %lld\012\000" )
	.space	1
.LC406:
	ASCII(.ascii	"%s %d NULL == pH264Ctx->CurrPic.frame_store!!\012\000" )
	.space	1
.LC407:
	ASCII(.ascii	"Start Reason: SliceParaNum, MaxBytesReceived = %d, " )
	ASCII(.ascii	"%d(thr=%d)\012\000" )
	.space	1
.LC408:
	ASCII(.ascii	"Too many slice or bitstream, err!\012\000" )
	.space	1
.LC409:
	ASCII(.ascii	"Start Reason: new_pic_flag\012\000" )
.LC410:
	ASCII(.ascii	"init pic err, find next recover point or next valid" )
	ASCII(.ascii	" sps, pps, or exit\012\000" )
	.space	1
.LC411:
	ASCII(.ascii	"DecList error, ret=%d\012\000" )
	.space	1
.LC412:
	ASCII(.ascii	"dec list err.\012\000" )
	.space	1
.LC413:
	ASCII(.ascii	"pH264Ctx->TotalNal = %d, type:%d\012\000" )
	.space	2
.LC414:
	ASCII(.ascii	"stop i want\012\000" )
	.space	3
.LC415:
	ASCII(.ascii	"svc_extension_flag error:priority_id:%d, pred_flag%" )
	ASCII(.ascii	"d\012\000" )
	.space	2
.LC416:
	ASCII(.ascii	"%d,%d,%d\012\000" )
	.space	2
.LC417:
	ASCII(.ascii	"svc stream,nal_header:%x\012\000" )
	.space	2
.LC418:
	ASCII(.ascii	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC419:
	ASCII(.ascii	"SliceCheck failed, clear current slice.\012\000" )
	.space	3
.LC420:
	ASCII(.ascii	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\012\000" )
	.space	1
.LC421:
	ASCII(.ascii	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\012\000" )
	.space	1
.LC422:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC423:
	ASCII(.ascii	"***** NAL: SEI, nal_unit_type=%d\012\000" )
	.space	2
.LC424:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC425:
	ASCII(.ascii	"***** NAL: AUD, nal_unit_type=%d\012\000" )
	.space	2
.LC426:
	ASCII(.ascii	"***** NAL: EOSEQ, nal_unit_type=%d\012\000" )
.LC427:
	ASCII(.ascii	"***** NAL: FILL, nal_unit_type=%d\012\000" )
	.space	1
.LC428:
	ASCII(.ascii	"***** NAL: EOSTREAM, nal_unit_type=%d\012\000" )
	.space	1
.LC429:
	ASCII(.ascii	"***** NAL: SPSEXT, nal_unit_type=%d\012\000" )
	.space	3
.LC430:
	ASCII(.ascii	"***** NAL: AUX, nal_unit_type=%d\012\000" )
	.space	2
.LC431:
	ASCII(.ascii	"***** NAL: EOPIC, nal_unit_type=%d\012\000" )
.LC432:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC433:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC434:
	ASCII(.ascii	"FindTrailZeros ERR\012\000" )
.LC435:
	ASCII(.ascii	"H264_DecOneNal ERR\012\000" )
.LC436:
	ASCII(.ascii	"store pic err, ret = %d\012\000" )
	.space	3
.LC437:
	ASCII(.ascii	"imode nal store pic err, ret = %d\012\000" )
	.space	1
.LC438:
	ASCII(.ascii	"imode nal flush dpb err, ret = %d\012\000" )
	.space	1
.LC439:
	ASCII(.ascii	"cann't find FrameStore\012\000" )
.LC440:
	ASCII(.ascii	"========== H264 FrameStore state(is_used, is_in_dpb" )
	ASCII(.ascii	", IsOutDPB) ========\012\000" )
	.space	3
.LC441:
	ASCII(.ascii	"ReadImgNum = %d, NewImgNum = %d\012\000" )
	.space	3
.LC442:
	ASCII(.ascii	"%02d: %d %d %d\012\000" )
.LC443:
	ASCII(.ascii	"FrameStore leak, ClearAll\012\000" )
	.bss
	.align	2
.LANCHOR2 = . + 0
.LANCHOR3 = . + 8184
	.type	pps_tmp.15655, %object
	.size	pps_tmp.15655, 2208
pps_tmp.15655:
	.space	2208
	.type	sps_tmp.15804, %object
	.size	sps_tmp.15804, 4000
sps_tmp.15804:
	.space	4000
	.type	TmpBuf, %object
	.size	TmpBuf, 68
TmpBuf:
	.space	68
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
