/*
YANG ZHANG
CSE 374 HW4
2/5/14
IMPLEMNTING GASP FUNCTION
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#define LINE_MAX 500
#define PAR_MAX 100

void scanFile(char*, char*, int*, int*);
char* toLowerCase(char*);

//main method that process input arguments 
int main(int argc, char** argv){
	int iFlag=0;
	int nFlag=0;
	int k;
	int cur=1;
	char par[PAR_MAX];
	for(k=1;k<argc;k++){
		if(strchr(argv[k],'-')!=NULL){
			if(strcmp(argv[k],"-i")==0){
				iFlag=1;
				cur++;
			}
			else if(strcmp(argv[k],"-n")==0){
				nFlag=1;
				cur++;
			}else{
				fprintf(stderr, "%s: Unkonwn option\n", argv[k]);
				return -1;
			}
		}else if(cur==k){
			strncpy(par,argv[k],PAR_MAX);
			if(iFlag){
				toLowerCase(par);
			}
		}else{
			char* strp = argv[k];
			scanFile(strp,par,&iFlag,&nFlag);			
		}	
	}
	return 0;
}

//method to cover string to its lowoer case 
char* toLowerCase(char* str){
	int i=0;
	while(str[i]!='\0'){
		str[i]=(char)tolower(str[i]);
		i++;
	}
	return str;
}

//method to scan file and do gasp
void scanFile(char* fname, char* pattern, int* iFlag, int* nFlag){
	FILE *file = fopen(fname,"r");
	if(file){
		char lineBuffer[LINE_MAX];
		int lineNum=0;
		while(fgets(lineBuffer,LINE_MAX,file)!=NULL){
			lineNum++;
			char copyBuffer[LINE_MAX];
			strncpy(copyBuffer,lineBuffer,LINE_MAX);
			if(*iFlag){
				toLowerCase(copyBuffer);
			}
			if(strstr(copyBuffer,pattern)!=NULL){
				if(*nFlag){
					printf("%s:%d:%s",fname,lineNum,lineBuffer);
				}else{
					printf("%s:%s",fname,lineBuffer);
				}
			}
		}
		fclose(file);
	}else{
		perror(fname);
		//fprintf(stderr, "%s doesn't exist\n", fname);
	}
}

