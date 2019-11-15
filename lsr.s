.text
.global _start
_start:
		LDR 	R6, =#65
		LSR		R10, R6, #3
		SUB 	R11, R10, #1
.END