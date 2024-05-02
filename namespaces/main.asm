%include        'include.asm'
 
section .data
msg1:           db              'Jumping to finished label.',   0h        
msg2:           db              'Inside subroutine number: ',   0h        
msg3:           db              'Inside subroutine "finished".',        0h     
 
section .text
global  _start
 
_start:

subroutineOne:
        mov             rsi,            msg1
        call            sprintLF
        jmp             .finished

.finished:
        mov             rsi,            msg2
        call            sprint
        mov             rax,            1
        call            iprintLF

subroutineTwo:
        mov             rsi,            msg1
        call            sprintLF
        jmp             .finished

.finished:
        mov             rsi,            msg2
        call            sprint
        mov             rax,            2
        call            iprintLF

        mov             rsi,            msg1
        call            sprintLF
        jmp             finished

finished:
        mov             rsi,            msg3
        call            sprintLF
        call            quit
