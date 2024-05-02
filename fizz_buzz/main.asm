%include        'include.asm'

section .data

fizz:           db              "Fizz", 0
buzz:           db              "Buzz", 0

section .text
global  _start

_start:
        mov             r8,             0

nextNumber:
        inc             r8

.checkFizz:
        xor             rdx,            rdx

        mov             rax,            r8
        mov             rbx,            3
        div             rbx
        mov             r9,             rdx
        cmp             r9,            0
        jne             .checkBuzz

        mov             rsi,            fizz
        call            sprint

.checkBuzz:
        xor             rdx,            rdx

        mov             rax,            r8
        mov             rbx,            5
        div             rbx
        mov             r10,            rdx
        cmp             r10,            0
        jne             .checkInt
        mov             rsi,            buzz

        call            sprint
        jmp             .continue

.checkInt:
        cmp             r9,            0
        je              .continue

        cmp             r10,            0
        je              .continue

        mov             rax,            r8
        call            iprint

.continue:
        mov             rsi,            10
        push            rsi
        mov             rsi,            rsp
        call            sprint
        pop             rsi

        cmp             r8,             100
        jne             nextNumber

        call            quit