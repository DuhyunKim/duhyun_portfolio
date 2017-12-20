package com.tie.basic.model;

public class EmpFileDto {
	private int empId;
	private String faceOriginal;
	private String faceSaveName;
	private String degreeOriginal;
	private String degreeSaveName;
	private String joinOriginal;
	private String joinSaveName;
	private String saveFolder;
	
	
	
	@Override
	public String toString() {
		return "EmpFileDto [empId=" + empId + ", faceOriginal=" + faceOriginal + ", faceSaveName=" + faceSaveName
				+ ", degreeOriginal=" + degreeOriginal + ", degreeSaveName=" + degreeSaveName + ", joinOriginal="
				+ joinOriginal + ", joinSaveName=" + joinSaveName + ", saveFolder=" + saveFolder + "]";
	}
	
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getFaceOriginal() {
		return faceOriginal;
	}
	public void setFaceOriginal(String faceOriginal) {
		this.faceOriginal = faceOriginal;
	}
	public String getFaceSaveName() {
		return faceSaveName;
	}
	public void setFaceSaveName(String faceSaveName) {
		this.faceSaveName = faceSaveName;
	}
	public String getDegreeOriginal() {
		return degreeOriginal;
	}
	public void setDegreeOriginal(String degreeOriginal) {
		this.degreeOriginal = degreeOriginal;
	}
	public String getDegreeSaveName() {
		return degreeSaveName;
	}
	public void setDegreeSaveName(String degreeSaveName) {
		this.degreeSaveName = degreeSaveName;
	}
	public String getJoinOriginal() {
		return joinOriginal;
	}
	public void setJoinOriginal(String joinOriginal) {
		this.joinOriginal = joinOriginal;
	}
	public String getJoinSaveName() {
		return joinSaveName;
	}
	public void setJoinSaveName(String joinSaveName) {
		this.joinSaveName = joinSaveName;
	}
	public String getSaveFolder() {
		return saveFolder;
	}
	public void setSaveFolder(String saveFolder) {
		this.saveFolder = saveFolder;
	}
	
	
	
}
