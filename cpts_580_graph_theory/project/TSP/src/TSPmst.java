import java.util.ArrayList;

public class TSPmst {
	int[][] graph;
	int[] mst;
	ArrayList<Integer> tour;
	int cost;
	public TSPmst(int[][] graph){
		this.graph = graph;
		int size = graph.length;
		int cost = 0;
		if(size < 5 || size > 20){
			throw new IllegalArgumentException("Input Graph has wrong size");
		}
		for(int i = 0; i < size; i++){
			for(int j = 0; j < size; j++){
				if(i != j && graph[i][j] <= 0)
					throw new IllegalArgumentException("Input Graph is not complete");
			}
		}
		mst = new int[size];
		tour = new ArrayList();;
		constructMST();
	}
	
	private void constructMST(){
		int[] parent = new int[graph.length];
		int[] v = new int[graph.length];
		boolean[] checkList = new boolean[graph.length];
		
		for(int i = 0; i < graph.length; i++){
			v[i] = Integer.MAX_VALUE;
			checkList[i] = false;
		}
		
		v[0] = 0;
		parent[0] = -1;
		for(int i = 0; i < graph.length; i++)
			parent[i] = -1;
		
		for(int i = 0; i<graph.length-1; i++){
			int minVertex = nextEdge(v,checkList);
			checkList[minVertex] = true;
			
			for(int j = 0; j < graph.length; j++){
				if(graph[minVertex][j]!=0 && checkList[j] == false
						&& graph[minVertex][j] < v[j]){
					parent[j] = minVertex;
					//if(j == 5)
						//System.out.println(graph[minVertex][j]);
					
					v[j] = graph[minVertex][j];
					//if(j == 4)
						//System.out.println((char)(minVertex+'a'));
				}
			}
		}
		mst = parent;
		//printPrim(mst, graph);
	}
	
	private int nextEdge(int[] v, boolean[] checkSet){
		int min = Integer.MAX_VALUE;
		int index = -1;
		for(int i = 0; i < v.length; i++){
			if(!checkSet[i] && v[i] < min){
				min = v[i];
				index = i;
			}
		}	
		return index;
	}
	
	public ArrayList<Integer> TSPtour(){
		ArrayList<Integer> rst = TSPtour(0, mst, tour);
		cost += graph[0][rst.get(rst.size()-1)];
		return rst;
	}
	
	private ArrayList<Integer> TSPtour(int vertexNum, int[] mst, ArrayList<Integer> tour){
		tour.add(vertexNum);
		if(tour.size() > 1)
			cost += graph[tour.get(tour.size()-1)][tour.get(tour.size()-2)];
		
		for(int i = 0; i < mst.length; i++){
			int parent = mst[i];
			if(parent == vertexNum && !tour.contains(i)){
				tour = TSPtour(i, mst, tour);
			}
		}
		return tour;
	}
	
	private void printPrim(int[] parent, int[][] graph){
		//System.out.println(graph[4][1]);
		System.out.println("Edge  Weight");
		for(int i = 1; i < graph.length; i++){
			
			 System.out.println((char)(parent[i]+'a')+" - "+ ((char)(i+'a'))+"    "+
                     graph[i][parent[i]]);
		}
		
		System.out.println("\n");
	}
}
