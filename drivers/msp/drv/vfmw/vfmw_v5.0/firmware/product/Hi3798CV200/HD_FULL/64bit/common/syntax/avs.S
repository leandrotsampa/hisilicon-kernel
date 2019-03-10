#include "hi_asm_define.h"
	.arch armv8-a+fp+simd
	.file	"avs.c"
	.global	_mcount
	.text
	.align	2
	.p2align 3,,7
	.global	avs_f_v
	.type	avs_f_v, %function
avs_f_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	mov	w1, w20
	mov	x0, x19
	bl	BsGet
	mov	w19, w0
	ldr	x1, .LC1
	mov	w4, w20
	mov	w3, w0
	mov	x2, x21
	mov	w0, 7
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	avs_f_v, .-avs_f_v
	.align	3
.LC1:
	.xword	.LC0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	avs_u_v
	.type	avs_u_v, %function
avs_u_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	mov	x21, x2
	bl	_mcount
	mov	x2, x21
	mov	w1, w20
	mov	x0, x19
	bl	avs_f_v
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	avs_u_v, .-avs_u_v
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	avs_ue_v
	.type	avs_ue_v, %function
avs_ue_v:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	mov	w1, 32
	mov	x0, x21
	bl	BsShow
	bl	ZerosMS_32
	cmp	w0, 31
	mov	w19, w0
	bls	.L7
	mov	w20, -1
	mov	w4, 32
.L4:
	ldr	x1, .LC2
	mov	w3, w20
	mov	x2, x22
	mov	w0, 7
	bl	dprint_vfmw
	ldr	x23, [sp, 48]
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L7:
	mov	w1, w0
	mov	x0, x21
	add	w23, w19, 1
	bl	BsSkip
	mov	w1, w23
	mov	x0, x21
	bl	BsShow
	sub	w20, w0, #1
	mov	w1, w23
	mov	x0, x21
	bl	BsSkip
	lsl	w4, w19, 1
	add	w4, w4, 1
	b	.L4
	.size	avs_ue_v, .-avs_ue_v
	.align	3
.LC2:
	.xword	.LC0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	avs_se_v
	.type	avs_se_v, %function
avs_se_v:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	mov	w1, 32
	mov	x0, x20
	bl	BsShow
	bl	ZerosMS_32
	cmp	w0, 31
	mov	w19, w0
	bls	.L13
	mov	w20, 2147483647
	mov	w4, 32
.L9:
	ldr	x1, .LC3
	mov	w3, w20
	mov	x2, x21
	mov	w0, 7
	bl	dprint_vfmw
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L13:
	mov	w1, w0
	mov	x0, x20
	add	w22, w19, 1
	bl	BsSkip
	mov	w1, w22
	mov	x0, x20
	bl	BsShow
	sub	w0, w0, #1
	and	w1, w0, 1
	asr	w3, w0, 1
	cmp	w1, wzr
	mov	x0, x20
	mov	w1, w22
	neg	w20, w3
	csinc	w20, w20, w3, eq
	bl	BsSkip
	lsl	w4, w19, 1
	add	w4, w4, 1
	b	.L9
	.size	avs_se_v, .-avs_se_v
	.align	3
.LC3:
	.xword	.LC0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_next_start_code
	.type	AVS_next_start_code, %function
AVS_next_start_code:
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
	bgt	.L21
	b	.L18
	.p2align 3
.L24:
	bl	BsSkip
	cmp	w19, w21
	beq	.L18
.L21:
	mov	w1, 24
	mov	x0, x20
	add	w19, w19, 1
	bl	BsShow
	mov	w2, w0
	cmp	w2, 1
	mov	w1, 8
	mov	x0, x20
	bne	.L24
	mov	w0, w2
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L18:
	mov	w2, 0
	ldr	x21, [sp, 32]
	mov	w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_next_start_code, .-AVS_next_start_code
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_sequence_header
	.type	AVS_sequence_header, %function
AVS_sequence_header:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	add	x21, x23, 12288
	mov	x19, x1
	bl	_mcount
	ldr	x2, .LC5
	mov	w1, 32
	ldr	x20, [x21, 3160]
	ldr	w4, [x21, 2772]
	mov	x0, x20
	and	w4, w4, -65537
	str	w4, [x21, 2772]
	bl	avs_f_v
	ldr	x2, .LC7
	mov	w1, 8
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 16]
	ldr	x2, .LC9
	mov	w1, 8
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 20]
	ldr	x2, .LC11
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 15]
	ldr	x2, .LC13
	mov	w1, 14
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 24]
	ldr	x2, .LC15
	mov	w1, 14
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 28]
	ldr	x2, .LC17
	mov	w1, 2
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 11]
	ldr	x2, .LC19
	mov	w1, 3
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 12]
	ldr	x2, .LC21
	mov	w1, 4
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 13]
	ldr	x2, .LC23
	mov	w1, 4
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 14]
	ldr	x2, .LC25
	mov	w1, 18
	mov	x0, x20
	bl	avs_f_v
	ldr	x22, .LC27
	mov	w1, 1
	str	w0, [x19, 32]
	mov	x2, x22
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 10]
	ldr	x2, .LC29
	mov	w1, 12
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 36]
	ldr	x2, .LC31
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 9]
	mov	x2, x22
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 10]
	ldr	x2, .LC33
	mov	w1, 18
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 40]
	ldr	x2, .LC35
	mov	w1, 3
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 8]
	ldr	w0, [x19, 24]
	ldr	w1, [x21, 2812]
	cmp	w0, w1
	beq	.L32
.L26:
	ldr	x0, .LC36
	mov	w2, 1
	str	w2, [x21, 2784]
	ldr	x4, [x0]
	cbz	x4, .L27
	ldp	w3, w2, [x19, 24]
	ldr	w5, [x21, 2816]
	ldr	w0, [x23, 4]
	strh	w1, [x29, 72]
	mov	w1, 2
	strh	w3, [x29, 76]
	mov	w3, 8
	strh	w2, [x29, 78]
	add	x2, x29, 72
	strh	w5, [x29, 74]
	blr	x4
.L27:
	mov	x1, x19
	mov	x2, 372
	add	x0, x21, 2788
	bl	memcpy
	ldr	w1, [x21, 2772]
	mov	w0, 1
	ldr	w2, [x21, 2780]
	str	w0, [x21, 2776]
	orr	w1, w1, 65536
	add	w2, w2, w0
	str	w1, [x21, 2772]
	str	w2, [x21, 2780]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L32:
	ldr	w3, [x19, 28]
	ldr	w0, [x21, 2816]
	cmp	w3, w0
	bne	.L26
	b	.L27
	.size	AVS_sequence_header, .-AVS_sequence_header
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
	.align	3
.LC29:
	.xword	.LC28
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
.LC36:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_i_picture_header
	.type	AVS_i_picture_header, %function
AVS_i_picture_header:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x3, .LC39
	mov	x2, 272
	mov	w1, 0
	add	x0, x19, 76
	ldr	x20, [x21, 512]
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w3, [x21, 124]
	mov	w1, 32
	ldr	x2, .LC41
	mov	x0, x20
	and	w3, w3, -262145
	str	w3, [x21, 124]
	bl	avs_f_v
	ldr	x2, .LC43
	mov	w1, 16
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 92]
	ldr	w1, [x19, 16]
	ldr	x22, .LC44
	cmp	w1, 72
	beq	.L67
	ldr	x2, .LC48
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 86]
	beq	.L68
.L35:
	mov	x2, x22
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 104]
	ldr	x2, .LC52
	mov	w1, 8
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 108]
	ldrb	w1, [x19, 9]
	cmp	w1, 1
	beq	.L69
.L36:
	ldr	x2, .LC56
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	uxtb	w0, w0
	ldrb	w1, [x19, 15]
	strb	w0, [x19, 76]
	cmp	w1, 1
	beq	.L70
	cbz	w0, .L71
.L38:
	mov	w0, 1
	strb	w0, [x19, 77]
.L39:
	ldr	x2, .LC60
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 78]
	ldr	x2, .LC62
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 79]
	ldr	x2, .LC64
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 80]
	ldr	x2, .LC66
	mov	w1, 6
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 81]
	ldrh	w1, [x19, 76]
	cbz	w1, .L72
.L40:
	ldr	x2, .LC69
	mov	w1, 4
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 83]
	ldr	x2, .LC71
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	uxtb	w0, w0
	stp	wzr, wzr, [x19, 116]
	strb	w0, [x19, 84]
	cbz	w0, .L73
.L42:
	ldr	w0, [x19, 16]
	cmp	w0, 72
	beq	.L74
.L44:
	str	wzr, [x19, 344]
	mov	w0, 1
	strb	w0, [x19, 89]
	ldr	w0, [x21, 124]
	orr	w0, w0, 262144
	str	w0, [x21, 124]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L71:
	ldr	x2, .LC58
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 77]
	b	.L39
	.p2align 3
.L73:
	ldr	x2, .LC73
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	uxtb	w0, w0
	strb	w0, [x19, 85]
	cbz	w0, .L42
	ldr	x1, .LC75
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 116]
	ldr	x1, .LC77
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 120]
	b	.L42
	.p2align 3
.L72:
	ldr	x2, .LC68
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 82]
	b	.L40
	.p2align 3
.L70:
	strb	w1, [x19, 76]
	b	.L38
	.p2align 3
.L74:
	ldr	x2, .LC79
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 124]
	cbnz	w0, .L45
.L53:
	ldr	x2, .LC81
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 328]
	b	.L44
	.p2align 3
.L67:
	mov	w1, 1
	mov	x2, x22
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 104]
	ldr	x2, .LC46
	mov	w1, 7
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 96]
	ldr	w1, [x19, 92]
	mov	w2, 1
	strb	w2, [x19]
	ldr	x2, .LC48
	orr	w0, w0, w1, lsl 7
	mov	w1, 1
	str	w0, [x19, 92]
	mov	x0, x20
	bl	avs_f_v
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x19, 86]
	bne	.L35
	.p2align 2
.L68:
	ldr	x2, .LC50
	mov	w1, 24
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 100]
	b	.L35
	.p2align 3
.L69:
	ldr	x1, .LC54
	mov	x0, x20
	bl	avs_ue_v
	str	w0, [x19, 112]
	b	.L36
	.p2align 3
.L45:
	ldr	x2, .LC83
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 128]
	ldr	x2, .LC85
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 132]
	cbz	w0, .L75
.L46:
	ldr	x2, .LC91
	mov	w1, 2
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 144]
	ldr	x2, .LC93
	mov	w1, 2
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 148]
	ldr	w1, [x19, 144]
	cmp	w1, 1
	beq	.L47
	ldr	w0, [x19, 128]
	cmp	w0, wzr
	ccmp	w1, 3, 0, eq
	beq	.L47
	cmp	w1, 2
	add	x22, x19, 176
	bne	.L53
.L52:
	ldr	x23, .LC97
	add	x24, x19, 200
	.p2align 2
.L51:
	mov	x1, x23
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x22], 4
	cmp	x22, x24
	bne	.L51
	b	.L53
	.p2align 3
.L75:
	ldr	x1, .LC87
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 136]
	ldr	x1, .LC89
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 140]
	b	.L46
	.p2align 3
.L47:
	ldr	x24, .LC95
	add	x23, x19, 152
	add	x22, x19, 176
	.p2align 2
.L49:
	mov	x1, x24
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x23], 4
	cmp	x23, x22
	bne	.L49
	ldr	w0, [x19, 144]
	cmp	w0, 2
	beq	.L52
	ldr	w1, [x19, 128]
	cmp	w1, wzr
	ccmp	w0, 3, 0, eq
	beq	.L52
	b	.L53
	.size	AVS_i_picture_header, .-AVS_i_picture_header
	.align	3
.LC39:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC41:
	.xword	.LC40
	.align	3
.LC43:
	.xword	.LC42
	.align	3
.LC44:
	.xword	.LC26
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
.LC60:
	.xword	.LC59
	.align	3
.LC62:
	.xword	.LC61
	.align	3
.LC64:
	.xword	.LC63
	.align	3
.LC66:
	.xword	.LC65
	.align	3
.LC68:
	.xword	.LC67
	.align	3
.LC69:
	.xword	.LC34
	.align	3
.LC71:
	.xword	.LC70
	.align	3
.LC73:
	.xword	.LC72
	.align	3
.LC75:
	.xword	.LC74
	.align	3
.LC77:
	.xword	.LC76
	.align	3
.LC79:
	.xword	.LC78
	.align	3
.LC81:
	.xword	.LC80
	.align	3
.LC83:
	.xword	.LC82
	.align	3
.LC85:
	.xword	.LC84
	.align	3
.LC87:
	.xword	.LC86
	.align	3
.LC89:
	.xword	.LC88
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
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_pb_picture_header
	.type	AVS_pb_picture_header, %function
AVS_pb_picture_header:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	mov	x19, x1
	bl	_mcount
	ldr	x3, .LC98
	mov	x2, 272
	mov	w1, 0
	add	x0, x19, 76
	ldr	x20, [x21, 512]
	ldr	x3, [x3, 96]
	blr	x3
	ldr	w3, [x21, 124]
	mov	w1, 32
	ldr	x2, .LC100
	mov	x0, x20
	and	w3, w3, -262145
	str	w3, [x21, 124]
	bl	avs_f_v
	ldr	x2, .LC101
	mov	w1, 16
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 92]
	ldr	w1, [x19, 16]
	cmp	w1, 72
	beq	.L121
.L77:
	ldr	x2, .LC105
	mov	w1, 2
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 87]
	ldr	x2, .LC106
	mov	w1, 8
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 108]
	ldrb	w1, [x19, 9]
	cmp	w1, 1
	beq	.L122
.L78:
	ldr	x2, .LC108
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	uxtb	w0, w0
	strb	w0, [x19, 76]
	cbz	w0, .L123
	mov	w0, 1
	strb	w0, [x19, 77]
.L80:
	ldr	x2, .LC112
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 78]
	ldr	x2, .LC113
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 79]
	ldr	x2, .LC114
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 80]
	ldr	x2, .LC115
	mov	w1, 6
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 81]
	ldrb	w1, [x19, 87]
	cmp	w1, 2
	beq	.L124
.L81:
	ldr	x2, .LC117
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 89]
.L83:
	ldr	x2, .LC119
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	wzr, [x19, 336]
	ldrb	w1, [x19, 87]
	strb	w0, [x19, 90]
	cmp	w1, 2
	str	wzr, [x19, 340]
	beq	.L125
	ldr	x2, .LC123
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 336]
.L85:
	ldrb	w0, [x19, 77]
	cmp	w0, 1
	beq	.L86
	ldr	w0, [x19, 16]
	cmp	w0, 72
	beq	.L87
.L86:
	str	wzr, [x19, 336]
	str	wzr, [x19, 340]
.L87:
	ldr	x2, .LC124
	mov	w1, 2
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 83]
	ldr	x2, .LC125
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 82]
	ldr	x2, .LC126
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	uxtb	w0, w0
	stp	wzr, wzr, [x19, 116]
	strb	w0, [x19, 84]
	cbz	w0, .L126
.L89:
	ldr	w0, [x19, 16]
	cmp	w0, 72
	beq	.L127
.L91:
	ldrb	w0, [x19, 87]
	cmp	w0, 1
	beq	.L120
	mov	w0, 2
.L120:
	str	w0, [x19, 344]
	ldr	w0, [x21, 124]
	orr	w0, w0, 262144
	str	w0, [x21, 124]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L124:
	ldrb	w0, [x19, 77]
	cmp	w0, 1
	bne	.L81
	strb	w0, [x19, 89]
	b	.L83
	.p2align 3
.L123:
	ldr	x2, .LC109
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	uxtb	w0, w0
	strb	w0, [x19, 77]
	cbnz	w0, .L80
	ldr	x2, .LC111
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	strb	w0, [x19, 88]
	b	.L80
	.p2align 3
.L126:
	ldr	x2, .LC127
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	uxtb	w0, w0
	strb	w0, [x19, 85]
	cbz	w0, .L89
	ldr	x1, .LC128
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 116]
	ldr	x1, .LC129
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 120]
	b	.L89
	.p2align 3
.L125:
	ldr	x2, .LC121
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 340]
	b	.L85
	.p2align 3
.L127:
	ldr	x2, .LC130
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	cmp	w0, 1
	str	w0, [x19, 124]
	mov	w22, w0
	beq	.L92
.L100:
	ldr	x2, .LC131
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 328]
	b	.L91
	.p2align 3
.L121:
	ldr	x2, .LC102
	mov	w1, 1
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 104]
	ldr	x2, .LC103
	mov	w1, 7
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 96]
	ldr	w1, [x19, 92]
	mov	w2, 1
	strb	w2, [x19]
	orr	w0, w0, w1, lsl 7
	str	w0, [x19, 92]
	b	.L77
	.p2align 3
.L122:
	ldr	x1, .LC107
	mov	x0, x20
	bl	avs_ue_v
	str	w0, [x19, 112]
	b	.L78
	.p2align 3
.L92:
	ldr	x2, .LC132
	mov	w1, w0
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 128]
	ldr	x2, .LC133
	mov	w1, w22
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 132]
	cbz	w0, .L128
.L93:
	ldr	x2, .LC136
	mov	w1, 2
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 144]
	ldr	x2, .LC137
	mov	w1, 2
	mov	x0, x20
	bl	avs_f_v
	str	w0, [x19, 148]
	ldr	w1, [x19, 144]
	cmp	w1, 1
	beq	.L94
	ldr	w0, [x19, 128]
	cmp	w0, wzr
	ccmp	w1, 3, 0, eq
	beq	.L94
	cmp	w1, 2
	add	x22, x19, 176
	bne	.L100
.L99:
	ldr	x23, .LC139
	add	x24, x19, 200
	.p2align 2
.L98:
	mov	x1, x23
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x22], 4
	cmp	x22, x24
	bne	.L98
	b	.L100
.L94:
	ldr	x24, .LC138
	add	x23, x19, 152
	add	x22, x19, 176
	.p2align 2
.L96:
	mov	x1, x24
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x23], 4
	cmp	x23, x22
	bne	.L96
	ldr	w0, [x19, 144]
	cmp	w0, 2
	beq	.L99
	ldr	w1, [x19, 128]
	cmp	w1, wzr
	ccmp	w0, 3, 0, eq
	beq	.L99
	b	.L100
.L128:
	ldr	x1, .LC134
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 136]
	ldr	x1, .LC135
	mov	x0, x20
	bl	avs_se_v
	str	w0, [x19, 140]
	b	.L93
	.size	AVS_pb_picture_header, .-AVS_pb_picture_header
	.align	3
