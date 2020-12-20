#include <stdio.h>
void swapMinMax1D(int ar[], int size);
int main()
{
   int ar[50],i,size;

   printf("Enter array size: \n");
   scanf("%d", &size);
   printf("Enter %d data: \n", size);
   for (i=0; i<size; i++)
      scanf("%d",ar+i);
   swapMinMax1D(ar, size);
   printf("swapMinMax1D(): ");
   for (i=0; i<size; i++)
      printf("%d ",*(ar+i));
   return 0;
}
void swapMinMax1D(int ar[], int size)
{
  /* Write your code here */
  int i = 0, posMax = 0, posMin = 0;
  int Max = ar[0], Min = ar[0];

    for (i=0; i<size; i++){
        if(Max <= ar[i]){
            Max = ar[i];
            posMax = i;
        }
    }
    for (i=0; i<size-1; i++){
        if(Min >= ar[i]){
            Min = ar[i];
            posMin = i;
        }
    }

    ar[posMax] = Min;
    ar[posMin] = Max;
}
