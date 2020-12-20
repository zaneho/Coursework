#include <stdio.h>
#define INIT_VALUE 0
#include <math.h>
int extOddDigits1(int num);
void extOddDigits2(int num, int *result);
int main()
{
    int number, result = INIT_VALUE;

    printf("Enter a number: \n");
    scanf("%d", &number);
    printf("extOddDigits1(): %d\n", extOddDigits1(number));
    extOddDigits2(number, &result);
    printf("extOddDigits2(): %d\n", result);
    return 0;
}
int extOddDigits1(int num)
{
    /* Write your program code here */
    int r=0, i=0;
    double newNum = -1;
    while(num > 0){
        r = num % 10;
        if(r%2 != 0){
            if(newNum == -1){
                newNum = r;
            }else{
                i++;
                  newNum = newNum + (r*pow(10,i));
            }
        }
        num /= 10;
    }

    return newNum;

}
void extOddDigits2(int num, int *result)
{
    /* Write your program code here */
    int r=0, i=0;
    double newNum = -1;
    while(num > 0){
        r = num % 10;
        if(r%2 != 0){
            if(newNum == -1){
                newNum = r;
            }else{
                i++;
                  newNum = newNum + (r*pow(10,i));
            }
        }
        num /= 10;
    }
    *result = newNum;
}
