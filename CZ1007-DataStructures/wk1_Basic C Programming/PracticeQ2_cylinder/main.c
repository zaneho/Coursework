#include <stdio.h>
#define PI 3.1416
int main()
{
    float radius, height, vol, surfaceArea;

    printf("Enter the radius: \n");
    scanf("%f", &radius);

    printf("Enter the height: \n");
    scanf("%f", &height);

    vol = PI * radius * radius * height;
    surfaceArea = (2 * PI * radius * height) + (2 * PI * radius * radius);

    printf("The volume is: %.2f \n", vol);
    printf("The surface area is: %.2f \n", surfaceArea);

    return 0;
}
