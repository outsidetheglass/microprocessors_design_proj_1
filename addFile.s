.text
.global _start
_start:
.equ NUM, 4
		LDR R1,=MULTIPLICANDS
		MOV R2, #NUM
NEXT: 	LDRH R3, [R1]
		SUBS R4,#1
		BNE NEXT
		NOP

.data
MULTIPLICANDS: 	
.align 2
	.HWORD 0x4321, 0x2222, 0x3333, 0x4444
.END