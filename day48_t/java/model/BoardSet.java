package model;

import java.util.ArrayList;

public class BoardSet {
	private BoardVO board; // 1
	private ArrayList<ReplyVO> rdatas; // N

	public BoardVO getBoard() {
		return board;
	}
	public void setBoard(BoardVO board) {
		this.board = board;
	}
	public ArrayList<ReplyVO> getRdatas() {
		return rdatas;
	}
	public void setRdatas(ArrayList<ReplyVO> rdatas) {
		this.rdatas = rdatas;
	}
}
