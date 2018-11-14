#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <asm/unistd.h>
#include <sys/syscall.h>
#include <stdlib.h>
#define MMAP_FLAGS (MAP_PRIVATE| MAP_ANONYMOUS| MAP_NORESERVE) 
struct node{
    int key;
    int val;
    struct node *next;
};
struct table{
    int size;
    struct node **list;
};
struct table *createTable(int size){
    struct table *t = (struct table*) mmap(0, sizeof(struct table), PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    t->size = size;
    t->list = (struct node**)mmap(0, sizeof(struct node*)*size, PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    int i;
    for(i=0;i<size;i++)
        t->list[i] = NULL;
    return t;
}
int hashCode(struct table *t,int key){
    if(key<0)
        return -(key%t->size);
    return key%t->size;
}
void insert(struct table *t,int key,int val){
    int pos = hashCode(t,key);
    struct node *list = t->list[pos];
    struct node *newNode = (struct node*)mmap(0, sizeof(struct node), PROT_READ|PROT_WRITE, MMAP_FLAGS, -1, 0);
    struct node *temp = list;
    while(temp){
        if(temp->key==key){
            temp->val = val;
            return;
        }
        temp = temp->next;
    }
    newNode->key = key;
    newNode->val = val;
    newNode->next = list;
    t->list[pos] = newNode;
}
int lookup(struct table *t,int key){
    int pos = hashCode(t,key);
    struct node *list = t->list[pos];
    struct node *temp = list;
    while(temp){
        if(temp->key==key){
            return temp->val;
        }
        temp = temp->next;
    }
    return -1;
}
int main(){
    struct table *t = createTable(5);
    insert(t,2,3);
    insert(t,5,4);
    printf("%d",lookup(t,5));
    return 0;
}
