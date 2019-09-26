STDIN		 = 0
EXIT_SUCCESS = 0
SYSEXIT      = 1
STDOUT       = 1
SYSREAD      = 3
SYSWRITE     = 4


.globl aShort
.globl aCharPtr

.data
aShort: .short 44

aCharPtr: .asciz "Pontius Pilatus"

.globl fun
.type fun, @function

.text
fun:
	push %ebp
	mov %esp, %ebp

	mov $SYSWRITE, %eax
	mov $STDOUT, %ebx
	mov $cShort, %ecx
	mov $1, %edx
	int $0x80

	mov $SYSWRITE, %eax
	mov $STDOUT, %ebx
	mov cCharPtr, %ecx
	mov $3, %edx
	int $0x80

	mov %ebp, %esp
	pop %ebp
	ret
