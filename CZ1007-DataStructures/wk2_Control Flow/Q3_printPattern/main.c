#include <stdio.h>
int main()
{
    int row, col, height;
    int num = 0; //every 3 rows need reset num
    printf("Enter the height: \n");
    scanf("%d", &height);
    printf("Pattern: \n");

    /* Write your program code here */

    if (height >= 1 && height <= 10){
        for(row = 1; row <= height; row++){ //or row = 0; row < height

            num++;
            for(col = 0; col < row; col++){

                //print out one row of pattern
                printf("%d", num);

            }
            printf("\n"); //only when you finish printing one row then \n, to start new row
            /*
                if (num == 3){ //if num is 3
                num = 0; //reset to 0
                }
                */
             num = num % 3;
        }
    }
    return 0;
}
