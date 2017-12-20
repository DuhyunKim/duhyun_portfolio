package com.tie.appoint.model;

public class AppointsDto {
	private int appointId;
	private String appointName;

	public int getAppointId() {
		return appointId;
	}

	public void setAppointId(int appointId) {
		this.appointId = appointId;
	}

	public String getAppointName() {
		return appointName;
	}

	public void setAppointName(String appointName) {
		this.appointName = appointName;
		
	}

	@Override
	public String toString() {
		return "AppointsDto [appointId=" + appointId + ", appointName=" + appointName + "]";
	}

	
}
