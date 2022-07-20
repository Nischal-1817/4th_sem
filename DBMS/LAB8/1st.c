#include<stdio.h>
#include<string.h>
#include<stdbool.h>

bool trivial(char first[],char second[]);
bool nonTrivial(char first[],char second[]);

bool trivial(char first[],char second[]){
    int len1=strlen(first); int len2=strlen(second);
    if(len2>len1){
        return false;
    }

    for(int i=0;i<len2;i++){
        bool flag=false;
        char s=second[i];
        for(int j=0;j<len1;j++){
            if(s==first[j]){
                flag=true;
            }
        }
        if(!flag){
            return false;
        }
    }
    return true;
}
bool nonTrivial(char first[],char second[]){
    int len1=strlen(first); int len2=strlen(second);
    char s; bool flag;
    for(int i=0;i<len2;i++){
        s=second[i];
        flag=true;
        for(int j=0;j<len1;j++){
            if(s==first[j]){
                flag=false;
            }
        }
        if(!flag){
            return false;
        }
    }
    return true;
}
int main(){
    int size;
    printf("Enter the number of FD'S:");
    scanf("%d",&size);
    for(int i=0;i<size;i++){
        char first[6],second[6];
        printf("Enter the first and second FD:");
        scanf("%s",first);
        scanf("%s",second);
        if(trivial(first,second)){
            printf("It is a trivial FD \n");
        }
        else if(nonTrivial(first,second)){
            printf("It is a non-trivial FD \n");
        }
        else{
            printf("It is a semi-trivial FD \n");
        }
    }
    return 0;
}