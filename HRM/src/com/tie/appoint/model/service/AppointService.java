package com.tie.appoint.model.service;

import java.util.List;
import java.util.Map;

import com.tie.basic.model.EmployeesDto;

public interface AppointService {
	
	Map<String,List<Object>> appointList(String val, int currentPage, int empId);
	int delete(int seq);
	int update(int seq,String calender,String searchName,String context);
	int insert(String date,String empname,String searchName,String context);
	int totalCountList();
	
}
