#include <stdio.h>

int main()
{
    int hours;
    float tax, grossPay, netPay;

    printf("Enter hours of work: \n");
    scanf("%d", &hours);

    /* Write your program code here */
    if(hours > 40){ //over-time pay rate: 1.5 of basic
        grossPay = (40* 6.00) + ((hours - 40) * 6.00 * 1.5);
    }
    else{ grossPay = hours * 6.00; } //basic pay: $6.00/h

    if(grossPay <= 1000){
        tax = grossPay * 10/100;
    }
    else if (grossPay <= 1500 && grossPay > 1000){
            tax = (10/100 * 1000) + (20/100 * (grossPay-1000));
        }
    else{
        tax = (10/100 * 1000) + (20/100 * 500) + (grossPay-1000-500);
    }

    netPay = grossPay - tax;

    printf("Gross pay = %.2f\n", grossPay);
    printf("Tax = %.2f\n", tax);
    printf("Net pay = %.2f\n", netPay);
    return 0;
}
