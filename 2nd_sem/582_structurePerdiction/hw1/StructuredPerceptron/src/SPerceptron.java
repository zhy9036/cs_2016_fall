import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class SPerceptron {
	
	ArrayList<ArrayList<ArrayList<Integer>>> data;
	ArrayList<ArrayList<Double>> weight;
	Map<String, ArrayList<Double>> pairwiseWeight;
	Map<String, ArrayList<Double>> tupleWeight;
	Map<String, ArrayList<Double>> quadWeight;
	ArrayList<ArrayList<ArrayList<Double>>> weightList;
	ArrayList<ArrayList<Integer>> sLabels;
	int restarts, maxIter, featureLength, classNum; 
	double learningRate;
	
	public SPerceptron(int featureLength, int classNum,
					   int restarts,int maxIter, double learningRate){

		this.weight = new ArrayList();
		this.pairwiseWeight = new HashMap();
		this.tupleWeight = new HashMap();
		this.quadWeight = new HashMap();
		this.weightList = new ArrayList();
		this.featureLength = featureLength;
		this.classNum = classNum;
		this.restarts = restarts;
		this.maxIter = maxIter;
		this.learningRate = learningRate;
		
		//initialize weight
		for(int i = 0; i < classNum; i++){
			ArrayList<Double> dum = new ArrayList();
			for(int j = 0; j < featureLength; j++){
				dum.add(0.0);
			}
			weight.add(dum);
		}
		
		generateMap(pairwiseWeight, 2);
		for(String key : pairwiseWeight.keySet())
			System.out.println(key);
		
		System.exit(0);
	}
	
	
	public ArrayList<ArrayList<Double>> training(ArrayList<ArrayList<ArrayList<Integer>>> data,
												 ArrayList<ArrayList<Integer>> sLabels){
		System.out.println("Training ...");
		for(int i = 0; i < maxIter; i++){
			//System.out.println("Run: " + i);
			for(int j = 0; j < data.size(); j++){
				//System.out.print("\r");
				//System.out.println("	training: " + j);
				ArrayList<ArrayList<Integer>> sample = data.get(j);
				ArrayList<Integer> yTrue = sLabels.get(j);
				ArrayList<Integer> yHat = rgsInference(sample, weight, restarts);

				for(int k = 0; k < yHat.size(); k++){
					if(yTrue.get(k) != yHat.get(k)){
						weight = updateWeight(sample.get(k), weight, yTrue.get(k), yHat.get(k), learningRate);
					}
				}
			}
			this.weightList.add(copyWeight(weight));
		}
		System.out.println("Training finished!");
		return weight;
	}
	
	private ArrayList<ArrayList<Double>> copyWeight(ArrayList<ArrayList<Double>> w){
		ArrayList<ArrayList<Double>> copy = new ArrayList();
		for(int i = 0; i < classNum; i++){
			ArrayList<Double> dum = new ArrayList();
			ArrayList<Double> wFeature = w.get(i);
			for(int j = 0; j < featureLength; j++){
				dum.add(wFeature.get(j));
			}
			copy.add(dum);
		}
		return copy;
	}
	
	
	public void test(ArrayList<ArrayList<ArrayList<Integer>>> data,
			 ArrayList<ArrayList<Integer>> sLabels, ArrayList<ArrayList<Double>> w){
		int total = 0;
		int error = 0;

		for(int j = 0; j < data.size(); j++){
			ArrayList<ArrayList<Integer>> sample = data.get(j);
			ArrayList<Integer> yTrue = sLabels.get(j);
			ArrayList<Integer> yHat = rgsInference(sample, w, restarts);
			for(int k = 0; k < yHat.size(); k++){
				total++;
				if(yTrue.get(k) != yHat.get(k)){
					error++;
				}
			}
		}
		
		System.out.println((total-error)*1.0/total);
	}
	private ArrayList<ArrayList<Double>> updateWeight(ArrayList<Integer> sample, 
			ArrayList<ArrayList<Double>> w, int yTrue, int yHat, double learningRate){
		ArrayList<Double> yiTrue = w.get(yTrue);
		ArrayList<Double> yiHat = w.get(yHat);
		for(int i = 0; i < sample.size(); i++){
			double yt = yiTrue.get(i);
			double yh = yiHat.get(i);
			yiTrue.set(i,yt + learningRate * sample.get(i));
			yiHat.set(i,yh - learningRate * sample.get(i));
		}
		w.set(yTrue, yiTrue);
		w.set(yHat, yiHat);
		
		return w;
	}

	
	private ArrayList<Integer> rgsInference(ArrayList<ArrayList<Integer>> sinput, 
										    ArrayList<ArrayList<Double>> weight, 
										    int restarts){
		
		//initialize the best scoring structured output y_hat randomly
		//and initialize the best score
		ArrayList<Integer> yBest = new ArrayList<Integer>();
		double bestScore = 0;
		Random r = new Random();
		for(int i = 0; i < sinput.size(); i++){
			yBest.add(r.nextInt(classNum));
			int yi = yBest.get(i);
			bestScore += dotProduct(sinput.get(i), weight.get(yi));
		}
		ArrayList<Integer> yStart = new ArrayList<Integer>();
		for (int i = 0; i < restarts; i++) {			
			//randomly generate structured output y_start as starting point
			for(int j = 0; j < sinput.size(); j++){
				if(yStart.size() < sinput.size())
					yStart.add(r.nextInt(classNum));
				else
					yStart.set(j, r.nextInt(classNum));
			}
			
			boolean localOptima = false;
			double localBest = -99.0;
			double preLocalBest = 0;
			while (!localOptima) {
				//generating all successors that differ by 1 bit
				ArrayList<ArrayList<Integer>> sucessors = generateSuccessors(yStart);
				preLocalBest = localBest;
				localBest = -99.0;
				double score = 0;
				
				//loop over all successors and compute their score, mark the best one
				for(ArrayList<Integer> candidate : sucessors){
					score = 0;
					for(int j = 0; j < sinput.size(); j++){
						int yi = candidate.get(j);
						score += dotProduct(sinput.get(j), weight.get(yi));
					}
					//System.out.println(score + "  " + bestScore);
					if(score > localBest){
						localBest = score;
						Collections.copy(yStart, candidate);
					}
					if(score > bestScore){
						bestScore = score;
						Collections.copy(yBest, candidate);
					}				
				}
				if(localBest <= preLocalBest){ 
					localOptima = true; 
				}
			}
		}
		return yBest;
	}
	
	private ArrayList<ArrayList<Integer>> generateSuccessors(ArrayList<Integer> yStart){
		ArrayList<ArrayList<Integer>> rst = new ArrayList<ArrayList<Integer>>();
		for(int i = 0; i < yStart.size(); i++){
			int old = yStart.get(i);
			for(int j = 0; j < classNum; j++){
				if(j != old){
					yStart.set(i, j);
					ArrayList<Integer> copy = new ArrayList<Integer>();
					for(int y : yStart){
						copy.add(y);
					}
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
	
	private Map<String, ArrayList<Double>> generateMap(Map<String, ArrayList<Double>> map, int bitSize){
		
		mapHelper(map, bitSize, "");
		return map;
	}
	
	private void mapHelper(Map<String, ArrayList<Double>> map, int bitSize, String cur){
		if(cur.length() == bitSize){
			ArrayList<Double> dum = new ArrayList();
			for(int j = 0; j < featureLength; j++){
				dum.add(0.0);
			}
			//System.out.println(cur + " " + cur.length());
			map.put(cur, dum);
		}else if(cur.length() > bitSize){
			return;
		}else{
			
			for(int i = 0; i < classNum; i++){
				if(cur.length() < 2){
					String cache = cur;
					cur = cur + (char)(i+'a');
					//System.out.println(cur);
					mapHelper(map, bitSize, cur);
					cur = cache;
				}
			}
		
		}
	}
	
	
}
