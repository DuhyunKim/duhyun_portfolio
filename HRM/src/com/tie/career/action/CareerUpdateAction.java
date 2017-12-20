package com.tie.career.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.career.model.CareerDto;
import com.tie.career.model.service.CareerServiceImpl;

public class CareerUpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CareerDto careerDto = new CareerDto();
		int empId = Integer.parseInt(request.getParameter("empId"));
		int careerId = Integer.parseInt(request.getParameter("updateSeq"));
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String careerLocation = request.getParameter("careerLocation");
		String careerPosition = request.getParameter("careerPosition");
		String careerDuty = request.getParameter("careerDuty");
		String careerContents = request.getParameter("careerContents");

		careerDto.setCareerPeriod1(startDate);
		careerDto.setCareerPeriod2(endDate);
		careerDto.setCareerId(careerId);
		careerDto.setCareerLocation(careerLocation);
		careerDto.setCareerPosition(careerPosition);
		careerDto.setCareerDuty(careerDuty);
		careerDto.setCareerContents(careerContents);
		
		CareerServiceImpl.getCareerService().update(careerDto);
		return "/career?act=careerlist&empId="+empId;
	}

}
