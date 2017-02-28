import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;

public class StructuredPerceptronBeam {
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
	
	public enum UpdateMode {
		EarlyUnpdate, Standard, MaxViolationUpdate
	}
	
	
	public StructuredPerceptronBeam(int featureLength, int classNum,
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
												 ArrayList<String> sLabels, int beamWidth, int complexity, UpdateMode mode){
		System.out.println("Training ...");
		for(int i = 0; i < maxIter; i++){
			//System.out.println("Run: " + i);
			for(int j = 0; j < data.size(); j++){
				//System.out.print("\r");
				//System.out.println("	training: " + j);
				ArrayList<ArrayList<Integer>> sample = data.get(j);
				String yTrue = sLabels.get(j);
				//ArrayList<Integer> yHat = rgsInference(sample, weight, restarts, complexity);
				String yHat =  BestFirstBeamInference(sample, yTrue, beamWidth, complexity, mode);

				if(mode == UpdateMode.Standard)
					updateFeatureWeight(sample, yTrue, yHat, complexity);
			}
			
			//double training = test(data, sLabels, weight, complexity);
			//double testing = test(dataTest, sLabelsTest, weight, complexity);
			//trainingRst.add(training);
			//testingRst.add(testing);
			//System.out.println(training);
			//System.out.println(testing);
			
			this.weightList.add(copyWeight(weight));
		}
		System.out.println("Training finished!");
		return weight;
	}
	
