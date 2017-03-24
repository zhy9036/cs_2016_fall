/**
 * CSE 373 HW2 STARCHART
 * ZHANG, YANG  1030416
 */

import java.awt.Color;
import java.awt.Graphics;
import java.util.*;
import com.google.common.collect.*;

/**
 * Star object represents an individual star that can be put into a star chart.
 */

public class StarChart {
	int width;
	int height;
	int nullCount;
	BiMap<Star, String> starCollection;
	Table<Double, Double, Star> starXandY;
	Set<Star> deadList;
	Map<String, String[]> constellation; 
	
	/**
	 * Construct a StarChart object.
	 */
	public StarChart(int width, int height) {
		this.width = width;
		this.height = height;
		nullCount= 0;
		starCollection = HashBiMap.create();
		starXandY = TreeBasedTable.create();
		deadList = new HashSet<Star>();
		constellation = new HashMap<String, String[]>();
		
	}
	
	/**
	 * add Star objects to field collections.
	 */
	public void addStar(Star star, String name) {
		if(name != null){
			starCollection.put(star, name);
		}else{
			nullCount++;
			starCollection.put(star, nullCount+"");
		}
		starXandY.put(star.getX(), star.getY(), star);
		
	}
	
	/**
	 * add constellation to field collections.
	 */
	public void addConstellation(String[] starNames, String constellationName) {
		constellation.put(constellationName, starNames);
	}
	
	/**
	 * Returns star's name.
	 */
	public String getName(Star star) {
		if(starCollection.containsKey(star)&& starCollection.get(star).startsWith("Don't have a name yet")){
			return starCollection.get(star);
		}else{
			return null;
		}
	}
	
	/**
	 * Returns Star object based on the x, y valuse passed in.
	 */
	public Star getStar(double x, double y) {
		if(starXandY.contains(x, y)){
			return starXandY.get(x, y);
		}else{
			return null;
		}
	}
	
	/**
	 * Returns Star object based on the name passed in.
	 */
	public Star getStar(String name) {
		if(starCollection.inverse().containsKey(name)){
			return starCollection.inverse().get(name);
		}else{
			return null;
		}
	}
	
	
	/**
	 * Draw stars and constellation on StarChart panel. 
	 */
	public void draw(Graphics g, boolean showStarNames) {
		for(Star toDraw : starCollection.keySet()){
			int x = toDraw.pixelX(width);
			int y = toDraw.pixelY(height);
			if(deadList.contains(toDraw)){
				g.setColor(Color.RED);
			}else{
				g.setColor(toDraw.pixelColor());
			}
			g.fillRect(x, y, toDraw.pixelSize(), toDraw.pixelSize());
		}
		for(String temp: constellation.keySet()){
			String[] lines = constellation.get(temp);
			for(int i = 0; i< lines.length; i+=2){
				Star star1 = starCollection.inverse().get(lines[i]);
				Star star2 = starCollection.inverse().get(lines[i+1]);
				g.setColor(Color.YELLOW);
				g.drawLine(star1.pixelX(width), star1.pixelY(height), star2.pixelX(width), star2.pixelY(height));	
				if(showStarNames){
					g.setColor(star1.pixelColor());
					g.drawString(starCollection.get(star1), star1.pixelX(width), star1.pixelY(height));
					g.setColor(star1.pixelColor());
					g.drawString(starCollection.get(star2), star2.pixelX(width), star2.pixelY(height));
				}
				
				if(i==lines.length-2){
					g.setColor(Color.YELLOW);
					g.drawString(temp, star2.pixelX(width), star2.pixelY(height));
				}
				
			}
		}
	}
	
	/**
	 * Returns the number of stars that destroyed by one supernova operation. 
	 */
	public int supernova(Star star) {
		int deadCounter = 0;
		if(!deadList.contains(star)){
			for(Star toCheck : starCollection.keySet()){
				if(star.distance(toCheck)<= 0.25){
					deadCounter++;
					deadList.add(toCheck);
				}
			}
		}
		return deadCounter;
	}	
}
