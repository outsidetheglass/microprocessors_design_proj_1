.text
.global _start
_start:
		LDR 	R6, =#65
		LSR		R10, R6, #3 @ This line divides by nine.
		SUB 	R11, R10, #1 @ is incorrect by a bit at higher values, this is correct if above is wrong.
.END