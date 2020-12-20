// CX1007 Data Structures
// Week 10 P4

#include <stdio.h>
#include <stdlib.h>

struct _dbllistnode
{
    int item;
    struct _dbllistnode *pre;
    struct _dbllistnode *next;
};
typedef struct _dbllistnode DblListNode;

// DblListNode *findDblListNode(DblListNode *cur, int index);
void printDblList(DblListNode *cur);
void deleteList(DblListNode **ptrHead);

int insertDbl(DblListNode **ptrHead, int index, int value);

int main()
{
    int item, index;
    int size=0;
    DblListNode* head=NULL;

    printf("Enter a number and an index for inserting a node, terminated by invalid input: \n");
    while(scanf("%d %d",&item,&index)==2)
    {
        if(insertDbl(&head,index,item))
            size++;
        else
            printf("Invalid Insertion!\n");
        printDblList(head);
        printf("Enter a number and an index for inserting a node, terminated by invalid input: \n");
    }

    printf("\nFinal List has %d elements:\n",size);
    printDblList(head);

    if(head!=NULL)
        deleteList(&head);
    return 0;
}

//same as singly linked list's print function
void printDblList(DblListNode *cur)
{
    printf("Current List: ");
    while (cur != NULL)
    {
        printf("%d ", cur->item);
        cur = cur->next;
    }
    printf("\n");
}

void deleteList(DblListNode **ptrHead)
{
    DblListNode *cur = *ptrHead;
    DblListNode *temp;
    while (cur!= NULL)
    {
        temp=cur->next;
        free(cur);
        cur=temp;
    }
    *ptrHead=NULL;
}

int insertDbl(DblListNode **ptrHead, int index, int value)
{
    /* Write your program code here.*/
//    DblListNode *newNode = NULL;
//    newNode= malloc(sizeof(DblListNode));
//    newNode->item=value;
//
//    DblListNode *cur = *ptrHead;
//    DblListNode *pre = *ptrHead;
//
//    int i=0, count=0;
//    for(i=0; cur != NULL; i++){
//        count++;
//        pre=cur;
//        cur=cur->next;
//    }
//    if(index > count){
//        return 0;
//    }
//
//    if(*ptrHead == NULL){//first node
//        newNode->pre=NULL;
//        newNode->next=NULL;
//        *ptrHead=newNode;//first node
//        return 1;
//    }else{
//        if(index==0){
//            newNode->pre=NULL;
//            newNode->next=*ptrHead;//replace first node
//            (*ptrHead)->pre=newNode;
//            *ptrHead = newNode;
//            return 1;
//        }else{
//            if(pre->next == NULL){ //last node
//                newNode->pre=pre;
//                newNode->next=NULL;
//                pre->next=newNode;
//                return 1;
//            }else{
//                newNode->pre=pre; //in between
//                newNode->next=cur;
//                pre->next=newNode;
//                cur->pre=newNode;
//            }
//        }
//    }
//return 0;

    DblListNode* newnode;
    DblListNode* pre;

    int i=0;
    pre=*ptrHead;
    for(i=0; i<index-1; i++){
        pre=pre->next;
    }

    if(index == 0){//Empty list or insert node at index 0
        newnode=malloc(sizeof(DblListNode));
        newnode->item=value;
        newnode->pre=NULL;
        newnode->next=*ptrHead;

        if(*ptrHead != NULL){//for non empty  list
            (*ptrHead)->pre=newnode;
        }
        *ptrHead=newnode;
        return 1;
    }else if(pre != NULL){ //insert as last node
        newnode=malloc(sizeof(DblListNode));
        newnode->item=value;
        newnode->pre=pre;
        newnode->next=NULL;

        if(pre->next != NULL){ //in between, not last node
            newnode->next=pre->next;
        }
        pre->next=newnode;
        return 1;
    }
    return 0;
}
