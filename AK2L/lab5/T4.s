SYSEXIT      = 1
SYSREAD      = 3
SYSWRITE     = 4
STDOUT       = 1
STDIN		 = 0
EXIT_SUCCESS = 0


.globl registerOp
.type reg, @function

.globl writeOp
.type writeOp, @function

.globl memoryOp
.type memoryOp, @function

.globl printOp
.type printOp, @function

.data
text: .asciz "Significand\t\n"

.text


registerOp:
	push %ebp
	mov %esp, %ebp

	xor %eax, %eax
	cpuid
	rdtsc

	push %eax

	mov $44, %ebx
	mov %ebx, %edx

	cpuid
	rdtsc

	pop %edx
	sub %edx, %eax

	mov %ebp, %esp
	pop %ebp

	ret


writeOp:
	push %ebp
	mov %esp, %ebp

	xor %eax, %eax
	cpuid
	rdtsc

	push %eax

	mov $SYSWRITE, %eax
	mov $STDOUT, %ebx
	mov $text, %ecx
	mov $13, %edx
	int $0x80

	cpuid
	rdtsc

	pop %edx
	sub %edx, %eax

	mov %ebp, %esp
	pop %ebp
	ret

memoryOp:

	push %ebp
	mov %esp, %ebp

	xor %eax, %eax
	cpuid
	rdtsc

	push %eax
	pop %eax

	cpuid
	rdtsc

	pop %edx
	sub %edx, %eax

	mov %ebp, %esp
	pop %ebp
	ret


printOp:
	push %ebp
	mov %esp, %ebp

	xor %eax, %eax
	cpuid
	rdtsc

	push %eax


	push $text
	call printf

	cpuid
	rdtsc

	pop %edx
	sub %edx, %eax

	mov %ebp, %esp
	pop %ebp
	ret
