#include <stdio.h>
#include <string.h>

void maxCharToFront(char *str);
int main()
{
    char str[80];

    printf("Enter a string: \n");
    gets(str);
    printf("maxCharToFront(): ");
    maxCharToFront(str);
    puts(str);
    return 0;
}
void maxCharToFront(char *str)
{
    /* Write your code here */
    int i=0, j=1, maxchar=str[0], paste=0;
    char str1[80];

    while(str[i] != '\0')
    {
        if(maxchar < str[i])
        {
            maxchar = str[i];
        }
        i++;
    }

    for(i=0; str[i] != '\0'; i++)
    {
        str1[0] = maxchar;
        if(str[i] == maxchar && paste==0){
            paste=1;
        }else{
            str1[j] = str[i];
            j++;
        }

    }

    str1[i] = '\0';
    strcpy(str, str1);

    //str[i+1] = '\0';

}
