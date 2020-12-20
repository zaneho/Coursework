// CX1007 Data Structures
// Week 9 Lab Tutorial - DynamicData-Linked Lists

#include "stdlib.h"
#include "stdio.h"
////////////////////////////////////////////////////////////

void insert(char *s,int n);
void removes(char *s, int n);

//////////////////////////////////////////////////////////
int main ()
{
    int n;
    char *s;
    int choice;


    printf("How many characters do you want to input: ");
    scanf("%d", &n);

    s=(char *)malloc((n+1)*sizeof(char));

    if (s==NULL)
    {
        printf("can't allocate the memory!");
        return;
    }

    printf("Input the string: ");
    scanf("%s",s);

    printf("The string is: %s\n", s);

    do
    {
        printf("Do you want to 1-insert or 2-remove or 3-quit?: ");
        scanf("%d",&choice);

        if (choice==1)
            insert(s,n);
        else if (choice==2)
            removes(s,n);
    }
    while (choice!=3);

    if(s!=NULL)
    {
        free(s);
        s=NULL;
    }

    return 0;
}

//////////////////////////////////////////
void removes(char *s, int n)
{
    // write your code here
    int i=0;

    for(i=0; i<n; i++)
    {
        *(s+i) = *(s+i+1);
    }

    printf("Resulting string: %s \n", s);
}

//////////////////////////////////////////
void insert(char *s, int n)
{
    // write your code here
    int i=0;
    char c;
    char temp, temp2;

    printf("What is the character you want to insert: ");
    scanf("\n");
    scanf("%c", &c);

    for(i=0; i<n; i++)
    {
        if(i==0)
        {
            temp = s[i];
            s[i] = c;
        }
        else
        {
            temp2 = s[i];
            s[i]=temp;
            temp=temp2;
        }
    }

    printf("Resulting string: %s \n", s);

}
