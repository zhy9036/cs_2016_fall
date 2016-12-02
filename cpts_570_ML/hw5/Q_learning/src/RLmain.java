
public class RLmain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Qagent qa = new Qagent();
		double preQ = 1.0;
		double curQ = qa.qvalues[5][5][1];
		int count = 0;
		int count2 = 0;
		//for(int i = 0; i < 36000; i++){
		while(curQ < 0.5){
			count++;
			//qa.boltzmannAct();
			qa.act();
			if(curQ != preQ){
				//System.out.println(curQ);
				preQ = curQ;
			}
			curQ = qa.qvalues[5][5][1];
		}
		System.out.println(count + " " + qa.qvalues[5][5][1]);
		/*
		while(qa.qvalues[0][0][2] < 0.0000001){
			count++;
			if(qa.act()){
				count2++;
				preQ = curQ;
				curQ = qa.qvalues[5][5][0];
				
			}
		}
		System.out.println(count2);
		System.out.println(count);
		System.out.println(qa.qvalues[4][1][1]);
		*/
		
		for(int i = 0; i < 10; i++){
			for(int j = 0; j < 10; j++){
				for(int k = 0; k < 4; k++)
					System.out.println("state(" + i + "," + j + "," + k + "): Qvalue = " + qa.qvalues[i][j][k]);
			}
		}
		
	}
}