.LC98:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC100:
	.xword	.LC99
	.align	3
.LC101:
	.xword	.LC42
	.align	3
.LC102:
	.xword	.LC26
	.align	3
.LC103:
	.xword	.LC45
	.align	3
.LC105:
	.xword	.LC104
	.align	3
.LC106:
	.xword	.LC51
	.align	3
.LC107:
	.xword	.LC53
	.align	3
.LC108:
	.xword	.LC55
	.align	3
.LC109:
	.xword	.LC57
	.align	3
.LC111:
	.xword	.LC110
	.align	3
.LC112:
	.xword	.LC59
	.align	3
.LC113:
	.xword	.LC61
	.align	3
.LC114:
	.xword	.LC63
	.align	3
.LC115:
	.xword	.LC65
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
.LC123:
	.xword	.LC122
	.align	3
.LC124:
	.xword	.LC34
	.align	3
.LC125:
	.xword	.LC67
	.align	3
.LC126:
	.xword	.LC70
	.align	3
.LC127:
	.xword	.LC72
	.align	3
.LC128:
	.xword	.LC74
	.align	3
.LC129:
	.xword	.LC76
	.align	3
.LC130:
	.xword	.LC78
	.align	3
.LC131:
	.xword	.LC80
	.align	3
.LC132:
	.xword	.LC82
	.align	3
.LC133:
	.xword	.LC84
	.align	3
.LC134:
	.xword	.LC86
	.align	3
.LC135:
	.xword	.LC88
	.align	3
.LC136:
	.xword	.LC90
	.align	3
.LC137:
	.xword	.LC92
	.align	3
.LC138:
	.xword	.LC94
	.align	3
.LC139:
	.xword	.LC96
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_user_data
	.type	AVS_user_data, %function
AVS_user_data:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x0, x30
	add	x21, x19, 12288
	mov	w22, w1
	add	x20, x21, 2648
	bl	_mcount
	ldr	x2, .LC141
	mov	w1, 32
	ldr	x0, [x20, 512]
	bl	avs_f_v
	ldr	w0, [x20, 124]
	orr	w0, w0, 1048576
	str	w0, [x20, 124]
	cbnz	w22, .L130
	ldr	x1, [x20, 816]
	cbz	x1, .L131
	ldr	w0, [x19, 4]
	bl	FreeUsdByDec
	str	xzr, [x20, 816]
.L131:
	ldr	w0, [x19, 4]
	bl	GetUsd
	str	x0, [x21, 3464]
	add	x1, x21, 2648
	cbz	x0, .L141
	ldr	x3, [x19, 16]
	mov	w2, 10
	add	x20, x19, 16384
	ldr	x3, [x3, 56]
	str	x3, [x0, 1056]
	ldr	x0, [x1, 816]
	str	w2, [x0, 1040]
	ldr	x0, [x1, 816]
	ldr	w2, [x1, 132]
	str	w2, [x0, 1044]
	ldr	x2, [x1, 816]
	ldr	w0, [x20, 448]
	sub	w0, w0, #4
	str	w0, [x2, 1052]
	ldr	x0, [x1, 816]
	ldr	w2, [x0, 1052]
	cmp	w2, 1024
	ble	.L134
	mov	w2, 1024
	str	w2, [x0, 1052]
	ldr	x0, [x1, 816]
	ldr	w2, [x0, 1052]
.L134:
	ldr	x22, .LC142
	sxtw	x2, w2
	ldr	x1, [x19, 16816]
	ldr	x3, [x22, 104]
	add	x1, x1, 4
	blr	x3
	ldrb	w0, [x20, 441]
	cbnz	w0, .L136
	ldr	x2, [x21, 3464]
	ldr	w0, [x20, 528]
	ldr	w3, [x2, 1052]
	add	w0, w3, w0
	str	w0, [x2, 1052]
	ldr	x3, [x21, 3464]
	ldr	w2, [x3, 1052]
	cmp	w2, 1024
	ble	.L137
	mov	w0, 1024
	str	w0, [x3, 1052]
	ldr	x3, [x21, 3464]
	ldr	w2, [x3, 1052]
.L137:
	ldr	w1, [x20, 448]
	sub	w2, w2, w1
	add	w2, w2, 4
	cmp	w2, wzr
	ble	.L136
	sxtw	x1, w1
	ldr	x4, [x22, 104]
	sub	x0, x1, #4
	ldr	x1, [x19, 16896]
	sxtw	x2, w2
	add	x0, x3, x0
	blr	x4
.L136:
	ldr	x0, .LC143
	ldr	x4, [x0]
	cbz	x4, .L160
	ldr	x2, [x21, 3464]
	mov	w3, 1064
	ldr	w0, [x19, 4]
	mov	w1, 6
	blr	x4
.L160:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L130:
	ldr	x1, [x20, 824]
	cbz	x1, .L140
	ldr	w0, [x19, 4]
	bl	FreeUsdByDec
	str	xzr, [x20, 824]
.L140:
	ldr	w0, [x19, 4]
	bl	GetUsd
	str	x0, [x21, 3472]
	cbz	x0, .L141
	ldr	x3, [x19, 16]
	mov	w2, 11
	add	x20, x19, 16384
	ldr	x3, [x3, 56]
	str	x3, [x0, 1056]
	ldr	x0, [x21, 3472]
	str	w2, [x0, 1040]
	ldr	x0, [x21, 3472]
	ldr	w2, [x21, 2780]
	str	w2, [x0, 1044]
	ldr	x2, [x21, 3472]
	ldr	w0, [x20, 448]
	sub	w0, w0, #4
	str	w0, [x2, 1052]
	ldr	x0, [x21, 3472]
	ldr	w2, [x0, 1052]
	cmp	w2, 1024
	ble	.L142
	mov	w2, 1024
	str	w2, [x0, 1052]
	ldr	x0, [x21, 3472]
	ldr	w2, [x0, 1052]
.L142:
	ldr	x22, .LC142
	sxtw	x2, w2
	ldr	x1, [x19, 16816]
	ldr	x3, [x22, 104]
	add	x1, x1, 4
	blr	x3
	ldrb	w0, [x20, 441]
	cbnz	w0, .L144
	ldr	x2, [x21, 3472]
	ldr	w0, [x20, 528]
	ldr	w3, [x2, 1052]
	add	w0, w3, w0
	str	w0, [x2, 1052]
	ldr	x3, [x21, 3472]
	ldr	w2, [x3, 1052]
	cmp	w2, 1024
	ble	.L145
	mov	w0, 1024
	str	w0, [x3, 1052]
	ldr	x3, [x21, 3472]
	ldr	w2, [x3, 1052]
.L145:
	ldr	w1, [x20, 448]
	sub	w2, w2, w1
	add	w2, w2, 4
	cmp	w2, wzr
	ble	.L144
	sxtw	x1, w1
	ldr	x4, [x22, 104]
	sub	x0, x1, #4
	ldr	x1, [x19, 16896]
	sxtw	x2, w2
	add	x0, x3, x0
	blr	x4
.L144:
	ldr	x0, .LC143
	ldr	x4, [x0]
	cbz	x4, .L160
	ldr	x2, [x21, 3472]
	mov	w3, 1064
	ldr	w0, [x19, 4]
	mov	w1, 6
	blr	x4
	b	.L160
	.p2align 3
.L141:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_user_data, .-AVS_user_data
	.align	3
.LC141:
	.xword	.LC140
	.align	3
.LC142:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC143:
	.xword	g_event_report
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_sequence_display_extension
	.type	AVS_sequence_display_extension, %function
AVS_sequence_display_extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	mov	x20, x1
	bl	_mcount
	ldr	x19, [x21, 512]
	mov	w1, 4
	ldr	x2, .LC145
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC147
	mov	w1, 3
	mov	x0, x19
	bl	avs_f_v
	strb	w0, [x20, 46]
	ldr	x2, .LC149
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	strb	w0, [x20, 47]
	ldr	x2, .LC151
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	uxtb	w0, w0
	cmp	w0, 1
	strb	w0, [x20, 48]
	beq	.L164
.L163:
	ldr	x2, .LC159
	mov	w1, 14
	mov	x0, x19
	bl	avs_f_v
	str	w0, [x20, 64]
	ldr	x2, .LC160
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	strb	w0, [x20, 45]
	ldr	x2, .LC162
	mov	w1, 14
	mov	x0, x19
	bl	avs_f_v
	str	w0, [x20, 68]
	ldr	x2, .LC163
	mov	w1, 2
	mov	x0, x19
	bl	avs_f_v
	strb	w0, [x20, 44]
	mov	x0, x19
	bl	AVS_next_start_code
	ldr	w1, [x21, 124]
	mov	w0, 1
	orr	w1, w1, 131072
	str	w1, [x21, 124]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L164:
	ldr	x2, .LC153
	mov	w1, 8
	mov	x0, x19
	bl	avs_f_v
	str	w0, [x20, 52]
	ldr	x2, .LC155
	mov	w1, 8
	mov	x0, x19
	bl	avs_f_v
	str	w0, [x20, 56]
	ldr	x2, .LC157
	mov	w1, 8
	mov	x0, x19
	bl	avs_f_v
	str	w0, [x20, 60]
	b	.L163
	.size	AVS_sequence_display_extension, .-AVS_sequence_display_extension
	.align	3
.LC145:
	.xword	.LC144
	.align	3
.LC147:
	.xword	.LC146
	.align	3
.LC149:
	.xword	.LC148
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
.LC160:
	.xword	.LC26
	.align	3
.LC162:
	.xword	.LC161
	.align	3
.LC163:
	.xword	.LC34
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_copyright_extension
	.type	AVS_copyright_extension, %function
AVS_copyright_extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, [x20, 512]
	mov	w1, 4
	ldr	x2, .LC164
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC166
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC168
	mov	w1, 8
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC170
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC171
	mov	w1, 7
	mov	x0, x19
	bl	avs_f_v
	ldr	x21, .LC172
	mov	w1, 1
	mov	x0, x19
	mov	x2, x21
	bl	avs_f_v
	ldr	x2, .LC174
	mov	w1, 20
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x21
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC176
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x21
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC178
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x0, x19
	bl	AVS_next_start_code
	ldr	w1, [x20, 124]
	mov	w0, 1
	orr	w1, w1, 2097152
	str	w1, [x20, 124]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_copyright_extension, .-AVS_copyright_extension
	.align	3
.LC164:
	.xword	.LC144
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
.LC171:
	.xword	.LC34
	.align	3
.LC172:
	.xword	.LC26
	.align	3
.LC174:
	.xword	.LC173
	.align	3
.LC176:
	.xword	.LC175
	.align	3
.LC178:
	.xword	.LC177
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_camera_parameters_extension
	.type	AVS_camera_parameters_extension, %function
AVS_camera_parameters_extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldr	x19, [x21, 512]
	mov	w1, 4
	ldr	x2, .LC179
	mov	x0, x19
	bl	avs_f_v
	ldr	x22, .LC180
	mov	w1, 1
	mov	x0, x19
	mov	x2, x22
	bl	avs_f_v
	ldr	x2, .LC182
	mov	w1, 7
	mov	x0, x19
	bl	avs_f_v
	ldr	x20, .LC183
	mov	w1, 1
	mov	x0, x19
	mov	x2, x20
	bl	avs_f_v
	ldr	x2, .LC185
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC187
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC189
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC191
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC193
	mov	w1, 16
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC195
	mov	w1, 16
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC197
	mov	w1, 16
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC199
	mov	w1, 16
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC201
	mov	w1, 16
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC203
	mov	w1, 16
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC205
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC207
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC209
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC211
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC213
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	x2, .LC215
	mov	w1, 22
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x20
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x22
	mov	w1, 32
	mov	x0, x19
	bl	avs_f_v
	mov	x0, x19
	bl	AVS_next_start_code
	ldr	w1, [x21, 124]
	mov	w0, 1
	orr	w1, w1, 4194304
	str	w1, [x21, 124]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_camera_parameters_extension, .-AVS_camera_parameters_extension
	.align	3
.LC179:
	.xword	.LC144
	.align	3
.LC180:
	.xword	.LC34
	.align	3
.LC182:
	.xword	.LC181
	.align	3
.LC183:
	.xword	.LC26
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
	.align	3
.LC213:
	.xword	.LC212
	.align	3
.LC215:
	.xword	.LC214
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_picture_display_extension
	.type	AVS_picture_display_extension, %function
AVS_picture_display_extension:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x26, x0
	mov	x0, x30
	mov	x22, x1
	bl	_mcount
	ldr	x19, [x26, 512]
	mov	w1, 4
	ldr	x2, .LC216
	mov	x0, x19
	bl	avs_f_v
	ldrb	w0, [x22, 15]
	cmp	w0, 1
	beq	.L184
	ldrb	w0, [x22, 77]
	cbnz	w0, .L185
.L169:
	mov	w0, 1
	str	w0, [x22, 4]
.L171:
	ldr	x25, .LC218
	mov	w20, 0
	ldr	x23, .LC219
	ldr	x24, .LC221
	.p2align 2
.L173:
	add	x21, x22, x20, sxtw 2
	mov	x2, x25
	mov	w1, 16
	mov	x0, x19
	add	w20, w20, 1
	bl	avs_f_v
	str	w0, [x21, 348]
	mov	w1, 1
	mov	x2, x23
	mov	x0, x19
	bl	avs_f_v
	mov	x2, x24
	mov	w1, 16
	mov	x0, x19
	bl	avs_f_v
	str	w0, [x21, 360]
	mov	x2, x23
	mov	w1, 1
	mov	x0, x19
	bl	avs_f_v
	ldr	w0, [x22, 4]
	cmp	w0, w20
	bgt	.L173
	mov	x0, x19
	bl	AVS_next_start_code
	ldr	w0, [x26, 124]
	orr	w0, w0, 524288
	str	w0, [x26, 124]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L185:
	ldrb	w0, [x22, 79]
	cmp	w0, 1
	beq	.L172
.L170:
	mov	w0, 2
	str	w0, [x22, 4]
	b	.L171
	.p2align 3
.L184:
	ldrb	w0, [x22, 79]
	cmp	w0, 1
	bne	.L169
	ldrb	w0, [x22, 78]
	cmp	w0, 1
	bne	.L170
	.p2align 2
.L172:
	mov	w0, 3
	str	w0, [x22, 4]
	b	.L171
	.size	AVS_picture_display_extension, .-AVS_picture_display_extension
	.align	3
.LC216:
	.xword	.LC144
	.align	3
.LC218:
	.xword	.LC217
	.align	3
.LC219:
	.xword	.LC26
	.align	3
.LC221:
	.xword	.LC220
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_extension
	.type	AVS_extension, %function
AVS_extension:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x20, x0
	mov	x0, x30
	mov	x21, x1
	bl	_mcount
	ldr	x19, [x20, 512]
	mov	w1, 32
	ldr	x2, .LC223
	mov	x0, x19
	bl	avs_f_v
	mov	w1, 4
	mov	x0, x19
	bl	BsShow
	sub	w0, w0, #2
	cmp	w0, 9
	bls	.L194
.L187:
	mov	w1, 4
	mov	x0, x19
	bl	BsSkip
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L194:
	ldr	x1, .LC224
	ldrb	w0, [x1,w0,uxtw]
	adr	x1, .Lrtx189
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx189:
	.section	.rodata
	.align	0
	.align	2
.L189:
	.byte	(.L188 - .Lrtx189) / 4
	.byte	(.L187 - .Lrtx189) / 4
	.byte	(.L190 - .Lrtx189) / 4
	.byte	(.L187 - .Lrtx189) / 4
	.byte	(.L187 - .Lrtx189) / 4
	.byte	(.L191 - .Lrtx189) / 4
	.byte	(.L187 - .Lrtx189) / 4
	.byte	(.L187 - .Lrtx189) / 4
	.byte	(.L187 - .Lrtx189) / 4
	.byte	(.L192 - .Lrtx189) / 4
	.text
	.p2align 3
.L192:
	mov	x1, x21
	mov	x0, x20
	bl	AVS_camera_parameters_extension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L191:
	mov	x1, x21
	mov	x0, x20
	bl	AVS_picture_display_extension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L190:
	mov	x1, x21
	mov	x0, x20
	bl	AVS_copyright_extension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L188:
	mov	x1, x21
	mov	x0, x20
	bl	AVS_sequence_display_extension
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_extension, .-AVS_extension
	.align	3
.LC223:
	.xword	.LC222
	.align	3
.LC224:
	.xword	.L189
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_extension_and_userdata
	.type	AVS_extension_and_userdata, %function
AVS_extension_and_userdata:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x23, x0
	mov	x0, x30
	add	x21, x23, 12288
	mov	w24, w1
	add	x22, x21, 2648
	bl	_mcount
	mov	w20, 178
	add	x21, x21, 3536
	ldr	x19, [x22, 512]
	b	.L199
	.p2align 3
.L198:
	mov	w1, 32
	mov	x0, x19
	bl	BsShow
	uxtb	w0, w0
	cmp	w0, 178
	beq	.L203
.L199:
	mov	x0, x19
	bl	BsResidBits
	cmp	w0, 40
	mov	x0, x19
	ble	.L204
.L200:
	bl	AVS_next_start_code
	mov	w1, 32
	mov	x0, x19
	bl	BsShow
	uxtb	w0, w0
	cmp	w0, 181
	ccmp	w0, w20, 4, ne
	bne	.L201
	cmp	w0, 181
	bne	.L198
	mov	x1, x21
	mov	x0, x22
	bl	AVS_extension
	mov	w1, 32
	mov	x0, x19
	bl	BsShow
	uxtb	w0, w0
	cmp	w0, 178
	bne	.L199
	.p2align 2
.L203:
	mov	w1, w24
	mov	x0, x23
	bl	AVS_user_data
	mov	x0, x19
	bl	BsResidBits
	cmp	w0, 40
	mov	x0, x19
	bgt	.L200
.L204:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L201:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.size	AVS_extension_and_userdata, .-AVS_extension_and_userdata
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_AllocateVHB
	.type	AVS_AllocateVHB, %function
AVS_AllocateVHB:
	stp	x29, x30, [sp, -128]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	w3, [x19, 15104]
	mov	w0, 8160
	ldr	w20, [x19, 15100]
	sub	w2, w3, #32
	sub	w1, w20, #32
	cmp	w2, w0
	ccmp	w1, w0, 2, ls
	bhi	.L238
	ldr	x0, [x19, 16]
	ldr	w21, [x0, 708]
	ldr	w1, [x0, 28]
	cmp	w1, 25
	cbnz	w21, .L208
	beq	.L239
