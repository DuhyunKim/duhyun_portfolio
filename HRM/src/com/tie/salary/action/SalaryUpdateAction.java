package com.tie.salary.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.factory.SalaryActionFactory;
import com.tie.salary.model.service.SalaryServiceImpl;

public class SalaryUpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String empId = request.getParameter("empId");
		String money = request.getParameter("money");
		String incentive = request.getParameter("incentive");
		String bonus = request.getParameter("bonus");
		String basic = request.getParameter("basic");
		String add = request.getParameter("add");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("empId", empId);
		map.put("money", money);
		map.put("incentive", incentive);
		map.put("bonus", bonus);
		map.put("basic", basic);
		map.put("add", add);
		
		int result = SalaryServiceImpl.getSalaryService().salaryUpdate(map);
		
		return "/salary?act=salaryList";
	}

}
