.data
formats: .asciz "%s",
formathd: .asciz "%hd",
newline: .asciz "",
format: .asciz "%d"

.bss
.comm charptr, 9999
.comm shortint, 2

.text
.global main

main:	


mov $0, %eax
mov $formathd,%edi
mov $shortint, %esi	
call scanf

mov $0, %eax
mov $formathd, %edi
mov (shortint), %esi
call printf


	
mov $0, %eax
mov $newline, %edi
call printf



	
mov $0, %eax
mov $formats,%edi
mov $charptr, %esi	
call scanf

mov $0, %eax
mov $formats, %edi
mov $charptr, %esi
	
call printf


	
	
	
mov $0, %eax
mov $newline, %edi
call printf




mov $1, %eax
mov $0, %ebx
int $0x80	
