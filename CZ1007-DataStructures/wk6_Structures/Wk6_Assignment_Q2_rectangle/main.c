#include <stdio.h>
#include <math.h>
typedef struct
{
    double x;
    double y;
} Point;
typedef struct
{
    Point topLeft;    /* top left point of rectangle */
    Point botRight;   /* bottom right point of rectangle */
} Rectangle;
Rectangle getRect();
void printRect(Rectangle r);
double findArea(Rectangle r);
int main()
{
    Rectangle r;
    int choice;

    printf("Select one of the following options:\n");
    printf("1: getRect()\n");
    printf("2: findArea()\n");
    printf("3: printRect()\n");
    printf("4: exit()\n");
    do
    {
        printf("Enter your choice: \n");
        scanf("%d", &choice);
        switch (choice)
        {
        case 1:
            printf("getRect(): \n");
            r = getRect();
            break;
        case 2:
            printf("findArea(): %.2f\n", findArea(r));
            break;
        case 3:
            printf("printRect(): \n");
            printRect(r);
            break;
        default:
            break;
        }
    }
    while (choice < 4);
    return 0;
}
Rectangle getRect()
{
    /* write your code here */
    Rectangle a;
    printf("Enter top left point: \n");
    scanf("%lf %lf", &a.topLeft.x, &a.topLeft.y);

    printf("Enter bottom right point: \n");
    scanf("%lf %lf", &a.botRight.x, &a.botRight.y);

    return a;
}
void printRect(Rectangle r)
{
    /* write your code here */
    printf("Top left point: %.2lf %.2lf \n", r.topLeft.x, r.topLeft.y);
    printf("Bottom right point: %.2lf %.2lf \n", r.botRight.x, r.botRight.y);
}
double findArea(Rectangle r)
{
    /* write your code here */
    double l, b;
    if(r.topLeft.x < r.botRight.x){
        l = r.botRight.x - r.topLeft.x;
    }else{
        l = r.topLeft.x-r.botRight.x;
    }
    if(r.topLeft.y < r.botRight.y){
        b = r.botRight.y-r.topLeft.y;
    }else{
        b = r.topLeft.y-r.botRight.y;
    }

    return l*b;
}
