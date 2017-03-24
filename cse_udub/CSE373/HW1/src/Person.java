import java.util.*;

public class Person implements Comparable{

	private Map<String, Integer> ranks;
	private String curPartner;
	private String name;
	private Queue<String> perList;
	
	public Person(){
	
	}
	
	public Person(String na, String[] pL){
		name = na;
		curPartner = null;
		perList = new LinkedList<String>();
		ranks = new HashMap<String, Integer>();
		//System.out.println(pL.length);
		
		for(int i = 0; i<pL.length; i++){
			ranks.put(pL[i], i+1);
			perList.add(pL[i]);
		}	
			
	}
	
	public String getName(){
		return name;
	}
	
	public void getEng(Person pa){
		curPartner = pa.getName();
		//perList.remove();
		//++++++++++++++++++++++++++++++++++++++
		//System.out.println(name + " engage   "+curPartner+"   "+  perList.toString());
		//pa.getEng(this);
	}
	
	
	public void getDump(){
	
		//System.out.println(name + " dumped   "+curPartner+"          "+perList.toString());
		curPartner = null;
	}
	
	public int rank(String par){
		for(String a : ranks.keySet()){
			if(a.equals(par)){
				return ranks.get(a);
			}
		}
		return -1;
	}
	
	public String getCurp(){
		return curPartner;
	}
	
	
		
	
	public boolean single(){
		if(curPartner == null){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean notEmpty(){
		return !perList.isEmpty();
	}
	
	public String getFav(){
		return perList.remove();
	}
	
	public int compareTo(Object o){
		Person p = (Person) o;
		return this.name.compareToIgnoreCase(p.name); 
	}
}
		