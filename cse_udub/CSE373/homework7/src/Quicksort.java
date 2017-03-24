// CSE 373 Homework 7: Sort Detective
// Yang Zhang, 1030416


import java.util.Arrays;

public class Quicksort {
	// lengths of arrays to test (input size N)
	private static final int[] LENGTHS = {
		10, 20, 40, 80, 160, 320, 640, 1000, 2000, 4000, 8000, 16000, 32000, 64000,
		128000, 256000, 512000, 1000000, 2000000, 4000000, 8000000, 16000000
	};

	public static void main(String[] args) {
		for (int N : LENGTHS) {
			//String[] a = ArrayMethods.createAscendingStringArray(N);
			//String[] a = ArrayMethods.createDescendingStringArray(N);
			String[] a = ArrayMethods.createRandomStringArray(N);

			// perform a sort and time how long it takes
			long startTime1 = System.currentTimeMillis();
			quickSort(a);
			long endTime1 = System.currentTimeMillis();
			
			// make sure the array is sorted afterward
			if (!ArrayMethods.isSorted(a)) {
				throw new RuntimeException("not sorted afterward: " + Arrays.toString(a));
			}

			// print runtime stats
			System.out.printf("%10d elements  =>  %6d ms \n", N, endTime1 - startTime1);
		}
	}
	
	
	// This method is the quick sort algorithm, and do quick sort to String arrays.
	public static void quickSort(String[] a) {
		quickSort(a, 0, a.length-1);
	}
	
	// This private method is the insertion sort algorithm, which helps to sort arrays when
	// size is small(1000)
	private static void insertionSort(String[] a, int min, int max){
		
		for(int i = min+1; i < max +1 ; i++){
			String minString = a[i];
			int j = i;
			while(j>= min+1 && a[j-1].compareTo(minString)>0){
				a[j] = a[j-1];
				j--;
			}
			a[j] = minString;
		}	
	}
	
	// This private method acts the actual quick sort action.
	private static void quickSort(String[] a, int min, int max){
		if(min>=max) {
			return;
		}
		if(max - min<= 1000){
			insertionSort(a, min, max);
		}else {
			rearrangeIndecies(a, min, max);
			swap(a, (min + max)/2, max);
			int i = min;
			int j = max-1;
			while(i<=j){
				while (a[i].compareTo(a[max])<0){
					i++;
				} 
				while (a[j].compareTo(a[max])>0){
					j--;
				} 
				
				if(i <= j) {
					swap(a, i, j);
					i++;
					j--;
				}
			}
			swap(a, i, max);
			quickSort(a, min, i-1);
			quickSort(a, i+1, max);	
		}	
	}
	
	// This private method helps to sort the start, middle and end elements in this array.
	private static void rearrangeIndecies(String[] a, int min, int max) {
		if (a[(min + max) / 2].compareTo(a[min]) < 0) {
			swap(a, (min + max) / 2, min);
		}
		if (a[max].compareTo(a[min]) < 0) {
			swap(a, max, min);
		}
		if (a[max].compareTo(a[(min + max) / 2]) < 0) {
			swap(a, (min + max) / 2, max);
		}
	}

	// This private method helps to exchange between elements in this array. 
	private static void swap(String[] a, int b, int c){ 
		if(b!=c){
			String temp = a[b];
			a[b] = a[c];
			a[c] = temp;
		}
	}
}
