//Yang Zhang
//CSE 374 Homework 5
//Feb. 17th, 2014
//This program creates a trie structure.

#include "trie.h"

// create new trie node and allocate memory for this node
trieNode* new_trieNode(){
	trieNode* t = (trieNode*) malloc(sizeof(trieNode));
	t -> value =  NULL;
	int i;
	for(i=0;i<NUM_BRANCH; i++){
		t -> kid[i] = NULL;
	}
	return t;
}

//destruct trie and free all memory

void trieFree(trieNode* root){
	if(root != NULL){
		int i;
		for(i=0; i<NUM_BRANCH; i++){
			if(root->kid[i] != NULL){
				//printf("%d\n", i);
				trieFree(root->kid[i]);
			}
		}
		if(root->value != NULL){
			free(root->value);
		}
		free(root);
	}
}

//set word to a trieNode
void setWord(trieNode* node, char* word){
	node->value = word;
}
















