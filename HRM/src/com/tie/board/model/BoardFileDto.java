package com.tie.board.model;

public class BoardFileDto {
	private int boardFileNum;
	private int bbsSeq;
	private String boardFileName;
	private String boardFileRename;
	private String boardFileLocation;
	
	public int getBoardFileNum() {
		return boardFileNum;
	}
	public void setBoardFileNum(int boardFileNum) {
		this.boardFileNum = boardFileNum;
	}
	public int getBbsSeq() {
		return bbsSeq;
	}
	public void setBbsSeq(int bbsSeq) {
		this.bbsSeq = bbsSeq;
	}
	public String getBoardFileName() {
		return boardFileName;
	}
	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}
	public String getBoardFileRename() {
		return boardFileRename;
	}
	public void setBoardFileRename(String boardFileRename) {
		this.boardFileRename = boardFileRename;
	}
	public String getBoardFileLocation() {
		return boardFileLocation;
	}
	public void setBoardFileLocation(String boardFileLocation) {
		this.boardFileLocation = boardFileLocation;
	}
	
	
}
