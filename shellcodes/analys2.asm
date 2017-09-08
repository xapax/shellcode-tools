


; open file
push 0x5
pop eax
pop ebx
xor ecx,ecx
int 0x80

; read file
mov ebx,eax
mov al,0x3
mov edi,esp
mov ecx,edi
xor edx,edx
mov dh,0xff
mov dl,0xff
int 0x80

; write
mov edx,eax
push 0x4
pop eax
mov bl, 0x1
int 0x80

; exit
push 0x1
pop eax
inc ebx
int 0x80
