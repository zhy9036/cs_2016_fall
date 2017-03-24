// CSE 373, HW4 HashMap, Yang Zhang
// A HashMap object represents a map of integers using a hash table
// as the internal data structure.
// The hash table uses separate chaining (a linked list in each hash bucket
// index) to resolve collisions.

import java.util.HashSet;
import java.util.Set;

public class HashMap<K, V> implements Map<K, V> {
	private static final double MAX_LOAD = 0.75;   // load factor on which to rehash
	private Node[] elements;
	private int size;
	
	// Constructs a new empty map.
	public HashMap() {
		elements = (Node[]) new HashMap.Node[10];
		size = 0;
		
	}
	
	//Removes all the key/value pairs in this map.
	public void clear() {
		for(int i=0; i<elements.length; i++){
			elements[i] =null;
		}
		size=0;
	}
	
	// Returns whether the given key is found in this map.
	public boolean containsKey(K key) {
		V temp = get(key);
		if(temp == null){
			return false;
		}else{
			return true;
		}
	}

	// Returns the according value to the given key. 
	public V get(K key) {
		int h = hash(key);
		Node current = elements[h];
		while (current != null) {
			if (current.key.equals(key)) {
				return current.value;
			}
			current = current.next;
		}
		return null;
	}

	// Returns true if there are no elements in this map.
	public boolean isEmpty() {
		if(size == 0){
			return true;
		}else{
			return false;
		}
	}
	
	// Returns the hash table's "load factor", its ratio of size to capacity.
	public double loadFactor() {
		return (double) size / elements.length;
	}

	// potential redundancy here
	public Set<K> keySet() {
		Set<K> temp = new HashSet<K>();
		for(int i = 0 ; i<elements.length;i++){
			Node current = elements[i];
			while (current != null) {
				temp.add(current.key);
				current = current.next;
			}
		}
		return temp;
	}
	
	// Adds the given key/value pairs to this map,
	// if the key was already contained, replace its old value by newly passed value.
	public void put(K key, V value) {
		// linear probing to find proper index
		int h = hash(key);
		if (!containsKey(key)) {
			Node newNode = new Node(key, value);
			newNode.next = elements[h];
			elements[h] = newNode;
			size++;
		}else{
			Node current = elements[h];
			while (current.key != key) {
				current = current.next;
			}
			current.value = value;
		}

		// resize if necessary
		if (loadFactor() >= MAX_LOAD) {
			rehash();
		}
		
	}
	
	// Removes the given key and its value from this map,
	// if it was found in the set.
	public void remove(K key) {
		// linear probing to find proper index
		int h = hash(key);
		
		if (elements[h] != null) {
			// front case
			if (elements[h].key.equals(key)) {
				elements[h] = elements[h].next;
				size--;
			} else {
				// non-front case
				Node current = elements[h];
				while (current.next != null && 
						!current.next.key.equals(key)) {
					current = current.next;
				}
				// current.next == null 
				// || current.next.data == value
				if (current.next != null){ 
					current.next = current.next.next;
					size--;
				}
			}
		}
	}

	// Returns the number of key/value pairs in this map.
	public int size() {
		return size;
	}
	
	// Returns a text representation of this map.
	public String toString() {
		if(size == 0){
			return "{}";
		}else{
			String toPrint="{";
			Set<K> temp = keySet();
			int count = size;
			for(K keys: temp){
				if(count>1){
					toPrint += keys+"="+get(keys)+", ";
					count--;
				}else{
					toPrint+= keys+"="+get(keys)+"}";
				}
			}
			return toPrint;
		}
	}
	
	// hash function for mapping values to indexes
	private int hash(K key) {
		return Math.abs(key.hashCode()) % elements.length;
	}

	// Resizes the hash table to twice its original capacity.
	@SuppressWarnings("unchecked")
	private void rehash() {
		Node[] newElements = (Node[]) new HashMap.Node[2 * elements.length];
		Node[] old = elements;
		elements = newElements;
		size = 0;
		for (Node node : old) {
			while (node != null) {
				put(node.key, node.value);
				node = node.next;
			}
		}
	}
	
	//Inside node class that helps connecting elements that have same hashcode.
	private class Node {
		public K key;
		public V value;
		public Node next;
		
		public Node(K key, V value) {
			this.key = key;
			this.value = value;
		}
	}	
}
