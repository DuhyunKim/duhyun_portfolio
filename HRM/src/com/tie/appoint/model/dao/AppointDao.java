package com.tie.appoint.model.dao;

import java.util.List;
import java.util.Map;

import com.tie.basic.model.EmployeesDto;


public interface AppointDao {
	
	Map<String, List<Object>> appointList(Map<String, String> map);
	int appointDelete(int seq);
	int appointUpdate(Map<String, String> map);
	int getAppointId(String appointName);
	List<String> getEmpName();
	int insert(List<String> list);
	int getEmpId(String empName);
	int totalCountList();
}
