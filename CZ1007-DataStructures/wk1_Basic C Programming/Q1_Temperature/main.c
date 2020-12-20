#include <stdio.h>

int main()
{
    float fahrenheit, celsius; //declare variables
    printf("Enter the temperature in degree F: \n");
    scanf("%f", &fahrenheit);

    /*Write your program code here */
    //celsius = (5/9)*(fahrenheit-32); //OUTPUT 0.00 because 5/9 integer division becomes 0
    //*Take note: int/int result is int


    //celsius = (5.0/9.0)*(fahrenheit-32); //add .0 to either 5 or 9
    celsius = (fahrenheit-32)*5/9; //or shift 5/9 behind

    printf("Converted degree in C: %.2f\n", celsius); //without .2, default is 6 decimal place
    return 0;
}
