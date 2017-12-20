package com.tie.salary.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tie.action.Action;
import com.tie.basic.model.EmployeesDto;
import com.tie.department.model.DepartmentDto;
import com.tie.jobs.model.JobsDto;
import com.tie.salary.model.SalaryDto;
import com.tie.salary.model.service.SalaryService;
import com.tie.salary.model.service.SalaryServiceImpl;

public class SalaryListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map<String, List<Object>> mapList = null;
		Map<String, String> map = new HashMap();
		
		int currentPage = 1;
		String key = null;
		String word = null;
		
		int pageSize = 10;  // �� �������� ������ �Խñ� ��
		int pageGroupSize = 10; // ����¡ �׺�[���] ������
		
		int totalCount = SalaryServiceImpl.getSalaryService().totalCountList();
		System.out.println("totalCount: " + totalCount);
		
		int finalPage = (totalCount + (pageSize - 1)) / pageSize;
		
		int pageGroupCount = 0;
		int numPageGroup = 0;
		if(request.getParameter("currentPage") == null){
			map.put("currentPage", String.valueOf(currentPage));
			key = request.getParameter("key");
			map.put("currentPage", String.valueOf(currentPage));
			map.put("key", request.getParameter("key"));
			
			if(request.getParameter("word") != null){
				word = request.getParameter("word");
				map.put("word", word);
			}
			
			mapList = SalaryServiceImpl.getSalaryService().salaryList(map);
			
			pageGroupCount = (totalCount/(pageSize*pageGroupSize)) + (totalCount%(pageSize*pageGroupSize) == 0 ? 0:1); 
			numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			key = request.getParameter("key");
			map.put("currentPage", String.valueOf(currentPage));
			map.put("key", request.getParameter("key"));
			
			if(request.getParameter("word") != null){
				word = request.getParameter("word");
				map.put("word", word);
			}
			mapList = SalaryServiceImpl.getSalaryService().salaryList(map);
			
			pageGroupCount = (totalCount/(pageSize*pageGroupSize)) + (totalCount%(pageSize*pageGroupSize) == 0 ? 0:1);
			numPageGroup = (int) Math.ceil((double)currentPage/pageGroupSize);
	
		}
		
		
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageGroupSize", pageGroupSize);
		request.setAttribute("numPageGroup", numPageGroup);
		request.setAttribute("pageGroupCount", pageGroupCount);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("finalPage", finalPage);
		
		request.setAttribute("salaryList", mapList);
		
		return "/salary/salarylist.jsp";
	}

}
