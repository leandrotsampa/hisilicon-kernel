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
	.file	"syntax.c"
	.text
	.align	2
	.global	InitVoQueue
	.type	InitVoQueue, %function
InitVoQueue:
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
	ldr	r1, .L2
	mov	r4, r0
	mov	r0, #12
	bl	dprint_vfmw
	mov	r2, #0
	mov	r3, #64
	strh	r2, [r4, #2]	@ movhi
	strh	r3, [r4]	@ movhi
	mov	r0, #1
	mvn	r3, #0
	strh	r2, [r4, #4]	@ movhi
	strh	r2, [r4, #6]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	str	r2, [r4, #344]
	str	r2, [r4, #316]
	str	r3, [r4, #272]
	str	r3, [r4, #292]
	str	r3, [r4, #288]
	str	r3, [r4, #284]
	str	r3, [r4, #276]
	str	r3, [r4, #280]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L3:
	.align	2
.L2:
	.word	.LC0
	UNWIND(.fnend)
	.size	InitVoQueue, .-InitVoQueue
	.align	2
	.global	PrintVoQueue
	.type	PrintVoQueue, %function
PrintVoQueue:
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
	mov	r5, r0
	ldrh	ip, [r5, #8]
	ldrh	r3, [r0, #4]
	mov	r0, #1
	ldrh	r2, [r5, #6]
	ldr	r1, .L10
	str	ip, [sp]
	bl	dprint_vfmw
	ldrh	r3, [r5, #4]
	ldrh	r2, [r5, #8]
	and	r4, r3, #63
	cmp	r2, r4
	bne	.L8
	b	.L7
.L6:
	add	r3, r5, r4, lsl #2
	ldr	r1, .L10+4
	mov	r0, #1
	ldr	r3, [r3, #12]
	ldr	r2, [r3, #180]
	bl	dprint_vfmw
	add	r3, r4, #1
	ldrh	r2, [r5, #8]
	and	r4, r3, #63
	cmp	r2, r4
	beq	.L7
.L8:
	tst	r3, #7
	bne	.L6
	ldr	r1, .L10+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L6
.L7:
	ldr	r1, .L10+8
	mov	r0, #1
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L11:
	.align	2
.L10:
	.word	.LC1
	.word	.LC3
	.word	.LC2
	UNWIND(.fnend)
	.size	PrintVoQueue, .-PrintVoQueue
	.align	2
	.global	ResetVoQueue
	.type	ResetVoQueue, %function
ResetVoQueue:
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
	ldr	r5, .L17
	mov	r4, r0
	mov	r0, #2
	ldr	r3, [r5, #12]
	blx	r3
	ldrh	r2, [r4, #6]
	ldrh	r3, [r4, #4]
	ldrh	r1, [r4, #8]
	cmp	r2, r3
	beq	.L16
.L14:
	str	r1, [sp]
	mov	r0, #1
	ldr	r1, .L17+4
	bl	dprint_vfmw
.L15:
	ldr	r2, [r4, #344]
	add	r1, r4, #336
	mov	r3, #0
	mov	r0, #64
	strh	r3, [r4, #2]	@ movhi
	add	r2, r2, #100
	strh	r0, [r4]	@ movhi
	mvn	r8, #0
	str	r2, [r4, #344]
	mvn	r9, #0
	mvn	r2, #0
	strh	r3, [r4, #4]	@ movhi
	strh	r3, [r4, #6]	@ movhi
	mov	r6, #0
	strh	r3, [r4, #8]	@ movhi
	mov	r7, #0
	str	r3, [r4, #316]
	mov	r0, #2
	str	r2, [r4, #272]
	str	r2, [r4, #292]
	str	r2, [r4, #288]
	str	r2, [r4, #284]
	str	r2, [r4, #276]
	str	r2, [r4, #280]
	ldr	ip, [r5, #16]
	strd	r8, [r1, #-8]
	str	r3, [r4, #324]
	strd	r6, [r1]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L16:
	cmp	r2, r1
	bne	.L14
	b	.L15
.L18:
	.align	2
.L17:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC4
	UNWIND(.fnend)
	.size	ResetVoQueue, .-ResetVoQueue
	.align	2
	.global	ReturnImageToSyntax
	.type	ReturnImageToSyntax, %function
ReturnImageToSyntax:
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
	mov	r3, r1
	cmp	r0, #20
	ldrls	pc, [pc, r0, asl #2]
	b	.L19
.L22:
	.word	.L21
	.word	.L23
	.word	.L24
	.word	.L25
	.word	.L19
	.word	.L26
	.word	.L27
	.word	.L19
	.word	.L28
	.word	.L29
	.word	.L30
	.word	.L30
	.word	.L30
	.word	.L31
	.word	.L19
	.word	.L32
	.word	.L33
	.word	.L34
	.word	.L19
	.word	.L19
	.word	.L35
.L35:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	USERDEC_RecycleImage
.L21:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264DEC_RecycleImage
.L23:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1DEC_RecycleImage
.L24:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG4DEC_RecycleImage
.L25:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MPEG2DEC_RecycleImage
.L26:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	DIVX3DEC_RecycleImage
.L27:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVSDEC_RecycleImage
.L28:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL8DEC_RecycleImage
.L29:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	REAL9DEC_RecycleImage
.L30:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP6DEC_RecycleImage
.L31:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP8DEC_RecycleImage
.L32:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_DEC_RecycleImage
.L33:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_DECRecycleImage
.L34:
	ldr	r1, [r2, #180]
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VP9DEC_RecycleImage
.L19:
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	ReturnImageToSyntax, .-ReturnImageToSyntax
	.align	2
	.global	ProduceTimeStamp
	.type	ProduceTimeStamp, %function
ProduceTimeStamp:
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
	add	ip, r1, #640
	cmp	r2, #20
	mov	r3, r1
	ldrd	r6, [ip]
	beq	.L37
	add	r0, r0, #272
	sub	r2, r2, #8
	ldrd	r4, [r0, #56]
	subs	r0, r6, r4
	and	r4, r4, r5
	sbc	r1, r7, r5
	cmp	r1, #0
	cmpeq	r0, #5
	movls	r1, #1
	movhi	r1, #0
	adds	r4, r4, #1
	movne	r4, #1
	tst	r1, r4
	beq	.L47
	cmp	r2, #1
	mvnhi	r6, #0
	mvnhi	r7, #0
	bls	.L39
.L37:
	mov	r0, r6
	mov	r1, r7
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L47:
	cmp	r2, #1
	bhi	.L37
	ldrb	r3, [r3, #124]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #2
	bne	.L37
.L39:
	mvn	r2, #0
	str	r2, [ip, #-8]
	mov	r6, r2
	mov	r7, r2
	str	r2, [ip, #-4]
	b	.L37
	UNWIND(.fnend)
	.size	ProduceTimeStamp, .-ProduceTimeStamp
	.align	2
	.global	InsertImgToVoQueue_PtsProcess
	.type	InsertImgToVoQueue_PtsProcess, %function
InsertImgToVoQueue_PtsProcess:
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
	ldr	lr, .L50
	mov	r4, r3
	add	r5, r4, #640
	mov	ip, r2
	mov	r2, r1
	ldr	r3, [lr, r0, asl #2]
	mov	r1, r4
	mov	r0, ip
	add	r4, r4, #656
	ldr	r3, [r3, #148]
	cmp	r3, #1
	ldreqb	r3, [r4, #-530]	@ zero_extendqisi2
	orreq	r3, r3, #8
	streqb	r3, [r4, #-530]
	ldrd	r6, [r5]
	strd	r6, [r5, #-8]
	bl	ProduceTimeStamp
	ldrd	r2, [r5, #-8]
	mov	r6, r0
	mov	r7, r1
	strd	r6, [r5]
	mov	r0, #29
	ldrd	r4, [r4, #-8]
	ldr	r1, .L50+4
	strd	r6, [sp]
	strd	r4, [sp, #8]
	bl	dprint_vfmw
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L51:
	.align	2
.L50:
	.word	s_pstVfmwChan
	.word	.LC5
	UNWIND(.fnend)
	.size	InsertImgToVoQueue_PtsProcess, .-InsertImgToVoQueue_PtsProcess
	.align	2
	.global	InsertImgToVoQueue_FillImageInfo
	.type	InsertImgToVoQueue_FillImageInfo, %function
InsertImgToVoQueue_FillImageInfo:
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
	mov	r4, r3
	ldr	r3, [r3, #136]
	mov	r8, r0
	mov	r5, r2
	cmp	r3, #0
	beq	.L53
	ldr	r3, [r4, #140]
	cmp	r3, #0
	bne	.L78
.L53:
	ldr	r2, [r4, #128]
	ldr	r3, [r4, #132]
	mov	r1, r2, lsr #1
	str	r2, [r4, #136]
	str	r3, [r4, #140]
	mov	r3, r3, lsr #1
	str	r1, [r4, #144]
	str	r3, [r4, #148]
.L54:
	str	r2, [r5, #300]
	ldr	r3, [r4, #132]
	ldr	r1, [r5, #280]
	str	r3, [r5, #304]
	ldrb	r3, [r4, #124]	@ zero_extendqisi2
	mov	r3, r3, lsr #5
	str	r3, [r5, #308]
	ldr	r3, [r4, #124]
	str	r3, [r5, #312]
	ldr	r3, [r4, #180]
	add	r3, r3, #2
	str	r3, [r5, #296]
	ldr	r3, [r4, #188]
	ldr	r2, [r4, #124]
	cmp	r3, r1
	ldrb	r7, [r4, #125]	@ zero_extendqisi2
	ldr	r6, [r4, #140]
	ubfx	r2, r2, #14, #3
	ldr	r0, [r4, #144]
	ubfx	r7, r7, #0, #2
	ldrh	ip, [r4, #136]
	uxtb	r10, r2
	ldrh	r1, [r4, #148]
	uxtb	r9, r7
	strne	r3, [r5, #320]
	orr	r6, ip, r6, asl #16
	ldr	r3, [r5, #316]
	orr	r1, r1, r0, asl #16
	str	r1, [fp, #-56]
	add	r1, r3, #1
	str	r1, [r5, #316]
	str	r3, [r4, #192]
	ldr	r3, [r5, #272]
	cmp	r3, r10
	beq	.L56
	ldr	r1, .L80
	ldr	ip, [r1]
	cmp	ip, #0
	beq	.L57
	strb	r3, [fp, #-52]
	mov	r1, #7
	strb	r2, [fp, #-51]
	mov	r3, #2
	sub	r2, fp, #52
	mov	r0, r8
	blx	ip
.L57:
	str	r10, [r5, #272]
.L56:
	ldr	r3, [r5, #276]
	cmp	r3, r9
	beq	.L58
	ldr	r3, .L80
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L59
	sub	r2, fp, #44
	mov	r3, #1
	mov	r1, #4
	mov	r0, r8
	strb	r7, [r2, #-8]!
	blx	ip
.L59:
	str	r9, [r5, #276]
.L58:
	ldr	r3, [r5, #288]
	cmp	r3, r6
	beq	.L79
.L60:
	ldr	r3, .L80
	ldr	r2, [fp, #-56]
	str	r6, [r5, #288]
	ldr	ip, [r3]
	str	r2, [r5, #292]
	cmp	ip, #0
	beq	.L61
	ldr	r7, [r4, #136]
	mov	r0, r8
	ldr	r6, [r4, #140]
	mov	r3, #8
	ldr	r5, [r4, #144]
	sub	r2, fp, #52
	ldr	lr, [r4, #148]
	mov	r1, #1
	strh	r7, [fp, #-52]	@ movhi
	strh	r6, [fp, #-50]	@ movhi
	strh	r5, [fp, #-48]	@ movhi
	strh	lr, [fp, #-46]	@ movhi
	blx	ip
.L61:
	ldr	r2, [r4, #44]
	ldr	r1, [r4, #48]
	ldr	r3, [r4, #164]
	str	r2, [r4, #28]
	str	r1, [r4, #32]
	add	r2, r3, r2
	add	r3, r1, r3
	str	r2, [r4, #36]
	str	r3, [r4, #40]
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L78:
	sub	r3, r1, #15
	cmp	r1, #0
	cmpne	r3, #1
	ldrls	r2, [r4, #128]
	bhi	.L53
	b	.L54
.L79:
	ldr	r3, [r5, #292]
	ldr	r2, [fp, #-56]
	cmp	r3, r2
	bne	.L60
	b	.L61
.L81:
	.align	2
.L80:
	.word	g_event_report
	UNWIND(.fnend)
	.size	InsertImgToVoQueue_FillImageInfo, .-InsertImgToVoQueue_FillImageInfo
	.align	2
	.global	InsertImgToVoQueue_ReportIMG
	.type	InsertImgToVoQueue_ReportIMG, %function
InsertImgToVoQueue_ReportIMG:
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
	ldr	r3, .L84
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {fp, sp, pc}
	mov	r2, r1
	mov	r3, #664
	mov	r1, #5
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	ip
.L85:
	.align	2
.L84:
	.word	g_event_report
	UNWIND(.fnend)
	.size	InsertImgToVoQueue_ReportIMG, .-InsertImgToVoQueue_ReportIMG
	.global	__aeabi_uidiv
	.align	2
	.global	InsertImgToVoQueue
	.type	InsertImgToVoQueue, %function
InsertImgToVoQueue:
	UNWIND(.fnstart)
	@ args = 4, pretend = 0, frame = 0
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
	ldr	r10, [fp, #4]
	mov	r7, r0
	mov	r8, r1
	cmp	r10, #0
	mov	r9, r2
	mov	r5, r3
	beq	.L121
	ldr	r6, .L124
	mov	r0, #2
	ldr	r1, .L124+4
	bl	dprint_vfmw
	mov	r0, #2
	ldr	r3, [r6, #12]
	blx	r3
	ldrh	r4, [r5, #4]
	ldrh	r3, [r5, #8]
	and	r4, r4, #63
	cmp	r3, r4
	bne	.L94
	b	.L93
.L92:
	add	r4, r4, #1
	ldrh	r3, [r5, #8]
	and	r4, r4, #63
	cmp	r3, r4
	beq	.L93
.L94:
	add	ip, r5, r4, lsl #2
	ldr	r3, [r10, #180]
	ldr	r2, [ip, #12]
	ldr	r2, [r2, #180]
	cmp	r2, r3
	bne	.L92
	ldr	r1, .L124+8
	mov	r0, #0
	bl	dprint_vfmw
	mov	r3, #1000
	str	r3, [r10, #184]
	b	.L92
.L93:
	ldr	r2, [r10, #184]
	cmp	r2, #100
	bhi	.L90
	ldr	r3, [r10, #128]
	cmp	r3, #31
	bhi	.L122
.L90:
	ldr	r3, [r10, #128]
	ldr	r1, [r10, #132]
.L95:
	str	r1, [sp]
	mov	r0, #0
	ldr	r1, .L124+12
	bl	dprint_vfmw
	ldr	r3, [r10, #184]
	cmp	r3, #1000
	beq	.L97
	mov	r2, r10
	mov	r1, r9
	mov	r0, r8
	bl	ReturnImageToSyntax
.L97:
	ldr	r3, [r6, #16]
	mov	r0, #2
	blx	r3
	mov	r0, #1
.L88:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L122:
	ldr	r1, [r10, #132]
	cmp	r1, #31
	bls	.L95
	str	r8, [r10, #336]
	add	r1, r10, #248
	mov	r0, r7
	ldr	r4, .L124+16
	bl	VCTRL_GetHDRConfigInfo
	mov	r1, r8
	mov	r3, r10
	mov	r2, r5
	mov	r0, r7
	ldr	r9, .L124+20
	bl	InsertImgToVoQueue_PtsProcess
	mov	r1, r8
	mov	r3, r10
	mov	r2, r5
	mov	r0, r7
	mov	r8, #300
	bl	InsertImgToVoQueue_FillImageInfo
	ldr	lr, [r10, #180]
	ldrh	ip, [r5, #8]
	mov	r0, #12
	ldrh	r3, [r5, #6]
	ldrh	r2, [r5, #4]
	ldr	r1, .L124+24
	stmia	sp, {ip, lr}
	bl	dprint_vfmw
	ldrh	r3, [r5, #8]
	mla	r8, r8, r7, r4
	mov	r2, #0
	add	r1, r5, r3, lsl #2
	add	r3, r3, #1
	and	r3, r3, #63
	mov	r0, r7
	str	r10, [r1, #12]
	mov	r1, #5
	strh	r3, [r5, #8]	@ movhi
	ldr	r3, [r10, #112]
	str	r2, [r10, #380]
	ldr	r2, [r9, r7, asl #2]
	str	r3, [r8, #20]
	bl	VDEC_Lowdelay_Event_Time
	ldr	r3, [r9, r7, asl #2]
	mov	r0, #2
	ldr	r2, [r6, #16]
	add	r3, r3, #1
	str	r3, [r9, r7, asl #2]
	blx	r2
	ldr	r3, .L124+28
	ldr	r3, [r3, r7, asl #2]
	ldr	r3, [r3, #148]
	cmp	r3, #0
	beq	.L98
	ldr	r3, [r8, #8]
	cmp	r3, #0
	movne	r2, #100
	mulne	r3, r2, r3
	strne	r3, [r10, #160]
.L98:
	ldr	r3, .L124+32
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L99
	mov	r2, r10
	mov	r3, #664
	mov	r1, #5
	mov	r0, r7
	blx	ip
.L99:
	mov	r0, #8
	bl	CHECK_REC_POS_ENABLE
	cmp	r0, #0
	bne	.L123
.L101:
	mov	r5, #300
	ldr	r2, [r6]
	mul	r5, r5, r7
	add	r6, r4, r5
	ldr	r3, [r6, #4]
	add	r3, r3, #1
	str	r3, [r6, #4]
	blx	r2
	ldr	r1, [r4, r5]
	rsb	r1, r1, r0
	mov	r8, r0
	cmp	r1, #300
	movcc	r0, #1
	bcc	.L88
	ldr	r3, [r6, #4]
	cmp	r3, #0
	beq	.L103
	movw	r0, #10000
	mul	r0, r0, r3
	bl	__aeabi_uidiv
	str	r0, [r6, #8]
.L103:
	mov	r3, #300
	mov	r2, #0
	mul	r7, r3, r7
	mov	r0, #1
	add	r3, r4, r7
	str	r8, [r4, r7]
	str	r2, [r3, #4]
	b	.L88
.L123:
	ldr	r3, [r6]
	blx	r3
	ldr	ip, .L124+36
	ldr	r2, .L124+40
	ldr	r3, [ip, r7, asl #2]
	ldr	r2, [r2]
	rsb	r3, r3, r0
	mov	lr, r0
	cmp	r3, r2
	bls	.L101
	mov	r2, r7, asl #24
	movw	r1, #535
	add	r2, r2, #524288
	ldr	r0, .L124+44
	str	lr, [ip, r7, asl #2]
	bl	DBG_AddTrace
	b	.L101
.L121:
	mov	r0, r10
	ldr	r1, .L124+48
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L88
.L125:
	.align	2
.L124:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	g_VfmwChanStat
	.word	g_LowDelaySeqIndex
	.word	.LC10
	.word	s_pstVfmwChan
	.word	g_event_report
	.word	.LANCHOR0
	.word	g_TraceFramePeriod
	.word	.LANCHOR1
	.word	.LC6
	UNWIND(.fnend)
	.size	InsertImgToVoQueue, .-InsertImgToVoQueue
	.align	2
	.global	GetQueueImgNum
	.type	GetQueueImgNum, %function
GetQueueImgNum:
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
	ldrh	r3, [r0, #6]
	ldrh	ip, [r0, #4]
	ldrh	r0, [r0, #8]
	cmp	r3, ip
	addcc	lr, r3, #64
	rsbcs	ip, ip, r3
	rsbcc	ip, ip, lr
	cmp	r3, r0
	addhi	r0, r0, #64
	str	ip, [r1]
	rsb	r3, r3, r0
	str	r3, [r2]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetQueueImgNum, .-GetQueueImgNum
	.align	2
	.global	SYNTAX_GetVoQue
	.type	SYNTAX_GetVoQue, %function
SYNTAX_GetVoQue:
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
	mov	r2, r0
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L149
.L135:
	.word	.L148
	.word	.L136
	.word	.L137
	.word	.L138
	.word	.L149
	.word	.L139
	.word	.L140
	.word	.L149
	.word	.L141
	.word	.L142
	.word	.L143
	.word	.L143
	.word	.L143
	.word	.L144
	.word	.L149
	.word	.L145
	.word	.L146
	.word	.L147
	.word	.L149
	.word	.L149
	.word	.L148
.L148:
	add	r0, r0, #16
	ldmfd	sp, {fp, sp, pc}
.L136:
	add	r0, r0, #49408
	add	r0, r0, #56
	ldmfd	sp, {fp, sp, pc}
.L137:
	add	r0, r0, #22528
	add	r0, r0, #112
	ldmfd	sp, {fp, sp, pc}
.L138:
	add	r0, r0, #90112
	add	r0, r0, #168
	ldmfd	sp, {fp, sp, pc}
.L139:
	add	r0, r0, #44032
	add	r0, r0, #40
	ldmfd	sp, {fp, sp, pc}
.L140:
	add	r0, r0, #16128
	add	r0, r0, #8
	ldmfd	sp, {fp, sp, pc}
.L141:
	add	r0, r0, #56320
	add	r0, r0, #80
	ldmfd	sp, {fp, sp, pc}
.L142:
	add	r0, r0, #56320
	add	r0, r0, #64
	ldmfd	sp, {fp, sp, pc}
.L143:
	add	r0, r0, #12672
	add	r0, r0, #8
	ldmfd	sp, {fp, sp, pc}
.L144:
	add	r0, r0, #8192
	ldmfd	sp, {fp, sp, pc}
.L145:
	add	r0, r0, #592
	ldmfd	sp, {fp, sp, pc}
.L146:
	add	r0, r0, #62464
	add	r0, r0, #224
	ldmfd	sp, {fp, sp, pc}
.L147:
	movw	r0, #13672
	movt	r0, 4
	add	r0, r2, r0
	ldmfd	sp, {fp, sp, pc}
.L149:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SYNTAX_GetVoQue, .-SYNTAX_GetVoQue
	.align	2
	.global	SYNTAX_ReceiveImage
	.type	SYNTAX_ReceiveImage, %function
SYNTAX_ReceiveImage:
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
	cmp	r0, #0
	cmpne	r1, #0
	mov	r6, r1
	beq	.L154
	bl	SYNTAX_GetVoQue
	subs	r4, r0, #0
	beq	.L156
	ldr	r7, .L157
	mov	r0, #2
	ldr	r3, [r7, #12]
	blx	r3
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #8]
	cmp	r2, r3
	mvneq	r5, #2
	beq	.L153
	add	r10, r6, #336
	add	r3, r4, r3, lsl #2
	ldr	ip, [r7, #52]
	mov	r2, #664
	ldrd	r8, [r10, #-8]
	mov	r0, r6
	ldr	r1, [r3, #12]
	mov	r5, #1
	blx	ip
	ldr	r1, .L157+4
	strd	r8, [r10, #-8]
	mov	r0, #12
	ldr	ip, [r6, #180]
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #4]
	str	ip, [sp, #4]
	ldrh	ip, [r4, #8]
	str	ip, [sp]
	bl	dprint_vfmw
	ldr	r3, [r6, #180]
	ldr	r2, [r4, #344]
	add	r3, r3, r2
	str	r3, [r6, #180]
	ldrh	r3, [r4, #6]
	add	r3, r3, r5
	and	r3, r3, #63
	strh	r3, [r4, #6]	@ movhi
.L153:
	ldr	r3, [r7, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r5
.L151:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L154:
	mvn	r0, #1
	b	.L151
.L156:
	ldr	r2, .L157+8
	mov	r0, #1
	ldr	r1, .L157+12
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L151
.L158:
	.align	2
.L157:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC12
	.word	.LANCHOR1+20
	.word	.LC11
	UNWIND(.fnend)
	.size	SYNTAX_ReceiveImage, .-SYNTAX_ReceiveImage
	.align	2
	.global	SYNTAX_ReleaseImage_RecycleImage_CheckRet
	.type	SYNTAX_ReleaseImage_RecycleImage_CheckRet, %function
SYNTAX_ReleaseImage_RecycleImage_CheckRet:
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
	cmp	r3, #17
	ldrls	pc, [pc, r3, asl #2]
	b	.L160
.L162:
	.word	.L165
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L160
	.word	.L165
	.word	.L165
	.word	.L165
.L165:
	cmp	r1, #0
	mvnne	r0, #19
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L160:
	cmn	r1, #2
	beq	.L171
	cmp	r1, #1
	mvnne	r0, #19
	moveq	r0, #1
	ldmfd	sp, {fp, sp, pc}
.L171:
	mov	r0, r1
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	SYNTAX_ReleaseImage_RecycleImage_CheckRet, .-SYNTAX_ReleaseImage_RecycleImage_CheckRet
	.align	2
	.global	SYNTAX_ReleaseImage_RecycleImage
	.type	SYNTAX_ReleaseImage_RecycleImage, %function
SYNTAX_ReleaseImage_RecycleImage:
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
	ldr	r3, [r0]
	mov	r4, r0
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L190
.L176:
	.word	.L175
	.word	.L177
	.word	.L178
	.word	.L179
	.word	.L190
	.word	.L180
	.word	.L181
	.word	.L190
	.word	.L182
	.word	.L183
	.word	.L184
	.word	.L184
	.word	.L184
	.word	.L185
	.word	.L190
	.word	.L186
	.word	.L187
	.word	.L188
	.word	.L190
	.word	.L190
	.word	.L189
.L189:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	USERDEC_RecycleImage
	mov	r1, r0
.L174:
	mov	r0, r4
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	SYNTAX_ReleaseImage_RecycleImage_CheckRet
.L175:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	H264DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L177:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	VC1DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L178:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	MPEG4DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L179:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	MPEG2DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L180:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	DIVX3DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L181:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	AVSDEC_RecycleImage
	mov	r1, r0
	b	.L174
.L182:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	REAL8DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L183:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	REAL9DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L184:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	VP6DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L185:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	VP8DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L186:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	MVC_DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L187:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	HEVC_DECRecycleImage
	mov	r1, r0
	b	.L174
.L188:
	ldr	r1, [r1, #180]
	add	r0, r0, #8
	bl	VP9DEC_RecycleImage
	mov	r1, r0
	b	.L174
.L190:
	mvn	r1, #1
	b	.L174
	UNWIND(.fnend)
	.size	SYNTAX_ReleaseImage_RecycleImage, .-SYNTAX_ReleaseImage_RecycleImage
	.align	2
	.global	SYNTAX_ReleaseImage
	.type	SYNTAX_ReleaseImage, %function
SYNTAX_ReleaseImage:
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
	cmp	r0, #0
	cmpne	r1, #0
	mov	r8, r1
	mov	r7, r0
	beq	.L207
	bl	SYNTAX_GetVoQue
	subs	r5, r0, #0
	beq	.L208
	ldr	r6, .L209
	mov	r0, #2
	ldr	r3, [r6, #12]
	blx	r3
	ldrh	r4, [r5, #4]
	ldrh	r3, [r5, #6]
	and	r4, r4, #63
	ldr	r9, [r8, #180]
	cmp	r3, r4
	ldr	r3, [r5, #344]
	rsb	r9, r3, r9
	bne	.L203
	b	.L202
.L199:
	add	r4, r4, #1
	ldrh	r3, [r5, #6]
	and	r4, r4, #63
	cmp	r3, r4
	beq	.L202
.L203:
	add	r10, r4, #2
	add	r3, r5, r10, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L197
	ldr	r0, [r3, #180]
	rsb	r0, r0, r9
	clz	r0, r0
	mov	r0, r0, lsr #5
	cmp	r0, #0
	beq	.L199
.L198:
	ldrh	r1, [r5, #4]
	b	.L201
.L205:
	mov	r4, ip
.L201:
	cmp	r4, #0
	mov	ip, #63
	subne	ip, r4, #1
	add	r2, r5, r10, lsl #2
	add	r3, ip, #2
	cmp	r4, r1
	add	lr, r5, r3, lsl #2
	mov	r10, r3
	ldr	r3, [lr, #4]
	str	r3, [r2, #4]
	bne	.L205
	ldr	r3, [r8, #180]
	cmp	r0, #1
	ldr	r2, [r5, #344]
	rsb	r3, r2, r3
	str	r3, [r8, #180]
	ldrh	r2, [r5, #4]
	add	r2, r2, #1
	and	r2, r2, #63
	strh	r2, [r5, #4]	@ movhi
	bne	.L199
	ldr	ip, [r8, #180]
	mov	r0, #12
	ldrh	r3, [r5, #6]
	ldr	r1, .L209+4
	str	ip, [sp, #4]
	ldrh	ip, [r5, #8]
	str	ip, [sp]
	bl	dprint_vfmw
	mov	r1, r8
	mov	r0, r7
	bl	SYNTAX_ReleaseImage_RecycleImage
	mov	r4, r0
	b	.L196
.L197:
	mov	r2, r4
	ldr	r1, .L209+8
	mov	r0, #1
	bl	dprint_vfmw
	mov	r0, #2
	b	.L198
.L202:
	mov	r2, r9
	ldr	r1, .L209+12
	mov	r0, #1
	mvn	r4, #1
	bl	dprint_vfmw
.L196:
	ldr	r3, [r6, #16]
	mov	r0, #2
	blx	r3
	mov	r0, r4
.L193:
	sub	sp, fp, #40
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
.L207:
	ldr	r1, .L209+16
	mov	r0, #0
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L193
.L208:
	ldr	r2, .L209+20
	mov	r0, #1
	ldr	r1, .L209+24
	bl	dprint_vfmw
	mvn	r0, #1
	b	.L193
.L210:
	.align	2
.L209:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC16
	.word	.LC15
	.word	.LC14
	.word	.LC13
	.word	.LANCHOR1+40
	.word	.LC11
	UNWIND(.fnend)
	.size	SYNTAX_ReleaseImage, .-SYNTAX_ReleaseImage
	.align	2
	.global	SYNTAX_ReturnImage
	.type	SYNTAX_ReturnImage, %function
SYNTAX_ReturnImage:
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
	ldr	r3, [r0]
	cmp	r3, #20
	ldrls	pc, [pc, r3, asl #2]
	b	.L229
.L214:
	.word	.L227
	.word	.L215
	.word	.L216
	.word	.L217
	.word	.L229
	.word	.L218
	.word	.L219
	.word	.L229
	.word	.L220
	.word	.L221
	.word	.L222
	.word	.L222
	.word	.L222
	.word	.L223
	.word	.L229
	.word	.L224
	.word	.L225
	.word	.L226
	.word	.L229
	.word	.L229
	.word	.L227
.L227:
	add	r4, r0, #16
.L228:
	ldr	r5, .L230
	mov	r0, #2
	ldr	r3, [r5, #12]
	blx	r3
	ldrh	r3, [r4, #6]
	mov	r0, #2
	sub	r3, r3, #1
	and	r3, r3, #63
	strh	r3, [r4, #6]	@ movhi
	ldr	r3, [r5, #16]
	blx	r3
	mov	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L215:
	add	r4, r0, #49408
	add	r4, r4, #56
	b	.L228
.L216:
	add	r4, r0, #22528
	add	r4, r4, #112
	b	.L228
.L217:
	add	r4, r0, #90112
	add	r4, r4, #168
	b	.L228
.L218:
	add	r4, r0, #44032
	add	r4, r4, #40
	b	.L228
.L219:
	add	r4, r0, #16128
	add	r4, r4, #8
	b	.L228
.L220:
	add	r4, r0, #56320
	add	r4, r4, #80
	b	.L228
.L221:
	add	r4, r0, #56320
	add	r4, r4, #64
	b	.L228
.L222:
	add	r4, r0, #12672
	add	r4, r4, #8
	b	.L228
.L223:
	add	r4, r0, #8192
	b	.L228
.L224:
	add	r4, r0, #592
	b	.L228
.L225:
	add	r4, r0, #62464
	add	r4, r4, #224
	b	.L228
.L226:
	movw	r4, #13672
	movt	r4, 4
	add	r4, r0, r4
	b	.L228
.L229:
	mvn	r0, #1
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L231:
	.align	2
.L230:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	SYNTAX_ReturnImage, .-SYNTAX_ReturnImage
	.align	2
	.global	DecodeStream_H264
	.type	DecodeStream_H264, %function
DecodeStream_H264:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	mov	r4, r0
	ldrd	r2, [r0, #32]
	mov	r5, r1
	ldr	r9, [r4, #8]
	mov	r0, r1
	ldr	r8, [r4, #16]
	sub	r1, fp, #68
	ldr	r7, [r4, #20]
	ldrb	r6, [r4, #13]	@ zero_extendqisi2
	ldr	lr, [r4, #24]
	ldrb	ip, [r4, #15]	@ zero_extendqisi2
	strd	r2, [fp, #-44]
	str	r9, [fp, #-64]
	str	r8, [fp, #-60]
	str	r7, [fp, #-56]
	strb	r6, [fp, #-68]
	str	lr, [fp, #-52]
	strb	ip, [fp, #-67]
	bl	H264DEC_DecodePacket
	add	r2, r5, #61440
	ldr	r1, .L238
	cmn	r0, #2
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r4, #1]
	ldr	r0, [r2, #3520]
	ldr	r1, [r1, r0, asl #2]
	strb	r3, [r1, #1452]
	ldr	r4, [r5, #360]
	cmp	r4, #0
	beq	.L237
.L232:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L237:
	add	r5, r5, #12288
	ldrb	r3, [r5, #1272]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L232
	ldr	r0, [r2, #3520]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #1272]
	b	.L232
.L239:
	.align	2
.L238:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_H264, .-DecodeStream_H264
	.align	2
	.global	DecodeStream_HEVC
	.type	DecodeStream_HEVC, %function
DecodeStream_HEVC:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, r9, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #32)
	sub	sp, sp, #32
	mov	r4, r0
	ldrd	r2, [r0, #32]
	mov	r5, r1
	ldr	r9, [r4, #8]
	mov	r0, r1
	ldr	r8, [r4, #16]
	sub	r1, fp, #68
	ldr	r7, [r4, #20]
	ldrb	r6, [r4, #13]	@ zero_extendqisi2
	ldr	lr, [r4, #24]
	ldrb	ip, [r4, #15]	@ zero_extendqisi2
	strd	r2, [fp, #-44]
	str	r9, [fp, #-64]
	str	r8, [fp, #-60]
	str	r7, [fp, #-56]
	strb	r6, [fp, #-68]
	str	lr, [fp, #-52]
	strb	ip, [fp, #-67]
	bl	HEVCDEC_DecodePacket
	cmn	r0, #2
	beq	.L241
	ldrb	r3, [r5, #5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L242
.L241:
	mov	r3, #1
	ldr	r2, .L249
	strb	r3, [r4, #1]
	ldr	r1, [r5, #244]
	ldr	r2, [r2, r1, asl #2]
	strb	r3, [r2, #1452]
	ldr	r4, [r5, #2328]
	cmp	r4, #0
	beq	.L248
.L240:
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L242:
	strb	r3, [r4, #1]
	ldr	r2, .L249
	ldr	r1, [r5, #244]
	ldr	r2, [r2, r1, asl #2]
	strb	r3, [r2, #1452]
	ldr	r4, [r5, #2328]
	cmp	r4, #0
	bne	.L240
.L248:
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L240
	ldr	r0, [r5, #244]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #7]
	b	.L240
.L250:
	.align	2
.L249:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_HEVC, .-DecodeStream_HEVC
	.align	2
	.global	DecodeStream_VP9
	.type	DecodeStream_VP9, %function
DecodeStream_VP9:
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
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #1
	beq	.L266
	ldr	r8, .L268
	add	r7, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r7
	add	r6, r5, #294912
	ldr	r3, [r8, #52]
	blx	r3
	ldr	r3, [r8, #48]
	mov	r2, #80
	mov	r1, #0
	add	r0, r4, #168
	blx	r3
	mov	r1, r7
	mov	r0, r5
	bl	VP9DEC_DecodePacket
	ldr	r3, [r6, #3400]
	cmp	r3, #0
	bne	.L267
.L253:
	ldr	r3, [r6, #3396]
	cmp	r3, #0
	bne	.L254
.L265:
	strb	r3, [r4, #1]
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #262144
	ldrb	r5, [r5, #1036]	@ zero_extendqisi2
	cmp	r5, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r3, [r8, #48]
	mov	r2, #160
	mov	r1, r5
	mov	r0, r7
	blx	r3
	ldr	r1, [r4, #24]
	ldr	r0, [r6, #3492]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L268+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r6, #3492]
	mov	r3, r5
	mov	r2, r5
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L267:
	ldr	r2, [r6, #3440]
	ldr	r3, [r6, #3436]
	cmp	r2, r3
	beq	.L253
.L254:
	mov	r3, #1
	b	.L265
.L266:
	add	r5, r1, #294912
	ldr	r0, [r5, #3492]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #3492]
	ldr	r1, [r4, #24]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L269:
	.align	2
.L268:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	UNWIND(.fnend)
	.size	DecodeStream_VP9, .-DecodeStream_VP9
	.align	2
	.global	DecodeStream_MVC
	.type	DecodeStream_MVC, %function
DecodeStream_MVC:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {r4, r5, r6, r7, r8, fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #36)
	sub	sp, sp, #36
	mov	r4, r0
	ldrd	r2, [r0, #32]
	mov	r5, r1
	ldr	r8, [r4, #8]
	mov	r0, r1
	ldr	r7, [r4, #16]
	sub	r1, fp, #68
	ldr	r6, [r4, #20]
	ldrb	lr, [r4, #13]	@ zero_extendqisi2
	ldr	ip, [r4, #24]
	strd	r2, [fp, #-44]
	str	r8, [fp, #-64]
	str	r7, [fp, #-60]
	str	r6, [fp, #-56]
	strb	lr, [fp, #-68]
	str	ip, [fp, #-52]
	bl	MVC_DEC_DecodePacket
	cmn	r0, #2
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r4, #1]
	ldr	r4, [r5, #228]
	cmp	r4, #0
	beq	.L274
.L270:
	sub	sp, fp, #32
	ldmfd	sp, {r4, r5, r6, r7, r8, fp, sp, pc}
.L274:
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L270
	ldr	r0, [r5, #120]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #1]
	b	.L270
	UNWIND(.fnend)
	.size	DecodeStream_MVC, .-DecodeStream_MVC
	.align	2
	.global	DecodeStream_VC1_Smp
	.type	DecodeStream_VC1_Smp, %function
DecodeStream_VC1_Smp:
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
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #1
	beq	.L288
	ldr	r6, .L291
	add	r7, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r7
	ldr	r3, [r6, #52]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #80
	mov	r1, #0
	add	r0, r4, #168
	blx	r3
	ldr	r3, [r4, #100]
	cmp	r3, #15
	ble	.L289
	add	r2, r5, #15808
	mov	r1, #16
	ldr	r0, [r4, #88]
	add	r2, r2, r1
	bl	Vc1SMPSeqHdr
	subs	r8, r0, #0
	beq	.L290
	ldr	r1, .L291+4
	add	r5, r5, #49152
.L287:
	mov	r0, #0
	bl	dprint_vfmw
	ldr	r1, [r4, #104]
	ldr	r0, [r5, #656]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L291+8
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	mov	r3, #0
	ldr	r0, [r5, #656]
	mov	r2, r3
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L289:
	add	r5, r5, #49152
	ldr	r1, .L291+12
	b	.L287
.L288:
	add	r5, r1, #49152
	ldr	r0, [r5, #656]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #656]
	ldr	r1, [r4, #24]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L290:
	ldr	ip, [r4, #100]
	mov	r1, r7
	ldr	r2, [r4, #88]
	mov	r0, r5
	ldr	r3, [r4, #96]
	sub	ip, ip, #16
	add	r2, r2, #16
	str	ip, [r4, #100]
	str	r2, [r4, #88]
	add	r3, r3, #16
	str	r3, [r4, #96]
	bl	VC1DEC_Decode
	ldr	r3, [r6, #48]
	mov	r1, r8
	mov	r0, r7
	mov	r2, #160
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	r3
.L292:
	.align	2
.L291:
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC18
	.word	g_event_report
	.word	.LC17
	UNWIND(.fnend)
	.size	DecodeStream_VC1_Smp, .-DecodeStream_VC1_Smp
	.align	2
	.global	DecodeStream_REAL8
	.type	DecodeStream_REAL8, %function
DecodeStream_REAL8:
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
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #1
	beq	.L303
	ldr	r7, .L304
	add	r6, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r6
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #80
	mov	r1, #0
	add	r0, r4, #168
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	REAL8DEC_Decode
	cmn	r0, #2
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r4, #1]
	ldr	r8, [r5, #4]
	cmp	r8, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #53248
	ldr	r3, [r7, #48]
	mov	r2, #160
	mov	r1, r8
	mov	r0, r6
	blx	r3
	ldr	r1, [r4, #24]
	ldr	r0, [r5, #3496]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L304+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #3496]
	mov	r3, r8
	mov	r2, r8
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L303:
	add	r5, r1, #53248
	ldr	r0, [r5, #3496]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #3496]
	ldr	r1, [r4, #24]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L305:
	.align	2
.L304:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	UNWIND(.fnend)
	.size	DecodeStream_REAL8, .-DecodeStream_REAL8
	.align	2
	.global	DecodeStream_REAL9
	.type	DecodeStream_REAL9, %function
DecodeStream_REAL9:
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
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #1
	beq	.L316
	ldr	r7, .L317
	add	r6, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r6
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #80
	mov	r1, #0
	add	r0, r4, #168
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	REAL9DEC_Decode
	cmn	r0, #2
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r4, #1]
	ldr	r8, [r5, #4]
	cmp	r8, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #53248
	ldr	r3, [r7, #48]
	mov	r2, #160
	mov	r1, r8
	mov	r0, r6
	blx	r3
	ldr	r1, [r4, #24]
	ldr	r0, [r5, #3480]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L317+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #3480]
	mov	r3, r8
	mov	r2, r8
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L316:
	add	r5, r1, #53248
	ldr	r0, [r5, #3480]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #3480]
	ldr	r1, [r4, #24]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L318:
	.align	2
.L317:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	UNWIND(.fnend)
	.size	DecodeStream_REAL9, .-DecodeStream_REAL9
	.align	2
	.global	DecodeStream_DIVX3
	.type	DecodeStream_DIVX3, %function
DecodeStream_DIVX3:
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
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #1
	beq	.L329
	ldr	r7, .L330
	add	r6, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r6
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #80
	mov	r1, #0
	add	r0, r4, #168
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	DIVX3DEC_Decode
	cmn	r0, #2
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r4, #1]
	ldr	r8, [r5, #4]
	cmp	r8, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #40960
	ldr	r3, [r7, #48]
	mov	r2, #160
	mov	r1, r8
	mov	r0, r6
	blx	r3
	ldr	r1, [r4, #24]
	ldr	r0, [r5, #3456]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L330+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #3456]
	mov	r3, r8
	mov	r2, r8
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L329:
	add	r5, r1, #40960
	ldr	r0, [r5, #3456]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #3456]
	ldr	r1, [r4, #24]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L331:
	.align	2
.L330:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	UNWIND(.fnend)
	.size	DecodeStream_DIVX3, .-DecodeStream_DIVX3
	.align	2
	.global	DecodeStream_VP8
	.type	DecodeStream_VP8, %function
DecodeStream_VP8:
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
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #1
	beq	.L342
	ldr	r7, .L343
	add	r6, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r6
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #80
	mov	r1, #0
	add	r0, r4, #168
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	VP8DEC_Decode
	cmn	r0, #2
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r4, #1]
	ldr	r8, [r5, #4]
	cmp	r8, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #8192
	ldr	r3, [r7, #48]
	mov	r2, #160
	mov	r1, r8
	mov	r0, r6
	blx	r3
	ldr	r1, [r4, #24]
	ldr	r0, [r5, #344]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L343+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #344]
	mov	r3, r8
	mov	r2, r8
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L342:
	add	r5, r1, #8192
	ldr	r0, [r5, #344]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #344]
	ldr	r1, [r4, #24]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L344:
	.align	2
.L343:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	UNWIND(.fnend)
	.size	DecodeStream_VP8, .-DecodeStream_VP8
	.align	2
	.global	DecodeStream_VP6
	.type	DecodeStream_VP6, %function
DecodeStream_VP6:
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
	ldrb	r3, [r0, #14]	@ zero_extendqisi2
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #1
	beq	.L355
	ldr	r7, .L356
	add	r6, r0, #88
	add	r1, r0, #8
	mov	r2, #80
	mov	r0, r6
	ldr	r3, [r7, #52]
	blx	r3
	ldr	r3, [r7, #48]
	mov	r2, #80
	mov	r1, #0
	add	r0, r4, #168
	blx	r3
	mov	r1, r6
	mov	r0, r5
	bl	VP6DEC_Decode
	cmn	r0, #2
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r4, #1]
	ldr	r8, [r5, #4]
	cmp	r8, #0
	ldmnefd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	add	r5, r5, #12288
	ldr	r3, [r7, #48]
	mov	r2, #160
	mov	r1, r8
	mov	r0, r6
	blx	r3
	ldr	r1, [r4, #24]
	ldr	r0, [r5, #736]
	bl	SM_ReleaseStreamSeg
	ldr	r3, .L356+4
	ldr	ip, [r3]
	cmp	ip, #0
	ldmeqfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
	ldr	r0, [r5, #736]
	mov	r3, r8
	mov	r2, r8
	mov	r1, #113
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	bx	ip
.L355:
	add	r5, r1, #12288
	ldr	r0, [r5, #736]
	bl	VCTRL_OutputLastFrame
	ldr	r0, [r5, #736]
	ldr	r1, [r4, #24]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, lr}
	b	SM_ReleaseStreamSeg
.L357:
	.align	2
.L356:
	.word	vfmw_Osal_Func_Ptr_S
	.word	g_event_report
	UNWIND(.fnend)
	.size	DecodeStream_VP6, .-DecodeStream_VP6
	.align	2
	.global	SegMan
	.type	SegMan, %function
SegMan:
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
	subs	r4, r1, #0
	mov	r6, r0
	beq	.L359
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L359
	ldr	r3, .L383
	ldr	r3, [r3, r0, asl #2]
	ldr	r2, [r3, #1384]
	cmp	r2, #1
	beq	.L379
.L362:
	ldrb	r5, [r4, #13]	@ zero_extendqisi2
	mov	r7, #0
	strb	r7, [r4, #408]
	cmp	r5, #1
	beq	.L380
	cmp	r5, #0
	beq	.L381
.L367:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L381:
	ldr	r9, .L383+4
	add	r8, r4, #88
	add	r7, r4, #168
	mov	r2, #80
	add	r1, r4, #8
	mov	r0, r8
	ldr	r3, [r9, #52]
	blx	r3
	ldr	r3, [r9, #48]
	mov	r0, r7
	mov	r2, #80
	mov	r1, r5
	blx	r3
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r3, r3
	strb	r3, [r4, #2]
	cmp	r3, #1
	bls	.L367
	ldr	r1, [r4, #104]
	mov	r0, r6
	bl	SM_ReleaseStreamSeg
	ldr	r1, [r4, #184]
	mov	r0, r6
	bl	SM_ReleaseStreamSeg
	ldr	r3, [r9, #48]
	mov	r2, #80
	mov	r1, r5
	mov	r0, r8
	blx	r3
	ldr	r3, [r9, #48]
	mov	r2, #80
	mov	r1, r5
	mov	r0, r7
	blx	r3
	ldr	r1, .L383+8
	mov	r0, #1
	bl	dprint_vfmw
	ldr	r3, .L383+12
	ldr	ip, [r3]
	cmp	ip, #0
	beq	.L366
	mov	r0, r6
	mov	r3, r5
	mov	r2, r5
	mov	r1, #113
	blx	ip
.L366:
	mov	r3, #0
	mvn	r0, #0
	strb	r3, [r4, #2]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L379:
	ldr	r3, [r3, #1424]
	cmp	r3, #1
	bne	.L362
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L362
	mov	r2, #160
	add	r1, r4, #248
	add	r0, r4, #88
	bl	memcpy
	mov	r3, #0
	mov	r0, r3
	strb	r3, [r4, #408]
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L380:
	ldrb	r5, [r4, #2]	@ zero_extendqisi2
	cmp	r5, r7
	beq	.L382
	cmp	r5, #1
	bne	.L367
	ldr	r3, [r4, #100]
	cmp	r3, #1024
	bge	.L368
	ldr	r1, .L383+16
	mov	r0, #22
	ldr	r8, .L383+4
	bl	dprint_vfmw
	ldr	r2, [r4, #100]
	ldr	r0, [r4, #8]
	ldr	r3, [r8, #52]
	rsb	r0, r2, r0
	ldr	r1, [r4, #88]
	blx	r3
	ldr	r3, [r4, #100]
	ldr	ip, [r4, #20]
	mov	r0, r6
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #16]
	rsb	r1, r3, r1
	strb	r5, [r4, #93]
	rsb	r2, r3, r2
	str	r1, [r4, #88]
	add	r3, r3, ip
	str	r2, [r4, #96]
	str	r3, [r4, #100]
	ldr	r1, [r4, #104]
	bl	SM_ReleaseStreamSeg
	ldr	ip, [r4, #24]
	ldr	r3, [r8, #48]
	mov	r1, r7
	mov	r2, #80
	add	r0, r4, #168
	str	ip, [r4, #104]
	blx	r3
.L369:
	mov	r5, #0
	mov	r3, #1
	strb	r5, [r4, #2]
	mov	r2, #160
	strb	r3, [r4, #408]
	add	r1, r4, #88
	add	r0, r4, #248
	bl	memcpy
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L382:
	ldr	r6, .L383+4
	add	r1, r4, #8
	mov	r2, #80
	add	r0, r4, #88
	ldr	r3, [r6, #52]
	blx	r3
	ldr	r3, [r6, #48]
	mov	r2, #80
	mov	r1, r5
	add	r0, r4, #168
	blx	r3
	strb	r5, [r4, #2]
	mov	r0, r5
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L368:
	ldr	r1, .L383+20
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r3, .L383+4
	mov	r2, #80
	add	r1, r4, #8
	add	r0, r4, #168
	ldr	r3, [r3, #52]
	blx	r3
	b	.L369
.L359:
	ldr	r1, .L383+24
	mov	r0, #1
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L384:
	.align	2
.L383:
	.word	s_pstVfmwChan
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC20
	.word	g_event_report
	.word	.LC21
	.word	.LC22
	.word	.LC19
	UNWIND(.fnend)
	.size	SegMan, .-SegMan
	.align	2
	.global	DecodeStream_VC1_Adv
	.type	DecodeStream_VC1_Adv, %function
DecodeStream_VC1_Adv:
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
	add	r6, r1, #49152
	mov	r5, r0
	mov	r0, r1
	mov	r4, r1
	ldr	r7, [r6, #656]
	bl	VC1_GetPacketState
	cmp	r0, #2
	beq	.L390
.L386:
	mov	r1, r5
	ldr	r0, [r6, #656]
	bl	SegMan
	subs	r7, r0, #0
	beq	.L391
.L388:
	ldr	r5, [r4, #4]
	cmp	r5, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	add	r4, r4, #12288
	ldrb	r3, [r4, #447]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r6, #656]
	bl	VCTRL_OutputLastFrame
	strb	r5, [r4, #447]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L391:
	add	r5, r5, #88
	mov	r0, r4
	mov	r1, r5
	bl	VC1DEC_Decode
	ldr	r3, .L393
	mov	r0, r5
	mov	r1, r7
	mov	r2, #160
	ldr	r3, [r3, #48]
	blx	r3
	b	.L388
.L390:
	ldr	r3, .L393+4
	ldr	r3, [r3, r7, asl #2]
	ldr	r2, [r3, #1384]
	cmp	r2, #1
	beq	.L392
.L387:
	add	r1, r4, #12544
	mov	r0, r4
	add	r1, r1, #24
	bl	VC1DEC_Decode
	b	.L386
.L392:
	ldr	r3, [r3, #1424]
	cmp	r3, #0
	bne	.L386
	b	.L387
.L394:
	.align	2
.L393:
	.word	vfmw_Osal_Func_Ptr_S
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_VC1_Adv, .-DecodeStream_VC1_Adv
	.align	2
	.global	DecodeStream_VC1
	.type	DecodeStream_VC1, %function
DecodeStream_VC1:
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
	ldrb	r2, [r0, #13]	@ zero_extendqisi2
	mov	r5, r1
	mov	r0, #22
	ldr	r1, .L402
	bl	dprint_vfmw
	ldr	r2, [r4, #16]
	ldr	r1, .L402+4
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r2, [r4, #20]
	ldr	r1, .L402+8
	mov	r0, #22
	bl	dprint_vfmw
	ldr	r2, [r5]
	ldr	r3, [r2, #556]
	cmp	r3, #1
	ldrhi	r1, .L402+12
	bhi	.L399
	ldr	r1, [r2, #560]
	cmp	r1, #8
	bgt	.L400
	add	r1, r5, #12288
	uxtb	r3, r3
	cmp	r3, #1
	mov	r0, r4
	strb	r3, [r1, #3536]
	ldr	r3, [r2, #560]
	strb	r3, [r1, #3538]
	mov	r1, r5
	beq	.L401
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	DecodeStream_VC1_Smp
.L400:
	ldr	r1, .L402+16
.L399:
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L401:
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	DecodeStream_VC1_Adv
.L403:
	.align	2
.L402:
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	UNWIND(.fnend)
	.size	DecodeStream_VC1, .-DecodeStream_VC1
	.align	2
	.global	DecodeStream_MPEG2
	.type	DecodeStream_MPEG2, %function
DecodeStream_MPEG2:
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
	add	r5, r1, #90112
	mov	r6, r0
	mov	r0, r1
	mov	r4, r1
	ldr	r7, [r5, #512]
	bl	MP2_GetPacketState
	cmp	r0, #2
	beq	.L410
.L405:
	mov	r1, r6
	ldr	r0, [r5, #512]
	bl	SegMan
	cmp	r0, #0
	beq	.L411
.L407:
	ldr	r4, [r4, #4]
	cmp	r4, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r5, #530]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r5, #512]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #530]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L411:
	add	r1, r6, #88
	mov	r0, r4
	bl	MPEG2DEC_Decode
	ldrb	r3, [r5, #529]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	strb	r3, [r6, #1]
	b	.L407
.L410:
	ldr	r3, .L413
	ldr	r3, [r3, r7, asl #2]
	ldr	r2, [r3, #1384]
	cmp	r2, #1
	beq	.L412
.L406:
	add	r1, r4, #89088
	mov	r0, r4
	add	r1, r1, #640
	bl	MPEG2DEC_Decode
	b	.L405
.L412:
	ldr	r3, [r3, #1424]
	cmp	r3, #0
	bne	.L405
	b	.L406
.L414:
	.align	2
.L413:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_MPEG2, .-DecodeStream_MPEG2
	.align	2
	.global	DecodeStream_MPEG4
	.type	DecodeStream_MPEG4, %function
DecodeStream_MPEG4:
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
	add	r5, r1, #20480
	mov	r6, r0
	mov	r0, r1
	mov	r4, r1
	ldr	r7, [r5, #2504]
	bl	MP4_GetPacketState
	cmp	r0, #3
	beq	.L420
.L416:
	mov	r1, r6
	ldr	r0, [r5, #2504]
	bl	SegMan
	cmp	r0, #0
	beq	.L421
.L418:
	ldr	r4, [r4, #1036]
	cmp	r4, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r5, #2540]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r5, #2504]
	bl	VCTRL_OutputLastFrame
	strb	r4, [r5, #2540]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L421:
	add	r1, r6, #88
	mov	r0, r4
	bl	MPEG4DEC_Decode
	b	.L418
.L420:
	ldr	r3, .L423
	ldr	r3, [r3, r7, asl #2]
	ldr	r2, [r3, #1384]
	cmp	r2, #1
	beq	.L422
.L417:
	add	r1, r4, #15680
	mov	r0, r4
	add	r1, r1, #48
	bl	MPEG4DEC_Decode
	b	.L416
.L422:
	ldr	r3, [r3, #1424]
	cmp	r3, #0
	bne	.L416
	b	.L417
.L424:
	.align	2
.L423:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_MPEG4, .-DecodeStream_MPEG4
	.align	2
	.global	DecodeStream_AVS
	.type	DecodeStream_AVS, %function
DecodeStream_AVS:
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
	mov	r0, r1
	mov	r4, r1
	ldr	r6, [r1, #4]
	bl	AVS_GetPacketState
	cmp	r0, #0
	bne	.L426
	ldr	r3, .L432
	ldr	r3, [r3, r6, asl #2]
	ldr	r2, [r3, #1384]
	cmp	r2, #1
	beq	.L430
	add	r1, r4, #16384
	mov	r0, r4
	add	r1, r1, #104
	bl	AVSDEC_Decode
.L426:
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	SegMan
	cmp	r0, #0
	beq	.L431
.L428:
	ldr	r5, [r4, #16]
	cmp	r5, #0
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #1
	ldmnefd	sp, {r4, r5, r6, r7, fp, sp, pc}
	ldr	r0, [r4, #4]
	bl	VCTRL_OutputLastFrame
	strb	r5, [r4]
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L430:
	ldr	r3, [r3, #1424]
	cmp	r3, #0
	bne	.L426
	add	r1, r4, #16384
	mov	r0, r4
	add	r1, r1, #104
	bl	AVSDEC_Decode
	b	.L426
.L431:
	add	r1, r5, #88
	mov	r0, r4
	bl	AVSDEC_Decode
	b	.L428
.L433:
	.align	2
.L432:
	.word	s_pstVfmwChan
	UNWIND(.fnend)
	.size	DecodeStream_AVS, .-DecodeStream_AVS
	.align	2
	.global	DecodeStream
	.type	DecodeStream, %function
DecodeStream:
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
	mov	r0, #6
	mov	r4, r1
	mov	r6, r2
	bl	VCTRL_RecordPosTime
	cmp	r4, #17
	ldrls	pc, [pc, r4, asl #2]
	b	.L435
.L437:
	.word	.L436
	.word	.L438
	.word	.L439
	.word	.L440
	.word	.L435
	.word	.L441
	.word	.L442
	.word	.L435
	.word	.L443
	.word	.L444
	.word	.L445
	.word	.L445
	.word	.L445
	.word	.L446
	.word	.L435
	.word	.L447
	.word	.L448
	.word	.L449
.L449:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP9
.L450:
	mov	r0, #7
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, lr}
	b	VCTRL_RecordPosTime
.L436:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_H264
	b	.L450
.L438:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VC1
	b	.L450
.L439:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MPEG4
	b	.L450
.L440:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MPEG2
	b	.L450
.L441:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_DIVX3
	b	.L450
.L442:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_AVS
	b	.L450
.L443:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_REAL8
	b	.L450
.L444:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_REAL9
	b	.L450
.L445:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP6
	b	.L450
.L446:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_VP8
	b	.L450
.L447:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_MVC
	b	.L450
.L448:
	mov	r1, r6
	mov	r0, r5
	bl	DecodeStream_HEVC
	b	.L450
.L435:
	movw	r3, #1830
	ldr	r2, .L451
	ldr	r1, .L451+4
	mov	r0, #32
	bl	dprint_vfmw
	b	.L450
.L452:
	.align	2
.L451:
	.word	.LANCHOR1+60
	.word	.LC28
	UNWIND(.fnend)
	.size	DecodeStream, .-DecodeStream
	.align	2
	.global	ReleasePacket
	.type	ReleasePacket, %function
ReleasePacket:
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
	sub	r3, r0, #5
	cmp	r3, #12
	ldrls	pc, [pc, r3, asl #2]
	b	.L454
.L456:
	.word	.L455
	.word	.L454
	.word	.L454
	.word	.L457
	.word	.L458
	.word	.L459
	.word	.L459
	.word	.L459
	.word	.L460
	.word	.L454
	.word	.L454
	.word	.L454
	.word	.L461
.L461:
	ldr	r4, [r1]
	add	r1, r1, #294912
	ldr	r0, [r1, #3492]
	ldr	r1, [r4, #240]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L467
	ldr	r1, .L477
	mov	r0, #1
	bl	dprint_vfmw
.L467:
	ldr	r3, .L477+4
	add	r0, r4, #224
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L455:
	ldr	r4, [r1]
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L467
	add	r3, r1, #40960
	ldr	r1, [r4, #240]
	ldr	r0, [r3, #3456]
	bl	SM_ReleaseStreamSeg
	b	.L467
.L457:
	ldr	r4, [r1]
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L467
	add	r3, r1, #53248
	ldr	r1, [r4, #240]
	ldr	r0, [r3, #3496]
	bl	SM_ReleaseStreamSeg
	b	.L467
.L458:
	ldr	r4, [r1]
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L467
	add	r3, r1, #53248
	ldr	r1, [r4, #240]
	ldr	r0, [r3, #3480]
	bl	SM_ReleaseStreamSeg
	b	.L467
.L459:
	ldr	r4, [r1]
	add	r1, r1, #12288
	ldr	r0, [r1, #736]
	ldr	r1, [r4, #240]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L467
	ldr	r1, .L477+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L467
.L460:
	ldr	r4, [r1]
	add	r1, r1, #8192
	ldr	r0, [r1, #344]
	ldr	r1, [r4, #240]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L467
	ldr	r1, .L477+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L467
.L454:
	mov	r2, r0
	ldr	r1, .L477+16
	mov	r0, #0
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	b	dprint_vfmw
.L478:
	.align	2
.L477:
	.word	.LC31
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC30
	.word	.LC29
	.word	.LC32
	UNWIND(.fnend)
	.size	ReleasePacket, .-ReleasePacket
	.align	2
	.global	ReleaseCurPic_VPx
	.type	ReleaseCurPic_VPx, %function
ReleaseCurPic_VPx:
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
	sub	r0, r0, #10
	cmp	r0, #7
	ldrls	pc, [pc, r0, asl #2]
	b	.L479
.L482:
	.word	.L481
	.word	.L481
	.word	.L481
	.word	.L483
	.word	.L479
	.word	.L479
	.word	.L479
	.word	.L484
.L484:
	ldr	r4, [r1]
	add	r1, r1, #294912
	ldr	r0, [r1, #3492]
	ldr	r1, [r4, #240]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L487
	ldr	r1, .L497
	mov	r0, #1
	bl	dprint_vfmw
.L487:
	ldr	r3, .L497+4
	add	r0, r4, #224
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L483:
	ldr	r4, [r1]
	add	r1, r1, #8192
	ldr	r0, [r1, #344]
	ldr	r1, [r4, #240]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L487
	ldr	r1, .L497+8
	mov	r0, #1
	bl	dprint_vfmw
	b	.L487
.L481:
	ldr	r4, [r1]
	add	r1, r1, #12288
	ldr	r0, [r1, #736]
	ldr	r1, [r4, #240]
	bl	SM_ReleaseStreamSeg
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L487
	ldr	r1, .L497+12
	mov	r0, #1
	bl	dprint_vfmw
	b	.L487
.L479:
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L498:
	.align	2
.L497:
	.word	.LC31
	.word	vfmw_Osal_Func_Ptr_S
	.word	.LC29
	.word	.LC30
	UNWIND(.fnend)
	.size	ReleaseCurPic_VPx, .-ReleaseCurPic_VPx
	.align	2
	.global	ReleaseCurPic_Realx
	.type	ReleaseCurPic_Realx, %function
ReleaseCurPic_Realx:
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
	cmp	r0, #8
	beq	.L501
	cmp	r0, #9
	ldmnefd	sp, {r4, r5, fp, sp, pc}
	ldr	r4, [r1]
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L507
.L504:
	ldr	r3, .L508
	add	r0, r4, #224
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L501:
	ldr	r4, [r1]
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L504
	add	r3, r1, #53248
	ldr	r1, [r4, #240]
	ldr	r0, [r3, #3496]
	bl	SM_ReleaseStreamSeg
	b	.L504
.L507:
	add	r3, r1, #53248
	ldr	r1, [r4, #240]
	ldr	r0, [r3, #3480]
	bl	SM_ReleaseStreamSeg
	b	.L504
.L509:
	.align	2
.L508:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ReleaseCurPic_Realx, .-ReleaseCurPic_Realx
	.align	2
	.global	ReleaseCurPic_DIVX3
	.type	ReleaseCurPic_DIVX3, %function
ReleaseCurPic_DIVX3:
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
	ldr	r4, [r1]
	ldrb	r3, [r4, #229]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L512
.L511:
	ldr	r3, .L513
	add	r0, r4, #224
	mov	r2, #160
	mov	r1, #0
	ldr	r3, [r3, #48]
	sub	sp, fp, #20
	ldmfd	sp, {r4, r5, fp, sp, lr}
	bx	r3
.L512:
	add	r3, r1, #40960
	ldr	r1, [r4, #240]
	ldr	r0, [r3, #3456]
	bl	SM_ReleaseStreamSeg
	b	.L511
.L514:
	.align	2
.L513:
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	ReleaseCurPic_DIVX3, .-ReleaseCurPic_DIVX3
	.align	2
	.global	ReleaseCurPic
	.type	ReleaseCurPic, %function
ReleaseCurPic:
	UNWIND(.fnstart)
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	UNWIND(.movsp ip)
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	UNWIND(.pad #4)
	UNWIND(.save {fp, ip, lr})
	UNWIND(.setfp fp, ip, #-4)
	sub	fp, ip, #4
	UNWIND(.pad #8)
	sub	sp, sp, #8
	cmp	r0, #17
	ldrls	pc, [pc, r0, asl #2]
	b	.L516
.L518:
	.word	.L517
	.word	.L519
	.word	.L520
	.word	.L521
	.word	.L516
	.word	.L522
	.word	.L523
	.word	.L516
	.word	.L524
	.word	.L525
	.word	.L526
	.word	.L526
	.word	.L526
	.word	.L527
	.word	.L516
	.word	.L528
	.word	.L529
	.word	.L530
.L530:
	mov	r0, #17
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L517:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264_ClearCurrPic
.L519:
	add	r3, r1, #49152
	add	r0, r1, #12672
	add	r0, r0, #56
	ldr	r1, [r3, #656]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	VC1_ClearCurPic
.L520:
	mov	r0, r1
	str	r1, [fp, #-16]
	bl	MP4_ClearCurPic
	ldr	r1, [fp, #-16]
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP4_Clean_HeadPacket
.L521:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MP2_ClearCurPic
.L522:
	mov	r0, #5
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_DIVX3
.L523:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	AVS_ClearCurPic
.L524:
	mov	r0, #8
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_Realx
.L525:
	mov	r0, #9
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_Realx
.L526:
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L527:
	mov	r0, #13
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	ReleaseCurPic_VPx
.L528:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_ClearCurrPic
.L529:
	mov	r0, r1
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_ClearCurrPic
.L516:
	mov	r2, r0
	ldr	r1, .L531
	mov	r0, #0
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L532:
	.align	2
.L531:
	.word	.LC32
	UNWIND(.fnend)
	.size	ReleaseCurPic, .-ReleaseCurPic
	.align	2
	.global	CheckNewPicSegMpeg2
	.type	CheckNewPicSegMpeg2, %function
CheckNewPicSegMpeg2:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	add	r2, r3, #73
	cmp	r3, #0
	cmpne	r3, #179
	uxtb	r2, r2
	moveq	ip, #1
	movne	ip, #0
	cmp	r2, #1
	movhi	r2, ip
	orrls	r2, ip, #1
	cmp	r2, #0
	beq	.L537
	ldr	r2, [r0]
	cmp	r2, #0
	bne	.L537
	mov	r3, #1
	str	r3, [r0]
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
.L534:
	cmp	r3, #0
	streq	r3, [r0]
	mov	r0, r2
	ldmfd	sp, {fp, sp, pc}
.L537:
	mvn	r2, #0
	b	.L534
	UNWIND(.fnend)
	.size	CheckNewPicSegMpeg2, .-CheckNewPicSegMpeg2
	.align	2
	.global	CheckNewPicSegMpeg4
	.type	CheckNewPicSegMpeg4, %function
CheckNewPicSegMpeg4:
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
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	cmp	lr, #179
	cmpne	lr, #176
	add	r3, lr, #75
	moveq	ip, #1
	movne	ip, #0
	cmp	lr, #254
	orreq	ip, ip, #1
	uxtb	r3, r3
	cmp	lr, #47
	orrls	ip, ip, #1
	cmp	r3, #1
	movhi	r3, ip
	orrls	r3, ip, #1
	cmp	r3, #0
	bne	.L550
.L539:
	cmp	r2, #1
	bne	.L543
.L540:
	mov	r2, #1
	str	r2, [r0]
	ldrb	lr, [r1, #3]	@ zero_extendqisi2
	mov	r3, #0
.L541:
	cmp	lr, #182
	moveq	r2, #0
	streq	r2, [r0]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L550:
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L540
	b	.L539
.L543:
	mvn	r3, #0
	b	.L541
	UNWIND(.fnend)
	.size	CheckNewPicSegMpeg4, .-CheckNewPicSegMpeg4
	.align	2
	.global	CheckNewPicSegAVS
	.type	CheckNewPicSegAVS, %function
CheckNewPicSegAVS:
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
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	sub	r2, r3, #179
	add	ip, r3, #74
	clz	r2, r2
	uxtb	ip, ip
	mov	r2, r2, lsr #5
	cmp	r3, #176
	movne	lr, r2
	orreq	lr, r2, #1
	cmp	ip, #1
	movhi	ip, lr
	orrls	ip, lr, #1
	cmp	ip, #0
	beq	.L555
	ldr	ip, [r0]
	cmp	ip, #0
	bne	.L555
	mov	r3, #1
	str	r3, [r0]
	ldrb	r3, [r1, #3]	@ zero_extendqisi2
	sub	r2, r3, #179
	clz	r2, r2
	mov	r2, r2, lsr #5
.L552:
	cmp	r3, #182
	movne	r3, r2
	orreq	r3, r2, #1
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r0]
	mov	r0, ip
	ldmfd	sp, {fp, sp, pc}
.L555:
	mvn	ip, #0
	b	.L552
	UNWIND(.fnend)
	.size	CheckNewPicSegAVS, .-CheckNewPicSegAVS
	.align	2
	.global	CheckNewPicSegVC1
	.type	CheckNewPicSegVC1, %function
CheckNewPicSegVC1:
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
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	sub	r3, r2, #12
	cmp	r2, #10
	cmpne	r3, #3
	bhi	.L563
	ldr	r3, [r0]
	cmp	r3, #0
	bne	.L563
	mov	r2, #1
	str	r2, [r0]
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
.L560:
	cmp	r2, #13
	moveq	r2, #0
	streq	r2, [r0]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L563:
	mvn	r3, #0
	b	.L560
	UNWIND(.fnend)
	.size	CheckNewPicSegVC1, .-CheckNewPicSegVC1
	.align	2
	.global	CheckNewPicSegByVidStd
	.type	CheckNewPicSegByVidStd, %function
CheckNewPicSegByVidStd:
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
	ldr	ip, [r2]
	cmp	r1, #16
	ldrls	pc, [pc, r1, asl #2]
	b	.L565
.L567:
	.word	.L566
	.word	.L568
	.word	.L569
	.word	.L570
	.word	.L565
	.word	.L565
	.word	.L571
	.word	.L565
	.word	.L565
	.word	.L565
	.word	.L565
	.word	.L565
	.word	.L565
	.word	.L565
	.word	.L565
	.word	.L572
	.word	.L573
.L573:
	mov	r1, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	HEVC_IsNewPicNal
.L566:
	mov	r1, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	H264_IsNewPicNal
.L568:
	mov	r1, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckNewPicSegVC1
.L569:
	mov	r2, r3
	mov	r1, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckNewPicSegMpeg4
.L570:
	mov	r1, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckNewPicSegMpeg2
.L571:
	mov	r1, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	CheckNewPicSegAVS
.L572:
	mov	r1, ip
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	MVC_IsNewPicNal
.L565:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	CheckNewPicSegByVidStd, .-CheckNewPicSegByVidStd
	.align	2
	.global	IsNewpicSeg
	.type	IsNewpicSeg, %function
IsNewpicSeg:
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
	UNWIND(.pad #12)
	sub	sp, sp, #12
	cmp	r1, #2
	ldr	ip, [r2]
	movne	r3, #0
	beq	.L590
.L575:
	ldrb	lr, [ip]	@ zero_extendqisi2
	ldrb	r4, [ip, #1]	@ zero_extendqisi2
	cmp	lr, #0
	ldrb	ip, [ip, #2]	@ zero_extendqisi2
	bne	.L578
	cmp	r4, #0
	bne	.L578
	cmp	ip, #1
	bne	.L578
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	CheckNewPicSegByVidStd
.L590:
	ldrb	r3, [r2, #72]	@ zero_extendqisi2
	ands	r3, r3, #1
	beq	.L575
	sub	sp, fp, #16
	ldmia	sp, {r4, fp, sp, lr}
	b	CheckNewPicSegByVidStd
.L578:
	str	ip, [sp]
	mov	r3, r4
	mov	r2, lr
	ldr	r1, .L591
	mov	r0, #22
	bl	dprint_vfmw
	mvn	r0, #0
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L592:
	.align	2
.L591:
	.word	.LC33
	UNWIND(.fnend)
	.size	IsNewpicSeg, .-IsNewpicSeg
	.align	2
	.global	OpenUsdPool
	.type	OpenUsdPool, %function
OpenUsdPool:
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
	ldr	r4, .L600
	add	r4, r4, r0, lsl #2
	ldr	ip, [r4, #128]
	cmp	ip, #0
	beq	.L599
.L594:
	add	r1, ip, #203776
	mov	r0, #0
	add	r1, r1, #512
	mov	r3, ip
	mov	r2, r0
	str	r0, [ip]
.L596:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L596
	mov	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L599:
	ldr	r3, .L600+4
	movw	r0, #7688
	movt	r0, 3
	ldr	r3, [r3, #200]
	blx	r3
	cmp	r0, #0
	str	r0, [r4, #128]
	movne	ip, r0
	bne	.L594
.L597:
	mvn	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L601:
	.align	2
.L600:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	OpenUsdPool, .-OpenUsdPool
	.align	2
	.global	CloseUsdPool
	.type	CloseUsdPool, %function
CloseUsdPool:
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
	ldr	r4, .L607
	add	r4, r4, r0, lsl #2
	ldr	r0, [r4, #128]
	cmp	r0, #0
	ldmeqfd	sp, {r4, r5, fp, sp, pc}
	ldr	r3, .L607+4
	ldr	r3, [r3, #204]
	blx	r3
	mov	r3, #0
	str	r3, [r4, #128]
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L608:
	.align	2
.L607:
	.word	.LANCHOR0
	.word	vfmw_Osal_Func_Ptr_S
	UNWIND(.fnend)
	.size	CloseUsdPool, .-CloseUsdPool
	.align	2
	.global	OpenUsdPool_WithMem
	.type	OpenUsdPool_WithMem, %function
OpenUsdPool_WithMem:
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
	ldr	r3, .L616
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #128]
	cmp	ip, #0
	beq	.L615
.L610:
	add	r1, ip, #203776
	mov	r0, #0
	add	r1, r1, #512
	mov	r3, ip
	mov	r2, r0
	str	r0, [ip]
.L612:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L612
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L615:
	cmp	r1, #0
	str	r1, [r0, #128]
	movne	ip, r1
	bne	.L610
.L613:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L617:
	.align	2
.L616:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	OpenUsdPool_WithMem, .-OpenUsdPool_WithMem
	.align	2
	.global	CloseUsdPool_WithMem
	.type	CloseUsdPool_WithMem, %function
CloseUsdPool_WithMem:
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
	ldr	r3, .L623
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #128]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r0, #128]
	ldmfd	sp, {fp, sp, pc}
.L624:
	.align	2
.L623:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	CloseUsdPool_WithMem, .-CloseUsdPool_WithMem
	.align	2
	.global	InitUsdPool
	.type	InitUsdPool, %function
InitUsdPool:
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
	ldr	r3, .L630
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #128]
	cmp	r0, #0
	beq	.L628
	add	r1, r0, #203776
	mov	ip, #0
	add	r1, r1, #512
	mov	r3, r0
	mov	r2, ip
	str	ip, [r0]
.L627:
	str	r2, [r3, #1048]
	add	r3, r3, #1056
	str	r2, [r3, #-12]
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L627
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L628:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L631:
	.align	2
.L630:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	InitUsdPool, .-InitUsdPool
	.align	2
	.global	GetUsd
	.type	GetUsd, %function
GetUsd:
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
	ldr	r3, .L639
	add	r0, r3, r0, lsl #2
	ldr	ip, [r0, #128]
	cmp	ip, #0
	beq	.L636
	mov	r3, ip
	mov	r2, #0
	b	.L635
.L634:
	add	r2, r2, #1
	add	r3, r3, #1056
	cmp	r2, #192
	add	r3, r3, #8
	beq	.L638
.L635:
	ldr	r1, [r3, #1048]
	cmp	r1, #0
	bne	.L634
	ldr	r1, [r3, #1044]
	cmp	r1, #0
	bne	.L634
	movw	r0, #1064
	mov	r4, #0
	mul	r3, r0, r2
	mov	r5, #0
	mla	r2, r2, r0, r0
	add	r6, ip, r3
	add	r3, r3, #8
	add	lr, r6, #1024
	add	r0, ip, r3
	str	r1, [r6, #1044]
	add	lr, lr, #8
	strd	r4, [ip, r2]
	str	r1, [r6, #1060]
	str	r1, [r6, #1056]
	str	r1, [r6, #1052]
	strb	r1, [r6, #1034]
	strb	r1, [r6, #1035]
	strb	r1, [r6, #1036]
	strh	r1, [lr, #6]	@ movhi
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L638:
	mov	r0, #0
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L636:
	mov	r0, ip
	ldmfd	sp, {r4, r5, r6, fp, sp, pc}
.L640:
	.align	2
.L639:
	.word	.LANCHOR0
	UNWIND(.fnend)
	.size	GetUsd, .-GetUsd
	.align	2
	.global	FreeUsdByDec
	.type	FreeUsdByDec, %function
FreeUsdByDec:
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
	movne	r3, #0
	strne	r3, [r1, #1040]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	FreeUsdByDec, .-FreeUsdByDec
	.align	2
	.global	MarkUsdByDnr
	.type	MarkUsdByDnr, %function
MarkUsdByDnr:
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
	movne	r3, #1
	strne	r3, [r1, #1036]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	MarkUsdByDnr, .-MarkUsdByDnr
	.align	2
	.global	UnMarkUsdByDnr
	.type	UnMarkUsdByDnr, %function
UnMarkUsdByDnr:
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
	movne	r3, #0
	strne	r3, [r1, #1036]
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	UnMarkUsdByDnr, .-UnMarkUsdByDnr
	.align	2
	.global	IsImageInVoQueue
	.type	IsImageInVoQueue, %function
IsImageInVoQueue:
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
	beq	.L667
	ldrh	r3, [r0, #4]
	ldrh	lr, [r0, #8]
	and	r3, r3, #63
	cmp	lr, r3
	beq	.L661
.L660:
	add	r2, r0, r3, lsl #2
	add	r3, r3, #1
	and	r3, r3, #63
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L659
	ldr	ip, [r2, #180]
	ldr	r2, [r1, #180]
	cmp	ip, r2
	beq	.L662
.L659:
	cmp	r3, lr
	bne	.L660
.L661:
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L662:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L667:
	mov	r0, r1
	ldr	r1, .L668
	bl	dprint_vfmw
	mvn	r0, #0
	ldmfd	sp, {fp, sp, pc}
.L669:
	.align	2
.L668:
	.word	.LC6
	UNWIND(.fnend)
	.size	IsImageInVoQueue, .-IsImageInVoQueue
	.align	2
	.global	IsVoQueueEmpty
	.type	IsVoQueueEmpty, %function
IsVoQueueEmpty:
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
	beq	.L674
	ldrh	r0, [r4, #8]
	ldrh	r3, [r4, #6]
	cmp	r0, r3
	ldreqh	r3, [r4, #4]
	rsbeq	r0, r0, r3
	clzeq	r0, r0
	moveq	r0, r0, lsr #5
	movne	r0, #0
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L674:
	ldr	r2, .L675
	ldr	r1, .L675+4
	bl	dprint_vfmw
	mov	r0, r4
	ldmfd	sp, {r4, r5, fp, sp, pc}
.L676:
	.align	2
.L675:
	.word	.LANCHOR1+76
	.word	.LC34
	UNWIND(.fnend)
	.size	IsVoQueueEmpty, .-IsVoQueueEmpty
	.align	2
	.global	SetAspectRatio
	.type	SetAspectRatio, %function
SetAspectRatio:
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
	mov	r3, r0
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L678
.L680:
	.word	.L679
	.word	.L681
	.word	.L682
	.word	.L683
	.word	.L684
	.word	.L685
.L685:
	mov	r1, #0
	mov	r2, #2
	stmia	r0, {r1, r2}
	ldmfd	sp, {fp, sp, pc}
.L679:
	mov	r1, #0
	mov	r2, #1
	stmia	r0, {r1, r2}
	ldmfd	sp, {fp, sp, pc}
.L681:
	mov	r1, #4
	mov	r2, #3
	stmia	r0, {r1, r2}
	ldmfd	sp, {fp, sp, pc}
.L682:
	mov	r1, #16
	mov	r2, #9
	stmia	r0, {r1, r2}
	ldmfd	sp, {fp, sp, pc}
.L683:
	mov	r1, #221
	mov	r2, #100
	stmia	r0, {r1, r2}
	ldmfd	sp, {fp, sp, pc}
.L684:
	mov	r1, #235
	mov	r2, #100
	stmia	r0, {r1, r2}
	ldmfd	sp, {fp, sp, pc}
.L678:
	mov	r0, #1
	mov	r2, r1
	mov	ip, #0
	str	r0, [r3, #4]
	ldr	r1, .L687
	str	ip, [r3]
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	b	dprint_vfmw
.L688:
	.align	2
.L687:
	.word	.LC35
	UNWIND(.fnend)
	.size	SetAspectRatio, .-SetAspectRatio
	.align	2
	.global	GetVoLastImageID
	.type	GetVoLastImageID, %function
GetVoLastImageID:
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
	ldr	r0, [r0, #296]
	cmp	r0, #1
	mvnls	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	GetVoLastImageID, .-GetVoLastImageID
	.align	2
	.global	IsMain10Profile
	.type	IsMain10Profile, %function
IsMain10Profile:
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
	add	r0, r0, #86016
	ldr	r3, [r0, #1672]
	cmp	r3, #1
	beq	.L696
	ldr	r2, [r0, #1676]
	cmp	r2, #1
	beq	.L696
	cmp	r3, #2
	moveq	r3, #1
	ldrne	r3, [r0, #1680]
	subne	r3, r3, #1
	clzne	r3, r3
	movne	r3, r3, lsr #5
.L694:
	ldr	r0, [r0, #1680]
	cmp	r0, #1
	movne	r0, r3
	orreq	r0, r3, #1
	ldmfd	sp, {fp, sp, pc}
.L696:
	mov	r0, #0
	ldmfd	sp, {fp, sp, pc}
	UNWIND(.fnend)
	.size	IsMain10Profile, .-IsMain10Profile
	.align	2
	.global	MetadataMapToSec
	.type	MetadataMapToSec, %function
MetadataMapToSec:
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
	.size	MetadataMapToSec, .-MetadataMapToSec
	.align	2
	.global	MetadataUnMapToSec
	.type	MetadataUnMapToSec, %function
MetadataUnMapToSec:
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
	.size	MetadataUnMapToSec, .-MetadataUnMapToSec
	.global	pstVdecUsdPool
	.global	g_DnrEnable
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	__FUNCTION__.15555, %object
	.size	__FUNCTION__.15555, 19
__FUNCTION__.15555:
	.ascii	"InsertImgToVoQueue\000"
	.space	1
	.type	__func__.15591, %object
	.size	__func__.15591, 20
__func__.15591:
	.ascii	"SYNTAX_ReceiveImage\000"
	.type	__func__.15637, %object
	.size	__func__.15637, 20
__func__.15637:
	.ascii	"SYNTAX_ReleaseImage\000"
	.type	__func__.15766, %object
	.size	__func__.15766, 13
__func__.15766:
	.ascii	"DecodeStream\000"
	.space	3
	.type	__func__.15939, %object
	.size	__func__.15939, 15
__func__.15939:
	.ascii	"IsVoQueueEmpty\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	ASCII(.ascii	"Initializing VO queue\012\000" )
	.space	1
.LC1:
	ASCII(.ascii	"VoQueue state: head(%d) history(%d) tail(%d)\000" )
	.space	3
.LC2:
	ASCII(.ascii	"\012\000" )
	.space	2
.LC3:
	ASCII(.ascii	"%d \000" )
.LC4:
	ASCII(.ascii	"ResetVoQueue but queue not empty: head(%d) history(" )
	ASCII(.ascii	"%d) tail(%d)\012\000" )
	.space	3
.LC5:
	ASCII(.ascii	"out_pts: %lld -> %lld Usertag %lld\012\000" )
.LC6:
	ASCII(.ascii	"image point NULL\012\000" )
	.space	2
.LC7:
	ASCII(.ascii	"call InsertVOQueue\012\000" )
.LC8:
	ASCII(.ascii	"FATAL: p_image(id=%d) has already in the VoQueue!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC9:
	ASCII(.ascii	"error=%d,W=%d,H=%d,not acceptable!\012\000" )
.LC10:
	ASCII(.ascii	"Queue=(%02d,%02d,%02d) + F%d\012\000" )
	.space	2
.LC11:
	ASCII(.ascii	"%s, pstVoQue is NULL!!!\012\000" )
	.space	3
.LC12:
	ASCII(.ascii	"Queue=(%02d,%02d,%02d) - F%d\012\000" )
	.space	2
.LC13:
	ASCII(.ascii	"SYNTAX_ReleaseImage p_image is null\012\000" )
	.space	3
.LC14:
	ASCII(.ascii	"Image %d not found in vo queue.\012\000" )
	.space	3
.LC15:
	ASCII(.ascii	"image[%d] null\012\000" )
.LC16:
	ASCII(.ascii	"Queue=(%02d,%02d,%02d) x F%d\012\000" )
	.space	2
.LC17:
	ASCII(.ascii	"LENTH ERROR: VC1 S/MP BS is wrong!\012\000" )
.LC18:
	ASCII(.ascii	"SYNTAX ERROR: VC1 S/MP BS is wrong!\012\000" )
	.space	3
.LC19:
	ASCII(.ascii	"pSegMan error!\012\000" )
.LC20:
	ASCII(.ascii	"More than two packet!!!ERROR!!!\012\000" )
	.space	3
.LC21:
	ASCII(.ascii	"*****************copy packets tobe one*************" )
	ASCII(.ascii	"****\012\000" )
	.space	3
.LC22:
	ASCII(.ascii	"*****************two packet*****************\012\000" )
	.space	2
.LC23:
	ASCII(.ascii	"pSegMan->CurrSeg.IsLastSeg=%d\012\000" )
	.space	1
.LC24:
	ASCII(.ascii	"pSegMan->CurrSeg.PhyAddr=%#x\012\000" )
	.space	2
.LC25:
	ASCII(.ascii	"pSegMan->CurrSeg.LenInByte=%#x\012\000" )
.LC26:
	ASCII(.ascii	"ERROR: Wrong PreParseInfo about Vc1 IsAdvProfile!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC27:
	ASCII(.ascii	"ERROR: Wrong PreParseInfo about Vc1 CodecVersion!\012" )
	ASCII(.ascii	"\000" )
	.space	1
.LC28:
	ASCII(.ascii	"Func: %s, Line: %d\012\000" )
.LC29:
	ASCII(.ascii	"ERROR: VFMW_VP8 one packet stream, but IsLastSeg ==" )
	ASCII(.ascii	" 0\012\000" )
	.space	1
.LC30:
	ASCII(.ascii	"ERROR: VFMW_VP6 one packet stream, but IsLastSeg ==" )
	ASCII(.ascii	" 0\012\000" )
	.space	1
.LC31:
	ASCII(.ascii	"ERROR: VFMW_VP9 one packet stream, but IsLastSeg ==" )
	ASCII(.ascii	" 0\012\000" )
	.space	1
.LC32:
	ASCII(.ascii	"VidStd=%d Error!\012\000" )
	.space	2
.LC33:
	ASCII(.ascii	"pu8[0] = %x,pu8[1] = %x, pu8[2] = %x\012\000" )
	.space	2
.LC34:
	ASCII(.ascii	"%s pstVoQue NULL\012\000" )
	.space	2
.LC35:
	ASCII(.ascii	"WARNNING: aspect ration (%d) is not expected!\012\000" )
	.bss
	.align	2
.LANCHOR0 = . + 0
	.type	last_rec_pos_time.15552, %object
	.size	last_rec_pos_time.15552, 128
last_rec_pos_time.15552:
	.space	128
	.type	pstVdecUsdPool, %object
	.size	pstVdecUsdPool, 128
pstVdecUsdPool:
	.space	128
	.type	g_DnrEnable, %object
	.size	g_DnrEnable, 4
g_DnrEnable:
	.space	4
	.ident	"GCC: (gcc-linaro-4.9-2014.09 + glibc-2.24 (Build by czyong) Wed Dec 21 10:39:16 CST 2016) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
