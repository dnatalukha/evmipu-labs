	.file	"lab_1.c"
	.text
	.section	.rodata
.LC2:
	.string	"Result: %.15f\n"
.LC3:
	.string	"Time: %.3f sec\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr32
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$80, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	$-294967296, -48(%ebp)
	movl	$0, -44(%ebp)
	subl	$8, %esp
	leal	-28(%ebp), %eax
	pushl	%eax
	pushl	$1
	call	clock_gettime@PLT
	addl	$16, %esp
	fldz
	fstpl	-64(%ebp)
	movl	$4, -68(%ebp)
	movl	$0, -56(%ebp)
	movl	$0, -52(%ebp)
	jmp	.L2
.L3:
	fildl	-68(%ebp)
	movl	-56(%ebp), %eax
	movl	-52(%ebp), %edx
	shldl	$1, %eax, %edx
	addl	%eax, %eax
	addl	$1, %eax
	adcl	$0, %edx
	movl	%eax, -80(%ebp)
	movl	%edx, -76(%ebp)
	fildq	-80(%ebp)
	fdivrp	%st, %st(1)
	fldl	-64(%ebp)
	faddp	%st, %st(1)
	fstpl	-64(%ebp)
	negl	-68(%ebp)
	addl	$1, -56(%ebp)
	adcl	$0, -52(%ebp)
.L2:
	movl	-56(%ebp), %eax
	movl	-52(%ebp), %edx
	cmpl	-48(%ebp), %eax
	movl	%edx, %eax
	sbbl	-44(%ebp), %eax
	jl	.L3
	subl	$8, %esp
	leal	-20(%ebp), %eax
	pushl	%eax
	pushl	$1
	call	clock_gettime@PLT
	addl	$16, %esp
	movl	-20(%ebp), %edx
	movl	-28(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -80(%ebp)
	fildl	-80(%ebp)
	movl	-16(%ebp), %edx
	movl	-24(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -80(%ebp)
	fildl	-80(%ebp)
	fldl	.LC1@GOTOFF(%ebx)
	fdivrp	%st, %st(1)
	faddp	%st, %st(1)
	fstpl	-40(%ebp)
	subl	$4, %esp
	pushl	-60(%ebp)
	pushl	-64(%ebp)
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$4, %esp
	pushl	-36(%ebp)
	pushl	-40(%ebp)
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	$0, %eax
	movl	-12(%ebp), %ecx
	xorl	%gs:20, %ecx
	je	.L5
	call	__stack_chk_fail_local
.L5:
	leal	-8(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB1:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE1:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.3) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 4
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 4
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 4
4:
