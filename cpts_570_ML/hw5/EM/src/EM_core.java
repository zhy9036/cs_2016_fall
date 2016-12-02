import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class EM_core {
	
	double[] means;
	double[] variances;
	double[] priors;
	double[] likelyhood; //sum of P(xi|k)P(k)
	ArrayList<Data> data;
	int clusters;
	public EM_core(int clusterCounts){
		clusters = clusterCounts;
		means = new double[clusterCounts];
		variances = new double[clusterCounts];
		priors = new double[clusterCounts];
		
		data = new ArrayList<Data>();
		try {
			init();
			likelyhood = new double[data.size()];
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void iteration(){
		double mean;
		do{
			mean = means[clusters-1];
			
			expectation();
			maximization();
			//System.out.println("pre = "+mean);
			//System.out.println("post = "+means[2]);
		}while(mean != means[clusters-1]);
		System.out.println("Number of clusters: " + clusters);
		for(int i = 0; i < clusters; i++){
			System.out.println("cluster " + i + " " +"means: " + means[i]);
			System.out.println("cluster " + i + " " +"variances: " + variances[i]);
			System.out.println("cluster " + i + " " +"prior: " + priors[i]);
		}
		System.out.println("Likelihood: " + calculateLikelyhood());
		System.out.println("Avg. Likelihood: " + calculateLikelyhood()/6000);
	}
	
	private void init() throws IOException{
		
		for(int i = 0; i < clusters; i++){
			priors[i] = 1.0/clusters;
			means[i] = 10 + i;
			variances[i] = 1.0;
		}

		FileInputStream fis = new FileInputStream(new File("data"));
		//Construct BufferedReader from InputStreamReader
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		
		String line;
		while((line=br.readLine()) != null){
			data.add(new Data(clusters,Double.valueOf(line)));
		}
		br.close();
	}
	
	private void expectation(){
		for(int i = 0; i < data.size(); i++){
			Data d = data.get(i); 
			double tmp1 = 0.0; // sum of P(xi|k)P(k)
			for(int j = 0; j < clusters; j++){
				double tmp = priors[j]*Math.exp(-Math.pow(d.value-means[j], 2)/(2*variances[j]));
				//if(tmp == 0)
					//System.out.println("----------------------------------------+"+variances[j]);
				//System.out.println(priors[j]);
				//d.posteriors[j] = tmp;
				
				d.test[j] = Math.exp(-Math.pow(d.value-means[j], 2)
						/ (2*variances[j]))/(Math.sqrt(2*Math.PI*variances[j]));
				tmp1 += (d.test[j] * priors[j]);
			}
			likelyhood[i] = tmp1;
			for(int j = 0; j < clusters; j++){
				
				d.posteriors[j] = (d.test[j]*priors[j]/tmp1);
			}
			
			
		}
	}
	
	private void maximization(){
		for(int i = 0; i < clusters; i++){
			updateMeanAndPriors(i);
			double varianceBot = 0.0;
			double varianceTop = 0.0;
			int k = 0;
			for(Data d : data){
				varianceBot += d.posteriors[i];
				varianceTop += d.posteriors[i] *
						Math.pow(d.value-means[i], 2);
			}
			variances[i] = varianceTop/varianceBot;
		}
	}
	
	private void updateMeanAndPriors(int cls){
		double posteriorSum = 0.0;
		double meanTop = 0.0;
		for(Data d : data){
			posteriorSum += d.posteriors[cls];
			meanTop += d.posteriors[cls]*d.value;
		}
		/*
		if(posteriorSum == 0){
			System.out.println("wrong");
			System.out.println(posteriorSum);
		}
		*/
		means[cls] = meanTop/posteriorSum;
		
		priors[cls] = posteriorSum/data.size();
		//System.out.println("priors : " + priors[cls]);
		
	}
	
	private double calculateLikelyhood(){
		double lh = 0.0;
		for(int i = 0; i < data.size(); i++){
			lh += Math.log(likelyhood[i]);
		}
		return lh;
	}
}
