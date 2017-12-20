package com.tie.license.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.license.model.LicenseDto;
import com.tie.license.model.service.LicenseServiceImpl;

public class LicenseListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");
		
		String empId = String.valueOf(employeesDto.getEmpId());
		List<LicenseDto> list = LicenseServiceImpl.getLicenseService().licenseList(empId);
		if(!list.isEmpty()){
			request.setAttribute("licenseList", list);
		}
		request.setAttribute("empId", empId);
		return "/license/licenseList.jsp";
		
	}

}
