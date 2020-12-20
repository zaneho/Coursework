#include <stdio.h>
#define INIT_VALUE -1
int palindrome(char *str);
int main()
{
    char str[80];
    int result = INIT_VALUE;

    printf("Enter a string: \n");
    gets(str);
    result = palindrome(str);
    if (result == 1)
        printf("palindrome(): A palindrome\n");
    else if (result == 0)
        printf("palindrome(): Not a palindrome\n");
    else
        printf("An error\n");
    return 0;
}
int palindrome(char *str)
{
    /* Write your code here */
    int i, len;

    for(i=0; str[i] != '\0'; i++){
        len++;
        i++;
    }

    for(i=0; i < len/2; i++){
        if(str[i] != str[len-(i+1)]){
            return 0;
        }
    }

    if(len == 0){ //qns not clear but if empty string, palindrome??
        return -1;
    }else{
        return 1;
    }

    return 1;
}
