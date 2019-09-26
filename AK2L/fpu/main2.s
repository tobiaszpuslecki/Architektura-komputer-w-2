	.file	"z2.c"
	.comm	option,4,4
	.globl	f
	.data
	.align 8
	.type	f, @object
	.size	f, 8
f:
	.long	0
	.long	1072693248
	.globl	k
	.align 8
	.type	k, @object
	.size	k, 8
k:
	.long	0
	.long	1074266112
	.globl	res
	.bss
	.align 8
	.type	res, @object
	.size	res, 8
res:
	.zero	8
	.section	.rodata
.LC0:
	.string	"Nearest: %1.32f\n"
.LC2:
	.string	"Down: %1.32f\n"
.LC3:
	.string	"Up      : %1.32f\n"
.LC4:
	.string	"Truncate: %1.32f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, %edi
	call	setRound
	flds	f
	flds	k
	fdivrp	%st, %st(1)
	fstps	res
	movq	res(%rip), %rax
	movq	%rax, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movl	$.LC0, %edi
	movl	$1, %eax
	call	printf
	pxor	%xmm0, %xmm0
	movsd	%xmm0, res(%rip)
	movl	$1, %edi
	call	setRound
	flds	f
	flds	k
	fdivrp	%st, %st(1)
	fstps	res
	movq	res(%rip), %rax
	movq	%rax, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movl	$.LC2, %edi
	movl	$1, %eax
	call	printf
	pxor	%xmm0, %xmm0
	movsd	%xmm0, res(%rip)
	movl	$2, %edi
	call	setRound
	flds	f
	flds	k
	fdivrp	%st, %st(1)
	fstps	res
	movq	res(%rip), %rax
	movq	%rax, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movl	$.LC3, %edi
	movl	$1, %eax
	call	printf
	pxor	%xmm0, %xmm0
	movsd	%xmm0, res(%rip)
	movl	$3, %edi
	call	setRound
	flds	f
	flds	k
	fdivrp	%st, %st(1)
	fstps	res
	movq	res(%rip), %rax
	movq	%rax, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movl	$.LC4, %edi
	movl	$1, %eax
	call	printf
	pxor	%xmm0, %xmm0
	movsd	%xmm0, res(%rip)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
