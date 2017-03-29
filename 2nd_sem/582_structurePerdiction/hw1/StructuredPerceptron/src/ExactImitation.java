import java.util.ArrayList;

public class ExactImitation {
	ArrayList<ArrayList<ArrayList<Integer>>> states;
	ArrayList<String> labels;
	
	public ExactImitation(ArrayList<ArrayList<ArrayList<Integer>>> data, 
			ArrayList<String> sLabels){
		
		states = new ArrayList();
		labels = new ArrayList();
		
		for(int i = 0; i < data.size(); i++){
			ArrayList<ArrayList<Integer>> sample = data.get(i);
			String sampleLabel = sLabels.get(i);
			ArrayList<ArrayList<Integer>> tmpSample = new ArrayList();
			String tmpLabel = "";
			for(int t = 0; t < sample.size(); t++){
				tmpSample.add(sample.get(t));
				tmpLabel += sampleLabel.charAt(t);
				states.add((ArrayList<ArrayList<Integer>>) tmpSample.clone());
				labels.add(tmpLabel);
			}
		}
		
	}
	
	public StructuredPerceptronBeam train(){
		StructuredPerceptronBeam spb = new StructuredPerceptronBeam(128, 26, 50, 0.01);
		spb.training(states, labels, 5, 2, 
					StructuredPerceptronBeam.UpdateMode.MaxViolationUpdate, 
					StructuredPerceptronBeam.SearchMode.BestFirst);
		return spb;
	}
	
}
