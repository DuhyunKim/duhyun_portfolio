package com.tie.appoint.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.appoint.model.service.AppointServiceImpl;

public class AppointUpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String calender = request.getParameter("calender");
		String searchName = request.getParameter("searchName");
		String context  = request.getParameter("context");
		
		int seq = Integer.parseInt(request.getParameter("personnalSeq"));
		AppointServiceImpl.getAppointService().update(seq, calender, searchName, context);
		
		return "/appoint?act=mvlist";
	}

}
