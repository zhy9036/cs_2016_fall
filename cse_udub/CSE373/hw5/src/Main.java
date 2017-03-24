// CSE 373 Homework 5: The Even More Amazing Heap 
// YOU DO NOT NEED TO MODIFY THIS INSTRUCTOR-PROVIDED FILE.
// Your code should work properly with an unmodified version of this file.

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.lang.*;

/**
 * This program runs the maze solver comparison.
 * It reads the input data from the maze text file
 * that will be passed in to construct two Maze objects,
 * then it asks your MazeSolvers to solve the maze.
 */
public class Main {
	// default file to use to load a maze, if none is typed
	private static final String DEFAULT_MAZE_FILENAME = "maze1.txt";
	
	/** Runs the program. */
	public static void main(String[] args) throws FileNotFoundException {
		System.out.println("CSE 373 Maze Solver Revisited");
		System.out.println("=============================");
		System.out.println("This program shows two different algorithms that can");
		System.out.println("find a path to escape from a 2-D maze.");
		System.out.println();
		
		Scanner console = new Scanner(System.in);
		String mazeText = readMazeText(console);
		Solver solver1 = new DequeSolver();
		Solver solver2 = new PriorityQueueSolver();
		GraphicalMazeComparison gui = new GraphicalMazeComparison(mazeText, solver1, solver2);
		gui.solveBoth();
	}
	
	/**
	 * Reads maze data from the user's text file and returns it as a string
	 * Throws a FileNotFoundException if the maze file is not found.
	 */
	public static String readMazeText(Scanner console) throws FileNotFoundException {
		System.out.print("Maze input file name [Enter for " + DEFAULT_MAZE_FILENAME + "]? ");
		String filename = console.nextLine().trim();
		if (filename.length() == 0) {
			filename = DEFAULT_MAZE_FILENAME;
		} else if (!filename.contains(".")) {
			filename += ".txt";
		}
		StringBuilder sb = new StringBuilder();
		Scanner input = new Scanner(new File(filename));
		while (input.hasNextLine()) {
			sb.append(input.nextLine());
			sb.append('\n');
		}
		return sb.toString();
	}
}
