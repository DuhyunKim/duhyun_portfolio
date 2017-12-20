package com.tie.basic.model.dao;

import java.util.List;
import java.util.Map;

import com.tie.basic.model.EmpFileDto;
import com.tie.basic.model.EmployeesDto;
import com.tie.basic.model.EmployeesDto1;

public interface EmployeesDao {
	Map<String, Object> modifyInfo(int empId);
	List<EmployeesDto1> employeesList(Map<String, String>map);
	int modfiy(EmployeesDto employeesDto, EmpFileDto empFileDto);
	int insert(EmployeesDto employeesDto, EmpFileDto empFileDto);
	int idCheck(String id);
	EmpFileDto delete(String id);
	EmpFileDto empFileDto(int empId);
	int totalCountList();
	List<Map<String, String>> insertInfo(String param);
	EmployeesDto login(Map<String, String> map);
	String searchDept(int deptId);
	String searchJob(int jobId);
}
