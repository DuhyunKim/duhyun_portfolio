package com.tie.appoint.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.appoint.model.service.AppointServiceImpl;

public class AppointDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int seq = Integer.parseInt(request.getParameter("personnalSeq"));
		AppointServiceImpl.getAppointService().delete(seq);
		return "/appoint?act=mvlist";
	}

}