.L227:
	mov	w21, 4
	mov	w23, 5
	mov	w22, w21
.L209:
	ldr	x0, .LC229
	mov	x2, 32
	mov	w1, 0
	str	w3, [x29, 76]
	ldr	x4, [x0, 96]
	add	x0, x29, 96
	blr	x4
	strb	wzr, [x29, 97]
	ldr	w3, [x29, 76]
	ldr	x0, [x19, 16]
	stp	w20, w3, [x29, 120]
	stp	w20, w3, [x29, 104]
	ldr	w0, [x0, 28]
	cmp	w0, 24
	beq	.L218
	strb	w22, [x29, 99]
	sxtb	w21, w21
	strb	w23, [x29, 101]
.L222:
	ldr	w0, [x19, 4]
	add	x1, x29, 96
	strb	w21, [x29, 102]
	strb	wzr, [x29, 98]
	bl	FSP_ConfigInstance
	mov	w21, w0
	cbnz	w0, .L219
	ldr	x1, [x19, 16]
	add	x3, x29, 92
	ldr	w0, [x19, 4]
	ldr	w2, [x1, 24]
	ldr	w1, [x1, 20]
	bl	FSP_ConfigFrameBuf
	cmp	w0, 2
	beq	.L240
	cbnz	w0, .L241
	mov	w21, 1
	str	w21, [x19, 8]
	b	.L230
	.p2align 3
.L238:
	ldr	x1, .LC226
	mov	w2, w20
	mov	w0, 0
	mov	w21, 0
	bl	dprint_vfmw
.L230:
	mov	w0, w21
	ldr	x23, [sp, 48]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 128
	ret
	.p2align 3
.L208:
	bne	.L227
	ldr	w4, [x0, 668]
	ldr	w5, [x0, 672]
	cmp	w20, w4
	bhi	.L215
	cmp	w3, w5
	bhi	.L215
.L216:
	ldr	w2, [x0, 696]
	mov	w21, 1
	ldr	w1, [x0, 692]
	add	w22, w1, 2
	cbz	w2, .L217
	add	w21, w1, w21
	mov	w1, 17
	cmp	w21, w1
	csel	w21, w21, w1, le
.L217:
	ldrsb	w23, [x0, 716]
	b	.L209
	.p2align 3
.L219:
	ldr	x1, .LC233
	mov	w0, 0
	mov	w21, 0
	bl	dprint_vfmw
	b	.L230
	.p2align 3
.L241:
	ldr	x1, .LC231
	mov	w0, 0
	bl	dprint_vfmw
	b	.L230
	.p2align 3
.L218:
	mov	w0, 1
	strb	w23, [x29, 101]
	strb	w0, [x29, 99]
	mov	w21, 1
	b	.L222
	.p2align 3
.L239:
	ldr	w4, [x0, 668]
	ldr	w5, [x0, 672]
	cmp	w20, w4
	bhi	.L211
	cmp	w5, w3
	bcc	.L211
	ldr	w21, [x19, 8]
	cmp	w21, 1
	bne	.L216
	b	.L230
	.p2align 3
.L215:
	ldr	x1, .LC228
	mov	w2, w20
	mov	w0, 0
	mov	w21, 0
	bl	dprint_vfmw
	b	.L230
	.p2align 3
.L211:
	ldr	x1, .LC228
	mov	w2, w20
	mov	w0, 0
	bl	dprint_vfmw
	b	.L230
.L240:
	add	x0, x19, 12288
	mov	w21, 3
	add	x0, x0, 3912
	bl	ResetVoQueue
	b	.L230
	.size	AVS_AllocateVHB, .-AVS_AllocateVHB
	.align	3
.LC226:
	.xword	.LC225
	.align	3
.LC228:
	.xword	.LC227
	.align	3
.LC229:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC231:
	.xword	.LC230
	.align	3
.LC233:
	.xword	.LC232
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_StartDecode
	.type	AVS_StartDecode, %function
AVS_StartDecode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x22, x21, 16384
	add	x19, x21, 32
	bl	_mcount
	add	x20, x22, 592
	ldr	w0, [x22, 592]
	strb	w0, [x21, 32]
	ldr	w0, [x20, 4]
	strb	w0, [x19, 1]
	ldr	w0, [x20, 8]
	strb	w0, [x19, 2]
	ldr	w0, [x20, 12]
	strb	w0, [x19, 3]
	ldr	w0, [x20, 16]
	strb	w0, [x19, 4]
	ldr	w0, [x20, 28]
	str	w0, [x19, 8]
	ldr	w0, [x20, 32]
	str	w0, [x19, 68]
	ldr	w0, [x20, 52]
	str	w0, [x19, 12]
	ldr	w0, [x20, 180]
	str	w0, [x19, 80]
	ldr	w0, [x20, 192]
	str	w0, [x19, 84]
	ldr	w0, [x20, 184]
	str	w0, [x19, 88]
	ldr	w0, [x20, 196]
	str	w0, [x19, 92]
	ldr	w0, [x20, 188]
	str	w0, [x19, 96]
	ldr	w0, [x20, 200]
	str	w0, [x19, 100]
	ldr	w0, [x20, 60]
	strh	w0, [x19, 64]
	ldr	w0, [x20, 56]
	strh	w0, [x19, 66]
	ldr	w0, [x20, 64]
	strb	w0, [x19, 39]
	ldr	w0, [x20, 68]
	strb	w0, [x19, 40]
	ldr	w0, [x20, 104]
	strb	w0, [x19, 16]
	ldr	w0, [x20, 108]
	strb	w0, [x19, 17]
	ldr	w0, [x20, 72]
	strb	w0, [x19, 18]
	ldr	w0, [x20, 76]
	strb	w0, [x19, 19]
	ldr	w0, [x20, 84]
	strb	w0, [x19, 20]
	ldr	w0, [x20, 88]
	strb	w0, [x19, 21]
	ldr	w0, [x20, 92]
	strb	w0, [x19, 22]
	ldr	w0, [x20, 96]
	strb	w0, [x19, 23]
	ldr	w0, [x20, 100]
	strb	w0, [x19, 24]
	ldr	w0, [x20, 112]
	strb	w0, [x19, 25]
	ldr	w0, [x20, 116]
	strb	w0, [x19, 26]
	ldr	w0, [x20, 120]
	strb	w0, [x19, 27]
	ldr	w0, [x20, 124]
	strb	w0, [x19, 28]
	ldr	w0, [x20, 128]
	strb	w0, [x19, 29]
	ldr	w0, [x20, 172]
	strb	w0, [x19, 30]
	ldr	w0, [x20, 80]
	strb	w0, [x19, 31]
	ldr	w0, [x20, 136]
	strb	w0, [x19, 32]
	ldr	w0, [x20, 132]
	strb	w0, [x19, 33]
	ldr	w0, [x20, 152]
	strb	w0, [x19, 34]
	ldr	w0, [x20, 148]
	strb	w0, [x19, 35]
	ldr	w0, [x20, 144]
	strb	w0, [x19, 36]
	ldr	w0, [x20, 140]
	strb	w0, [x19, 37]
	ldr	w0, [x20, 176]
	strb	w0, [x19, 38]
	ldr	w0, [x20, 156]
	str	w0, [x19, 14444]
	ldr	w0, [x20, 160]
	str	w0, [x19, 14448]
	ldr	w0, [x20, 164]
	str	w0, [x19, 14452]
	ldr	w0, [x20, 232]
	str	w0, [x19, 14460]
	ldr	w0, [x20, 244]
	str	w0, [x19, 14464]
	ldr	x1, [x21, 15016]
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetLogicFs
	cbz	x0, .L257
	ldr	x1, [x0, 688]
	add	x2, x21, 12288
	add	x5, x2, 2348
	add	x3, x22, 972
	add	x4, x2, 2604
	ldr	w1, [x1, 32]
	str	w1, [x19, 14860]
	ldr	x1, [x0, 688]
	ldr	w1, [x1, 76]
	str	w1, [x19, 14868]
	ldr	x1, [x0, 688]
	ldr	w1, [x1, 60]
	str	w1, [x19, 14872]
	mov	x1, x5
	ldr	x0, [x0, 688]
	ldr	w0, [x0, 64]
	str	w0, [x19, 14876]
	ldr	w0, [x20, 52]
	str	w0, [x19, 14456]
	ldr	w0, [x20, 168]
	str	w0, [x19, 14468]
	ldr	w0, [x20, 376]
	str	w0, [x19, 14472]
	ldr	w0, [x20, 204]
	strb	w0, [x19, 41]
	ldr	w0, [x20, 208]
	strb	w0, [x19, 42]
	ldr	w0, [x20, 216]
	strb	w0, [x19, 43]
	ldr	w0, [x20, 212]
	strb	w0, [x19, 44]
	ldr	w0, [x20, 220]
	strb	w0, [x19, 45]
	ldr	w0, [x20, 224]
	strb	w0, [x19, 46]
	ldr	w0, [x20, 228]
	strb	w0, [x19, 47]
	.p2align 2
.L245:
	ldrsh	w0, [x3], 2
	str	w0, [x1], 4
	cmp	x1, x4
	bne	.L245
	ldr	w0, [x22, 628]
	str	w0, [x19, 14880]
	add	x0, x2, 2220
	ldr	w1, [x22, 632]
	str	w1, [x19, 14884]
	ldr	w1, [x22, 636]
	str	w1, [x19, 14888]
	ldr	w1, [x22, 640]
	str	w1, [x19, 14892]
	.p2align 2
.L246:
	ldr	w1, [x0, 2716]
	str	w1, [x0], 4
	cmp	x0, x5
	bne	.L246
	ldr	w0, [x21, 15744]
	ldr	x1, [x21, 16]
	add	w0, w0, 1
	str	x19, [x21, 24]
	str	w0, [x21, 15744]
	ldr	w0, [x1, 864]
	cmp	w0, 1
	beq	.L258
	cmp	w0, 2
	beq	.L259
.L248:
	ldr	w2, [x1, 592]
	mov	w0, 1
	str	w2, [x19, 14896]
	ldr	w1, [x1, 632]
	str	w1, [x19, 14900]
.L244:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
.L258:
	cbz	x19, .L248
	ldr	x3, [x21, 15016]
	ldrb	w0, [x3, 1]
	cmp	w0, 2
	bne	.L248
	str	xzr, [x21, 24]
	mov	w2, 0
	ldr	w0, [x21, 4]
	ldr	w1, [x3, 4]
	bl	FSP_SetDisplay
	mov	w0, 0
	b	.L244
	.p2align 3
.L259:
	ldr	w0, [x1, 868]
	cmp	w0, wzr
	ccmp	x19, xzr, 4, gt
	beq	.L248
	ldr	x3, [x21, 15016]
	ldrb	w0, [x3, 1]
	cmp	w0, 2
	bne	.L248
	str	xzr, [x21, 24]
	mov	w2, 0
	ldr	w0, [x21, 4]
	ldr	w1, [x3, 4]
	bl	FSP_SetDisplay
	ldr	x2, [x21, 16]
	mov	w0, 0
	ldr	w1, [x2, 868]
	sub	w1, w1, #1
	str	w1, [x2, 868]
	b	.L244
.L257:
	ldr	x1, .LC237
	mov	w2, 2197
	bl	dprint_vfmw
	mov	w0, 0
	b	.L244
	.size	AVS_StartDecode, .-AVS_StartDecode
	.align	3
.LC237:
	.xword	.LC236
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_SetImgFormat
	.type	AVS_SetImgFormat, %function
AVS_SetImgFormat:
	stp	x29, x30, [sp, -96]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 12288
	bl	_mcount
	ldrb	w1, [x20, 2803]
	ldrb	w24, [x20, 2834]
	cmp	w1, 1
	ldr	w25, [x20, 3132]
	beq	.L267
	ldrb	w0, [x20, 2864]
	cmp	w0, 1
	cset	w23, ne
.L261:
	ldrb	w0, [x20, 2801]
	mov	w26, 0
	ldrb	w22, [x20, 2866]
	sub	w0, w0, #1
	uxtb	w0, w0
	cmp	w0, 3
	bhi	.L262
	ldr	x1, .LC238
	uxtb	x0, w0
	ldr	w26, [x1, x0, lsl 2]
.L262:
	add	x27, x20, 2648
	ldr	x1, [x27, 80]
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L270
	ldrb	w1, [x0, 124]
	bfi	w1, w25, 0, 2
	and	w25, w25, 3
	and	w1, w1, -29
	bfi	w1, w24, 5, 3
	strb	w1, [x0, 124]
	ldrb	w1, [x0, 125]
	bfi	w1, w23, 0, 2
	orr	w1, w1, 12
	bfi	w1, w22, 4, 2
	strb	w1, [x0, 125]
	ldr	w1, [x0, 124]
	bfi	w1, w26, 14, 3
	str	w1, [x0, 124]
	lsr	w2, w1, 16
	mov	w1, w26
	and	w2, w2, -3
	strb	w2, [x0, 126]
	ldr	x3, [x21, 16]
	ldr	w3, [x3, 592]
	cmp	w3, 1
	cset	w3, eq
	bfi	w2, w3, 2, 1
	strb	w2, [x0, 126]
	ldr	w2, [x27, 800]
	str	w2, [x0, 184]
	stp	w25, w25, [x0, 116]
	bl	SetAspectRatio
	ldr	w1, [x20, 2812]
	str	w1, [x19, 128]
	ldr	w0, [x20, 2816]
	str	w0, [x19, 132]
	ldr	x1, [x21, 16]
	ldr	w1, [x1, 28]
	cmp	w1, 25
	beq	.L271
.L265:
	mov	w0, 6
	str	w0, [x19, 412]
	mov	w0, 4
	mov	w1, 8
	ldrb	w3, [x20, 2865]
	mov	w2, 1
	str	w1, [x19, 416]
	cmp	w3, 1
	strb	w2, [x19, 407]
	strb	w2, [x19, 405]
	csel	w0, wzr, w0, eq
	str	w1, [x19, 420]
	strb	w0, [x19, 400]
	str	w1, [x19, 424]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	ret
	.p2align 3
.L267:
	mov	w23, 0
	b	.L261
	.p2align 3
.L271:
	ldr	w3, [x19, 164]
	add	w0, w0, 15
	lsr	w2, w0, 4
	ldr	w0, [x19, 44]
	lsl	w1, w3, 4
	ldr	x4, [x19, 544]
	add	w5, w3, w0
	str	w0, [x19, 28]
	mul	w1, w2, w1
	str	w0, [x19, 60]
	add	w0, w1, w0
	str	w5, [x19, 36]
	add	x1, x4, x1, sxtw
	add	w3, w3, w0
	str	x1, [x19, 552]
	str	x4, [x19, 560]
	str	w0, [x19, 32]
	str	w3, [x19, 40]
	str	w0, [x19, 48]
	bl	MEM_Phy2Vir
	str	x0, [x19, 568]
	ldr	w1, [x19, 32]
	str	w1, [x19, 64]
	b	.L265
	.p2align 3
.L270:
	ldr	x1, .LC240
	mov	w2, 2324
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	ret
	.size	AVS_SetImgFormat, .-AVS_SetImgFormat
	.align	3
.LC238:
	.xword	.LANCHOR0
	.align	3
.LC240:
	.xword	.LC239
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_GetImageBuffer
	.type	AVS_GetImageBuffer, %function
AVS_GetImageBuffer:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x22, x20, 12288
	bl	_mcount
	ldr	w0, [x20, 16168]
	cmp	w0, 2
	beq	.L273
	ldr	w19, [x22, 3176]
	add	x2, x22, 2648
	add	x21, x22, 2648
	add	w1, w19, 1
	sxtw	x19, w19
	asr	w3, w1, 31
	lsl	x0, x19, 2
	lsr	w3, w3, 30
	sub	x19, x0, x19
	add	w1, w1, w3
	and	w1, w1, 3
	add	x19, x2, x19, lsl 2
	sub	w1, w1, w3
	add	x19, x19, 20
	str	w1, [x22, 3176]
	str	x19, [x22, 2728]
	mov	w1, 1
	ldr	w0, [x20, 4]
	bl	FSP_NewLogicFs
	str	w0, [x19, 4]
	ldr	x0, [x21, 80]
	ldr	w1, [x0, 4]
	tbnz	w1, #31, .L292
.L275:
	ldr	w0, [x20, 4]
	bl	FSP_GetLogicFs
	mov	x19, x0
	cbz	x0, .L293
	ldr	x2, [x21, 80]
	mov	w0, 18
	ldr	x1, .LC245
	ldr	w2, [x2, 4]
	bl	dprint_vfmw
	ldr	x0, [x19, 680]
	cbz	x0, .L279
	ldr	x1, [x19, 688]
	cbz	x1, .L279
	ldr	x2, [x19, 696]
	cbz	x2, .L279
	ldr	w3, [x1, 16]
	ldr	w4, [x2, 16]
	ldr	x1, .LC247
	ldr	w2, [x0, 16]
	mov	w0, 18
	bl	dprint_vfmw
.L279:
	mov	w0, 1
	str	wzr, [x19, 192]
.L277:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L273:
	add	x19, x22, 2716
	str	x19, [x22, 2728]
	mov	w1, 1
	add	x21, x22, 2648
	ldr	w0, [x20, 4]
	bl	FSP_NewLogicFs
	str	w0, [x19, 4]
	ldr	x0, [x21, 80]
	ldr	w1, [x0, 4]
	tbz	w1, #31, .L275
.L292:
	ldr	x1, .LC242
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x1, [x21, 88]
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	x19, x0
	cbz	x0, .L276
	ldr	x1, [x21, 80]
	mov	w2, 1
	ldr	w0, [x20, 4]
	add	x23, x22, 2656
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x21, 88]
	mov	w2, 1
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x21, 96]
	mov	w2, 1
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x21, 104]
	mov	w2, 1
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	w0, [x20, 4]
	ldr	x1, [x19, 600]
	bl	FreeUsdByDec
	ldr	w0, [x20, 4]
	ldr	x1, [x19, 608]
	bl	FreeUsdByDec
	ldr	w0, [x20, 4]
	ldr	x1, [x19, 616]
	bl	FreeUsdByDec
	ldr	w0, [x20, 4]
	ldr	x1, [x19, 624]
	bl	FreeUsdByDec
	add	x0, x19, 512
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	stp	x23, x23, [x21, 80]
	stp	x23, x23, [x21, 96]
	ldr	w0, [x20, 4]
	bl	FSP_GetNullLogicFs
	str	w0, [x23, 4]
