
/* vulnerable.c
 *  Author: Mutti K
 *   Purpose: Demonstrate egg hunter shellcode. Supply shellcode as param 1 and overflow + egg hunter in param 2.
 *    Crashs when param 2 is 76 bytes
 *    */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int shellcode_buffer_size = 500;
int bof_buffer_size = 20; //20 get seg fault at 76 bytes

void overflow(char *shellc, char *hunter) {
    char egghunter[bof_buffer_size];
    char shellcode[shellcode_buffer_size];
    //Store shellcode on stack
    strncpy(shellcode,shellc, shellcode_buffer_size);
    //vuln function to overflow
    strcpy(egghunter, hunter);
}

int main(int argc, char *argv[])
{
    /*if no argument…*/
    if(argc <3)
    {
        printf("Syntax: %s <input shellcode (%d bytes)> <input bof+egghunter (%d bytes)>\n", argv[0], shellcode_buffer_size,bof_buffer_size);
        exit (0);
    }
    overflow(argv[1],argv[2]);
    return 0;
}
