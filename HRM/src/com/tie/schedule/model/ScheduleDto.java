package com.tie.schedule.model;

public class ScheduleDto {
	private int scheduleSeq;
	private String scheduleCk;
	private String scheduleTitle;
	private String scheduleStart;
	private String scheduleEnd;
	private String scheduleLocation;
	private String scheduleContents;
	private int empId;
	
	public ScheduleDto(){}

	public int getScheduleSeq() {
		return scheduleSeq;
	}

	public void setScheduleSeq(int scheduleSeq) {
		this.scheduleSeq = scheduleSeq;
	}

	public String getScheduleCk() {
		return scheduleCk;
	}

	public void setScheduleCk(String scheduleCk) {
		this.scheduleCk = scheduleCk;
	}

	public String getScheduleTitle() {
		return scheduleTitle;
	}

	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}

	public String getScheduleStart() {
		return scheduleStart;
	}

	public void setScheduleStart(String scheduleStart) {
		this.scheduleStart = scheduleStart;
	}

	public String getScheduleEnd() {
		return scheduleEnd;
	}

	public void setScheduleEnd(String scheduleEnd) {
		this.scheduleEnd = scheduleEnd;
	}

	public String getScheduleLocation() {
		return scheduleLocation;
	}

	public void setScheduleLocation(String scheduleLocation) {
		this.scheduleLocation = scheduleLocation;
	}

	public String getScheduleContents() {
		return scheduleContents;
	}

	public void setScheduleContents(String scheduleContents) {
		this.scheduleContents = scheduleContents;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

}
