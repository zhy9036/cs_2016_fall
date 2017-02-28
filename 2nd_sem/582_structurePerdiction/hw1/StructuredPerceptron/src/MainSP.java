import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;




public class MainSP {
	public static void main (String[] args) throws IOException {
		ArrayList<ArrayList<ArrayList<Integer>>> data = new ArrayList(); 
		ArrayList<String> sLabels = new ArrayList();
		ArrayList<ArrayList<ArrayList<Integer>>> dataT = new ArrayList(); 
		ArrayList<String> sLabelsT = new ArrayList();
		dataProcess("datasets/nettalk_stress_train.txt", data, sLabels);
		//dataProcess("datasets/ocr_fold0_sm_train_small.txt", dataT, sLabelsT);
		int featureLength = data.get(0).get(0).size(); 
		int classNum = 5; 
		int restarts = 20;
		int maxIter = 50; 
		int beamWidth = 20;
		double learningRate = 0.01;
		int complexity = 2;
		//SPerceptron sp = new SPerceptron(featureLength, classNum, restarts, maxIter, learningRate);
		//sp.feedTestData(dataT, sLabelsT);
		//sp.training(data, sLabels, complexity);
		StructuredPerceptronBeam spb = new StructuredPerceptronBeam(featureLength, classNum, 
				maxIter, learningRate);
		int[] res = new int[]{10, 25, 50, 100, 200};
		spb.training(data, sLabels, beamWidth, complexity, 
				StructuredPerceptronBeam.UpdateMode.EarlyUpdate, 
				StructuredPerceptronBeam.SearchMode.BestFirst);
		
		double rst = spb.test(data, sLabels, complexity, beamWidth, 
				StructuredPerceptronBeam.UpdateMode.EarlyUpdate, 
				StructuredPerceptronBeam.SearchMode.BestFirst);
		
		System.out.println("finished \n");
		System.out.println(rst);
		/*
		for(double a : sp.trainingRst){
			System.out.println(a);
		}
		System.out.println("\n\n testing \n\n");
		for(double a : sp.testingRst){
			System.out.println(a);
		}
		*/
		/*
		for(int a : res){
			SPerceptron spSub = new SPerceptron(featureLength, classNum, a, maxIter, learningRate);
			spSub.feedTestData(dataT, sLabelsT);
			spSub.training(data, sLabels, complexity);
			System.out.println(spSub.trainingRst.get(maxIter-1));
			System.out.println(spSub.testingRst.get(maxIter-1));
			System.out.println("\n\n");
		}
		*/

	}
	
	public static void dataProcess(String fileName, 
			ArrayList<ArrayList<ArrayList<Integer>>> data, 
			ArrayList<String> sLabels) throws IOException{
		
		FileInputStream fis = new FileInputStream(new File(fileName));
		//Construct BufferedReader from InputStreamReader
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		String line;
		ArrayList<ArrayList<Integer>> sample = new ArrayList();
		String structuredLabel = "";
		while((line=br.readLine()) != null){
			line.trim();
			if(!line.matches("\\s*")){
				String[] buf = line.split("\\s+");	
				ArrayList<Integer> feature = new ArrayList();
				char charLabel = buf[2].charAt(buf[2].length()-1);
				//int label = (charLabel >= 'a' && charLabel <= 'z') ? charLabel - 'a' : charLabel - '0';

				String featureString = buf[1].substring(2);
				for(int i = 0; i < featureString.length(); i++){
					feature.add(featureString.charAt(i) - '0');
				}
				sample.add(feature);
				structuredLabel += charLabel;
				//System.out.print((char)(label+'0'));
				
			}else{
				//System.out.println(structuredLabel);				
				data.add(sample);
				sLabels.add(structuredLabel);
				sample = new ArrayList();
				structuredLabel = "";
			}
			
			
		}
		br.close();
	}
}
