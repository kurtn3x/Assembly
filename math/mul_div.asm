default rel

segment .data
    msg1 db "Number: %i %i", 0xd, 0xa, 0
    num1 dq 10
    num2 dq 40

segment .text

global main
extern ExitProcess
extern printf

main:
    push    rbp
    mov     rbp, rsp ; setup stack frame
    sub     rsp, 32

    
    ; Multiplication
    ; with unisgned integers: mul, with signed integers: imul
    ; 3forms: with 1operand, 2operands and 3 operands

    ; 1 operand
    ; multiplies val in rax by the source operand
    ; result is stored in rdx:rax
    mov rax, 5
    imul qword [num1]

    lea rcx, [msg1]
    mov r8, rax
    ; low order bits in rax
    ; high order bits in rdx
    call printf


    xor     rax, rax ; return 0
    call    ExitProcess

