package com.tie.work.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.util.Convert;
import com.tie.work.model.AblityDto;
import com.tie.work.model.BreakDownDto;
import com.tie.work.model.EducationDto;
import com.tie.work.model.OutComeDto;
import com.tie.work.model.PeriodicDto;
import com.tie.work.model.WorkDto;
import com.tie.work.model.service.WorkServiceImpl;

public class WorkUpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int workSeq = Integer.parseInt(request.getParameter("workSeq"));

		WorkDto workDto = new WorkDto();

		workDto.setWorkYear(request.getParameter("workYear"));
		workDto.setWorkAssessor(request.getParameter("workAssessor"));
		workDto.setWorkStatus(request.getParameter("workStatus"));
		workDto.setWorkGoal(request.getParameter("workGoal"));
		workDto.setEmpId(Integer.parseInt((request.getParameter("empId"))));
		
		List<WorkDto> worklist = new ArrayList<WorkDto>();
		worklist.add(workDto);
		
		WorkServiceImpl.getWorkService().workUpdate(worklist, workSeq);
			
		int ablitySize = WorkServiceImpl.getWorkService().ablitySize(workSeq);
		
		if(request.getParameterValues("ablityCareer") != null){
			AblityDto ablityDto = new AblityDto();
			ablityDto.setAblityCareer(request.getParameter("ablityCareer"));
			ablityDto.setAblityAcademic(request.getParameter("ablityAcademic"));
			ablityDto.setAcademicSkill(request.getParameter("academicSkill"));
			
			List<AblityDto> list = new ArrayList<AblityDto>();
			list.add(ablityDto);
			if(ablitySize == 0){
				WorkServiceImpl.getWorkService().ablityInsert(list, workSeq);
			}else{
				WorkServiceImpl.getWorkService().ablityUpdate(list, workSeq);
			}
		}

		System.out.println("_______________________breakdown_______________________________");
		
		int breakdownSize = WorkServiceImpl.getWorkService().breakdownSize(workSeq);
		System.out.println("breakdownSize: " + breakdownSize);
		
		if(request.getParameterValues("breakdownContents[]") != null){

			String[] breakdownContents = request.getParameterValues("breakdownContents[]");
			String[] breakdownCooperation = request.getParameterValues("breakdownCooperation[]");
			String[] breakdownImportant = request.getParameterValues("breakdownImportant[]");
			String[] breakdownResult = request.getParameterValues("breakdownResult[]");
			String[] breakdownWeight = request.getParameterValues("breakdownWeight[]");
			
			BreakDownDto breakdownDto = null;
			
			List<BreakDownDto> list = null;
			
			if(breakdownSize < request.getParameterValues("breakdownContents[]").length && breakdownSize > 0){
				
				list = new ArrayList<BreakDownDto>();
				
				for(int i=0; i < breakdownSize; i++){
					breakdownDto = new BreakDownDto();
					breakdownDto.setBreakdownContents2(breakdownContents[i]);
					breakdownDto.setBreakdownCooperation2(breakdownCooperation[i]);
					breakdownDto.setBreakdownImportant2(breakdownImportant[i]);
					breakdownDto.setBreakdownResult2(breakdownResult[i]);
					breakdownDto.setBreakdownWeight2(breakdownWeight[i]);
					breakdownDto.setBreakdownSeq2(i);
					
					list.add(breakdownDto);
				}

				WorkServiceImpl.getWorkService().breakdownUpdate(list, workSeq);
				
				breakdownDto = null;
				list = null;
		
				list = new ArrayList<BreakDownDto>();
				
				for(int i = breakdownSize; i < request.getParameterValues("breakdownContents[]").length; i++){
					breakdownDto = new BreakDownDto();
					breakdownDto.setBreakdownContents2(breakdownContents[i]);
					breakdownDto.setBreakdownCooperation2(breakdownCooperation[i]);
					breakdownDto.setBreakdownImportant2(breakdownImportant[i]);
					breakdownDto.setBreakdownResult2(breakdownResult[i]);
					breakdownDto.setBreakdownWeight2(breakdownWeight[i]);
					breakdownDto.setBreakdownSeq2(i);
					
					list.add(breakdownDto);
				}
				
				WorkServiceImpl.getWorkService().breakdownInsert(list, workSeq);

			}else if(breakdownSize > request.getParameterValues("breakdownContents[]").length){
				list = new ArrayList<BreakDownDto>();
				
				for(int i=0; i < request.getParameterValues("breakdownContents[]").length; i++){
					breakdownDto = new BreakDownDto();
					
					breakdownDto.setBreakdownContents2(breakdownContents[i]);
					breakdownDto.setBreakdownCooperation2(breakdownCooperation[i]);
					breakdownDto.setBreakdownImportant2(breakdownImportant[i]);
					breakdownDto.setBreakdownResult2(breakdownResult[i]);
					breakdownDto.setBreakdownWeight2(breakdownWeight[i]);
					breakdownDto.setBreakdownSeq2(i);
					
					list.add(breakdownDto);
				}

				WorkServiceImpl.getWorkService().breakdownUpdate(list, workSeq);
				
				int start = request.getParameterValues("breakdownContents[]").length;
				int end = breakdownSize;
				WorkServiceImpl.getWorkService().breakdownDelete(workSeq, start, end);

			}else if(breakdownSize == request.getParameterValues("breakdownContents[]").length){

				list = new ArrayList<BreakDownDto>();
				
				for(int i=0; i < breakdownSize; i++){
					breakdownDto = new BreakDownDto();
					
					breakdownDto.setBreakdownContents2(breakdownContents[i]);
					breakdownDto.setBreakdownCooperation2(breakdownCooperation[i]);
					breakdownDto.setBreakdownImportant2(breakdownImportant[i]);
					breakdownDto.setBreakdownResult2(breakdownResult[i]);
					breakdownDto.setBreakdownWeight2(breakdownWeight[i]);
					breakdownDto.setBreakdownSeq2(i);
					
					list.add(breakdownDto);
				}

				WorkServiceImpl.getWorkService().breakdownUpdate(list, workSeq);
			}else if(breakdownSize == 0){
				
				list = new ArrayList<BreakDownDto>();
				
				for(int i = 0; i < request.getParameterValues("breakdownContents[]").length; i++){
					breakdownDto = new BreakDownDto();
					
					breakdownDto.setBreakdownContents2(breakdownContents[i]);
					breakdownDto.setBreakdownCooperation2(breakdownCooperation[i]);
					breakdownDto.setBreakdownImportant2(breakdownImportant[i]);
					breakdownDto.setBreakdownResult2(breakdownResult[i]);
					breakdownDto.setBreakdownWeight2(breakdownWeight[i]);
					breakdownDto.setBreakdownSeq2(i);
					
					list.add(breakdownDto);
				}				
				
				WorkServiceImpl.getWorkService().breakdownInsert(list, workSeq);
			}
		}else{
			int start = 0;
			int end = breakdownSize;
			WorkServiceImpl.getWorkService().breakdownDelete(workSeq, start, end);
		}
		
		System.out.println("________________________periodic______________________________");
		
		int periodicSize = WorkServiceImpl.getWorkService().periodicSize(workSeq);
		System.out.println("periodicSize: " + periodicSize);

		if(request.getParameterValues("periodicContents[]") != null){

			String[] periodicPeriod = request.getParameterValues("periodicPeriod[]");
			String[] periodicContents = request.getParameterValues("periodicContents[]");
			String[] periodicResult = request.getParameterValues("periodicResult[]");
			String[] periodicCoopration = request.getParameterValues("periodicCoopration[]");
			
			PeriodicDto periodicDto = null;
			
			List<PeriodicDto> list = null;
			
			if(periodicSize < request.getParameterValues("periodicContents[]").length && periodicSize > 0){

				list = new ArrayList<PeriodicDto>();
				
				for(int i=0; i < periodicSize; i++){
					periodicDto = new PeriodicDto();
					periodicDto.setPeriodicPeriod2(periodicPeriod[i]);
					periodicDto.setPeriodicContents2(periodicContents[i]);
					periodicDto.setPeriodicResult2(periodicResult[i]);
					periodicDto.setPeriodicCoopration2(periodicCoopration[i]);
					periodicDto.setPeriodicSeq2(i);
					
					list.add(periodicDto);
				}

				WorkServiceImpl.getWorkService().periodicUpdate(list, workSeq);
				
				periodicDto = null;
				list = null;
				
				list = new ArrayList<PeriodicDto>();
				
				for(int i = periodicSize; i < request.getParameterValues("periodicContents[]").length; i++){
					periodicDto = new PeriodicDto();
					periodicDto.setPeriodicPeriod2(periodicPeriod[i]);
					periodicDto.setPeriodicContents2(periodicContents[i]);
					periodicDto.setPeriodicResult2(periodicResult[i]);
					periodicDto.setPeriodicCoopration2(periodicCoopration[i]);
					periodicDto.setPeriodicSeq2(i);
					
					list.add(periodicDto);
				}
				
				WorkServiceImpl.getWorkService().periodicInsert(list, workSeq);

			}else if(periodicSize > request.getParameterValues("periodicContents[]").length){
				list = new ArrayList<PeriodicDto>();
				
				for(int i=0; i < request.getParameterValues("periodicContents[]").length; i++){
					periodicDto = new PeriodicDto();
					periodicDto.setPeriodicPeriod2(periodicPeriod[i]);
					periodicDto.setPeriodicContents2(periodicContents[i]);
					periodicDto.setPeriodicResult2(periodicResult[i]);
					periodicDto.setPeriodicCoopration2(periodicCoopration[i]);
					periodicDto.setPeriodicSeq2(i);
					
					list.add(periodicDto);
				}

				WorkServiceImpl.getWorkService().periodicUpdate(list, workSeq);
				
				int start = request.getParameterValues("periodicContents[]").length;
				int end = periodicSize;
				WorkServiceImpl.getWorkService().periodicDelete(workSeq, start, end);

			}else if(periodicSize == request.getParameterValues("periodicContents[]").length){

				list = new ArrayList<PeriodicDto>();
				
				for(int i=0; i < periodicSize; i++){
					periodicDto = new PeriodicDto();
					periodicDto.setPeriodicPeriod2(periodicPeriod[i]);
					periodicDto.setPeriodicContents2(periodicContents[i]);
					periodicDto.setPeriodicResult2(periodicResult[i]);
					periodicDto.setPeriodicCoopration2(periodicCoopration[i]);
					periodicDto.setPeriodicSeq2(i);
					
					list.add(periodicDto);
				}

				WorkServiceImpl.getWorkService().periodicUpdate(list, workSeq);
			}else if(periodicSize == 0){
				
				list = new ArrayList<PeriodicDto>();
				
				for(int i=0; i < request.getParameterValues("periodicContents[]").length; i++){
					periodicDto = new PeriodicDto();
					periodicDto.setPeriodicPeriod2(periodicPeriod[i]);
					periodicDto.setPeriodicContents2(periodicContents[i]);
					periodicDto.setPeriodicResult2(periodicResult[i]);
					periodicDto.setPeriodicCoopration2(periodicCoopration[i]);
					periodicDto.setPeriodicSeq2(i);
					
					list.add(periodicDto);
				}
				
				WorkServiceImpl.getWorkService().periodicInsert(list, workSeq);
			}
		}else{
			int start = 0;
			int end = periodicSize;
			WorkServiceImpl.getWorkService().periodicDelete(workSeq, start, end);
		}
		
		System.out.println("_________________________outcome_____________________________");
  		
		int outcomeSize = WorkServiceImpl.getWorkService().outcomeSize(workSeq);

		System.out.println("outcomeSize: " + outcomeSize);
		if(request.getParameterValues("outcomeWork[]") != null){

			String[] outcomePeriod = request.getParameterValues("outcomePeriod[]");
			String[] outcomeWork = request.getParameterValues("outcomeWork[]");
			String[] outcomeResult = request.getParameterValues("outcomeResult[]");
			String[] outcomeCooperation = request.getParameterValues("outcomeCooperation[]");
			
			OutComeDto outcomeDto = null;
			
			List<OutComeDto> list = null;
			
			if(outcomeSize < request.getParameterValues("outcomeWork[]").length && outcomeSize > 0){

				list = new ArrayList<OutComeDto>();
				
				for(int i=0; i < outcomeSize; i++){
					outcomeDto = new OutComeDto();
					outcomeDto.setOutcomePeriod2(outcomePeriod[i]);
					outcomeDto.setOutcomeWork2(outcomeWork[i]);
					outcomeDto.setOutcomeResult2(outcomeResult[i]);
					outcomeDto.setOutcomeCooperation2(outcomeCooperation[i]);
					outcomeDto.setOutcomeSeq2(i);
					
					list.add(outcomeDto);
				}

				WorkServiceImpl.getWorkService().outcomeUpdate(list, workSeq);
				
				outcomeDto = null;
				list = null;
				
				list = new ArrayList<OutComeDto>();
				
				for(int i = outcomeSize; i < request.getParameterValues("outcomeWork[]").length; i++){
					outcomeDto = new OutComeDto();
					outcomeDto.setOutcomePeriod2(outcomePeriod[i]);
					outcomeDto.setOutcomeWork2(outcomeWork[i]);
					outcomeDto.setOutcomeResult2(outcomeResult[i]);
					outcomeDto.setOutcomeCooperation2(outcomeCooperation[i]);
					outcomeDto.setOutcomeSeq2(i);
					
					list.add(outcomeDto);
				}
				
				WorkServiceImpl.getWorkService().outcomeInsert(list, workSeq);

			}else if(outcomeSize > request.getParameterValues("outcomeWork[]").length){
				
				list = new ArrayList<OutComeDto>();
				
				for(int i=0; i < request.getParameterValues("outcomeWork[]").length; i++){
					outcomeDto = new OutComeDto();
					outcomeDto.setOutcomePeriod2(outcomePeriod[i]);
					outcomeDto.setOutcomeWork2(outcomeWork[i]);
					outcomeDto.setOutcomeResult2(outcomeResult[i]);
					outcomeDto.setOutcomeCooperation2(outcomeCooperation[i]);
					outcomeDto.setOutcomeSeq2(i);
					
					list.add(outcomeDto);
				}

				WorkServiceImpl.getWorkService().outcomeUpdate(list, workSeq);
				
				int start = request.getParameterValues("outcomeWork[]").length;
				int end = outcomeSize;
				WorkServiceImpl.getWorkService().outcomeDelete(workSeq, start, end);

			}else if(outcomeSize == request.getParameterValues("outcomeWork[]").length){

				list = new ArrayList<OutComeDto>();
				
				for(int i=0; i < outcomeSize; i++){
					outcomeDto = new OutComeDto();
					outcomeDto.setOutcomePeriod2(outcomePeriod[i]);
					outcomeDto.setOutcomeWork2(outcomeWork[i]);
					outcomeDto.setOutcomeResult2(outcomeResult[i]);
					outcomeDto.setOutcomeCooperation2(outcomeCooperation[i]);
					outcomeDto.setOutcomeSeq2(i);
					
					list.add(outcomeDto);
				}

				WorkServiceImpl.getWorkService().outcomeUpdate(list, workSeq);
			}else if(outcomeSize == 0){
				
				list = new ArrayList<OutComeDto>();
				
				for(int i=0; i < request.getParameterValues("outcomeWork[]").length; i++){
					outcomeDto = new OutComeDto();
					outcomeDto.setOutcomePeriod2(outcomePeriod[i]);
					outcomeDto.setOutcomeWork2(outcomeWork[i]);
					outcomeDto.setOutcomeResult2(outcomeResult[i]);
					outcomeDto.setOutcomeCooperation2(outcomeCooperation[i]);
					outcomeDto.setOutcomeSeq2(i);
					
					list.add(outcomeDto);
				}
				
				WorkServiceImpl.getWorkService().outcomeInsert(list, workSeq);
			}
		}else{
			int start = 0;
			int end = outcomeSize;
			WorkServiceImpl.getWorkService().outcomeDelete(workSeq, start, end);
		}
		
		System.out.println("_________________________education_____________________________");
  		
		int educationSize = WorkServiceImpl.getWorkService().educationSize(workSeq);
		System.out.println("educationSize: " + educationSize);
		System.out.println("workSeq: "+workSeq);

		if(request.getParameterValues("eduContents[]") != null){

			String[] eduContents = request.getParameterValues("eduContents[]");
			String[] eduInstitution = request.getParameterValues("eduInstitution[]");
			String[] eduUnusual = request.getParameterValues("eduUnusual[]");
			
			EducationDto educationDto = null;
			
			List<EducationDto> list = null;
			
			if(educationSize < request.getParameterValues("eduContents[]").length && educationSize > 0){

				list = new ArrayList<EducationDto>();
				for(int i=0; i < educationSize; i++){
					educationDto = new EducationDto();
					educationDto.setEduContents2(eduContents[i]);
					educationDto.setEduInstitution2(eduInstitution[i]);
					educationDto.setEduUnusual2(eduUnusual[i]);
					educationDto.setEduSeq2(i);
					
					list.add(educationDto);
				}

				WorkServiceImpl.getWorkService().educationUpdate(list, workSeq);
				
				educationDto = null;
				list = null;

				list = new ArrayList<EducationDto>();
				
				for(int i = educationSize; i < request.getParameterValues("eduContents[]").length; i++){
					educationDto = new EducationDto();
					educationDto.setEduContents2(eduContents[i]);
					educationDto.setEduInstitution2(eduInstitution[i]);
					educationDto.setEduUnusual2(eduUnusual[i]);
					educationDto.setEduSeq2(i);
					
					list.add(educationDto);
				}
				
				WorkServiceImpl.getWorkService().educationInsert(list, workSeq);

			}else if(educationSize > request.getParameterValues("eduContents[]").length){
				list = new ArrayList<EducationDto>();
				for(int i=0; i < request.getParameterValues("eduContents[]").length; i++){
					educationDto = new EducationDto();
					educationDto.setEduContents2(eduContents[i]);
					educationDto.setEduInstitution2(eduInstitution[i]);
					educationDto.setEduUnusual2(eduUnusual[i]);
					educationDto.setEduSeq2(i);
					
					list.add(educationDto);
				}

				WorkServiceImpl.getWorkService().educationUpdate(list, workSeq);
				
				int start = request.getParameterValues("eduContents[]").length;
				int end = educationSize;
				WorkServiceImpl.getWorkService().educationDelete(workSeq, start, end);

			}else if(educationSize == request.getParameterValues("eduContents[]").length){
				list = new ArrayList<EducationDto>();
				for(int i=0; i < educationSize; i++){
					educationDto = new EducationDto();
					educationDto.setEduContents2(eduContents[i]);
					educationDto.setEduInstitution2(eduInstitution[i]);
					educationDto.setEduUnusual2(eduUnusual[i]);
					educationDto.setEduSeq2(i);
					
					list.add(educationDto);
				}

				WorkServiceImpl.getWorkService().educationUpdate(list, workSeq);
			}else if(educationSize == 0){
				list = new ArrayList<EducationDto>();
				
				for(int i=0; i < request.getParameterValues("eduContents[]").length; i++){
					educationDto = new EducationDto();
					educationDto.setEduContents2(eduContents[i]);
					educationDto.setEduInstitution2(eduInstitution[i]);
					educationDto.setEduUnusual2(eduUnusual[i]);
					educationDto.setEduSeq2(i);
					
					list.add(educationDto);
				}
				
				WorkServiceImpl.getWorkService().educationInsert(list, workSeq);
			}
		}else{
			int start = 0;
			int end = educationSize;
			WorkServiceImpl.getWorkService().educationDelete(workSeq, start, end);
		}

		return "/work?act=workList&empId="+Integer.parseInt((request.getParameter("empId")));
	}

}
