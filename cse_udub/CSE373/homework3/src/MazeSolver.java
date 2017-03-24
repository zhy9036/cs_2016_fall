/**
 * CSE 373 HW3 MazeSolver
 * ZHANG, YANG  1030416
 */

import java.awt.*;
import java.util.*;
import java.util.Deque;

/**
 * A MazeSolver object can solve a maze object that provided by a Maze object.
 */

public class MazeSolver {

	
	/**
	 * Return true if there is a possible solution to the passed Maze object.
	 */
	public boolean solve(Maze maze) {
		if(maze == null){
			throw new NullPointerException();
		}
		Deque<Point> dq = new LinkedList<Point>();
		dq.addFirst(maze.start());
		while(!dq.isEmpty()){
			Point exam = dq.removeFirst();
			if(exam.equals(maze.end())){
				return true;
			}else if(!maze.isVisited(exam.x, exam.y)&&!maze.isWall(exam.x, exam.y)){
				maze.setVisited(exam.x, exam.y);
				dq = addToQ(exam, new Point(exam.x, exam.y-1), dq, maze); 
				dq = addToQ(exam, new Point(exam.x, exam.y+1), dq, maze); 
				dq = addToQ(exam, new Point(exam.x-1, exam.y), dq, maze); 
				dq = addToQ(exam, new Point(exam.x+1, exam.y), dq, maze); 
			}
		}
		return false;
	}
	
	/**
	 * A private method that helps MazeSolver object to add all directional squires to its Deque. 
	 */
	private Deque<Point> addToQ(Point exam, Point toAdd, Deque<Point> dq, Maze maze){
		if(maze.isInBounds(toAdd.x, toAdd.y)){
			if(toAdd.distance(maze.end())<exam.distance(maze.end())){
				dq.addFirst(toAdd);
			}else{
				dq.addLast(toAdd);
			}
		}
		return dq;
	}
}
