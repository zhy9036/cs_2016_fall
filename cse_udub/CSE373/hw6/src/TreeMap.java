// CSE 373 Homework 6: The Rotating Dead
// Zhang, Yang

/**
 * Each TreeMap object represents a Map storing a collection of key/value pairs as
 * its elements.  A Map does not allow duplicate keys to be added.
 * The map is implemented using an binary search tree, ordered by the keys' natural ordering.
 * Class invariant: nodes are always kept in proper AVL sorted order.
 */

public class TreeMap<K extends Comparable<K>, V> extends AbstractTreeMap<K, V> {
	
	/**
	 * Constructs an empty map.
	 */
	public TreeMap() {
		super.clear();
	}
		
	/** 
	 *Represents all elements of this tree in a left-to-right order (in-order) traversal. 
	 */
	public String toString() {
		
		String temp = toString(super.root, "");
		if(temp.length()>0){
			return "{"+temp.substring(0, temp.length()-2)+"}";
		}else{
			return "{}";
		}
	}
	
	/**
	 * Adds the given key/value to this map, if it was not already in the map.
	 * If the given key is already in this map, its value is replaced.
	 * Throws a NullPointerException if the key or value is null.
	 */
	protected TreeNode put(TreeNode node, K key, V value) {
		// TODO: implement this method
		if(key == null){
			throw new NullPointerException();
		}
		node = super.put(node, key, value);
		node = rotate(node);
		return node;
	}
	
	
	/**
	 * Removes the given key and its associated value from this map,
	 * if it is found in this map.
	 * If the given key is not found, calling this method has no effect.
	 * Throws a NullPointerException if the key is null.
	 */
	protected TreeNode remove(TreeNode node, K key) {
		// TODO: implement this method
		node = super.remove(node, key);
		node = rotate(node);
		return node;
	}
	
	/** Returns the height of the node that passed in. */
	private int getKidHei(TreeNode node){
		if(node != null){
			return node.height;
		}else{
			return 0;
		}		
	}
	
	// Helps toString to print key/value pairs according to in-order traversal
	private String toString(TreeNode node, String toPrint){
		if(node!=null){
			toPrint = toString(node.left, toPrint);
			toPrint += node.key+"="+node.value + ", ";
			toPrint = toString(node.right, toPrint);
		}
		return toPrint;
	}
	
	// Do leftrotate based on the given node
	private TreeNode leftRotate(TreeNode oldParent){
		TreeNode orphan = oldParent.right.left;
		TreeNode newParent = oldParent.right;
		
		newParent.left = oldParent;
		oldParent.right = orphan;
		
		fixHeight(oldParent);
		fixHeight(newParent);
		
		return newParent;
	}
	
	// Do rightrotate based on the given node
	private TreeNode rightRotate(TreeNode oldParent){
		TreeNode orphan = oldParent.left.right;
		TreeNode newParent = oldParent.left;
		
		newParent.right = oldParent;
		oldParent.left = orphan;
		
		fixHeight(oldParent);
		fixHeight(newParent);
		
		return newParent;
	}

	// Rotate the given tree to make it AVL
	private TreeNode rotate(TreeNode parent){
		if(parent != null){
			int leftHei = getKidHei(parent.left);
			int rightHei = getKidHei(parent.right);
			
			// right sub tree bigger
			if(leftHei -  rightHei >= 2){
				TreeNode leftChild = parent.left;
				int leftChildLH = getKidHei(leftChild.left);
				int leftChildRH = getKidHei(leftChild.right);
				
				if(leftChildLH>=leftChildRH){  // Left Left case && case 5 LR2
					parent = rightRotate(parent);
				
				}else{   // Left Right case
					
					parent.left = leftRotate(parent.left);
					parent = rightRotate(parent);
				}
			
			// left sub tree bigger
			}else if(rightHei - leftHei >=2){  
				TreeNode rightChild = parent.right;
				int rightChildLH = getKidHei(rightChild.left);
				int rightChildRH = getKidHei(rightChild.right);
				
				if(rightChildRH>= rightChildLH){ // right right case && case 5 RL2
					parent = leftRotate(parent);
				}else{
					// Right Left case
					parent.right = rightRotate(parent.right);
					parent = leftRotate(parent);
				}
			}
			return parent;
		}
			return null;
	}
	
	// Updates the height after rotation. 
	private void fixHeight(TreeNode node){
		if(node != null){
			int left = 0;
			if(node.left != null){
				left = node.left.height;
			}
			int right = 0;
			if (node.right != null){
				right = node.right.height;
			}
			node.height = Math.max(left, right)+1;
		}
	}
}
