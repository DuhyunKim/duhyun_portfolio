package com.tie.work.model;

public class WorkDto{
	private int workSeq;
	private String workDate;
	private String workAssessor;
	private String workStatus;
	private String workGoal;
	private int empId;
	private String workYear;

	public int getWorkSeq() {
		return workSeq;
	}
	public void setWorkSeq(int workSeq) {
		this.workSeq = workSeq;
	}
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public String getWorkAssessor() {
		return workAssessor;
	}
	public void setWorkAssessor(String workAssessor) {
		this.workAssessor = workAssessor;
	}
	public String getWorkStatus() {
		return workStatus;
	}
	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}
	public String getWorkGoal() {
		return workGoal;
	}
	public void setWorkGoal(String workGoal) {
		this.workGoal = workGoal;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getWorkYear() {
		return workYear;
	}
	public void setWorkYear(String workYear) {
		this.workYear = workYear;
	}


}
