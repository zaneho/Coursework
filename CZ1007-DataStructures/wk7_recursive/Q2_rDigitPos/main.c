#include <stdio.h>
int rDigitPos1(int num, int digit);
void rDigitPos2(int num, int digit, int *pos);
int main()
{
    int number, digit, result=0;

    printf("Enter the number: \n");
    scanf("%d", &number);
    printf("Enter the digit: \n");
    scanf("%d", &digit);
    printf("rDigitPos1(): %d\n", rDigitPos1(number, digit));
    rDigitPos2(number, digit, &result);
    printf("rDigitPos2(): %d\n", result);
    return 0;
}
int rDigitPos1(int num, int digit)
{
    /* Write your program code here */
    int p;

    if(num%10 == digit){
        return 1;
    }else if(num < 10)
    {
        return 0;
    }else{
        p = rDigitPos1(num/10, digit);
        if(p>0){
            return p + 1;
        }else{
            return 0;
        }
    }
}
void rDigitPos2(int num, int digit, int *pos)
{
    /* Write your program code here */
    if(num%10 == digit){
        *pos = 1;
    }else if(num < 10)
    {
        *pos = 0;
    }else{
        rDigitPos2(num/10, digit, pos);
        if(*pos > 0){
            *pos = *pos + 1;
        }else{
            *pos = 0;
        }
    }
}
