package com.tie.salary.model.service;

import java.util.List;
import java.util.Map;

import com.tie.salary.model.SalaryDto;
import com.tie.salary.model.dao.SalaryDaoImpl;

public class SalaryServiceImpl implements SalaryService{
	
	private static SalaryService salaryService;
	
	static{
		salaryService = new SalaryServiceImpl();
	}
	
	private SalaryServiceImpl(){}	

	
	public static SalaryService getSalaryService() {
		return salaryService;
	}


	@Override
	public Map<String, List<Object>> salaryList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return SalaryDaoImpl.getSalaryDao().salaryList(map);
	}

	@Override
	public int totalCountList() {
		// TODO Auto-generated method stub
		return SalaryDaoImpl.getSalaryDao().totalCountList();
	}

	@Override
	public int salaryUpdate(Map<String, String> map) {
		// TODO Auto-generated method stub
		return SalaryDaoImpl.getSalaryDao().salaryUpdate(map);
	}

	@Override
	public int salaryDelete(String empId) {
		// TODO Auto-generated method stub
		return SalaryDaoImpl.getSalaryDao().salaryDelete(empId);
	}

}
