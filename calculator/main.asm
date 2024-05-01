%include        'include.asm'

section .data
msg1:           db              " remainder ",  0

section .text
global  _start

_start:
        pop             r8
        pop             rsi
        dec             r8
        xor             rdx,            rdx

nextArg:
        cmp             r8,             0
        jz              noMoreArgs
        pop             rsi
        call            atoi
        add             rdx,            rax
        dec             r8
        jmp             nextArg

noMoreArgs:
        mov             rax,            rdx
        call            iprintLF
        call            quit