.globl aOne

.data
aOne: .float 1.0



.globl fpuStatus
.type fpuStatus, @function

.text
fpuStatus:
	push %rbp
	mov %rsp, %rbp

	FSTSW %ax

	mov %rbp, %rsp
	pop %rbp
	ret