.L276:
	str	wzr, [x22, 3444]
	add	x1, x22, 3912
	ldr	w0, [x20, 4]
	bl	FSP_ClearNotInVoQueue
	ldr	x23, [sp, 48]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L293:
	ldr	x1, .LC243
	mov	w2, 2477
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, 0
	b	.L277
	.size	AVS_GetImageBuffer, .-AVS_GetImageBuffer
	.align	3
.LC242:
	.xword	.LC241
	.align	3
.LC243:
	.xword	.LC236
	.align	3
.LC245:
	.xword	.LC244
	.align	3
.LC247:
	.xword	.LC246
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_OutputOneFrame
	.type	AVS_OutputOneFrame, %function
AVS_OutputOneFrame:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x19, 4]
	ldr	w1, [x20, 4]
	bl	FSP_GetFsImagePtr
	mov	x21, x0
	cbz	x0, .L300
	ldr	w0, [x19, 4]
	mov	w2, 1
	ldr	w1, [x20, 4]
	bl	FSP_SetDisplay
	add	x3, x19, 12288
	ldr	w0, [x19, 4]
	mov	x4, x21
	add	x3, x3, 3912
	mov	x2, x19
	mov	w1, 6
	bl	InsertImgToVoQueue
	cmp	w0, 1
	beq	.L296
	ldr	w0, [x19, 4]
	mov	w2, 0
	ldr	w1, [x20, 4]
	bl	FSP_SetDisplay
	ldr	x1, .LC251
	mov	w0, 1
	ldr	w2, [x20, 4]
	bl	dprint_vfmw
	mov	w0, 0
.L296:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L300:
	ldr	x1, .LC249
	mov	w2, 2518
	mov	w0, 0
	bl	dprint_vfmw
	ldr	x21, [sp, 32]
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_OutputOneFrame, .-AVS_OutputOneFrame
	.align	3
.LC249:
	.xword	.LC248
	.align	3
.LC251:
	.xword	.LC250
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdateTableIdx2Dist
	.type	AVS_UpdateTableIdx2Dist, %function
AVS_UpdateTableIdx2Dist:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 217]
	cmp	w0, 1
	ldr	w0, [x19, 484]
	beq	.L313
	cbnz	w0, .L307
	ldr	x0, [x19, 88]
	ldr	w0, [x0, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 568]
.L306:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L307:
	cmp	w0, 1
	bne	.L308
	ldr	x0, [x19, 96]
	add	x1, x19, 8
	cmp	x0, x1
	beq	.L314
	ldr	w0, [x0, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 564]
.L310:
	ldp	x2, x1, [x19, 80]
	add	w0, w0, 1
	str	w0, [x19, 560]
	ldr	w1, [x1, 8]
	str	w0, [x19, 580]
	lsl	w0, w1, 1
	str	w0, [x19, 556]
	add	w1, w0, 1
	str	w0, [x19, 576]
	str	w1, [x19, 552]
	str	w1, [x19, 572]
	ldr	w0, [x2, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 568]
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L313:
	cmp	w0, 1
	beq	.L315
	cmp	w0, 2
	bne	.L306
	ldr	x0, [x19, 96]
	add	x1, x19, 8
	cmp	x0, x1
	beq	.L305
	ldr	w0, [x0, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 552]
.L305:
	ldr	x0, [x19, 88]
	ldr	w0, [x0, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 560]
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L308:
	cmp	w0, 2
	bne	.L306
	ldr	x0, [x19, 96]
	add	x1, x19, 8
	cmp	x0, x1
	beq	.L316
	ldr	w1, [x0, 8]
	lsl	w1, w1, 1
	str	w1, [x19, 556]
.L312:
	ldr	x0, [x19, 88]
	add	w2, w1, 1
	str	w2, [x19, 552]
	ldr	w0, [x0, 8]
	str	w1, [x19, 572]
	lsl	w0, w0, 1
	str	w2, [x19, 568]
	str	w0, [x19, 560]
	add	w1, w0, 1
	str	w0, [x19, 576]
	mov	w0, 1
	str	w1, [x19, 564]
	str	w1, [x19, 580]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L315:
	ldp	x0, x1, [x19, 88]
	add	x2, x19, 8
	cmp	x1, x2
	ldr	w0, [x0, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 552]
	beq	.L306
	ldr	w0, [x1, 8]
	lsl	w0, w0, 1
	str	w0, [x19, 556]
	b	.L306
	.p2align 3
.L314:
	ldr	w0, [x19, 564]
	b	.L310
	.p2align 3
.L316:
	ldr	w1, [x19, 556]
	b	.L312
	.size	AVS_UpdateTableIdx2Dist, .-AVS_UpdateTableIdx2Dist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdateTableMvEScale
	.type	AVS_UpdateTableMvEScale, %function
AVS_UpdateTableMvEScale:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 217]
	cmp	w0, 1
	beq	.L377
	ldr	w5, [x19, 484]
	cbz	w5, .L378
	cmp	w5, 1
	bne	.L330
	ldr	x12, [x19, 80]
	mov	w9, 0
	mov	w7, 4
	mov	w11, 0
	mov	w10, 512
.L335:
	ldr	w6, [x12, 8]
	lsl	w5, w9, 2
	sub	w5, w5, w9
	mov	w8, w9
	add	w6, w11, w6, lsl 1
.L331:
	add	x0, x19, x8, sxtw 2
	mov	w1, w9
	ldr	w4, [x0, 552]
	sub	w4, w6, w4
	and	w4, w4, 511
.L333:
	add	x0, x19, x1, sxtw 2
	add	w3, w5, w1
	mov	w2, 1
	add	x3, x19, x3, sxtw 2
	add	w1, w1, w2
	ldr	w0, [x0, 552]
	sub	w0, w6, w0
	ands	w0, w0, 511
	beq	.L332
	sdiv	w2, w10, w0
.L332:
	mul	w2, w4, w2
	cmp	w1, w7
	str	w2, [x3, 584]
	bne	.L333
	add	w8, w8, 1
	add	w5, w5, 4
	cmp	w8, w7
	bne	.L331
	add	w11, w11, 1
	add	w7, w7, 4
	cmp	w11, 2
	add	w9, w9, 4
	bne	.L335
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L378:
	mov	w0, 512
	str	w0, [x19, 648]
.L322:
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L377:
	ldr	x1, [x19, 80]
	ldr	w2, [x19, 484]
	ldr	w1, [x1, 8]
	cmp	w2, 1
	lsl	w1, w1, 1
	beq	.L379
	cmp	w2, 2
	bne	.L322
	ldr	w2, [x19, 552]
	sub	w2, w1, w2
	ands	w2, w2, 511
	beq	.L327
	mov	w0, 512
	sdiv	w0, w0, w2
.L327:
	ldr	w3, [x19, 560]
	mul	w0, w2, w0
	sub	w1, w3, w1
	str	w0, [x19, 584]
	ands	w1, w1, 511
	mov	w0, 1
	beq	.L328
	mov	w0, 512
	sdiv	w0, w0, w1
.L328:
	mul	w1, w1, w0
	str	w1, [x19, 600]
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L330:
	cmp	w5, 2
	bne	.L322
	ldr	x9, [x19, 80]
	add	x4, x19, 564
	mov	w7, 9
	mov	w6, 0
	mov	w8, 512
.L345:
	ldr	w1, [x9, 8]
	lsl	w10, w6, 2
	lsl	w3, w6, 3
	add	w1, w6, w1, lsl 1
.L336:
	add	x11, x19, x10, sxtw 2
	ldr	w2, [x4, -12]
	mov	w12, 1
	add	x13, x19, x3, sxtw 2
	sub	w2, w1, w2
	ldr	w0, [x11, 552]
	ands	w2, w2, 511
	mov	w11, w12
	sub	w0, w1, w0
	and	w0, w0, 511
	beq	.L338
	sdiv	w11, w8, w2
.L338:
	mul	w11, w11, w0
	str	w11, [x13, 584]
	ldr	w2, [x4, -8]
	sub	w2, w1, w2
	ands	w2, w2, 511
	beq	.L339
	sdiv	w12, w8, w2
.L339:
	add	w2, w3, 1
	add	w10, w10, 1
	mul	w0, w0, w12
	add	x2, x19, x2, sxtw 2
	cmp	w5, w10
	add	w3, w3, 2
	str	w0, [x2, 584]
	bne	.L336
	sub	w10, w7, #4
	mov	w12, w5
.L337:
	add	x11, x19, x12, sxtw 2
	ldr	w2, [x4, -4]
	sub	w3, w10, #1
	mov	w13, 1
	sub	w2, w2, w1
	ldr	w0, [x11, 552]
	ands	w2, w2, 511
	add	x3, x19, x3, sxtw 2
	mov	w11, w13
	sub	w0, w0, w1
	and	w0, w0, 511
	beq	.L342
	sdiv	w11, w8, w2
.L342:
	mul	w11, w11, w0
	str	w11, [x3, 584]
	ldr	w2, [x4]
	sub	w2, w2, w1
	ands	w2, w2, 511
	beq	.L343
	sdiv	w13, w8, w2
.L343:
	add	x2, x19, x10, sxtw 2
	add	w10, w10, 2
	mul	w0, w0, w13
	cmp	w10, w7
	add	w12, w12, 1
	str	w0, [x2, 584]
	bne	.L337
	add	w6, w6, 1
	add	w7, w7, 8
	cmp	w6, 2
	add	x4, x4, 16
	add	w5, w5, 4
	bne	.L345
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L379:
	add	x5, x19, 552
	add	x3, x19, 588
	add	x7, x19, 620
	mov	w8, 512
.L321:
	ldr	w2, [x19, 552]
	mov	w6, 1
	ldr	w0, [x5]
	mov	w4, w6
	sub	w2, w1, w2
	ands	w2, w2, 511
	sub	w0, w1, w0
	and	w0, w0, 511
	beq	.L323
	sdiv	w4, w8, w2
.L323:
	mul	w4, w4, w0
	str	w4, [x3, -4]
	ldr	w2, [x19, 556]
	sub	w2, w1, w2
	ands	w2, w2, 511
	beq	.L324
	sdiv	w6, w8, w2
.L324:
	mul	w0, w0, w6
	str	w0, [x3], 16
	add	x5, x5, 4
	cmp	x7, x3
	bne	.L321
	b	.L322
	.size	AVS_UpdateTableMvEScale, .-AVS_UpdateTableMvEScale
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdateTableDirectScale
	.type	AVS_UpdateTableDirectScale, %function
AVS_UpdateTableDirectScale:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldrb	w0, [x19, 217]
	cmp	w0, 1
	beq	.L403
	ldr	x7, [x19, 88]
	add	x5, x19, 8
	add	x3, x19, 712
	mov	w1, 1
	mov	w2, 0
	mov	w9, 16384
	ldr	w6, [x7, 8]
	mov	w8, 32
	lsl	w6, w6, 1
.L387:
	sub	w0, w1, #1
	and	w4, w1, 1
	add	w0, w0, w0, lsr 31
	asr	w0, w0, 1
	add	w0, w0, 1
	add	x0, x19, x0, sxtw 3
	ldr	x0, [x0, 88]
	cmp	x0, x5
	beq	.L385
	ldr	w2, [x0, 8]
	add	w2, w4, w2, lsl 1
	sub	w0, w6, w2
	ands	w0, w0, 511
	bne	.L386
	str	w8, [x3]
.L385:
	add	w1, w1, 1
	add	x3, x3, 4
	cmp	w1, 5
	bne	.L387
	ldr	w9, [x19, 840]
	ldr	w8, [x7, 8]
	lsl	w8, w8, 1
	cbz	w9, .L404
	add	x6, x19, 728
	mov	w3, 1
	mov	w4, 0
	mov	w10, 32
	mov	w11, 16384
	.p2align 2
.L397:
	cbz	w9, .L390
	add	w0, w4, w4, lsr 31
	asr	w0, w0, 1
	add	w0, w0, 1
	add	x0, x19, x0, sxtw 3
	ldr	x0, [x0, 88]
	cmp	x0, x5
	beq	.L391
	ldr	w2, [x0, 8]
	and	w0, w3, 1
	add	w2, w0, w2, lsl 1
	sub	w1, w8, w2
	add	w1, w1, 512
	asr	w0, w1, 31
	lsr	w7, w0, 23
	add	w1, w1, w7
	and	w0, w1, 511
	subs	w0, w0, w7
	bne	.L392
	str	w10, [x6, -16]
.L393:
	str	w10, [x6]
.L396:
	add	w3, w3, 1
	add	w4, w4, 1
	cmp	w3, 5
	add	x6, x6, 4
	bne	.L397
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L390:
	add	w0, w3, w3, lsr 31
	asr	w0, w0, 1
	add	x0, x19, x0, sxtw 3
	ldr	x0, [x0, 88]
	cmp	x0, x5
	beq	.L391
	ldr	w2, [x0, 8]
	and	w0, w4, 1
	add	w2, w0, w2, lsl 1
.L391:
	sub	w1, w8, w2
	add	w1, w1, 512
	asr	w0, w1, 31
	lsr	w7, w0, 23
	add	w1, w1, w7
	and	w0, w1, 511
	subs	w0, w0, w7
	beq	.L393
	sdiv	w0, w11, w0
	str	w0, [x6]
	b	.L396
	.p2align 3
.L386:
	sdiv	w0, w9, w0
	str	w0, [x3]
	b	.L385
	.p2align 3
.L392:
	sdiv	w0, w11, w0
	str	w0, [x6, -16]
	str	w0, [x6]
	b	.L396
	.p2align 3
.L404:
	add	w8, w8, 1
	add	x6, x19, 728
	mov	w3, 1
	mov	w4, 0
	mov	w10, 32
	mov	w11, 16384
	b	.L397
	.p2align 3
.L403:
	ldr	x0, [x19, 88]
	add	x4, x19, 8
	add	x2, x19, 96
	add	x1, x19, 712
	mov	w6, 16384
	mov	w5, 32
	ldr	w3, [x0, 8]
	add	x19, x19, 720
	lsl	w3, w3, 1
.L384:
	ldr	x0, [x2]
	cmp	x0, x4
	beq	.L382
	ldr	w0, [x0, 8]
	sub	w0, w3, w0, lsl 1
	ands	w0, w0, 511
	bne	.L383
	str	w5, [x1]
.L382:
	add	x1, x1, 4
	add	x2, x2, 8
	cmp	x19, x1
	bne	.L384
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L383:
	sdiv	w0, w6, w0
	str	w0, [x1]
	b	.L382
	.size	AVS_UpdateTableDirectScale, .-AVS_UpdateTableDirectScale
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdateTableSymScale
	.type	AVS_UpdateTableSymScale, %function
AVS_UpdateTableSymScale:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 96]
	add	x0, x19, 8
	cmp	x1, x0
	beq	.L412
	ldrb	w0, [x19, 217]
	cmp	w0, 1
	beq	.L407
	ldr	x12, [x19, 80]
	mov	w6, 0
	mov	w11, 512
.L410:
	ldr	w5, [x12, 8]
	lsl	w8, w6, 2
	lsl	w10, w6, 1
	mov	x2, 0
	add	w9, w8, 3
	add	w5, w6, w5, lsl 1
.L409:
	add	w3, w8, w2
	sub	w4, w9, w2
	add	w1, w2, w10
	mov	w7, 1
	add	x3, x19, x3, sxtw 2
	add	x4, x19, x4, sxtw 2
	add	x2, x2, 1
	add	x1, x19, x1, sxtw 2
	ldr	w3, [x3, 552]
	ldr	w0, [x4, 552]
	sub	w3, w5, w3
	ands	w3, w3, 511
	sub	w0, w0, w5
	and	w0, w0, 511
	beq	.L408
	sdiv	w7, w11, w3
.L408:
	mul	w0, w0, w7
	cmp	x2, 2
	str	w0, [x1, 744]
	bne	.L409
	add	w6, w6, 1
	cmp	w6, 2
	bne	.L410
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L407:
	ldp	x4, x2, [x19, 80]
	ldr	w3, [x1, 8]
	ldr	w1, [x4, 8]
	ldr	w2, [x2, 8]
	lsl	w4, w1, 1
	lsl	w1, w2, 1
	sub	w2, w4, w3, lsl 1
	ands	w2, w2, 511
	sub	w1, w1, w4
	and	w1, w1, 511
	bne	.L419
.L411:
	mul	w1, w1, w0
	str	w1, [x19, 744]
	mov	w0, 1
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L419:
	mov	w0, 512
	sdiv	w0, w0, w2
	b	.L411
	.p2align 3
.L412:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_UpdateTableSymScale, .-AVS_UpdateTableSymScale
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdateTabBBlkDist
	.type	AVS_UpdateTabBBlkDist, %function
