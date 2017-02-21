import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class SPerceptron {
	
	ArrayList<ArrayList<ArrayList<Integer>>> data;
	ArrayList<ArrayList<Integer>> sLabels;
	
	ArrayList<ArrayList<ArrayList<Integer>>> dataTest;
	ArrayList<ArrayList<Integer>> sLabelsTest;
	
	ArrayList<Double> trainingRst;
	ArrayList<Double> testingRst;
	
	ArrayList<ArrayList<Double>> weight;
	Map<String, ArrayList<Double>> pairwiseWeight;
	Map<String, ArrayList<Double>> tupleWeight;
	Map<String, ArrayList<Double>> quadWeight;
	ArrayList<ArrayList<ArrayList<Double>>> weightList;
	
	int restarts, maxIter, featureLength, classNum; 
	double learningRate;
	
	public SPerceptron(int featureLength, int classNum,
					   int restarts,int maxIter, double learningRate){

		this.weight = new ArrayList();
		this.trainingRst = new ArrayList();
		this.testingRst = new ArrayList();
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
		generateMap(tupleWeight, 3);
		generateMap(quadWeight, 4);
		
		//System.exit(0);
	}
	
	public void feedTestData(ArrayList<ArrayList<ArrayList<Integer>>> dataTest,
			 ArrayList<ArrayList<Integer>> sLabelsTest){
		this.dataTest = dataTest;
		this.sLabelsTest = sLabelsTest;
	}
	
	/*========================================================================
	 * 
	 MAIN FUNCTIONS
	 * 
	 */
	
	
	public ArrayList<ArrayList<Double>> training(ArrayList<ArrayList<ArrayList<Integer>>> data,
												 ArrayList<ArrayList<Integer>> sLabels, int complexity){
		System.out.println("Training ...");
		for(int i = 0; i < maxIter; i++){
			//System.out.println("Run: " + i);
			for(int j = 0; j < data.size(); j++){
				//System.out.print("\r");
				//System.out.println("	training: " + j);
				ArrayList<ArrayList<Integer>> sample = data.get(j);
				ArrayList<Integer> yTrue = sLabels.get(j);
				ArrayList<Integer> yHat = rgsInference(sample, weight, restarts, complexity);

				for(int k = 0; k < yHat.size(); k++){
					if(yTrue.get(k) != yHat.get(k)){
						weight = updateWeight(sample.get(k), weight, yTrue.get(k), yHat.get(k), learningRate);
					}
				}
				updateFeatureWeight(sample, yTrue, yHat, complexity);
			}
			
			double training = test(data, sLabels, weight, complexity);
			double testing = test(dataTest, sLabelsTest, weight, complexity);
			trainingRst.add(training);
			testingRst.add(testing);
			//System.out.println(training);
			//System.out.println(testing);
			
			this.weightList.add(copyWeight(weight));
		}
		System.out.println("Training finished!");
		return weight;
	}
	
	public double test(ArrayList<ArrayList<ArrayList<Integer>>> data,
			 ArrayList<ArrayList<Integer>> sLabels, ArrayList<ArrayList<Double>> w, int complexity){
		int total = 0;
		int error = 0;

		for(int j = 0; j < data.size(); j++){
			ArrayList<ArrayList<Integer>> sample = data.get(j);
			ArrayList<Integer> yTrue = sLabels.get(j);
			ArrayList<Integer> yHat = rgsInference(sample, w, restarts, complexity);
			for(int k = 0; k < yHat.size(); k++){
				total++;
				if(yTrue.get(k) != yHat.get(k)){
					error++;
				}
			}
		}
		
		return (total-error)*1.0/total;
	}
	
	
	
	/*========================================================================
	 * 
	 WEIGHT UTILITIES
	 * 
	 */
	
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
	
	private void updateFeatureWeight(ArrayList<ArrayList<Integer>> sample, ArrayList<Integer> trueLabel, 
			ArrayList<Integer> predictLabel, int complexity){
		if(complexity > 1){
			if(sample.size() >= 2){
				ArrayList<String> trueL = chopLabels(trueLabel, 2);
				ArrayList<String> hatL = chopLabels(predictLabel, 2);
				ArrayList<ArrayList<ArrayList<Integer>>> choppedData = chopData(sample, 2);
				for(int i = 0; i < trueL.size(); i++){
					String tl = trueL.get(i);
					String hl = hatL.get(i);
					if(!tl.equals(hl)){
						ArrayList<Double> trueW = pairwiseWeight.get(tl);
						ArrayList<Double> hatW = pairwiseWeight.get(hl);
						ArrayList<ArrayList<Integer>> feature = choppedData.get(i);
						for(ArrayList<Integer> f : feature){
							for(int j = 0; j < featureLength; j++){
								double yt = trueW.get(j);
								double yh = hatW.get(j);
								trueW.set(j, yt + learningRate * f.get(j));
								hatW.set(j, yh - learningRate * f.get(j));
							}
						}
						pairwiseWeight.put(tl, trueW);
						pairwiseWeight.put(hl, hatW);
					}
				}
			}
		}
		if(complexity > 2){
			if(sample.size() >= 3){
				ArrayList<String> trueL = chopLabels(trueLabel, 3);
				ArrayList<String> hatL = chopLabels(predictLabel, 3);
				ArrayList<ArrayList<ArrayList<Integer>>> choppedData = chopData(sample, 3);
				//System.out.println(trueL.size() + " " +hatL.size() + " " + choppedData.size());
				for(int i = 0; i < trueL.size(); i++){
					String tl = trueL.get(i);
					String hl = hatL.get(i);
					if(!tl.equals(hl)){
						ArrayList<Double> trueW = tupleWeight.get(tl);
						ArrayList<Double> hatW = tupleWeight.get(hl);
						ArrayList<ArrayList<Integer>> feature = choppedData.get(i);
						for(ArrayList<Integer> f : feature){
							for(int j = 0; j < featureLength; j++){
								double yt = trueW.get(j);
								double yh = hatW.get(j);
								trueW.set(j, yt + learningRate * f.get(j));
								hatW.set(j, yh - learningRate * f.get(j));
							}
						}
						tupleWeight.put(tl, trueW);
						tupleWeight.put(hl, hatW);
					}
				}
			}	
		}
		if(complexity > 3){
			if(sample.size() >= 4){
				ArrayList<String> trueL = chopLabels(trueLabel, 4);
				ArrayList<String> hatL = chopLabels(predictLabel, 4);
				ArrayList<ArrayList<ArrayList<Integer>>> choppedData = chopData(sample, 4);
				for(int i = 0; i < trueL.size(); i++){
					String tl = trueL.get(i);
					String hl = hatL.get(i);
					if(!tl.equals(hl)){
						ArrayList<Double> trueW = quadWeight.get(tl);
						ArrayList<Double> hatW = quadWeight.get(hl);
						ArrayList<ArrayList<Integer>> feature = choppedData.get(i);
						for(ArrayList<Integer> f : feature){
							for(int j = 0; j < featureLength; j++){
								double yt = trueW.get(j);
								double yh = hatW.get(j);
								trueW.set(j, yt + learningRate * f.get(j));
								hatW.set(j, yh - learningRate * f.get(j));
							}
						}
						quadWeight.put(tl, trueW);
						quadWeight.put(hl, hatW);
					}
				}
			}
		}
	}
	
	private double calculateFeatureScore(ArrayList<ArrayList<Integer>> sample, 
			ArrayList<Integer> label, int complexity){
		double rst = 0.0;
		if(complexity > 1){
			if(sample.size() >= 2){
				ArrayList<String> trueL = chopLabels(label, 2);
				ArrayList<ArrayList<ArrayList<Integer>>> choppedData = chopData(sample, 2);
				for(int i = 0; i < trueL.size(); i++){
					String tl = trueL.get(i);
					ArrayList<Double> trueW = pairwiseWeight.get(tl);
					if(trueW == null)
						System.out.println("fk " + tl);
					ArrayList<ArrayList<Integer>> feature = choppedData.get(i);
					for(ArrayList<Integer> f : feature){
						rst += dotProduct(f, trueW);
					}
				}			
			}
		}
		if(complexity > 2){
			if(sample.size() >= 3){
				ArrayList<String> trueL = chopLabels(label, 3);
				ArrayList<ArrayList<ArrayList<Integer>>> choppedData = chopData(sample, 3);
				for(int i = 0; i < trueL.size(); i++){
					String tl = trueL.get(i);
					ArrayList<Double> trueW = tupleWeight.get(tl);
					ArrayList<ArrayList<Integer>> feature = choppedData.get(i);
					for(ArrayList<Integer> f : feature){
						rst += dotProduct(f, trueW);
					}
				}			
			}	
		}
		if(complexity > 3){
			if(sample.size() >= 4){
				ArrayList<String> trueL = chopLabels(label, 4);
				ArrayList<ArrayList<ArrayList<Integer>>> choppedData = chopData(sample, 4);
				for(int i = 0; i < trueL.size(); i++){
					String tl = trueL.get(i);
					ArrayList<Double> trueW = quadWeight.get(tl);
					ArrayList<ArrayList<Integer>> feature = choppedData.get(i);
					for(ArrayList<Integer> f : feature){
						rst += dotProduct(f, trueW);
					}
				}
			}
		}
		
		return rst;
	}
	
	
	private ArrayList<String> chopLabels(ArrayList<Integer> label, int size){
		ArrayList<String> rst = new ArrayList();
		for(int i = 0; i < label.size() - size + 1; i++){
			String tmp = "" + (char) (label.get(i) + 'a');
			for(int j = 1; j < size; j++){
				tmp +=  (char) (label.get(i+j) + 'a');
			}
			rst.add(tmp);
		}		
		return rst;
	}
	
	private ArrayList<ArrayList<ArrayList<Integer>>> chopData(ArrayList<ArrayList<Integer>> sample, int size){
		ArrayList<ArrayList<ArrayList<Integer>>> rst = new ArrayList();
		for(int i = 0; i < sample.size() - size + 1; i++){
			ArrayList<ArrayList<Integer>> tmp = new ArrayList();
			tmp.add(sample.get(i));
			for(int j = 1; j < size; j++){
				tmp.add(sample.get(i+j));
			}
			rst.add(tmp);
		}		
		return rst;
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

	
	private ArrayList<Integer> rgsInference(ArrayList<ArrayList<Integer>> sinput, 
										    ArrayList<ArrayList<Double>> weight, 
										    int restarts, int complexity){
		
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
		bestScore += calculateFeatureScore(sinput, yBest, complexity);
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
					score += calculateFeatureScore(sinput, candidate, complexity);
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
			if(xi == null)
				System.out.println("xi");
			if(wi == null)
				System.out.println("wi");
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
			ArrayList<Double> dum = new ArrayList<Double>(Collections.nCopies(featureLength, 0.0));
			map.put(cur, dum);
		}else if(cur.length() > bitSize){
			return;
		}else{			
			for(int i = 0; i < classNum; i++){
				if(cur.length() < bitSize){
					cur = cur + (char)(i + 'a');
					mapHelper(map, bitSize, cur);
					cur = cur.substring(0, cur.length()-1);
				}
			}		
		}
	}
}
