package com.tie.work.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.work.model.service.WorkServiceImpl;

public class WorkDeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int workSeq = Integer.parseInt(request.getParameter("workSeq"));
		int start = 0;
		int end = 0;
		WorkServiceImpl.getWorkService().breakdownDelete(workSeq, start, end);
		WorkServiceImpl.getWorkService().periodicDelete(workSeq, start, end);
		WorkServiceImpl.getWorkService().outcomeDelete(workSeq, start, end);
		WorkServiceImpl.getWorkService().ablityDelete(workSeq);
		WorkServiceImpl.getWorkService().educationDelete(workSeq, start, end);
		WorkServiceImpl.getWorkService().workDelete(workSeq);
		
		return "/work?act=workList&empId="+Integer.parseInt((request.getParameter("empId")));
	}

}
