segment .data
    msg1 db "Some Output: %i", 0xd, 0xa, 0
    msg2 db "Ending, Bye!", 0xd, 0xa, 0
    ; msg1 define byte "Hello World!", \r, \n, Terminate String

segment .text

global main
extern ExitProcess
extern printf

main:
    push    rbp
    mov     rbp, rsp ; setup stack frame
    sub     rsp, 32

    mov r15, 5

loop:
    lea rcx, [msg1]
    mov rdx, r15
    call printf

    dec r15
    cmp r15, 0
    jnz loop
    jz end

end:
    lea rcx, [msg2]
    call printf

    xor     rax, rax ; return 0
    call    ExitProcess
