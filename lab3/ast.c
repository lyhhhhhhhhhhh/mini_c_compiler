#include "def.h"
struct node * mknode(int kind,struct node *first,struct node *second, struct node *third,int pos ) {
  struct node *T=(struct node *)malloc(sizeof(struct node));
  T->kind=kind;
  T->ptr[0]=first;
  T->ptr[1]=second;
  T->ptr[2]=third;
  T->pos=pos;
  return T;
}

void display(struct node *T,int indent) {
  
}