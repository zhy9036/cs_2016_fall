
//#include "trie.h"
#include "trie.c"



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

char* decodeInput(char* input){
	int size = strlen(input);
	//char* path = (char*) malloc(sizeof(char)*(size+1));
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

trieNode* search(trieNode* root, char* path){
	int size = strlen(path);
	trieNode* cur = root;
	int i,key;
	for(i = 0; i<size; i++){
		key = path[i]-'0';
		//printf("index: %d   size: %d\n", key, size);
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

trieNode* buildTrie(char* fname, trieNode* root){
	FILE* file= fopen(fname,"r");
	//int index = 0;
	if(file){
		char wordBuf[MAX_STRING_LENGTH];
		//trieNode* cur;
		//char* copyWord;
		while(fgets(wordBuf,MAX_STRING_LENGTH,file)!=NULL){
			int size = strlen(wordBuf);
			char* copyWord = (char*) malloc(sizeof(char)*(size+1));
			strncpy(copyWord,wordBuf,size -1);
			//printf("%s\n", copyWord);
			int i;
			trieNode* cur = root;
			for(i=0; i<size - 1; i++){ 
				if(copyWord[i] != 10 && copyWord[i] != '\0'){ // make sure newline char LF not passed in
					int key = findKey(&copyWord[i]);
					if(cur->kid[key] == NULL){
						trieNode* newNode = new_trieNode();
						cur->kid[key] = newNode;
						cur = newNode;

						//printf("%d: %d: size: %d\n", key, copyWord[i],size);

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

int main(int argc, char** argv){
	
	if(argc != 2){
		fprintf(stderr, "%s: argments number error\n",argv[0]);
		exit(1);
	}
	trieNode* root = new_trieNode();
	trieNode* cur;
	int first = 1;
	root = buildTrie(argv[1], root);
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
				//printf("	fine!!!\n");
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


//valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./a.out sd.txt 




