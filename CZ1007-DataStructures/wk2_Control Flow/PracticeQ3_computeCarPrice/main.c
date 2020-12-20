#include <stdio.h>

int main()
{
    int list, coe = 0, cat;
    double discounted, luxury = 0, gst, total;

    printf("Please enter the list price: \n");
    scanf("%d", &list);
    printf("Please enter the category: \n");
    scanf("%d", &cat);

    /* Write your program code here */
    discounted = list * (90.0/100.0); //10% discount
    gst = discounted * 3.0/100.0; //3% GST

    if (discounted > 100000){
        luxury = discounted * 10.0/100.0; //10% luxury tax
    }

    switch(cat) {
        case 1: //Car (1600 c.c. & below) & Taxi
            coe = 70000;
            break;
        case 2: //Car (above 1600 c.c.)
            coe = 80000;
            break;
        case 3: //Goods Vehicle & Bus
            coe = 23000;
            break;
        case 4: //Motorcycle
            coe = 600;
            break;
        default:
            printf("Invalid category \n");
    }
    total = coe + discounted + luxury + gst;
    printf("Total price is $%.2lf\n", total);
    return 0;
}
