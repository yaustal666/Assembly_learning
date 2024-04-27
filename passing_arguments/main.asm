%include	'include.asm'

section .text
global	_start

_start:
	pop		r8
	pop		rsi
	dec		r8

nextArg:
	cmp		r8,		0
	jz		noMoreArgs
	pop		rsi
	call		sprintLF
	dec		r8
	jmp		nextArg

noMoreArgs:
	call		quit