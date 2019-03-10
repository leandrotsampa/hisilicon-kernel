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
	.file	"mvc.c"
	.text
	.align	2
	.global	MVC_IsSTRefFlg
	.type	MVC_IsSTRefFlg, %function
MVC_IsSTRefFlg:
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
	.size	MVC_IsSTRefFlg, .-MVC_IsSTRefFlg
	.align	2
	.global	MVC_IsLTRefFlg
	.type	MVC_IsLTRefFlg, %function
MVC_IsLTRefFlg:
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
	.size	MVC_IsLTRefFlg, .-MVC_IsLTRefFlg
	.align	2
	.global	MVC_compare_pic_by_pic_num_desc
	.type	MVC_compare_pic_by_pic_num_desc, %function
MVC_compare_pic_by_pic_num_desc:
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
	blt	.L5
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L5:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_pic_by_pic_num_desc, .-MVC_compare_pic_by_pic_num_desc
	.align	2
	.global	MVC_compare_pic_by_lt_pic_num_asc
	.type	MVC_compare_pic_by_lt_pic_num_asc, %function
MVC_compare_pic_by_lt_pic_num_asc:
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
	blt	.L9
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L9:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_pic_by_lt_pic_num_asc, .-MVC_compare_pic_by_lt_pic_num_asc
	.align	2
	.global	MVC_compare_fs_by_frame_num_desc
	.type	MVC_compare_fs_by_frame_num_desc, %function
MVC_compare_fs_by_frame_num_desc:
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
	ldr	r2, [r2, #24]
	ldr	r3, [r3, #24]
	cmp	r2, r3
	blt	.L12
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L12:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_fs_by_frame_num_desc, .-MVC_compare_fs_by_frame_num_desc
	.align	2
	.global	MVC_compare_fs_by_lt_pic_idx_asc
	.type	MVC_compare_fs_by_lt_pic_idx_asc, %function
MVC_compare_fs_by_lt_pic_idx_asc:
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
	ldr	r2, [r2, #28]
	ldr	r3, [r3, #28]
	cmp	r2, r3
	bcc	.L15
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L15:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_fs_by_lt_pic_idx_asc, .-MVC_compare_fs_by_lt_pic_idx_asc
	.align	2
	.global	MVC_compare_pic_by_poc_asc
	.type	MVC_compare_pic_by_poc_asc, %function
MVC_compare_pic_by_poc_asc:
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
	ldr	r2, [r2, #16]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	blt	.L18
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L18:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_pic_by_poc_asc, .-MVC_compare_pic_by_poc_asc
	.align	2
	.global	MVC_compare_pic_by_poc_desc
	.type	MVC_compare_pic_by_poc_desc, %function
MVC_compare_pic_by_poc_desc:
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
	ldr	r2, [r2, #16]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	blt	.L21
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L21:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_pic_by_poc_desc, .-MVC_compare_pic_by_poc_desc
	.align	2
	.global	MVC_compare_fs_by_poc_asc
	.type	MVC_compare_fs_by_poc_asc, %function
MVC_compare_fs_by_poc_asc:
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
	ldr	r2, [r2, #32]
	ldr	r3, [r3, #32]
	cmp	r2, r3
	blt	.L24
	movgt	r0, #1
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L24:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_fs_by_poc_asc, .-MVC_compare_fs_by_poc_asc
	.align	2
	.global	MVC_compare_fs_by_poc_desc
	.type	MVC_compare_fs_by_poc_desc, %function
MVC_compare_fs_by_poc_desc:
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
	ldr	r2, [r2, #32]
	ldr	r3, [r3, #32]
	cmp	r2, r3
	blt	.L27
	mvngt	r0, #0
	movle	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L27:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_compare_fs_by_poc_desc, .-MVC_compare_fs_by_poc_desc
	.align	2
	.type	MVC_SetFrmRepeatCount.part.1, %function
MVC_SetFrmRepeatCount.part.1:
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
	add	ip, r0, #11075584
	ldr	lr, [r0, #136]
	add	ip, ip, #45056
	ldr	r3, [r0, #132]
	ldr	r2, [ip, #3016]
	mov	r3, r3, lsr #1
	add	r2, r2, lr, lsr #1
	add	ip, r2, #1
	cmp	r3, ip
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
	ldrhi	r3, [r0, #136]
	ldrls	r3, [r0, #136]
	addhi	r3, r3, #4
	addls	r3, r3, #2
	str	r3, [r0, #136]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_SetFrmRepeatCount.part.1, .-MVC_SetFrmRepeatCount.part.1
	.align	2
	.type	MVC_CombinePacket.part.12, %function
MVC_CombinePacket.part.12:
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
	ldr	r1, .L33
	mov	r4, r0
	mov	r0, #7
	bl	dprint_vfmw
	ldr	ip, [r4, #232]
	ldr	r1, .L33+4
	mov	r0, #7
	mov	r5, #0
	ldr	lr, [ip, #40]
	ldr	r3, [ip, #44]
	ldr	r2, [ip, #16]
	str	lr, [sp, #4]
	ldr	ip, [ip, #12]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #232]
	ldr	ip, .L33+8
	ldr	r2, [r3, #12]
	ldr	r0, [r3, #36]
	ldr	r1, [r3, #8]
	rsb	r0, r2, r0
	ldr	r3, [ip, #52]
	blx	r3
	ldr	r3, [r4, #232]
	mov	ip, #1
	ldr	r1, .L33+12
	mov	r0, #7
	ldr	r2, [r3, #60]
	ldr	r6, [r3, #32]
	str	r2, [r3, #32]
	ldr	r3, [r4, #232]
	str	r5, [r3, #24]
	ldr	r3, [r4, #232]
	ldr	lr, [r3, #12]
	ldr	r2, [r3, #36]
	rsb	r2, lr, r2
	str	r2, [r3, #8]
	ldr	r3, [r4, #232]
	ldr	lr, [r3, #12]
	ldr	r2, [r3, #44]
	rsb	r2, lr, r2
	str	r2, [r3, #16]
	ldr	r3, [r4, #232]
	ldr	lr, [r3, #40]
	ldr	r2, [r3, #12]
	add	r2, r2, lr
	str	r2, [r3, #12]
	ldr	r3, [r4, #232]
	str	ip, [r3, #68]
	ldr	r2, [r4, #232]
	ldr	r3, [r2, #12]
	ldr	r2, [r2, #16]
	bl	dprint_vfmw
	mov	r1, r6
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #232]
	str	r5, [r3, #36]
	ldr	r3, [r4, #232]
	str	r5, [r3, #52]
	ldr	r3, [r4, #232]
	str	r5, [r3, #40]
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L34:
	.align	2
.L33:
	.word	.LC0
	.word	.LC1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC2
	UNWIND(.fnend)
	.size	MVC_CombinePacket.part.12, .-MVC_CombinePacket.part.12
	.align	2
	.global	mvc_ue_v
	.type	mvc_ue_v, %function
mvc_ue_v:
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
	add	r8, r0, #548
	mov	r6, r0
	mov	r7, r1
	mov	r1, #32
	mov	r0, r8
	bl	BsShow
	mov	r5, r0
	bl	ZerosMS_32
	cmp	r0, #15
	mov	r4, r0
	bls	.L39
	cmp	r0, #31
	bls	.L40
	mvn	r5, #0
	mov	r8, #32
	mov	r3, #1
	strb	r3, [r6, #10]
.L37:
	ldr	r6, [r6, #232]
	mov	r2, r7
	mov	r3, r5
	ldr	r1, .L41
	mov	r0, #21
	ldr	lr, [r6, #64]
	add	r4, lr, r8
	str	r4, [r6, #64]
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L39:
	mov	r4, r0, asl #1
	mov	r0, r8
	add	r8, r4, #1
	rsb	r4, r4, #31
	mov	r4, r5, lsr r4
	mov	r1, r8
	sub	r5, r4, #1
	bl	BsSkip
	b	.L37
.L40:
	add	r5, r0, #1
	mov	r1, r0
	mov	r0, r8
	bl	BsSkip
	mov	r1, r5
	mov	r0, r8
	bl	BsShow
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r8
	bl	BsSkip
	mov	ip, r4, asl #1
	add	r8, ip, #1
	b	.L37
.L42:
	.align	2
.L41:
	.word	.LC3
	UNWIND(.fnend)
	.size	mvc_ue_v, .-mvc_ue_v
	.align	2
	.global	mvc_se_v
	.type	mvc_se_v, %function
mvc_se_v:
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
	add	r7, r0, #548
	mov	r8, r0
	mov	r6, r1
	mov	r1, #32
	mov	r0, r7
	bl	BsShow
	mov	r4, r0
	bl	ZerosMS_32
	cmp	r0, #15
	mov	r5, r0
	bhi	.L44
	mov	r5, r0, asl #1
	mov	r0, r7
	rsb	r3, r5, #31
	add	r5, r5, #1
	mov	r3, r4, lsr r3
	and	r2, r3, #1
	mov	r1, r5
	rsb	r4, r2, #0
	eor	r3, r4, r3, lsr #1
	add	r4, r3, r2
	bl	BsSkip
.L45:
	ldr	lr, [r8, #232]
	mov	r2, r6
	mov	r3, r4
	ldr	r1, .L48
	mov	r0, #21
	ldr	ip, [lr, #64]
	add	r5, ip, r5
	str	r5, [lr, #64]
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L44:
	cmp	r0, #31
	bls	.L47
	mov	r3, #1
	mvn	r4, #-2147483648
	mov	r5, #32
	strb	r3, [r8, #10]
	b	.L45
.L47:
	mov	r1, r0
	mov	r0, r7
	bl	BsSkip
	mov	r1, r5
	mov	r0, r7
	mov	r5, r5, asl #1
	bl	BsGet
	mov	r1, #1
	add	r5, r5, #1
	mov	r9, r0
	mov	r0, r7
	bl	BsGet
	and	r0, r0, #1
	rsb	r4, r0, #0
	eor	r9, r9, r4
	add	r4, r9, r0
	b	.L45
.L49:
	.align	2
.L48:
	.word	.LC3
	UNWIND(.fnend)
	.size	mvc_se_v, .-mvc_se_v
	.align	2
	.global	mvc_u_v
	.type	mvc_u_v, %function
mvc_u_v:
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
	add	r0, r0, #548
	mov	r6, r1
	mov	r7, r2
	bl	BsGet
	ldr	lr, [r5, #232]
	mov	r2, r7
	ldr	r1, .L51
	ldr	ip, [lr, #64]
	add	ip, ip, r6
	str	ip, [lr, #64]
	mov	r4, r0
	mov	r3, r0
	mov	r0, #21
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	.LC3
	UNWIND(.fnend)
	.size	mvc_u_v, .-mvc_u_v
	.align	2
	.global	mvc_u_1
	.type	mvc_u_1, %function
mvc_u_1:
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
	mov	r6, r1
	add	r0, r0, #548
	mov	r1, #1
	bl	BsGet
	ldr	lr, [r5, #232]
	mov	r2, r6
	ldr	r1, .L54
	ldr	ip, [lr, #64]
	add	ip, ip, #1
	str	ip, [lr, #64]
	mov	r4, r0
	mov	r3, r0
	mov	r0, #21
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L55:
	.align	2
.L54:
	.word	.LC3
	UNWIND(.fnend)
	.size	mvc_u_1, .-mvc_u_1
	.align	2
	.global	MVC_GetMinPOC
	.type	MVC_GetMinPOC, %function
MVC_GetMinPOC:
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
	add	r10, r0, #11075584
	add	r10, r10, #45056
	mov	r9, r3
	mov	r8, r2
	mvn	r3, #-2147483648
	mvn	r2, #0
	str	r2, [r9]
	str	r3, [r8]
	mov	r6, r0
	ldr	r3, [r10, #3016]
	mov	r7, r1
	ldr	r2, [r10, #3020]
	cmp	r2, r3
	strhi	r3, [r10, #3020]
	cmp	r3, #0
	beq	.L63
	movw	r5, #47876
	mvn	r3, #0
	movt	r5, 169
	str	r3, [fp, #-48]
	add	r5, r0, r5
	mov	r4, #0
	b	.L62
.L60:
	ldr	r1, [r8]
	ldr	r2, [r3, #32]
	cmp	r1, r2
	ble	.L59
	ldrb	r1, [r3, #5]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L59
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	sub	r1, r1, #1
	cmp	r1, #1
	bls	.L78
.L59:
	ldr	r3, [r10, #3016]
	add	r4, r4, #1
	cmp	r3, r4
	bls	.L63
.L62:
	ldr	r3, [r5, #4]!
	cmp	r3, #0
	beq	.L59
	ldrsb	r1, [r3, #6]
	ldr	r0, [r6, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L59
	cmn	r7, #1
	ldr	r3, [r5]
	bne	.L60
	ldrb	r2, [r3, #5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L59
	ldrb	r2, [r0, #1]	@ zero_extendqisi2
	sub	r2, r2, #1
	cmp	r2, #1
	bhi	.L59
	ldr	r1, [r8]
	ldr	r2, [r3, #32]
	cmp	r1, r2
	ble	.L61
	str	r2, [r8]
	str	r4, [r9]
	add	r4, r4, #1
	ldr	r3, [r5]
	ldr	r3, [r3, #56]
	str	r3, [fp, #-48]
	ldr	r3, [r10, #3016]
	cmp	r3, r4
	bhi	.L62
.L63:
	ldr	r0, [r9]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L78:
	ldr	r3, [r3, #56]
	cmp	r7, r3
	streq	r2, [r8]
	streq	r4, [r9]
	b	.L59
.L61:
	bne	.L59
	ldr	r3, [r3, #56]
	ldr	r2, [fp, #-48]
	cmp	r3, r2
	strlt	r4, [r9]
	ldrlt	r3, [r5]
	ldrlt	r3, [r3, #56]
	strlt	r3, [fp, #-48]
	b	.L59
	UNWIND(.fnend)
	.size	MVC_GetMinPOC, .-MVC_GetMinPOC
	.align	2
	.global	MVC_FrameStoreRefFlg
	.type	MVC_FrameStoreRefFlg, %function
MVC_FrameStoreRefFlg:
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
	ldrb	r0, [r0, #3]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_FrameStoreRefFlg, .-MVC_FrameStoreRefFlg
	.align	2
	.global	MVC_NonLongTermRefFlg
	.type	MVC_NonLongTermRefFlg, %function
MVC_NonLongTermRefFlg:
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
	cmp	r3, #3
	beq	.L95
	tst	r3, #1
	bne	.L96
.L84:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L88
.L85:
	ldrb	r0, [r0, #809]	@ zero_extendqisi2
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L88:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L96:
	ldrb	r2, [r0, #773]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L84
.L89:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L95:
	ldrb	r3, [r0, #737]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L89
	ldrb	r3, [r0, #773]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L85
	b	.L89
	UNWIND(.fnend)
	.size	MVC_NonLongTermRefFlg, .-MVC_NonLongTermRefFlg
	.align	2
	.global	MVC_ShortTermRefFlg
	.type	MVC_ShortTermRefFlg, %function
MVC_ShortTermRefFlg:
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
	cmp	r3, #3
	beq	.L112
	tst	r3, #1
	bne	.L113
.L101:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L105
.L102:
	ldr	r0, [r0, #808]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #65536
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L105:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L113:
	ldr	r2, [r0, #772]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #65536
	bne	.L101
.L106:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L112:
	ldr	r3, [r0, #736]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L106
	ldr	r3, [r0, #772]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	bne	.L102
	b	.L106
	UNWIND(.fnend)
	.size	MVC_ShortTermRefFlg, .-MVC_ShortTermRefFlg
	.align	2
	.global	MVC_LongTermRefFlg
	.type	MVC_LongTermRefFlg, %function
MVC_LongTermRefFlg:
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
	cmp	r3, #3
	beq	.L129
	tst	r3, #1
	bne	.L130
.L118:
	and	r3, r3, #2
	ands	r3, r3, #255
	beq	.L122
.L119:
	ldr	r0, [r0, #808]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	sub	r0, r0, #256
	clz	r0, r0
	mov	r0, r0, lsr #5
	ldmfd	sp, {fp, sp, pc}
.L122:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L130:
	ldr	r2, [r0, #772]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #256
	bne	.L118
.L123:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L129:
	ldr	r3, [r0, #736]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L123
	ldr	r3, [r0, #772]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	bne	.L119
	b	.L123
	UNWIND(.fnend)
	.size	MVC_LongTermRefFlg, .-MVC_LongTermRefFlg
	.align	2
	.global	MVC_UpdateLTReflist
	.type	MVC_UpdateLTReflist, %function
MVC_UpdateLTReflist:
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
	add	r3, r0, #11075584
	add	r3, r3, #45056
	mov	r7, r0
	str	r3, [fp, #-48]
	ldr	r10, [r3, #3016]
	cmp	r10, #0
	beq	.L132
	movw	r8, #47876
	add	r9, r0, #11141120
	movt	r8, 169
	mov	r4, #0
	add	r9, r9, #16384
	add	r8, r0, r8
	mov	r6, r4
.L134:
	ldr	r5, [r8, #4]!
	add	r6, r6, #1
	cmp	r5, #0
	mov	r0, r5
	beq	.L133
	bl	MVC_LongTermRefFlg
	cmp	r0, #0
	beq	.L133
	ldr	r2, [r9, #1200]
	ldr	r1, [r5, #56]
	cmp	r1, r2
	movweq	r2, #28386
	movteq	r2, 42
	addeq	r2, r4, r2
	addeq	r4, r4, #1
	streq	r5, [r7, r2, asl #2]
.L133:
	cmp	r6, r10
	bne	.L134
	ldr	r3, [fp, #-48]
	cmp	r4, r10
	str	r4, [r3, #3028]
	bcs	.L131
	movw	r0, #28385
	mov	r2, #0
	movt	r0, 42
	add	r0, r4, r0
	add	r0, r7, r0, lsl #2
.L137:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r10
	bne	.L137
.L131:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L132:
	ldr	r3, [fp, #-48]
	str	r10, [r3, #3028]
	b	.L131
	UNWIND(.fnend)
	.size	MVC_UpdateLTReflist, .-MVC_UpdateLTReflist
	.align	2
	.global	MVC_UpdateReflist
	.type	MVC_UpdateReflist, %function
MVC_UpdateReflist:
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
	add	r3, r0, #11075584
	add	r3, r3, #45056
	mov	r7, r0
	str	r3, [fp, #-48]
	ldr	r10, [r3, #3016]
	cmp	r10, #0
	beq	.L148
	movw	r8, #47876
	add	r9, r0, #11141120
	movt	r8, 169
	mov	r4, #0
	add	r9, r9, #16384
	add	r8, r0, r8
	mov	r6, r4
.L150:
	ldr	r5, [r8, #4]!
	add	r6, r6, #1
	cmp	r5, #0
	mov	r0, r5
	beq	.L149
	bl	MVC_ShortTermRefFlg
	cmp	r0, #0
	beq	.L149
	ldr	r2, [r9, #1200]
	ldr	r1, [r5, #56]
	cmp	r1, r2
	movweq	r2, #28370
	movteq	r2, 42
	addeq	r2, r4, r2
	addeq	r4, r4, #1
	streq	r5, [r7, r2, asl #2]
.L149:
	cmp	r6, r10
	bne	.L150
	ldr	r3, [fp, #-48]
	cmp	r4, r10
	str	r4, [r3, #3024]
	bcs	.L147
	movw	r0, #28369
	mov	r2, #0
	movt	r0, 42
	add	r0, r4, r0
	add	r0, r7, r0, lsl #2
.L153:
	add	r4, r4, #1
	str	r2, [r0, #4]!
	cmp	r4, r10
	bne	.L153
.L147:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L148:
	ldr	r3, [fp, #-48]
	str	r10, [r3, #3024]
	b	.L147
	UNWIND(.fnend)
	.size	MVC_UpdateReflist, .-MVC_UpdateReflist
	.align	2
	.global	MVC_GetPicNumX
	.type	MVC_GetPicNumX, %function
MVC_GetPicNumX:
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
	.size	MVC_GetPicNumX, .-MVC_GetPicNumX
	.align	2
	.global	MVC_UnMarkFrameStoreRef
	.type	MVC_UnMarkFrameStoreRef, %function
MVC_UnMarkFrameStoreRef:
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
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	mov	r3, r1
	tst	r2, #1
	beq	.L167
	ldrb	r1, [r1, #3]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r3, #773]
	and	r1, r1, #2
	strb	ip, [r3, #774]
	strb	r1, [r3, #3]
.L167:
	tst	r2, #2
	beq	.L168
	ldrb	r1, [r3, #3]	@ zero_extendqisi2
	mov	ip, #0
	strb	ip, [r3, #809]
	and	r1, r1, #1
	strb	ip, [r3, #810]
	strb	r1, [r3, #3]
.L168:
	cmp	r2, #3
	ldrsb	r1, [r3, #6]
	moveq	r2, #0
	streqb	r2, [r3, #738]
	streqb	r2, [r3, #737]
	mov	r2, #0
	strb	r2, [r3, #3]
	ldr	r0, [r0, #120]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	FSP_SetRef
	UNWIND(.fnend)
	.size	MVC_UnMarkFrameStoreRef, .-MVC_UnMarkFrameStoreRef
	.align	2
	.global	MVC_UnMarkLTFrmByFrmIdx
	.type	MVC_UnMarkLTFrmByFrmIdx, %function
MVC_UnMarkLTFrmByFrmIdx:
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
	add	r3, r0, #11075584
	add	r3, r3, #45056
	ldr	r4, [r3, #3028]
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, r6, fp, sp, pc}
	movw	ip, #48004
	add	r6, r0, #11141120
	movt	ip, 169
	add	r6, r6, #16384
	add	ip, r0, ip
	mov	r3, #0
	b	.L179
.L178:
	cmp	r3, r4
	beq	.L184
.L179:
	ldr	r2, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r2, #28]
	cmp	lr, r1
	bne	.L178
	ldr	r5, [r2, #56]
	ldr	lr, [r6, #1200]
	cmp	r5, lr
	bne	.L178
	mov	r1, r2
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, lr}
	b	MVC_UnMarkFrameStoreRef
.L184:
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UnMarkLTFrmByFrmIdx, .-MVC_UnMarkLTFrmByFrmIdx
	.align	2
	.global	MVC_UnMarkLTFldByFrmIdx
	.type	MVC_UnMarkLTFldByFrmIdx, %function
MVC_UnMarkLTFldByFrmIdx:
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
	add	ip, r0, #11075584
	add	ip, ip, #45056
	ldr	r6, [ip, #3028]
	cmp	r6, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	movw	r4, #48004
	add	r8, r0, #11141120
	movt	r4, 169
	add	r8, r8, #16384
	add	r4, r0, r4
	mov	ip, #0
	b	.L189
.L187:
	cmp	ip, r6
	beq	.L203
.L189:
	ldr	lr, [r4, #4]!
	add	ip, ip, #1
	ldr	r5, [lr, #28]
	cmp	r5, r3
	bne	.L187
	ldr	r7, [lr, #56]
	ldr	r5, [r8, #1200]
	cmp	r7, r5
	bne	.L187
	cmp	r2, #1
	ldreqb	r5, [lr, #809]	@ zero_extendqisi2
	beq	.L202
	cmp	r2, #2
	bne	.L187
	ldrb	r5, [lr, #773]	@ zero_extendqisi2
.L202:
	clz	r5, r5
	mov	r5, r5, lsr #5
	cmp	lr, r1
	orrne	r5, r5, #1
	cmp	r5, #0
	beq	.L187
	mov	r1, lr
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_UnMarkFrameStoreRef
.L203:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UnMarkLTFldByFrmIdx, .-MVC_UnMarkLTFldByFrmIdx
	.align	2
	.global	MVC_UnMarkSTRef
	.type	MVC_UnMarkSTRef, %function
MVC_UnMarkSTRef:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L205
	add	ip, r0, #11075584
	ldr	r1, [r1, #688]
	add	ip, ip, #45056
	sub	r1, r1, #1
	ldr	r4, [ip, #3024]
	rsb	r2, r2, r1
	cmp	r4, #0
	beq	.L234
	movw	ip, #47940
	add	r5, r0, #11141120
	movt	ip, 169
	add	r5, r5, #16384
	add	ip, r0, ip
	b	.L211
.L210:
	cmp	r3, r4
	beq	.L235
.L211:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #748]
	cmp	lr, r2
	bne	.L210
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L210
	ldr	lr, [r1, #736]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L210
	ldr	r6, [r1, #56]
	ldr	lr, [r5, #1200]
	cmp	r6, lr
	bne	.L210
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_UnMarkFrameStoreRef
.L205:
	add	r3, r0, #11075584
	ldr	r1, [r1, #688]
	add	r3, r3, #45056
	ldr	r5, [r3, #3024]
	rsb	r2, r2, r1, lsl #1
	cmp	r5, #0
	beq	.L236
	movw	r4, #47940
	add	r7, r0, #11141120
	movt	r4, 169
	add	r7, r7, #16384
	add	r4, r0, r4
	mov	ip, #0
	b	.L216
.L212:
	tst	r3, #2
	beq	.L214
	ldr	r3, [r1, #808]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L237
.L214:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L238
.L216:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L212
	ldr	lr, [r1, #772]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L212
	ldr	r8, [r1, #56]
	ldr	lr, [r7, #1200]
	cmp	r8, lr
	bne	.L212
	ldr	lr, [r1, #784]
	cmp	lr, r2
	bne	.L212
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #11075584
	strb	r3, [r1, #3]
	add	r2, r2, #45056
	mov	r1, #0
	ldr	r3, [r2, #2888]
	strb	r1, [r3, #774]
	ldr	r3, [r2, #2888]
	ldrb	ip, [r3, #736]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #738]
	ldreq	r3, [r2, #2888]
	streqb	r1, [r3, #737]
	ldreq	r3, [r2, #2888]
	ldrb	ip, [r3, #3]	@ zero_extendqisi2
	cmp	ip, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r1, [r3, #48]
	mov	r2, ip
	add	r1, r0, r1, lsl #2
	str	ip, [r1, #148]
	ldrsb	r1, [r3, #6]
	b	.L231
.L237:
	ldr	lr, [r1, #56]
	ldr	r3, [r7, #1200]
	cmp	lr, r3
	bne	.L214
	ldr	r3, [r1, #820]
	cmp	r3, r2
	bne	.L214
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #3]
	add	r3, r3, #11075584
	mov	r2, #0
	add	r3, r3, #45056
	ldr	r1, [r3, #2888]
	strb	r2, [r1, #810]
	ldr	r1, [r3, #2888]
	ldrb	ip, [r1, #736]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r2
	streqb	r2, [r1, #738]
	ldreq	r1, [r3, #2888]
	streqb	r2, [r1, #737]
	ldreq	r1, [r3, #2888]
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	cmp	ip, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r3, [r1, #48]
	mov	r2, ip
	add	r3, r0, r3, lsl #2
	str	ip, [r3, #148]
	ldrsb	r1, [r1, #6]
.L231:
	ldr	r0, [r0, #120]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	FSP_SetRef
.L238:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L235:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L234:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L236:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UnMarkSTRef, .-MVC_UnMarkSTRef
	.align	2
	.global	MVC_UnMarkLTRef
	.type	MVC_UnMarkLTRef, %function
MVC_UnMarkLTRef:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L240
	add	r3, r0, #11075584
	add	r3, r3, #45056
	ldr	r5, [r3, #3028]
	cmp	r5, #0
	beq	.L269
	movw	r4, #48004
	add	r7, r0, #11141120
	movt	r4, 169
	add	r7, r7, #16384
	add	r4, r0, r4
	mov	ip, #0
	b	.L249
.L245:
	tst	r3, #2
	beq	.L247
	ldr	r3, [r1, #808]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #256
	beq	.L270
.L247:
	add	ip, ip, #1
	cmp	ip, r5
	beq	.L271
.L249:
	ldr	r1, [r4, #4]!
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	ands	r6, r3, #1
	beq	.L245
	ldr	lr, [r1, #772]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L245
	ldr	r8, [r1, #56]
	ldr	lr, [r7, #1200]
	cmp	r8, lr
	bne	.L245
	ldr	lr, [r1, #780]
	cmp	r2, lr
	bne	.L245
	add	r2, r0, ip, lsl #2
	and	r3, r3, #2
	add	r2, r2, #11075584
	strb	r3, [r1, #3]
	add	r2, r2, #45056
	mov	r1, #0
	ldr	r3, [r2, #2952]
	strb	r1, [r3, #773]
	ldr	r3, [r2, #2952]
	ldrb	ip, [r3, #736]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r1
	streqb	r1, [r3, #738]
	ldreq	r3, [r2, #2952]
	streqb	r1, [r3, #737]
	ldreq	r3, [r2, #2952]
	ldrb	ip, [r3, #3]	@ zero_extendqisi2
	cmp	ip, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r1, [r3, #48]
	mov	r2, ip
	add	r1, r0, r1, lsl #2
	str	ip, [r1, #148]
	ldrsb	r1, [r3, #6]
	b	.L266
.L240:
	add	r1, r0, #11075584
	add	r1, r1, #45056
	ldr	r4, [r1, #3028]
	cmp	r4, #0
	beq	.L272
	movw	ip, #48004
	add	r5, r0, #11141120
	movt	ip, 169
	add	r5, r5, #16384
	add	ip, r0, ip
	b	.L251
.L250:
	cmp	r3, r4
	beq	.L273
.L251:
	ldr	r1, [ip, #4]!
	add	r3, r3, #1
	ldr	lr, [r1, #744]
	cmp	lr, r2
	bne	.L250
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L250
	ldr	lr, [r1, #736]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #256
	bne	.L250
	ldr	r6, [r1, #56]
	ldr	lr, [r5, #1200]
	cmp	r6, lr
	bne	.L250
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_UnMarkFrameStoreRef
.L270:
	ldr	lr, [r1, #56]
	ldr	r3, [r7, #1200]
	cmp	lr, r3
	bne	.L247
	ldr	r3, [r1, #816]
	cmp	r2, r3
	bne	.L247
	add	r3, r0, ip, lsl #2
	strb	r6, [r1, #3]
	add	r3, r3, #11075584
	mov	r2, #0
	add	r3, r3, #45056
	ldr	r1, [r3, #2952]
	strb	r2, [r1, #809]
	ldr	r1, [r3, #2952]
	ldrb	ip, [r1, #736]	@ zero_extendqisi2
	cmp	ip, #3
	cmpne	ip, r2
	streqb	r2, [r1, #738]
	ldreq	r1, [r3, #2952]
	streqb	r2, [r1, #737]
	ldreq	r1, [r3, #2952]
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	cmp	ip, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r3, [r1, #48]
	mov	r2, ip
	add	r3, r0, r3, lsl #2
	str	ip, [r3, #148]
	ldrsb	r1, [r1, #6]
.L266:
	ldr	r0, [r0, #120]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	FSP_SetRef
.L273:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L271:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L272:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L269:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UnMarkLTRef, .-MVC_UnMarkLTRef
	.align	2
	.global	MVC_MarkPicLTRef
	.type	MVC_MarkPicLTRef, %function
MVC_MarkPicLTRef:
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
	ldrb	r6, [r3, #3]	@ zero_extendqisi2
	add	r3, r0, #11075584
	add	r3, r3, #45056
	cmp	r6, #0
	beq	.L275
	ldr	r7, [r3, #3024]
	cmp	r7, #0
	beq	.L304
	movw	r5, #47940
	add	r8, r0, #11141120
	movt	r5, 169
	add	r8, r8, #16384
	add	r5, r0, r5
	mov	ip, #0
	b	.L289
.L281:
	tst	r4, #2
	beq	.L284
	ldr	lr, [r3, #808]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	beq	.L305
.L284:
	add	ip, ip, #1
	cmp	ip, r7
	beq	.L306
.L289:
	ldr	r3, [r5, #4]!
	ldrb	r4, [r3, #3]	@ zero_extendqisi2
	tst	r4, #1
	beq	.L281
	ldr	lr, [r3, #772]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L281
	ldr	lr, [r3, #784]
	cmp	lr, r2
	bne	.L281
	ldr	r9, [r3, #56]
	ldr	lr, [r8, #1200]
	cmp	r9, lr
	bne	.L281
	ldrb	lr, [r3, #809]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L285
	ldr	lr, [r3, #28]
	cmp	lr, r1
	bne	.L284
.L285:
	add	r0, r0, ip, lsl #2
	str	r1, [r3, #28]
	add	r3, r0, #11075584
	sub	r6, r6, #1
	add	r3, r3, #45056
	clz	r6, r6
	mov	ip, #1
	mov	r0, #0
	ldr	r2, [r3, #2888]
	mov	r6, r6, lsr #5
	add	r1, r6, r1, lsl #1
	str	r1, [r2, #780]
	ldr	r2, [r3, #2888]
	strb	ip, [r2, #773]
	ldr	r2, [r3, #2888]
	strb	r0, [r2, #774]
	ldr	r2, [r3, #2888]
	ldrb	r1, [r2, #736]	@ zero_extendqisi2
	cmp	r1, #3
	cmpne	r1, r0
	bne	.L307
	ldrb	r1, [r2, #809]	@ zero_extendqisi2
	ldrb	r0, [r2, #773]	@ zero_extendqisi2
	cmp	r1, r0
	streqb	r1, [r2, #737]
	ldreq	r3, [r3, #2888]
	ldreqb	r2, [r3, #774]	@ zero_extendqisi2
	streqb	r2, [r3, #738]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L275:
	ldr	r4, [r3, #3024]
	cmp	r4, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	movw	ip, #47940
	add	r5, r0, #11141120
	movt	ip, 169
	add	r5, r5, #16384
	add	ip, r0, ip
	b	.L280
.L279:
	add	r6, r6, #1
	cmp	r6, r4
	beq	.L308
.L280:
	ldr	r3, [ip, #4]!
	ldrb	lr, [r3, #3]	@ zero_extendqisi2
	cmp	lr, #3
	bne	.L279
	ldr	lr, [r3, #736]
	bic	lr, lr, #-16777216
	bic	lr, lr, #255
	cmp	lr, #65536
	bne	.L279
	ldr	lr, [r3, #748]
	cmp	lr, r2
	bne	.L279
	ldr	r7, [r3, #56]
	ldr	lr, [r5, #1200]
	cmp	r7, lr
	bne	.L279
	add	r6, r0, r6, lsl #2
	str	r1, [r3, #28]
	add	r3, r6, #11075584
	mov	r0, #1
	add	r3, r3, #45056
	mov	r2, #0
	ldr	ip, [r3, #2888]
	str	r1, [ip, #744]
	ldr	r1, [r3, #2888]
	strb	r0, [r1, #737]
	ldr	r1, [r3, #2888]
	strb	r0, [r1, #773]
	ldr	r1, [r3, #2888]
	strb	r0, [r1, #809]
	ldr	r1, [r3, #2888]
	strb	r2, [r1, #738]
	ldr	r1, [r3, #2888]
	strb	r2, [r1, #774]
	ldr	r3, [r3, #2888]
	strb	r2, [r3, #810]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L305:
	ldr	lr, [r3, #820]
	cmp	lr, r2
	bne	.L284
	ldr	r4, [r3, #56]
	ldr	lr, [r8, #1200]
	cmp	r4, lr
	bne	.L284
	ldrb	lr, [r3, #773]	@ zero_extendqisi2
	cmp	lr, #1
	bne	.L288
	ldr	lr, [r3, #28]
	cmp	lr, r1
	bne	.L284
.L288:
	add	r0, r0, ip, lsl #2
	str	r1, [r3, #28]
	add	r3, r0, #11075584
	sub	r6, r6, #2
	add	r3, r3, #45056
	clz	r6, r6
	mov	ip, #1
	mov	r0, #0
	ldr	r2, [r3, #2888]
	mov	r6, r6, lsr #5
	add	r1, r6, r1, lsl #1
	str	r1, [r2, #816]
	ldr	r2, [r3, #2888]
	strb	ip, [r2, #809]
	ldr	r2, [r3, #2888]
	strb	r0, [r2, #810]
	ldr	r2, [r3, #2888]
	ldrb	r1, [r2, #736]	@ zero_extendqisi2
	cmp	r1, #3
	cmpne	r1, r0
	bne	.L309
	ldrb	r1, [r2, #809]	@ zero_extendqisi2
	ldrb	r0, [r2, #773]	@ zero_extendqisi2
	cmp	r1, r0
	streqb	r1, [r2, #737]
	ldreq	r3, [r3, #2888]
	ldreqb	r2, [r3, #810]	@ zero_extendqisi2
	streqb	r2, [r3, #738]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L306:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L308:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L307:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L309:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L304:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_MarkPicLTRef, .-MVC_MarkPicLTRef
	.align	2
	.global	MVC_MarkSTToLTRef
	.type	MVC_MarkSTToLTRef, %function
MVC_MarkSTToLTRef:
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
	bne	.L311
	ldr	r5, [r6, #688]
	mov	r1, r3
	sub	r5, r5, #1
	rsb	r5, r2, r5
	bl	MVC_UnMarkLTFrmByFrmIdx
.L312:
	mov	r3, r6
	mov	r2, r5
	mov	r1, r8
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	MVC_MarkPicLTRef
.L311:
	add	r3, r0, #11075584
	ldr	r5, [r6, #688]
	add	r3, r3, #45056
	ldr	r1, [r3, #3024]
	rsb	r5, r2, r5, lsl #1
	cmp	r1, #0
	beq	.L312
	movw	r2, #47940
	add	r0, r0, #11141120
	movt	r2, 169
	add	r0, r0, #16384
	add	r2, r7, r2
	mov	lr, #0
	b	.L315
.L313:
	tst	r3, #2
	beq	.L314
	ldr	r3, [ip, #808]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cmp	r3, #65536
	beq	.L326
.L314:
	cmp	lr, r1
	beq	.L312
.L315:
	ldr	ip, [r2, #4]!
	add	lr, lr, #1
	ldrb	r3, [ip, #3]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L313
	ldr	r4, [ip, #772]
	bic	r4, r4, #-16777216
	bic	r4, r4, #255
	cmp	r4, #65536
	bne	.L313
	ldr	r4, [ip, #784]
	cmp	r4, r5
	bne	.L313
	ldr	r9, [ip, #56]
	ldr	r4, [r0, #1200]
	cmp	r9, r4
	bne	.L313
	mov	r1, ip
	mov	r3, r8
	mov	r2, #1
	mov	r0, r7
	bl	MVC_UnMarkLTFldByFrmIdx
	b	.L312
.L326:
	ldr	r3, [ip, #820]
	cmp	r3, r5
	bne	.L314
	ldr	r4, [ip, #56]
	ldr	r3, [r0, #1200]
	cmp	r4, r3
	bne	.L314
	mov	r1, ip
	mov	r3, r8
	mov	r2, #2
	mov	r0, r7
	bl	MVC_UnMarkLTFldByFrmIdx
	b	.L312
	UNWIND(.fnend)
	.size	MVC_MarkSTToLTRef, .-MVC_MarkSTToLTRef
	.align	2
	.global	MVC_UpdateMaxLTFrmIdx
	.type	MVC_UpdateMaxLTFrmIdx, %function
MVC_UpdateMaxLTFrmIdx:
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
	add	r5, r0, #11075584
	mov	r8, r0
	add	r5, r5, #45056
	ldr	r3, [r5, #3028]
	str	r1, [r5, #3032]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	movw	r6, #48004
	add	r7, r0, #11141120
	movt	r6, 169
	add	r7, r7, #16384
	add	r6, r0, r6
	mov	r3, r1
	mov	r4, #0
	b	.L331
.L329:
	ldr	r3, [r5, #3028]
	cmp	r3, r4
	ldmlsfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, [r5, #3032]
.L331:
	ldr	r1, [r6, #4]!
	add	r4, r4, #1
	ldr	r2, [r1, #28]
	cmp	r2, r3
	bcc	.L329
	ldr	r2, [r1, #56]
	ldr	r3, [r7, #1200]
	cmp	r2, r3
	bne	.L329
	mov	r0, r8
	bl	MVC_UnMarkFrameStoreRef
	b	.L329
	UNWIND(.fnend)
	.size	MVC_UpdateMaxLTFrmIdx, .-MVC_UpdateMaxLTFrmIdx
	.align	2
	.global	MVC_UnMarkAllSTRef
	.type	MVC_UnMarkAllSTRef, %function
MVC_UnMarkAllSTRef:
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
	add	r6, r0, #11075584
	mov	r8, r0
	add	r6, r6, #45056
	ldr	r3, [r6, #3024]
	cmp	r3, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	movw	r5, #47940
	add	r7, r0, #11141120
	movt	r5, 169
	add	r7, r7, #16384
	add	r5, r0, r5
	mov	r4, #0
	b	.L335
.L334:
	ldr	r3, [r6, #3024]
	cmp	r3, r4
	bls	.L338
.L335:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	ldr	r3, [r7, #1200]
	ldr	r2, [r1, #56]
	cmp	r2, r3
	bne	.L334
	mov	r0, r8
	bl	MVC_UnMarkFrameStoreRef
	ldr	r3, [r6, #3024]
	cmp	r3, r4
	bhi	.L335
.L338:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UnMarkAllSTRef, .-MVC_UnMarkAllSTRef
	.align	2
	.global	MVC_MarkCurrPicLT
	.type	MVC_MarkCurrPicLT, %function
MVC_MarkCurrPicLT:
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
	beq	.L342
	mov	r3, r5
	ldr	r1, [r1, #680]
	bl	MVC_UnMarkLTFldByFrmIdx
.L341:
	mov	r2, #1
	mov	r3, #0
	str	r5, [r4, #692]
	strb	r2, [r4, #4]
	strb	r3, [r4, #5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L342:
	mov	r1, r5
	bl	MVC_UnMarkLTFrmByFrmIdx
	b	.L341
	UNWIND(.fnend)
	.size	MVC_MarkCurrPicLT, .-MVC_MarkCurrPicLT
	.align	2
	.global	MVC_RemoveFrameStoreOutDPB
	.type	MVC_RemoveFrameStoreOutDPB, %function
MVC_RemoveFrameStoreOutDPB:
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
	add	r1, r0, r1, lsl #2
	mov	r5, r0
	add	r4, r1, #11075584
	add	r7, r4, #45056
	ldr	r2, [r7, #2824]
	cmp	r2, #0
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r1, [r2, #52]
	movw	r3, #48088
	add	r6, r0, #11075584
	movt	r3, 169
	add	r1, r0, r1
	add	r0, r6, #45056
	add	r3, r1, r3
	mov	r1, #0
	strb	r1, [r3, #4]
	ldr	r3, [r0, #3248]
	cmp	r3, r1
	subne	r3, r3, #1
	str	r3, [r0, #3248]
	ldrsb	r1, [r2, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L346
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	beq	.L347
	ldr	r3, [r7, #2824]
	mov	r2, #0
	ldr	r0, [r5, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
.L347:
	ldr	r3, [r7, #2824]
	mov	r2, #0
	ldr	r0, [r5, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
.L346:
	add	r1, r4, #45056
	mov	r3, #0
	add	r6, r6, #45056
	ldr	r2, [r1, #2824]
	strb	r3, [r2, #2]
	ldr	r2, [r1, #2824]
	strb	r3, [r2, #5]
	ldr	r2, [r1, #2824]
	strb	r3, [r2, #3]
	str	r3, [r1, #2824]
	ldr	r3, [r6, #3020]
	sub	r3, r3, #1
	str	r3, [r6, #3020]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_RemoveFrameStoreOutDPB, .-MVC_RemoveFrameStoreOutDPB
	.align	2
	.global	MVC_RemoveUnUsedFrameStore
	.type	MVC_RemoveUnUsedFrameStore, %function
MVC_RemoveUnUsedFrameStore:
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
	add	r3, r0, #11075584
	mov	r8, r0
	add	r3, r3, #45056
	mov	r7, r1
	ldr	r6, [r3, #3016]
	cmp	r6, #0
	beq	.L375
	movw	r5, #47876
	mov	r4, #0
	movt	r5, 169
	add	r5, r0, r5
.L363:
	ldr	r3, [r5, #4]!
	cmp	r3, #0
	beq	.L362
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L362
	ldrb	r2, [r3, #5]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L362
	ldr	r1, [r3, #56]
	cmn	r7, #1
	cmpne	r1, r7
	beq	.L376
.L362:
	add	r4, r4, #1
	cmp	r4, r6
	bne	.L363
.L375:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L376:
	ldr	ip, [r3, #16]
	mov	r1, r4
	mov	r0, r8
	cmp	ip, #1
	beq	.L362
	strb	r2, [r3, #2]
	bl	MVC_RemoveFrameStoreOutDPB
	b	.L362
	UNWIND(.fnend)
	.size	MVC_RemoveUnUsedFrameStore, .-MVC_RemoveUnUsedFrameStore
	.align	2
	.global	MVC_CheckFrameStore
	.type	MVC_CheckFrameStore, %function
MVC_CheckFrameStore:
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
	ldrb	r3, [r0, #6]	@ zero_extendqisi2
	mov	r5, r0
	mov	r4, r1
	cmp	r3, #0
	bne	.L378
	ldrsb	r3, [r1, #8]
	cmp	r3, #1
	bne	.L390
	strb	r3, [r0, #6]
.L378:
	ldrsb	r1, [r4, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L380
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	cmpne	r3, #0
	beq	.L400
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L389
	cmp	r3, #1
	beq	.L389
	cmp	r2, #3
	beq	.L401
	cmp	r2, #1
	beq	.L402
	cmp	r2, #2
	beq	.L403
.L385:
	ldr	r3, [r5, #224]
	ldr	r2, [r0, #192]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	movls	r0, #0
	bhi	.L404
.L398:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L400:
	ldrsb	r2, [r4, #6]
	mov	r0, #1
	ldr	r1, .L405
	bl	dprint_vfmw
.L382:
	ldr	r3, [r4, #16]
	cmp	r3, #1
	mvnne	r0, #2
	moveq	r3, #2
	mvneq	r0, #2
	streq	r3, [r4, #16]
	b	.L398
.L401:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L385
	mov	r2, r3
	ldr	r1, .L405+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L398
.L402:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L385
	mov	r0, r2
	ldr	r1, .L405+8
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L398
.L403:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	tst	r3, #2
	beq	.L385
	ldr	r1, .L405+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L398
.L390:
	mvn	r0, #0
	b	.L398
.L380:
	ldrsb	ip, [r4, #6]
	mov	r2, r4
	ldr	r3, [r4, #16]
	mov	r0, #1
	ldr	r1, .L405+16
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L382
.L389:
	ldr	r1, .L405+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L398
.L404:
	ldr	r1, .L405+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L398
.L406:
	.align	2
.L405:
	.word	.LC4
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC5
	.word	.LC6
	.word	.LC10
	UNWIND(.fnend)
	.size	MVC_CheckFrameStore, .-MVC_CheckFrameStore
	.align	2
	.global	MVC_ExchangePts
	.type	MVC_ExchangePts, %function
MVC_ExchangePts:
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
	add	r8, r1, #720
	mvn	r7, #0
	mvn	r6, #0
	ldrd	r2, [r8, #-8]
	mov	r5, r0
	cmp	r3, r7
	cmpeq	r2, r6
	beq	.L407
	add	r9, r0, #11075584
	add	r9, r9, #45056
	ldr	r3, [r9, #3016]
	cmp	r3, #0
	beq	.L407
	movw	r10, #47876
	mvn	r6, #1
	movt	r10, 169
	add	r10, r0, r10
	mvn	r7, #0
	mov	r4, #0
	mvn	r3, #0
	str	r3, [fp, #-48]
.L412:
	ldr	r3, [r10, #4]!
	cmp	r3, #0
	beq	.L411
	ldrsb	r1, [r3, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L411
	ldrsb	r3, [r0, #1]
	cmp	r3, #3
	cmpne	r3, #0
	beq	.L411
	ldr	r3, [r10]
	add	r3, r3, #720
	ldrd	r0, [r3, #-8]
	cmp	r1, r7
	cmpeq	r0, r6
	strcc	r4, [fp, #-48]
	movcc	r6, r0
	movcc	r7, r1
.L411:
	ldr	r3, [r9, #3016]
	add	r4, r4, #1
	cmp	r4, r3
	bcc	.L412
	ldr	r3, [fp, #-48]
	cmn	r3, #1
	beq	.L407
	ldrd	r2, [r8, #-8]
	cmp	r3, r7
	cmpeq	r2, r6
	bhi	.L426
.L407:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L426:
	strd	r6, [sp]
	mov	r0, #29
	ldr	r1, .L427
	bl	dprint_vfmw
	ldr	r3, [fp, #-48]
	movw	r1, #28354
	movt	r1, 42
	add	r1, r3, r1
	ldrd	r2, [r8, #-8]
	ldr	r1, [r5, r1, asl #2]
	add	r1, r1, #720
	strd	r2, [r1, #-8]
	strd	r6, [r8, #-8]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L428:
	.align	2
.L427:
	.word	.LC11
	UNWIND(.fnend)
	.size	MVC_ExchangePts, .-MVC_ExchangePts
	.align	2
	.global	MVC_GetImagePara
	.type	MVC_GetImagePara, %function
MVC_GetImagePara:
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
	add	ip, r0, #11075584
	mov	r5, r0
	add	r0, ip, #40960
	mov	r4, r1
	ldr	r3, [r5, #252]
	mov	r2, #2240
	ldr	r1, [r0, #1176]
	movw	r8, #3992
	ldrb	lr, [r4, #198]	@ zero_extendqisi2
	ldrb	r7, [r4, #197]	@ zero_extendqisi2
	mla	r2, r2, r1, r3
	ldrb	r6, [r4, #196]	@ zero_extendqisi2
	ldr	r3, [r5, #248]
	bfc	lr, #1, #1
	bfc	r7, #0, #2
	bfc	r6, #0, #2
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	ldr	r9, [r2, #28]
	strb	lr, [r4, #198]
	uxtb	lr, lr
	strb	r7, [r4, #197]
	strb	r6, [r4, #196]
	ldr	r2, [r5, #224]
	mla	r3, r8, r9, r3
	ldr	r2, [r2, #592]
	sub	r2, r2, #1
	clz	r2, r2
	mov	r2, r2, lsr #5
	bfi	lr, r2, #2, #1
	strb	lr, [r4, #198]
	ldr	r2, [r5, #56]
	str	r2, [r4, #232]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L467
.L432:
	.word	.L431
	.word	.L433
	.word	.L434
	.word	.L431
.L434:
	ldrb	r2, [r4, #197]	@ zero_extendqisi2
	add	ip, r5, #11075584
	ldr	r6, [r4, #44]
	add	ip, ip, #45056
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	and	r2, r2, #240
	ldrb	lr, [r4]	@ zero_extendqisi2
	orr	r2, r2, #11
	str	r6, [r4, #256]
	bfi	r1, lr, #0, #2
	strb	r2, [r4, #197]
	strb	r1, [r4, #196]
.L430:
	ldrb	r2, [r3, #20]	@ zero_extendqisi2
	str	r2, [r4, #584]
	str	r2, [r4, #588]
	ldrb	r2, [r3, #24]	@ zero_extendqisi2
	cmp	r2, #0
	ldrne	r2, [r3, #68]
	mov	r3, #1
	str	r3, [r4, #592]
	str	r2, [r4, #596]
	ldrb	r3, [r0, #1171]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	str	r3, [r4, #296]
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	ble	.L452
	ldrb	r3, [r4, #736]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L452
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	cmp	r2, #3
	ldreqb	r2, [r4, #197]	@ zero_extendqisi2
	bfieq	r2, r3, #0, #2
	streqb	r2, [r4, #197]
.L452:
	ldrb	r3, [ip, #2776]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L453
	ldr	r3, [ip, #2792]
	cmp	r3, #3
	moveq	r3, #1
	streq	r3, [r4, #464]
	beq	.L453
	cmp	r3, #4
	moveq	r3, #2
	streq	r3, [r4, #464]
	beq	.L453
	cmp	r3, #5
	moveq	r3, #3
	streq	r3, [r4, #464]
	beq	.L453
	mov	r0, #0
	ldr	r1, .L480
	str	r0, [r4, #464]
	ldr	r2, [ip, #2792]
	bl	dprint_vfmw
.L453:
	ldr	r0, [r5, #120]
	ldrsb	r1, [r4, #6]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, .L480+4
	mov	r2, #664
	add	r1, r4, #72
	ldr	r3, [r3, #52]
	blx	r3
	mov	r3, #15
	str	r3, [r5, #412]
	mov	r2, #1
	ldrb	r3, [r4, #736]	@ zero_extendqisi2
	strb	r2, [r5, #407]
	cmp	r3, #0
	movne	r3, #4
	strb	r3, [r5, #400]
	ldr	r3, [r4, #764]
	strb	r2, [r5, #405]
	str	r3, [r5, #416]
	str	r3, [r5, #424]
	str	r3, [r5, #420]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L433:
	ldr	r6, [r4, #44]
	add	ip, r5, #11075584
	ldrb	r2, [r4, #197]	@ zero_extendqisi2
	add	ip, ip, #45056
	ldrb	r1, [r4, #196]	@ zero_extendqisi2
	ldrb	lr, [r4]	@ zero_extendqisi2
	orr	r2, r2, #3
	str	r6, [r4, #256]
	bfi	r1, lr, #0, #2
	strb	r2, [r4, #197]
	strb	r1, [r4, #196]
	b	.L430
.L431:
	ldrb	r2, [r4, #736]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L435
	ldr	r1, [r4, #40]
	ldr	r2, [r4, #44]
	cmp	r1, #0
	ldrb	r7, [r4]	@ zero_extendqisi2
	movne	lr, #3
	str	r2, [r4, #256]
	movne	r6, lr
	moveq	lr, #2
	moveq	r6, #3
.L436:
	ldr	r1, [r4, #788]
	ldr	r2, [r4, #824]
	cmp	r1, r2
	beq	.L477
	movle	r1, #1
	movgt	r1, #0
.L447:
	add	ip, ip, #45056
	ldrb	r2, [ip, #2812]	@ zero_extendqisi2
	cmp	r2, #3
	moveq	r1, #1
	beq	.L448
	cmp	r2, #4
	moveq	r1, #0
.L448:
	ldrb	r2, [r4, #197]	@ zero_extendqisi2
	ldrb	r8, [r4, #196]	@ zero_extendqisi2
	bfi	r2, r1, #4, #2
	bfi	r2, r6, #2, #2
	bfi	r8, r7, #0, #2
	bfi	r2, lr, #0, #2
	strb	r8, [r4, #196]
	strb	r2, [r4, #197]
	b	.L430
.L435:
	ldr	r1, [r4, #796]
	ldr	r2, [r5, #116]
	ldr	lr, [r4, #832]
	cmp	r1, r2
	bhi	.L478
	cmp	r2, lr
	bcc	.L440
.L438:
	ldr	r2, [r4, #44]
	mov	r6, #3
	ldrb	r7, [r4]	@ zero_extendqisi2
	ldrb	lr, [r4, #775]	@ zero_extendqisi2
	ldrb	r8, [r4, #811]	@ zero_extendqisi2
	str	r2, [r4, #256]
.L441:
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L479
	cmp	r2, #2
	streq	r1, [r4, #256]
	moveq	r7, lr
	moveq	r6, #1
.L443:
	str	lr, [r4, #188]
	mov	lr, #3
	str	r8, [r4, #192]
	b	.L436
.L440:
	ldrb	r7, [r4, #775]	@ zero_extendqisi2
	mov	r6, #1
	ldrb	r8, [r4, #811]	@ zero_extendqisi2
	str	r1, [r4, #256]
	mov	lr, r7
	b	.L441
.L477:
	ldr	r2, [r4, #200]
	cmp	r2, #720
	movne	r1, #1
	bne	.L447
	ldr	r1, [r4, #204]
	subs	r1, r1, #480
	movne	r1, #1
	b	.L447
.L478:
	cmp	r2, lr
	bcc	.L438
	ldrb	r7, [r4, #811]	@ zero_extendqisi2
	mov	r6, #2
	str	lr, [r4, #256]
	ldrb	lr, [r4, #775]	@ zero_extendqisi2
	mov	r8, r7
	b	.L441
.L479:
	ldr	r2, [r4, #832]
	mov	r7, r8
	mov	r6, #2
	str	r2, [r4, #256]
	b	.L443
.L467:
	add	ip, r5, #11075584
	add	ip, ip, #45056
	b	.L430
.L481:
	.align	2
.L480:
	.word	.LC12
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	MVC_GetImagePara, .-MVC_GetImagePara
	.align	2
	.global	MVC_SetFrmRepeatCount
	.type	MVC_SetFrmRepeatCount, %function
MVC_SetFrmRepeatCount:
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
	ldr	r3, [r0, #224]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r1, #24]
	ldmccfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_SetFrmRepeatCount.part.1
	UNWIND(.fnend)
	.size	MVC_SetFrmRepeatCount, .-MVC_SetFrmRepeatCount
	.align	2
	.global	MVC_SplitFrmToFlds
	.type	MVC_SplitFrmToFlds, %function
MVC_SplitFrmToFlds:
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
	ldrb	lr, [r0, #737]	@ zero_extendqisi2
	mov	r5, #1
	ldrb	ip, [r0, #738]	@ zero_extendqisi2
	mov	r4, #2
	ldr	r1, [r0, #760]
	ldrb	r2, [r0, #739]	@ zero_extendqisi2
	ldr	r3, [r0, #740]
	strb	r5, [r0, #772]
	strb	r4, [r0, #808]
	strb	lr, [r0, #773]
	strb	lr, [r0, #809]
	strb	ip, [r0, #774]
	strb	ip, [r0, #810]
	str	r1, [r0, #796]
	str	r1, [r0, #832]
	strb	r2, [r0, #775]
	strb	r2, [r0, #811]
	str	r3, [r0, #776]
	str	r3, [r0, #812]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_SplitFrmToFlds, .-MVC_SplitFrmToFlds
	.align	2
	.global	MVC_CombineFldsToFrm
	.type	MVC_CombineFldsToFrm, %function
MVC_CombineFldsToFrm:
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
	ldr	r2, [r0, #824]
	mov	lr, #3
	ldr	r1, [r0, #788]
	ldr	r3, [r0, #832]
	cmp	r2, r1
	ldr	r5, [r0, #796]
	ldrb	r4, [r0, #809]	@ zero_extendqisi2
	ldr	ip, [r0, #776]
	movge	r2, r1
	add	r3, r3, r5
	cmp	r4, #0
	strb	lr, [r0, #736]
	mov	r3, r3, lsr #1
	str	ip, [r0, #740]
	str	r2, [r0, #752]
	str	r2, [r0, #32]
	str	r3, [r0, #760]
	beq	.L486
	ldrb	r2, [r0, #773]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L487
.L486:
	ldr	r2, [r0, #808]
	mov	r1, #0
	strb	r1, [r0, #737]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, r1
	beq	.L491
	ldr	r2, [r0, #772]
	bic	r2, r2, #-16777216
	bic	r2, r2, #255
	cmp	r2, #0
	movne	ip, #1
	bne	.L489
.L491:
	mov	ip, #0
.L489:
	ldrb	r2, [r0, #811]	@ zero_extendqisi2
	ldrb	r1, [r0, #775]	@ zero_extendqisi2
	str	r3, [r0, #44]
	cmp	r2, r1
	strb	ip, [r0, #738]
	movcs	r3, r2
	movcc	r3, r1
	strb	r3, [r0, #739]
	strb	r3, [r0]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L487:
	mov	r1, #1
	strb	r1, [r0, #737]
	b	.L491
	UNWIND(.fnend)
	.size	MVC_CombineFldsToFrm, .-MVC_CombineFldsToFrm
	.align	2
	.global	MVC_GetAPC
	.type	MVC_GetAPC, %function
MVC_GetAPC:
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
	subs	r6, r1, #0
	mov	r5, r0
	beq	.L522
	cmp	r2, #1
	beq	.L503
	cmp	r2, #2
	beq	.L504
	ldr	r9, [r6, #788]
	ldr	r10, [r6, #824]
.L505:
	add	r8, r5, #11075584
	add	r7, r8, #45056
	ldr	ip, [r7, #3244]
	cmp	ip, #0
	beq	.L514
	ldrb	r4, [r7, #3036]	@ zero_extendqisi2
	cmp	r4, #0
	movwne	r3, #48092
	movne	r4, #0
	movtne	r3, 169
	addne	r3, r5, r3
	bne	.L508
	b	.L506
.L512:
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L506
.L508:
	add	r4, r4, #1
	cmp	r4, ip
	bne	.L512
.L514:
	mvn	r0, #0
.L518:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L504:
	ldr	r9, [r6, #824]
	mov	r10, r9
	b	.L505
.L506:
	ldrsb	r1, [r6, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L509
	ldr	r3, [r0, #680]
	cmp	r3, #0
	beq	.L509
	add	r2, r5, r4
	movw	r3, #48088
	movt	r3, 169
	add	r3, r2, r3
	mov	r2, #1
	add	r5, r5, r4, lsl #2
	strb	r2, [r3, #4]
	add	r5, r5, #11075584
	ldr	r3, [r0, #680]
	add	r5, r5, #45056
	add	r8, r8, #45056
	ldr	r1, .L523
	mov	r0, #13
	ldr	r3, [r3, #8]
	str	r9, [r5, #3116]
	str	r10, [r5, #3180]
	str	r3, [r5, #3052]
	ldr	r3, [r7, #3248]
	cmp	r3, #15
	addls	r2, r3, r2
	mov	r3, r4
	movhi	r2, #16
	str	r2, [r8, #3248]
	ldr	r2, [r6, #252]
	bl	dprint_vfmw
	mov	r0, #0
	str	r4, [r6, #52]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L503:
	ldr	r9, [r6, #788]
	mov	r10, r9
	b	.L505
.L509:
	mov	r1, #0
	ldrsb	r2, [r6, #6]
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	stmia	sp, {r0, r1}
	mov	r0, r1
	ldr	r1, .L523+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L518
.L522:
	mov	r0, r6
	movw	r3, #2109
	ldr	r2, .L523+8
	ldr	r1, .L523+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L518
.L524:
	.align	2
.L523:
	.word	.LC15
	.word	.LC16
	.word	.LC13
	.word	.LC14
	UNWIND(.fnend)
	.size	MVC_GetAPC, .-MVC_GetAPC
	.align	2
	.global	MVC_SlidingWinMark
	.type	MVC_SlidingWinMark, %function
MVC_SlidingWinMark:
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
	add	r3, r0, #11075584
	ldr	r2, [r0, #236]
	add	r3, r3, #45056
	mov	r10, r0
	ldr	r0, [r3, #3028]
	ldr	r2, [r2, #3944]
	ldr	r1, [r3, #3024]
	rsb	r2, r0, r2
	cmp	r1, r2
	beq	.L550
.L525:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L550:
	ldr	r8, [r3, #3016]
	cmp	r8, #0
	beq	.L530
	movw	r6, #47876
	add	r1, r10, #11141120
	movt	r6, 169
	mov	r2, #0
	add	r1, r1, #16384
	add	r6, r10, r6
	mov	r5, r2
	mvn	r9, #-2147483648
.L529:
	ldr	r4, [r6, #4]!
	cmp	r4, #0
	beq	.L528
	ldr	r7, [r4, #64]
	cmp	r9, r7
	bls	.L528
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r4
	cmp	r3, #0
	beq	.L528
	str	r1, [fp, #-52]
	str	r2, [fp, #-48]
	bl	MVC_NonLongTermRefFlg
	ldr	r2, [fp, #-48]
	ldr	r1, [fp, #-52]
	cmp	r0, #0
	beq	.L528
	ldr	r0, [r4, #56]
	ldr	r3, [r1, #1200]
	cmp	r0, r3
	moveq	r9, r7
	moveq	r2, r5
.L528:
	add	r5, r5, #1
	cmp	r5, r8
	bne	.L529
.L527:
	movw	r3, #28354
	movt	r3, 42
	add	r3, r2, r3
	ldr	r4, [r10, r3, asl #2]
	cmp	r4, #0
	beq	.L525
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L525
	mov	r0, r4
	bl	MVC_NonLongTermRefFlg
	cmp	r0, #0
	beq	.L525
	add	r3, r10, #11141120
	ldr	r2, [r4, #56]
	add	r3, r3, #16384
	ldr	r3, [r3, #1200]
	cmp	r2, r3
	bne	.L525
	mov	r0, r10
	mov	r1, r4
	bl	MVC_UnMarkFrameStoreRef
	mov	r0, r10
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	MVC_UpdateReflist
.L530:
	mov	r2, r8
	b	.L527
	UNWIND(.fnend)
	.size	MVC_SlidingWinMark, .-MVC_SlidingWinMark
	.align	2
	.global	MVC_DumpDPB
	.type	MVC_DumpDPB, %function
MVC_DumpDPB:
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
	ldr	r3, .L561
	mov	r7, r0
	ldr	r3, [r3]
	tst	r3, #16384
	beq	.L551
	add	r6, r0, #11075584
	add	r6, r6, #45056
	ldr	r3, [r6, #3020]
	cmp	r3, #0
	movwne	r5, #47876
	movne	r4, #0
	movtne	r5, 169
	addne	r5, r0, r5
	beq	.L557
.L556:
	ldr	ip, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L561+4
	mov	r0, #14
	add	r4, r4, #1
	ldrb	lr, [ip, #3]	@ zero_extendqisi2
	ldr	r3, [ip, #20]
	str	lr, [sp, #4]
	ldr	ip, [ip, #32]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r6, #3020]
	cmp	r3, r4
	bhi	.L556
.L557:
	ldr	r1, .L561+8
	mov	r0, #14
	bl	dprint_vfmw
	ldr	r3, [r6, #3024]
	cmp	r3, #0
	movwne	r5, #47940
	movne	r4, #0
	movtne	r5, 169
	addne	r5, r7, r5
	beq	.L555
.L558:
	ldr	ip, [r5, #4]!
	mov	r2, r4
	ldr	r1, .L561+12
	mov	r0, #14
	ldrb	lr, [ip, #3]	@ zero_extendqisi2
	ldr	r3, [ip, #20]
	str	lr, [sp, #4]
	ldr	ip, [ip, #32]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r5]
	mov	r2, r4
	ldr	r1, .L561+16
	mov	r0, #14
	add	r4, r4, #1
	ldr	r3, [r3, #752]
	bl	dprint_vfmw
	ldr	r3, [r6, #3024]
	cmp	r3, r4
	bhi	.L558
.L555:
	ldr	r1, .L561+8
	mov	r0, #14
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L551:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L562:
	.align	2
.L561:
	.word	g_PrintEnable
	.word	.LC18
	.word	.LC17
	.word	.LC19
	.word	.LC20
	UNWIND(.fnend)
	.size	MVC_DumpDPB, .-MVC_DumpDPB
	.align	2
	.global	MVC_UpdateCurrFrameInfo
	.type	MVC_UpdateCurrFrameInfo, %function
MVC_UpdateCurrFrameInfo:
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
	add	r0, r0, #11141120
	add	r3, r0, #16384
	ldrb	r2, [r3, #442]	@ zero_extendqisi2
	ldr	r4, [r3, #1120]
	strb	r2, [r4, #1]
	ldrb	r2, [r3, #444]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
	bne	.L564
	ldrb	r2, [r3, #445]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
.L564:
	strb	r2, [r4, #3]
	ldr	r2, [r3, #1128]
	str	r2, [r4, #20]
	ldr	r2, [r3, #1172]
	str	r2, [r4, #44]
	ldrb	r2, [r3, #452]	@ zero_extendqisi2
	strb	r2, [r4]
	ldr	r2, [r3, #1140]
	str	r2, [r4, #32]
	ldr	r2, [r3, #1196]
	str	r2, [r4, #48]
	ldr	r2, [r3, #1132]
	str	r2, [r4, #28]
	ldrb	r2, [r3, #449]	@ zero_extendqisi2
	str	r2, [r4, #40]
	ldrb	r2, [r3, #447]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r1, #3
	movne	r1, #0
	strb	r1, [r4, #4]
	ldrb	r2, [r3, #443]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L567
	bcc	.L568
	cmp	r2, #2
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	str	r4, [r4, #812]
	mov	ip, #1
	strb	ip, [r4, #808]
	mov	r6, #0
	ldrb	ip, [r3, #444]	@ zero_extendqisi2
	strb	ip, [r4, #809]
	ldrb	ip, [r3, #445]	@ zero_extendqisi2
	strb	ip, [r4, #810]
	ldr	ip, [r3, #1148]
	str	ip, [r4, #824]
	ldrb	ip, [r3, #452]	@ zero_extendqisi2
	strb	ip, [r4, #811]
	ldr	lr, [r3, #1172]
	str	r6, [r4, #40]
	str	lr, [r4, #832]
	ldrb	r5, [r3, #441]	@ zero_extendqisi2
	cmp	r5, r6
	beq	.L585
	ldr	r2, [r4, #796]
	mov	r5, #3
	strb	r5, [r4, #2]
	add	r3, r3, #1104
	add	lr, lr, r2
	str	lr, [r4, #44]
	str	lr, [r4, #760]
	mvn	r7, #0
	ldrb	r2, [r3, #-657]	@ zero_extendqisi2
	cmp	r2, #1
	orreq	r6, r1, #2
	strb	r6, [r4, #4]
	ldrd	r8, [r3, #-8]
	mvn	r6, #0
	cmp	r9, r7
	cmpeq	r8, r6
	beq	.L576
	add	r1, r4, #720
	ldrd	r2, [r1, #-8]
	cmp	r3, r7
	cmpeq	r2, r6
	beq	.L586
.L576:
	ldrb	r3, [r4, #775]	@ zero_extendqisi2
.L583:
	add	r1, r0, #16384
	cmp	r3, ip
	mov	r0, r4
	movcc	r3, ip
	strb	r3, [r4]
	ldr	r3, [r1, #1140]
	str	r3, [r4, #32]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	MVC_CombineFldsToFrm
.L568:
	str	r4, [r4, #740]
	mov	r1, #3
	mov	r2, #0
	strb	r1, [r4, #2]
	strb	r2, [r4, #736]
	add	r1, r3, #456
	ldrb	r5, [r3, #444]	@ zero_extendqisi2
	mov	r2, #664
	add	r0, r4, #72
	strb	r5, [r4, #737]
	ldrb	r6, [r3, #445]	@ zero_extendqisi2
	strb	r6, [r4, #738]
	ldr	ip, [r3, #1144]
	str	ip, [r4, #752]
	ldrb	r7, [r3, #452]	@ zero_extendqisi2
	strb	r7, [r4, #739]
	ldr	r8, [r3, #1172]
	str	r8, [r4, #760]
	ldr	ip, [r3, #1148]
	str	ip, [r4, #788]
	ldr	r3, [r3, #1152]
	str	r3, [r4, #824]
	bl	memcpy
	mov	r2, #1
	mov	r3, #2
	str	r8, [r4, #796]
	str	r8, [r4, #832]
	strb	r7, [r4, #775]
	strb	r7, [r4, #811]
	strb	r6, [r4, #774]
	strb	r6, [r4, #810]
	strb	r5, [r4, #773]
	strb	r5, [r4, #809]
	str	r4, [r4, #776]
	str	r4, [r4, #812]
	strb	r2, [r4, #772]
	strb	r3, [r4, #808]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L567:
	strb	r2, [r4, #772]
	mov	r5, #0
	str	r4, [r4, #776]
	ldrb	ip, [r3, #444]	@ zero_extendqisi2
	strb	ip, [r4, #773]
	ldrb	ip, [r3, #445]	@ zero_extendqisi2
	strb	ip, [r4, #774]
	ldr	ip, [r3, #1148]
	str	ip, [r4, #788]
	ldrb	ip, [r3, #452]	@ zero_extendqisi2
	strb	ip, [r4, #775]
	ldr	lr, [r3, #1172]
	str	r5, [r4, #40]
	str	lr, [r4, #796]
	ldrb	r6, [r3, #441]	@ zero_extendqisi2
	cmp	r6, r5
	beq	.L587
	ldr	r2, [r4, #832]
	mov	r6, #3
	strb	r6, [r4, #2]
	add	r3, r3, #1104
	add	lr, lr, r2
	str	lr, [r4, #44]
	str	lr, [r4, #760]
	mvn	r7, #0
	ldrb	r2, [r3, #-657]	@ zero_extendqisi2
	mvn	r6, #0
	cmp	r2, #1
	orreq	r5, r1, #1
	strb	r5, [r4, #4]
	ldrd	r8, [r3, #-8]
	cmp	r9, r7
	cmpeq	r8, r6
	beq	.L572
	add	r1, r4, #720
	ldrd	r2, [r1, #-8]
	cmp	r3, r7
	cmpeq	r2, r6
	streqd	r8, [r1, #-8]
.L572:
	ldrb	r3, [r4, #811]	@ zero_extendqisi2
	b	.L583
.L585:
	strb	r2, [r4, #2]
	add	r1, r0, #16640
	str	lr, [r4, #44]
	add	r1, r1, #200
	str	lr, [r4, #760]
	add	r0, r4, #72
	ldrb	r3, [r3, #447]	@ zero_extendqisi2
	mov	r2, #664
	cmp	r3, #1
	moveq	r5, #2
	strb	r5, [r4, #4]
	bl	memcpy
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L587:
	strb	r2, [r4, #2]
	add	r1, r3, #456
	str	lr, [r4, #44]
	add	r0, r4, #72
	str	lr, [r4, #760]
	mov	r2, #664
	ldrb	r3, [r3, #447]	@ zero_extendqisi2
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r4, #4]
	bl	memcpy
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L586:
	strd	r8, [r1, #-8]
	b	.L576
	UNWIND(.fnend)
	.size	MVC_UpdateCurrFrameInfo, .-MVC_UpdateCurrFrameInfo
	.align	2
	.global	MVC_SimpleSlideDPB
	.type	MVC_SimpleSlideDPB, %function
MVC_SimpleSlideDPB:
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
	add	r3, r0, #11075584
	mov	r7, r0
	add	r3, r3, #45056
	ldr	r5, [r3, #3016]
	ldr	r3, [r3, #3020]
	cmp	r3, r5
	addcc	r6, r0, #11141120
	bcc	.L589
	cmp	r5, #0
	beq	.L594
	movw	ip, #47876
	add	r6, r0, #11141120
	movt	ip, 169
	mov	r1, #0
	add	r8, r6, #16384
	add	ip, r0, ip
	mov	r3, r1
	mvn	r4, #-2147483648
.L592:
	ldr	r2, [ip, #4]!
	cmp	r2, #0
	beq	.L591
	ldr	lr, [r2, #64]
	cmp	r4, lr
	bls	.L591
	ldr	r0, [r2, #56]
	ldr	r2, [r8, #1200]
	cmp	r0, r2
	moveq	r4, lr
	moveq	r1, r3
.L591:
	add	r3, r3, #1
	cmp	r3, r5
	bne	.L592
	mov	r5, r1
.L590:
	movw	r3, #28354
	mov	r0, r7
	movt	r3, 42
	add	r3, r1, r3
	ldr	r1, [r7, r3, asl #2]
	bl	MVC_UnMarkFrameStoreRef
	mov	r1, r5
	mov	r0, r7
	bl	MVC_RemoveFrameStoreOutDPB
.L589:
	add	r3, r6, #16384
	mov	r1, #0
	ldr	r2, [r3, #1136]
	strb	r1, [r3, #444]
	cmp	r2, r1
	movne	r2, #1
	strneb	r2, [r3, #445]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L594:
	add	r6, r0, #11141120
	mov	r1, r5
	b	.L590
	UNWIND(.fnend)
	.size	MVC_SimpleSlideDPB, .-MVC_SimpleSlideDPB
	.align	2
	.global	MVC_ReleaseNAL
	.type	MVC_ReleaseNAL, %function
MVC_ReleaseNAL:
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
	beq	.L612
	add	r7, r5, #56
	mov	r4, r5
	mov	r3, #0
	strb	r3, [r5, #1]
	strb	r3, [r5, #3]
.L607:
	ldr	r3, [r4, #8]
	mov	r0, r6
	cmp	r3, #0
	beq	.L606
	ldr	r1, [r4, #32]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #8]
	mov	r0, #7
	ldr	r1, .L613
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r4, #8]
	str	r3, [r4, #24]
	str	r3, [r4, #12]
.L606:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L607
	mov	r3, #0
	strb	r3, [r5]
	str	r3, [r5, #68]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L612:
	mov	r0, r5
	movw	r3, #4022
	ldr	r2, .L613+4
	ldr	r1, .L613+8
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	dprint_vfmw
.L614:
	.align	2
.L613:
	.word	.LC21
	.word	.LC13
	.word	.LC14
	UNWIND(.fnend)
	.size	MVC_ReleaseNAL, .-MVC_ReleaseNAL
	.align	2
	.global	MVC_ClearCurrNal
	.type	MVC_ClearCurrNal, %function
MVC_ClearCurrNal:
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
	ldr	r1, [r0, #232]
	mov	r4, r0
	cmp	r1, #0
	beq	.L616
	ldr	r0, [r0, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L616:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ClearCurrNal, .-MVC_ClearCurrNal
	.align	2
	.global	MVC_ClearCurrSlice
	.type	MVC_ClearCurrSlice, %function
MVC_ClearCurrSlice:
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
	ldr	r1, .L625
	mov	r4, r0
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L621
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L621:
	ldr	r3, [r4, #80]
	mov	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #80]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L626:
	.align	2
.L625:
	.word	.LC22
	UNWIND(.fnend)
	.size	MVC_ClearCurrSlice, .-MVC_ClearCurrSlice
	.align	2
	.global	MVC_ClearAllNal
	.type	MVC_ClearAllNal, %function
MVC_ClearAllNal:
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
	add	r4, r0, #936
	add	r5, r0, #12992
	b	.L629
.L628:
	add	r4, r4, #88
	cmp	r4, r5
	beq	.L631
.L629:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L628
	mov	r1, r4
	ldr	r0, [r6, #120]
	add	r4, r4, #88
	bl	MVC_ReleaseNAL
	cmp	r4, r5
	bne	.L629
.L631:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ClearAllNal, .-MVC_ClearAllNal
	.align	2
	.global	MVC_ClearAllSlice
	.type	MVC_ClearAllSlice, %function
MVC_ClearAllSlice:
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
	movw	r4, #18384
	movw	r5, #18928
	movt	r4, 170
	movt	r5, 170
	add	r4, r0, r4
	add	r5, r0, r5
	mov	r6, r0
	mov	r7, #0
.L634:
	ldr	r1, [r4, #4]!
	cmp	r1, #0
	beq	.L633
	ldr	r0, [r6, #120]
	bl	MVC_ReleaseNAL
	str	r7, [r4]
.L633:
	cmp	r4, r5
	bne	.L634
	mov	r0, #0
	str	r0, [r6, #64]
	str	r0, [r6, #104]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ClearAllSlice, .-MVC_ClearAllSlice
	.align	2
	.global	MVC_ClearCurrPic
	.type	MVC_ClearCurrPic, %function
MVC_ClearCurrPic:
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
	bl	MVC_ClearAllSlice
	ldr	r0, [r4, #40]
	add	r3, r4, #11075584
	add	r3, r3, #40960
	mov	r2, #0
	movw	r1, #23352
	movt	r1, 1
	str	r0, [r3, #2828]
	str	r1, [r3, #2832]
	mov	r0, #2
	mov	r1, #7
	strb	r0, [r3, #2817]
	strb	r1, [r3, #2819]
	mov	r0, #32
	mov	r1, #3
	strb	r0, [r3, #2818]
	str	r1, [r3, #2840]
	mvn	r0, #0
	mov	r1, #262144
	str	r0, [r3, #2844]
	str	r1, [r3, #2856]
	mov	r0, r2
	strb	r2, [r3, #2816]
	str	r2, [r3, #2848]
	str	r2, [r3, #2852]
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ClearCurrPic, .-MVC_ClearCurrPic
	.align	2
	.global	MVC_ArrangeVahbMem
	.type	MVC_ArrangeVahbMem, %function
MVC_ArrangeVahbMem:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #40)
	sub	sp, sp, #40
	sub	r4, r1, #32
	sub	r3, r2, #32
	movw	ip, #8160
	cmp	r3, ip
	cmpls	r4, ip
	mov	r6, r1
	mov	r7, r2
	mov	r5, r0
	movhi	r4, #1
	movls	r4, #0
	bhi	.L650
	ldr	r3, .L652
	mov	r2, #32
	mov	r1, r4
	sub	r0, fp, #60
	ldr	r3, [r3, #48]
	blx	r3
	ldr	r3, [r5, #224]
	str	r7, [fp, #-32]
	strb	r4, [fp, #-60]
	ldr	r3, [r3, #28]
	strb	r4, [fp, #-59]
	cmp	r3, #24
	str	r6, [fp, #-52]
	str	r7, [fp, #-48]
	str	r6, [fp, #-44]
	str	r7, [fp, #-40]
	str	r6, [fp, #-36]
	beq	.L643
	add	r2, r5, #11075584
	ldrb	r3, [fp, #4]	@ zero_extendqisi2
	add	r2, r2, #45056
	mov	r1, #5
	strb	r4, [fp, #-56]
	ldr	r2, [r2, #3016]
	strb	r1, [fp, #-55]
	add	r2, r2, #3
	strb	r2, [fp, #-57]
.L648:
	sub	r1, fp, #60
	ldr	r0, [r5, #120]
	mov	r4, #0
	strb	r3, [fp, #-54]
	strb	r4, [fp, #-58]
	bl	FSP_ConfigInstance
	cmp	r0, r4
	bne	.L644
	ldr	r1, [r5, #224]
	sub	r3, fp, #64
	ldr	r0, [r5, #120]
	ldr	r2, [r1, #24]
	ldr	r1, [r1, #20]
	bl	FSP_ConfigFrameBuf
	cmp	r0, #2
	beq	.L651
	cmp	r0, #0
	moveq	r0, #1
	bne	.L646
.L649:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L643:
	mov	r3, #1
	mov	r2, #5
	strb	r4, [fp, #-56]
	strb	r3, [fp, #-57]
	strb	r2, [fp, #-55]
	b	.L648
.L651:
	add	r0, r5, #584
	bl	ResetVoQueue
.L646:
	ldr	r1, .L652+4
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L649
.L650:
	mov	r3, r2
	mov	r0, #0
	mov	r2, r1
	ldr	r1, .L652+8
	bl	dprint_vfmw
	mvn	r0, #19
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L644:
	mov	r0, r4
	ldr	r1, .L652+12
	bl	dprint_vfmw
	mvn	r0, #19
	b	.L649
.L653:
	.align	2
.L652:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC24
	.word	.LC23
	.word	.LC25
	UNWIND(.fnend)
	.size	MVC_ArrangeVahbMem, .-MVC_ArrangeVahbMem
	.align	2
	.global	MVC_RepairList
	.type	MVC_RepairList, %function
MVC_RepairList:
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
	add	r3, r0, #11075584
	mov	r7, r0
	add	r3, r3, #40960
	ldrb	r3, [r3, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L656
	bcc	.L671
	cmp	r3, #2
	bne	.L677
.L672:
	mov	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L668:
	mov	r0, r7
.L677:
	bl	MVC_ClearCurrSlice
	mvn	r0, #0
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L656:
	mov	r0, #2
.L657:
	movw	r6, #42164
	add	r8, r7, #11141120
	movt	r6, 169
	add	r6, r7, r6
	add	r8, r8, #16384
	add	r5, r7, #256
	ldr	r2, [r6, #4]!
	mov	lr, r7
	mov	r4, #0
	mov	r9, #1
	cmp	r2, #0
	beq	.L659
.L679:
	ldr	r10, [lr, #256]
	cmp	r10, #0
	bne	.L673
	mov	ip, r5
	mov	r3, r10
	b	.L661
.L662:
	ldr	r1, [ip, #4]!
	cmp	r1, #0
	bne	.L664
.L661:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L662
	ldr	r3, [r7, #224]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L668
	ldr	r1, [r8, #1120]
	add	r1, r1, #736
.L664:
	mov	ip, r5
	mov	r3, #0
	b	.L670
.L666:
	ldr	r10, [ip, #4]!
.L670:
	add	r3, r3, #1
	cmp	r10, #0
	streq	r1, [ip]
	cmp	r3, r2
	bne	.L666
.L667:
	add	r4, r4, #1
	add	r5, r5, #132
	cmp	r0, r4
	add	lr, lr, #132
	bls	.L672
	ldr	r2, [r6, #4]!
	cmp	r2, #0
	bne	.L679
.L659:
	ldr	r3, [r7, #224]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L668
	str	r9, [r6]
	ldr	r3, [r8, #1120]
	add	r3, r3, #736
	str	r3, [lr, #256]
	b	.L667
.L673:
	mov	r1, r10
	b	.L664
.L671:
	mov	r0, #1
	b	.L657
	UNWIND(.fnend)
	.size	MVC_RepairList, .-MVC_RepairList
	.align	2
	.global	MVC_GetShortTermPicPoint
	.type	MVC_GetShortTermPicPoint, %function
MVC_GetShortTermPicPoint:
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
	add	r3, r0, #11075584
	add	r2, r3, #40960
	ldrb	r4, [r2, #1161]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L681
	ldrb	r2, [r2, #1162]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r4, #2
	moveq	r4, #1
.L681:
	add	r3, r3, #45056
	ldr	r5, [r3, #3024]
	cmp	r5, #0
	beq	.L689
	movw	r3, #47944
	mov	r2, #0
	movt	r3, 169
	add	r3, r0, r3
	b	.L686
.L699:
	ldrb	ip, [r0, #3]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L697
.L684:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L698
.L686:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L699
	ldrb	lr, [r0, #3]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L685
	ldr	ip, [r0, #772]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	beq	.L700
.L685:
	tst	lr, #2
	beq	.L684
	ldr	ip, [r0, #808]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L684
	ldr	ip, [r0, #820]
	cmp	ip, r1
	bne	.L684
	add	r0, r0, #808
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L697:
	ldr	ip, [r0, #736]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L684
	ldr	ip, [r0, #748]
	cmp	ip, r1
	bne	.L684
	add	r0, r0, #736
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L700:
	ldr	ip, [r0, #784]
	cmp	ip, r1
	bne	.L685
	add	r0, r0, #772
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L698:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L689:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetShortTermPicPoint, .-MVC_GetShortTermPicPoint
	.align	2
	.global	MVC_GetLongTermPicPoint
	.type	MVC_GetLongTermPicPoint, %function
MVC_GetLongTermPicPoint:
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
	add	r3, r0, #11075584
	add	r2, r3, #40960
	ldrb	r4, [r2, #1161]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L702
	ldrb	r2, [r2, #1162]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r4, #2
	moveq	r4, #1
.L702:
	add	r3, r3, #45056
	ldr	r5, [r3, #3028]
	cmp	r5, #0
	beq	.L710
	movw	r3, #48008
	mov	r2, #0
	movt	r3, 169
	add	r3, r0, r3
	b	.L707
.L720:
	ldrb	ip, [r0, #3]	@ zero_extendqisi2
	cmp	ip, #3
	beq	.L718
.L705:
	add	r2, r2, #1
	add	r3, r3, #4
	cmp	r2, r5
	beq	.L719
.L707:
	cmp	r4, #0
	ldr	r0, [r3]
	beq	.L720
	ldrb	lr, [r0, #3]	@ zero_extendqisi2
	tst	lr, #1
	beq	.L706
	ldr	ip, [r0, #772]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	beq	.L721
.L706:
	tst	lr, #2
	beq	.L705
	ldr	ip, [r0, #808]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L705
	ldr	ip, [r0, #816]
	cmp	ip, r1
	bne	.L705
	add	r0, r0, #808
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L718:
	ldr	ip, [r0, #736]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	bne	.L705
	ldr	ip, [r0, #744]
	cmp	ip, r1
	bne	.L705
	add	r0, r0, #736
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L721:
	ldr	ip, [r0, #780]
	cmp	ip, r1
	bne	.L706
	add	r0, r0, #772
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L719:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L710:
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetLongTermPicPoint, .-MVC_GetLongTermPicPoint
	.align	2
	.global	MVC_ReorderSTList
	.type	MVC_ReorderSTList, %function
MVC_ReorderSTList:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	ip, r1, asl #7
	ldr	r7, [fp, #4]
	add	r6, ip, r1, lsl #2
	mov	r1, r3
	add	r6, r6, #256
	mov	r5, r3
	mov	r8, r2
	add	r6, r0, r6
	bl	MVC_GetShortTermPicPoint
	ldr	r4, [r7]
	add	r3, r8, #1
	ldr	r1, [fp, #8]
	cmp	r3, r4
	ble	.L723
	add	lr, r6, r3, lsl #2
	mov	ip, r3
.L724:
	ldr	r4, [lr, #-4]!
	sub	ip, ip, #1
	str	r4, [lr, #4]
	ldr	r4, [r7]
	cmp	r4, ip
	blt	.L724
.L723:
	add	r2, r4, #1
	str	r2, [r7]
	str	r0, [r6, r4, asl #2]
	ldr	ip, [r7]
	cmp	r3, ip
	ldmltfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r2, r8, #2
	add	r4, r6, ip, lsl #2
	mov	lr, ip
	b	.L728
.L727:
	str	r0, [r6, lr, asl #2]
	add	lr, lr, #1
.L726:
	cmp	ip, r2
	beq	.L736
.L728:
	ldr	r0, [r4], #4
	add	ip, ip, #1
	cmp	r0, #0
	beq	.L726
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L727
	ldr	r3, [r0, #12]
	cmp	r3, r5
	bne	.L727
	ldr	r3, [r0, #4]
	ldr	r3, [r3, #56]
	cmp	r3, r1
	bne	.L727
	cmp	ip, r2
	bne	.L728
.L736:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ReorderSTList, .-MVC_ReorderSTList
	.align	2
	.global	MVC_ReorderLTList
	.type	MVC_ReorderLTList, %function
MVC_ReorderLTList:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	mov	ip, r1, asl #7
	ldr	r7, [fp, #4]
	add	r6, ip, r1, lsl #2
	mov	r1, r3
	add	r6, r6, #256
	mov	r5, r3
	mov	r8, r2
	add	r6, r0, r6
	bl	MVC_GetLongTermPicPoint
	ldr	r4, [r7]
	add	r3, r8, #1
	ldr	r1, [fp, #8]
	cmp	r3, r4
	ble	.L738
	add	lr, r6, r3, lsl #2
	mov	ip, r3
.L739:
	ldr	r4, [lr, #-4]!
	sub	ip, ip, #1
	str	r4, [lr, #4]
	ldr	r4, [r7]
	cmp	r4, ip
	blt	.L739
.L738:
	add	r2, r4, #1
	str	r2, [r7]
	str	r0, [r6, r4, asl #2]
	ldr	ip, [r7]
	cmp	r3, ip
	ldmltfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r2, r8, #2
	add	r4, r6, ip, lsl #2
	mov	lr, ip
	b	.L743
.L742:
	str	r0, [r6, lr, asl #2]
	add	lr, lr, #1
.L741:
	cmp	ip, r2
	beq	.L754
.L743:
	ldr	r0, [r4], #4
	add	ip, ip, #1
	cmp	r0, #0
	beq	.L741
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L742
	ldr	r3, [r0, #8]
	cmp	r3, r5
	bne	.L742
	ldr	r3, [r0, #4]
	ldr	r3, [r3, #56]
	cmp	r3, r1
	bne	.L742
	cmp	ip, r2
	bne	.L743
.L754:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ReorderLTList, .-MVC_ReorderLTList
	.align	2
	.global	MVC_GetMaxViewIdx
	.type	MVC_GetMaxViewIdx, %function
MVC_GetMaxViewIdx:
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
	add	ip, r0, #10747904
	movw	lr, #22868
	add	ip, ip, #20480
	movt	lr, 164
	add	lr, r0, lr
	ldr	r5, [ip, #2384]
	adds	r5, r5, #1
	beq	.L762
	ldr	ip, [ip, #2388]
	cmp	r1, ip
	beq	.L763
	mov	r6, r5
	mov	ip, #0
	b	.L757
.L759:
	ldr	r4, [lr, #4]!
	cmp	r1, r4
	beq	.L765
.L757:
	add	ip, ip, #1
	cmp	ip, r5
	bne	.L759
	cmp	r6, #0
	blt	.L766
.L756:
	cmp	r2, #0
	add	r6, r6, r3, lsl #1
	movwne	r3, #5718
	movweq	r3, #5726
	movt	r3, 41
	add	r3, r6, r3
	add	r0, r0, r3, lsl #2
	ldr	r0, [r0, #4]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L765:
	mov	r6, ip
	cmp	r6, #0
	bge	.L756
.L766:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L762:
	mov	r6, r5
	b	.L756
.L763:
	mov	r6, #0
	b	.L756
	UNWIND(.fnend)
	.size	MVC_GetMaxViewIdx, .-MVC_GetMaxViewIdx
	.align	2
	.global	mvc_get_inter_view_pic
	.type	mvc_get_inter_view_pic, %function
mvc_get_inter_view_pic:
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
	movw	ip, #27326
	mov	r4, #1696
	movt	ip, 42
	add	ip, r3, ip
	mla	r3, r4, r3, r0
	ldr	lr, [r0, ip, asl #2]
	movw	ip, #31360
	cmp	lr, #0
	movt	ip, 169
	add	ip, r3, ip
	beq	.L773
	add	r4, r0, #11141120
	mov	r3, #0
	mov	r0, ip
	add	r4, r4, #16384
	b	.L772
.L769:
	cmp	r3, lr
	add	r0, r0, #848
	beq	.L775
.L772:
	ldr	ip, [r0, #56]
	add	r3, r3, #1
	cmp	ip, r1
	bne	.L769
	ldrb	ip, [r4, #443]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L770
	ldr	ip, [r0, #756]
	cmp	ip, r2
	bne	.L769
	add	r0, r0, #736
	ldmfd	sp, {r4, fp, sp, pc}
.L770:
	cmp	ip, #1
	beq	.L776
	cmp	ip, #2
	bne	.L769
	ldr	ip, [r0, #828]
	cmp	ip, r2
	bne	.L769
	add	r0, r0, #808
	ldmfd	sp, {r4, fp, sp, pc}
.L776:
	ldr	ip, [r0, #792]
	cmp	ip, r2
	bne	.L769
	add	r0, r0, #772
	ldmfd	sp, {r4, fp, sp, pc}
.L775:
	mov	r0, #0
	ldmfd	sp, {r4, fp, sp, pc}
.L773:
	mov	r0, lr
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	mvc_get_inter_view_pic, .-mvc_get_inter_view_pic
	.align	2
	.global	mvc_reorder_interview
	.type	mvc_reorder_interview, %function
mvc_reorder_interview:
	UNWIND(.fnstart)
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	ldr	r4, [fp, #8]
	mov	r7, r2
	ldr	r6, [fp, #4]
	mov	r5, r3
	mov	r8, r1
	mov	r1, r3
	mov	r2, r4, asl #7
	mov	r3, r4
	add	r4, r2, r4, lsl #2
	mov	r2, r6
	add	r4, r4, #256
	add	r4, r0, r4
	bl	mvc_get_inter_view_pic
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, [r7]
	add	r1, r8, #1
	cmp	r1, r3
	bls	.L779
	add	lr, r4, r1, lsl #2
	mov	ip, r1
.L780:
	ldr	r3, [lr, #-4]!
	sub	ip, ip, #1
	str	r3, [lr, #4]
	ldr	r3, [r7]
	cmp	r3, ip
	bcc	.L780
.L779:
	add	r2, r3, #1
	str	r2, [r7]
	str	r0, [r4, r3, asl #2]
	ldr	ip, [r7]
	cmp	r1, ip
	ldmccfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r3, r4, ip, lsl #2
	mov	lr, ip
	b	.L784
.L782:
	cmp	r1, ip
	str	r0, [r4, lr, asl #2]
	add	lr, lr, #1
	bcc	.L791
.L784:
	ldr	r0, [r3], #4
	add	ip, ip, #1
	cmp	r0, #0
	beq	.L782
	ldr	r2, [r0, #4]
	ldr	r2, [r2, #56]
	cmp	r2, r5
	bne	.L782
	ldr	r2, [r0, #20]
	cmp	r2, r6
	bne	.L782
	cmp	r1, ip
	bcs	.L784
.L791:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	mvc_reorder_interview, .-mvc_reorder_interview
	.align	2
	.global	MVC_ReorderRefPiclist
	.type	MVC_ReorderRefPiclist, %function
MVC_ReorderRefPiclist:
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
	UNWIND(.pad #68)
	sub	sp, sp, #68
	mov	r5, r0
	add	r0, r0, #11075584
	str	r2, [fp, #-64]
	add	r9, r0, #40960
	mov	r2, #0
	mov	r10, r1
	str	r2, [fp, #-48]
	ldrb	r3, [r9, #1161]	@ zero_extendqisi2
	cmp	r3, r2
	beq	.L793
	ldrb	r3, [r9, #1162]	@ zero_extendqisi2
	cmp	r3, r2
	movne	r3, #2
	moveq	r3, #1
.L793:
	cmp	r10, #1
	bls	.L841
.L792:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L841:
	cmp	r10, #0
	beq	.L842
	movw	r1, #41204
	movw	r8, #41468
	movw	r7, #41988
	movt	r1, 169
	movt	r8, 169
	movt	r7, 169
	add	r1, r5, r1
	add	r8, r5, r8
	add	r7, r5, r7
	add	r2, r0, #41728
	str	r2, [fp, #-100]
.L796:
	ldr	r0, [r5, #236]
	cmp	r3, #0
	mov	r2, #1
	ldr	r3, [r0, #2896]
	add	r3, r3, #4
	mov	r3, r2, asl r3
	str	r3, [fp, #-88]
	ldr	r3, [r9, #1188]
	ldrne	r2, [fp, #-88]
	movne	r3, r3, asl #1
	addne	r3, r3, #1
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-64]
	movne	r2, r2, asl #1
	strne	r2, [fp, #-88]
	adds	r3, r3, #2
	str	r3, [fp, #-72]
	beq	.L792
	ldr	r2, [r1]
	cmp	r2, #3
	beq	.L792
	movw	r3, #22868
	str	r9, [fp, #-68]
	mov	r0, r3
	mov	r3, #0
	mov	r4, r3
	str	r3, [fp, #-76]
	str	r3, [fp, #-80]
	mov	r6, r3
	ldr	r3, [fp, #-92]
	movt	r0, 164
	mov	r9, r1
	add	r0, r5, r0
	str	r0, [fp, #-96]
	str	r3, [fp, #-60]
	mov	r3, #1
	str	r3, [fp, #-84]
	b	.L800
.L801:
	cmp	r2, #2
	beq	.L843
	ldr	r3, [fp, #-84]
	cmp	r3, #1
	beq	.L807
	ldr	r3, [fp, #-68]
	ldrb	r3, [r3, #1169]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	mov	r3, r10, asl #1
.L808:
	cmp	r2, #4
	ldr	r2, [r7]
	beq	.L844
	add	r2, r2, #1
	add	r4, r2, r4
	ldr	r2, [fp, #-76]
	cmp	r2, r4
	rsble	r4, r2, r4
.L818:
	ldr	r2, [fp, #-56]
	add	r0, r5, #11141120
	add	r0, r0, #16384
	ldr	r1, [fp, #-64]
	cmp	r2, #0
	ldr	r2, [fp, #-80]
	add	r3, r3, r2
	movwne	r2, #5722
	add	r3, r3, r4
	movweq	r2, #5730
	movt	r2, 41
	add	r2, r3, r2
	add	r2, r5, r2, lsl #2
	ldr	r3, [r2, #4]
	sub	r2, fp, #48
	str	r10, [sp, #4]
	ldr	ip, [r0, #1140]
	mov	r0, r5
	str	ip, [sp]
	bl	mvc_reorder_interview
.L805:
	ldr	r3, [fp, #-72]
	add	r6, r6, #1
	cmp	r6, r3
	beq	.L792
	ldr	r2, [r9, #4]!
	add	r7, r7, #4
	add	r8, r8, #4
	cmp	r2, #3
	beq	.L792
.L800:
	cmp	r2, #1
	bhi	.L801
	cmp	r2, #0
	ldr	r3, [r8]
	bne	.L802
	ldr	r2, [fp, #-60]
	mvn	r3, r3
	adds	r3, r2, r3
	str	r3, [fp, #-60]
	bmi	.L845
.L803:
	ldr	r2, [fp, #-60]
	mov	r1, r10
	ldr	r3, [fp, #-92]
	mov	r0, r5
	cmp	r3, r2
	movlt	r3, r2
	ldrlt	r2, [fp, #-88]
	ldrge	r3, [fp, #-60]
	rsblt	r3, r2, r3
	ldr	r2, [fp, #-68]
	ldr	ip, [r2, #2800]
	sub	r2, fp, #48
	str	r2, [sp]
	ldr	r2, [fp, #-64]
	str	ip, [sp, #4]
	bl	MVC_ReorderSTList
	b	.L805
.L842:
	movw	r1, #41072
	movw	r8, #41336
	movw	r2, #41600
	movw	r7, #41856
	movt	r1, 169
	movt	r8, 169
	movt	r2, 169
	movt	r7, 169
	add	r2, r5, r2
	add	r1, r5, r1
	add	r8, r5, r8
	str	r2, [fp, #-100]
	add	r7, r5, r7
	b	.L796
.L844:
	mvn	r2, r2
	adds	r4, r2, r4
	ldrmi	r2, [fp, #-76]
	addmi	r4, r4, r2
	b	.L818
.L807:
	add	r3, r5, #10747904
	ldr	r1, [fp, #-68]
	add	r3, r3, #20480
	ldr	ip, [r3, #2384]
	ldr	r1, [r1, #2800]
	adds	ip, ip, #1
	beq	.L809
	ldr	r3, [r3, #2388]
	cmp	r1, r3
	beq	.L810
	ldr	r0, [fp, #-96]
	mov	r3, #0
	str	ip, [fp, #-80]
	b	.L811
.L813:
	ldr	lr, [r0, #4]!
	cmp	r1, lr
	beq	.L827
.L811:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L813
.L812:
	ldr	r3, [fp, #-68]
	mov	r4, ip
	ldr	r0, [fp, #-96]
	ldrb	r3, [r3, #1169]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	mov	r3, #0
	b	.L823
.L815:
	ldr	lr, [r0, #4]!
	cmp	r1, lr
	beq	.L828
.L823:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L815
	cmp	r4, #0
	blt	.L829
.L822:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	mov	r3, r10, asl #1
	beq	.L816
	add	r4, r3, r4
	movw	r1, #5718
	movt	r1, 41
	add	r1, r4, r1
	mov	r0, #0
	str	r0, [fp, #-84]
	add	r1, r5, r1, lsl #2
	mvn	r4, #0
	ldr	r1, [r1, #4]
	str	r1, [fp, #-76]
	b	.L808
.L802:
	ldr	r2, [fp, #-60]
	add	r3, r3, #1
	add	r3, r2, r3
	ldr	r2, [fp, #-88]
	str	r3, [fp, #-60]
	cmp	r2, r3
	rsble	r3, r2, r3
	strle	r3, [fp, #-60]
	b	.L803
.L843:
	ldr	r1, [fp, #-68]
	sub	r0, fp, #48
	ldr	r3, [fp, #-100]
	ldr	r2, [fp, #-64]
	ldr	ip, [r1, #2800]
	mov	r1, r10
	ldr	r3, [r3, r6, asl #2]
	str	r0, [sp]
	mov	r0, r5
	str	ip, [sp, #4]
	bl	MVC_ReorderLTList
	b	.L805
.L827:
	str	r3, [fp, #-80]
	b	.L812
.L828:
	mov	r4, r3
	cmp	r4, #0
	bge	.L822
.L829:
	mov	r3, #0
	mvn	r4, #0
	mov	r1, r3
	str	r3, [fp, #-84]
	str	r1, [fp, #-76]
	mov	r3, r10, asl #1
	b	.L808
.L816:
	add	r4, r3, r4
	movw	r1, #5726
	movt	r1, 41
	add	r1, r4, r1
	ldr	r0, [fp, #-56]
	mvn	r4, #0
	add	r1, r5, r1, lsl #2
	str	r0, [fp, #-84]
	ldr	r1, [r1, #4]
	str	r1, [fp, #-76]
	b	.L808
.L845:
	ldr	r2, [fp, #-88]
	add	r3, r3, r2
	str	r3, [fp, #-60]
	b	.L803
.L809:
	ldr	r3, [fp, #-68]
	mov	r4, ip
	str	ip, [fp, #-80]
	ldrb	r3, [r3, #1169]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	b	.L822
.L810:
	ldr	r1, [fp, #-68]
	mov	r3, #0
	mov	r4, r3
	str	r3, [fp, #-80]
	ldrb	r1, [r1, #1169]	@ zero_extendqisi2
	str	r1, [fp, #-56]
	b	.L822
	UNWIND(.fnend)
	.size	MVC_ReorderRefPiclist, .-MVC_ReorderRefPiclist
	.align	2
	.global	MVC_ReorderListX
	.type	MVC_ReorderListX, %function
MVC_ReorderListX:
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
	add	r5, r0, #11075584
	mov	r6, r0
	add	r4, r5, #40960
	ldrb	r1, [r4, #1160]	@ zero_extendqisi2
	cmp	r1, #2
	ldmeqfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r4, #108]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L858
.L849:
	ldr	r3, [r4, #1220]
	cmp	r1, #1
	add	r3, r3, #1
	str	r3, [r4, #1208]
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r4, #109]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L859
.L851:
	add	r5, r5, #40960
	ldr	r3, [r5, #1224]
	add	r3, r3, #1
	str	r3, [r5, #1212]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L858:
	mov	r1, #0
	ldr	r2, [r4, #1220]
	bl	MVC_ReorderRefPiclist
	ldrb	r1, [r4, #1160]	@ zero_extendqisi2
	b	.L849
.L859:
	ldr	r2, [r4, #1224]
	mov	r0, r6
	bl	MVC_ReorderRefPiclist
	b	.L851
	UNWIND(.fnend)
	.size	MVC_ReorderListX, .-MVC_ReorderListX
	.align	2
	.global	MVC_GenPiclistfromFrmlist
	.type	MVC_GenPiclistfromFrmlist, %function
MVC_GenPiclistfromFrmlist:
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
	ldr	lr, .L923
	movcc	r4, r2
	ldr	ip, .L923+4
	movcs	r4, #31
	cmp	r6, #0
	str	r3, [fp, #-52]
	movne	r6, lr
	moveq	r6, ip
	cmp	r0, #1
	moveq	r5, #0
	moveq	r10, r5
	beq	.L863
	cmp	r0, #2
	moveq	r5, #0
	moveq	r10, r5
	bne	.L871
.L872:
	cmp	r10, r4
	movcs	r3, #0
	movcc	r3, #1
	cmp	r5, r4
	str	r3, [fp, #-48]
	movcs	r2, #0
	movcc	r2, #1
	orrs	r3, r2, r3
	beq	.L871
	cmp	r2, #0
	beq	.L877
	add	r8, r7, r5, lsl #2
	b	.L876
.L873:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L877
.L876:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	tst	ip, #2
	beq	.L873
	add	r0, r0, #808
	blx	r6
	cmp	r0, #0
	beq	.L873
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r0, [r3]
	add	r2, r2, #808
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L877:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r10, lsl #2
	bne	.L879
	b	.L872
.L878:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L872
.L879:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r2, [r0, #2]	@ zero_extendqisi2
	tst	r2, #1
	beq	.L878
	add	r0, r0, #772
	blx	r6
	cmp	r0, #0
	beq	.L878
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r9]
	ldr	r0, [r3]
	add	r2, r2, #772
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	b	.L872
.L922:
	add	r0, r0, #772
	blx	r6
	cmp	r0, #0
	beq	.L864
	ldr	r3, [fp, #4]
	add	r10, r10, #1
	ldr	r2, [r8]
	ldr	r0, [r3]
	add	r2, r2, #772
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L868:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	addne	r8, r7, r5, lsl #2
	bne	.L870
	b	.L863
.L869:
	add	r5, r5, #1
	cmp	r4, r5
	bls	.L863
.L870:
	mov	r9, r8
	ldr	r0, [r8], #4
	ldrb	r2, [r0, #2]	@ zero_extendqisi2
	tst	r2, #2
	beq	.L869
	add	r0, r0, #808
	blx	r6
	cmp	r0, #0
	beq	.L869
	ldr	r3, [fp, #4]
	add	r5, r5, #1
	ldr	r2, [r9]
	ldr	r0, [r3]
	add	r2, r2, #808
	ldr	r3, [fp, #-52]
	str	r2, [r3, r0, asl #2]
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
.L863:
	cmp	r10, r4
	movcs	r2, #0
	movcc	r2, #1
	cmp	r5, r4
	movcs	r3, #0
	movcc	r3, #1
	str	r3, [fp, #-48]
	orrs	r3, r3, r2
	beq	.L871
	cmp	r2, #0
	beq	.L868
	add	r9, r7, r10, lsl #2
	b	.L867
.L864:
	add	r10, r10, #1
	cmp	r4, r10
	bls	.L868
.L867:
	mov	r8, r9
	ldr	r0, [r9], #4
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	tst	ip, #1
	beq	.L864
	b	.L922
.L871:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L924:
	.align	2
.L923:
	.word	MVC_IsLTRefFlg
	.word	MVC_IsSTRefFlg
	UNWIND(.fnend)
	.size	MVC_GenPiclistfromFrmlist, .-MVC_GenPiclistfromFrmlist
	.align	2
	.global	MVC_GetBaseViewId
	.type	MVC_GetBaseViewId, %function
MVC_GetBaseViewId:
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
	add	r3, r0, #12992
	mov	r2, #0
	add	r3, r3, #16
.L928:
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L926
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L936
.L926:
	add	r2, r2, #1
	add	r3, r3, #335872
	cmp	r2, #32
	add	r3, r3, #308
	bne	.L928
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L936:
	movw	r3, #8500
	movt	r3, 5
	mla	r2, r3, r2, r0
	add	r2, r2, #12992
	ldr	r0, [r2, #20]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetBaseViewId, .-MVC_GetBaseViewId
	.align	2
	.global	MVC_GetVOIdx
	.type	MVC_GetVOIdx, %function
MVC_GetVOIdx:
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
	beq	.L941
	ldr	r3, [r0]
	cmp	r3, r2
	beq	.L942
	mov	ip, r0
	mov	r3, #0
	mov	r0, r1
	b	.L939
.L940:
	ldr	lr, [ip, #4]!
	cmp	lr, r2
	beq	.L943
.L939:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L940
	ldmfd	sp, {fp, sp, pc}
.L943:
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L941:
	mov	r0, r1
	ldmfd	sp, {fp, sp, pc}
.L942:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetVOIdx, .-MVC_GetVOIdx
	.align	2
	.global	MVC_is_view_id_in_ref_view_list
	.type	MVC_is_view_id_in_ref_view_list, %function
MVC_is_view_id_in_ref_view_list:
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
	cmp	r2, #0
	beq	.L948
	ldr	r3, [r1]
	cmp	r3, r0
	beq	.L949
	mov	r3, #0
	b	.L946
.L947:
	ldr	ip, [r1, #4]!
	cmp	ip, r0
	beq	.L945
.L946:
	add	r3, r3, #1
	cmp	r3, r2
	mov	lr, r3
	bne	.L947
.L945:
	cmp	r2, #0
	cmpne	r2, lr
	movhi	r0, #1
	movls	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L948:
	mov	lr, r2
	b	.L945
.L949:
	mov	lr, #0
	b	.L945
	UNWIND(.fnend)
	.size	MVC_is_view_id_in_ref_view_list, .-MVC_is_view_id_in_ref_view_list
	.align	2
	.global	MVC_GenPiclistfromFrmlist_Interview
	.type	MVC_GenPiclistfromFrmlist_Interview, %function
MVC_GenPiclistfromFrmlist_Interview:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	cmp	r0, #1
	ldr	ip, [fp, #4]
	beq	.L966
	cmp	r0, #2
	ldmnefd	sp, {fp, sp, pc}
	cmp	r2, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r0, [ip]
	add	r1, r1, #808
	mov	lr, #0
.L957:
	add	lr, lr, #1
	str	r1, [r3, r0, asl #2]
	cmp	lr, r2
	ldr	r0, [ip]
	add	r1, r1, #848
	add	r0, r0, #1
	str	r0, [ip]
	bne	.L957
	ldmfd	sp, {fp, sp, pc}
.L966:
	cmp	r2, #0
	ldmeqfd	sp, {fp, sp, pc}
	ldr	r0, [ip]
	add	r1, r1, #772
	mov	lr, #0
.L953:
	add	lr, lr, #1
	str	r1, [r3, r0, asl #2]
	cmp	lr, r2
	ldr	r0, [ip]
	add	r1, r1, #848
	add	r0, r0, #1
	str	r0, [ip]
	bne	.L953
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GenPiclistfromFrmlist_Interview, .-MVC_GenPiclistfromFrmlist_Interview
	.align	2
	.global	mvc_append_interview_list
	.type	mvc_append_interview_list, %function
mvc_append_interview_list:
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
	add	lr, r0, #10747904
	add	lr, lr, #20480
	add	ip, r0, #11075584
	add	r5, ip, #40960
	mov	r9, r0
	ldr	r6, [lr, #2384]
	movw	r0, #22868
	movt	r0, 164
	str	r2, [fp, #-48]
	adds	r6, r6, #1
	ldr	r7, [r5, #2800]
	add	r0, r9, r0
	beq	.L986
	ldr	r2, [lr, #2388]
	cmp	r7, r2
	beq	.L987
	mov	r2, #0
	b	.L969
.L970:
	ldr	lr, [r0, #4]!
	cmp	r7, lr
	beq	.L968
.L969:
	add	r2, r2, #1
	cmp	r2, r6
	mov	r4, r2
	bne	.L970
.L968:
	ldrb	r2, [r5, #1169]	@ zero_extendqisi2
	add	r4, r4, r1, lsl #1
	add	r6, r9, #11141120
	add	ip, ip, #45056
	cmp	r2, #0
	add	r6, r6, #16384
	movwne	r2, #5718
	movweq	r2, #5726
	movtne	r2, 41
	movteq	r2, 41
	addne	r2, r4, r2
	addeq	r2, r4, r2
	ldrb	r8, [r6, #443]	@ zero_extendqisi2
	addne	r4, r9, r4, lsl #2
	add	r2, r9, r2, lsl #2
	movwne	r10, #22892
	addeq	r4, r9, r4, lsl #2
	movweq	r10, #22924
	ldr	r7, [r2, #4]
	sub	r8, r8, #2
	ldr	r2, [ip, #3016]
	movt	r10, 164
	clz	r8, r8
	add	r10, r4, r10
	subs	r4, r2, #1
	mov	r8, r8, lsr #5
	bmi	.L967
	movw	r5, #28354
	movt	r5, 42
	add	r5, r2, r5
	mov	r2, r3
	mov	r3, r9
	add	r5, r9, r5, lsl #2
	mov	r9, r2
	b	.L984
.L1010:
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r2, #3
	ldreq	r0, [r1, #756]
	bne	.L974
.L976:
	add	r2, r1, r8
	ldrb	r2, [r2, #12]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L974
	ldr	r2, [r6, #1140]
	cmp	r2, r0
	beq	.L1009
.L974:
	subs	r4, r4, #1
	bmi	.L967
.L984:
	ldr	r1, [r5, #-4]!
	cmp	r1, #0
	beq	.L974
	ldrb	r2, [r6, #443]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1010
	cmp	r2, #1
	beq	.L1011
	cmp	r2, #2
	bne	.L974
	ldrb	r0, [r6, #441]	@ zero_extendqisi2
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r0, #0
	ubfx	r2, r2, #1, #1
	beq	.L979
	ldr	r0, [r6, #1120]
	ldr	ip, [r1, #792]
	ldr	r0, [r0, #792]
	cmp	ip, r0
	movne	r2, #0
	andeq	r2, r2, #1
.L979:
	cmp	r2, #0
	ldrne	r0, [r1, #828]
	bne	.L976
	subs	r4, r4, #1
	bpl	.L984
.L967:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1011:
	ldrb	r0, [r6, #441]	@ zero_extendqisi2
	ldrb	r2, [r1, #2]	@ zero_extendqisi2
	cmp	r0, #0
	and	r2, r2, #1
	beq	.L978
	ldr	r0, [r6, #1120]
	ldr	ip, [r1, #828]
	ldr	r0, [r0, #828]
	cmp	ip, r0
	movne	r2, #0
	andeq	r2, r2, #1
.L978:
	cmp	r2, #0
	ldrne	r0, [r1, #792]
	bne	.L976
	b	.L974
.L1009:
	cmp	r7, #0
	ldr	lr, [r1, #56]
	beq	.L974
	ldr	r2, [r10]
	cmp	lr, r2
	beq	.L980
	mov	r0, r10
	mov	r2, #0
.L981:
	add	r2, r2, #1
	cmp	r2, r7
	beq	.L974
	ldr	ip, [r0, #4]!
	cmp	lr, ip
	bne	.L981
.L980:
	str	r3, [fp, #-52]
	mov	r2, #848
	ldr	r3, .L1012
	ldr	r0, [r9]
	ldr	ip, [r3, #52]
	ldr	r3, [fp, #-48]
	mla	r0, r2, r0, r3
	blx	ip
	ldr	r2, [r9]
	ldr	r0, [fp, #-48]
	mov	r1, #848
	mov	ip, #848
	ldr	r3, [fp, #-52]
	mla	r2, r1, r2, r0
	str	r2, [r2, #812]
	str	r2, [r2, #776]
	str	r2, [r2, #740]
	ldr	r2, [r9]
	ldr	r1, [r3, #52]
	mla	r2, ip, r2, r0
	sub	r1, r1, #1
	str	r1, [r2, #48]
	ldr	r2, [r9]
	cmp	r2, r7
	beq	.L967
	add	r2, r2, #1
	str	r2, [r9]
	b	.L974
.L986:
	mov	r4, r6
	b	.L968
.L987:
	mov	r4, #0
	b	.L968
.L1013:
	.align	2
.L1012:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	mvc_append_interview_list, .-mvc_append_interview_list
	.align	2
	.global	MVC_InitListX
	.type	MVC_InitListX, %function
MVC_InitListX:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 216
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, r10, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #228)
	sub	sp, sp, #228
	add	r3, r0, #11075584
	add	r4, r3, #40960
	add	r6, r0, #11141120
	str	r3, [fp, #-244]
	add	r6, r6, #16384
	ldrb	r9, [r4, #1160]	@ zero_extendqisi2
	mov	r3, #0
	mov	r5, r0
	str	r3, [r4, #2812]
	cmp	r9, r3
	str	r3, [r4, #2808]
	ldrb	r7, [r6, #443]	@ zero_extendqisi2
	bne	.L1015
	cmp	r7, r3
	ldr	r3, [fp, #-244]
	add	r3, r3, #45056
	str	r3, [fp, #-240]
	bne	.L1173
	ldr	ip, [r3, #3024]
	cmp	ip, #0
	beq	.L1099
	movw	r1, #47940
	mov	r3, r7
	movt	r1, 169
	add	r1, r0, r1
	b	.L1021
.L1020:
	cmp	r3, ip
	beq	.L1019
.L1021:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #3]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L1020
	ldr	r0, [r2, #736]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #65536
	addeq	r0, r7, #64
	addeq	r2, r2, #736
	addeq	r7, r7, #1
	streq	r2, [r5, r0, asl #2]
	cmp	r3, ip
	bne	.L1021
.L1019:
	add	r3, r5, #256
	mov	r1, r7
	str	r3, [fp, #-248]
	mov	r2, #4
	mov	r0, r3
	ldr	r3, .L1183
	bl	qsort
	ldr	r3, [fp, #-240]
	str	r7, [r4, #1208]
	ldr	r1, [r3, #3028]
	cmp	r1, #0
	beq	.L1100
	movw	r0, #48004
	mov	r8, r7
	movt	r0, 169
	mov	r3, #0
	add	r0, r5, r0
	b	.L1024
.L1023:
	cmp	r3, r1
	beq	.L1174
.L1024:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #3]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1023
	ldr	ip, [r2, #736]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #256
	addeq	ip, r8, #64
	addeq	r2, r2, #736
	addeq	r8, r8, #1
	streq	r2, [r5, ip, asl #2]
	cmp	r3, r1
	bne	.L1024
.L1174:
	rsb	r1, r7, r8
.L1022:
	add	r0, r7, #64
	ldr	r3, .L1183+4
	mov	r2, #4
	add	r0, r5, r0, lsl #2
	bl	qsort
	str	r8, [r4, #1208]
	b	.L1025
.L1015:
	cmp	r7, #0
	beq	.L1042
	ldr	r2, [fp, #-244]
	add	r2, r2, #45056
	str	r2, [fp, #-240]
	ldr	ip, [r2, #3024]
	cmp	ip, #0
	beq	.L1175
	movw	r8, #47940
	mov	r7, r3
	movt	r8, 169
	add	r8, r0, r8
	mov	r1, r8
.L1061:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1060
	sub	r0, fp, #44
	ldr	lr, [r6, #1140]
	add	r9, r0, r7, lsl #2
	ldr	r0, [r2, #32]
	cmp	lr, r0
	strge	r2, [r9, #-192]
	addge	r7, r7, #1
.L1060:
	cmp	r3, ip
	bne	.L1061
	sub	r9, fp, #236
	ldr	r3, .L1183+8
	mov	r2, #4
	mov	r1, r7
	mov	r0, r9
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r10, [r3, #3024]
	cmp	r10, #0
	beq	.L1170
.L1097:
	mov	r3, r8
	mov	r2, #0
	mov	r8, r7
.L1064:
	ldr	r1, [r3, #4]!
	add	r2, r2, #1
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1063
	sub	r0, fp, #44
	ldr	ip, [r6, #1140]
	add	lr, r0, r8, lsl #2
	ldr	r0, [r1, #32]
	cmp	ip, r0
	strlt	r1, [lr, #-192]
	addlt	r8, r8, #1
.L1063:
	cmp	r2, r10
	bne	.L1064
	rsb	r10, r7, r8
	mov	ip, r7, asl #2
	ldr	r3, .L1183+12
	add	r0, r9, ip
	mov	r1, r10
	mov	r2, #4
	str	ip, [fp, #-248]
	bl	qsort
	cmp	r7, #0
	ldr	ip, [fp, #-248]
	subeq	r3, fp, #172
	streq	r3, [fp, #-252]
	beq	.L1065
.L1092:
	sub	r3, fp, #172
	mov	r2, r9
	str	r3, [fp, #-252]
	add	r10, r3, r10, lsl #2
	mov	r3, #0
.L1066:
	add	r3, r3, #1
	ldr	r1, [r2], #4
	cmp	r3, r7
	str	r1, [r10], #4
	bcc	.L1066
.L1065:
	cmp	r8, r7
	bls	.L1067
	ldr	r3, [fp, #-252]
	add	ip, r9, ip
.L1068:
	add	r7, r7, #1
	ldr	r2, [ip], #4
	cmp	r7, r8
	str	r2, [r3], #4
	bne	.L1068
.L1067:
	movw	ip, #42168
	mov	r7, #0
	add	r3, r5, #256
	str	r7, [r4, #1208]
	str	r7, [r4, #1212]
	mov	r1, r9
	ldrb	r0, [r6, #443]	@ zero_extendqisi2
	mov	r2, r8
	str	r7, [sp, #4]
	movt	ip, 169
	movw	r10, #42172
	add	ip, r5, ip
	str	ip, [sp]
	movt	r10, 169
	str	ip, [fp, #-260]
	add	r10, r5, r10
	str	r3, [fp, #-248]
	bl	MVC_GenPiclistfromFrmlist
	ldrb	r0, [r6, #443]	@ zero_extendqisi2
	add	r3, r5, #388
	mov	r2, r8
	str	r7, [sp, #4]
	ldr	r1, [fp, #-252]
	str	r10, [sp]
	str	r3, [fp, #-256]
	bl	MVC_GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	ip, [fp, #-260]
	ldr	r8, [r3, #3028]
	cmp	r8, r7
	subeq	r9, fp, #108
	beq	.L1069
	movw	r3, #48004
	sub	r9, fp, #108
	movt	r3, 169
	add	r3, r5, r3
	mov	r2, r9
.L1070:
	add	r7, r7, #1
	ldr	r1, [r3, #4]!
	cmp	r7, r8
	str	r1, [r2], #4
	bne	.L1070
.L1069:
	ldr	r3, .L1183+16
	mov	r2, #4
	mov	r1, r8
	mov	r0, r9
	str	ip, [fp, #-240]
	bl	qsort
	ldr	ip, [fp, #-240]
	mov	r7, #1
	ldrb	r0, [r6, #443]	@ zero_extendqisi2
	mov	r2, r8
	ldr	r3, [fp, #-248]
	mov	r1, r9
	str	ip, [sp]
	str	r7, [sp, #4]
	bl	MVC_GenPiclistfromFrmlist
	ldrb	r0, [r6, #443]	@ zero_extendqisi2
	ldr	r3, [fp, #-256]
	mov	r2, r8
	str	r7, [sp, #4]
	mov	r1, r9
	str	r10, [sp]
	bl	MVC_GenPiclistfromFrmlist
	ldr	r7, [r4, #1208]
	ldr	r3, [r4, #1212]
	rsb	r3, r3, r7
	clz	r3, r3
	mov	r3, r3, lsr #5
.L1059:
	cmp	r7, #1
	movls	r3, #0
	andhi	r3, r3, #1
	cmp	r3, #0
	beq	.L1071
	cmp	r7, #0
	beq	.L1072
	ldr	lr, [r5, #256]
	ldr	r3, [r5, #388]
	cmp	lr, r3
	bne	.L1071
	ldr	r1, [fp, #-248]
	add	r2, r5, #388
	mov	r3, #0
	b	.L1073
.L1074:
	ldr	ip, [r1, #4]!
	ldr	r0, [r2, #4]!
	cmp	ip, r0
	bne	.L1071
.L1073:
	add	r3, r3, #1
	cmp	r3, r7
	bne	.L1074
.L1075:
	ldr	r3, [r5, #392]
	str	lr, [r5, #392]
	str	r3, [r5, #388]
	ldrb	r3, [r4, #1172]	@ zero_extendqisi2
.L1093:
	cmp	r3, #0
	bne	.L1162
.L1076:
	movw	r7, #31360
	movw	r3, #43768
	movt	r7, 169
	add	r7, r5, r7
	mov	r0, r5
	movt	r3, 169
	mov	r1, #0
	mov	r2, r7
	add	r3, r5, r3
	bl	mvc_append_interview_list
	ldrb	r0, [r6, #443]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1176
	ldr	r1, [r4, #2808]
	ldr	ip, [r4, #1208]
	cmp	r1, #0
	beq	.L1078
	add	r2, ip, #63
	movw	r3, #32096
	movt	r3, 169
	add	r3, r5, r3
	add	r2, r5, r2, lsl #2
.L1079:
	add	r0, r0, #1
	str	r3, [r2, #4]!
	cmp	r0, r1
	add	r3, r3, #848
	bne	.L1079
	add	ip, ip, r0
.L1078:
	str	ip, [r4, #1208]
.L1080:
	ldrb	r1, [r4, #1160]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1177
.L1163:
	ldr	r0, [r4, #1208]
.L1077:
	cmp	r1, #0
	bne	.L1035
	cmp	r0, #0
	ldreq	r1, .L1183+20
	beq	.L1164
.L1034:
	ldr	r2, [r4, #1220]
	ldr	r3, [r4, #1224]
	add	r2, r2, #1
	ldr	r1, [r4, #1212]
	cmp	r0, r2
	add	r3, r3, #1
	movcc	r2, r0
	cmp	r3, r1
	str	r2, [r4, #1208]
	movcs	r3, r1
	cmp	r2, #32
	str	r3, [r4, #1212]
	bhi	.L1086
.L1094:
	add	r1, r2, #63
	mov	r0, #0
	add	r1, r5, r1, lsl #2
.L1087:
	add	r2, r2, #1
	str	r0, [r1, #4]!
	cmp	r2, #32
	bls	.L1087
.L1086:
	cmp	r3, #32
	bhi	.L1090
	add	r3, r3, #96
	add	r1, r5, #516
	mov	r2, #0
	add	r5, r5, r3, lsl #2
.L1089:
	str	r2, [r5, #4]!
	cmp	r5, r1
	bne	.L1089
.L1090:
	mov	r0, #0
.L1156:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1042:
	ldr	r3, [fp, #-244]
	add	r3, r3, #45056
	str	r3, [fp, #-240]
	ldr	r10, [r3, #3024]
	cmp	r10, #0
	beq	.L1045
	movw	r8, #47940
	mov	r3, r7
	movt	r8, 169
	add	r8, r0, r8
	mov	r1, r8
	b	.L1047
.L1046:
	cmp	r3, r10
	beq	.L1178
.L1047:
	ldr	r2, [r1, #4]!
	add	r3, r3, #1
	ldrb	r0, [r2, #3]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L1046
	ldr	r0, [r2, #752]
	add	lr, r7, #64
	ldr	ip, [r6, #1144]
	add	r2, r2, #736
	cmp	ip, r0
	strge	r2, [r5, lr, asl #2]
	addge	r7, r7, #1
	cmp	r3, r10
	bne	.L1047
.L1178:
	add	r3, r5, #256
	mov	r2, #4
	str	r3, [fp, #-248]
	mov	r1, r7
	mov	r0, r3
	ldr	r3, .L1183+24
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r9, [r3, #3024]
	cmp	r9, #0
	beq	.L1169
.L1095:
	mov	r10, r7
	mov	r3, #0
	b	.L1050
.L1049:
	cmp	r3, r9
	beq	.L1179
.L1050:
	ldr	r2, [r8, #4]!
	add	r3, r3, #1
	ldrb	r1, [r2, #3]	@ zero_extendqisi2
	cmp	r1, #3
	bne	.L1049
	ldr	r1, [r2, #752]
	add	ip, r10, #64
	ldr	r0, [r6, #1144]
	add	r2, r2, #736
	cmp	r0, r1
	strlt	r2, [r5, ip, asl #2]
	addlt	r10, r10, #1
	cmp	r3, r9
	bne	.L1050
.L1179:
	rsb	r9, r7, r10
	add	r0, r7, #64
	ldr	r3, .L1183+28
	mov	r2, #4
	mov	r1, r9
	add	r0, r5, r0, lsl #2
	bl	qsort
	add	r8, r10, #64
	cmp	r7, #0
	add	r8, r5, r8, lsl #2
	beq	.L1052
.L1091:
	add	r9, r9, #96
	add	r2, r5, #252
	mov	r3, #0
	add	r9, r5, r9, lsl #2
.L1053:
	add	r3, r3, #1
	ldr	r1, [r2, #4]!
	cmp	r3, r7
	str	r1, [r9, #4]!
	bcc	.L1053
.L1052:
	cmp	r10, r7
	bls	.L1054
	add	r3, r7, #63
	add	r2, r5, #384
	add	r3, r5, r3, lsl #2
.L1055:
	add	r7, r7, #1
	ldr	r1, [r3, #4]!
	cmp	r7, r10
	str	r1, [r2, #4]!
	bne	.L1055
.L1054:
	ldr	r3, [fp, #-240]
	str	r10, [r4, #1212]
	str	r10, [r4, #1208]
	ldr	r1, [r3, #3028]
	cmp	r1, #0
	beq	.L1101
	movw	r0, #48004
	mov	r7, r10
	movt	r0, 169
	mov	r3, #0
	add	r0, r5, r0
	b	.L1058
.L1057:
	cmp	r3, r1
	beq	.L1180
.L1058:
	ldr	r2, [r0, #4]!
	add	r3, r3, #1
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1057
	ldrb	ip, [r2, #737]	@ zero_extendqisi2
	cmp	ip, #1
	addeq	ip, r5, r7, lsl #2
	addeq	r2, r2, #736
	addeq	r7, r7, #1
	streq	r2, [ip, #256]
	streq	r2, [ip, #388]
	cmp	r3, r1
	bne	.L1058
.L1180:
	rsb	r1, r10, r7
.L1056:
	mov	r0, r8
	ldr	r3, .L1183+4
	mov	r2, #4
	bl	qsort
	ldr	r1, [r4, #1208]
	ldr	r3, .L1183+4
	mov	r2, #4
	add	r0, r1, #97
	rsb	r1, r1, r7
	add	r0, r5, r0, lsl #2
	bl	qsort
	str	r7, [r4, #1212]
	str	r7, [r4, #1208]
	mov	r3, #1
	b	.L1059
.L1173:
	ldr	lr, [r3, #3024]
	cmp	lr, #0
	moveq	r9, lr
	beq	.L1018
	movw	r1, #47940
	mov	r3, r9
	movt	r1, 169
	add	r1, r0, r1
.L1027:
	ldr	r2, [r1, #4]!
	sub	r0, fp, #44
	add	ip, r0, r9, lsl #2
	add	r3, r3, #1
	ldrb	r0, [r2, #3]	@ zero_extendqisi2
	cmp	r0, #0
	strne	r2, [ip, #-192]
	addne	r9, r9, #1
	cmp	r3, lr
	bne	.L1027
.L1018:
	mov	r1, r9
	ldr	r3, .L1183+32
	mov	r2, #4
	sub	r0, fp, #236
	movw	r8, #42168
	bl	qsort
	mov	r7, #0
	add	r3, r5, #256
	str	r7, [r4, #1208]
	mov	r2, r9
	ldrb	r0, [r6, #443]	@ zero_extendqisi2
	sub	r1, fp, #236
	str	r7, [sp, #4]
	movt	r8, 169
	add	r8, r5, r8
	str	r8, [sp]
	str	r3, [fp, #-248]
	bl	MVC_GenPiclistfromFrmlist
	ldr	r3, [fp, #-240]
	ldr	r10, [r3, #3028]
	cmp	r10, r7
	subeq	r9, fp, #108
	beq	.L1028
	movw	r3, #48004
	sub	r9, fp, #108
	movt	r3, 169
	add	r3, r5, r3
	mov	r2, r9
.L1029:
	add	r7, r7, #1
	ldr	r1, [r3, #4]!
	cmp	r7, r10
	str	r1, [r2], #4
	bne	.L1029
.L1028:
	ldr	r3, .L1183+16
	mov	r2, #4
	mov	r1, r10
	mov	r0, r9
	bl	qsort
	ldrb	r0, [r6, #443]	@ zero_extendqisi2
	mov	r3, #1
	str	r8, [sp]
	str	r3, [sp, #4]
	mov	r2, r10
	mov	r1, r9
	ldr	r3, [fp, #-248]
	bl	MVC_GenPiclistfromFrmlist
.L1025:
	ldrb	r3, [r4, #1172]	@ zero_extendqisi2
	mov	r2, #0
	str	r2, [r4, #1212]
	cmp	r3, r2
	beq	.L1076
	ldr	r0, [r4, #1208]
	cmp	r0, #0
	bne	.L1181
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	bne	.L1036
	ldrb	r3, [r6, #443]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1037
	ldr	r3, [r6, #1120]
	add	r3, r3, #736
	str	r3, [r5, #256]
.L1038:
	mov	r3, #1
	str	r3, [r4, #1208]
.L1162:
	ldrb	r1, [r4, #1160]	@ zero_extendqisi2
	b	.L1163
.L1181:
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1034
.L1035:
	cmp	r0, #0
	bne	.L1034
	ldr	r1, [r4, #1212]
	cmp	r1, #0
	beq	.L1182
	ldr	r3, [r4, #1224]
	mov	r2, r0
	str	r0, [r4, #1208]
	add	r3, r3, #1
	cmp	r3, r1
	movcs	r3, r1
	str	r3, [r4, #1212]
	b	.L1094
.L1071:
	ldrb	r3, [r4, #1172]	@ zero_extendqisi2
	b	.L1093
.L1176:
	movw	ip, #42168
	ldr	r2, [r4, #2808]
	ldr	r3, [fp, #-248]
	mov	r1, r7
	movt	ip, 169
	add	ip, r5, ip
	str	ip, [sp]
	bl	MVC_GenPiclistfromFrmlist_Interview
	b	.L1080
.L1037:
	cmp	r3, #1
	ldr	r3, [r6, #1120]
	addeq	r3, r3, #772
	addne	r3, r3, #808
	str	r3, [r5, #256]
	b	.L1038
.L1072:
	ldr	lr, [r5, #388]
	b	.L1075
.L1177:
	movw	r7, #33056
	movw	r3, #43772
	movt	r7, 169
	add	r7, r5, r7
	mov	r0, r5
	movt	r3, 169
	mov	r2, r7
	add	r3, r5, r3
	bl	mvc_append_interview_list
	ldrb	r0, [r6, #443]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1082
	ldr	r1, [r4, #2812]
	ldr	ip, [r4, #1212]
	cmp	r1, #0
	beq	.L1083
	add	r2, ip, #96
	ldr	r3, [fp, #-244]
	add	r2, r5, r2, lsl #2
	add	r3, r3, #33792
.L1084:
	add	r0, r0, #1
	str	r3, [r2, #4]!
	cmp	r0, r1
	add	r3, r3, #848
	bne	.L1084
	add	ip, ip, r0
.L1083:
	str	ip, [r4, #1212]
	ldrb	r1, [r4, #1160]	@ zero_extendqisi2
	ldr	r0, [r4, #1208]
	b	.L1077
.L1170:
	mov	ip, r7, asl #2
	ldr	r3, .L1183+12
	add	r0, r9, ip
	mov	r2, #4
	mov	r1, r10
	str	ip, [fp, #-248]
	bl	qsort
	subs	r8, r7, #0
	ldr	ip, [fp, #-248]
	bne	.L1092
.L1165:
	sub	r3, fp, #172
	str	r3, [fp, #-252]
	b	.L1067
.L1169:
	add	r8, r7, #64
	ldr	r3, .L1183+28
	mov	r2, #4
	mov	r1, r9
	add	r8, r5, r8, lsl #2
	mov	r0, r8
	bl	qsort
	subs	r10, r7, #0
	bne	.L1091
	b	.L1054
.L1099:
	mov	r7, ip
	b	.L1019
.L1100:
	mov	r8, r7
	b	.L1022
.L1101:
	mov	r7, r10
	b	.L1056
.L1175:
	sub	r9, fp, #236
	ldr	r3, .L1183+8
	mov	r1, ip
	mov	r2, #4
	mov	r0, r9
	str	ip, [fp, #-248]
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	ip, [fp, #-248]
	ldr	r10, [r3, #3024]
	cmp	r10, #0
	movwne	r8, #47940
	movne	r7, ip
	movtne	r8, 169
	addne	r8, r5, r8
	bne	.L1097
	ldr	r3, .L1183+12
	mov	r2, #4
	mov	r1, r10
	mov	r0, r9
	mov	r8, r10
	bl	qsort
	b	.L1165
.L1045:
	add	r3, r0, #256
	mov	r2, #4
	str	r3, [fp, #-248]
	mov	r1, r10
	mov	r0, r3
	ldr	r3, .L1183+24
	bl	qsort
	ldr	r3, [fp, #-240]
	ldr	r9, [r3, #3024]
	cmp	r9, #0
	movwne	r8, #47940
	movne	r7, r10
	movtne	r8, 169
	addne	r8, r5, r8
	bne	.L1095
	ldr	r8, [fp, #-248]
	mov	r2, #4
	ldr	r3, .L1183+28
	mov	r1, r9
	mov	r10, r9
	mov	r0, r8
	bl	qsort
	b	.L1054
.L1182:
	ldr	r1, .L1183+36
.L1164:
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	bl	MVC_ClearCurrSlice
	mvn	r0, #0
	b	.L1156
.L1082:
	movw	ip, #42172
	ldr	r2, [r4, #2812]
	mov	r1, r7
	movt	ip, 169
	add	r3, r5, #388
	add	ip, r5, ip
	str	ip, [sp]
	bl	MVC_GenPiclistfromFrmlist_Interview
	b	.L1162
.L1036:
	ldr	r1, .L1183+40
	b	.L1164
.L1184:
	.align	2
.L1183:
	.word	MVC_compare_pic_by_pic_num_desc
	.word	MVC_compare_pic_by_lt_pic_num_asc
	.word	MVC_compare_fs_by_poc_desc
	.word	MVC_compare_fs_by_poc_asc
	.word	MVC_compare_fs_by_lt_pic_idx_asc
	.word	.LC27
	.word	MVC_compare_pic_by_poc_desc
	.word	MVC_compare_pic_by_poc_asc
	.word	MVC_compare_fs_by_frame_num_desc
	.word	.LC28
	.word	.LC26
	UNWIND(.fnend)
	.size	MVC_InitListX, .-MVC_InitListX
	.align	2
	.global	MVC_DumpList
	.type	MVC_DumpList, %function
MVC_DumpList:
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
	ldr	r3, .L1198
	ldr	r3, [r3]
	tst	r3, #8192
	beq	.L1185
	movw	r8, #42164
	add	r7, r0, #252
	movt	r8, 169
	add	r8, r0, r8
	mov	r6, #0
.L1187:
	ldr	r3, [r8, #4]!
	cmp	r3, #0
	movne	r5, r7
	movne	r4, #0
	beq	.L1189
.L1188:
	ldr	ip, [r5, #4]!
	mov	r3, r4
	mov	r2, r6
	ldr	r1, .L1198+4
	mov	r0, #13
	add	r4, r4, #1
	ldr	ip, [ip, #4]
	ldr	lr, [ip, #32]
	str	lr, [sp, #4]
	ldr	ip, [ip, #20]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r8]
	cmp	r3, r4
	bhi	.L1188
.L1189:
	add	r6, r6, #1
	add	r7, r7, #132
	cmp	r6, #2
	bne	.L1187
.L1185:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1199:
	.align	2
.L1198:
	.word	g_PrintEnable
	.word	.LC29
	UNWIND(.fnend)
	.size	MVC_DumpList, .-MVC_DumpList
	.align	2
	.global	MVC_FindNearestPOCPicId
	.type	MVC_FindNearestPOCPicId, %function
MVC_FindNearestPOCPicId:
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
	add	r3, r0, #11075584
	add	r3, r3, #45056
	ldr	r2, [r3, #3020]
	cmp	r2, #0
	beq	.L1205
	ldr	r4, [r3, #3016]
	add	r3, r0, #11141120
	add	r3, r3, #16384
	cmp	r4, #0
	ldr	r5, [r3, #1140]
	beq	.L1206
	movw	ip, #47876
	mov	r6, #0
	movt	ip, 169
	add	ip, r0, ip
	mov	r1, r6
	mvn	lr, #-2147483648
.L1204:
	ldr	r2, [ip, #4]!
	add	r1, r1, #1
	cmp	r2, #0
	beq	.L1203
	ldr	r3, [r2, #32]
	rsb	r3, r3, r5
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, lr
	ldrlt	r6, [r2, #252]
	movlt	lr, r3
.L1203:
	cmp	r1, r4
	bne	.L1204
.L1202:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L1206:
	mov	r6, r4
	b	.L1202
.L1205:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_FindNearestPOCPicId, .-MVC_FindNearestPOCPicId
	.align	2
	.global	MVC_FindMinRefIdx
	.type	MVC_FindMinRefIdx, %function
MVC_FindMinRefIdx:
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
	add	r3, r0, #11075584
	add	r3, r3, #40960
	ldrb	r2, [r3, #1160]	@ zero_extendqisi2
	cmp	r2, #2
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	add	r2, r0, #11141120
	movw	r6, #48308
	add	r2, r2, #16384
	ldrb	lr, [r2, #443]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L1241
	ldr	r4, [r3, #1208]
	movw	r5, #48312
	movt	r6, 169
	movt	r5, 169
	cmp	r4, #0
	add	r6, r0, r6
	add	r5, r0, r5
	mov	r7, lr
	beq	.L1219
.L1243:
	add	r2, r0, #252
	mov	ip, #32
	mov	r3, #0
	b	.L1217
.L1216:
	add	r3, r3, #1
	cmp	r3, r4
	beq	.L1242
.L1217:
	ldr	r1, [r2, #4]!
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #52]
	cmp	r1, lr
	bne	.L1216
	cmp	ip, r3
	movcs	ip, r3
	add	r3, r3, #1
	cmp	r3, r4
	str	ip, [r5, #-4]
	str	ip, [r6, #4]
	bne	.L1217
.L1242:
	cmp	ip, #31
	bhi	.L1219
.L1218:
	add	lr, lr, #1
	add	r6, r6, #8
	cmp	lr, #16
	add	r5, r5, #8
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	r4, #0
	bne	.L1243
.L1219:
	str	r7, [r5, #-4]
	str	r7, [r6, #4]
	b	.L1218
.L1241:
	ldr	r5, [r3, #1208]
	mov	lr, #0
	movt	r6, 169
	mov	r7, lr
	cmp	r5, #0
	add	r6, r0, r6
	beq	.L1223
.L1245:
	add	r1, r0, #252
	mov	r4, #32
	mov	r2, #0
	b	.L1221
.L1220:
	add	r2, r2, #1
	cmp	r2, r5
	beq	.L1244
.L1221:
	ldr	r3, [r1, #4]!
	ldr	r8, [r3, #4]
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r3, [r8, #52]
	mov	r3, r3, asl #1
	cmp	ip, #2
	orreq	r3, r3, #1
	cmp	r3, lr
	bne	.L1220
	cmp	r4, r2
	movcs	r4, r2
	add	r2, r2, #1
	cmp	r2, r5
	str	r4, [r6]
	bne	.L1221
.L1244:
	cmp	r4, #31
	bhi	.L1223
.L1222:
	add	lr, lr, #1
	add	r6, r6, #4
	cmp	lr, #32
	ldmeqfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	cmp	r5, #0
	bne	.L1245
.L1223:
	str	r7, [r6]
	b	.L1222
	UNWIND(.fnend)
	.size	MVC_FindMinRefIdx, .-MVC_FindMinRefIdx
	.align	2
	.global	MVC_DecList
	.type	MVC_DecList, %function
MVC_DecList:
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
	mov	r4, r0
	bl	MVC_FindNearestPOCPicId
	add	r5, r4, #11075584
	mvn	r6, #0
	add	r3, r5, #40960
	ldrb	r2, [r3, #1160]	@ zero_extendqisi2
	str	r6, [r3, #2792]
	cmp	r2, #2
	str	r0, [r3, #2796]
	beq	.L1253
	mov	r0, r4
	bl	MVC_InitListX
	cmp	r0, #0
	bne	.L1254
	mov	r0, r4
	bl	MVC_ReorderListX
	mov	r0, r4
	bl	MVC_RepairList
	cmp	r0, #0
	bne	.L1251
	mov	r0, r4
	add	r5, r5, #40960
	bl	MVC_FindMinRefIdx
	ldr	r3, [r4, #256]
	mov	r0, #0
	cmp	r3, #0
	ldrne	r3, [r3, #4]
	ldrne	r6, [r3, #252]
	str	r6, [r5, #2792]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1253:
	mov	r0, #0
	str	r0, [r3, #1208]
	str	r0, [r3, #1212]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1251:
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1254:
	ldr	r1, .L1255
	mov	r0, #13
	bl	dprint_vfmw
	mov	r0, r6
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1256:
	.align	2
.L1255:
	.word	.LC30
	UNWIND(.fnend)
	.size	MVC_DecList, .-MVC_DecList
	.align	2
	.global	MVC_NoPicOut
	.type	MVC_NoPicOut, %function
MVC_NoPicOut:
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
	ldr	ip, [r0, #48]
	cmp	ip, #0
	beq	.L1264
	movw	r3, #48447
	mov	r2, #0
	movt	r3, 169
	mov	lr, r2
	add	r3, r0, r3
	b	.L1263
.L1272:
	ldrb	r1, [r3, #-2]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L1261
	cmp	r2, ip
	add	r3, r3, #848
	beq	.L1264
.L1263:
	ldrb	r1, [r3]	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r1, #1
	bne	.L1272
.L1261:
	cmp	r2, ip
	strb	lr, [r3, #-5]
	strb	lr, [r3, #-4]
	add	r3, r3, #848
	bne	.L1263
.L1264:
	ldr	r2, [r0, #52]
	cmp	r2, #0
	beq	.L1273
	mov	r3, #0
	add	r0, r0, #144
	mov	r1, r3
.L1265:
	add	r3, r3, #1
	str	r1, [r0, #4]!
	cmp	r3, r2
	bne	.L1265
	ldmfd	sp, {fp, sp, pc}
.L1273:
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_NoPicOut, .-MVC_NoPicOut
	.align	2
	.global	MVC_GetBackPicFromVOQueue
	.type	MVC_GetBackPicFromVOQueue, %function
MVC_GetBackPicFromVOQueue:
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
	ldr	r0, [r0, #120]
	bl	FSP_GetFspType
	cmp	r0, #0
	beq	.L1291
.L1275:
	ldr	r3, [r8, #48]
	cmp	r3, #0
	beq	.L1282
	movw	r5, #49136
	mov	r6, #0
	movt	r5, 169
	add	r5, r8, r5
	mov	r7, #0
	mov	r9, #0
.L1281:
	sub	r4, r5, #32
	mov	r3, #0
	strb	r3, [r5, #-694]
	strb	r3, [r5, #-693]
.L1280:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L1292
.L1279:
	cmp	r4, r5
	bne	.L1280
	ldr	r3, [r8, #48]
	add	r9, r9, #1
	add	r5, r5, #848
	cmp	r3, r9
	bhi	.L1281
.L1282:
	ldr	r2, [r8, #52]
	cmp	r2, #0
	beq	.L1293
	mov	r3, #0
	add	r8, r8, #144
	mov	r1, r3
.L1283:
	add	r3, r3, #1
	str	r1, [r8, #4]!
	cmp	r3, r2
	bne	.L1283
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1292:
	mov	r1, r2
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L1279
.L1291:
	add	r0, r8, #584
	bl	ResetVoQueue
	b	.L1275
.L1293:
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetBackPicFromVOQueue, .-MVC_GetBackPicFromVOQueue
	.align	2
	.global	mvc_wait_vo
	.type	mvc_wait_vo, %function
mvc_wait_vo:
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
	.size	mvc_wait_vo, .-mvc_wait_vo
	.align	2
	.global	MVC_RoundLog2
	.type	MVC_RoundLog2, %function
MVC_RoundLog2:
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
	mul	r0, r0, r0
	mov	r3, #0
	mov	r2, #1
.L1296:
	add	r3, r3, #1
	cmp	r0, r2, asl r3
	bge	.L1296
	mov	r0, r3, asr #1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_RoundLog2, .-MVC_RoundLog2
	.align	2
	.global	MVC_GetReRangeFlag
	.type	MVC_GetReRangeFlag, %function
MVC_GetReRangeFlag:
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
	add	ip, r0, #11075584
	add	r6, ip, #40960
	ldr	lr, [r0, #252]
	mov	r4, r0
	mov	r7, #2240
	ldrb	r0, [r6, #1172]	@ zero_extendqisi2
	mov	r5, r1
	ldr	r3, [r6, #1176]
	sxtb	r2, r0
	cmn	r2, #1
	mla	r3, r7, r3, lr
	beq	.L1315
	cmp	r0, #0
	bne	.L1301
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldr	r3, [r3, #28]
	cmp	r2, #1
	beq	.L1316
	ldr	r2, [r4, #28]
	cmp	r2, r3
	beq	.L1303
	ldr	r1, .L1318
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1301:
	ldr	r1, .L1318+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1315:
	ldr	r2, [r3, #28]
	movw	r7, #3992
	ldr	r3, [r4, #248]
	mla	r7, r7, r2, r3
.L1300:
	ldrb	r3, [r7, #20]	@ zero_extendqisi2
	ldr	r1, [r7, #3952]
	rsb	r3, r3, #2
	ldr	r2, [r7, #3948]
	ldr	lr, [r4, #12]
	mla	r3, r1, r3, r3
	ldr	r0, [r4, #16]
	add	r2, r2, #1
	cmp	r2, lr
	cmpeq	r3, r0
	movne	r8, #1
	moveq	r8, #0
	bne	.L1305
	add	r1, ip, #45056
	ldr	ip, [r7, #3972]
	ldr	r1, [r1, #3016]
	add	r1, r1, #1
	cmp	ip, r1
	movls	lr, r8
	bls	.L1306
.L1305:
	ldr	r1, .L1318+8
	ldr	ip, [r1]
	cmp	ip, #0
	moveq	lr, #1
	beq	.L1306
	mov	lr, lr, asl #4
	mov	r1, r3, asl #4
	mov	r0, r0, asl #4
	strh	lr, [fp, #-44]	@ movhi
	mov	r2, r2, asl #4
	strh	r0, [fp, #-42]	@ movhi
	strh	r2, [fp, #-40]	@ movhi
	mov	r3, #8
	strh	r1, [fp, #-38]	@ movhi
	sub	r2, fp, #44
	mov	r1, #2
	ldr	r0, [r4, #120]
	blx	ip
	mov	lr, #1
.L1306:
	ldrb	r3, [r6, #1171]	@ zero_extendqisi2
	cmp	r3, #1
	ldrne	ip, [r7, #3972]
	subne	ip, ip, #1
	beq	.L1317
.L1309:
	ldr	r3, [r4, #44]
	mov	r0, lr
	cmp	r3, ip
	orrne	lr, lr, #1
	str	lr, [r5]
	str	ip, [r4, #44]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1303:
	movw	r7, #35364
	movt	r7, 168
	add	r7, r4, r7
	b	.L1300
.L1317:
	movw	r1, #39336
	add	r3, r4, #290816
	movt	r1, 168
	add	r3, r3, #808
	add	r1, r4, r1
	mov	ip, #0
.L1308:
	ldr	r2, [r3]
	add	r3, r3, #335872
	add	r3, r3, #308
	cmp	r2, ip
	subhi	ip, r2, #1
	cmp	r3, r1
	bne	.L1308
	add	ip, ip, #1
	mov	ip, ip, asl #1
	cmp	ip, #16
	movcs	ip, #16
	b	.L1309
.L1316:
	movw	r7, #8500
	movt	r7, 5
	mla	r7, r7, r3, r4
	add	r7, r7, #286720
	add	r7, r7, #932
	b	.L1300
.L1319:
	.align	2
.L1318:
	.word	.LC31
	.word	.LC32
	.word	g_event_report
	UNWIND(.fnend)
	.size	MVC_GetReRangeFlag, .-MVC_GetReRangeFlag
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	2
	.global	MVC_DecPOC
	.type	MVC_DecPOC, %function
MVC_DecPOC:
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
	add	r6, r0, #11075584
	ldr	r5, [r0, #236]
	add	r4, r6, #40960
	mov	r1, #1
	ldrb	r2, [r4, #1163]	@ zero_extendqisi2
	ldr	r0, [r5, #2900]
	ldr	r3, [r5, #2896]
	sub	r2, r2, #5
	clz	r2, r2
	cmp	r0, r1
	add	r3, r3, #4
	ldr	ip, [r5, #2904]
	mov	r2, r2, lsr #5
	mov	r3, r1, asl r3
	beq	.L1322
	bcc	.L1323
	cmp	r0, #2
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	cmp	r2, #0
	bne	.L1378
	ldrsb	r1, [r4, #24]
	cmp	r1, #0
	bne	.L1356
	ldr	r2, [r4, #80]
	ldr	r0, [r4, #76]
	ldr	r1, [r4, #88]
	cmp	r2, r0
	addcc	r1, r1, r3
	strcc	r1, [r4, #84]
	bcs	.L1358
.L1359:
	ldrb	r0, [r4, #1168]	@ zero_extendqisi2
	add	r3, r1, r2
	str	r3, [r4, #72]
	cmp	r0, #0
	ldrb	r0, [r4, #1161]	@ zero_extendqisi2
	mov	r3, r3, asl #1
	subeq	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4, #60]
	bne	.L1362
	str	r3, [r4, #56]
	str	r3, [r4, #52]
	str	r3, [r4, #48]
.L1355:
	add	r6, r6, #40960
	str	r2, [r6, #76]
	str	r1, [r6, #88]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1323:
	cmp	r2, #0
	add	ip, ip, #4
	mov	r1, r1, asl ip
	bne	.L1329
	ldrsb	r3, [r4, #24]
	cmp	r3, #0
	bne	.L1327
	ldr	lr, [r4, #36]
	ldr	r0, [r4, #40]
	mov	ip, lr
.L1328:
	ldr	r2, [r4, #28]
	cmp	r2, r0
	bcs	.L1326
	rsb	r3, r2, r0
	cmp	r3, r1, lsr #1
	addcs	ip, ip, r1
	strcs	ip, [r4, #44]
	bcc	.L1326
.L1330:
	ldrb	r3, [r4, #1161]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1332
.L1380:
	ldr	r3, [r4, #32]
	add	r2, ip, r2
	str	r2, [r4, #48]
	add	r3, r2, r3
	str	r3, [r4, #52]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r4, #60]
.L1333:
	ldr	r2, [r4, #80]
	add	r6, r6, #40960
	ldr	r1, [r4, #76]
	str	r3, [r4, #56]
	cmp	r2, r1
	strne	r2, [r4, #76]
	ldrb	r3, [r6, #1168]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r2, [r6, #28]
	ldrne	r3, [r6, #44]
	strne	r2, [r6, #40]
	strne	r3, [r6, #36]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1322:
	cmp	r2, #0
	movne	r3, #0
	strne	r3, [r4, #84]
	bne	.L1337
	ldrsb	r1, [r4, #24]
	cmp	r1, #0
	beq	.L1338
	mov	r3, r2
	str	r2, [r4, #88]
	str	r2, [r4, #76]
.L1339:
	str	r3, [r4, #84]
.L1337:
	ldr	r3, [r5, #2916]
	cmp	r3, #0
	beq	.L1341
	ldrb	r7, [r4, #1168]	@ zero_extendqisi2
	ldr	r3, [r4, #80]
	ldr	r0, [r4, #84]
	cmp	r7, #0
	add	r0, r3, r0
	str	r0, [r4, #72]
	bne	.L1343
	cmp	r0, #0
	beq	.L1344
	sub	r0, r0, #1
	str	r0, [r4, #72]
.L1343:
	mov	r3, #0
	str	r3, [r4, #104]
	ldr	r1, [r5, #2916]
	cmp	r1, r3
	bgt	.L1364
	cmp	r0, #0
	beq	.L1347
.L1381:
	sub	r8, r0, #1
	mov	r0, r8
	bl	__aeabi_uidiv
	mov	r9, r0
	mov	r0, r8
	str	r9, [r4, #96]
	ldr	r1, [r5, #2916]
	bl	__aeabi_uidivmod
	ldr	r0, [r4, #104]
	mul	r0, r0, r9
	str	r0, [r4, #100]
	cmp	r1, #0
	str	r1, [r4, #92]
	blt	.L1348
	add	r2, r5, #2912
	add	r1, r1, #1
	add	r2, r2, #4
	mov	r3, #0
.L1349:
	add	r3, r3, #1
	ldr	ip, [r2, #4]!
	cmp	r3, r1
	add	r0, r0, ip
	str	r0, [r4, #100]
	bne	.L1349
.L1348:
	cmp	r7, #0
	ldreq	r3, [r5, #2908]
	addeq	r0, r0, r3
	ldrb	r3, [r4, #1161]	@ zero_extendqisi2
	streq	r0, [r4, #100]
	cmp	r3, #0
	bne	.L1351
	ldr	r2, [r4, #64]
	ldr	r1, [r4, #68]
	add	r2, r0, r2
	str	r2, [r4, #48]
	ldr	r3, [r5, #2912]
	add	r3, r2, r3
	add	r0, r3, r1
	str	r0, [r4, #52]
	cmp	r0, r2
	movge	r0, r2
	str	r0, [r4, #60]
.L1352:
	add	r6, r6, #40960
	ldr	r2, [r6, #80]
	ldr	r3, [r6, #84]
	str	r0, [r6, #56]
	str	r2, [r6, #76]
	str	r3, [r6, #88]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1327:
	ldrsb	r3, [r4, #25]
	cmp	r3, #0
	beq	.L1379
.L1329:
	ldr	r2, [r4, #28]
	mov	r3, #0
	mov	lr, r3
	mov	ip, r0
	str	r3, [r4, #36]
	str	r3, [r4, #40]
.L1326:
	cmp	r2, r0
	bls	.L1331
	rsb	r3, r0, r2
	cmp	r3, r1, lsr #1
	rsbhi	ip, r1, ip
	strhi	ip, [r4, #44]
	bhi	.L1330
.L1331:
	ldrb	r3, [r4, #1161]	@ zero_extendqisi2
	str	lr, [r4, #44]
	cmp	r3, #0
	beq	.L1380
.L1332:
	ldrb	r3, [r4, #1162]	@ zero_extendqisi2
	cmp	r3, #0
	add	r3, ip, r2
	streq	r3, [r4, #48]
	strne	r3, [r4, #52]
	str	r3, [r4, #60]
	b	.L1333
.L1378:
	mov	r3, #0
	ldr	r2, [r4, #80]
	str	r3, [r4, #84]
	mov	r1, r3
	str	r3, [r4, #52]
	str	r3, [r4, #48]
	str	r3, [r4, #56]
	str	r3, [r4, #60]
	b	.L1355
.L1341:
	ldrb	r7, [r4, #1168]	@ zero_extendqisi2
	str	r3, [r4, #72]
.L1344:
	mov	r0, #0
	str	r0, [r4, #104]
	ldr	r3, [r5, #2916]
	cmp	r3, r0
	ble	.L1347
.L1364:
	add	ip, r5, #2912
	mov	r3, #0
	add	ip, ip, #4
	mov	r2, r3
.L1346:
	ldr	r1, [ip, #4]!
	add	r2, r2, #1
	add	r3, r3, r1
	str	r3, [r4, #104]
	ldr	r1, [r5, #2916]
	cmp	r1, r2
	bgt	.L1346
	cmp	r0, #0
	bne	.L1381
.L1347:
	mov	r0, #0
	str	r0, [r4, #100]
	b	.L1348
.L1351:
	ldrb	r3, [r4, #1162]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r2, [r5, #2912]
	ldreq	r3, [r4, #64]
	ldrne	r3, [r4, #64]
	addne	r0, r0, r2
	addeq	r0, r0, r3
	streq	r0, [r4, #48]
	addne	r0, r0, r3
	strne	r0, [r4, #52]
	str	r0, [r4, #60]
	b	.L1352
.L1338:
	ldr	r1, [r4, #80]
	ldr	r2, [r4, #76]
	cmp	r1, r2
	bcs	.L1340
	ldr	r2, [r4, #88]
	add	r3, r3, r2
	str	r3, [r4, #84]
	b	.L1337
.L1362:
	ldrb	r0, [r4, #1162]	@ zero_extendqisi2
	str	r3, [r4, #56]
	cmp	r0, #0
	streq	r3, [r4, #48]
	strne	r3, [r4, #52]
	b	.L1355
.L1356:
	str	r2, [r4, #76]
	mov	r1, r2
	str	r2, [r4, #88]
	ldr	r2, [r4, #80]
.L1358:
	str	r1, [r4, #84]
	b	.L1359
.L1379:
	ldr	r2, [r4, #48]
	mov	ip, r0
	mov	lr, r3
	str	r3, [r4, #36]
	mov	r0, r2
	str	r2, [r4, #40]
	b	.L1328
.L1340:
	ldr	r3, [r4, #88]
	b	.L1339
	UNWIND(.fnend)
	.size	MVC_DecPOC, .-MVC_DecPOC
	.align	2
	.global	MVC_CalcPicNum
	.type	MVC_CalcPicNum, %function
MVC_CalcPicNum:
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
	add	r5, r0, #11141120
	ldr	r3, [r0, #236]
	add	r5, r5, #16384
	mov	r6, #1
	ldrb	r2, [r5, #443]	@ zero_extendqisi2
	ldr	r3, [r3, #2896]
	cmp	r2, #0
	add	r3, r3, #4
	mov	r6, r6, asl r3
	add	r3, r0, #11075584
	beq	.L1383
	add	r3, r3, #45056
	sub	r7, r2, #1
	sub	r2, r2, #2
	clz	r7, r7
	ldr	r1, [r3, #3024]
	clz	r2, r2
	mov	r7, r7, lsr #5
	cmp	r1, #0
	mov	r2, r2, lsr #5
	movwne	lr, #47940
	movne	r1, #0
	movtne	lr, 169
	addne	lr, r0, lr
	beq	.L1403
.L1402:
	ldr	ip, [lr, #4]!
	ldrb	r4, [ip, #3]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L1397
	ldr	r4, [ip, #20]
	ldr	r8, [r5, #1128]
	cmp	r4, r8
	rsbhi	r4, r6, r4
	str	r4, [ip, #24]
	ldr	ip, [lr]
	ldrb	r4, [ip, #3]	@ zero_extendqisi2
	tst	r4, #1
	beq	.L1400
	ldr	r8, [ip, #772]
	bic	r8, r8, #-16777216
	bic	r8, r8, #255
	cmp	r8, #65536
	ldreq	r4, [ip, #24]
	addeq	r4, r7, r4, lsl #1
	streq	r4, [ip, #784]
	ldreq	ip, [lr]
	ldreqb	r4, [ip, #3]	@ zero_extendqisi2
.L1400:
	tst	r4, #2
	beq	.L1397
	ldr	r4, [ip, #808]
	bic	r4, r4, #-16777216
	bic	r4, r4, #255
	cmp	r4, #65536
	ldreq	r4, [ip, #24]
	addeq	r4, r2, r4, lsl #1
	streq	r4, [ip, #820]
.L1397:
	ldr	ip, [r3, #3024]
	add	r1, r1, #1
	cmp	ip, r1
	bhi	.L1402
.L1403:
	ldr	r1, [r3, #3028]
	cmp	r1, #0
	beq	.L1427
	movw	r4, #48004
	mov	ip, #0
	movt	r4, 169
	add	r4, r0, r4
.L1408:
	ldr	lr, [r4, #4]!
	add	ip, ip, #1
	ldrb	r1, [lr, #3]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1405
	tst	r1, #1
	beq	.L1406
	ldr	r0, [lr, #772]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #256
	ldreq	r1, [lr, #28]
	addeq	r1, r7, r1, lsl #1
	streq	r1, [lr, #780]
	ldreq	lr, [r4]
	ldreqb	r1, [lr, #3]	@ zero_extendqisi2
.L1406:
	tst	r1, #2
	beq	.L1405
	ldr	r1, [lr, #808]
	bic	r1, r1, #-16777216
	bic	r1, r1, #255
	cmp	r1, #256
	ldreq	r1, [lr, #28]
	addeq	r1, r2, r1, lsl #1
	streq	r1, [lr, #816]
.L1405:
	ldr	r1, [r3, #3028]
	cmp	r1, ip
	bhi	.L1408
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1383:
	add	r3, r3, #45056
	ldr	r1, [r3, #3024]
	cmp	r1, #0
	movwne	lr, #47940
	movtne	lr, 169
	addne	lr, r0, lr
	bne	.L1392
.L1393:
	ldr	r2, [r3, #3028]
	cmp	r2, #0
	beq	.L1428
	movw	ip, #48004
	mov	r2, #0
	movt	ip, 169
	add	ip, r0, ip
	b	.L1395
.L1394:
	ldr	r1, [r3, #3028]
	cmp	r1, r2
	bls	.L1429
.L1395:
	ldr	r1, [ip, #4]!
	add	r2, r2, #1
	ldrb	r0, [r1, #3]	@ zero_extendqisi2
	cmp	r0, #3
	bne	.L1394
	ldr	r0, [r1, #736]
	bic	r0, r0, #-16777216
	bic	r0, r0, #255
	cmp	r0, #256
	ldreq	r0, [r1, #28]
	streq	r0, [r1, #744]
	ldr	r1, [r3, #3028]
	cmp	r1, r2
	bhi	.L1395
.L1429:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1430:
	ldr	ip, [r1, #736]
	bic	ip, ip, #-16777216
	bic	ip, ip, #255
	cmp	ip, #65536
	bne	.L1389
	ldr	ip, [r1, #20]
	ldr	r4, [r5, #1128]
	rsb	r7, r6, ip
	cmp	ip, r4
	strhi	r7, [r1, #24]
	strls	ip, [r1, #24]
	ldr	r1, [lr]
	ldr	ip, [r1, #24]
	str	ip, [r1, #748]
.L1389:
	ldr	r1, [r3, #3024]
	add	r2, r2, #1
	cmp	r1, r2
	bls	.L1393
.L1392:
	ldr	r1, [lr, #4]!
	ldrb	ip, [r1, #3]	@ zero_extendqisi2
	cmp	ip, #3
	bne	.L1389
	b	.L1430
.L1428:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1427:
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_CalcPicNum, .-MVC_CalcPicNum
	.align	2
	.global	MVC_IsOutDPB
	.type	MVC_IsOutDPB, %function
MVC_IsOutDPB:
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
	beq	.L1436
	add	r3, r0, #11075584
	add	r3, r3, #45056
	ldr	lr, [r3, #3016]
	cmp	lr, #0
	beq	.L1436
	ldr	r2, [r3, #2824]
	rsb	r3, r2, r1
	cmp	r2, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L1438
	movw	ip, #47880
	movt	ip, 169
	add	ip, r0, ip
	b	.L1433
.L1434:
	ldr	r2, [ip, #4]!
	rsb	r0, r2, r1
	cmp	r2, #0
	clz	r0, r0
	mov	r0, r0, lsr #5
	moveq	r0, #0
	cmp	r0, #0
	bne	.L1438
.L1433:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L1434
.L1436:
	mov	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L1438:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_IsOutDPB, .-MVC_IsOutDPB
	.align	2
	.global	mvc_combine_scalinglist
	.type	mvc_combine_scalinglist, %function
mvc_combine_scalinglist:
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
	cmp	r2, #0
	ldmlefd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	ldr	r6, .L1446
	mov	lr, #0
	mov	r5, #255
	sub	r7, r6, #16
.L1443:
	cmp	r2, #16
	ldreqb	ip, [lr, r7]	@ zero_extendqisi2
	ldrneb	ip, [lr, r6]	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	lr, r2
	and	r3, ip, #3
	mov	r4, ip, lsr #2
	ldrb	r8, [r0, ip, asl #2]	@ zero_extendqisi2
	mov	r3, r3, asl #3
	ldr	ip, [r1, r4, asl #2]
	bic	ip, ip, r5, asl r3
	orr	r3, ip, r8, asl r3
	str	r3, [r1, r4, asl #2]
	bne	.L1443
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1447:
	.align	2
.L1446:
	.word	.LANCHOR0+16
	UNWIND(.fnend)
	.size	mvc_combine_scalinglist, .-mvc_combine_scalinglist
	.align	2
	.global	mvc_assign_quant_params
	.type	mvc_assign_quant_params, %function
mvc_assign_quant_params:
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
	subs	r3, r0, #0
	str	r1, [fp, #-48]
	str	r3, [fp, #-52]
	beq	.L1479
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1480
	ldr	r3, [fp, #-48]
	ldrb	r3, [r3, #18]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1468
	ldr	r3, [fp, #-48]
	mov	r4, #0
	ldr	r1, [fp, #-52]
	add	r2, r3, #2016
	add	r8, r3, #1728
	str	r2, [fp, #-56]
	add	r9, r1, #2384
	mov	r6, r2
	add	r7, r3, #1984
	add	r5, r3, #5
	ldr	r10, .L1485
	b	.L1453
.L1483:
	cmp	r4, #0
	beq	.L1481
	cmp	r4, #3
	beq	.L1482
	ldr	r3, [r10, #52]
	mov	r2, #16
	sub	r1, r6, #16
	mov	r0, r6
	blx	r3
.L1461:
	add	r4, r4, #1
	cmp	r4, #7
	bhi	.L1468
.L1467:
	add	r8, r8, #64
	add	r9, r9, #64
	add	r6, r6, #16
	add	r7, r7, #4
	add	r5, r5, #1
.L1453:
	cmp	r4, #5
	ldrsb	r3, [r5]
	bhi	.L1454
	cmp	r3, #0
	beq	.L1483
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L1461
	ldr	r1, .L1485+4
	cmp	r4, #2
	mov	r2, #16
	ldr	r3, [r10, #52]
	add	r0, r1, r2
	add	r4, r4, #1
	movhi	r1, r0
	mov	r0, r6
	blx	r3
	cmp	r4, #7
	bls	.L1467
.L1468:
	mov	r0, #0
.L1450:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1454:
	cmp	r3, #0
	bne	.L1463
	ldr	r3, [fp, #-52]
	mov	r2, #64
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r10, #52]
	bne	.L1484
.L1478:
	ldr	r1, .L1485+8
	cmp	r4, #6
	add	r0, r1, r2
	movne	r1, r0
	mov	r0, r8
	blx	r3
	b	.L1461
.L1463:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L1461
	ldr	r3, [r10, #52]
	mov	r2, #64
	b	.L1478
.L1484:
	mov	r1, r9
	mov	r0, r8
	blx	r3
	b	.L1461
.L1479:
	movw	r3, #6980
	ldr	r2, .L1485+12
	ldr	r1, .L1485+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1450
.L1480:
	mov	r0, r3
	ldr	r2, .L1485+12
	movw	r3, #6981
	ldr	r1, .L1485+16
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1450
.L1482:
	ldr	r3, [fp, #-52]
	mov	r2, #16
	ldr	r0, [fp, #-48]
	mov	r4, #4
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	add	r0, r0, #2064
	cmp	r3, #0
	ldr	r3, [r10, #52]
	ldrne	r1, [fp, #-52]
	ldreq	r1, .L1485+20
	addne	r1, r1, #2720
	blx	r3
	b	.L1467
.L1481:
	ldr	r3, [fp, #-52]
	mov	r2, #16
	ldr	r0, [fp, #-56]
	mov	r4, #1
	ldrb	r3, [r3, #27]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r10, #52]
	ldrne	r1, [fp, #-52]
	ldreq	r1, .L1485+4
	addne	r1, r1, #2672
	blx	r3
	b	.L1467
.L1486:
	.align	2
.L1485:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR1
	.word	.LANCHOR1+32
	.word	.LC13
	.word	.LC14
	.word	.LANCHOR1+16
	UNWIND(.fnend)
	.size	mvc_assign_quant_params, .-mvc_assign_quant_params
	.align	2
	.global	MVC_WriteCurrPicYUV
	.type	MVC_WriteCurrPicYUV, %function
MVC_WriteCurrPicYUV:
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
	add	r5, r0, #11141120
	add	r3, r5, #16384
	add	r5, r5, #16384
	ldr	r1, .L1490
	mov	r0, #2
	ldrb	r4, [r3, #443]	@ zero_extendqisi2
	ldr	r3, [r3, #1120]
	mov	r2, r4
	ldr	r3, [r3, #252]
	bl	dprint_vfmw
	ldr	ip, [r5, #1180]
	cmp	r4, #3
	cmpne	r4, #0
	ldr	r3, [r5, #1176]
	addne	r2, r4, #1
	ldr	r1, .L1490+4
	moveq	r2, #1
	str	ip, [sp]
	mov	r0, #22
	bl	dprint_vfmw
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1491:
	.align	2
.L1490:
	.word	.LC33
	.word	.LC34
	UNWIND(.fnend)
	.size	MVC_WriteCurrPicYUV, .-MVC_WriteCurrPicYUV
	.align	2
	.global	MVC_WritePicMsg
	.type	MVC_WritePicMsg, %function
MVC_WritePicMsg:
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
	add	r10, r0, #11141120
	add	r4, r10, #16384
	mov	r6, r0
	ldr	r1, .L1528
	mov	r0, #2
	ldr	lr, [r4, #1196]
	mov	r5, #0
	ldr	ip, [r4, #636]
	add	r10, r10, #18944
	ldrb	r3, [r4, #443]	@ zero_extendqisi2
	add	r7, r6, #11075584
	ldr	r2, [r4, #1136]
	add	r8, r7, #32768
	stmia	sp, {ip, lr}
	add	r9, r7, #36864
	bl	dprint_vfmw
	movw	r3, #17488
	movt	r3, 170
	add	r3, r6, r3
	str	r5, [r6, #64]
	add	r1, r7, #40960
	ldrd	r2, [r3, #-8]
	strd	r2, [r10]
	ldr	r10, [r6, #544]
	ldr	lr, [r4, #620]
	ldr	ip, [r4, #624]
	ldr	r0, [r4, #628]
	ldr	r2, [r4, #1136]
	ldrb	r3, [r4, #443]	@ zero_extendqisi2
	str	r10, [r4, #3608]
	str	lr, [r4, #3388]
	str	ip, [r4, #3392]
	str	r0, [r4, #3396]
	str	r2, [r4, #2568]
	strb	r3, [r4, #2552]
	ldr	r3, [r6, #236]
	ldr	ip, [r4, #1180]
	ldr	r0, [r4, #1184]
	ldrb	r2, [r3, #21]	@ zero_extendqisi2
	str	ip, [r4, #2572]
	str	r0, [r4, #2576]
	str	r2, [r4, #2584]
	ldr	r2, [r3, #3948]
	add	r2, r2, #1
	str	r2, [r4, #2580]
	ldrb	r2, [r8, #2004]	@ zero_extendqisi2
	strb	r2, [r4, #2555]
	ldr	r2, [r9, #1940]
	str	r2, [r4, #2588]
	ldrb	r2, [r9, #1880]	@ zero_extendqisi2
	str	r2, [r4, #2592]
	ldr	r3, [r3, #748]
	strb	r3, [r4, #2553]
	ldrb	r3, [r9, #1884]	@ zero_extendqisi2
	str	r3, [r4, #2596]
	ldr	r2, [r1, #60]
	ldr	r3, [r4, #1120]
	str	r2, [r4, #2600]
	ldr	r2, [r1, #48]
	str	r2, [r4, #2604]
	ldr	r2, [r1, #52]
	str	r2, [r4, #2608]
	ldrsb	r1, [r3, #6]
	ldr	r0, [r6, #120]
	bl	FSP_GetLogicFs
	subs	r10, r0, #0
	beq	.L1526
	ldr	r2, [r10, #680]
	ldr	r3, [r10, #684]
	cmp	r2, #0
	beq	.L1496
	cmp	r3, #0
	beq	.L1496
	movw	r3, #19372
	movw	r2, #19244
	movw	r1, #19632
	ldr	r0, [r6, #120]
	movt	r3, 170
	movt	r2, 170
	add	r3, r6, r3
	add	r2, r6, r2
	movt	r1, 170
	add	r1, r6, r1
	bl	FSP_GetDecFsAddrTab
	ldr	r3, [r10, #680]
	movw	r2, #19636
	movw	r1, #19764
	movt	r2, 170
	movt	r1, 170
	ldr	r3, [r3, #8]
	add	r2, r6, r2
	add	r1, r6, r1
	add	r7, r7, #45056
	str	r3, [r4, #2844]
	ldr	r0, [r6, #120]
	bl	FSP_GetPmvAddrTab
	ldr	r3, [r4, #1196]
	str	r3, [r4, #2852]
	ldr	r3, [r10, #696]
	str	r3, [r4, #3384]
	ldr	r3, [r10, #684]
	ldr	r3, [r3, #16]
	str	r3, [r4, #2848]
	ldr	r3, [r10, #684]
	ldr	r3, [r3, #76]
	str	r3, [r4, #2856]
	ldr	r3, [r7, #3244]
	cmp	r3, #0
	str	r3, [fp, #-48]
	str	r3, [r4, #3600]
	beq	.L1502
	movw	r4, #48104
	movw	lr, #19788
	movw	ip, #48168
	movw	r0, #19852
	movw	r1, #48232
	movw	r2, #19916
	ldr	r10, [fp, #-48]
	movt	r4, 169
	movt	lr, 170
	movt	ip, 169
	movt	r0, 170
	movt	r1, 169
	movt	r2, 170
	add	r4, r6, r4
	add	lr, r6, lr
	add	ip, r6, ip
	add	r0, r6, r0
	add	r1, r6, r1
	add	r2, r6, r2
	mov	r3, r5
.L1501:
	ldr	r5, [r4, #4]!
	add	r3, r3, #1
	cmp	r3, r10
	str	r5, [lr, #4]!
	ldr	r5, [ip, #4]!
	str	r5, [r0, #4]!
	ldr	r5, [r1, #4]!
	str	r5, [r2, #4]!
	bne	.L1501
.L1502:
	ldrb	r3, [r8, #2011]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1527
	ldrb	ip, [r9, #1898]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L1503
	movw	lr, #18992
	ldr	r0, .L1528+4
	movt	lr, 170
	add	lr, r6, lr
.L1504:
	and	r3, ip, #3
	add	ip, ip, #1
	cmp	ip, #24
	add	r3, r0, r3, lsl #2
	ldr	r3, [r3, #352]
	bic	r2, r3, #16711680
	ubfx	r1, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r1, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [lr, #4]!
	bne	.L1504
	movw	r8, #19092
	mov	r5, #0
	movt	r8, 170
	add	r8, r6, r8
.L1505:
	add	r3, r5, #1
	and	r2, r5, #14
	and	r3, r3, #15
	add	r5, r5, #2
	add	r2, r0, r2, lsl #2
	cmp	r5, #32
	add	r3, r0, r3, lsl #2
	ldr	r1, [r2, #368]
	ldr	ip, [r3, #368]
	ubfx	r3, r1, #8, #8
	mov	r2, r1, lsr #24
	uxtb	r9, r1
	uxtb	r4, ip
	mov	lr, ip, lsr #16
	orr	r3, r3, r2, asl #8
	mov	r1, r1, lsr #8
	mov	r4, r4, asl #16
	and	r2, ip, #-16777216
	orr	lr, r4, lr, asl #24
	ubfx	ip, ip, #8, #8
	orr	r3, r3, r2
	orr	lr, lr, r9
	and	r1, r1, #65280
	orr	r3, r3, ip, asl #16
	orr	r2, lr, r1
	stmia	r8, {r2, r3}
	add	r8, r8, #8
	bne	.L1505
.L1510:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L1507
	movw	r4, #48108
	movw	r9, #20120
	movw	r8, #20184
	movt	r4, 169
	movt	r9, 170
	movt	r8, 170
	add	r4, r6, r4
	add	r9, r6, r9
	add	r8, r6, r8
	mov	r5, #0
.L1513:
	ldr	r2, [r4]
	mov	r1, #0
	ldr	r0, [r6, #120]
	add	r5, r5, #1
	bl	FSP_GetStoreType
	adds	r0, r0, #0
	movne	r0, #1
	str	r0, [r9, #4]!
	ldr	r3, [r4], #4
	str	r3, [r8, #4]!
	ldr	r3, [r7, #3244]
	cmp	r3, r5
	bhi	.L1513
.L1507:
	mov	r0, #0
.L1523:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1527:
	ldrb	ip, [r9, #1898]	@ zero_extendqisi2
.L1503:
	cmp	ip, #1
	movw	ip, #18992
	movt	ip, 170
	mov	r0, #0
	add	ip, r6, ip
	beq	.L1508
.L1511:
	movw	r3, #25740
	movt	r3, 42
	add	r3, r0, r3
	add	r0, r0, #1
	ldr	r3, [r6, r3, asl #2]
	cmp	r0, #24
	bic	r2, r3, #16711680
	ubfx	r1, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r1, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1511
	movw	r9, #19092
	mov	r10, #1
	movt	r9, 170
	add	r9, r6, r9
	mov	r8, #0
.L1512:
	mov	r2, r8, lsr #3
	mov	r3, r8, asl #1
	and	r1, r3, #14
	and	r0, r10, #15
	mov	r3, r2, asl #4
	movw	r2, #25764
	add	r0, r3, r0
	add	r3, r3, r1
	mov	r1, r2
	movt	r2, 42
	movt	r1, 42
	add	r2, r0, r2
	add	r1, r3, r1
	add	r8, r8, #1
	ldr	r2, [r6, r2, asl #2]
	cmp	r8, #16
	ldr	r3, [r6, r1, asl #2]
	add	r10, r10, #2
	ubfx	r5, r2, #8, #8
	and	lr, r2, #-16777216
	mov	r0, r2, lsr #16
	uxtb	r1, r2
	mov	ip, r3, lsr #24
	uxtb	r4, r3
	mov	r2, r0, asl #24
	mov	r0, r3, lsr #8
	mov	ip, ip, asl #8
	orr	r2, r2, r1, asl #16
	orr	ip, ip, r5, asl #16
	orr	r1, r2, r4
	ubfx	r3, r3, #8, #8
	and	r2, r0, #65280
	orr	ip, ip, lr
	orr	r2, r1, r2
	orr	r3, ip, r3
	stmia	r9, {r2, r3}
	add	r9, r9, #8
	bne	.L1512
	b	.L1510
.L1508:
	movw	r3, #26574
	movt	r3, 42
	add	r3, r0, r3
	add	r0, r0, #1
	ldr	r3, [r6, r3, asl #2]
	cmp	r0, #24
	bic	r2, r3, #16711680
	ubfx	r1, r3, #8, #8
	bic	r2, r2, #65280
	mov	r3, r3, lsr #8
	orr	r2, r2, r1, asl #16
	and	r3, r3, #65280
	orr	r3, r2, r3
	str	r3, [ip, #4]!
	bne	.L1508
	movw	r9, #19092
	mov	r10, #1
	movt	r9, 170
	add	r9, r6, r9
	mov	r8, #0
.L1509:
	mov	r2, r8, lsr #3
	mov	r3, r8, asl #1
	and	r1, r3, #14
	and	r0, r10, #15
	mov	r3, r2, asl #4
	movw	r2, #26598
	add	r0, r3, r0
	add	r3, r3, r1
	mov	r1, r2
	movt	r2, 42
	movt	r1, 42
	add	r2, r0, r2
	add	r1, r3, r1
	add	r8, r8, #1
	ldr	r2, [r6, r2, asl #2]
	cmp	r8, #16
	ldr	r3, [r6, r1, asl #2]
	add	r10, r10, #2
	ubfx	r5, r2, #8, #8
	and	lr, r2, #-16777216
	mov	r0, r2, lsr #16
	uxtb	r1, r2
	mov	ip, r3, lsr #24
	uxtb	r4, r3
	mov	r2, r0, asl #24
	mov	r0, r3, lsr #8
	mov	ip, ip, asl #8
	orr	r2, r2, r1, asl #16
	orr	ip, ip, r5, asl #16
	orr	r1, r2, r4
	ubfx	r3, r3, #8, #8
	and	r2, r0, #65280
	orr	ip, ip, lr
	orr	r2, r1, r2
	orr	r3, ip, r3
	stmia	r9, {r2, r3}
	add	r9, r9, #8
	bne	.L1509
	b	.L1510
.L1496:
	ldr	r1, .L1528+8
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1523
.L1526:
	ldr	r3, [r4, #1120]
	ldr	r1, .L1528+12
	ldrsb	r2, [r3, #6]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1523
.L1529:
	.align	2
.L1528:
	.word	.LC35
	.word	.LANCHOR1
	.word	.LC37
	.word	.LC36
	UNWIND(.fnend)
	.size	MVC_WritePicMsg, .-MVC_WritePicMsg
	.align	2
	.global	MVC_UpdatePicQpInf
	.type	MVC_UpdatePicQpInf, %function
MVC_UpdatePicQpInf:
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
	ldr	r2, [r1, #28]
	ldr	r3, [r1, #32]
	cmp	r2, r0
	movlt	r2, r0
	cmp	r3, r0
	str	r2, [r1, #28]
	movge	r3, r0
	str	r3, [r1, #32]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_UpdatePicQpInf, .-MVC_UpdatePicQpInf
	.align	2
	.global	MVC_WriteSliceMsg
	.type	MVC_WriteSliceMsg, %function
MVC_WriteSliceMsg:
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
	ldr	r3, [r0, #64]
	movw	r1, #4060
	mov	r4, r0
	mov	ip, r3
	str	r3, [fp, #-48]
	mul	r1, r1, ip
	ldr	r3, [r0, #32]
	ldr	r0, [r0, #544]
	add	r2, ip, #1
	sub	r3, r3, #1
	str	r2, [r4, #64]
	cmp	ip, r3
	add	r6, r0, r1
	addcc	r3, r1, #4048
	addcc	r3, r3, #12
	movcs	r3, #0
	addcc	r3, r0, r3
	str	r3, [r6, #4056]
	ldr	r2, [r4, #232]
	ldrb	ip, [r2]	@ zero_extendqisi2
	ldr	r3, [r2, #68]
	cmp	ip, #1
	cmpls	ip, r3
	bcs	.L1534
	add	lr, ip, #3
	add	lr, r6, lr, lsl #2
.L1535:
	mov	r3, ip, asl #5
	sub	r3, r3, ip, asl #2
	add	ip, ip, #1
	add	r2, r2, r3
	ldr	r2, [r2, #24]
	str	r2, [lr, #4]!
	ldr	r2, [r4, #232]
	add	r2, r2, r3
	ldr	r2, [r2, #20]
	str	r2, [lr, #-8]
	ldr	r2, [r4, #232]
	add	r3, r2, r3
	ldr	r3, [r3, #28]
	str	r3, [lr, #8]
	ldr	r2, [r4, #232]
	ldr	r3, [r2, #68]
	cmp	r3, ip
	movhi	r5, #1
	movls	r5, #0
	cmp	ip, #1
	movhi	r5, #0
	cmp	r5, #0
	bne	.L1535
.L1534:
	cmp	r3, #1
	bhi	.L1540
	add	r3, r3, #3
	add	ip, r6, #20
	mov	r2, #0
	add	r3, r6, r3, lsl #2
.L1539:
	str	r2, [r3, #4]!
	cmp	r3, ip
	str	r2, [r3, #-8]
	str	r2, [r3, #8]
	bne	.L1539
.L1540:
	add	r8, r4, #11141120
	ldr	r3, [fp, #-48]
	add	r8, r8, #16384
	add	r5, r4, #11075584
	cmp	r3, #0
	add	r9, r5, #36864
	ldrb	r3, [r8, #449]	@ zero_extendqisi2
	add	r5, r5, #40960
	strb	r3, [r6, #1]
	ldr	r3, [r9, #1928]
	ldr	r2, [r5, #2776]
	add	r3, r3, #26
	add	r3, r3, r2
	str	r3, [r6, #32]
	bne	.L1636
	ldr	r2, [r8, #1120]
	str	r3, [r2, #764]
	ldr	r3, [r8, #1120]
	ldr	r2, [r6, #32]
	str	r2, [r3, #768]
.L1541:
	ldr	r3, [r5, #2772]
	str	r3, [r6, #36]
	ldr	r3, [r5, #1224]
	str	r3, [r6, #40]
	ldr	r3, [r5, #1220]
	str	r3, [r6, #44]
	ldrb	r3, [r5, #1160]	@ zero_extendqisi2
	strb	r3, [r0, r1]
	ldr	r3, [r5, #1216]
	str	r3, [r6, #48]
	ldrb	r3, [r5, #1166]	@ zero_extendqisi2
	strb	r3, [r6, #2]
	ldr	r3, [r4, #236]
	ldrb	r3, [r3, #22]	@ zero_extendqisi2
	strb	r3, [r6, #3]
	ldr	r3, [r5, #1208]
	str	r3, [r6, #52]
	ldr	r3, [r5, #1212]
	str	r3, [r6, #56]
	ldrb	r3, [r5, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r9, #1924]
	streqb	r3, [r6, #4]
	beq	.L1543
	cmp	r3, #0
	ldreqb	r3, [r9, #1882]	@ zero_extendqisi2
	movne	r3, #0
	strb	r3, [r6, #4]
.L1543:
	ldr	r3, [r9, #1932]
	str	r3, [r6, #60]
	ldr	r3, [r9, #1936]
	str	r3, [r6, #64]
	ldr	r3, [r5, #2784]
	str	r3, [r6, #68]
	ldr	r3, [r5, #2788]
	str	r3, [r6, #72]
	ldr	r3, [r5, #2780]
	str	r3, [r6, #76]
	ldrb	r3, [r5, #1160]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1582
	ldr	r7, [r5, #1208]
	cmp	r7, #0
	beq	.L1585
	ldr	r3, [r4, #256]
	ldr	r2, [r3, #4]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r1, r4, #256
	movne	r3, #0
	bne	.L1550
	b	.L1548
.L1552:
	ldr	r2, [r1, #4]!
	ldr	r2, [r2, #4]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1548
.L1550:
	add	r3, r3, #1
	cmp	r3, r7
	bne	.L1552
	mov	r3, #0
	str	r3, [fp, #-52]
.L1547:
	ldr	ip, [r5, #1212]
	cmp	ip, #0
	beq	.L1586
	ldr	r3, [r4, #388]
	ldr	r2, [r3, #4]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r1, r4, #388
	movne	r3, #0
	bne	.L1556
	b	.L1554
.L1558:
	ldr	r2, [r1, #4]!
	ldr	r2, [r2, #4]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1554
.L1556:
	add	r3, r3, #1
	cmp	r3, ip
	bne	.L1558
	mov	r3, #0
	str	r3, [fp, #-56]
.L1553:
	ldrb	ip, [r8, #443]	@ zero_extendqisi2
	ldr	r3, [r5, #1208]
	cmp	ip, #0
	beq	.L1559
	cmp	r3, #0
	beq	.L1574
	mov	r3, r6
	mov	r7, #0
	str	r6, [fp, #-60]
	add	r10, r4, #256
	mov	r6, r7
	str	r8, [fp, #-64]
	mov	r7, r3
	mov	r8, r5
	ldr	r5, [fp, #-52]
	b	.L1573
.L1571:
	strb	r1, [r7, #1630]
	ldr	r1, [r10]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r7, #1631]
	ldr	r1, [r10]
	ldr	r1, [r1, #16]
	str	r1, [r7, #1656]
.L1572:
	ldr	r1, [r8, #1208]
	add	r6, r6, #1
	add	r10, r10, #4
	add	r7, r7, #36
	cmp	r1, r6
	bls	.L1637
.L1573:
	ldr	r1, [r10]
	ldr	r0, [r4, #120]
	ldr	r1, [r1, #4]
	ldrsb	r1, [r1, #6]
	bl	FSP_GetLogicFs
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #48]
	str	r1, [r7, #1636]
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldrb	r1, [r1, #2]	@ zero_extendqisi2
	strb	r1, [r7, #1625]
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r5
	beq	.L1570
	cmp	r0, #0
	ldrne	r1, [r0, #680]
	ldrne	r0, [r1, #8]
.L1570:
	str	r0, [r7, #1640]
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #52]
	str	r1, [r7, #1644]
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #32]
	str	r1, [r7, #1632]
	ldr	r1, [r10]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r7, #1624]
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldrb	r1, [r1, #736]	@ zero_extendqisi2
	strb	r1, [r7, #1626]
	ldr	r1, [r10]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L1571
	strb	r1, [r7, #1628]
	ldr	r1, [r10]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r7, #1629]
	ldr	r1, [r10]
	ldr	r1, [r1, #16]
	str	r1, [r7, #1652]
	b	.L1572
.L1637:
	mov	r5, r8
	ldr	r6, [fp, #-60]
	ldr	r8, [fp, #-64]
.L1574:
	ldrb	r3, [r5, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1638
.L1562:
	movw	r2, #48304
	add	r3, r6, #3920
	add	r0, r6, #4048
	movt	r2, 169
	add	r3, r3, #4
	add	r2, r4, r2
	add	r0, r0, #4
.L1579:
	ldr	r1, [r2, #4]!
	str	r1, [r3, #4]!
	cmp	r3, r0
	bne	.L1579
	ldrb	r3, [r9, #1882]	@ zero_extendqisi2
	cmp	r3, #0
	str	r3, [r8, #2836]
	ldr	r3, [r9, #1924]
	str	r3, [r8, #2840]
	beq	.L1580
	ldrb	r2, [r5, #1160]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1581
.L1580:
	cmp	r3, #1
	beq	.L1639
.L1582:
	ldr	r2, [fp, #-48]
	movw	r3, #37364
	movt	r3, 42
	ldr	r1, [r4, #232]
	add	r3, r2, r3
	mov	r2, #0
	add	r3, r4, r3, lsl #2
	str	r1, [r3, #4]
	str	r2, [r4, #232]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1636:
	ldr	r2, [r8, #1120]
	ldr	lr, [r2, #764]
	ldr	ip, [r2, #768]
	cmp	lr, r3
	movlt	lr, r3
	cmp	ip, r3
	str	lr, [r2, #764]
	movge	ip, r3
	str	ip, [r2, #768]
	b	.L1541
.L1548:
	ldrsb	r1, [r2, #6]
	ldr	r0, [r4, #120]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	movweq	r3, #8038
	beq	.L1632
	ldr	r3, [r3, #680]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-52]
	b	.L1547
.L1639:
	ldrb	r3, [r5, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1582
.L1581:
	ldr	r3, [r5, #1228]
	movw	r8, #42192
	movw	r7, #42320
	movw	lr, #42448
	movw	ip, #42960
	movw	r0, #43088
	str	r3, [r6, #80]
	movw	r1, #43216
	ldr	r10, [r5, #1232]
	movt	r8, 169
	movt	r7, 169
	movt	lr, 169
	movt	ip, 169
	movt	r0, 169
	movt	r1, 169
	add	r8, r4, r8
	add	r7, r4, r7
	add	lr, r4, lr
	add	ip, r4, ip
	add	r0, r4, r0
	add	r1, r4, r1
	mov	r9, r6
	mov	r3, r6
	mov	r2, #0
	str	r6, [fp, #-52]
	str	r10, [r9, #84]!
.L1583:
	ldr	r10, [r8, #4]!
	add	r2, r2, #1
	add	r3, r3, #4
	str	r10, [r9, #4]!
	ldr	r10, [r7, #4]!
	str	r10, [r3, #212]
	ldr	r10, [lr, #4]!
	str	r10, [r3, #340]
	ldr	r10, [ip, #4]!
	str	r10, [r3, #852]
	ldr	r10, [r0, #4]!
	str	r10, [r3, #980]
	ldr	r10, [r1, #4]!
	str	r10, [r3, #1108]
	ldr	r10, [r5, #1220]
	cmp	r10, r2
	bcs	.L1583
	ldrb	r3, [r5, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1582
	movw	r7, #42576
	movw	lr, #42704
	movw	ip, #42832
	movw	r0, #43344
	movw	r1, #43472
	movw	r2, #43600
	ldr	r8, [fp, #-52]
	movt	r7, 169
	movt	lr, 169
	movt	ip, 169
	movt	r0, 169
	movt	r1, 169
	movt	r2, 169
	add	r6, r6, #468
	add	r7, r4, r7
	add	lr, r4, lr
	add	ip, r4, ip
	add	r0, r4, r0
	add	r1, r4, r1
	add	r2, r4, r2
	mov	r3, #0
.L1584:
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
	ldr	r9, [r5, #1224]
	cmp	r9, r3
	bcs	.L1584
	b	.L1582
.L1559:
	cmp	r3, #0
	beq	.L1567
	add	r2, r4, #256
	str	r8, [fp, #-64]
	mov	r8, r5
	ldr	r5, [fp, #-52]
	mov	r7, r6
	str	r6, [fp, #-60]
	mov	r10, r2
	mov	r6, ip
.L1566:
	ldr	r1, [r10]
	ldr	r0, [r4, #120]
	ldr	r1, [r1, #4]
	ldrsb	r1, [r1, #6]
	bl	FSP_GetLogicFs
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #48]
	str	r1, [r7, #1636]
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldrb	r1, [r1, #2]	@ zero_extendqisi2
	strb	r1, [r7, #1625]
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r5
	beq	.L1565
	cmp	r0, #0
	ldrne	r1, [r0, #680]
	ldrne	r0, [r1, #8]
.L1565:
	str	r0, [r7, #1640]
	mov	r3, #0
	ldr	r1, [r10]
	add	r6, r6, #1
	add	r7, r7, #36
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #52]
	str	r1, [r7, #1608]
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #32]
	str	r1, [r7, #1596]
	ldr	r1, [r10]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r7, #1591]
	ldr	r1, [r10]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r7, #1590]
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #752]
	str	r1, [r7, #1612]
	ldr	r1, [r10]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #788]
	str	r1, [r7, #1616]
	ldr	r1, [r10], #4
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #824]
	strb	r3, [r7, #1588]
	str	r1, [r7, #1620]
	ldr	r1, [r8, #1208]
	cmp	r1, r6
	bhi	.L1566
	mov	r5, r8
	ldr	r6, [fp, #-60]
	ldr	r8, [fp, #-64]
.L1567:
	ldrb	r3, [r5, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1562
	ldr	r3, [r5, #1212]
	cmp	r3, #0
	beq	.L1562
	add	r3, r4, #388
	str	r8, [fp, #-60]
	mov	r8, r5
	ldr	r5, [fp, #-56]
	mov	r7, #0
	mov	r10, r6
	str	r6, [fp, #-52]
	mov	r6, r7
	mov	r7, r3
.L1569:
	ldr	r1, [r7]
	ldr	r0, [r4, #120]
	ldr	r1, [r1, #4]
	ldrsb	r1, [r1, #6]
	bl	FSP_GetLogicFs
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #48]
	str	r1, [r10, #2788]
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldrb	r1, [r1, #2]	@ zero_extendqisi2
	strb	r1, [r10, #2777]
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r5
	beq	.L1568
	cmp	r0, #0
	ldrne	r1, [r0, #680]
	ldrne	r0, [r1, #8]
.L1568:
	str	r0, [r10, #1640]
	mov	r3, #0
	ldr	r1, [r7]
	add	r6, r6, #1
	add	r10, r10, #36
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #52]
	str	r1, [r10, #2760]
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #32]
	str	r1, [r10, #2748]
	ldr	r1, [r7]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2743]
	ldr	r1, [r7]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r10, #2742]
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #752]
	str	r1, [r10, #2764]
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #788]
	str	r1, [r10, #2768]
	ldr	r1, [r7], #4
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #824]
	strb	r3, [r10, #2740]
	str	r1, [r10, #2772]
	ldr	r1, [r8, #1212]
	cmp	r1, r6
	bhi	.L1569
.L1631:
	mov	r5, r8
	ldr	r6, [fp, #-52]
	ldr	r8, [fp, #-60]
	b	.L1562
.L1554:
	ldrsb	r1, [r2, #6]
	ldr	r0, [r4, #120]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	beq	.L1640
	ldr	r3, [r3, #680]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-56]
	b	.L1553
.L1638:
	ldr	r3, [r5, #1212]
	cmp	r3, #0
	beq	.L1562
	mov	r3, #0
	mov	r10, r6
	str	r6, [fp, #-52]
	add	r7, r4, #388
	str	r8, [fp, #-60]
	mov	r6, r3
	mov	r8, r5
	ldr	r5, [fp, #-56]
	b	.L1578
.L1576:
	strb	r1, [r10, #2782]
	ldr	r1, [r7]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2783]
	ldr	r1, [r7]
	ldr	r1, [r1, #16]
	str	r1, [r10, #2808]
.L1577:
	ldr	r1, [r8, #1212]
	add	r6, r6, #1
	add	r7, r7, #4
	add	r10, r10, #36
	cmp	r1, r6
	bls	.L1631
.L1578:
	ldr	r1, [r7]
	ldr	r0, [r4, #120]
	ldr	r1, [r1, #4]
	ldrsb	r1, [r1, #6]
	bl	FSP_GetLogicFs
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #48]
	str	r1, [r10, #2788]
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldrb	r1, [r1, #2]	@ zero_extendqisi2
	strb	r1, [r10, #2777]
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	cmp	r1, #1
	moveq	r0, r5
	beq	.L1575
	cmp	r0, #0
	ldrne	r1, [r0, #680]
	ldrne	r0, [r1, #8]
.L1575:
	str	r0, [r10, #2792]
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #52]
	str	r1, [r10, #2796]
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #32]
	str	r1, [r10, #2784]
	ldr	r1, [r7]
	ldrb	r1, [r1]	@ zero_extendqisi2
	strb	r1, [r10, #2776]
	ldr	r1, [r7]
	ldr	r1, [r1, #4]
	ldrb	r1, [r1, #736]	@ zero_extendqisi2
	strb	r1, [r10, #2778]
	ldr	r1, [r7]
	ldrb	r1, [r1]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L1576
	strb	r1, [r10, #2780]
	ldr	r1, [r7]
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	strb	r1, [r10, #2781]
	ldr	r1, [r7]
	ldr	r1, [r1, #16]
	str	r1, [r10, #2804]
	b	.L1577
.L1640:
	movw	r3, #8059
.L1632:
	ldr	r2, .L1641
	ldr	r1, .L1641+4
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, lr}
	b	dprint_vfmw
.L1585:
	str	r7, [fp, #-52]
	b	.L1547
.L1586:
	str	ip, [fp, #-56]
	b	.L1553
.L1642:
	.align	2
.L1641:
	.word	.LANCHOR0+80
	.word	.LC38
	UNWIND(.fnend)
	.size	MVC_WriteSliceMsg, .-MVC_WriteSliceMsg
	.align	2
	.global	MVC_StopPicNum
	.type	MVC_StopPicNum, %function
MVC_StopPicNum:
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
	.size	MVC_StopPicNum, .-MVC_StopPicNum
	.align	2
	.global	MVC_GetPicStreamSize
	.type	MVC_GetPicStreamSize, %function
MVC_GetPicStreamSize:
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
	add	r0, r0, #11141120
	add	r0, r0, #16384
	ldr	r2, [r0, #3608]
	cmp	r2, #0
	beq	.L1647
	mov	r0, #0
.L1646:
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r1
	add	r3, r3, #7
	cmp	r2, #0
	add	r0, r0, r3, lsr #3
	bne	.L1646
	ldmfd	sp, {fp, sp, pc}
.L1647:
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetPicStreamSize, .-MVC_GetPicStreamSize
	.align	2
	.global	MVC_SliceCheck
	.type	MVC_SliceCheck, %function
MVC_SliceCheck:
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
	ldr	r1, .L1660
	mov	r4, r0
	add	r5, r0, #11075584
	bl	mvc_ue_v
	add	r5, r5, #40960
	str	r0, [r5, #1216]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1658
	cmp	r0, #262144
	bcs	.L1659
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #16]
	mul	r3, r3, r2
	sub	r3, r3, #1
	cmp	r0, r3
	bhi	.L1658
	ldr	r1, .L1660+4
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L1660+8
	mov	r2, r0
	mov	r6, r0
	mov	r0, #19
	bl	dprint_vfmw
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1658
	cmp	r6, #9
	bhi	.L1654
	mov	r1, #1
	movw	r0, #297
	mov	r2, r1, asl r6
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L1655
	ands	r3, r2, #660
	bne	.L1656
	tst	r2, #66
	beq	.L1654
	strb	r1, [r5, #1160]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1655:
	strb	r3, [r5, #1160]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1654:
	mov	r2, r6
	ldr	r1, .L1660+12
	mov	r0, #1
	bl	dprint_vfmw
.L1658:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1656:
	mov	r3, #2
	strb	r3, [r5, #1160]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1659:
	ldr	r1, .L1660+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1661:
	.align	2
.L1660:
	.word	.LC39
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC40
	UNWIND(.fnend)
	.size	MVC_SliceCheck, .-MVC_SliceCheck
	.align	2
	.global	MVC_PPSSPSCheck
	.type	MVC_PPSSPSCheck, %function
MVC_PPSSPSCheck:
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
	add	r5, r0, #11075584
	mov	r4, r0
	add	r5, r5, #40960
	ldr	r1, .L1674
	mov	r0, #19
	ldr	r2, [r5, #1176]
	bl	dprint_vfmw
	ldr	r3, [r4, #252]
	ldr	r2, [r5, #1176]
	mov	r1, #2240
	mla	r1, r1, r2, r3
	ldrb	r3, [r1, #19]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1672
	ldrb	r3, [r5, #1172]	@ zero_extendqisi2
	sxtb	r5, r3
	cmn	r5, #1
	beq	.L1673
	cmp	r3, #0
	bne	.L1667
	ldr	r2, [r1, #28]
	movw	r3, #8500
	movt	r3, 5
	mul	r3, r3, r2
	add	r0, r4, r3
	add	ip, r0, #12992
	add	r3, r0, #286720
	add	ip, ip, #8
	add	r3, r3, #932
	ldrb	ip, [ip, #4]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1668
	add	r0, r0, #286720
	ldrb	r0, [r0, #957]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1668
.L1666:
	mov	r0, #0
	str	r1, [r4, #244]
	str	r3, [r4, #240]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1673:
	ldr	r0, [r4, #248]
	movw	r3, #3992
	ldr	r2, [r1, #28]
	mla	r3, r3, r2, r0
	ldrb	r0, [r3, #25]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L1666
	ldr	r1, .L1674+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1668:
	ldr	r1, .L1674+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1672:
	ldr	r1, .L1674+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1667:
	mov	r2, r5
	ldr	r1, .L1674+16
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1675:
	.align	2
.L1674:
	.word	.LC44
	.word	.LC46
	.word	.LC47
	.word	.LC45
	.word	.LC32
	UNWIND(.fnend)
	.size	MVC_PPSSPSCheck, .-MVC_PPSSPSCheck
	.align	2
	.global	MVC_PPSSPSCheckTmpId
	.type	MVC_PPSSPSCheckTmpId, %function
MVC_PPSSPSCheckTmpId:
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
	ldr	r1, .L1685
	mov	r0, #19
	bl	dprint_vfmw
	ldr	r2, [r4, #252]
	mov	r3, #2240
	mla	r3, r3, r5, r2
	ldrb	r2, [r3, #19]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1682
	ldr	r1, [r4, #36]
	ldr	r2, [r3, #28]
	sub	r3, r1, #1
	cmp	r2, r3
	bhi	.L1683
	add	r3, r4, #11075584
	movw	r1, #1172
	add	r3, r3, #40960
	ldrsb	r5, [r3, r1]
	cmn	r5, #1
	beq	.L1684
.L1681:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1684:
	ldr	r1, [r4, #248]
	movw	r3, #3992
	mla	r3, r3, r2, r1
	ldrb	r3, [r3, #25]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1681
	ldr	r1, .L1685+4
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1682:
	mov	r2, r5
	ldr	r1, .L1685+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1683:
	ldr	r1, .L1685+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L1686:
	.align	2
.L1685:
	.word	.LC48
	.word	.LC51
	.word	.LC49
	.word	.LC50
	UNWIND(.fnend)
	.size	MVC_PPSSPSCheckTmpId, .-MVC_PPSSPSCheckTmpId
	.align	2
	.global	MVC_IsNewPic
	.type	MVC_IsNewPic, %function
MVC_IsNewPic:
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
	add	ip, r0, #11075584
	ldr	lr, [r0, #236]
	add	r3, ip, #40960
	ldr	r1, [lr, #744]
	ldr	r0, [r3, #2824]
	ldr	r2, [r3, #2828]
	ldr	r4, [r3, #1176]
	ldr	r6, [r3, #2832]
	cmp	r2, r4
	cmpeq	r0, r1
	ldr	r5, [r3, #1188]
	ldrb	r4, [r3, #2816]	@ zero_extendqisi2
	ldrb	r0, [r3, #1161]	@ zero_extendqisi2
	movne	r1, #1
	moveq	r1, #0
	cmp	r6, r5
	moveq	r2, r1
	orrne	r2, r1, #1
	cmp	r4, r0
	orrne	r2, r2, #1
	cmp	r4, #0
	cmpne	r0, #0
	beq	.L1689
	ldrb	r0, [r3, #2817]	@ zero_extendqisi2
	ldrb	r1, [r3, #1162]	@ zero_extendqisi2
	cmp	r0, r1
	orrne	r2, r2, #1
.L1689:
	ldrb	r1, [r3, #2819]	@ zero_extendqisi2
	ldrb	r0, [r3, #1168]	@ zero_extendqisi2
	cmp	r1, r0
	moveq	r1, #0
	beq	.L1690
	cmp	r0, #0
	cmpne	r1, #0
	moveq	r1, #1
	movne	r1, #0
.L1690:
	ldrb	r0, [r3, #2818]	@ zero_extendqisi2
	ldrb	r4, [r3, #1163]	@ zero_extendqisi2
	cmp	r0, r4
	orrne	r2, r2, #1
	cmp	r4, #5
	cmpeq	r0, #5
	orr	r2, r2, r1
	beq	.L1702
.L1691:
	ldr	r1, [lr, #2900]
	cmp	r1, #0
	bne	.L1692
	ldr	r1, [r3, #2840]
	ldr	r0, [r3, #2844]
	ldr	r4, [r3, #32]
	ldr	lr, [r3, #28]
	cmp	r1, lr
	cmpeq	r0, r4
	movne	r1, #1
	moveq	r1, #0
	orr	r2, r2, r1
.L1693:
	ldrb	r1, [r3, #1171]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1694
	ldr	r1, [r3, #2860]
	ldrb	r0, [r3, #2820]	@ zero_extendqisi2
	ldrb	r6, [r3, #1169]	@ zero_extendqisi2
	ldr	r5, [r3, #2800]
	ldrb	r4, [r3, #2821]	@ zero_extendqisi2
	cmp	r1, r5
	cmpeq	r0, r6
	ldrb	lr, [r3, #1170]	@ zero_extendqisi2
	movne	r1, #1
	moveq	r1, #0
	cmp	r4, lr
	moveq	r3, r1
	orrne	r3, r1, #1
	orr	r2, r2, r3
.L1694:
	add	r3, ip, #40960
	ldr	r1, .L1703
	mov	r0, #19
	ldr	r4, [r3, #1216]
	cmp	r4, #0
	movne	r4, r2
	orreq	r4, r2, #1
	mov	r2, r4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L1692:
	cmp	r1, #1
	bne	.L1693
	ldr	r1, [r3, #2848]
	ldr	r0, [r3, #2852]
	ldr	r4, [r3, #68]
	ldr	lr, [r3, #64]
	cmp	r1, lr
	cmpeq	r0, r4
	movne	r1, #1
	moveq	r1, #0
	orr	r2, r2, r1
	b	.L1693
.L1702:
	ldr	r0, [r3, #2836]
	ldr	r1, [r3, #1204]
	cmp	r0, r1
	orrne	r2, r2, #1
	b	.L1691
.L1704:
	.align	2
.L1703:
	.word	.LC52
	UNWIND(.fnend)
	.size	MVC_IsNewPic, .-MVC_IsNewPic
	.align	2
	.global	mvc_ref_pic_list_reordering
	.type	mvc_ref_pic_list_reordering, %function
mvc_ref_pic_list_reordering:
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
	add	r4, r0, #11075584
	ldr	r2, [r0, #240]
	add	r4, r4, #40960
	mov	r5, r0
	mov	r3, #0
	mov	r6, #1
	ldrb	r0, [r4, #1171]	@ zero_extendqisi2
	ldrb	r1, [r4, #1161]	@ zero_extendqisi2
	cmp	r0, r3
	strb	r3, [r4, #108]
	strb	r3, [r4, #109]
	movne	r7, #5
	moveq	r7, #3
	cmp	r1, r3
	ldr	r3, [r2, #2896]
	addne	r3, r3, #5
	addeq	r3, r3, #4
	mov	r6, r6, asl r3
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L1760
.L1759:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
.L1726:
	adds	r3, r3, #0
	movne	r3, #1
	rsb	r0, r3, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1760:
	ldr	r1, .L1767
	mov	r0, r5
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r4, #108]
	cmp	r0, #0
	beq	.L1716
	ldr	r3, [r4, #1220]
	cmn	r3, #2
	beq	.L1742
	movw	r9, #41068
	mov	r8, #0
	movt	r9, 169
	add	r9, r5, r9
	b	.L1723
.L1717:
	cmp	r0, #2
	beq	.L1761
	sub	r0, r0, #4
	cmp	r0, #1
	bls	.L1762
.L1720:
	ldr	r3, [r4, #1220]
	add	r8, r8, #1
	add	r3, r3, #2
	cmp	r3, r8
	bls	.L1763
.L1723:
	ldr	r1, .L1767+4
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r7, r0
	str	r0, [r9, #4]!
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	bcc	.L1713
	cmp	r3, #0
	bne	.L1713
	cmp	r0, #3
	beq	.L1716
	cmp	r0, #1
	bhi	.L1717
	ldr	r1, .L1767+8
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r6, r0
	str	r0, [r9, #264]
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	bls	.L1719
	cmp	r3, #0
	beq	.L1720
.L1719:
	mov	r2, r0
	ldr	r1, .L1767+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1716:
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1759
	ldr	r1, .L1767+16
	mov	r0, r5
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r4, #109]
	cmp	r0, #0
	beq	.L1759
	ldr	r3, [r4, #1224]
	cmn	r3, #2
	beq	.L1759
	movw	r9, #41200
	mov	r8, #0
	movt	r9, 169
	add	r9, r5, r9
	b	.L1739
.L1738:
	add	r8, r8, #1
	cmp	r8, r3
	bcs	.L1759
.L1739:
	ldr	r1, .L1767+20
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r7, r0
	str	r0, [r9, #4]!
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	bcc	.L1730
	cmp	r3, #0
	bne	.L1730
	cmp	r0, #3
	beq	.L1726
	cmp	r0, #1
	bls	.L1764
	cmp	r0, #2
	beq	.L1765
	sub	r0, r0, #4
	cmp	r0, #1
	bls	.L1766
	ldr	r3, [r4, #1224]
	add	r3, r3, #2
	cmp	r3, r8
	bne	.L1738
.L1740:
	ldr	r1, .L1767+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1764:
	ldr	r1, .L1767+28
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r6, r0
	str	r0, [r9, #264]
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	bls	.L1734
	cmp	r3, #0
	bne	.L1734
.L1735:
	ldr	r2, [r4, #1224]
	add	r3, r2, #2
	cmp	r3, r8
	bne	.L1738
	movw	r1, #26686
	movt	r1, 42
	add	r1, r2, r1
	add	r1, r5, r1, lsl #2
	ldr	r2, [r1, #4]
	cmp	r2, #3
	beq	.L1738
	b	.L1740
.L1761:
	ldr	r1, .L1767+32
	mov	r0, r5
	bl	mvc_ue_v
	str	r0, [r9, #528]
	b	.L1720
.L1765:
	ldr	r1, .L1767+36
	mov	r0, r5
	bl	mvc_ue_v
	str	r0, [r9, #524]
	b	.L1735
.L1762:
	ldr	r1, .L1767+40
	mov	r0, r5
	bl	mvc_ue_v
	str	r0, [r9, #784]
	b	.L1720
.L1766:
	ldr	r1, .L1767+44
	mov	r0, r5
	bl	mvc_ue_v
	str	r0, [r9, #784]
	b	.L1735
.L1713:
	mov	r2, r0
	ldr	r1, .L1767+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1730:
	mov	r2, r0
	ldr	r1, .L1767+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1763:
	cmp	r8, r3
	bne	.L1716
.L1711:
	movw	r2, #26650
	movt	r2, 42
	add	r2, r3, r2
	add	r2, r5, r2, lsl #2
	ldr	r3, [r2, #8]
	cmp	r3, #3
	beq	.L1716
	ldr	r1, .L1767+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1734:
	mov	r2, r0
	ldr	r1, .L1767+60
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1742:
	mov	r3, #0
	b	.L1711
.L1768:
	.align	2
.L1767:
	.word	.LC53
	.word	.LC54
	.word	.LC56
	.word	.LC57
	.word	.LC61
	.word	.LC62
	.word	.LC68
	.word	.LC64
	.word	.LC58
	.word	.LC66
	.word	.LC59
	.word	.LC67
	.word	.LC55
	.word	.LC63
	.word	.LC60
	.word	.LC65
	UNWIND(.fnend)
	.size	mvc_ref_pic_list_reordering, .-mvc_ref_pic_list_reordering
	.align	2
	.global	mvc_pred_weight_table
	.type	mvc_pred_weight_table, %function
mvc_pred_weight_table:
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
	ldr	r3, [r0, #244]
	ldr	r1, .L1799
	add	r6, r0, #11075584
	ldr	r7, [r0, #240]
	mov	r5, r0
	str	r3, [fp, #-48]
	bl	mvc_ue_v
	add	r6, r6, #40960
	mov	r4, #1
	str	r0, [r6, #1228]
	mov	r8, r4, asl r0
	ldr	r9, [r7, #748]
	cmp	r9, #0
	bne	.L1793
.L1770:
	cmp	r0, #7
	bhi	.L1773
	ldr	r3, [r6, #1232]
	cmp	r3, #7
	bhi	.L1773
	ldrb	r2, [r5, #10]	@ zero_extendqisi2
	cmp	r2, #0
	movweq	r10, #42324
	moveq	r4, r2
	movteq	r10, 169
	addeq	r10, r5, r10
	beq	.L1781
	b	.L1772
.L1777:
	ldr	r2, [r7, #748]
	cmp	r2, #0
	bne	.L1794
.L1778:
	str	r2, [r10]
	str	r2, [r10, #768]
	str	r2, [r10, #128]
	str	r2, [r10, #896]
.L1780:
	ldr	r2, [r6, #1220]
	add	r4, r4, #1
	add	r10, r10, #4
	cmp	r2, r4
	bcc	.L1795
.L1781:
	ldr	r1, .L1799+4
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	streq	r8, [r10, #-128]
	streq	r0, [r10, #640]
	beq	.L1777
	ldr	r1, .L1799+8
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1799+12
	str	r0, [r10, #-128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r10, #640]
	ldr	r2, [r7, #748]
	cmp	r2, #0
	beq	.L1778
.L1794:
	ldr	r1, .L1799+16
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L1796
	str	r9, [r10]
	str	r0, [r10, #768]
	str	r9, [r10, #128]
	str	r0, [r10, #896]
	b	.L1780
.L1795:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #44]
	cmp	r3, #1
	beq	.L1782
.L1783:
	ldrb	r0, [r5, #10]	@ zero_extendqisi2
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
.L1775:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L1796:
	ldr	r1, .L1799+20
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1799+24
	str	r0, [r10]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1799+20
	str	r0, [r10, #768]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1799+24
	str	r0, [r10, #128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r10, #896]
	b	.L1780
.L1793:
	ldr	r1, .L1799+28
	mov	r0, r5
	bl	mvc_ue_v
	mov	r3, r0
	ldr	r0, [r6, #1228]
	mov	r9, r4, asl r3
	str	r3, [r6, #1232]
	b	.L1770
.L1782:
	ldrb	r3, [r6, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1783
	movw	r4, #42708
	mov	r10, #0
	movt	r4, 169
	add	r4, r5, r4
	b	.L1789
.L1785:
	ldr	r3, [r7, #748]
	cmp	r3, #0
	bne	.L1797
.L1786:
	str	r3, [r4]
	str	r3, [r4, #768]
	str	r3, [r4, #128]
	str	r3, [r4, #896]
.L1788:
	ldr	r3, [r6, #1224]
	add	r10, r10, #1
	add	r4, r4, #4
	cmp	r3, r10
	bcc	.L1783
.L1789:
	ldr	r1, .L1799+32
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	streq	r8, [r4, #-128]
	streq	r0, [r4, #640]
	beq	.L1785
	ldr	r1, .L1799+36
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1799+40
	str	r0, [r4, #-128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r4, #640]
	ldr	r3, [r7, #748]
	cmp	r3, #0
	beq	.L1786
.L1797:
	ldr	r1, .L1799+44
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L1798
	str	r9, [r4]
	str	r0, [r4, #768]
	str	r9, [r4, #128]
	str	r0, [r4, #896]
	b	.L1788
.L1773:
	ldrb	r2, [r5, #10]	@ zero_extendqisi2
.L1772:
	ldr	r1, .L1799+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L1775
.L1798:
	ldr	r1, .L1799+52
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1799+56
	str	r0, [r4]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1799+52
	str	r0, [r4, #768]
	mov	r0, r5
	bl	mvc_se_v
	ldr	r1, .L1799+56
	str	r0, [r4, #128]
	mov	r0, r5
	bl	mvc_se_v
	str	r0, [r4, #896]
	b	.L1788
.L1800:
	.align	2
.L1799:
	.word	.LC69
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	.LC76
	.word	.LC77
	.word	.LC70
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC71
	.word	.LC82
	.word	.LC83
	UNWIND(.fnend)
	.size	mvc_pred_weight_table, .-mvc_pred_weight_table
	.align	2
	.global	MVC_DecMMCO
	.type	MVC_DecMMCO, %function
MVC_DecMMCO:
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
	cmp	r1, #0
	mov	r4, r0
	moveq	r7, #100
	beq	.L1813
	mov	r9, #0
	b	.L1804
.L1835:
	ldr	r1, .L1841
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r5, #2
	beq	.L1833
.L1815:
	cmp	r5, #6
	orreq	r6, r6, #1
	cmp	r6, #0
	bne	.L1818
	cmp	r5, #4
	beq	.L1834
.L1819:
	cmp	r5, #6
	bhi	.L1811
.L1816:
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1811
	cmp	r5, #0
	beq	.L1821
.L1820:
	subs	r7, r7, #1
	beq	.L1822
.L1813:
	ldr	r1, .L1841+4
	mov	r0, r4
	bl	mvc_ue_v
	bic	r3, r0, #2
	sub	r6, r0, #3
	clz	r6, r6
	cmp	r3, #1
	mov	r5, r0
	mov	r6, r6, lsr #5
	beq	.L1835
	cmp	r5, #2
	bne	.L1815
.L1833:
	ldr	r1, .L1841+8
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r6, #0
	beq	.L1816
.L1818:
	ldr	r1, .L1841+12
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r5, #4
	bne	.L1819
.L1834:
	ldr	r1, .L1841+16
	mov	r0, r4
	bl	mvc_ue_v
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1820
.L1811:
	ldr	r1, .L1841+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1840:
	ldr	r1, .L1841
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r3, [r8, #4]
	cmp	r3, #2
	str	r0, [r8, #8]
	beq	.L1836
.L1807:
	cmp	r3, #3
	cmpne	r3, #6
	beq	.L1837
.L1808:
	cmp	r3, #4
	beq	.L1838
.L1809:
	cmp	r3, #6
	bhi	.L1811
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1811
	cmp	r3, #0
	add	r9, r9, #1
	beq	.L1821
	cmp	r9, #100
	beq	.L1839
.L1804:
	ldr	r1, .L1841+4
	mov	r0, r4
	ldrb	r5, [r4, #3]	@ zero_extendqisi2
	bl	mvc_ue_v
	mov	r6, r9, asl #2
	mov	r7, r9, asl #4
	add	r1, r6, r7
	movw	r2, #2004
	movw	r8, #43824
	mla	r2, r2, r5, r1
	movt	r8, 169
	add	r2, r4, r2
	add	r8, r2, r8
	mov	r3, r0
	bic	r0, r0, #2
	cmp	r0, #1
	str	r3, [r8, #4]
	beq	.L1840
	cmp	r3, #2
	bne	.L1807
.L1836:
	ldr	r1, .L1841+8
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r6, r7
	movw	r2, #2004
	movw	r1, #43832
	mla	r3, r2, r5, r3
	movw	r2, #43824
	movt	r1, 169
	movt	r2, 169
	add	r3, r4, r3
	add	r1, r3, r1
	add	r2, r3, r2
	str	r0, [r1, #4]
	ldr	r3, [r2, #4]
	cmp	r3, #3
	cmpne	r3, #6
	bne	.L1808
.L1837:
	ldr	r1, .L1841+12
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r6, r7
	movw	r2, #2004
	movw	r1, #43832
	mla	r3, r2, r5, r3
	movw	r2, #43824
	movt	r1, 169
	movt	r2, 169
	add	r3, r4, r3
	add	r1, r3, r1
	add	r2, r3, r2
	str	r0, [r1, #8]
	ldr	r3, [r2, #4]
	cmp	r3, #4
	bne	.L1809
.L1838:
	ldr	r1, .L1841+16
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, r7
	movw	r7, #2004
	movw	r2, #43840
	mla	r5, r7, r5, r6
	movw	r3, #43824
	movt	r2, 169
	movt	r3, 169
	add	r5, r4, r5
	add	r2, r5, r2
	add	r3, r5, r3
	str	r0, [r2, #4]
	ldr	r3, [r3, #4]
	b	.L1809
.L1821:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1839:
	ldr	r1, .L1841+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1822:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1842:
	.align	2
.L1841:
	.word	.LC86
	.word	.LC85
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC84
	UNWIND(.fnend)
	.size	MVC_DecMMCO, .-MVC_DecMMCO
	.align	2
	.global	mvc_dec_ref_pic_marking
	.type	mvc_dec_ref_pic_marking, %function
mvc_dec_ref_pic_marking:
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
	add	r3, r0, #11075584
	add	r3, r3, #40960
	mov	r4, r0
	ldrb	r7, [r0, #3]	@ zero_extendqisi2
	ldrb	r8, [r3, #1165]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L1844
	clz	r2, r7
	mov	r2, r2, lsr #5
	strb	r2, [r0, #3]
	mov	r6, r2
.L1853:
	ldrb	r3, [r3, #1163]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1864
	ldr	r1, .L1868
	mov	r0, r4
	bl	mvc_u_1
	movw	r2, #2004
	mla	r6, r2, r6, r4
	movw	r5, #43824
	movt	r5, 169
	ldr	r1, .L1868+4
	add	r5, r6, r5
	mov	r3, r0
	uxtb	r2, r0
	strb	r3, [r5, #3]
	mov	r0, #16
	bl	dprint_vfmw
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1847
.L1851:
	mov	r8, #0
.L1861:
	mov	r0, r8
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1844:
	movw	r2, #2004
	movw	r1, #43824
	mla	r2, r2, r7, r0
	movt	r1, 169
	movw	r5, #43824
	mov	r6, r7
	movt	r5, 169
	add	r5, r2, r5
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1853
	ldrb	r3, [r3, #1163]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1865
	ldr	r1, .L1868
	ldrb	r6, [r5, #3]	@ zero_extendqisi2
	bl	mvc_u_1
	cmp	r6, r0
	bne	.L1866
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1851
	mov	r1, r8
	mov	r0, r4
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	MVC_DecMMCO
.L1847:
	mov	r1, #1
	mov	r0, r4
	bl	MVC_DecMMCO
	cmn	r0, #1
	mov	r8, r0
	movne	r3, #1
	movne	r8, #0
	strneb	r3, [r5]
	bne	.L1861
	mov	r3, #0
	ldr	r1, .L1868+8
	strb	r3, [r5]
	mov	r0, #1
	strb	r7, [r4, #3]
	bl	dprint_vfmw
	b	.L1861
.L1865:
	ldr	r1, .L1868+12
	ldrb	r6, [r5, #1]	@ zero_extendqisi2
	bl	mvc_u_1
	cmp	r6, r0
	bne	.L1867
	mov	r0, r4
	ldr	r1, .L1868+16
	ldrb	r4, [r5, #2]	@ zero_extendqisi2
	bl	mvc_u_1
	cmp	r4, r0
	beq	.L1851
	ldr	r1, .L1868+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1861
.L1864:
	ldr	r1, .L1868+12
	mov	r0, r4
	bl	mvc_u_1
	movw	r2, #2004
	mla	r2, r2, r6, r4
	movw	r5, #43824
	movt	r5, 169
	ldr	r1, .L1868+16
	mov	r8, #0
	add	r5, r2, r5
	strb	r0, [r5, #1]
	mov	r0, r4
	bl	mvc_u_1
	ldrb	r2, [r5, #1]	@ zero_extendqisi2
	ldr	r1, .L1868+24
	strb	r0, [r5, #2]
	mov	r0, #16
	bl	dprint_vfmw
	mov	r0, r8
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L1866:
	ldr	r1, .L1868+28
	mov	r0, #1
	bl	dprint_vfmw
	ldr	ip, [r4, #68]
	ldr	r3, [r4, #100]
	mov	r0, #1
	ldr	r2, [r4, #88]
	mvn	r8, #0
	ldr	r1, .L1868+32
	str	ip, [sp]
	bl	dprint_vfmw
	b	.L1861
.L1867:
	ldr	r1, .L1868+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1861
.L1869:
	.align	2
.L1868:
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC91
	.word	.LC92
	.word	.LC98
	.word	.LC93
	.word	.LC99
	.word	.LC100
	.word	.LC97
	UNWIND(.fnend)
	.size	mvc_dec_ref_pic_marking, .-mvc_dec_ref_pic_marking
	.align	2
	.global	MVC_ProcessSliceHeaderFirstPart
	.type	MVC_ProcessSliceHeaderFirstPart, %function
MVC_ProcessSliceHeaderFirstPart:
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
	ldr	r1, .L1935
	mov	r4, r0
	bl	mvc_ue_v
	ldr	r3, [r4, #40]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r6, r0
	bhi	.L1871
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1871
	mov	r1, r0
	mov	r0, r4
	bl	MVC_PPSSPSCheckTmpId
	cmp	r0, #0
	bne	.L1926
	add	r7, r4, #11075584
	mov	r0, r4
	add	r5, r7, #40960
	str	r6, [r5, #1176]
	bl	MVC_PPSSPSCheck
	subs	r8, r0, #0
	bne	.L1927
	ldr	r6, [r4, #240]
	mov	r0, r4
	ldr	r2, .L1935+4
	ldr	r9, [r4, #244]
	ldr	r1, [r6, #2896]
	add	r1, r1, #4
	bl	mvc_u_v
	str	r0, [r5, #1188]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1924
	adds	r0, r0, #0
	ldrb	r3, [r5, #1163]	@ zero_extendqisi2
	movne	r0, #1
	cmp	r3, #5
	movne	r0, #0
	cmp	r0, #0
	bne	.L1928
.L1877:
	mov	r3, #0
	strb	r3, [r5, #1161]
	strb	r3, [r5, #1162]
	ldrb	r3, [r6, #20]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1929
	ldr	r2, [r6, #3948]
	ldr	r1, [r6, #3952]
	add	r3, r2, #1
	mla	r3, r1, r3, r3
.L1900:
	ldrb	r2, [r6, #21]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1883
	strb	r2, [r5, #1164]
.L1885:
	ldr	r2, [r5, #1216]
	cmp	r2, r3
	bcs	.L1930
.L1886:
	ldrb	r3, [r5, #1163]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1931
.L1888:
	mov	r3, #0
	str	r3, [r5, #28]
	str	r3, [r5, #32]
	ldr	r3, [r6, #2900]
	cmp	r3, #0
	beq	.L1932
.L1892:
	mov	r3, #0
	str	r3, [r5, #64]
	str	r3, [r5, #68]
	ldr	r3, [r6, #2900]
	cmp	r3, #1
	beq	.L1933
.L1895:
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1924
	ldrb	r3, [r9, #17]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1898
	ldr	r1, .L1935+8
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	bne	.L1899
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1898
.L1899:
	ldr	r1, .L1935+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L1935+16
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L1924
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #102
	blx	ip
.L1924:
	mvn	r8, #0
.L1910:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1929:
	ldr	r1, .L1935+20
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #1161]
	cmp	r0, #0
	bne	.L1934
	ldr	r2, [r6, #3948]
	ldrb	ip, [r6, #20]	@ zero_extendqisi2
	ldr	r1, [r6, #3952]
	add	r3, r2, #1
	cmp	ip, #0
	mla	r3, r1, r3, r3
	bne	.L1902
	mov	r3, r3, asl #1
	b	.L1900
.L1883:
	mov	r2, #1
	strb	r2, [r5, #1164]
.L1903:
	ldr	r2, [r5, #1216]
	cmp	r2, r3, lsr #1
	bcc	.L1886
	ldr	r1, .L1935+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1910
.L1934:
	ldr	r1, .L1935+28
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #1162]
	ldr	r2, [r6, #3948]
	ldrb	r0, [r6, #20]	@ zero_extendqisi2
	ldr	r1, [r6, #3952]
	add	r3, r2, #1
	cmp	r0, #0
	ldrb	r0, [r5, #1161]	@ zero_extendqisi2
	mla	r3, r1, r3, r3
	moveq	r2, #2
	beq	.L1881
.L1902:
	mov	r2, #1
.L1881:
	cmp	r0, #0
	mul	r3, r2, r3
	beq	.L1900
	cmp	r0, #1
	mov	r2, #0
	strb	r2, [r5, #1164]
	bne	.L1885
	b	.L1903
.L1898:
	mov	r0, r4
	add	r7, r7, #40960
	bl	MVC_IsNewPic
	uxtb	r0, r0
	strb	r0, [r7, #1165]
	cmp	r0, #0
	bne	.L1910
	ldr	r2, [r7, #1216]
	ldr	r3, [r7, #2856]
	cmp	r2, r3
	bhi	.L1910
	ldr	r1, .L1935+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1910
.L1932:
	ldr	r1, [r6, #2904]
	mov	r0, r4
	ldr	r2, .L1935+36
	add	r1, r1, #4
	bl	mvc_u_v
	str	r0, [r5, #28]
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1892
	ldrb	r3, [r5, #1161]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1892
	ldr	r1, .L1935+40
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r5, #32]
	b	.L1892
.L1933:
	ldrb	r3, [r6, #18]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1895
	ldr	r1, .L1935+44
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r5, #64]
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1895
	ldrb	r3, [r5, #1161]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1895
	ldr	r1, .L1935+48
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r5, #68]
	b	.L1895
.L1871:
	mov	r2, r6
	ldr	r1, .L1935+52
	mvn	r8, #0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1931:
	ldr	r1, .L1935+56
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #65536
	str	r0, [r5, #1204]
	bcs	.L1889
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1888
.L1889:
	ldr	r1, .L1935+60
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1888
.L1926:
	ldr	r1, .L1935+64
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1910
.L1927:
	ldr	r1, .L1935+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1910
.L1928:
	ldr	r3, [r5, #2800]
	cmp	r3, #0
	bgt	.L1877
	ldr	r1, .L1935+72
	mov	r0, #1
	bl	dprint_vfmw
	b	.L1877
.L1930:
	ldr	r1, .L1935+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1910
.L1936:
	.align	2
.L1935:
	.word	.LC101
	.word	.LC105
	.word	.LC117
	.word	.LC118
	.word	g_event_report
	.word	.LC107
	.word	.LC109
	.word	.LC108
	.word	.LC119
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC102
	.word	.LC111
	.word	.LC112
	.word	.LC103
	.word	.LC104
	.word	.LC106
	.word	.LC110
	UNWIND(.fnend)
	.size	MVC_ProcessSliceHeaderFirstPart, .-MVC_ProcessSliceHeaderFirstPart
	.align	2
	.global	MVC_ProcessSliceHeaderSecondPart
	.type	MVC_ProcessSliceHeaderSecondPart, %function
MVC_ProcessSliceHeaderSecondPart:
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
	add	r4, r0, #11075584
	ldr	r3, [r0, #40]
	add	r4, r4, #40960
	mov	r5, r0
	sub	r3, r3, #1
	ldr	r6, [r0, #244]
	ldr	r2, [r4, #1176]
	cmp	r3, r2
	bcc	.L1938
	ldrb	r7, [r0, #10]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L1938
	bl	MVC_PPSSPSCheck
	cmp	r0, #0
	bne	.L2020
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2021
.L1942:
	ldr	r2, [r6, #36]
	cmp	r3, #1
	str	r2, [r4, #1220]
	ldr	r2, [r6, #40]
	str	r2, [r4, #1224]
	bls	.L2022
	cmp	r3, #2
	beq	.L1969
.L1953:
	mov	r3, #32
	str	r3, [r4, #1224]
.L1954:
	mov	r0, r5
	bl	mvc_ref_pic_list_reordering
	subs	r8, r0, #0
	bne	.L2023
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1956
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r7, #1
	moveq	r2, r7
	beq	.L1957
.L1956:
	ldr	r3, [r6, #44]
	cmp	r3, #1
	beq	.L2024
.L1973:
	mov	r2, #0
.L1957:
	strb	r7, [r4, #1167]
	mov	r0, #19
	ldr	r1, .L2030
	bl	dprint_vfmw
	ldrb	r2, [r4, #1167]	@ zero_extendqisi2
	mov	r3, #0
	str	r3, [r4, #1228]
	cmp	r2, r3
	str	r3, [r4, #1232]
	bne	.L2025
.L1958:
	ldrb	r3, [r4, #1168]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2026
.L1959:
	mov	r3, #0
	str	r3, [r4, #2772]
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1960
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L2027
.L1960:
	ldr	r1, .L2030+4
	mov	r0, r5
	bl	mvc_se_v
	mov	r3, #0
	str	r3, [r4, #2780]
	str	r3, [r4, #2784]
	str	r3, [r4, #2788]
	str	r0, [r4, #2776]
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2028
.L1989:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L1969:
	mov	r3, #32
	str	r3, [r4, #1220]
	b	.L1953
.L2028:
	ldr	r1, .L2030+8
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r0, #2
	str	r0, [r4, #2780]
	bhi	.L1963
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1963
	cmp	r0, #1
	beq	.L1989
	ldr	r1, .L2030+12
	mov	r0, r5
	bl	mvc_se_v
	add	r3, r0, #6
	str	r0, [r4, #2784]
	cmp	r3, #12
	bhi	.L1966
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1966
	ldr	r1, .L2030+16
	mov	r0, r5
	bl	mvc_se_v
	add	r3, r0, #6
	str	r0, [r4, #2788]
	cmp	r3, #12
	bhi	.L1968
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1989
.L1968:
	ldr	r1, .L2030+20
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1989
.L2025:
	mov	r0, r5
	bl	mvc_pred_weight_table
	cmp	r0, #0
	beq	.L1958
	ldr	r1, .L2030+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1989
.L2026:
	mov	r0, r5
	bl	mvc_dec_ref_pic_marking
	cmp	r0, #0
	beq	.L1959
	ldr	r1, .L2030+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1989
.L2024:
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	moveq	r7, r3
	moveq	r2, r7
	bne	.L1973
	b	.L1957
.L2021:
	ldr	r1, .L2030+32
	mov	r0, r5
	bl	mvc_u_1
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	strb	r0, [r4, #1166]
	b	.L1942
.L2022:
	ldr	r1, .L2030+36
	mov	r0, r5
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L1944
	ldr	r3, [r4, #1220]
.L1945:
	ldrb	r2, [r4, #1161]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1946
	cmp	r3, #15
	bhi	.L1947
	ldr	r3, [r4, #1224]
	cmp	r3, #15
	bhi	.L2029
.L1948:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1947
.L1949:
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1969
	cmp	r3, #1
	bne	.L1953
	b	.L1954
.L1938:
	ldr	r1, .L2030+40
	mvn	r8, #0
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2027:
	ldr	r1, .L2030+44
	mov	r0, r5
	bl	mvc_ue_v
	cmp	r0, #2
	str	r0, [r4, #2772]
	bhi	.L1961
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1960
.L1961:
	ldr	r1, .L2030+48
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1989
.L1946:
	cmp	r3, #31
	bhi	.L1950
	ldr	r3, [r4, #1224]
	cmp	r3, #31
	bls	.L1951
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1951
.L1950:
	ldr	r1, .L2030+52
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1989
.L1951:
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1949
	b	.L1950
.L2029:
	ldrb	r3, [r4, #1160]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L1948
.L1947:
	ldr	r1, .L2030+56
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1989
.L1944:
	ldr	r1, .L2030+60
	mov	r0, r5
	bl	mvc_ue_v
	ldrb	r2, [r4, #1160]	@ zero_extendqisi2
	cmp	r2, #1
	mov	r3, r0
	str	r0, [r4, #1220]
	bne	.L1945
	ldr	r1, .L2030+64
	mov	r0, r5
	bl	mvc_ue_v
	ldr	r3, [r4, #1220]
	str	r0, [r4, #1224]
	b	.L1945
.L1966:
	ldr	r1, .L2030+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1989
.L1963:
	ldr	r1, .L2030+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1989
.L2020:
	ldr	r1, .L2030+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1989
.L2023:
	ldr	r1, .L2030+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L1989
.L2031:
	.align	2
.L2030:
	.word	.LC127
	.word	.LC132
	.word	.LC133
	.word	.LC135
	.word	.LC137
	.word	.LC138
	.word	.LC128
	.word	.LC129
	.word	.LC120
	.word	.LC121
	.word	.LC102
	.word	.LC130
	.word	.LC131
	.word	.LC125
	.word	.LC124
	.word	.LC122
	.word	.LC123
	.word	.LC136
	.word	.LC134
	.word	.LC103
	.word	.LC126
	UNWIND(.fnend)
	.size	MVC_ProcessSliceHeaderSecondPart, .-MVC_ProcessSliceHeaderSecondPart
	.align	2
	.global	MVC_ExitSlice
	.type	MVC_ExitSlice, %function
MVC_ExitSlice:
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
	add	r3, r0, #11075584
	ldr	r1, [r0, #236]
	add	r3, r3, #40960
	ldrb	r2, [r3, #1161]	@ zero_extendqisi2
	ldr	ip, [r3, #1176]
	cmp	r2, #0
	ldr	r4, [r3, #1216]
	str	ip, [r3, #2828]
	ldr	lr, [r1, #744]
	strb	r2, [r3, #2816]
	ldrneb	r2, [r3, #1162]	@ zero_extendqisi2
	ldr	ip, [r3, #1188]
	str	r4, [r3, #2856]
	strneb	r2, [r3, #2817]
	ldrb	r2, [r3, #1163]	@ zero_extendqisi2
	str	ip, [r3, #2832]
	cmp	r2, #5
	ldrb	ip, [r3, #1168]	@ zero_extendqisi2
	strb	r2, [r3, #2818]
	ldreq	r2, [r3, #1204]
	strb	ip, [r3, #2819]
	str	lr, [r3, #2824]
	streq	r2, [r3, #2836]
	ldr	r2, [r1, #2900]
	cmp	r2, #0
	ldreq	r2, [r3, #32]
	ldreq	ip, [r3, #28]
	streq	r2, [r3, #2844]
	streq	ip, [r3, #2840]
	ldreq	r2, [r1, #2900]
	cmp	r2, #1
	ldreq	r2, [r3, #68]
	ldreq	r1, [r3, #64]
	streq	r2, [r3, #2852]
	ldrb	r2, [r3, #1171]	@ zero_extendqisi2
	streq	r1, [r3, #2848]
	cmp	r2, #1
	bne	.L2037
	ldr	ip, [r3, #2800]
	ldrb	r1, [r3, #1169]	@ zero_extendqisi2
	ldrb	r2, [r3, #1170]	@ zero_extendqisi2
	str	ip, [r3, #2860]
	strb	r1, [r3, #2820]
	strb	r2, [r3, #2821]
.L2037:
	ldr	r3, [r0, #80]
	add	r3, r3, #1
	str	r3, [r0, #80]
	ldmfd	sp, {r4, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_ExitSlice, .-MVC_ExitSlice
	.align	2
	.global	MVC_PicTypeStatistic
	.type	MVC_PicTypeStatistic, %function
MVC_PicTypeStatistic:
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
	add	r3, r0, #11075584
	add	r3, r3, #40960
	ldrb	r2, [r3, #1160]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L2043
	bcc	.L2044
	cmp	r2, #2
	ldmnefd	sp, {fp, sp, pc}
	ldrb	r3, [r3, #1163]	@ zero_extendqisi2
	add	r0, r0, #11141120
	cmp	r3, #5
	beq	.L2053
.L2046:
	add	r0, r0, #16384
	mov	r3, #0
	strb	r3, [r0, #453]
	ldmfd	sp, {fp, sp, pc}
.L2044:
	add	r0, r0, #11141120
	add	r3, r0, #16384
	ldrb	r2, [r3, #452]	@ zero_extendqisi2
	cmp	r2, #2
	movne	r2, #1
	strneb	r2, [r3, #452]
	b	.L2046
.L2043:
	add	r0, r0, #11141120
	mov	r2, #2
	add	r0, r0, #16384
	mov	r3, #0
	strb	r2, [r0, #452]
	strb	r3, [r0, #453]
	ldmfd	sp, {fp, sp, pc}
.L2053:
	add	r0, r0, #16384
	mov	r3, #1
	strb	r3, [r0, #453]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_PicTypeStatistic, .-MVC_PicTypeStatistic
	.align	2
	.global	MVC_CalcStreamBits
	.type	MVC_CalcStreamBits, %function
MVC_CalcStreamBits:
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
	add	r3, r0, #11075584
	add	r3, r3, #36864
	mov	r4, r0
	ldrb	r3, [r3, #1880]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2055
	ldr	r2, [r0, #232]
	ldr	r3, [r2, #64]
	add	r3, r3, #7
	bic	r3, r3, #7
	str	r3, [r2, #64]
	ldr	r2, [r0, #232]
	ldr	r3, [r2, #72]
	sub	r3, r3, #1
	str	r3, [r2, #72]
.L2055:
	ldr	r3, [r4, #232]
	ldrb	r6, [r3]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L2066
	mov	r1, #0
	mov	r0, r3
	mov	r5, r1
.L2057:
	add	r1, r1, #1
	ldr	ip, [r0, #12]
	cmp	r1, r6
	add	r0, r0, #28
	add	r5, r5, ip
	bne	.L2057
.L2056:
	mov	r7, r6, asl #5
	ldr	r0, [r3, #72]
	sub	r7, r7, r6, asl #2
	ldr	r2, [r3, #64]
	add	r1, r3, r7
	mov	r3, r5
	str	r0, [sp, #4]
	mov	r0, #7
	ldr	ip, [r1, #12]
	ldr	r1, .L2077
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r4, #232]
	mov	r2, r6
	mov	r0, #7
	ldr	r1, .L2077+4
	ldrb	r6, [r3]	@ zero_extendqisi2
	ldr	ip, [r3, #64]
	mov	lr, r6, asl #5
	and	ip, ip, r0
	sub	lr, lr, r6, asl #2
	add	r3, r3, lr
	str	ip, [r3, #24]
	ldr	r3, [r4, #232]
	ldrb	r6, [r3]	@ zero_extendqisi2
	ldr	r8, [r3, #64]
	mov	lr, r6, asl #5
	sub	lr, lr, r6, asl #2
	add	r3, r3, lr
	ldr	ip, [r3, #16]
	add	ip, ip, r8, lsr #3
	rsb	ip, r5, ip
	str	ip, [r3, #28]
	ldr	ip, [r4, #232]
	ldrb	r6, [ip]	@ zero_extendqisi2
	ldr	lr, [ip, #64]
	mov	r3, r6, asl #5
	sub	r3, r3, r6, asl #2
	add	ip, ip, r3
	ldr	r3, [ip, #12]
	add	r3, r5, r3
	rsb	r3, lr, r3, lsl #3
	str	r3, [ip, #20]
	ldr	ip, [r4, #232]
	ldrb	lr, [ip]	@ zero_extendqisi2
	mov	r3, lr, asl #5
	sub	r3, r3, lr, asl #2
	add	r3, ip, r3
	ldr	ip, [r3, #28]
	ldr	lr, [r3, #24]
	and	ip, ip, #3
	add	ip, lr, ip, lsl #3
	str	ip, [r3, #24]
	ldr	ip, [r4, #232]
	ldrb	lr, [ip]	@ zero_extendqisi2
	mov	r3, lr, asl #5
	sub	r3, r3, lr, asl #2
	add	r3, ip, r3
	ldr	ip, [r3, #28]
	bic	ip, ip, #3
	str	ip, [r3, #28]
	ldr	ip, [r4, #232]
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
	ldr	ip, [r4, #232]
	ldr	r2, [ip, #68]
	sub	r3, r2, #1
	cmp	r3, #1
	bhi	.L2076
	ldrb	r6, [ip]	@ zero_extendqisi2
	add	r1, r6, #1
	cmp	r2, r1
	movhi	r2, #1
	movls	r2, #0
	cmp	r1, #1
	movhi	r2, #0
	cmp	r2, #0
	beq	.L2059
	add	r6, r6, #2
	mov	r5, #0
.L2060:
	sub	r3, r6, #1
	ldr	r1, .L2077+8
	mov	r0, #7
	mov	lr, r3, asl #5
	mov	r2, r3
	sub	r3, lr, r3, asl #2
	add	ip, ip, r3
	str	r5, [ip, #24]
	ldr	ip, [r4, #232]
	add	ip, ip, r3
	ldr	lr, [ip, #16]
	str	lr, [ip, #28]
	ldr	ip, [r4, #232]
	add	ip, ip, r3
	ldr	lr, [ip, #12]
	mov	lr, lr, asl #3
	str	lr, [ip, #20]
	ldr	ip, [r4, #232]
	add	ip, ip, r3
	ldr	lr, [ip, #28]
	ldr	r7, [ip, #24]
	and	lr, lr, #3
	add	lr, r7, lr, lsl #3
	str	lr, [ip, #24]
	ldr	ip, [r4, #232]
	add	ip, ip, r3
	ldr	lr, [ip, #28]
	bic	lr, lr, #3
	str	lr, [ip, #28]
	ldr	ip, [r4, #232]
	add	ip, ip, r3
	ldr	r3, [ip, #24]
	ldr	ip, [ip, #20]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	ip, [r4, #232]
	ldr	r3, [ip, #68]
	cmp	r6, #1
	cmpls	r6, r3
	add	r6, r6, #1
	movcc	r2, #1
	movcs	r2, #0
	cmp	r2, #0
	bne	.L2060
	sub	r3, r3, #1
.L2059:
	mov	r2, r3, asl #5
	ldr	r1, [ip, #72]
	sub	r3, r2, r3, asl #2
	add	ip, ip, r3
	ldr	r3, [ip, #20]
	rsb	r3, r1, r3
	str	r3, [ip, #20]
	ldr	ip, [r4, #232]
	ldrb	r1, [ip]	@ zero_extendqisi2
	ldr	r3, [ip, #68]
	cmp	r1, r3
	bcs	.L2054
	sxth	r3, r1
	add	r4, r4, #11141120
	add	r4, r4, #16384
	mov	r2, r3, asl #5
	sub	r3, r2, r3, asl #2
	add	r3, ip, r3
.L2064:
	ldr	r2, [r3, #28]
	add	r1, r1, #1
	ldr	r0, [r4, #1192]
	add	r3, r3, #28
	cmp	r2, r0
	strcc	r2, [r4, #1192]
	ldr	r2, [ip, #68]
	cmp	r2, r1
	bhi	.L2064
.L2054:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2076:
	ldr	r1, .L2077+12
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	dprint_vfmw
.L2066:
	mov	r5, r6
	b	.L2056
.L2078:
	.align	2
.L2077:
	.word	.LC139
	.word	.LC140
	.word	.LC142
	.word	.LC141
	UNWIND(.fnend)
	.size	MVC_CalcStreamBits, .-MVC_CalcStreamBits
	.align	2
	.global	MVC_Scaling_List
	.type	MVC_Scaling_List, %function
MVC_Scaling_List:
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
	ble	.L2079
	mov	r0, #8
	mov	r4, #0
	mov	r2, r7
	mov	r9, r6
	ldr	r8, .L2090
	mov	r10, #255
	mov	r7, r1
	mov	r6, r0
	mov	r5, r4
	b	.L2084
.L2083:
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
	beq	.L2079
.L2084:
	cmp	r2, #16
	ldreq	r3, .L2090+4
	ldrneb	r4, [r5, r8]	@ zero_extendqisi2
	ldreqb	r4, [r5, r3]	@ zero_extendqisi2
	cmp	r0, #0
	add	r5, r5, #1
	beq	.L2083
	ldr	r1, .L2090+8
	ldr	r0, [fp, #-52]
	str	r2, [fp, #-48]
	bl	mvc_se_v
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
	b	.L2083
.L2079:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2091:
	.align	2
.L2090:
	.word	.LANCHOR0+16
	.word	.LANCHOR0
	.word	.LC143
	UNWIND(.fnend)
	.size	MVC_Scaling_List, .-MVC_Scaling_List
	.align	2
	.global	MVC_ProcessPPS
	.type	MVC_ProcessPPS, %function
MVC_ProcessPPS:
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
	UNWIND(.pad #44)
	sub	sp, sp, #44
	mov	r5, r1
	ldr	r1, .L2150
	mov	r4, r0
	bl	mvc_u_1
	strb	r0, [r5]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2141
	ldr	r1, .L2150+4
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #1]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2141
	ldr	r1, .L2150+8
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	str	r0, [r5, #32]
	bne	.L2096
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2097
.L2096:
	ldr	r1, .L2150+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L2150+16
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2141
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #102
	blx	ip
	mvn	r0, #0
.L2094:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2104:
	ldr	r1, .L2150+20
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2150+24
	str	r0, [r5, #60]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #18]
	cmp	r0, #1
	beq	.L2105
.L2123:
	ldr	r1, .L2150+28
	mov	r0, r4
	bl	mvc_se_v
	add	r3, r0, #12
	str	r0, [r5, #56]
	cmp	r3, #24
	bhi	.L2106
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2124
.L2106:
	ldr	r1, .L2150+32
	mov	r0, #1
	bl	dprint_vfmw
.L2141:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2097:
	ldr	r1, .L2150+36
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #31
	str	r0, [r5, #36]
	bhi	.L2098
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2098
	ldr	r1, .L2150+40
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #31
	str	r0, [r5, #40]
	bhi	.L2100
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2100
	ldr	r1, .L2150+44
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #2]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2141
	ldr	r2, .L2150+48
	mov	r1, #2
	mov	r0, r4
	bl	mvc_u_v
	cmp	r0, #2
	str	r0, [r5, #44]
	bhi	.L2142
	ldr	r1, .L2150+52
	mov	r0, r4
	bl	mvc_se_v
	ldr	r1, .L2150+56
	str	r0, [r5, #48]
	mov	r0, r4
	bl	mvc_se_v
	ldr	r1, .L2150+60
	mov	r0, r4
	bl	mvc_se_v
	ldr	r1, .L2150+64
	str	r0, [r5, #52]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2150+68
	strb	r0, [r5, #3]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2150+72
	strb	r0, [r5, #4]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #17]
	cmp	r0, #0
	bne	.L2143
.L2103:
	ldr	r3, [r5, #52]
	mov	r6, #0
	add	r0, r4, #548
	str	r6, [r5, #60]
	strb	r6, [r5, #18]
	str	r3, [r5, #56]
	bl	BsResidBits
	ldr	r3, [r4, #232]
	ldr	r3, [r3, #72]
	add	r3, r3, #3
	cmp	r0, r3
	bcs	.L2104
.L2124:
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2143:
	ldr	r1, .L2150+76
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2103
.L2098:
	ldr	r1, .L2150+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2094
.L2100:
	ldr	r1, .L2150+84
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2094
.L2105:
	sub	r8, fp, #72
	add	r10, r5, #4
	add	r7, r5, #2016
	add	r9, r5, #64
	b	.L2114
.L2147:
	ldr	lr, [r5, #28]
	ldr	r3, [r4, #248]
	mla	r3, ip, lr, r3
	ldrb	ip, [r3, #27]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L2144
	ldr	r3, .L2150+88
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2150+92
	ldr	r3, [r3, #52]
	blx	r3
.L2109:
	add	r6, r6, #1
	add	r7, r7, #16
	cmp	r6, #6
	add	r9, r9, #64
	beq	.L2145
.L2114:
	ldr	r1, .L2150+96
	mov	r0, r4
	bl	mvc_u_1
	movw	ip, #3992
	clz	r1, r6
	mov	r2, #16
	cmp	r0, #1
	mov	r3, r0
	mov	r0, r7
	str	r3, [r8, #4]!
	strb	r3, [r10, #1]!
	beq	.L2146
	cmp	r6, #0
	cmpne	r6, #3
	mov	r1, r1, lsr #5
	beq	.L2147
	ldr	r3, .L2150+92
	mov	r2, #16
	sub	r1, r7, #16
	mov	r0, r7
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2109
.L2145:
	add	r8, r5, #2112
	add	r10, r5, #448
	sub	r7, fp, #76
	add	r9, r5, #11
	mov	r6, #0
.L2122:
	ldr	r2, [r5, #60]
	mov	r3, #0
	cmp	r2, #1
	strne	r3, [r7]
	strneb	r3, [r9]
	beq	.L2148
.L2117:
	ldr	r1, [r4, #248]
	movw	ip, #3992
	ldr	r3, [r5, #28]
	mov	r0, r8
	mov	r2, #64
	mla	r3, ip, r3, r1
	ldrb	r1, [r3, #27]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L2149
	ldr	r1, .L2150+100
	cmp	r6, #0
	ldr	r3, .L2150+92
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L2118:
	add	r6, r6, #1
	add	r8, r8, #64
	cmp	r6, #2
	add	r10, r10, #256
	add	r7, r7, #4
	add	r9, r9, #1
	bne	.L2122
	b	.L2123
.L2146:
	mov	r3, r2
	str	r8, [sp]
	mov	r2, r7
	mov	r1, r9
	mov	r0, r4
	bl	MVC_Scaling_List
	ldr	r3, [r8]
	cmp	r3, #1
	bne	.L2109
	ldr	r1, .L2150+88
	mov	r2, #16
	ldr	r3, .L2150+92
	cmp	r6, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r7
	blx	r3
	b	.L2109
.L2144:
	ldr	r2, .L2150+92
	add	r1, r6, #167
	mov	r0, r7
	add	r1, r3, r1, lsl #4
	ldr	ip, [r2, #52]
	mov	r2, #16
	blx	ip
	b	.L2109
.L2142:
	ldr	r1, .L2150+104
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2094
.L2148:
	ldr	r1, .L2150+108
	mov	r0, r4
	bl	mvc_u_1
	mov	r2, r8
	mov	r1, r10
	mov	r3, #64
	mov	ip, r0
	cmp	ip, #1
	mov	r0, r4
	str	ip, [r7]
	strb	ip, [r9]
	bne	.L2117
	str	r7, [sp]
	bl	MVC_Scaling_List
	ldr	r3, [r7]
	cmp	r3, #1
	bne	.L2118
	ldr	r1, .L2150+100
	mov	r2, #64
	ldr	r3, .L2150+92
	cmp	r6, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r8
	blx	r3
	b	.L2118
.L2149:
	add	r1, r3, r6, lsl #6
	ldr	r3, .L2150+92
	add	r1, r1, #2768
	ldr	ip, [r3, #52]
	blx	ip
	b	.L2118
.L2151:
	.align	2
.L2150:
	.word	.LC144
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	g_event_report
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC167
	.word	.LC148
	.word	.LC150
	.word	.LC152
	.word	.LC153
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC159
	.word	.LC160
	.word	.LC161
	.word	.LC149
	.word	.LC151
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC165
	.word	.LANCHOR1+32
	.word	.LC154
	.word	.LC166
	UNWIND(.fnend)
	.size	MVC_ProcessPPS, .-MVC_ProcessPPS
	.align	2
	.global	MVC_PPSEqual
	.type	MVC_PPSEqual, %function
MVC_PPSEqual:
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
	subs	r6, r0, #0
	beq	.L2179
	cmp	r1, #0
	beq	.L2180
	ldr	r2, [r1, #28]
	ldr	r0, [r6, #28]
	ldr	r3, [r6, #24]
	ldr	ip, [r1, #24]
	ldrb	lr, [r6]	@ zero_extendqisi2
	cmp	r0, r2
	cmpeq	r3, ip
	ldrb	r4, [r1]	@ zero_extendqisi2
	ldrb	ip, [r6, #1]	@ zero_extendqisi2
	ldrb	r5, [r1, #1]	@ zero_extendqisi2
	moveq	r2, #1
	movne	r2, #0
	ldr	r0, [r6, #36]
	cmp	lr, r4
	movne	r3, #0
	andeq	r3, r2, #1
	ldr	r4, [r1, #36]
	cmp	ip, r5
	movne	lr, #0
	andeq	lr, r3, #1
	ldr	r2, [r6, #40]
	ldr	r5, [r1, #40]
	cmp	r0, r4
	movne	ip, #0
	andeq	ip, lr, #1
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	ldrb	r4, [r1, #2]	@ zero_extendqisi2
	cmp	r2, r5
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	lr, [r6, #44]
	ldr	r5, [r1, #44]
	cmp	r3, r4
	movne	r2, #0
	andeq	r2, r0, #1
	ldr	ip, [r6, #48]
	ldr	r4, [r1, #48]
	cmp	lr, r5
	movne	r3, #0
	andeq	r3, r2, #1
	ldr	r0, [r6, #52]
	ldr	r5, [r1, #52]
	cmp	ip, r4
	movne	lr, #0
	andeq	lr, r3, #1
	ldrb	r2, [r6, #3]	@ zero_extendqisi2
	ldrb	r4, [r1, #3]	@ zero_extendqisi2
	cmp	r0, r5
	movne	ip, #0
	andeq	ip, lr, #1
	ldrb	r3, [r6, #4]	@ zero_extendqisi2
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	cmp	r2, r4
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	ip, [r6, #60]
	ldr	r4, [r1, #60]
	cmp	r3, lr
	movne	r2, #0
	andeq	r2, r0, #1
	ldrb	r0, [r6, #18]	@ zero_extendqisi2
	ldrb	lr, [r1, #18]	@ zero_extendqisi2
	cmp	ip, r4
	movne	r3, #0
	andeq	r3, r2, #1
	cmp	lr, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r0, #0
	beq	.L2156
	mov	ip, ip, asl #1
	adds	r2, ip, #6
	str	r2, [fp, #-56]
	beq	.L2156
	add	r2, r6, #4
	sub	r9, r1, #1088
	str	r2, [fp, #-52]
	add	r2, r1, #4
	str	r2, [fp, #-48]
	add	r2, r1, #64
	sub	r9, r9, #4
	add	r7, r1, #1984
	add	r8, r6, #1984
	mov	r10, r6
	mov	r5, r6
	str	r6, [fp, #-60]
	mov	r0, #0
	mov	r6, r2
	str	r1, [fp, #-64]
.L2161:
	ldr	r1, [fp, #-52]
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	str	r1, [fp, #-52]
	ldr	r1, [fp, #-48]
	ldrsb	ip, [r1, #1]!
	str	r1, [fp, #-48]
	sxtb	r1, r2
	cmp	ip, r1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, #0
	beq	.L2178
	ldr	r2, [r8]
	ldr	r1, [r7]
	cmp	r2, r1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r0, #5
	bhi	.L2158
	cmp	r2, #0
	add	r4, r10, #64
	bne	.L2157
	add	r10, r10, #128
	mov	r1, r6
	mov	r2, r4
.L2159:
	ldr	lr, [r2], #4
	ldr	ip, [r1], #4
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r10
	bne	.L2159
.L2157:
	ldr	r2, [fp, #-56]
	add	r0, r0, #1
	add	r8, r8, #4
	add	r7, r7, #4
	cmp	r0, r2
	add	r5, r5, #256
	add	r9, r9, #256
	mov	r10, r4
	add	r6, r6, #64
	bne	.L2161
	ldr	r6, [fp, #-60]
	ldr	r1, [fp, #-64]
.L2156:
	ldr	r0, [r6, #56]
	ldr	r2, [r1, #56]
	cmp	r0, r2
	movne	r0, #0
	andeq	r0, r3, #1
	eor	r0, r0, #1
	rsb	r0, r0, #0
.L2154:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2158:
	cmp	r2, #0
	bne	.L2178
	sub	r2, r5, #1088
	sub	r4, r5, #836
	sub	r2, r2, #4
	mov	r1, r9
.L2160:
	ldr	lr, [r2, #4]!
	ldr	ip, [r1, #4]!
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r4
	bne	.L2160
.L2178:
	add	r4, r10, #64
	b	.L2157
.L2180:
	mov	r0, r1
	movw	r3, #10268
	ldr	r2, .L2181
	ldr	r1, .L2181+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2154
.L2179:
	movw	r3, #10267
	ldr	r2, .L2181
	ldr	r1, .L2181+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2154
.L2182:
	.align	2
.L2181:
	.word	.LC13
	.word	.LC14
	UNWIND(.fnend)
	.size	MVC_PPSEqual, .-MVC_PPSEqual
	.align	2
	.global	MVC_DecPPS
	.type	MVC_DecPPS, %function
MVC_DecPPS:
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
	ldr	r1, .L2198
	mov	r4, r0
	bl	mvc_ue_v
	ldr	r3, [r4, #40]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	r5, r0
	bls	.L2184
	mov	r2, r0
	ldr	r1, .L2198+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r4, #40]
	sub	r3, r2, #1
	cmp	r5, r3
	bls	.L2191
	ldr	r3, .L2198+8
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2191
	str	r2, [fp, #-40]
	mov	r3, #8
	str	r5, [fp, #-44]
	sub	r2, fp, #44
	ldr	r0, [r4, #120]
	mov	r1, #110
	blx	ip
	mvn	r0, #0
.L2185:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2184:
	ldr	r1, .L2198+12
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r3, [r4, #36]
	sub	r3, r3, #1
	cmp	r0, r3
	mov	ip, r0
	bhi	.L2195
	mov	r8, #2240
	ldr	r3, [r4, #252]
	mul	r6, r8, r5
	add	r3, r3, r6
	ldrb	r7, [r3, #19]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L2187
	ldr	r7, .L2198+16
	mov	r0, r4
	mov	r1, r7
	str	r5, [r7, #24]
	str	ip, [r7, #28]
	bl	MVC_ProcessPPS
	subs	r5, r0, #0
	bne	.L2196
	ldr	r1, [r4, #252]
	mov	r0, r7
	add	r1, r1, r6
	bl	MVC_PPSEqual
	cmp	r0, #0
	beq	.L2185
	ldr	ip, .L2198+20
	mov	r3, #1
	ldr	r0, [r4, #252]
	mov	r2, r8
	mov	r1, r7
	strb	r3, [r7, #20]
	add	r0, r0, r6
	ldr	ip, [ip, #56]
	strb	r3, [r7, #19]
	blx	ip
	mov	r0, r5
	b	.L2185
.L2187:
	str	r5, [r3, #24]
	mov	r0, r4
	ldr	r3, [r4, #252]
	add	r3, r3, r6
	str	ip, [r3, #28]
	ldr	r1, [r4, #252]
	add	r1, r1, r6
	bl	MVC_ProcessPPS
	cmp	r0, #0
	bne	.L2197
	ldr	r3, [r4, #252]
	mov	r2, #1
	add	r3, r3, r6
	strb	r2, [r3, #20]
	ldr	r3, [r4, #252]
	add	r6, r3, r6
	strb	r2, [r6, #19]
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2191:
	mvn	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2195:
	ldr	r1, .L2198+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2185
.L2196:
	movw	r2, #10031
	ldr	r1, .L2198+28
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2185
.L2197:
	movw	r2, #10051
	ldr	r1, .L2198+28
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #252]
	mov	r2, #1
	mvn	r0, #0
	add	r3, r3, r6
	strb	r2, [r3, #20]
	ldr	r3, [r4, #252]
	add	r6, r3, r6
	strb	r7, [r6, #19]
	b	.L2185
.L2199:
	.align	2
.L2198:
	.word	.LC168
	.word	.LC169
	.word	g_event_report
	.word	.LC170
	.word	.LANCHOR2
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC171
	.word	.LC172
	UNWIND(.fnend)
	.size	MVC_DecPPS, .-MVC_DecPPS
	.align	2
	.global	mvc_vui_parameters
	.type	mvc_vui_parameters, %function
mvc_vui_parameters:
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
	ldr	r1, .L2248
	mov	r4, r0
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5]
	cmp	r0, #0
	streqb	r0, [r5, #15]
	bne	.L2242
.L2202:
	ldr	r1, .L2248+4
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #1]
	cmp	r0, #0
	bne	.L2243
.L2203:
	ldr	r1, .L2248+8
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #3]
	cmp	r0, #0
	moveq	r3, #5
	streq	r3, [r5, #28]
	bne	.L2244
.L2205:
	ldr	r1, .L2248+12
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #6]
	cmp	r0, #0
	bne	.L2245
.L2206:
	ldr	r1, .L2248+16
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #8]
	cmp	r0, #0
	bne	.L2246
.L2208:
	ldr	r1, .L2248+20
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #7]
	cmp	r0, #0
	beq	.L2210
	ldr	r1, .L2248+24
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r2, .L2248+28
	mov	r1, #4
	str	r0, [r5, #96]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+32
	mov	r1, #4
	strb	r0, [r5, #92]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [r5, #96]
	cmp	r3, #31
	strb	r0, [r5, #93]
	bhi	.L2213
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2213
	add	r7, r5, #96
	add	r8, r5, #59
.L2214:
	ldr	r1, .L2248+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2248+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2248+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #96]
	cmp	r3, r6
	bcs	.L2214
	ldr	r2, .L2248+48
	mov	r1, #5
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+52
	mov	r1, #5
	str	r0, [r5, #356]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+56
	mov	r1, #5
	str	r0, [r5, #360]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+60
	mov	r1, #5
	str	r0, [r5, #364]
	mov	r0, r4
	bl	mvc_u_v
	str	r0, [r5, #368]
.L2210:
	ldr	r1, .L2248+64
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #10]
	cmp	r0, #0
	bne	.L2247
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2219
.L2218:
	ldr	r1, .L2248+68
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2248+72
	strb	r0, [r5, #11]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #12]
	cmp	r0, #0
	bne	.L2220
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
.L2221:
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2247:
	ldr	r1, .L2248+24
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r2, .L2248+28
	mov	r1, #4
	str	r0, [r5, #408]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+32
	mov	r1, #4
	strb	r0, [r5, #404]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [r5, #408]
	cmp	r3, #31
	strb	r0, [r5, #405]
	bhi	.L2213
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2213
	add	r8, r5, #368
	add	r7, r5, #408
	add	r8, r8, #3
.L2216:
	ldr	r1, .L2248+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2248+40
	add	r6, r6, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2248+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r8, #1]!
	ldr	r3, [r5, #408]
	cmp	r3, r6
	bcs	.L2216
	ldr	r2, .L2248+48
	mov	r1, #5
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+52
	mov	r1, #5
	str	r0, [r5, #668]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+56
	mov	r1, #5
	str	r0, [r5, #672]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+60
	mov	r1, #5
	str	r0, [r5, #676]
	mov	r0, r4
	bl	mvc_u_v
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #0
	str	r0, [r5, #680]
	bne	.L2219
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2218
.L2219:
	ldr	r1, .L2248+76
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #14]
	b	.L2218
.L2246:
	ldr	r2, .L2248+80
	mov	r1, #32
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+84
	mov	r1, #32
	str	r0, [r5, #52]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2248+88
	str	r0, [r5, #56]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #9]
	cmp	r0, #1
	bne	.L2208
	ldr	r1, [r5, #52]
	cmp	r1, #0
	beq	.L2208
	ldr	r3, [r5, #56]
	mov	r0, #1000
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	mov	r0, r0, lsr #1
	str	r0, [r4, #56]
	b	.L2208
.L2245:
	ldr	r1, .L2248+92
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2248+96
	str	r0, [r5, #44]
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #48]
	b	.L2206
.L2244:
	ldr	r2, .L2248+100
	mov	r1, #3
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2248+104
	str	r0, [r5, #28]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2248+108
	strb	r0, [r5, #4]
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #5]
	cmp	r0, #0
	beq	.L2205
	ldr	r2, .L2248+112
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+116
	mov	r1, #8
	str	r0, [r5, #32]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+120
	mov	r1, #8
	str	r0, [r5, #36]
	mov	r0, r4
	bl	mvc_u_v
	str	r0, [r5, #40]
	b	.L2205
.L2243:
	ldr	r1, .L2248+124
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #2]
	b	.L2203
.L2242:
	ldr	r2, .L2248+128
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	uxtb	r0, r0
	strb	r0, [r5, #15]
	cmp	r0, #255
	bne	.L2202
	ldr	r2, .L2248+132
	mov	r1, #16
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2248+136
	mov	r1, #16
	str	r0, [r5, #16]
	mov	r0, r4
	bl	mvc_u_v
	str	r0, [r5, #20]
	b	.L2202
.L2220:
	ldr	r1, .L2248+140
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2248+144
	strb	r0, [r5, #13]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2248+148
	str	r0, [r5, #684]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2248+152
	str	r0, [r5, #688]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2248+156
	str	r0, [r5, #696]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2248+160
	str	r0, [r5, #692]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2248+164
	str	r0, [r5, #700]
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #704]
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L2221
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2213:
	ldr	r1, .L2248+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2249:
	.align	2
.L2248:
	.word	.LC173
	.word	.LC177
	.word	.LC179
	.word	.LC186
	.word	.LC189
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC205
	.word	.LC207
	.word	.LC208
	.word	.LC206
	.word	.LC190
	.word	.LC191
	.word	.LC192
	.word	.LC187
	.word	.LC188
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC184
	.word	.LC185
	.word	.LC178
	.word	.LC174
	.word	.LC175
	.word	.LC176
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC212
	.word	.LC213
	.word	.LC214
	.word	.LC215
	.word	.LC197
	UNWIND(.fnend)
	.size	mvc_vui_parameters, .-mvc_vui_parameters
	.align	2
	.global	MVC_SPSEqual
	.type	MVC_SPSEqual, %function
MVC_SPSEqual:
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
	beq	.L2282
	cmp	r1, #0
	beq	.L2283
	ldrb	lr, [r1]	@ zero_extendqisi2
	ldrb	r3, [r5]	@ zero_extendqisi2
	ldr	ip, [r5, #736]
	ldr	r2, [r1, #736]
	ldrb	r0, [r5, #1]	@ zero_extendqisi2
	cmp	r3, lr
	cmpeq	ip, r2
	ldrb	r6, [r1, #1]	@ zero_extendqisi2
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	ldrb	r4, [r1, #2]	@ zero_extendqisi2
	moveq	lr, #1
	movne	lr, #0
	ldr	r3, [r5, #740]
	cmp	r0, r6
	movne	ip, #0
	andeq	ip, lr, #1
	ldr	r6, [r1, #740]
	cmp	r2, r4
	movne	r0, #0
	andeq	r0, ip, #1
	ldr	lr, [r1, #744]
	ldr	r4, [r5, #744]
	cmp	r3, r6
	movne	r2, #0
	andeq	r2, r0, #1
	ldrb	ip, [r1, #27]	@ zero_extendqisi2
	ldrb	r0, [r5, #27]	@ zero_extendqisi2
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r2, #1
	cmp	ip, r0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r0, #0
	beq	.L2254
	add	r0, r1, #5
	add	r2, r5, #5
	sub	r9, r1, #404
	add	r7, r1, #748
	mov	ip, r0
	mov	r8, r5
	mov	r6, r5
	str	r5, [fp, #-48]
	mov	r0, #0
	mov	r4, r2
	mov	r5, ip
	str	r1, [fp, #-52]
.L2259:
	ldrb	r2, [r4, #1]!	@ zero_extendqisi2
	ldrsb	ip, [r5, #1]!
	sxtb	r1, r2
	cmp	ip, r1
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, #0
	beq	.L2255
	cmp	r0, #5
	bhi	.L2256
	add	r2, r6, #748
	add	r10, r6, #812
	mov	r1, r7
.L2257:
	ldr	lr, [r2, #4]!
	ldr	ip, [r1, #4]!
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r10
	bne	.L2257
.L2255:
	add	r0, r0, #1
	add	r8, r8, #256
	cmp	r0, #8
	add	r9, r9, #256
	add	r6, r6, #64
	add	r7, r7, #64
	bne	.L2259
	ldr	r5, [fp, #-48]
	ldr	r1, [fp, #-52]
.L2254:
	ldr	r2, [r1, #2896]
	ldr	ip, [r5, #2900]
	ldr	r0, [r1, #2900]
	ldr	lr, [r5, #2896]
	cmp	ip, r0
	cmpeq	lr, r2
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #0
	and	r3, r3, r2
	beq	.L2261
	cmp	ip, #1
	bne	.L2260
	ldr	r0, [r1, #2908]
	ldr	ip, [r5, #2908]
	ldrb	r2, [r5, #18]	@ zero_extendqisi2
	ldrb	r6, [r1, #18]	@ zero_extendqisi2
	ldr	r4, [r5, #2912]
	cmp	ip, r0
	cmpeq	r2, r6
	ldr	lr, [r1, #2912]
	ldr	r6, [r5, #2916]
	ldr	ip, [r1, #2916]
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
	beq	.L2260
	add	ip, r5, #2912
	add	r0, r1, #2912
	add	ip, ip, #4
	add	r0, r0, #4
	mov	r2, #0
.L2263:
	ldr	r4, [ip, #4]!
	add	r2, r2, #1
	ldr	lr, [r0, #4]!
	cmp	r4, lr
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r6
	bne	.L2263
.L2260:
	ldrb	ip, [r1, #19]	@ zero_extendqisi2
	ldrb	lr, [r5, #19]	@ zero_extendqisi2
	ldr	r0, [r5, #3944]
	ldr	r4, [r1, #3944]
	ldr	r2, [r5, #3948]
	cmp	lr, ip
	cmpeq	r0, r4
	ldr	r7, [r1, #3948]
	ldr	r6, [r5, #3952]
	ldr	r4, [r1, #3952]
	moveq	ip, #1
	movne	ip, #0
	ldrb	lr, [r1, #20]	@ zero_extendqisi2
	cmp	r2, r7
	movne	r0, #0
	andeq	r0, ip, #1
	ldrb	ip, [r5, #20]	@ zero_extendqisi2
	cmp	r6, r4
	movne	r2, #0
	andeq	r2, r0, #1
	cmp	lr, ip
	movne	r2, #0
	andeq	r2, r2, #1
	cmp	ip, #0
	and	r3, r3, r2
	bne	.L2264
	ldrb	r0, [r5, #21]	@ zero_extendqisi2
	ldrb	r2, [r1, #21]	@ zero_extendqisi2
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
.L2264:
	ldrb	r2, [r1, #22]	@ zero_extendqisi2
	ldrb	ip, [r5, #23]	@ zero_extendqisi2
	ldrb	r0, [r1, #23]	@ zero_extendqisi2
	ldrb	lr, [r5, #22]	@ zero_extendqisi2
	cmp	r0, ip
	cmpeq	lr, r2
	moveq	r2, #1
	movne	r2, #0
	cmp	ip, #0
	and	r3, r3, r2
	bne	.L2284
.L2265:
	ldrb	r0, [r5, #24]	@ zero_extendqisi2
	ldrb	r2, [r1, #24]	@ zero_extendqisi2
	cmp	r0, r2
	movne	r0, #0
	andeq	r0, r3, #1
	eor	r0, r0, #1
	rsb	r0, r0, #0
.L2252:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2284:
	ldr	ip, [r1, #3960]
	ldr	lr, [r5, #3960]
	ldr	r0, [r5, #3956]
	ldr	r4, [r1, #3956]
	ldr	r2, [r1, #3964]
	cmp	lr, ip
	cmpeq	r0, r4
	ldr	r6, [r5, #3964]
	ldr	r4, [r5, #3968]
	ldr	lr, [r1, #3968]
	moveq	ip, #1
	movne	ip, #0
	cmp	r6, r2
	movne	r0, #0
	andeq	r0, ip, #1
	cmp	r4, lr
	movne	r2, #0
	andeq	r2, r0, #1
	and	r3, r3, r2
	b	.L2265
.L2256:
	sub	r2, r8, #404
	sub	r10, r8, #148
	mov	r1, r9
.L2258:
	ldr	lr, [r2, #4]!
	ldr	ip, [r1, #4]!
	cmp	lr, ip
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r2, r10
	bne	.L2258
	b	.L2255
.L2261:
	ldr	r0, [r5, #2904]
	ldr	r2, [r1, #2904]
	cmp	r0, r2
	movne	r3, #0
	andeq	r3, r3, #1
	b	.L2260
.L2283:
	mov	r0, r1
	movw	r3, #10512
	ldr	r2, .L2285
	ldr	r1, .L2285+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2252
.L2282:
	movw	r3, #10511
	ldr	r2, .L2285
	ldr	r1, .L2285+4
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2252
.L2286:
	.align	2
.L2285:
	.word	.LC13
	.word	.LC14
	UNWIND(.fnend)
	.size	MVC_SPSEqual, .-MVC_SPSEqual
	.global	__aeabi_idiv
	.align	2
	.global	MVC_GetDar
	.type	MVC_GetDar, %function
MVC_GetDar:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	subs	r4, r0, #0
	beq	.L2310
	subs	ip, r4, #255
	movne	ip, #1
	cmp	r4, #16
	movle	lr, #0
	andgt	lr, ip, #1
	cmp	lr, #0
	bne	.L2299
	cmp	r2, #0
	cmpne	r1, #0
	moveq	r0, #1
	movne	r0, #0
	cmp	r4, #255
	movne	r0, #0
	andeq	r0, r0, #1
	cmp	r0, #0
	bne	.L2300
	cmp	r4, #1
	moveq	r2, r0
	moveq	r4, #5
	beq	.L2288
	cmp	ip, #0
	ldrne	r0, .L2311
	addne	r4, r0, r4, lsl #3
	ldrne	r1, [r4, #100]
	ldrne	r2, [r4, #104]
	mul	r0, r3, r1
	ldr	r3, [fp, #4]
	mul	r1, r3, r2
	mov	r0, r0, asl #10
	bl	__aeabi_idiv
	movw	r3, #2405
	movw	r1, #2262
	cmp	r0, r3
	mov	r2, r0
	rsble	r3, r0, #2400
	subgt	r3, r0, #2400
	addle	r3, r3, #6
	subgt	r3, r3, #6
	cmp	r0, r1
	bgt	.L2292
	rsb	r1, r0, #2256
	add	r1, r1, #7
	cmp	r3, r1
	bge	.L2293
.L2303:
	mov	r4, #4
	b	.L2288
.L2299:
	mov	r4, #0
.L2310:
	mov	r2, r4
.L2288:
	mov	r3, r4
	ldr	r1, .L2311+4
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2292:
	sub	r1, r0, #2256
	sub	r1, r1, #7
	cmp	r3, r1
	blt	.L2303
.L2293:
	movw	r3, #1819
	cmp	r2, r3
	bgt	.L2294
	rsb	r3, r2, #1808
	add	r3, r3, #12
	cmp	r1, r3
	blt	.L2305
.L2295:
	movw	r1, #1364
	cmp	r2, r1
	rsble	r4, r2, #1360
	subgt	r4, r2, #1360
	addle	r4, r4, #5
	subgt	r4, r4, #5
	cmp	r3, r4
	movlt	r4, #2
	movge	r4, #1
	b	.L2288
.L2300:
	mov	r4, lr
	mov	r2, lr
	b	.L2288
.L2294:
	sub	r3, r2, #1808
	sub	r3, r3, #12
	cmp	r1, r3
	bge	.L2295
.L2305:
	mov	r4, #3
	b	.L2288
.L2312:
	.align	2
.L2311:
	.word	.LANCHOR0
	.word	.LC216
	UNWIND(.fnend)
	.size	MVC_GetDar, .-MVC_GetDar
	.align	2
	.global	MVC_ProcessSPS
	.type	MVC_ProcessSPS, %function
MVC_ProcessSPS:
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
	subs	r5, r1, #0
	mov	r4, r0
	beq	.L2426
	ldr	r3, [r5, #736]
	cmp	r3, #100
	cmpne	r3, #122
	bic	r1, r3, #16
	sub	r3, r3, #110
	moveq	r2, #1
	movne	r2, #0
	cmp	r1, #128
	orreq	r2, r2, #1
	bics	r3, r3, #8
	orreq	r3, r2, #1
	movne	r3, r2
	cmp	r3, #0
	streqb	r3, [r5, #27]
	moveq	r3, #1
	streq	r3, [r5, #748]
	bne	.L2427
.L2326:
	ldr	r1, .L2441
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #12
	str	r0, [r5, #2896]
	bhi	.L2339
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2339
	ldr	r1, .L2441+4
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #2
	str	r0, [r5, #2900]
	bhi	.L2341
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2341
	cmp	r0, #0
	beq	.L2428
	cmp	r0, #1
	beq	.L2429
.L2347:
	ldr	r1, .L2441+8
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #3944]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2424
	ldr	r1, .L2441+12
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #19]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2424
	ldr	r1, .L2441+16
	mov	r0, r4
	bl	mvc_ue_v
	movw	r7, #509
	sub	r3, r0, #1
	str	r0, [r5, #3948]
	cmp	r3, r7
	bhi	.L2352
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2352
	ldr	r1, .L2441+20
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #3952]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2424
	ldr	r1, .L2441+24
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #20]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2424
	cmp	r0, #0
	bne	.L2430
	ldr	r1, .L2441+28
	mov	r0, r4
	bl	mvc_u_1
	ldr	r6, [r5, #3952]
	add	r6, r6, #1
	cmp	r6, #255
	strb	r0, [r5, #21]
	bhi	.L2385
	ldr	r3, [r5, #3948]
	add	r3, r3, #1
	cmp	r6, #1
	cmphi	r3, #3
	movhi	r8, #2
	bhi	.L2356
.L2385:
	ldr	r1, .L2441+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2417
.L2427:
	ldr	r1, .L2441+36
	bl	mvc_ue_v
	cmp	r0, #1
	str	r0, [r5, #748]
	bhi	.L2317
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2317
	ldr	r1, .L2441+40
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	bne	.L2319
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2320
.L2319:
	ldr	r1, .L2441+44
	mov	r0, #1
	bl	dprint_vfmw
.L2320:
	ldr	r1, .L2441+48
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #0
	bne	.L2321
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2322
.L2321:
	ldr	r1, .L2441+52
	mov	r0, #1
	bl	dprint_vfmw
.L2322:
	ldr	r1, .L2441+56
	mov	r0, r4
	bl	mvc_u_1
	cmp	r0, #0
	bne	.L2323
	ldrb	r10, [r4, #10]	@ zero_extendqisi2
	cmp	r10, #0
	bne	.L2323
	ldr	r1, .L2441+60
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #27]
	cmp	r0, #1
	bne	.L2326
	sub	r7, fp, #72
	add	r9, r5, #5
	add	r6, r5, #2672
	add	r8, r5, #752
	b	.L2332
.L2433:
	ldr	r3, .L2441+64
	cmp	r1, #0
	add	ip, r3, #16
	moveq	r3, ip
	mov	r1, r3
	ldr	r3, .L2441+68
	ldr	r3, [r3, #52]
	blx	r3
.L2328:
	add	r10, r10, #1
	add	r6, r6, #16
	cmp	r10, #6
	add	r8, r8, #64
	beq	.L2431
.L2332:
	ldr	r1, .L2441+72
	mov	r0, r4
	bl	mvc_u_1
	clz	r1, r10
	mov	r2, #16
	mov	r1, r1, lsr #5
	cmp	r0, #1
	mov	r3, r0
	mov	r0, r6
	str	r3, [r7, #4]!
	strb	r3, [r9, #1]!
	beq	.L2432
	cmp	r10, #0
	cmpne	r10, #3
	beq	.L2433
	ldr	r3, .L2441+68
	mov	r2, #16
	sub	r1, r6, #16
	mov	r0, r6
	ldr	r3, [r3, #52]
	blx	r3
	b	.L2328
.L2383:
	cmp	r1, r9
	cmpcs	r0, r6
	bcs	.L2382
	ldr	r3, .L2441+76
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2424
	strh	r1, [fp, #-72]	@ movhi
	mov	r3, #8
	strh	r0, [fp, #-70]	@ movhi
	sub	r2, fp, #76
	strh	r9, [fp, #-76]	@ movhi
	mov	r1, #107
	strh	r6, [fp, #-74]	@ movhi
	ldr	r0, [r4, #120]
	blx	ip
.L2424:
	mvn	r0, #0
.L2417:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2430:
	ldr	r6, [r5, #3952]
	strb	r3, [r5, #21]
	sub	r3, r6, #1
	cmp	r3, r7
	bhi	.L2385
	ldr	r3, [r5, #3948]
	mov	r8, #1
	add	r6, r6, #1
	add	r3, r3, r8
.L2356:
	mul	r6, r6, r8
	mov	r9, r3, asl #4
	mov	r6, r6, asl #4
	mul	r1, r9, r6
	add	r1, r1, r1, lsr #1
	cmp	r1, #100663296
	bhi	.L2434
	ldr	r2, [r5, #740]
	sub	r3, r2, #10
	cmp	r3, #31
	ldrls	pc, [pc, r3, asl #2]
	b	.L2358
.L2360:
	.word	.L2359
	.word	.L2361
	.word	.L2392
	.word	.L2392
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2392
	.word	.L2363
	.word	.L2365
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2365
	.word	.L2366
	.word	.L2367
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2358
	.word	.L2369
	.word	.L2369
.L2428:
	ldr	r1, .L2441+80
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #12
	str	r0, [r5, #2904]
	bhi	.L2344
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2347
.L2344:
	ldr	r1, .L2441+84
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2417
.L2392:
	mov	r0, #60416
	movt	r0, 13
.L2362:
	bl	__aeabi_uidiv
	ldr	r1, .L2441+88
	cmp	r0, #16
	movcc	r7, r0
	movcs	r7, #16
	mov	r2, r7
	mov	r0, #21
	bl	dprint_vfmw
	ldr	r2, [r5, #3944]
	cmp	r2, r7
	bhi	.L2370
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2371
.L2370:
	mov	r3, r7
	ldr	r1, .L2441+92
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r5, #3944]
	cmp	r3, #16
	bhi	.L2421
	cmp	r7, r3
	movcc	r7, r3
.L2421:
	str	r7, [r5, #3944]
.L2371:
	ldr	r1, .L2441+96
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #22]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2424
	ldr	r1, .L2441+100
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r0, r0
	strb	r0, [r5, #23]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2424
	cmp	r0, #0
	bne	.L2435
.L2373:
	mov	r2, r9, lsr #1
	mov	r3, r6, lsr #1
	str	r9, [r5, #3976]
	str	r6, [r5, #3980]
	str	r2, [r5, #3984]
	str	r3, [r5, #3988]
.L2375:
	ldr	r1, .L2441+104
	mov	r0, r4
	bl	mvc_u_1
	uxtb	r3, r0
	strb	r3, [r5, #24]
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2424
	cmp	r3, #0
	mov	r2, #2
	str	r2, [r5, #68]
	bne	.L2436
	mov	r0, r3
	strb	r3, [r5, #43]
	mov	r3, #5
	str	r3, [r5, #56]
.L2378:
	ldr	r2, [r5, #48]
	mov	r3, r9
	ldr	r1, [r5, #44]
	str	r6, [sp]
	bl	MVC_GetDar
	ldr	r3, [r5, #3944]
	cmp	r3, #0
	str	r0, [r5, #52]
	beq	.L2381
	cmp	r7, r3
	movcs	r7, r3
.L2381:
	ldr	r3, [r4, #224]
	cmp	r7, #16
	movcs	r7, #16
	ldr	r2, [r3, #28]
	cmp	r2, #25
	beq	.L2437
.L2382:
	cmp	r6, #1920
	bcc	.L2384
	cmp	r7, #4
	movcs	r7, #4
.L2384:
	add	r7, r7, #1
	mov	r0, #0
	str	r7, [r5, #3972]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2369:
	mov	r0, #12582912
	b	.L2362
.L2365:
	mov	r0, #30208
	movt	r0, 47
	b	.L2362
.L2431:
	sub	r7, fp, #88
	add	r9, r5, #11
	add	r6, r5, #2768
	add	r8, r5, #1136
	mov	r10, #0
.L2337:
	ldr	r1, .L2441+72
	mov	r0, r4
	bl	mvc_u_1
	mov	r2, #64
	mov	r3, r0
	cmp	r3, #1
	mov	r0, r6
	str	r3, [r7, #4]!
	strb	r3, [r9, #1]!
	beq	.L2438
	ldr	r1, .L2441+108
	cmp	r10, #0
	ldr	r3, .L2441+68
	add	ip, r1, #64
	ldr	r3, [r3, #52]
	movne	r1, ip
	blx	r3
.L2334:
	add	r10, r10, #1
	add	r6, r6, #64
	cmp	r10, #2
	add	r8, r8, #256
	bne	.L2337
	b	.L2326
.L2432:
	mov	r3, r2
	str	r7, [sp]
	mov	r2, r6
	mov	r1, r8
	mov	r0, r4
	bl	MVC_Scaling_List
	ldr	r3, [r7]
	cmp	r3, #1
	bne	.L2328
	ldr	r1, .L2441+64
	mov	r2, #16
	ldr	r3, .L2441+68
	cmp	r10, #2
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movhi	r1, r0
	mov	r0, r6
	blx	r3
	b	.L2328
.L2317:
	ldr	r1, .L2441+112
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2339:
	ldr	r1, .L2441+116
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2417
.L2435:
	ldr	r1, .L2441+120
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2441+124
	str	r0, [r5, #3956]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2441+128
	str	r0, [r5, #3960]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2441+132
	str	r0, [r5, #3964]
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r3, [r5, #3964]
	ldr	r2, [r5, #3956]
	mov	r1, r8, asl #1
	ldr	ip, [r5, #3960]
	mov	r3, r3, asl #1
	mov	r2, r2, asl #1
	mul	r8, r8, r3
	rsb	r3, r2, r9
	sub	r3, r3, ip, asl #1
	rsb	ip, r8, r6
	str	r0, [r5, #3968]
	mls	r0, r0, r1, ip
	cmp	r3, #0
	cmpgt	r0, #0
	ble	.L2373
	add	r2, r2, r3, lsr #1
	add	r8, r8, r0, lsr #1
	str	r2, [r5, #3984]
	str	r8, [r5, #3988]
	str	r3, [r5, #3976]
	str	r0, [r5, #3980]
	b	.L2375
.L2436:
	add	r1, r5, #28
	mov	r0, r4
	bl	mvc_vui_parameters
	cmp	r0, #0
	bne	.L2423
	ldrb	r3, [r5, #40]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2423
	ldr	r2, [r5, #732]
	clz	r3, r2
	mov	r3, r3, lsr #5
	cmp	r7, r2
	orrcc	r3, r3, #1
	cmp	r3, #0
	bne	.L2439
	ldr	r3, [r5, #3944]
	ldrb	r0, [r5, #43]	@ zero_extendqisi2
	cmp	r2, r3
	movcs	r7, r2
	movcc	r7, r3
	b	.L2378
.L2439:
	mov	r3, r7
	ldr	r1, .L2441+136
	mov	r0, #1
	bl	dprint_vfmw
.L2423:
	ldrb	r0, [r5, #43]	@ zero_extendqisi2
	b	.L2378
.L2437:
	ldr	r2, [r3, #708]
	cmp	r2, #0
	bne	.L2382
	ldr	r2, [r3, #692]
	ldr	r1, [r3, #668]
	cmp	r7, r2
	ldr	r0, [r3, #672]
	bls	.L2383
	ldr	r3, .L2441+76
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2424
	str	r2, [fp, #-72]
	mov	r3, #8
	str	r7, [fp, #-76]
	sub	r2, fp, #76
	ldr	r0, [r4, #120]
	mov	r1, #106
	blx	ip
	mvn	r0, #0
	b	.L2417
.L2323:
	ldr	r1, .L2441+140
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2417
.L2429:
	ldr	r1, .L2441+144
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r5, #18]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2424
	ldr	r1, .L2441+148
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r5, #2908]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2424
	ldr	r1, .L2441+152
	mov	r0, r4
	bl	mvc_se_v
	str	r0, [r5, #2912]
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2424
	ldr	r1, .L2441+156
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #255
	str	r0, [r5, #2916]
	bhi	.L2349
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2349
	cmp	r0, #0
	addne	r7, r5, #2912
	addne	r7, r7, #4
	bne	.L2351
	b	.L2347
.L2440:
	ldr	r3, [r5, #2916]
	cmp	r3, r6
	bls	.L2347
.L2351:
	ldr	r1, .L2441+160
	mov	r0, r4
	bl	mvc_se_v
	add	r6, r6, #1
	str	r0, [r7, #4]!
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2440
	b	.L2424
.L2352:
	mov	r2, r0
	ldr	r1, .L2441+164
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2417
.L2366:
	mov	r0, #30720
	movt	r0, 105
	b	.L2362
.L2363:
	mov	r0, #55296
	movt	r0, 27
	b	.L2362
.L2367:
	mov	r0, #7864320
	b	.L2362
.L2361:
	mov	r0, #17920
	movt	r0, 5
	b	.L2362
.L2359:
	mov	r0, #20992
	movt	r0, 2
	b	.L2362
.L2358:
	ldr	r1, .L2441+168
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2417
.L2349:
	ldr	r1, .L2441+172
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2417
.L2438:
	mov	r3, r2
	str	r7, [sp]
	mov	r2, r6
	mov	r1, r8
	mov	r0, r4
	bl	MVC_Scaling_List
	ldr	r3, [r7]
	cmp	r3, #1
	bne	.L2334
	ldr	r1, .L2441+108
	mov	r2, #64
	ldr	r3, .L2441+68
	cmp	r10, #0
	add	r0, r1, r2
	ldr	r3, [r3, #52]
	movne	r1, r0
	mov	r0, r6
	blx	r3
	b	.L2334
.L2341:
	ldr	r1, .L2441+176
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2417
.L2434:
	ldr	r1, .L2441+180
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2417
.L2426:
	mov	r0, r5
	movw	r3, #10701
	ldr	r2, .L2441+184
	ldr	r1, .L2441+188
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2417
.L2442:
	.align	2
.L2441:
	.word	.LC226
	.word	.LC228
	.word	.LC231
	.word	.LC239
	.word	.LC240
	.word	.LC242
	.word	.LC243
	.word	.LC257
	.word	.LC244
	.word	.LC217
	.word	.LC219
	.word	.LC220
	.word	.LC221
	.word	.LC222
	.word	.LC223
	.word	.LC225
	.word	.LANCHOR1
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC165
	.word	g_event_report
	.word	.LC230
	.word	.LC232
	.word	.LC247
	.word	.LC248
	.word	.LC249
	.word	.LC250
	.word	.LC255
	.word	.LANCHOR1+32
	.word	.LC218
	.word	.LC227
	.word	.LC251
	.word	.LC252
	.word	.LC253
	.word	.LC254
	.word	.LC256
	.word	.LC224
	.word	.LC233
	.word	.LC234
	.word	.LC235
	.word	.LC236
	.word	.LC238
	.word	.LC241
	.word	.LC246
	.word	.LC237
	.word	.LC229
	.word	.LC245
	.word	.LC13
	.word	.LC14
	UNWIND(.fnend)
	.size	MVC_ProcessSPS, .-MVC_ProcessSPS
	.align	2
	.global	MVC_DecSPS
	.type	MVC_DecSPS, %function
MVC_DecSPS:
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
	ldr	r2, .L2488
	mov	r1, #8
	mov	r4, r0
	bl	mvc_u_v
	ldr	r1, .L2488+4
	mov	r7, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2488+8
	mov	r9, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2488+12
	mov	r8, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2488+16
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2488+20
	str	r0, [fp, #-60]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2488+24
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r2, .L2488+28
	mov	r1, #2
	str	r0, [fp, #-68]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2488+32
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2488+36
	mov	r5, r0
	mov	r0, r4
	bl	mvc_ue_v
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	cmp	r2, #0
	mov	r6, r0
	bne	.L2481
	ldr	r2, [r4, #36]
	sub	r2, r2, #1
	cmp	r0, r2
	bhi	.L2483
	cmp	r7, #100
	mov	r10, r7
	beq	.L2449
	bhi	.L2450
	cmp	r7, #77
	beq	.L2449
	cmp	r7, #88
	beq	.L2451
	cmp	r7, #66
	bne	.L2448
	ldr	r1, .L2488+40
	mov	r0, #1
	bl	dprint_vfmw
.L2449:
	cmp	r5, #9
	mov	r2, r5
	bls	.L2480
.L2486:
	cmp	r5, #41
	bhi	.L2480
.L2455:
	movw	r1, #3992
	ldr	r3, [r4, #248]
	mul	r5, r1, r6
	add	r3, r3, r5
	ldrb	ip, [r3, #25]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L2456
	ldr	r3, .L2488+44
	mov	r0, r4
	ldrb	ip, [fp, #-56]	@ zero_extendqisi2
	add	r1, r3, #2240
	str	r10, [r3, #2976]
	strb	ip, [r3, #2242]
	ldrb	ip, [fp, #-60]	@ zero_extendqisi2
	strb	r9, [r3, #2240]
	strb	r8, [r3, #2241]
	strb	ip, [r3, #2243]
	ldrb	ip, [fp, #-64]	@ zero_extendqisi2
	str	r2, [r3, #2980]
	str	r6, [r3, #2984]
	strb	ip, [r3, #2244]
	ldrb	ip, [fp, #-68]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	strb	ip, [r3, #2245]
	bl	MVC_ProcessSPS
	ldr	r3, [fp, #-56]
	subs	r7, r0, #0
	bne	.L2484
	ldr	r1, [r4, #248]
	add	r0, r3, #2240
	str	r3, [fp, #-56]
	add	r1, r1, r5
	bl	MVC_SPSEqual
	ldr	r3, [fp, #-56]
	cmp	r0, #0
	bne	.L2485
.L2445:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2450:
	cmp	r7, #122
	beq	.L2453
	cmp	r7, #144
	beq	.L2453
	cmp	r7, #110
	beq	.L2453
.L2448:
	mov	r2, r7
	ldr	r1, .L2488+48
	mov	r0, #1
	mov	r10, #100
	bl	dprint_vfmw
	cmp	r5, #9
	mov	r2, r5
	bhi	.L2486
.L2480:
	mov	r3, #41
	ldr	r1, .L2488+52
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, #41
	b	.L2455
.L2456:
	str	r10, [r3, #736]
	mov	r0, r4
	ldr	r3, [r4, #248]
	ldrb	r1, [fp, #-56]	@ zero_extendqisi2
	str	ip, [fp, #-72]
	strb	r9, [r3, r5]
	ldr	r3, [r4, #248]
	add	r3, r3, r5
	strb	r8, [r3, #1]
	ldr	r3, [r4, #248]
	add	r3, r3, r5
	strb	r1, [r3, #2]
	ldr	r3, [r4, #248]
	ldrb	r1, [fp, #-60]	@ zero_extendqisi2
	add	r3, r3, r5
	strb	r1, [r3, #3]
	ldr	r3, [r4, #248]
	ldrb	r1, [fp, #-64]	@ zero_extendqisi2
	add	r3, r3, r5
	strb	r1, [r3, #4]
	ldr	r3, [r4, #248]
	ldrb	r1, [fp, #-68]	@ zero_extendqisi2
	add	r3, r3, r5
	strb	r1, [r3, #5]
	ldr	r3, [r4, #248]
	add	r3, r3, r5
	str	r2, [r3, #740]
	ldr	r3, [r4, #248]
	add	r3, r3, r5
	str	r6, [r3, #744]
	ldr	r1, [r4, #248]
	add	r1, r1, r5
	bl	MVC_ProcessSPS
	ldr	ip, [fp, #-72]
	cmp	r0, #0
	bne	.L2487
	ldr	r3, [r4, #248]
	mov	r2, #1
	add	r3, r3, r5
	strb	r2, [r3, #26]
	ldr	r3, [r4, #248]
	add	r5, r3, r5
	strb	r2, [r5, #25]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2483:
	ldr	r1, .L2488+56
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r4, #36]
	sub	r3, r2, #1
	cmp	r6, r3
	bls	.L2481
	ldr	r3, .L2488+60
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L2481
	str	r2, [fp, #-48]
	mov	r3, #8
	str	r6, [fp, #-52]
	sub	r2, fp, #52
	ldr	r0, [r4, #120]
	mov	r1, #109
	blx	ip
.L2481:
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2453:
	ldr	r1, .L2488+64
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r5, #9
	mov	r2, r5
	bhi	.L2486
	b	.L2480
.L2451:
	ldr	r1, .L2488+68
	mov	r0, #1
	bl	dprint_vfmw
	cmp	r5, #9
	mov	r2, r5
	bhi	.L2486
	b	.L2480
.L2485:
	ldr	lr, .L2488+72
	mov	ip, #1
	ldr	r0, [r4, #248]
	movw	r2, #3992
	add	r1, r3, #2240
	strb	ip, [r3, #2266]
	add	r0, r0, r5
	ldr	r4, [lr, #56]
	strb	ip, [r3, #2265]
	blx	r4
	mov	r0, r7
	b	.L2445
.L2484:
	mov	r3, r6
	movw	r2, #11245
	ldr	r1, .L2488+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2445
.L2487:
	mov	r3, r6
	movw	r2, #11272
	ldr	r1, .L2488+76
	mov	r0, #1
	str	ip, [fp, #-56]
	bl	dprint_vfmw
	ldr	r3, [r4, #248]
	mov	r2, #1
	ldr	ip, [fp, #-56]
	mvn	r0, #0
	add	r3, r3, r5
	strb	r2, [r3, #26]
	ldr	r3, [r4, #248]
	add	r5, r3, r5
	strb	ip, [r5, #25]
	b	.L2445
.L2489:
	.align	2
.L2488:
	.word	.LC258
	.word	.LC259
	.word	.LC260
	.word	.LC261
	.word	.LC262
	.word	.LC263
	.word	.LC264
	.word	.LC265
	.word	.LC266
	.word	.LC267
	.word	.LC268
	.word	.LANCHOR2
	.word	.LC271
	.word	.LC272
	.word	.LC171
	.word	g_event_report
	.word	.LC270
	.word	.LC269
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC273
	UNWIND(.fnend)
	.size	MVC_DecSPS, .-MVC_DecSPS
	.align	2
	.global	MVC_FreeMvcExtMem
	.type	MVC_FreeMvcExtMem, %function
MVC_FreeMvcExtMem:
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
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_FreeMvcExtMem, .-MVC_FreeMvcExtMem
	.align	2
	.global	MVC_FreeMvcVuiExtMem
	.type	MVC_FreeMvcVuiExtMem, %function
MVC_FreeMvcVuiExtMem:
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
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_FreeMvcVuiExtMem, .-MVC_FreeMvcVuiExtMem
	.align	2
	.global	MVC_ProcessSUBSPSMvcExt
	.type	MVC_ProcessSUBSPSMvcExt, %function
MVC_ProcessSUBSPSMvcExt:
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
	subs	r5, r1, #0
	mov	r4, r0
	beq	.L2554
	ldr	r1, .L2555
	bl	mvc_ue_v
	cmp	r0, #1
	str	r0, [r5, #4]
	bhi	.L2495
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	addeq	r7, r5, #4
	bne	.L2495
.L2497:
	ldr	r1, .L2555+4
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r7, #4]!
	ldr	r3, [r5, #4]
	cmp	r3, r6
	bcs	.L2497
	cmp	r3, #0
	mov	r2, #0
	str	r2, [r5, #16]
	str	r2, [r5, #24]
	beq	.L2498
	add	r8, r5, #16
	mov	r7, #1
.L2508:
	ldr	r1, .L2555+8
	mov	r0, r4
	bl	mvc_ue_v
	add	r9, r8, #4
	str	r0, [r8, #4]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcs	r3, #15
	cmp	r0, r3
	bhi	.L2499
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2499
	cmp	r0, #0
	addne	r10, r8, #16
	beq	.L2504
.L2503:
	ldr	r1, .L2555+12
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r10, #4]!
	ldr	r3, [r9]
	cmp	r6, r3
	bcc	.L2503
.L2504:
	ldr	r1, .L2555+16
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r9, #8]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcc	r2, r3
	movcs	r2, #15
	cmp	r0, r2
	bhi	.L2501
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2501
	cmp	r0, #0
	addne	r8, r8, #24
	beq	.L2506
.L2507:
	ldr	r1, .L2555+20
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r8, #4]!
	ldr	r3, [r9, #8]
	cmp	r6, r3
	bcc	.L2507
	ldr	r3, [r5, #4]
.L2506:
	add	r7, r7, #1
	mov	r8, r9
	cmp	r7, r3
	bls	.L2508
	cmp	r3, #0
	mov	r3, #0
	addne	r8, r5, #48
	str	r3, [r5, #48]
	str	r3, [r5, #56]
	movne	r7, #1
	beq	.L2522
.L2521:
	ldr	r1, .L2555+24
	mov	r0, r4
	bl	mvc_ue_v
	add	r9, r8, #4
	str	r0, [r8, #4]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcs	r3, #15
	cmp	r0, r3
	bhi	.L2512
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2512
	cmp	r0, #0
	addne	r10, r8, #16
	beq	.L2517
.L2516:
	ldr	r1, .L2555+28
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r10, #4]!
	ldr	r3, [r9]
	cmp	r6, r3
	bcc	.L2516
.L2517:
	ldr	r1, .L2555+32
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r9, #8]
	ldr	r3, [r5, #4]
	cmp	r3, #15
	movcc	r2, r3
	movcs	r2, #15
	cmp	r0, r2
	bhi	.L2514
	ldrb	r6, [r4, #10]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L2514
	cmp	r0, #0
	addne	r8, r8, #24
	beq	.L2519
.L2520:
	ldr	r1, .L2555+36
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r6, #1
	str	r0, [r8, #4]!
	ldr	r3, [r9, #8]
	cmp	r6, r3
	bcc	.L2520
	ldr	r3, [r5, #4]
.L2519:
	add	r7, r7, #1
	mov	r8, r9
	cmp	r7, r3
	bls	.L2521
.L2522:
	ldr	r1, .L2555+40
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r0, #1
	str	r0, [r5, #80]
	cmp	r3, #16
	str	r3, [fp, #-60]
	bhi	.L2510
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2510
	ldr	r2, [fp, #-60]
	cmp	r2, #0
	beq	.L2527
	add	r2, r5, #8384
	add	r1, r5, #80
	add	r2, r2, #16
	str	r1, [fp, #-72]
	str	r2, [fp, #-68]
	add	r2, r5, #212
	str	r3, [fp, #-56]
	str	r2, [fp, #-64]
	str	r5, [fp, #-76]
.L2526:
	ldr	r2, .L2555+44
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-72]
	ldr	r1, .L2555+48
	str	r0, [r3, #4]!
	mov	r0, r4
	mov	r5, r3
	str	r3, [fp, #-72]
	bl	mvc_ue_v
	add	r3, r0, #1
	str	r0, [r5, #64]
	str	r3, [fp, #-52]
	mov	r2, r3
	cmp	r2, #64
	bhi	.L2524
	ldrb	r7, [r4, #10]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L2524
	cmp	r2, #0
	beq	.L2534
	ldr	r3, [fp, #-64]
	movw	r10, #8188
	ldr	r2, [fp, #-68]
	movt	r10, 4
	add	r10, r3, r10
	mov	r8, r3
	str	r2, [fp, #-48]
.L2533:
	ldr	r2, .L2555+52
	mov	r1, #3
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2555+56
	str	r0, [r8], #4
	mov	r0, r4
	bl	mvc_ue_v
	add	r6, r0, #1
	str	r0, [r8, #4092]
	cmp	r6, #64
	bhi	.L2528
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2528
	cmp	r6, #0
	movne	r5, r3
	ldrne	r9, [fp, #-48]
	beq	.L2532
.L2529:
	ldr	r1, .L2555+60
	mov	r0, r4
	bl	mvc_ue_v
	add	r5, r5, #1
	cmp	r6, r5
	str	r0, [r9, #4]!
	bne	.L2529
.L2532:
	ldr	r1, .L2555+64
	mov	r0, r4
	bl	mvc_ue_v
	cmp	r0, #1024
	str	r0, [r10, #4]!
	bcs	.L2530
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2530
	ldr	r3, [fp, #-48]
	add	r7, r7, #1
	add	r3, r3, #256
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	cmp	r3, r7
	bne	.L2533
.L2534:
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-56]
	add	r2, r2, #256
	str	r2, [fp, #-64]
	ldr	r2, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	cmp	r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r3, #16384
	str	r3, [fp, #-68]
	bne	.L2526
.L2527:
	mov	r0, #0
	b	.L2546
.L2499:
	mov	r2, r0
	ldr	r1, .L2555+68
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
.L2546:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2501:
	mov	r2, r0
	ldr	r1, .L2555+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2514:
	mov	r2, r0
	ldr	r1, .L2555+76
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2546
.L2512:
	mov	r2, r0
	ldr	r1, .L2555+80
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2546
.L2495:
	mov	r2, r0
	movw	r3, #65534
	ldr	r1, .L2555+84
	mov	r0, #1
	str	r3, [r5, #80]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2546
.L2498:
	str	r3, [r5, #48]
	str	r3, [r5, #56]
	b	.L2522
.L2530:
	mov	r2, r0
	ldr	r1, .L2555+88
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2546
.L2528:
	ldr	r3, [fp, #-56]
	movw	ip, #65534
	ldr	r5, [fp, #-76]
	mov	r2, r6
	ldr	r1, .L2555+92
	mov	r0, #1
	add	r3, r7, r3, lsl #6
	add	r3, r3, #1072
	add	r3, r3, #4
	add	r3, r5, r3, lsl #2
	str	ip, [r3, #4]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2546
.L2554:
	mov	r0, r5
	mov	r3, #11392
	ldr	r2, .L2555+96
	ldr	r1, .L2555+100
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2546
.L2510:
	movw	r3, #65534
	ldr	r2, [fp, #-60]
	ldr	r1, .L2555+104
	mov	r0, #1
	str	r3, [r5, #80]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2546
.L2524:
	ldr	r3, [fp, #-56]
	mov	r0, #1
	ldr	r5, [fp, #-76]
	ldr	r2, [fp, #-52]
	add	r5, r5, r3, lsl #2
	ldr	r1, .L2555+108
	movw	r3, #65534
	str	r3, [r5, #148]
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2546
.L2556:
	.align	2
.L2555:
	.word	.LC274
	.word	.LC276
	.word	.LC277
	.word	.LC280
	.word	.LC278
	.word	.LC282
	.word	.LC284
	.word	.LC287
	.word	.LC285
	.word	.LC289
	.word	.LC283
	.word	.LC291
	.word	.LC292
	.word	.LC294
	.word	.LC295
	.word	.LC298
	.word	.LC296
	.word	.LC279
	.word	.LC281
	.word	.LC288
	.word	.LC286
	.word	.LC275
	.word	.LC299
	.word	.LC297
	.word	.LC13
	.word	.LC14
	.word	.LC290
	.word	.LC293
	UNWIND(.fnend)
	.size	MVC_ProcessSUBSPSMvcExt, .-MVC_ProcessSUBSPSMvcExt
	.align	2
	.global	MVC_ProcessSUBSPSMvcVuiExt
	.type	MVC_ProcessSUBSPSMvcVuiExt, %function
MVC_ProcessSUBSPSMvcVuiExt:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 72
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
	mov	r5, r1
	ldr	r1, .L2590
	mov	r4, r0
	bl	mvc_ue_v
	add	r3, r5, #278528
	cmp	r0, #1024
	str	r0, [r3, #560]
	bcs	.L2587
	adds	r6, r0, #1
	mov	r1, #0
	adc	r7, r1, #0
	strd	r6, [fp, #-116]
	orrs	r2, r6, r7
	beq	.L2575
	add	r1, r5, #294912
	add	r9, r5, #315392
	add	r9, r9, #856
	movw	r2, #16687
	mov	ip, r1
	movw	r6, #34136
	movw	r1, #16751
	movw	r0, #33844
	mov	r8, r5
	movt	r2, 4
	add	ip, ip, #820
	add	r2, r5, r2
	movt	r6, 4
	str	r2, [fp, #-104]
	movt	r1, 4
	add	r6, r5, r6
	add	r2, r5, r1
	movt	r0, 4
	str	r2, [fp, #-96]
	add	r2, r3, #111
	str	ip, [fp, #-76]
	str	r2, [fp, #-88]
	add	r2, r5, r0
	str	r6, [fp, #-48]
	str	r2, [fp, #-80]
	add	r2, r3, #560
	str	r2, [fp, #-92]
	add	r2, r3, #176
	str	r2, [fp, #-72]
	add	r2, r3, #432
	str	r2, [fp, #-52]
	add	r2, r3, #496
	str	r2, [fp, #-56]
	add	r2, r3, #240
	add	r3, r3, #816
	str	r2, [fp, #-84]
	str	r3, [fp, #-60]
	mov	r2, #1
	mov	r3, #0
	strd	r2, [fp, #-68]
	mov	r3, #0
	str	r3, [fp, #-100]
.L2574:
	ldr	r2, .L2590+4
	mov	r1, #3
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-88]
	ldr	r1, .L2590+8
	strb	r0, [r3, #1]!
	mov	r0, r4
	str	r3, [fp, #-88]
	bl	mvc_ue_v
	ldr	r3, [fp, #-92]
	adds	r5, r0, #1
	str	r0, [r3, #4]!
	str	r3, [fp, #-92]
	beq	.L2564
	ldr	r10, [fp, #-60]
	mov	r7, #0
	ldr	r6, [fp, #-48]
.L2561:
	ldr	r1, .L2590+12
	mov	r0, r4
	bl	mvc_ue_v
	add	r7, r7, #1
	cmp	r5, r7
	str	r0, [r10, #4]!
	bne	.L2561
	str	r6, [fp, #-48]
.L2564:
	ldr	r1, .L2590+16
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-96]
	uxtb	r0, r0
	strb	r0, [r3, #1]!
	cmp	r0, #0
	str	r3, [fp, #-96]
	bne	.L2588
.L2563:
	ldr	r1, .L2590+20
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-52]
	uxtb	r0, r0
	strb	r0, [r3]
	cmp	r0, #0
	beq	.L2565
	ldr	r1, .L2590+24
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r5, [fp, #-48]
	ldr	r2, .L2590+28
	mov	r1, #4
	str	r0, [r5]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34132
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2590+32
	mov	r1, #4
	strb	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34133
	movt	r3, 4
	add	r3, r8, r3
	strb	r0, [r3]
	ldr	r3, [r5]
	cmp	r3, #31
	bhi	.L2567
	ldrb	r5, [r4, #10]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L2567
	ldr	r6, [fp, #-48]
	movw	r10, #34099
	movt	r10, 4
	add	r10, r8, r10
	mov	r7, r6
.L2568:
	ldr	r1, .L2590+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2590+40
	add	r5, r5, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2590+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r10, #1]!
	ldr	r3, [r6]
	cmp	r3, r5
	bcs	.L2568
	ldr	r2, .L2590+48
	mov	r1, #5
	mov	r0, r4
	str	r6, [fp, #-48]
	bl	mvc_u_v
	movw	r3, #34396
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2590+52
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	add	r3, r8, #294912
	ldr	r2, .L2590+56
	mov	r1, #5
	str	r0, [r3, #1632]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34404
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2590+60
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #34408
	movt	r3, 4
	add	r3, r8, r3
	str	r0, [r3]
.L2565:
	ldr	r1, .L2590+64
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-56]
	uxtb	r0, r0
	strb	r0, [r3]
	cmp	r0, #0
	bne	.L2589
	ldr	r3, [fp, #-52]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2573
.L2572:
	ldr	r1, .L2590+68
	mov	r0, r4
	bl	mvc_u_1
	ldrd	r2, [fp, #-68]
	ldrd	r6, [fp, #-116]
	add	r8, r8, #312
	add	r9, r9, #312
	cmp	r7, r3
	ldr	r3, [fp, #-100]
	cmpeq	r6, r2
	add	r1, r3, #1
	ldr	r3, [fp, #-72]
	str	r1, [fp, #-100]
	add	r3, r3, #1
	str	r3, [fp, #-72]
	movhi	r3, #1
	movls	r3, #0
	cmp	r1, #63
	movhi	r1, #0
	andls	r1, r3, #1
	ldrd	r2, [fp, #-68]
	adds	r6, r2, #1
	adc	r7, r3, #0
	ldr	r3, [fp, #-52]
	cmp	r1, #0
	strd	r6, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-48]
	add	r3, r3, #312
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-76]
	add	r3, r3, #4
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-80]
	add	r3, r3, #4
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-84]
	add	r3, r3, #1
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-60]
	add	r3, r3, #256
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-104]
	strb	r0, [r3, #1]!
	str	r3, [fp, #-104]
	bne	.L2574
.L2575:
	mov	r0, #0
.L2585:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2589:
	ldr	r1, .L2590+24
	mov	r0, r4
	bl	mvc_ue_v
	add	r3, r8, #315392
	ldr	r2, .L2590+28
	mov	r1, #4
	mov	r5, r3
	str	r3, [fp, #-108]
	str	r0, [r9]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2590+32
	mov	r1, #4
	strb	r0, [r5, #852]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #54101
	movt	r3, 4
	add	r3, r8, r3
	strb	r0, [r3]
	ldr	r3, [r9]
	cmp	r3, #31
	bhi	.L2567
	ldrb	r5, [r4, #10]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L2567
	movw	r10, #54067
	ldr	r6, [fp, #-48]
	movt	r10, 4
	add	r10, r8, r10
	mov	r7, r9
.L2570:
	ldr	r1, .L2590+36
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2590+40
	add	r5, r5, #1
	str	r0, [r7, #4]!
	mov	r0, r4
	bl	mvc_ue_v
	ldr	r1, .L2590+44
	str	r0, [r7, #128]
	mov	r0, r4
	bl	mvc_u_1
	strb	r0, [r10, #1]!
	ldr	r3, [r9]
	cmp	r3, r5
	bcs	.L2570
	ldr	r2, .L2590+48
	mov	r1, #5
	mov	r0, r4
	str	r6, [fp, #-48]
	bl	mvc_u_v
	movw	r3, #54364
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2590+52
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-108]
	ldr	r2, .L2590+56
	mov	r1, #5
	str	r0, [r3, #1120]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #54372
	movt	r3, 4
	add	r3, r8, r3
	ldr	r2, .L2590+60
	mov	r1, #5
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	movw	r3, #54376
	movt	r3, 4
	add	r3, r8, r3
	str	r0, [r3]
	ldr	r3, [fp, #-52]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2573
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2572
.L2573:
	ldr	r1, .L2590+72
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-72]
	strb	r0, [r3]
	b	.L2572
.L2588:
	ldr	r2, .L2590+76
	mov	r1, #32
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-76]
	ldr	r2, .L2590+80
	mov	r1, #32
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r3, [fp, #-80]
	ldr	r1, .L2590+84
	str	r0, [r3]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r3, [fp, #-84]
	strb	r0, [r3]
	b	.L2563
.L2567:
	ldr	r1, .L2590+88
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2587:
	mov	r2, r0
	ldr	r1, .L2590+92
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2585
.L2591:
	.align	2
.L2590:
	.word	.LC300
	.word	.LC302
	.word	.LC303
	.word	.LC305
	.word	.LC304
	.word	.LC309
	.word	.LC310
	.word	.LC311
	.word	.LC312
	.word	.LC313
	.word	.LC314
	.word	.LC315
	.word	.LC316
	.word	.LC317
	.word	.LC318
	.word	.LC319
	.word	.LC320
	.word	.LC322
	.word	.LC321
	.word	.LC306
	.word	.LC307
	.word	.LC308
	.word	.LC197
	.word	.LC301
	UNWIND(.fnend)
	.size	MVC_ProcessSUBSPSMvcVuiExt, .-MVC_ProcessSUBSPSMvcVuiExt
	.align	2
	.global	MVC_DecSubSPS
	.type	MVC_DecSubSPS, %function
MVC_DecSubSPS:
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
	ldr	r2, .L2620
	mov	r1, #8
	mov	r4, r0
	bl	mvc_u_v
	ldr	r1, .L2620+4
	mov	r7, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2620+8
	mov	r10, r0
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2620+12
	str	r0, [fp, #-48]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2620+16
	str	r0, [fp, #-52]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2620+20
	str	r0, [fp, #-56]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r1, .L2620+24
	str	r0, [fp, #-60]
	mov	r0, r4
	bl	mvc_u_1
	ldr	r2, .L2620+28
	mov	r1, #2
	str	r0, [fp, #-64]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2620+32
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2620+36
	mov	r8, r0
	mov	r0, r4
	bl	mvc_ue_v
	ldrb	r3, [r4, #10]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r5, r0
	bne	.L2605
	cmp	r0, #31
	bhi	.L2615
	sub	r3, r7, #66
	cmp	r3, #78
	ldrls	pc, [pc, r3, asl #2]
	b	.L2595
.L2597:
	.word	.L2596
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2598
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2599
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2598
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2600
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2598
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2600
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2598
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2595
	.word	.L2600
.L2596:
	ldr	r1, .L2620+40
	mov	r0, #1
	bl	dprint_vfmw
.L2598:
	cmp	r8, #41
	bhi	.L2616
.L2601:
	movw	r3, #8500
	movw	r2, #26248
	movt	r3, 5
	movt	r2, 4
	mul	r3, r3, r5
	mov	r0, r4
	add	r9, r4, r3
	add	r6, r9, #286720
	add	r2, r9, r2
	str	r3, [fp, #-68]
	add	r1, r6, #932
	ldrb	r3, [fp, #-48]	@ zero_extendqisi2
	str	r8, [r6, #1672]
	str	r7, [r6, #1668]
	strb	r3, [r6, #933]
	ldrb	r3, [fp, #-52]	@ zero_extendqisi2
	strb	r10, [r6, #932]
	strb	r3, [r6, #934]
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	strb	r3, [r6, #935]
	ldrb	r3, [fp, #-60]	@ zero_extendqisi2
	strb	r3, [r6, #936]
	ldrb	r3, [fp, #-64]	@ zero_extendqisi2
	strb	r3, [r6, #937]
	str	r5, [r2, #4]
	bl	MVC_ProcessSPS
	ldr	r3, [fp, #-68]
	subs	r8, r0, #0
	bne	.L2617
	cmp	r7, #118
	cmpne	r7, #128
	mov	r10, #1
	strb	r10, [r6, #957]
	beq	.L2618
.L2603:
	movw	r3, #8500
	mov	r2, #1
	movt	r3, 5
	mla	r4, r3, r5, r4
	add	r4, r4, #12992
	strb	r2, [r4, #12]
.L2593:
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2616:
	mov	r2, r8
	ldr	r1, .L2620+44
	mov	r0, #1
	mov	r8, #41
	bl	dprint_vfmw
	b	.L2601
.L2618:
	ldr	r1, .L2620+48
	mov	r0, r4
	str	r3, [fp, #-48]
	bl	mvc_u_1
	ldr	r3, [fp, #-48]
	add	r9, r9, #12992
	add	r9, r9, #8
	add	r3, r4, r3
	add	r7, r3, #12992
	add	r7, r7, #12
	mov	r1, r7
	strb	r0, [r9, #5]
	mov	r0, r4
	bl	MVC_ProcessSUBSPSMvcExt
	cmp	r0, #0
	bne	.L2619
	ldr	r1, .L2620+52
	mov	r0, r4
	bl	mvc_u_1
	cmp	r0, #0
	str	r0, [r6, #928]
	beq	.L2603
	mov	r1, r7
	mov	r0, r4
	bl	MVC_ProcessSUBSPSMvcVuiExt
	cmp	r0, #0
	beq	.L2603
	mov	r0, r10
	ldr	r1, .L2620+56
	bl	dprint_vfmw
	strb	r8, [r9, #4]
	mvn	r8, #0
	b	.L2593
.L2600:
	ldr	r1, .L2620+60
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2598
.L2599:
	ldr	r1, .L2620+64
	mov	r0, #1
	bl	dprint_vfmw
	b	.L2598
.L2595:
	mov	r2, r7
	ldr	r1, .L2620+68
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	mov	r0, r8
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2605:
	mvn	r8, #0
	b	.L2593
.L2615:
	ldr	r1, .L2620+72
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L2593
.L2617:
	ldr	r1, .L2620+76
	mov	r0, #1
	bl	dprint_vfmw
	add	ip, r9, #12992
	mov	r3, #0
	mvn	r8, #0
	strb	r3, [ip, #12]
	strb	r3, [r6, #957]
	b	.L2593
.L2619:
	mov	r0, r10
	ldr	r1, .L2620+80
	bl	dprint_vfmw
	strb	r8, [r9, #4]
	mvn	r8, #0
	b	.L2593
.L2621:
	.align	2
.L2620:
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC326
	.word	.LC327
	.word	.LC328
	.word	.LC329
	.word	.LC330
	.word	.LC331
	.word	.LC332
	.word	.LC268
	.word	.LC334
	.word	.LC336
	.word	.LC338
	.word	.LC339
	.word	.LC270
	.word	.LC269
	.word	.LC333
	.word	.LC171
	.word	.LC335
	.word	.LC337
	UNWIND(.fnend)
	.size	MVC_DecSubSPS, .-MVC_DecSubSPS
	.align	2
	.global	MVC_PassBytes
	.type	MVC_PassBytes, %function
MVC_PassBytes:
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
	ldr	ip, [r0, #232]
	cmp	ip, #0
	cmpne	r1, #0
	beq	.L2631
	ldrb	r3, [ip]	@ zero_extendqisi2
	mov	r2, r3, asl #2
	mov	r5, r3, asl #5
	rsb	r4, r2, r5
	add	r4, ip, r4
	add	r6, r4, #8
	ldr	lr, [r4, #8]
	cmp	lr, #0
	beq	.L2631
	ldr	lr, [ip, #68]
	cmp	r3, #1
	cmpls	lr, #2
	bhi	.L2631
	cmp	lr, r3
	bls	.L2631
	ldr	lr, [r4, #12]
	mov	r6, r2
	ldr	r4, [r4, #24]
	mov	lr, lr, asl #3
	add	r1, r4, r1, lsl #3
	cmp	r1, lr
	bhi	.L2626
	b	.L2624
.L2627:
	ldr	r4, [r2, #24]
	ldr	r2, [r2, #12]
	rsb	lr, lr, r4
	add	r1, r1, lr
	mov	lr, r2, asl #3
	cmp	r1, lr
	bls	.L2624
.L2626:
	rsb	r2, r6, r5
	add	r3, r3, #1
	add	ip, ip, r2
	mov	r6, r3, asl #2
	mov	r5, r3, asl #5
	str	lr, [ip, #24]
	rsb	r2, r6, r5
	ldr	ip, [r0, #232]
	ldrb	r4, [ip]	@ zero_extendqisi2
	add	r4, r4, #1
	strb	r4, [ip]
	ldr	ip, [r0, #232]
	add	r2, ip, r2
	ldr	r4, [ip, #68]
	cmp	r4, r3
	bhi	.L2627
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2624:
	rsb	r2, r6, r5
	mov	r0, #1
	add	ip, ip, r2
	str	r1, [ip, #24]
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L2631:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_PassBytes, .-MVC_PassBytes
	.align	2
	.global	MVC_GetBytes
	.type	MVC_GetBytes, %function
MVC_GetBytes:
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
	beq	.L2647
	ldr	r3, [r0, #232]
	cmp	r3, #0
	cmpne	r2, #0
	beq	.L2647
	ldrb	r7, [r3]	@ zero_extendqisi2
	mov	ip, r7, asl #5
	sub	ip, ip, r7, asl #2
	add	ip, r3, ip
	ldr	ip, [ip, #8]
	cmp	ip, #0
	beq	.L2647
	ldr	ip, [r3, #68]
	cmp	r7, #1
	cmpls	ip, #2
	movhi	lr, #1
	movls	lr, #0
	bhi	.L2647
	cmp	ip, r7
	bls	.L2647
.L2642:
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
	bcs	.L2637
	ldrb	r3, [r8, r4, lsr #3]	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	r2, lr
	add	r4, r1, #1
	add	ip, ip, #1
	strb	r3, [r1]
	b	.L2649
.L2640:
	cmp	ip, r6
	mov	r1, r4
	beq	.L2637
	ldrb	r3, [ip], #1	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	r2, lr
	strb	r3, [r4], #1
.L2649:
	ldr	r3, [r0, #232]
	add	r3, r3, r5
	ldr	r1, [r3, #24]
	add	r1, r1, #8
	str	r1, [r3, #24]
	bhi	.L2640
	mov	r0, r2
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2637:
	ldr	ip, [r0, #232]
	add	r7, r7, #1
	ldrb	r3, [ip]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [ip]
	ldr	r3, [r0, #232]
	ldr	ip, [r3, #68]
	cmp	ip, r7
	bhi	.L2642
	mov	r0, lr
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L2647:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_GetBytes, .-MVC_GetBytes
	.align	2
	.global	MVC_DecFramePackingSEI
	.type	MVC_DecFramePackingSEI, %function
MVC_DecFramePackingSEI:
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
	ldr	r1, .L2657
	mov	r4, r0
	bl	mvc_ue_v
	add	r6, r4, #11075584
	add	r5, r6, #45056
	ldr	r2, .L2657+4
	mov	r1, #1
	str	r0, [r5, #2800]
	mov	r0, r4
	bl	mvc_u_v
	uxtb	r0, r0
	strb	r0, [r5, #2777]
	cmp	r0, #0
	beq	.L2656
.L2651:
	mov	r0, r4
	ldr	r2, .L2657+8
	mov	r1, #1
	add	r6, r6, #45056
	bl	mvc_u_v
	mov	r3, #1
	strb	r3, [r6, #2776]
	strb	r0, [r6, #2778]
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L2656:
	ldr	r2, .L2657+12
	mov	r1, #7
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+16
	mov	r1, #1
	str	r0, [r5, #2792]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+20
	mov	r1, #6
	strb	r0, [r5, #2779]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+24
	mov	r1, #1
	str	r0, [r5, #2796]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+28
	mov	r1, #1
	strb	r0, [r5, #2780]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+32
	mov	r1, #1
	strb	r0, [r5, #2781]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+36
	mov	r1, #1
	strb	r0, [r5, #2782]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+40
	mov	r1, #1
	strb	r0, [r5, #2783]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+44
	mov	r1, #1
	strb	r0, [r5, #2784]
	mov	r0, r4
	bl	mvc_u_v
	ldrb	r3, [r5, #2779]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r0, [r5, #2785]
	bne	.L2652
	ldr	r3, [r5, #2792]
	cmp	r3, #5
	beq	.L2652
	ldr	r2, .L2657+48
	mov	r1, #1
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+52
	mov	r1, #1
	strb	r0, [r5, #2786]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+56
	mov	r1, #1
	strb	r0, [r5, #2787]
	mov	r0, r4
	bl	mvc_u_v
	ldr	r2, .L2657+60
	mov	r1, #1
	strb	r0, [r5, #2788]
	mov	r0, r4
	bl	mvc_u_v
	strb	r0, [r5, #2789]
.L2652:
	ldr	r2, .L2657+64
	mov	r1, #8
	mov	r0, r4
	bl	mvc_u_v
	ldr	r1, .L2657+68
	str	r0, [r5, #2804]
	mov	r0, r4
	bl	mvc_ue_v
	str	r0, [r5, #2808]
	b	.L2651
.L2658:
	.align	2
.L2657:
	.word	.LC340
	.word	.LC341
	.word	.LC357
	.word	.LC342
	.word	.LC343
	.word	.LC344
	.word	.LC345
	.word	.LC346
	.word	.LC347
	.word	.LC348
	.word	.LC349
	.word	.LC350
	.word	.LC351
	.word	.LC352
	.word	.LC353
	.word	.LC354
	.word	.LC355
	.word	.LC356
	UNWIND(.fnend)
	.size	MVC_DecFramePackingSEI, .-MVC_DecFramePackingSEI
	.align	2
	.global	MVC_DecPicTimingSEI
	.type	MVC_DecPicTimingSEI, %function
MVC_DecPicTimingSEI:
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
	add	r6, r0, #11075584
	ldr	r3, [r0, #248]
	add	r2, r6, #32768
	movw	r4, #3992
	mov	r5, r0
	ldr	r2, [r2, #2728]
	mla	r4, r4, r2, r3
	ldrb	r2, [r4, #25]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2660
	ldr	ip, [r0, #36]
	cmp	ip, #0
	ble	.L2661
	ldrb	r2, [r3, #25]	@ zero_extendqisi2
	cmp	r2, #0
	addeq	r3, r3, #3984
	addeq	r3, r3, #8
	beq	.L2664
	b	.L2683
.L2665:
	ldrb	r1, [r3, #-3967]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2662
.L2664:
	add	r2, r2, #1
	mov	r4, r3
	cmp	r2, ip
	add	r3, r3, #3984
	add	r3, r3, #8
	bne	.L2665
.L2661:
	ldr	r1, .L2685
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r3, #0
.L2666:
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2683:
	mov	r4, r3
.L2662:
	cmp	r4, #0
	beq	.L2661
.L2660:
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2667
	ldrb	r3, [r4, #35]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2684
	ldr	r1, [r4, #388]
	ldr	r8, [r4, #392]
	add	r1, r1, #1
	add	r8, r8, #1
.L2670:
	ldr	r2, .L2685+4
	mov	r0, r5
	bl	mvc_u_v
	add	r7, r6, #45056
	mov	r1, r8
	ldr	r2, .L2685+8
	str	r0, [r7, #2816]
	mov	r0, r5
	bl	mvc_u_v
	str	r0, [r7, #2820]
.L2667:
	ldrb	r0, [r4, #39]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	r3, r0
	beq	.L2666
	mov	r0, r5
	ldr	r2, .L2685+12
	mov	r1, #4
	add	r6, r6, #45056
	bl	mvc_u_v
	mov	r3, #0
	strb	r0, [r6, #2812]
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L2684:
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2667
	ldr	r1, [r4, #700]
	ldr	r8, [r4, #704]
	add	r1, r1, #1
	add	r8, r8, #1
	b	.L2670
.L2686:
	.align	2
.L2685:
	.word	.LC358
	.word	.LC359
	.word	.LC360
	.word	.LC361
	UNWIND(.fnend)
	.size	MVC_DecPicTimingSEI, .-MVC_DecPicTimingSEI
	.align	2
	.global	MVC_DecSEI
	.type	MVC_DecSEI, %function
MVC_DecSEI:
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
	ldr	r2, [r0, #232]
	sub	r7, fp, #44
	mov	r3, #0
	mov	r1, #32
	mov	r4, r0
	add	r6, r0, #548
	mov	r8, r3
	strb	r3, [r7, #-1]!
	str	r1, [r2, #24]
	b	.L2690
.L2872:
	bl	BsSkip
	cmp	r5, #0
	ble	.L2689
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2871
.L2690:
	mov	r2, #1
	mov	r1, r7
	mov	r0, r4
	bl	MVC_GetBytes
	ldr	r3, [r4, #572]
	ldr	ip, [r4, #564]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r8, r8, r2
	mov	r5, r0
	mov	r0, r6
	bls	.L2872
.L2689:
	ldr	r1, .L2903
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L2692
.L2871:
	mov	r3, #0
	str	r3, [fp, #-56]
.L2826:
	mov	r5, #0
	b	.L2696
.L2874:
	bl	BsSkip
	cmp	r9, #0
	ble	.L2694
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2873
.L2696:
	mov	r2, #1
	mov	r1, r7
	mov	r0, r4
	bl	MVC_GetBytes
	ldr	r3, [r4, #572]
	ldr	ip, [r4, #564]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r5, r5, r2
	mov	r9, r0
	mov	r0, r6
	bls	.L2874
.L2694:
	ldr	r1, .L2903+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2873:
	cmp	r5, #409600
	bgt	.L2694
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #68]
	cmp	r2, #2
	ldreq	r2, [r3, #52]
	ldreq	r3, [r3, #24]
	ldrne	r2, [r3, #24]
	addeq	r2, r2, r3
	moveq	r2, r2, lsr #3
	cmp	r8, #45
	ldrls	pc, [pc, r8, asl #2]
	b	.L2699
.L2701:
	.word	.L2700
	.word	.L2702
	.word	.L2703
	.word	.L2704
	.word	.L2705
	.word	.L2706
	.word	.L2707
	.word	.L2708
	.word	.L2709
	.word	.L2710
	.word	.L2711
	.word	.L2712
	.word	.L2713
	.word	.L2714
	.word	.L2715
	.word	.L2716
	.word	.L2717
	.word	.L2718
	.word	.L2719
	.word	.L2720
	.word	.L2721
	.word	.L2722
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2699
	.word	.L2723
.L2723:
	mov	r1, r5
	mov	r0, r4
	ldr	r8, [r4, #572]
	bl	MVC_DecFramePackingSEI
	ldr	r2, [r4, #572]
	mov	r9, r5, asl #3
	rsb	r3, r8, r2
	cmp	r3, r9
	bge	.L2812
	rsb	r9, r3, r9
	ldr	r3, [r4, #564]
	cmp	r9, #0
	add	r8, r9, #7
	movge	r8, r9
	mov	r8, r8, asr #3
	cmp	r8, #0
	movle	r3, r3, asl #3
	ble	.L2814
	add	r1, r2, #8
	mov	r3, r3, asl #3
	cmp	r1, r3
	bhi	.L2814
	mov	r10, #0
	b	.L2815
.L2816:
	add	r1, r2, #8
	cmp	r1, r3
	bhi	.L2814
.L2815:
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	add	r10, r10, #1
	ldr	r3, [r4, #564]
	cmp	r10, r8
	ldr	r2, [r4, #572]
	mov	r3, r3, asl #3
	bne	.L2816
.L2814:
	mov	r1, r9, asr #31
	mov	r0, r1, lsr #29
	add	r1, r9, r0
	and	r1, r1, #7
	rsb	r1, r0, r1
	add	r2, r2, r1
	cmp	r3, r2
	bcs	.L2875
.L2812:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2876
.L2725:
	ldr	r3, [r4, #60]
	cmp	r3, #3
	bhi	.L2877
.L2821:
	mov	r8, #0
	b	.L2825
.L2823:
	bl	BsSkip
	cmp	r5, #0
	ble	.L2824
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2878
.L2825:
	mov	r2, #1
	mov	r1, r7
	mov	r0, r4
	bl	MVC_GetBytes
	ldr	r3, [r4, #572]
	ldr	ip, [r4, #564]
	mov	r1, #8
	add	r3, r3, r1
	ldrb	r2, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, ip, asl #3
	add	r8, r8, r2
	mov	r5, r0
	mov	r0, r6
	bls	.L2823
.L2824:
	mov	r0, #0
.L2692:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2722:
	mov	r3, r5
	ldr	r1, .L2903+8
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2879
.L2808:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2809
.L2810:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2809:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2810
	ldr	r3, [r4, #60]
	cmp	r3, #3
	bls	.L2821
.L2877:
	ldr	r1, .L2903+12
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2721:
	mov	r3, r5
	ldr	r1, .L2903+16
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2880
.L2805:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2806
.L2807:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2806:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2807
	b	.L2725
.L2720:
	mov	r3, r5
	ldr	r1, .L2903+20
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2881
.L2802:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2803
.L2804:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2803:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2804
	b	.L2725
.L2718:
	mov	r3, r5
	ldr	r1, .L2903+24
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2882
.L2796:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2797
.L2798:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2797:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2798
	b	.L2725
.L2719:
	mov	r3, r5
	ldr	r1, .L2903+28
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2883
.L2799:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2800
.L2801:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2800:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2801
	b	.L2725
.L2717:
	mov	r3, r5
	ldr	r1, .L2903+32
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2884
.L2793:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2794
.L2795:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2794:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2795
	b	.L2725
.L2716:
	mov	r3, r5
	ldr	r1, .L2903+36
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2885
.L2790:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2791
.L2792:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2791:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2792
	b	.L2725
.L2708:
	mov	r3, r5
	ldr	r1, .L2903+40
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2886
.L2766:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2767
.L2768:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2767:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2768
	b	.L2725
.L2712:
	mov	r3, r5
	ldr	r1, .L2903+44
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2887
.L2778:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2779
.L2780:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2779:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2780
	b	.L2725
.L2703:
	mov	r3, r5
	ldr	r1, .L2903+48
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2888
.L2735:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2736
.L2737:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2736:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2737
	b	.L2725
.L2714:
	mov	r3, r5
	ldr	r1, .L2903+52
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2889
.L2784:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2785
.L2786:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2785:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2786
	b	.L2725
.L2706:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	bne	.L2705
	mov	r3, r5
	ldr	r1, .L2903+56
	mov	r0, #20
	bl	dprint_vfmw
.L2742:
	ldr	r0, [r4, #120]
	ldr	r8, [r4, #60]
	bl	GetUsd
	add	r8, r8, #132
	str	r0, [r4, r8, asl #2]
	ldr	r3, [r4, #60]
	add	r3, r3, #132
	ldr	r1, [r4, r3, asl #2]
	cmp	r1, #0
	beq	.L2829
	ldr	r2, [r4, #232]
	cmp	r5, #1024
	movlt	r10, r5
	movge	r10, #1024
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	ip, [r2, #68]
	cmp	r0, ip
	bcs	.L2830
	sxth	r3, r0
	mov	r8, #0
	mov	lr, r3, asl #5
	sub	r3, lr, r3, asl #2
	add	r2, r2, r3
.L2744:
	ldr	r3, [r2, #24]
	add	r0, r0, #1
	ldr	lr, [r2, #12]
	cmp	r0, ip
	add	r3, r3, #7
	add	r2, r2, #28
	sub	r3, lr, r3, lsr #3
	add	r8, r8, r3
	bne	.L2744
	mov	r2, r8
.L2743:
	ldrsb	r3, [fp, #-56]
	cmp	r2, r10
	movge	r8, r10
	cmp	r3, #1
	movne	r3, #0
	movne	r9, r3
	beq	.L2890
.L2746:
	rsb	r2, r3, r8
	mov	r0, r4
	bl	MVC_GetBytes
	subs	r8, r0, #0
	ble	.L2891
	rsb	r3, r9, r10
	cmp	r8, r3
	ldr	r3, [r4, #60]
	blt	.L2892
	add	r3, r3, #132
	cmp	r10, r5
	rsb	r9, r9, r5
	ldr	r3, [r4, r3, asl #2]
	str	r9, [r3, #1052]
	bcc	.L2893
.L2757:
	cmp	r9, #0
	ble	.L2752
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2752
	mov	r5, #0
	b	.L2759
.L2760:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2752
.L2759:
	add	r5, r5, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r9
	bne	.L2760
.L2752:
	ldr	r3, [r4, #60]
	mov	r2, #8
	ldr	r1, [r4, #224]
	add	r3, r3, #132
	ldr	ip, .L2903+60
	ldr	r3, [r4, r3, asl #2]
	ldrd	r0, [r1, #56]
	add	r3, r3, #1056
	ldr	ip, [ip]
	strd	r0, [r3]
	cmp	ip, #0
	ldr	r3, [r4, #60]
	add	r3, r3, #132
	ldr	r3, [r4, r3, asl #2]
	str	r2, [r3, #1040]
	ldr	r3, [r4, #60]
	ldr	r2, [r4, #84]
	add	r3, r3, #132
	ldr	r3, [r4, r3, asl #2]
	str	r2, [r3, #1044]
	beq	.L2725
	ldr	r2, [r4, #60]
	movw	r3, #1064
	mov	r1, #6
	ldr	r0, [r4, #120]
	add	r2, r2, #132
	ldr	r2, [r4, r2, asl #2]
	blx	ip
	b	.L2725
.L2710:
	mov	r3, r5
	ldr	r1, .L2903+64
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2894
.L2772:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2773
.L2774:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2773:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2774
	b	.L2725
.L2709:
	mov	r3, r5
	ldr	r1, .L2903+68
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2895
.L2769:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2770
.L2771:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2770:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2771
	b	.L2725
.L2711:
	mov	r3, r5
	ldr	r1, .L2903+72
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2896
.L2775:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2776
.L2777:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2776:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2777
	b	.L2725
.L2700:
	mov	r3, r5
	ldr	r1, .L2903+76
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2897
.L2724:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2726
.L2727:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2726:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2727
	b	.L2725
.L2715:
	mov	r3, r5
	ldr	r1, .L2903+80
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2898
.L2787:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2788
.L2789:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2788:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2789
	b	.L2725
.L2707:
	mov	r3, r5
	ldr	r1, .L2903+84
	mov	r0, #20
	bl	dprint_vfmw
	cmp	r5, #0
	ble	.L2763
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2763
	mov	r8, #0
	b	.L2764
.L2765:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2763
.L2764:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2765
.L2763:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	bge	.L2725
	movw	r3, #12442
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2725
.L2713:
	mov	r3, r5
	ldr	r1, .L2903+88
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2899
.L2781:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2782
.L2783:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2782:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2783
	b	.L2725
.L2702:
	mov	r3, r5
	ldr	r1, .L2903+92
	mov	r0, #20
	mov	r9, r5, asl #3
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	ldr	r8, [r4, #572]
	bl	MVC_DecPicTimingSEI
	ldr	r2, [r4, #572]
	rsb	r3, r8, r2
	cmp	r3, r9
	bge	.L2729
	rsb	r9, r3, r9
	ldr	r3, [r4, #564]
	cmp	r9, #0
	add	r8, r9, #7
	movge	r8, r9
	mov	r8, r8, asr #3
	cmp	r8, #0
	movle	r3, r3, asl #3
	ble	.L2731
	add	r1, r2, #8
	mov	r3, r3, asl #3
	cmp	r1, r3
	bhi	.L2731
	mov	r10, #0
	b	.L2732
.L2733:
	add	r1, r2, #8
	cmp	r1, r3
	bhi	.L2731
.L2732:
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	add	r10, r10, #1
	ldr	r3, [r4, #564]
	cmp	r10, r8
	ldr	r2, [r4, #572]
	mov	r3, r3, asl #3
	bne	.L2733
.L2731:
	mov	r1, r9, asr #31
	mov	r0, r1, lsr #29
	add	r1, r9, r0
	and	r1, r1, #7
	rsb	r1, r0, r1
	add	r2, r2, r1
	cmp	r3, r2
	bcs	.L2900
.L2729:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	bge	.L2725
	movw	r3, #12216
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2725
.L2704:
	mov	r3, r5
	ldr	r1, .L2903+96
	mov	r0, #20
	bl	dprint_vfmw
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2901
.L2738:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2739
.L2740:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2739:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2740
	b	.L2725
.L2699:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	blt	.L2902
.L2818:
	cmp	r5, #0
	ble	.L2725
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
	mov	r8, #0
	b	.L2819
.L2820:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2725
.L2819:
	add	r8, r8, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2820
	b	.L2725
.L2878:
	cmp	r3, #128
	bne	.L2826
	b	.L2824
.L2705:
	mov	r3, r5
	ldr	r1, .L2903+100
	mov	r0, #20
	bl	dprint_vfmw
	mov	r3, #1
	str	r3, [fp, #-56]
	b	.L2742
.L2892:
	add	r3, r3, #132
	ldr	r3, [r4, r3, asl #2]
	str	r8, [r3, #1052]
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2752
	mov	r5, #0
	b	.L2753
.L2755:
	ldr	r3, [r4, #572]
	ldr	r2, [r4, #564]
	add	r3, r3, #8
	cmp	r3, r2, asl #3
	bhi	.L2752
.L2753:
	add	r5, r5, #1
	mov	r1, #8
	mov	r0, r6
	bl	BsSkip
	cmp	r5, r8
	bne	.L2755
	b	.L2752
.L2904:
	.align	2
.L2903:
	.word	.LC362
	.word	.LC363
	.word	.LC390
	.word	.LC391
	.word	.LC389
	.word	.LC388
	.word	.LC386
	.word	.LC387
	.word	.LC385
	.word	.LC384
	.word	.LC376
	.word	.LC380
	.word	.LC367
	.word	.LC382
	.word	.LC370
	.word	g_event_report
	.word	.LC378
	.word	.LC377
	.word	.LC379
	.word	.LC364
	.word	.LC383
	.word	.LC375
	.word	.LC381
	.word	.LC366
	.word	.LC368
	.word	.LC369
	.word	.LC371
	.word	.LC373
	.word	.LANCHOR0+236
	.word	.LC365
	.word	.LC372
	.word	.LC374
.L2890:
	strb	r3, [r1, #1026]
	mov	r0, r4
	ldr	r3, [r4, #60]
	mov	r1, #8
	ldr	r2, .L2903+104
	add	r3, r3, #132
	ldr	r9, [r4, r3, asl #2]
	bl	mvc_u_v
	strb	r0, [r9, #1027]
	ldr	r3, [r4, #60]
	add	r3, r3, #132
	ldr	ip, [r4, r3, asl #2]
	ldrb	r3, [ip, #1027]	@ zero_extendqisi2
	cmp	r3, #255
	beq	.L2747
	mov	r3, #3
	mov	r2, #0
	mov	r9, r3
	strb	r2, [ip, #1028]
.L2748:
	ldr	ip, [r4, #60]
	mov	r1, #16
	ldr	r2, .L2903+108
	mov	r0, r4
	add	ip, ip, #132
	str	r3, [fp, #-60]
	ldr	ip, [r4, ip, asl #2]
	str	ip, [fp, #-64]
	bl	mvc_u_v
	ldr	ip, [fp, #-64]
	ldr	r3, [fp, #-60]
	add	ip, ip, #1024
	mov	r1, r3
	strh	r0, [ip, #6]	@ movhi
	mov	r0, r4
	bl	MVC_PassBytes
	ldr	r3, [fp, #-60]
	cmp	r8, r3
	beq	.L2752
	ldr	r2, [r4, #60]
	add	r2, r2, #132
	ldr	r1, [r4, r2, asl #2]
	b	.L2746
.L2885:
	movw	r3, #12662
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2790
.L2886:
	movw	r3, #12454
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2766
.L2887:
	movw	r3, #12558
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2778
.L2888:
	movw	r3, #12228
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2735
.L2889:
	movw	r3, #12610
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2784
.L2881:
	movw	r3, #12766
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2802
.L2882:
	movw	r3, #12714
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2796
.L2883:
	movw	r3, #12740
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2799
.L2884:
	movw	r3, #12688
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2793
.L2879:
	movw	r3, #12818
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2808
.L2880:
	movw	r3, #12792
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2805
.L2895:
	mov	r3, #12480
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2769
.L2896:
	movw	r3, #12532
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2775
.L2897:
	movw	r3, #12163
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2724
.L2898:
	movw	r3, #12636
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2787
.L2894:
	movw	r3, #12506
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2772
.L2899:
	movw	r3, #12584
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2781
.L2901:
	movw	r3, #12254
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2738
.L2876:
	movw	r3, #12870
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2725
.L2902:
	movw	r3, #12882
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2818
.L2900:
	mov	r0, r6
	bl	BsSkip
	b	.L2729
.L2875:
	mov	r0, r6
	bl	BsSkip
	b	.L2812
.L2893:
	rsb	r1, r10, r5
	mov	r0, r4
	bl	MVC_PassBytes
	cmp	r0, #0
	bge	.L2757
	movw	r3, #12390
	ldr	r2, .L2903+112
	ldr	r1, .L2903+116
	mov	r0, #20
	bl	dprint_vfmw
	b	.L2757
.L2830:
	mov	r2, #0
	mov	r8, r2
	b	.L2743
.L2747:
	ldr	r2, .L2903+120
	mov	r1, #8
	mov	r0, r4
	mov	r3, #4
	str	ip, [fp, #-64]
	str	r3, [fp, #-60]
	bl	mvc_u_v
	ldr	r3, [fp, #-60]
	ldr	ip, [fp, #-64]
	mov	r9, r3
	strb	r0, [ip, #1028]
	b	.L2748
.L2829:
	mvn	r0, #0
	b	.L2692
.L2891:
	ldr	r1, .L2903+124
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #60]
	ldr	r0, [r4, #120]
	add	r3, r3, #132
	ldr	r1, [r4, r3, asl #2]
	bl	FreeUsdByDec
	ldr	r3, [r4, #60]
	mov	r2, #0
	mvn	r0, #0
	add	r3, r3, #132
	str	r2, [r4, r3, asl #2]
	b	.L2692
	UNWIND(.fnend)
	.size	MVC_DecSEI, .-MVC_DecSEI
	.align	2
	.global	MVC_InitOldSlice
	.type	MVC_InitOldSlice, %function
MVC_InitOldSlice:
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
	ldr	r1, [r0, #40]
	add	r3, r0, #11075584
	add	r3, r3, #40960
	movw	r2, #23352
	movt	r2, 1
	mov	r0, #2
	str	r1, [r3, #2828]
	mov	r1, #7
	str	r2, [r3, #2832]
	mov	r2, #32
	strb	r1, [r3, #2819]
	mov	r1, #3
	strb	r2, [r3, #2818]
	mvn	r2, #0
	str	r1, [r3, #2840]
	mov	r1, #262144
	str	r2, [r3, #2844]
	mov	r2, #0
	strb	r0, [r3, #2817]
	str	r1, [r3, #2856]
	strb	r2, [r3, #2816]
	str	r2, [r3, #2848]
	str	r2, [r3, #2852]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_InitOldSlice, .-MVC_InitOldSlice
	.align	2
	.global	MVC_IsNewPicNal
	.type	MVC_IsNewPicNal, %function
MVC_IsNewPicNal:
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
	b	.L2914
.L2909:
	.word	.L2908
	.word	.L2914
	.word	.L2914
	.word	.L2914
	.word	.L2908
	.word	.L2914
	.word	.L2910
	.word	.L2910
.L2910:
	ldr	r3, [r0]
	mov	r2, #1
	str	r2, [r0]
	adds	r3, r3, #0
	movne	r3, #1
	rsb	r0, r3, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2908:
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L2911
.L2913:
	mvn	r0, #0
.L2912:
	mov	r2, #0
	str	r2, [r5]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2914:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2911:
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
	bhi	.L2913
	mov	r3, r0, asl #1
	rsb	r3, r3, #31
	mov	r3, r4, lsr r3
	subs	r0, r3, #1
	mvnne	r0, #0
	b	.L2912
	UNWIND(.fnend)
	.size	MVC_IsNewPicNal, .-MVC_IsNewPicNal
	.align	2
	.global	MVC_FindZeroBitsInSeg
	.type	MVC_FindZeroBitsInSeg, %function
MVC_FindZeroBitsInSeg:
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
	ble	.L2941
	ldr	r3, [fp, #-48]
	subs	r7, r3, #0
	add	r8, r3, #63
	movge	r8, r3
	ands	r3, r3, #63
	movne	r3, #1
	add	r8, r3, r8, asr #6
	cmp	r8, #0
	ble	.L2929
	ldr	r5, .L2942
	ldr	r10, .L2942+4
.L2927:
	cmp	r7, #64
	ldr	r3, [r10, #52]
	ldr	r0, .L2942
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
	bne	.L2919
	ldr	r2, .L2942
	add	r4, r4, #1
	cmp	r3, r2
	bne	.L2922
	b	.L2920
.L2923:
	cmp	r3, r5
	add	r4, r4, #1
	beq	.L2920
.L2922:
	ldrb	r2, [r3, #-1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2923
.L2919:
	mov	r0, r4, asl #3
.L2918:
	ldr	r3, [fp, #-48]
	cmp	r4, r3
	bge	.L2931
	sub	r3, r3, #1
	rsb	r4, r4, r3
	ldrb	r2, [r9, r4]	@ zero_extendqisi2
	tst	r2, #1
	moveq	r2, r2, lsr #1
	moveq	r3, #1
	bne	.L2931
.L2926:
	tst	r2, #1
	mov	r2, r2, lsr #1
	bne	.L2924
	add	r3, r3, #1
	cmp	r3, #8
	bne	.L2926
	b	.L2924
.L2920:
	subs	r8, r8, #1
	sub	r7, r7, #64
	bne	.L2927
	b	.L2919
.L2931:
	mov	r3, #0
.L2924:
	add	r0, r3, r0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2941:
	mov	r2, r1
	mov	r0, #0
	ldr	r1, .L2942+8
	bl	dprint_vfmw
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L2929:
	mov	r0, r4
	b	.L2918
.L2943:
	.align	2
.L2942:
	.word	.LANCHOR3-1952
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC392
	UNWIND(.fnend)
	.size	MVC_FindZeroBitsInSeg, .-MVC_FindZeroBitsInSeg
	.align	2
	.global	MVC_FindTrailZeros
	.type	MVC_FindTrailZeros, %function
MVC_FindTrailZeros:
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
	beq	.L2950
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2949
	ldr	r1, [r3, #40]
	ldr	r0, [r3, #36]
	bl	MVC_FindZeroBitsInSeg
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #40]
	cmp	r0, r2, asl #3
	bcs	.L2953
	cmn	r0, #1
	beq	.L2949
.L2948:
	add	r0, r0, #1
	str	r0, [r3, #72]
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #68]
	cmp	r2, #1
	bls	.L2952
	ldr	r1, [r3, #40]
	ldr	r2, [r3, #72]
	cmp	r2, r1, asl #3
	bcs	.L2954
.L2952:
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2954:
	ldr	r1, [r3, #60]
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r2, [r4, #232]
	mov	r3, #0
	mov	r1, #1
	mov	r0, r3
	str	r3, [r2, #36]
	ldr	r2, [r4, #232]
	str	r1, [r2, #68]
	ldr	r2, [r4, #232]
	str	r3, [r2, #72]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L2953:
	ldr	r1, [r3, #60]
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r4, #232]
	mov	r1, #0
	mov	r2, #1
	str	r1, [r3, #36]
	ldr	r3, [r4, #232]
	str	r2, [r3, #68]
	ldr	r3, [r4, #232]
.L2949:
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #8]
	bl	MVC_FindZeroBitsInSeg
	ldr	r3, [r4, #232]
	b	.L2948
.L2950:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_FindTrailZeros, .-MVC_FindTrailZeros
	.align	2
	.global	MVC_CombinePacket
	.type	MVC_CombinePacket, %function
MVC_CombinePacket:
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
	ldr	r3, [r0, #232]
	ldr	r3, [r3, #12]
	cmp	r3, #4096
	ldmcsfd	sp, {fp, sp, pc}
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_CombinePacket.part.12
	UNWIND(.fnend)
	.size	MVC_CombinePacket, .-MVC_CombinePacket
	.align	2
	.global	MVC_FindNaluArraySlot
	.type	MVC_FindNaluArraySlot, %function
MVC_FindNaluArraySlot:
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
	ldrb	r2, [r0, #937]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2962
	mov	r2, r0
	mov	r3, #1
	b	.L2960
.L2959:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L2965
.L2960:
	ldrb	r1, [r2, #1025]	@ zero_extendqisi2
	add	r2, r2, #88
	cmp	r1, #0
	bne	.L2959
	mov	r2, r3
.L2958:
	mov	ip, #88
	mov	r1, #1
	mla	r3, ip, r3, r0
	mov	r0, r2
	strb	r1, [r3, #937]
	ldmfd	sp, {fp, sp, pc}
.L2965:
	mvn	r2, #0
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L2962:
	mov	r3, r2
	b	.L2958
	UNWIND(.fnend)
	.size	MVC_FindNaluArraySlot, .-MVC_FindNaluArraySlot
	.align	2
	.global	MVC_InquireSliceProperty
	.type	MVC_InquireSliceProperty, %function
MVC_InquireSliceProperty:
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
	ldr	r3, [r0, #68]
	mov	r4, r0
	mov	r9, r1
	mov	r7, r2
	ldr	r1, .L3009
	sub	r2, r3, #1
	mov	r0, #22
	add	r6, r4, #11075584
	bl	dprint_vfmw
	mov	r3, #0
	str	r3, [r7]
	add	r5, r6, #40960
	str	r3, [r9]
	add	r1, r4, #12288
	ldr	r2, [r4, #232]
	mvn	ip, #0
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	strb	r0, [r5, #1163]
	ldrb	lr, [r2, #4]	@ zero_extendqisi2
	strb	lr, [r5, #1168]
	ldrb	r2, [r2, #5]	@ zero_extendqisi2
	strb	r3, [r5, #1171]
	str	ip, [r5, #2800]
	strb	r2, [r5, #1172]
	ldrb	r3, [r1, #704]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3002
	cmp	r2, #255
	beq	.L3003
.L2968:
	mov	r0, r4
	bl	MVC_SliceCheck
	subs	r8, r0, #0
	bne	.L2984
	mov	r0, r4
	bl	MVC_ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L3004
	ldrb	r3, [r5, #1165]	@ zero_extendqisi2
	mov	ip, #2240
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	str	r3, [r9]
	ldrb	r1, [r5, #1172]	@ zero_extendqisi2
	ldr	r3, [r5, #1176]
	ldr	r0, [r4, #252]
	sxtb	r2, r1
	cmn	r2, #1
	mla	r3, ip, r3, r0
	beq	.L3005
	cmp	r1, #0
	bne	.L2980
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldr	r3, [r3, #28]
	cmp	r2, #1
	beq	.L3006
	ldr	r2, [r4, #28]
	cmp	r2, r3
	movweq	r3, #35364
	movteq	r3, 168
	addeq	r3, r4, r3
	bne	.L3007
.L2979:
	ldrb	r2, [r3, #20]	@ zero_extendqisi2
	add	r6, r6, #45056
	ldr	r0, [r3, #3952]
	rsb	r1, r2, #2
	ldr	r2, [r3, #3948]
	ldr	ip, [r4, #16]
	mla	r1, r0, r1, r1
	ldr	r0, [r4, #12]
	add	r2, r2, #1
	cmp	r0, r2
	cmpeq	ip, r1
	movne	r2, #1
	strne	r2, [r7]
	ldr	r2, [r3, #3972]
	ldr	r3, [r6, #3016]
	add	r3, r3, #1
	cmp	r2, r3
	movhi	r3, #1
	strhi	r3, [r7]
.L2976:
	mov	r0, r8
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3002:
	strb	r3, [r5, #1171]
	ldr	r3, [r1, #712]
	str	r3, [r5, #2800]
	ldrb	r3, [r1, #708]	@ zero_extendqisi2
	strb	r3, [r5, #1169]
	ldrb	r3, [r1, #709]	@ zero_extendqisi2
	strb	r3, [r5, #1170]
	b	.L2968
.L3005:
	ldr	r3, [r3, #28]
	movw	r1, #3992
	ldr	r2, [r4, #248]
	mla	r3, r1, r3, r2
	b	.L2979
.L3003:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L2968
	add	r3, r4, #10747904
	add	r3, r3, #20480
	ldr	r2, [r3, #2384]
	cmp	r2, #0
	bne	.L2971
	ldrb	r2, [r3, #2380]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2971
	add	r3, r4, #12992
	add	r3, r3, #16
.L2974:
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L2972
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L3008
.L2972:
	add	r2, r2, #1
	add	r3, r3, #335872
	cmp	r2, #32
	add	r3, r3, #308
	bne	.L2974
	mvn	r3, #0
	b	.L3001
.L3006:
	movw	r2, #8500
	movt	r2, 5
	mla	r3, r2, r3, r4
	add	r3, r3, #286720
	add	r3, r3, #932
	b	.L2979
.L2971:
	ldr	r3, [r3, #2388]
.L3001:
	cmn	r3, #1
	str	r3, [r5, #2800]
	beq	.L2968
	sub	r0, r0, #5
	mov	r3, #1
	clz	r0, r0
	strb	r3, [r5, #1171]
	strb	r3, [r5, #1170]
	mov	r0, r0, lsr #5
	strb	r0, [r5, #1169]
	b	.L2968
.L2984:
	mvn	r8, #0
	b	.L2976
.L3007:
	ldr	r1, .L3009+4
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L2976
.L3004:
	ldr	r1, .L3009+8
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r8, #0
	b	.L2976
.L2980:
	ldr	r1, .L3009+12
	mov	r0, #1
	mvn	r8, #0
	bl	dprint_vfmw
	b	.L2976
.L3008:
	movw	r3, #8500
	movt	r3, 5
	mla	r3, r3, r2, r4
	add	r3, r3, #12992
	add	r3, r3, #16
	ldr	r3, [r3, #4]
	b	.L3001
.L3010:
	.align	2
.L3009:
	.word	.LC393
	.word	.LC31
	.word	.LC394
	.word	.LC395
	UNWIND(.fnend)
	.size	MVC_InquireSliceProperty, .-MVC_InquireSliceProperty
	.align	2
	.global	MVC_HaveSliceToDec
	.type	MVC_HaveSliceToDec, %function
MVC_HaveSliceToDec:
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
	ldr	r0, [r0, #64]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_HaveSliceToDec, .-MVC_HaveSliceToDec
	.align	2
	.global	MVC_IsRefListWrong
	.type	MVC_IsRefListWrong, %function
MVC_IsRefListWrong:
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
	add	r5, r0, #11075584
	mov	r7, r0
	add	r5, r5, #40960
	ldr	r3, [r5, #1208]
	cmp	r3, #0
	beq	.L3013
	add	r6, r0, #252
	mov	r4, #0
	b	.L3017
.L3014:
	ldr	r3, [r0, #680]
	cmp	r3, #0
	beq	.L3016
	ldr	r3, [r5, #1208]
	cmp	r4, r3
	bcs	.L3039
.L3017:
	ldr	r3, [r6, #4]!
	add	r4, r4, #1
	ldr	r0, [r7, #120]
	ldr	r3, [r3, #4]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L3014
.L3016:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3039:
	cmp	r3, #0
	beq	.L3013
	ldr	r3, [r5, #1212]
	cmp	r3, #0
	addne	r6, r7, #384
	movne	r4, #0
	bne	.L3020
	b	.L3013
.L3040:
	ldr	r3, [r0, #680]
	cmp	r3, #0
	beq	.L3016
	ldr	r3, [r5, #1212]
	cmp	r4, r3
	bcs	.L3013
.L3020:
	ldr	r3, [r6, #4]!
	add	r4, r4, #1
	ldr	r0, [r7, #120]
	ldr	r3, [r3, #4]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	bne	.L3040
	b	.L3016
.L3013:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_IsRefListWrong, .-MVC_IsRefListWrong
	.align	2
	.global	MVC_DEC_Destroy
	.type	MVC_DEC_Destroy, %function
MVC_DEC_Destroy:
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
	mov	r5, r0
	bl	MVC_ClearCurrPic
	mov	r0, r5
	bl	MVC_ClearAllNal
	ldr	r3, [r5, #60]
	cmp	r3, #0
	beq	.L3042
	mov	r4, #0
	add	r6, r5, #524
	mov	r7, r4
.L3044:
	ldr	r1, [r6, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3043
	ldr	r0, [r5, #120]
	bl	FreeUsdByDec
	str	r7, [r6]
.L3043:
	ldr	r3, [r5, #60]
	cmp	r3, r4
	bhi	.L3044
.L3042:
	movw	r9, #49136
	movw	r8, #17520
	movt	r9, 169
	movt	r8, 170
	add	r9, r5, r9
	add	r8, r5, r8
	mov	r6, #0
	mov	r7, #0
.L3048:
	sub	r4, r9, #32
.L3046:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L3060
.L3045:
	cmp	r4, r9
	bne	.L3046
	add	r9, r4, #848
	cmp	r9, r8
	bne	.L3048
	ldr	r1, .L3061
	mov	r0, #2
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	dprint_vfmw
.L3060:
	mov	r1, r2
	ldr	r0, [r5, #120]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L3045
.L3062:
	.align	2
.L3061:
	.word	.LC396
	UNWIND(.fnend)
	.size	MVC_DEC_Destroy, .-MVC_DEC_Destroy
	.align	2
	.global	MVC_DEC_RecycleImage
	.type	MVC_DEC_RecycleImage, %function
MVC_DEC_RecycleImage:
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
	mov	r5, r0
	mov	r8, r1
	mov	r0, #2
	ldr	r1, .L3074
	bl	dprint_vfmw
	mov	r1, r8
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L3068
	ldrsb	r3, [r0, #1]
	cmp	r3, #0
	beq	.L3068
	add	r4, r0, #600
	add	r9, r0, #632
	mov	r6, #0
	mov	r7, #0
.L3066:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L3073
.L3065:
	cmp	r4, r9
	bne	.L3066
	ldr	r0, [r5, #120]
	mov	r1, r8
	mov	r2, #0
	bl	FSP_SetDisplay
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3073:
	mov	r1, r2
	ldr	r0, [r5, #120]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L3065
.L3068:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3075:
	.align	2
.L3074:
	.word	.LC397
	UNWIND(.fnend)
	.size	MVC_DEC_RecycleImage, .-MVC_DEC_RecycleImage
	.align	2
	.global	MVC_OutputFrmToVO
	.type	MVC_OutputFrmToVO, %function
MVC_OutputFrmToVO:
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
	clz	r5, r1
	mov	r7, r2
	mov	r6, r1
	mov	r5, r5, lsr #5
	mov	r4, r0
	cmp	r0, #0
	movne	ip, r5
	orreq	ip, r5, #1
	cmp	ip, #0
	bne	.L3110
	ldr	r3, [r0, #224]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	ble	.L3079
	ldrb	r3, [r0, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3079
	ldr	r3, [r0, #520]
	cmp	r3, #0
	strneb	ip, [r3, #2]
	movne	r0, #1
	strne	ip, [r4, #520]
	beq	.L3081
.L3109:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3079:
	mov	r1, r6
	mov	r0, r4
	bl	MVC_CheckFrameStore
	cmn	r0, #3
	beq	.L3081
	ldr	r1, [r4, #520]
	cmp	r1, #0
	beq	.L3083
	mov	r0, r4
	bl	MVC_GetImagePara
	ldr	r1, [r4, #520]
	mov	r0, r4
	bl	MVC_CheckFrameStore
	subs	r8, r0, #0
	beq	.L3111
	cmn	r8, #3
	beq	.L3091
	mov	r3, r8
	movw	r2, #1934
	ldr	r1, .L3119
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, [r4, #520]
	mov	r0, r4
	sub	r8, r8, #1
	clz	r8, r8
	ldr	r1, [r3, #252]
	bl	MVC_DEC_RecycleImage
	mov	r8, r8, lsr #5
.L3090:
	ldr	r3, [r4, #520]
	tst	r8, r5
	mov	r0, #0
	strb	r0, [r3, #2]
	str	r0, [r4, #520]
	bne	.L3109
.L3083:
	mov	r1, r6
	mov	r0, r4
	bl	MVC_GetImagePara
	mov	r1, r6
	mov	r0, r4
	bl	MVC_CheckFrameStore
	subs	r3, r0, #0
	beq	.L3112
	movw	r2, #1983
	ldr	r1, .L3119
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r6, #252]
	mov	r0, r4
	bl	MVC_DEC_RecycleImage
	mov	r0, #2
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3110:
	mov	r3, r1
	mov	r2, r0
	ldr	r1, .L3119+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, #2
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L3081:
	mov	r0, #1
	b	.L3109
.L3112:
	mov	r2, #1
	ldrsb	r1, [r6, #6]
	ldr	r0, [r4, #120]
	bl	FSP_SetDisplay
	ldrsb	r1, [r6, #6]
	ldr	r0, [r4, #120]
	bl	FSP_GetFsImagePtr
	subs	r5, r0, #0
	beq	.L3113
	cmp	r7, #1
	add	r3, r4, #584
	streq	r7, [r5, #212]
	mov	r2, r4
	ldr	r0, [r4, #120]
	mov	r1, #15
	str	r5, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L3114
	ldr	r3, [r4, #224]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r5, #24]
	bcs	.L3115
.L3098:
	ldr	r2, [r4, #144]
	mov	r0, #0
	ldr	r3, [r4, #136]
	add	r2, r2, #1
	str	r2, [r4, #144]
	add	r3, r3, #2
	str	r3, [r4, #136]
	b	.L3109
.L3114:
	mov	r2, r0
	ldr	r1, .L3119+8
	mov	r0, #0
	bl	dprint_vfmw
	ldrsb	r1, [r6, #6]
	mov	r2, #0
	ldr	r0, [r4, #120]
	bl	FSP_SetDisplay
	mov	r0, r4
	mov	r1, #1
	bl	MVC_ClearAll
	mvn	r0, #0
	b	.L3109
.L3091:
	ldr	r2, [r4, #520]
	mov	r3, #0
	strb	r3, [r2, #2]
	str	r3, [r4, #520]
	b	.L3083
.L3111:
	ldr	r3, [r4, #520]
	mov	r2, #1
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	ldr	r3, [r4, #520]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetFsImagePtr
	subs	r8, r0, #0
	beq	.L3116
	ldr	r3, [r4, #520]
	mov	r2, r4
	mov	r1, #15
	cmp	r6, r3
	cmpeq	r7, #1
	moveq	r3, #1
	streq	r3, [r8, #212]
	add	r3, r4, #584
	ldr	r0, [r4, #120]
	str	r8, [sp]
	bl	InsertImgToVoQueue
	cmp	r0, #1
	bne	.L3117
	ldr	r3, [r4, #224]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r8, #24]
	bcs	.L3118
.L3089:
	ldr	r2, [r4, #144]
	mov	r8, #1
	ldr	r3, [r4, #136]
	add	r2, r2, r8
	str	r2, [r4, #144]
	add	r3, r3, #2
	str	r3, [r4, #136]
	b	.L3090
.L3115:
	mov	r1, r5
	mov	r0, r4
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L3098
.L3118:
	mov	r1, r8
	mov	r0, r4
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L3089
.L3117:
	mov	r2, r0
	ldr	r1, .L3119+8
	mov	r0, #0
	mov	r5, r0
	bl	dprint_vfmw
	ldr	r3, [r4, #520]
	mov	r2, r5
	strb	r5, [r3, #2]
	ldr	r3, [r4, #520]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	str	r5, [r4, #520]
	mov	r0, r4
	mov	r1, #1
	bl	MVC_ClearAll
	mvn	r0, #0
	b	.L3109
.L3113:
	movw	r2, #1957
	ldr	r1, .L3119+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3109
.L3116:
	movw	r2, #1905
	ldr	r1, .L3119+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3109
.L3120:
	.align	2
.L3119:
	.word	.LC401
	.word	.LC398
	.word	.LC400
	.word	.LC399
	UNWIND(.fnend)
	.size	MVC_OutputFrmToVO, .-MVC_OutputFrmToVO
	.align	2
	.global	MVC_OutputFrmFromDPB
	.type	MVC_OutputFrmFromDPB, %function
MVC_OutputFrmFromDPB:
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
	add	r4, r4, #11075584
	mov	r5, r0
	add	r4, r4, #45056
	ldr	r3, [r4, #2824]
	cmp	r3, #0
	moveq	r4, r3
	beq	.L3122
	mov	r2, #0
	strb	r2, [r3, #5]
	ldr	r1, [r4, #2824]
	bl	MVC_OutputFrmToVO
	ldr	r3, [r4, #2824]
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	cmp	r2, #0
	rsb	r4, r0, #0
	beq	.L3124
.L3122:
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3124:
	mov	r0, r5
	mov	r1, r6
	bl	MVC_RemoveFrameStoreOutDPB
	mov	r0, r4
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_OutputFrmFromDPB, .-MVC_OutputFrmFromDPB
	.align	2
	.global	MVC_FlushDPB
	.type	MVC_FlushDPB, %function
MVC_FlushDPB:
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
	subs	r5, r0, #0
	mov	r4, r1
	beq	.L3144
	add	r8, r5, #11075584
	add	r8, r8, #45056
	ldr	r3, [r8, #3016]
	cmp	r3, #0
	movwne	r7, #47876
	movne	r6, #0
	movtne	r7, 169
	addne	r7, r5, r7
	beq	.L3132
.L3131:
	ldr	r1, [r7, #4]!
	add	r6, r6, #1
	cmp	r1, #0
	beq	.L3130
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3130
	ldr	r3, [r1, #56]
	cmn	r4, #1
	cmpne	r3, r4
	bne	.L3130
	mov	r0, r5
	bl	MVC_UnMarkFrameStoreRef
.L3130:
	ldr	r3, [r8, #3016]
	cmp	r3, r6
	bhi	.L3131
.L3132:
	mov	r1, r4
	mov	r0, r5
	bl	MVC_RemoveUnUsedFrameStore
	ldr	r0, [r8, #3016]
	cmp	r0, #0
	beq	.L3129
	movw	r1, #47876
	mov	r7, #0
	movt	r1, 169
	add	r1, r5, r1
	mov	r2, r7
	mvn	r6, #0
.L3136:
	ldr	r3, [r1, #4]!
	add	r2, r2, #1
	cmp	r3, #0
	beq	.L3134
	ldr	r3, [r3, #56]
	cmn	r4, #1
	cmpne	r4, r3
	addeq	r7, r7, #1
	cmp	r4, r3
	cmnne	r4, #1
	movne	r6, r3
.L3134:
	cmp	r2, r0
	bne	.L3136
	cmp	r7, #0
	beq	.L3129
	adds	r8, r6, #1
	movne	r8, #1
	cmp	r4, r6
	movle	r9, #0
	andgt	r9, r8, #1
	b	.L3142
.L3143:
	subs	r7, r7, #1
	beq	.L3129
.L3142:
	cmp	r9, #0
	sub	r3, fp, #44
	sub	r2, fp, #40
	mov	r1, r6
	mov	r0, r5
	beq	.L3139
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	mov	r0, r5
	cmn	r1, #1
	beq	.L3129
	bl	MVC_OutputFrmFromDPB
	cmp	r0, #0
	bne	.L3144
.L3139:
	mov	r1, r4
	sub	r3, fp, #44
	sub	r2, fp, #40
	mov	r0, r5
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	mov	r0, r5
	cmn	r1, #1
	beq	.L3129
	bl	MVC_OutputFrmFromDPB
	cmp	r0, #0
	bne	.L3144
	cmp	r4, r6
	movge	r3, #0
	andlt	r3, r8, #1
	cmp	r3, #0
	beq	.L3143
	mov	r1, r6
	sub	r3, fp, #44
	sub	r2, fp, #40
	mov	r0, r5
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	mov	r0, r5
	cmn	r1, #1
	beq	.L3129
	bl	MVC_OutputFrmFromDPB
	cmp	r0, #0
	beq	.L3143
.L3144:
	mvn	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3129:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_FlushDPB, .-MVC_FlushDPB
	.align	2
	.global	MVC_AdaptiveMemMark
	.type	MVC_AdaptiveMemMark, %function
MVC_AdaptiveMemMark:
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
	add	r9, r0, #11141120
	add	r8, r0, #11075584
	add	r9, r9, #16384
	movw	r7, #16824
	movt	r7, 170
	add	r8, r8, #40960
	ldr	r4, [r9, #1124]
	add	r7, r0, r7
	mov	r5, r0
	add	r6, r4, #2000
	add	r4, r4, #4
	add	r6, r6, #4
.L3191:
	ldr	r3, [r4]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L3182
.L3184:
	.word	.L3183
	.word	.L3185
	.word	.L3186
	.word	.L3187
	.word	.L3188
	.word	.L3189
	.word	.L3190
.L3190:
	ldr	r2, [r4, #12]
	mov	r1, r7
	mov	r0, r5
	bl	MVC_MarkCurrPicLT
.L3182:
	add	r4, r4, #20
	cmp	r4, r6
	bne	.L3191
.L3183:
	ldrsb	r3, [r8, #24]
	cmp	r3, #1
	beq	.L3199
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3189:
	mov	r0, r5
	bl	MVC_UnMarkAllSTRef
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r1, #0
	mov	r0, r5
	bl	MVC_UpdateMaxLTFrmIdx
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	mov	r3, #1
	strb	r3, [r8, #24]
	b	.L3182
.L3188:
	mov	r0, r5
	ldr	r1, [r4, #16]
	bl	MVC_UpdateMaxLTFrmIdx
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	b	.L3182
.L3187:
	ldr	r3, [r4, #12]
	mov	r1, r7
	ldr	r2, [r4, #4]
	mov	r0, r5
	bl	MVC_MarkSTToLTRef
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	b	.L3182
.L3186:
	mov	r0, r5
	ldr	r2, [r4, #8]
	mov	r1, r7
	bl	MVC_UnMarkLTRef
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	b	.L3182
.L3185:
	mov	r0, r5
	ldr	r2, [r4, #4]
	mov	r1, r7
	bl	MVC_UnMarkSTRef
	mov	r0, r5
	bl	MVC_UpdateReflist
	b	.L3182
.L3199:
	mov	r2, #0
	str	r2, [r9, #1128]
	ldr	r1, [r8, #2804]
	movw	r3, #26918
	movt	r3, 42
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	ldrb	r3, [r9, #443]	@ zero_extendqisi2
	str	r2, [r9, #1984]
	cmp	r3, #1
	beq	.L3194
	bcc	.L3195
	cmp	r3, #2
	streq	r2, [r9, #1152]
	streq	r2, [r9, #1140]
	streq	r2, [r8, #52]
	streq	r2, [r8, #60]
.L3193:
	ldr	r1, [r9, #1200]
	mov	r0, r5
	bl	MVC_FlushDPB
	adds	r0, r0, #0
	movne	r0, #1
	rsb	r0, r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3195:
	ldr	r1, [r9, #1140]
	ldr	r2, [r9, #1148]
	ldr	r3, [r9, #1152]
	rsb	r2, r1, r2
	str	r2, [r9, #1148]
	rsb	r3, r1, r3
	str	r3, [r9, #1152]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r9, #1144]
	str	r3, [r9, #1140]
	ldr	r1, [r8, #60]
	ldr	r2, [r8, #48]
	ldr	r3, [r8, #52]
	rsb	r2, r1, r2
	str	r2, [r8, #48]
	rsb	r3, r1, r3
	str	r3, [r8, #52]
	cmp	r3, r2
	movge	r3, r2
	str	r3, [r8, #56]
	str	r3, [r8, #60]
	b	.L3193
.L3194:
	str	r2, [r9, #1148]
	str	r2, [r9, #1140]
	str	r2, [r8, #48]
	str	r2, [r8, #60]
	b	.L3193
	UNWIND(.fnend)
	.size	MVC_AdaptiveMemMark, .-MVC_AdaptiveMemMark
	.align	2
	.global	MVC_IDRMemMarking
	.type	MVC_IDRMemMarking, %function
MVC_IDRMemMarking:
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
	add	r6, r0, #11141120
	add	r6, r6, #16384
	mov	r7, r0
	ldr	r3, [r6, #1124]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3201
	ldr	lr, [r0, #52]
	cmp	lr, #0
	beq	.L3210
	movw	r1, #47876
	mov	r2, #0
	movt	r1, 169
	add	r0, r0, #148
	add	r1, r7, r1
	mov	r4, r2
.L3209:
	ldr	r3, [r1, #4]!
	add	r2, r2, #1
	cmp	r3, #0
	beq	.L3206
	ldr	ip, [r3, #16]
	cmp	ip, #1
	streqb	ip, [r7, #6]
	ldr	ip, [r3, #56]
	ldr	r3, [r6, #1200]
	cmp	ip, r3
	streq	r4, [r0]
.L3206:
	cmp	r2, lr
	add	r0, r0, #4
	bne	.L3209
.L3210:
	add	r9, r7, #11075584
	add	ip, r9, #45056
	ldr	r10, [ip, #3016]
	cmp	r10, #0
	beq	.L3204
	movw	r4, #47876
	mov	r5, #0
	movt	r4, 169
	mov	r8, r5
	add	r4, r7, r4
	b	.L3215
.L3213:
	cmp	r5, r10
	beq	.L3204
.L3215:
	ldr	r1, [r4, #4]!
	add	r5, r5, #1
	cmp	r1, #0
	beq	.L3213
	ldr	r0, [r1, #56]
	ldr	r2, [r6, #1200]
	cmp	r0, r2
	bne	.L3213
	strb	r8, [r1, #738]
	mov	r2, #0
	strb	r8, [r1, #737]
	ldr	r1, [r4]
	str	ip, [fp, #-48]
	strb	r8, [r1, #774]
	strb	r8, [r1, #773]
	ldr	r1, [r4]
	strb	r8, [r1, #810]
	strb	r8, [r1, #809]
	ldr	r1, [r4]
	strb	r8, [r1, #3]
	ldr	r1, [r4]
	ldr	r0, [r7, #120]
	ldrsb	r1, [r1, #6]
	bl	FSP_SetRef
	ldr	r1, [r4]
	mov	r3, #1
	movw	r2, #48088
	movt	r2, 169
	strb	r8, [r1, #2]
	ldr	r1, [r4]
	strb	r8, [r1, #5]
	ldr	r1, [r4]
	strb	r3, [r1, #7]
	ldr	r0, [r4]
	ldr	r1, [r0, #52]
	add	r1, r7, r1
	add	r2, r1, r2
	strb	r8, [r2, #4]
	ldrsb	r1, [r0, #6]
	ldr	r0, [r7, #120]
	bl	FSP_GetDisplay
	mov	r2, #0
	ldr	ip, [fp, #-48]
	cmp	r0, #3
	beq	.L3214
	ldr	r1, [r4]
	ldr	r0, [r7, #120]
	ldrsb	r1, [r1, #6]
	bl	FSP_SetDisplay
	ldr	ip, [fp, #-48]
.L3214:
	str	r8, [r4]
	cmp	r5, r10
	str	r8, [r4, #64]
	str	r8, [r4, #128]
	ldr	r2, [ip, #3020]
	sub	r2, r2, #1
	str	r2, [ip, #3020]
	bne	.L3215
.L3204:
	mov	r0, r7
	bl	MVC_UpdateReflist
	mov	r0, r7
	bl	MVC_UpdateLTReflist
	ldr	r3, [r6, #1124]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3228
	add	r9, r9, #45056
	mov	r0, r3
	mov	r2, #1
	str	r3, [r9, #3032]
	strb	r3, [r6, #444]
	strb	r2, [r6, #445]
.L3216:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3228:
	add	r9, r9, #45056
	mov	r3, #0
	mov	r2, #1
	mov	r0, r3
	str	r2, [r9, #3032]
	strb	r2, [r6, #444]
	str	r3, [r6, #1132]
	strb	r3, [r6, #445]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3201:
	ldr	r1, [r6, #1200]
	bl	MVC_FlushDPB
	cmp	r0, #0
	addeq	r9, r7, #11075584
	beq	.L3204
.L3217:
	mvn	r0, #0
	b	.L3216
	UNWIND(.fnend)
	.size	MVC_IDRMemMarking, .-MVC_IDRMemMarking
	.align	2
	.global	MVC_Marking
	.type	MVC_Marking, %function
MVC_Marking:
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
	add	r3, r0, #11075584
	add	r5, r0, #11141120
	add	r3, r3, #40960
	add	r4, r5, #16384
	mov	r2, #0
	mov	r6, r0
	strb	r2, [r3, #24]
	ldrb	r2, [r4, #443]	@ zero_extendqisi2
	sub	r2, r2, #2
	clz	r2, r2
	mov	r2, r2, lsr #5
	strb	r2, [r3, #25]
	ldrb	r3, [r4, #446]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L3230
	ldrb	r3, [r4, #452]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3231
	ldr	r3, [r0, #224]
	ldr	r2, [r3, #640]
	cmp	r2, #1
	beq	.L3252
.L3231:
	ldr	r3, [r4, #1124]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r4, #1136]
	beq	.L3253
	cmp	r3, #0
	bne	.L3254
.L3238:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3253:
	cmp	r3, #0
	beq	.L3238
.L3237:
	ldrb	r7, [r4, #441]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L3255
.L3241:
	add	r5, r5, #16384
	mov	r0, #0
	ldrb	r3, [r5, #444]	@ zero_extendqisi2
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r5, #445]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3252:
	ldr	r2, [r3, #636]
	cmp	r2, #0
	bne	.L3231
	ldr	r2, [r3, #644]
	cmp	r2, #0
	bne	.L3231
	ldr	r3, [r3, #604]
	add	r3, r3, #1024
	cmp	r3, #2048
	bls	.L3231
.L3230:
	mov	r0, r6
	bl	MVC_IDRMemMarking
	cmp	r0, #0
	bne	.L3232
.L3239:
	ldrb	r3, [r4, #446]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L3234
	ldr	r3, [r4, #1136]
	cmp	r3, #0
	beq	.L3238
	ldr	r3, [r4, #1124]
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3237
	b	.L3241
.L3255:
	mov	r0, r6
	bl	MVC_SlidingWinMark
	ldr	r3, [r4, #1124]
	strb	r7, [r3]
	strb	r7, [r4, #444]
.L3234:
	ldr	r3, [r4, #1136]
	cmp	r3, #0
	bne	.L3241
	b	.L3238
.L3254:
	mov	r0, r6
	bl	MVC_AdaptiveMemMark
	ldr	r3, [r4, #1124]
	mov	r2, #0
	strb	r2, [r3]
	cmp	r0, r2
	beq	.L3239
.L3232:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
	UNWIND(.fnend)
	.size	MVC_Marking, .-MVC_Marking
	.align	2
	.global	MVC_DirectOutput
	.type	MVC_DirectOutput, %function
MVC_DirectOutput:
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
	add	r5, r0, #11141120
	add	r5, r5, #16384
	mov	r4, r0
	ldrb	r6, [r5, #443]	@ zero_extendqisi2
	cmp	r6, #1
	beq	.L3258
	bcc	.L3259
	cmp	r6, #2
	beq	.L3260
	mov	r6, #0
.L3257:
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3260:
	ldr	r3, [r5, #1120]
	mov	r2, #3
	strb	r2, [r3, #736]
	ldrb	r2, [r5, #441]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3278
	ldr	r1, [r0, #520]
	cmp	r1, #0
	beq	.L3279
	bl	MVC_OutputFrmToVO
	ldr	r3, [r5, #1120]
	str	r3, [r4, #520]
	str	r3, [r3, #812]
	mov	r6, r0
.L3280:
	ldr	r3, [r4, #520]
	mov	r8, #2
	ldrb	r0, [r5, #442]	@ zero_extendqisi2
	mov	r7, #0
	mov	r2, #664
	add	r1, r5, #456
	strb	r0, [r3, #1]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #5]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #7]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #3]
	ldr	r3, [r4, #520]
	ldrb	r0, [r5, #452]	@ zero_extendqisi2
	strb	r0, [r3]
	ldr	r3, [r4, #520]
	str	r7, [r3, #40]
	ldr	r0, [r4, #520]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #1172]
	str	r2, [r3, #832]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #832]
	str	r2, [r3, #760]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #808]
	ldrb	r2, [r5, #447]	@ zero_extendqisi2
	ldr	r3, [r4, #520]
	cmp	r2, #1
	movne	r2, r7
	moveq	r2, r8
	strb	r2, [r3, #4]
.L3337:
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #1140]
	str	r2, [r3, #32]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #1200]
	str	r2, [r3, #56]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #1204]
	str	r2, [r3, #60]
	ldrb	r8, [r4, #9]	@ zero_extendqisi2
	cmp	r8, #1
	bne	.L3257
	ldr	r3, [r4, #520]
	mov	r2, r7
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
	mov	r2, r7
	ldr	r1, [r4, #520]
	mov	r0, r4
	bl	MVC_OutputFrmToVO
	ldr	r3, [r4, #520]
	cmp	r3, r7
	mov	r6, r0
	beq	.L3290
	ldr	r3, [r5, #1120]
	mov	r2, r8
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
	b	.L3290
.L3259:
	ldr	r3, [r5, #1120]
	mov	r2, #0
	strb	r2, [r3, #736]
	ldr	r1, [r0, #520]
	cmp	r1, r2
	beq	.L3261
	bl	MVC_OutputFrmToVO
	cmp	r0, #0
	bne	.L3340
.L3262:
	ldr	r3, [r4, #520]
	cmp	r3, #0
	beq	.L3261
	ldr	r3, [r5, #1120]
	mov	r2, #1
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
.L3261:
	ldr	r3, [r5, #1120]
	mov	r0, #3
	mov	r7, #0
	mov	r2, #664
	add	r1, r5, #456
	str	r3, [r4, #520]
	str	r3, [r3, #740]
	ldr	r3, [r4, #520]
	ldr	ip, [r5, #1120]
	str	ip, [r3, #776]
	ldr	r3, [r4, #520]
	ldr	ip, [r5, #1120]
	str	ip, [r3, #812]
	ldrb	ip, [r5, #442]	@ zero_extendqisi2
	ldr	r3, [r4, #520]
	strb	ip, [r3, #1]
	ldr	r3, [r4, #520]
	strb	r0, [r3, #2]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #3]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #5]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #7]
	ldr	r0, [r4, #520]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #1172]
	mov	r2, r7
	str	r1, [r3, #760]
	str	r1, [r3, #44]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #736]
	ldr	r3, [r4, #520]
	ldrb	r1, [r5, #452]	@ zero_extendqisi2
	strb	r1, [r3]
	ldr	r3, [r4, #520]
	ldrb	r1, [r5, #449]	@ zero_extendqisi2
	str	r1, [r3, #40]
	ldrb	r1, [r5, #447]	@ zero_extendqisi2
	ldr	r3, [r4, #520]
	cmp	r1, #1
	moveq	r6, #3
	strb	r6, [r3, #4]
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #1140]
	str	r1, [r3, #32]
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #1200]
	str	r1, [r3, #56]
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #1204]
	str	r1, [r3, #60]
	ldr	r3, [r4, #520]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
	mov	r2, r7
	ldr	r1, [r4, #520]
	mov	r0, r4
	bl	MVC_OutputFrmToVO
	ldr	r3, [r4, #520]
	cmp	r3, r7
	mov	r6, r0
	beq	.L3290
.L3332:
	ldr	r3, [r5, #1120]
	mov	r2, #1
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
.L3290:
	mov	r3, #0
	mov	r0, r6
	str	r3, [r4, #520]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3258:
	ldr	r3, [r5, #1120]
	mov	r2, #3
	strb	r2, [r3, #736]
	ldrb	r2, [r5, #441]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3266
	ldr	r1, [r0, #520]
	cmp	r1, #0
	beq	.L3267
	bl	MVC_OutputFrmToVO
	ldr	r3, [r5, #1120]
	str	r3, [r4, #520]
	str	r3, [r3, #776]
	mov	r6, r0
.L3268:
	ldr	r3, [r4, #520]
	mov	r8, #1
	ldrb	r0, [r5, #442]	@ zero_extendqisi2
	mov	r7, #0
	mov	r2, #664
	add	r1, r5, #456
	strb	r0, [r3, #1]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #5]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #7]
	ldr	r3, [r4, #520]
	strb	r7, [r3, #3]
	ldr	r3, [r4, #520]
	ldrb	r0, [r5, #452]	@ zero_extendqisi2
	strb	r0, [r3]
	ldr	r3, [r4, #520]
	str	r7, [r3, #40]
	ldr	r0, [r4, #520]
	add	r0, r0, #72
	bl	memcpy
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #1172]
	str	r2, [r3, #796]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #796]
	str	r2, [r3, #760]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	strb	r8, [r3, #772]
	ldrb	r3, [r5, #447]	@ zero_extendqisi2
	ldr	r2, [r4, #520]
	rsb	r3, r8, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r2, #4]
	b	.L3337
.L3278:
	ldr	r0, [r0, #520]
	mov	r2, #664
	add	r1, r5, #456
	cmp	r0, #0
	ldreq	r3, [r5, #1120]
	streq	r3, [r4, #520]
	streq	r3, [r3, #812]
	ldreq	r0, [r4, #520]
	add	r3, r0, #720
	add	lr, r0, #736
	ldr	ip, [r3, #-8]
	add	r0, r0, #72
	ldrd	r8, [r3]
	ldrd	r6, [lr, #-8]
	ldr	r10, [r3, #-4]
	str	ip, [fp, #-48]
	bl	memcpy
	movw	r3, #17488
	ldr	ip, [fp, #-48]
	movt	r3, 170
	add	r3, r4, r3
	and	r2, ip, r10
	ldmdb	r3, {r1, r3}
	and	r1, r1, r3
	adds	r3, r2, #1
	movne	r3, #1
	cmn	r1, #1
	movw	r1, #17504
	movne	r3, #0
	cmp	r3, #0
	movt	r1, 170
	add	r1, r4, r1
	ldrne	r3, [r4, #520]
	strne	ip, [r3, #712]
	mov	ip, #2
	strne	r10, [r3, #716]
	movw	r3, #17488
	movt	r3, 170
	ldr	r0, [r4, #520]
	ldrd	r2, [r3, r4]
	add	r0, r0, #720
	cmp	r3, r9
	cmpeq	r2, r8
	movhi	r2, r8
	movhi	r3, r9
	strd	r2, [r0]
	ldrd	r0, [r1, #-8]
	ldr	r3, [r4, #520]
	cmp	r1, r7
	cmpeq	r0, r6
	add	r3, r3, #736
	movhi	r0, r6
	movhi	r1, r7
	strd	r0, [r3, #-8]
	mov	r0, #3
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r5, #442]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #2]
	ldr	r2, [r4, #520]
	ldrb	r1, [r5, #452]	@ zero_extendqisi2
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r4, #520]
	strb	ip, [r3, #808]
	ldr	r3, [r4, #520]
	strb	r0, [r3, #736]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #1172]
	str	r2, [r3, #832]
	ldr	r2, [r4, #520]
	ldr	r3, [r2, #832]
	ldr	r1, [r2, #796]
	add	r3, r3, r1
	mov	r3, r3, lsr #1
	str	r3, [r2, #760]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #760]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #812]
	str	r2, [r3, #740]
	ldrb	r3, [r5, #447]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #520]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	beq	.L3338
.L3289:
	strb	r2, [r3, #4]
	mov	r2, #0
	ldr	r3, [r4, #520]
	ldr	r1, [r5, #1140]
	str	r1, [r3, #32]
	ldr	r3, [r4, #520]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
	mov	r2, #0
	ldr	r1, [r4, #520]
	mov	r0, r4
	bl	MVC_OutputFrmToVO
	ldr	r3, [r4, #520]
	cmp	r3, #0
	mov	r6, r0
	bne	.L3332
	b	.L3290
.L3266:
	ldr	r0, [r0, #520]
	mov	r2, #664
	add	r1, r5, #456
	cmp	r0, #0
	ldreq	r3, [r5, #1120]
	streq	r3, [r4, #520]
	streq	r3, [r3, #776]
	ldreq	r0, [r4, #520]
	add	r3, r0, #720
	add	lr, r0, #736
	ldr	ip, [r3, #-8]
	add	r0, r0, #72
	ldrd	r8, [r3]
	ldrd	r6, [lr, #-8]
	ldr	r10, [r3, #-4]
	str	ip, [fp, #-48]
	bl	memcpy
	movw	r3, #17488
	ldr	ip, [fp, #-48]
	movt	r3, 170
	add	r3, r4, r3
	and	r2, ip, r10
	ldmdb	r3, {r1, r3}
	and	r1, r1, r3
	adds	r3, r2, #1
	movne	r3, #1
	cmn	r1, #1
	movw	r1, #17504
	movne	r3, #0
	cmp	r3, #0
	movt	r1, 170
	add	r1, r4, r1
	ldrne	r3, [r4, #520]
	strne	ip, [r3, #712]
	mov	ip, #1
	strne	r10, [r3, #716]
	movw	r3, #17488
	movt	r3, 170
	ldr	r0, [r4, #520]
	ldrd	r2, [r3, r4]
	add	r0, r0, #720
	cmp	r3, r9
	cmpeq	r2, r8
	movhi	r2, r8
	movhi	r3, r9
	strd	r2, [r0]
	ldrd	r0, [r1, #-8]
	ldr	r3, [r4, #520]
	cmp	r1, r7
	cmpeq	r0, r6
	add	r3, r3, #736
	movhi	r0, r6
	movhi	r1, r7
	strd	r0, [r3, #-8]
	mov	r0, #3
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r5, #442]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r4, #520]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, ip
	strb	r3, [r2, #2]
	ldr	r2, [r4, #520]
	ldrb	r1, [r5, #452]	@ zero_extendqisi2
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r4, #520]
	strb	ip, [r3, #772]
	ldr	r3, [r4, #520]
	strb	r0, [r3, #736]
	ldr	r3, [r4, #520]
	ldr	r2, [r5, #1172]
	str	r2, [r3, #796]
	ldr	r2, [r4, #520]
	ldr	r3, [r2, #832]
	ldr	r1, [r2, #796]
	add	r3, r3, r1
	mov	r3, r3, lsr ip
	str	r3, [r2, #760]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #760]
	str	r2, [r3, #44]
	ldr	r3, [r4, #520]
	ldr	r2, [r3, #776]
	str	r2, [r3, #740]
	ldrb	r3, [r5, #447]	@ zero_extendqisi2
	cmp	r3, ip
	ldr	r3, [r4, #520]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	bne	.L3289
.L3338:
	orr	r2, r2, ip
	b	.L3289
.L3340:
	str	r0, [sp]
	movw	r3, #2534
	ldr	r2, .L3341
	mov	r0, #22
	ldr	r1, .L3341+4
	bl	dprint_vfmw
	b	.L3262
.L3279:
	ldr	r3, [r5, #1120]
	mov	r6, r1
	str	r3, [r0, #520]
	str	r3, [r3, #812]
	b	.L3280
.L3267:
	ldr	r3, [r5, #1120]
	mov	r6, r1
	str	r3, [r0, #520]
	str	r3, [r3, #776]
	b	.L3268
.L3342:
	.align	2
.L3341:
	.word	.LANCHOR0+248
	.word	.LC402
	UNWIND(.fnend)
	.size	MVC_DirectOutput, .-MVC_DirectOutput
	.align	2
	.global	MVC_DEC_GetRemainImg
	.type	MVC_DEC_GetRemainImg, %function
MVC_DEC_GetRemainImg:
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
	add	r6, r0, #11075584
	add	r6, r6, #45056
	mov	r5, r0
	ldr	r3, [r6, #3016]
	cmp	r3, #0
	beq	.L3357
	movw	r8, #47876
	mov	r4, #0
	movt	r8, 169
	add	r8, r0, r8
	mov	r7, r4
	mov	r9, r8
	b	.L3346
.L3345:
	ldr	r3, [r6, #3016]
	cmp	r3, r7
	bls	.L3384
.L3346:
	ldr	r3, [r9, #4]!
	add	r7, r7, #1
	cmp	r3, #0
	beq	.L3345
	ldrb	r2, [r3, #5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3345
	ldrsb	r1, [r3, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetLogicFs
	cmp	r0, #0
	beq	.L3345
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #1
	ldr	r3, [r6, #3016]
	addls	r4, r4, #1
	cmp	r3, r7
	bhi	.L3346
.L3384:
	cmp	r4, #0
	beq	.L3347
	mvn	r7, #0
	b	.L3350
.L3348:
	ldr	r1, [r5, r3, asl #2]
	bl	MVC_OutputFrmToVO
	subs	r4, r4, #1
	mov	r7, r0
	beq	.L3382
.L3350:
	sub	r3, fp, #44
	sub	r2, fp, #40
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_GetMinPOC
	ldr	r1, [fp, #-44]
	movw	r3, #28354
	mov	r2, r4
	cmn	r1, #1
	movt	r3, 42
	mov	r0, r5
	add	r3, r1, r3
	bne	.L3348
.L3382:
	ldr	r3, [r6, #3016]
	cmp	r3, #0
	beq	.L3344
.L3349:
	mov	r4, #0
	b	.L3353
.L3352:
	ldr	r3, [r6, #3016]
	cmp	r3, r4
	bls	.L3344
.L3353:
	ldr	r1, [r8, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3352
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3352
	mov	r0, r5
	bl	MVC_UnMarkFrameStoreRef
	ldr	r3, [r6, #3016]
	cmp	r3, r4
	bhi	.L3353
.L3344:
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_RemoveUnUsedFrameStore
	cmp	r7, #0
	bne	.L3355
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3347:
	cmp	r3, #0
	mvnne	r7, #0
	bne	.L3349
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_RemoveUnUsedFrameStore
.L3355:
	add	r0, r5, #584
	bl	GetVoLastImageID
	mov	r7, r0
	mov	r0, r7
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3357:
	mvn	r7, #0
	b	.L3344
	UNWIND(.fnend)
	.size	MVC_DEC_GetRemainImg, .-MVC_DEC_GetRemainImg
	.align	2
	.global	MVC_InitDPB
	.type	MVC_InitDPB, %function
MVC_InitDPB:
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
	subs	r4, r0, #0
	beq	.L3402
	bl	MVC_ClearAllSlice
	movw	r7, #47880
	movw	r6, #48008
	movw	r5, #47944
	movt	r7, 169
	movt	r6, 169
	movt	r5, 169
	mov	r8, #0
	add	r7, r4, r7
	add	r6, r4, r6
	add	r5, r4, r5
	mov	r9, r8
.L3390:
	ldr	r3, [r7]
	mov	r2, #1
	add	r8, r8, r2
	cmp	r3, #0
	beq	.L3387
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3387:
	ldr	r3, [r5]
	mov	r2, #1
	cmp	r3, #0
	beq	.L3388
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3388:
	ldr	r3, [r6]
	mov	r2, #1
	cmp	r3, #0
	beq	.L3389
	ldrsb	r1, [r3, #6]
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3389:
	cmp	r8, #16
	str	r9, [r6], #4
	mov	r2, #0
	str	r9, [r5], #4
	str	r9, [r7], #4
	bne	.L3390
	ldr	r3, [r4, #44]
	add	r5, r4, #11075584
	add	r6, r5, #45056
	str	r3, [r6, #3016]
	str	r2, [r6, #3020]
	str	r2, [r6, #3024]
	str	r2, [r6, #3028]
	str	r2, [r6, #3032]
	ldr	r1, [r4, #520]
	cmp	r1, r2
	beq	.L3392
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3393
.L3397:
	add	r3, r4, #11141120
	add	r3, r3, #16384
	ldr	r3, [r3, #1120]
	cmp	r3, #0
	beq	.L3395
	ldrsb	r1, [r3, #6]
	mov	r2, #1
	ldr	r0, [r4, #120]
	bl	FSP_ClearLogicFs
.L3395:
	mov	r3, #0
	str	r3, [r4, #520]
.L3392:
	ldr	r3, .L3420
	movw	r0, #48092
	mov	r2, #344
	mov	r1, #0
	movt	r0, 169
	add	r0, r4, r0
	ldr	r3, [r3, #48]
	blx	r3
	ldr	ip, [r6, #3016]
	mov	r0, #0
	add	r3, r4, #144
	add	r1, r4, #216
	mov	r2, r0
	str	ip, [r6, #3244]
	str	r0, [r6, #3248]
.L3399:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L3399
	add	r2, r4, #252
	add	r3, r4, #384
	mov	r0, #0
.L3400:
	str	r0, [r2, #4]!
	cmp	r2, r3
	mov	r1, #0
	bne	.L3400
	add	r2, r5, #40960
	add	r4, r4, #516
	mov	r0, r1
	str	r1, [r2, #1208]
.L3401:
	str	r0, [r3, #4]!
	cmp	r3, r4
	mov	r2, #0
	bne	.L3401
	add	r5, r5, #40960
	mov	r0, r2
	str	r2, [r5, #1212]
.L3386:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3393:
	mov	r0, r4
	bl	MVC_OutputFrmToVO
	cmp	r0, #0
	bne	.L3419
.L3396:
	ldr	r3, [r4, #520]
	cmp	r3, #0
	bne	.L3397
	b	.L3392
.L3419:
	str	r0, [sp]
	mov	r3, #5952
	ldr	r2, .L3420+4
	mov	r0, #22
	ldr	r1, .L3420+8
	bl	dprint_vfmw
	b	.L3396
.L3402:
	mvn	r0, #0
	b	.L3386
.L3421:
	.align	2
.L3420:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+268
	.word	.LC403
	UNWIND(.fnend)
	.size	MVC_InitDPB, .-MVC_InitDPB
	.align	2
	.global	MVC_ClearDPB
	.type	MVC_ClearDPB, %function
MVC_ClearDPB:
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
	bl	MVC_FlushDPB
	cmp	r0, #0
	bne	.L3431
.L3423:
	mov	r0, r4
	bl	MVC_InitDPB
	cmp	r0, #0
	beq	.L3424
	movw	r3, #315
	ldr	r2, .L3432
	ldr	r1, .L3432+4
	mov	r0, #22
	bl	dprint_vfmw
.L3424:
	mov	r0, #0
	strb	r0, [r4, #6]
	str	r0, [r4, #220]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3431:
	movw	r3, #310
	ldr	r2, .L3432
	ldr	r1, .L3432+8
	mov	r0, #22
	bl	dprint_vfmw
	b	.L3423
.L3433:
	.align	2
.L3432:
	.word	.LANCHOR0+280
	.word	.LC405
	.word	.LC404
	UNWIND(.fnend)
	.size	MVC_ClearDPB, .-MVC_ClearDPB
	.align	2
	.global	MVC_DecVDM
	.type	MVC_DecVDM, %function
MVC_DecVDM:
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
	add	r6, r0, #11141120
	add	r5, r6, #16384
	mov	r4, r0
	ldrb	r3, [r5, #443]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3435
	ldrb	r3, [r5, #441]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3435
.L3436:
	ldr	r3, [r4, #108]
	ldrb	r2, [r4, #8]	@ zero_extendqisi2
	ubfx	r7, r3, #16, #2
	cmp	r7, r2
	beq	.L3437
	sub	r2, r2, #2
	cmp	r2, #1
	cmpls	r7, #1
	bls	.L3494
.L3437:
	uxtb	r3, r7
	strb	r3, [r4, #8]
	cmp	r3, #2
	beq	.L3440
	cmp	r3, #3
	beq	.L3441
	cmp	r3, #1
	beq	.L3495
	ldrb	r3, [r4, #11]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3496
.L3448:
	ldr	r3, [r4, #64]
.L3444:
	ldrb	r2, [r5, #453]	@ zero_extendqisi2
	strb	r2, [r4, #11]
.L3449:
	cmp	r3, #0
	beq	.L3492
	ldrb	r3, [r5, #452]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L3497
	cmp	r3, #1
	bne	.L3452
	ldr	r2, [r5, #1200]
	cmp	r2, #0
	streqb	r3, [r4, #7]
.L3452:
	ldr	r2, [r4, #88]
	mov	r0, #2
	ldrb	r3, [r5, #443]	@ zero_extendqisi2
	sub	r2, r2, #1
	ldr	r1, .L3500
	bl	dprint_vfmw
	ldr	r3, [r5, #1192]
	ldr	r2, [r5, #1188]
	mov	r1, #1
	strb	r1, [r5, #2554]
	str	r3, [r5, #3400]
	str	r2, [r5, #3404]
	ldr	r3, [r4, #64]
	str	r3, [r5, #3604]
	ldr	r0, [r4, #88]
	cmp	r0, #0
	beq	.L3489
	ldrb	r1, [r5, #452]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L3453
	ldr	r3, .L3500+4
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3454
	ldr	r2, [r5, #3608]
	cmp	r2, #0
	beq	.L3463
.L3456:
	ldr	r3, [r2, #8]
	ldr	r0, [r2, #12]
	ldr	r2, [r2, #4056]
	add	r3, r3, r0
	add	r3, r3, #7
	cmp	r2, #0
	add	r1, r1, r3, lsr #3
	bne	.L3456
.L3455:
	sub	r2, fp, #28
	mov	r3, #4
	ldr	r0, [r4, #120]
	str	r1, [r2, #-4]!
	mov	r1, #20
	blx	ip
	ldr	r2, [r4, #224]
.L3457:
	movw	r3, #18936
	movt	r3, 170
	add	r3, r4, r3
	str	r3, [r4, #228]
	ldr	r1, [r2, #864]
	cmp	r1, #1
	beq	.L3498
	cmp	r1, #2
	beq	.L3499
.L3460:
	ldr	r3, [r2, #592]
	add	r6, r6, #16384
	mov	r0, #0
	str	r3, [r6, #3868]
	ldr	r3, [r2, #632]
	str	r3, [r6, #3872]
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3435:
	ldr	r3, [r4, #140]
	ldr	r2, [r4, #144]
	add	r3, r3, #1
	ldr	r1, [r4, #224]
	cmp	r3, r2
	movlt	r3, r2
	str	r3, [r4, #140]
	rsb	r3, r2, r3
	str	r3, [r1, #576]
	b	.L3436
.L3494:
	mov	r2, r7
	ldr	r1, .L3500+8
	mov	r0, #2
	bl	dprint_vfmw
	strb	r7, [r4, #8]
.L3441:
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mov	r0, r4
	mvn	r1, #0
	bl	MVC_ClearDPB
	mvn	r0, #0
.L3489:
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L3495:
	ldrb	r3, [r5, #452]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3448
	ldr	r3, [r5, #1136]
	cmp	r3, #0
	beq	.L3445
	ldrb	r3, [r4, #11]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3448
.L3461:
	ldrb	r2, [r5, #453]	@ zero_extendqisi2
	ldr	r3, [r4, #64]
	strb	r2, [r4, #11]
	b	.L3449
.L3440:
	ldrb	r3, [r5, #452]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3445
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L3444
	ldr	r2, [r4, #544]
	ldr	r2, [r2, #48]
	cmp	r2, #0
	beq	.L3444
.L3445:
	mov	r3, #1
	mov	r0, r4
	strb	r3, [r5, #447]
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L3489
.L3453:
	add	r3, r4, #11075584
	add	r3, r3, #45056
	ldr	r3, [r3, #3020]
	cmp	r3, #0
	bne	.L3454
	ldr	r2, [r4, #224]
	ldr	r3, [r2, #12]
	cmp	r3, #2
	beq	.L3457
.L3492:
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L3489
.L3496:
	ldrb	r3, [r5, #452]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3448
	b	.L3461
.L3497:
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3452
	ldr	r3, [r4, #224]
	ldr	r7, [r3, #12]
	cmp	r7, #0
	bne	.L3452
	ldr	r3, [r5, #1136]
	mov	r0, #1
	ldr	r2, [r5, #1140]
	ldr	r1, .L3500+12
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_ClearCurrPic
	ldr	r3, [r5, #1120]
	ldr	r0, [r4, #120]
	mov	r2, r7
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	mvn	r0, #0
	b	.L3489
.L3454:
	ldr	r2, [r4, #224]
	b	.L3457
.L3498:
	cmp	r3, #0
	beq	.L3460
	ldrb	r3, [r5, #452]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3460
	mov	r2, #0
	str	r2, [r4, #228]
	ldr	r3, [r5, #1120]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	b	.L3492
.L3499:
	ldr	r1, [r2, #868]
	cmp	r3, #0
	cmpne	r1, #0
	ble	.L3460
	ldrb	r3, [r5, #452]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3460
	mov	r2, #0
	str	r2, [r4, #228]
	ldr	r3, [r5, #1120]
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_SetDisplay
	ldr	r2, [r4, #224]
	mov	r0, r4
	ldr	r3, [r2, #868]
	sub	r3, r3, #1
	str	r3, [r2, #868]
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L3489
.L3463:
	mov	r1, r2
	b	.L3455
.L3501:
	.align	2
.L3500:
	.word	.LC408
	.word	g_event_report
	.word	.LC406
	.word	.LC407
	UNWIND(.fnend)
	.size	MVC_DecVDM, .-MVC_DecVDM
	.align	2
	.global	MVC_FlushDecoder
	.type	MVC_FlushDecoder, %function
MVC_FlushDecoder:
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
	add	r3, r0, #11075584
	mov	r1, #1
	add	r3, r3, #40960
	mov	ip, #0
	strb	r1, [r3, #1165]
	str	ip, [r3, #1216]
	strb	r1, [r0]
	bl	MVC_DecVDM
	cmp	r0, #0
	ldmeqfd	sp, {fp, sp, pc}
	movw	r3, #12981
	ldr	r2, .L3504
	ldr	r1, .L3504+4
	mov	r0, #22
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L3505:
	.align	2
.L3504:
	.word	.LANCHOR0+296
	.word	.LC409
	UNWIND(.fnend)
	.size	MVC_FlushDecoder, .-MVC_FlushDecoder
	.align	2
	.global	MVC_ReceivePacket
	.type	MVC_ReceivePacket, %function
MVC_ReceivePacket:
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
	ldr	r3, [r1, #8]
	mov	r4, r0
	ldr	r2, [r1, #4]
	mov	r5, r1
	mov	r0, #7
	add	r6, r4, #11141120
	ldr	r1, .L3569
	str	ip, [sp]
	bl	dprint_vfmw
	add	r3, r6, #16384
	mov	r2, #0
	str	r2, [r3, #3880]
	ldr	r3, [r4, #224]
	ldr	r2, [r3, #832]
	cmp	r2, #1
	beq	.L3564
.L3507:
	ldr	r3, [r4, #232]
	cmp	r3, #0
	beq	.L3527
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3565
.L3510:
	ldr	r1, .L3569+4
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L3527
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L3527:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3514
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L3514
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3514
	ldrb	r3, [r4, #937]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3530
	mov	r2, r4
	mov	r3, #1
	b	.L3517
.L3516:
	add	r3, r3, #1
	cmp	r3, #137
	beq	.L3528
.L3517:
	ldrb	r1, [r2, #1025]	@ zero_extendqisi2
	add	r2, r2, #88
	cmp	r1, #0
	bne	.L3516
	mov	r1, r3
.L3515:
	mov	r2, #88
	cmn	r1, #1
	mla	r3, r2, r3, r4
	mov	r0, #1
	strb	r0, [r3, #937]
	beq	.L3528
	mul	r3, r2, r1
	mov	r1, #0
	add	r2, r3, #936
	add	r3, r4, r3
	add	r2, r4, r2
	str	r2, [r4, #232]
	ldr	r2, [r5, #4]
	str	r2, [r3, #944]
	ldr	r2, [r5, #12]
	str	r2, [r3, #948]
	ldr	r2, [r5, #8]
	str	r2, [r3, #952]
	ldr	r3, [r4, #232]
	str	r1, [r3, #24]
	ldr	r3, [r4, #232]
	ldr	r2, [r5, #16]
	str	r2, [r3, #32]
	ldrd	r2, [r5, #24]
	ldr	ip, [r4, #232]
	strd	r2, [ip, #80]
	ldr	r3, [r4, #232]
	str	r0, [r3, #68]
	ldr	r3, [r4, #232]
	strb	r1, [r3]
	ldr	r3, [r4, #232]
	ldrb	r2, [r5]	@ zero_extendqisi2
	strb	r2, [r3, #3]
	ldr	r3, [r4, #232]
	b	.L3520
.L3565:
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bhi	.L3510
	ldrb	r1, [r3, #3]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L3511
	b	.L3510
.L3564:
	ldr	r3, [r3, #872]
	cmp	r3, #0
	beq	.L3507
	ldr	r3, [r4, #232]
	cmp	r3, #0
	ldrneb	r2, [r5]	@ zero_extendqisi2
	beq	.L3527
.L3511:
	strb	r2, [r3, #3]
	ldr	r3, [r4, #224]
	ldr	r2, [r3, #832]
	cmp	r2, #1
	beq	.L3566
.L3522:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	ble	.L3523
	ldr	r2, [r5, #4]
	cmp	r2, #0
	beq	.L3523
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L3523
	ldr	r3, [r4, #232]
	ldr	r1, [r3, #68]
	cmp	r1, #1
	bls	.L3567
.L3524:
	mov	r2, #1
	strb	r2, [r3, #3]
	ldr	r1, [r5, #16]
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3569+8
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3561
	mov	r3, #0
	mov	r1, #113
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	ip
.L3561:
	ldr	r3, [r4, #232]
.L3520:
	ldrb	r0, [r3, #3]	@ zero_extendqisi2
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3514:
	ldr	r1, .L3569+12
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r1, [r5, #16]
	ldr	r0, [r4, #120]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L3569+8
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3563
.L3562:
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #113
	blx	ip
.L3563:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L3523:
	ldr	r3, [r4, #232]
	b	.L3524
.L3566:
	ldr	r3, [r3, #872]
	cmp	r3, #0
	bne	.L3561
	b	.L3522
.L3567:
	mov	ip, r1, asl #5
	mov	r0, #0
	sub	r1, ip, r1, asl #2
	add	r3, r3, r1
	str	r2, [r3, #8]
	ldr	r3, [r4, #232]
	ldr	ip, [r5, #12]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	ip, [r3, #12]
	ldr	r3, [r4, #232]
	ldr	ip, [r5, #8]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	ip, [r3, #16]
	ldr	r3, [r4, #232]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r0, [r3, #24]
	ldr	r3, [r4, #232]
	ldr	r0, [r5, #16]
	ldr	r1, [r3, #68]
	mov	r2, r1, asl #5
	sub	r2, r2, r1, asl #2
	add	r3, r3, r2
	str	r0, [r3, #32]
	ldr	r2, [r4, #232]
	ldr	r3, [r2, #68]
	add	r3, r3, #1
	str	r3, [r2, #68]
	ldr	r3, [r4, #232]
	ldr	r2, [r3, #12]
	cmp	r2, #4096
	bcc	.L3568
.L3525:
	add	r6, r6, #16384
	mov	r2, #1
	str	r2, [r6, #3880]
	b	.L3520
.L3568:
	mov	r0, r4
	bl	MVC_CombinePacket.part.12
	ldr	r3, [r4, #232]
	b	.L3525
.L3528:
	ldr	r1, .L3569+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_ClearAllNal
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_ClearDPB
	ldr	r3, .L3569+8
	ldr	ip, [r3]
	cmp	ip, #0
	bne	.L3562
	b	.L3563
.L3530:
	mov	r1, r3
	b	.L3515
.L3570:
	.align	2
.L3569:
	.word	.LC410
	.word	.LC411
	.word	g_event_report
	.word	.LC413
	.word	.LC412
	UNWIND(.fnend)
	.size	MVC_ReceivePacket, .-MVC_ReceivePacket
	.align	2
	.global	MVC_ClearAll
	.type	MVC_ClearAll, %function
MVC_ClearAll:
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
	mov	r8, r0
	mov	r4, r1
	mov	r0, #22
	ldr	r1, .L3604
	bl	dprint_vfmw
	mov	r0, r8
	bl	MVC_ClearCurrPic
	mov	r0, r8
	bl	MVC_ClearAllNal
	mov	r0, r8
	bl	MVC_InitDPB
	cmp	r0, #0
	bne	.L3601
.L3572:
	cmp	r4, #0
	beq	.L3573
	add	r1, r8, #584
	ldr	r0, [r8, #120]
	bl	FSP_ClearNotInVoQueue
.L3574:
	movw	r4, #48440
	mov	r10, #0
	movt	r4, 169
	add	r4, r8, r4
	mov	r6, #0
	mov	r7, #0
.L3577:
	add	r5, r4, #664
	add	r9, r4, #696
	mov	r3, #0
	mov	r2, #1
	mvn	lr, #0
	mov	ip, #18
	mov	r0, #16
	mov	r1, #2
	str	r10, [r4, #252]
	str	r4, [r4, #812]
	str	r4, [r4, #776]
	str	r4, [r4, #740]
	strb	r3, [r4, #1]
	strb	r3, [r4, #2]
	strb	r3, [r4, #3]
	str	r3, [r4, #28]
	str	r3, [r4, #20]
	str	r3, [r4, #32]
	strb	r3, [r4, #5]
	strb	r3, [r4, #736]
	str	lr, [r4, #24]
	strb	r2, [r4, #7]
	strb	r2, [r4, #772]
	str	ip, [r4, #48]
	str	r0, [r4, #52]
	strb	r1, [r4, #808]
.L3576:
	ldrd	r2, [r5, #8]!
	orrs	r1, r2, r3
	bne	.L3602
.L3575:
	cmp	r5, r9
	bne	.L3576
	add	r10, r10, #1
	add	r4, r4, #848
	cmp	r10, #40
	bne	.L3577
	movw	r4, #17432
	movw	r5, #17464
	movt	r4, 170
	movt	r5, 170
	add	r4, r8, r4
	add	r5, r8, r5
	mov	r6, #0
	mov	r7, #0
.L3579:
	ldrd	r2, [r4, #8]!
	orrs	r1, r2, r3
	bne	.L3603
.L3578:
	cmp	r4, r5
	bne	.L3579
	ldr	r3, [r8, #60]
	cmp	r3, #0
	beq	.L3583
	mov	r4, #0
	add	r5, r8, #524
	mov	r6, r4
.L3582:
	ldr	r1, [r5, #4]!
	add	r4, r4, #1
	cmp	r1, #0
	beq	.L3581
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	str	r6, [r5]
.L3581:
	ldr	r3, [r8, #60]
	cmp	r3, r4
	bhi	.L3582
.L3583:
	add	r5, r8, #11075584
	ldr	ip, .L3604+4
	movw	r0, #42120
	mov	r4, #0
	add	r3, r5, #45056
	strb	r4, [r8, #4]
	strb	r4, [r8, #9]
	add	r5, r5, #40960
	strb	r4, [r8, #6]
	movt	r0, 169
	strb	r4, [r8, #7]
	add	r0, r8, r0
	strb	r4, [r8, #3]
	mov	r1, r4
	str	r4, [r8, #60]
	movw	r2, #1656
	str	r4, [r8, #64]
	str	r4, [r8, #104]
	str	r4, [r8, #220]
	str	r4, [r8, #232]
	add	r8, r8, #11141120
	add	r8, r8, #16384
	strb	r4, [r3, #772]
	ldr	ip, [ip, #48]
	strb	r4, [r5, #2864]
	strb	r4, [r3, #773]
	strb	r4, [r5, #2865]
	blx	ip
	mov	r2, #2
	mov	r3, #1
	strb	r2, [r5, #1160]
	strb	r3, [r5, #1165]
	mov	r0, r4
	mov	r3, #256
	strb	r4, [r8, #440]
	strb	r4, [r8, #1976]
	str	r4, [r8, #1980]
	str	r3, [r8, #1984]
	ldmfd	sp, {r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3602:
	mov	r1, r2
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	strd	r6, [r5]
	b	.L3575
.L3603:
	mov	r1, r2
	ldr	r0, [r8, #120]
	bl	FreeUsdByDec
	strd	r6, [r4]
	b	.L3578
.L3573:
	add	r0, r8, #584
	bl	ResetVoQueue
	ldr	r0, [r8, #120]
	bl	FSP_EmptyInstance
	b	.L3574
.L3601:
	mov	r3, #340
	ldr	r2, .L3604+8
	ldr	r1, .L3604+12
	mov	r0, #22
	bl	dprint_vfmw
	b	.L3572
.L3605:
	.align	2
.L3604:
	.word	.LC414
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+316
	.word	.LC405
	UNWIND(.fnend)
	.size	MVC_ClearAll, .-MVC_ClearAll
	.align	2
	.global	MVC_InsertFrmInDPB
	.type	MVC_InsertFrmInDPB, %function
MVC_InsertFrmInDPB:
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
	add	r3, r0, #11075584
	add	r3, r3, #45056
	mov	r4, r2
	ldrb	r9, [r4, #3]	@ zero_extendqisi2
	mov	r5, r0
	ldr	r3, [r3, #3020]
	mov	r6, r1
	cmp	r3, #0
	ldreq	r2, .L3707
	streq	r3, [r2, #-1884]
	cmp	r9, #1
	beq	.L3609
	bcc	.L3610
	cmp	r9, #2
	beq	.L3611
	mov	r2, r9
	ldr	r1, .L3707+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r5
	mov	r1, #1
	bl	MVC_ClearAll
	mov	r0, #0
.L3615:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3611:
	ldr	r3, [r4, #680]
	mov	r2, #3
	strb	r2, [r3, #736]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3631
	add	r8, r0, r3
	add	r2, r8, #11075584
	str	r2, [fp, #-64]
	add	r7, r2, #45056
	ldr	r2, [r7, #2824]
	cmp	r2, #0
	beq	.L3631
	strb	r9, [r2, #808]
	ldr	r3, [r7, #2824]
	ldr	r2, [r4, #680]
	str	r2, [r3, #812]
	ldr	r3, [r7, #2824]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #809]
	ldr	r3, [r7, #2824]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #810]
	ldr	r3, [r7, #2824]
	ldr	r2, [r4, #712]
	str	r2, [r3, #824]
	ldr	r3, [r7, #2824]
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	strb	r2, [r3, #811]
	ldr	r3, [r7, #2824]
	ldr	r2, [r4, #732]
	str	r2, [r3, #832]
	ldr	r3, [r7, #2824]
	ldr	r1, [r3, #796]
	ldr	r2, [r3, #832]
	add	r2, r2, r1
	str	r2, [r3, #760]
	str	r2, [r3, #44]
	add	r1, r4, #16
	ldr	r2, [r7, #2824]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r7, #2824]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r7, #2824]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	orreq	r2, r2, #2
	strb	r2, [r3, #4]
	mov	r2, #664
	ldr	r0, [r7, #2824]
	add	ip, r0, #720
	add	r3, r0, #736
	add	r0, r0, #72
	ldrd	r8, [ip]
	ldmdb	ip, {r10, lr}
	strd	r8, [fp, #-52]
	ldrd	r8, [r3, #-8]
	str	lr, [fp, #-68]
	strd	r8, [fp, #-60]
	bl	memcpy
	ldr	lr, [fp, #-68]
	ldr	r1, [r4, #656]
	ldr	r2, [r4, #660]
	and	r3, r10, lr
	adds	r3, r3, #1
	ldrd	r8, [fp, #-52]
	and	r2, r2, r1
	add	r1, r4, #672
	movne	r3, #1
	cmn	r2, #1
	movne	r3, #0
	cmp	r3, #0
	ldrne	r3, [r7, #2824]
	movne	r2, lr
	strne	r10, [r3, #712]
	strne	r2, [r3, #716]
	ldrd	r2, [r1, #-8]
	ldr	r0, [r7, #2824]
	cmp	r3, r9
	cmpeq	r2, r8
	add	r0, r0, #720
	movhi	r2, r8
	movhi	r3, r9
	ldrd	r8, [fp, #-60]
	strd	r2, [r0]
	ldrd	r2, [r1]
	ldr	r1, [r7, #2824]
	cmp	r3, r9
	cmpeq	r2, r8
	add	r1, r1, #736
	movhi	r3, r9
	movhi	r2, r8
	strd	r2, [r1, #-8]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3643
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3643
.L3644:
	ldr	r3, [fp, #-64]
	add	r8, r3, #45056
	ldr	r2, [r8, #2824]
	ldrb	r3, [r2, #811]	@ zero_extendqisi2
	ldrb	r1, [r2, #775]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r8, #2824]
	ldr	r2, [r4, #728]
	str	r2, [r3, #828]
	ldr	r2, [r8, #2824]
	ldr	r3, [r2, #828]
	ldr	r1, [r2, #792]
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r2, #36]
	ldr	r0, [r8, #2824]
	bl	MVC_CombineFldsToFrm
	ldr	r2, [r8, #2824]
	ldrb	r1, [r4, #11]	@ zero_extendqisi2
	movw	r3, #28442
	movt	r3, 42
	strb	r1, [r2, #13]
	ldrb	r1, [r4, #10]	@ zero_extendqisi2
	ldr	r2, [r8, #2824]
	strb	r1, [r2, #11]
	ldr	r2, [r8, #2824]
	ldr	r1, [r2, #52]
	ldr	r2, [r2, #824]
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3630
.L3610:
	add	r3, r0, r1, lsl #2
	ldr	r2, [r4, #680]
	add	r10, r3, #11075584
	mov	r3, #3
	add	r7, r10, #45056
	str	r2, [r7, #2824]
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	strb	r1, [r2, #1]
	ldr	r2, [r7, #2824]
	strb	r3, [r2, #2]
	ldr	r1, [r4, #680]
	ldr	r2, [r7, #2824]
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	strb	r1, [r2, #5]
	ldr	r1, [r4, #680]
	ldr	r2, [r7, #2824]
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	strb	r1, [r2, #7]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldr	r2, [r7, #2824]
	cmp	r1, #0
	beq	.L3706
.L3612:
	strb	r3, [r2, #3]
	add	r1, r4, #16
	ldr	r3, [r7, #2824]
	mov	r2, #664
	ldr	r0, [r4, #756]
	mov	r8, #0
	str	r0, [r3, #48]
	ldr	r0, [r7, #2824]
	add	r0, r0, #72
	bl	memcpy
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #732]
	add	r3, r10, #45056
	mov	lr, #1
	ldr	r10, .L3707
	mov	r2, r8
	mov	r0, r5
	str	ip, [r1, #760]
	str	ip, [r1, #44]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #680]
	str	ip, [r1, #812]
	str	ip, [r1, #776]
	str	ip, [r1, #740]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #692]
	str	ip, [r1, #28]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #688]
	str	ip, [r1, #20]
	ldr	r1, [r7, #2824]
	strb	r8, [r1, #736]
	ldr	r1, [r7, #2824]
	ldrb	ip, [r4, #4]	@ zero_extendqisi2
	strb	ip, [r1, #737]
	ldr	r1, [r7, #2824]
	ldrb	ip, [r4, #5]	@ zero_extendqisi2
	strb	ip, [r1, #738]
	ldr	r1, [r7, #2824]
	ldrb	ip, [r4, #12]	@ zero_extendqisi2
	strb	ip, [r1, #739]
	strb	ip, [r1]
	ldr	r1, [r7, #2824]
	ldrb	ip, [r4, #9]	@ zero_extendqisi2
	str	ip, [r1, #40]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #700]
	str	ip, [r1, #32]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #704]
	str	ip, [r1, #752]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #708]
	str	ip, [r1, #788]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #712]
	str	ip, [r1, #824]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #716]
	str	ip, [r1, #36]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #720]
	str	ip, [r1, #756]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #724]
	str	ip, [r1, #792]
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #728]
	str	ip, [r1, #828]
	ldrb	r1, [r4, #7]	@ zero_extendqisi2
	ldr	ip, [r7, #2824]
	cmp	r1, lr
	moveq	r9, #3
	strb	r9, [ip, #4]
	ldr	r1, [r3, #2824]
	ldr	ip, [r4, #760]
	str	ip, [r1, #56]
	ldr	r1, [r3, #2824]
	ldr	ip, [r4, #764]
	str	ip, [r1, #60]
	ldr	r1, [r3, #2824]
	ldrb	ip, [r4, #11]	@ zero_extendqisi2
	strb	ip, [r1, #13]
	strb	ip, [r1, #12]
	ldrb	r7, [r4, #10]	@ zero_extendqisi2
	ldr	ip, [r3, #2824]
	ldr	r1, [r10, #-1884]
	strb	r7, [ip, #11]
	add	r9, r1, lr
	strb	r7, [ip, #10]
	ldr	ip, [r3, #2824]
	str	r9, [r10, #-1884]
	str	r1, [ip, #64]
	ldr	r3, [r3, #2824]
	ldr	r1, [r3, #740]
	ldrb	r10, [r3, #737]	@ zero_extendqisi2
	ldrb	r9, [r3, #738]	@ zero_extendqisi2
	ldr	r7, [r3, #760]
	ldrb	ip, [r3, #739]	@ zero_extendqisi2
	strb	lr, [r3, #772]
	mov	lr, #2
	strb	r10, [r3, #773]
	strb	lr, [r3, #808]
	strb	r10, [r3, #809]
	strb	r9, [r3, #774]
	strb	r9, [r3, #810]
	str	r7, [r3, #796]
	str	r7, [r3, #832]
	strb	ip, [r3, #775]
	strb	ip, [r3, #811]
	str	r1, [r3, #776]
	str	r1, [r3, #812]
	ldr	r1, [r4, #680]
	bl	MVC_GetAPC
	cmp	r0, #0
	movne	r3, r0
	movwne	r2, #2229
	movne	r0, r8
	bne	.L3704
.L3630:
	movw	r3, #28354
	movt	r3, 42
	add	r3, r6, r3
	ldr	r3, [r5, r3, asl #2]
	ldrb	r0, [r3, #3]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L3615
	ldr	r0, [r5, #120]
	mov	r2, #1
	ldrsb	r1, [r3, #6]
	bl	FSP_SetRef
	mov	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3609:
	ldr	r3, [r4, #680]
	mov	r2, #3
	strb	r2, [r3, #736]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r3, r1, asl #2
	beq	.L3616
	add	r10, r0, r3
	add	r10, r10, #11075584
	add	r7, r10, #45056
	ldr	r2, [r7, #2824]
	cmp	r2, #0
	beq	.L3616
	strb	r9, [r2, #772]
	ldr	r3, [r7, #2824]
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	strb	r2, [r3, #775]
	ldr	r3, [r7, #2824]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	strb	r2, [r3, #773]
	ldr	r3, [r7, #2824]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	strb	r2, [r3, #774]
	ldr	r3, [r7, #2824]
	ldr	r2, [r4, #708]
	str	r2, [r3, #788]
	ldr	r3, [r7, #2824]
	ldrb	r2, [r4, #12]	@ zero_extendqisi2
	strb	r2, [r3, #775]
	ldr	r3, [r7, #2824]
	ldr	r2, [r4, #732]
	str	r2, [r3, #796]
	ldr	r3, [r7, #2824]
	ldr	r1, [r3, #796]
	ldr	r2, [r3, #832]
	add	r2, r2, r1
	str	r2, [r3, #760]
	str	r2, [r3, #44]
	add	r1, r4, #16
	ldr	r2, [r7, #2824]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r2, #1]
	ldr	r2, [r7, #2824]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #2]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r7, #2824]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	orreq	r2, r2, #1
	strb	r2, [r3, #4]
	mov	r2, #664
	ldr	r0, [r7, #2824]
	add	r8, r0, #720
	add	lr, r0, #736
	ldr	ip, [r8, #-8]
	add	r0, r0, #72
	ldr	r3, [r8, #-4]
	ldrd	r8, [r8]
	str	ip, [fp, #-68]
	str	r3, [fp, #-64]
	strd	r8, [fp, #-52]
	ldrd	r8, [lr, #-8]
	strd	r8, [fp, #-60]
	bl	memcpy
	ldr	r3, [fp, #-64]
	ldr	ip, [fp, #-68]
	ldr	r0, [r4, #656]
	ldr	r1, [r4, #660]
	and	r2, ip, r3
	adds	r2, r2, #1
	ldrd	r8, [fp, #-52]
	and	r1, r1, r0
	movne	r2, #1
	cmn	r1, #1
	add	r1, r4, #672
	movne	r2, #0
	cmp	r2, #0
	ldrne	r2, [r7, #2824]
	strne	ip, [r2, #712]
	strne	r3, [r2, #716]
	ldrd	r2, [r1, #-8]
	ldr	r0, [r7, #2824]
	cmp	r3, r9
	cmpeq	r2, r8
	add	r0, r0, #720
	movhi	r2, r8
	movhi	r3, r9
	ldrd	r8, [fp, #-60]
	strd	r2, [r0]
	ldrd	r2, [r1]
	ldr	r1, [r7, #2824]
	cmp	r3, r9
	cmpeq	r2, r8
	add	r1, r1, #736
	movhi	r3, r9
	movhi	r2, r8
	strd	r2, [r1, #-8]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3627
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3627
.L3628:
	add	r10, r10, #45056
	ldr	r2, [r10, #2824]
	ldrb	r3, [r2, #811]	@ zero_extendqisi2
	ldrb	r1, [r2, #775]	@ zero_extendqisi2
	cmp	r3, r1
	movcc	r3, r1
	strb	r3, [r2]
	ldr	r3, [r10, #2824]
	ldr	r2, [r4, #724]
	str	r2, [r3, #792]
	ldr	r2, [r10, #2824]
	ldr	r3, [r2, #828]
	ldr	r1, [r2, #792]
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r2, #36]
	ldr	r3, [r10, #2824]
	ldrb	r2, [r4, #11]	@ zero_extendqisi2
	strb	r2, [r3, #12]
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	ldr	r3, [r10, #2824]
	strb	r2, [r3, #10]
	ldr	r0, [r10, #2824]
	bl	MVC_CombineFldsToFrm
	ldr	r2, [r10, #2824]
	movw	r3, #28426
	movt	r3, 42
	ldr	r1, [r2, #52]
	ldr	r2, [r2, #788]
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #4]
	b	.L3630
.L3616:
	add	r7, r5, r3
	ldr	r2, [r4, #680]
	add	r7, r7, #11075584
	mov	r1, #1
	add	r3, r7, #45056
	str	r2, [r3, #2824]
	strb	r1, [r2, #772]
	ldr	r2, [r3, #2824]
	ldr	r0, [r4, #680]
	str	r0, [r2, #776]
	ldr	r2, [r3, #2824]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	strb	r0, [r2, #773]
	ldr	r2, [r3, #2824]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	strb	r0, [r2, #774]
	ldr	r2, [r3, #2824]
	ldr	r0, [r4, #708]
	str	r0, [r2, #788]
	ldr	r2, [r3, #2824]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
	strb	r0, [r2, #775]
	ldr	r2, [r3, #2824]
	ldr	r0, [r4, #732]
	str	r0, [r2, #796]
	ldr	r2, [r3, #2824]
	ldr	r0, [r2, #796]
	str	r0, [r2, #760]
	str	r0, [r2, #44]
	ldr	r2, [r3, #2824]
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	strb	r0, [r2, #1]
	ldr	r2, [r3, #2824]
	strb	r1, [r2, #2]
	ldr	r1, [r4, #680]
	ldr	r2, [r3, #2824]
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	strb	r1, [r2, #5]
	ldr	r1, [r4, #680]
	ldr	r2, [r3, #2824]
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	strb	r1, [r2, #7]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3618
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3618
.L3619:
	add	r7, r7, #45056
	mov	r8, #0
	mov	r2, #664
	add	r1, r4, #16
	ldr	r3, [r7, #2824]
	str	r8, [r3, #40]
	ldr	r0, [r7, #2824]
	add	r0, r0, #72
	bl	memcpy
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #756]
	mov	r2, #1
	ldr	r3, .L3707
	mov	r0, r5
	str	ip, [r1, #48]
	ldr	ip, [r7, #2824]
	ldr	lr, [r4, #688]
	ldr	r1, [r3, #-1884]
	str	lr, [ip, #20]
	add	ip, r1, r2
	ldr	lr, [r7, #2824]
	ldr	r9, [r4, #700]
	str	r9, [lr, #32]
	ldr	lr, [r7, #2824]
	ldr	r9, [r4, #716]
	str	r9, [lr, #36]
	ldr	lr, [r7, #2824]
	ldrb	r9, [r4, #12]	@ zero_extendqisi2
	strb	r9, [lr]
	ldr	lr, [r7, #2824]
	ldr	r9, [r4, #724]
	str	r9, [lr, #792]
	ldr	lr, [r7, #2824]
	ldr	r9, [r4, #760]
	str	r9, [lr, #56]
	ldr	lr, [r7, #2824]
	ldr	r9, [r4, #764]
	str	r9, [lr, #60]
	ldr	lr, [r7, #2824]
	ldrb	r9, [r4, #11]	@ zero_extendqisi2
	strb	r9, [lr, #12]
	ldr	lr, [r7, #2824]
	ldrb	r9, [r4, #10]	@ zero_extendqisi2
	strb	r9, [lr, #10]
	ldr	lr, [r7, #2824]
	str	r1, [lr, #64]
	str	ip, [r3, #-1884]
	ldrb	r3, [r4, #7]	@ zero_extendqisi2
	ldr	r1, [r7, #2824]
	rsb	r3, r2, r3
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r1, #4]
	ldr	r1, [r4, #680]
	bl	MVC_GetAPC
	cmp	r0, #0
	beq	.L3630
	mov	r3, r0
	movw	r2, #2292
	mov	r0, r8
.L3704:
	ldr	r1, .L3707+8
	bl	dprint_vfmw
	mov	r0, r5
	mvn	r1, #0
	bl	MVC_ClearDPB
	mvn	r0, #0
	b	.L3615
.L3631:
	add	r7, r5, r3
	ldr	r2, [r4, #680]
	add	r7, r7, #11075584
	mov	r1, #2
	add	r3, r7, #45056
	str	r2, [r3, #2824]
	strb	r1, [r2, #808]
	ldr	r2, [r3, #2824]
	ldr	r0, [r4, #680]
	str	r0, [r2, #812]
	ldr	r2, [r3, #2824]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	strb	r0, [r2, #809]
	ldr	r2, [r3, #2824]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	strb	r0, [r2, #810]
	ldr	r2, [r3, #2824]
	ldr	r0, [r4, #712]
	str	r0, [r2, #824]
	ldr	r2, [r3, #2824]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
	strb	r0, [r2, #811]
	ldr	r2, [r3, #2824]
	ldr	r0, [r4, #732]
	str	r0, [r2, #832]
	ldr	r2, [r3, #2824]
	ldr	r0, [r2, #796]
	str	r0, [r2, #760]
	str	r0, [r2, #44]
	ldr	r2, [r3, #2824]
	ldrb	r0, [r4, #2]	@ zero_extendqisi2
	strb	r0, [r2, #1]
	ldr	r2, [r3, #2824]
	strb	r1, [r2, #2]
	ldr	r1, [r4, #680]
	ldr	r2, [r3, #2824]
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	strb	r1, [r2, #5]
	ldr	r1, [r4, #680]
	ldr	r2, [r3, #2824]
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	strb	r1, [r2, #7]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3633
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3633
.L3634:
	add	r7, r7, #45056
	mov	r8, #0
	mov	r2, #664
	add	r1, r4, #16
	ldr	r3, [r7, #2824]
	str	r8, [r3, #40]
	ldr	r0, [r7, #2824]
	add	r0, r0, #72
	bl	memcpy
	ldr	r1, [r7, #2824]
	ldr	ip, [r4, #756]
	mov	r2, #2
	ldr	r3, .L3707
	mov	r0, r5
	str	ip, [r1, #48]
	ldr	ip, [r7, #2824]
	ldr	lr, [r4, #688]
	ldr	r1, [r3, #-1884]
	str	lr, [ip, #20]
	add	r9, r1, #1
	ldr	ip, [r7, #2824]
	ldr	lr, [r4, #700]
	str	lr, [ip, #32]
	ldr	ip, [r7, #2824]
	ldr	lr, [r4, #716]
	str	lr, [ip, #36]
	ldr	ip, [r7, #2824]
	ldrb	lr, [r4, #12]	@ zero_extendqisi2
	strb	lr, [ip, #811]
	strb	lr, [ip]
	ldr	ip, [r7, #2824]
	ldr	lr, [r4, #728]
	str	lr, [ip, #828]
	ldr	ip, [r7, #2824]
	ldr	lr, [r4, #760]
	str	lr, [ip, #56]
	ldr	ip, [r7, #2824]
	ldr	lr, [r4, #764]
	str	lr, [ip, #60]
	ldr	ip, [r7, #2824]
	ldrb	lr, [r4, #11]	@ zero_extendqisi2
	strb	lr, [ip, #13]
	ldr	ip, [r7, #2824]
	ldrb	lr, [r4, #10]	@ zero_extendqisi2
	strb	lr, [ip, #11]
	ldr	ip, [r7, #2824]
	str	r1, [ip, #64]
	ldrb	ip, [r4, #7]	@ zero_extendqisi2
	ldr	r1, [r7, #2824]
	cmp	ip, #1
	str	r9, [r3, #-1884]
	moveq	r9, r2
	movne	r9, r8
	strb	r9, [r1, #4]
	ldr	r1, [r4, #680]
	bl	MVC_GetAPC
	cmp	r0, #0
	movne	r3, r0
	movwne	r2, #2417
	movne	r0, r8
	beq	.L3630
	b	.L3704
.L3706:
	ldrb	r3, [r4, #5]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #3
	b	.L3612
.L3633:
	ldr	r2, [r3, #2824]
	mov	r1, #2
	strb	r1, [r2, #3]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, #1
	ldreq	r3, [r3, #2824]
	ldreq	r2, [r4, #692]
	streq	r2, [r3, #28]
	b	.L3634
.L3618:
	ldr	r2, [r3, #2824]
	mov	r1, #1
	strb	r1, [r2, #3]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	cmp	r2, r1
	ldreq	r3, [r3, #2824]
	ldreq	r2, [r4, #692]
	streq	r2, [r3, #28]
	b	.L3619
.L3627:
	ldr	r2, [r7, #2824]
	ldrb	r3, [r2, #3]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r2, #3]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #2824]
	ldreq	r2, [r4, #692]
	streq	r2, [r3, #28]
	b	.L3628
.L3643:
	ldr	r2, [r7, #2824]
	ldrb	r3, [r2, #3]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r2, #3]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r7, #2824]
	ldreq	r2, [r4, #692]
	streq	r2, [r3, #28]
	b	.L3644
.L3708:
	.align	2
.L3707:
	.word	.LANCHOR3
	.word	.LC416
	.word	.LC415
	UNWIND(.fnend)
	.size	MVC_InsertFrmInDPB, .-MVC_InsertFrmInDPB
	.align	2
	.global	MVC_AllocFrameStore
	.type	MVC_AllocFrameStore, %function
MVC_AllocFrameStore:
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
	add	r9, r0, #11075584
	add	r7, r9, #40960
	mov	r6, r0
	str	r1, [fp, #-52]
	ldrb	r5, [r7, #1161]	@ zero_extendqisi2
	cmp	r5, #0
	beq	.L3710
	ldrb	r3, [r7, #1162]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r5, #2
	moveq	r5, #1
.L3710:
	ldr	r3, [fp, #-52]
	cmp	r3, #1
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	beq	.L3711
	cmp	r3, #2
	add	r4, r6, #11141120
	beq	.L3790
	sub	r3, r5, #1
	add	r4, r4, #16384
	cmp	r3, #1
	mov	r3, #0
	strb	r3, [r4, #441]
	bls	.L3794
.L3733:
	mov	r8, #0
	strb	r8, [r4, #440]
	ldr	r10, [r6, #48]
	cmp	r10, r8
	beq	.L3740
	movw	ip, #48440
	add	r9, r9, #45056
	movt	ip, 169
	add	ip, r6, ip
	movw	r3, #47880
	movt	r3, 169
	add	r3, r6, r3
	str	r3, [fp, #-48]
.L3739:
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3735
	cmp	ip, #0
	beq	.L3752
	ldr	lr, [r9, #3016]
	cmp	lr, #0
	beq	.L3752
	ldr	r2, [r9, #2824]
	rsb	r3, ip, r2
	cmp	r2, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L3735
	ldr	r1, [fp, #-48]
	b	.L3737
.L3738:
	ldr	r2, [r1, #4]!
	rsb	r0, ip, r2
	cmp	r2, #0
	clz	r0, r0
	mov	r0, r0, lsr #5
	moveq	r0, #0
	cmp	r0, #0
	bne	.L3735
.L3737:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L3738
.L3752:
	mov	r3, #848
	movw	r2, #48480
	mla	r8, r3, r8, r6
	movt	r2, 169
	movw	r1, #48512
	mov	r9, #0
	mov	r3, #1
	str	ip, [r4, #1120]
	add	r2, r8, r2
	strb	r3, [r4, #440]
	mov	r0, #101
	movt	r1, 169
	str	r9, [r2, #4]
	add	r1, r8, r1
	str	r0, [r4, #1172]
	mov	r2, #664
	add	r0, r4, #456
	mov	r10, ip
	str	r3, [fp, #-48]
	bl	memcpy
	movw	r2, #48440
	str	r9, [r4, #640]
	movt	r2, 169
	add	r2, r8, r2
	ldr	r3, [fp, #-48]
	strb	r9, [r2, #4]
	strb	r9, [r10, #7]
	ldr	r2, [r4, #1120]
	strb	r9, [r2, #3]
	ldr	r2, [r4, #1120]
	strb	r3, [r2, #5]
	ldr	r3, [r4, #1120]
	str	r9, [r3, #16]
	ldrb	r8, [r4, #440]	@ zero_extendqisi2
	cmp	r8, #1
	bne	.L3740
	ldr	r3, [fp, #-52]
	ldr	r0, [r6, #120]
	clz	r1, r3
	mov	r1, r1, lsr #5
	bl	FSP_NewLogicFs
	mov	r10, r0
	mov	r1, r0
	ldr	r0, [r6, #120]
	bl	FSP_GetLogicFs
	mvn	r2, r10
	mov	r2, r2, lsr #31
	cmp	r0, #0
	mov	r3, r0
	moveq	r2, #0
	cmp	r2, #0
	beq	.L3741
	ldr	r2, [r6, #224]
	ldr	r2, [r2, #28]
	cmp	r2, #25
	beq	.L3795
.L3742:
	ldr	r8, .L3802
	add	r1, r3, #8
	ldr	r0, [r4, #1120]
	mov	r2, #664
	str	r3, [fp, #-48]
	ldr	ip, [r8, #52]
	add	r0, r0, #72
	blx	ip
	ldr	r1, [r4, #1120]
	movw	r0, #16840
	mov	r2, #664
	ldr	ip, [r8, #52]
	movt	r0, 170
	add	r1, r1, #72
	add	r0, r6, r0
	blx	ip
	ldr	r2, [r4, #1120]
	ldr	r3, [fp, #-48]
	strb	r10, [r2, #6]
	ldrsb	r3, [r3, #4]
	str	r3, [r4, #1196]
.L3732:
	ldr	r3, [fp, #-52]
	uxtb	r2, r5
	strb	r2, [r4, #443]
	cmp	r3, #1
	moveq	r0, #0
	beq	.L3786
	ldrb	r3, [r7, #1161]	@ zero_extendqisi2
	ldr	r1, [r4, #1120]
	cmp	r3, #0
	movne	r3, #3
	strb	r3, [r1, #736]
	ldrb	r3, [r4, #441]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3796
	strb	r2, [r4, #1976]
	cmp	r5, #0
	ldr	r3, [r7, #1188]
	movne	r0, #0
	moveq	r0, r5
	str	r3, [r4, #1984]
	ldrb	r3, [r7, #1168]	@ zero_extendqisi2
	str	r3, [r4, #1980]
	ldr	r3, [r6, #128]
	str	r3, [r4, #1988]
	ldr	r3, [r7, #2800]
	str	r10, [r4, #1992]
	streqb	r5, [r4, #1977]
	str	r3, [r4, #2000]
	movne	r3, #1
	strneb	r3, [r4, #1977]
.L3786:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3735:
	add	r8, r8, #1
	add	ip, ip, #848
	cmp	r8, r10
	bne	.L3739
.L3740:
	ldr	r1, .L3802+4
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r6
	mov	r1, #1
	bl	MVC_ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3797:
	add	r4, r6, #11141120
	mov	r5, #0
.L3790:
	add	r4, r4, #16384
.L3730:
	mov	r3, #0
	strb	r3, [r4, #441]
	b	.L3733
.L3711:
	cmp	r3, #2
	beq	.L3797
	add	r4, r6, #11141120
	mov	r3, #0
	add	r4, r4, #16384
	mov	r5, r3
	strb	r3, [r4, #441]
	b	.L3733
.L3795:
	ldr	r2, [r6, #16]
	ldr	r8, [r0, #172]
	ldr	r1, [r6, #12]
	mov	r2, r2, asl #4
	ldr	r0, [r0, #52]
	str	r2, [r3, #140]
	mul	r8, r8, r2
	mov	r2, r1, asl #4
	str	r2, [r3, #136]
	str	r3, [fp, #-48]
	add	r0, r8, r0
	str	r0, [r3, #56]
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-48]
	ldr	r2, [r3, #68]
	ldr	ip, [r3, #36]
	add	r2, r8, r2
	ldr	r1, [r3, #172]
	add	r8, r8, ip
	str	r9, [r3, #564]
	str	r8, [r3, #40]
	add	r8, r8, r1
	str	r2, [r3, #72]
	str	r8, [r3, #48]
	str	r0, [r3, #560]
	mov	r0, r2
	bl	MEM_Phy2Vir
	ldr	r3, [fp, #-48]
	str	r9, [r3, #580]
	str	r0, [r3, #576]
	b	.L3742
.L3794:
	ldrb	r3, [r4, #1976]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3714
	ldr	r1, [r4, #2000]
	ldr	r2, [r7, #2800]
	cmp	r1, r2
	beq	.L3715
.L3714:
	add	r3, r9, #45056
	ldr	r1, [r3, #3016]
	subs	r3, r1, #1
	bmi	.L3733
	movw	r2, #28354
	movt	r2, 42
	add	r2, r1, r2
	add	r2, r6, r2, lsl #2
	b	.L3726
.L3717:
	cmp	r5, #2
	beq	.L3798
.L3716:
	subs	r3, r3, #1
	bmi	.L3733
.L3726:
	ldr	r8, [r2, #-4]!
	cmp	r8, #0
	beq	.L3716
	cmp	r5, #1
	bne	.L3717
	ldrb	r1, [r8, #2]	@ zero_extendqisi2
	cmp	r1, #2
	bne	.L3716
.L3718:
	ldr	r0, [r7, #1188]
	ldr	r1, [r8, #20]
	cmp	r0, r1
	bne	.L3716
	ldr	r0, [r7, #2800]
	ldr	r1, [r8, #56]
	cmp	r0, r1
	bne	.L3716
	ldrb	r1, [r7, #1168]	@ zero_extendqisi2
	cmp	r1, #0
	ldrb	r1, [r8, #3]	@ zero_extendqisi2
	beq	.L3799
	cmp	r1, #0
	beq	.L3716
.L3722:
	mov	r3, #1
	mov	r2, #664
	strb	r3, [r4, #441]
	add	r1, r8, #72
	str	r8, [r4, #1120]
	add	r0, r4, #456
	bl	memcpy
	ldrsb	r1, [r8, #6]
	ldr	r0, [r6, #120]
	bl	FSP_GetLogicFs
	subs	r3, r0, #0
	beq	.L3800
	ldrb	r2, [r4, #441]	@ zero_extendqisi2
	ldrsb	r3, [r3, #4]
	cmp	r2, #0
	str	r3, [r4, #1196]
	beq	.L3733
	ldr	r3, [r4, #1120]
	cmp	r3, #0
	beq	.L3733
.L3791:
	mov	r10, #0
	b	.L3732
.L3798:
	ldrb	r1, [r8, #2]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L3716
	b	.L3718
.L3796:
	mov	r3, #0
	strb	r3, [r4, #1976]
	ldr	r2, [r7, #1188]
	mov	r0, r3
	str	r2, [r4, #1984]
	ldrb	r2, [r7, #1168]	@ zero_extendqisi2
	str	r2, [r4, #1980]
	ldr	r2, [r6, #128]
	strb	r3, [r4, #1977]
	str	r10, [r4, #1992]
	str	r2, [r4, #1988]
	ldr	r3, [r7, #2800]
	str	r3, [r4, #2000]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3799:
	cmp	r1, #0
	bne	.L3716
	b	.L3722
.L3715:
	sub	r10, r5, #2
	cmp	r3, #1
	cmpeq	r5, #2
	clz	r10, r10
	mov	r10, r10, lsr #5
	beq	.L3727
	cmp	r5, #1
	cmpeq	r3, #2
	bne	.L3733
.L3727:
	ldr	r2, [r4, #1984]
	ldr	r3, [r7, #1188]
	cmp	r2, r3
	bne	.L3733
	ldrb	r3, [r7, #1168]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r3, [r4, #1980]
	bne	.L3728
	cmp	r3, #0
	bne	.L3733
.L3729:
	ldr	r3, [r6, #128]
	ldr	r2, [r6, #124]
	rsb	r3, r2, r3
	cmp	r3, #2
	bhi	.L3733
	ldr	r3, [r4, #1120]
	mov	r2, #1
	strb	r2, [r4, #441]
	cmp	r3, #0
	beq	.L3730
	cmp	r10, #0
	bne	.L3801
	cmp	r5, #1
	bne	.L3732
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3730
	b	.L3732
.L3741:
	ldr	r3, [r4, #1120]
	mov	r0, r2
	strb	r2, [r4, #440]
	ldr	r1, .L3802+8
	strb	r2, [r3, #5]
	bl	dprint_vfmw
	mov	r1, r8
	mov	r0, r6
	bl	MVC_ClearAll
	mvn	r0, #0
	b	.L3786
.L3800:
	movw	r2, #6621
	ldr	r1, .L3802+12
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L3786
.L3801:
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, r2
	bne	.L3730
	b	.L3791
.L3728:
	cmp	r3, #0
	beq	.L3733
	b	.L3729
.L3803:
	.align	2
.L3802:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC418
	.word	.LC419
	.word	.LC417
	UNWIND(.fnend)
	.size	MVC_AllocFrameStore, .-MVC_AllocFrameStore
	.align	2
	.global	MVC_DEC_Init
	.type	MVC_DEC_Init, %function
MVC_DEC_Init:
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
	ldr	r8, .L3816
	movw	r2, #20280
	ldr	r4, [r0, #928]
	mov	r6, r0
	mov	r5, r1
	movt	r2, 170
	mov	r1, #0
	ldr	r3, [r8, #48]
	blx	r3
	str	r4, [r6, #928]
	add	r0, r6, #584
	mov	r4, #2240
	bl	ResetVoQueue
	str	r5, [r6, #224]
	mov	r3, #0
	str	r3, [r6, #228]
	strb	r3, [r6]
	ldr	r3, [r5, #28]
	cmp	r3, #25
	ldreq	r3, [r5, #684]
	movne	r3, #32
	movne	r2, #256
	strne	r3, [r6, #36]
	movne	r3, #136
	streq	r3, [r6, #36]
	ldreq	r3, [r5, #688]
	streq	r3, [r6, #40]
	ldreq	r3, [r5, #676]
	str	r3, [r6, #32]
	strne	r2, [r6, #40]
	ldr	r0, [r5, #584]
	bl	MEM_Phy2Vir
	ldr	ip, [r6, #36]
	ldr	r3, [r6, #224]
	movw	r2, #3992
	ldr	lr, [r6, #40]
	mul	r2, r2, ip
	ldr	r3, [r3, #580]
	add	r3, r0, r3
	str	r3, [r6, #248]
	add	r0, r3, r2
	str	r0, [r6, #252]
	cmp	r3, #0
	cmpne	r0, #0
	mla	r0, r4, lr, r0
	moveq	r1, #1
	movne	r1, #0
	cmp	r0, #0
	orreq	r1, r1, #1
	cmp	r1, #0
	str	r0, [r6, #544]
	bne	.L3813
	ldr	r5, [r5, #608]
	cmp	r5, #0
	beq	.L3814
.L3809:
	add	r3, r6, #11075584
	movw	r2, #4060
	add	r1, r3, #36864
	add	r3, r3, #32768
	ldr	r9, [r8, #48]
	add	r4, r6, #12992
	str	lr, [r1, #1904]
	mov	r1, #0
	str	ip, [r3, #2728]
	mov	r5, r1
	ldr	r3, [r6, #32]
	add	r4, r4, #12
	movw	r7, #22860
	movt	r7, 164
	add	r7, r6, r7
	mul	r2, r2, r3
	blx	r9
	ldr	r3, [r6, #108]
	mov	r2, #9856
	mov	ip, #40
	strb	r5, [r6, #4]
	ubfx	r3, r3, #16, #2
	str	ip, [r6, #48]
	mov	r1, r5
	strb	r3, [r6, #8]
	movt	r2, 164
	strb	r5, [r6, #6]
	mov	r3, #18
	strb	r5, [r6, #7]
	mov	r0, r4
	str	r3, [r6, #52]
	str	r5, [r6, #68]
	ldr	r3, [r8, #48]
	str	r5, [r6, #72]
	str	r5, [r6, #76]
	str	r5, [r6, #80]
	str	r5, [r6, #84]
	str	r5, [r6, #88]
	str	r5, [r6, #92]
	str	r5, [r6, #96]
	str	r5, [r6, #60]
	str	r5, [r6, #528]
	str	r5, [r6, #532]
	str	r5, [r6, #536]
	str	r5, [r6, #540]
	str	r5, [r6, #220]
	str	r5, [r6, #56]
	blx	r3
	movw	r2, #8500
	ldr	r3, [r8, #48]
	movt	r2, 5
	mov	r0, r7
	mov	r1, r5
	blx	r3
	mov	r3, r4
	mov	r2, r5
.L3810:
	strb	r2, [r3]
	add	ip, r3, #274432
	add	r3, r3, #335872
	mov	r4, #0
	add	r3, r3, #308
	strb	r2, [ip, #241]
	cmp	r3, r7
	bne	.L3810
	add	r2, r6, #12288
	movw	r3, #34752
	mov	r1, #32
	movt	r3, 169
	strb	r4, [r2, #704]
	add	r3, r6, r3
	mov	r0, r6
	str	r3, [r6, #236]
	str	r4, [r6, #20]
	strb	r4, [r6, #2]
	str	r1, [r6, #24]
	str	r1, [r6, #28]
	bl	VCTRL_GetChanIDByCtx
	cmn	r0, #1
	str	r0, [r6, #120]
	beq	.L3815
	mov	r1, r4
	mov	r0, r6
	bl	MVC_ClearAll
	mov	r0, #1
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3814:
	mov	r0, r3
	mov	r1, r5
	ldr	r3, [r8, #48]
	blx	r3
	ldr	r2, [r6, #40]
	mov	r1, r5
	ldr	r3, [r8, #48]
	ldr	r0, [r6, #252]
	mul	r2, r4, r2
	blx	r3
	ldr	lr, [r6, #40]
	ldr	ip, [r6, #36]
	ldr	r0, [r6, #544]
	b	.L3809
.L3813:
	movw	r3, #13910
	ldr	r2, .L3816+4
	ldr	r1, .L3816+8
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3815:
	mov	r0, r4
	ldr	r1, .L3816+12
	bl	dprint_vfmw
	mvn	r0, #19
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L3817:
	.align	2
.L3816:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LANCHOR0+332
	.word	.LC420
	.word	.LC421
	UNWIND(.fnend)
	.size	MVC_DEC_Init, .-MVC_DEC_Init
	.align	2
	.global	MVC_StorePicInDpb
	.type	MVC_StorePicInDpb, %function
MVC_StorePicInDpb:
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
	add	r4, r0, #11075584
	add	r7, r0, #11141120
	add	r2, r4, #40960
	add	r6, r7, #16384
	mov	r8, #0
	strb	r8, [r2, #24]
	mov	r5, r0
	ldrb	r3, [r6, #443]	@ zero_extendqisi2
	sub	r3, r3, #2
	clz	r3, r3
	mov	r3, r3, lsr #5
	strb	r3, [r2, #25]
	ldrb	r3, [r6, #440]	@ zero_extendqisi2
	cmp	r3, r8
	beq	.L3981
	ldr	r3, [r0, #128]
	str	r3, [r0, #124]
	ldrb	r3, [r6, #453]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3982
.L3821:
	ldrb	r0, [r5, #8]	@ zero_extendqisi2
	cmp	r0, #2
	beq	.L3983
	ldr	r8, [r5, #224]
	ldr	r3, [r8, #12]
	cmp	r3, #0
	ble	.L3984
.L3826:
	ldrb	r2, [r6, #442]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3985
.L3827:
	cmp	r3, #2
	ldr	r3, [r6, #1136]
	beq	.L3986
.L3852:
	cmp	r3, #0
	beq	.L3859
	ldr	r3, [r5, #112]
	ldr	r2, [r6, #1172]
	cmp	r3, r2
	bcs	.L3860
	ldrb	r1, [r6, #442]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L3987
.L3860:
	mov	r0, r5
	bl	MVC_Marking
	cmp	r0, #0
	bne	.L3988
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	ldr	r1, [r6, #1200]
	mov	r0, r5
	bl	MVC_RemoveUnUsedFrameStore
.L3853:
	ldrb	r3, [r6, #441]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3863
	add	r4, r4, #45056
	ldr	ip, [r4, #3016]
.L3864:
	ldr	r3, [r6, #1136]
	cmp	r3, #0
	beq	.L3873
	ldr	r2, [r4, #3024]
	ldr	r3, [r4, #3028]
	add	r1, r3, r2
	cmp	r1, ip
	bcs	.L3898
.L3873:
	mvn	r9, #0
	mov	r8, r9
	b	.L3882
.L3877:
	ldr	r3, [r6, #1136]
	mov	r1, r8
	mov	r0, r5
	mov	r9, r2
	cmp	r3, #0
	bne	.L3878
	ldr	r2, [r6, #1140]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L3989
.L3878:
	bl	MVC_OutputFrmFromDPB
	cmn	r0, #1
	mov	r10, r0
	beq	.L3881
	ldr	ip, [r4, #3016]
.L3882:
	ldr	lr, [r4, #3020]
	sub	r3, fp, #52
	sub	r2, fp, #56
	mvn	r1, #0
	cmp	lr, ip
	mov	r0, r5
	bcc	.L3875
	bl	MVC_GetMinPOC
	cmp	r0, #0
	blt	.L3990
	ldr	r2, [r4, #3020]
	cmp	r2, r9
	ldrne	r8, [fp, #-52]
	bne	.L3877
	ldr	r3, [fp, #-52]
	cmp	r3, r8
	beq	.L3991
	mov	r8, r3
	b	.L3877
.L3982:
	ldr	r3, [r6, #1124]
	ldrb	r9, [r3, #1]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L3822
	bl	MVC_InitDPB
	cmp	r0, #0
	beq	.L3821
	mov	r0, r8
	ldr	r1, .L4007
	bl	dprint_vfmw
	mov	r3, #3616
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L3985:
	ldrb	r1, [r6, #443]	@ zero_extendqisi2
	ldr	r10, [r6, #1120]
	sub	r2, r1, #1
	cmp	r2, #1
	movhi	r2, #0
	movls	r2, #1
	cmp	r1, #0
	beq	.L3828
	ldrb	r0, [r10, #2]	@ zero_extendqisi2
	cmp	r0, #0
	moveq	ip, r2
	orrne	ip, r2, #1
	cmp	ip, #0
	beq	.L3827
	cmp	r2, #0
	beq	.L3992
.L3901:
	ldr	r2, [r5, #220]
	cmp	r2, #0
	bne	.L3831
	add	r0, r6, #1200
	mov	r3, #1
	add	r0, r0, #8
	str	r3, [r5, #220]
	mov	r2, #768
	add	r1, r6, #440
	bl	memcpy
	ldr	r3, [r8, #12]
	b	.L3827
.L3859:
	ldrb	r3, [r6, #441]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L3863
	add	r4, r4, #45056
	ldr	ip, [r4, #3016]
	b	.L3873
.L3828:
	cmp	r2, #0
	bne	.L3901
.L3834:
	cmp	r3, #0
	ble	.L3904
	movw	r3, #16824
	mov	r8, r10
	movt	r3, 170
	add	r3, r5, r3
.L3837:
	cmp	r1, #0
	beq	.L3839
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L3993
.L3839:
	ldr	r2, [r3, #732]
	str	r2, [r8, #44]
.L3840:
	mov	r1, r8
	mov	r0, r5
	str	r3, [fp, #-64]
	bl	MVC_GetImagePara
	ldrsb	r1, [r8, #6]
	ldr	r0, [r5, #120]
	bl	FSP_GetFsImagePtr
	ldr	r3, [fp, #-64]
	subs	r9, r0, #0
	beq	.L3994
	add	r2, r3, #656
	add	r0, r3, #672
	add	ip, r9, #640
	add	r1, r9, #656
	ldrd	r2, [r2]
	strd	r2, [ip]
	ldrd	r2, [r0, #-8]
	strd	r2, [r1, #-8]
	ldrd	r2, [r0]
	strd	r2, [r1]
	ldr	r2, [r8, #44]
	cmp	r2, #0
	str	r2, [r9, #184]
	beq	.L3847
	ldrb	r3, [r9, #124]	@ zero_extendqisi2
	ands	r3, r3, #3
	beq	.L3995
.L3845:
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #4]
	cmp	r3, r2
	bcc	.L3996
.L3847:
	mov	r2, #1
	ldrsb	r1, [r8, #6]
	ldr	r0, [r5, #120]
	bl	FSP_SetDisplay
	ldr	r0, [r5, #120]
	add	r3, r5, #584
	str	r9, [sp]
	mov	r2, r5
	mov	r1, #15
	bl	InsertImgToVoQueue
	cmp	r0, #1
	beq	.L3844
	mov	r2, #0
	ldrsb	r1, [r8, #6]
	ldr	r0, [r5, #120]
	bl	FSP_SetDisplay
.L3844:
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #604]
	add	r3, r3, #2032
	add	r3, r3, #15
	cmp	r3, #4096
	movcc	r3, #0
	strcc	r3, [r9, #24]
	bcs	.L3997
.L3850:
	ldr	r3, [r5, #136]
	add	r3, r3, #2
	str	r3, [r5, #136]
.L3838:
	ldr	r3, [r5, #220]
	cmp	r3, #2
	beq	.L3851
.L3836:
	mov	r3, #1
	str	r3, [r8, #16]
	strb	r3, [r10, #8]
.L3851:
	ldr	r3, [r5, #224]
	mov	r2, #2
	str	r2, [r5, #220]
	ldr	r3, [r3, #12]
	cmp	r3, #2
	ldr	r3, [r6, #1136]
	bne	.L3852
.L3986:
	cmp	r3, #0
	beq	.L3853
	add	r4, r4, #45056
	mov	r0, r5
	bl	MVC_SimpleSlideDPB
	ldr	r1, [r4, #3016]
	cmp	r1, #0
	beq	.L3854
	ldr	r3, [r4, #2824]
	cmp	r3, #0
	beq	.L3906
	movw	r2, #47880
	mov	r3, #0
	movt	r2, 169
	add	r2, r5, r2
	b	.L3855
.L3856:
	ldr	r0, [r2, #4]!
	cmp	r0, #0
	beq	.L3906
.L3855:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L3856
.L3854:
	movw	r2, #16824
	mov	r0, r5
	movt	r2, 170
	add	r2, r5, r2
	bl	MVC_InsertFrmInDPB
	subs	r8, r0, #0
	bne	.L3998
	ldr	r1, [r4, #3020]
	mov	r0, r5
	add	r1, r1, #1
	str	r1, [r4, #3020]
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	mov	r2, r8
	movw	r3, #3797
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3858
.L3863:
	ldr	r3, [r5, #520]
	ldr	lr, [r6, #1120]
	cmp	r3, #0
	rsb	r2, r3, lr
	clz	r2, r2
	mov	r2, r2, lsr #5
	moveq	r2, #0
	cmp	r2, #0
	beq	.L3999
	mov	r0, r5
	bl	MVC_DirectOutput
	cmn	r0, #1
	mov	r4, r0
	beq	.L4000
.L3869:
	movw	r3, #3849
	mov	r2, r4
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3825
.L3990:
	ldr	r1, .L4007+8
	movw	r2, #3899
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
.L3875:
	ldr	r3, [r6, #1136]
	cmp	r3, #0
	beq	.L3887
	ldrb	r3, [r6, #444]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3887
	ldr	r2, [r4, #3024]
	cmp	r2, #0
	beq	.L3887
	movw	ip, #47940
	mov	lr, r3
	movt	ip, 169
	add	ip, r5, ip
	b	.L3892
.L3889:
	ldr	r2, [r4, #3024]
	cmp	r2, r3
	bls	.L3887
.L3892:
	ldr	r2, [ip, #4]!
	add	r3, r3, #1
	ldr	r1, [r6, #1128]
	ldr	r0, [r2, #20]
	cmp	r0, r1
	bne	.L3889
	ldr	r0, [r2, #56]
	ldr	r1, [r6, #1200]
	cmp	r0, r1
	bne	.L3889
	strb	lr, [r2, #3]
	ldr	r1, [ip]
	ldrb	r2, [r1, #5]	@ zero_extendqisi2
	cmp	r2, #1
	streqb	r2, [r1, #7]
	ldreq	r2, [ip]
	streqb	lr, [r2, #5]
	ldreq	r1, [ip]
	ldr	r0, [r5, #52]
	ldr	r2, [r1, #48]
	cmp	r2, r0
	add	r2, r5, r2, lsl #2
	strne	lr, [r2, #148]
	strne	r0, [r1, #48]
	b	.L3889
.L3887:
	ldr	r1, [r4, #3016]
	cmp	r1, #0
	beq	.L3886
	ldr	r3, [r4, #2824]
	cmp	r3, #0
	beq	.L3910
	movw	r2, #47880
	mov	r3, #0
	movt	r2, 169
	add	r2, r5, r2
	b	.L3893
.L3894:
	ldr	r0, [r2, #4]!
	cmp	r0, #0
	beq	.L3910
.L3893:
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L3894
.L3886:
	movw	r2, #16824
	mov	r0, r5
	movt	r2, 170
	add	r2, r5, r2
	bl	MVC_InsertFrmInDPB
	cmp	r0, #0
	bne	.L4001
	ldr	r3, [r4, #3020]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #3020]
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
.L3858:
	mov	r4, #0
.L3896:
	add	r7, r7, #16384
	mov	r3, #0
	mov	r0, r4
	strb	r3, [r7, #440]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L3822:
	mvn	r1, #0
	bl	MVC_FlushDPB
	cmp	r0, #0
	beq	.L3821
	mov	r0, r9
	ldr	r1, .L4007+12
	bl	dprint_vfmw
	movw	r3, #3626
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L3984:
	ldr	r2, [r5, #220]
	cmp	r2, #2
	bne	.L3826
	b	.L3827
.L3999:
	add	r4, r4, #45056
	ldr	ip, [r4, #3016]
	cmp	ip, #0
	beq	.L3866
	ldr	r3, [r4, #2824]
	adds	r1, r3, #0
	movne	r1, #1
	cmp	lr, r3
	movne	r1, #0
	cmp	r1, #0
	movweq	r2, #47880
	movteq	r2, 169
	addeq	r2, r5, r2
	bne	.L4002
.L3870:
	add	r1, r1, #1
	cmp	r1, ip
	beq	.L3864
	ldr	r3, [r2, #4]!
	adds	r0, r3, #0
	movne	r0, #1
	cmp	lr, r3
	movne	r0, #0
	cmp	r0, #0
	beq	.L3870
.L3867:
	movw	r2, #16824
	mov	r0, r5
	movt	r2, 170
	add	r2, r5, r2
	bl	MVC_InsertFrmInDPB
	cmn	r0, #1
	mov	r4, r0
	beq	.L4003
	mov	r0, r5
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	movw	r3, #3875
	mov	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3858
.L3992:
	cmp	r0, #0
	beq	.L3827
	b	.L3834
.L3910:
	mov	r1, r3
	b	.L3886
.L3881:
	mov	r3, r0
	movw	r2, #3939
	ldr	r1, .L4007+16
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, r10
	movw	r3, #3940
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
.L3900:
	ldr	r3, [r6, #1120]
	mov	r2, #1
	ldr	r0, [r5, #120]
	mvn	r4, #0
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
	mov	r3, r4
	movw	r2, #3998
	ldr	r1, .L4007+16
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r2, [r6, #1120]
	mov	r3, #0
	strb	r3, [r2, #5]
	ldr	r2, [r6, #1120]
	strb	r3, [r2, #2]
	b	.L3896
.L3983:
	ldr	r1, .L4007+20
	bl	dprint_vfmw
	mov	r0, r5
	bl	MVC_DirectOutput
	ldr	r3, [r6, #1196]
	ldr	r2, [r5, #52]
	cmp	r3, r2
	addne	r3, r3, #36
	movne	r1, #0
	addne	r3, r5, r3, lsl #2
	mov	r4, r0
	strne	r1, [r3, #4]
	strne	r2, [r6, #1196]
	movw	r3, #3645
	mov	r2, r0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
.L3825:
	cmn	r4, #1
	bne	.L3896
	b	.L3900
.L3831:
	cmp	r2, #1
	beq	.L4004
	cmp	r1, #0
	beq	.L3834
	ldrb	r2, [r10, #2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L3834
	b	.L3827
.L3989:
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L4005
.L3879:
	mov	r0, r5
	bl	MVC_DirectOutput
	cmn	r0, #1
	mov	r4, r0
	beq	.L4006
.L3880:
	movw	r3, #3931
	mov	r2, r4
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3825
.L3904:
	mov	r8, r10
	b	.L3838
.L3991:
	mov	r3, r8
	ldr	r2, .L4007+24
	ldr	r1, .L4007+28
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #3908
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L3997:
	mov	r1, r9
	mov	r0, r5
	bl	MVC_SetFrmRepeatCount.part.1
	b	.L3850
.L3906:
	mov	r1, r3
	b	.L3854
.L4005:
	ldrb	r3, [r6, #443]	@ zero_extendqisi2
	cmp	r3, #0
	ldrne	r3, [r6, #1120]
	strne	r3, [r5, #524]
	b	.L3879
.L4004:
	cmp	r3, #0
	ldr	r8, [r6, #1888]
	ble	.L3836
	movw	r3, #17592
	ldrb	r1, [r6, #1211]	@ zero_extendqisi2
	movt	r3, 170
	add	r3, r5, r3
	b	.L3837
.L3995:
	movw	r2, #3726
	ldr	r1, .L4007+32
	mov	r0, #1
	str	r3, [fp, #-64]
	bl	dprint_vfmw
	ldr	r2, .L4007+36
	ldr	ip, [r2]
	cmp	ip, #0
	beq	.L3846
	ldr	r3, [fp, #-64]
	mov	r1, #111
	ldr	r0, [r5, #120]
	mov	r2, r3
	blx	ip
.L3846:
	ldr	r2, [r9, #184]
	cmp	r2, #0
	bne	.L3845
	b	.L3847
.L3993:
	mov	r1, #3
	ldr	r2, [r8, #44]
	strb	r1, [r8, #2]
	ldr	r1, [r3, #732]
	add	r2, r2, r1
	str	r2, [r8, #44]
	b	.L3840
.L3981:
	mov	r0, r3
	ldr	r1, .L4007+40
	bl	dprint_vfmw
	movw	r3, #3602
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L4006:
	mov	r3, r0
	movw	r2, #3928
	ldr	r1, .L4007+16
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3880
.L3988:
	mov	r2, r0
	ldr	r1, .L4007+44
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #3822
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L4001:
	mov	r3, r0
	mov	r2, #3984
	ldr	r1, .L4007+16
	mov	r0, #1
	bl	dprint_vfmw
	movw	r3, #3985
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L4002:
	mov	r1, r2
	b	.L3867
.L3866:
	ldr	r3, [r6, #1136]
	cmp	r3, #0
	beq	.L3873
	ldr	r2, [r4, #3024]
	ldr	r3, [r4, #3028]
.L3898:
	str	r3, [sp, #4]
	mov	r0, #1
	mov	r3, ip
	str	r2, [sp]
	ldr	r1, .L4007+48
	mov	r2, #3888
	bl	dprint_vfmw
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	movw	r3, #3891
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L3987:
	ldr	r1, .L4007+52
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4007+36
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L3861
	ldr	r4, [r6, #1172]
	mov	r3, #8
	ldr	lr, [r5, #112]
	sub	r2, fp, #52
	mov	r1, #104
	ldr	r0, [r5, #120]
	str	r4, [fp, #-52]
	str	lr, [fp, #-48]
	blx	ip
.L3861:
	mov	r0, r5
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	movw	r3, #3813
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L4000:
	mov	r3, r0
	movw	r2, #3845
	ldr	r1, .L4007+16
	mov	r0, #1
	bl	dprint_vfmw
	b	.L3869
.L3998:
	mov	r3, r8
	movw	r2, #3788
	ldr	r1, .L4007+16
	mov	r0, #0
	bl	dprint_vfmw
	movw	r3, #3789
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L4003:
	mov	r3, r0
	movw	r2, #3868
	ldr	r1, .L4007+16
	mov	r0, #1
	bl	dprint_vfmw
	mov	r2, r4
	movw	r3, #3869
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L3996:
	ldrsb	r1, [r8, #6]
	mov	r2, #0
	ldr	r0, [r5, #120]
	bl	FSP_SetDisplay
	movw	r3, #3745
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L3994:
	movw	r3, #3715
	mvn	r2, #0
	ldr	r1, .L4007+4
	mov	r0, #14
	bl	dprint_vfmw
	b	.L3900
.L4008:
	.align	2
.L4007:
	.word	.LC424
	.word	.LC423
	.word	.LC432
	.word	.LC425
	.word	.LC428
	.word	.LC426
	.word	.LANCHOR0+348
	.word	.LC433
	.word	.LC427
	.word	g_event_report
	.word	.LC422
	.word	.LC430
	.word	.LC431
	.word	.LC429
	UNWIND(.fnend)
	.size	MVC_StorePicInDpb, .-MVC_StorePicInDpb
	.global	__aeabi_idivmod
	.align	2
	.global	MVC_DecGap
	.type	MVC_DecGap, %function
MVC_DecGap:
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
	ldrb	r1, [r0, #3]	@ zero_extendqisi2
	movw	r7, #2004
	mov	r5, r0
	add	r3, r0, #11075584
	str	r3, [fp, #-76]
	mul	r7, r7, r1
	ldr	r1, [r0, #236]
	movw	r0, #43824
	add	r6, r3, #40960
	movt	r0, 169
	mov	r8, r3
	add	ip, r5, r7
	ldr	r2, [r6, #2804]
	add	r0, ip, r0
	movw	r3, #26918
	movt	r3, 42
	add	r3, r2, r3
	ldrb	r0, [r0, #3]	@ zero_extendqisi2
	add	r2, r5, #11141120
	ldrb	lr, [r1, #19]	@ zero_extendqisi2
	add	ip, r8, #45056
	mov	r4, r2
	str	r2, [fp, #-72]
	str	r0, [fp, #-68]
	add	r2, r5, r3, lsl #2
	ldr	r0, [r6, #1188]
	movw	r3, #43824
	add	r4, r4, #16384
	movt	r3, 169
	add	r3, r7, r3
	cmp	lr, #1
	str	r0, [fp, #-48]
	add	r3, r5, r3
	ldr	r0, [r6, #64]
	ldr	r2, [r2, #4]
	ldr	r9, [r1, #2896]
	str	r0, [fp, #-60]
	ldr	r0, [r6, #68]
	str	r3, [r4, #1124]
	ldr	r7, [ip, #3020]
	str	r0, [fp, #-64]
	moveq	r0, #2
	movne	r0, #0
	cmp	r7, #0
	str	r0, [fp, #-52]
	beq	.L4024
	add	r9, r9, #4
	mov	r7, #1
	mov	r3, r7, asl r9
	add	r0, r2, r7
	str	r3, [fp, #-56]
	mov	r1, r3
	bl	__aeabi_uidivmod
	mov	r3, #0
	mov	r0, #2
	str	r3, [r6, #68]
	str	r3, [r6, #64]
	mov	r9, r1
	ldr	r1, .L4027
	bl	dprint_vfmw
	ldr	r8, [fp, #-48]
	mov	r3, r9
	ldr	r1, .L4027+4
	mov	r0, #2
	mov	r2, r8
	bl	dprint_vfmw
	cmp	r8, r9
	mov	r3, r8
	movgt	r3, r4
	movgt	r4, r9
	movgt	r9, r3
	bgt	.L4017
	b	.L4018
.L4015:
	strb	r8, [r9, #444]
	mov	r0, r5
	bl	MVC_StorePicInDpb
	movw	lr, #26918
	movt	lr, 42
	ldr	r1, [fp, #-56]
	subs	r3, r0, #0
	add	r0, r4, #1
	bne	.L4025
	ldr	r3, [r6, #2804]
	add	lr, r3, lr
	add	lr, r5, lr, lsl #2
	str	r4, [lr, #4]
	bl	__aeabi_idivmod
	ldr	r3, [fp, #-48]
	cmp	r3, r1
	mov	r4, r1
	ble	.L4018
.L4017:
	mov	r1, #1
	mov	r0, r5
	bl	MVC_AllocFrameStore
	mov	r8, #0
	ldr	r1, .L4027+8
	subs	r10, r0, #0
	mov	r0, #2
	bne	.L4026
	bl	dprint_vfmw
	ldr	r1, [r9, #1120]
	strb	r7, [r9, #446]
	ldr	r3, [fp, #-52]
	str	r4, [r1, #20]
	ldr	r1, [r9, #1120]
	str	r4, [r9, #1128]
	str	r4, [r1, #748]
	ldr	r1, [r9, #1120]
	str	r3, [r9, #1136]
	str	r10, [r1, #744]
	ldr	r1, [r9, #1120]
	strb	r7, [r1, #7]
	ldr	r1, [r9, #1120]
	strb	r10, [r1, #5]
	ldr	r1, [r9, #1120]
	strb	r7, [r1, #1]
	strb	r7, [r9, #442]
	ldr	r1, [r9, #1124]
	ldr	r0, [r6, #2800]
	str	r0, [r9, #1200]
	strb	r10, [r1, #3]
	ldr	r3, [r5, #236]
	ldr	r3, [r3, #2900]
	cmp	r3, #0
	beq	.L4015
	str	r4, [r6, #80]
	mov	r0, r5
	bl	MVC_DecPOC
	ldr	r3, [r6, #60]
	str	r3, [r9, #1140]
	ldr	r3, [r6, #56]
	str	r3, [r9, #1144]
	ldr	r3, [r6, #48]
	str	r3, [r9, #1148]
	ldr	r3, [r6, #52]
	str	r3, [r9, #1152]
	b	.L4015
.L4024:
	ldr	r1, .L4027+12
	mov	r0, r7
	bl	dprint_vfmw
	mov	r0, r7
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4018:
	ldr	r2, [fp, #-60]
	mov	r0, #0
	ldr	r3, [fp, #-72]
	str	r2, [r6, #64]
	add	r3, r3, #16384
	ldr	r2, [fp, #-64]
	str	r2, [r6, #68]
	ldrb	r2, [fp, #-68]	@ zero_extendqisi2
	ldr	r3, [r3, #1124]
	strb	r2, [r3, #3]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4026:
	ldr	r2, [fp, #-60]
	mov	r0, r8
	ldr	r3, [fp, #-72]
	ldr	r1, .L4027+16
	str	r2, [r6, #64]
	add	r3, r3, #16384
	ldr	r2, [fp, #-64]
	str	r2, [r6, #68]
	ldrb	r2, [fp, #-68]	@ zero_extendqisi2
	ldr	r3, [r3, #1124]
	strb	r2, [r3, #3]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4025:
	ldr	r2, [fp, #-76]
	mov	r0, r8
	ldr	ip, [fp, #-60]
	add	r1, r2, #40960
	ldrb	lr, [fp, #-68]	@ zero_extendqisi2
	movw	r2, #6921
	str	ip, [r1, #64]
	ldr	ip, [fp, #-64]
	str	ip, [r1, #68]
	ldr	ip, [r9, #1124]
	ldr	r1, .L4027+20
	strb	lr, [ip, #3]
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4028:
	.align	2
.L4027:
	.word	.LC435
	.word	.LC436
	.word	.LC438
	.word	.LC434
	.word	.LC437
	.word	.LC439
	UNWIND(.fnend)
	.size	MVC_DecGap, .-MVC_DecGap
	.align	2
	.global	MVC_InitPic
	.type	MVC_InitPic, %function
MVC_InitPic:
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
	UNWIND(.pad #28)
	sub	sp, sp, #28
	add	r4, r0, #11141120
	add	r7, r0, #11075584
	add	r4, r4, #16384
	add	r6, r7, #40960
	ldr	r3, [r0, #252]
	mov	r5, r0
	ldrb	r0, [r4, #440]	@ zero_extendqisi2
	ldr	r2, [r6, #1176]
	mov	r1, #0
	cmp	r0, r1
	mov	r9, #2240
	str	r1, [fp, #-48]
	mla	r9, r9, r2, r3
	beq	.L4030
	ldr	r3, [r4, #1120]
	cmp	r3, r1
	beq	.L4031
	ldrb	r8, [r3, #2]	@ zero_extendqisi2
	cmp	r8, r1
	beq	.L4188
.L4031:
	mov	r3, #0
	strb	r3, [r4, #440]
.L4030:
	sub	r1, fp, #48
	mov	r0, r5
	bl	MVC_GetReRangeFlag
	ldrb	r3, [r6, #1172]	@ zero_extendqisi2
	cmp	r3, #255
	mov	r10, r0
	beq	.L4189
.L4032:
	cmp	r3, #0
	bne	.L4035
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L4190
	ldr	r3, [r9, #28]
	ldr	r2, [r5, #28]
	cmp	r2, r3
	movweq	r3, #35364
	movteq	r3, 168
	addeq	r3, r5, r3
	streq	r3, [r5, #236]
	bne	.L4191
.L4035:
	add	r8, r7, #36864
	ldr	r3, [r9, #24]
	ldr	r2, [r8, #1904]
	cmp	r2, r3
	beq	.L4192
.L4039:
	mov	r3, #0
	mov	r1, r9
	strb	r3, [r9, #20]
	ldr	r0, [r5, #236]
	bl	mvc_assign_quant_params
	ldr	r3, .L4205
	movw	r0, #38744
	mov	r2, #2240
	movt	r0, 169
	mov	r1, r9
	add	r0, r5, r0
	ldr	r3, [r3, #56]
	blx	r3
.L4040:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ldr	r3, [r5, #224]
	bne	.L4193
	ldr	r3, [r3, #872]
	cmp	r3, #1
	beq	.L4042
.L4051:
	ldr	r2, [r8, #1904]
	ldr	r3, [r9, #24]
	cmp	r2, r3
	bne	.L4060
	ldrb	r3, [r9, #20]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4060
.L4061:
	ldrb	r3, [r6, #1172]	@ zero_extendqisi2
	cmp	r3, #255
	moveq	r3, #0
	streq	r3, [r6, #2804]
	beq	.L4063
	cmp	r3, #0
	bne	.L4063
	add	r1, r5, #10747904
	movw	r2, #22868
	add	r1, r1, #20480
	movt	r2, 164
	ldr	ip, [r6, #2800]
	add	r2, r5, r2
	ldr	r0, [r1, #2384]
	adds	r0, r0, #1
	beq	.L4064
	ldr	r1, [r1, #2388]
	cmp	ip, r1
	beq	.L4105
	mov	lr, r0
	b	.L4065
.L4066:
	ldr	r1, [r2, #4]!
	cmp	ip, r1
	beq	.L4064
.L4065:
	add	r3, r3, #1
	cmp	r3, lr
	mov	r0, r3
	bne	.L4066
.L4064:
	str	r0, [r6, #2804]
.L4063:
	ldrb	r2, [r6, #1163]	@ zero_extendqisi2
	ldr	r3, [r5, #236]
	cmp	r2, #5
	ldreq	r2, [r6, #2804]
	ldr	r10, [r3, #2896]
	movweq	r3, #26918
	movteq	r3, 42
	addeq	r3, r2, r3
	ldreq	r9, [r6, #1188]
	addeq	r3, r5, r3, lsl #2
	ldrne	r9, [r6, #1188]
	streq	r9, [r3, #4]
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L4069
	ldr	r2, [r5, #224]
	ldr	r3, [r2, #12]
	str	r2, [fp, #-56]
	cmp	r3, #2
	beq	.L4069
	ldr	r1, [r6, #2804]
	movw	r3, #26918
	movt	r3, 42
	add	r3, r1, r3
	add	r3, r5, r3, lsl #2
	ldr	r0, [r3, #4]
	cmp	r0, r9
	beq	.L4069
	mov	r3, #1
	add	r10, r10, #4
	mov	r10, r3, asl r10
	add	r0, r0, r3
	str	r3, [fp, #-60]
	mov	r1, r10
	bl	__aeabi_uidivmod
	cmp	r1, r9
	beq	.L4069
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-56]
	str	r3, [r2, #600]
	ldr	r3, [r5, #224]
	ldr	r2, [r3, #600]
	cmp	r2, #0
	beq	.L4194
.L4070:
	add	r3, r7, #32768
	ldrb	r3, [r3, #2003]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4079
	ldr	r1, .L4205+4
	mov	r0, #2
	bl	dprint_vfmw
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #604]
	bics	r3, r3, #1024
	bne	.L4186
	ldr	r2, [r6, #2800]
	cmp	r2, #0
	bne	.L4186
	ldr	r0, [r6, #2804]
	movw	r3, #26918
	movt	r3, 42
	mov	r1, r10
	add	r3, r0, r3
	str	r2, [fp, #-56]
	ldr	r9, [r6, #1188]
	add	r3, r5, r3, lsl #2
	ldr	r0, [r3, #4]
	add	r0, r0, #1
	bl	__aeabi_uidivmod
	cmp	r9, r1
	bcs	.L4069
	ldrb	r3, [r6, #1160]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L4069
	mov	r0, r5
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	ldr	r3, [r6, #2804]
	movw	r0, #26918
	mov	r1, r10
	movt	r0, 42
	add	r0, r3, r0
	ldr	r4, [r6, #1188]
	add	r0, r5, r0, lsl #2
	ldr	r0, [r0, #4]
	add	r0, r0, #1
	bl	__aeabi_uidivmod
	ldr	r2, [fp, #-56]
	mov	r3, r4
	mov	r0, r2
	movw	r2, #7447
	str	r1, [sp]
	ldr	r1, .L4205+8
	bl	dprint_vfmw
	mvn	r0, #0
.L4177:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4193:
	ldr	r2, [r3, #708]
	cmp	r2, #0
	bne	.L4042
	ldr	r3, [r3, #28]
	cmp	r3, #25
	beq	.L4195
.L4042:
	ldr	r3, [r5, #84]
	cmp	r10, #0
	add	r3, r3, #1
	str	r3, [r5, #84]
	bne	.L4052
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #872]
	cmp	r3, #1
	beq	.L4053
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_FlushDPB
	cmp	r0, #0
	bne	.L4196
.L4185:
	mov	r0, r5
	bl	MVC_InitDPB
	cmp	r0, #0
	bne	.L4103
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #872]
	cmp	r3, #1
	bne	.L4051
.L4057:
	ldr	r1, [r8, #1860]
	add	ip, r7, #32768
	add	r3, r5, #48
	mov	r0, r5
	mov	r1, r1, asl #1
	str	r1, [r5, #52]
	ldr	r2, [r8, #1840]
	ldrb	r10, [ip, #2004]	@ zero_extendqisi2
	add	r2, r2, #1
	ldr	ip, [r8, #1836]
	rsb	r10, r10, #2
	str	r1, [sp]
	mov	r2, r2, asl #4
	add	ip, ip, #1
	mul	r10, r10, r2
	mov	ip, ip, asl #4
	str	ip, [fp, #-56]
	mov	r1, ip
	mov	r2, r10
	bl	MVC_ArrangeVahbMem
	ldr	ip, [fp, #-56]
	cmp	r0, #1
	beq	.L4178
.L4183:
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #872]
	cmp	r3, #1
	mvneq	r0, #1
	beq	.L4177
	mov	r4, #0
	ldr	r1, .L4205+12
	str	r4, [r5, #12]
	mov	r0, r4
	str	r4, [r5, #16]
	bl	dprint_vfmw
	mov	r1, r4
	mov	r0, r5
	bl	MVC_ClearAll
	mvn	r0, #0
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4060:
	ldr	r3, .L4205
	movw	r0, #38744
	mov	r2, #0
	movt	r0, 169
	strb	r2, [r9, #20]
	add	r0, r5, r0
	mov	r1, r9
	ldr	r3, [r3, #56]
	mov	r2, #2240
	blx	r3
	b	.L4061
.L4079:
	mov	r0, r5
	bl	MVC_DecGap
	cmp	r0, #0
	bne	.L4082
.L4186:
	ldr	r9, [r6, #1188]
.L4069:
	ldrb	r3, [r6, #1168]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4083
	ldr	r2, [r6, #2804]
	movw	r3, #26918
	movt	r3, 42
	add	r3, r2, r3
	add	r3, r5, r3, lsl #2
	str	r9, [r3, #4]
.L4083:
	mov	r0, r5
	str	r9, [r6, #80]
	bl	MVC_DecPOC
	mov	r1, #0
	mov	r0, r5
	bl	MVC_AllocFrameStore
	cmp	r0, #0
	bne	.L4197
	strb	r0, [r4, #447]
	mov	r1, #1
	strb	r1, [r4, #440]
	ldrb	r3, [r6, #1163]	@ zero_extendqisi2
	strb	r3, [r4, #446]
	ldr	r10, [r6, #1188]
	str	r10, [r4, #1128]
	ldrb	r9, [r6, #1168]	@ zero_extendqisi2
	str	r9, [r4, #1136]
	ldr	ip, [r6, #60]
	str	ip, [r4, #1140]
	ldr	r3, [r6, #56]
	str	r3, [r4, #1144]
	ldr	r2, [r6, #48]
	str	r2, [r4, #1148]
	ldr	lr, [r6, #52]
	str	r3, [r4, #1160]
	mvn	r3, #0
	str	ip, [r4, #1156]
	str	lr, [r4, #1168]
	str	r2, [r4, #1164]
	str	lr, [r4, #1152]
	strb	r0, [r4, #442]
	strb	r0, [r4, #445]
	strb	r0, [r4, #444]
	str	r3, [r4, #1192]
	ldrb	ip, [r6, #1161]	@ zero_extendqisi2
	cmp	ip, #0
	strneb	r1, [r6, #1161]
	ldr	r2, [r5, #236]
	movne	ip, r1
	movne	r1, #2
	str	ip, [fp, #-60]
	ldrb	r0, [r2, #20]	@ zero_extendqisi2
	ldr	r3, [r2, #3952]
	rsb	r0, r0, #2
	str	r2, [fp, #-56]
	mla	r0, r3, r0, r0
	bl	__aeabi_uidiv
	ldr	r2, [fp, #-56]
	ldr	ip, [fp, #-60]
	cmp	ip, #0
	str	r0, [r4, #1180]
	ldrb	r3, [r2, #20]	@ zero_extendqisi2
	ldr	ip, [r2, #3952]
	rsb	r1, r3, #2
	mla	r1, ip, r1, r1
	str	r1, [r4, #1184]
	ldr	r1, [r2, #3948]
	add	r3, r1, #1
	str	r3, [r4, #1176]
	mul	r3, r3, r0
	str	r3, [r4, #1188]
	ldrb	r3, [r8, #1880]	@ zero_extendqisi2
	strb	r3, [r4, #448]
	movne	r3, #0
	bne	.L4086
	ldrb	r3, [r2, #21]	@ zero_extendqisi2
	adds	r3, r3, #0
	movne	r3, #1
.L4086:
	cmp	r9, #0
	strb	r3, [r4, #449]
	beq	.L4087
	ldr	r2, [r6, #2804]
	movw	r3, #26918
	movt	r3, 42
	add	r3, r2, r3
	add	r3, r5, r3, lsl #2
	str	r10, [r3, #4]
.L4087:
	ldr	r3, [r4, #1120]
	cmp	r3, #0
	ldrneb	r2, [r6, #1172]	@ zero_extendqisi2
	strneb	r2, [r3, #9]
	mvn	r3, #0
	str	r3, [r4, #1200]
	ldrb	r3, [r6, #1171]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4089
	ldr	r3, [r6, #2800]
	str	r3, [r4, #1200]
	ldrb	r3, [r6, #1169]	@ zero_extendqisi2
	strb	r3, [r4, #450]
	ldrb	r3, [r6, #1170]	@ zero_extendqisi2
	strb	r3, [r4, #451]
.L4089:
	ldr	r3, [r6, #2804]
	movw	r10, #2004
	movw	lr, #43824
	movw	ip, #17488
	movt	lr, 169
	movt	ip, 170
	str	r3, [r4, #1204]
	add	ip, r5, ip
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	movw	r8, #17488
	movt	r8, 170
	movw	r9, #17504
	movt	r9, 170
	add	r9, r5, r9
	mla	r10, r10, r3, r5
	ldr	r1, .L4205+16
	mov	r0, #29
	add	r7, r7, #32768
	add	lr, r10, lr
	str	lr, [r4, #1124]
	ldr	lr, [r5, #224]
	ldrd	r2, [lr, #56]
	strd	r2, [ip, #-8]
	ldrd	r2, [lr, #72]
	strd	r2, [r5, r8]
	ldrd	r2, [lr, #88]
	strd	r2, [r9, #-8]
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [lr, #56]
	ldrd	r2, [ip, #-8]
	bl	dprint_vfmw
	ldrd	r2, [r5, r8]
	ldr	r1, .L4205+20
	mov	r0, #29
	bl	dprint_vfmw
	ldr	lr, [r5, #236]
	mov	r2, #4
	ldr	r1, .L4205
	movw	r0, #16964
	ldr	r3, [lr, #3948]
	movt	r0, 170
	ldr	r8, [r1, #48]
	add	r0, r5, r0
	add	r3, r3, #1
	mov	r1, #0
	mov	r3, r3, asl r2
	str	r3, [r4, #584]
	ldrb	ip, [lr, #20]	@ zero_extendqisi2
	ldr	r9, [lr, #3952]
	rsb	r3, ip, #2
	mla	r3, r9, r3, r3
	mov	r3, r3, asl r2
	str	r3, [r4, #588]
	ldr	r9, [r7, #2036]
	ldr	r7, [lr, #748]
	and	r9, r9, #7
	subs	r7, r7, #1
	movne	r7, #1
	blx	r8
	ldrb	r2, [r4, #580]	@ zero_extendqisi2
	mov	ip, #2
	ldrb	r3, [r4, #581]	@ zero_extendqisi2
	movw	r0, #16840
	and	r2, r2, #252
	mov	r1, r9
	bfi	r2, r7, #2, #3
	strb	r2, [r4, #580]
	ldr	r2, [r5, #236]
	bfi	r3, ip, #0, #2
	and	r3, r3, #243
	ldrb	lr, [r4, #580]	@ zero_extendqisi2
	bfi	r3, ip, #4, #2
	movt	r0, 170
	ldr	ip, [r2, #56]
	add	r0, r5, r0
	strb	r3, [r4, #581]
	bfi	lr, ip, #5, #3
	strb	lr, [r4, #580]
	ldr	r2, [r2, #52]
	ldr	r3, [r4, #580]
	bfi	r3, r2, #14, #3
	str	r3, [r4, #580]
	bl	SetAspectRatio
	ldr	r0, [r4, #1120]
	ldr	r3, [r5, #84]
	cmp	r0, #0
	str	r3, [r4, #644]
	beq	.L4198
	ldr	r3, [r5, #236]
	ldr	r3, [r3, #3984]
	str	r3, [r0, #216]
	str	r3, [r4, #600]
	ldr	r3, [r5, #236]
	ldr	r2, [r4, #1120]
	ldr	r3, [r3, #3988]
	str	r3, [r2, #220]
	str	r3, [r4, #604]
	ldr	r3, [r5, #236]
	ldr	r2, [r4, #1120]
	ldr	r3, [r3, #3976]
	str	r3, [r2, #208]
	str	r3, [r4, #592]
	ldr	r2, [r5, #236]
	ldr	r3, [r4, #1120]
	ldr	r2, [r2, #3980]
	str	r2, [r3, #212]
	ldrb	r3, [r4, #443]	@ zero_extendqisi2
	ldr	r1, [r4, #1120]
	ldr	r0, [r4, #580]
	adds	r3, r3, #0
	str	r2, [r4, #596]
	movne	r3, #1
	str	r3, [r4, #568]
	str	r0, [r1, #196]
	ldr	r2, [r4, #568]
	ldr	r3, [r4, #1120]
	str	r2, [r3, #184]
	ldr	r3, [r6, #1188]
	ldr	r2, [r4, #1120]
	str	r3, [r4, #664]
	ldr	r1, [r6, #2800]
	str	r1, [r4, #672]
	str	r3, [r2, #280]
	ldr	r3, [r4, #1120]
	ldr	r2, [r6, #2800]
	str	r2, [r3, #288]
	ldr	r3, [r4, #1120]
	ldr	r0, [r5, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_GetDispPhyFs
	cmp	r0, #0
	beq	.L4091
	ldr	r3, [r4, #568]
	mov	r1, #0
	ldr	r2, [r0, #8]
	subs	r3, r3, r1
	ldr	r0, [r5, #120]
	movne	r3, #1
	bl	FSP_SetStoreType
.L4091:
	movw	ip, #17432
	movw	lr, #17464
	ldr	r3, [r5, #60]
	movt	ip, 170
	movt	lr, 170
	add	ip, r5, ip
	add	lr, r5, lr
	mov	r6, #0
.L4095:
	ldrd	r0, [ip, #8]!
	orrs	r2, r0, r1
	bne	.L4092
	cmp	r3, #0
	beq	.L4092
	ldr	r2, [r5, #528]
	subs	r3, r3, #1
	stmia	ip, {r2, r6}
	beq	.L4093
	add	r1, r5, #528
	mov	r2, #0
.L4094:
	add	r2, r2, #1
	ldr	r0, [r1, #4]!
	cmp	r2, r3
	str	r0, [r1, #-4]
	bne	.L4094
.L4093:
	add	r2, r3, #132
	str	r6, [r5, r2, asl #2]
	str	r3, [r5, #60]
.L4092:
	cmp	ip, lr
	bne	.L4095
	cmp	r3, #0
	beq	.L4097
	mov	r6, r3
	ble	.L4097
	add	r7, r3, #132
	mov	r8, #0
	add	r7, r5, r7, lsl #2
.L4098:
	ldr	r1, [r7, #-4]!
	sub	r6, r6, #1
	ldr	r0, [r5, #120]
	bl	FreeUsdByDec
	cmp	r6, #0
	str	r8, [r7]
	bne	.L4098
.L4097:
	mov	r6, #0
	mov	r0, r5
	str	r6, [r5, #60]
	strb	r6, [r4, #452]
	bl	MVC_UpdateReflist
	mov	r0, r5
	bl	MVC_UpdateLTReflist
	mov	r0, r5
	bl	MVC_CalcPicNum
	mov	r0, r6
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L4192:
	ldrb	r3, [r9, #20]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L4040
	b	.L4039
.L4189:
	mov	r2, #1
	strb	r2, [r5, #2]
	ldr	r2, [r9, #28]
	movw	lr, #3992
	ldr	ip, [r5, #248]
	add	r1, r7, #32768
	movw	r8, #34752
	str	r2, [r5, #24]
	ldr	r2, [r9, #28]
	ldr	r0, [r1, #2728]
	mla	r2, lr, r2, ip
	ldr	r1, [r2, #744]
	cmp	r0, r1
	beq	.L4199
.L4033:
	ldr	ip, .L4205
	movt	r8, 169
	ldr	r3, [r5, #84]
	add	r8, r5, r8
	mov	lr, #0
	mov	r1, r2
	add	r3, r3, #1
	mov	r0, r8
	str	r3, [r5, #84]
	strb	lr, [r2, #26]
	movw	r2, #3992
	ldr	r3, [ip, #56]
	blx	r3
	ldrb	r3, [r6, #1172]	@ zero_extendqisi2
.L4034:
	str	r8, [r5, #236]
	b	.L4032
.L4053:
	ldr	r1, .L4205+24
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	bl	MVC_GetBackPicFromVOQueue
	b	.L4185
.L4199:
	ldrb	r1, [r2, #26]	@ zero_extendqisi2
	cmp	r1, #0
	movteq	r8, 169
	addeq	r8, r5, r8
	beq	.L4034
	b	.L4033
.L4188:
	ldrsb	r1, [r3, #6]
	mov	r2, #1
	ldr	r0, [r5, #120]
	bl	FSP_ClearLogicFs
	ldr	r3, [r4, #1120]
	strb	r8, [r3, #2]
	ldr	r3, [r4, #1120]
	strb	r8, [r3, #5]
	b	.L4031
.L4194:
	ldr	r2, [r3, #640]
	cmp	r2, #1
	beq	.L4200
.L4071:
	ldr	r3, [r6, #2804]
	ldr	r1, [r6, #1188]
	add	r3, r5, r3, lsl #2
	add	r3, r3, #11075584
	add	r2, r3, #40960
	ldr	r2, [r2, #1180]
	cmp	r1, r2
	bls	.L4072
	ldr	ip, [r8, #1860]
	rsb	r0, r2, r1
	cmp	r2, #0
	cmpne	ip, r0
	bcs	.L4070
	ldrb	r2, [r6, #1160]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L4201
	add	r3, r3, #40960
	cmp	r1, #0
	subne	r2, r1, #1
	subeq	r2, r10, #1
	mvn	r1, #0
	str	r2, [r3, #1180]
	mov	r0, r5
	bl	MVC_FlushDPB
	subs	r3, r0, #0
	beq	.L4070
	movw	r2, #7393
	ldr	r1, .L4205+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4195:
	ldr	r3, [r5, #84]
	cmp	r10, #0
	add	r3, r3, #1
	str	r3, [r5, #84]
	beq	.L4043
	mvn	r1, #0
	mov	r0, r5
	str	r2, [fp, #-56]
	bl	MVC_FlushDPB
	ldr	r2, [fp, #-56]
	subs	r3, r0, #0
	bne	.L4202
	mov	r0, r5
	bl	MVC_InitDPB
	subs	r3, r0, #0
	bne	.L4100
	add	r2, r7, #32768
	ldr	r3, [r8, #1840]
	ldr	ip, [r8, #1836]
	ldrb	r10, [r2, #2004]	@ zero_extendqisi2
	add	r3, r3, #1
	ldr	r2, [r5, #12]
	add	ip, ip, #1
	mov	r3, r3, asl #4
	rsb	r10, r10, #2
	cmp	r2, #0
	mov	ip, ip, asl #4
	mul	r10, r10, r3
	bne	.L4178
	ldr	r3, [r8, #1860]
	ldr	r0, [r5, #224]
	mov	r3, r3, asl #1
	str	r3, [r5, #52]
	ldr	r1, [r0, #668]
	str	r3, [fp, #-56]
	cmp	r1, ip
	bcc	.L4045
	ldr	r2, [r0, #672]
	cmp	r2, r10
	bcc	.L4045
	add	lr, r7, #45056
	ldr	r3, [r0, #692]
	ldr	lr, [lr, #3016]
	cmp	r3, lr
	bcc	.L4203
	ldr	lr, [r0, #696]
	str	ip, [fp, #-60]
	cmp	lr, #0
	moveq	r3, #1
	streq	r3, [r5, #52]
	streq	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	ldreq	r1, [r0, #668]
	ldreq	r2, [r0, #672]
	mov	r0, r5
	str	r3, [sp]
	add	r3, r5, #48
	bl	MVC_ArrangeVahbMem
	ldr	ip, [fp, #-60]
	cmp	r0, #1
	bne	.L4183
.L4178:
	mov	ip, ip, lsr #4
	mov	r10, r10, lsr #4
	str	ip, [r5, #12]
	str	r10, [r5, #16]
	b	.L4051
.L4190:
	strb	r3, [r5, #2]
	movw	r1, #8500
	ldr	r3, [r9, #28]
	movt	r1, 5
	mov	r2, r1
	ldr	ip, .L4205
	movw	r0, #22860
	mla	r1, r1, r3, r5
	movt	r0, 164
	ldr	r3, [ip, #56]
	add	r0, r5, r0
	add	r1, r1, #12992
	add	r1, r1, #12
	blx	r3
	add	r2, r5, #11010048
	add	r2, r2, #32768
	movw	r3, #35364
	movt	r3, 168
	add	r3, r5, r3
	str	r3, [r5, #236]
	ldr	r3, [r2, #3340]
	str	r3, [r5, #28]
	b	.L4035
.L4052:
	ldr	r1, .L4205+24
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r5
	bl	MVC_GetBackPicFromVOQueue
	mov	r0, r5
	bl	MVC_InitDPB
	cmp	r0, #0
	beq	.L4057
.L4103:
	mov	r3, r0
	movw	r2, #7282
	ldr	r1, .L4205+32
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4072:
	rsb	r0, r2, r1
	ldr	ip, [r8, #1860]
	add	r0, r0, r10
	cmp	r2, #0
	cmpne	ip, r0
	bcs	.L4070
	ldrb	r2, [r6, #1160]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L4204
	add	r3, r3, #40960
	cmp	r1, #0
	subne	r2, r1, #1
	subeq	r2, r10, #1
	mvn	r1, #0
	str	r2, [r3, #1180]
	mov	r0, r5
	bl	MVC_FlushDPB
	subs	r3, r0, #0
	beq	.L4070
	movw	r2, #7420
	ldr	r1, .L4205+28
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4043:
	mov	r0, r5
	bl	MVC_InitDPB
	subs	r3, r0, #0
	bne	.L4100
	ldr	r3, [r8, #1840]
	add	r2, r7, #32768
	ldr	ip, [r8, #1836]
	add	r3, r3, #1
	ldrb	r10, [r2, #2004]	@ zero_extendqisi2
	add	ip, ip, #1
	mov	r3, r3, asl #4
	rsb	r10, r10, #2
	mov	ip, ip, asl #4
	mul	r10, r10, r3
	b	.L4178
.L4191:
	ldr	r1, .L4205+36
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4082:
	movw	r2, #7474
	ldr	r1, .L4205+40
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4200:
	ldr	r2, [r3, #636]
	cmp	r2, #0
	bne	.L4071
	ldr	r2, [r3, #644]
	cmp	r2, #0
	bne	.L4071
	ldr	r3, [r3, #604]
	add	r3, r3, #1024
	cmp	r3, #2048
	bhi	.L4070
	b	.L4071
.L4105:
	mov	r0, r3
	b	.L4064
.L4197:
	movw	r2, #7494
	ldr	r1, .L4205+44
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4198:
	movw	r2, #7598
	ldr	r1, .L4205+48
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4196:
	mov	r3, r0
	movw	r2, #7273
	mov	r0, r10
	ldr	r1, .L4205+28
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4201:
	mov	r0, r5
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	ldr	r2, [r6, #2804]
	ldr	r3, [r8, #1860]
	movw	r1, #26918
	ldr	ip, [r6, #1188]
	movt	r1, 42
	add	r1, r2, r1
	movw	r2, #7382
.L4187:
	add	r5, r5, r1, lsl #2
	str	r3, [sp]
	ldr	r1, .L4205+52
	mov	r0, #0
	ldr	r3, [r5, #4]
	rsb	r3, r3, ip
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4100:
	movw	r2, #7198
	ldr	r1, .L4205+32
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4204:
	mov	r0, r5
	bl	MVC_ClearCurrPic
	mvn	r1, #0
	mov	r0, r5
	bl	MVC_ClearDPB
	ldr	r2, [r6, #2804]
	movw	r1, #26918
	ldr	r3, [r8, #1860]
	movt	r1, 42
	ldr	ip, [r6, #1188]
	add	r1, r2, r1
	movw	r2, #7409
	b	.L4187
.L4045:
	ldr	r1, .L4205+56
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4202:
	mov	r0, r2
	ldr	r1, .L4205+28
	movw	r2, #7189
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4203:
	ldr	r1, .L4205+60
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4177
.L4206:
	.align	2
.L4205:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC446
	.word	.LC447
	.word	.LC444
	.word	.LC450
	.word	.LC451
	.word	.LC453
	.word	.LC440
	.word	.LC441
	.word	.LC31
	.word	.LC448
	.word	.LC449
	.word	.LC452
	.word	.LC445
	.word	.LC442
	.word	.LC443
	UNWIND(.fnend)
	.size	MVC_InitPic, .-MVC_InitPic
	.align	2
	.global	MVC_DecSlice
	.type	MVC_DecSlice, %function
MVC_DecSlice:
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
	ldr	r2, [r0, #68]
	mov	r5, r0
	ldr	r1, .L4259
	sub	r2, r2, #1
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r5, #232]
	add	r4, r5, #11075584
	mov	r0, r5
	add	r4, r4, #40960
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	strb	r2, [r4, #1163]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	strb	r3, [r4, #1168]
	bl	MVC_ProcessSliceHeaderFirstPart
	cmp	r0, #0
	bne	.L4252
	mov	r0, r5
	bl	MVC_ProcessSliceHeaderSecondPart
	cmp	r0, #0
	bne	.L4252
	ldr	r2, [r5, #64]
	cmp	r2, #0
	moveq	r3, r2
	beq	.L4214
	mov	r1, r0
	movw	r8, #18384
	movt	r8, 170
	mov	r3, r1
	add	r8, r5, r8
	mov	r6, r1
	b	.L4222
.L4253:
	cmp	lr, r1
	add	r3, r7, r3
	rsbhi	r1, r1, lr
	rsbhi	r0, r0, r9
	addhi	r1, r1, r0
	movls	r1, r9
	add	r3, r3, r1
.L4220:
	cmp	ip, #0
	add	r6, r6, #1
	movne	r1, ip
	movne	r0, r7
	moveq	r1, lr
	moveq	r0, r9
	cmp	r6, r2
	beq	.L4214
.L4222:
	ldr	r7, [r8, #4]!
	ldr	lr, [r7, #8]
	ldr	ip, [r7, #36]
	cmp	lr, #0
	ldrne	r9, [r7, #12]
	moveq	r9, lr
	cmp	ip, #0
	ldrne	r7, [r7, #40]
	moveq	r7, ip
	cmp	r1, #0
	bne	.L4253
	add	r3, r9, r3
	add	r3, r3, r7
	b	.L4220
.L4214:
	add	r6, r5, #11141120
	str	r3, [r5, #104]
	add	r6, r6, #16384
	movw	r0, #1620
	ldr	ip, [r6, #1180]
	ldr	r1, [r6, #1176]
	mul	r1, r1, ip
	cmp	r1, r0
	movgt	r1, r1, asl #7
	ble	.L4254
.L4224:
	ldr	r0, [r5, #32]
	cmp	r0, r2
	bls	.L4225
	cmp	r1, r3
	bcc	.L4225
	ldrb	r3, [r4, #1165]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4255
.L4228:
	mov	r0, r5
	bl	MVC_PicTypeStatistic
	mov	r0, r5
	bl	MVC_DecList
	cmp	r0, #0
	bne	.L4256
	mov	r0, r5
	bl	MVC_IsRefListWrong
	subs	r4, r0, #0
	bne	.L4257
	mov	r0, r5
	bl	MVC_CalcStreamBits
	mov	r0, r5
	bl	MVC_WriteSliceMsg
	mov	r0, r5
	bl	MVC_ExitSlice
	ldr	r3, [r5, #100]
	mov	r0, r4
	mov	r2, #1
	add	r3, r3, r2
	strb	r2, [r5, #4]
	str	r3, [r5, #100]
.L4211:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4254:
	mov	r0, r1, asl #9
	sub	r1, r0, r1, asl #7
	cmp	r1, #16384
	movlt	r1, #16384
	b	.L4224
.L4255:
	ldr	r1, .L4259+4
	mov	r0, #2
	bl	dprint_vfmw
	ldr	r3, [r5, #88]
	mov	r2, #0
	str	r2, [r5, #100]
	add	r3, r3, #1
	str	r3, [r5, #88]
	ldrb	r3, [r6, #443]	@ zero_extendqisi2
	mov	r0, r5
	cmp	r3, r2
	ldreq	r3, [r5, #92]
	ldrne	r3, [r5, #96]
	addeq	r3, r3, #1
	addne	r3, r3, #1
	streq	r3, [r5, #92]
	strne	r3, [r5, #96]
	bl	MVC_InitPic
	cmn	r0, #2
	beq	.L4211
	cmp	r0, #0
	bne	.L4258
	mov	r0, r5
	bl	MVC_WritePicMsg
	b	.L4228
.L4252:
	ldr	r1, .L4259+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4259+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L4250
	sub	r2, fp, #36
	mvn	r1, #0
	mov	r3, #4
	str	r1, [r2, #-8]!
	mov	r1, #100
	ldr	r0, [r5, #120]
	blx	ip
.L4250:
	mov	r0, r5
	bl	MVC_ClearCurrSlice
	mvn	r0, #0
	b	.L4211
.L4225:
	str	r1, [sp]
	mov	r0, #0
	ldr	r1, .L4259+16
	bl	dprint_vfmw
	ldr	r3, [r5, #64]
	ldr	r2, [r5, #32]
	cmp	r3, r2
	bcc	.L4227
	ldr	r1, .L4259+12
	ldr	ip, [r1]
	cmp	ip, #0
	beq	.L4227
	str	r3, [fp, #-44]
	mov	r1, #108
	str	r2, [fp, #-40]
	mov	r3, #8
	sub	r2, fp, #44
	ldr	r0, [r5, #120]
	blx	ip
.L4227:
	ldr	r1, .L4259+20
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r5
	bl	MVC_ClearCurrPic
	mvn	r0, #0
	b	.L4211
.L4256:
	mov	r2, r0
	ldr	r1, .L4259+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4211
.L4257:
	ldr	r1, .L4259+28
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4250
.L4258:
	ldr	r1, .L4259+32
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4211
.L4260:
	.align	2
.L4259:
	.word	.LC393
	.word	.LC456
	.word	.LC394
	.word	g_event_report
	.word	.LC454
	.word	.LC455
	.word	.LC458
	.word	.LC459
	.word	.LC457
	UNWIND(.fnend)
	.size	MVC_DecSlice, .-MVC_DecSlice
	.align	2
	.global	MVC_DecOneNal
	.type	MVC_DecOneNal, %function
MVC_DecOneNal:
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
	ldr	lr, [r0, #232]
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [lr, #68]
	cmp	r3, #0
	ldrne	ip, [r0, #104]
	movne	r2, lr
	movne	r3, #0
	beq	.L4266
.L4265:
	ldr	r0, [r2, #12]
	add	r3, r3, #1
	add	r2, r2, #28
	add	ip, ip, r0
	str	ip, [r4, #104]
	ldr	r0, [lr, #68]
	cmp	r0, r3
	bhi	.L4265
.L4266:
	add	r7, r4, #548
	mov	r8, #0
	mov	r1, #32
	strb	r8, [lr]
	mov	r0, r7
	bl	BsGet
	ldr	r3, [r4, #232]
	mvn	r1, #0
	and	ip, r0, #31
	strb	ip, [r3, #2]
	ldr	r3, [r4, #232]
	mov	r6, r0
	ubfx	r0, r0, #5, #2
	ubfx	r2, r6, #7, #1
	strb	r0, [r3, #4]
	ldr	r3, [r4, #232]
	str	r2, [r3, #76]
	ldr	r2, [r4, #232]
	ldr	r3, [r2, #64]
	add	r3, r3, #32
	str	r3, [r2, #64]
	ldr	r3, [r4, #232]
	strb	r8, [r4, #10]
	strb	r1, [r3, #5]
	ldr	r3, [r4, #232]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #14
	cmpne	r3, #20
	beq	.L4447
.L4264:
	ldr	r2, [r4, #68]
	mov	r0, #22
	ldr	r1, .L4458
	bl	dprint_vfmw
	ldr	r3, [r4, #68]
	movw	r2, #371
	cmp	r3, r2
	beq	.L4448
.L4269:
	ldr	r2, [r4, #232]
	add	r3, r3, #1
	str	r3, [r4, #68]
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	sub	r3, r2, #1
	cmp	r3, #29
	ldrls	pc, [pc, r3, asl #2]
	b	.L4270
.L4272:
	.word	.L4271
	.word	.L4270
	.word	.L4270
	.word	.L4270
	.word	.L4271
	.word	.L4273
	.word	.L4274
	.word	.L4275
	.word	.L4276
	.word	.L4277
	.word	.L4278
	.word	.L4279
	.word	.L4280
	.word	.L4281
	.word	.L4282
	.word	.L4270
	.word	.L4270
	.word	.L4270
	.word	.L4283
	.word	.L4270
	.word	.L4270
	.word	.L4270
	.word	.L4270
	.word	.L4270
	.word	.L4270
	.word	.L4270
	.word	.L4270
	.word	.L4270
	.word	.L4270
	.word	.L4284
.L4447:
	mov	r1, #24
	mov	r0, r7
	bl	BsGet
	ldr	r3, [r4, #232]
	ubfx	r2, r0, #23, #1
	strb	r2, [r3, #5]
	ldr	r3, [r4, #232]
	mov	r6, r0
	ldrsb	r2, [r3, #5]
	cmp	r2, #0
	bne	.L4267
	add	r2, r4, #12288
	mov	r1, #1
	ubfx	r0, r0, #16, #6
	ubfx	ip, r6, #2, #1
	strb	r1, [r2, #704]
	ubfx	lr, r6, #6, #10
	ubfx	r1, r6, #3, #3
	strb	r0, [r2, #706]
	strb	r1, [r2, #707]
	ubfx	r0, r6, #1, #1
	strb	ip, [r2, #708]
	and	r1, r6, #1
	str	lr, [r2, #712]
	ubfx	ip, r6, #22, #1
	strb	r0, [r2, #709]
	strb	r1, [r2, #710]
	strb	ip, [r2, #705]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	cmp	r2, #20
	beq	.L4449
.L4267:
	ldr	r2, [r3, #64]
	add	r2, r2, #24
	str	r2, [r3, #64]
	ldr	r3, [r4, #232]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	b	.L4264
.L4271:
	ldr	r3, [r4, #80]
	mov	r0, #22
	ldr	r1, .L4458+4
	bl	dprint_vfmw
	ldr	r3, [r4, #232]
	add	r0, r4, #11075584
	add	r2, r4, #12288
	add	r0, r0, #40960
	mvn	lr, #0
	ldrb	ip, [r3, #2]	@ zero_extendqisi2
	mov	r1, #0
	strb	ip, [r0, #1163]
	ldrb	r5, [r3, #4]	@ zero_extendqisi2
	strb	r5, [r0, #1168]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	str	lr, [r0, #2800]
	strb	r1, [r0, #1171]
	strb	r3, [r0, #1172]
	ldrb	lr, [r2, #704]	@ zero_extendqisi2
	cmp	lr, #1
	beq	.L4450
	cmp	r3, #255
	beq	.L4451
.L4286:
	ldr	r2, [r4, #88]
	mov	r0, #21
	ldr	r1, .L4458+8
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_SliceCheck
	subs	r5, r0, #0
	mov	r0, r4
	bne	.L4452
	bl	MVC_DecSlice
	cmn	r0, #2
	beq	.L4297
	cmp	r0, #0
	beq	.L4428
	ldr	r3, .L4458+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L4427
	ldr	r0, [r4, #120]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #113
	blx	ip
.L4427:
	mvn	r0, #0
	b	.L4297
.L4273:
	ldr	r1, .L4458+16
	mov	r2, #6
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_DecSEI
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4304
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4304:
	cmp	r5, #0
	bne	.L4453
.L4428:
	mov	r0, #0
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4274:
	ldr	r1, .L4458+20
	mov	r2, #7
	ldr	r3, [r4, #72]
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_DecSPS
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4302
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4302:
	cmp	r5, #0
	bne	.L4454
	ldr	r3, [r4, #72]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #72]
	b	.L4297
.L4276:
	ldr	r1, .L4458+24
	mov	r2, #9
.L4435:
	mov	r0, #22
	bl	dprint_vfmw
.L4440:
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4428
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	mov	r0, r3
	str	r3, [r4, #232]
.L4297:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L4277:
	mov	r2, #10
	ldr	r1, .L4458+28
	b	.L4435
.L4275:
	ldr	r1, .L4458+32
	mov	r2, #8
	ldr	r3, [r4, #76]
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_DecPPS
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4300
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4300:
	cmp	r5, #0
	bne	.L4455
	ldr	r3, [r4, #76]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #76]
	b	.L4297
.L4278:
	mov	r2, #11
	ldr	r1, .L4458+36
	mov	r0, #22
	bl	dprint_vfmw
	mov	r1, #32
	mov	r0, r7
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	mov	r0, r7
	bl	BsGet
	movw	r2, #20036
	movw	r3, #20553
	movt	r2, 17221
	movt	r3, 18515
	cmp	r0, r2
	cmpeq	r5, r3
	bne	.L4440
	ldr	r5, .L4458+12
	mov	r3, #1
	strb	r3, [r4, #1]
	ldr	ip, [r5]
	cmp	ip, #0
	beq	.L4307
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	ip
.L4307:
	mov	r6, #0
	mov	r0, r4
	strb	r6, [r4]
	bl	MVC_DecVDM
	cmp	r0, r6
	beq	.L4440
	b	.L4443
.L4279:
	mov	r2, #12
	ldr	r1, .L4458+40
	b	.L4435
.L4280:
	mov	r2, #13
	ldr	r1, .L4458+44
	b	.L4435
.L4281:
	mov	r2, #14
	ldr	r1, .L4458+48
	b	.L4435
.L4282:
	ldr	r1, .L4458+52
	mov	r2, #15
	mov	r0, #22
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_DecSubSPS
	ldr	r1, [r4, #232]
	cmp	r1, #0
	mov	r5, r0
	beq	.L4308
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4308:
	cmp	r5, #0
	bne	.L4456
	ldr	r3, [r4, #20]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r4, #20]
	b	.L4297
.L4283:
	mov	r2, #19
	ldr	r1, .L4458+56
	b	.L4435
.L4284:
	mov	r2, #30
	ldr	r1, .L4458+60
	mov	r0, #22
	bl	dprint_vfmw
	cmp	r5, #0
	bne	.L4310
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4310
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	str	r5, [r4, #232]
.L4310:
	mov	r1, #32
	mov	r0, r7
	bl	BsGet
	mov	r1, #32
	mov	r5, r0
	mov	r0, r7
	bl	BsGet
	ldr	r3, .L4458+64
	rev	r5, r5
	ldr	r2, [r3, #440]
	ldr	r3, [r3, #436]
	rev	r0, r0
	cmp	r0, r2
	cmpeq	r5, r3
	bne	.L4428
	ldr	r5, .L4458+12
	ldr	ip, [r5]
	cmp	ip, #0
	beq	.L4311
	mov	r3, #0
	mov	r1, #112
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	ip
.L4311:
	mov	r6, #0
	mov	r0, r4
	strb	r6, [r4]
	bl	MVC_DecVDM
	cmp	r0, r6
	beq	.L4428
.L4443:
	ldr	ip, [r5]
	cmp	ip, r6
	beq	.L4427
	ldr	r0, [r4, #120]
	mov	r3, r6
	mov	r2, r6
	mov	r1, #113
	blx	ip
	mvn	r0, #0
	b	.L4297
.L4270:
	mov	r3, r6
	ldr	r1, .L4458+68
	mov	r0, #22
	bl	dprint_vfmw
	cmp	r6, #256
	beq	.L4312
	ldr	r1, .L4458+72
	mov	r0, #1
	bl	dprint_vfmw
.L4312:
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4313
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4313:
	ldr	r3, .L4458+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L4428
.L4432:
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	b	.L4428
.L4448:
	ldr	r1, .L4458+76
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, [r4, #68]
	b	.L4269
.L4449:
	cmp	ip, #0
	movne	r2, #1
	moveq	r2, #5
	strb	r2, [r3, #2]
	ldr	r3, [r4, #232]
	b	.L4267
.L4452:
	bl	MVC_ClearCurrSlice
	ldr	r3, .L4458+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L4427
.L4296:
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	mvn	r0, #0
	b	.L4297
.L4455:
	ldr	r5, .L4458+12
	mov	r0, #1
	ldr	r1, .L4458+80
	bl	dprint_vfmw
	ldr	ip, [r5]
	cmp	ip, #0
	beq	.L4427
.L4445:
	sub	r2, fp, #36
	mvn	r6, #0
	mov	r3, #4
	mov	r1, #100
	str	r6, [r2, #-4]!
	ldr	r0, [r4, #120]
	blx	ip
	ldr	ip, [r5]
	cmp	ip, #0
	bne	.L4296
	b	.L4427
.L4456:
	ldr	r1, .L4458+84
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4458+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L4427
	sub	r2, fp, #36
	ldr	r0, [r4, #120]
	mov	r3, #4
	mvn	r4, #0
	mov	r1, #100
	str	r4, [r2, #-4]!
	blx	ip
	mov	r0, r4
	b	.L4297
.L4454:
	ldr	r5, .L4458+12
	mov	r0, #1
	ldr	r1, .L4458+88
	bl	dprint_vfmw
	ldr	ip, [r5]
	cmp	ip, #0
	bne	.L4445
	b	.L4427
.L4453:
	ldr	r1, .L4458+92
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L4458+12
	ldr	ip, [r3]
	cmp	ip, #0
	bne	.L4432
	b	.L4428
.L4451:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L4286
	add	r3, r4, #10747904
	add	r3, r3, #20480
	ldr	r2, [r3, #2384]
	cmp	r2, #0
	beq	.L4289
	ldrb	r2, [r3, #2380]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L4290
.L4289:
	add	r3, r4, #12992
	mov	r2, #0
	add	r3, r3, #16
.L4293:
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L4291
	ldrb	r1, [r3, #-4]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L4457
.L4291:
	add	r2, r2, #1
	add	r3, r3, #335872
	cmp	r2, #32
	add	r3, r3, #308
	bne	.L4293
	mvn	r3, #0
.L4426:
	cmn	r3, #1
	str	r3, [r0, #2800]
	beq	.L4286
	sub	ip, ip, #5
	mov	r3, #1
	clz	ip, ip
	strb	r3, [r0, #1171]
	strb	r3, [r0, #1170]
	mov	ip, ip, lsr #5
	strb	ip, [r0, #1169]
	b	.L4286
.L4450:
	strb	lr, [r0, #1171]
	ldr	r3, [r2, #712]
	str	r3, [r0, #2800]
	ldrb	r3, [r2, #708]	@ zero_extendqisi2
	strb	r3, [r0, #1169]
	ldrb	r3, [r2, #709]	@ zero_extendqisi2
	strb	r3, [r0, #1170]
	strb	r1, [r2, #704]
	b	.L4286
.L4457:
	movw	r3, #8500
	movt	r3, 5
	mla	r3, r3, r2, r4
	add	r3, r3, #12992
	add	r3, r3, #16
	ldr	r3, [r3, #4]
	b	.L4426
.L4290:
	ldr	r3, [r3, #2388]
	b	.L4426
.L4459:
	.align	2
.L4458:
	.word	.LC460
	.word	.LC462
	.word	.LC463
	.word	g_event_report
	.word	.LC468
	.word	.LC466
	.word	.LC470
	.word	.LC471
	.word	.LC464
	.word	.LC473
	.word	.LC472
	.word	.LC474
	.word	.LC475
	.word	.LC476
	.word	.LC477
	.word	.LC478
	.word	.LANCHOR1
	.word	.LC479
	.word	.LC480
	.word	.LC461
	.word	.LC465
	.word	.LC335
	.word	.LC467
	.word	.LC469
	UNWIND(.fnend)
	.size	MVC_DecOneNal, .-MVC_DecOneNal
	.align	2
	.global	MVC_DEC_DecodePacket
	.type	MVC_DEC_DecodePacket, %function
MVC_DEC_DecodePacket:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #44)
	sub	sp, sp, #44
	cmp	r1, #0
	mov	ip, #0
	mov	r4, r0
	str	ip, [fp, #-40]
	str	ip, [fp, #-44]
	str	ip, [fp, #-48]
	beq	.L4523
	ldr	r2, [r0, #224]
	ldrb	lr, [r0, #5]	@ zero_extendqisi2
	ldr	r3, [r2, #8]
	cmp	lr, #1
	mov	r3, r3, asl #16
	and	r3, r3, #196608
	str	r3, [r0, #108]
	ldr	r3, [r2]
	str	r3, [r0, #112]
	ldr	r3, [r2, #4]
	strb	ip, [r0, #10]
	str	r3, [r0, #116]
	beq	.L4463
	ldr	r3, [r2, #832]
	cmp	r3, #1
	addne	r5, r0, #11141120
	addne	r5, r5, #16384
	beq	.L4524
.L4464:
	mov	r0, r4
	bl	MVC_ReceivePacket
	ldr	r3, [r4, #232]
	str	r3, [r5, #3884]
.L4466:
	cmp	r0, #0
	mov	r3, #0
	strb	r3, [r4, #5]
	beq	.L4467
.L4486:
	mov	r0, #0
.L4518:
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L4524:
	ldr	r3, [r2, #872]
	add	r5, r0, #11141120
	add	r5, r5, #16384
	cmp	r3, #1
	bne	.L4464
	ldr	r3, [r5, #3880]
	cmp	r3, #1
	bne	.L4464
	ldr	r3, [r5, #3884]
	str	r3, [r0, #232]
	str	ip, [r5, #3880]
	strb	ip, [r0, #5]
	b	.L4465
.L4467:
	ldr	r3, [r4, #232]
.L4465:
	mov	r2, #0
	str	r2, [r3, #64]
	ldr	r3, [r4, #232]
	add	r6, r4, #548
	mov	r0, r6
	ldr	r2, [r3, #12]
	ldr	r1, [r3, #8]
	bl	BsInit
	mov	r1, #32
	mov	r0, r6
	bl	BsGet
	ldr	r3, [r4, #232]
	mvn	r2, #0
	mov	r5, r0
	and	r0, r0, #31
	strb	r0, [r3, #2]
	ubfx	r1, r5, #5, #2
	ldr	r3, [r4, #232]
	strb	r1, [r3, #4]
	ldr	r3, [r4, #232]
	strb	r2, [r3, #5]
	ldr	r3, [r4, #232]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #20
	beq	.L4525
.L4521:
	and	r5, r5, #27
	mov	r3, #0
	cmp	r5, #1
	strb	r3, [r4, #10]
	beq	.L4472
.L4473:
	mov	r0, r4
	bl	MVC_FindTrailZeros
	cmp	r0, #0
	bne	.L4526
.L4485:
	ldr	r3, [r4, #232]
	mov	r5, #0
	mov	r0, r6
	str	r5, [r3, #64]
	ldr	r3, [r4, #232]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #12]
	bl	BsInit
	mov	r1, r5
	mov	r0, r4
	bl	MVC_DecOneNal
	cmn	r0, #2
	beq	.L4518
	cmp	r0, r5
	beq	.L4486
	ldr	r3, .L4530
	ldr	ip, [r3]
	cmp	ip, r5
	beq	.L4522
	ldr	r0, [r4, #120]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #113
	blx	ip
.L4522:
	mvn	r0, #0
	sub	sp, fp, #24
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L4463:
	ldr	r0, [r0, #232]
	clz	r0, r0
	mov	r0, r0, lsr #5
	rsb	r0, r0, #0
	b	.L4466
.L4525:
	mov	r1, #24
	mov	r0, r6
	bl	BsGet
	ldr	r3, [r4, #232]
	ubfx	r2, r0, #23, #1
	strb	r2, [r3, #5]
	ldr	r1, [r4, #232]
	ldrsb	r2, [r1, #5]
	cmp	r2, #0
	bne	.L4521
	ubfx	ip, r0, #22, #1
	add	r3, r4, #12288
	cmp	ip, #0
	mov	r5, #1
	strb	ip, [r3, #705]
	ubfx	lr, r0, #6, #10
	ubfx	ip, r0, #2, #1
	strb	r5, [r3, #704]
	strb	ip, [r3, #708]
	ubfx	r0, r0, #1, #1
	str	lr, [r3, #712]
	movne	ip, r5
	strb	r0, [r3, #709]
	moveq	ip, #5
	strb	ip, [r1, #2]
	strb	r2, [r4, #10]
.L4472:
	sub	r2, fp, #32
	sub	r1, fp, #36
	mov	r0, r4
	bl	MVC_InquireSliceProperty
	cmp	r0, #0
	bne	.L4474
	ldr	r3, [fp, #-36]
	ldr	r2, [r4, #128]
	sub	r3, r3, #1
	clz	r3, r3
	mov	r3, r3, lsr #5
	cmp	r3, #0
	add	r3, r2, r3
	str	r3, [r4, #128]
	bne	.L4527
.L4475:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L4473
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_FlushDPB
	cmp	r0, #0
	bne	.L4528
.L4482:
	ldr	r0, [r4, #120]
	bl	FSP_GetFspType
	cmp	r0, #0
	bne	.L4473
	sub	r3, fp, #40
	sub	r2, fp, #44
	sub	r1, fp, #48
	ldr	r0, [r4, #120]
	bl	VCTRL_GetChanImgNum
	ldr	r3, [r4, #224]
	ldr	r2, [r3, #708]
	cmp	r2, #1
	bne	.L4473
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	ble	.L4529
.L4479:
	mov	r3, #1
	mvn	r0, #1
	strb	r3, [r4, #5]
	b	.L4518
.L4474:
	ldr	r1, [r4, #232]
	cmp	r1, #0
	beq	.L4484
	ldr	r0, [r4, #120]
	bl	MVC_ReleaseNAL
	mov	r3, #0
	str	r3, [r4, #232]
.L4484:
	ldr	r3, .L4530
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L4522
	mov	r3, #0
	ldr	r0, [r4, #120]
	mov	r2, r3
	mov	r1, #113
	blx	ip
	mvn	r0, #0
	b	.L4518
.L4526:
	ldr	r1, .L4530+4
	mov	r0, #22
	bl	dprint_vfmw
	b	.L4485
.L4527:
	add	r5, r4, #11075584
	add	r5, r5, #40960
	ldrb	r3, [r5, #1161]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #132]
	addeq	r3, r3, #1
	addne	r3, r3, #2
	str	r3, [r4, #132]
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L4475
	ldr	r3, [r4, #232]
	mov	ip, #0
	mov	r0, r6
	mov	r2, #12
	ldr	r1, .L4530+8
	str	ip, [r3, #64]
	bl	BsInit
	mov	r1, #1
	mov	r0, r4
	bl	MVC_DecOneNal
	ldrb	r3, [r5, #1161]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r3, [r4, #132]
	subeq	r3, r3, #1
	subne	r3, r3, #2
	str	r3, [r4, #132]
	b	.L4479
.L4528:
	mov	r3, #0
	movw	r2, #14160
	ldr	r1, .L4530+12
	mov	r0, #22
	bl	dprint_vfmw
	b	.L4482
.L4523:
	mov	r0, r1
	movw	r3, #14043
	ldr	r2, .L4530+16
	ldr	r1, .L4530+20
	bl	dprint_vfmw
	mvn	r0, #0
	b	.L4518
.L4529:
	ldr	r3, [fp, #-44]
	cmp	r3, #32
	bgt	.L4479
	ldr	r3, [r4, #228]
	cmp	r3, #0
	bne	.L4479
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L4473
	ldr	r1, [r4, #12]
	cmp	r1, #0
	beq	.L4473
	add	r5, r4, #11141120
	ldr	lr, [r4, #16]
	add	r5, r5, #16384
	ldr	r0, [r5, #3888]
	cmp	lr, r0
	beq	.L4473
	ldr	ip, [r5, #3892]
	cmp	r1, ip
	beq	.L4473
	stmib	sp, {r0, r1, lr}
	mov	r0, r2
	str	ip, [sp]
	ldr	r1, .L4530+24
	bl	dprint_vfmw
	ldr	r2, .L4530
	ldr	r3, [r4, #16]
	ldr	ip, [r2]
	str	r3, [r5, #3888]
	ldr	r3, [r4, #12]
	cmp	ip, #0
	str	r3, [r5, #3892]
	beq	.L4473
	mov	r3, #0
	mov	r1, #120
	mov	r2, r3
	ldr	r0, [r4, #120]
	blx	ip
	b	.L4473
.L4531:
	.align	2
.L4530:
	.word	g_event_report
	.word	.LC482
	.word	.LANCHOR1+432
	.word	.LC440
	.word	.LC13
	.word	.LC14
	.word	.LC481
	UNWIND(.fnend)
	.size	MVC_DEC_DecodePacket, .-MVC_DEC_DecodePacket
	.align	2
	.global	MVC_DEC_VDMPostProc
	.type	MVC_DEC_VDMPostProc, %function
MVC_DEC_VDMPostProc:
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
	ldrb	r7, [r0]	@ zero_extendqisi2
	mov	r4, r0
	cmp	r7, #0
	bne	.L4533
	add	r6, r0, #11141120
	add	r6, r6, #16384
	str	r1, [r6, #1172]
	bl	MVC_ClearAllSlice
	mov	r0, r4
	bl	MVC_StorePicInDpb
	subs	r5, r0, #0
	bne	.L4544
	mov	r3, #1
	mov	r0, r5
	strb	r3, [r4, #4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4533:
	add	r3, r0, #11141120
	add	r3, r3, #16384
	str	r1, [r3, #1172]
	bl	MVC_ClearAllSlice
	mov	r0, r4
	bl	MVC_StorePicInDpb
	subs	r2, r0, #0
	bne	.L4545
.L4536:
	mvn	r1, #0
	mov	r0, r4
	bl	MVC_FlushDPB
	subs	r2, r0, #0
	bne	.L4546
.L4537:
	ldr	ip, [r4, #40]
	add	r3, r4, #11075584
	add	r3, r3, #40960
	mov	r1, #0
	movw	r2, #23352
	strb	r1, [r4, #4]
	mov	r0, r1
	movt	r2, 1
	str	ip, [r3, #2828]
	mov	r5, #2
	strb	r1, [r3, #2816]
	mov	r4, #7
	str	r1, [r3, #2848]
	mov	lr, #32
	str	r1, [r3, #2852]
	mov	ip, #3
	str	r2, [r3, #2832]
	mvn	r1, #0
	mov	r2, #262144
	strb	r5, [r3, #2817]
	strb	r4, [r3, #2819]
	strb	lr, [r3, #2818]
	str	ip, [r3, #2840]
	str	r1, [r3, #2844]
	str	r2, [r3, #2856]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4544:
	ldr	r3, [r6, #1120]
	mov	r2, #1
	ldr	r0, [r4, #120]
	ldrsb	r1, [r3, #6]
	bl	FSP_ClearLogicFs
	mov	r2, r5
	ldr	r1, .L4547
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, r4
	bl	MVC_ClearCurrPic
	mov	r0, r4
	mvn	r1, #0
	bl	MVC_ClearDPB
	str	r7, [r6, #1120]
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L4546:
	ldr	r1, .L4547+4
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4537
.L4545:
	ldr	r1, .L4547+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L4536
.L4548:
	.align	2
.L4547:
	.word	.LC483
	.word	.LC485
	.word	.LC484
	UNWIND(.fnend)
	.size	MVC_DEC_VDMPostProc, .-MVC_DEC_VDMPostProc
	.align	2
	.global	MVC_DEC_GetImageBuffer
	.type	MVC_DEC_GetImageBuffer, %function
MVC_DEC_GetImageBuffer:
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
	ldr	r7, [r0, #48]
	mov	r5, r0
	cmp	r7, #0
	beq	.L4565
	movw	r4, #48440
	movw	r9, #47880
	movt	r4, 169
	add	r8, r0, #11075584
	add	r4, r0, r4
	movt	r9, 169
	add	r8, r8, #45056
	add	r9, r0, r9
	mov	ip, r4
	mov	r6, #0
.L4557:
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4552
	cmp	ip, #0
	beq	.L4553
	ldr	lr, [r8, #3016]
	cmp	lr, #0
	beq	.L4553
	ldr	r2, [r8, #2824]
	rsb	r3, ip, r2
	cmp	r2, #0
	clz	r3, r3
	mov	r3, r3, lsr #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L4552
	mov	r1, r9
	b	.L4554
.L4555:
	ldr	r2, [r1, #4]!
	rsb	r0, ip, r2
	cmp	r2, #0
	clz	r0, r0
	mov	r0, r0, lsr #5
	moveq	r0, #0
	cmp	r0, #0
	bne	.L4552
.L4554:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L4555
.L4553:
	ldr	r0, [r5, #120]
	bl	FSP_IsNewFsAvalible
	cmp	r0, #1
	beq	.L4565
	ldr	r0, [r5, #120]
	bl	FSP_IsNewFsAvalible
	cmn	r0, #1
	bne	.L4585
	add	r1, r5, #584
	ldr	r0, [r5, #120]
	bl	FSP_ClearNotInVoQueue
	b	.L4585
.L4552:
	add	r6, r6, #1
	add	ip, ip, #848
	cmp	r6, r7
	bne	.L4557
	sub	r2, fp, #40
	sub	r1, fp, #44
	add	r0, r5, #584
	bl	GetQueueImgNum
	ldr	r1, .L4589
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, .L4589+4
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	cmp	r3, #0
	beq	.L4587
	movw	r7, #47880
	add	r8, r5, #11075584
	movt	r7, 169
	add	r8, r8, #45056
	add	r7, r5, r7
	mov	r6, #0
.L4558:
	cmp	r4, #0
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	ldrb	r9, [r4, #5]	@ zero_extendqisi2
	beq	.L4569
	ldr	lr, [r8, #3016]
	cmp	lr, #0
	beq	.L4569
	ldr	r2, [r8, #2824]
	rsb	r1, r4, r2
	cmp	r2, #0
	clz	r1, r1
	mov	r1, r1, lsr #5
	moveq	r1, #0
	cmp	r1, #0
	bne	.L4571
	mov	r2, r7
	b	.L4562
.L4563:
	ldr	ip, [r2, #4]!
	rsb	r0, r4, ip
	cmp	ip, #0
	clz	r0, r0
	mov	r0, r0, lsr #5
	moveq	r0, #0
	cmp	r0, #0
	bne	.L4571
.L4562:
	add	r1, r1, #1
	cmp	r1, lr
	bne	.L4563
.L4569:
	mov	r2, #1
.L4561:
	str	r2, [sp, #4]
	mov	r0, #0
	mov	r2, r6
	str	r9, [sp]
	ldr	r1, .L4589+8
	add	r6, r6, #1
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	add	r4, r4, #848
	cmp	r3, r6
	bhi	.L4558
.L4564:
	ldr	r3, [fp, #-40]
	mov	r0, #0
	ldr	r2, [fp, #-44]
	ldr	r1, .L4589+12
	bl	dprint_vfmw
	ldr	r3, [r5, #48]
	ldr	r0, [r8, #3020]
	ldr	r2, [fp, #-44]
	sub	r3, r3, #2
	ldr	r1, [fp, #-40]
	rsb	r3, r0, r3
	add	r2, r2, r1
	cmp	r2, r3
	blt	.L4588
.L4585:
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4565:
	mov	r0, #1
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4571:
	mov	r2, #0
	b	.L4561
.L4588:
	ldr	r1, .L4589+16
	mov	r0, #0
	bl	dprint_vfmw
	mov	r0, r5
	mov	r1, #1
	bl	MVC_ClearAll
	mov	r0, #0
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L4587:
	add	r8, r5, #11075584
	add	r8, r8, #45056
	b	.L4564
.L4590:
	.align	2
.L4589:
	.word	.LC486
	.word	.LC487
	.word	.LC489
	.word	.LC488
	.word	.LC490
	UNWIND(.fnend)
	.size	MVC_DEC_GetImageBuffer, .-MVC_DEC_GetImageBuffer
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
	.align	2
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
	.type	__FUNCTION__.15568, %object
	.size	__FUNCTION__.15568, 18
__FUNCTION__.15568:
	.ascii	"MVC_WriteSliceMsg\000"
	.space	2
	.type	MVC_SarTable.15861, %object
	.size	MVC_SarTable.15861, 136
MVC_SarTable.15861:
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
	.type	__func__.16095, %object
	.size	__func__.16095, 11
__func__.16095:
	.ascii	"MVC_DecSEI\000"
	.space	1
	.type	__func__.14748, %object
	.size	__func__.14748, 17
__func__.14748:
	.ascii	"MVC_DirectOutput\000"
	.space	3
	.type	__func__.15328, %object
	.size	__func__.15328, 12
__func__.15328:
	.ascii	"MVC_InitDPB\000"
	.type	__FUNCTION__.14468, %object
	.size	__FUNCTION__.14468, 13
__FUNCTION__.14468:
	.ascii	"MVC_ClearDPB\000"
	.space	3
	.type	__func__.16206, %object
	.size	__func__.16206, 17
__func__.16206:
	.ascii	"MVC_FlushDecoder\000"
	.space	3
	.type	__FUNCTION__.14476, %object
	.size	__FUNCTION__.14476, 13
__FUNCTION__.14476:
	.ascii	"MVC_ClearAll\000"
	.space	3
	.type	__FUNCTION__.16333, %object
	.size	__FUNCTION__.16333, 13
__FUNCTION__.16333:
	.ascii	"MVC_DEC_Init\000"
	.space	3
	.type	__func__.14898, %object
	.size	__func__.14898, 18
__func__.14898:
	.ascii	"MVC_StorePicInDpb\000"
	.data
	.align	2
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
	.space	192
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"\012\012END of the bit buffer, copy the first packe" )
	ASCII(.ascii	"t!\012\012\000" )
	.space	2
.LC1:
	ASCII(.ascii	"0:phy:0x%x, 1:phy:0x%x; len0:%d len1:%d\012\000" )
	.space	3
.LC2:
	ASCII(.ascii	"0:phy:0x%x, len0:%d\012\000" )
	.space	3
.LC3:
	ASCII(.ascii	"%-50s%50d\012\000" )
	.space	1
.LC4:
	ASCII(.ascii	"MVC_FRAME %d, state=%d, is already output\012\000" )
	.space	1
.LC5:
	ASCII(.ascii	"plfs(fs=%p, eFoState=%d) is null, logic_fs_id = %d\012" )
	ASCII(.ascii	"\000" )
.LC6:
	ASCII(.ascii	"not used MVC_FRAME: (%d,%d)\012\000" )
	.space	3
.LC7:
	ASCII(.ascii	"MVC_FRAME skip: is_used=%d,skip=%d\012\000" )
.LC8:
	ASCII(.ascii	"topfield skip\012\000" )
	.space	1
.LC9:
	ASCII(.ascii	"bottom field skip\012\000" )
	.space	1
.LC10:
	ASCII(.ascii	"err(%d) > out_thr(%d)\012\000" )
	.space	1
.LC11:
	ASCII(.ascii	"exg_pts: %lld <-> %lld\012\000" )
.LC12:
	ASCII(.ascii	"stream MVC_FRAME packing type is %d! what can we do" )
	ASCII(.ascii	"?\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"firmware/common/syntax/mvc.c\000" )
	.space	3
.LC14:
	ASCII(.ascii	"NULL pointer: %s, L%d\012\000" )
	.space	1
.LC15:
	ASCII(.ascii	"framestore %d allocate apc %d\012\000" )
	.space	1
.LC16:
	ASCII(.ascii	"find APC, but logic_fs_id %d abnormal(ref=%d,plfs=%" )
	ASCII(.ascii	"p, pdfs=%p)\012\000" )
.LC17:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC18:
	ASCII(.ascii	"pMvcCtx->DPB.fs[%d]: frame_num=%d poc=%d is_referen" )
	ASCII(.ascii	"ce=%d\012\000" )
	.space	2
.LC19:
	ASCII(.ascii	"pMvcCtx->DPB.fs_ref[%d]: frame_num=%d poc=%d is_ref" )
	ASCII(.ascii	"erence=%d\012\000" )
	.space	2
.LC20:
	ASCII(.ascii	"pMvcCtx->DPB.fs_ref[%d]: MVC_FRAME.poc=%d \012\000" )
.LC21:
	ASCII(.ascii	"\012 VFMW ** release streambuff=%p   bitstream_leng" )
	ASCII(.ascii	"th=%d\012\000" )
	.space	1
.LC22:
	ASCII(.ascii	"clear curr slice.\012\000" )
	.space	1
.LC23:
	ASCII(.ascii	"image size abnormal(%dx%d)\012\000" )
.LC24:
	ASCII(.ascii	"partition fs memory fail!\012\000" )
	.space	1
.LC25:
	ASCII(.ascii	"ERROR: FSP_ConfigInstance fail!\012\000" )
	.space	3
.LC26:
	ASCII(.ascii	"for P slice size of list equal 0(1st).\012\000" )
.LC27:
	ASCII(.ascii	"for P slice size of list equal 0(2nd).\012\000" )
.LC28:
	ASCII(.ascii	"for B slice size of two list all equal 0.\012\000" )
	.space	1
.LC29:
	ASCII(.ascii	"list[%d][%d]: frame_num=%d, poc=%d\012\000" )
.LC30:
	ASCII(.ascii	"init list error.\012\000" )
	.space	2
.LC31:
	ASCII(.ascii	"In one access unit,all non-base view should have th" )
	ASCII(.ascii	"e same subsps!\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"sps but mvc flag %d is wrong\012\000" )
	.space	2
.LC33:
	ASCII(.ascii	"save pic yuv :  structure = %d;  idc = %d\012\000" )
	.space	1
.LC34:
	ASCII(.ascii	"structure = %d pMvcCtx->CurrPic.pic_width_in_mb = %" )
	ASCII(.ascii	"d pMvcCtx->CurrPic.pic_height_in_mb = %d\012\000" )
	.space	3
.LC35:
	ASCII(.ascii	"nal_ref_idc=%d, structure=%d, image_id=%d, pmv_idc=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC36:
	ASCII(.ascii	"logic MVC_FRAME id(=%d): get LogicFs error!\012\000" )
	.space	3
.LC37:
	ASCII(.ascii	"phy fs is null: pstDecodeFs = %p, pstDispOutFs = %p" )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC38:
	ASCII(.ascii	"fuction return value is null,%s %d unknow error!!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC39:
	ASCII(.ascii	"SH: first_mb_in_slice\000" )
	.space	2
.LC40:
	ASCII(.ascii	"MVC_SliceCheck first_mb_in_slice >= MAX_MB_NUM_IN_P" )
	ASCII(.ascii	"IC error.\012\000" )
	.space	2
.LC41:
	ASCII(.ascii	"SH: slice_type\000" )
	.space	1
.LC42:
	ASCII(.ascii	"slice type = %d\012\000" )
	.space	3
.LC43:
	ASCII(.ascii	"slice type = %d, err\012\000" )
	.space	2
.LC44:
	ASCII(.ascii	"slice  pps id = %d\012\000" )
.LC45:
	ASCII(.ascii	"pps with this pic_parameter_set_id = %d havn't deco" )
	ASCII(.ascii	"de\012\000" )
	.space	1
.LC46:
	ASCII(.ascii	"sps with this pic_parameter_set_id havn't decode\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC47:
	ASCII(.ascii	"subsps with this seq_parameter_set_id = %d havn't d" )
	ASCII(.ascii	"ecoded\012\000" )
	.space	1
.LC48:
	ASCII(.ascii	"tmp slice  pps id = %d\012\000" )
.LC49:
	ASCII(.ascii	"MVC_PPSSPSCheckTmpId: pps with this pic_parameter_s" )
	ASCII(.ascii	"et_id = %d havn't decode\012\000" )
	.space	3
.LC50:
	ASCII(.ascii	"MVC_PPSSPSCheckTmpId: seq_parameter_set_id out of r" )
	ASCII(.ascii	"ange.\012\000" )
	.space	2
.LC51:
	ASCII(.ascii	"MVC_PPSSPSCheckTmpId: sps with this pic_parameter_s" )
	ASCII(.ascii	"et_id = %d havn't decode\012\000" )
	.space	3
.LC52:
	ASCII(.ascii	"new pic flag = %d\012\000" )
	.space	1
.LC53:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l0\000" )
.LC54:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l0\000" )
	.space	2
.LC55:
	ASCII(.ascii	"reorder idc l0 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC56:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l0\000" )
	.space	1
.LC57:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l0 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC58:
	ASCII(.ascii	"SH: long_term_pic_idx_l0\000" )
	.space	3
.LC59:
	ASCII(.ascii	"SH: abs_diff_view_idx_minus1_l0\000" )
.LC60:
	ASCII(.ascii	"num of idc l0 exceed\012\000" )
	.space	2
.LC61:
	ASCII(.ascii	"SH: ref_pic_list_reordering_flag_l1\000" )
.LC62:
	ASCII(.ascii	"SH: reordering_of_pic_nums_idc_l1\000" )
	.space	2
.LC63:
	ASCII(.ascii	"reorder idc l1 = %d, g_SeErrFlag=%d\012\000" )
	.space	3
.LC64:
	ASCII(.ascii	"SH: abs_diff_pic_num_minus1_l1\000" )
	.space	1
.LC65:
	ASCII(.ascii	"abs_diff_pic_num_minus1_l1 = %d, g_SeErrFlag=%d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC66:
	ASCII(.ascii	"SH: long_term_pic_idx_l1\000" )
	.space	3
.LC67:
	ASCII(.ascii	"SH: abs_diff_view_idx_minus1_l1\000" )
.LC68:
	ASCII(.ascii	"num of idc l1 exceed\012\000" )
	.space	2
.LC69:
	ASCII(.ascii	"SH: luma_log2_weight_denom\000" )
	.space	1
.LC70:
	ASCII(.ascii	"SH: chroma_log2_weight_denom\000" )
	.space	3
.LC71:
	ASCII(.ascii	"WP log2 exceed  and err flag = %d\012\000" )
	.space	1
.LC72:
	ASCII(.ascii	"SH: luma_weight_flag_l0\000" )
.LC73:
	ASCII(.ascii	"SH: luma_weight_l0\000" )
	.space	1
.LC74:
	ASCII(.ascii	"SH: luma_offset_l0\000" )
	.space	1
.LC75:
	ASCII(.ascii	"SH: chroma_weight_flag_l0\000" )
	.space	2
.LC76:
	ASCII(.ascii	"SH: chroma_weight_l0\000" )
	.space	3
.LC77:
	ASCII(.ascii	"SH: chroma_offset_l0\000" )
	.space	3
.LC78:
	ASCII(.ascii	"SH: luma_weight_flag_l1\000" )
.LC79:
	ASCII(.ascii	"SH: luma_weight_l1\000" )
	.space	1
.LC80:
	ASCII(.ascii	"SH: luma_offset_l1\000" )
	.space	1
.LC81:
	ASCII(.ascii	"SH: chroma_weight_flag_l1\000" )
	.space	2
.LC82:
	ASCII(.ascii	"SH: chroma_weight_l1\000" )
	.space	3
.LC83:
	ASCII(.ascii	"SH: chroma_offset_l1\000" )
	.space	3
.LC84:
	ASCII(.ascii	"overflow MVC_MAX_MMCO_LEN\012\000" )
	.space	1
.LC85:
	ASCII(.ascii	"SH: memory_management_control_operation\000" )
.LC86:
	ASCII(.ascii	"SH: difference_of_pic_nums_minus1\000" )
	.space	2
.LC87:
	ASCII(.ascii	"SH: long_term_pic_num\000" )
	.space	2
.LC88:
	ASCII(.ascii	"SH: long_term_frame_idx\000" )
.LC89:
	ASCII(.ascii	"SH: max_long_term_frame_idx_plus1\000" )
	.space	2
.LC90:
	ASCII(.ascii	"mmco exceed 6\012\000" )
	.space	1
.LC91:
	ASCII(.ascii	"SH: no_output_of_prior_pics_flag\000" )
	.space	3
.LC92:
	ASCII(.ascii	"SH: long_term_reference_flag\000" )
	.space	3
.LC93:
	ASCII(.ascii	"IDR and no_output_of_prior_pics_flag = %d\012\000" )
	.space	1
.LC94:
	ASCII(.ascii	"SH: adaptive_ref_pic_marking_mode_flag\000" )
	.space	1
.LC95:
	ASCII(.ascii	"adaptive_ref_pic_marking_mode_flag = %d\012\000" )
	.space	3
.LC96:
	ASCII(.ascii	"MMCO para would save dec err\012\000" )
	.space	2
.LC97:
	ASCII(.ascii	"mulitislice diff no_out_of_prior_pics_flag, used fi" )
	ASCII(.ascii	"rst.\012\000" )
	.space	3
.LC98:
	ASCII(.ascii	"mulitislice diff long_term_reference_flag, used fir" )
	ASCII(.ascii	"st.\012\000" )
.LC99:
	ASCII(.ascii	"mulitislice diff adaptive_ref_pic_marking_mode_flag" )
	ASCII(.ascii	", used first.\012\000" )
	.space	2
.LC100:
	ASCII(.ascii	"TotalPicNum=%d, SliceNumInPic=%d, TotalNal=%d\012\000" )
	.space	1
.LC101:
	ASCII(.ascii	"SH: pic_parameter_set_id\000" )
	.space	3
.LC102:
	ASCII(.ascii	"pps id:%d in sliceheader err\012\000" )
	.space	2
.LC103:
	ASCII(.ascii	"PPS or SPS of this slice not valid\012\000" )
.LC104:
	ASCII(.ascii	"MVC_PPSSPSCheck failed, PPS or SPS of this slice no" )
	ASCII(.ascii	"t valid\012\000" )
.LC105:
	ASCII(.ascii	"SH: frame_num\000" )
	.space	2
.LC106:
	ASCII(.ascii	"IDR NAL but frame_num!=0.\012\000" )
	.space	1
.LC107:
	ASCII(.ascii	"SH: field_pic_flag\000" )
	.space	1
.LC108:
	ASCII(.ascii	"SH: bottom_field_flag\000" )
	.space	2
.LC109:
	ASCII(.ascii	"field first_mb_in_slice bigger than pic size\012\000" )
	.space	2
.LC110:
	ASCII(.ascii	"MVC_FRAME first_mb_in_slice bigger than pic size\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC111:
	ASCII(.ascii	"SH: idr_pic_id\000" )
	.space	1
.LC112:
	ASCII(.ascii	"idr_pic_id bigger than 65535\012\000" )
	.space	2
.LC113:
	ASCII(.ascii	"SH: pic_order_cnt_lsb\000" )
	.space	2
.LC114:
	ASCII(.ascii	"SH: delta_pic_order_cnt_bottom\000" )
	.space	1
.LC115:
	ASCII(.ascii	"SH: delta_pic_order_cnt[0]\000" )
	.space	1
.LC116:
	ASCII(.ascii	"SH: delta_pic_order_cnt[1]\000" )
	.space	1
.LC117:
	ASCII(.ascii	"SH: redundant_pic_cnt\000" )
	.space	2
.LC118:
	ASCII(.ascii	"redundant pic not support.\012\000" )
.LC119:
	ASCII(.ascii	"first_mb_in_slice in currslice small than prevslice" )
	ASCII(.ascii	" in same pic\012\000" )
	.space	3
.LC120:
	ASCII(.ascii	"SH: direct_spatial_mv_pred_flag\000" )
.LC121:
	ASCII(.ascii	"SH: num_ref_idx_override_flag\000" )
	.space	2
.LC122:
	ASCII(.ascii	"SH: num_ref_idx_l0_active_minus1\000" )
	.space	3
.LC123:
	ASCII(.ascii	"SH: num_ref_idx_l1_active_minus1\000" )
	.space	3
.LC124:
	ASCII(.ascii	"MVC_FRAME num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC125:
	ASCII(.ascii	"field num_ref_idx_lx_active_minus1 exceed\012\000" )
	.space	1
.LC126:
	ASCII(.ascii	"reordering para dec err\012\000" )
	.space	3
.LC127:
	ASCII(.ascii	"apply_weights_flag=%d\012\000" )
	.space	1
.LC128:
	ASCII(.ascii	"wpt dec err\012\000" )
	.space	3
.LC129:
	ASCII(.ascii	"mark para dec err\012\000" )
	.space	1
.LC130:
	ASCII(.ascii	"SH: cabac_init_idc\000" )
	.space	1
.LC131:
	ASCII(.ascii	"cabac_init_idc bigger than 3\012\000" )
	.space	2
.LC132:
	ASCII(.ascii	"SH: slice_qp_delta\000" )
	.space	1
.LC133:
	ASCII(.ascii	"SH: disable_deblocking_filter_idc\000" )
	.space	2
.LC134:
	ASCII(.ascii	"disable_deblocking_filter_idc dec err\012\000" )
	.space	1
.LC135:
	ASCII(.ascii	"SH: slice_alpha_c0_offset_div2\000" )
	.space	1
.LC136:
	ASCII(.ascii	"slice_alpha_c0_offset_div2 dec err\012\000" )
.LC137:
	ASCII(.ascii	"SH: slice_beta_offset_div2\000" )
	.space	1
.LC138:
	ASCII(.ascii	"slice_beta_offset_div2 dec err\012\000" )
.LC139:
	ASCII(.ascii	"pMvcCtx->pCurrNal->nal_bitoffset = %d; code_len_byt" )
	ASCII(.ascii	"e = %d; bitstream_length = %d; pMvcCtx->pCurrNal->n" )
	ASCII(.ascii	"al_trail_zero_bit_num = %d\012\000" )
	.space	2
.LC140:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d; byt" )
	ASCII(.ascii	"espos = %x\012\000" )
	.space	1
.LC141:
	ASCII(.ascii	"nal_segment = %d is not expected value\012\000" )
.LC142:
	ASCII(.ascii	"stream[%d]: bitsoffset = %d; valid_bitlen = %d\012\000" )
.LC143:
	ASCII(.ascii	"   : delta_sl   \000" )
	.space	3
.LC144:
	ASCII(.ascii	"PPS: entropy_coding_mode_flag\000" )
	.space	2
.LC145:
	ASCII(.ascii	"PPS: pic_order_present_flag\000" )
.LC146:
	ASCII(.ascii	"PPS: num_slice_groups_minus1\000" )
	.space	3
.LC147:
	ASCII(.ascii	"MVC_BASELINE stream with FMO, not support.\012\000" )
.LC148:
	ASCII(.ascii	"PPS: num_ref_idx_l0_active_minus1\000" )
	.space	2
.LC149:
	ASCII(.ascii	"num_ref_idx_l0_active_minus1 out of range.\012\000" )
.LC150:
	ASCII(.ascii	"PPS: num_ref_idx_l1_active_minus1\000" )
	.space	2
.LC151:
	ASCII(.ascii	"num_ref_idx_l1_active_minus1 out of range.\012\000" )
.LC152:
	ASCII(.ascii	"PPS: weighted prediction flag\000" )
	.space	2
.LC153:
	ASCII(.ascii	"PPS: weighted_bipred_idc\000" )
	.space	3
.LC154:
	ASCII(.ascii	"weighted_bipred_idc out of range\012\000" )
	.space	2
.LC155:
	ASCII(.ascii	"PPS: pic_init_qp_minus26\000" )
	.space	3
.LC156:
	ASCII(.ascii	"PPS: pic_init_qs_minus26\000" )
	.space	3
.LC157:
	ASCII(.ascii	"PPS: chroma_qp_index_offset\000" )
.LC158:
	ASCII(.ascii	"PPS: deblocking_filter_control_present_flag\000" )
.LC159:
	ASCII(.ascii	"PPS: constrained_intra_pred_flag\000" )
	.space	3
.LC160:
	ASCII(.ascii	"PPS: redundant_pic_cnt_present_flag\000" )
.LC161:
	ASCII(.ascii	"redundant pic not support when find redundant slice" )
	ASCII(.ascii	" later, exit\012\000" )
	.space	3
.LC162:
	ASCII(.ascii	"PPS: transform_8x8_mode_flag\000" )
	.space	3
.LC163:
	ASCII(.ascii	"PPS: pic_scaling_matrix_present_flag\000" )
	.space	3
.LC164:
	ASCII(.ascii	"PPS: second_chroma_qp_index_offset\000" )
	.space	1
.LC165:
	ASCII(.ascii	"SPS: seq_scaling_list_present_flag\000" )
	.space	1
.LC166:
	ASCII(.ascii	"PPS: pic_scaling_list_present_flag\000" )
	.space	1
.LC167:
	ASCII(.ascii	"second_chroma_qp_index_offset out of range.\012\000" )
	.space	3
.LC168:
	ASCII(.ascii	"PPS: pic_parameter_set_id\000" )
	.space	2
.LC169:
	ASCII(.ascii	"pic_parameter_set_id(%d) out of range.\012\000" )
.LC170:
	ASCII(.ascii	"PPS: seq_parameter_set_id\000" )
	.space	2
.LC171:
	ASCII(.ascii	"seq_parameter_set_id out of range.\012\000" )
.LC172:
	ASCII(.ascii	"PPS decode error line: %d.\012\000" )
.LC173:
	ASCII(.ascii	"VUI: aspect_ratio_info_present_flag\000" )
.LC174:
	ASCII(.ascii	"VUI: aspect_ratio_idc\000" )
	.space	2
.LC175:
	ASCII(.ascii	"VUI: sar_width\000" )
	.space	1
.LC176:
	ASCII(.ascii	"VUI: sar_height\000" )
.LC177:
	ASCII(.ascii	"VUI: overscan_info_present_flag\000" )
.LC178:
	ASCII(.ascii	"VUI: overscan_appropriate_flag\000" )
	.space	1
.LC179:
	ASCII(.ascii	"VUI: video_signal_type_present_flag\000" )
.LC180:
	ASCII(.ascii	"VUI: video_format\000" )
	.space	2
.LC181:
	ASCII(.ascii	"VUI: video_full_range_flag\000" )
	.space	1
.LC182:
	ASCII(.ascii	"VUI: color_description_present_flag\000" )
.LC183:
	ASCII(.ascii	"VUI: colour_primaries\000" )
	.space	2
.LC184:
	ASCII(.ascii	"VUI: transfer_characteristics\000" )
	.space	2
.LC185:
	ASCII(.ascii	"VUI: matrix_coefficients\000" )
	.space	3
.LC186:
	ASCII(.ascii	"VUI: chroma_loc_info_present_flag\000" )
	.space	2
.LC187:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_top_field\000" )
	.space	2
.LC188:
	ASCII(.ascii	"VUI: chroma_sample_loc_type_bottom_field\000" )
	.space	3
.LC189:
	ASCII(.ascii	"VUI: timing_info_present_flag\000" )
	.space	2
.LC190:
	ASCII(.ascii	"VUI: num_units_in_tick\000" )
	.space	1
.LC191:
	ASCII(.ascii	"VUI: time_scale\000" )
.LC192:
	ASCII(.ascii	"VUI: fixed_frame_rate_flag\000" )
	.space	1
.LC193:
	ASCII(.ascii	"VUI: nal_hrd_parameters_present_flag\000" )
	.space	3
.LC194:
	ASCII(.ascii	"VUI: cpb_cnt_minus1\000" )
.LC195:
	ASCII(.ascii	"VUI: bit_rate_scale\000" )
.LC196:
	ASCII(.ascii	"VUI: cpb_size_scale\000" )
.LC197:
	ASCII(.ascii	"hrd->cpb_cnt_minus1 out of range\012\000" )
	.space	2
.LC198:
	ASCII(.ascii	"VUI: bit_rate_value_minus1\000" )
	.space	1
.LC199:
	ASCII(.ascii	"VUI: cpb_size_value_minus1\000" )
	.space	1
.LC200:
	ASCII(.ascii	"VUI: cbr_flag\000" )
	.space	2
.LC201:
	ASCII(.ascii	"VUI: initial_cpb_removal_delay_length_minus1\000" )
	.space	3
.LC202:
	ASCII(.ascii	"VUI: cpb_removal_delay_length_minus1\000" )
	.space	3
.LC203:
	ASCII(.ascii	"VUI: dpb_output_delay_length_minus1\000" )
.LC204:
	ASCII(.ascii	"VUI: time_offset_length\000" )
.LC205:
	ASCII(.ascii	"VUI: vcl_hrd_parameters_present_flag\000" )
	.space	3
.LC206:
	ASCII(.ascii	"VUI: low_delay_hrd_flag\000" )
.LC207:
	ASCII(.ascii	"VUI: pic_struct_present_flag\000" )
	.space	3
.LC208:
	ASCII(.ascii	"VUI: bitstream_restriction_flag\000" )
.LC209:
	ASCII(.ascii	"VUI: motion_vectors_over_pic_boundaries_flag\000" )
	.space	3
.LC210:
	ASCII(.ascii	"VUI: max_bytes_per_pic_denom\000" )
	.space	3
.LC211:
	ASCII(.ascii	"VUI: max_bits_per_mb_denom\000" )
	.space	1
.LC212:
	ASCII(.ascii	"VUI: log2_max_mv_length_horizontal\000" )
	.space	1
.LC213:
	ASCII(.ascii	"VUI: log2_max_mv_length_vertical\000" )
	.space	3
.LC214:
	ASCII(.ascii	"VUI: num_reorder_frames\000" )
.LC215:
	ASCII(.ascii	"VUI: max_dec_frame_buffering\000" )
	.space	3
.LC216:
	ASCII(.ascii	"dar=%d, final_dar=%d\012\000" )
	.space	2
.LC217:
	ASCII(.ascii	"SPS: chroma_format_idc\000" )
	.space	1
.LC218:
	ASCII(.ascii	"pSPS->chroma_format_idc out of range.\012\000" )
	.space	1
.LC219:
	ASCII(.ascii	"SPS: bit_depth_luma_minus8\000" )
	.space	1
.LC220:
	ASCII(.ascii	"bit_depth_luma_minus8 not equal 0.\012\000" )
.LC221:
	ASCII(.ascii	"SPS: bit_depth_chroma_minus8\000" )
	.space	3
.LC222:
	ASCII(.ascii	"bit_depth_chroma_minus8 not equal 0.\012\000" )
	.space	2
.LC223:
	ASCII(.ascii	"SPS: qpprime_y_zero_trans_bypass_flag\000" )
	.space	2
.LC224:
	ASCII(.ascii	"qpprime_y_zero_trans_bypass_flag not equal 0.\012\000" )
	.space	1
.LC225:
	ASCII(.ascii	"SPS: seq_scaling_matrix_present_flag\000" )
	.space	3
.LC226:
	ASCII(.ascii	"SPS: log2_max_frame_num_minus4\000" )
	.space	1
.LC227:
	ASCII(.ascii	"pSPS->log2_max_frame_num_minus4 out of range.\012\000" )
	.space	1
.LC228:
	ASCII(.ascii	"SPS: pic_order_cnt_type\000" )
.LC229:
	ASCII(.ascii	"pSPS->pic_order_cnt_type out of range.\012\000" )
.LC230:
	ASCII(.ascii	"SPS: log2_max_pic_order_cnt_lsb_minus4\000" )
	.space	1
.LC231:
	ASCII(.ascii	"SPS: num_ref_frames\000" )
.LC232:
	ASCII(.ascii	"pSPS->log2_max_pic_order_cnt_lsb_minus4 out of rang" )
	ASCII(.ascii	"e.\012\000" )
	.space	1
.LC233:
	ASCII(.ascii	"SPS: delta_pic_order_always_zero_flag\000" )
	.space	2
.LC234:
	ASCII(.ascii	"SPS: offset_for_non_ref_pic\000" )
.LC235:
	ASCII(.ascii	"SPS: offset_for_top_to_bottom_field\000" )
.LC236:
	ASCII(.ascii	"SPS: num_ref_frames_in_pic_order_cnt_cycle\000" )
	.space	1
.LC237:
	ASCII(.ascii	"pSPS->num_ref_frames_in_pic_order_cnt_cycle out of " )
	ASCII(.ascii	"range.\012\000" )
	.space	1
.LC238:
	ASCII(.ascii	"SPS: offset_for_ref_frame[i]\000" )
	.space	3
.LC239:
	ASCII(.ascii	"SPS: gaps_in_frame_num_value_allowed_flag\000" )
	.space	2
.LC240:
	ASCII(.ascii	"SPS: pic_width_in_mbs_minus1\000" )
	.space	3
.LC241:
	ASCII(.ascii	"pSPS->pic_width_in_mbs_minus1 out of range(=%d).\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC242:
	ASCII(.ascii	"SPS: pic_height_in_map_units_minus1\000" )
.LC243:
	ASCII(.ascii	"SPS: frame_mbs_only_flag\000" )
	.space	3
.LC244:
	ASCII(.ascii	"pSPS->pic_height_in_map_units_minus1 out of range.\012" )
	ASCII(.ascii	"\000" )
.LC245:
	ASCII(.ascii	"pic size too large.\012\000" )
	.space	3
.LC246:
	ASCII(.ascii	"level_idc %d not support.\012\000" )
	.space	1
.LC247:
	ASCII(.ascii	"dpb size according level : %d\012\000" )
	.space	1
.LC248:
	ASCII(.ascii	"pSPS->num_ref_frames(%d) > DPB size(%d), try to sel" )
	ASCII(.ascii	"ect the reasonable one.\012\000" )
.LC249:
	ASCII(.ascii	"SPS: direct_8x8_inference_flag\000" )
	.space	1
.LC250:
	ASCII(.ascii	"SPS: frame_cropping_flag\000" )
	.space	3
.LC251:
	ASCII(.ascii	"SPS: frame_cropping_rect_left_offset\000" )
	.space	3
.LC252:
	ASCII(.ascii	"SPS: frame_cropping_rect_right_offset\000" )
	.space	2
.LC253:
	ASCII(.ascii	"SPS: frame_cropping_rect_top_offset\000" )
.LC254:
	ASCII(.ascii	"SPS: frame_cropping_rect_bottom_offset\000" )
	.space	1
.LC255:
	ASCII(.ascii	"SPS: vui_parameters_present_flag\000" )
	.space	3
.LC256:
	ASCII(.ascii	"max_dec_frame_buffering(%d) > MaxDpbSize(%d)\012\000" )
	.space	2
.LC257:
	ASCII(.ascii	"SPS: mb_adaptive_frame_field_flag\000" )
	.space	2
.LC258:
	ASCII(.ascii	"SPS: profile_idc\000" )
	.space	3
.LC259:
	ASCII(.ascii	"SPS: constrained_set0_flag\000" )
	.space	1
.LC260:
	ASCII(.ascii	"SPS: constrained_set1_flag\000" )
	.space	1
.LC261:
	ASCII(.ascii	"SPS: constrained_set2_flag\000" )
	.space	1
.LC262:
	ASCII(.ascii	"SPS: constrained_set3_flag\000" )
	.space	1
.LC263:
	ASCII(.ascii	"SPS: constrained_set4_flag\000" )
	.space	1
.LC264:
	ASCII(.ascii	"SPS: constrained_set5_flag\000" )
	.space	1
.LC265:
	ASCII(.ascii	"SPS: reserved_zero_2bits\000" )
	.space	3
.LC266:
	ASCII(.ascii	"SPS: level_idc\000" )
	.space	1
.LC267:
	ASCII(.ascii	"SPS: seq_parameter_set_id\000" )
	.space	2
.LC268:
	ASCII(.ascii	"MVC_BASELINE stream, try to decode, exit when FMO o" )
	ASCII(.ascii	"ccurred.\012\000" )
	.space	3
.LC269:
	ASCII(.ascii	"MVC_EXTENDED stream, try to decode, exit when datap" )
	ASCII(.ascii	"artition occurred.\012\000" )
	.space	1
.LC270:
	ASCII(.ascii	"others High profile stream, try to decode, exit whe" )
	ASCII(.ascii	"n high profile not support occurred.\012\000" )
	.space	3
.LC271:
	ASCII(.ascii	"profile_idc = %5d error, try to decode as main prof" )
	ASCII(.ascii	"ile.\012\000" )
	.space	3
.LC272:
	ASCII(.ascii	"level_idc = %5d error, try to decode as level_idc %" )
	ASCII(.ascii	"d.\012\000" )
	.space	1
.LC273:
	ASCII(.ascii	"Line %d: SPS[%d] decode error.\012\000" )
.LC274:
	ASCII(.ascii	"SUBSPS: num_views_minus1\000" )
	.space	3
.LC275:
	ASCII(.ascii	"pSubsps->num_views_minus1(%d) out of range.\012\000" )
	.space	3
.LC276:
	ASCII(.ascii	"SUBSPS: view_id[]\000" )
	.space	2
.LC277:
	ASCII(.ascii	"SUBSPS: num_anchor_refs_l0[]\000" )
	.space	3
.LC278:
	ASCII(.ascii	"SUBSPS: num_anchor_refs_l1[]\000" )
	.space	3
.LC279:
	ASCII(.ascii	"pSubsps->num_anchor_refs_l0(%d) out of range.\012\000" )
	.space	1
.LC280:
	ASCII(.ascii	"SUBSPS: anchor_ref_l0[][]\000" )
	.space	2
.LC281:
	ASCII(.ascii	"pSubsps->num_anchor_refs_l1(%d) out of range.\012\000" )
	.space	1
.LC282:
	ASCII(.ascii	"SUBSPS: anchor_ref_l1[][]\000" )
	.space	2
.LC283:
	ASCII(.ascii	"SUBSPS: num_level_values_signalled_minus1\000" )
	.space	2
.LC284:
	ASCII(.ascii	"SUBSPS: num_non_anchor_refs_l0[]\000" )
	.space	3
.LC285:
	ASCII(.ascii	"SUBSPS: num_non_anchor_refs_l1[]\000" )
	.space	3
.LC286:
	ASCII(.ascii	"pSubsps->num_non_anchor_refs_l0(%d) out of range.\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC287:
	ASCII(.ascii	"SUBSPS: non_anchor_ref_l0[][]\000" )
	.space	2
.LC288:
	ASCII(.ascii	"pSubsps->num_non_anchor_refs_l1(%d) out of range.\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC289:
	ASCII(.ascii	"SUBSPS: non_anchor_ref_l1[][]\000" )
	.space	2
.LC290:
	ASCII(.ascii	"num_level(%d) out of range.\012\000" )
	.space	3
.LC291:
	ASCII(.ascii	"SUBSPS: level_idc[]\000" )
.LC292:
	ASCII(.ascii	"SUBSPS: num_applicable_ops_minus1\000" )
	.space	2
.LC293:
	ASCII(.ascii	"num_ops(%d) out of range.\012\000" )
	.space	1
.LC294:
	ASCII(.ascii	"SUBSPS: applicable_op_temporal_id[][]\000" )
	.space	2
.LC295:
	ASCII(.ascii	"SUBSPS: applicable_op_num_target_views_minus1[][]\000" )
	.space	2
.LC296:
	ASCII(.ascii	"SUBSPS: applicable_op_num_views_minus1\000" )
	.space	1
.LC297:
	ASCII(.ascii	"applicable_op_num_target_views(%d) out of range.\012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC298:
	ASCII(.ascii	"SUBSPS: applicable_op_target_view_id[][][]\000" )
	.space	1
.LC299:
	ASCII(.ascii	"pSubsps->applicable_op_num_views_minus1(%d) out of " )
	ASCII(.ascii	"range.\012\000" )
	.space	1
.LC300:
	ASCII(.ascii	"MVC VUI: vui_mvc_num_ops_minus1\000" )
.LC301:
	ASCII(.ascii	"vui_mvc_num_ops_minus1 %d out of range\012\000" )
.LC302:
	ASCII(.ascii	"MVC VUI: vui_mvc_temporal_id[]\000" )
	.space	1
.LC303:
	ASCII(.ascii	"SUBSPS VUI: vui_mvc_num_target_output_views_minus1[" )
	ASCII(.ascii	"]\000" )
	.space	3
.LC304:
	ASCII(.ascii	"MVC VUI: vui_mvc_timing_info_present_flag\000" )
	.space	2
.LC305:
	ASCII(.ascii	"MVC VUI: vui_mvc_view_id[][]\000" )
	.space	3
.LC306:
	ASCII(.ascii	"MVC VUI: vui_mvc_num_units_in_tick\000" )
	.space	1
.LC307:
	ASCII(.ascii	"MVC VUI: vui_mvc_time_scale[]\000" )
	.space	2
.LC308:
	ASCII(.ascii	"MVC VUI: vui_mvc_fixed_frame_rate_flag\000" )
	.space	1
.LC309:
	ASCII(.ascii	"MVC VUI: vui_mvc_nal_hrd_parameters_present_flag[]\000" )
	.space	1
.LC310:
	ASCII(.ascii	"MVC VUI: cpb_cnt_minus1\000" )
.LC311:
	ASCII(.ascii	"MVC VUI: bit_rate_scale\000" )
.LC312:
	ASCII(.ascii	"MVC VUI: cpb_size_scale\000" )
.LC313:
	ASCII(.ascii	"MVC VUI: bit_rate_value_minus1\000" )
	.space	1
.LC314:
	ASCII(.ascii	"MVC VUI: cpb_size_value_minus1\000" )
	.space	1
.LC315:
	ASCII(.ascii	"MVC VUI: cbr_flag\000" )
	.space	2
.LC316:
	ASCII(.ascii	"MVC VUI: initial_cpb_removal_delay_length_minus1\000" )
	.space	3
.LC317:
	ASCII(.ascii	"MVC VUI: cpb_removal_delay_length_minus1\000" )
	.space	3
.LC318:
	ASCII(.ascii	"MVC VUI: dpb_output_delay_length_minus1\000" )
.LC319:
	ASCII(.ascii	"MVC VUI: time_offset_length\000" )
.LC320:
	ASCII(.ascii	"MVC VUI: vui_mvc_vcl_hrd_parameters_present_flag[]\000" )
	.space	1
.LC321:
	ASCII(.ascii	"MVC VUI: vui_mvc_low_delay_hrd_flag[]\000" )
	.space	2
.LC322:
	ASCII(.ascii	"MVC VUI: vui_mvc_pic_struct_present_flag[]\000" )
	.space	1
.LC323:
	ASCII(.ascii	"SUBSPS: profile_idc\000" )
.LC324:
	ASCII(.ascii	"SUBSPS: constrained_set0_flag\000" )
	.space	2
.LC325:
	ASCII(.ascii	"SUBSPS: constrained_set1_flag\000" )
	.space	2
.LC326:
	ASCII(.ascii	"SUBSPS: constrained_set2_flag\000" )
	.space	2
.LC327:
	ASCII(.ascii	"SUBSPS: constrained_set3_flag\000" )
	.space	2
.LC328:
	ASCII(.ascii	"SUBSPS: constrained_set4_flag\000" )
	.space	2
.LC329:
	ASCII(.ascii	"SUBSPS: constrained_set5_flag\000" )
	.space	2
.LC330:
	ASCII(.ascii	"SUBSPS: reserved_zero_2bits\000" )
.LC331:
	ASCII(.ascii	"SUBSPS: level_idc\000" )
	.space	2
.LC332:
	ASCII(.ascii	"SUBSPS: seq_parameter_set_id\000" )
	.space	3
.LC333:
	ASCII(.ascii	"profile_idc = %5d error\012\000" )
	.space	3
.LC334:
	ASCII(.ascii	"level_idc = %5d error, try to decode as level_idc 4" )
	ASCII(.ascii	"1.\012\000" )
	.space	1
.LC335:
	ASCII(.ascii	"SUBSPS decode error.\012\000" )
	.space	2
.LC336:
	ASCII(.ascii	"SUBSPS: bit_equal_to_one\000" )
	.space	3
.LC337:
	ASCII(.ascii	"SUBSPS Mvc Ext decode error.\012\000" )
	.space	2
.LC338:
	ASCII(.ascii	"SUBSPS: mvc_vui_parameters_present_flag\000" )
.LC339:
	ASCII(.ascii	"SUBSPS Mvc Vui Ext decode error.\012\000" )
	.space	2
.LC340:
	ASCII(.ascii	"SEI: frame_packing_arrangement_id\000" )
	.space	2
.LC341:
	ASCII(.ascii	"SEI: frame_packing_arrangement_cancel_flag\000" )
	.space	1
.LC342:
	ASCII(.ascii	"SEI: frame_packing_arrangement_type\000" )
.LC343:
	ASCII(.ascii	"SEI: quincunx_sampling_flag\000" )
.LC344:
	ASCII(.ascii	"SEI: content_interpretation_type\000" )
	.space	3
.LC345:
	ASCII(.ascii	"SEI: spatial_flipping_flag\000" )
	.space	1
.LC346:
	ASCII(.ascii	"SEI: frame0_flipped_flag\000" )
	.space	3
.LC347:
	ASCII(.ascii	"SEI: field_views_flag\000" )
	.space	2
.LC348:
	ASCII(.ascii	"SEI: current_frame_is_frame0_flag\000" )
	.space	2
.LC349:
	ASCII(.ascii	"SEI: frame0_self_contained_flag\000" )
.LC350:
	ASCII(.ascii	"SEI: frame1_self_contained_flag\000" )
.LC351:
	ASCII(.ascii	"SEI: frame0_grid_position_x\000" )
.LC352:
	ASCII(.ascii	"SEI: frame0_grid_position_y\000" )
.LC353:
	ASCII(.ascii	"SEI: frame1_grid_position_x\000" )
.LC354:
	ASCII(.ascii	"SEI: frame1_grid_position_y\000" )
.LC355:
	ASCII(.ascii	"SEI: frame_packing_arrangement_reserved_byte\000" )
	.space	3
.LC356:
	ASCII(.ascii	"SEI: frame_packing_arrangement_repetition_period\000" )
	.space	3
.LC357:
	ASCII(.ascii	"SEI: frame_packing_arrangement_extension_flag\000" )
	.space	2
.LC358:
	ASCII(.ascii	"DecPicTimingSEI but SPS is invalid.\012\000" )
	.space	3
.LC359:
	ASCII(.ascii	"SEI: cpb_removal_delay\000" )
	.space	1
.LC360:
	ASCII(.ascii	"SEI: dpb_output_delay\000" )
	.space	2
.LC361:
	ASCII(.ascii	"pic_struct\000" )
	.space	1
.LC362:
	ASCII(.ascii	"SEI nal dec payload type err\012\000" )
	.space	2
.LC363:
	ASCII(.ascii	"SEI nal dec payloadSize err\012\000" )
	.space	3
.LC364:
	ASCII(.ascii	"MVC_SEI_BUFFERING_PERIOD,offset = %d,payload_size =" )
	ASCII(.ascii	" %d \012\000" )
	.space	3
.LC365:
	ASCII(.ascii	"MVC_PassBytes err [%s][%d]\012\000" )
.LC366:
	ASCII(.ascii	"MVC_SEI_PIC_TIMING,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC367:
	ASCII(.ascii	"MVC_SEI_PAN_SCAN_RECT,offset = %d,payload_size = %d" )
	ASCII(.ascii	" \012\000" )
	.space	2
.LC368:
	ASCII(.ascii	"MVC_SEI_FILLER_PAYLOAD,offset = %d,payload_size = %" )
	ASCII(.ascii	"d \012\000" )
	.space	1
.LC369:
	ASCII(.ascii	"MVC_SEI_USER_DATA_REGISTERED_ITU_T_T35, offset = %d" )
	ASCII(.ascii	", payload_size = %d \012\000" )
	.space	3
.LC370:
	ASCII(.ascii	"MVC_SEI_USER_DATA_UNREGISTERED, offset = %d, payloa" )
	ASCII(.ascii	"d_size = %d \012\000" )
	.space	3
.LC371:
	ASCII(.ascii	"SEI: itu_t_t35_country_code\000" )
.LC372:
	ASCII(.ascii	"SEI: itu_t_t35_country_code_extension_byte\000" )
	.space	1
.LC373:
	ASCII(.ascii	"SEI: itu_t_t35_provider_code\000" )
	.space	3
.LC374:
	ASCII(.ascii	"cann't dec usrdata\012\000" )
.LC375:
	ASCII(.ascii	"MVC_SEI_RECOVERY_POINT,offset = %d,payload_size = %" )
	ASCII(.ascii	"d \012\000" )
	.space	1
.LC376:
	ASCII(.ascii	"MVC_SEI_DEC_REF_PIC_MARKING_REPETITION,offset = %d," )
	ASCII(.ascii	"payload_size = %d \012\000" )
	.space	1
.LC377:
	ASCII(.ascii	"MVC_SEI_SPARE_PIC,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	2
.LC378:
	ASCII(.ascii	"MVC_SEI_SCENE_INFO,offset = %d,payload_size = %d \012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC379:
	ASCII(.ascii	"MVC_SEI_SUB_SEQ_INFO,offset = %d,payload_size = %d " )
	ASCII(.ascii	"\012\000" )
	.space	3
.LC380:
	ASCII(.ascii	"MVC_SEI_SUB_SEQ_LAYER_CHARACTERISTICS,offset = %d,p" )
	ASCII(.ascii	"ayload_size = %d \012\000" )
	.space	2
.LC381:
	ASCII(.ascii	"MVC_SEI_SUB_SEQ_CHARACTERISTICS,offset = %d,payload" )
	ASCII(.ascii	"_size = %d \012\000" )
.LC382:
	ASCII(.ascii	"MVC_SEI_FULL_FRAME_FREEZE,offset = %d,payload_size " )
	ASCII(.ascii	"= %d \012\000" )
	.space	2
.LC383:
	ASCII(.ascii	"MVC_SEI_FULL_FRAME_FREEZE_RELEASE,offset = %d,paylo" )
	ASCII(.ascii	"ad_size = %d \012\000" )
	.space	2
.LC384:
	ASCII(.ascii	"MVC_SEI_FULL_FRAME_SNAPSHOT,offset = %d,payload_siz" )
	ASCII(.ascii	"e = %d \012\000" )
.LC385:
	ASCII(.ascii	"MVC_SEI_PROGRESSIVE_REFINEMENT_SEGMENT_START,offset" )
	ASCII(.ascii	" = %d,payload_size = %d \012\000" )
	.space	3
.LC386:
	ASCII(.ascii	"MVC_SEI_PROGRESSIVE_REFINEMENT_SEGMENT_END,offset =" )
	ASCII(.ascii	" %d,payload_size = %d \012\000" )
	.space	1
.LC387:
	ASCII(.ascii	"MVC_SEI_MOTION_CONSTRAINED_SLICE_GROUP_SET,offset =" )
	ASCII(.ascii	" %d,payload_size = %d \012\000" )
	.space	1
.LC388:
	ASCII(.ascii	"MVC_SEI_FILM_GRAIN_CHARACTERISTICS,offset = %d,payl" )
	ASCII(.ascii	"oad_size = %d \012\000" )
	.space	1
.LC389:
	ASCII(.ascii	"MVC_SEI_DEBLOCKING_FILTER_DISPLAY_PREFERENCE,offset" )
	ASCII(.ascii	" = %d,payload_size = %d \012\000" )
	.space	3
.LC390:
	ASCII(.ascii	"MVC_SEI_STEREO_VIDEO_INFO,offset = %d,payload_size " )
	ASCII(.ascii	"= %d \012\000" )
	.space	2
.LC391:
	ASCII(.ascii	"too much usrdat, cann't dec SEI\012\000" )
	.space	3
.LC392:
	ASCII(.ascii	"\012 mvc the stream is error,len:%d\012\000" )
	.space	2
.LC393:
	ASCII(.ascii	"\012Slice nal or IDR nal = %d\012\000" )
.LC394:
	ASCII(.ascii	"sliceheader dec err\012\000" )
	.space	3
.LC395:
	ASCII(.ascii	"MVC_InquireSliceProperty mvc flag %d is wrong\012\000" )
	.space	1
.LC396:
	ASCII(.ascii	"MvcDec destroy\012\000" )
.LC397:
	ASCII(.ascii	"MVC recycle image\012\000" )
	.space	1
.LC398:
	ASCII(.ascii	"pH264Ctx is %#x, pFrameStore is %#x\012\000" )
	.space	3
.LC399:
	ASCII(.ascii	"line: %d, pstLogicFsImage is NULL\012\000" )
	.space	1
.LC400:
	ASCII(.ascii	"InsertVO err:%d, MVC_ClearAll\012\000" )
	.space	1
.LC401:
	ASCII(.ascii	"mvc.c line %d: MVC_FRAME para err(ret=%d), recycle " )
	ASCII(.ascii	"image self\012\000" )
	.space	1
.LC402:
	ASCII(.ascii	"[%s][%d] MVC_OutputFrmToVO return %d !\012\000" )
.LC403:
	ASCII(.ascii	"[%s][%d] MVC_OutputFrmToVO return %d\012\000" )
	.space	2
.LC404:
	ASCII(.ascii	"%s %d MVC_OK != MVC_FlushDPB!!\012\000" )
.LC405:
	ASCII(.ascii	"%s %d MVC_OK != MVC_InitDPB!!\012\000" )
	.space	1
.LC406:
	ASCII(.ascii	"----------------- MVC_IMODE -> %d -----------------" )
	ASCII(.ascii	"-\012\000" )
	.space	2
.LC407:
	ASCII(.ascii	"Discard this B(poc=%d) befor P, is_ref_idc=%d.\012\000" )
.LC408:
	ASCII(.ascii	"***** VDM start, TotalPicNum=%d, pMvcCtx->CurrPic.s" )
	ASCII(.ascii	"tructure=%d.\012\000" )
	.space	3
.LC409:
	ASCII(.ascii	"MVC_DecVDM fail [%s][%d]\012\000" )
	.space	2
.LC410:
	ASCII(.ascii	"\012 receive streambuff=%p; phy_addr=0x%x; bitstrea" )
	ASCII(.ascii	"m_length=%d\012\000" )
	.space	3
.LC411:
	ASCII(.ascii	"nal_releaMVC_SE_ERR\012\000" )
	.space	3
.LC412:
	ASCII(.ascii	"cann't find slot for current nal\012\000" )
	.space	2
.LC413:
	ASCII(.ascii	"receive a zero packet\012\000" )
	.space	1
.LC414:
	ASCII(.ascii	"clear all dec para\012\000" )
.LC415:
	ASCII(.ascii	"line %d, get APC error, ret %d\012\000" )
.LC416:
	ASCII(.ascii	"InserFrmInDPB: cur pic struct = %d!\012\000" )
	.space	3
.LC417:
	ASCII(.ascii	"line: %d, pImage is NULL!\012\000" )
	.space	1
.LC418:
	ASCII(.ascii	"FS_ALLOC_ERR, MVC_ClearAll\012\000" )
.LC419:
	ASCII(.ascii	"Can not new logic fs! MVC_ClearAll\012\000" )
.LC420:
	ASCII(.ascii	"%s %d NULL== pMvcCtx->SPS || NULL == pMvcCtx->PPS |" )
	ASCII(.ascii	"| NULL == pMvcCtx->DecSlicePara!!\012\000" )
	.space	2
.LC421:
	ASCII(.ascii	"-1 == VCTRL_GetChanIDByCtx() Err! \012\000" )
.LC422:
	ASCII(.ascii	"CurrPic.state is 'MVC_EMPTY'\012\000" )
	.space	2
.LC423:
	ASCII(.ascii	"MVC_StorePicInDpb return(%d) from L%d\012\000" )
	.space	1
.LC424:
	ASCII(.ascii	"Is IDR, but init DPB failed!\012\000" )
	.space	2
.LC425:
	ASCII(.ascii	"Is IDR, but FlushDPB failed!\012\000" )
	.space	2
.LC426:
	ASCII(.ascii	"MVC_DirectOutput mode\012\000" )
	.space	1
.LC427:
	ASCII(.ascii	"line %d, REPORT_IFRAME_ERR\012\000" )
.LC428:
	ASCII(.ascii	"line %d, return %d\012\000" )
.LC429:
	ASCII(.ascii	"err(%d) > ref_thr(%d)\012\000" )
	.space	1
.LC430:
	ASCII(.ascii	"MVC_Marking return %d\012\000" )
	.space	1
.LC431:
	ASCII(.ascii	"line %d: pMvcCtx->DPB.size = %d, ref %d, ltref %d\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC432:
	ASCII(.ascii	"line %d, MVC_GetMinPOC failed\012\000" )
	.space	1
.LC433:
	ASCII(.ascii	"%s: pos(%d) = pre_pos, force return.\012\000" )
	.space	2
.LC434:
	ASCII(.ascii	"GAP found while DPB is MVC_EMPTY!\012\000" )
	.space	1
.LC435:
	ASCII(.ascii	"MVC_FRAME num gap try to fill it \012\000" )
	.space	1
.LC436:
	ASCII(.ascii	"CurrFrameNum = %d  UnusedShortTermFrameNum = %d\012" )
	ASCII(.ascii	"\000" )
	.space	3
.LC437:
	ASCII(.ascii	"cann't allocate MVC_FRAME store when gap find\012\000" )
	.space	1
.LC438:
	ASCII(.ascii	"allocate MVC_FRAME store when gap find\012\000" )
.LC439:
	ASCII(.ascii	"line %d: store gap pic err, ret=%d\012\000" )
.LC440:
	ASCII(.ascii	"line %d: flush dpb return %d\012\000" )
	.space	2
.LC441:
	ASCII(.ascii	"line %d: init dpb return %d\012\000" )
	.space	3
.LC442:
	ASCII(.ascii	"resolution error, the CAP_LEVEL_USER_DEFINE_WITH_OP" )
	ASCII(.ascii	"TION channel with s32ReRangeEn == 0 can't support s" )
	ASCII(.ascii	"uch bitstream.\012\000" )
	.space	2
.LC443:
	ASCII(.ascii	"s32MaxRefFrameNum < pMvcCtx->DPB.size, the CAP_LEVE" )
	ASCII(.ascii	"L_USER_DEFINE_WITH_OPTION channel can't support suc" )
	ASCII(.ascii	"h bitstream.\012\000" )
.LC444:
	ASCII(.ascii	"mem arrange err, MVC_ClearAll\012\000" )
	.space	1
.LC445:
	ASCII(.ascii	"line %d: MVC_FRAME gap(=%d) > dpb size(=%d)\012\000" )
	.space	3
.LC446:
	ASCII(.ascii	"MVC_FRAME num gap don't allowed but gap find\012\000" )
	.space	2
.LC447:
	ASCII(.ascii	"line %d: frame num(%d/%d) find gap in NON-I slice b" )
	ASCII(.ascii	"ut here gap is not allowed\012\000" )
	.space	1
.LC448:
	ASCII(.ascii	"line %d: dec gap failed\012\000" )
	.space	3
.LC449:
	ASCII(.ascii	"line %d: alloc framestore failed\012\000" )
	.space	2
.LC450:
	ASCII(.ascii	"dec_pts: %lld\012\000" )
	.space	1
.LC451:
	ASCII(.ascii	"dec_usertag: %lld\012\000" )
	.space	1
.LC452:
	ASCII(.ascii	"line %d: CurrPic.frame_store is NULL\012\000" )
	.space	2
.LC453:
	ASCII(.ascii	"get back frm\012\000" )
	.space	2
.LC454:
	ASCII(.ascii	"Start Reason: SliceParaNum, MaxBytesReceived = %d, " )
	ASCII(.ascii	"%d(thr=%d)\012\000" )
	.space	1
.LC455:
	ASCII(.ascii	"Too many slice or bitstream, err!\012\000" )
	.space	1
.LC456:
	ASCII(.ascii	"Start Reason: new_pic_flag\012\000" )
.LC457:
	ASCII(.ascii	"init pic err, find next recover point or next valid" )
	ASCII(.ascii	" sps, pps, or exit\012\000" )
	.space	1
.LC458:
	ASCII(.ascii	"MVC_DecList error, ret=%d\012\000" )
	.space	1
.LC459:
	ASCII(.ascii	"dec list err.\012\000" )
	.space	1
.LC460:
	ASCII(.ascii	"pMvcCtx->TotalNal = %d, type:%d\012\000" )
	.space	3
.LC461:
	ASCII(.ascii	"stop i want\012\000" )
	.space	3
.LC462:
	ASCII(.ascii	"***** NAL: IDR/Slice, nal_unit_type=%d, TotalSlice=" )
	ASCII(.ascii	"%d\012\000" )
	.space	1
.LC463:
	ASCII(.ascii	"*******TotalPicNum=%d********\012\000" )
	.space	1
.LC464:
	ASCII(.ascii	"***** NAL: PPS, nal_unit_type=%d, TotalPPS=%d\012\000" )
	.space	1
.LC465:
	ASCII(.ascii	"PPS decode error.\012\000" )
	.space	1
.LC466:
	ASCII(.ascii	"***** NAL: SPS, nal_unit_type=%d, TotalSPS=%d\012\000" )
	.space	1
.LC467:
	ASCII(.ascii	"SPS decode error.\012\000" )
	.space	1
.LC468:
	ASCII(.ascii	"***** NAL: SEI, nal_unit_type=%d\012\000" )
	.space	2
.LC469:
	ASCII(.ascii	"SEI decode error.\012\000" )
	.space	1
.LC470:
	ASCII(.ascii	"***** NAL: AUD, nal_unit_type=%d\012\000" )
	.space	2
.LC471:
	ASCII(.ascii	"***** NAL: EOSEQ, nal_unit_type=%d\012\000" )
.LC472:
	ASCII(.ascii	"***** NAL: FILL, nal_unit_type=%d\012\000" )
	.space	1
.LC473:
	ASCII(.ascii	"***** NAL: EOSTREAM, nal_unit_type=%d\012\000" )
	.space	1
.LC474:
	ASCII(.ascii	"***** NAL: SPSEXT, nal_unit_type=%d\012\000" )
	.space	3
.LC475:
	ASCII(.ascii	"***** NAL: PREFIX, nal_unit_type=%d\012\000" )
	.space	3
.LC476:
	ASCII(.ascii	"***** NAL: SUBSPS, nal_unit_type=%d\012\000" )
	.space	3
.LC477:
	ASCII(.ascii	"***** NAL: AUX, nal_unit_type=%d\012\000" )
	.space	2
.LC478:
	ASCII(.ascii	"***** NAL: EOPIC, nal_unit_type=%d\012\000" )
.LC479:
	ASCII(.ascii	"***** NAL: UNSUPPORT, nal_unit_type=%d,nalu header:" )
	ASCII(.ascii	"%x\012\000" )
	.space	1
.LC480:
	ASCII(.ascii	"nal_header != 0x00000100 not support.\012\000" )
	.space	1
.LC481:
	ASCII(.ascii	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d" )
	ASCII(.ascii	",new w/h = %d/%d\012\000" )
	.space	3
.LC482:
	ASCII(.ascii	"MVC_FindTrailZeros ERR\012\000" )
.LC483:
	ASCII(.ascii	"store pic err, ret = %d\012\000" )
	.space	3
.LC484:
	ASCII(.ascii	"MVC_IMODE nal store pic err, ret = %d\012\000" )
	.space	1
.LC485:
	ASCII(.ascii	"MVC_IMODE nal flush dpb err, ret = %d\012\000" )
	.space	1
.LC486:
	ASCII(.ascii	"cann't find FrameStore\012\000" )
.LC487:
	ASCII(.ascii	"========== MVC FrameStore state(is_used, is_in_dpb," )
	ASCII(.ascii	" MVC_IsOutDPB) ========\012\000" )
.LC488:
	ASCII(.ascii	"ReadImgNum = %d, NewImgNum = %d\012\000" )
	.space	3
.LC489:
	ASCII(.ascii	"%02d: %d %d %d\012\000" )
.LC490:
	ASCII(.ascii	"FrameStore leak, MVC_ClearAll\012\000" )
	.bss
	.align	2
.LANCHOR2 = . + 0
.LANCHOR3 = . + 8184
	.type	pps_tmp.15781, %object
	.size	pps_tmp.15781, 2240
pps_tmp.15781:
	.space	2240
	.type	sps_tmp.15917, %object
	.size	sps_tmp.15917, 3992
sps_tmp.15917:
	.space	3992
	.type	MvcTmpBuf, %object
	.size	MvcTmpBuf, 68
MvcTmpBuf:
	.space	68
	.type	cnt.14734, %object
	.size	cnt.14734, 4
cnt.14734:
	.space	4
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
