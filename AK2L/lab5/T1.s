.data
    formats: .asciz "%s"
    outputs: .asciz "char* = %s"

    formathd: .asciz "%hd"
    outputhd: .asciz "short = %hd"


.bss
    .comm charptr, 32
    .comm shortInt, 4

.section .text
.globl main
    main:


		push %ebp
		mov %esp, %ebp

        pushl $charptr
        pushl $formats
        call scanf
        addl $8, %esp

        pushl $charptr
        pushl $outputs
        call printf
        addl $8, %esp


        pushl $shortInt
        pushl $formathd
        call scanf
        addl $8, %esp

        pushl shortInt
        pushl $outputhd
        call printf
        addl $8, %esp

		    mov %ebp, %esp
      	pop %ebp


		mov $0, %eax

		ret
