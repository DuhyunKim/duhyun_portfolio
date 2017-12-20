package com.tie.schedule.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.schedule.model.ScheduleDto;
import com.tie.schedule.model.service.ScheduleServiceImpl;

public class ScheduleListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");
		
		int empId = employeesDto.getEmpId();
		
		List<ScheduleDto> scheduleDtoList = ScheduleServiceImpl.getScheduleServiceImpl().scheduleList(empId);
		
		request.setAttribute("scheduleDtoList", scheduleDtoList);
		
		return "/schedule/schedule.jsp";
	}

}
