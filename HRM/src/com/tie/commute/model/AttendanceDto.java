package com.tie.commute.model;

public class AttendanceDto {

	int attendSeq;
	String attendStart;
	String attendEnd;
	String attendGo;
	String attendLeave;
	int empId;
	
	public int getAttendSeq() {
		return attendSeq;
	}
	public void setAttendSeq(int attendSeq) {
		this.attendSeq = attendSeq;
	}
	public String getAttendStart() {
		return attendStart;
	}
	public void setAttendStart(String attendStart) {
		this.attendStart = attendStart;
	}
	public String getAttendEnd() {
		return attendEnd;
	}
	public void setAttendEnd(String attendEnd) {
		this.attendEnd = attendEnd;
	}
	public String getAttendGo() {
		return attendGo;
	}
	public void setAttendGo(String attendGo) {
		this.attendGo = attendGo;
	}
	public String getAttendLeave() {
		return attendLeave;
	}
	public void setAttendLeave(String attendLeave) {
		this.attendLeave = attendLeave;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	
}
