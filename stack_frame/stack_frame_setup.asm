
segment .text
global main
extern exit

main:
    push rbp ; Push Base Pointer On Stack
    mov rbp, rsp ; Put address of Stack Pointer as Base Pointer
    sub rsp, 32 ; Put Stack Pointer 32 Bytes below original Space

    ; On Windows you must reserve 32 Bytes before calling 
    ; Shadow Space is dedicated memory for saving  rcx, rdx, r8 and r9 (argument registers)

    mov ecx, 5 ; parameter for exit function
    call exit
