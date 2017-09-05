



#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"CODE";

main()
{
    printf("Shellcode Length: %d\n", strlen(code));

    int (*ret)() = (int(*)())code;

    ret();

}



/*
 * Compiles with these flags:
 * gcc -fno-stack-protection -z execstack program.c -o program
 * */
