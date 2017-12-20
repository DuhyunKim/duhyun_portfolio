package com.tie.basic.model;

public class EmployeesDto {
	private int empId;
	private String empPw;
	private String empName;
	private int deptId;
	private int jobId;
	private String empRegNumber1;
	private String empRegNumber2;
	private String empExtention1;
	private String empExtention2;
	private String empExtention3;
	private String empPhone1;
	private String empPhone2;
	private String empPhone3;
	private String empEmail1;
	private String empEmail2;
	private String empBirth;
	private String empFinalEdu;
	private String empHireDate;
	private int hireId;
	private String empDetail;
	private int appointId;
	private int anniId;
	private String empDeptName;
	private String empDeptHighName;
	private String empJobName;
	private String EmpHireName;
	private int careerDate;
	private String zipNo;		//�����ȣ
	private String roadAddrPart1; //���θ��ּ�
	private String jibunAddr; 	//�����ּ�
	private String addrDetail;	//���ּ�
	
	
	
	
	@Override
	public String toString() {
		return "EmployeesDto [empId=" + empId + ", empPw=" + empPw + ", empName=" + empName + ", deptId=" + deptId
				+ ", jobId=" + jobId + ", empRegNumber1=" + empRegNumber1 + ", empRegNumber2=" + empRegNumber2
				+ ", empExtention1=" + empExtention1 + ", empExtention2=" + empExtention2 + ", empExtention3="
				+ empExtention3 + ", empPhone1=" + empPhone1 + ", empPhone2=" + empPhone2 + ", empPhone3=" + empPhone3
				+ ", empEmail1=" + empEmail1 + ", empEmail2=" + empEmail2 + ", empBirth=" + empBirth + ", empFinalEdu="
				+ empFinalEdu + ", empHireDate=" + empHireDate + ", hireId=" + hireId + ", empDetail=" + empDetail
				+ ", appointId=" + appointId + ", anniId=" + anniId + ", empDeptName=" + empDeptName
				+ ", empDeptHighName=" + empDeptHighName + ", empJobName=" + empJobName + ", EmpHireName=" + EmpHireName
				+ ", careerDate=" + careerDate + ", zipNo=" + zipNo + ", roadAddrPart1=" + roadAddrPart1
				+ ", jibunAddr=" + jibunAddr + ", addrDetail=" + addrDetail + "]";
	}
	public String getRoadAddrPart1() {
		return roadAddrPart1;
	}
	public void setRoadAddrPart1(String roadAddrPart1) {
		this.roadAddrPart1 = roadAddrPart1;
	}
	public String getZipNo() {
		return zipNo;
	}
	public void setZipNo(String zipNo) {
		this.zipNo = zipNo;
	}
	
	public String getJibunAddr() {
		return jibunAddr;
	}
	public void setJibunAddr(String jibunAddr) {
		this.jibunAddr = jibunAddr;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpPw() {
		return empPw;
	}
	public void setEmpPw(String empPw) {
		this.empPw = empPw;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public String getEmpRegNumber1() {
		return empRegNumber1;
	}
	public void setEmpRegNumber1(String empRegNumber1) {
		this.empRegNumber1 = empRegNumber1;
	}
	public String getEmpRegNumber2() {
		return empRegNumber2;
	}
	public void setEmpRegNumber2(String empRegNumber2) {
		this.empRegNumber2 = empRegNumber2;
	}
	public String getEmpExtention1() {
		return empExtention1;
	}
	public void setEmpExtention1(String empExtention1) {
		this.empExtention1 = empExtention1;
	}
	public String getEmpExtention2() {
		return empExtention2;
	}
	public void setEmpExtention2(String empExtention2) {
		this.empExtention2 = empExtention2;
	}
	public String getEmpExtention3() {
		return empExtention3;
	}
	public void setEmpExtention3(String empExtention3) {
		this.empExtention3 = empExtention3;
	}
	public String getEmpPhone1() {
		return empPhone1;
	}
	public void setEmpPhone1(String empPhone1) {
		this.empPhone1 = empPhone1;
	}
	public String getEmpPhone2() {
		return empPhone2;
	}
	public void setEmpPhone2(String empPhone2) {
		this.empPhone2 = empPhone2;
	}
	public String getEmpPhone3() {
		return empPhone3;
	}
	public void setEmpPhone3(String empPhone3) {
		this.empPhone3 = empPhone3;
	}
	public String getEmpEmail1() {
		return empEmail1;
	}
	public void setEmpEmail1(String empEmail1) {
		this.empEmail1 = empEmail1;
	}
	public String getEmpEmail2() {
		return empEmail2;
	}
	public void setEmpEmail2(String empEmail2) {
		this.empEmail2 = empEmail2;
	}
	public String getEmpBirth() {
		return empBirth;
	}
	public void setEmpBirth(String empBirth) {
		this.empBirth = empBirth;
	}
	public String getEmpFinalEdu() {
		return empFinalEdu;
	}
	public void setEmpFinalEdu(String empFinalEdu) {
		this.empFinalEdu = empFinalEdu;
	}
	public String getEmpHireDate() {
		return empHireDate;
	}
	public void setEmpHireDate(String empHireDate) {
		this.empHireDate = empHireDate;
	}
	public int getHireId() {
		return hireId;
	}
	public void setHireId(int hireId) {
		this.hireId = hireId;
	}
	public String getEmpDetail() {
		return empDetail;
	}
	public void setEmpDetail(String empDetail) {
		this.empDetail = empDetail;
	}
	public int getAppointId() {
		return appointId;
	}
	public void setAppointId(int appointId) {
		this.appointId = appointId;
	}
	public int getAnniId() {
		return anniId;
	}
	public void setAnniId(int anniId) {
		this.anniId = anniId;
	}
	public String getEmpDeptName() {
		return empDeptName;
	}
	public void setEmpDeptName(String empDeptName) {
		this.empDeptName = empDeptName;
	}
	public String getEmpDeptHighName() {
		return empDeptHighName;
	}
	public void setEmpDeptHighName(String empDeptHighName) {
		this.empDeptHighName = empDeptHighName;
	}
	public String getEmpJobName() {
		return empJobName;
	}
	public void setEmpJobName(String empJobName) {
		this.empJobName = empJobName;
	}
	public String getEmpHireName() {
		return EmpHireName;
	}
	public void setEmpHireName(String empHireName) {
		EmpHireName = empHireName;
	}
	public int getCareerDate() {
		return careerDate;
	}
	public void setCareerDate(int careerDate) {
		this.careerDate = careerDate;
	}
	
	
	
	

	
	
	
	
}
