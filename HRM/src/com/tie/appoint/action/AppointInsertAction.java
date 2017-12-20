package com.tie.appoint.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.appoint.model.service.AppointServiceImpl;

public class AppointInsertAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String date = request.getParameter("calendar1");
		
		String empname = request.getParameter("empname1");
		String searchName = request.getParameter("searchName1");
		String context = request.getParameter("content1");

		System.out.println(date);
		System.out.println(empname);
		System.out.println(searchName);
		System.out.println(context);
		
		AppointServiceImpl.getAppointService().insert(date,empname,searchName,context);
		return "/appoint?act=mvlist";
	}

}
