// CSE 373 Homework 6: The Rotating Dead
// Zhang, Yang

/**
 * Each TreeSet object represents a Set storing a collection of value as
 * its elements.  A Map does not allow duplicate values to be added.
 * The set is implemented using an AVL tree, ordered by the values' natural ordering.
 */

import java.util.Iterator;

public class TreeSet<E extends Comparable<E>> implements Set<E> {
	
	private Map<E, Boolean> map;
	
	/**
	 * Constructs an empty set.
	 */
	public TreeSet() {
		map = new TreeMap<E, Boolean>();
	}

	/**
	 * Adds the given value to this set, if it was not already in the set.
	 */
	@SuppressWarnings("unchecked")
	public void add(E element) {
		map.put(element, true);
	}
	
	/**
	 * Removes all the elements in this set.
	 */
	public void clear(){
		map.clear();
	}

	/**
	 * Returns true if the given element is in this set.
	 */
	public boolean contains(E element) {
		return map.containsKey(element);
	}

	/**
	 * Returns true if this set is empty.
	 */
	public boolean isEmpty() {
		return map.isEmpty();
	}

	/**
	 *  Returns an Iterator to traverse the elements of this set.
	 */
	public Iterator<E> iterator() {
		return map.keySet().iterator();
	}

	/**
	 * Removes the given elements in this set.
	 */
	public void remove(E element) {
		map.remove(element);
	}

	/**
	 * Returns the number of elements in this set.
	 */
	public int size() {
		return map.size();
	}
	
	/** 
	 *Represents all elements of this set in a left-to-right order (in-order) traversal. 
	 */
	public String toString() {
		if(map.size()>0){
			String toPrint = "";
			for(E iter : map.keySet()){
				 toPrint += iter + ", "; 
			}
			return "["+toPrint.substring(0,toPrint.length()-2)+"]";
		}else{
			return "[]";
		}
	}
}
