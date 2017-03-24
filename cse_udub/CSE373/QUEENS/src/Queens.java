
public class Queens {
	private int size;
	private boolean[][] board;
	
	public Queens(int size){
		this.size=size;
		board = new boolean[size][size];
		for(int i =0;i<size;i++){
			for(int j =0;j<size;j++){
				board[i][j]=false;
			}
		}
	}
	private boolean makeMove(int col){
		int row;
		if(col == size){
			return true;
		}else{
			boolean possible = false;
			row = 0;
			while((row<size) && !possible){
				if(ban(row, col)){
					row++;
				}else{
					board[row][col] = true;
					possible=makeMove(col+1);
					if(!possible){
						board[row][col] = false;
						row++;
					}
				}
				
			}
			return possible;
		}
	}
	private boolean ban(int row, int col){
		//check horizontal direction
		for(int i=0; i<col;i++){
			if(board[row][i]){
				return true;
			}
		}
		//check diagonal
		for(int i=0;i<=col;i++){
			if(!(row<i)){
				if(board[row-i][col-i]){
					return true;
				}
			}
			if(!(row+i>=size)){
				if(board[row+i][col-i]){
					return true;
				}
			}
		}
		return false;
	}
	public void solve(){
		if(makeMove(0)){
			print();
		}else{
			System.out.println("No Solution Found");
			print();
		}
	}
	private void print(){
		System.out.println("Board Size: "+size+" x "+size);
		for(int i=0; i<size; i++){
			for(int j=0; j<size; j++){
				if(board[i][j]){
					if(j<10){
						System.out.print("0"+j);
					}else{
						System.out.print(j);
					}
				}else{
					System.out.print("[]");
				}
			}
			System.out.println();
		}
	}
}
