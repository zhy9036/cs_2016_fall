/*
Tianen Jiang & Wuyue Liu
CSE374 Homework 6
3/4/2014
* 
* 
*/
#include "mem.h"
#include "mem_impl.h"
#include <time.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <unistd.h>
#define inputNum 7
#define N_TRIALS 10000
#define pctget 50
#define pctlarge 10
#define small_limit 20
#define large_limit 20000
#define random_seed -1

extern memnode * allocated_list;
//extern uintptr_t num_allocateblock;

//#include "mem.h"
int flipCoin(int percent, int randnum);
void userinput(int argc, char **argv, int fN_TRIALS, int *fpctget, int *fpctlarge, 
				int *fsmall_limit, int *flarge_limit, int *frandom_seed);
int allocated_block_number();
int main(int argc, char ** argv){
    FILE* f = fopen("file.txt","w");
	// char* a = getmem(5000);
	// //~print_heap(f);
	// void * b = getmem(2000);
	// //~print_heap(f);
	// // char * c = getmem(9000);
	// //~print_heap(f);
	// mem(a);
	// char * c = getmem(4000);
	// //~print_heap(f);
	// freemem(b);
	// //~print_heap(f);
	// freemem(c);
	// print_heap(f);
	// fclose(f);


	// total cpu time 
    clock_t start, end;
    double cpu_time_used;
    start = clock();
	time_t t;
	int *fN_TRIALS,fpctget,fpctlarge,fsmall_limit,flarge_limit;
	unsigned int* frandom_seed;
	int k;
	int l;
	// get user input 
	printf("%d\n",argc);
	srand((unsigned) time(&t));

	userinput(argc, argv, fN_TRIALS,fpctget,fpctlarge,fsmall_limit,flarge_limit,frandom_seed);


	for(k=0;k<fN_TRIALS;k++){
		printf("%d\n",flipCoin(fpctget,rand()));
	//	flipCoin(fpctget,rand()){
		// if flipcoin return 1 getmem 




		if(flipCoin(fpctget,rand())==1){
		// get rand block size for getmem either large or small
		// return 1 is large 
			if(flipCoin(fpctlarge,rand())==1){ 	
				int largesize;
				largesize =fsmall_limit + rand()%(flarge_limit-fsmall_limit);
				printf("largesize%d\n",largesize);
				getmem(largesize);
			}else{
				// give small block 
				int smallsize;
				smallsize = rand()%fsmall_limit;
				printf("smallsize%d\n",smallsize);
				getmem(smallsize);

			}
		}
		// free an random list 
		else{
			if(allocated_list!=NULL){
				//printf("num_allocateblock%d\n", num_allocateblock);
				int freeindex = rand()%(allocated_block_number());
				
				printf("allocated_block_number method return %d\n",allocated_block_number() );
				printf("Freemem...");
				printf("freeindex%d\n",freeindex);
				memnode * all_list=allocated_list;
				for(l = 0; l <freeindex;l++){
					all_list = all_list->next;
					printf("in here\n");
				}
				freemem(all_list);

				//while()
				//freemem(allocated_list[freeindex]);
			}			
		}
		printf("ntrials%d\n",k );
	//	}
		// return getmem or freemem intruction
		//printf("%d\n",rand()%fpctget);// 0 - percentage			
	}
	// getmem

	// printf
	print_heap(f);
	uintptr_t* total_size; uintptr_t* total_free; uintptr_t* n_free_blocks;
	get_mem_stats(total_size, total_free, n_free_blocks);
	fclose(f);
	printf("ready to return\n");
	end = clock();
	// cpu time used 
	cpu_time_used =((double)end - start));

	return 0;
}
int flipCoin(int percent, int random) {
	//If hProb is greater than 100 set to 100
	// sent the random from 0 to 99
	random = random%100;
	printf("%d\n",random);
	if(random < percent){
		return 1;
	}else{
		return 0;
	}
}

void userinput(int argc, char **argv, int fN_TRIALS, int *fpctget, int *fpctlarge, 
				int *fsmall_limit, int *flarge_limit, int *frandom_seed){
		int i;
	int j;
	

		if(argc <=inputNum){
		for(i = 1 ; i < argc; i++){
			if(i ==1){
				fN_TRIALS = &atoi(argv[i]);
			}else if(i ==2){
				fpctget = &atoi(argv[i]);
			}else if(i==3){
				fpctlarge = &atoi(argv[i]);
			}else if(i==4){
				fsmall_limit = &atoi(argv[i]);
			}else if(i==5){
				flarge_limit = &atoi(argv[i]);
			}else if(i==6){
				frandom_seed =&atoi(argv[i]);
			}else{
				printf("123%d",i);
			}
		}

		if(argc < inputNum){
			for(j = argc; j < inputNum;j++){
				if(j == 1){
					fN_TRIALS = &N_TRIALS;
				}else if(j ==2){
					fpctget = &pctget;
				}else if(j==3){
					fpctlarge = &pctlarge;
				}else if(j==4){
					fsmall_limit = &small_limit;
				}else if(j==5){
					flarge_limit = &large_limit;
				}else if(j==6){  
        			FILE *f;
    				unsigned int randval;
        			f = fopen("/dev/random", "r");
       				fread(&randval, sizeof(randval), 1, f);
       				fclose(f);
       				*frandom_seed = randval;
       				printf("%u\n", randval);
				}else{
					break;
				}
			}
		}
		printf("fN_TRIALS is :%d\n fpctget is :%d\n fpctlarge is :%d\n fsmall_limit is :%d\n flarge_limit is :%d\n frandom_seed is :%u\n ",*fN_TRIALS,*fpctget,*fpctlarge,*fsmall_limit,*flarge_limit,*frandom_seed);
	}else{
		printf("please follow the usage bench [ntrials [pctget [pctlarge [small_limit [large_limit [random_seed ]]]]]]");
	}

}

int allocated_block_number(){
	int counter = 0;
	memnode * current = allocated_list;
	while(current!=NULL){
		current = current->next;
		counter++;
	}
	return counter;

}