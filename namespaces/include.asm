; -----------------------------------
; rax <- atoi (rsi)
; Translate ascii to integer
atoi:
	push		rbx
	push		rcx
	push		rdx
	xor		rax,		rax
	xor		rbx,		rbx

.multiplyLoop:
	xor		rbx,		rbx
	mov		bl,		[rsi+rcx]
	cmp		bl,		48
	jl		.finished
	cmp		bl,		57
	jg		.finished

	sub		bl,		48
	add		rax,		rbx
	mov		rbx,		10
	mul		rbx
	inc		rcx
	jmp		.multiplyLoop

.finished:
	cmp		rcx,		0
	je		.restore
	mov		rbx,		10
	div		rbx

.restore:
	pop		rdx
	pop		rcx
	pop		rbx
	ret

; -----------------------------------
; void <- iprint (rax)
; Print an integer
iprint:
	push		rax
	push		r9
	push		rdx
	push		rsi
	mov		r9,		0

.divideLoop:
	inc		r9

	mov		rdx,		0
	mov		rsi,		10
	idiv		rsi
	add		rdx,		48
	push		rdx
	cmp		rax,		0
	jnz		.divideLoop

.printLoop:
	dec		r9

	mov		rsi,		rsp
	call		sprint
	pop		rsi
	cmp		r9,		0
	jnz		.printLoop

	pop		rsi
	pop		rdx
	pop		r9
	pop		rax
	ret
; -----------------------------------
; void <- iprintLF (rax)
; Print an integer with linefeed
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

; -----------------------------------
; rdx <- strlen(rsi)
; Calculate the length of a string
strlen:
	mov		rdx,		rsi

.nextchar:
	cmp	byte	[rdx],		0
	jz		.finished
	inc		rdx
	jmp 		.nextchar

.finished:
	sub		rdx,		rsi
	ret

; -----------------------------------
; void <- sprint(rsi)
; Print a string
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

; -----------------------------------
; void <- sprintLF(rsi)
; Print a string with linefeed
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

; -----------------------------------
; void <- quit()
; Exit the program
quit:
	mov		rax,		60
	xor		rdi,		rdi
	syscall
	ret