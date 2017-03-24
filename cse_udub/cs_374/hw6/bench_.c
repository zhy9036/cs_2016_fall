/*

CSE 374 HW6
YANG ZHANG, YILIN LIU

*/

#include <time.h>
#include <cstdlib>
#include "mem.h"

#define ntrials 10000  

#define pctget 50 

#define pctlarge 10

#define small_limit 200

#define large_limit 20000


extern memnode* free_list;
extern memnode* allocated_list;
extern int allocated_list_size;
void setup(int* paramaters, int argc, char** argv);

// the test program with defined testing paramaters
int main(int argc, char** argv){
	int paramaters[6] = {ntrials, pctget, pctlarge, small_limit, large_limit, rand()};
	setup(paramaters, argc, argv);
	
	/*
	memnode* p2 = (memnode*) getmem(20);
	printf("\nfree_list addr: %lu\n", (uintptr_t)free_list);
	printf("get20 addr:     %lu\n", (uintptr_t)p2);
	//memnode* stat = p2-16;
	//printf("size: %lu\n", stat->size);
	
	//printf("\n free_list size: %lu\n", free_list->size);
	
	printf("    20 addr:    %lu\n", (uintptr_t)allocated_list);

	memnode* p3 = (memnode*) getmem(100);
	printf("get100 addr:    %lu\n", (uintptr_t)p3);
	
	printf("   100 addr:    %lu\n", (uintptr_t)allocated_list->next);

	freemem(p3);
	printf("   1st free:    %lu\n", (uintptr_t)allocated_list);
	freemem(p2);
	printf("   1st free:    %lu\n", (uintptr_t)allocated_list);

	memnode* p2 = (memnode*) getmem(30);
	memnode* p3 = (memnode*) getmem(40);
	printf("head: %lu\n", (uintptr_t)allocated_list);
	freemem(p3);
	printf("3333: %lu\n", (uintptr_t)p3);
	printf("head: %lu\n", (uintptr_t)allocated_list);
	freemem(p2);
	printf("head: %lu\n", (uintptr_t)allocated_list);
	*/


	//memnode* stat1 = p3-16;
	//printf("size: %lu\n", stat1->size);


	//printf("\n\n\n\n\n\n free_list size: %lu\n", free_list->size);
	//printf("free_list size: %lu\n", (uintptr_t)free_list);

	return 0;
}

void setup(int* paramaters, int argc, char** argv){
	int i;
	for(i=1; i<argc; i++){
		paramaters[i-1] = atoi(argv[i]); 
	}
}

/*

int randomSelect(int pct, int rand_seed){
	return 0;
}





srand((-1 == rand_seed) ? time(NULL) : rand_seed);	
	//Begin n_trial cycles
	int i;
	for (i = 0; i < n_trials; i++) {
		//Decide whether to getmem() or to freemem()
		if (flipCoin(pct_get, rand())) {
			int memSize;
			
			//Flip coin to decide 
			if (flipCoin(pct_large, rand())) {
				//Pseudorandomly find size of memory chunk desired for large chunk
				memSize = small_limit + rand() % (large_limit - small_limit) + 1;
			} else {
				//Pseudorandomly find size of memory chunk desired for small chunk
				memSize = rand() % small_limit;
			}
			printf("**Running Getmem...");
			memArray[memArrSize] = getmem((uintptr_t) memSize);
			printf("done.\n");
			printf("free_list: %p\n", free_list);
			printf("Getmem:  memArray[%d]: %p\n", memArrSize, memArray[memArrSize]);
			memArrSize++;
		} else {
			//Randomly choose index of memArray to free. If memArray is empty nothing 
			//is called.
			if (memArrSize != 0) {
				int index = rand() % memArrSize;
				printf("**Running Freemem...");
				freemem(memArray[index]);
				printf("done.\n");
				printf("free_list: %p\n", free_list);
				printf("Freemem: memArray[%d]: %p\n", index, memArray[index]);
				memArray[index] = memArray[memArrSize - 1];
				memArrSize--;
			}
		}
		print_heap((FILE *) stdout);
		WaitForEnter();
	}			


*/

