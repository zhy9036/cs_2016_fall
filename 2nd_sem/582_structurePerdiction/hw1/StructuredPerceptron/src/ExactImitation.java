import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import weka.classifiers.Evaluation;
import weka.classifiers.functions.MultilayerPerceptron;
import weka.core.DenseInstance;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.CSVLoader;


public class ExactImitation {
	MultilayerPerceptron model;
	Instances train = null;
	Instances test = null;
	ArrayList<ArrayList<ArrayList<Integer>>> data;
	ArrayList<String> sLabels;
	public ExactImitation(ArrayList<ArrayList<ArrayList<Integer>>> data, 
			ArrayList<String> sLabels, ArrayList<ArrayList<ArrayList<Integer>>> dataT, 
			ArrayList<String> sLabelsT) throws Exception{
		this.data = data;
		this.sLabels = sLabels;
		//dumpCSV(data, sLabels, "datasets/ocr_tryout.csv");
		//dumpCSV(dataT, sLabelsT, "datasets/ocr_tryoutT.csv");
		model = new MultilayerPerceptron();
		//vp.buildClassifier(wekaData);
		CSVLoader csv = new CSVLoader();
		csv.setSource(new File("datasets/ocr_tryout.csv"));
		train = csv.getDataSet();
		train.setClassIndex(train.numAttributes()-1);
		if(dataT != null){
			csv.setSource(new File("datasets/ocr_tryoutT.csv"));
			test = csv.getDataSet();
			test.setClassIndex(train.numAttributes()-1);
		}
		
		System.out.println("Building classifier...");
		model.setOptions(weka.core.Utils.splitOptions("-L 0.01 -M 0.2 -N 50 -V 0 -S 0 -E 20 -H 0"));
		model.buildClassifier(test);
		System.out.println("Done!");	
	}
	
	public void eval()throws Exception{
		Evaluation eval = new Evaluation(train);
		eval.evaluateModel(model, train);
		System.out.println(eval.toSummaryString("\nResults\n======\n", false));
		if(train != null){
			eval.evaluateModel(model, test);
			System.out.println(eval.toSummaryString("\nResults\n======\n", false));
		}
	}
	
	public void dagger(int dIter, double beta) throws Exception{
		MultilayerPerceptron h1 = model;
		ArrayList<MultilayerPerceptron> list = new ArrayList();
		list.add(h1);
		int size = data.get(0).get(0).size();
		for (int dt = 0; dt < dIter; dt++){
			
			for(int i = 0; i < data.size(); i++){
				ArrayList<ArrayList<Integer>> sample = data.get(i);
				String sampleLabel = sLabels.get(i);
				String tmpLabel = "H";
				for(int t = 0; t < sample.size(); t++){
					Instance ins =  new DenseInstance(size+2);
					String[] tmp = new String[size+2];
					tmp[0] = tmpLabel;
					ins.setValue(0, tmpLabel);
					int iter = 1;
					for(int a : sample.get(t)){
						tmp[iter] = a+"";
						ins.setValue(iter, a);
						iter++;
					}
					tmp[iter] = "L" + sampleLabel.charAt(t);
					ins.setValue(iter, "L" + sampleLabel.charAt(t));
					double predict = beta*(sampleLabel.charAt(t)-'0') + (1-beta)*list.get(dt).classifyInstance(ins);
					if(sampleLabel.charAt(t)-'0' != (int)predict)
						train.add(ins);
					
					tmpLabel += sampleLabel.charAt(t);
					
					//datasetRaw.add(tmp);
				}
			}
			MultilayerPerceptron m = new MultilayerPerceptron();
			m.setOptions(weka.core.Utils.splitOptions("-L 0.01 -M 0.2 -N 50 -V 0 -S 0 -E 20 -H 0"));
			m.buildClassifier(train);
			list.add(m);
			
		}
	}
	
	public void dumpCSV(ArrayList<ArrayList<ArrayList<Integer>>> data, ArrayList<String> sLabels, String fname){
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
			String tmpLabel = "H";
			for(int t = 0; t < sample.size(); t++){
				String[] tmp = new String[size+2];
				tmp[0] = tmpLabel;
				int iter = 1;
				for(int a : sample.get(t)){
					tmp[iter] = a+"";
					iter++;
				}
				tmp[iter] = "L" + sampleLabel.charAt(t);
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
