%include        'include.asm'

section .data

command:         db              "/bin/ls",           0
arg1:            db              "-l",        0
arguments:       dq              command,       arg1,   0
envinornment:    db              0

section .text
global  _start

_start:
        mov             rax,            59
        mov             rdi,            command
        mov             rsi,            arguments
        mov             rdx,            envinornment
        syscall

        call            quit