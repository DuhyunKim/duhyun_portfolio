package com.tie.schedule.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.tie.action.Action;
import com.tie.schedule.model.service.ScheduleServiceImpl;

public class ScheduleDeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int seq =  Integer.parseInt(request.getParameter("seq"));
		int empId = Integer.parseInt(request.getParameter("empId"));
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("seq", seq);
		map.put("empId", empId);
		
		int result =  ScheduleServiceImpl.getScheduleServiceImpl().scheduleDelete(map); 
		
		JSONObject json = null;
		if(result != 0){
			json = new JSONObject();
			json.put("seq", seq);
			json.put("empId", empId);
			
		}else{
			System.out.println("Action 에러");
		}
		
		return json.toJSONString();
	}

}
