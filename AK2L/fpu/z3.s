.data
controlWord: .short 0
 
.text
.global setPrecision
.type setPrecision, @function

 
setPrecision:
    push    %rbp
    mov     %rsp, %rbp

    mov     $0, %rax
    fstcw   controlWord
    fwait
    mov     controlWord, %ax
 
    and     $0xFCFF, %ax # 1111 1100 1111 1111
 
    cmp     $2, %rdi
    jl      end
    je      double
 

    extended:
    xor     $0x300, %ax 
    jmp     end 
 

    double:
    xor     $0x200, %ax 
 
    end:
    mov     %ax, controlWord
    fldcw   controlWord
 
    mov     %rbp, %rsp
    pop     %rbp
    ret
 

