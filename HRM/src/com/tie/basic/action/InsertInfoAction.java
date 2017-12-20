package com.tie.basic.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.basic.model.service.EmployeesServiceImpl;

public class InsertInfoAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Map<String, String>> list = EmployeesServiceImpl.getEmployeeService().insertInfo("dept");
		List<Map<String, String>> list2 = EmployeesServiceImpl.getEmployeeService().insertInfo("jobs");
		
		request.setAttribute("deptInfo", list);
		request.setAttribute("jobsInfo", list2);
		return "/basic/insert.jsp";
	}

	
}
