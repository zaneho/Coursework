#include <stdio.h>
#include <string.h>
struct student
{
    char name[20]; /* student name */
    double testScore; /* test score */
    double examScore; /* exam score */
    double total;  /* total = (testScore+examScore)/2 */
};
double average();
int main()
{
    printf("average(): %.2f\n", average());
    return 0;
}
double average()
{
    /* Write your program code here */
    struct student studDB[50];
    double average, total=0;
    int i=0;

    printf("Enter student name: \n");
    gets(studDB[i].name);

    while(strcmp(studDB[i].name, "END") != 0) //To check not equal !=0 //To check equal ==0
    {
        printf("Enter test score: \n");
        scanf("%lf", &studDB[i].testScore);
        printf("Enter exam score: \n");
        scanf("%lf", &studDB[i].examScore);

        average = (studDB[i].testScore + studDB[i].examScore) /2;
        studDB[i].total = average;
        total += average;

        printf("Student %s total = %.2lf \n", studDB[i].name, studDB[i].total);


        i++;

        printf("Enter student name: \n");
        scanf("\n"); //**Flush when you read a number followed by a string/char
        //getChar(); //dummyChar=getChar(); ,dont need dummyChar since you dont need know
        //char dummychar scanf("%c", &dummyChar);
        gets(studDB[i].name);
    }

    if(i != 0)
    {
        return total/i;
    }else{
        return 0;
    }
}
