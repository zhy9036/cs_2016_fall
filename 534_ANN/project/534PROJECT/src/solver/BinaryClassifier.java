package solver;

import java.util.ArrayList;
import java.util.Set;

public class BinaryClassifier {
	private int[] error;
	private double[][] weightList;
	public BinaryClassifier(){
		weightList = new double[50][128];
		error = new int[50];
	}
	
	public enum Mode {
		Perceptron, PassiveAggressive, PerceptronAveg;
	}
	
	public int[] getErrorCount(){
		return error;
	}
	
	public double[][] perceptron(Set<Pair<double[], Integer>> data, int maxIterations){
		//error = 0;
		return algorithemSolver(Mode.Perceptron, data, maxIterations).clone();
	}
	
	public double[][] passiveAggressive(Set<Pair<double[], Integer>> data, int maxIterations){
		//error = 0;
		return algorithemSolver(Mode.PassiveAggressive, data, maxIterations).clone();
	}
	
	public double[][] perceptronAveg(Set<Pair<double[], Integer>> data, int maxIterations){
		//error = 0;
		return algorithemSolver(Mode.PerceptronAveg, data, maxIterations).clone();
	}
	
	private double[][] algorithemSolver(Mode mode,Set<Pair<double[], Integer>> data, int maxIterations){
		double[] weight = new double[128];
		double[] weightAveg = new double[128];
		//System.out.println(Arrays.toString(weight));
		for(int i = 0; i < maxIterations; i++){
			int err = 0;
			int count = 1;
			for(Pair<double[], Integer> sample : data){
				int actual = sample.getSecond();
				double[] dataFeature = sample.getFirst();
				boolean wrong = (mode == Mode.PassiveAggressive)? actual*sign(dataFeature, weight) < 1 :
					actual*sign(dataFeature, weight) <= 0;
				if(wrong){
					err++;
					//if(sign(dataFeature, weight) == 0.0)
						//System.out.println(Arrays.toString(weight));
					double learningRate = (mode == Mode.PassiveAggressive)? 
							paLearningRate(dataFeature, actual, weight):1;
					//System.out.println(learningRate + " -------- ");	
							//wi*ci
					for(int j = 0; j < weight.length; j++)
						weightAveg[j] += weight[j]*count;
					
					weight = updateWeight(weight,learningRate,dataFeature,actual);
					count = 1;
				}
				else count++;
			}
			error[i] = err;
			weightList[i] = (mode == Mode.PerceptronAveg) ? weightAveg.clone() : weight.clone();
		}
		return weightList.clone();
	}
	
	// Compute the Learning Rate for passive-aggressive
	private double paLearningRate(double[] dataFeature, int actual, double[] weight){
		double normX = 0;
		for(int i = 0; i < dataFeature.length; i++)
			normX += (dataFeature[i]*dataFeature[i]);
		double rst = (1 - actual*sign(dataFeature, weight))/normX;
		
		return rst;
	}
	
	// dot product of two vectors
	private double sign(double[] a, double[] b){
		double rst = 0;
		for(int i = 0; i<a.length; i++){
			rst += (a[i]*b[i]);
		}
		
		return rst;
	}
	
	private double[] updateWeight(double[] weight, double learningRate, double[] dataFeature, int actual){
		for(int i = 0; i<weight.length; i++){
			weight[i] += learningRate*dataFeature[i]*actual;
		}
		return weight;
	}	
}
