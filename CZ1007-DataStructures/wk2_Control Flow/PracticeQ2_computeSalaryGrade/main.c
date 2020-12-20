#include <stdio.h>
int main()
{
    int salary, merit;

    printf("Enter the salary: \n");
    scanf("%d", &salary);
    printf("Enter the merit: \n");
    scanf("%d", &merit);

    /* Write your program code here */
    if (salary >= 700 && salary <= 899){
        if (salary >= 700 && salary <= 799 && merit < 20 ){
            printf("The grade: B \n");
        } else {
            printf("The grade: A \n");
        }
    } else if (salary >= 600 && salary <= 799){
        if (salary >= 600 && salary <= 649 && merit < 10 ){
            printf("The grade: C \n");
        } else {
            printf("The grade: B \n");
        }
    } else if (salary >= 500 && salary <= 649)
    {
        printf("The grade: C \n");
    } else
    {
        printf("Your salary $%d does not fall in any grade range \n", salary);
    }

    //SUGGESTED ANS - shorter
//    if (salary>799 || (salary>=700 && merit>=20))
//      printf("The grade: A\n");
//    else if (salary>649||(salary>=600 && merit>=10))
//      printf("The grade: B\n");
//    else if (salary>=500)
//      printf("The grade: C\n");

    return 0;
}
