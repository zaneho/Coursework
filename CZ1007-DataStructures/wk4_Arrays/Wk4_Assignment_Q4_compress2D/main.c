#include <stdio.h>
#define SIZE 100
void compress2D(int data[SIZE][SIZE], int rowSize, int colSize);
int main()
{
    int data[SIZE][SIZE];
    int i,j;
    int rowSize, colSize;

    printf("Enter the array size (rowSize, colSize): \n");
    scanf("%d %d", &rowSize, &colSize);
    printf("Enter the matrix (%dx%d): \n", rowSize, colSize);
    for (i=0; i<rowSize; i++)
        for (j=0; j<colSize; j++)
            scanf("%d", &data[i][j]);
    printf("compress2D(): \n");
    compress2D(data, rowSize, colSize);
    return 0;
}
void compress2D(int data[SIZE][SIZE], int rowSize, int colSize)
{
    /* Write your program code here */
    int row, col, binData, binPrevious;
    int counterPrevious = 0;

    for(row=0; row<rowSize; row++){
        binPrevious = data[row][0];

        for(col=0; col<rowSize; col++){
            if(data[row][col] != binPrevious){
                printf("%d %d ", binPrevious, counterPrevious);

                binPrevious = data[row][col];
                counterPrevious=1;
            }else{
                counterPrevious++;
            }

        }
           printf("%d %d \n", binPrevious, counterPrevious);
           counterPrevious=0;
    }
}
