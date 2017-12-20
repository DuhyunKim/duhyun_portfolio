package com.tie.appoint.model;

import com.tie.basic.model.EmployeesDto;

public class PersonnalDto {
	private int personnalSeq;
	private int empId;
	private String personnalDate;
	private String personnalUnusual;
	private String appointId;

	public int getPersonnalSeq() {
		return personnalSeq;
	}

	public void setPersonnalSeq(int personnalSeq) {
		this.personnalSeq = personnalSeq;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getPersonnalDate() {
		return personnalDate;
	}

	public void setPersonnalDate(String personnalDate) {
		this.personnalDate = personnalDate;
	}

	public String getPersonnalUnusual() {
		return personnalUnusual;
	}

	public void setPersonnalUnusual(String personnalUnusual) {
		this.personnalUnusual = personnalUnusual;
	}

	public String getAppointId() {
		return appointId;
	}

	public void setAppointId(String appointId) {
		this.appointId = appointId;
	}

}