AVS_UpdateTabBBlkDist:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	ldr	x1, [x19, 96]
	add	x0, x19, 8
	cmp	x1, x0
	beq	.L423
	ldrb	w0, [x19, 217]
	cmp	w0, 1
	beq	.L424
	ldr	x7, [x19, 80]
	add	x0, x19, 512
	ldr	w5, [x19, 568]
	ldr	w4, [x19, 576]
	ldp	w3, w1, [x0, 48]
	ldp	w6, w2, [x0, 40]
	ldr	w0, [x7, 8]
	lsl	w0, w0, 1
	sub	w3, w3, w0
	sub	w2, w0, w2
	sub	w6, w0, w6
	sub	w0, w1, w0
	and	w1, w3, 511
	and	w6, w6, 511
	str	w1, [x19, 768]
	and	w0, w0, 511
	str	w6, [x19, 760]
	and	w1, w2, 511
	str	w0, [x19, 772]
	mov	w0, 1
	str	w1, [x19, 764]
	ldr	w3, [x19, 572]
	ldr	w1, [x7, 8]
	ldr	w2, [x19, 580]
	lsl	w1, w1, 1
	add	w1, w1, w0
	sub	w3, w1, w3
	sub	w5, w1, w5
	sub	w4, w4, w1
	sub	w1, w2, w1
	and	w2, w3, 511
	add	x3, x19, 768
	and	w5, w5, 511
	and	w4, w4, 511
	and	w1, w1, 511
	stp	w5, w2, [x3, 8]
	stp	w4, w1, [x3, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L424:
	ldp	x3, x4, [x19, 80]
	ldr	w2, [x1, 8]
	ldr	w3, [x3, 8]
	ldr	w1, [x4, 8]
	lsl	w3, w3, 1
	lsl	w1, w1, 1
	sub	w2, w3, w2, lsl 1
	sub	w1, w1, w3
	and	w2, w2, 511
	and	w1, w1, 511
	str	w2, [x19, 760]
	str	w1, [x19, 768]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L423:
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_UpdateTabBBlkDist, .-AVS_UpdateTabBBlkDist
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_UpdatePmvTable
	.type	AVS_UpdatePmvTable, %function
AVS_UpdatePmvTable:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w1, [x20, 484]
	cmp	w1, 1
	beq	.L427
	cbz	w1, .L428
	cmp	w1, 2
	beq	.L429
	mov	w19, 0
.L426:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L429:
	mov	x0, x20
	mov	w19, 1
	bl	AVS_UpdateTableIdx2Dist
	mov	x0, x20
	bl	AVS_UpdateTableMvEScale
	mov	x0, x20
	bl	AVS_UpdateTableDirectScale
	mov	x0, x20
	bl	AVS_UpdateTabBBlkDist
	mov	x0, x20
	bl	AVS_UpdateTableSymScale
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L428:
	ldrb	w0, [x20, 217]
	mov	w19, 1
	cmp	w0, w19
	beq	.L426
	mov	x0, x20
	bl	AVS_UpdateTableIdx2Dist
	mov	x0, x20
	bl	AVS_UpdateTableMvEScale
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L427:
	mov	x0, x20
	mov	w19, w1
	bl	AVS_UpdateTableIdx2Dist
	mov	x0, x20
	bl	AVS_UpdateTableMvEScale
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_UpdatePmvTable, .-AVS_UpdatePmvTable
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_GetStreamInf
	.type	AVS_GetStreamInf, %function
AVS_GetStreamInf:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x19, x0
	mov	x0, x30
	add	x20, x19, 12288
	bl	_mcount
	ldr	w1, [x20, 2784]
	ldrb	w2, [x20, 2800]
	cmp	w1, 1
	str	w2, [x20, 3484]
	beq	.L436
	ldr	w0, [x19, 8]
	cmp	w0, 1
	beq	.L437
.L436:
	ldr	x1, .LC255
	mov	w0, 22
	bl	dprint_vfmw
	add	x3, x29, 80
	ldr	w0, [x19, 4]
	add	x2, x29, 72
	add	x1, x29, 68
	stp	wzr, wzr, [x29, 68]
	str	wzr, [x3, -4]!
	bl	VCTRL_GetChanImgNum
	ldr	x0, [x19, 16]
	ldr	w2, [x0, 708]
	cmp	w2, 1
	beq	.L525
.L439:
	add	x0, x20, 2788
	add	x1, x20, 2648
	ldr	w2, [x0, 24]
	add	w2, w2, 15
	lsr	w2, w2, 4
	str	w2, [x1, 116]
	ldrb	w3, [x0, 15]
	cmp	w3, 1
	ldr	w3, [x0, 28]
	beq	.L526
	add	w3, w3, 31
	lsr	w3, w3, 5
	lsl	w3, w3, 1
	str	w3, [x1, 120]
.L445:
	cmp	w2, 512
	bgt	.L446
	cmp	w3, 512
	ble	.L447
.L446:
	ldr	x1, .LC260
	mov	w0, 18
	mov	w22, 0
	bl	dprint_vfmw
.L442:
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L447:
	add	x22, x20, 2648
	ldr	x1, [x22, 88]
	ldr	w0, [x19, 4]
	add	x21, x20, 2656
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	x23, x0
	cbz	x0, .L449
	ldr	x1, [x22, 80]
	mov	w2, 1
	ldr	w0, [x19, 4]
	add	x21, x20, 2656
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x22, 88]
	mov	w2, 1
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x22, 96]
	mov	w2, 1
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x22, 104]
	mov	w2, 1
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	w0, [x19, 4]
	ldr	x1, [x23, 600]
	bl	FreeUsdByDec
	ldr	w0, [x19, 4]
	ldr	x1, [x23, 608]
	bl	FreeUsdByDec
	ldr	w0, [x19, 4]
	ldr	x1, [x23, 616]
	bl	FreeUsdByDec
	ldr	w0, [x19, 4]
	ldr	x1, [x23, 624]
	bl	FreeUsdByDec
	add	x0, x23, 512
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	stp	x21, x21, [x22, 80]
	stp	x21, x21, [x22, 96]
	ldr	w0, [x19, 4]
	bl	FSP_GetNullLogicFs
	str	w0, [x21, 4]
.L449:
	str	wzr, [x20, 3444]
	add	x22, x20, 3912
	mov	x1, x22
	ldr	w0, [x19, 4]
	bl	FSP_ClearNotInVoQueue
	ldr	x0, [x19, 16]
	ldr	w1, [x0, 708]
	cbnz	w1, .L450
	ldr	w0, [x0, 28]
	cmp	w0, 25
	beq	.L527
.L450:
	ldr	w0, [x19, 4]
	bl	FSP_GetFspType
	cbz	w0, .L523
.L452:
	add	x23, x20, 2648
	mov	x0, x19
	str	wzr, [x23, 136]
	mov	w22, 3
	stp	x21, x21, [x23, 80]
	stp	x21, x21, [x23, 96]
	bl	AVS_AllocateVHB
	cmp	w0, w22
	beq	.L442
	cbz	w0, .L528
	str	wzr, [x23, 136]
.L437:
	add	x21, x20, 2788
	add	x23, x20, 2648
	ldrb	w2, [x21, 11]
	mov	x0, x19
	ldr	x1, [x23, 80]
	str	w2, [x23, 832]
	ldrb	w2, [x21, 77]
	strb	w2, [x1]
	bl	AVS_GetImageBuffer
	mov	w22, w0
	cbz	w0, .L529
	ldr	x1, [x23, 80]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	x2, x0
	cbz	x0, .L530
	ldr	x3, [x19, 16]
	mov	x4, -1
	ldr	x1, .LC267
	mov	w0, 29
	ldr	x3, [x3, 56]
	str	x3, [x2, 640]
	ldr	x3, [x19, 16]
	ldr	x3, [x3, 72]
	str	x3, [x2, 648]
	ldr	x3, [x19, 16]
	ldr	x3, [x3, 88]
	str	x3, [x2, 656]
	ldr	x3, [x19, 16]
	ldr	w3, [x3, 104]
	str	w3, [x2, 8]
	ldr	x3, [x19, 16]
	ldr	w3, [x3, 108]
	str	w3, [x2, 12]
	ldr	x3, [x19, 16]
	ldr	w3, [x3, 112]
	str	w3, [x2, 16]
	ldr	x3, [x19, 16]
	ldr	w3, [x3, 128]
	str	w3, [x2, 20]
	ldrb	w3, [x21, 77]
	cmp	w3, wzr
	cset	w3, eq
	str	w3, [x2, 112]
	ldr	x3, [x19, 16]
	str	x4, [x3, 56]
	ldr	x3, [x2, 648]
	ldr	x2, [x2, 640]
	bl	dprint_vfmw
	ldr	x0, [x23, 80]
	mov	w1, 1
	ldr	w2, [x21, 108]
	str	w2, [x0, 8]
	ldr	x0, [x23, 80]
	ldrb	w2, [x21, 77]
	strb	w2, [x0]
	ldr	x0, [x23, 80]
	ldr	w2, [x21, 344]
	strb	w2, [x0, 1]
	ldrb	w0, [x21, 77]
	ldr	x2, [x23, 80]
	cbz	w0, .L457
	ldrsb	w1, [x21, 78]
.L457:
	strb	w1, [x2, 2]
	ldrb	w1, [x20, 2865]
	cbnz	w1, .L458
	ldr	w0, [x20, 3132]
	cbz	w0, .L531
.L458:
	add	x22, x20, 2788
	add	x23, x20, 2648
	ldr	w1, [x22, 340]
	mov	x0, x23
	str	w1, [x20, 3488]
	add	x21, x19, 16384
	bl	AVS_UpdatePmvTable
	ldr	w4, [x20, 2764]
	add	x1, x21, 592
	ldr	w3, [x20, 2768]
	mov	w2, 1
	mul	w0, w4, w3
	sub	w0, w0, #1
	str	w0, [x21, 592]
	stp	wzr, w2, [x1, 4]
	ldr	w2, [x20, 3188]
	stp	w3, w4, [x1, 56]
	cmp	w2, wzr
	add	w0, w2, 63
	csel	w0, w0, w2, lt
	mov	w2, 6
	asr	w0, w0, 6
	mov	w3, 3
	stp	w0, w2, [x1, 12]
	add	x0, x20, 2988
	add	x2, x20, 3116
	ldr	w4, [x20, 3484]
	str	w4, [x1, 64]
	ldr	w4, [x20, 3480]
	str	w4, [x1, 68]
	ldrb	w4, [x22, 90]
	str	w4, [x1, 72]
	ldrb	w4, [x22, 89]
	str	w4, [x1, 76]
	ldrb	w4, [x22, 88]
	str	w4, [x1, 80]
	ldrb	w4, [x22, 82]
	str	w4, [x1, 84]
	ldrb	w4, [x22, 81]
	str	w4, [x1, 88]
	ldrb	w4, [x22, 80]
	str	w4, [x1, 92]
	ldrb	w4, [x22, 79]
	str	w4, [x1, 96]
	ldrb	w4, [x22, 78]
	str	w4, [x1, 100]
	ldr	w4, [x22, 344]
	str	w4, [x1, 104]
	ldrb	w4, [x22, 77]
	cmp	w4, wzr
	csinc	w3, w3, wzr, ne
	str	w3, [x1, 108]
	ldrb	w3, [x22, 76]
	str	w3, [x1, 112]
	ldr	w3, [x22, 120]
	str	w3, [x1, 116]
	ldr	w3, [x22, 116]
	str	w3, [x1, 120]
	ldrb	w3, [x22, 85]
	str	w3, [x1, 124]
	ldrb	w3, [x22, 84]
	str	w3, [x1, 128]
	ldr	w3, [x22, 124]
	str	w3, [x1, 204]
	ldr	w3, [x22, 132]
	str	w3, [x1, 208]
	ldr	w3, [x22, 136]
	str	w3, [x1, 216]
	ldr	w3, [x22, 140]
	str	w3, [x1, 212]
	.p2align 2
.L461:
	ldrh	w1, [x0]
	add	x0, x0, 2
	cmp	x0, x2
	strh	w1, [x0, 2078]
	bne	.L461
	add	x22, x21, 592
	ldr	w1, [x20, 3116]
	add	x23, x20, 2648
	str	w1, [x22, 220]
	ldr	w1, [x20, 3128]
	str	w1, [x22, 228]
	ldr	w0, [x20, 3124]
	str	w0, [x22, 224]
	ldp	x0, x1, [x23, 80]
	ldrb	w0, [x0, 1]
	ldr	w1, [x1, 4]
	cmp	w0, 2
	ldr	w0, [x19, 4]
	beq	.L532
	bl	FSP_GetFsImagePtr
	cbz	x0, .L533
	ldr	x1, [x23, 88]
	mov	w24, 3
	ldrb	w2, [x1]
	cmp	w2, 1
	csinc	w2, w24, wzr, eq
	str	w2, [x22, 132]
	ldrsb	w2, [x1, 2]
	str	w2, [x22, 136]
	ldr	w2, [x0, 44]
	str	w2, [x22, 156]
	ldrb	w2, [x1]
	cmp	w2, 1
	csinc	w2, w24, wzr, eq
	str	w2, [x22, 148]
	ldrsb	w1, [x1, 2]
	str	w1, [x22, 152]
	ldr	w0, [x0, 44]
	str	w0, [x22, 160]
	ldr	x1, [x23, 96]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L534
	ldr	x1, [x23, 96]
.L524:
	ldrb	w2, [x1]
	add	x23, x20, 2648
	cmp	w2, 1
	csinc	w24, w24, wzr, eq
	str	w24, [x22, 140]
	ldrsb	w1, [x1, 2]
	str	w1, [x22, 144]
	ldr	w0, [x0, 44]
	str	w0, [x22, 164]
	ldr	x1, [x23, 88]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L535
	add	x22, x21, 592
	ldr	w0, [x0, 112]
	str	w0, [x22, 36]
	ldr	x1, [x23, 96]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L536
	ldr	w0, [x0, 112]
	str	w0, [x22, 40]
	ldr	x1, [x23, 104]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L537
	ldr	w0, [x0, 112]
	str	w0, [x22, 44]
	ldr	x1, [x23, 80]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L538
	ldr	w2, [x0, 112]
	mov	w1, 3
	str	w2, [x22, 48]
	ldr	w2, [x0, 44]
	str	w2, [x22, 52]
	ldr	w0, [x0, 60]
	str	w0, [x22, 168]
	ldr	x2, [x23, 88]
	ldrb	w0, [x2]
	cmp	w0, 1
	csinc	w0, w1, wzr, eq
	str	w0, [x22, 172]
	ldrb	w0, [x2, 1]
	cmp	w0, wzr
	cset	w0, ne
	str	w0, [x22, 176]
	ldr	x1, [x23, 80]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetPmvAddr
	str	w0, [x22, 232]
	ldr	x1, [x23, 88]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetPmvAddr
	str	w0, [x22, 244]
	mov	w7, 4
	mov	w4, 8
	ldr	w5, [x20, 3132]
	mov	w1, 16
	mov	w3, 32
	mov	w2, 0
	cmp	w5, 2
	add	x0, x20, 3232
	csel	w7, w7, wzr, eq
	csel	w4, w4, wzr, eq
	csel	w3, w1, w3, eq
	.p2align 2
.L482:
	ldr	w1, [x0]
	add	x0, x0, 4
	add	w2, w2, 1
	and	w1, w1, 262143
	cmp	w3, w2
	str	w1, [x0, 1700]
	bgt	.L482
	cbz	w4, .L487
	add	x2, x20, 3360
	add	w4, w4, 16
	mov	w0, 16
	add	x5, x21, 592
	.p2align 2
.L486:
	add	x3, x5, x0, sxtw 2
	ldr	w1, [x2], 4
	add	w0, w0, 1
	and	w1, w1, 32767
	cmp	w4, w0
	str	w1, [x3, 248]
	bne	.L486
.L487:
	cbz	w7, .L485
	lsl	w9, w7, 1
	mov	w4, 24
	mov	w2, 0
	add	x8, x21, 592
	add	x5, x20, 2648
	.p2align 2
.L488:
	add	w1, w2, 1
	add	x0, x5, x2, sxtw 2
	add	x6, x8, x4, sxtw 2
	add	w2, w2, 2
	add	x1, x5, x1, sxtw 2
	cmp	w2, w9
	ldr	w0, [x0, 760]
	add	w4, w4, 1
	ldr	w3, [x1, 760]
	and	w1, w0, 511
	ubfiz	w0, w3, 9, 9
	orr	w0, w0, w1
	str	w0, [x6, 248]
	bne	.L488
	add	x2, x20, 3392
	add	w4, w7, 28
	mov	w0, 28
	add	x5, x21, 592
	.p2align 2
.L489:
	add	x3, x5, x0, sxtw 2
	ldr	w1, [x2], 4
	add	w0, w0, 1
	and	w1, w1, 262143
	cmp	w4, w0
	str	w1, [x3, 248]
	bne	.L489
.L485:
	ldr	w0, [x20, 3184]
	mov	w22, 1
	str	w0, [x21, 968]
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L525:
	ldr	w0, [x29, 76]
	cmp	w0, wzr
	ble	.L539
.L440:
	mov	w22, 3
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L526:
	add	w3, w3, 15
	lsr	w3, w3, 4
	str	w3, [x1, 120]
	b	.L445
	.p2align 3
.L529:
	ldr	x1, .LC264
	mov	w0, 1
	bl	dprint_vfmw
	mov	w0, w22
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
.L527:
	ldr	w0, [x19, 8]
	cbnz	w0, .L452
.L523:
	mov	x0, x22
	bl	ResetVoQueue
	b	.L452
.L539:
	ldr	w0, [x29, 72]
	cmp	w0, 32
	bgt	.L440
	ldr	x0, [x19, 24]
	cbnz	x0, .L440
	ldr	w3, [x19, 15068]
	cbz	w3, .L439
	ldr	w7, [x19, 15848]
	cbz	w7, .L439
	add	x21, x19, 16384
	ldr	w5, [x21, 1100]
	cmp	w7, w5
	beq	.L439
	ldr	w6, [x19, 15852]
	ldr	w4, [x21, 1104]
	cmp	w6, w4
	beq	.L439
	ldr	x1, .LC257
	mov	w0, w2
	bl	dprint_vfmw
	ldr	w0, [x19, 15848]
	ldr	x1, .LC258
	str	w0, [x21, 1100]
	ldr	x4, [x1]
	ldr	w0, [x19, 15852]
	str	w0, [x21, 1104]
	cbz	x4, .L439
	ldr	w0, [x19, 4]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 120
	blr	x4
	b	.L439
	.p2align 3
.L532:
	bl	FSP_GetFsImagePtr
	cbz	x0, .L540
	ldr	x1, [x23, 88]
	mov	w24, 3
	ldrb	w2, [x1]
	cmp	w2, 1
	csinc	w2, w24, wzr, eq
	str	w2, [x22, 132]
	ldrsb	w1, [x1, 2]
	str	w1, [x22, 136]
	ldr	w0, [x0, 44]
	str	w0, [x22, 156]
	ldr	x1, [x23, 96]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L541
	ldr	x1, [x23, 96]
	ldrb	w2, [x1]
	cmp	w2, 1
	csinc	w2, w24, wzr, eq
	str	w2, [x22, 148]
	ldrsb	w1, [x1, 2]
	str	w1, [x22, 152]
	ldr	w0, [x0, 44]
	str	w0, [x22, 160]
	ldr	x1, [x23, 104]
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L542
	ldr	x1, [x23, 104]
	b	.L524
.L531:
	ldr	x1, [x20, 2728]
	mov	w2, 1
	ldr	w0, [x19, 4]
	ldr	w1, [x1, 4]
	bl	FSP_SetRef
	ldr	x0, [x20, 2752]
	add	x1, x20, 2656
	cmp	x0, x1
	beq	.L459
	ldr	w1, [x0, 4]
	mov	w2, 0
	ldr	w0, [x19, 4]
	bl	FSP_SetRef
.L459:
	ldr	x2, [x20, 2736]
	ldr	x3, [x20, 2744]
	ldr	x1, [x20, 2728]
	str	x1, [x20, 2736]
	str	x2, [x20, 2744]
	str	x3, [x20, 2752]
	b	.L458
