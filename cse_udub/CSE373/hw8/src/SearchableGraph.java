// CSE 373 Homework 8: Six Degrees of Kevin Bacon
// Zhang, Yang 1030416

import java.util.Collections;
import java.util.Comparator;
import java.util.Deque;
import java.util.LinkedList;
import java.util.List;
import java.util.PriorityQueue;
import java.util.Stack;

// A SearchableGraph object can find shortest path or possible path between two vertexes 
public class SearchableGraph<V, E> extends AbstractGraph<V, E> {

	// Constructs a SearchalbeGraph object
	public SearchableGraph() {
		super();
	}
	
	// Constructs a SearchalbeGraph object with directed and weighted parameter
	public SearchableGraph(boolean directed, boolean weighted) {
		super(directed, weighted);
	}
	
	// Returns true if there is a path between vertex v1 and v2.
	public boolean isReachable(V v1, V v2) {
	    checkVailty(v1,v2);
		super.clearVertexInfo();
		Stack<V> path = new Stack<V>();
		boolean temp = false;
		return isReachable(v1, v2, path, temp);
	}
	
	//A help method for isReachable that do the actual exploring job.
	private boolean isReachable(V v1, V v2, Stack<V> path, boolean temp){
		path.push(v1);
		super.vertexInfo(v1).setVisited(true);
		if(v1.equals(v2)){
			return true;
		}else{
			for(V sv : super.neighbors(v1)){
				if(!super.vertexInfo(sv).visited()){
					super.vertexInfo(sv).setVisited(true);
					temp = isReachable(sv, v2, path, temp);
					path.pop();
				}
			}	
		}
		return temp;
	}
	
	// Returns a list of media vertex if there is a min path 
	// between v1 and v2, otherwise returns null
	public List<V> minimumWeightPath(V v1, V v2) {
		checkVailty(v1,v2);
		super.clearVertexInfo();
		PriorityQueue<Vertex<V>> pq = new PriorityQueue<Vertex<V>>(10, new GraphComparator());
		for(V v : super.vertices()){//.keySet()){
			if(v.equals(v1)){
				super.vertexInfo(v).setCost(0);
			}else{
				super.vertexInfo(v).setCost(Integer.MAX_VALUE);
			}
			pq.add(super.vertexInfo(v));
		}
		while(!pq.isEmpty()){
			Vertex<V> u = pq.poll();
			u.setVisited(true);
			V a = u.vertex();
			for(V n : super.neighbors(a)){
				Vertex<V> exam = super.vertexInfo(n);
				if(!super.vertexInfo(n).visited()){
					int cost = u.cost();
					if(u.cost() != Integer.MAX_VALUE){
						cost += super.edgeWeight(a, n);	
					}
					if(cost < exam.cost()){
						exam.setCost(cost);
						exam.setPrevious(a);
						
						pq.remove(exam);
						pq.add(exam);
					}
				}
			}
		}
		if(super.vertexInfo(v2).cost() == Integer.MAX_VALUE){	
			return null;
		}else{
			return storedPath(v2);
		}
	}
	
	// A inner comparator class that helps a pq to sort vertex based on cost.
	public class GraphComparator implements Comparator<Vertex<V>>{
		public int compare(Vertex<V> v1, Vertex<V> v2){
			return v1.cost()-v2.cost();
		}
	}
	 
	// Returns a list of media vertex if there is a shortest path 
	// between v1 and v2, otherwise returns null
	public List<V> shortestPath(V v1, V v2) {
		checkVailty(v1,v2);
		super.clearVertexInfo();
		Deque<V> list = new LinkedList<V>();
		list.addFirst(v1);
		super.vertexInfo(v1).setVisited(true);
		while(!list.isEmpty()){
			V test = list.removeFirst();
			if(test.equals(v2)){
				return storedPath(v2);
			}else{
				for(V nei : super.neighbors(test)){
					if(!super.vertexInfo(nei).visited()){
						super.vertexInfo(nei).setPrevious(test);
						super.vertexInfo(nei).setVisited(true);
						list.addLast(nei);
					}
				}
			}
		}
		return null;
	}
	
	
	// A help method that back tracking vertexes for storing path.
	private List<V> storedPath(V end){
		List<V> path = new LinkedList<V>();
		while(super.vertexInfo(end).previous()!=null){
			path.add(end);
			end = super.vertexInfo(end).previous();
		}
		path.add(end);
		Collections.reverse(path);
		return path;
	}
	
	// Throws exceptions if v1 or v2 is null or doesn't show in this graph
	private void checkVailty(V v1, V v2){
		if(v1 == null || v2 == null){
			throw new NullPointerException();
		}	
		if(!super.containsVertex(v1) || !super.containsVertex(v2)){
			throw new IllegalArgumentException();
		}
	}
}
