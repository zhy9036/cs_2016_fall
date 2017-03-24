// CSE 373 Homework 8: Six Degrees of Kevin Bacon
// Zhang, Yang 1030416


import java.util.List;


// A BaconNumberFinder object can prints the partnership between a actor and Kevin Bacon
public class BaconNumberFinder {
	private Graph<String, String> alls;
	private List<String> path;
	public BaconNumberFinder(Graph<String, String> actors) {
		alls = new SearchableGraph<String, String>();
		alls = actors;	
	}
	
	//Prints the result with media actors and movies
	public void findBaconNumber(String actor) {
		if(alls.containsVertex(actor)){
			System.out.println("Path from "+actor+" to Kevin Bacon:");
			if(alls.isReachable("Kevin Bacon", actor)){
				path = alls.shortestPath("Kevin Bacon", actor);
				for(int i = path.size()-1; i>0; i--){
					System.out.println(path.get(i)+" was in "+"\""+alls.edge(path.get(i), path.get(i-1))
							+"\" "+"with "+path.get(i-1));
				}
				System.out.println(actor+"'s Bacon number is "+(path.size()-1));
			}else{
				System.out.println("No path found.");
			}
		}else{
			System.out.println("No such actor.");
		}
	}
}
