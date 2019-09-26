
.globl fpuStat
.type fpuStat, @function
.globl fpuStackOverflow
.type fpuStackOverflow, @function
.globl fpuSetControl
.type fpuSetControl, @function


.data
	val: .float 1.0 
	intVar: .short 0x07f 
	intVar2: .short 0x14

fpuStat:
	push %ebp
	mov %esp, %ebp
	
	FSTCW intVar2
	mov intVar2, %ax	

	mov %ebp, %esp
	pop %ebp
	ret

fpuSetControl:
        push %ebp
        mov %esp, %ebp
	
	#mov %ax, intVar
	FLDCW intVar
	#FSTCW intVar

	mov %ebp, %esp
        pop %ebp
        ret


fpuStackOverflow: 
        push %ebp
        mov %esp, %ebp

	FLD val
	FLD val
	FLD val
	FLD val
	FLD val
	FLD val
	FLD val
	FLD val
	FLD val


        mov %ebp, %esp
        pop %ebp
        ret
 
