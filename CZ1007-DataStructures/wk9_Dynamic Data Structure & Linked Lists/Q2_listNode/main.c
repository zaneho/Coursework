// CX1007 Data Structures
// Week 9 Lab Tutorial - DynamicData-Linked Lists

#include "stdlib.h"
#include "stdio.h"

////////////////////////////////////////////////////////////

typedef struct _listnode
{
    int item;
    struct _listnode *next;
} ListNode;

int main()
{
    ListNode *head, *p, *temp;
    int n;
    head=NULL;
    p=NULL;		// pointing to the last node in the list
    printf("Enter a list of numbers, terminated by a non-digit character:\n");

    //Write your program code here
    while(scanf("%d", &n)){ //scanned a valid int
        if(head == NULL){
            head = malloc(sizeof(ListNode)); //create firstNode
            p=head;
        }else{
            p->next = malloc(sizeof(ListNode)); //create subsequentNodes
            p=p->next;
        }

        p->item = n;
        p->next= NULL;
    }

    //printList
    printf("Current list: ");
    p=head;
    while(p != NULL){
        printf("%d ", p->item);
        p=p->next;
    }

    //free up
    p=head;
    while(p != NULL){
        temp=p->next;
        free(p);
        p=temp;
    }

    return 0;
}
