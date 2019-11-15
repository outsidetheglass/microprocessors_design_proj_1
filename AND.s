.text
.global _start
_start:
		MOV R1,#0x1234
		MOV R2,#0x2345
		MOV R3,#0xFFFF
		MOV R4,#0x000F
		MOV R5,#0x11F0
		AND R6, R1, R2
		AND R7, R2, R5
		AND R8, R1, R3
		AND R9, R5, R4
		AND R10, R4, R3
		AND R11, R4, R5
		AND R12, R2, R4
.END