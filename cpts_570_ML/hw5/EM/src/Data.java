
public class Data {
	double[] posteriors;
	double[] test;
	double value;
	public Data(int clusterCounts, double value){
		posteriors = new double[clusterCounts];
		test = new double[clusterCounts];
		this.value = value;
	}
}
