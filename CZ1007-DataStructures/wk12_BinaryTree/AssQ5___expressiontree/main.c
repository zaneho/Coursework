#include <stdio.h>
#include <stdlib.h>

//#include "AS10Q5.h"  //Please comment this line in Code::Blocks. The header is not provided. It is used in APAS only.

#ifndef _NODE_
#define _NODE_
typedef struct _btnode
{
    int item;
    struct _btnode *left;
    struct _btnode *right;
} BTNode;   // You should not change the definition of BTNode

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

void createExpTree(BTNode** root,LinkedListExp myexp);
void deleteTree(BTNode **root);

void printTree(BTNode *node);
void printTreePostfix(BTNode *node);

double computeTree(BTNode *node);

int main()
{
    test_main(createExpTree,deleteTree,printTree,printTreePostfix,computeTree);
    return 0;
}

void deleteTree(BTNode **root)
{
    BTNode* temp;
    if(*root !=NULL)
    {
        temp = (*root)->right;
        deleteTree(&((*root)->left));
        free(*root);
        *root = NULL;
        deleteTree(&temp);
    }
}

void createExpTree(BTNode** root,LinkedListExp myexp)
{
    /* add your code here */
    opNode *Op = myexp.opHead;
    numNode *Num = myexp.numHead;
    BTNode *tmpRoot = NULL;
    BTNode *tmpParent = NULL;

    while(Op != NULL)
    {
        while(Op != NULL && Op->item == ' '){
                Op=Op->next;
        }
        if(Op == NULL){
            break;
        }
        BTNode *newnode = malloc(sizeof(BTNode));
        newnode->item = Op->item;
        newnode->left=NULL;
        newnode->right=NULL;

        tmpRoot = *root;

        if(*root == NULL)
        {
            *root = newnode;
            tmpRoot = *root;
        }
        else
        {
            switch(Op->item) //new operator
            {
            case '/':
            case '*':
                while(tmpRoot != NULL &&(
                            (char)tmpRoot->item == '+' ||
                            (char)tmpRoot->item == '-'
                        ))  //new operator higher than +-
                {
                    tmpParent=tmpRoot;
                    tmpRoot=tmpRoot->right;
                }

                if(tmpRoot == NULL)  //if new operator higher than all nodes on right
                {
                    tmpParent->right = newnode;
                }
                else   //if new operator same
                {
                    newnode->left=tmpRoot;
                    if(tmpParent){
                        tmpParent->right=newnode;
                    }else{
                        *root=newnode;
                    }
                    tmpRoot = newnode;
                }
                break;
            case '+':
            case '-': //new operator(+-) is low precedence
                newnode->left=tmpRoot;
                *root=newnode;
                tmpRoot=*root;
                break;
            default:
                break;
            }
        }
        Op = Op->next;

        //////insert num////////
        while(Num != NULL && tmpRoot->left==NULL)
        {
            BTNode *numnode = malloc(sizeof(BTNode));
            numnode->item = Num->item;
            numnode->left=NULL;
            numnode->right=NULL;

            tmpRoot->left=numnode;
            Num=Num->next;
        }

        while(Num != NULL && tmpRoot->right==NULL)
        {
            BTNode *numnode = malloc(sizeof(BTNode));
            numnode->item = Num->item;
            numnode->left=NULL;
            numnode->right=NULL;

            tmpRoot->right=numnode;
            Num=Num->next;
        }
    }
}

void printTree(BTNode *node)
{
    /* add your code here *///in-order
    if(node == NULL)
    {
        return;
    }
    printTree(node->left);

    if(node->left == NULL && node->right == NULL){
        printf("%d ", node->item);
    }else{
        printf("%c ", node->item);
    }

    printTree(node->right);
}


void printTreePostfix(BTNode *node)
{
    /* add your code here *///post order
    if(node == NULL)
    {
        return;
    }

    printTreePostfix(node->left);
    printTreePostfix(node->right);

    if(node->left == NULL && node->right == NULL){
        printf("%d ", node->item);
    }else{
        printf("%c ", node->item);
    }
}

double computeTree(BTNode *node)
{
    /* add your code here */
    double l, r;
    if(node == NULL)
    {
        return 0;
    }
    else
    {
        l = computeTree(node->left);
        r = computeTree(node->right);

        if(!l && !r)
        {
            return node->item;
        }
        else
        {
            switch((char) node->item)
            {
            case '+':
                return l+r;
            case '-':
                return l-r;
            case '/':
                return l/r;
            case '*':
                return l*r;
            }
        }
    }
}
