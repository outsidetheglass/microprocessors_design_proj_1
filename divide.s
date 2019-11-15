.text
.global _start
_start:
.equ NUM, 15
		LDR		R13, =STACK 		@ point stack pointer to low end of stack space
		ADD 	R13, R13, #0x100	@ top of stack
		MOV		R12, #0
		MOV		R11, #45
		BL 		DIVIDE
		
DIVIDE: STMFD	R13!, {R11,R14} @ R11 is our original number
NEXT:	ADD		R12, R12, #1		@ Add one to our divisor, result will be the original divided by nine is
		SUB		R11, R11, #9		@ subtract 9 from R11 and put into R11
		CMP		R11, #0				@ check if R11 is zero yet, loop will end when it is
		BNE NEXT
		
.data
STACK: 	.align 2
		.rept 256 				@reserve 256 bytes for stack
		.byte 0x00				@initialize with 0x00 
		.endr
.END