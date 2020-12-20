#include <stdio.h>
int rNumDigits1(int num);
void rNumDigits2(int num, int *result);
int main()
{
    int number, result=0;

    printf("Enter the number: \n");
    scanf("%d", &number);
    printf("rNumDigits1(): %d\n", rNumDigits1(number));
    rNumDigits2(number, &result);
    printf("rNumDigits2(): %d\n", result);
    return 0;
}
int rNumDigits1(int num)
{
    /* Write your program code here */
    if(num/10 < 1){
        return 1;
    }else{
        return rNumDigits1(num/10) + 1;
    }
}
void rNumDigits2(int num, int *result)
{
    /* Write your program code here */
    if(num/10 < 1){
        *result = 1;
    }else{
        rNumDigits2(num/10, result);
        *result = *result + 1;
    }
}
