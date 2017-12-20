package com.tie.license.model;

public class LicenseDto {
	private String certifiNum;  		
	private String rightName;			
	private String rightInstitution;	
	private String rightObtain;			
	private String rightEnd;			
	private String rightUpdate;			
	private String rightErasure;		
	private String erasureContent;		
	private String rightImage;			
	private String rightSaveName;		
	private String saveFolder;
	private String empId;					
	

	
	
	
	@Override
	public String toString() {
		return "LicenseDto [certifiNum=" + certifiNum + ", rightName=" + rightName + ", rightInstitution="
				+ rightInstitution + ", rightObtain=" + rightObtain + ", rightEnd=" + rightEnd + ", rightUpdate="
				+ rightUpdate + ", rightErasure=" + rightErasure + ", erasureContent=" + erasureContent
				+ ", rightImage=" + rightImage + ", rightSaveName=" + rightSaveName + ", saveFolder=" + saveFolder
				+ ", empId=" + empId + "]";
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getSaveFolder() {
		return saveFolder;
	}
	public void setSaveFolder(String saveFolder) {
		this.saveFolder = saveFolder;
	}
	
	public String getCertifiNum() {
		return certifiNum;
	}
	public void setCertifiNum(String certifiNum) {
		this.certifiNum = certifiNum;
	}
	public String getRightName() {
		return rightName;
	}
	public void setRightName(String rightName) {
		this.rightName = rightName;
	}
	public String getRightInstitution() {
		return rightInstitution;
	}
	public void setRightInstitution(String rightInstitution) {
		this.rightInstitution = rightInstitution;
	}
	public String getRightObtain() {
		return rightObtain;
	}
	public void setRightObtain(String rightObtain) {
		this.rightObtain = rightObtain;
	}
	public String getRightEnd() {
		return rightEnd;
	}
	public void setRightEnd(String rightEnd) {
		this.rightEnd = rightEnd;
	}
	public String getRightUpdate() {
		return rightUpdate;
	}
	public void setRightUpdate(String rightUpdate) {
		this.rightUpdate = rightUpdate;
	}
	public String getRightErasure() {
		return rightErasure;
	}
	public void setRightErasure(String rightErasure) {
		this.rightErasure = rightErasure;
	}
	public String getErasureContent() {
		return erasureContent;
	}
	public void setErasureContent(String erasureContent) {
		this.erasureContent = erasureContent;
	}
	public String getRightImage() {
		return rightImage;
	}
	public void setRightImage(String rightImage) {
		this.rightImage = rightImage;
	}
	public String getRightSaveName() {
		return rightSaveName;
	}
	public void setRightSaveName(String rightSaveName) {
		this.rightSaveName = rightSaveName;
	}
	
	
	
}
