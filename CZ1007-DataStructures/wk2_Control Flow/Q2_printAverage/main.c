#include <stdio.h>
int main()
{
    int total, count, lines, input;
    double average;
    int i;
    printf("Enter number of lines: \n");
    scanf("%d", &lines);

    /* Write your program code here */
    for(i=0; i<lines; i++){
        total = 0;
        count = 0;

        printf("Enter line %d (end with -1): \n", i+1);
        scanf("%d", &input);

        while(input != -1){
            total += input;
            count++;
            scanf("%d", &input);

        }

        //because if enter line = -1, count will be zero, therefore /0 = runtime error
        //therefore use
        //if(count > 0){
        //  average = (double)total/count;
        //} else(average = 0; )
        average = (double)total/count; //note: int/int
        printf("Average = %.2f \n", average);

    }

    return 0;
}
