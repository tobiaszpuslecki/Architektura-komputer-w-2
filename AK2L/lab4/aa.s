.data
LEN = 512
EXIT_NR  = 1
WRITE_NR = 4
STDOUT = 1
EXIT_CODE_SUCCESS = 0

.bss 
.comm t, 512
	
	
.text
msg: .ascii "Test\n"
msgLen = . - msg


.global _start

_start:

mov $LEN, %r8
mov $1, %r9
		
setones:	
dec %r8
mov %r9, t(,%r8,1)
cmp $0, %r8
jg setones

	
mov $2, %r8

fori:
mov t(,%r8,1), %r9

dec %r9
cmp $0, %r9
jne skip

mov %r8 , %r10
add %r8 , %r10

forj:

mov %r9, t(,%r10,1)

add %r8, %r10

cmp $LEN, %r10
jle forj
	
skip:	

inc %r8
cmp $LEN, %r8
jle fori


mov $LEN, %r8
mov $1, %r9


setc   :	
dec %r8
add $48, t(,%r8,1)
cmp $0, %r8
jg setc
	
	
mov $4       , %rax 
mov $1       , %rbx
mov $t       , %rcx
mov $LEN     , %rdx 
int $0x80
	
mov $EXIT_NR          , %eax
mov $EXIT_CODE_SUCCESS, %ebx 
int $0x80
