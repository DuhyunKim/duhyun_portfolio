package com.tie.career.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.career.model.CareerDto;
import com.tie.career.model.service.CareerServiceImpl;

public class CareerListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int currentPage = 1;
		HttpSession session = request.getSession();
		EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");
		
		int empId = employeesDto.getEmpId();
		
		List<CareerDto> list = CareerServiceImpl.getCareerService().careerList(currentPage, empId);
		request.setAttribute("careerList", list);
		request.setAttribute("total", list.size());
		request.setAttribute("empId", empId);
		return "/career/career.jsp";
	}

}
