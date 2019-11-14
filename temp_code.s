

.text
.global _start
_start:
.equ NUM, 8
		LDR		R13,=STACK 		@ point stack pointer to low end of stack space
		LDR 	R1,=CELSIUS		@ declare celsius array and pointer
		LDR 	R2,=FAHREN		@ point to fahrenheit array
		MOV 	R4, #NUM		@ make counter for procedure
		BL		AVG				@ branch to average procedure 
AVG:	STMFD	R13!, {R6-R8,R14}	@ Save used registers on stack
NEXT: 	LDR 	R5, [R1], #4
		ADD 	R5, R5, #1
		STR 	R6, [R2], #4
		SUBS 	R4,#1
		BNE 	NEXT
		NOP

.data
CELSIUS: .byte 0x4E, 0x39, 0x0, 0x2F, 0x4A, 0x3B, 0x37, 0x22, 0x33, 0x43, 0x2E, 0x4A, 0x3C, 0x35, 0x22, 0x42
FAHREN: .byte 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
STACK: 	.align 2
		.rept 256 				@reserve 256 bytes for stack
		.byte 0x00				@initialize with 0x00 
		.endr
.END