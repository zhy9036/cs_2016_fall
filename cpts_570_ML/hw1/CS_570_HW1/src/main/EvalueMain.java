package main;

import java.awt.Point;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
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

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//showGraph();
		binaryClassifierTest(10);	
		//multiClassifierTest(50);
	}
	

	
	public static void binaryClassifierTest(int iterations){
		ArrayList<Point> stat = new ArrayList<Point>();
		ArrayList<Point> stat1 = new ArrayList<Point>();
		ArrayList<Point> pt_train = new ArrayList<Point>();
		ArrayList<Point> pt_test = new ArrayList<Point>();
		ArrayList<Point> pa_train = new ArrayList<Point>();
		ArrayList<Point> pa_test = new ArrayList<Point>();
		
		BinaryClassifier bc = new BinaryClassifier();
		try {
			int count = 0;
			int count1 = 0;
			for(int exp = 0; exp < 10; exp++){
				Set<Pair<double[], Integer>> data = 
						readFile(String.format("OCRdata/ocr_fold%d_sm_train.txt",exp));
				Set<Pair<double[], Integer>> data_test = 
						readFile(String.format("OCRdata/ocr_fold%d_sm_test.txt",exp));
				int dataSize = data.size();
				int testSize = data_test.size();					
				int[] errorPA;
				int[] errorPT;
				//double[] w1 = bc.perceptronAveg(data, i);
				double[][] w1 = bc.passiveAggressive(data, 50);
				errorPA = bc.getErrorCount();
				double[][] w = bc.perceptron(data, 50);
				errorPT = bc.getErrorCount();
				//System.out.println(Arrays.toString(w[0]));
				//System.out.println(Arrays.toString(w[1]));
				
				for(int i = 1; i <= 50; i++ ){
					
					if(pt_train.size() < i){
						pt_train.add(new Point(i-1,(int) ((1-errorPT[i-1]*1.0/dataSize)*100)));
						System.out.println((1-errorPT[i-1]*1.0/dataSize));
						pa_train.add(new Point(i-1,(int) ((1-errorPA[i-1]*1.0/dataSize)*100)));
					}else{
						//System.out.println((int) ((stat.get(i-1).getY() + (1-errorPT[i-1]*1.0/dataSize)*100)));
						pt_train.set(i-1, new Point(i, (int) ((pt_train.get(i-1).getY() + (1-errorPT[i-1]*1.0/dataSize)*100))));
						pa_train.set(i-1, new Point(i, (int) ((pa_train.get(i-1).getY() + (1-errorPA[i-1]*1.0/dataSize)*100))));
					}
				//System.out.println("data size: " + data_test.size());
					for(Pair<double[], Integer> sample : data_test){
						double rst = dotProduct(sample.getFirst(), w[i-1]);
						double rst1 = dotProduct(sample.getFirst(), w1[i-1]);
						if(rst * sample.getSecond() <= 0)
							count++;
						if(rst1 * sample.getSecond() <= 0)
							count1++;
					}
					//System.out.println("Iter : " + i + " --- error : " + count);
					//System.out.println(stat.size());
					
					if(stat.size() < i){
						stat.add(new Point(i,count));
						stat1.add(new Point(i,count1));
						//System.out.println((int)((1-count*1.0/testSize)*100));
						pt_test.add(new Point(i,(int) ((1-count*1.0/testSize)*100)));
						pa_test.add(new Point(i,(int) ((1-count1*1.0/testSize)*100)));
					}else{
						//System.out.println(((stat.get(i).getY() + count)/(exp+1)));
						stat.set(i-1, new Point(i, (int) ((stat.get(i-1).getY() + count))));
						stat1.set(i-1, new Point(i, (int) ((stat1.get(i-1).getY() + count1))));
						pt_test.set(i-1, new Point(i,(int) (pt_test.get(i-1).getY()+(1-count*1.0/testSize)*100)));
						pa_test.set(i-1, new Point(i,(int) (pt_test.get(i-1).getY()+(1-count1*1.0/testSize)*100)));
					}
					System.out.println("exp = "+ exp + ", iter = " + i + ", error = " + count);
					System.out.println("exp = "+ exp + ", iter = " + i + ", error1 = " + count1);
					count = 0;
					count1 = 0;
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
		showGraph(pa_train, "binaryPassiveAggressive Accuracy(train)", "iter", "accuracy(%)",60,75);
		showGraph(pa_test, "binaryPassiveAggressive Accuracy(test)", "iter", "accuracy(%)",60,75);
	}
	
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
	
	private static char findHighestClass(ArrayList<double[]> weight, 
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
