package com.tie.work.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.work.model.AblityDto;
import com.tie.work.model.BreakDownDto;
import com.tie.work.model.EducationDto;
import com.tie.work.model.OutComeDto;
import com.tie.work.model.PeriodicDto;
import com.tie.work.model.service.WorkServiceImpl;

public class WorkUpdateFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int workSeq = Integer.parseInt(request.getParameter("workSeq"));
		System.out.println(workSeq);
		
		Map<String, String> commonFormList = WorkServiceImpl.getWorkService().commonFormList(workSeq);
		List<BreakDownDto> breakDownDtoFormList = WorkServiceImpl.getWorkService().breakDownDtoFormList(workSeq);
		List<PeriodicDto> periodicDtoFormList = WorkServiceImpl.getWorkService().periodicDtoFormList(workSeq);
		List<OutComeDto> outComeDtoFormList = WorkServiceImpl.getWorkService().outComeDtoFormList(workSeq);
		List<AblityDto> ablityDtoFormList = WorkServiceImpl.getWorkService().ablityDtoFormList(workSeq);
		List<EducationDto> educationDtoFormList = WorkServiceImpl.getWorkService().educationDtoFormList(workSeq);
		
		request.setAttribute("commonFormList", commonFormList);
		request.setAttribute("breakDownDtoFormList", breakDownDtoFormList);
		request.setAttribute("periodicDtoFormList", periodicDtoFormList);
		request.setAttribute("outComeDtoFormList", outComeDtoFormList);
		request.setAttribute("ablityDtoFormList", ablityDtoFormList);
		request.setAttribute("educationDtoFormList", educationDtoFormList);
		
		return "/work/workupdateform.jsp";
	}

}
