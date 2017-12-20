package com.tie.commute.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.commute.model.AttendanceDto;
import com.tie.commute.model.service.CommuteServiceImpl;

public class CommuteListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");
		
		String empId = String.valueOf(employeesDto.getEmpId());
		List<AttendanceDto> attendanceDtolist = CommuteServiceImpl.getCommuteService().commuteList(empId);
		
		request.setAttribute("attendanceDtolist", attendanceDtolist);
		
		return "calendar/calen.jsp";
	}

}
