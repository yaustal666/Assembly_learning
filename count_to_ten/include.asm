
; print integer
iprint:
	push		rax
	push		r9
	push		rdx
	push		rsi
	mov		r9,		0

divideLoop:
	inc		r9

	mov		rdx,		0
	mov		rsi,		10
	idiv		rsi
	add		rdx,		48
	push		rdx
	cmp		rax,		0
	jnz		divideLoop

printLoop:
	dec		r9

	mov		rsi,		rsp
	call		sprint
	pop		rsi
	cmp		r9,		0
	jnz		printLoop

	pop		rsi
	pop		rdx
	pop		r9
	pop		rax
	ret

iprintLF:
	call		iprint

	push		rsi
	mov		rsi,		10
	push		rsi
	mov		rsi,		rsp
	call		sprint
	pop		rsi
	pop		rsi
	ret

; print text
strlen:
	mov		rdx,		rsi

nextchar:
	cmp	byte	[rdx],		0
	jz		print
	inc		rdx
	jmp 		nextchar

print:
	sub		rdx,		rsi
	ret

sprint:
	push		rax
	push		rdi
	push		rdx
	call		strlen

	mov		rax,		1
	mov		rdi,		1
	syscall

	pop		rdx
	pop		rdi
	pop		rax
	ret

sprintLF:
	call		sprint

	push		rsi
	mov		rsi,		10
	push		rsi
	mov		rsi,		rsp
	call		sprint

	pop		rsi
	pop		rsi
	ret

quit:
	mov		rax,		60
	xor		rdi,		rdi
	syscall
	ret