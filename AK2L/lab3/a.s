SYSEXIT= 1
SYSREAD= 3
SYSWRITE= 4
STDOUT= 1
EXIT_SUCCESS = 0
STDIN = 0
OFFSET = 3
LENGTH = 26
	
.align 32
.comm text, 1	
.text

msg:	.ascii "TEST\n"
msg_len = .-msg

nl :	.ascii     "\n"
nl_len = .-nl

	
.global _start

_start:
	mov $SYSWRITE, %eax	
	mov $STDOUT, %ebx
	mov $msg      , %ecx
	mov $msg_len, %edx
	int $0x80

loop_:	
	mov $SYSREAD, %eax
	mov $STDIN, %ebx
	mov $text, %ecx
	mov $1, %edx
	int $0x80
	
	cmp $1 ,%eax   	
	jl end_label



	
	add $OFFSET, text


	mov $text, %eax
	mov $90, %ebx
	cmpl	 %eax ,%ebx
	jl print

subt:	
	
	sub $26, text

	mov $text, %eax
	mov $90, %ebx
	
	cmpl	%eax ,%ebx
	jg subt

print:	

	mov $SYSWRITE, %eax 	
	mov $STDOUT, %ebx
	mov $text,%ecx
	mov $1      , %edx
	int $0x80

	mov $SYSWRITE, %eax 	
	mov $STDOUT, %ebx
	mov $nl  ,%ecx
	mov $nl_len , %edx
	int $0x80
	
	jmp loop_

end_label:	
	mov $SYSEXIT, %eax
	mov $EXIT_SUCCESS, %ebx
	int $0x80

