import java.util.*;
public class Sorting {

	public static void main(String[] args) {
		
		int[] a = {16, 21, 45, 8, 11, 53, 3, 26, 49, 31, 12, 55, 6, 18, 31, 15, 4};
		System.out.println("gap "+16+": "+Arrays.toString(a));
		shellSort(a);
		int aa = Runtime.getRuntime().availableProcessors();
		System.out.println();	
		System.out.println();
		System.out.println("cores = "+aa);
	}


	public static void shellSort(int[] a) {
		for (int gap = a.length / 2; gap >= 1; gap = gap / 2) {
			// insertion sort on every gap'th element
			for (int i = gap; i < a.length; i++) {
				int temp = a[i];
				int j = i;
				while (j >= gap && a[j - gap] > temp) {
					a[j] = a[j - gap];
					j -= gap;
				}
				a[j] = temp;
			}
			System.out.println("gap "+gap+" : "+Arrays.toString(a));
		}
	}
}