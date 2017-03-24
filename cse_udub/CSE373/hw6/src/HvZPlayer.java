// CSE 373 Homework 6: HashMaps vs. Zombies 
//Yang Zhang, 1030416

/**
 * Each HvZPlayer object represents a single player (human or zombie) in the HvZT game.
 * The object keeps track of whether the player is a human or a zombie, along
 * with the number of kills that the zombie has made.
 */
public class HvZPlayer implements Comparable<HvZPlayer>{
	private static final int SUPER_ZOMBIE_KILLS = 3;  // # of kills to be a "super zombie"
	
	private final String name;
	private boolean human;  // false means zombie
	private int kills;
	
	/**
	 * Constructs a new human or zombie player with the given name and type.
	 * Throws a NullPointerException if the name is null.
	 */
	public HvZPlayer(String name, boolean human) {
		if (name == null) {
			throw new NullPointerException();
		}
		
		this.name = name;
		this.human = human;
		this.kills = 0;
	}
	
	/**
	 * Turns this player into a zombie.
	 * Throws an IllegalStateException if the player is already a zombie.
	 */
	public void becomeZombie() {
		if (!isHuman()) {
			throw new IllegalStateException(name + " is already a zombie");
		}
		this.human = false;
	}
	
	public int compareTo(HvZPlayer other){
		if(!name.equals(other.name)){
			return name.compareTo(other.name);
		}else if(human!=other.human){
			if(human){
				return 1;
			}else{
				return -1;
			}
		}else{
			return -(kills-other.kills);
		}
	}
	/**
	 * Returns whether this player is currently a human (true) or zombie (false).
	 */
	public boolean isHuman() {
		return human;
	}
	
	/**
	 * Returns the number of humans this player has killed.
	 * If the player is a human or has not killed any humans, returns 0.
	 */
	public int getKills() {
		return kills;
	}
	
	/**
	 * Returns this player's name.
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * Indicates that this player has killed one more human.
	 * Throws an IllegalStateException if the player is not a zombie.
	 */
	public void recordKill() {
		if (isHuman()) {
			throw new IllegalStateException(name + " is not a zombie");
		}
		this.kills++;
	}
	
	/**
	 * Returns a string representation of this player's name, type, and kills if applicable,
	 * such as "Joe(H)" for a human, or "Suzy(Z:2)" for a zombie.
	 * Includes an ! for "super zombies" with many kills, such as "Ed(Z:5!)".
	 */
	public String toString() {
		String result = name + "(";
		if (human) {
			result += "H";
		} else {
			result += "Z:" + kills;
			if (kills >= SUPER_ZOMBIE_KILLS) {
				result += "!";
			}
		}
		result += ")";
		return result;
	}
	
	// --------- YOUR NEW METHODS GO BELOW ---------- //
	/**
	 * Returns true if the object passed in is identical to this HvZPlayer respects to all the fields.  
	 */
	public boolean equals(Object o) {
		if(o instanceof HvZPlayer){
			HvZPlayer temp = (HvZPlayer) o;
			return (this.name.equals(temp.name)&& Boolean.valueOf(temp.human).equals(this.human)
					&& this.kills == temp.kills);
		}else{
			return false;
		}
	}
	
	/**
	*Hash function for distinguishing HvZPlayer objects.
	*/
	public int hashCode() {
		
		return Boolean.valueOf(human).hashCode()
				+String.valueOf(name).hashCode()
				//+153*Integer.valueOf(kills).hashCode();
				+kills;	
	}
}