

.text
.global _start
_start:
.equ NUM, 15
		LDR		R13, =STACK 		@ point stack pointer to low end of stack space
		ADD 	R13, R13, #0x100	@ top of stack
		LDR 	R1, =CELSIUS		@ declare celsius array and pointer
		LDR 	R2, =FAHREN		@ point to fahrenheit array
		LDR 	R6, =CELSIUS_AVG	@ declare the register to hold the average celsius temp
		LDR 	R6, [R1], #4	@ get bytes for first temp, increment
		MOV 	R4, #NUM		@ make counter for procedure
		BL		AVG				@ branch to average procedure 
AVG:	STMFD	R13!, {R6-R8,R14}	@ Save used registers on stack
NEXT: 	LDR 	R7, [R1], #4	@ get bytes for second temp, increment
		ADD		R8, R6, R7 		@ add the two temps
		LSR		R6, R8, #1		@ divide by two and store back into R6
		SUBS 	R4,#1
		BNE 	NEXT
		LDMFD	R13!, {R6-R8,PC} @ restore registers and return

.data
CELSIUS: .word 0x4E, 0x39, 0x0, 0x2F, 0x4A, 0x3B, 0x37, 0x22, 0x33, 0x43, 0x2E, 0x4A, 0x3C, 0x35, 0x22, 0x42
FAHREN: .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
CELSIUS_AVG: .word 0x0
STACK: 	.align 2
		.rept 256 				@reserve 256 bytes for stack
		.byte 0x00				@initialize with 0x00 
		.endr
.END