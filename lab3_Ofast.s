	.file	"lab_1.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Result: %.15f\n"
.LC3:
	.string	"Time: %.3f sec\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movl	$1, %edi
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rsi
	call	clock_gettime@PLT
	movl	$1, %eax
	movl	$4, %edx
	pxor	%xmm1, %xmm1
	movabsq	$8000000001, %rcx
	.p2align 4,,10
	.p2align 3
.L2:
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdl	%edx, %xmm0
	negl	%edx
	cvtsi2sdq	%rax, %xmm2
	addq	$2, %rax
	divsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	cmpq	%rcx, %rax
	jne	.L2
	leaq	32(%rsp), %rsi
	movl	$1, %edi
	movsd	%xmm1, 8(%rsp)
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	pxor	%xmm2, %xmm2
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm2
	pxor	%xmm0, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	mulsd	.LC1(%rip), %xmm2
	movsd	8(%rsp), %xmm1
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	movsd	%xmm2, (%rsp)
	call	__printf_chk@PLT
	movsd	(%rsp), %xmm2
	movl	$1, %edi
	leaq	.LC3(%rip), %rsi
	movl	$1, %eax
	movapd	%xmm2, %xmm0
	call	__printf_chk@PLT
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L7
	xorl	%eax, %eax
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	3894859413
	.long	1041313291
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.3) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
