package com.tie.schedule.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.factory.ScheduleActionFactory;
import com.tie.schedule.model.ScheduleDto;
import com.tie.schedule.model.service.ScheduleServiceImpl;

public class ScheduleInsertAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String scheduleCk = request.getParameter("type");
		String scheduleTitle = request.getParameter("title");
		String scheduleStart = request.getParameter("startDate") + " " +  request.getParameter("startTime");
		String scheduleEnd = request.getParameter("endDate") + " " +  request.getParameter("endTime");
		String scheduleContents = request.getParameter("contents");
		
		HttpSession session = request.getSession();
		EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");
		
		int empId = employeesDto.getEmpId();
		
		ScheduleDto scheduleDto = new ScheduleDto();
		scheduleDto.setScheduleCk(scheduleCk);
		scheduleDto.setScheduleTitle(scheduleTitle);
		scheduleDto.setScheduleStart(scheduleStart);
		scheduleDto.setScheduleEnd(scheduleEnd);
		scheduleDto.setScheduleContents(scheduleContents);
		scheduleDto.setEmpId(empId);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map = ScheduleServiceImpl.getScheduleServiceImpl().scheduleInsert(scheduleDto);
		
		JSONObject json = null;
		if(map.get("cnt") != 0){
			json = new JSONObject();
			json.put("seq", map.get("nextNum"));
			json.put("type", scheduleCk);
			json.put("title", scheduleTitle);
			json.put("startDate", scheduleStart);
			json.put("endDate", scheduleEnd);
			json.put("contents", scheduleContents);
			json.put("empId", empId);
			
		}else{
			System.out.println("Action 에러");
		}
		
		return json.toJSONString();
	}

}
