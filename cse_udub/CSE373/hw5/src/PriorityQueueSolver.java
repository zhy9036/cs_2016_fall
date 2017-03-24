/**
 * CSE 373 HW5 PriorityQueueSolver
 * ZHANG, YANG  1030416
 */


/**
 * A MazeSolver object can solve a maze object that provided by a Maze object.
 */

import java.awt.Point;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.Queue;

public class PriorityQueueSolver implements Solver {
	
	private Point end;
	
	/**
	 * Return true if there is a possible solution to the passed Maze object.
	 */
	public boolean solve(Maze maze) {
		if(maze == null){
			throw new NullPointerException();
		}
		end = maze.end();
		Queue<Point> pq = new PriorityQueue<Point>(10, new disComparator());
		pq.add(maze.start());
		while(!pq.isEmpty()){
			Point exam = pq.remove();
			if(exam.equals(maze.end())){
				return true;
			}else if(!maze.isVisited(exam.x, exam.y)&&!maze.isWall(exam.x, exam.y)){
				maze.setVisited(exam.x, exam.y);
				addToQ(new Point(exam.x, exam.y-1), pq, maze); 
				addToQ(new Point(exam.x, exam.y+1), pq, maze); 
				addToQ(new Point(exam.x-1, exam.y), pq, maze); 
				addToQ(new Point(exam.x+1, exam.y), pq, maze); 
			}
		}
		return false;
	}
	
	/**
	 * A private method that helps MazeSolver object to add all directional squires to its heap. 
	 */
	private void addToQ(Point toAdd, Queue<Point> pq, Maze maze){
		if(maze.isInBounds(toAdd.x, toAdd.y)){
			pq.add(toAdd);
		}
	}
	
	/**
	 * A private method that compares two point object based on the distance from end point. 
	 */
	public class disComparator implements Comparator<Point>{
		@Override
		public int compare(Point o1, Point o2) {
			return new Double(o1.distance(end)).compareTo(o2.distance(end));
		}	
	}
}
