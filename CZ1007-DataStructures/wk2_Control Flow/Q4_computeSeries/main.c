#include <stdio.h>
int main()
{
    int n, denominator = 1;
    float x, result = 1.0, numerator = 1.0;
    printf("Enter x: \n");
    scanf("%f", &x);

    /* Write your program code here */
    // !1 = 1, !2 = 2(1), !3 = 3(2)(1), !4 = 4(3)(2)(1), !5 = 5(4)(3)(2)(1)
    for (n=1; n <= 10; n++){
        numerator *= x;
        denominator *= n;
        result += numerator/denominator;
    }

    printf("Result = %.2f\n", result);
    return 0;
}
