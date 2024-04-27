
strlen:
	push		rcx
	mov		rcx,		rsi

nextchar:
	cmp	byte	[rcx],		0
	jz		print
	inc		rcx
	jmp 		nextchar

print:
	sub		rcx,		rsi
	mov		rdx,		rcx
	pop		rcx
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