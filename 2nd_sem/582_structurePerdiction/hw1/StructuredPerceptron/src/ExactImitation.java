import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import weka.classifiers.functions.MultilayerPerceptron;
import weka.core.DenseInstance;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.CSVLoader;
import weka.filters.Filter;
import weka.filters.unsupervised.attribute.NominalToString;


public class ExactImitation {
	MultilayerPerceptron model;
	Instances train = null;
	Instances test = null;
	ArrayList<ArrayList<ArrayList<Integer>>> data;
	ArrayList<String> sLabels;
	ArrayList<String> sLabelsT;
	public ExactImitation(ArrayList<ArrayList<ArrayList<Integer>>> data, 
			ArrayList<String> sLabels, ArrayList<ArrayList<ArrayList<Integer>>> dataT, 
			ArrayList<String> sLabelsT) throws Exception{
		this.data = data;
		this.sLabels = sLabels;
		this.sLabelsT = sLabelsT;
		//dumpCSV(data, sLabels, "datasets/net_tryout.csv");
		//dumpCSV(dataT, sLabelsT, "datasets/net_tryoutT.csv");
		model = new MultilayerPerceptron();
		//vp.buildClassifier(wekaData);
		CSVLoader csv = new CSVLoader();
		csv.setSource(new File("datasets/ocr_tryout.csv"));
		train = csv.getDataSet();
		train.setClassIndex(train.numAttributes()-1);
		if(dataT != null){
			csv.setSource(new File("datasets/ocr_tryoutT.csv"));
			test = csv.getDataSet();
			test.setClassIndex(test.numAttributes()-1);
		}
		
		System.out.println("Building classifier...");
		model.setOptions(weka.core.Utils.splitOptions("-L 0.01 -M 0.2 -N 50 -V 0 -S 0 -E 20 -H 0"));
	
		model.buildClassifier(train);
		System.out.println("Done!");	
	}
	
	public void eval(MultilayerPerceptron mp, boolean ifTrain)throws Exception{
		//calculate oracle error
		ArrayList<String> labelSet = (ifTrain)? sLabels : sLabelsT;
		Instances dataSet = (ifTrain)? train : test;
		
		ArrayList<Character> labels = new ArrayList();
		
		for(String s : labelSet){
			for(int i = 0; i < s.length(); i++)
				labels.add(s.charAt(i));
		}
		
		int count = 0;
		/*
		for(int i = 0; i < dataSet.size(); i++){
			char y = labels.get(i);
			
			double yH = mp.classifyInstance(dataSet.get(i));
			String pred = dataSet.classAttribute().value((int) yH);
			char yHat = pred.charAt(1);
			//System.out.println(pred + " " + y);
			if(y != yHat) count++;
		}
		System.out.println("Oracle error: " + count*1.0/labels.size());
		*/
		
		//calculate recurrent error		
		count = 0;
		String histroy = "H", pre = "";
		for(int i = 0; i < dataSet.size(); i++){
			char y = labels.get(i);
			Instance cur = new DenseInstance(dataSet.get(i));
			cur.setDataset(dataSet);
			double index = cur.value(0);
			String his = dataSet.attribute(0).value((int)index);
			if(his.length() == 1){
				pre = "";	
			}
			histroy += pre;			
			cur.setValue(0, histroy);
			histroy = "H";
			double yH = mp.classifyInstance(cur);
			String pred = dataSet.classAttribute().value((int) yH);
			pre = pred.charAt(1) + "";
			if(y != pre.charAt(0)) count++;
		}
		// recurrent error
		System.out.println(count*1.0/labels.size());
		/*
		Evaluation eval = new Evaluation(train);
		eval.evaluateModel(model, train);
		System.out.println(eval.toSummaryString("\nResults\n======\n", false));
		if(train != null){
			eval.evaluateModel(model, test);
			System.out.println(eval.toSummaryString("\nResults\n======\n", false));
		}
		*/
	}
	public void daggerEval() throws Exception{
		for(int i = 5; i <= 10; i++){
			ArrayList<MultilayerPerceptron> list = dagger(5, i*1.0/10);
			for(MultilayerPerceptron mp : list){
				//System.out.println("train:");
				//eval(mp, true);
				//System.out.println("test:");
				eval(mp, false);
			}
		}
	}
	
	
	// dIter is 5
	public ArrayList<MultilayerPerceptron> dagger(int dIter, double beta) throws Exception{
		Random r = new Random();
		//MultilayerPerceptron h1 = model;
		ArrayList<MultilayerPerceptron> list = new ArrayList();
		Instances copy = new Instances(train);
		list.add(model);
		int size = data.get(0).get(0).size();
		for (int dt = 0; dt < dIter; dt++){
			MultilayerPerceptron h1 = list.get(dt);
			int insSize = copy.size();
			for(int i = 0; i < insSize; i++){
				String pred = "";
				String yTrue = copy.classAttribute().value((int)copy.get(i).classValue());
				if(r.nextFloat() > beta){
					double yH = h1.classifyInstance(copy.get(i));
					pred = copy.classAttribute().value((int) yH);
				}else{
					// oracle
					pred = yTrue;
				}
				if(!pred.equals(yTrue))
					copy.add(copy.get(i));
					
			}
			//perform exponential decay
			double b = -Math.log(dt / beta / 5);
			beta *= Math.exp(-5/b);
			MultilayerPerceptron m = new MultilayerPerceptron();
			m.setOptions(weka.core.Utils.splitOptions("-L 0.01 -M 0.2 -N 50 -V 0 -S 0 -E 20 -H 0"));
			m.buildClassifier(copy);
			list.add(m);			
		}
		return list;
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

			String histroyLabel = "H";
			for(int t = 0; t < sample.size(); t++){
				String[] tmp = new String[size+2];
				
				tmp[0] = histroyLabel;
				histroyLabel = "H";

				int iter = 1;
				for(int a : sample.get(t)){
					tmp[iter] = a+"";
					iter++;
				}

				tmp[iter] = "L" + sampleLabel.charAt(t) + "";
				histroyLabel += sampleLabel.charAt(t);				
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
