package com.tie.salary.model.dao;

import java.util.List;
import java.util.Map;

import com.tie.salary.model.SalaryDto;

public interface SalaryDao {
	Map<String, List<Object>> salaryList(Map<String, String> map);
	int totalCountList();	
	int salaryUpdate(Map<String, String> map);
	int salaryDelete(String empId);
}
