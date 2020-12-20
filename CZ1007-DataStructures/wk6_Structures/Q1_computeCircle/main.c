#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define INIT_VALUE -1
struct circle
{
    double radius;
    double x;
    double y;
};
int intersect(struct circle, struct circle);
int contain(struct circle *, struct circle *);
int main()
{
    struct circle c1, c2;
    int choice, result = INIT_VALUE;

    printf("Select one of the following options: \n");
    printf("1: intersect()\n");
    printf("2: contain()\n");
    printf("3: exit()\n");
    do
    {
        result=-1;
        printf("Enter your choice: \n");
        scanf("%d", &choice);
        switch (choice)
        {
        case 1:
            printf("Enter circle 1 (radius x y): \n");
            scanf("%lf %lf %lf", &c1.radius, &c1.x, &c1.y);
            printf("Enter circle 2 (radius x y): \n");
            scanf("%lf %lf %lf", &c2.radius, &c2.x, &c2.y);
            result = intersect(c1, c2);
            if (result == 1)
                printf("intersect(): intersect\n");
            else if (result == 0)
                printf("intersect(): not intersect\n");
            else
                printf("intersect(): error\n");
            break;
        case 2:
            printf("Enter circle 1 (radius x y): \n");
            scanf("%lf %lf %lf", &c1.radius, &c1.x, &c1.y);
            printf("Enter circle 2 (radius x y): \n");
            scanf("%lf %lf %lf", &c2.radius, &c2.x, &c2.y);
            result = contain(&c1, &c2);
            if (result == 1)
                printf("contain(): contain\n");
            else if (result == 0)
                printf("contain(): not contain\n");
            else
                printf("contain(): error\n");
            break;
        }
    }
    while (choice < 3);
    return 0;
}
int intersect(struct circle c1, struct circle c2)
{
    /* Write your program code here */
    /*
        int a, b, distance;

        a = c1.x - c2.x;
        b = c1.y - c2.y;
        distance = sqrt(a*a + b*b);
    */

    if(c1.radius <= 0 || c2.radius <= 0) //if radius 0 or neg, return -1
    {
        return -1;
    }
    else
    {
        double distance=0;
        distance = sqrt(pow(c1.x - c2.x,2) + pow(c1.y - c2.y, 2));

        if(distance <= (c1.radius + c2.radius))
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
}

int contain(struct circle *c1, struct circle *c2)
{
    /* Write your program code here */
    double distance=0;
    distance = sqrt(pow(c1->x - c2->x,2) + pow(c1->y - c2->y, 2));

    if(c1->radius <= 0 || c2->radius <= 0) //if radius 0 or neg, return -1
    {
        return -1;
    }
    else
    {
        if(c1->radius >= (c2->radius + distance))
        {
            //or return(c1->radius >= (c2-> radius + distance));
            return 1;
        }
        else
        {
            return 0;
        }
    }
}
