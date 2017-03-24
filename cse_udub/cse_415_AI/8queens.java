/* 8 queens */

public void solver(int size){
	boolean[][] board = new boolean[size][size];
	for(int i = 0; i<size; i++) 
		for (int j = 0; j<size; j++) board[i][j] = false;
	if (solveIt(board, 0) {
		//foundSolution, print board
	}
}

private boolean solveIt(boolean[][] board, int col){
	if (col == board.size()){
		return true;
	}else{
		int row = 0;
		boolean valid = false;
		while ((row < board.size()) && !valid){
			if(validMove(row, col, board)){
				board[row][col] = true;
				valid = solveIt(board,col+1);
				if(!valid){
					board[row][col] = false;
					row++;
				}
			}else{
				row++;
			}
		}
		return valid;
	}
}

private boolean validMove(int row, int col, boolean[][] board){
	//check horizontal
	for(int i = 0; i<col; i++){
		if(board[row][i]) return false;
	}

	//check diagonal
	for(int i=0; i<=col; i++){
		//left upper
		if(row >= i){
			if(board[row-i][col-i]) return false;
		}

		//left lower
		if(row + i < size){
			if(board[row+i][col-i]) return false;
		}

	}
	return true;
}