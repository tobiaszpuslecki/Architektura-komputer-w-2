	.file	"z1.c"
	.globl	zero
	.bss
	.align 4
	.type	zero, @object
	.size	zero, 4
zero:
	.zero	4
	.globl	one
	.data
	.align 4
	.type	one, @object
	.size	one, 4
one:
	.long	1065353216
	.globl	result
	.bss
	.align 4
	.type	result, @object
	.size	result, 4
result:
	.zero	4
	.globl	denormalized
	.data
	.align 4
	.type	denormalized, @object
	.size	denormalized, 4
denormalized:
	.long	512
	.section	.rodata
.LC0:
	.string	"Before zero division: %d\n"
.LC1:
	.string	"After zero division: %d\n"
.LC2:
	.string	"Before denorm. op.: %d\n"
.LC3:
	.string	"After denorm. op.: %d\n"
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
	movl	$0, %eax
	call	fpuStatus
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	flds	one
	flds	zero
	fdivrp	%st, %st(1)
	fstps	result
	movl	$0, %eax
	call	fpuStatus
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	fpuStatus
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	flds	denormalized
	flds	one
	fdivrp	%st, %st(1)
	fstps	result
	movl	$0, %eax
	call	fpuStatus
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
