#include <stdio.h>
#include <stdlib.h>
//#include "AS8Q5.h" //Please comment it in your codeblock after linking the library file

#ifndef _NODE_
#define _NODE_
typedef struct _node
{
    int item;
    struct _node *next;
} numNode;

typedef struct _nodeOp
{
    char item;
    struct _nodeOp *next;
} opNode;

typedef struct _linkedlistEx
{
    numNode *numHead;
    opNode *opHead;
} LinkedListExp;
#endif
void expressionLL(char* exp,LinkedListExp* llE);

int main()
{
    test_main(expressionLL);
    return 0;
}

void expressionLL(char* exp,LinkedListExp* llE)
{
    /* add your code here */
    numNode *tempNum;
    opNode *tempOp;

    while(exp[0] != '\0'){
            if(exp[0] >= '0' && exp[0] <= '9'){
                if(llE->numHead == NULL){
                    llE->numHead = malloc(sizeof(numNode));
                    tempNum = llE->numHead;
                }else{
                    tempNum->next =  malloc((sizeof(numNode)));
                    tempNum=tempNum->next;
                }
                tempNum->item = *exp - '0';
                tempNum->next = NULL;
                exp++;
                while(exp[0] >= '0' && exp[0] <= '9'){
                    //tempNum->next =  malloc((sizeof(numNode)));
                    //tempNum=tempNum->next;
                    tempNum->item = (tempNum->item)*10 + (*exp - '0');
                    tempNum->next = NULL;
                    exp++;
                }
            }else if(exp[0] == '+' || exp[0] == '-' ||
                     exp[0] == '*' || exp[0] == '/' ||
                     exp[0] == '(' || exp[0] == ')'){
                if(llE->opHead == NULL){
                    llE->opHead = malloc(sizeof(opNode));
                    tempOp = llE->opHead;
                }else{
                    tempOp->next =  malloc((sizeof(opNode)));
                    tempOp=tempOp->next;
                }
                tempOp->item = *exp;
                tempOp->next = NULL;
                exp++;
            }else{
                exp++;
            }
    }
}
