/**
 * CSE 373 HW2 STAR
 * ZHANG, YANG  1030416
 */

import java.awt.Color;

/**
 * Each Star object represents an individual star that can be put into a star chart.
 * A star is represented by a 3-dimensional (x, y, z) position, where each coordinate
 * is in the range [-1.0 .. 1.0] from bottom/left to top/right.
 * A star also has a magnitude which is inversely related to its brightness and size.
 */
public class Star implements Comparable<Star> {
	private double x;
	private double y;
	private double z;
	private double magnitude;
	private Color color;         // cached to save memory
	
	/**
	 * Constructs a new star with the given position and magnitude.
	 * The x/y/z are in range [-1.0 .. 1.0] from bottom/left to top/right.
	 * The magnitude is a non-negative number representing the star's size. 
	 * Assumes all parameters are in valid ranges.
	 */
	public Star(double x, double y, double z, double magnitude) {
		this.x = x;
		this.y = y;
		this.z = z;
		this.magnitude = magnitude;
		int brightness = (int) ((z + 1.0) / 2 * 128) + 128;
		this.color = new Color(brightness, brightness, brightness);
	}
	
	/**
	 * Returns this star's magnitude as was passed to the constructor.
	 */
	public double getMagnitude() {
		return magnitude;
	}
	
	/**
	 * Returns this star's x-coordinate as was passed to the constructor.
	 */
	public double getX() {
		return x;
	}
	
	/**
	 * Returns this star's y-coordinate as was passed to the constructor.
	 */
	public double getY() {
		return y;
	}
	
	/**
	 * Returns this star's y-coordinate as was passed to the constructor.
	 */
	public double getZ() {
		return z;
	}
	
	/**
	 * Returns an integer code that can be used by hash-based collections
	 * to store Star objects properly.
	 */
	public int hashCode() {
		return Double.valueOf(x + 1).hashCode() +
				103 * Double.valueOf(y + 1).hashCode() +
				317 * Double.valueOf(z + 1).hashCode() +
				1337 * Double.valueOf(magnitude).hashCode();
	}
	
	/**
	 * Returns the x-coordinate on the screen at which this star should be drawn.
	 * This is a translation of coordinates from [-1.0 .. 1.0] to [0 .. width).
	 */
	public int pixelX(int width) {
		return (int) ((x + 1.0) / 2 * width);
	}
	
	/**
	 * Returns the x-coordinate on the screen at which this star should be drawn.
	 * This is a translation of coordinates from [-1.0 .. 1.0] to [0 .. width).
	 * The y-axis is flipped between star coordinates and screen coordinates.
	 */
	public int pixelY(int height) {
		return height - (int) ((y + 1.0) / 2 * height);
	}
	
	/**
	 * Returns the color with which this star should be drawn.
	 */
	public Color pixelColor() {
		return color;
	}
	
	/**
	 * Returns the width/height of the oval that should be drawn to display this star.
	 * Brighter stars have smaller magnitudes.
	 */
	public int pixelSize() {
		return Math.max(2, (int) Math.round(10.0 / (magnitude + 2)));
	}
	
	// --------- YOUR NEW METHODS GO BELOW ---------- //
	
	/**
	 * Returns '0' if the two Star objects have equal fields.
	 */
	public int compareTo(Star other) {
		if(this.z!=other.z){
			return new Double(this.z).compareTo(new Double(other.z));
		}else if(this.y!= other.y){
			return new Double(this.y).compareTo(new Double(other.y));
		}else if(this.x != other.x){
			return new Double(this.x).compareTo(new Double(other.x));
		}else if(this.magnitude != other.magnitude){
			return new Double(this.magnitude).compareTo(new Double(other.magnitude));
		}else{
			return 0;
		}
	}
	
	/**
	 * Returns the 3d distance between two stars.
	 */
	public double distance(Star other) {
		return Math.sqrt(Math.pow(this.x-other.x, 2)+Math.pow(this.y-other.y, 2)+Math.pow(this.z-other.z, 2));
	}
	
	/**
	 * Returns false if the passed object is different from this Star.
	 */
	public boolean equals(Object o) {
		if(o instanceof Star){
			Star temp = (Star) o;
			return (this.x == temp.x && this.y == temp.y && this.z == temp.z && this.magnitude == temp.magnitude);	
		}else{
			return false;
		}
	}
	
	/**
	 * Returns formated string that contains the fields of star. 
	 */
	public String toString() {
		return "("+this.x+","+this.y+","+this.z+")"+":"+this.magnitude;
	}
}
