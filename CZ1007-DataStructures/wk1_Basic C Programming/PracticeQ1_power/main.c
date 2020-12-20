#include <stdio.h>
int main()
{
    float current, resistance, powerLoss;

    /* Write your program code here */
    printf("Enter the current: \n");
    scanf("%f", &current);

    printf("Enter the resistance: \n");
    scanf("%f", &resistance);

    powerLoss = current*current*resistance;

    printf("The power loss: %.2f", powerLoss);

    return 0;
}
