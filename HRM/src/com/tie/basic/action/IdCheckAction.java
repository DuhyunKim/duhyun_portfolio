package com.tie.basic.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.basic.model.service.EmployeesServiceImpl;

public class IdCheckAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sid = request.getParameter("sid");
		
		int cnt = EmployeesServiceImpl.getEmployeeService().idCheck(sid);
		
		request.setAttribute("searchid", sid);
		request.setAttribute("idcount", cnt);
		return "/basic/idcheck.jsp";
	}
	

}
