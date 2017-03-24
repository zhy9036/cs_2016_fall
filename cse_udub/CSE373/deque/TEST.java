// CSE 143 Homework 5, GrammarSolver
// Zhang,Yang 1030416  Section BG
// This class can choose different combinations of words from a dictionary that 
// constructed by letters from passed phrase 

import java.util.*;

public class Anagrams{
	private Set<String> dict;
	
	//PRE:  Throws an illegal argument exception if the passed set is null
	//      There is no max, so no need to test it(make it "0")
	//POST: Constructs an Anagrams object with passed dictionary
	public Anagrams(Set<String> dictionary){
		ifError(dictionary, 0);
		dict = dictionary;
	}
	
	//PRE:  Throws an illegal argument exception if the passed set is null
	//      There is no max, so no need to test it(make it "0")
	//POST: Return a new set that contains all the possible words from passed dictionary
	public Set<String> getWords(String phrase){
		ifError(phrase, 0);
		LetterInventory combination = new LetterInventory(phrase);
		LetterInventory temp;
		Set<String> tinyDict = new TreeSet<String>();
		for(String word : dict){
			temp = new LetterInventory(word);
			if(combination.contains(temp)){
				tinyDict.add(word);
			}
		}
		return tinyDict;
	}	
	//PRE:  Throws an illegal argument exception if the passed set is null
	//      or max is smaller than zero
	//POST: Prints "max" number of words combinations of given letters from passed dictionary 
	public void print(String phrase, int max){
		ifError(phrase, max);	
		LetterInventory combination = new LetterInventory(phrase);
		Set<String> tinyDict = getWords(phrase);
		ArrayList<String> toPrint = new ArrayList<String>();
		if(max == 0){
			printHelper(toPrint, combination, tinyDict, -1);// -1 is used to ignore the 
																			// if condition of the helper method
		}else{
			printHelper(toPrint, combination, tinyDict, max);
		}	
	}
	
	//POST: Prints all the combinations of given letters from passed dictionary
	public void print(String phrase){
		print(phrase, 0); 
	}
	
	//POST: Does the actual print job by using backtracking
	private void printHelper(ArrayList<String> toPrint, LetterInventory combination, 
									 Set<String> tinyDict, int max){
								
		if(combination.isEmpty()){
			System.out.println(toPrint);
		}else{
			if(max != 0){
				for(String word: tinyDict){
					if(combination.contains(word)){
						toPrint.add(word);
						combination.subtract(word);
						printHelper(toPrint, combination, tinyDict, max - 1);
						combination.add(word);
						toPrint.remove(toPrint.size()-1);
					}	
				}
			}	
		}
	}			
	
	//PRE: Throws an illegal argument exception if the passed object is null
	//      or max is smaller than zero
	//POST: Check helper method
	private void ifError(Object toCheck, int max){
		if(toCheck == null || max <0){
			throw new IllegalArgumentException();
		}	 
	}
}	
		
					