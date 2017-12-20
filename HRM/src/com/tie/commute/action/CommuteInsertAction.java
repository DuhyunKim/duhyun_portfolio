package com.tie.commute.action;

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
import com.tie.commute.model.service.CommuteServiceImpl;

public class CommuteInsertAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		EmployeesDto employeesDto = (EmployeesDto) session.getAttribute("userInfo");
		
		String empId = String.valueOf(employeesDto.getEmpId());
		String date = request.getParameter("date").trim();
		String status = request.getParameter("status");

		Map<String, String> map = new HashMap<String, String>();
		map.put("empId", empId);
		map.put("date", date);
		map.put("status", status);
		
		int cnt = CommuteServiceImpl.getCommuteService().commutsSelect(map);
		System.out.println("cnt: "+cnt);
		int result = 0;
		
		if("출근".equals(status) || "지각".equals(status)){
			if(cnt == 0){
				result = CommuteServiceImpl.getCommuteService().commuteInsert(map);
			}
		}else if("퇴근".equals(status)){
			result = CommuteServiceImpl.getCommuteService().commuteUpdate(map);
		}

		JSONObject json = null;
		if(result != 0){
			json = new JSONObject();
			json.put("date", date);
			json.put("status", status);
		}else{
			System.out.println("Action 에러");
		}
		
		return json.toJSONString();
	}
}
