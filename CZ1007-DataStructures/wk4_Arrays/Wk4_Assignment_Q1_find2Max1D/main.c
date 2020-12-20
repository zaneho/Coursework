#include <stdio.h>
void find2Max1D(int ar[], int size, int *max1, int *max2);
int main()
{
    int max1,max2;
    int ar[10],size,i;

    printf("Enter array size: \n");
    scanf("%d", &size);
    printf("Enter %d data: \n", size);
    for (i=0; i<size; i++)
        scanf("%d", &ar[i]);
    find2Max1D(ar,size,&max1,&max2);
    printf("Max1: %d\nMax2: %d\n",max1,max2);
    return 0;
}
void find2Max1D(int ar[], int size, int *max1, int *max2)
{
    /* Write your program code here */
    int i = 0;
    int largest = ar[0], smallest = ar[0];

    for (i=0; i<size; i++){
        if(largest < ar[i]){
            largest = ar[i];
        }
    }
    for (i=0; i<size; i++){
        if(smallest > ar[i]){
            smallest = ar[i];
        }
    }

    *max1 = largest;

    *max2 = smallest;
    for (i=0; i<size; i++){
        if(*max2 < ar[i] && ar[i] < largest){
            *max2 = ar[i];
        }
    }

}
