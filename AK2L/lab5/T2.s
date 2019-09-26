 .globl stamp
 .type stamp, @function
 .text

stamp:
 pushl %ebp

 movl %esp, %ebp

 pushl %esi
 pushl %ebx
 pushl %ecx

 xor %eax, %eax
 cpuid
 rdtsc

 popl %ecx
 popl %ebx
 popl %esi

 popl %ebp

 ret