.L530:
	ldr	x1, .LC265
	mov	w2, 1869
	mov	w0, 0
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
.L528:
	ldr	x1, .LC262
	mov	w0, 1
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
.L535:
	ldr	x1, .LC265
	mov	w2, 2000
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
.L536:
	ldr	x1, .LC265
	mov	w2, 2004
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
.L537:
	ldr	x1, .LC265
	mov	w2, 2008
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
.L534:
	ldr	x1, .LC265
	mov	w2, 1993
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
.L533:
	ldr	x1, .LC265
	mov	w2, 1984
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
.L538:
	ldr	x1, .LC265
	mov	w2, 2012
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
.L542:
	ldr	x1, .LC265
	mov	w2, 1976
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
.L541:
	ldr	x1, .LC265
	mov	w2, 1970
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
.L540:
	ldr	x1, .LC265
	mov	w2, 1964
	mov	w22, 0
	bl	dprint_vfmw
	b	.L442
	.size	AVS_GetStreamInf, .-AVS_GetStreamInf
	.align	3
.LC255:
	.xword	.LC254
	.align	3
.LC257:
	.xword	.LC256
	.align	3
.LC258:
	.xword	g_event_report
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
.LC265:
	.xword	.LC248
	.align	3
.LC267:
	.xword	.LC266
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_PrepareDecode
	.type	AVS_PrepareDecode, %function
AVS_PrepareDecode:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	x0, x19
	bl	AVS_GetStreamInf
	cmp	w0, 3
	beq	.L544
	cmp	w0, wzr
	cset	w0, ne
.L544:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_PrepareDecode, .-AVS_PrepareDecode
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_VerifyMemPara
	.type	AVS_VerifyMemPara, %function
AVS_VerifyMemPara:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	AVS_VerifyMemPara, .-AVS_VerifyMemPara
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_Init
	.type	AVSDEC_Init, %function
AVSDEC_Init:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x21, x0
	mov	x0, x30
	mov	x24, x1
	add	x20, x21, 16384
	bl	_mcount
	ldr	x23, .LC268
	mov	x2, 17496
	mov	w1, 0
	mov	x0, x21
	add	x19, x21, 12288
	ldr	x3, [x23, 96]
	add	x22, x19, 3912
	ldr	w25, [x20, 416]
	blr	x3
	str	w25, [x20, 416]
	mov	x0, x22
	add	x20, x19, 2648
	add	x25, x19, 3496
	bl	ResetVoQueue
	str	x24, [x21, 16]
	mov	x0, x21
	bl	VCTRL_GetChanIDByCtx
	cmn	w0, #1
	str	w0, [x21, 4]
	beq	.L550
	ldr	x3, [x23, 96]
	mov	w1, 0
	mov	x2, 848
	mov	x0, x20
	add	x19, x19, 2656
	blr	x3
	str	x25, [x20, 512]
	mov	w0, 1024
	str	x22, [x20, 544]
	str	w0, [x20, 540]
	mov	w0, 1
	stp	x19, x19, [x20, 80]
	stp	x19, x19, [x20, 96]
	ldr	x1, [x21, 16]
	str	wzr, [x1, 872]
.L549:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L550:
	ldr	x1, .LC270
	mov	w0, 0
	bl	dprint_vfmw
	mov	w0, -20
	b	.L549
	.size	AVSDEC_Init, .-AVSDEC_Init
	.align	3
.LC268:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC270:
	.xword	.LC269
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_Destroy
	.type	AVSDEC_Destroy, %function
AVSDEC_Destroy:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x0, x30
	bl	_mcount
	mov	w0, 1
	ldp	x29, x30, [sp], 16
	ret
	.size	AVSDEC_Destroy, .-AVSDEC_Destroy
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_RecycleImage
	.type	AVSDEC_RecycleImage, %function
AVSDEC_RecycleImage:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	mov	w20, w1
	bl	_mcount
	cbz	x19, .L554
	ldr	w0, [x19, 4]
	mov	w1, w20
	mov	w2, 0
	bl	FSP_SetDisplay
	ldr	w0, [x19, 4]
	mov	w1, w20
	bl	FSP_GetFsImagePtr
	mov	x20, x0
	cbz	x0, .L555
	ldr	w0, [x19, 4]
	ldr	x1, [x20, 600]
	bl	FreeUsdByDec
	str	xzr, [x20, 600]
	ldr	x1, [x20, 608]
	ldr	w0, [x19, 4]
	bl	FreeUsdByDec
	str	xzr, [x20, 608]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L554:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L555:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVSDEC_RecycleImage, .-AVSDEC_RecycleImage
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_GetRemainImg
	.type	AVSDEC_GetRemainImg, %function
AVSDEC_GetRemainImg:
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x20, x0
	mov	x0, x30
	add	x24, x20, 12288
	bl	_mcount
	ldr	x0, [x20, 16]
	ldr	w0, [x0, 12]
	cmp	w0, 1
	beq	.L563
	mov	w21, 3
	add	x19, x24, 2752
	mov	w23, -1
	add	x25, x24, 3912
.L562:
	ldr	x1, [x19]
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L559
	ldr	x1, [x19]
	mov	w23, 1
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetDisplay
	cmp	w0, 2
	beq	.L571
.L559:
	subs	w21, w21, #1
	sub	x19, x19, #8
	bne	.L562
	cbnz	w23, .L563
	mov	w0, w23
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L563:
	add	x0, x24, 3912
	bl	GetVoLastImageID
	mov	w23, w0
	mov	w0, w23
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	ret
	.p2align 3
.L571:
	mov	x0, x20
	mov	w23, -1
	bl	AVS_SetImgFormat
	mov	w2, 1
	cmp	w21, w2
	beq	.L572
.L560:
	ldr	x1, [x19]
	ldr	w0, [x20, 4]
	ldr	w1, [x1, 4]
	bl	FSP_SetDisplay
	ldr	w0, [x20, 4]
	mov	x4, x22
	mov	x3, x25
	mov	x2, x20
	mov	w1, 6
	bl	InsertImgToVoQueue
	cmp	w0, 1
	mov	x0, x20
	beq	.L561
	ldr	w1, [x22, 180]
	bl	AVSDEC_RecycleImage
	ldr	w0, [x20, 4]
	ldr	x1, [x22, 600]
	bl	FreeUsdByDec
	str	xzr, [x22, 600]
	ldr	x1, [x22, 608]
	ldr	w0, [x20, 4]
	bl	FreeUsdByDec
	str	xzr, [x22, 608]
	b	.L559
	.p2align 3
.L561:
	ldr	w0, [x22, 184]
	mov	w23, -1
	cmp	w0, 100
	bhi	.L559
	ldr	w0, [x22, 128]
	cmp	w0, 31
	bls	.L559
	ldr	w0, [x22, 132]
	cmp	w0, 31
	csetm	w23, ls
	b	.L559
.L572:
	str	w21, [x22, 212]
	b	.L560
	.size	AVSDEC_GetRemainImg, .-AVSDEC_GetRemainImg
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_GetImageBuffer
	.type	AVSDEC_GetImageBuffer, %function
AVSDEC_GetImageBuffer:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	bl	_mcount
	ldr	w0, [x20, 4]
	bl	FSP_IsNewFsAvalible
	cmp	w0, 1
	mov	w19, w0
	beq	.L574
	ldr	w0, [x20, 4]
	mov	w19, 0
	bl	FSP_IsNewFsAvalible
	cmn	w0, #1
	beq	.L579
.L574:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L579:
	add	x1, x20, 12288
	ldr	w0, [x20, 4]
	add	x1, x1, 3912
	bl	FSP_ClearNotInVoQueue
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVSDEC_GetImageBuffer, .-AVSDEC_GetImageBuffer
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearSlice
	.type	ClearSlice, %function
ClearSlice:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	w22, w0
	mov	x0, x30
	mov	x20, x1
	add	x19, x1, 8
	add	x21, x1, 16
	bl	_mcount
.L582:
	ldr	w0, [x19]
	cmp	w0, wzr
	ble	.L581
	ldr	w0, [x19, -8]
	cbnz	w0, .L587
.L581:
	str	wzr, [x19, -8]
	add	x19, x19, 4
	str	wzr, [x19, -4]
	cmp	x19, x21
	str	wzr, [x20, 16]
	bne	.L582
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L587:
	ldr	w1, [x19, 12]
	mov	w0, w22
	bl	SM_ReleaseStreamSeg
	b	.L581
	.size	ClearSlice, .-ClearSlice
	.global	_mcount
	.align	2
	.p2align 3,,7
	.type	AVS_DecodeArbiter.part.3, %function
AVS_DecodeArbiter.part.3:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	bl	_mcount
	ldr	x0, [x21, 16]
	ldr	w0, [x0, 8]
	cmp	w0, 4
	bls	.L617
.L610:
	mov	w1, 1
	add	x22, x21, 12288
.L589:
	str	w0, [x22, 3440]
	cbnz	w1, .L596
	add	x20, x21, 32
	ldr	w0, [x20, 14440]
	mov	w19, 0
	cmp	w0, wzr
	ble	.L609
	.p2align 2
.L611:
	sxtw	x2, w19
	ldr	w0, [x21, 4]
	lsl	x1, x2, 3
	add	w19, w19, 1
	sub	x1, x1, x2
	add	x1, x20, x1, lsl 2
	add	x1, x1, 104
	bl	ClearSlice
	ldr	w0, [x20, 14440]
	cmp	w19, w0
	blt	.L611
.L609:
	str	wzr, [x20, 14440]
	mov	w0, 16383
	ldr	x2, .LC272
	movk	w0, 0xfffb, lsl 16
	ldr	w1, [x22, 2772]
	ldr	x4, [x2]
	and	w0, w1, w0
	str	w0, [x22, 2772]
	cbz	x4, .L616
	ldr	w0, [x21, 4]
	mov	w3, 0
	mov	x2, 0
	mov	w1, 113
	blr	x4
.L616:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L590:
	add	x22, x21, 12288
	ldr	w2, [x22, 3440]
	cmp	w2, 2
	bne	.L594
	str	wzr, [x22, 3444]
.L594:
	str	w0, [x22, 3440]
.L596:
	ldr	w0, [x22, 3880]
	cmp	w0, 1
	beq	.L618
	cmp	w0, 2
	bne	.L604
	ldr	w0, [x22, 3444]
	cmp	w0, 1
	ble	.L607
.L604:
	add	x1, x22, 3536
	mov	x2, 372
	add	x0, x22, 2788
	bl	memcpy
	ldrb	w4, [x22, 2865]
	mov	w0, 18
	ldr	w3, [x22, 3132]
	ldr	w2, [x22, 3456]
	ldr	x1, .LC274
	bl	dprint_vfmw
	ldr	w2, [x22, 2772]
	mov	w1, 16383
	movk	w1, 0xfffb, lsl 16
	mov	w0, 1
	and	w1, w2, w1
	str	w1, [x22, 2772]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L617:
	ldr	x1, .LC271
	ldrb	w1, [x1,w0,uxtw]
	adr	x2, .Lrtx591
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx591:
	.section	.rodata
	.align	0
	.align	2
.L591:
	.byte	(.L590 - .Lrtx591) / 4
	.byte	(.L592 - .Lrtx591) / 4
	.byte	(.L593 - .Lrtx591) / 4
	.byte	(.L610 - .Lrtx591) / 4
	.byte	(.L590 - .Lrtx591) / 4
	.text
	.p2align 3
.L593:
	add	x22, x21, 12288
	ldr	w1, [x22, 3880]
	cmp	w1, wzr
	cset	w1, eq
	b	.L589
	.p2align 3
.L592:
	add	x22, x21, 12288
	ldr	w2, [x22, 3440]
	cmp	w2, 2
	beq	.L619
.L595:
	ldr	w1, [x22, 3880]
	cmp	w1, 2
	cset	w1, ne
	b	.L589
	.p2align 3
.L618:
	ldr	w0, [x22, 3444]
	cmp	w0, wzr
	bgt	.L604
.L607:
	add	x20, x21, 32
	ldr	w0, [x20, 14440]
	mov	w19, 0
	cmp	w0, wzr
	ble	.L609
	.p2align 2
.L612:
	sxtw	x2, w19
	ldr	w0, [x21, 4]
	lsl	x1, x2, 3
	add	w19, w19, 1
	sub	x1, x1, x2
	add	x1, x20, x1, lsl 2
	add	x1, x1, 104
	bl	ClearSlice
	ldr	w0, [x20, 14440]
	cmp	w19, w0
	blt	.L612
	b	.L609
	.p2align 3
.L619:
	str	wzr, [x22, 3444]
	b	.L595
	.size	AVS_DecodeArbiter.part.3, .-AVS_DecodeArbiter.part.3
	.align	3
.LC271:
	.xword	.L591
	.align	3
.LC272:
	.xword	g_event_report
	.align	3
.LC274:
	.xword	.LC273
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_DecodeArbiter
	.type	AVS_DecodeArbiter, %function
AVS_DecodeArbiter:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	mov	w0, 49152
	ldr	w1, [x19, 15060]
	movk	w0, 0x5, lsl 16
	and	w0, w1, w0
	cmp	w0, 376832
	beq	.L623
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L623:
	mov	x0, x19
	bl	AVS_DecodeArbiter.part.3
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_DecodeArbiter, .-AVS_DecodeArbiter
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_VDMPostProc
	.type	AVSDEC_VDMPostProc, %function
AVSDEC_VDMPostProc:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 32
	mov	w22, w1
	bl	_mcount
	mov	w19, 0
	ldr	w0, [x20, 14440]
	cmp	w0, wzr
	ble	.L629
	.p2align 2
.L669:
	sxtw	x3, w19
	ldr	w0, [x21, 4]
	lsl	x1, x3, 3
	add	w19, w19, 1
	sub	x1, x1, x3
	add	x1, x20, x1, lsl 2
	add	x1, x1, 104
	bl	ClearSlice
	ldr	w0, [x20, 14440]
	cmp	w19, w0
	blt	.L669
.L629:
	ldr	x0, .LC275
	add	x19, x21, 12288
	add	x23, x19, 2788
	mov	x2, 14904
	mov	w1, 0
	str	wzr, [x20, 14440]
	ldr	x3, [x0, 96]
	mov	x0, x20
	blr	x3
	ldr	w0, [x23, 344]
	cbnz	w0, .L682
	str	w22, [x19, 3448]
	mov	w2, w22
	ldr	x0, [x21, 16]
	ldr	w3, [x0]
	cmp	w2, w3
	bgt	.L683
.L634:
	mov	x0, x21
	add	x20, x19, 2648
	bl	AVS_SetImgFormat
	ldr	x1, [x20, 80]
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L684
	ldr	x1, [x20, 816]
	cbz	x1, .L637
	str	x1, [x0, 600]
.L637:
	ldr	x2, [x19, 3472]
	str	xzr, [x19, 3464]
	cbz	x2, .L638
	str	x2, [x0, 608]
.L638:
	add	x20, x19, 2648
	str	xzr, [x20, 824]
	ldr	w0, [x19, 3132]
	cmp	w0, 1
	bls	.L685
	ldr	x20, [x20, 80]
.L644:
	ldr	w1, [x20, 4]
	ldr	w0, [x21, 4]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L686
	add	x0, x19, 2656
	add	x19, x19, 2648
	cmp	x20, x0
	beq	.L649
	ldr	x0, [x21, 16]
	ldr	w2, [x19, 800]
	ldr	w3, [x0, 4]
	cmp	w3, w2
	bge	.L647
	ldr	x1, .LC280
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w1, [x20, 4]
	mov	w2, 0
	ldr	w0, [x21, 4]
	bl	FSP_SetDisplay
	ldr	x1, [x22, 600]
	cbnz	x1, .L687
.L648:
	ldr	x1, [x22, 608]
	cbnz	x1, .L688
.L649:
	mov	w19, 1
.L632:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L647:
	mov	x1, x21
	mov	x0, x20
	bl	AVS_OutputOneFrame
	mov	w19, w0
	cbnz	w0, .L649
	ldr	x1, [x22, 600]
	cbnz	x1, .L689
.L650:
	ldr	x1, [x22, 608]
	cbz	x1, .L632
	ldr	w0, [x21, 4]
	bl	FreeUsdByDec
	str	xzr, [x22, 608]
	b	.L632
	.p2align 3
.L682:
	add	x20, x19, 2648
	ldr	x1, [x20, 88]
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L690
	ldr	x2, [x20, 96]
	ldr	w24, [x0, 184]
	ldr	w0, [x21, 4]
	ldr	w1, [x2, 4]
	bl	FSP_GetFsImagePtr
	cbz	x0, .L691
	ldr	w2, [x0, 184]
	mov	w0, 100
	add	w2, w24, w2
	add	w2, w2, w22
	cmp	w2, w0
	csel	w2, w2, w0, le
	str	w2, [x20, 800]
	ldr	w0, [x23, 344]
	cmp	w0, 2
	beq	.L634
	ldr	x0, [x21, 16]
	ldr	w3, [x0]
	cmp	w2, w3
	ble	.L634
	.p2align 2
.L683:
	ldr	x1, .LC278
	mov	w0, 1
	bl	dprint_vfmw
	str	wzr, [x19, 3444]
	ldr	x0, [x19, 2736]
	ldr	w1, [x0, 4]
	ldr	w0, [x21, 4]
	bl	FSP_GetFsImagePtr
	mov	x22, x0
	cbz	x0, .L635
	ldr	x1, [x19, 2728]
	mov	w2, 1
	ldr	w0, [x21, 4]
	add	x23, x19, 2656
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x19, 2736]
	mov	w2, 1
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x19, 2744]
	mov	w2, 1
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	x1, [x19, 2752]
	mov	w2, 1
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 4]
	bl	FSP_ClearLogicFs
	ldr	w0, [x21, 4]
	ldr	x1, [x22, 600]
	bl	FreeUsdByDec
	ldr	w0, [x21, 4]
	ldr	x1, [x22, 608]
	bl	FreeUsdByDec
	ldr	w0, [x21, 4]
	ldr	x1, [x22, 616]
	bl	FreeUsdByDec
	ldr	w0, [x21, 4]
	ldr	x1, [x22, 624]
	bl	FreeUsdByDec
	add	x0, x22, 512
	add	x1, x19, 2560
	stp	xzr, xzr, [x0, 88]
	stp	xzr, xzr, [x0, 104]
	stp	x23, x23, [x1, 168]
	stp	x23, x23, [x1, 184]
	ldr	w0, [x21, 4]
	bl	FSP_GetNullLogicFs
	str	w0, [x23, 4]
