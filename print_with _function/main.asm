
section	.data
msg:	db	"Hello, it's an arbitrary text",	10

section .text
global	_start

_start:
	mov		rsi,		msg
	call		strlen

	mov		rax,		1
	mov		rdi,		1
	syscall

	mov		rax,		60
	xor		rdi,		rdi
	syscall

strlen:
	push		rcx
	mov		rcx,		rsi

nextchar:
	cmp	byte	[rcx],		0
	jz		print
	inc		rcx
	jmp		nextchar

print:
	sub		rcx,		rsi
	mov		rdx,		rcx
	pop		rcx
	ret