default rel

segment .data
    msg1 db "Hello World!", 0xd, 0xa, 0

segment .text

global main
extern ExitProcess
extern printf

main:
    push    rbp
    mov     rbp, rsp ; setup stack frame
    sub     rsp, 32


    xor     rax, rax ; return 0
    call    ExitProcess

