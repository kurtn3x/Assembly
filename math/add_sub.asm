default rel

segment .data
    msg1 db "Number: %i", 0xd, 0xa, 0
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

    ; Addition
    ; sets overflow flag if addition overflows
    ; sets sign flag to sign bit of result
    ; sets zero flag if result is zero
    ; inc can be used to increment a register or memory value
    mov rdx, [num1]
    add rdx, [num2]
    lea rcx, [msg1]
    call printf

    ; can also directly add into memory location
    mov r10, [num2]
    add [num1], r10
    ; num 1 is now 50

    ; num1 +=1
    inc qword [num1]
 
    lea rcx, [msg1]
    mov rdx, [num1]
    call printf

    ; Subtraction
    ; sets same flags as addition
    ; dec can be used to decrement a register or memory value
    mov rdx, [num1]
    sub rdx, [num2]
    lea rcx, [msg1]
    call printf

    mov r10, [num2]
    sub [num1], r10
    ; num1 is now 11
   
    ; num1 -= 1
    dec qword [num1]

    lea rcx, [msg1]
    mov rdx, [num1]
    call printf

    ; num1 is now 10

    xor     rax, rax ; return 0
    call    ExitProcess

