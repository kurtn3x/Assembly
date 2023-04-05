default rel

segment .data
    msg1 db "Please Enter number 1: ", 0xd, 0xa, 0
    msg2 db "Please Enter number 2: ", 0xd, 0xa, 0 
    input db "%d", 0
    result db "Result is: %i", 0xd, 0xa, 0

segment .bss
    number1 resb 8
    number2 resb 8

segment .text
global main

extern ExitProcess
extern printf
extern scanf

main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    lea rcx, [msg1] ; load msg into rcx
    call printf ; print msg

    lea rdx, number1 ; load undefined variable number1 into rdx
    lea rcx, input ; input message
    call scanf ; read input

    lea rcx, [msg2]
    call printf

    lea rdx, number2
    lea rcx, input
    call scanf

    mov r8, [number1]
    add r8, [number2]

    lea     rcx, [result]
    mov rdx, r8
    ; movsx: move byte, sign extend
    ; movzx : move word, zero extend
    ; movsxd     rdx, dword [r8] ; move dword, sign extend
    ; can also just use mov rdx, [getMessage] above
    ; moves our input 'getMessage' into rdx for formatted output
    call    printf

    xor     rax, rax
    call    ExitProcess
