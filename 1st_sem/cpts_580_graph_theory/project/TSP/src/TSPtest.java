
public class TSPtest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] graph1 = {{0, 4, 6, 3, 5},
						  {4, 0, 3, 7, 7},
						  {6, 3, 0, 4, 2},
						  {3, 7, 4, 0, 3},
						  {5, 7, 2, 3, 0}};
		
		int[][] graph2 = {{0, 9, 8, 4, 6},
						  {9, 0, 7, 8, 6},
						  {8, 7, 0, 3, 7},
						  {4, 8, 3, 0, 5},
						  {6, 6, 7, 5, 0}};
		
		int[][] graph3 = {{0, 6, 4, 6, 8, 9},
						  {6, 0, 7, 5, 7, 11},
						  {4, 7, 0,11, 5, 8},
						  {6, 5,11, 0, 2, 10},
						  {8, 7, 5, 2, 0, 3},
						  {9, 11,8,10, 3, 0}};
		
		int[][] graph4 = {{0, 7, 4, 9,11, 3},
						  {7, 0, 3, 5, 2, 4},
						  {4, 3, 0,13, 8, 8},
						  {9, 5,13, 0,14, 12},
						  {11,2, 8,14, 0, 5},
						  {3, 4, 8,12, 3, 5}};
		
		TSPmst tsp = new TSPmst(graph1);
		for(int i : tsp.TSPtour()){
			System.out.print((char)(i+'a') + " -> ");
		}
		System.out.println('a');
		System.out.println("The total cost: " + tsp.cost + "\n\n");
		
		
		TSPmst tsp1 = new TSPmst(graph2);
		for(int i : tsp1.TSPtour()){
			System.out.print((char)(i+'a') + " -> ");
		}
		System.out.println('a');
		System.out.println("The total cost: " + tsp1.cost + "\n\n");
		
		
		
		TSPmst tsp2 = new TSPmst(graph3);
		for(int i : tsp2.TSPtour()){
			System.out.print((char)(i+'a') + " -> ");
		}
		System.out.println('a');
		System.out.println("The total cost: " + tsp2.cost + "\n\n");
		
		
		
		TSPmst tsp4 = new TSPmst(graph4);
		for(int i : tsp4.TSPtour()){
			System.out.print((char)(i+'a') + " -> ");
		}
		System.out.println('a');
		System.out.println("The total cost: " + tsp4.cost + "\n\n");
	}

}
