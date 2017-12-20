package com.tie.basic.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.basic.model.service.EmployeesServiceImpl;

public class ModifyInfoAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int empId = Integer.parseInt(request.getParameter("empId"));
		
		Map<String, Object> map = EmployeesServiceImpl.getEmployeeService().modifyInfo(empId);
		List<Map<String, String>> list = EmployeesServiceImpl.getEmployeeService().insertInfo("dept");
		List<Map<String, String>> list2 = EmployeesServiceImpl.getEmployeeService().insertInfo("jobs");
		
		request.setAttribute("deptInfo", list);
		request.setAttribute("jobsInfo", list2);
		request.setAttribute("modfiyInfo", map.get("employeesDto"));
		request.setAttribute("modfiyFileInfo",map.get("empFileDto"));
		return "/basic/modify.jsp";
		
	}

}