.L635:
	str	wzr, [x19, 3444]
	mov	w19, 0
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.L688:
	ldr	w0, [x21, 4]
	mov	w19, 1
	bl	FreeUsdByDec
	str	xzr, [x22, 608]
	b	.L632
	.p2align 3
.L685:
	ldr	w2, [x20, 796]
	cmp	w2, 1
	csinc	w2, w2, w2, gt
	str	w2, [x20, 796]
	ldrb	w1, [x19, 2865]
	cmp	w1, 1
	ccmp	w0, wzr, 0, ne
	beq	.L641
	ldr	x1, [x20, 80]
	mov	w2, 1
	ldr	w0, [x21, 4]
	ldr	w1, [x1, 4]
	bl	FSP_SetRef
	ldr	x0, [x20, 104]
	add	x1, x19, 2656
	cmp	x0, x1
	beq	.L642
	ldr	w1, [x0, 4]
	mov	w2, 0
	ldr	w0, [x21, 4]
	bl	FSP_SetRef
.L642:
	ldr	x2, [x19, 2736]
	ldr	x3, [x19, 2744]
	ldr	x1, [x19, 2728]
	str	x1, [x19, 2736]
	str	x2, [x19, 2744]
	str	x3, [x19, 2752]
.L641:
	ldr	x0, [x21, 16]
	ldr	w0, [x0, 12]
	cbnz	w0, .L643
	ldr	x20, [x19, 2744]
	b	.L644
.L643:
	ldr	x20, [x19, 2728]
	b	.L644
.L687:
	ldr	w0, [x21, 4]
	bl	FreeUsdByDec
	str	xzr, [x22, 600]
	b	.L648
.L689:
	ldr	w0, [x21, 4]
	bl	FreeUsdByDec
	str	xzr, [x22, 600]
	b	.L650
.L684:
	ldr	x1, .LC276
	mov	w2, 3336
	mov	w19, 0
	bl	dprint_vfmw
	b	.L632
.L686:
	ldr	x1, .LC276
	mov	w2, 3376
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
	b	.L632
.L690:
	ldr	x1, .LC276
	mov	w2, 3311
	mov	w0, 0
	mov	w19, 0
	bl	dprint_vfmw
	b	.L632
.L691:
	ldr	x1, .LC276
	mov	w2, 3315
	mov	w19, 0
	bl	dprint_vfmw
	b	.L632
	.size	AVSDEC_VDMPostProc, .-AVSDEC_VDMPostProc
	.align	3
.LC275:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC276:
	.xword	.LC248
	.align	3
.LC278:
	.xword	.LC277
	.align	3
.LC280:
	.xword	.LC279
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_ClearCurPic
	.type	AVS_ClearCurPic, %function
AVS_ClearCurPic:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	x21, x0
	mov	x0, x30
	add	x20, x21, 32
	mov	w19, 0
	bl	_mcount
	ldr	w0, [x20, 14440]
	cmp	w0, wzr
	ble	.L695
	.p2align 2
.L696:
	sxtw	x2, w19
	ldr	w0, [x21, 4]
	lsl	x1, x2, 3
	add	w19, w19, 1
	sub	x1, x1, x2
	add	x1, x20, x1, lsl 2
	add	x1, x1, 104
	bl	ClearSlice
	ldr	w0, [x20, 14440]
	cmp	w0, w19
	bgt	.L696
.L695:
	str	wzr, [x20, 14440]
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	AVS_ClearCurPic, .-AVS_ClearCurPic
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	ClearPacket
	.type	ClearPacket, %function
ClearPacket:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 16384
	bl	_mcount
	ldr	w0, [x20, 4]
	ldr	w1, [x19, 452]
	bl	SM_ReleaseStreamSeg
	ldrb	w0, [x19, 441]
	cbnz	w0, .L700
	ldrb	w0, [x19, 521]
	cmp	w0, 1
	beq	.L704
.L700:
	mov	w0, 1
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L704:
	ldr	w0, [x19, 524]
	cbz	w0, .L700
	ldr	w1, [x19, 532]
	ldr	w0, [x20, 4]
	bl	SM_ReleaseStreamSeg
	b	.L700
	.size	ClearPacket, .-ClearPacket
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	WriteAvsSliceMsg
	.type	WriteAvsSliceMsg, %function
WriteAvsSliceMsg:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	add	x6, x19, 32
	ldr	w2, [x6, 14440]
	cmp	w2, 511
	bgt	.L713
	cmp	w2, wzr
	ble	.L708
	sub	w0, w2, #1
	add	x5, x19, 12288
	ldr	x8, [x19, 16816]
	sxtw	x0, w0
	ldr	w4, [x5, 3560]
	lsl	x1, x0, 3
	sub	x0, x1, x0
	add	w4, w4, 15
	ldrb	w7, [x8, 3]
	lsr	w4, w4, 4
	add	x0, x6, x0, lsl 2
	mul	w7, w7, w4
	ldr	w3, [x0, 120]
	cmp	w7, w3
	bls	.L714
.L709:
	sxtw	x1, w2
	add	x19, x19, 16384
	lsl	x0, x1, 3
	add	x5, x5, 2788
	sub	x1, x0, x1
	mov	w0, 0
	ldr	w3, [x19, 444]
	add	x1, x6, x1, lsl 2
	str	w3, [x1, 104]
	ldr	w3, [x19, 452]
	str	w3, [x1, 124]
	ldr	w3, [x19, 448]
	str	w3, [x1, 112]
	ldrb	w7, [x8, 3]
	mul	w7, w7, w4
	str	w7, [x1, 120]
	ldr	w3, [x5, 24]
	ldr	w5, [x5, 28]
	add	w3, w3, 15
	add	w5, w5, 15
	lsr	w4, w3, 4
	lsr	w3, w5, 4
	mul	w3, w4, w3
	sub	w3, w3, #1
	cmp	w7, w3
	bhi	.L707
	ldrb	w0, [x19, 441]
	cmp	w0, 1
	beq	.L715
	ldr	w0, [x19, 524]
	str	w0, [x1, 108]
	ldr	w0, [x19, 532]
	str	w0, [x1, 128]
	ldr	w0, [x19, 528]
	str	w0, [x1, 116]
.L711:
	add	w2, w2, 1
	mov	w0, 1
	str	w2, [x6, 14440]
.L707:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L708:
	ldr	w4, [x19, 15848]
	add	x5, x19, 12288
	ldr	x8, [x19, 16816]
	add	w4, w4, 15
	lsr	w4, w4, 4
	b	.L709
	.p2align 3
.L713:
	ldr	x1, .LC282
	mov	w3, 512
	mov	w0, 1
	bl	dprint_vfmw
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L714:
	ldr	x1, .LC284
	mov	w2, w7
	mov	w0, 1
	bl	dprint_vfmw
	mov	x0, x19
	bl	ClearPacket
	ldr	x19, [sp, 16]
	mov	w0, 1
	ldp	x29, x30, [sp], 32
	ret
	.p2align 3
.L715:
	str	wzr, [x1, 108]
	str	wzr, [x1, 116]
	str	wzr, [x1, 128]
	b	.L711
	.size	WriteAvsSliceMsg, .-WriteAvsSliceMsg
	.align	3
.LC282:
	.xword	.LC281
	.align	3
.LC284:
	.xword	.LC283
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_GetPacketState
	.type	AVS_GetPacketState, %function
AVS_GetPacketState:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	add	x19, x19, 16384
	bl	_mcount
	ldr	w0, [x19, 424]
	ldr	x19, [sp, 16]
	cmp	w0, 1
	cset	w0, ne
	ldp	x29, x30, [sp], 32
	ret
	.size	AVS_GetPacketState, .-AVS_GetPacketState
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	Avs_Vfmw_WQMatrix
	.type	Avs_Vfmw_WQMatrix, %function
Avs_Vfmw_WQMatrix:
	stp	x29, x30, [sp, -352]!
	add	x29, sp, 0
	str	x19, [sp, 16]
	mov	x19, x0
	mov	x0, x30
	bl	_mcount
	str	xzr, [x29, 40]
	ldr	w8, [x19, 144]
	str	wzr, [x29, 48]
	cmp	w8, 1
	str	xzr, [x29, 56]
	str	wzr, [x29, 64]
	ldr	w6, [x19, 128]
	beq	.L719
	cmp	w8, 3
	ccmp	w6, wzr, 0, eq
	beq	.L719
	cmp	w8, 2
	beq	.L790
.L723:
	cbz	w6, .L725
	mov	w0, 128
	strh	w0, [x29, 72]
	strh	w0, [x29, 74]
	strh	w0, [x29, 76]
	strh	w0, [x29, 78]
	strh	w0, [x29, 80]
	strh	w0, [x29, 82]
	strh	w0, [x29, 84]
	strh	w0, [x29, 86]
	strh	w0, [x29, 88]
	strh	w0, [x29, 90]
	strh	w0, [x29, 92]
	strh	w0, [x29, 94]
	cbnz	w8, .L791
	ldr	x3, .LC285
	add	x1, x29, 84
	add	x0, x3, 12
	add	x3, x3, 24
	.p2align 2
.L739:
	ldrh	w2, [x0], 2
	strh	w2, [x1], 2
	cmp	x0, x3
	bne	.L739
.L734:
	add	x3, x19, 200
	add	x2, x19, 328
	mov	x0, x3
	mov	w1, 128
	.p2align 2
.L731:
	strh	w1, [x0], 2
	cmp	x0, x2
	bne	.L731
	ldr	w0, [x19, 124]
	cbz	w0, .L743
	ldr	x6, .LC286
	mov	w9, 0
	ldr	w0, [x19, 148]
	add	x6, x6, 16
	add	x6, x6, x0, lsl 6
.L744:
	uxtw	x5, w9
	mov	w1, 0
	lsl	x0, x5, 2
	lsl	x7, x5, 6
	sub	x5, x0, x5
	lsl	x5, x5, 1
	.p2align 2
.L752:
	add	w4, w1, 8
	.p2align 2
.L750:
	uxtw	x0, w1
	add	x10, x29, 352
	add	x2, x7, x0
	add	w1, w1, 1
	cmp	w1, w4
	ldrb	w0, [x6, x0]
	add	x2, x10, x2, lsl 1
	add	x0, x5, x0
	add	x0, x10, x0, lsl 1
	sub	x0, x0, #4096
	ldrh	w0, [x0, 3816]
	strh	w0, [x2, -256]
	bne	.L750
	cmp	w1, 64
	bne	.L752
	add	w9, w9, 1
	cmp	w9, 2
	bne	.L744
	cbnz	w8, .L753
.L795:
	add	x0, x29, 224
	add	x2, x29, 352
	.p2align 2
.L754:
	ldrh	w1, [x0], 2
	strh	w1, [x3], 2
	cmp	x2, x0
	bne	.L754
.L717:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 352
	ret
.L725:
	ldr	x0, .LC285
	mov	x1, 0
	add	x4, x29, 72
	.p2align 2
.L728:
	ldrh	w2, [x0, x1]
	strh	w2, [x4, x1]
	add	x1, x1, 2
	cmp	x1, 12
	bne	.L728
	add	x6, x4, 12
	add	x1, x0, 12
	mov	x2, x6
	add	x0, x0, 24
	.p2align 2
.L729:
	ldrh	w3, [x1], 2
	strh	w3, [x2], 2
	cmp	x1, x0
	bne	.L729
	cbz	w8, .L734
	cmp	w8, 1
	beq	.L792
	cmp	w8, 2
	beq	.L793
	cmp	w8, 3
	bne	.L734
	mov	x0, 0
	add	x5, x29, 40
.L737:
	ldrh	w1, [x5, x0]
	strh	w1, [x4, x0]
	add	x0, x0, 2
	cmp	x0, 12
	bne	.L737
	mov	x0, 0
	add	x5, x29, 56
.L738:
	ldrh	w1, [x5, x0]
	add	x0, x0, 2
	strh	w1, [x6], 2
	cmp	x0, 12
	bne	.L738
	b	.L734
.L791:
	cmp	w8, 1
	beq	.L794
	cmp	w8, 2
	bne	.L734
	add	x1, x29, 84
	mov	x0, 0
	add	x5, x29, 56
.L742:
	ldrh	w2, [x5, x0]
	add	x0, x0, 2
	strh	w2, [x1], 2
	cmp	x0, 12
	bne	.L742
	b	.L734
	.p2align 3
.L743:
	mov	w6, 0
	mov	w5, 128
.L747:
	mov	w0, 0
	ubfiz	x4, x6, 6, 32
	.p2align 2
.L749:
	add	w2, w0, 8
	.p2align 2
.L745:
	add	x1, x4, x0, uxtw
	add	x7, x29, 352
	add	w0, w0, 1
	add	x1, x7, x1, lsl 1
	cmp	w2, w0
	strh	w5, [x1, -256]
	bne	.L745
	cmp	w2, 64
	mov	w0, w2
	bne	.L749
	add	w6, w6, 1
	cmp	w6, 2
	bne	.L747
	cbz	w8, .L795
.L753:
	cmp	w8, 1
	beq	.L796
	cmp	w8, 2
	bne	.L717
	add	x0, x29, 224
	add	x2, x29, 352
	.p2align 2
.L758:
	ldrh	w1, [x0], 2
	strh	w1, [x3], 2
	cmp	x2, x0
	bne	.L758
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 352
	ret
.L719:
	ldr	x0, .LC285
	add	x3, x19, 152
	mov	x1, 0
	add	x5, x29, 40
	.p2align 2
.L721:
	ldrh	w2, [x0, x1]
	ldr	w4, [x3], 4
	add	w2, w4, w2
	strh	w2, [x5, x1]
	add	x1, x1, 2
	cmp	x1, 12
	bne	.L721
	cmp	w8, 2
	beq	.L722
	cmp	w8, 3
	ccmp	w6, wzr, 0, eq
	bne	.L723
.L722:
	add	x3, x19, 176
	add	x0, x0, 12
	mov	x1, 0
	add	x5, x29, 56
	.p2align 2
.L724:
	ldr	w4, [x3], 4
	ldrh	w2, [x0], 2
	add	w2, w4, w2
	strh	w2, [x5, x1]
	add	x1, x1, 2
	cmp	x1, 12
	bne	.L724
	b	.L723
.L790:
	ldr	x0, .LC285
	b	.L722
.L794:
	mov	x0, 0
	add	x5, x29, 40
	add	x4, x29, 72
.L741:
	ldrh	w1, [x5, x0]
	strh	w1, [x4, x0]
	add	x0, x0, 2
	cmp	x0, 12
	bne	.L741
	b	.L734
.L792:
	mov	x0, 0
	add	x5, x29, 40
.L733:
	ldrh	w1, [x5, x0]
	strh	w1, [x4, x0]
	add	x0, x0, 2
	cmp	x0, 12
	bne	.L733
	b	.L734
.L796:
	add	x0, x29, 96
	add	x2, x0, 128
	.p2align 2
.L756:
	ldrh	w1, [x0], 2
	strh	w1, [x3], 2
	cmp	x2, x0
	bne	.L756
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 352
	ret
.L793:
	mov	x0, 0
	add	x5, x29, 56
.L736:
	ldrh	w1, [x5, x0]
	add	x0, x0, 2
	strh	w1, [x6], 2
	cmp	x0, 12
	bne	.L736
	b	.L734
	.size	Avs_Vfmw_WQMatrix, .-Avs_Vfmw_WQMatrix
	.align	3
.LC285:
	.xword	.LANCHOR1
	.align	3
.LC286:
	.xword	.LANCHOR0
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVS_ParseHeader
	.type	AVS_ParseHeader, %function
AVS_ParseHeader:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	mov	x20, x0
	mov	x0, x30
	add	x19, x20, 12288
	add	x21, x20, 16384
	add	x23, x19, 2648
	bl	_mcount
	mov	w1, 32
	add	x24, x19, 3536
	ldr	x22, [x23, 512]
	str	wzr, [x21, 424]
	mov	x0, x22
	bl	BsShow
	uxtb	w0, w0
	sub	w1, w0, #176
	cmp	w1, 78
	bls	.L847
.L798:
	cmp	w0, 175
	bhi	.L822
	ldr	w1, [x19, 2772]
	mov	w0, 327680
	add	x19, x19, 2648
	and	w0, w1, w0
	cmp	w0, 327680
	beq	.L848
.L822:
	mov	x0, x20
	bl	ClearPacket
.L839:
	mov	w0, 1
.L810:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L847:
	ldr	x2, .LC289
	ldrb	w1, [x2,w1,uxtw]
	adr	x2, .Lrtx800
	add	x1, x2, w1, sxtb #2
	br	x1
.Lrtx800:
	.section	.rodata
	.align	0
	.align	2
.L800:
	.byte	(.L799 - .Lrtx800) / 4
	.byte	(.L801 - .Lrtx800) / 4
	.byte	(.L802 - .Lrtx800) / 4
	.byte	(.L803 - .Lrtx800) / 4
	.byte	(.L822 - .Lrtx800) / 4
	.byte	(.L805 - .Lrtx800) / 4
	.byte	(.L806 - .Lrtx800) / 4
	.byte	(.L801 - .Lrtx800) / 4
	.byte	(.L822 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L798 - .Lrtx800) / 4
	.byte	(.L808 - .Lrtx800) / 4
	.text
	.p2align 3
.L801:
	add	x19, x19, 2648
	ldr	w1, [x19, 124]
	tbnz	x1, 15, .L849
	mov	w0, 327680
	tst	w1, w0
	beq	.L839
	mov	w2, 16383
	mov	x0, x20
	movk	w2, 0xfffb, lsl 16
	and	w1, w1, w2
	str	w1, [x19, 124]
	bl	ClearPacket
	mov	w0, 0
	b	.L810
	.p2align 3
.L849:
	mov	w0, 1
	str	w0, [x21, 424]
	orr	w1, w1, 16384
	str	w1, [x19, 124]
	b	.L810
	.p2align 3
.L799:
	add	x19, x19, 2648
	ldr	w2, [x19, 124]
	tbnz	x2, 15, .L850
	tbz	x2, 16, .L811
	mov	w0, 16383
	mov	x1, x24
	movk	w0, 0xfffb, lsl 16
	and	w2, w2, w0
	mov	x0, x20
	str	w2, [x19, 124]
	bl	AVS_sequence_header
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 0
	b	.L810
	.p2align 3
