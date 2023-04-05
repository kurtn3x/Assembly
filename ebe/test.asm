segment .text
global main
extern exit

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32 ; shadow parameter space
    mov ecx, 5 ; parameter for exit function
    call exit
