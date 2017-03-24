//Yang Zhang
//CSE 374 Homework 5
//Feb. 17th, 2014
//This the main file for t9.


#include "trie.h"
#include "trie.c"


// decode each char to referenced index number
int findKey(char* letter){
	if(*letter>='a' && *letter<='c'){
		return 0;
	}else if(*letter>='d' && *letter<='f'){
		return 1;
	}else if(*letter>='g' && *letter<='i'){
		return 2;
	}else if(*letter>='j' && *letter<='l'){
		return 3;
	}else if(*letter>='m' && *letter<='o'){
		return 4;
	}else if(*letter>='p' && *letter<='s'){
		return 5;
	}else if(*letter>='t' && *letter<='v'){
		return 6;
	}else if(*letter>='w' && *letter<='z'){
		return 7;
	}else{
		return -1;
	}
}


// decode t9 format input to match index
char* decodeInput(char* input){
	int size = strlen(input);
	int i;
	for(i = 0; i<size; i++){
		if(input[i] != '#'){
			input[i]=input[i]-2;
		}else{
			input[i]='8';
		}
	}
	return input;
}


// search word by giving t9 path
trieNode* search(trieNode* root, char* path){
	int size = strlen(path);
	trieNode* cur = root;
	int i,key;
	for(i = 0; i<size; i++){
		key = path[i]-'0';
		if(cur->kid[key]!=NULL){
			cur = cur->kid[key];
		}else if(key == 8){
			printf("	There are no more T9onyms\n");
			return NULL;
		}else{
			printf("	Not found in current dictionary.\n");
			return NULL;
		}
			
	}
	if(cur->value != NULL){
		printf("	'%s'\n", cur->value);
		return cur;
	}else if(key == 8){
		printf("	There are no more T9onyms\n");
	}else{
		printf("	Not found in current dictionary.\n");
	}
	return NULL;
}


//this method is to build the trie by given file
trieNode* buildTrie(char* fname, trieNode* root){
	FILE* file= fopen(fname,"r");
	if(file){
		char wordBuf[MAX_STRING_LENGTH];
		while(fgets(wordBuf,MAX_STRING_LENGTH,file)!=NULL){
			int size = strlen(wordBuf);
			char* copyWord = (char*) calloc((size+1),sizeof(char));

			strncpy(copyWord,wordBuf,size -1);
			int i;
			trieNode* cur = root;
			for(i=0; i<size - 1; i++){ 
				if(copyWord[i] != 10 && copyWord[i] != '\0'){ // make sure newline char LF not passed in
					int key = findKey(&copyWord[i]);
					if(cur->kid[key] == NULL){
						trieNode* newNode = new_trieNode();
						cur->kid[key] = newNode;
						cur = newNode;
					}else{
						cur = cur->kid[key];
					}
				}
			}
			while(cur->value != NULL){
				if(cur->kid[8] == NULL){
					trieNode* newNode = new_trieNode();
					cur->kid[8] = newNode; // '#' case
					cur = newNode;
				}else{
					cur = cur->kid[8];
				}
			}
			setWord(cur,copyWord);
		}
		fclose(file);
		return root;
	}else{
		return NULL;
	}
}


// main method that handle user input and UI
int main(int argc, char** argv){
	
	if(argc != 2){
		fprintf(stderr, "%s: argments number error\n",argv[0]);
		exit(1);
	}
	trieNode* root = new_trieNode();
	trieNode* cur;
	int first = 1;
	root = buildTrie(argv[1], root);
	if(root == NULL){
		fprintf(stderr, "%s: file cannot open or not found\n",argv[0]);
		exit(1);
	}
	printf("Enter \"exit\" to quit.\n");
	while(1){
		printf("Enter Key Sequence (or \"#\" for next word):\n> ");
		char user_input[MAX_STRING_LENGTH];
		scanf("%s", user_input);
		if(strncmp(user_input,"exit",strlen(user_input)) == 0){
			trieFree(root);
			exit(0);
		}else{
			char* d = decodeInput(user_input);
			if(first || strncmp(d,"8",strlen(d)) != 0){
				cur = search(root,d);
				first = 0;
			}else{
				if(cur != NULL){
					cur = search(cur,d);
				}else{
					printf("	There are no more T9onyms\n");
				}
			}
		}
	}
	return 0;
}






