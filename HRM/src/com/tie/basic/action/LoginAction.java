package com.tie.basic.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.basic.model.service.EmployeesServiceImpl;


public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id").trim();
		String pass = request.getParameter("pass").trim();
		
		EmployeesDto employeesDto = EmployeesServiceImpl.getEmployeeService().login(id, pass);
		String path = "/login/login_fail.jsp";
		if(employeesDto != null){
			String deptName = EmployeesServiceImpl.getEmployeeService().searchDept(employeesDto.getDeptId());
			String jobName = EmployeesServiceImpl.getEmployeeService().searchJob(employeesDto.getJobId());
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("deptName", deptName);
			map.put("jobName", jobName);
			
			HttpSession session = request.getSession();
			session.setAttribute("infoMap", map);
			session.setAttribute("userInfo", employeesDto);
			session.setMaxInactiveInterval(60*60);
			
			//path = "/index.jsp";
			System.out.println(deptName);
			if ("인사팀".equals(deptName) || "전사".equals(deptName))
				path = "/main/admin_main.jsp";
			else
				path = "/main/main.jsp";
		}
		return path;
	}
}
