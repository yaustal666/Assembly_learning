%include	'include.asm'

section .data
msg1:	db	"Hello arbitrary text 1",	0
msg2:	db	"Hello arbitrary text 2",	0

section .text
global	_start

_start:
	mov		rsi,		msg1
	call		sprintLF

	mov		rsi,		msg2
	call		sprintLF

	call		quit