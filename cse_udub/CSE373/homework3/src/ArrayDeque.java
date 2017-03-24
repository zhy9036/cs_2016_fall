/**
 * CSE 373 HW3 ArrayDeque
 * ZHANG, YANG  1030416
 */

import java.util.Iterator;
import java.util.*;

/**
 * An ArrayDeque object is bidirectional queue, which allow user add/remove
 * data from both end.
 */

public class ArrayDeque<E> implements Deque<E> {
	
	private int size;      // Indicating the current size of ArrrayDeque
	private E[] elements;  // Inside array that stores data
	private int front;     // Indicating the index of the first front empty spot
	private int back;      // Indicating the index of the first back empty spot
	
	/**
	 * Construct a empty ArrayDeque object.
	 */
	public ArrayDeque() {
		size = 0;
		elements = (E[]) (new Object[10]);
		front = 0;
		back = 0;
	}
	
	/**
	 * Add a element to the front of Deque
	 */
	public void addFirst(E element) {	
		checkNull(element);
		reSize();
		if(size==0){
			back=1;
			front = 0;
		}
		elements[front]=element;
		if(front == 0){
			front = elements.length-1;
		}else{
			front--;
		}
		size++;
	}
	
	/**
	 * Add a element to the back of Deque
	 */
	public void addLast(E element) {
		checkNull(element);
		reSize();
		if(size==0){
			front = elements.length-1;
			back = 0;
		}
		elements[back] = element;
		if(back == elements.length){
			back = 0;	
		}else {
			back++;
		}
		size++;
	}
	
	/**
	 * Double the size of current Deque
	 */
	private void reSize(){
		if(size == elements.length){
			E[] newElements = (E[]) (new Object[2 * size]);
			for(int i = back; i< elements.length; i++){
				newElements[i-back]=elements[i];
			}
			for(int i = 0; i<=front;i++){
				newElements[elements.length-back+i]=elements[i];
			}
			elements = newElements;
			front = elements.length-1;
			back = size;
		}
	}
	
	/**
	 * Clear the whole Deque
	 */
	public void clear() {
		
		for(E toClear: elements){
			toClear = null;
		}
		size=0;
	}
	
	/**
	 * Return true if the Deque is empty
	 */
	public boolean isEmpty() {
		if(size == 0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * Returns an Iterator to traverse the elements of this Deque
	 */
	public Iterator<E> iterator() {
		return new ArrayDequeIterator();
	}
	
	/**
	 * Returns the first element of this Deque
	 */
	public E peekFirst() {
		checkVaildity();
		if(front == elements.length-1){
			return elements[0];
		}else{
			return elements[front+1];
		}
	}
	
	/**
	 * Returns the last element of this Deque
	 */
	public E peekLast() {
		checkVaildity();
		if(back == 0){
			return elements[elements.length-1];
		}else{
			return elements[back-1];
		}
	}
	
	/**
	 * Returns and removes the first element of this Deque
	 */
	public E removeFirst() {
		E temp;
		if(front == elements.length-1){
			temp = elements[0];
			elements[0]=null;
			front = 0;
		}else{
			temp = elements[front+1];
			elements[front+1]=null;
			front++;
		}
		size--;
		return temp;
	}
	
	/**
	 * Returns and removes the first element of this Deque
	 */
	public E removeLast() {
		E temp;
		if(back==0){
			temp=elements[elements.length-1];
			elements[elements.length-1]=null;
			back=elements.length-1;
		}else{
			temp=elements[back-1];
			elements[back-1]=null;
			back--;
		}
		size--;
		return temp;
	}
	
	/**
	 * Returns the size of this Deque
	 */
	public int size() {
		return size;
	}
	
	/**
	 * Returns a string representation of the Deque, such as "[a,b,c]".
	 */
	public String toString() { 
		if(size==0){
			return "[]";
		}else if(size==1){
			if(front==elements.length-1){
				return "["+elements[0]+"]";
			}else{
				return "["+elements[front+1]+"]";
			}
		}else{
			String temp;
			if(front == elements.length-1){
				temp = "["+elements[0];
				for(int i = 1; i<back; i++){
					temp+= ", "+elements[i];
				}
				return temp+"]";
			
			}else if(back-front>1){
				temp = "["+elements[front+1];
				for(int i = front+2; i<back; i++){
					temp+= ", "+elements[i];
				}
				return temp+"]";
			
			}else{
				temp = "["+elements[front+1];
				for(int i = front+2; i<elements.length; i++){
					temp+= ", "+elements[i];
				}
				for(int i = 0; i<back; i++){
					temp+= ", "+elements[i];
				}
				return temp+"]";
			}			
		}
	}
	
	/**
	 * An iterator class to traverse the elements of this Deque
	 * from top to bottom.
	 */
	private class ArrayDequeIterator implements Iterator<E> {
		
		private int next;
		private int frontIt;
		
		// Constructs an iterator at the beginning of this deque.
		public ArrayDequeIterator() {
			next = size;
			frontIt = front;
		}
		
		// Returns true if there are any more elements for this iterator 
		// to return
		public boolean hasNext() {
			return next > 0;
		}
		
		// Returns the next element from the stack and advances iterator 
		public E next() {
			if (!hasNext()) {
				throw new NoSuchElementException();
			}
			next--;
			if(frontIt==elements.length-1){
				frontIt = 0;
				return elements[0];
			}else{
				E result = elements[frontIt+1];
				frontIt++;
				return result;
			}
		}
		
		/**
		 * Removes the most recently returned element.
		 * Not supported. Throws an UnsupportedOperationException when called.
		 */
		public void remove() {
			throw new UnsupportedOperationException();
		}
	}
	
	/**
	 * Throw a NullPointerException if the passed element is null.
	 */
	private void checkNull(E toCheck){
		if(toCheck == null){
			throw new NullPointerException();
		}
	}
	
	/**
	 *Throw a NullSuchElementException if the deque is empty. 
	 */
	private void checkVaildity(){
		if(size == 0){
			throw new NoSuchElementException();
		}
	}
}
