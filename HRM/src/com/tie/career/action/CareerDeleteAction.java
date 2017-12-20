package com.tie.career.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.career.model.service.CareerServiceImpl;

public class CareerDeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("careerSeq"));
		int empId = Integer.parseInt(request.getParameter("empId"));
		CareerServiceImpl.getCareerService().delete(seq);
		return "/career?act=careerlist&empId="+empId;
	}

}
