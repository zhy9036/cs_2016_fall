// TODO: Remove each 'todo' comment once I implement each part!

// TODO: class comment header

import java.util.Iterator;
import java.util.*; 
public class ArrayDeque<E> implements Deque<E> {
	// TODO: declare my private fields here
	private int size;
	private E[] elements;
	private int front;
	private int back;
	// TODO: comment header
	
	public ArrayDeque() {
		// TODO: implement the constructor
		size = 0;
		elements = (E[]) (new Object[10]);
		front =0;
		back = 0;
	}
	
	// TODO: comment header
	public void addFirst(E element) {
		if(element == null){
			throw new NullPointerException();
		}
		size++;
		elements[front]=element;
		if(front == 0){
			front = elements.length-1;
		}else{
			front--;
		}	
	}
	
	// TODO: comment header
	public void addLast(E element) {
		if(element == null){
			throw new NullPointerException();
		}
		
		if(size == 0){
			back = 0;
			
		}else if(front+size<elements.length){
			back = front+size;
		}else{
			back = front+size-elements.length;
		}
		elements[back] = element;
		size++;
		back++;
	}
	
	// TODO: comment header
	public void clear() {
		// TODO: implement this method
		for(E toClear: elements){
			toClear = null;
		}
	}
	
	// TODO: comment header
	public boolean isEmpty() {
		if(size == 0){
			return true;
		}else{
			return false;
		}
	}
	
	// TODO: comment header
	public Iterator<E> iterator() {
		return new ArrayDequeIterator();
	}
	
	// TODO: comment header
	public E peekFirst() {
		// TODO: implement this method
		if(front == elements.length-1){
			return elements[0];
		}else{
			return elements[front+1];
		}
	}
	
	// TODO: comment header
	public E peekLast() {
		if(back == 0){
			return elements[elements.length-1];
		}else{
			return elements[back-1];
		}
	}
	
	// TODO: comment header
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
		return temp;
	}
	
	// TODO: comment header
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
		return temp;
	}
	
	// TODO: comment header
	public int size() {
		return size;
	}
	
	// TODO: comment header
	public String toString() {
		return elements.toString();
		
		/*
		if(size==0){
			return "[]";
		}else if(size==1){
			if(front==elements.length-1){
				return "["+elements[0]+"]";
			}else{
				return "["+elements[front+1]+"]";
			}
		}else{
			String toPrint="";
			if(back>front){
				toPrint="["+elements[front+1];
				for(int i=front+2; i<back; i++){
					toPrint += ", "+elements[i];
				}
				return toPrint + "]";
			}else{
				String temp="["+elements[0];
				if(front==elements.length-1){
					for(int i =1; i<back;i++){
						temp=", "+elements[back-1];
					}
					return temp+"]";
				}else if(back==0){
					toPrint = "["+elements[front+1];
					for(int i=front+2; i<elements.length;i++){
						toPrint+=", "+elements[i];
					}
					return toPrint+"]";
				}else{
					for(int i =1; i<back;i++){
						temp=", "+elements[back-1];
					}
					//toPrint = "["+elements[front+1];
					for(int i=front+1; i<elements.length;i++){
						toPrint+=", "+elements[i];
					}
					return "["+elements[0]+toPrint+temp+"]";
				}
			}
			
		}
		*/
	}
	
	// TODO: Implement your inner iterator class here.
	// TODO: comment header
	private class ArrayDequeIterator implements Iterator<E> {
		
		private int next;
		private int frontIt;
		public ArrayDequeIterator() {
			next = size;
			frontIt = front;
		}
		
		
		public boolean hasNext() {
			return next > 0;
		}
		
		
		public E next() {
			next--;
			if(frontIt==elements.length){
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
}
