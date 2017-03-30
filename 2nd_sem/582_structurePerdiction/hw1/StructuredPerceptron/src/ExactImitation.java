import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import weka.classifiers.Evaluation;
import weka.classifiers.functions.MultilayerPerceptron;
import weka.core.Instances;
import weka.core.converters.CSVLoader;


public class ExactImitation {
	
	public ExactImitation(ArrayList<ArrayList<ArrayList<Integer>>> data, 
			ArrayList<String> sLabels) throws Exception{
		
		
		dumpCSV(data, sLabels, "datasets/tryout.csv");
		
		MultilayerPerceptron vp = new MultilayerPerceptron();
		//vp.buildClassifier(wekaData);
			
		Instances wekaData = null;
		CSVLoader csv = new CSVLoader();
		csv.setSource(new File("datasets/tryout.csv"));
		wekaData = csv.getDataSet();
		wekaData.setClassIndex(wekaData.numAttributes()-1);
		System.out.println("Building classifier...");
		vp.buildClassifier(wekaData);
		System.out.println("Done!");
		Evaluation eval = new Evaluation(wekaData);
		System.out.println(eval.toSummaryString("\nResults\n======\n", false));
		
		
	}
	
	private void dumpCSV(ArrayList<ArrayList<ArrayList<Integer>>> data, ArrayList<String> sLabels, String fname){
		int size = data.get(0).get(0).size();
		String[] titles = new String[size+2];
		titles[0] = "history";
		titles[size+1] = "class";
		ArrayList<String[]> datasetRaw = new ArrayList<String[]>();
		for(int i = 1; i < size+1; i++)
			titles[i] = i+"";
		datasetRaw.add(titles);
		for(int i = 0; i < data.size(); i++){
			ArrayList<ArrayList<Integer>> sample = data.get(i);
			String sampleLabel = sLabels.get(i);
			String tmpLabel = "";
			for(int t = 0; t < sample.size(); t++){
				String[] tmp = new String[size+2];
				if(tmpLabel.length() < 1)
					tmp[0] = "-";
				else
					tmp[0] = tmpLabel;
				int iter = 1;
				for(int a : sample.get(t)){
					tmp[iter] = a+"";
					iter++;
				}
				tmp[iter] = sampleLabel.charAt(t) + "";
				tmpLabel += sampleLabel.charAt(t);
				
				datasetRaw.add(tmp);
			}
		}
		FileWriter w;
		try {
			w = new FileWriter(fname);		
			for(String[] a : datasetRaw){
				int i;
				for(i = 0; i < a.length-1; i++){
					w.append(a[i]);
					w.append(',');
				}
				w.append(a[i]);
				w.append('\n'); 
			}
			w.flush();
			w.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
