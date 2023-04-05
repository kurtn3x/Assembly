segment .data ; declare variables / data
dd  4 ; define double word, 4 Byte
dd  4.4
times 10 dd 0
dw 1, 2 ; define word, 2 Byte
db 0xfb ; db = define byte, 8bit or char in c/c++
db "hello world", 0

segment .bss ; declare uninitialized storage space
resd 1
resd 10
resb 100 ; reserve 100 bytes

segment .text
global main ; so linker knows location of main

main:
    push rbp ; set up stack frame
    mov rbp, rsp ; rbp points to stack frame
    sub rsp, 32 ; shadow parameters

    xor eax, eax ; rax = 0 return value
    leave ; undo stack frame changes
    ret
