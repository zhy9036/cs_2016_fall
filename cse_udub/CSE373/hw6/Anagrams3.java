import java.util.*;
import java.io.*;

public class Anagrams {
	private Set<String> words;
	
	public Anagrams(Set<String> dictionary) {
		if (dictionary == null) {
			throw new IllegalArgumentException();
		}
		words = new TreeSet<String>();
		
		for (String element : dictionary) {
			words.add(element);
		}
	}
	
	public Set<String> getWords(String phrase) {
		if (phrase == null) {
			throw new IllegalArgumentException();
		}
		Set<String> choices = new TreeSet<String>();
		LetterInventory letters = new LetterInventory(phrase);
		for (String word : words) {
			if (letters.contains(word)) {
				choices.add(word);
			}
		}		
		return choices;
	}
	
	public void print(String phrase) {
		//print(new Stack<String>(),  new LetterInventory(phrase), -1, );
	}
	
	private void print(Stack<String> anagram, LetterInventory letters, int max, Set<String> choices) {
		if (letters.isEmpty() ){//|| getWords(letters.toString()) == null) {
			System.out.println(anagram);
		} else if (max != 0) {
			for (String word : choices) {
				if (letters.contains(word)) {
					letters.subtract(word);
					anagram.push(word);
					print(anagram, letters, max - 1, choices);
					letters.add(word);
					anagram.pop();
				}
			}
		}
	}
		
	public void print(String phrase, int max) {
		Set<String> choices = getWords(phrase);
		if (max == 0) {
			print(phrase);
		} else {
			print(new Stack<String>(), new LetterInventory(phrase), max, choices);
		}
	}
}