.L808:
	mov	w1, 32
	mov	x0, x22
	bl	BsSkip
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w23, w0
	mov	w1, 32
	mov	x0, x22
	bl	BsGet
	mov	w2, 20553
	mov	w1, 20036
	movk	w2, 0x4853, lsl 16
	movk	w1, 0x4345, lsl 16
	cmp	w23, w2
	ccmp	w0, w1, 0, eq
	bne	.L843
	add	x2, x19, 2648
	mov	w0, 1
	strb	w0, [x20]
	mov	w19, 1
	str	w19, [x21, 424]
	mov	x0, x20
	ldr	w1, [x2, 124]
	orr	w1, w1, 16384
	str	w1, [x2, 124]
	bl	ClearPacket
	mov	w0, w19
	b	.L810
	.p2align 3
.L802:
	ldr	w0, [x19, 2772]
	mov	w1, 1
	tbnz	x0, 18, .L840
	tbz	x0, 16, .L843
	mov	w1, 0
.L840:
	mov	x0, x20
	bl	AVS_user_data
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 1
	b	.L810
	.p2align 3
.L805:
	ldr	w1, [x19, 2772]
	mov	w0, 327680
	tst	w1, w0
	beq	.L843
	mov	x1, x24
	mov	x0, x23
	bl	AVS_extension
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 1
	b	.L810
	.p2align 3
.L803:
	add	x19, x19, 2648
	ldr	w0, [x19, 124]
	tbnz	x0, 15, .L838
	tbz	x0, 18, .L813
	mov	w2, 16383
	mov	x1, x24
	movk	w2, 0xfffb, lsl 16
	and	w2, w0, w2
	mov	x0, x23
	str	w2, [x19, 124]
	bl	AVS_i_picture_header
	b	.L842
	.p2align 3
.L806:
	add	x19, x19, 2648
	ldr	w0, [x19, 124]
	tbnz	x0, 15, .L838
	tbz	x0, 18, .L815
	mov	w2, 16383
	mov	x1, x24
	movk	w2, 0xfffb, lsl 16
	and	w2, w0, w2
	mov	x0, x23
	str	w2, [x19, 124]
	bl	AVS_pb_picture_header
.L842:
	mov	x0, x24
	bl	Avs_Vfmw_WQMatrix
.L843:
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
	.p2align 3
.L815:
	mov	x1, x24
	mov	x0, x23
	bl	AVS_pb_picture_header
.L844:
	mov	x0, x24
	bl	Avs_Vfmw_WQMatrix
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 1
	b	.L810
	.p2align 3
.L813:
	mov	x1, x24
	mov	x0, x23
	bl	AVS_i_picture_header
	b	.L844
	.p2align 3
.L811:
	mov	x1, x24
	mov	x0, x20
	bl	AVS_sequence_header
	mov	x0, x20
	bl	ClearPacket
	mov	w0, 1
	b	.L810
	.p2align 3
.L838:
	mov	w20, 1
	str	w20, [x21, 424]
	orr	w1, w0, 16384
	mov	x0, x24
	str	w1, [x19, 124]
	bl	Avs_Vfmw_WQMatrix
	mov	w0, w20
	b	.L810
	.p2align 3
.L850:
	mov	w0, 1
	str	w0, [x21, 424]
	orr	w2, w2, 16384
	str	w2, [x19, 124]
	b	.L810
.L848:
	orr	w1, w1, 32768
	mov	x0, x20
	str	w1, [x19, 124]
	bl	WriteAvsSliceMsg
	cbnz	w0, .L839
	b	.L843
	.size	AVS_ParseHeader, .-AVS_ParseHeader
	.align	3
.LC289:
	.xword	.L800
	.global	_mcount
	.align	2
	.p2align 3,,7
	.global	AVSDEC_Decode
	.type	AVSDEC_Decode, %function
AVSDEC_Decode:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x21, x0
	mov	x19, x1
	mov	x0, x30
	add	x22, x21, 12288
	add	x20, x22, 2648
	bl	_mcount
	ldr	w2, [x19, 16]
	add	x0, x22, 3496
	ldr	x1, [x19]
	bl	BsInit
	ldr	x3, .LC290
	add	x0, x21, 16384
	mov	x2, 160
	mov	x1, x19
	add	x0, x0, 432
	ldr	x3, [x3, 104]
	blr	x3
	ldr	w0, [x20, 124]
	str	w0, [x20, 844]
	mov	x0, x21
	bl	AVS_ParseHeader
	cbz	w0, .L874
	mov	w0, 49152
	ldr	w1, [x20, 124]
	movk	w0, 0x5, lsl 16
	and	w0, w1, w0
	cmp	w0, 376832
	beq	.L857
.L858:
	mov	w2, 0
.L854:
	mov	w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L874:
	ldr	x1, .LC292
	add	x20, x21, 32
	mov	w0, 1
	mov	w19, 0
	bl	dprint_vfmw
	ldr	w0, [x20, 14440]
	cmp	w0, wzr
	ble	.L856
	.p2align 2
.L867:
	sxtw	x2, w19
	ldr	w0, [x21, 4]
	lsl	x1, x2, 3
	add	w19, w19, 1
	sub	x1, x1, x2
	add	x1, x20, x1, lsl 2
	add	x1, x1, 104
	bl	ClearSlice
	ldr	w0, [x20, 14440]
	cmp	w19, w0
	blt	.L867
.L856:
	mov	w2, 0
	str	wzr, [x20, 14440]
.L876:
	mov	w0, w2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.p2align 3
.L857:
	mov	x0, x21
	bl	AVS_DecodeArbiter.part.3
	cbz	w0, .L858
	mov	x0, x21
	bl	AVS_GetStreamInf
	cmp	w0, 3
	beq	.L859
	cbnz	w0, .L875
	ldr	x1, .LC294
	add	x20, x21, 32
	mov	w0, 1
	bl	dprint_vfmw
	ldr	w0, [x20, 14440]
	cmp	w0, wzr
	ble	.L856
	mov	w19, 0
	.p2align 2
.L862:
	sxtw	x2, w19
	ldr	w0, [x21, 4]
	lsl	x1, x2, 3
	add	w19, w19, 1
	sub	x1, x1, x2
	add	x1, x20, x1, lsl 2
	add	x1, x1, 104
	bl	ClearSlice
	ldr	w0, [x20, 14440]
	cmp	w19, w0
	blt	.L862
	mov	w2, 0
	str	wzr, [x20, 14440]
	b	.L876
	.p2align 3
.L875:
	mov	x0, x21
	bl	AVS_StartDecode
	mov	w2, 1
	cbnz	w0, .L854
	ldr	x1, .LC296
	add	x20, x21, 32
	mov	w0, w2
	bl	dprint_vfmw
	ldr	w0, [x20, 14440]
	cmp	w0, wzr
	ble	.L856
	mov	w19, 0
	.p2align 2
.L863:
	sxtw	x2, w19
	ldr	w0, [x21, 4]
	lsl	x1, x2, 3
	add	w19, w19, 1
	sub	x1, x1, x2
	add	x1, x20, x1, lsl 2
	add	x1, x1, 104
	bl	ClearSlice
	ldr	w0, [x20, 14440]
	cmp	w19, w0
	blt	.L863
	b	.L856
	.p2align 3
.L859:
	ldr	w1, [x20, 844]
	mov	w2, w0
	str	w1, [x20, 124]
	b	.L854
	.size	AVSDEC_Decode, .-AVSDEC_Decode
	.align	3
.LC290:
	.xword	vfmw_Osal_Func_Ptr_S
	.align	3
.LC292:
	.xword	.LC291
	.align	3
.LC294:
	.xword	.LC293
	.align	3
.LC296:
	.xword	.LC295
	.global	g_tmp
	.global	wq_param_default
	.global	g_AvsCfg
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	CSWTCH.55, %object
	.size	CSWTCH.55, 16
CSWTCH.55:
	.word	5
	.word	1
	.word	2
	.word	3
	.type	WeightQuantModel, %object
	.size	WeightQuantModel, 256
WeightQuantModel:
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	5
	.byte	5
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	0
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	5
	.byte	5
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	0
	.byte	4
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	5
	.byte	5
	.byte	5
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	1
	.byte	1
	.byte	1
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.data
	.align	3
.LANCHOR1 = . + 0
	.type	wq_param_default, %object
	.size	wq_param_default, 24
wq_param_default:
	.hword	135
	.hword	143
	.hword	143
	.hword	160
	.hword	160
	.hword	213
	.hword	128
	.hword	98
	.hword	106
	.hword	116
	.hword	116
	.hword	128
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	ASCII(.string	"%-40s     %#-8x(%db)\n" )
	.zero	2
.LC4:
	ASCII(.string	"video_sequence_start_code" )
	.zero	6
.LC6:
	ASCII(.string	"profile_id" )
	.zero	5
.LC8:
	ASCII(.string	"level_id" )
	.zero	7
.LC10:
	ASCII(.string	"progressive_sequence" )
	.zero	3
.LC12:
	ASCII(.string	"horizontal_size" )
.LC14:
	ASCII(.string	"vertical_size" )
	.zero	2
.LC16:
	ASCII(.string	"chroma_format" )
	.zero	2
.LC18:
	ASCII(.string	"sample_precision" )
	.zero	7
.LC20:
	ASCII(.string	"aspect_ratio" )
	.zero	3
.LC22:
	ASCII(.string	"frame_rate_code" )
.LC24:
	ASCII(.string	"bit_rate_lower" )
	.zero	1
.LC26:
	ASCII(.string	"marker_bit" )
	.zero	5
.LC28:
	ASCII(.string	"bit_rate_upper" )
	.zero	1
.LC30:
	ASCII(.string	"low_delay" )
	.zero	6
.LC32:
	ASCII(.string	"bbv_buffer_size" )
.LC34:
	ASCII(.string	"reserved_bits" )
	.zero	2
.LC40:
	ASCII(.string	"i_picture_start_code" )
	.zero	3
.LC42:
	ASCII(.string	"bbv_delay" )
	.zero	6
.LC45:
	ASCII(.string	"bbv_delay_extension" )
	.zero	4
.LC47:
	ASCII(.string	"time_code_flag" )
	.zero	1
.LC49:
	ASCII(.string	"time_code" )
	.zero	6
.LC51:
	ASCII(.string	"picture_distance" )
	.zero	7
.LC53:
	ASCII(.string	"bbv_check_times" )
.LC55:
	ASCII(.string	"progressive_frame" )
	.zero	6
.LC57:
	ASCII(.string	"picture_structure" )
	.zero	6
.LC59:
	ASCII(.string	"top_field_first" )
.LC61:
	ASCII(.string	"repeat_first_field" )
	.zero	5
.LC63:
	ASCII(.string	"fixed_picture_qp" )
	.zero	7
.LC65:
	ASCII(.string	"picture_qp" )
	.zero	5
.LC67:
	ASCII(.string	"skip_mode_flag" )
	.zero	1
.LC70:
	ASCII(.string	"loop_filter_disable" )
	.zero	4
.LC72:
	ASCII(.string	"loop_filter_parameter_flag" )
	.zero	5
.LC74:
	ASCII(.string	"alpha_c_offset" )
	.zero	1
.LC76:
	ASCII(.string	"beta_offset" )
	.zero	4
.LC78:
	ASCII(.string	"weighting_quant_flag" )
	.zero	3
.LC80:
	ASCII(.string	"aec_enable" )
	.zero	5
.LC82:
	ASCII(.string	"mb_adapt_weighting_quant_disable" )
	.zero	7
.LC84:
	ASCII(.string	"chroma_quant_param_disable" )
	.zero	5
.LC86:
	ASCII(.string	"chroma_quant_param_delta_u" )
	.zero	5
.LC88:
	ASCII(.string	"chroma_quant_param_delta_v" )
	.zero	5
.LC90:
	ASCII(.string	"weighting_quant_param_index" )
	.zero	4
.LC92:
	ASCII(.string	"weighting_quant_model" )
	.zero	2
.LC94:
	ASCII(.string	"weighting_quant_param_deltal1" )
	.zero	2
.LC96:
	ASCII(.string	"weighting_quant_param_deltal2" )
	.zero	2
.LC99:
	ASCII(.string	"pb_picture_start_code" )
	.zero	2
.LC104:
	ASCII(.string	"picture_coding_type" )
	.zero	4
.LC110:
	ASCII(.string	"advanced_pred_mode_disable" )
	.zero	5
.LC116:
	ASCII(.string	"picture_reference_flag" )
	.zero	1
.LC118:
	ASCII(.string	"no_forward_reference_flag" )
	.zero	6
.LC120:
	ASCII(.string	"b_filed_enhanced_flag" )
	.zero	2
.LC122:
	ASCII(.string	"p_filed_enhanced_flag" )
	.zero	2
.LC140:
	ASCII(.string	"user_data_start_code" )
	.zero	3
.LC144:
	ASCII(.string	"extension_ID" )
	.zero	3
.LC146:
	ASCII(.string	"video_format" )
	.zero	3
.LC148:
	ASCII(.string	"sample_range" )
	.zero	3
.LC150:
	ASCII(.string	"colour_description" )
	.zero	5
.LC152:
	ASCII(.string	"colour_primaries" )
	.zero	7
.LC154:
	ASCII(.string	"transfer_characteristics" )
	.zero	7
.LC156:
	ASCII(.string	"matrix_coefficients" )
	.zero	4
.LC158:
	ASCII(.string	"display_horizontal_size" )
.LC161:
	ASCII(.string	"display_vertical_size" )
	.zero	2
.LC165:
	ASCII(.string	"copyright_flag" )
	.zero	1
.LC167:
	ASCII(.string	"copyright_id" )
	.zero	3
.LC169:
	ASCII(.string	"original_or_copy" )
	.zero	7
.LC173:
	ASCII(.string	"copyright_number_1" )
	.zero	5
.LC175:
	ASCII(.string	"copyright_number_2" )
	.zero	5
.LC177:
	ASCII(.string	"copyright_number_3" )
	.zero	5
.LC181:
	ASCII(.string	"camera_id" )
	.zero	6
.LC184:
	ASCII(.string	"height_of_image_device" )
	.zero	1
.LC186:
	ASCII(.string	"focal_length" )
	.zero	3
.LC188:
	ASCII(.string	"f_number" )
	.zero	7
.LC190:
	ASCII(.string	"vertical_angle_of_view" )
	.zero	1
.LC192:
	ASCII(.string	"camera_position_x_upper" )
.LC194:
	ASCII(.string	"camera_position_x_lower" )
.LC196:
	ASCII(.string	"camera_position_y_upper" )
.LC198:
	ASCII(.string	"camera_position_y_lower" )
.LC200:
	ASCII(.string	"camera_position_z_upper" )
.LC202:
	ASCII(.string	"camera_position_z_lower" )
.LC204:
	ASCII(.string	"camera_direction_x" )
	.zero	5
.LC206:
	ASCII(.string	"camera_direction_y" )
	.zero	5
.LC208:
	ASCII(.string	"camera_direction_z" )
	.zero	5
.LC210:
	ASCII(.string	"image_plane_vertical_x" )
	.zero	1
.LC212:
	ASCII(.string	"image_plane_vertical_y" )
	.zero	1
.LC214:
	ASCII(.string	"image_plane_vertical_z" )
	.zero	1
.LC217:
	ASCII(.string	"frame_centre_horizontal_offset" )
	.zero	1
.LC220:
	ASCII(.string	"frame_centre_vertical_offset" )
	.zero	3
.LC222:
	ASCII(.string	"extension_start_code" )
	.zero	3
.LC225:
	ASCII(.string	"ERROR: image size abnormal(%dx%d)\n" )
	.zero	5
.LC227:
	ASCII(.string	"avs actual frame size(%dx%d) exeed max config(%dx%d)\n" )
	.zero	2
.LC230:
	ASCII(.string	"ERROR: partition fs memory fail!\n" )
	.zero	6
.LC232:
	ASCII(.string	"ERROR: FSP_ConfigInstance fail!\n" )
	.zero	7
.LC236:
	ASCII(.string	"line: %d, pImage is NULL!\n" )
	.zero	5
.LC239:
	ASCII(.string	"line: %d pImage is null\n" )
	.zero	7
.LC241:
	ASCII(.string	"ERROR: get frame store fail!\n" )
	.zero	2
.LC244:
	ASCII(.string	"get image buffer ok: LogicFsID = %d\n" )
	.zero	3
.LC246:
	ASCII(.string	"decode %p, disp %p, tf %p\n" )
	.zero	5
.LC248:
	ASCII(.string	"line: %d\n" )
	.zero	6
.LC250:
	ASCII(.string	"ERROR: AVS_OutputOneFrame is err(%d)\n" )
	.zero	2
.LC254:
	ASCII(.string	"size change\n" )
	.zero	3
.LC256:
	ASCII(.string	"IsSizeChanged = %d,TotalPicNum = %d,old w/h = %d/%d,new w/h = %d/%d\n" )
	.zero	3
.LC259:
	ASCII(.string	"MbWidth = %d, MbHeight = %d, don't support!\n" )
	.zero	3
.LC261:
	ASCII(.string	"ERROR: allocate vhb\n" )
	.zero	3
.LC263:
	ASCII(.string	"ERROR: get img buf err\n" )
.LC266:
	ASCII(.string	"dec_pts: %lld Usertag = %lld\n" )
	.zero	2
.LC269:
	ASCII(.string	"-1 == VCTRL_GetChanIDByCtx() Err! \n" )
	.zero	4
.LC273:
	ASCII(.string	"-----Pic %5d, type %d, struct %d-----\n" )
	.zero	1
.LC277:
	ASCII(.string	"ERROR: err_level(%d) over ref_thr(%d)\n" )
	.zero	1
.LC279:
	ASCII(.string	"ERROR: err_level(%d) over out_thr(%d)\n" )
	.zero	1
.LC281:
	ASCII(.string	"SlcNum %d > %d Write slice msg failed\n" )
	.zero	1
.LC283:
	ASCII(.string	"This slice's start mbn %d <= LastSliceFirstMb %d, Write slice msg failed\n" )
	.zero	6
.LC291:
	ASCII(.string	"ERROR: paseHeader err\n" )
	.zero	1
.LC293:
	ASCII(.string	"ERROR: AVS_PrepareDecode err\n" )
	.zero	2
.LC295:
	ASCII(.string	"ERROR: AVS_StartDecode err\n" )
	.bss
	.align	3
	.type	g_tmp, %object
	.size	g_tmp, 1024
g_tmp:
	.zero	1024
	.type	g_AvsCfg, %object
	.size	g_AvsCfg, 508
g_AvsCfg:
	.zero	508
	.ident	"GCC: (gcc-linaro-5.1-2015.08 + glibc-2.22 (Build by czyong Wed Mar  9 18:57:48 CST 2016)) 5.1.1 20150608"
	.section	.note.GNU-stack,"",%progbits
