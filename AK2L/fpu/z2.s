.data
controlWord: .short 0
 
.text
.global setRound, check
.type setRound, @function
.type check, @function

 
setRound:
    push        %rbp
    mov         %rsp, %rbp

    mov         $0, %rax
    fstcw       controlWord
    fwait
    mov         controlWord, %ax
 
    and         $0xF3FF, %ax # 1111 0011 1111 1111

    shl         $10, %rdi
 
    xor         %di, %ax
 
    mov         %ax, controlWord
    fldcw       controlWord
 
    mov         %rbp, %rsp
    pop         %rbp
    ret


check:
	push %rbp
	mov %rsp, %rbp

	FSTSW %ax

	mov %rbp, %rsp
	pop %rbp
	ret






