package com.tie.work.action;

import java.io.IOException;
import java.util.HashMap;
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
import com.tie.work.model.WorkDto;
import com.tie.work.model.service.WorkServiceImpl;

public class WorkInsertAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		WorkDto workDto = new WorkDto();
		PeriodicDto periodicDto = new PeriodicDto();
		AblityDto ablityDto = new AblityDto();
		EducationDto educationDto = new EducationDto();
		OutComeDto outcomeDto = new OutComeDto();
		BreakDownDto breakdownDto = new BreakDownDto();

		Map<String, Object> map = new HashMap<String, Object>();
		
		workDto.setWorkYear(request.getParameter("workYear"));
		workDto.setWorkAssessor(request.getParameter("workAssessor"));
		workDto.setWorkStatus(request.getParameter("workStatus"));
		workDto.setWorkGoal(request.getParameter("workGoal"));
		workDto.setEmpId(Integer.parseInt((request.getParameter("empId"))));	
		
		map.put("workDto", workDto);
		
		if(request.getParameterValues("breakdownContents[]") != null || request.getParameterValues("breakdownCooperation[]") != null ||
				request.getParameterValues("breakdownImportant[]") != null || request.getParameterValues("breakdownResult[]") != null ||
				request.getParameterValues("breakdownWeight[]") != null ){
			
			String[] breakdownContents = request.getParameterValues("breakdownContents[]");
			String[] breakdownCooperation = request.getParameterValues("breakdownCooperation[]");
			String[] breakdownImportant = request.getParameterValues("breakdownImportant[]");
			String[] breakdownResult = request.getParameterValues("breakdownResult[]");
			String[] breakdownWeight = request.getParameterValues("breakdownWeight[]");
			
			breakdownDto.setBreakdownContents(breakdownContents);
			breakdownDto.setBreakdownCooperation(breakdownCooperation);
			breakdownDto.setBreakdownImportant(breakdownImportant);
			breakdownDto.setBreakdownResult(breakdownResult);
			breakdownDto.setBreakdownWeight(breakdownWeight);
			
			map.put("breakdownDto", breakdownDto);
		}
		
		if(request.getParameterValues("periodicContents[]") != null || request.getParameterValues("periodicCoopration[]") != null ||
				request.getParameterValues("periodicPeriod[]") != null || request.getParameterValues("periodicResult[]") != null ){
			
			String[] periodicContents = request.getParameterValues("periodicContents[]");
			String[] periodicCoopration = request.getParameterValues("periodicCoopration[]");
			String[] periodicPeriod = request.getParameterValues("periodicPeriod[]");
			String[] periodicResult = request.getParameterValues("periodicResult[]");
			
			periodicDto.setPeriodicContents(periodicContents);
			periodicDto.setPeriodicCoopration(periodicCoopration);
			periodicDto.setPeriodicPeriod(periodicPeriod);
			periodicDto.setPeriodicResult(periodicResult);
			
			map.put("periodicDto", periodicDto);
		}

		if(request.getParameterValues("outcomeCooperation[]") != null || request.getParameterValues("outcomePeriod[]") != null ||
				request.getParameterValues("outcomeResult[]") != null || request.getParameterValues("outcomeWork[]") != null ){
			
			String[] outcomeCooperation = request.getParameterValues("outcomeCooperation[]");
			String[] outcomePeriod = request.getParameterValues("outcomePeriod[]");
			String[] outcomeResult = request.getParameterValues("outcomeResult[]");
			String[] outcomeWork = request.getParameterValues("outcomeWork[]");	
			
			outcomeDto.setOutcomeCooperation(outcomeCooperation);
			outcomeDto.setOutcomePeriod(outcomePeriod);
			outcomeDto.setOutcomeResult(outcomeResult);
			outcomeDto.setOutcomeWork(outcomeWork);
			
			map.put("outcomeDto", outcomeDto);
		}

		String ablityAcademic = request.getParameter("ablityAcademic");
		String ablityCareer = request.getParameter("ablityCareer");
		String academicSkill = request.getParameter("academicSkill");

		ablityDto.setAblityAcademic(ablityAcademic);
		ablityDto.setAblityCareer(ablityCareer);
		ablityDto.setAcademicSkill(academicSkill);

		map.put("ablityDto", ablityDto);
		
		if(request.getParameterValues("eduContents[]") != null || request.getParameterValues("eduInstitution[]") != null ||
				request.getParameterValues("eduUnusual[]") != null){
		
			String[] eduContents = request.getParameterValues("eduContents[]");
			String[] eduInstitution = request.getParameterValues("eduInstitution[]");
			String[] eduUnusual = request.getParameterValues("eduUnusual[]");

			educationDto.setEduContents(eduContents);
			educationDto.setEduInstitution(eduInstitution);
			educationDto.setEduUnusual(eduUnusual);
			
			map.put("educationDto", educationDto);
		}
		
		int result = WorkServiceImpl.getWorkService().workRegister(map);
		
		return "/work?act=workList&empId="+Integer.parseInt((request.getParameter("empId")));
	}


}
