#include <stdio.h>
char *stringncpy(char *s1, char *s2, int n);
int main()
{
    char sourceStr[40], targetStr[40], *target;
    int length;
    printf("Enter the string: \n");
    gets(sourceStr);
    printf("Enter the number of characters: \n");
    scanf("%d", &length);
    target = stringncpy(targetStr, sourceStr, length);
    printf("stringncpy(): %s\n", target);
    return 0;
}
char *stringncpy(char *s1, char *s2, int n)
{
    /* Write your program code here */
    int i, j;

    for(i=0; i < n; i++){ //copy char by char until all n char are copied
        if(s2[i] != '\0'){ //or until null char in s2 is hit
            s1[i] = s2[i];

        }else{
            break; //Break out of loop when you reach \0
        }
    }

    s1[i] = '\0'; //*IMP to end with null!!

    for(j = i+1; j < n; j++){ //in qns: if s2 less than n char, fill the rest with \0
        s1[j] = '\0';
    }

    return s1;
}
