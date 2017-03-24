// CSE 373 Homework 3: The Amazing Deque 
// YOU DO NOT NEED TO MODIFY THIS INSTRUCTOR-PROVIDED FILE.
// Your code should work properly with an unmodified version of this file.

import java.util.Iterator;

/**
 * Interface Deque represents an abstract data type (ADT) for a double-ended queue.
 * A deque allows efficient insertion and removal at its front and back, combining
 * many of the benefits of stacks and queues into a single collection.
 * 
 * Classes implementing Deque are generally expected to provide the operations
 * below in O(1) constant amortized runtime, except for the toString and clear
 * operations.
 */
public interface Deque<E> extends Iterable<E> {
	// (Comments are intentionally omitted from these abstract method headings,
	//  because we want you to write comments for these methods in your own
	//  words in your ArrayDeque class.)
	
	/** @see Homework spec for details */
	void addFirst(E element);
	
	/** @see Homework spec for details */
	void addLast(E element);
	
	/** @see Homework spec for details */
	void clear();
	
	/** @see Homework spec for details */
	boolean isEmpty();
	
	/** @see Homework spec for details */
	Iterator<E> iterator();
	
	/** @see Homework spec for details */
	E peekFirst();
	
	/** @see Homework spec for details */
	E peekLast();
	
	/** @see Homework spec for details */
	E removeFirst();
	
	/** @see Homework spec for details */
	E removeLast();
	
	/** @see Homework spec for details */
	int size();
	
	/** @see Homework spec for details */
	String toString();
}
