#include <stdio.h>
int rSquare1(int num);
void rSquare2(int num, int *result);
int main()
{
    int number, result=0;

    printf("Enter the number: \n");
    scanf("%d", &number);
    printf("rSquare1(): %d\n", rSquare1(number));
    rSquare2(number, &result);
    printf("rSquare2(): %d\n", result);
    return 0;
}
int rSquare1(int num)
{
    /* Write your program code here */
    int result = 1;
    if(num == 1){
        return result;
    }else{
        return rSquare1(num-1) + (2*num -1);
    }
}
void rSquare2(int num, int *result)
{
    /* Write your program code here */
    *result = 1;
    if(num == 1){
        *result = 1;
    }else{
        rSquare2(num-1, result);
        *result += (2*num -1);
    }
}
