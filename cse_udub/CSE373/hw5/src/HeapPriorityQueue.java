// CSE 373, HW5, YANG ZHANG
// A HeapPriorityQueue implements a priority queue of objects using a
// binary min-heap array as the internal data structure.

import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class HeapPriorityQueue<E> implements PriorityQueue<E> {
	private int size;
	private E[] elements;
	private Comparator comp;
	
	//Constructs an empty heap pq without passed in parameter. 
	public HeapPriorityQueue() {
		size = 0;
		elements = (E[]) (new Object[10]);;
	}
	
	//Constructs an empty heap pq with custom size and comparator.
	public HeapPriorityQueue(int capacity, Comparator<E> comparator){
		if(capacity < 2){
			throw new IllegalArgumentException();
		}
		size = 0;
		elements = (E[]) new Object[10];
		comp = comparator;
	}
	
	// Adds one element to heap pq.
	public void add(E value) {
		checkE(value);
		if (size + 1 >= elements.length) {
			elements = Arrays.copyOf(elements, 2 * elements.length);
		}
		
		int index = size + 1;
		elements[index] = value;  // put in last slot
		
		// "bubble up" until in order again
		boolean done = false;
		while (!done && hasParent(index)) {
			int daddy = parent(index);
			if (compare(elements[daddy],(elements[index]))> 0) {
				swap(elements, index, daddy);
				index = daddy;
			} else {
				done = true;
			}
		}
		size++;
	}
		
	// Clear all the elements in this heap pq.
	public void clear() {
		for(int i =0; i<elements.length; i++){
			elements[i] = null;
		}
		size = 0;
	}

	//Returns true if this heap pq contains passed element.
	public boolean contains(E value) {
		checkE(value);
		for(int i = 1; i< size+1; i++){
			if(compare(elements[i],(value))==0){
				return true;
			}
		}
		return false;
	}

	//Returns true if this heap pq is empty.
	public boolean isEmpty() {
		return size == 0;
	}

	// Returns an Iterator to traverse the elements of this pq.
	public Iterator<E> iterator() {
		// TODO: implement this method
		return new HeapPriorityQueueIterator();
	}

	// Returns the min element in this pq.
	public E peek() {
		if(size == 0){
			throw new NoSuchElementException();
		}
		return elements[1];
	}

	// Removes the min element in this pq.
	public E remove() {
		if(size == 0){
			throw new NoSuchElementException();
		}
		E result = elements[1];
		elements[1] = elements[size];
		elements[size] = null;
		size--;
		boolean done = true;
		int down = 1;
		movDown(done, down);
		return result;
	}

	// Removes the specified element from this pq.
	public void remove(E value) {
		checkE(value);
		int i=1;
		boolean found = false;	
		while(i<size+1 && !found){
			if(compare(elements[i],(value))==0){
				elements[i] = elements[size];
				elements[size] = null;
				size--;
				found = true;
			}else{
				i++;
			}
		}
		if(found){
			movDown(found, i);
		}
	}
		
	//Returns the size of this pq.
	public int size() {
		return size;
	}
	
	//Returns a string representation of the pq.
	public String toString() {
		if(size == 0){
			return "[]";
		}else if(size == 1){
			return "[" + elements[1]+"]";
		}else{
			String toPrint = "["+elements[1];
			for(int i =2; i<size+1; i++){
				toPrint += ", "+elements[i];
			}
			return toPrint + "]";
		}
	}
	//An iterator class to traverse the elements of this Deque
	//from top to bottom.
	//@SuppressWarnings("unused")
	private class HeapPriorityQueueIterator implements Iterator<E> {
		private int next;
		private int index;
		public HeapPriorityQueueIterator(){
			next = size;
			index = 1;
		}
		
		// Returns true if there are any more elements for this iterator 
		// to return
		public boolean hasNext(){
			return next>0;
		}
		
		@Override
		// Returns the next element from the stack and advances iterator
		public E next() {
			if (!hasNext()) {
				throw new NoSuchElementException();
			}
			int temp = index;
			index++;
			next--;
			return elements[temp];
		}
		@Override
		 //Removes the most recently returned element.
		 //Not supported. Throws an UnsupportedOperationException when called.
		public void remove() {
			// TODO Auto-generated method stub
			throw new UnsupportedOperationException();
			
		}
		
	}
	
	private void checkE(E value){
		if(value == null){
			throw new NullPointerException();
		}
	}
	// A private method that compares two elements
	private int compare(Object a, Object b){
		if(comp != null){
			return comp.compare(a, b);
		}else{
			Comparable e = (Comparable) a;
            Comparable o = (Comparable) b;
            return e.compareTo(o);
		}
		
	}
	
	//Move specified elements down in this pq.
	private void movDown(boolean done, int index){
		while(done && hasLeftChild(index)){
			int kid = leftChild(index);
			if (hasRightChild(index)) {
				int right = rightChild(index);
				if (hasRightChild(index) && 
						compare(elements[right],(elements[kid])) < 0) {
					kid = right;
				}
			}
			if (compare(elements[index],(elements[kid])) > 0) {
				swap(elements, index, kid);
				index = kid;
			} else {
				done = false;
			}
		}
	}
	
	//Returns the index of parent of the given index in the heap.
	private int parent(int index) {
		return index / 2;
	}
	
	// Returns the index of the left child of the given index in the heap.
	private int leftChild(int index) {
		return index * 2;
	}

	// Returns the index of the right child of the given index in the heap.
	private int rightChild(int index) {
		return index * 2 + 1;
	}

	// Returns true if the given index has a parent in the heap (true for all elements above 1).
	private boolean hasParent(int index) {
		return index > 1;
	}

	// Returns true if the given index has a left child element in the heap.
	private boolean hasLeftChild(int index) {
		return leftChild(index) <= size;
	}

	// Returns true if the given index has a right child element in the heap.
	private boolean hasRightChild(int index) {
		return rightChild(index) <= size;
	}
	
	// Swaps the elements at the two given indexes in the array.
	private void swap(E[] a, int index1, int index2) {
		E temp = a[index1];
		a[index1] = a[index2];
		a[index2] = temp;
	}
}
