// TODO: Remove each 'todo' comment once I implement each part!

// TODO: comment header for my program

import java.util.*;

public class MatchMaker {
	private boolean checkStable;
	private Set<Person> men;
	private Set<Person> women;
	
	// TODO: comment header
	public MatchMaker() {
		// TODO: implement the constructor
		men = new TreeSet<Person>();
		women = new TreeSet<Person>();
		checkStable = false; 
	}
	
	// TODO: comment header
	public void addPerson(String name, String gender, String[] partners){
		if(gender.equals("F")){
			women.add(new Person(name, partners));
		}else{
			men.add(new Person(name, partners));
		}
	}
	
	// TODO: comment header
	public int getRank(String name, String partner) {
		// TODO: implement this method
		for(Person man : men){
			if(man.getName().equals(name)){
				return man.rank(partner);
			}
		}
		for(Person woman: women){
			if(woman.getName().equals(name)){
				return woman.rank(partner);
			}
		}
		return -1;
	}
	
	// TODO: comment header
	public boolean isStable() {
		// TODO: implement this method
		if(!checkStable){
			for(Person one : men){
				if(one.single()){
					return false;
				}
			}
			checkStable = true;
			return false;
		}else{
			return true;
		}
	}
	
	// TODO: comment header
	public void nextRound() {
		
		for(Person m : men){
			if(m.single() && m.notEmpty()){
				String w = m.getFav();
				Person wW = new Person();
				for(Person temp : women){
					if(w.equals(temp.getName())){
						wW = temp;
					}
				}
				if(wW.single()){
					m.getEng(wW);
					wW.getEng(m);
					System.out.println(m.getName()+" proposes to "+wW.getName());
				}else{
					String cur = wW.getCurp();
					if(wW.rank(m.getName()) < wW.rank(cur)){
						for(Person curM : men){
							if(curM.getName().equals(cur)){
								curM.getDump();
							}
						}
						m.getEng(wW);
						wW.getEng(m);
						System.out.println(m.getName()+" proposes to "+wW.getName());						
					}
				}
			}
		}
	}

	public void printMatches() {
		// TODO: implement this method
		
		for(Person m: men){
			if(m.single()){
				System.out.println(m.getName() + ": single");
			}else{
				System.out.println(m.getName() +": engaged to " + m.getCurp()+" (rank "+m.rank(m.getCurp())+")");
			}
		}
		for(Person w: women){
			if(w.single()){
				System.out.println(w.getName() + ": single");
			}else{
				System.out.println(w.getName() +": engaged to " + w.getCurp()+" (rank "+w.rank(w.getCurp())+")");
			}
		}
		
		
	}
	
}