	public double test(ArrayList<ArrayList<ArrayList<Integer>>> data,
			 ArrayList<String> sLabels, ArrayList<ArrayList<Double>> w, 
			 int complexity, int beamWidth, UpdateMode mode){
		int total = 0;
		int error = 0;

		for(int j = 0; j < data.size(); j++){
			ArrayList<ArrayList<Integer>> sample = data.get(j);
			String yTrue = sLabels.get(j);
			String yHat = BestFirstBeamInference(sample, yTrue, beamWidth, complexity, mode);
			for(int k = 0; k < yHat.length(); k++){
				total++;
				if(yTrue.charAt(k) != yHat.charAt(k)){
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
		
		
		if(classNum == 26){
			yTrue -= 'a';
			yHat -= 'a';
		}
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
	
	private void updateFeatureWeight(ArrayList<ArrayList<Integer>> sample, String trueLabel, 
			String predictLabel, int complexity){
		
		for(int k = 0; k < trueLabel.length(); k++){
			if(trueLabel.charAt(k) != predictLabel.charAt(k)){
				weight = updateWeight(sample.get(k), weight, trueLabel.charAt(k), predictLabel.charAt(k), learningRate);
			}
		}
		
		
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
			String label, int complexity){
		double rst = 0.0;
		if(complexity > 1){
			if(label.length() >= 2){
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
			if(label.length() >= 3){
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
			if(label.length() >= 4){
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
	
	
	private ArrayList<String> chopLabels(String label, int size){
		ArrayList<String> rst = new ArrayList();
		for(int i = 0; i < label.length() - size + 1; i++){
			String tmp = "" + label.charAt(i);
			for(int j = 1; j < size; j++){
				tmp +=  label.charAt(i+j);
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

	
	private String BestFirstBeamInference
		(ArrayList<ArrayList<Integer>> sinput, String label, int beamWidth, int complexity, UpdateMode mode){
		
		String yBest = "";
		ArrayList<String> beam = new ArrayList();
		
		Map<String, Double> candidateMap = new HashMap();
		int curSize = 0;
		while(yBest.length() != sinput.size()){
			curSize++;
			String subLabel = label.substring(0, curSize);
			if(beam.size() == 0){
				for(int i = 0; i < this.classNum; i++){
					String tmp = "";
					tmp += (classNum == 26) ? (char)(i+'a') : i;
					double score = calulateCandidateBeamScore(tmp, sinput, complexity);
					candidateMap.put(tmp, score);
				}
			}else{					
				for(int j = 0; j < this.classNum; j++){
					String tmp = yBest;
					tmp += (classNum == 26) ? (char)(j+'a') : j;
					double score = calulateCandidateBeamScore(tmp, sinput, complexity);
					candidateMap.put(tmp, score);
					
				}
			}
			
			List<Entry<String, Double>> sortedEntryList = entriesSortedByValues(candidateMap);
			beam.clear();
			candidateMap.clear();
			boolean earlyUpdateChecker = true;
			for(int i = 0; i < beamWidth; i++){
				beam.add(sortedEntryList.get(i).getKey());
				if(sortedEntryList.get(i).getKey().equals(subLabel))
						earlyUpdateChecker = false;
				candidateMap.put(sortedEntryList.get(i).getKey(), sortedEntryList.get(i).getValue());
			}
			if(mode == UpdateMode.EarlyUnpdate && earlyUpdateChecker){
				for(String wrongLabel : beam){
					updateFeatureWeight(sinput, subLabel, wrongLabel, complexity);
					return null;
				}
			}
			yBest = beam.get(0);
		}
		
		return yBest;
	}
	
	private String BreadthFirstBeamInference
		(ArrayList<ArrayList<Integer>> sinput, String label, int beamWidth, int complexity, UpdateMode mode){
		String yBest = "";
		ArrayList<String> beam = new ArrayList();
		
		Map<String, Double> candidateMap = new HashMap();
		int curSize = 0;
		while(yBest.length() != sinput.size()){
			curSize++;
			String subLabel = label.substring(0, curSize);
			if(beam.size() == 0){
				for(int i = 0; i < this.classNum; i++){
					String tmp = "";
					tmp += (classNum == 26) ? (char)(i+'a') : i;
					double score = calulateCandidateBeamScore(tmp, sinput, complexity);
					candidateMap.put(tmp, score);
				}
			}else{
				for(int i = 0; i < beam.size(); i++){					
					for(int j = 0; j < this.classNum; j++){
						String tmp = beam.get(i);
						tmp += (classNum == 26) ? (char)(j+'a') : j;
						double score = calulateCandidateBeamScore(tmp, sinput, complexity);
						candidateMap.put(tmp, score);
					}
				}
			}
			
			List<Entry<String, Double>> sortedEntryList = entriesSortedByValues(candidateMap);
			beam.clear();
			candidateMap.clear();
			boolean earlyUpdateChecker = true;
			for(int i = 0; i < beamWidth; i++){
				beam.add(sortedEntryList.get(i).getKey());
				if(sortedEntryList.get(i).getKey().equals(subLabel))
						earlyUpdateChecker = false;
				candidateMap.put(sortedEntryList.get(i).getKey(), sortedEntryList.get(i).getValue());
			}
			if(mode == UpdateMode.EarlyUnpdate && earlyUpdateChecker){
				for(String wrongLabel : beam){
					updateFeatureWeight(sinput, subLabel, wrongLabel, complexity);
					return null;
				}
			}
			yBest = beam.get(0);
		}
		
		return yBest;
	}
	
	private <K,V extends Comparable<? super V>> 
	    List<Entry<K, V>> entriesSortedByValues(Map<K,V> map) {
	
		List<Entry<K,V>> sortedEntries = new ArrayList<Entry<K,V>>(map.entrySet());
		
		Collections.sort(sortedEntries, 
		    new Comparator<Entry<K,V>>() {
		        @Override
		        public int compare(Entry<K,V> e1, Entry<K,V> e2) {
		            return e2.getValue().compareTo(e1.getValue());
		        }
		    }
		);
		
		return sortedEntries;
	}
	
	private double calulateCandidateBeamScore(String candidate,
			ArrayList<ArrayList<Integer>> sinput, int complexity){
		double score = 0.0;
		ArrayList<ArrayList<Integer>> sample = new ArrayList();
		// calculate unary score
		for(int i = 0; i < candidate.length(); i++){
			score += dotProduct(sinput.get(i), weight.get(candidate.charAt(i)));
			sample.add(sinput.get(i));
		}
		
		score += calculateFeatureScore(sample, candidate, complexity);
		
		return score;
		
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
