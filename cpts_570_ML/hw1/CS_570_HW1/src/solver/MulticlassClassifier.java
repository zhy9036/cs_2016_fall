package solver;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import solver.BinaryClassifier.Mode;

public class MulticlassClassifier {
	
	public enum Mode {
		Perceptron, PassiveAggressive, PerceptronAveg;
	}
	
	int classNum;
	private int[] error;
	
	public MulticlassClassifier(int classNum){
		this.classNum = classNum;
		error = new int[50];

	}
	
	public ArrayList<List<double[]>> perceptron(Set<Pair<double[],Character>> data,
			int maxIterations){
		
		return algorithemSolver(Mode.Perceptron, data, maxIterations);
	}
	
	public ArrayList<List<double[]>> passiveAggressive(Set<Pair<double[],Character>> data,
			int maxIterations){
		
		return algorithemSolver(Mode.PassiveAggressive, data, maxIterations);
	}
	
	public ArrayList<List<double[]>> perceptronAveg(Set<Pair<double[],Character>> data,
			int maxIterations){
		
		return algorithemSolver(Mode.PerceptronAveg, data, maxIterations);
	}
	
	private ArrayList<List<double[]>> algorithemSolver(Mode mode, 
			Set<Pair<double[],Character>> data, int maxIterations){
		
		ArrayList<List<double[]>> weights = new ArrayList<List<double[]>>();
		//ArrayList<List<double[]>> weightAvegs = new ArrayList<List<double[]>>();
		
		//double[] weight = new double[128];
		//double[] weightAveg = new double[128];
		ArrayList<double[]> weight = new ArrayList<double[]>();
		ArrayList<double[]> weightAveg = new ArrayList<double[]>();
		for(int j = 0; j < classNum; j++){
			weight.add(j, new double[128]);
			weightAveg.add(j, new double[128]);			
		}
		for(int i = 0; i < maxIterations; i++){
			int count = 1;
			int err = 0;
			
			
			for(Pair<double[], Character> sample : data){
				char actual = sample.getSecond();
				double[] dataFeature = sample.getFirst();
				Pair<Character, Double> bestBad = findBestBad(weight, dataFeature, actual);
				char predict = bestBad.getFirst();
				double bestBadScore = bestBad.getSecond();
				double goodScore = 0.0;
				
				for(int a = 0; a < dataFeature.length; a++)
					goodScore += weight.get(actual-'a')[a]*dataFeature[a];
				
				boolean wrong = (mode == Mode.PassiveAggressive)? goodScore-bestBadScore < 1 
						: goodScore - bestBadScore <= 0; 
				if(wrong){ //made mistake
					err++;
					//wi*ci
					if(mode == Mode.PerceptronAveg){
						for(int j = 0; j < weight.size(); j++){
							for(int k = 0; k < 128; k++)
								weightAveg.get(j)[k] += weight.get(j)[k]*count;
						}
					}
					double learningRate = (mode != Mode.PassiveAggressive)? 1.0 : 
						paLearningRate(weight, dataFeature, actual, predict);
					weight  = updateWeight(weight,learningRate,dataFeature,actual,predict);;
					count = 1;
				}else{
					count++;
				}
			}
			error[i]=err;
			ArrayList<double[]> tmp = new ArrayList<double[]>();
			ArrayList<double[]> tmpAveg = new ArrayList<double[]>();
			for(int x = 0; x < weight.size(); x++){
				tmp.add(weight.get(x).clone());
				tmpAveg.add(weightAveg.get(x).clone());
			}
			weights.add((mode == Mode.PerceptronAveg) ? tmpAveg: tmp);
			//weightAvegs.add(weightAveg);
			
		}
		return weights;
	}
	
	private double paLearningRate(ArrayList<double[]> weight, 
			double[] dataFeature, char actual, char predict){
		
		double[] wActual = weight.get(actual-'a');
		double[] wPredict = weight.get(predict-'a');
		//System.out.println(Arrays.toString(wActual));
		double numerator = 1 - 
				(dotProduct(wActual, dataFeature)-dotProduct(wPredict, dataFeature));
		double denominator = 0.0;
		for(int i = 0; i < dataFeature.length; i++)
			denominator += (2*dataFeature[i]*dataFeature[i]);
		
		double rst = numerator/denominator;
		//System.out.println("PA numerator: " + numerator);
		//System.out.println("PA denominator: " + denominator);
		//System.out.println("PA learning rate: " + rst);
		return rst;
	}
	
	private double dotProduct(double[] a, double[] b){
		double rst = 0.0;
		for(int i = 0; i < a.length; i++)
			rst += (a[i]*b[i]);
		return rst;
	}
	
	private Pair<Character, Double> findBestBad(ArrayList<double[]> weight, double[] dataFeature,
			char actual){
		double max = 0;
		int choice = 0; 
		for(int i = 0; i < classNum; i++){
			double cur = 0;
			if(i == (actual-'a'))
				continue;
			for(int j = 0; j < dataFeature.length; j++){
				cur += weight.get(i)[j]*dataFeature[j];
			}
			if(cur >= max){
				max = cur;
				choice = i;
			}
		}
		return new Pair<Character, Double>((char) ('a'+choice), max);
	}
	
	private ArrayList<double[]> updateWeight(ArrayList<double[]> weight, double learningRate,
			double[] dataFeature, char actual, char predict){
		double[] yTure = weight.get(actual-'a');
		double[] yFalse = weight.get(predict-'a');
		for(int i = 0; i < dataFeature.length; i++){
			yTure[i] += (dataFeature[i]*learningRate);
			yFalse[i] -= (dataFeature[i]*learningRate);
		}
		weight.set(actual-'a', yTure);
		weight.set(predict-'a', yFalse);
		
		return weight;
	}

	public int[] getErrorCount() {
		// TODO Auto-generated method stub
		return error;
	}
	
}
