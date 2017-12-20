package com.tie.career.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.career.model.CareerDto;
import com.tie.career.model.service.CareerServiceImpl;

public class CareerInsertAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CareerDto careerDto = new CareerDto();
	
		int empId = Integer.parseInt(request.getParameter("insertSeq"));
		String startDate = request.getParameter("startDate1");
		String endDate = request.getParameter("endDate1");
		String careerLocation = request.getParameter("careerLocation1");
		String careerPosition = request.getParameter("careerPosition1");
		String careerDuty = request.getParameter("careerDuty1");
		String careerContents = request.getParameter("careerContents1");

		careerDto.setEmpId(empId);
		careerDto.setCareerPeriod1(startDate);
		careerDto.setCareerPeriod2(endDate);
		careerDto.setCareerLocation(careerLocation);
		careerDto.setCareerPosition(careerPosition);
		careerDto.setCareerDuty(careerDuty);
		careerDto.setCareerContents(careerContents);
		
		CareerServiceImpl.getCareerService().insert(careerDto);

		return "/career?act=careerlist&empId="+empId;
	}

}
