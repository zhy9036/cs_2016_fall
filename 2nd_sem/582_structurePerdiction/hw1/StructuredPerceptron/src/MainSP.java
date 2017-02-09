import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class MainSP {
	public static void main (String[] args) throws IOException {
		ArrayList<ArrayList<ArrayList<Integer>>> data = new ArrayList(); 
		ArrayList<ArrayList<Integer>> sLabels = new ArrayList();
		ArrayList<ArrayList<Double>> weight = new ArrayList();
		
		dataProcess("datasets/ocr_fold0_sm_train.txt", data, sLabels);
		
		int restarts = 20;
		int maxIter = 2; 
		double learningRate = 0.01;
		SPerceptron sp = new SPerceptron(weight, restarts, maxIter, learningRate);
		sp.training(data, sLabels);
		sp.test(data, sLabels);
	}
	
	public static void dataProcess(String fileName, 
			ArrayList<ArrayList<ArrayList<Integer>>> data, 
			ArrayList<ArrayList<Integer>> sLabels) throws IOException{
		
		FileInputStream fis = new FileInputStream(new File(fileName));
		//Construct BufferedReader from InputStreamReader
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		String line;
		ArrayList<ArrayList<Integer>> sample = new ArrayList();
		ArrayList<Integer> structuredLabel = new ArrayList();
		while((line=br.readLine()) != null){
			line.trim();
			if(!line.matches("\\s*")){
				String[] buf = line.split("\\s+");	
				ArrayList<Integer> feature = new ArrayList();
				int label = buf[2].charAt(0) - 'a';
				String featureString = buf[1].substring(2);
				for(int i = 0; i < featureString.length(); i++){
					feature.add(featureString.charAt(i) - '0');
				}
				sample.add(feature);
				structuredLabel.add(label);
				//System.out.print((char)(label+'a'));
			}else{
				//System.out.println();
				data.add(sample);
				sLabels.add(structuredLabel);
				sample = new ArrayList();
				structuredLabel = new ArrayList();
			}
			
			
		}
		br.close();
	}
}
