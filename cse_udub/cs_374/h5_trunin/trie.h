//Yang Zhang
//CSE 374 Homework 5
//Feb. 17th, 2014
//Header file for trie structure

#ifndef TRIE_H
#define TRIE_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>


#define MAX_STRING_LENGTH 100   //max word length   
#define LETTER 10				//total 26 English LETTER
#define NUM_BRANCH 9      //total possible bracnch for each node

//initilization of trie structure
typedef struct trieNode{
	char* value;
	struct trieNode* kid[NUM_BRANCH];
}trieNode;

trieNode* new_trieNode();
void trieFree(trieNode*);
void setWord(trieNode*, char*);
#endif