import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

public class SPerceptron {
	
	ArrayList<ArrayList<ArrayList<Integer>>> data;
	ArrayList<ArrayList<Double>> weight;
	ArrayList<ArrayList<Integer>> sLabels;
	int restarts, maxIter; 
	double learningRate;
	
	public SPerceptron(ArrayList<ArrayList<Double>> weight, 
					   int restarts,int maxIter, double learningRate){

		this.weight = weight;
		this.restarts = restarts;
		this.maxIter = maxIter;
		this.learningRate = learningRate;
		
		//initialize weight
		for(int i = 0; i < 26; i++){
			ArrayList<Double> dum = new ArrayList();
			for(int j = 0; j < 128; j++){
				dum.add(0.0);
			}
			weight.add(dum);
		}
	}
	
	
	public ArrayList<ArrayList<Double>> training(ArrayList<ArrayList<ArrayList<Integer>>> data,
												 ArrayList<ArrayList<Integer>> sLabels){
		
		for(int i = 0; i < maxIter; i++){
			System.out.println("Run: " + i);
			for(int j = 0; j < data.size(); j++){
				//System.out.print("\r");
				System.out.println("	training: " + j);
				ArrayList<ArrayList<Integer>> sample = data.get(j);
				ArrayList<Integer> yTrue = sLabels.get(j);
				ArrayList<Integer> yHat = rgsInference(sample, weight, restarts);
				//System.out.println(yHat.size());
				for(int k = 0; k < yHat.size(); k++){
					if(yTrue.get(k) != yHat.get(k)){
						updateWeight(sample.get(k),weight, yTrue.get(k), yHat.get(k), learningRate);
					}
				}
			}
		}
		
		return weight;
	}
	
	public void test(ArrayList<ArrayList<ArrayList<Integer>>> data,
			 ArrayList<ArrayList<Integer>> sLabels){
		int total = 0;
		int error = 0;

		for(int j = 0; j < data.size(); j++){
			ArrayList<ArrayList<Integer>> sample = data.get(j);
			ArrayList<Integer> yTrue = sLabels.get(j);
			ArrayList<Integer> yHat = rgsInference(sample, weight, restarts);
			for(int k = 0; k < yHat.size(); k++){
				total++;
				if(yTrue.get(k) != yHat.get(k)){
					error++;
				}
			}
		}
		
		System.out.println((total-error/total));
	}
	private void updateWeight(ArrayList<Integer> sample, 
			ArrayList<ArrayList<Double>> w, int yTrue, int yHat, double learningRate){
		ArrayList<Double> yiTrue = w.get(yTrue);
		ArrayList<Double> yiHat = w.get(yHat);
		for(int i = 0; i < sample.size(); i++){
			yiTrue.set(i,yiTrue.get(i) + learningRate * sample.get(i));
			yiHat.set(i,yiTrue.get(i) - learningRate * sample.get(i));
		}
		w.set(yTrue, yiTrue);
		w.set(yHat, yiHat);
	}

	
	private ArrayList<Integer> rgsInference(ArrayList<ArrayList<Integer>> sinput, 
										    ArrayList<ArrayList<Double>> weight, 
										    int restarts){
		
		//initialize the best scoring structured output y_hat randomly
		//and initialize the best score
		ArrayList<Integer> yHat = new ArrayList<Integer>();
		double bestScore = 0;
		double preBestScore = 0;
		Random r = new Random();
		for(int i = 0; i < sinput.size(); i++){
			yHat.add(r.nextInt(26));
			int yi = yHat.get(i);
			preBestScore += dotProduct(sinput.get(i), weight.get(yi));
		}
		ArrayList<Integer> yBest = yHat;
		ArrayList<Integer> yStart = new ArrayList<Integer>();
		for (int i = 0; i < restarts; i++) {
			if(preBestScore < bestScore){
				yBest = yStart;
				preBestScore = bestScore;
			}
			bestScore = 0;
			//randomly generate structured output y_start as starting point
			for(int j = 0; j < sinput.size(); j++){
				if(yStart.size() < 26)
					yStart.add(r.nextInt(26));
				else
					yStart.set(j, r.nextInt(26));
			}
			
			boolean localOptima = false;
			while (!localOptima) {
				//generating all successors that differ by 1 bit
				ArrayList<ArrayList<Integer>> sucessors = generateSuccessors(yStart);
				double score = 0;
				
				//loop over all successors and compute their score, mark the best one
				for(ArrayList<Integer> candidate : sucessors){
					for(int j = 0; j < sinput.size(); j++){
						int yi = candidate.get(j);
						score += dotProduct(sinput.get(j), weight.get(yi));
					}
					
					//System.out.println(bestScore + " : " + score);
					if(bestScore == score){ 
						localOptima = true; 
						//System.out.println(score);
						continue;
					}
					if(score >= bestScore){
						bestScore = score;
						yStart = candidate;
					}
				}
			}
		}
		System.out.println(yBest.size());
		return yBest;
	}
	
	private ArrayList<ArrayList<Integer>> generateSuccessors(ArrayList<Integer> yStart){
		ArrayList<ArrayList<Integer>> rst = new ArrayList<ArrayList<Integer>>();
		for(int i = 0; i < yStart.size(); i++){
			int old = yStart.get(i);
			for(int j = 0; j < 26; j++){
				if(j != old){
					yStart.set(i, j);
					ArrayList<Integer> copy = new ArrayList<Integer>();
					for(int y : yStart)
						copy.add(y);
					rst.add(copy); 
					yStart.set(i, old);
				}
			}
		}
		return rst;
	}

	
	private double dotProduct(ArrayList<Integer> xi, ArrayList<Double> wi){
		double rst = 0;
		for(int i = 0; i < xi.size(); i++){
			rst += xi.get(i) * wi.get(i);
		}
		return rst;
	}
}
