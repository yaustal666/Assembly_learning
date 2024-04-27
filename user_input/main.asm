%include        'include.asm'

section .data
msg1:   db      "Please enter your name: ",     0
msg2:   db      "Hello, ",                      0

section .bss
sinput: resb    255

section .text
global  _start

_start:
        mov             rsi,            msg1
        call            sprint

        mov             rax,            0
        mov             rdi,            0
        mov             rsi,            sinput
        mov             rdx,            255
        syscall

        mov             rsi,            msg2
        call            sprint

        mov             rsi,            sinput
        call            sprint

        call            quit