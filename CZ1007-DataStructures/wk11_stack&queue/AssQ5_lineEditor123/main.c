/////////////////////////////////////////////////////////////////////////////////

/* CE1007/CZ1007 Data Structures
Purpose: Implementing the required functions for Question 5 */
//////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
//#include "AS9_Q5.h" //Comment it and include library filewhen you work on code::blocks
////////////////////////////////// stack //////////////////////////////////////////

#ifndef _AS9_Q5_
#define _AS9_Q5_
typedef struct _listnode{
   char item;
   struct _listnode *next;
} ListNode;

typedef ListNode StackNode;

typedef struct _linkedlist{
   int size;
   ListNode *head;
} LinkedList;
typedef LinkedList Stack;
#endif

void push(Stack *sPtr, char item);
int pop(Stack *sPtr);
int peek(Stack s);
int isEmptyStack(Stack s);

void removeAllItemsFromStack(Stack *sPtr);

Stack* lineEditor(char* line);
int test_main(Stack* (*editor)(char*),void (*removeAllItemsFromStack)(Stack *));

int main()
{
    test_main(lineEditor,removeAllItemsFromStack);
    return 0;
}

void push(Stack *sPtr, char item)
{
	StackNode *newNode;
    newNode= malloc(sizeof(StackNode));
    newNode->item = item;
    newNode->next = sPtr->head;
    sPtr->head = newNode;
    sPtr->size++;
}

int pop(Stack *sPtr)
{
    if(sPtr==NULL || sPtr->head==NULL){
        return 0;
    }
    else{
       StackNode *temp = sPtr->head;
       sPtr->head = sPtr->head->next;
       free(temp);
       sPtr->size--;
       return 1;
    }
}

int isEmptyStack(Stack s)
{
     if(s.size==0) return 1;
     else return 0;
}

int peek(Stack s){
    return s.head->item;
}

void removeAllItemsFromStack(Stack *sPtr)
{
	while(pop(sPtr));
}

Stack* lineEditor(char* line)
{
    /* add your code here */
    Stack *ptr=malloc(sizeof(Stack));
    ptr->head=NULL;
    ptr->size=0;

    Stack *ptr2=malloc(sizeof(Stack));
    ptr2->head=NULL;
    ptr2->size=0;

    int caps=0;
    int i=0;
    for(i=0; line[i]!='\0'; i++){
        if(line[i] == '\\'){ //new line
            push(ptr, '\n');
        }
        else if(line[i] == '^'){ //caps
            caps=1;
            i++;
            while(line[i] == '^' && line[i] != '\0'){
                caps = (caps==1)? 0:1;
                i++;
            }
            if(caps == 1){
                push(ptr, toupper(line[i]));
            }else{
                push(ptr, tolower(line[i]));
            }
            caps=0;
        }else if(line[i] == '*'){ //backspace
            pop(ptr);
        }else if(line[i]== '#'){ //delete whole line
            while(peek(*ptr) != '\n'){
                pop(ptr);
            }
        }
        else{
            push(ptr, line[i]);
        }
    }


    while(ptr->size > 0){
        push(ptr2, ptr->head->item);
        pop(ptr);
    }


    return ptr2;
}
