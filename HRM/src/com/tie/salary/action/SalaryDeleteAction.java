package com.tie.salary.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.salary.model.service.SalaryServiceImpl;

public class SalaryDeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String empId = request.getParameter("empId");
		
		int result = SalaryServiceImpl.getSalaryService().salaryDelete(empId);
		
		return "/salary?act=salaryList";
	}

}
