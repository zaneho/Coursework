#include <stdio.h>
#define INIT_VALUE -1
int allEvenDigits1(int num);
void allEvenDigits2(int num, int *result);
int main()
{
    int number, result = INIT_VALUE;
    printf("Enter a number: \n");
    scanf("%d", &number);
    printf("allEvenDigits1(): ");
    result = allEvenDigits1(number);
    if (result == 1)
        printf("All Even\n");
    else if (result == 0)
        printf("Not All Even\n");
    else
        printf("Error\n");
    allEvenDigits2(number, &result);
    printf("allEvenDigits2(): ");
    if (result == 1)
        printf("All Even\n");
    else if (result == 0)
        printf("Not All Even\n");
    else
        printf("Error\n");
    return 0;
}
int allEvenDigits1(int num)
{
    /* Write your program code here */
    int r=0, outcome, i;

    for(i=0; i <= num; i++){
        r = num % 10;

        if (r=0 || r%2 == 0)
        {
            outcome = 1;
        } else{
            outcome = 0;
            break;
        }
        num /= 10;
    }
    return outcome;
}
void allEvenDigits2(int num, int *result)
{
    /* Write your program code here */
    int r=0, outcome, i;

    for(i=0; i <= num; i++){
        r = num % 10;

        if (r==0 || r%2 == 0)
        {
            outcome = 1;
        } else{
            outcome = 0;
            break;
        }
        num /= 10;
    }
    *result = outcome;
}
