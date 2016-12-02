import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Random;
import java.util.TreeMap;



public class Qagent {
	double[][][] qvalues;
	boolean[][] walls;
	double[][] rewards;
	double lr = 0.01;
	double discount = 0.9;
	double e = 0.3;
	int xPos;
	int yPos;
	Random r;
	double temp;
	int currentAction = 0; // 0 -> up, 1 -> down 
						   // 2 -> left, 3 -> right 
	
	public Qagent(){
		r = new Random();
		xPos = 0;
		yPos = 0;
		temp = 10.0;
		qvalues = new double[10][10][4];
		walls = new boolean[10][10];
		rewards = new double[10][10];
		for(int i = 0; i< 10; i++){
			for(int j = 0; j< 10; j++){
				if((j==3 && i!=0 && i!=5 && i!=9) ||
						(i == 4 && j > 1 && j < 8))
					walls[i][j] = true;
				else
					walls[i][j] = false;
			}
		}
		
		rewards[3][3] = -1.0;
		rewards[3][7] = -1.0;
		rewards[5][4] = -1.0;
		rewards[5][5] = 1.0;
		rewards[5][7] = -1.0;
		rewards[6][4] = -1.0;
		rewards[6][5] = -1.0;
		rewards[6][7] = -1.0;
		rewards[8][5] = -1.0;
		rewards[8][6] = -1.0;
		
	}
	
	public boolean act(){
		double choice = Math.random();
		int action;
		if(choice < e){ // do exploit 
			action = maxAction(xPos, yPos);
			
		}else{ // do explore randomly 
			action = r.nextInt(4);
			
		}
		currentAction = action;
		return updateQvalue();
	}
	
	public void boltzmannAct(){
		double sum = qvalues[xPos][yPos][0] + qvalues[xPos][yPos][1] 
				+ qvalues[xPos][yPos][2] + qvalues[xPos][yPos][3];
		if(sum == 0){
			currentAction = r.nextInt(4);
		}else{
			TreeMap<Double, ArrayList<Integer>> map = new TreeMap(); 
			double expSum = (Math.exp(qvalues[xPos][yPos][0]/temp)+Math.exp(qvalues[xPos][yPos][1]/temp)
			+ Math.exp(qvalues[xPos][yPos][2]/temp)+Math.exp(qvalues[xPos][yPos][3]/temp));
			
			double p0;
			//System.out.println(Math.exp((qvalues[xPos][yPos][0]/temp)/expSum));
			if(Math.exp((qvalues[xPos][yPos][0]/temp)/expSum) < 1E-3){
				p0 = 0.0;
			}else{
				//System.out.println(p0);
				p0 = round(Math.exp(qvalues[xPos][yPos][0]/temp)/expSum, 1);
			}
			map.put(p0, new ArrayList<Integer>());
			ArrayList<Integer> tmp = map.get(p0);
			tmp.add(0);
			map.put(p0, tmp);
			
			double p1;
			if(Math.exp(qvalues[xPos][yPos][1]/temp)/expSum < 0.001){
				p1 = 0;
			}else{
				//System.out.println(Math.exp(qvalues[xPos][yPos][1]/temp)/
					//expSum);
				p1 = round(Math.exp(qvalues[xPos][yPos][1]/temp)/
					expSum, 1);
			}
			/*
			try{
				p1 = round(Math.exp(qvalues[xPos][yPos][1]/temp)/
						expSum, 1);
			}catch(Exception e){
				System.out.println(Math.exp(qvalues[xPos][yPos][1]/temp)/expSum);
			}
			*/
			if(map.containsKey(p1)){
				ArrayList<Integer> tmp1 = map.get(p1);
				tmp1.add(1);
				map.put(p1, tmp1);
			}else{
				ArrayList<Integer> tmp1 = new ArrayList();
				tmp1.add(1);
				map.put(p1, tmp1);
			}
			
			double p2;
			if(Math.exp(qvalues[xPos][yPos][2]/temp)/expSum < 1E-10){
				p2 = 0;
			}else{
				p2 = round(Math.exp(qvalues[xPos][yPos][2]/temp)/
					expSum, 1);
			}
			if(map.containsKey(p2)){
				ArrayList<Integer> tmp1 = map.get(p2);
				tmp1.add(2);
				map.put(p2, tmp1);
			}else{
				ArrayList<Integer> tmp1 = new ArrayList();;
				tmp1.add(2);
				map.put(p2, tmp1);
			}
			//System.out.println(temp);
			double p3;
			if(Math.exp(qvalues[xPos][yPos][3]/temp)/expSum < 1E-3){
				p3 = 0;
			}else{
				p3 = round(Math.exp(qvalues[xPos][yPos][3]/temp)/
					expSum, 1);
			}
			if(map.containsKey(p3)){
				ArrayList<Integer> tmp1 = map.get(p3);
				tmp1.add(3);
				map.put(p3, tmp1);
			}else{
				ArrayList<Integer> tmp1 = new ArrayList();;
				tmp1.add(3);
				map.put(p3, tmp1);
			}
			
			//double chance = Math.random();
			double maxKey = -1;
			for(double d : map.keySet()){
				if(d > maxKey)
					maxKey = d;
			}
			ArrayList<Integer> actions = map.get(maxKey);
			if(actions.size() == 1)
				currentAction = actions.get(0);
			else{
				int index = r.nextInt(actions.size());
				currentAction = actions.get(index);
			}
		}
		if(temp - 0.001 > 1)
			temp-=0.001;
		updateQvalue();
	}
	
	public boolean updateQvalue(){

		int nextX = xPos, nextY = yPos;
		if(currentAction == 0){
			nextY--;
		}else if(currentAction == 1){
			nextY++;
		}else if(currentAction == 2){
			nextX--;
		}else{
			nextX++;
		}
		
		
		if(nextX < 0 || nextX > 9 || nextY < 0 || nextY > 9 
				|| walls[nextX][nextY]){                                 //hit a wall, agent doesn't move

			qvalues[xPos][yPos][currentAction] = -2;//Double.NEGATIVE_INFINITY;
			
		}else{
			int nextMax = maxAction(nextX, nextY);
			qvalues[xPos][yPos][currentAction] += lr*(rewards[xPos][yPos] + 
					discount*qvalues[nextX][nextY][nextMax] - qvalues[xPos][yPos][currentAction]);
			
			//move agent to nextState
			if(rewards[xPos][yPos] > 0){
				xPos = 0;
				yPos = 0;
				//System.out.println("get here");
				return true;
			}else{
				xPos = nextX;
				yPos = nextY;
			}
		}
		
		return false;
	}
	
	private int maxAction(int x, int y){
		int action = 0;
		double q = qvalues[x][y][0];
		for(int i = 1; i < 4; i++){
			if(q < qvalues[x][y][i]){
				action = i;
				q = qvalues[x][y][i];
			}
		}
		return action;
	}
	
	public double round(double value, int places) {
        if (places < 0) throw new IllegalArgumentException();
    
        BigDecimal bd = new BigDecimal(value);
        bd = bd.setScale(places, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }
}
