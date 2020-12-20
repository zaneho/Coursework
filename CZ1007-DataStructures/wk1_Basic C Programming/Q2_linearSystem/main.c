#include <stdio.h>
#include <math.h>
int main()
{
    float a1, b1, c1, a2, b2, c2;
    float x, y, denorminator;
    /* Write your program code here */
    printf("Enter the values for a1, b1, c1, a2, b2, c2:\n");
    scanf("%f %f %f %f %f %f", &a1, &b1, &c1, &a2, &b2, &c2);



    //x = ((b2*c1) - (b1*c2))/ ((a1*b2)-(a2*b1));
    //y = ((a1*c2)-(a2*c1)) / ((a1*b2)-(a2*b1));
    //since denominator same, can declare another variable
    if (denorminator <= -0.001 || denorminator >= 0.0001){
        x = ((b2*c1) - (b1*c2))/ denorminator;
        y = ((a1*c2)-(a2*c1)) / denorminator;

        printf("x = %.2f and y = %.2f", x, y);
    }
    else{
        printf("Unable to compute. Denominator is 0! \n");
    }

    return 0;
}
