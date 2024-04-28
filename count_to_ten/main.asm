%include        'include.asm'

section .text
global  _start

_start:
        mov             r9,            0

nextNumber:
        inc             r9

        mov             rax,            r9
        call            iprintLF

        cmp             r9,            10
        jne             nextNumber
        
        call            quit