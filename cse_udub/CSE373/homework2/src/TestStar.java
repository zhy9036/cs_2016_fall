// TODO: Remove each 'todo' comment once I implement each part!
// TODO: class comment header

import java.awt.*;
import java.util.*;

// TODO: remove these two import statements once my ArrayDeque (Part B) is working,
// TODO: so that this class will use my ArrayDeque instead of Java's Deque

public class MazeSolver {
	// TODO: comment header
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
