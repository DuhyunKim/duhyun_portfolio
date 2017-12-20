package com.tie.board.model;

public class BoardDto {
	private int bbsSeq;
	private String bbsDate;
	private String bbsVc;
	private String bbsEname;
	private String bbsTitle;
	private String bbsContent;
	private int empId;
	private int commentCount;
	
	public int getBbsSeq() {
		return bbsSeq;
	}
	public void setBbsSeq(int bbsSeq) {
		this.bbsSeq = bbsSeq;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsVc() {
		return bbsVc;
	}
	public void setBbsVc(String bbsVc) {
		this.bbsVc = bbsVc;
	}
	public String getBbsEname() {
		return bbsEname;
	}
	public void setBbsEname(String bbsEname) {
		this.bbsEname = bbsEname;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
}
