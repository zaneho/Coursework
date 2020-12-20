#include <stdio.h>
#include <ctype.h>

int longWordLength(char *s);
int main()
{
    char str[80];

    printf("Enter a string: \n");
    gets(str);
    printf("longWordLength(): %d\n", longWordLength(str));
    return 0;
}
int longWordLength(char *s)
{
    /* Write your code here */
    int i=0, count=0, maxcount=0;

    for(i=0; s[i]!= '\0'; i++){
        if(s[i] != ' ' && isalpha(s[i]) != 0){
            count++;
        }else{
            if(maxcount < count){
            maxcount = count;
            }
            count = 0;
        }
    }

    if(maxcount < count){
            maxcount = count;
    }

    return maxcount;
}
