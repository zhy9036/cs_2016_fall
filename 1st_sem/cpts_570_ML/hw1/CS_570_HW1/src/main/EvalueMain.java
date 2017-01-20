package main;

import java.awt.Point;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.swing.JFrame;
import javax.swing.JPanel;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.xy.XYSplineRenderer;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

import solver.BinaryClassifier;
import solver.MulticlassClassifier;
import solver.Pair;

public class EvalueMain {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		//showGraph();
		//binaryClassifierTest(50);	
		//multiClassifierTests(50);
		int c = 0;
		/*
		for(int i = 2; i <= 4; i++){
			for(int exp = 0; exp < 10; exp++){
				//c += separateFile(String.format("OCRdata/ocr_fold%d_sm_train.txt",exp), exp);
				//transferFormat(String.format("OCRdata/ocr_fold%d_sm_train.txt",exp), exp);
				c+=calculateSV(String.format("OCRdata/polymodel%d%d",i,exp));
			}
			System.out.println(c/10);
			c=0;
		}
		*/
		
		/*
		System.out.print("    ");
		for(int i = 0; i < 3; i++){
			System.out.print("~"+(1+4*i)+" ");
		}
		System.out.println();
		int[][] matrix = cs534hw5("MLR.csv");//confusionMatrix("OCRdata/fullOutput0", "OCRdata/fold0_sm_fullTrain.txt");
		for(int i = 0; i < 3; i++){
			System.out.print(1+4*i + "   ");
			for(int j = 0; j < 3; j++){
				String space = (matrix[i][j] > 9)? " ": "  ";
				System.out.print(matrix[i][j]+space);
			}
			System.out.println();
		}
		*/
		//transferFormat("1st.txt",1);
		separateFile("1st.txt", 1);
		
	}

	
	private static int calculateSV(String fname) throws IOException {
		int n = 0;
		String line = null;
		int count = 0;
		FileInputStream fis = new FileInputStream(new File(fname));
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		while ((line = br.readLine()) != null) {
			if(!line.matches("\\s*")){
				String[] buf = line.split("\\s+");		
				
				if(buf[0].equals("total_sv")){
					n = Integer.valueOf(buf[1]);
				}
			}				
		}
		//System.out.println(count);
		br.close();
		return n;
	}
	
	private static int[][] confusionMatrix(String f1, String f2) throws IOException{
		int[][] rst = new int[26][26];
		FileInputStream fout = new FileInputStream(new File(f1));
		FileInputStream fin = new FileInputStream(new File(f2));
		BufferedReader br1 = new BufferedReader(new InputStreamReader(fout));
		BufferedReader br2 = new BufferedReader(new InputStreamReader(fin));
		String line1 = null;
		String line2 = null;
		int count = 0;
		while ((line1 = br1.readLine()) != null && (line2 = br2.readLine())!=null) {
			if(!line1.matches("\\s*")){
				count++;
				String[] buf = line2.split("\\s+");
				double perdict = Double.valueOf(line1);
				int actual = Integer.valueOf(buf[0]);
				if(perdict == actual){
					rst[actual][actual]++;
				}else{
					rst[actual][(int) perdict]++;
				}				

			}				
		}
		System.out.println(count);
		
		br1.close();
		br2.close();
		
		return rst;
	}
	
	private static int[][] cs534hw5(String fname) throws IOException{
		int[][] cm = new int[3][3];
		String line = null;
		FileInputStream fis = new FileInputStream(new File(fname));
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		int count = 0;
		while ((line = br.readLine()) != null) {
			
			String[] buf = line.split(",");
			int label = Integer.valueOf(buf[1]);
			double per = Double.valueOf(buf[2]);
			int perdict = per > 4 ? 6 : (per > 1.5?2 : 1);
			if(label != perdict){
				count++;
				if(label == 1) {
					if(perdict == 2)
						cm[0][1]++;
					else
						cm[0][2]++;
				}else if(label == 2){
					if(perdict == 1)
						cm[1][0]++;
					else
						cm[1][2]++;
				}else{
					if(perdict == 1)
						cm[2][0]++;
					else
						cm[2][1]++;
				}
			}else{
				//count++;
				if(label == 1) cm[0][0]++;
				else if(label == 2) cm[1][1]++;
				else cm[2][2]++;
			}
		}
		System.out.println(count);
		return cm;
	}
	
	private static int transferFormat(String fname, int exp) throws IOException {
		
		
		String line = null;
		int count = 0;
		FileInputStream fis = new FileInputStream(new File(fname));
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		PrintWriter trainWriter = new PrintWriter(String.format("fold%d_sm_fullTrain.txt",exp));

		while ((line = br.readLine()) != null) {
			if(!line.matches("\\s*")){
				String[] buf = line.split("\\s+");		
				
				int actual=buf[2].charAt(0)-'a';
				String dataFeature = ""+actual+" ";
				//System.out.println(buf[0]);
				String feature = buf[1].substring(2);
				for(int i = 1; i <= feature.length(); i++){
					dataFeature += (i+":"+(feature.charAt(i-1))+" ");
				}
				dataFeature += "\n";
				count++;

				trainWriter.print(dataFeature);
			}				
		}
		//System.out.println(count);
		br.close();
		trainWriter.close();
		return count;
	}
	
	private static int separateFile(String fname, int exp) throws IOException {
		
		
		String line = null;
		int count = 0;
		FileInputStream fis = new FileInputStream(new File(fname));
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		PrintWriter trainWriter = new PrintWriter(String.format("fold%d_sm_train.txt",exp));
		PrintWriter valWriter = new PrintWriter(String.format("fold%d_sm_validation.txt",exp));

		while ((line = br.readLine()) != null) {
			if(!line.matches("\\s*")){
				String[] buf = line.split("\\s+");		
				
				int actual=buf[2].charAt(0)-'a';
				String dataFeature = ""+actual+" ";
				//System.out.println(buf[0]);
				String feature = buf[1].substring(2);
				for(int i = 1; i <= feature.length(); i++){
					dataFeature += (i+":"+(feature.charAt(i-1))+" ");
				}
				dataFeature += "\n";
				count++;
				if(count < 3695)
					trainWriter.print(dataFeature);
				else
					valWriter.print(dataFeature);
			}				
		}
		//System.out.println(count);
		br.close();
		trainWriter.close();
		valWriter.close();

		
		return count;
	}

	
	public static void binaryClassifierTest(int iterations){
		ArrayList<Point> stat = new ArrayList<Point>();
		ArrayList<Point> stat1 = new ArrayList<Point>();
		
		ArrayList<Point> pt_train = new ArrayList<Point>();
		ArrayList<Point> pt_test = new ArrayList<Point>();
		ArrayList<Point> pa_train = new ArrayList<Point>();
		ArrayList<Point> pa_test = new ArrayList<Point>();
		ArrayList<Point> ptAveg_train = new ArrayList<Point>();
		ArrayList<Point> ptAveg_test = new ArrayList<Point>();
		
		ArrayList<Point> pa_learning = new ArrayList<Point>();
		ArrayList<Point> pt_learning = new ArrayList<Point>();
		ArrayList<Point> ptAveg_learning = new ArrayList<Point>();
		
		BinaryClassifier bc = new BinaryClassifier();
		try {
			int count = 0;
			int count1 = 0;
			int count2 = 0;
			int countt = 0;
			int countt1 = 0;
			int countt2 = 0;
			for(int exp = 0; exp < 10; exp++){
				Set<Pair<double[], Integer>> data = 
						readFile(String.format("OCRdata/ocr_fold%d_sm_train.txt",exp));
				Set<Pair<double[], Integer>> data_test = 
						readFile(String.format("OCRdata/ocr_fold%d_sm_test.txt",exp));
				ArrayList<Set<Pair<double[], Integer>>> trainList = 
						readFile3(String.format("OCRdata/ocr_fold%d_sm_train.txt",exp));
			
				int dataSize = data.size();
				int testSize = data_test.size();					
				int[] errorPA;
				int[] errorPT;
				int[] errorPTaveg;
				double[][] w2 = bc.perceptronAveg(data, iterations);
				errorPTaveg = bc.getErrorCount();
				double[][] w1 = bc.passiveAggressive(data, iterations);
				errorPA = bc.getErrorCount();
				double[][] w = bc.perceptron(data, iterations);
				errorPT = bc.getErrorCount();

				
				double[][] ww2 = new double[50][128];
				double[][] ww1 = new double[50][128];
				double[][] ww = new double[50][128];

				for(int index = 0; index < trainList.size(); index++){
					//System.out.println(trainList.get(index).size());
					ww[index] = bc.perceptron(trainList.get(index), iterations)[49];
					ww1[index] = bc.passiveAggressive(trainList.get(index), iterations)[49];
					ww2[index] = bc.perceptronAveg(trainList.get(index), iterations)[49];
				}
				
				//Thread.sleep(100000);
				
				for(int i = 1; i <= iterations; i++ ){
					
					if(pt_train.size() < i){
						pt_train.add(new Point(i-1,(int) ((1-errorPT[i-1]*1.0/dataSize)*100)));
						//System.out.println((1-errorPT[i-1]*1.0/dataSize));
						pa_train.add(new Point(i-1,(int) ((1-errorPA[i-1]*1.0/dataSize)*100)));
						ptAveg_train.add(new Point(i-1,(int) ((1-errorPTaveg[i-1]*1.0/dataSize)*100)));
					}else{
						//System.out.println((int) ((stat.get(i-1).getY() + (1-errorPT[i-1]*1.0/dataSize)*100)));
						pt_train.set(i-1, new Point(i, (int) ((pt_train.get(i-1).getY() + (1-errorPT[i-1]*1.0/dataSize)*100))));
						ptAveg_train.set(i-1, new Point(i, (int) ((ptAveg_train.get(i-1).getY() + (1-errorPTaveg[i-1]*1.0/dataSize)*100))));
						pa_train.set(i-1, new Point(i, (int) ((pa_train.get(i-1).getY() + (1-errorPA[i-1]*1.0/dataSize)*100))));
					}
				
					for(Pair<double[], Integer> sample : data_test){
						double rst = dotProduct(sample.getFirst(), w[i-1]);
						double rst1 = dotProduct(sample.getFirst(), w1[i-1]);
						double rst2 = dotProduct(sample.getFirst(), w2[i-1]);
						
						double rstt = dotProduct(sample.getFirst(), ww[i-1]);
						double rstt1 = dotProduct(sample.getFirst(), ww1[i-1]);
						double rstt2 = dotProduct(sample.getFirst(), ww2[i-1]);

						if(rst * sample.getSecond() <= 0)
							count++;
						if(rst1 * sample.getSecond() <= 0)
							count1++;
						if(rst2 * sample.getSecond() <= 0)
							count2++;
						
						if(rstt * sample.getSecond() <= 0)
							countt++;
						if(rstt1 * sample.getSecond() <= 0)
							countt1++;
						if(rstt2 * sample.getSecond() <= 0)
							countt2++;
					}
					
					
					if(stat.size() < i){
						stat.add(new Point(i,count));
						stat1.add(new Point(i,count1));
						//System.out.println((int)((1-count*1.0/testSize)*100));
						pt_test.add(new Point(i,(int) ((1-count*1.0/testSize)*100)));
						ptAveg_test.add(new Point(i,(int) ((1-count2*1.0/testSize)*100)));
						pa_test.add(new Point(i,(int) ((1-count1*1.0/testSize)*100)));
						
						pt_learning.add(new Point(i*100,(int) ((1-countt*1.0/testSize)*100)));
						ptAveg_learning.add(new Point(i*100,(int) ((1-countt2*1.0/testSize)*100)));
						pa_learning.add(new Point(i*100,(int) ((1-countt1*1.0/testSize)*100)));
					}else{
						//System.out.println(((stat.get(i).getY() + count)/(exp+1)));
						stat.set(i-1, new Point(i, (int) ((stat.get(i-1).getY() + count))));
						stat1.set(i-1, new Point(i, (int) ((stat1.get(i-1).getY() + count1))));
						pt_test.set(i-1, new Point(i,(int) (pt_test.get(i-1).getY()+(1-count*1.0/testSize)*100)));
						ptAveg_test.set(i-1, new Point(i,(int) (ptAveg_test.get(i-1).getY()+(1-count2*1.0/testSize)*100)));
						pa_test.set(i-1, new Point(i,(int) (pa_test.get(i-1).getY()+(1-count1*1.0/testSize)*100)));
						
						pt_learning.set(i-1, new Point(i*100,(int) (pt_learning.get(i-1).getY()+(1-countt*1.0/testSize)*100)));
						ptAveg_learning.set(i-1, new Point(i*100,(int) (ptAveg_learning.get(i-1).getY()+(1-countt2*1.0/testSize)*100)));
						pa_learning.set(i-1, new Point(i*100,(int) (pa_learning.get(i-1).getY()+(1-countt1*1.0/testSize)*100)));
					}
					System.out.println("exp = "+ exp + ", iter = " + i + ", error(perceptron) = " + count);
					System.out.println("exp = "+ exp + ", iter = " + i + ", error1(passive-aggressive) = " + count1);
					System.out.println("exp = "+ exp + ", iter = " + i + ", error2(perceptron average) = " + count2);
					count = 0;
					count1 = 0;
					count2 = 0;
					countt = 0;
					countt1 = 0;
					countt2 = 0;
				}	
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(pt_train.size());
		showGraph(stat, "binaryPerceptron", "iter", "errors(aveg)",16000,18000);
		showGraph(stat1, "binaryPassiveAggressive", "iter", "errors(aveg)",16000,18000);
		showGraph(pt_train, "binaryPerceptron Accuracy(train)", "iter", "accuracy(%)",60,75);
		showGraph(pt_test, "binaryPerceptron Accuracy(test)", "iter", "accuracy(%)",60,75);
		showGraph(ptAveg_train, "binaryPerceptron average Accuracy(train)", "iter", "accuracy(%)",60,75);
		showGraph(ptAveg_test, "binaryPerceptron average Accuracy(test)", "iter", "accuracy(%)",60,75);
		showGraph(pa_train, "binaryPassiveAggressive Accuracy(train)", "iter", "accuracy(%)",60,75);
		showGraph(pa_test, "binaryPassiveAggressive Accuracy(test)", "iter", "accuracy(%)",60,75);
		showGraph(pt_learning, "binaryPerceptron learning curve", "sample size", "accuracy(%)",55,75);
		showGraph(pa_learning, "binaryPassive-Aggressive learning curve", "sample size", "accuracy(%)",55,75);
		showGraph(ptAveg_learning, "binaryPerceptron Averaged learning curve", "sample size", "accuracy(%)",55,75);
	}
	
	public static void multiClassifierTests(int iterations){
		ArrayList<Point> stat = new ArrayList<Point>();
		ArrayList<Point> stat1 = new ArrayList<Point>();
		
		ArrayList<Point> pt_train = new ArrayList<Point>();
		ArrayList<Point> pt_test = new ArrayList<Point>();
		ArrayList<Point> pa_train = new ArrayList<Point>();
		ArrayList<Point> pa_test = new ArrayList<Point>();
		ArrayList<Point> ptAveg_train = new ArrayList<Point>();
		ArrayList<Point> ptAveg_test = new ArrayList<Point>();
		
		ArrayList<Point> pa_learning = new ArrayList<Point>();
		ArrayList<Point> pt_learning = new ArrayList<Point>();
		ArrayList<Point> ptAveg_learning = new ArrayList<Point>();
		
		MulticlassClassifier bc = new MulticlassClassifier(26);
		try {
			int count = 0;
			int count1 = 0;
			int count2 = 0;
			int countt = 0;
			int countt1 = 0;
			int countt2 = 0;
			for(int exp = 0; exp < 10; exp++){
				Set<Pair<double[], Character>> data = 
						readFile1(String.format("OCRdata/ocr_fold%d_sm_train.txt",exp));
				Set<Pair<double[], Character>> data_test = 
						readFile1(String.format("OCRdata/ocr_fold%d_sm_test.txt",exp));
				ArrayList<Set<Pair<double[], Character>>> trainList = 
						readFile4(String.format("OCRdata/ocr_fold%d_sm_train.txt",exp));
			
				int dataSize = data.size();
				int testSize = data_test.size();					
				int[] errorPA;
				int[] errorPT;
				int[] errorPTaveg;
				ArrayList<List<double[]>> w2 = bc.perceptronAveg(data, iterations);
				errorPTaveg = bc.getErrorCount();
				
				ArrayList<List<double[]>> w1 = bc.passiveAggressive(data, iterations);
				errorPA = bc.getErrorCount();
				
				
				ArrayList<List<double[]>> w = bc.perceptron(data, iterations);
				errorPT = bc.getErrorCount();

				
				ArrayList<List<double[]>> ww2 = new ArrayList<List<double[]>>();
				ArrayList<List<double[]>> ww1 = new ArrayList<List<double[]>>();
				ArrayList<List<double[]>> ww = new ArrayList<List<double[]>>();
				
				/*  to do */
				System.out.println("get in");
				for(int index = 0; index < trainList.size(); index++){
					//System.out.println("get in");
					//System.out.println(trainList.get(index).size());
					System.out.println("get in " + index);
					ww.add(bc.perceptron(trainList.get(index), iterations).get(49));
					ww1.add(bc.passiveAggressive(trainList.get(index), iterations).get(49));
					ww2.add(bc.perceptronAveg(trainList.get(index), iterations).get(49));
					
				}
				System.out.println("get out");
				
				
				//Thread.sleep(100000);
				
				for(int i = 1; i <= iterations; i++ ){
					
					if(pt_train.size() < i){
						pt_train.add(new Point(i,(int) ((1-errorPT[i-1]*1.0/dataSize)*100)));
						//System.out.println((1-errorPT[i-1]*1.0/dataSize));
						pa_train.add(new Point(i,(int) ((1-errorPA[i-1]*1.0/dataSize)*100)));
						ptAveg_train.add(new Point(i-1,(int) ((1-errorPTaveg[i-1]*1.0/dataSize)*100)));
					}else{
						//System.out.println((int) ((stat.get(i-1).getY() + (1-errorPT[i-1]*1.0/dataSize)*100)));
						pt_train.set(i-1, new Point(i, (int) ((pt_train.get(i-1).getY() + (1-errorPT[i-1]*1.0/dataSize)*100))));
						ptAveg_train.set(i-1, new Point(i, (int) ((ptAveg_train.get(i-1).getY() + (1-errorPTaveg[i-1]*1.0/dataSize)*100))));
						pa_train.set(i-1, new Point(i, (int) ((pa_train.get(i-1).getY() + (1-errorPA[i-1]*1.0/dataSize)*100))));
					}
					//System.out.println(Arrays.toString(w.get(i-1).get(1)));
					for(Pair<double[], Character> sample : data_test){
						/*
						double rst = dotProduct(sample.getFirst(), w[i-1]);
						double rst1 = dotProduct(sample.getFirst(), w1[i-1]);
						double rst2 = dotProduct(sample.getFirst(), w2[i-1]);
						
						double rstt = dotProduct(sample.getFirst(), ww[i-1]);
						double rstt1 = dotProduct(sample.getFirst(), ww1[i-1]);
						double rstt2 = dotProduct(sample.getFirst(), ww2[i-1]);
						*/
						
						char rst = findHighestClass(w.get(i-1),sample.getFirst());
						char rst1 = findHighestClass(w1.get(i-1),sample.getFirst());
						char rst2 = findHighestClass(w2.get(i-1),sample.getFirst());
						
						char rstt = findHighestClass(ww.get(i-1),sample.getFirst());
						char rstt1 = findHighestClass(ww1.get(i-1),sample.getFirst());
						char rstt2 = findHighestClass(ww2.get(i-1),sample.getFirst());
						
						
						if(rst != sample.getSecond())
							count++;
						if(rst1 != sample.getSecond())
							count1++;
						
						if(rst2 != sample.getSecond())
							count2++;
						
						if(rstt != sample.getSecond())
							countt++;
						if(rstt1 != sample.getSecond())
							countt1++;
						
						if(rstt2 != sample.getSecond())
							countt2++;
						
						/*
						if(rst * sample.getSecond() <= 0)
							count++;
						if(rst1 * sample.getSecond() <= 0)
							count1++;
						if(rst2 * sample.getSecond() <= 0)
							count2++;
						
						if(rstt * sample.getSecond() <= 0)
							countt++;
						if(rstt1 * sample.getSecond() <= 0)
							countt1++;
						if(rstt2 * sample.getSecond() <= 0)
							countt2++;
							*/
					}
					
					
					if(stat.size() < i){
						stat.add(new Point(i,count));
						stat1.add(new Point(i,count1));
						//System.out.println((int)((1-count*1.0/testSize)*100));
						pt_test.add(new Point(i,(int) ((1-count*1.0/testSize)*100)));
						ptAveg_test.add(new Point(i,(int) ((1-count2*1.0/testSize)*100)));
						pa_test.add(new Point(i,(int) ((1-count1*1.0/testSize)*100)));
						
						pt_learning.add(new Point(i*100,(int) ((1-countt*1.0/testSize)*100)));
						ptAveg_learning.add(new Point(i*100,(int) ((1-countt2*1.0/testSize)*100)));
						pa_learning.add(new Point(i*100,(int) ((1-countt1*1.0/testSize)*100)));
					}else{
						//System.out.println(((stat.get(i).getY() + count)/(exp+1)));
						stat.set(i-1, new Point(i, (int) ((stat.get(i-1).getY() + count))));
						stat1.set(i-1, new Point(i, (int) ((stat1.get(i-1).getY() + count1))));
						pt_test.set(i-1, new Point(i,(int) (pt_test.get(i-1).getY()+(1-count*1.0/testSize)*100)));
						ptAveg_test.set(i-1, new Point(i,(int) (ptAveg_test.get(i-1).getY()+(1-count2*1.0/testSize)*100)));
						pa_test.set(i-1, new Point(i,(int) (pa_test.get(i-1).getY()+(1-count1*1.0/testSize)*100)));
						
						pt_learning.set(i-1, new Point(i*100,(int) (pt_learning.get(i-1).getY()+(1-countt*1.0/testSize)*100)));
						ptAveg_learning.set(i-1, new Point(i*100,(int) (ptAveg_learning.get(i-1).getY()+(1-countt2*1.0/testSize)*100)));
						pa_learning.set(i-1, new Point(i*100,(int) (pa_learning.get(i-1).getY()+(1-countt1*1.0/testSize)*100)));
					}
					System.out.println("exp = "+ exp + ", iter = " + i + ", error(perceptron) = " + count);
					System.out.println("exp = "+ exp + ", iter = " + i + ", error1(passive-aggressive) = " + count1);
					System.out.println("exp = "+ exp + ", iter = " + i + ", error2(perceptron average) = " + count2);
					count = 0;
					count1 = 0;
					count2 = 0;
					countt = 0;
					countt1 = 0;
					countt2 = 0;
				}	
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(pt_train.size());
		showGraph(stat, "Multi-Perceptron", "iter", "errors(aveg)",18000,22000);
		showGraph(stat1, "Multi-PassiveAggressive", "iter", "errors(aveg)",18000,22000);
		showGraph(pt_train, "Multi-Perceptron Accuracy(train)", "iter", "accuracy(%)",55,70);
		showGraph(pt_test, "Multi-Perceptron Accuracy(test)", "iter", "accuracy(%)",55,70);
		showGraph(ptAveg_train, "Multi-Perceptron average Accuracy(train)", "iter", "accuracy(%)",55,70);
		showGraph(ptAveg_test, "Multi-Perceptron average Accuracy(test)", "iter", "accuracy(%)",55,70);
		showGraph(pa_train, "Multi-PassiveAggressive Accuracy(train)", "iter", "accuracy(%)",55,70);
		showGraph(pa_test, "Multi-PassiveAggressive Accuracy(test)", "iter", "accuracy(%)",55,70);
		showGraph(pt_learning, "Multi-Perceptron learning curve", "sample size", "accuracy(%)",25,105);
		showGraph(pa_learning, "Multi-Passive-Aggressive learning curve", "sample size", "accuracy(%)",25,105);
		showGraph(ptAveg_learning, "Multi-Perceptron Averaged learning curve", "sample size", "accuracy(%)",25,105);
	}
	/*
	public static void multiClassifierTest(int iterations){
		ArrayList<Point> stat = new ArrayList<Point>();
		ArrayList<Point> stat1 = new ArrayList<Point>();
		MulticlassClassifier bc = new MulticlassClassifier(26);
		try {
			int count = 0;
			int count1 = 0;
			for(int exp = 0; exp < 10; exp++){
				Set<Pair<double[], Character>> data = readFile1("OCRdata/ocr_fold0_sm_train.txt");
				Set<Pair<double[], Character>> data_test = readFile1("OCRdata/ocr_fold0_sm_test.txt");
				for(int i = 1 ; i <= iterations; i++){
					//ArrayList<double[]> w1 = bc.perceptronAveg(data, i);
					ArrayList<double[]> w1 = bc.passiveAggressive(data, i);
					ArrayList<double[]> w = bc.perceptron(data, i);
					//System.out.println(Arrays.toString(w));
					//System.out.println(Arrays.toString(w1));
					//System.out.println(Arrays.toString(w2));
					
					//System.out.println("data size: " + data_test.size());
					for(Pair<double[], Character> sample : data_test){
						
						char p = findHighestClass(w,sample.getFirst());
						char p1 = findHighestClass(w1,sample.getFirst());
						if(p != sample.getSecond())
							count++;
						if(p1 != sample.getSecond())
							count1++;
					}
					//System.out.println("Iter : " + i + " --- error : " + count);
					if(stat.size() < i){
						stat.add(i-1, new Point(i,count));
						stat1.add(i-1, new Point(i,count1));
					}else{
						stat.set(i-1, new Point(i, (int) ((stat.get(i-1).getY() + count)/(i+1))));
						stat1.set(i-1, new Point(i, (int) ((stat.get(i-1).getY() + count)/(i+1))));
					}
					//System.out.println(count1);
					count = 0;
					count1 = 0;
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//showGraph(stat, "MultiClassPerceptron", "iter", "errors(aveg)");
		//showGraph(stat1, "MultiClassPassiveAggressive", "iter", "errors(aveg)");
	}
	*/
	private static char findHighestClass(List<double[]> weight, 
			double[] dataFeature){
		double max = 0;
		int choice = 0; 
		for(int i = 0; i < 26; i++){
			double cur = dotProduct(weight.get(i), dataFeature);
			if(cur >= max){
				max = cur;
				choice = i;
			}
		}
		return (char) (choice+'a');
	}
	
	private static double dotProduct(double[] a, double[] b){
		double rst = 0.0;
		for(int i = 0; i < a.length; i++)
			rst += (a[i]*b[i]);
		return rst;
	}
	
	private static Set<Pair<double[], Integer>> readFile(String fname) throws IOException {
		FileInputStream fis = new FileInputStream(new File(fname));
		Set<Character> set = new HashSet<Character>(Arrays.asList('a','e','i','o','u'));
		//Construct BufferedReader from InputStreamReader
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		Set<Pair<double[], Integer>> data = new HashSet<Pair<double[], Integer>>();
		String line = null;
		while ((line = br.readLine()) != null) {
			if(!line.matches("\\s*")){
				String[] buf = line.split("\\s+");
				
				double[] dataFeature = new double[128];
				int actual;
				//System.out.println(buf[0]);
				String feature = buf[1].substring(2);
				for(int i = 0; i < feature.length(); i++){
					dataFeature[i] = feature.charAt(i)-'0';
					//System.out.print(dataFeature[i] + " + ");
				}
				//System.out.println(buf[2]);
				actual = (set.contains(buf[2].charAt(0)))? 1 : -1;
				data.add(new Pair<double[], Integer>(dataFeature, actual));
				//sample = new Pair<double[], Integer>(dataFeature, actual);
				//System.out.println(buf[2].charAt(0)+ " : "+actual);
			}
			//break;
		}
	 
		br.close();
		return data;
	}
	
	private static ArrayList<Set<Pair<double[], Character>>> readFile4(String fname) throws IOException {
		//FileInputStream fis = new FileInputStream(new File(fname));
		//Set<Character> set = new HashSet<Character>(Arrays.asList('a','e','i','o','u'));
		//Construct BufferedReader from InputStreamReader
		//BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		ArrayList<Set<Pair<double[], Character>>> data = new ArrayList<Set<Pair<double[], Character>>>();
		String line = null;
		System.out.println("get in");
		for(int j = 1; j <= 50; j++){
			int count = 0;
			FileInputStream fis = new FileInputStream(new File(fname));
			BufferedReader br = new BufferedReader(new InputStreamReader(fis));
			Set<Pair<double[], Character>> tmp = new HashSet<Pair<double[], Character>>();
			while (count < 100*j && (line = br.readLine()) != null) {
				if(!line.matches("\\s*")){
					String[] buf = line.split("\\s+");
					
					double[] dataFeature = new double[128];
					char actual;
					//System.out.println(buf[0]);
					String feature = buf[1].substring(2);
					for(int i = 0; i < feature.length(); i++){
						dataFeature[i] = feature.charAt(i)-'0';
						//System.out.print(dataFeature[i] + " + ");
					}
					//System.out.println(buf[2]);
					actual = buf[2].charAt(0);
					tmp.add(new Pair<double[], Character>(dataFeature, actual));
					//sample = new Pair<double[], Integer>(dataFeature, actual);
					//System.out.println(buf[2].charAt(0)+ " : "+actual);
					count++;
				}
				//break;
				
			}
			data.add(tmp);
			br.close();
		}
		System.out.println("get out");
		return data;
	}
	
	private static ArrayList<Set<Pair<double[], Integer>>> readFile3(String fname) throws IOException {
		//FileInputStream fis = new FileInputStream(new File(fname));
		Set<Character> set = new HashSet<Character>(Arrays.asList('a','e','i','o','u'));
		//Construct BufferedReader from InputStreamReader
		//BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		ArrayList<Set<Pair<double[], Integer>>> data = new ArrayList<Set<Pair<double[], Integer>>>();
		String line = null;
		
		for(int j = 1; j <= 50; j++){
			int count = 0;
			FileInputStream fis = new FileInputStream(new File(fname));
			BufferedReader br = new BufferedReader(new InputStreamReader(fis));
			Set<Pair<double[], Integer>> tmp = new HashSet<Pair<double[], Integer>>();
			while (count < 100*j && (line = br.readLine()) != null) {
				if(!line.matches("\\s*")){
					String[] buf = line.split("\\s+");
					
					double[] dataFeature = new double[128];
					int actual;
					//System.out.println(buf[0]);
					String feature = buf[1].substring(2);
					for(int i = 0; i < feature.length(); i++){
						dataFeature[i] = feature.charAt(i)-'0';
						//System.out.print(dataFeature[i] + " + ");
					}
					//System.out.println(buf[2]);
					actual = (set.contains(buf[2].charAt(0)))? 1 : -1;
					tmp.add(new Pair<double[], Integer>(dataFeature, actual));
					//sample = new Pair<double[], Integer>(dataFeature, actual);
					//System.out.println(buf[2].charAt(0)+ " : "+actual);
					count++;
				}
				//break;
				
			}
			data.add(tmp);
			br.close();
		}
	 
		
		return data;
	}
	
	
	private static Set<Pair<double[], Character>> readFile1(String fname) throws IOException {
		FileInputStream fis = new FileInputStream(new File(fname));
		//Set<Character> set = new HashSet<Character>(Arrays.asList('a','e','i','o','u'));
		//Construct BufferedReader from InputStreamReader
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		Set<Pair<double[], Character>> data = new HashSet<Pair<double[], Character>>();
		String line = null;
		while ((line = br.readLine()) != null) {
			if(!line.matches("\\s*")){
				String[] buf = line.split("\\s+");
				
				double[] dataFeature = new double[128];
				char actual;
				//System.out.println(buf[0]);
				String feature = buf[1].substring(2);
				for(int i = 0; i < feature.length(); i++){
					dataFeature[i] = feature.charAt(i)-'0';
					//System.out.print(dataFeature[i] + " + ");
				}
				//System.out.println(buf[2]);
				actual = buf[2].charAt(0);
				data.add(new Pair<double[], Character>(dataFeature, actual));
				//sample = new Pair<double[], Integer>(dataFeature, actual);
				//System.out.println(buf[2].charAt(0)+ " : "+actual);
			}
			//break;
		}
	 
		br.close();
		return data;
	}
	
	public static void showGraph(ArrayList<Point> data, String title, String xAxisTag, String yAxisTag, int lower, int upper){
		JFrame f = new JFrame();
		JPanel panel = new JPanel();
        XYSeries series = new XYSeries("MyGraph");
        for(Point p : data)
        	series.add(p.getX(), p.getY()/10);

        XYSeriesCollection dataset = new XYSeriesCollection();
        dataset.addSeries(series);

        JFreeChart chart = ChartFactory.createXYLineChart(
                title,
                xAxisTag,
                yAxisTag,
                dataset, 
                PlotOrientation.VERTICAL,
                true,
                true,
                false
                );
        chart.getXYPlot().getRangeAxis().setRange(lower,upper);
        chart.getXYPlot().setRenderer(new XYSplineRenderer());
        ChartPanel chartPanel = new ChartPanel(chart);


        panel.add(chartPanel);
        
        f.add(panel);
        f.pack();
        f.setVisible(true);
	}

}
