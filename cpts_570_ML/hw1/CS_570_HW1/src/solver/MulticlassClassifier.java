package solver;

import java.util.ArrayList;
import java.util.Set;

public class MulticlassClassifier {
	
	public enum Mode {
		Perceptron, PassiveAggressive, PerceptronAveg;
	}
	
	int classNum;
	
	public MulticlassClassifier(int classNum){
		this.classNum = classNum;

	}
	
	public ArrayList<double[]> perceptron(Set<Pair<double[],Character>> data,
			int maxIterations){
		
		return algorithemSolver(Mode.Perceptron, data, maxIterations);
	}
	
	public ArrayList<double[]> passiveAggressive(Set<Pair<double[],Character>> data,
			int maxIterations){
		
		return algorithemSolver(Mode.PassiveAggressive, data, maxIterations);
	}
	
	public ArrayList<double[]> perceptronAveg(Set<Pair<double[],Character>> data,
			int maxIterations){
		
		return algorithemSolver(Mode.PerceptronAveg, data, maxIterations);
	}
	
	private ArrayList<double[]> algorithemSolver(Mode mode, 
			Set<Pair<double[],Character>> data, int maxIterations){
		
		ArrayList<double[]> weight = new ArrayList<double[]>();
		ArrayList<double[]> weightAveg = new ArrayList<double[]>();
		for(int j = 0; j < classNum; j++){
			weight.add(j, new double[128]);
			weightAveg.add(j, new double[128]);
		
		}
		//double[] weight = new double[128];
		//double[] weightAveg = new double[128];
		for(int i = 0; i < maxIterations; i++){
			int count = 1;
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
		}
		return (mode == Mode.PerceptronAveg) ? weightAveg : weight;
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
	
}
